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
type st_time from statictext within w_oiissuereq_m
end type
type st_9 from statictext within w_oiissuereq_m
end type
type st_10 from statictext within w_oiissuereq_m
end type
type dw_4 from datawindow within w_oiissuereq_m
end type
type dw_5 from datawindow within w_oiissuereq_m
end type
type dw_6 from datawindow within w_oiissuereq_m
end type
type cbx_qty from checkbox within w_oiissuereq_m
end type
type st_vertical1 from u_splitbar_vertical within w_oiissuereq_m
end type
type cb_all from commandbutton within w_oiissuereq_m
end type
type dw_7 from datawindow within w_oiissuereq_m
end type
type st_vertical2 from u_splitbar_vertical within w_oiissuereq_m
end type
type cb_del from commandbutton within w_oiissuereq_m
end type
end forward

global type w_oiissuereq_m from w_inheritance
integer width = 4201
integer height = 2604
string title = "출고의뢰서(w_oiissuereq_m)"
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
st_time st_time
st_9 st_9
st_10 st_10
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
cbx_qty cbx_qty
st_vertical1 st_vertical1
cb_all cb_all
dw_7 dw_7
st_vertical2 st_vertical2
cb_del cb_del
end type
global w_oiissuereq_m w_oiissuereq_m

type variables
st_print i_print
string   is_message, is_closetime, is_accept_user
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

OpenWithParm( w_whissuereq_m, lstr_where )
lstr_where = Message.PowerObjectParm

if lstr_where.chk = "Y" then
	em_2.text = lstr_where.str3		// 차수
end if

RETURN lstr_where.chk

end function

public function string wf_detail (string as_flag);//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

gs_where lstr_where
string   ls_ret

dw_1.accepttext()
dw_3.accepttext()

lstr_where.str1 = em_1.text						// 의뢰일자
lstr_where.str2 = dw_3.object.user[1]			// 의뢰자 
lstr_where.str3 = em_2.text						// 차수
lstr_where.str4 = as_flag							// 의뢰구분
if dw_1.getrow() > 0 then
	lstr_where.str5 = string(dw_1.getrow())
else
	lstr_where.str5 = "0"							// 출고수주건 수
end if
lstr_where.chk  = "Y"

if dw_1.rowcount() > 0 then
	lstr_where.name = dw_1.object.accept_user[1]	// 수신자
else
	lstr_where.name = ""
end if

// 출고의뢰 내역
OpenWithParm( w_whissuereqdet_m, lstr_where )	// 출고의뢰내역
lstr_where = Message.PowerObjectParm

debugbreak()

if isnull(lstr_where.chk) OR lstr_where.chk = "" then
	ls_ret  = "N"
else
	ls_ret  = lstr_where.chk
end if

RETURN ls_ret


end function

public function boolean wf_smssend ();//
// 영업사원이 출고의뢰한 경우 출고팀에게 문자전송 하기
string ls_salesman, ls_phone, ls_phonename, ls_custnm, ls_scenenm, ls_sysdate
string ls_shipcase, ls_message, ls_confirm, ls_usernm, ls_exist, ls_acceptuser, ls_locno
long   lr_total

if dw_1.rowcount() < 1 then return false

ls_acceptuser = dw_1.object.accept_user[1]		// 수신자

SELECT loc_no INTO :ls_locno FROM location WHERE loc_manager = :ls_acceptuser AND use_yn = 'Y';

SELECT hp_no = replace(substring(ltrim(rtrim(isnull(a.hp_no,''))),1,13), '-', '') 
  INTO :ls_salesman
  FROM salehp a
 WHERE a.user_id   = :gs_userid;

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
this.st_time=create st_time
this.st_9=create st_9
this.st_10=create st_10
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.cbx_qty=create cbx_qty
this.st_vertical1=create st_vertical1
this.cb_all=create cb_all
this.dw_7=create dw_7
this.st_vertical2=create st_vertical2
this.cb_del=create cb_del
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
this.Control[iCurrent+18]=this.st_time
this.Control[iCurrent+19]=this.st_9
this.Control[iCurrent+20]=this.st_10
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.dw_5
this.Control[iCurrent+23]=this.dw_6
this.Control[iCurrent+24]=this.cbx_qty
this.Control[iCurrent+25]=this.st_vertical1
this.Control[iCurrent+26]=this.cb_all
this.Control[iCurrent+27]=this.dw_7
this.Control[iCurrent+28]=this.st_vertical2
this.Control[iCurrent+29]=this.cb_del
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
destroy(this.st_time)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.cbx_qty)
destroy(this.st_vertical1)
destroy(this.cb_all)
destroy(this.dw_7)
destroy(this.st_vertical2)
destroy(this.cb_del)
end on

