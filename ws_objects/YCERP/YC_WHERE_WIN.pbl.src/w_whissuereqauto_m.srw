$PBExportHeader$w_whissuereqauto_m.srw
$PBExportComments$출고의뢰헤더추가관리(2003/08/20, 이인호)
forward
global type w_whissuereqauto_m from w_inheritance
end type
type st_5 from statictext within w_whissuereqauto_m
end type
type st_6 from statictext within w_whissuereqauto_m
end type
type dw_3 from datawindow within w_whissuereqauto_m
end type
end forward

global type w_whissuereqauto_m from w_inheritance
integer x = 599
integer y = 864
integer width = 3264
integer height = 1592
string title = "출고의뢰 추가(w_whissuereq_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
event ue_location ( )
st_5 st_5
st_6 st_6
dw_3 dw_3
end type
global w_whissuereqauto_m w_whissuereqauto_m

type variables
gs_where ist_where
string   is_user
DateTime id_date
DataWindowChild idwc_accept


end variables

forward prototypes
public function boolean wf_smssend ()
end prototypes

public function boolean wf_smssend ();//
// 영업사원이 출고의뢰한 경우 출고팀에게 문자전송 하기
String ls_salesman, ls_phone,   ls_phonename, ls_reqtext, ls_rem
string ls_sysdate,  ls_message, ls_confirm,   ls_usernm, ls_exist
string ls_area, ls_acceptuser,  ls_locno
long   lr_total

ls_area            = dw_1.object.accept_area[1]		// 사업장
ls_acceptuser = dw_1.object.accept_user[1]		// 수신자

SELECT loc_no INTO :ls_locno FROM location WHERE loc_manager = :ls_acceptuser AND use_yn = 'Y';

// 영업사원과 여직원 구분 
SELECT HP_NO  = REPLACE(SUBSTRING(LTRIM(RTRIM(ISNULL(A.HP_NO,''))),1,13), '-', '') 
  INTO :ls_salesman
  FROM SALEHP A
 WHERE A.USER_ID = :gs_userid  AND A.SALESMAN = 'Y';

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
						
		SELECT item_cd, item_nm INTO :ls_phone, :ls_phonename
		  FROM codemst
		 WHERE type = '출고의뢰서_문자수신' AND use_yn = 'Y' AND BIGO = :ls_locno;

		choose case LeftA(ls_phone,3)
			case "010","011","016","017","018","019"
			case else
				ls_phone = ""
		end choose
			

		// 출고담당자
		if ls_phone = "" or isnull(ls_phone) then
		else
		// GF_MMSSEND( as_userid, as_sendhp, as_recvhp, as_recvname, as_message )
			GF_MMSSEND( gs_userid, '0226481998', ls_phone, ls_phonename, ls_message )
		end if	// 영업사원
	end if	// 확정
end if	// 영업사원 HP에 등록된 경우

return true

end function

on w_whissuereqauto_m.create
int iCurrent
call super::create
this.st_5=create st_5
this.st_6=create st_6
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.st_6
this.Control[iCurrent+3]=this.dw_3
end on

on w_whissuereqauto_m.destroy
call super::destroy
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_3)
end on

event open;//
DataWindowChild ldwc_user
string  ls_area, ls_locno, ls_salesman, ls_acceptuser, ls_manager, ls_aarea, ls_alocno, ls_tabseq
string  ls_chktype, ls_user, ls_userval, ls_column, ls_ship_case
integer li_reqseq
long    ll_row, ll_dw3row
date    ld_reqdate

setnull(ls_acceptuser)

pb_insert.enabled = false
ist_where = Message.PowerObjectParm

ld_reqdate  = date(LeftA(ist_where.str1,10))	// 의뢰일자
ls_salesman = ist_where.str2				// 의뢰자
li_reqseq   = integer(ist_where.str3)			// 차수
ls_ship_case   = ist_where.str5			// 운송방법
ls_acceptuser = ist_where.name

