$PBExportHeader$w_whissuereq_m.srw
$PBExportComments$출고의뢰헤더추가관리(2003/08/20, 이인호)
forward
global type w_whissuereq_m from w_inheritance
end type
type st_1 from statictext within w_whissuereq_m
end type
type st_2 from statictext within w_whissuereq_m
end type
type st_3 from statictext within w_whissuereq_m
end type
type st_4 from statictext within w_whissuereq_m
end type
end forward

global type w_whissuereq_m from w_inheritance
integer x = 599
integer y = 864
integer width = 3063
integer height = 1304
string title = "출고의뢰 추가(w_whissuereq_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
end type
global w_whissuereq_m w_whissuereq_m

type variables
gs_where ist_where
string is_user
DateTime id_date

end variables

forward prototypes
public function boolean wf_smssend ()
end prototypes

public function boolean wf_smssend ();//
// 영업사원이 출고의뢰한 경우 출고팀에게 문자전송 하기
String ls_salesman, ls_sendhp, ls_reqtext, ls_rem, ls_sysdate, ls_message, ls_confirm, ls_usernm, ls_exist
long   lr_total

SELECT HP_NO = REPLACE(SUBSTRING(LTRIM(RTRIM(ISNULL(A.HP_NO,''))),1,13), '-', '') 
  INTO :ls_salesman
  FROM SALEHP A
 WHERE A.USER_ID   = :gs_userid;

if isnull(ls_salesman) or ls_salesman = "" then		// 출고여직원들
else																// 영업담당자들
	ls_confirm = dw_1.object.confirm_flag[1] 
	if ls_confirm = "Y" then		// 확정
		ls_sysdate  = string(dw_1.object.sys_date[1], "yyyy/mm/dd hh:mm")
		ls_usernm   = dw_1.object.salesman[1]
		ls_rem      = dw_1.object.rem[1]
		ls_reqtext  = dw_1.object.req_text[1]
		SELECT user_name INTO :ls_usernm FROM login WHERE user_id = :ls_usernm;
		
		ls_message  = "[출고의뢰:" + ls_usernm + "]" + ls_sysdate + "[참고:" + trim(ls_rem) + "][비고:" + trim(ls_reqtext) + "]"
		ls_message  = GF_HANGLE_TR(ls_message,80)
						
		SELECT item_cd INTO :ls_sendhp FROM CODEMST WHERE TYPE = '출고의뢰서_문자수신';

		choose case LeftA(ls_sendhp,3)
			case "010","011","016","017","018","019"
			case else
				ls_sendhp = ""
		end choose
			
		String SMSSERVER
		SELECT ITEM_NM INTO :SMSSERVER FROM CODEMST
		 WHERE ITEM_CD = 'SMSSERVER' AND USE_YN = 'Y';
		IF SMSSERVER = "" THEN SMSSERVER = "192.168.1.5"
		
		// 출고담당자
		if ls_sendhp = "" or isnull(ls_sendhp) then
		else
			choose case SMSSERVER
				case '192.168.1.5'
					// SC_LOG
					SELECT tr_phone INTO :ls_exist FROM SC_LOG
					 WHERE TR_MSG      = :ls_message
						AND TR_PHONE    = :ls_sendhp;
					if isnull(ls_exist) or ls_exist = "" then
						INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG )
							VALUES ( GetDate(), '0', '00', :ls_sendhp, '02-2648-1998', :ls_message );
					else
						MessageBox("확인(SC_LOG)", "동일한 문자 내용으로 발송한 내역이 존재하여 전송하지 않습니다.")
					end if
					
					// SC_TRAN
					SELECT tr_phone INTO :ls_exist FROM SC_TRAN
					 WHERE TR_MSG      = :ls_message
						AND TR_PHONE    = :ls_sendhp;
					if isnull(ls_exist) or ls_exist = "" then
						INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG )
							VALUES ( GetDate(), '0', '00', :ls_sendhp, '02-2648-1998', :ls_message );
					else
						MessageBox("확인(SC_TRAN)", "동일한 문자 내용으로 발송한 내역이 존재하여 전송하지 않습니다.")
					end if
				case else
			end choose
		end if	// 영업사원
	end if	// 확정
end if	// 영업사원 HP에 등록된 경우

return true

end function

on w_whissuereq_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
end on

on w_whissuereq_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;string ls_area