event open;call super::open;/*
Unique Key Column(s)
	issuereqdet_req_date
	issuereqdet_salesman
	issuereqdet_req_seq
	issuereqdet_req_flag
	issuereqdet_seq
	issuereqdet_cust_no
	issuereqdet_scene_code
	issuereqdet_add_scene

Updateable Column(s)
	issuereqdet_req_date
	issuereqdet_salesman
	issuereqdet_req_seq
	issuereqdet_req_flag
	issuereqdet_seq
	issuereqdet_cust_no
	issuereqdet_scene_code
	issuereqdet_add_scene
	issuereqdet_sale_no
	issuereqdet_item_name
	issuereqdet_uom
	issuereqdet_issue_flag
	issuereqdet_issue_schedule
	issuereqdet_ship_flag
	issuereqdet_ship_case
	issuereqdet_tel
	issuereqdet_rem
	issuereqdet_sys_date
*/
//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical1.of_set_leftobject(dw_2)
st_vertical1.of_set_rightobject(dw_1)
st_vertical1.of_set_minsize(250, 250)

st_vertical2.of_set_leftobject(dw_1)
st_vertical2.of_set_rightobject(dw_7)
st_vertical2.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

DataWindowChild ldwc_user

string ls_accept, ls_userid, ls_dwname

// 순서조정
cb_3.enabled = false
cb_4.enabled = false

// 의뢰자
dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.getchild( "user", ldwc_user )
ldwc_user.setfilter( "use_flag = 'Y'" )
ldwc_user.filter()

dw_3.object.user[1] = gs_userid
dw_3.AcceptText()

if gs_userid = "1999010s" then
else
dw_3.enabled = false		// 의뢰자
end if

// 수신자
ls_userid = gs_userid
if gs_team = "75000" then ls_userid = "JDS"		// 영업지원 기본값: 시화저장소

SELECT loc_manager INTO :ls_accept FROM location WHERE loc_manager = :ls_userid;

dw_4.settransobject(sqlca)
ls_dwname = dw_4.Describe("user.dddw.name")
dw_4.Modify("user.dddw.allowedit=no")				// 입력방지

dw_4.insertrow(1)
dw_4.getchild( "user", ldwc_user )
ldwc_user.setsort( "area_area_name D, loc_name A" )
ldwc_user.sort()
dw_4.object.user[1] = ls_accept
dw_4.AcceptText()

// 출고상세 선정수량(삭제)
dw_5.settransobject(sqlca)
dw_5.visible = false

// 출고상세 선정수량(조회)
dw_6.settransobject(sqlca)
dw_6.visible = false

// 출고의뢰 목록
dw_7.settransobject(sqlca)

// 출고의뢰서 마감시간
SELECT ltrim(rtrim(item_nm)) INTO :is_closetime FROM codemst WHERE item_cd = 'CLOSETIME';
if isnull(is_closetime) or is_closetime = "" then is_closetime = "10:00:00"
//st_info.text = "당일 출고의뢰서 작성은 " + IS_CLOSETIME + " 까지만 가능 합니다."

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
//	st_info.text    = "지금 시간부터는 당일 출고의뢰서 작성은 안됩니다."
	st_time.visible = false
	Timer(0)
else	
	Timer(1)
end if

cb_all.PostEvent( clicked! )
pb_retrieve.postevent( clicked! )


end event

event resize;call super::resize;//
long  ll_width

gb_3.width  = newwidth  - (gb_3.x * 2)

cb_del.x    = newwidth  - cb_del.width - (gb_3.x * 2)

