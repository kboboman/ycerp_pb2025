$PBExportHeader$w_oiissuereq_m.srw
$PBExportComments$출고의뢰서작성(2003/09/19, 이인호)
forward
global type w_oiissuereq_m from w_inheritance
end type
type dw_3 from datawindow within w_oiissuereq_m
end type
type em_1 from editmask within w_oiissuereq_m
end type
type st_1 from statictext within w_oiissuereq_m
end type
type st_2 from statictext within w_oiissuereq_m
end type
type st_3 from statictext within w_oiissuereq_m
end type
type st_4 from statictext within w_oiissuereq_m
end type
type em_2 from editmask within w_oiissuereq_m
end type
type gb_4 from groupbox within w_oiissuereq_m
end type
type cb_1 from commandbutton within w_oiissuereq_m
end type
type cb_2 from commandbutton within w_oiissuereq_m
end type
type cb_3 from commandbutton within w_oiissuereq_m
end type
type cb_4 from commandbutton within w_oiissuereq_m
end type
type st_5 from statictext within w_oiissuereq_m
end type
type cb_5 from commandbutton within w_oiissuereq_m
end type
type st_6 from statictext within w_oiissuereq_m
end type
type st_7 from statictext within w_oiissuereq_m
end type
type st_8 from statictext within w_oiissuereq_m
end type
type st_info from statictext within w_oiissuereq_m
end type
type st_time from statictext within w_oiissuereq_m
end type
end forward

global type w_oiissuereq_m from w_inheritance
integer width = 4128
integer height = 2864
string title = "출고의뢰서(w_oiissuereq_m)"
boolean resizable = false
dw_3 dw_3
em_1 em_1
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
em_2 em_2
gb_4 gb_4
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
st_5 st_5
cb_5 cb_5
st_6 st_6
st_7 st_7
st_8 st_8
st_info st_info
st_time st_time
end type
global w_oiissuereq_m w_oiissuereq_m

type variables
st_print i_print
string   is_message, is_closetime
end variables

forward prototypes
public function string wf_header ()
public function string wf_detail (string as_flag)
public function boolean wf_smssend ()
public subroutine wf_message ()
end prototypes

public function string wf_header ();//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
gs_where lstr_where

dw_1.accepttext()

lstr_where.str1 = em_1.text
lstr_where.str2 = dw_3.object.user[1]
lstr_where.str3 = em_2.text
lstr_where.chk  = "Y"
OpenWithParm(w_whissuereq_m, lstr_where)
lstr_where = Message.PowerObjectParm

if lstr_where.chk = "Y" then em_2.text = lstr_where.str3

return lstr_where.chk

end function

public function string wf_detail (string as_flag);//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
gs_where lstr_where

dw_1.accepttext()
lstr_where.str1 = em_1.text
lstr_where.str2 = dw_3.object.user[1]
lstr_where.str3 = em_2.text
lstr_where.str4 = as_flag
if dw_1.getrow() > 0 then
	lstr_where.str5 = string(dw_1.getrow())
else
	lstr_where.str5 = '0'
end if

lstr_where.chk = 'Y'
openwithparm(w_whissuereqdet_m, lstr_where)	// 출고의뢰내역
lstr_where = Message.PowerObjectParm
return lstr_where.chk

end function

public function boolean wf_smssend ();//
// 영업사원이 출고의뢰한 경우 출고팀에게 문자전송 하기
String ls_salesman, ls_sendhp, ls_custnm, ls_scenenm, ls_sysdate, ls_shipcase, ls_message, ls_confirm, ls_usernm, ls_exist
long   lr_total

if dw_1.rowcount() < 1 then return false

SELECT HP_NO = REPLACE(SUBSTRING(LTRIM(RTRIM(ISNULL(A.HP_NO,''))),1,13), '-', '') 
  INTO :ls_salesman
  FROM SALEHP A
 WHERE A.USER_ID   = :gs_userid;