dw_3.settransobject(sqlca)
dw_3.visible = false

dw_1.settransobject(sqlca)
dw_1.getchild( "accept_user", ldwc_user )
ldwc_user.setsort( "area_area_name D, loc_name A" )
ldwc_user.sort()

// 의뢰일자
//dw_1.object.req_date.tabsequence     = 0 
//dw_1.object.accept_user.tabsequence  = 0 

//dw_1.object.req_date.background.color    = rgb(192,192,192)
dw_1.object.accept_user.background.color = rgb(192,192,192)

if ist_where.chk = "N" then
	pb_insert.enabled = false		// 차수증가

	dw_1.object.salesman.tabsequence     = 0 
	dw_1.object.req_seq.tabsequence      = 0 
	dw_1.object.rem.tabsequence          = 0 
	dw_1.object.req_text.tabsequence     = 0 
	dw_1.object.accept_area.tabsequence  = 0 
//	dw_1.object.confirm_flag.tabsequence = 0
end if

if isnull(ls_acceptuser) OR ls_acceptuser = "" then
else
//		SELECT area_no, loc_no INTO :ls_aarea, :ls_alocno 
//		  FROM location 
//		 WHERE loc_manager = :ls_acceptuser;		
	/*외주 담당자들을 위해 로직 변경 17.11.13 조원석 */
	/*임시조치로 쿼리를 통해 반영 했으나 변경 필요   */		
	 select A.area_no, A.loc_no
	 INTO :ls_aarea, :ls_alocno 
	 from 
	(
		SELECT loc_manager, area_no, loc_no
		  FROM location 
			UNION ALL     
		SELECT ITEM_CD loc_manager,
				  'S0001' area_no, 
				  'WS00000000' loc_no        
		  FROM  CODEMST
		WHERE TYPE LIKE '출고의뢰서_보조자(시화)'
			 AND  USE_YN = 'Y'    
	) A WHERE A.loc_manager = :ls_acceptuser;

end if


choose case ls_alocno
	case "WS00000000"
		ls_chktype = "출고의뢰서_보조자(시화)"
	case "WS00000006"
		ls_chktype = "출고의뢰서_보조자(YSP)"
	case "WS00000007"
		ls_chktype = "출고의뢰서_보조자(화곡)"
	case "WS00000008"
		ls_chktype = "출고의뢰서_보조자(화성)"
	case "WS00000011"
		ls_chktype = "출고의뢰서_보조자(대전)"
	case "WS00000012"
		ls_chktype = "출고의뢰서_보조자(동부)"
end choose

dw_3.retrieve( ls_chktype )
for ll_dw3row = 1 to 5
	ls_tabseq = dw_1.Describe( "chk"+string(ll_dw3row)+".TabSequence" )		
	ls_column = "chk"+string(ll_dw3row)

	if ll_dw3row > dw_3.rowcount() then		
		ls_user    = ""
		ls_userval = "accept" + string(ll_dw3row)	
		dw_1.setitem( 1, ls_userval, ls_user )

		dw_1.setitem( 1, ls_column, "N" )
		dw_1.Modify( ls_column + ".TabSequence = 0" )				
	else
		ls_user    = ""
		ls_userval = "accept" + string(ll_dw3row)	
		dw_1.setitem( 1, ls_userval, ls_user )
		dw_1.Modify( ls_column + ".TabSequence = " + ls_tabseq )				
	end if
next

ll_row = dw_1.retrieve( ld_reqdate, ls_salesman, li_reqseq )

dw_1.reset()