dw_2.height = newheight - dw_2.y - gb_3.x

st_vertical1.x      = dw_2.x + dw_2.width
st_vertical1.height = dw_2.height

ll_width    = newwidth  - dw_1.x

dw_1.x      = st_vertical1.x + st_vertical1.width
dw_1.width  = ll_width  * 0.7
dw_1.height = newheight - dw_1.y - gb_3.x

st_vertical2.x      = dw_1.x + dw_1.width
st_vertical2.height = dw_1.height

dw_7.x      = st_vertical2.x + st_vertical2.width
dw_7.y      = dw_1.y
dw_7.width  = (ll_width  * 0.3) - st_vertical2.width - gb_3.x
dw_7.height = dw_1.height

dw_6.x      = dw_1.x + dw_1.width - 2789
dw_6.y      = dw_1.y
dw_6.width  = 2789
dw_6.height = dw_1.height
end event

event activate;call super::activate;//
string   ls_getdate, ls_time
datetime ld_tomorrow, ldt_reqdate

//if isnull(is_message) or is_message = "" then
//	is_message = "Y"
//	SELECT top 1 
//			 ls_getdate = convert(char(20), getdate(),120)
//		  , ls_time    = substring(convert(char(20), getdate(),120),12,8)
//		  , ld_tomorrow= dateadd(day, 1, getdate() )
//	  INTO :ls_getdate, :ls_time, :ld_tomorrow

//	  FROM login;
//	
//	st_time.text = ls_time
//	if ls_time > IS_CLOSETIME then
//		em_1.text = string(ld_tomorrow,"yyyy/mm/dd")
//		em_2.text = '1'		
//		MessageBox("확인","당일 출고의뢰서 작성은 " + IS_CLOSETIME + " 이전에 확정 바랍니다.~n~n" + &
//					  "지금은 " + em_1.text + " 일자 출고의뢰서를 작성 합니다.")
//	end if
//end if
//


//
ldt_reqdate = DateTime( date(em_1.text), time("00:00:00") )
dw_7.retrieve( ldt_reqdate, gs_userid)

end event

event timer;call super::timer;////
//string ls_time
//
//SELECT top 1 substring(convert(char(20), getdate(),120),12,8) INTO :ls_time FROM login;
//
//st_time.text = ls_time
//if ls_time > IS_CLOSETIME then
//	st_info.textcolor = rgb(255, 0, 0)
//	st_info.text      = "지금 시간부터는 당일 출고의뢰서 작성은 안됩니다."
//	st_time.visible   = false
//	Timer(0)
//end if
//
end event

