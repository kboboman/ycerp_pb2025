$PBExportHeader$w_cdcusttar_m2.srw
$PBExportComments$거래처별 매출.수금목표관리1999/03/05, 정갑용)
forward
global type w_cdcusttar_m2 from w_inheritance
end type
type st_7 from statictext within w_cdcusttar_m2
end type
type dw_4 from datawindow within w_cdcusttar_m2
end type
type st_1 from statictext within w_cdcusttar_m2
end type
type cb_1 from commandbutton within w_cdcusttar_m2
end type
type dw_3 from datawindow within w_cdcusttar_m2
end type
type st_amt from statictext within w_cdcusttar_m2
end type
type cbx_autosave from checkbox within w_cdcusttar_m2
end type
type st_time from statictext within w_cdcusttar_m2
end type
type em_1 from editmask within w_cdcusttar_m2
end type
type cbx_opeom from checkbox within w_cdcusttar_m2
end type
type cb_2 from commandbutton within w_cdcusttar_m2
end type
type cb_3 from commandbutton within w_cdcusttar_m2
end type
type dw_5 from datawindow within w_cdcusttar_m2
end type
type cb_open from commandbutton within w_cdcusttar_m2
end type
type cb_close from commandbutton within w_cdcusttar_m2
end type
type st_vertical from u_splitbar_vertical within w_cdcusttar_m2
end type
type st_horizontal from u_splitbar_horizontal within w_cdcusttar_m2
end type
type st_2 from statictext within w_cdcusttar_m2
end type
end forward

global type w_cdcusttar_m2 from w_inheritance
integer width = 4768
integer height = 2544
string title = "거래처 목표관리(년월별)(w_cdcusttar_m2)"
st_7 st_7
dw_4 dw_4
st_1 st_1
cb_1 cb_1
dw_3 dw_3
st_amt st_amt
cbx_autosave cbx_autosave
st_time st_time
em_1 em_1
cbx_opeom cbx_opeom
cb_2 cb_2
cb_3 cb_3
dw_5 dw_5
cb_open cb_open
cb_close cb_close
st_vertical st_vertical
st_horizontal st_horizontal
st_2 st_2
end type
global w_cdcusttar_m2 w_cdcusttar_m2

type variables
public string is_custno,is_custname
st_print i_print
datawindowchild idwc_cust
datawindowchild idwc_user
datawindowchild idwc_cust_name
string is_select, is_where, is_clause, is_select1, is_dwsql
string is_cust_no, is_dovcsql, is_teamsql, is_mansql, is_salesman
DateTime id_time
end variables

forward prototypes
public subroutine wf_protect (long ll_mon)
public subroutine wf_magam ()
end prototypes

public subroutine wf_protect (long ll_mon);// cust_aim_mod_01
choose case ll_mon
   case 1
		dw_4.object.coll_01.tabsequence = 0
      dw_4.object.cust_aim_del_01.tabsequence = 0
   case 2
      dw_4.object.coll_02.tabsequence = 0
      dw_4.object.cust_aim_del_02.tabsequence = 0
   case 3
      dw_4.object.coll_03.tabsequence = 0
      dw_4.object.cust_aim_del_03.tabsequence = 0
   case 4
      dw_4.object.coll_04.tabsequence = 0
      dw_4.object.cust_aim_del_04.tabsequence = 0
   case 5
      dw_4.object.coll_05.tabsequence = 0
      dw_4.object.cust_aim_del_05.tabsequence = 0
   case 6
      dw_4.object.coll_06.tabsequence = 0
      dw_4.object.cust_aim_del_06.tabsequence = 0
   case 7
      dw_4.object.coll_07.tabsequence = 0
      dw_4.object.cust_aim_del_07.tabsequence = 0
   case 8
//      dw_4.object.cust_aim_mon_08.tabsequence = 0
      dw_4.object.coll_08.tabsequence = 0
      dw_4.object.cust_aim_del_08.tabsequence = 0
   case 9
      dw_4.object.coll_09.tabsequence = 0
      dw_4.object.cust_aim_del_09.tabsequence = 0
   case 10
      dw_4.object.coll_10.tabsequence = 0
      dw_4.object.cust_aim_del_10.tabsequence = 0
   case 11
      dw_4.object.coll_11.tabsequence = 0
      dw_4.object.cust_aim_del_11.tabsequence = 0
   case 12
      dw_4.object.coll_12.tabsequence = 0
      dw_4.object.cust_aim_del_12.tabsequence = 0
end choose



end subroutine

public subroutine wf_magam ();// 마감체크
string ls_yyyymm, ls_magam

ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
if ls_magam = "Y" or ls_yyyymm < "201301" then	// 마감
	em_1.backcolor = rgb(255, 0, 0)
	pb_insert.enabled = false
	pb_save.enabled   = false
	dw_3.enabled      = false
	cb_close.enabled  = false
	cb_open.enabled   = true
else							// 해제
	em_1.backcolor = rgb(255, 255, 255)
	pb_insert.enabled = true
	pb_save.enabled   = true
	dw_3.enabled      = true
	cb_close.enabled  = true
	cb_open.enabled   = false
end if


end subroutine

on w_cdcusttar_m2.create
int iCurrent
call super::create
this.st_7=create st_7
this.dw_4=create dw_4
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_3=create dw_3
this.st_amt=create st_amt
this.cbx_autosave=create cbx_autosave
this.st_time=create st_time
this.em_1=create em_1
this.cbx_opeom=create cbx_opeom
this.cb_2=create cb_2
this.cb_3=create cb_3
this.dw_5=create dw_5
this.cb_open=create cb_open
this.cb_close=create cb_close
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_7
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_amt
this.Control[iCurrent+7]=this.cbx_autosave
this.Control[iCurrent+8]=this.st_time
this.Control[iCurrent+9]=this.em_1
this.Control[iCurrent+10]=this.cbx_opeom
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.dw_5
this.Control[iCurrent+14]=this.cb_open
this.Control[iCurrent+15]=this.cb_close
this.Control[iCurrent+16]=this.st_vertical
this.Control[iCurrent+17]=this.st_horizontal
this.Control[iCurrent+18]=this.st_2
end on