if ist_where.chk = "Y" then		// 차수증가
	dw_1.insertrow(1)
	
	dw_1.object.salesman[1] = gs_userid
	dw_1.object.chk0[1]     = "Y"
	
	for ll_dw3row = 1 to dw_3.rowcount()
		if ll_dw3row > 5 then
			MessageBox("확인","저장소의 출고보조자는 5명 까지만 지원합니다.")
		else
			
			ls_user    = dw_3.object.item_cd[ll_dw3row]
			ls_userval = "accept" + string(ll_dw3row)
			
		
			if ls_acceptuser <> ls_user then          // 2017.11.14 조원석 반영
				dw_1.setitem( 1, ls_userval, ls_user )
			end if

		end if			
		
	next
	////////////////////////////////////////////////////////////////////////////
	// 출고의뢰서는 기본저장소(시화) 사용함
	////////////////////////////////////////////////////////////////////////////
//	ls_area = gs_area
//	if gs_area = "H0001" OR gs_area = "Z0001" then ls_area = "S0001"	// 기본값 변경
		
//	SELECT issue_accept_user, def_loc INTO :is_user, :ls_locno FROM area WHERE area_no = :ls_area;

	select a.def_loc, a.area_no
	   into :ls_locno, :ls_area
	from area a with(nolock) inner join location b with(nolock) on a.def_loc = b.loc_no
	where b.loc_manager = :ls_acceptuser;
	
	dw_1.object.loc_no[1]      = ls_locno		// 저장소
	dw_1.object.accept_area[1] = ls_area		// 수신사업장
	dw_1.object.accept_user[1] = ls_acceptuser 		// 수신자
	dw_1.object.ship_case[1] = ls_ship_case
	dw_1.object.issue_schedule[1] = 'A'

	dw_1.setitem(1, 'req_date', date(ist_where.str1))	//	dw_1.object.req_date[1] = date(ist_where.str1)	// 오류
	dw_1.object.req_seq[1]     = integer(ist_where.str3)
	
	id_date = DateTime(Today(), Now())
	dw_1.object.sys_date[1]    = DateTime(Today(), Now())
end if


dw_1.accepttext()
dw_1.setfocus()

SELECT item_cd INTO :ls_manager
  FROM codemst 
 WHERE type =  '출고의뢰서_관리자' AND use_yn = 'Y' AND item_cd = :gs_userid;
if gs_userid = ls_manager then
	pb_save.enabled = true
end if

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whissuereqauto_m
integer x = 2400
integer y = 1236
integer width = 398
integer height = 116
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
string   ls_getdate, ls_reqdate, ls_time, ls_confirm, ls_salesman, ls_salesman_nm
string   ls_acceptuser, ls_closetime
string   ls_recvhp,  ls_recvname, ls_chk, ls_locno, ls_userval
string   ls_usernm, ls_userid,  ls_userhp
string   ls_sqlerrtext, ls_message, ls_rem, ls_null
long     ll_row, ll_dw3row, ll_cnt, ll_seq, ll_dw3cnt, ll_lmscnt
DateTime ld_time, ldt_reqdate

setnull( ls_null )

dw_1.accepttext()
if dw_1.rowcount() < 1 then RETURN

SELECT ltrim(rtrim(item_nm)) INTO :ls_closetime FROM codemst WHERE item_cd = 'CLOSETIME';
if isnull(ls_closetime) or ls_closetime = "" then ls_closetime = "10:00:00"

SELECT top 1 
		 ls_getdate = convert(char(10), getdate(),120)
	  , ls_time    = substring(convert(char(20), getdate(),120),12,5)
	  , getdate()
  INTO :ls_getdate, :ls_time, :ld_time
  FROM login;

ls_reqdate = string(dw_1.object.req_date[1],"yyyy-mm-dd")	// 출고일자
/////////////////////////////////////////////////////////////////////////////////////////////
// 출고의뢰서 마감시간
/////////////////////////////////////////////////////////////////////////////////////////////
if GF_PERMISSION("출고의뢰마감시간", "CLOSETIME") = "Y" then
	if ls_reqdate > ls_getdate then	// 당일출고는 시간 체크함
	else
		if ls_time > ls_closetime then
			MessageBox("확인","당일 출고의뢰서 작성은 " + ls_closetime + " 이전에 완료하여야 합니다.")
			RETURN
		end if
	end if