if isnull(ls_salesman) or ls_salesman = "" then
else
	ls_confirm = dw_1.object.confirm_flag[1] 
	if ls_confirm = "Y" then		// 확정
	   ls_custnm   = dw_1.object.customer_cust_name[1]
		ls_scenenm  = dw_1.object.compute_3[1]
		ls_sysdate  = string(dw_1.object.sys_date[1], "yyyy/mm/dd hh:mm")
		ls_shipcase = dw_1.object.issuereqdet_ship_case[1]
		ls_usernm   = dw_1.object.salesman_user_name[1]
		
		ls_custnm   = GF_HANGLE_TR(ls_custnm,24)
		ls_message  = "[출고의뢰:" + ls_usernm + "] " + ls_sysdate + ", " + string(dw_1.rowcount(),"##0") + "건 " + trim(ls_custnm) + "외"
		ls_message  = GF_HANGLE_TR(ls_message,80)
						
		SELECT item_cd INTO :ls_sendhp FROM CODEMST WHERE TYPE = '출고의뢰서_문자수신';

		choose case LeftA(ls_sendhp,3)
			case "010","011","016","017","018","019"
			case else
				ls_sendhp = ""
		end choose
			
		String SMSSERVER
		SELECT ITEM_NM INTO :SMSSERVER FROM CODEMST WHERE ITEM_CD = 'SMSSERVER' AND USE_YN = 'Y';
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
					//MessageBox("확인(SC_LOG)", "동일한 문자 내용으로 발송한 내역이 존재하여 전송하지 않습니다.")
					end if
					
					// SC_TRAN
					SELECT tr_phone INTO :ls_exist FROM SC_TRAN
					 WHERE TR_MSG      = :ls_message
						AND TR_PHONE    = :ls_sendhp;
					if isnull(ls_exist) or ls_exist = "" then
						INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG )
							VALUES ( GetDate(), '0', '00', :ls_sendhp, '02-2648-1998', :ls_message );
					else
					//MessageBox("확인(SC_TRAN)", "동일한 문자 내용으로 발송한 내역이 존재하여 전송하지 않습니다.")
					end if
			end choose
		end if	// 영업사원
	end if	// 확정
end if	// 영업사원 HP에 등록된 경우

return true

end function

public subroutine wf_message ();
end subroutine

on w_oiissuereq_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.em_2=create em_2
this.gb_4=create gb_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.st_5=create st_5
this.cb_5=create cb_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_info=create st_info
this.st_time=create st_time
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.gb_4
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.st_8
this.Control[iCurrent+18]=this.st_info
this.Control[iCurrent+19]=this.st_time
end on

on w_oiissuereq_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_2)
destroy(this.gb_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.st_5)
destroy(this.cb_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_info)
destroy(this.st_time)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.object.user[1] = gs_userid
dw_3.AcceptText()

// 출고의뢰서 마감시간
SELECT ltrim(rtrim(item_nm)) INTO :is_closetime FROM codemst WHERE item_cd = 'CLOSETIME';
if isnull(is_closetime) or is_closetime = "" then is_closetime = "10:00:00"
st_info.text = "당일 출고의뢰서 작성은 " + IS_CLOSETIME + " 까지만 가능 합니다."

if gs_userid = '1999010s' then
else
	dw_3.enabled = false		// 의뢰자
end if

dw_2.visible = false
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = '1'

date   ld_date
string ls_user
int    li_cnt

ld_date = date(em_1.text)
ls_user = gs_userid
SELECT max(req_seq) INTO :li_cnt FROM issuereq WHERE req_date = :ld_date AND salesman = :ls_user;

if isnull(li_cnt) then li_cnt = 0
st_3.text = string(li_cnt, '#0')		// 마지막 차수


//
string   ls_time

SELECT top 1 substring(convert(char(20), getdate(),120),12,8) INTO :ls_time FROM login;	
if ls_time > IS_CLOSETIME then
	st_info.text    = "지금 시간부터는 당일 출고의뢰서 작성은 안됩니다."
	st_time.visible = false
	Timer(0)
else	
	Timer(1)
end if

end event

event resize;call super::resize;//
dw_1.width  = this.width  - 64
dw_1.height = this.height - 368

end event

event activate;call super::activate;//
string   ls_getdate, ls_time
datetime ld_tomorrow