type pb_save from w_inheritance`pb_save within w_oiissuereq_m
integer x = 3675
integer taborder = 30
end type

event pb_save::clicked;//
long   	ll_row, ll_cnt, ll_reqseq, ll_seq, ll_seq_no
string 	ls_exist, ls_flag, ls_user, ls_confirm, ls_salesman, ls_acceptuser, ls_acceptarea, ls_order_no
string   ls_recvhp, ls_recvname, ls_sqlerrtext
int    	li_seq
date   	ld_date
datetime ldt_reqdate, ldt_sysdate
decimal l_issue_qty

//
string   ls_getdate, ls_time
datetime ld_tomorrow

dw_1.setredraw( true )
dw_1.accepttext()

ls_exist = "N"
if dw_1.rowcount() < 1 then RETURN

ls_acceptuser = dw_1.object.accept_user[1]

if ( isnull(ls_acceptuser) OR ls_acceptuser = "")  then 
	MessageBox("확인","수신자는 반드시 선택해야 합니다.",StopSign!)
	RETURN
end if

ls_acceptarea = dw_1.object.accept_area[1]
ls_confirm      = dw_1.object.confirm_flag[1]

if ls_confirm = "Y" then
	if ( isnull(ls_acceptarea) OR ls_acceptarea = "" )  then 
		MessageBox("확인","수신사업장은 반드시 선택해야 합니다.",StopSign!)
		RETURN
	end if
end if

//
SELECT top 1 
		 ls_getdate = convert(char(10), getdate(),120)
	  , ls_time    = substring(convert(char(20), getdate(),120),12,8)
	  , ld_tomorrow= dateadd(day, 1, getdate() )
  INTO :ls_getdate, :ls_time, :ld_tomorrow
  FROM login;
  
//if ls_getdate = em_1.text then
//	if ls_time > IS_CLOSETIME then
//		MessageBox("확인","당일 출고의뢰서 작성은 " + IS_CLOSETIME + " 이전에 완료하여야 합니다.",StopSign!)
//		RETURN
//	end if
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

for ll_cnt = 1 to dw_1.rowcount()
	ls_flag = dw_1.object.issuereqdet_req_flag[ll_cnt]
	
	if ls_flag = "A" OR ls_flag = "P" then
		ls_exist = "Y"
		EXIT
	end if
next

if dw_1.rowcount() < 4 AND ls_exist = "N" then
	ld_date = date(em_1.text)
	li_seq  = dw_1.object.req_seq[1]
	ls_user = dw_3.object.user[1]
	DELETE FROM issuereq WHERE req_date = :ld_date AND salesman = :ls_user AND req_seq  = :li_seq;
end if

// 저장
//if WF_Update1( dw_1, "Y" ) = true then	
//	// 출고상세내역 삭제
//	
//	for ll_row = 1 to dw_5.rowcount()
//		
//		ldt_reqdate = dw_5.object.req_date[ll_row]
//		ls_salesman = dw_5.object.salesman[ll_row]
//		ll_reqseq   = dw_5.object.req_seq[ll_row]
//		ll_seq      = dw_5.object.seq[ll_row]
////		l_issue_qty = dw_5.object.issue_qty[ll_row]
//		ls_order_no = dw_5.object.order_no[ll_row]
////		ll_seq_no = dw_5.object.seq_no[ll_row]		
//
//		DELETE FROM issuereqdet_sale 
//		 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_reqseq AND seq = :ll_seq;
//		 
//		 update saledet
//		 	set issue_qty = issue_qty - :l_issue_qty
//		where order_no = :ls_order_no 
//		    and seq_no = :ll_seq_no;
//		 
//	next	
//	
//end if


if WF_Update1( dw_1, "Y" ) = true then	
	// 출고상세내역 삭제
	
	for ll_row = 1 to  dw_5.deletedcount()
	
		ldt_reqdate    = dw_5.GetItemDatetime(ll_row,"req_date", Delete!, TRUE)
		ls_salesman = trim(dw_5.GetItemString(ll_row,"salesman", Delete!, TRUE))
		ll_reqseq = dw_5.GetItemnumber(ll_row,"req_seq", Delete!, TRUE)
		ll_seq = dw_5.GetItemnumber(ll_row,"seq", Delete!, TRUE)		
		ls_order_no = trim(dw_5.GetItemString(ll_row,"order_no", Delete!, TRUE)	)
		ll_seq_no = dw_5.GetItemnumber(ll_row,"seq_no", Delete!, TRUE)						
		l_issue_qty = dw_5.GetItemnumber(ll_row,"issue_qty", Delete!, TRUE)		
		 
		 update saledet
		 	set issue_qty = case when ( isnull(issue_qty,0) - isnull(:l_issue_qty,0)  ) <= 0 then 0 else  isnull(issue_qty,0) - isnull(:l_issue_qty,0) end 
		where order_no = :ls_order_no 
		    and seq_no = :ll_seq_no;
		 
	next	
	
	WF_Update1( dw_5, "N" )
	
end if

// 조회
pb_retrieve.TriggerEvent(clicked!)

end event

type dw_1 from w_inheritance`dw_1 within w_oiissuereq_m
integer x = 1947
integer y = 416
integer width = 1961
integer height = 2016
integer taborder = 50
string dataobject = "d_oiissuereq_s"
boolean livescroll = false
end type

event dw_1::clicked;call super::clicked;//
datetime ldt_dodate, ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