end if
/////////////////////////////////////////////////////////////////////////////////////////////

ls_confirm     = dw_1.object.confirm_flag[1]		// 확정, 미확정
ldt_reqdate    = dw_1.object.req_date[1]        // 의뢰일자
ls_salesman    = dw_1.object.salesman[1]	   	// 작성자
ll_seq         = dw_1.object.req_seq[1]	      // 차수
ls_acceptuser  = dw_1.object.accept_user[1]   	// 수신자
ls_locno       = dw_1.object.loc_no[1]   			// 저장소

SELECT rtrim(user_name) INTO :ls_salesman_nm FROM login WHERE user_id = :ls_salesman;	// 작성자

	ll_cnt = 0
   SELECT count(*) INTO :ll_cnt FROM issuereqdet 
    WHERE req_date = :ls_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
	if ll_cnt > 0 then
		//////////////////////////////////////////////////////////////////////////////////
		// 출고의뢰서_메시저
		//////////////////////////////////////////////////////////////////////////////////
		if GF_PERMISSION("출고의뢰서_메신저", "SMSISSUEREQ") = "Y" then
			if gs_userid = ls_salesman then 	// 작성자
			else		// 확정취소자
				ls_rem = dw_1.object.rem[1]
				if isnull(ls_rem) then ls_rem = ""
				
	  		  if isnull(ls_rem) or ls_rem = '' then
					ls_message = "["+trim(gs_username)+"]님이 " + ls_salesman_nm + " 님의 " + string(ll_seq) + &
									 "차 출고를 확정취소 하였습니다. "
			  else
					ls_message = "["+trim(gs_username)+"]님이 " + ls_salesman_nm + " 님의 " + string(ll_seq) + &
									 "차 출고를 확정취소 하였습니다. " + '~n' + ls_rem				
			  end if

				
				INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del)
				VALUES (:gs_userid, :ls_salesman, getdate(), :ls_message,'N');	
				if SQLCA.SQLCode <> 0 then
					ls_sqlerrtext = SQLCA.SQLErrText
					ROLLBACK;
					MessageBox("SQL error", ls_sqlerrtext)
				else
					COMMIT;	
					
					if MessageBox("문자전송", "의뢰자에게 문자전송을 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
						SELECT replace(hp_no,'-',''), rtrim(user_name) INTO :ls_recvhp, :ls_recvname 
						  FROM salehp
								 LEFT OUTER JOIN login ON salehp.user_id = login.user_id
						 WHERE salehp.user_id = :ls_salesman;
						if isnull(ls_recvhp) OR ls_recvhp = "" then
							MessageBox("출고확정취소","수신자 수신번호가 존재하지 않습니다.")
						else
							// 발신자, 발신번호, 수신번호, 수신자명, 본문내용
							GF_MMSSEND( ls_salesman, "0226481998", ls_recvhp, ls_recvname, ls_message )
						end if
					end if		// 문자전송							
				end if		// SQLCA.SQLCode
			end if		// 작성자			
		end if		// 출고의뢰서_메신저
	end if		// ll_cnt = 1


// 출고보조자 확인(chk0, chk1, chk2, chk3, chk4, chk5)
//     (accept_user, accept1, accept2, accept3, accept4, accept5)
for ll_row = 1 to 6
	ll_dw3cnt = ll_row - 1

	choose case ll_row
		case 1
			// 기본수신자 null 허용 안됨
		
		case 2, 3, 4, 5, 6
			ls_chk    = dw_1.GetItemString( 1, "chk"+string(ll_dw3cnt) )
			if isnull(ls_chk) OR ls_chk = "N" then
				ls_userval = "accept" + string(ll_dw3cnt)	
				dw_1.setitem( 1, ls_userval, ls_null )
			end if
	end choose
next

dw_1.object.sys_date[1] = gf_today()	// ld_time 		// DateTime(Today(), Now())
//dw_1.object.accept_area[1] = dw_1.object.location_area_no[1]

dw_1.accepttext()
if WF_Update1( dw_1, "N" ) = false then
	RETURN
end if

ist_where.chk  = 'Y'
ist_where.name = ls_acceptuser	// 수신자
ist_where.str1 = ls_reqdate
ist_where.str3 = string(ll_seq)
ist_where.str4 = dw_1.object.issue_schedule[1]
ist_where.str5 = dw_1.object.ship_case[1]

CloseWithReturn( Parent, ist_where )

end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whissuereqauto_m
integer x = 23
integer y = 256
integer width = 3186
integer height = 936
integer taborder = 10
string dataobject = "d_whissuereqauto_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
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

event dw_1::itemchanged;call super::itemchanged;//
string   ls_area, ls_locno, ls_userid, ls_user, ls_userval
string   ls_itemcd, ls_itemnm, ls_bigo, ls_chktype, ls_tabseq, ls_column
long     ll_row, ll_dw3row, li_reqseq
DateTime ld_time
DataWindowChild ldwc_accept

this.accepttext()

SELECT top 1 getdate() INTO :ld_time FROM login;
this.object.sys_date[1] = ld_time // DateTime(Today(), Now())

choose case dwo.name
	case "accept_user"
		ls_userid = trim(data)		
			
		/*SELECT loc_no, area_no INTO :ls_locno, :ls_area FROM location WHERE loc_manager = :ls_userid;*/
		
		/*2019.01.17 jowonsuk 반영  accept_area 누락되는 경우 수정  */
		 select A.area_no, A.loc_no
		 INTO :ls_area, :ls_locno 
		 from 
		(
			SELECT loc_manager, area_no, loc_no
		     FROM location 
				UNION ALL     
			SELECT ITEM_CD loc_manager,
					  'S0001' area_no, 
					  'WS00000000' loc_no        
			  FROM  CODEMST
			WHERE TYPE LIKE '출고의뢰서_보조자(시화)'
				 AND  USE_YN = 'Y'    
		) A WHERE A.loc_manager = :ls_userid;		
		
		if isnull(ls_area) OR ls_area = "" then
			SELECT area_no INTO :ls_area FROM area	 WHERE issue_accept_user = :ls_userid;
		end if
		
		choose case ls_locno
			case "WS00000000"
				ls_chktype = "출고의뢰서_보조자(시화)"
			case "WS00000007"
				ls_chktype = "출고의뢰서_보조자(화곡)"
			case "WS00000008"
				ls_chktype = "출고의뢰서_보조자(화성)"
			case "WS00000011"
				ls_chktype = "출고의뢰서_보조자(대전)"
			case "WS00000012"
				ls_chktype = "출고의뢰서_보조자(동부)"
		end choose
		
		dw_3.retrieve( ls_chktype )
		for ll_dw3row = 1 to 5
			ls_tabseq = dw_1.Describe( "chk"+string(ll_dw3row)+".TabSequence" )		
			ls_column = "chk"+string(ll_dw3row)
		
			if ll_dw3row > dw_3.rowcount() then		
				ls_user    = ""
				ls_userval = "accept" + string(ll_dw3row)	
				dw_1.setitem( 1, ls_userval, ls_user )

				dw_1.setitem( 1, ls_column, "N" )
				dw_1.Modify( ls_column + ".TabSequence = 0" )				
			else
				ls_user    = ""
				ls_userval = "accept" + string(ll_dw3row)	
				dw_1.setitem( 1, ls_userval, ls_user )
				dw_1.Modify( ls_column + ".TabSequence = " + ls_tabseq )				
			end if
		next
		
		for ll_row = 1 to dw_3.rowcount()
			if ll_row > 5 then
				MessageBox("확인","저장소의 출고보조자는 5명 까지만 지원합니다.")
			else
				ls_user    = dw_3.object.item_cd[ll_row]
				ls_userval = "accept" + string(ll_row)
				
				dw_1.setitem( 1, ls_userval, ls_user )
			end if
		next
		
		this.object.loc_no[1] = ls_locno			// 저장소
		this.object.accept_area[1] = ls_area	// 사업장
	case 'req_date'		
		
		data = LeftA(data,10)
		
		// 의뢰자별 마지막 차수
		SELECT max(req_seq) INTO :li_reqseq 
		  FROM issuereq 
		 WHERE convert(char(10),req_date,112) = replace( substring(:data,1,10) , '-', '')
			AND salesman   = :gs_userid;
		 
		if isnull(li_reqseq) OR li_reqseq = 0 then
			li_reqseq = 1
		else
			li_reqseq = li_reqseq + 1
		end if		
		
		this.object.req_seq[1] = li_reqseq
		
		
end choose

end event

event dw_1::losefocus;call super::losefocus;this.accepttext()
end event

event dw_1::rbuttondown;call super::rbuttondown;//
string ls_date, ls_apply

if this.RowCount() < 1 then return

ls_apply = this.object.confirm_flag[1]
if ls_apply = "N" then	
	if dwo.name = "req_date" then
		if dw_1.object.req_date.tabsequence = 0 then
		else
			OpenWithParm(w_calendar, message.stringparm)
			if Message.StringParm <> 'N' then
				ls_date = string(date(Message.StringParm))
				this.object.req_date[1] = datetime(date(ls_date), Time("00:00:00"))
			end if
		end if
	end if
end if

end event

type st_title from w_inheritance`st_title within w_whissuereqauto_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whissuereqauto_m
end type

type pb_compute from w_inheritance`pb_compute within w_whissuereqauto_m
boolean visible = false
integer taborder = 0
end type

type pb_print_part from w_inheritance`pb_print_part within w_whissuereqauto_m
boolean visible = false
integer taborder = 0
end type

type pb_close from w_inheritance`pb_close within w_whissuereqauto_m
integer x = 2807
integer y = 1236
integer width = 398
integer height = 116
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

type pb_print from w_inheritance`pb_print within w_whissuereqauto_m
boolean visible = false
integer taborder = 0
end type

type pb_cancel from w_inheritance`pb_cancel within w_whissuereqauto_m
boolean visible = false
integer taborder = 0
end type

type pb_delete from w_inheritance`pb_delete within w_whissuereqauto_m
boolean visible = false
integer taborder = 0
end type

type pb_insert from w_inheritance`pb_insert within w_whissuereqauto_m
boolean visible = false
integer x = 1998
integer y = 1216
integer width = 398
integer height = 292
integer taborder = 20
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
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

type pb_retrieve from w_inheritance`pb_retrieve within w_whissuereqauto_m
boolean visible = false
integer taborder = 0
end type

type gb_3 from w_inheritance`gb_3 within w_whissuereqauto_m
boolean visible = false
integer x = 1925
integer y = 724
integer width = 709
integer height = 128
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whissuereqauto_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 3131
integer height = 1044
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_whissuereqauto_m
boolean visible = false
integer x = 1408
integer y = 1328
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_whissuereqauto_m
boolean visible = false
integer x = 3552
integer y = 164
integer width = 238
integer height = 136
integer taborder = 0
end type

type st_5 from statictext within w_whissuereqauto_m
integer x = 110
integer y = 56
integer width = 1239
integer height = 132
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "출고의뢰서 자동생성"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_6 from statictext within w_whissuereqauto_m
integer x = 23
integer y = 196
integer width = 576
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고의뢰서_메신저"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whissuereqauto_m
integer x = 1367
integer y = 28
integer width = 133
integer height = 108
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_codemst_type"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