if isnull(is_message) or is_message = "" then
	is_message = "Y"
	SELECT top 1 
			 ls_getdate = convert(char(20), getdate(),120)
		  , ls_time    = substring(convert(char(20), getdate(),120),12,8)
		  , ld_tomorrow= dateadd(day, 1, getdate() )
	  INTO :ls_getdate, :ls_time, :ld_tomorrow
	  FROM login;
	
	st_time.text = ls_time
	if ls_time > IS_CLOSETIME then
		em_1.text = string(ld_tomorrow,"yyyy/mm/dd")
		em_2.text = '1'		
		MessageBox("확인","당일 출고의뢰서 작성은 " + IS_CLOSETIME + " 이전에 완료하여야 합니다.~n~n" + &
					  "지금은 " + em_1.text + " 일자 출고의뢰서를 작성 합니다.")
	end if
end if


end event

event timer;call super::timer;//
string ls_time

SELECT top 1 substring(convert(char(20), getdate(),120),12,8) INTO :ls_time FROM login;

st_time.text = ls_time
if ls_time > IS_CLOSETIME then
	st_info.textcolor = rgb(255, 0, 0)
	st_info.text      = "지금 시간부터는 당일 출고의뢰서 작성은 안됩니다."
	st_time.visible   = false
	Timer(0)
end if

end event

type pb_save from w_inheritance`pb_save within w_oiissuereq_m
integer x = 3675
integer taborder = 30
end type

event pb_save::clicked;//
long   ll_cnt 
string ls_exist, ls_flag, ls_user
int    li_seq
date   ld_date

dw_1.accepttext()
dw_1.setredraw(true)

ls_exist = "N"
if dw_1.rowcount() < 1 then return

//
string   ls_getdate, ls_time
datetime ld_tomorrow

SELECT top 1 
		 ls_getdate = convert(char(10), getdate(),120)
	  , ls_time    = substring(convert(char(20), getdate(),120),12,8)
	  , ld_tomorrow= dateadd(day, 1, getdate() )
  INTO :ls_getdate, :ls_time, :ld_tomorrow
  FROM login;
  
if ls_getdate = em_1.text then
	if ls_time > IS_CLOSETIME then
		MessageBox("확인","당일 출고의뢰서 작성은 " + IS_CLOSETIME + " 이전에 완료하여야 합니다.",StopSign!)
		return
	end if
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

for ll_cnt = 1 to dw_1.rowcount()
	ls_flag = dw_1.object.issuereqdet_req_flag[ll_cnt]
	if ls_flag = "A" or ls_flag = "P" then
		ls_exist = "Y"
		exit
	end if
next

if dw_1.rowcount() < 4 and ls_exist = "N" then
	ld_date = date(em_1.text)
	li_seq  = dw_1.object.req_seq[1]
	ls_user = dw_3.object.user[1]
	DELETE FROM issuereq WHERE req_date = :ld_date AND salesman = :ls_user AND req_seq  = :li_seq;
end if
			
// 저장
if wf_update1(dw_1,"Y") = true then
	wf_smssend()
	pb_retrieve.postevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oiissuereq_m
integer x = 23
integer y = 332
integer width = 4064
integer height = 2412
integer taborder = 50
string dataobject = "d_oiissuereq_s"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return
this.scrolltorow(row)

end event

event dw_1::doubleclicked;call super::doubleclicked;//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

debugbreak()
choose case row
	case 0		// header 선택
		if wf_header() <> "Y" then 
		else
			pb_retrieve.postevent(clicked!)
		end if
		
	case else	// detail 선택
		string ls_flag
		
		ls_flag = this.object.issuereqdet_req_flag[row]
		choose case ls_flag
			case 'A'
				if wf_detail('A') <> "Y" then return
			case 'B', 'P'
				if wf_detail('P') <> "Y" then return
			case 'Z'
				if wf_header()    <> "Y" then return
			case else
				if wf_detail('A') <> "Y" then return
		end choose

		//출고의뢰 상세 조회.
		pb_retrieve.postevent(clicked!)
end choose

end event

event dw_1::retrieveend;call super::retrieveend;//
string ls_confirm

if rowcount < 1 then 
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
else
	ls_confirm = this.object.confirm_flag[1]
	if ls_confirm = "Y" then		// 확정
		pb_insert.enabled = false
		pb_delete.enabled = false
		pb_save.enabled   = false
	else									// 미확정
		pb_insert.enabled = true
		pb_delete.enabled = true
		pb_save.enabled   = true
	end if
end if

end event

type dw_2 from w_inheritance`dw_2 within w_oiissuereq_m
integer x = 1115
integer y = 88
integer width = 96
integer height = 80
integer taborder = 60
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oiissuereq_m
integer x = 41
integer y = 44
integer width = 1047
string text = "출고의뢰서 작성"
end type