if isnull(row) OR row < 1 then RETURN

	ldt_reqdate = this.object.issuereqdet_req_date[row]
	ls_salesman = this.object.issuereqdet_salesman[row]
	ll_reqseq   = this.object.issuereqdet_req_seq[row]
	ll_seq      = this.object.issuereqdet_seq[row]
	ls_orderno  = this.object.issuereqdet_sale_no[row]
	
dw_5.retrieve( string(ldt_reqdate, 'yyyymmdd'), ls_salesman, ll_reqseq, ll_seq )

this.scrolltorow( row )

end event

event dw_1::doubleclicked;call super::doubleclicked;//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099) )

string ls_flag, ls_accept
date   ld_today

//ld_today  = date(GF_Today())
//if date(em_1.text) < ld_today then
//	em_1.setfocus()
//	MessageBox("확인","출고일자를 확인하시기 바랍니다.")
//	RETURN
//end if
//
//
//dw_4.accepttext()
//
//ls_accept = dw_4.object.user[1]
//if isnull(ls_accept) OR ls_accept = "" then
//	MessageBox("확인","수신자를 선택하시기 바랍니다.")
//	RETURN
//end if

choose case row
	case 0		// header 선택
		if WF_Header() <> "Y" then 
		else
			pb_retrieve.triggerevent( clicked! )
		end if
		
	case else	// Detail 선택
		ls_flag = this.object.issuereqdet_req_flag[row]
		
		choose case ls_flag
			case 'A'
				if WF_Detail('A') <> "Y" then RETURN
				
			case 'B', 'P'
				if WF_Detail('P') <> "Y" then RETURN
				
			case 'Z'
				if WF_Header()    <> "Y" then RETURN
				
			case else
				if WF_Detail('A') <> "Y" then RETURN
		end choose

		//출고의뢰 상세 조회.
		pb_retrieve.triggerevent( clicked! )
end choose

end event

event dw_1::retrieveend;call super::retrieveend;//
string ls_confirm

if isnull(rowcount) OR rowcount < 1 then 
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

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
datetime ldt_dodate, ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

if isnull(currentrow) OR currentrow < 1 then RETURN

ls_orderno  = dw_1.object.issuereqdet_sale_no[currentrow]

ldt_reqdate = dw_1.object.req_date[currentrow]
ls_salesman = dw_1.object.salesman[currentrow]
ll_reqseq   = dw_1.object.req_seq[currentrow]
ll_seq      = dw_1.object.issuereqdet_seq[currentrow]


if cbx_qty.checked = true then
	dw_6.retrieve( ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno )
end if

end event