pb_insert.enabled = false
ist_where = message.powerobjectparm

if ist_where.chk = "N" then
	pb_insert.enabled = false
//	pb_save.enabled = false
//	dw_1.enabled    = false

	dw_1.object.req_date.tabsequence     = 0 
	dw_1.object.salesman.tabsequence     = 0 
	dw_1.object.req_seq.tabsequence      = 0 
	dw_1.object.accept_user.tabsequence  = 0 
	dw_1.object.rem.tabsequence          = 0 
	dw_1.object.req_text.tabsequence     = 0 
	dw_1.object.accept_area.tabsequence  = 0 
//	dw_1.object.confirm_flag.tabsequence = 0
end if

dw_1.settransobject(sqlca)
dw_1.setredraw(false)
if dw_1.retrieve(date(ist_where.str1), ist_where.str2, integer(ist_where.str3)) < 1 then
	dw_1.reset()
	if ist_where.chk = "Y" then
		dw_1.insertrow(1)
		dw_1.object.salesman[1] = gs_userid
		
		ls_area = gs_area
		if gs_area = 'H0001' or gs_area = 'Z0001' then ls_area = 'S0001'
			
		SELECT issue_accept_user INTO :is_user FROM area WHERE area_no = :ls_area;
		dw_1.object.accept_area[1] = ls_area
		dw_1.object.accept_user[1] = is_user 
	//	dw_1.object.req_date[1]    = date(ist_where.str1)
		dw_1.setitem(1,'req_date',date(ist_where.str1))
		dw_1.object.req_seq[1]     = integer(ist_where.str3)
		id_date = DateTime(Today(), Now())
		dw_1.object.sys_date[1]    = DateTime(Today(), Now())
	end if
end if

dw_1.accepttext()
dw_1.setredraw(true)
dw_1.setfocus()

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whissuereq_m
integer x = 2322
integer y = 956
integer width = 343
integer height = 240
integer taborder = 30
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;//
debugbreak()

dw_1.accepttext()
if dw_1.rowcount() < 1 then return


string   ls_getdate, ls_reqdate, ls_time, ls_confirm, ls_salesman, ls_closetime
long     ll_cnt, ll_seq
DateTime ld_time

// 출고의뢰서 마감시간
SELECT ltrim(rtrim(item_nm)) INTO :ls_closetime FROM codemst WHERE item_cd = 'CLOSETIME';
if isnull(ls_closetime) or ls_closetime = "" then ls_closetime = "10:00:00"

SELECT top 1 
       ls_getdate = convert(char(10), getdate(),120)
     , ls_time    = substring(convert(char(20), getdate(),120),12,5)
	  , getdate()
  INTO :ls_getdate, :ls_time, :ld_time
  FROM login;

ls_reqdate = string(dw_1.object.req_date[1],"yyyy-mm-dd")	// 출고일자
if ls_reqdate > ls_getdate then	// 당일출고는 시간 체크함
else
	if ls_time > ls_closetime then
		MessageBox("확인","당일 출고의뢰서 작성은 " + ls_closetime + " 이전에 완료하여야 합니다.")
		return
	end if
end if


ls_confirm = dw_1.object.confirm_flag[1]	// 
ls_salesman= dw_1.object.salesman[1]	   // 
ll_seq     = dw_1.object.req_seq[1]	      // 
if ls_confirm = "Y" then
   SELECT count(*) INTO :ll_cnt FROM issuereqdet 
    WHERE req_date = :ls_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
	if ll_cnt = 0 then
		dw_1.object.confirm_flag[1] = "N"
		MessageBox("확인","출고의뢰서 작성시 상세내역이 없으면 '미확정' 상태에서 진행하시기 바랍니다.")
		return
	end if
end if
		

//
dw_1.object.sys_date[1] = ld_time // DateTime(Today(), Now())
dw_1.accepttext()
if wf_update1(dw_1,"N") = false then
	return
else
	wf_smssend()
end if

ist_where.chk = 'Y'
closewithreturn(parent, ist_where)

end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whissuereq_m
integer x = 0
integer y = 0
integer width = 3031
integer height = 936
integer taborder = 10
string dataobject = "d_whissuereq_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::retrieveend;call super::retrieveend;//
if ist_where.chk = "Y" then
	pb_insert.enabled = true
end if
if this.rowcount() < 1 then return