type st_tips from w_inheritance`st_tips within w_oiissuereq_m
end type

type pb_compute from w_inheritance`pb_compute within w_oiissuereq_m
boolean visible = false
integer x = 2290
integer y = 0
integer width = 165
integer height = 132
integer taborder = 140
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
string picturename = ""
alignment htextalign = center!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oiissuereq_m
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiissuereq_m
integer x = 3872
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oiissuereq_m
integer x = 3479
integer taborder = 160
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print l_print


if dw_1.rowcount() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 출고의뢰현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=86'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oiissuereq_m
boolean visible = false
integer x = 2821
integer y = 48
integer taborder = 170
boolean bringtotop = true
end type

type pb_delete from w_inheritance`pb_delete within w_oiissuereq_m
integer x = 3282
integer taborder = 180
end type

event pb_delete::clicked;call super::clicked;//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
string ls_flag
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_flag = dw_1.object.issuereqdet_req_flag[ll_row]
choose case ls_flag
	case 'A','P'
		dw_1.deleterow(ll_row)
	case else
end choose

end event

type pb_insert from w_inheritance`pb_insert within w_oiissuereq_m
integer x = 3086
integer taborder = 200
end type

event pb_insert::clicked;call super::clicked;//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

pb_retrieve.postevent(clicked!)
em_2.text = string(integer(st_3.text) +1 )
if wf_header() <> "Y" then return
pb_retrieve.postevent(clicked!)

if wf_detail('A') <> "Y" then return
pb_retrieve.postevent(clicked!)

if wf_detail('P') <> "Y" then return
pb_retrieve.postevent(clicked!)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oiissuereq_m
integer x = 2889
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date   ld_date
string ls_user, ls_time
int    li_cnt

DateTime ld_time

SELECT top 1 getdate() INTO :ld_time FROM login;
//st_time.text = string(ld_time,"yyyy/mm/dd hh:mm:ss")

ls_time = string(ld_time, "yyyy/mm/dd hh:mm:ss")
ld_date = date(em_1.text)
ls_user = dw_3.object.user[1]

dw_1.reset()
dw_1.retrieve(ld_date, ls_user, integer(em_2.text), ls_time)
dw_1.setfocus()
dw_1.groupcalc()

SELECT max(req_seq) INTO :li_cnt FROM issuereq
 WHERE req_date = :ld_date  AND salesman = :ls_user;

if isnull(li_cnt) then li_cnt = 0
st_3.text = string(li_cnt, '#0')

end event