type st_title from w_inheritance`st_title within w_oiissuereq_m
integer x = 0
integer y = 0
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
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099) )

datetime ldt_reqdate
string ls_flag, ls_reqdate, ls_salesman, ls_order_no
long   ll_row,  ll_reqseq,  ll_seq, ll_dw5cnt, l_row
debugbreak()

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ldt_reqdate = dw_1.object.req_date[ll_row]				// 의뢰일자
ls_salesman = dw_1.object.salesman[ll_row]				// 의뢰자
ll_reqseq   = dw_1.object.req_seq[ll_row]					// 차수
ll_seq      = dw_1.object.issuereqdet_seq[ll_row]		// 차수순번
ls_order_no =  dw_1.object.issuereqdet_sale_no[ll_row]
ls_flag = dw_1.object.issuereqdet_req_flag[ll_row]

choose case ls_flag
	case "A", "P"
		dw_1.deleterow(ll_row)

//		ll_dw5cnt = dw_5.insertrow(0)
//		dw_5.object.req_date[ll_dw5cnt] = ldt_reqdate
//		dw_5.object.salesman[ll_dw5cnt] = ls_salesman
//		dw_5.object.req_seq[ll_dw5cnt]  = ll_reqseq
//		dw_5.object.seq[ll_dw5cnt]      = ll_seq
//		dw_5.object.order_no[ll_dw5cnt] =  ls_order_no

		ll_dw5cnt = dw_5.rowcount()	

		for l_row = 1 to ll_dw5cnt			
				dw_5.deleterow(0)				 
		next	

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

string ls_accept
long   ll_row
date   ld_today

ld_today  = date(GF_Today())
if date(em_1.text) < ld_today then
	em_1.setfocus()
	MessageBox("확인","출고일자를 확인하시기 바랍니다.")
	RETURN
end if

dw_4.accepttext()
ls_accept = dw_4.object.user[1]

if isnull(ls_accept) OR ls_accept = "" then
	MessageBox("확인","수신자를 선택하시기 바랍니다.")
	RETURN
else
	SELECT count(*) INTO :ll_row FROM login WHERE user_id = :ls_accept AND use_flag = 'Y';
	if ll_row = 0 then
		MessageBox("확인","수신자를 확인하시기 바랍니다.")
		RETURN
	end if
end if

em_2.text = string(integer(st_3.text) +1 )

pb_retrieve.PostEvent(clicked!)

if WF_Header() <> "Y" then RETURN
pb_retrieve.PostEvent(clicked!)

if WF_Detail('A') <> "Y" then RETURN
pb_retrieve.PostEvent(clicked!)

if WF_Detail('P') <> "Y" then RETURN

pb_retrieve.PostEvent(clicked!)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oiissuereq_m
integer x = 2889
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string   ls_user, ls_time, ls_accept, ls_null
int      li_cnt
DateTime ldt_time,  ldt_reqdate
date     ld_date

//
datetime ldt_dodate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

SELECT top 1 getdate() INTO :ldt_time FROM login;
st_time.text = string(ldt_time,"yyyy/mm/dd hh:mm:ss")

ls_time = string(ldt_time, "yyyy/mm/dd hh:mm:ss")
ld_date = date(em_1.text)
ls_user = dw_3.object.user[1]

dw_1.reset() ; dw_5.reset() ; dw_6.reset() ; dw_7.reset()

dw_1.setredraw( false )
dw_1.retrieve(ld_date, ls_user, integer(em_2.text), ls_time)
dw_1.setredraw( true )
dw_1.groupcalc()
dw_1.setfocus()

// 첫행 수신자 보여주기
if dw_1.rowcount() > 0 then
	ls_accept = dw_1.object.accept_user[1]
	dw_4.object.user[1] = ls_accept

	ldt_reqdate = dw_1.object.req_date[1]
	ls_salesman = dw_1.object.salesman[1]
	ll_reqseq   = dw_1.object.req_seq[1]
	ll_seq      = dw_1.object.issuereqdet_seq[1]
	ls_orderno  = dw_1.object.issuereqdet_sale_no[1]
	
	if cbx_qty.checked = true then
		dw_6.retrieve( ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno )
	end if
	
dw_5.retrieve( string(ldt_reqdate, 'yyyymmdd'), ls_salesman, ll_reqseq, ll_seq )
		
else
	dw_4.object.user[1] = ""
	dw_6.reset()
end if


// 출고예정
ldt_reqdate = DateTime( date(em_1.text), time("00:00:00") )
dw_7.retrieve( ldt_reqdate, gs_userid)

//
SELECT max(req_seq) INTO :li_cnt 
  FROM issuereq
 WHERE req_date = :ld_date  AND salesman = :ls_user;

if isnull(li_cnt) then li_cnt = 0
st_3.text = string(li_cnt, '#0')

end event

type gb_3 from w_inheritance`gb_3 within w_oiissuereq_m
integer x = 32
integer y = 240
integer width = 4064
integer height = 176
integer taborder = 110
integer textsize = -8
integer weight = 400
long backcolor = 67108864
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