on w_cdcusttar_m2.destroy
call super::destroy
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_3)
destroy(this.st_amt)
destroy(this.cbx_autosave)
destroy(this.st_time)
destroy(this.em_1)
destroy(this.cbx_opeom)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.dw_5)
destroy(this.cb_open)
destroy(this.cb_close)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_3 )
st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_3 )
st_horizontal.of_set_bottomobject( dw_4 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////

string ls_date, ls_yyyymm, ls_mon, ls_magam

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_5.visible = false
//pb_print.visible = false
dw_2.insertrow(0)

dw_2.object.sale_id[1] = gs_userid
st_1.text = gs_username

em_1.text = string(today(),'yyyy/mm/dd')
dw_3.reset()

ls_date   = em_1.text
ls_mon    = MidA(em_1.text,6,2)
ls_yyyymm = LeftA(ls_date, 7)

dw_5.retrieve( ls_yyyymm )	// 수금상세 조회

ls_date   = ls_yyyymm + "/01" + " 00:00:00"
SELECT TOP 1 :ls_date  INTO :id_time FROM LOGIN;	// DateTime(Today(), Now())

st_time.text = LeftA(ls_date,10)
//DateTime ld_time
//SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;
//this.object.sys_date[1] = ld_time // DateTime(Today(), Now())

///////////////////////////////////////////////////////////////////
// cust_aim table에 custaim_magam trigger를 생성
///////////////////////////////////////////////////////////////////
cb_open.visible  = false		// 해제
cb_close.visible = false		// 마감

if GF_PERMISSION('거래처_목표관리(년월별)', gs_userid) = 'Y' then
	cb_open.visible  = true
	cb_close.visible = true
end if

// 조회년월 마감 데이터 생성
ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
if IsNumber( ls_yyyymm ) then
	if ls_yyyymm >= "201301" then
		SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
		if SQLCA.sqlcode = 100 then
			INSERT INTO cust_aim_magam ( yyyymm, magam_yn, reg_dt, reg_userid ) 
			VALUES ( :ls_yyyymm, 'N', getdate(), :gs_userid );
			COMMIT;	
		end if	
	end if
end if



dw_2.settransobject(sqlca)	// 담당자별 거래처
dw_2.insertrow(1)

dw_2.getchild('sale_id',idwc_user)
idwc_user.insertrow(1)

idwc_user.setitem(1,'customer_salesman', gs_userid)
idwc_user.setitem(1,'login_user_name', gs_username)

idwc_user.accepttext()
dw_2.object.sale_id[1] = gs_userid	

if GF_Permission("판매관리_입력", gs_userid) = "Y" or GF_Permission("판매관리_입력(부분)", gs_userid) = "Y" then
	
	dw_2.enabled = true
	
else
		
	dw_2.enabled = false
	
end  if

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_3.x      = st_vertical.x + st_vertical.width
dw_3.width  = newwidth  - dw_3.x - gb_2.x

st_horizontal.y      = dw_3.y + dw_3.height
st_horizontal.width  = dw_3.width

dw_4.width  = newwidth  - dw_4.x - gb_2.x
dw_4.height = newheight - dw_4.y - gb_2.x



end event

type pb_save from w_inheritance`pb_save within w_cdcusttar_m2
integer x = 3611
integer y = 48
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
long    ll_row,  ll_chk
decimal lr_cash, lr_cash1, lr_bill, lr_bill1, lr_setoff, lr_setoff1
string  ls_custno, ls_custno1, ls_bigo, ls_bigo1
////////////////////////////////////////////////////////////////////////////
// 수금상세 내역
////////////////////////////////////////////////////////////////////////////

dw_3.accepttext()
dw_4.accepttext()

// 마감체크
string ls_yyyymm, ls_magam

ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
if ls_magam = "Y" or ls_yyyymm < "201301" then	// 마감
	MessageBox("확인","거래처 목표관리(년월별)가 마감 되었습니다.",exclamation!)
	RETURN
end if

ls_custno1   = dw_4.object.cust_aim_cust_code[dw_4.getrow()]
if dw_3.rowcount() < 1 then
	ls_custno = ls_custno1
else
	ls_custno = dw_3.object.cust_no[1]
end if

if ls_custno <> ls_custno1 then 
	MessageBox("확인","수금목표 거래처와 수금상세 거래처가 틀립니다.",exclamation!)
	RETURN
end if

if wf_update1(dw_4,'Y') = false then RETURN

l_status = dw_3.getitemstatus(1, 0, primary!)
if l_status = notmodified! then
	ll_chk     = 0
	for ll_row = 1 to 5
		lr_cash    = dw_3.object.cash[ll_row]
		lr_cash1   = dw_3.object.cash1[ll_row]
		lr_bill    = dw_3.object.bill[ll_row]
		lr_bill1   = dw_3.object.bill1[ll_row]
		lr_setoff  = dw_3.object.setoff[ll_row]
		ls_bigo    = dw_3.object.bigo[ll_row]
		ls_bigo1   = dw_3.object.bigo1[ll_row]
		if lr_cash   <> lr_cash1   then ll_chk = ll_chk + 1
		if lr_bill   <> lr_bill1   then ll_chk = ll_chk + 1
		if lr_setoff <> lr_setoff1 then ll_chk = ll_chk + 1
		if ls_bigo   <> ls_bigo1   then ll_chk = ll_chk + 1
	next
	if ll_chk > 0 then
		if cbx_autosave.checked = true then	 // 상세내역 자동저장
			if wf_update1(dw_3,"N") = false then
				MessageBox("오류dw_3","수금상세 저장중 오류가 발생했습니다.",exclamation!)
				RETURN
			end if		
		else
			if MessageBox("확인","수정한 내용을 저장 하시겠습니까?", Exclamation!, yesno!, 1) = 1 then
				if wf_update1(dw_3,"N") = false then
					MessageBox("오류dw_3","수금상세 저장중 오류가 발생했습니다.",exclamation!)
					RETURN
				end if		
			else
				return -1
			end if
		end if
	end if
else
	ll_chk     = 0
	if dw_3.rowcount() > 0 then
		for ll_row = 1 to 5
			ls_custno  = dw_3.object.cust_no[ll_row]
			if ls_custno = "" then ll_chk = ll_chk + 1
		next
		
		if ll_chk > 0 then
		else
			if wf_update1(dw_3,"N") = false then
				MessageBox("오류dw_3","수금상세 저장중 오류가 발생했습니다.",exclamation!)
				RETURN
			end if		
		end if
	end if
end if
////////////////////////////////////////////////////////////////////////////

end event

type dw_1 from w_inheritance`dw_1 within w_cdcusttar_m2
string tag = "d_custddw_c"
integer x = 32
integer y = 404
integer width = 1381
integer height = 2004
string dataobject = "d_cust_aim2_custlist_r"
boolean hscrollbar = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long ll_row
//string ls_custno
//
//ll_row = wf_rowfocuschange(dw_1,"N")
//if ll_row < 1 then
//	return
//end if
//dw_1.accepttext()
//dw_2.accepttext()
//ls_custno = this.object.cust_no[ll_row]
//if isnull(ls_custno) or ls_custno = "" then
//	dw_1.object.cust_no[ll_row] = is_custno
//	dw_1.object.cust_name[ll_row] = is_custname
//else
//	dw_2.retrieve(ls_custno)
//end if
end event

event dw_1::itemchanged;//
datawindowchild ldwc_cust
string ls_cust_no, ls_cust_name

dw_4.reset()
choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no   = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		ls_cust_name = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_name")
		this.object.cust_name[1] = ls_cust_name
		
	case 'cust_name'
		this.getchild("cust_name", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		this.object.cust_no[1] = ls_cust_no
end choose

pb_retrieve.triggerevent(clicked!)

end event

type st_title from w_inheritance`st_title within w_cdcusttar_m2
integer y = 24
integer width = 1632
integer height = 136
string text = "거래처 목표관리(년월별)"
end type

type st_tips from w_inheritance`st_tips within w_cdcusttar_m2
end type

type pb_compute from w_inheritance`pb_compute within w_cdcusttar_m2
boolean visible = false
integer x = 2222
integer y = 48
integer taborder = 110
string disabledname = "c:\bmp\computr3.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcusttar_m2
boolean visible = false
integer x = 2030
integer y = 48
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdcusttar_m2
integer x = 3803
integer y = 48
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcusttar_m2
integer x = 3419
integer y = 48
integer taborder = 130
string picturename = "CrossTab!"
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_4.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_4.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_4.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcusttar_m2
boolean visible = false
integer x = 2427
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdcusttar_m2
boolean visible = false
integer x = 1947
integer y = 44
integer taborder = 150
end type

event pb_delete::clicked;call super::clicked;string ls_custno

if dw_2.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

// 마감체크
string ls_yyyymm, ls_magam

ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
if ls_magam = "Y" or ls_yyyymm < "201301" then	// 마감
	MessageBox("확인","거래처 목표관리(년월별)가 마감 되었습니다.",exclamation!)
	RETURN
end if


dw_1.accepttext()
dw_2.accepttext()

ls_custno = dw_1.object.cust_no[dw_1.getrow()]
if ls_custno = dw_2.object.cust_no[dw_2.getrow()] then
	dw_2.deleterow(0)
	wf_update1(dw_2,"Y")
   dw_1.deleterow(dw_1.getrow())
else
	dw_2.deleterow(0)
	dw_2.retrieve(ls_custno)
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdcusttar_m2
integer x = 3232
integer y = 48
integer taborder = 170
integer weight = 400
end type

event pb_insert::clicked;string ls_cust_no, ls_date, ls_year, ls_tmpid, ls_cust_name, ls_yyyymm, ls_mon
long   ll_year
long   ll_row, ll_dw1row, ll_y, ll_chk

ll_dw1row = dw_1.getrow()
if ll_dw1row < 1 then return

dw_1.scrolltorow(ll_dw1row)
ls_cust_no   = dw_1.object.cust_no[ll_dw1row] 
ls_cust_name = dw_1.object.cust_name[ll_dw1row] 
ls_tmpid     = dw_1.object.id[ll_dw1row] 

if isnull(ls_cust_no) or ls_cust_no = '' or isnull(ls_tmpid) or ls_tmpid <> '미등록' then
	messagebox("확인","좌측의 미등록 판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if isnull(em_1.text) or em_1.text = "" then
	messagebox("확인","해당년/월을 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

// 마감체크
string ls_magam

ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
if ls_magam = "Y" or ls_yyyymm < "201301" then	// 마감
	MessageBox("확인","거래처 목표관리(년월별)가 마감 되었습니다.",exclamation!)
	RETURN
end if


ls_date = em_1.text
ll_year = long(LeftA(ls_date, 4))
ls_date = LeftA(ls_date, 4) + "/01/01"

long ll_aimcnt
SELECT count(*) INTO :ll_aimcnt FROM cust_aim
 WHERE cust_code = :ls_cust_no   AND datepart(year,cust_aim.tar_year) = :ll_year;

if ll_aimcnt > 0 then return
	
//dw_4.reset()
ll_row = dw_4.insertrow(0)
dw_4.scrolltorow(ll_row)
//ll_row = dw_4.rowcount()
 
dw_4.object.cust_aim_cust_code[ll_row] = ls_cust_no
dw_4.object.customer_cust_name[ll_row] = ls_cust_name
dw_4.object.cust_aim_tar_year[ll_row]  = datetime( date(ls_date) )

// 수금상세
ls_date   = em_1.text + "/01"
ls_yyyymm = LeftA(ls_date, 7)
ls_mon    = MidA(ls_date,6,2)

if isnull(ls_yyyymm) or ls_yyyymm = "" then
	em_1.setfocus()
	RETURN
end if

ll_row = dw_3.retrieve( ls_cust_no, ls_date )	// 수금상세 조회
if ll_row < 1 then
	for ll_y = 1 to 5
		dw_3.insertrow(0)								   	// 5행 추가
		dw_3.object.cust_no[ll_y]   = ls_cust_no		// 거래처
		dw_3.object.cust_name[ll_y] = ls_cust_name	// 거래처명
		dw_3.object.tar_year[ll_y]  = id_time			// 수금년도
		dw_3.object.weeks[ll_y]     = ll_y				// 주차
		dw_3.object.bigo[ll_y]      = ""					// 비고
	next
	wf_update1(dw_3,'N')
end if

dw_3.scrolltorow(1)
dw_3.setcolumn("coll")
dw_3.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcusttar_m2
integer x = 3040
integer y = 48
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_year, ls_mon, ls_saleid
long   ll_year, ll_mon, ll_row

ls_date = em_1.text
ls_year = LeftA(em_1.text,4)
ls_mon  = MidA(em_1.text,6,2)
ll_year = long(ls_year)
ll_mon  = long(ls_mon)

dw_3.reset()		// 주간목표
dw_2.accepttext()

ls_saleid = dw_2.object.sale_id[1]
if isnull(ls_saleid) or ls_saleid = "" then
	MessageBox("확인","영업사원을 선택하세요.",exclamation!)
	RETURN
end if
dw_1.retrieve( ls_saleid, ll_year )		// 담당자 거래처리스트 

dw_4.setredraw(false)
dw_4.object.cust_aim_tar_year.visible = false
// 매출목표
dw_4.object.inv_01.visible = false
dw_4.object.inv_02.visible = false
dw_4.object.inv_03.visible = false
dw_4.object.inv_04.visible = false
dw_4.object.inv_05.visible = false
dw_4.object.inv_06.visible = false
dw_4.object.inv_07.visible = false
dw_4.object.inv_08.visible = false
dw_4.object.inv_09.visible = false
dw_4.object.inv_10.visible = false
dw_4.object.inv_11.visible = false
dw_4.object.inv_12.visible = false
// 매출수정목표
dw_4.object.cust_aim_mod_01.visible = false
dw_4.object.cust_aim_mod_02.visible = false
dw_4.object.cust_aim_mod_03.visible = false
dw_4.object.cust_aim_mod_04.visible = false
dw_4.object.cust_aim_mod_05.visible = false
dw_4.object.cust_aim_mod_06.visible = false
dw_4.object.cust_aim_mod_07.visible = false
dw_4.object.cust_aim_mod_08.visible = false
dw_4.object.cust_aim_mod_09.visible = false
dw_4.object.cust_aim_mod_10.visible = false
dw_4.object.cust_aim_mod_11.visible = false
dw_4.object.cust_aim_mod_12.visible = false
// 매출실적
dw_4.object.opeom_inv_01.visible = false
dw_4.object.opeom_inv_02.visible = false
dw_4.object.opeom_inv_03.visible = false
dw_4.object.opeom_inv_04.visible = false
dw_4.object.opeom_inv_05.visible = false
dw_4.object.opeom_inv_06.visible = false
dw_4.object.opeom_inv_07.visible = false
dw_4.object.opeom_inv_08.visible = false
dw_4.object.opeom_inv_09.visible = false
dw_4.object.opeom_inv_10.visible = false
dw_4.object.opeom_inv_11.visible = false
dw_4.object.opeom_inv_12.visible = false
// %
dw_4.object.com_inv_1.visible = false
dw_4.object.com_inv_2.visible = false
dw_4.object.com_inv_3.visible = false
dw_4.object.com_inv_4.visible = false
dw_4.object.com_inv_5.visible = false
dw_4.object.com_inv_6.visible = false
dw_4.object.com_inv_7.visible = false
dw_4.object.com_inv_8.visible = false
dw_4.object.com_inv_9.visible = false
dw_4.object.com_inv_10.visible = false
dw_4.object.com_inv_11.visible = false
dw_4.object.com_inv_12.visible = false
// 수정목표
dw_4.object.coll_01.visible = false
dw_4.object.coll_02.visible = false
dw_4.object.coll_03.visible = false
dw_4.object.coll_04.visible = false
dw_4.object.coll_05.visible = false
dw_4.object.coll_06.visible = false
dw_4.object.coll_07.visible = false
dw_4.object.coll_08.visible = false
dw_4.object.coll_09.visible = false
dw_4.object.coll_10.visible = false
dw_4.object.coll_11.visible = false
dw_4.object.coll_12.visible = false
// 수금수정
dw_4.object.cust_aim_del_01.visible = false
dw_4.object.cust_aim_del_02.visible = false
dw_4.object.cust_aim_del_03.visible = false
dw_4.object.cust_aim_del_04.visible = false
dw_4.object.cust_aim_del_05.visible = false
dw_4.object.cust_aim_del_06.visible = false
dw_4.object.cust_aim_del_07.visible = false
dw_4.object.cust_aim_del_08.visible = false
dw_4.object.cust_aim_del_09.visible = false
dw_4.object.cust_aim_del_10.visible = false
dw_4.object.cust_aim_del_11.visible = false
dw_4.object.cust_aim_del_12.visible = false
// 수금실적
dw_4.object.opeom_coll_01.visible = false
dw_4.object.opeom_coll_02.visible = false
dw_4.object.opeom_coll_03.visible = false
dw_4.object.opeom_coll_04.visible = false
dw_4.object.opeom_coll_05.visible = false
dw_4.object.opeom_coll_06.visible = false
dw_4.object.opeom_coll_07.visible = false
dw_4.object.opeom_coll_08.visible = false
dw_4.object.opeom_coll_09.visible = false
dw_4.object.opeom_coll_10.visible = false
dw_4.object.opeom_coll_11.visible = false
dw_4.object.opeom_coll_12.visible = false
// %
dw_4.object.com_coll_1.visible = false
dw_4.object.com_coll_2.visible = false
dw_4.object.com_coll_3.visible = false
dw_4.object.com_coll_4.visible = false
dw_4.object.com_coll_5.visible = false
dw_4.object.com_coll_6.visible = false
dw_4.object.com_coll_7.visible = false
dw_4.object.com_coll_8.visible = false
dw_4.object.com_coll_9.visible = false
dw_4.object.com_coll_10.visible = false
dw_4.object.com_coll_11.visible = false
dw_4.object.com_coll_12.visible = false
// 
dw_4.object.opeom_balbf_amount.visible = false
dw_4.object.bal_1.visible  = false
dw_4.object.bal_2.visible  = false
dw_4.object.bal_3.visible  = false
dw_4.object.bal_4.visible  = false
dw_4.object.bal_5.visible  = false
dw_4.object.bal_6.visible  = false
dw_4.object.bal_7.visible  = false
dw_4.object.bal_8.visible  = false
dw_4.object.bal_9.visible  = false
dw_4.object.bal_10.visible = false
dw_4.object.bal_11.visible = false
dw_4.object.bal_12.visible = false
//전략제품
dw_4.object.special_01.visible  	= false
dw_4.object.special_02.visible  	= false
dw_4.object.special_03.visible  	= false
dw_4.object.special_04.visible  	= false
dw_4.object.special_05.visible  	= false
dw_4.object.special_06.visible  	= false
dw_4.object.special_07.visible  	= false
dw_4.object.special_08.visible  	= false
dw_4.object.special_09.visible	= false
dw_4.object.special_10.visible	= false
dw_4.object.special_11.visible 	= false
dw_4.object.special_12.visible 	= false

choose case ll_mon
	case 1
		dw_4.object.inv_01.visible          = true
		dw_4.object.cust_aim_mod_01.visible = true
		dw_4.object.special_01.visible  		= true		
		dw_4.object.opeom_inv_01.visible    = true
		dw_4.object.com_inv_1.visible       = true
		dw_4.object.coll_01.visible         = true
		dw_4.object.cust_aim_del_01.visible = true
		dw_4.object.opeom_coll_01.visible   = true
		dw_4.object.com_coll_1.visible      = true
		dw_4.object.bal_1.visible           = true
	case 2
		dw_4.object.inv_02.visible          = true
		dw_4.object.cust_aim_mod_02.visible = true
		dw_4.object.special_02.visible  		= true		
		dw_4.object.opeom_inv_02.visible    = true
		dw_4.object.com_inv_2.visible       = true
		dw_4.object.coll_02.visible         = true
		dw_4.object.cust_aim_del_02.visible = true
		dw_4.object.opeom_coll_02.visible   = true
		dw_4.object.com_coll_2.visible      = true
		dw_4.object.bal_2.visible           = true
	case 3
		dw_4.object.inv_03.visible          = true
		dw_4.object.cust_aim_mod_03.visible = true
		dw_4.object.special_03.visible  		= true		
		dw_4.object.opeom_inv_03.visible    = true
		dw_4.object.com_inv_3.visible       = true
		dw_4.object.coll_03.visible         = true
		dw_4.object.cust_aim_del_03.visible = true
		dw_4.object.opeom_coll_03.visible   = true
		dw_4.object.com_coll_3.visible      = true
		dw_4.object.bal_3.visible           = true
	case 4
		dw_4.object.inv_04.visible          = true
		dw_4.object.cust_aim_mod_04.visible = true
		dw_4.object.special_04.visible  		= true						
		dw_4.object.opeom_inv_04.visible    = true
		dw_4.object.com_inv_4.visible       = true
		dw_4.object.coll_04.visible         = true
		dw_4.object.cust_aim_del_04.visible = true
		dw_4.object.opeom_coll_04.visible   = true
		dw_4.object.com_coll_4.visible      = true
		dw_4.object.bal_4.visible           = true
	case 5
		dw_4.object.inv_05.visible          = true
		dw_4.object.cust_aim_mod_05.visible = true
		dw_4.object.special_05.visible  		= true		
		dw_4.object.opeom_inv_05.visible    = true
		dw_4.object.com_inv_5.visible       = true
		dw_4.object.coll_05.visible         = true
		dw_4.object.cust_aim_del_05.visible = true
		dw_4.object.opeom_coll_05.visible   = true
		dw_4.object.com_coll_5.visible      = true
		dw_4.object.bal_5.visible           = true
	case 6
		dw_4.object.inv_06.visible          = true
		dw_4.object.cust_aim_mod_06.visible = true
		dw_4.object.special_06.visible  		= true		
		dw_4.object.opeom_inv_06.visible    = true
		dw_4.object.com_inv_6.visible       = true
		dw_4.object.coll_06.visible         = true
		dw_4.object.cust_aim_del_06.visible = true
		dw_4.object.opeom_coll_06.visible   = true
		dw_4.object.com_coll_6.visible      = true
		dw_4.object.bal_6.visible           = true
	case 7
		dw_4.object.inv_07.visible          = true
		dw_4.object.cust_aim_mod_07.visible = true
		dw_4.object.special_07.visible  		= true						
		dw_4.object.opeom_inv_07.visible    = true
		dw_4.object.com_inv_7.visible       = true
		dw_4.object.coll_07.visible         = true
		dw_4.object.cust_aim_del_07.visible = true
		dw_4.object.opeom_coll_07.visible   = true
		dw_4.object.com_coll_7.visible      = true
		dw_4.object.bal_7.visible           = true
	case 8
		dw_4.object.inv_08.visible          = true
		dw_4.object.cust_aim_mod_08.visible = true
		dw_4.object.special_08.visible  		= true		
		dw_4.object.opeom_inv_08.visible    = true
		dw_4.object.com_inv_8.visible       = true
		dw_4.object.coll_08.visible         = true
		dw_4.object.cust_aim_del_08.visible = true
		dw_4.object.opeom_coll_08.visible   = true
		dw_4.object.com_coll_8.visible      = true
		dw_4.object.bal_8.visible           = true
	case 9
		dw_4.object.inv_09.visible          = true
		dw_4.object.cust_aim_mod_09.visible = true
		dw_4.object.special_09.visible  		= true
		dw_4.object.opeom_inv_09.visible    = true
		dw_4.object.com_inv_9.visible       = true
		dw_4.object.coll_09.visible         = true
		dw_4.object.cust_aim_del_09.visible = true
		dw_4.object.opeom_coll_09.visible   = true
		dw_4.object.com_coll_9.visible      = true
		dw_4.object.bal_9.visible           = true
	case 10
		dw_4.object.inv_10.visible          = true
		dw_4.object.cust_aim_mod_10.visible = true
		dw_4.object.special_10.visible  		= true
		dw_4.object.opeom_inv_10.visible    = true
		dw_4.object.com_inv_10.visible      = true
		dw_4.object.coll_10.visible         = true
		dw_4.object.cust_aim_del_10.visible = true
		dw_4.object.opeom_coll_10.visible   = true
		dw_4.object.com_coll_10.visible     = true
		dw_4.object.bal_10.visible          = true
	case 11
		dw_4.object.inv_11.visible          = true
		dw_4.object.cust_aim_mod_11.visible = true
		dw_4.object.special_11.visible  		= true	
		dw_4.object.opeom_inv_11.visible    = true
		dw_4.object.com_inv_11.visible      = true
		dw_4.object.coll_11.visible         = true
		dw_4.object.cust_aim_del_11.visible = true
		dw_4.object.opeom_coll_11.visible   = true
		dw_4.object.com_coll_11.visible     = true
		dw_4.object.bal_11.visible          = true
	case 12
		dw_4.object.inv_12.visible          = true
		dw_4.object.cust_aim_mod_12.visible = true
		dw_4.object.special_12.visible  		= true	
		dw_4.object.opeom_inv_12.visible    = true
		dw_4.object.com_inv_12.visible      = true
		dw_4.object.coll_12.visible         = true
		dw_4.object.cust_aim_del_12.visible = true
		dw_4.object.opeom_coll_12.visible   = true
		dw_4.object.com_coll_12.visible     = true
		dw_4.object.bal_12.visible          = true		
end choose

wf_magam()
wf_protect( ll_mon )		// 담당월 수정못하게 함
dw_4.setredraw(true)

ll_row = dw_4.retrieve( ls_saleid, ll_year )

//if ll_row > 0 then
//	dw_4.scrolltorow(1)
//end if
//dw_3.setfocus()


///////////////////////////////////////////////////////////////////////////////
//// 일단 파워빌더에서 DayNumber(date)라는 함수가 있죠
//// Return 값은 요일의 번호입니다. 일요일 - 1, 월요일 - 2.....토요일 - 7
///////////////////////////////////////////////////////////////////////////////
//
// date d_today
// int  i_day, i_daynum, i_dayrow
//
// d_today = today()
//
// //daynum을 얻습니다.
// i_daynum = daynumber(d_today)
//
// //날짜만 얻어 옵니다.
// i_day = integer(string(d_today, 'dd'))
//
// //몇째주인지 계산합니다.
// //같은주는 7로 나누었을때 몫이 항상같도록 해줍니다.
// //잘생각하면 왜 같아지는지 알수 있을겁니다.
// i_dayrow = truncate(((8 - i_daynum) + i_day) / 7 , 0)
// //몫에다 1을 더하면 해당주가 됩니다.
// i_dayrow++
//
// MessageBox('확인', string(today(), 'yyyy/mm/dd') + '는' + string(i_dayrow) + '번째 주입니다.')
//

end event

type gb_3 from w_inheritance`gb_3 within w_cdcusttar_m2
integer x = 1705
integer y = 12
integer width = 1285
integer height = 200
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdcusttar_m2
integer y = 224
integer width = 4654
integer height = 160
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcusttar_m2
integer x = 3008
integer width = 1015
integer height = 200
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdcusttar_m2
integer x = 1426
integer y = 272
integer width = 878
integer height = 96
integer taborder = 80
string dataobject = "d_cdsalesman_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_user_name

choose case dwo.name
	case 'sale_id'
		select isnull(user_name,'') into :ls_user_name
		  from login
		 where user_id = :data;
		st_1.text = ls_user_name
end choose
		
end event

event dw_2::rowfocuschanged;call super::rowfocuschanged;//
//pb_retrieve.triggerevent(clicked!)

end event

type st_7 from statictext within w_cdcusttar_m2
integer x = 302
integer y = 280
integer width = 315
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_cdcusttar_m2
integer x = 1477
integer y = 1140
integer width = 3209
integer height = 1268
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cust_aim2_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
long     ll_row,  ll_y,      ll_chk
string   ls_cust, ls_custnm, ls_yyyymm, ls_date, ls_mon
DateTime ld_time, ld_timechk

if currentrow < 1 or currentrow > this.rowcount() then return

dw_3.AcceptText()

ls_date   = em_1.text + "/01"
ls_yyyymm = LeftA(ls_date, 7)
ls_mon    = MidA(ls_date,6,2)

if isnull(ls_yyyymm) or ls_yyyymm = "" then
	em_1.setfocus()
	RETURN
end if

//ls_date = ls_yyyymm + "/01" + " 00:00:00"
//SELECT TOP 1 :ls_date  INTO :ld_time FROM LOGIN;	// DateTime(Today(), Now())

id_time      = datetime(date(ls_date))
st_time.text = string(id_time)


ls_cust   = this.object.cust_aim_cust_code[currentrow]
ls_custnm = this.object.customer_cust_name[currentrow]
if isnull(ls_cust) or ls_cust = "" then return

if cbx_opeom.checked = true then
	gs_where lstr_where
	lstr_where.str1 = ls_cust
	lstr_where.name = ls_custnm
	OpenWithParm(w_whopeom_w, lstr_where)
end if

///////////////////////////////////////////////////////////////////
// 마감체크
///////////////////////////////////////////////////////////////////
string ls_magam

ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
if ls_magam = "Y" or ls_yyyymm < "201301" then	// 마감
	MessageBox("확인","거래처 목표관리(년월별)가 마감 되었습니다.",exclamation!)
	RETURN
end if
///////////////////////////////////////////////////////////////////

if cbx_autosave.checked = true then	 // 상세내역 자동저장
	if wf_update1(dw_3,"N") = false then
		MessageBox("오류dw_3","수금상세 저장중 오류가 발생했습니다.",exclamation!)
		RETURN
	end if	
end if		

ll_row    = dw_3.retrieve( ls_cust, ls_date )	// 수금상세 조회
if ll_row < 1 then
	for ll_y = 1 to 5
		dw_3.insertrow(0)								   // 5행 추가
		dw_3.object.cust_no[ll_y]   = ls_cust		// 거래처
		dw_3.object.cust_name[ll_y] = ls_custnm	// 거래처명
		dw_3.object.tar_year[ll_y]  = id_time		// 수금년도
		dw_3.object.weeks[ll_y]     = ll_y			// 주차
		dw_3.object.bigo[ll_y]      = ""				// 비고
	next
	
	ll_chk     = 0
	for ll_row = 1 to 5
		ls_cust    = dw_3.object.cust_no[ll_row]
		ld_timechk = dw_3.object.tar_year[ll_row]
		if ls_cust = ""       then ll_chk = ll_chk + 1
		if isnull(ld_timechk) then ll_chk = ll_chk + 1
	next	
end if

dw_3.scrolltorow(1)
dw_3.setcolumn("coll")
dw_3.setfocus()

end event

type st_1 from statictext within w_cdcusttar_m2
integer x = 2304
integer y = 280
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_cdcusttar_m2
integer x = 55
integer y = 268
integer width = 233
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "-->>>"
end type

event clicked;//
dw_1.BringToTop = TRUE

end event

type dw_3 from datawindow within w_cdcusttar_m2
integer x = 1477
integer y = 404
integer width = 3209
integer height = 692
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cust_aim2det_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
decimal lr_amount
long    ll_row,  ll_year, ll_mon
string  ls_date, ls_year, ls_mon, ls_cust

ls_date = em_1.text
ls_year = LeftA(ls_date,4)
ls_mon  = MidA(ls_date,6,2)		// 거래처 수정열
ll_year = long(ls_year)
ll_mon  = long(ls_mon)

ll_row  = dw_4.getrow()			// 거래처 수정행

this.accepttext()

choose case  dwo.name
	case'cash','bill','setoff'
		lr_amount = dw_3.object.tamount[1]
		choose case ll_mon
			case 1
				dw_4.object.cust_aim_del_01[ll_row] = lr_amount
			case 2
				dw_4.object.cust_aim_del_02[ll_row] = lr_amount
			case 3
				dw_4.object.cust_aim_del_03[ll_row] = lr_amount
			case 4
				dw_4.object.cust_aim_del_04[ll_row] = lr_amount
			case 5
				dw_4.object.cust_aim_del_05[ll_row] = lr_amount
			case 6
				dw_4.object.cust_aim_del_06[ll_row] = lr_amount
			case 7
				dw_4.object.cust_aim_del_07[ll_row] = lr_amount
			case 8
				dw_4.object.cust_aim_del_08[ll_row] = lr_amount
			case 9
				dw_4.object.cust_aim_del_09[ll_row] = lr_amount
			case 10
				dw_4.object.cust_aim_del_10[ll_row] = lr_amount
			case 11
				dw_4.object.cust_aim_del_11[ll_row] = lr_amount
			case 12
				dw_4.object.cust_aim_del_12[ll_row] = lr_amount
		end choose
	case 'coll'
		lr_amount = dw_3.object.tcoll[1]
		choose case ll_mon
			case 1
				dw_4.object.coll_01[ll_row] = lr_amount
			case 2
				dw_4.object.coll_02[ll_row] = lr_amount
			case 3
				dw_4.object.coll_03[ll_row] = lr_amount
			case 4
				dw_4.object.coll_04[ll_row] = lr_amount
			case 5
				dw_4.object.coll_05[ll_row] = lr_amount
			case 6
				dw_4.object.coll_06[ll_row] = lr_amount
			case 7
				dw_4.object.coll_07[ll_row] = lr_amount
			case 8
				dw_4.object.coll_08[ll_row] = lr_amount
			case 9
				dw_4.object.coll_09[ll_row] = lr_amount
			case 10
				dw_4.object.coll_10[ll_row] = lr_amount
			case 11
				dw_4.object.coll_11[ll_row] = lr_amount
			case 12
				dw_4.object.coll_12[ll_row] = lr_amount
		end choose
end choose

end event

event itemfocuschanged;//

choose case dwo.name
	case "coll", "cash", "bill", "setoff"
		this.SelectText(1, LenA(GetText()) + 3)
end choose

end event

event editchanged;// 수금상세 내역이 수정되면 "목포관리"도 즉시 반영함
this.accepttext()

end event

event losefocus;//
decimal lr_amt3, lr_amt4
long    ll_row3, ll_row4, ll_year, ll_mon
string  ls_date, ls_year, ls_mon, ls_cust3, ls_cust4

this.accepttext()

ls_date = em_1.text
ls_year = LeftA(ls_date,4)
ls_mon  = MidA(ls_date,6,2)		// 거래처 수정열
ll_year = long(ls_year)
ll_mon  = long(ls_mon)

ll_row3  = dw_3.getrow()			// 수금상세 수정행
if ll_row3 > 0 then ls_cust3 = dw_3.object.cust_no[ll_row3]

ll_row4  = dw_4.getrow()			// 수금목표 선택행
if ll_row4 > 0 then ls_cust4 = dw_4.object.cust_aim_cust_code[ll_row4]

if ll_row4 > 0 then
	choose case ll_mon
		case 1
			lr_amt4 = dw_4.object.cust_aim_del_01[ll_row4]
		case 2
			lr_amt4 = dw_4.object.cust_aim_del_02[ll_row4]
		case 3
			lr_amt4 = dw_4.object.cust_aim_del_03[ll_row4]
		case 4
			lr_amt4 = dw_4.object.cust_aim_del_04[ll_row4]
		case 5
			lr_amt4 = dw_4.object.cust_aim_del_05[ll_row4]
		case 6
			lr_amt4 = dw_4.object.cust_aim_del_06[ll_row4]
		case 7
			lr_amt4 = dw_4.object.cust_aim_del_07[ll_row4]
		case 8
			lr_amt4 = dw_4.object.cust_aim_del_08[ll_row4]
		case 9
			lr_amt4 = dw_4.object.cust_aim_del_09[ll_row4]
		case 10
			lr_amt4 = dw_4.object.cust_aim_del_10[ll_row4]
		case 11
			lr_amt4 = dw_4.object.cust_aim_del_11[ll_row4]
		case 12
			lr_amt4 = dw_4.object.cust_aim_del_12[ll_row4]
	end choose
end if

debugbreak()
// 수금상세, 수금수정 확인
if ls_cust3 = ls_cust4 then
	if ll_row3 > 0 then lr_amt3 = dw_3.object.tamount[1]
	
	if lr_amt3 = lr_amt4 then
		
	else
		MessageBox("확인",ls_cust3 + "~n~n" + ls_cust4 + "~n~n" + &
		           "수금상세 내역이 당월 수금수정에 반영되지 않았습니다. 확인바랍니다.")
		
		choose case ll_mon
			case 1
				dw_4.object.cust_aim_del_01[ll_row4] = lr_amt3
			case 2
				dw_4.object.cust_aim_del_02[ll_row4] = lr_amt3
			case 3
				dw_4.object.cust_aim_del_03[ll_row4] = lr_amt3
			case 4
				dw_4.object.cust_aim_del_04[ll_row4] = lr_amt3
			case 5
				dw_4.object.cust_aim_del_05[ll_row4] = lr_amt3
			case 6
				dw_4.object.cust_aim_del_06[ll_row4] = lr_amt3
			case 7
				 dw_4.object.cust_aim_del_07[ll_row4] = lr_amt3
			case 8
				 dw_4.object.cust_aim_del_08[ll_row4] = lr_amt3
			case 9
				 dw_4.object.cust_aim_del_09[ll_row4] = lr_amt3
			case 10
				 dw_4.object.cust_aim_del_10[ll_row4] = lr_amt3
			case 11
				 dw_4.object.cust_aim_del_11[ll_row4] = lr_amt3
			case 12
				 dw_4.object.cust_aim_del_12[ll_row4] = lr_amt3
		end choose		
		
	end if
else
	MessageBox("확인",ls_cust3 + "~n~n"+ls_cust4)
end if

end event

type st_amt from statictext within w_cdcusttar_m2
integer x = 2775
integer y = 280
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_autosave from checkbox within w_cdcusttar_m2
integer x = 3255
integer y = 280
integer width = 823
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처변경시 자동저장"
boolean checked = true
end type

type st_time from statictext within w_cdcusttar_m2
boolean visible = false
integer x = 1765
integer y = 88
integer width = 800
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_cdcusttar_m2
integer x = 626
integer y = 280
integer width = 261
integer height = 76
integer taborder = 20
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
string mask = "yyyy/mm"
boolean autoskip = true
string displaydata = ""
end type

event modified;//
string ls_date

ls_date = LeftA(em_1.text,7) + "/01"

if dw_1.rowcount() > 0 then
	dw_1.reset()
	dw_3.reset()
	dw_4.reset()
end if

id_time = datetime( date(ls_date) )
st_time.text = LeftA(ls_date,10)

pb_retrieve.triggerevent( clicked! )

end event

type cbx_opeom from checkbox within w_cdcusttar_m2
integer x = 4105
integer y = 280
integer width = 558
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "여신현황 조회"
end type

type cb_2 from commandbutton within w_cdcusttar_m2
integer x = 1728
integer y = 52
integer width = 608
integer height = 140
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처마스터 관리"
end type

event clicked;//
string ls_custno, ls_custnm

if dw_4.getrow() < 1 then RETURN

ls_custno = dw_4.object.cust_aim_cust_code[dw_4.getrow()]
ls_custnm = dw_4.object.customer_cust_name[dw_4.getrow()]

gs_print_control = "V" + ls_custno
if gf_permission('판매거래처관리open', gs_userid) = 'Y' then
	if IsValid(w_cdcustomer_m) = False then			
		OpenSheet(w_cdcustomer_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
		Parent.ArrangeSheets(Cascade!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
		
		w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
		w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
		w_cdcustomer_m.dw_24.Visible  =  False

		w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
		w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
		w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
		w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
		w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
		w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
		
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
		w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
		w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
		w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
		w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
		w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
		w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
		w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
		w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
		w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
		w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
		w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
		w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
		w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
	
	else
		if MessageBox("확인", "작업중인 판매거래처관리 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
			parent.arrangesheets( Cascade! )
			return
		else
			close(w_cdcustomer_m)
			OpenSheet(w_cdcustomer_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
			Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

			w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
			w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
			w_cdcustomer_m.dw_24.Visible  =  False

			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
			
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
			w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
			w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
			w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
			w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
			w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
			w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
		end if
	end if
else
	OpenSheet(w_cdcustomer_r, parent.parentwindow(), 6, Cascaded!)
	Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

	w_cdcustomer_r.dw_1.object.cust_no[1]   = ls_custno
	w_cdcustomer_r.dw_1.object.cust_name[1] = ls_custnm

	w_cdcustomer_r.tab_1.tabpage_1.dw_5.reset()
	w_cdcustomer_r.tab_1.tabpage_2.dw_4.reset()
	w_cdcustomer_r.tab_1.tabpage_3.dw_6.reset()
	w_cdcustomer_r.tab_1.tabpage_3.dw_7.reset()
	
	w_cdcustomer_r.tab_1.tabpage_1.dw_5.setfocus()
	w_cdcustomer_r.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
	w_cdcustomer_r.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
	w_cdcustomer_r.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
	w_cdcustomer_r.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
	w_cdcustomer_r.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
end if

end event

type cb_3 from commandbutton within w_cdcusttar_m2
integer x = 2354
integer y = 52
integer width = 608
integer height = 140
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수금상세 리스트"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_5.rowcount() > 0 then	// 수금상세 조회
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
										"엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_5.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_5.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
	MessageBox("확인","수금상세 리스트 작업완료.",exclamation!)
else
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",exclamation!)
end if

end event

type dw_5 from datawindow within w_cdcusttar_m2
integer x = 96
integer y = 100
integer width = 178
integer height = 112
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "d_cust_aim2det_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_open from commandbutton within w_cdcusttar_m2
integer x = 1129
integer y = 272
integer width = 206
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해제"
end type

event clicked;// 해제
string ls_yyyymm, ls_magam

debugbreak()
ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
if IsNumber( ls_yyyymm ) then
	SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
	if SQLCA.sqlcode = 100 then
		INSERT INTO cust_aim_magam ( yyyymm, magam_yn, reg_dt, reg_userid ) 
		VALUES ( :ls_yyyymm, 'N', getdate(), :gs_userid );
		COMMIT;	
	else
		UPDATE cust_aim_magam SET magam_yn = 'N' WHERE yyyymm = :ls_yyyymm;
		if SQLCA.SQLCode <> 0 then 
        MessageBox("해제오류", SQLCA.SQLErrText)
		else
			COMMIT;	

			pb_insert.enabled = true
			pb_save.enabled   = true

         em_1.backcolor = rgb(255, 255, 255)
			cb_close.enabled = true
			cb_open.enabled  = false
		end if
	end if	
end if

end event

type cb_close from commandbutton within w_cdcusttar_m2
integer x = 914
integer y = 272
integer width = 210
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "마감"
end type

event clicked;// 마감
string ls_yyyymm, ls_magam

ls_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
if IsNumber( ls_yyyymm ) then
	SELECT magam_yn INTO :ls_magam FROM cust_aim_magam  WHERE yyyymm = :ls_yyyymm;
	if SQLCA.sqlcode = 100 then
		INSERT INTO cust_aim_magam ( yyyymm, magam_yn, reg_dt, reg_userid ) 
		VALUES ( :ls_yyyymm, 'Y', getdate(), :gs_userid );
		COMMIT;	
	else
		UPDATE cust_aim_magam SET magam_yn = 'Y' WHERE yyyymm = :ls_yyyymm;
		if SQLCA.SQLCode <> 0 then 
        MessageBox("마감오류", SQLCA.SQLErrText)
		else
			COMMIT;

			pb_insert.enabled = false
			pb_save.enabled   = false
			
         em_1.backcolor = rgb(255, 0, 0)
			cb_close.enabled = false
			cb_open.enabled  = true
		end if
	end if	
end if

end event

type st_vertical from u_splitbar_vertical within w_cdcusttar_m2
integer x = 1435
integer y = 404
integer height = 2004
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x      = this.x + this.width
st_horizontal.width  = dw_3.width

end event

type st_horizontal from u_splitbar_horizontal within w_cdcusttar_m2
integer x = 1477
integer y = 1112
integer width = 3209
boolean bringtotop = true
end type

type st_2 from statictext within w_cdcusttar_m2
integer x = 4055
integer y = 52
integer width = 901
integer height = 152
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "미등록 업체는 ~'추가~' 버튼 클릭 후 사용하시기 바랍니다."
boolean focusrectangle = false
end type