is_user = dw_1.object.accept_user[1]
if this.object.confirm_flag[1] = 'Y' then
	pb_insert.enabled = false
	pb_save.enabled   = false
else
	pb_insert.enabled = true
	pb_save.enabled   = true
end if

end event

event dw_1::itemchanged;call super::itemchanged;string ls_area, ls_user

this.accepttext()
choose case dwo.name
	case "accept_user"
		ls_user = trim(data)
		SELECT area_no INTO :ls_area FROM area	 WHERE issue_accept_user = :ls_user;
		this.object.accept_area[1] = ls_area
end choose

DateTime ld_time
SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;
this.object.sys_date[1] = ld_time // DateTime(Today(), Now())


end event

event dw_1::losefocus;call super::losefocus;this.accepttext()
end event

type dw_2 from w_inheritance`dw_2 within w_whissuereq_m
boolean visible = false
integer x = 3552
integer y = 164
integer width = 238
integer height = 136
integer taborder = 0
end type

type st_title from w_inheritance`st_title within w_whissuereq_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whissuereq_m
end type

type pb_compute from w_inheritance`pb_compute within w_whissuereq_m
boolean visible = false
integer taborder = 0
end type

type pb_print_part from w_inheritance`pb_print_part within w_whissuereq_m
boolean visible = false
integer taborder = 0
end type

type pb_close from w_inheritance`pb_close within w_whissuereq_m
integer x = 2683
integer y = 956
integer width = 343
integer height = 240
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;//
ist_where.chk = "N"
closewithreturn(parent, ist_where)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whissuereq_m
boolean visible = false
integer taborder = 0
end type

type pb_cancel from w_inheritance`pb_cancel within w_whissuereq_m
boolean visible = false
integer taborder = 0
end type

type pb_delete from w_inheritance`pb_delete within w_whissuereq_m
boolean visible = false
integer taborder = 0
end type

type pb_insert from w_inheritance`pb_insert within w_whissuereq_m
integer x = 1938
integer y = 952
integer width = 366
integer height = 248
integer taborder = 20
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "차수증가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;call super::clicked;//
long ll_row
dwitemstatus l_status

dw_1.accepttext()
l_status = dw_1.getitemstatus(1, 0, Primary!)
if l_status = NEW! OR l_status = NewModified! then return

ll_row = dw_1.object.req_seq[1]
dw_1.setredraw(false)
dw_1.reset()
dw_1.insertrow(0)
dw_1.object.salesman[1]    = gs_userid
dw_1.object.accept_user[1] = is_user
dw_1.object.req_date[1]    = wf_today()
dw_1.object.req_seq[1]     = ll_row + 1

ist_where.str3 = string(dw_1.object.req_seq[1])
dw_1.accepttext()
dw_1.setredraw(true)
this.enabled = false

end event

event pb_insert::mousemove;//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_whissuereq_m
boolean visible = false
integer taborder = 0
end type

type gb_3 from w_inheritance`gb_3 within w_whissuereq_m
boolean visible = false
integer x = 1925
integer y = 724
integer width = 709
integer height = 128
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whissuereq_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 3131
integer height = 1044
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_whissuereq_m
boolean visible = false
integer x = 1408
integer y = 1328
integer taborder = 0
end type

type st_1 from statictext within w_whissuereq_m
integer x = 1266
integer y = 204
integer width = 1714
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "~"확정~"된 출고의뢰는 수신자만이 ~"미확정~"으로 변경이 가능합니다."
boolean focusrectangle = false
end type

type st_2 from statictext within w_whissuereq_m
integer x = 23
integer y = 956
integer width = 1865
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "수신자 변경은 ~"사업장관리~"의 ~"출고의뢰접수자~"를 변경"
boolean focusrectangle = false
end type

type st_3 from statictext within w_whissuereq_m
integer x = 23
integer y = 1024
integer width = 1865
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8421376
long backcolor = 67108864
string text = "영업사원 출고는 ~"출고의뢰서_문자수신~"자에게 전송됨"
boolean focusrectangle = false
end type

type st_4 from statictext within w_whissuereq_m
integer x = 23
integer y = 1084
integer width = 1865
integer height = 112
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "화곡, 대전사업장은 출고수신자 기본값을 시화담당자로 지정, 자체사업장 출고시는 수신자를 반드시 변경해야 함."
boolean focusrectangle = false
end type