type dw_2 from w_inheritance`dw_2 within w_oiissuereq_m
integer x = 0
integer y = 416
integer width = 1915
integer height = 2016
integer taborder = 60
string dataobject = "d_oiissuereq_list"
boolean hscrollbar = true
boolean livescroll = false
end type

event dw_2::clicked;call super::clicked;//
datetime ldt_reqdate
long     ll_reqseq

if isnull(row) OR row < 1 then RETURN

ldt_reqdate  = this.object.req_date[row]
ll_reqseq    = this.object.req_seq[row]

em_1.text    = string(ldt_reqdate,"yyyy/mm/dd")
em_2.text    = string(ll_reqseq)

pb_retrieve.PostEvent( clicked! )

end event

type dw_3 from datawindow within w_oiissuereq_m
integer x = 1367
integer y = 56
integer width = 677
integer height = 76
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_whlogin_c2"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
end event

event itemchanged;//
em_2.text = '1'

cb_all.PostEvent( clicked! )
pb_retrieve.postevent(clicked!)

end event

type em_1 from editmask within w_oiissuereq_m
integer x = 2039
integer y = 48
integer width = 407
integer height = 88
integer taborder = 160
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
alignment alignment = center!
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
integer x = 2693
integer y = 60
integer width = 96
integer height = 68
boolean bringtotop = true
integer textsize = -12
integer weight = 700
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
integer x = 2066
integer y = 160
integer width = 389
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
integer x = 2464
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
integer x = 2569
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
integer x = 2450
integer y = 48
integer width = 123
integer height = 88
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
double increment = 1
string minmax = "1~~99"
end type

event modified;//
if integer(em_2.text) <= integer(st_3.text) then
else
	if integer(em_2.text) = integer(st_3.text) + 1 then return
	
	this.text = st_3.text
end if

pb_retrieve.postevent(clicked!)
this.setfocus()

end event

event getfocus;//
em_2.selecttext( 1, LenA(this.text) )
end event

type gb_4 from groupbox within w_oiissuereq_m
integer x = 1129
integer y = 4
integer width = 1714
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
integer x = 2569
integer y = 40
integer width = 91
integer height = 52
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

event clicked;// ▲
if isnull(em_2.text) then em_2.text = '1'
if integer(em_2.text) = integer(st_3.text) + 1 then return

if integer(em_2.text) < 1 then return

em_2.text = string(integer(em_2.text) + 1)

pb_retrieve.postevent(clicked!)
em_2.setfocus()

end event

type cb_2 from commandbutton within w_oiissuereq_m
integer x = 2569
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

event clicked;// ▼
if isnull(em_2.text) then em_2.text = '1'
if integer(em_2.text) <= 1 then return

em_2.text = string(integer(em_2.text) - 1)

pb_retrieve.postevent(clicked!)
em_2.setfocus()

end event

type cb_3 from commandbutton within w_oiissuereq_m
integer x = 2057
integer y = 300
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
if isnull(ll_row) OR ll_row <= 1 then RETURN

ll_curseq = dw_1.object.issuereqdet_seq[ll_row]
if ll_curseq = 1 OR ll_curseq = 0 then RETURN

dw_1.object.issuereqdet_seq[ll_row]     = dw_1.object.issuereqdet_seq[ll_row - 1]
dw_1.object.issuereqdet_seq[ll_row - 1] = ll_curseq

dw_1.sort()
dw_1.scrolltorow(ll_row - 1)

end event

type cb_4 from commandbutton within w_oiissuereq_m
integer x = 2222
integer y = 300
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
if isnull(ll_row) OR ll_row < 1 then RETURN

ll_curseq = dw_1.object.issuereqdet_seq[ll_row]
if ll_curseq = 0 OR ll_curseq = dw_1.rowcount() then RETURN

if dw_1.object.issuereqdet_req_flag[ll_row + 1] = 'B' OR &
	dw_1.object.issuereqdet_req_flag[ll_row + 1] = 'Z' then RETURN

dw_1.object.issuereqdet_seq[ll_row]     = dw_1.object.issuereqdet_seq[ll_row + 1]
dw_1.object.issuereqdet_seq[ll_row + 1] = ll_curseq

dw_1.sort()
dw_1.scrolltorow(ll_row + 1)

end event

type st_5 from statictext within w_oiissuereq_m
integer x = 1573
integer y = 300
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
integer x = 2665
integer y = 144
integer width = 155
integer height = 72
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
integer x = 2409
integer y = 288
integer width = 3154
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "상세내역을 더블클릭하면 보조윈도우가 조회됩니다."
boolean focusrectangle = false
end type

type st_7 from statictext within w_oiissuereq_m
integer x = 2409
integer y = 344
integer width = 3154
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "출고의뢰서 작성후 확정을 하시면 변경/삭제가 불가합니다."
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type st_8 from statictext within w_oiissuereq_m
integer x = 1166
integer y = 72
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

type st_time from statictext within w_oiissuereq_m
integer x = 78
integer y = 280
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
boolean focusrectangle = false
end type

type st_9 from statictext within w_oiissuereq_m
integer x = 32
integer y = 204
integer width = 1079
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "~"확정취소~"는 수신 담당자만 가능"
boolean focusrectangle = false
end type

type st_10 from statictext within w_oiissuereq_m
integer x = 1166
integer y = 148
integer width = 206
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
string text = "수신자"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_oiissuereq_m
integer x = 1367
integer y = 132
integer width = 667
integer height = 84
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_whlogin_accept"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

is_accept_user = data
//em_2.setfocus()

end event

type dw_5 from datawindow within w_oiissuereq_m
integer x = 485
integer y = 148
integer width = 165
integer height = 64
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_whissuereqdetsale_delete"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_oiissuereq_m
integer x = 18
integer y = 76
integer width = 137
integer height = 104
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_issuereqdet_sale_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_qty from checkbox within w_oiissuereq_m
integer x = 78
integer y = 344
integer width = 357
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선정수량"
end type

event clicked;//
datetime ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,   ll_seq,    ll_row

dw_6.reset()
if this.checked = true then	
	dw_6.visible = true

	if dw_1.rowcount() > 0 then
		ll_row = dw_1.getrow()
		
		ldt_reqdate = dw_1.object.req_date[ll_row]
		ls_salesman = dw_1.object.salesman[ll_row]
		ll_reqseq   = dw_1.object.req_seq[ll_row]
		ll_seq      = dw_1.object.issuereqdet_seq[ll_row]
		ls_orderno  = dw_1.object.issuereqdet_sale_no[ll_row]	
		dw_6.retrieve( ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno )
	end if
else
	dw_6.visible = false
end if

end event

type st_vertical1 from u_splitbar_vertical within w_oiissuereq_m
integer x = 1920
integer y = 432
integer height = 2012
boolean bringtotop = true
end type

type cb_all from commandbutton within w_oiissuereq_m
integer x = 992
integer y = 300
integer width = 517
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재조회"
end type

event clicked;//
string   ls_user, ls_time, ls_accept, ls_null
int      li_cnt
DateTime ldt_time,  ldt_reqdate
date     ld_date

//
datetime ldt_dodate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

SELECT top 1 getdate() INTO :ldt_time FROM login;
st_time.text = string(ldt_time,"yyyy/mm/dd hh:mm:ss")

ls_time = string(ldt_time, "yyyy/mm/dd hh:mm:ss")
ld_date = date(em_1.text)
ls_user = dw_3.object.user[1]

ldt_reqdate = DateTime( date(em_1.text), Time("00:00:00") )

dw_2.reset()
dw_2.retrieve( ldt_reqdate, ls_user, "%" )


end event

type dw_7 from datawindow within w_oiissuereq_m
integer x = 3931
integer y = 432
integer width = 165
integer height = 2012
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiissuereq_order_m"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_vertical2 from u_splitbar_vertical within w_oiissuereq_m
integer x = 3909
integer y = 432
integer height = 2012
boolean bringtotop = true
end type

type cb_del from commandbutton within w_oiissuereq_m
integer x = 3749
integer y = 300
integer width = 297
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "행삭제"
end type

event clicked;// 행삭제
string   ls_orderno, ls_salesman
long     ll_row, ll_cnt
datetime ldt_reqdate

debugbreak()
if dw_7.rowcount() < 1 then RETURN

ll_row      = dw_7.getrow()
ls_orderno  = dw_7.object.order_no[ll_row]
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

ldt_reqdate = DateTime( Today(), time("00:00:00") )

DELETE FROM issuereq_order 
 WHERE req_date = :ldt_reqdate AND salesman = :gs_userid AND order_no = :ls_orderno;
if sqlca.sqlcode < 0 then
	ROLLBACK;
	MessageBox("삭제","삭제중 오류가 발생하였습니다!",exclamation!)
	RETURN
else
	dw_7.DeleteRow( ll_row )
	COMMIT;
end if		

end event