type gb_3 from w_inheritance`gb_3 within w_oiissuereq_m
boolean visible = false
integer x = 1015
integer y = 0
integer width = 1298
integer height = 228
integer taborder = 110
long backcolor = 12632256
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oiissuereq_m
boolean visible = false
integer x = 23
integer y = 216
integer width = 3593
integer height = 1836
integer taborder = 130
integer textsize = -9
integer weight = 400
long textcolor = 8388608
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oiissuereq_m
integer x = 2857
integer y = 4
integer width = 1234
integer height = 224
integer taborder = 40
long backcolor = 79220952
end type

type dw_3 from datawindow within w_oiissuereq_m
integer x = 1499
integer y = 52
integer width = 594
integer height = 76
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_whlogin_c2"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
end event

event itemchanged;em_2.text = '1'
pb_retrieve.postevent(clicked!)
end event

type em_1 from editmask within w_oiissuereq_m
integer x = 2103
integer y = 52
integer width = 357
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;//
em_2.text = '1'
pb_retrieve.postevent(clicked!)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
pb_retrieve.postevent(clicked!)
end event

type st_1 from statictext within w_oiissuereq_m
integer x = 2711
integer y = 60
integer width = 96
integer height = 68
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "차"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_oiissuereq_m
integer x = 2112
integer y = 160
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "마지막 차수:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_oiissuereq_m
integer x = 2482
integer y = 160
integer width = 101
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_oiissuereq_m
integer x = 2587
integer y = 160
integer width = 101
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "차"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_oiissuereq_m
integer x = 2469
integer y = 44
integer width = 219
integer height = 100
integer taborder = 170
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "##"
double increment = 1
string minmax = "1~~99"
end type

event modified;//
if integer(em_2.text) = integer(st_3.text) + 1 then return

this.text = st_3.text
pb_retrieve.postevent(clicked!)

end event

type gb_4 from groupbox within w_oiissuereq_m
integer x = 1243
integer y = 4
integer width = 1595
integer height = 224
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
end type

type cb_1 from commandbutton within w_oiissuereq_m
integer x = 2587
integer y = 52
integer width = 91
integer height = 44
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;//
if isnull(em_2.text) then em_2.text = '1'
if integer(em_2.text) = integer(st_3.text) + 1 then return
if integer(em_2.text) < 1 then return

em_2.text = string(integer(em_2.text) + 1)
pb_retrieve.postevent(clicked!)

end event

type cb_2 from commandbutton within w_oiissuereq_m
integer x = 2587
integer y = 92
integer width = 91
integer height = 48
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;if isnull(em_2.text) then em_2.text = '1'
if integer(em_2.text) <= 1 then return
em_2.text = string(integer(em_2.text) - 1)
pb_retrieve.postevent(clicked!)
end event

type cb_3 from commandbutton within w_oiissuereq_m
integer x = 526
integer y = 360
integer width = 151
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;//
long ll_row, ll_curseq

dw_1.accepttext()

ll_row = dw_1.getrow()
if ll_row <= 1 then return

ll_curseq = dw_1.object.issuereqdet_seq[ll_row]
if ll_curseq = 1 or ll_curseq = 0 then return

dw_1.object.issuereqdet_seq[ll_row]     = dw_1.object.issuereqdet_seq[ll_row - 1]
dw_1.object.issuereqdet_seq[ll_row - 1] = ll_curseq
dw_1.sort()
dw_1.scrolltorow(ll_row - 1)

end event

type cb_4 from commandbutton within w_oiissuereq_m
integer x = 690
integer y = 360
integer width = 151
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
long ll_row, ll_curseq

dw_1.accepttext()

ll_row = dw_1.getrow()
if ll_row < 1 then return

ll_curseq = dw_1.object.issuereqdet_seq[ll_row]
if ll_curseq = 0 or ll_curseq = dw_1.rowcount() then return

if dw_1.object.issuereqdet_req_flag[ll_row + 1] = 'B' &
	or dw_1.object.issuereqdet_req_flag[ll_row + 1] = 'Z' then return

dw_1.object.issuereqdet_seq[ll_row]     = dw_1.object.issuereqdet_seq[ll_row + 1]
dw_1.object.issuereqdet_seq[ll_row + 1] = ll_curseq
dw_1.sort()
dw_1.scrolltorow(ll_row + 1)

end event

type st_5 from statictext within w_oiissuereq_m
integer x = 41
integer y = 360
integer width = 475
integer height = 92
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "순위조정:"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_oiissuereq_m
integer x = 1513
integer y = 136
integer width = 594
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "복사"
end type

event clicked;//
if dw_1.getrow() < 1 then return

Open( w_whissuereq2_m )


end event

type st_6 from statictext within w_oiissuereq_m
integer x = 878
integer y = 348
integer width = 3154
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 16777215
string text = "상세내역을 더블클릭하면 보조윈도우가 조회됩니다."
boolean focusrectangle = false
end type

type st_7 from statictext within w_oiissuereq_m
integer x = 878
integer y = 408
integer width = 3154
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 16777215
string text = "출고의뢰서 작성후 확정을 하시면 변경/삭제가 불가합니다. 확정취소 또한 출고접수지에서만 가능합니다."
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type st_8 from statictext within w_oiissuereq_m
integer x = 1298
integer y = 68
integer width = 201
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "의뢰자"
boolean focusrectangle = false
end type

type st_info from statictext within w_oiissuereq_m
integer x = 41
integer y = 264
integer width = 2194
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "당일 출고의뢰서 작성은 10:00 까지만 가능 합니다."
boolean focusrectangle = false
end type

type st_time from statictext within w_oiissuereq_m
integer x = 3570
integer y = 264
integer width = 517
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

