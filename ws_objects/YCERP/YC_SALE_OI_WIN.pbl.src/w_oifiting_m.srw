$PBExportHeader$w_oifiting_m.srw
$PBExportComments$부자재출고관리(수주,물품요청)
forward
global type w_oifiting_m from w_inheritance
end type
type cb_3 from commandbutton within w_oifiting_m
end type
type em_1 from editmask within w_oifiting_m
end type
type st_3 from statictext within w_oifiting_m
end type
type ddlb_fld from dropdownlistbox within w_oifiting_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oifiting_m
end type
type st_4 from statictext within w_oifiting_m
end type
type sle_value from singlelineedit within w_oifiting_m
end type
type cb_1 from commandbutton within w_oifiting_m
end type
type cb_2 from commandbutton within w_oifiting_m
end type
type cb_4 from commandbutton within w_oifiting_m
end type
type cb_5 from commandbutton within w_oifiting_m
end type
type dw_6 from datawindow within w_oifiting_m
end type
type dw_5 from datawindow within w_oifiting_m
end type
type cbx_2 from checkbox within w_oifiting_m
end type
type rb_1 from radiobutton within w_oifiting_m
end type
type rb_2 from radiobutton within w_oifiting_m
end type
type rb_3 from radiobutton within w_oifiting_m
end type
type dw_4 from datawindow within w_oifiting_m
end type
type st_2 from statictext within w_oifiting_m
end type
type ddlb_op2 from dropdownlistbox within w_oifiting_m
end type
type sle_value2 from singlelineedit within w_oifiting_m
end type
type cb_7 from commandbutton within w_oifiting_m
end type
type cb_8 from commandbutton within w_oifiting_m
end type
type cb_9 from commandbutton within w_oifiting_m
end type
type cb_10 from commandbutton within w_oifiting_m
end type
type cbx_4 from checkbox within w_oifiting_m
end type
type dw_3 from datawindow within w_oifiting_m
end type
type cbx_3 from checkbox within w_oifiting_m
end type
type cb_6 from commandbutton within w_oifiting_m
end type
type st_1 from statictext within w_oifiting_m
end type
type ddlb_dwtitles2 from dropdownlistbox within w_oifiting_m
end type
type ddlb_fld2 from dropdownlistbox within w_oifiting_m
end type
type cb_11 from commandbutton within w_oifiting_m
end type
type cbx_custscene from checkbox within w_oifiting_m
end type
type gb_4 from groupbox within w_oifiting_m
end type
type pb_del from picturebutton within w_oifiting_m
end type
type dw_7 from datawindow within w_oifiting_m
end type
type cbx_5 from checkbox within w_oifiting_m
end type
type st_5 from statictext within w_oifiting_m
end type
type dw_8 from datawindow within w_oifiting_m
end type
type cbx_6 from checkbox within w_oifiting_m
end type
type cbx_7 from checkbox within w_oifiting_m
end type
type cbx_8 from checkbox within w_oifiting_m
end type
type dw_area from datawindow within w_oifiting_m
end type
type st_6 from statictext within w_oifiting_m
end type
type dw_9 from datawindow within w_oifiting_m
end type
type st_7 from statictext within w_oifiting_m
end type
type st_vertical from u_splitbar_vertical within w_oifiting_m
end type
type st_horizontal from u_splitbar_horizontal within w_oifiting_m
end type
type st_8 from statictext within w_oifiting_m
end type
type em_no from editmask within w_oifiting_m
end type
type cb_find from commandbutton within w_oifiting_m
end type
type cb_sort from commandbutton within w_oifiting_m
end type
type cbx_fit from checkbox within w_oifiting_m
end type
type ddlb_op from dropdownlistbox within w_oifiting_m
end type
type gb_5 from groupbox within w_oifiting_m
end type
type gb_6 from groupbox within w_oifiting_m
end type
end forward

global type w_oifiting_m from w_inheritance
integer width = 5435
integer height = 2628
string title = "거래명세서 출고계획(w_oifiting_m)"
string icon = "Form!"
cb_3 cb_3
em_1 em_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
dw_6 dw_6
dw_5 dw_5
cbx_2 cbx_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_4 dw_4
st_2 st_2
ddlb_op2 ddlb_op2
sle_value2 sle_value2
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
cbx_4 cbx_4
dw_3 dw_3
cbx_3 cbx_3
cb_6 cb_6
st_1 st_1
ddlb_dwtitles2 ddlb_dwtitles2
ddlb_fld2 ddlb_fld2
cb_11 cb_11
cbx_custscene cbx_custscene
gb_4 gb_4
pb_del pb_del
dw_7 dw_7
cbx_5 cbx_5
st_5 st_5
dw_8 dw_8
cbx_6 cbx_6
cbx_7 cbx_7
cbx_8 cbx_8
dw_area dw_area
st_6 st_6
dw_9 dw_9
st_7 st_7
st_vertical st_vertical
st_horizontal st_horizontal
st_8 st_8
em_no em_no
cb_find cb_find
cb_sort cb_sort
cbx_fit cbx_fit
ddlb_op ddlb_op
gb_5 gb_5
gb_6 gb_6
end type
global w_oifiting_m w_oifiting_m

type variables
//
string is_dw
DataWindowChild idwc_area, idwc_accept, idwc_locno
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);//
datetime ld_date
dec    ld_amount
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt, ll_qty
string ls_fitno, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_itemno, ls_item_name, ls_qa, ls_bigo, ls_cnt
int    li_seq_no

DEBUGBREAK()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
ll_line_cnt = 10
ll_pagetot  = dw_3.rowcount()
if mod(dw_3.rowcount(), ll_line_cnt) > 0 then
	ll_pagetot = (dw_3.rowcount() / ll_line_cnt) + 1
else
	ll_pagetot = (dw_3.rowcount() / ll_line_cnt)
end if

for ll_row = 1 to dw_3.rowcount()
	if cbx_fit.checked = true then	// 부자재
		if dw_3.object.get_fitting[ll_row] = "" then CONTINUE
	end if

	if dw_3.object.fit_no[ll_row]      = "" then CONTINUE
	
	if ll_line = 0 then
		ls_fitno      = dw_3.object.fit_no[ll_row]
		ls_cust_name  = dw_3.object.cust_name[ll_row]
	   ls_scene_name = dw_3.object.scene_desc[ll_row]
		
		arg_dw.object.order_no[1]   = ls_fitno
		arg_dw.object.barcode1[1]   = "*" + trim(ls_fitno) + "*"
		arg_dw.object.barcode2[1]   = "*" + trim(ls_fitno) + "*"
		arg_dw.object.cust_name[1]  = ls_cust_name
		arg_dw.object.scene_name[1] = ls_scene_name
		arg_dw.object.pagecnt[1]    = string(ll_pagecnt + 1) + " / " + string(ll_pagetot)
	end if
	
	ls_item_name = dw_3.object.item_name[ll_row]
	ls_qa        = dw_3.object.qa1[ll_row]
	ll_qty       = dw_3.object.ship_qty[ll_row]
   ls_bigo      = dw_3.object.sale_no[ll_row]
   ls_bigo      = LeftA(ls_bigo,2) + RightA(ls_bigo,8)
	
	ll_line    = ll_line + 1

	arg_dw.setitem(1, 'item_name' + string(ll_line,"00"), ls_item_name)
	arg_dw.setitem(1, 'qa'        + string(ll_line,"00"), ls_qa)
	arg_dw.setitem(1, 'qty'       + string(ll_line,"00"), ll_qty)
	arg_dw.setitem(1, 'bigo'      + string(ll_line,"00"), ls_bigo)

	if ll_line = ll_line_cnt then 	// LABEL지 10줄
		ll_line    = 0
		ll_pagecnt = ll_pagecnt + 1
		arg_dw.print()
		arg_dw.reset()
		arg_dw.insertrow(0)
	end if
next

end subroutine

on w_oifiting_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.em_1=create em_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_6=create dw_6
this.dw_5=create dw_5
this.cbx_2=create cbx_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_4=create dw_4
this.st_2=create st_2
this.ddlb_op2=create ddlb_op2
this.sle_value2=create sle_value2
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cbx_4=create cbx_4
this.dw_3=create dw_3
this.cbx_3=create cbx_3
this.cb_6=create cb_6
this.st_1=create st_1
this.ddlb_dwtitles2=create ddlb_dwtitles2
this.ddlb_fld2=create ddlb_fld2
this.cb_11=create cb_11
this.cbx_custscene=create cbx_custscene
this.gb_4=create gb_4
this.pb_del=create pb_del
this.dw_7=create dw_7
this.cbx_5=create cbx_5
this.st_5=create st_5
this.dw_8=create dw_8
this.cbx_6=create cbx_6
this.cbx_7=create cbx_7
this.cbx_8=create cbx_8
this.dw_area=create dw_area
this.st_6=create st_6
this.dw_9=create dw_9
this.st_7=create st_7
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_8=create st_8
this.em_no=create em_no
this.cb_find=create cb_find
this.cb_sort=create cb_sort
this.cbx_fit=create cbx_fit
this.ddlb_op=create ddlb_op
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.sle_value
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_4
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.dw_6
this.Control[iCurrent+13]=this.dw_5
this.Control[iCurrent+14]=this.cbx_2
this.Control[iCurrent+15]=this.rb_1
this.Control[iCurrent+16]=this.rb_2
this.Control[iCurrent+17]=this.rb_3
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.ddlb_op2
this.Control[iCurrent+21]=this.sle_value2
this.Control[iCurrent+22]=this.cb_7
this.Control[iCurrent+23]=this.cb_8
this.Control[iCurrent+24]=this.cb_9
this.Control[iCurrent+25]=this.cb_10
this.Control[iCurrent+26]=this.cbx_4
this.Control[iCurrent+27]=this.dw_3
this.Control[iCurrent+28]=this.cbx_3
this.Control[iCurrent+29]=this.cb_6
this.Control[iCurrent+30]=this.st_1
this.Control[iCurrent+31]=this.ddlb_dwtitles2
this.Control[iCurrent+32]=this.ddlb_fld2
this.Control[iCurrent+33]=this.cb_11
this.Control[iCurrent+34]=this.cbx_custscene
this.Control[iCurrent+35]=this.gb_4
this.Control[iCurrent+36]=this.pb_del
this.Control[iCurrent+37]=this.dw_7
this.Control[iCurrent+38]=this.cbx_5
this.Control[iCurrent+39]=this.st_5
this.Control[iCurrent+40]=this.dw_8
this.Control[iCurrent+41]=this.cbx_6
this.Control[iCurrent+42]=this.cbx_7
this.Control[iCurrent+43]=this.cbx_8
this.Control[iCurrent+44]=this.dw_area
this.Control[iCurrent+45]=this.st_6
this.Control[iCurrent+46]=this.dw_9
this.Control[iCurrent+47]=this.st_7
this.Control[iCurrent+48]=this.st_vertical
this.Control[iCurrent+49]=this.st_horizontal
this.Control[iCurrent+50]=this.st_8
this.Control[iCurrent+51]=this.em_no
this.Control[iCurrent+52]=this.cb_find
this.Control[iCurrent+53]=this.cb_sort
this.Control[iCurrent+54]=this.cbx_fit
this.Control[iCurrent+55]=this.ddlb_op
this.Control[iCurrent+56]=this.gb_5
this.Control[iCurrent+57]=this.gb_6
end on

on w_oifiting_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.cbx_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.ddlb_op2)
destroy(this.sle_value2)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cbx_4)
destroy(this.dw_3)
destroy(this.cbx_3)
destroy(this.cb_6)
destroy(this.st_1)
destroy(this.ddlb_dwtitles2)
destroy(this.ddlb_fld2)
destroy(this.cb_11)
destroy(this.cbx_custscene)
destroy(this.gb_4)
destroy(this.pb_del)
destroy(this.dw_7)
destroy(this.cbx_5)
destroy(this.st_5)
destroy(this.dw_8)
destroy(this.cbx_6)
destroy(this.cbx_7)
destroy(this.cbx_8)
destroy(this.dw_area)
destroy(this.st_6)
destroy(this.dw_9)
destroy(this.st_7)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_8)
destroy(this.em_no)
destroy(this.cb_find)
destroy(this.cb_sort)
destroy(this.cbx_fit)
destroy(this.ddlb_op)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

ddlb_fld2.reset()
ddlb_dwtitles2.reset()
ddlb_dwtitles2.visible = false

//
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA)
dw_9.SetTransObject(SQLCA)

dw_5.Visible = False
dw_6.Visible = False
dw_7.Visible = False
dw_8.visible = false
cbx_8.checked = true		// 오늘

pb_insert.enabled = false
pb_delete.enabled = false
pb_save.enabled   = false

cb_6.enabled = false		// 선택 가져오기
cbx_custscene.enabled = false

em_no.text = "FS"+string(today(),"yyyymmdd")
em_1.text  = string(today(), 'yyyy/mm/dd')

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = gs_area		// 기본값을 변경	
dw_area.accepttext()

/////////////////////////////////
// 접수자
/////////////////////////////////
dw_9.SetTransObject(sqlca)		
dw_9.insertrow(0)  
dw_9.object.accept_user[1] = ""

dw_9.getchild("accept_user", idwc_accept)
//idwc_accept.setredraw(false)
//idwc_accept.settransobject(sqlca)
//idwc_accept.insertrow(1)
//idwc_accept.setitem(1, 'user_id', '')
//idwc_accept.setitem(1, 'user_name', '전체접수자')
//
//idwc_accept.accepttext()
//idwc_accept.setredraw(false)
string ls_locmanager
SELECT loc_manager INTO :ls_locmanager FROM location WHERE loc_no = 'WS00000000';
dw_9.object.accept_user[1]  = ls_locmanager
dw_9.accepttext()


if GF_PERMISSION("거래명세서_출고계획", gs_userid) = 'Y' then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
end if

//if dw_area.event itemchanged(1, dw_area.object.area, gs_area) = 1 then
//	dw_area.event itemerror( 1, dw_area.object.area, gs_area )
//end if

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_4.x

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = dw_1.width

dw_4.y      = st_horizontal.y + st_horizontal.height
dw_4.height = newheight - dw_4.y - gb_4.x

dw_3.y      = dw_2.y + dw_2.height + 14
dw_3.width  = dw_2.width 
dw_3.height = newheight - dw_3.y - gb_4.x 

st_vertical.height = dw_1.height + st_horizontal.height + dw_4.height

end event

type pb_save from w_inheritance`pb_save within w_oifiting_m
integer x = 4974
integer y = 72
integer taborder = 280
end type

event pb_save::clicked;call super::clicked;//
string  ls_area1, ls_fitno, ls_seq, ls_fit_no, ls_fitdate
string  ls_custno, ls_order_no, ls_item_no, ls_qa, ls_prt_yn
long	  ll_row, line, ll_seq_no, ll_dw1row, ll_prev_qty, ll_rec_qty
integer li_seq, li_prt
decimal ld_orderqty, ld_rlseqty, ld_shipqty

// 필터해지
cb_8.triggerevent( clicked! )		

/////////////////////////////
// 상차번호 부여
/////////////////////////////
setpointer(hourglass!)
dw_2.AcceptText()		// FIT
ls_area1   = LeftA(gs_area, 1)							// 사업장
ls_fitno   = dw_2.object.fit_no[1]
if isnull(ls_fitno) OR ls_fitno = "" then
	ls_fitdate = string(dw_2.object.fit_date[1], "yyyymmdd")
	ls_fitno   = "F" + ls_area1 + ls_fitdate + "-" + "%"
	
	SELECT max(fit_no) INTO :ls_fitno  FROM fit WHERE fit_no LIKE :ls_fitno;		
	if isnull(ls_fitno) or ls_fitno = "" then
		ls_fitno = "F" + ls_area1 + ls_fitdate + "-" + "001"
	else														// 12345678901234
		li_seq   = integer(MidA(ls_fitno, 12, 3))	// FS20120131-001
		li_seq   = li_seq + 1
		ls_seq   = "00" + string(li_seq)
		ls_fitno = LeftA(ls_fitno, 11) + RightA(ls_seq, 3)
	end if
else
	ls_custno   = dw_2.object.cust_no[1]
	for ll_row = 1 to dw_3.rowcount()
		if ls_custno <> dw_3.object.cust_no[ll_row] then
			MessageBox("확인","동일한 거래처만 상차 가능합니다.", exclamation!)
			dw_3.scrolltorow( ll_row )
			RETURN
		end if
		
		if isnull( dw_3.object.ship_qty[ll_row] ) or dw_3.object.ship_qty[ll_row] = 0 then
			MessageBox("확인","상차수량은 하나 이상만 처리가능 합니다.(ZERO 처리불가)", exclamation!)
			dw_3.scrolltorow( ll_row )
			RETURN
		end if

		if isnull( dw_3.object.do_no[ll_row] ) then
			ld_orderqty = dw_3.object.order_qty[ll_row]
			ld_rlseqty  = dw_3.object.rlse_qty[ll_row]
			ld_shipqty  = dw_3.object.ship_qty[ll_row]
			if ld_rlseqty + ld_shipqty > ld_orderqty then
				MessageBox("확인","기출수량 + 상차수량이 주문수량 보다 많을 수 없습니다.", exclamation!)
				dw_3.scrolltorow( ll_row )
				RETURN
			end if
		end if
	next
end if
/////////////////////////////

/////////////////////////////
// 상차번호, 순번 부여
/////////////////////////////
dw_2.object.fit_no[1]      = ls_fitno
for ll_row = 1 to dw_3.rowcount()
	dw_3.object.fit_no[ll_row]  = ls_fitno
	dw_3.object.fit_seq[ll_row] = ll_row
next
dw_2.object.sys_date[1] = gf_today()
/////////////////////////////

dw_2.AcceptText()		// FIT
dw_3.AcceptText()		// FITDET
ll_dw1row = dw_1.getrow()

if wf_update2( dw_2, dw_3, "Y" ) = false then
	RETURN
else
	pb_retrieve.triggerevent( clicked! )
	if dw_1.rowcount() >= ll_dw1row then dw_1.scrolltorow( ll_dw1row )
	
//	if MessageBox("확인", "제품상차 라벨출력 하시겠습니까?", Question!, OKCancel!, 1) = 1 then
//		dw_4.reset()			// SALE_RECEIPT
//		
//		string ls_orderno
//		if dw_2.Dataobject = 'd_orsale_jajae' then
//			ls_orderno = dw_2.object.sale_order_no[1]
//		else
//			ls_orderno = dw_2.object.ask_no[1]
//		end if
//		dw_5.Retrieve( ls_orderno )	// 재조회
//					  
//		for ll_row = 1 to dw_5.RowCount()
//			ls_order_no	= dw_5.object.order_no[ll_row]
//			ll_seq_no	= dw_5.object.seq_no[ll_row]
//			ls_item_no	= dw_5.object.item_no[ll_row]
//			ls_qa			= dw_5.object.qa[ll_row]	
//			//ls_prt_yn	= dw_5.object.prt_yn[ll_row]
//			ll_prev_qty	= dw_5.object.prev_qty[ll_row]
//			ll_rec_qty	= dw_5.object.rec_qty[ll_row]
//			
//			if isnull(ll_rec_qty) then ll_rec_qty = 0
//			if ll_rec_qty = 0 then
//			else
//				if isNULL(ll_prev_qty) then ll_prev_qty = 0
//				ll_prev_qty = ll_prev_qty + ll_rec_qty		//이전출고량 = 이전출고량 + 금번출고량
//				
//				dw_4.insertrow(0)	
//				dw_4.object.order_no[ll_row]		= ls_order_no
//				dw_4.object.seq_no[ll_row]			= ll_seq_no
//				dw_4.object.item_no[ll_row]		= ls_item_no
//				dw_4.object.qa[ll_row]				= ls_qa
//				dw_4.object.prt_yn[ll_row]			= "Y"		//ls_prt_yn
//				dw_4.object.prev_qty[ll_row]		= ll_prev_qty
//				dw_4.object.rec_qty[ll_row]		= ll_rec_qty	
//			end if
//		next
//		
//		PrintSetup()
//		wf_print( dw_6 )
//		
//		ls_orderno = dw_6.object.fit_no[1]
//		if isnull(ls_orderno) or ls_orderno = "" then
//			// 10, 20... 페이지 공난출력 방지
//		else
//			dw_6.print()
//		end if
//	end if
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oifiting_m
integer x = 41
integer y = 484
integer width = 2967
integer height = 1352
integer taborder = 340
string dataobject = "d_oifiting_l1"
boolean hsplitscroll = true
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string ls_fitno, ls_cat, ls_area, ls_custno, ls_scene, ls_orderno, ls_askno, ls_seqno
long   ll_row, ll_cnt

dw_4.reset()

if dw_1.rowcount() < 1 then RETURN
if isnull(currentrow) OR currentrow < 1 then RETURN

cb_8.triggerevent( clicked! )		// 필터해지

// 사업장
dw_area.accepttext()
ls_area    = dw_area.object.area[1]

ls_custno  = dw_1.object.cust_no[currentrow]		// 거래처
ls_scene   = dw_1.object.scene_code[currentrow]	// 현장
ls_fitno   = dw_1.object.fit_no[currentrow]		// 계획번호

if isnull(ls_fitno) OR ls_fitno = "" then
else
	dw_2.Retrieve( ls_fitno )
	dw_3.setredraw( false )
	dw_3.Retrieve( ls_fitno )
	dw_3.setredraw( true )
end if

ls_orderno = dw_1.object.order_no[currentrow]	// 수주번호
if isnull(ls_orderno) OR ls_orderno = "" then
else
	dw_4.Retrieve( ls_area, ls_custno, ls_scene, ls_orderno )	// 수주상세
	if dw_4.rowcount() > 0 then
		if dw_4.object.totjanqty[1] = 0 then	// 미출고수량 확인
			//dw_1.object.protectyn[ dw_1.getrow() ] = "Y"		// Protect
			dw_1.object.chk[ dw_1.getrow() ]       = "N"    // 선택안함
		end if	
	end if	
end if

end event

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::itemchanged;call super::itemchanged;//
string ls_area, ls_custno, ls_scenecode, ls_cust, ls_scene, ls_orderno, ls_data
long   ll_row, ll_qty

if isnull(row) OR row < 1 then RETURN

//
dw_area.accepttext()
ls_area = dw_area.object.area[1]

if cbx_custscene.checked = true then	// 거래처, 현장 중복체크
	ls_custno    = dw_1.object.cust_no[row]
	ls_scenecode = dw_1.object.scene_code[row]
	ls_data      = data
	
	choose case dwo.name
		case "chk"
			dw_1.setredraw( false )
			for ll_row = 1 to dw_1.rowcount()
				ls_orderno = dw_1.object.order_no[ll_row]
				ls_cust    = dw_1.object.cust_no[ll_row]
				ls_scene   = dw_1.object.scene_code[ll_row]
				
				if ls_custno = ls_cust AND ls_scenecode = ls_scene then
					dw_1.object.chk[ll_row] = ls_data
				end if
			next
			dw_1.setredraw( true )
	end choose
end if

end event

type st_title from w_inheritance`st_title within w_oifiting_m
integer x = 0
integer y = 0
integer width = 1207
integer height = 140
string text = "부자재출고 관리"
end type

type st_tips from w_inheritance`st_tips within w_oifiting_m
end type

type pb_compute from w_inheritance`pb_compute within w_oifiting_m
boolean visible = false
integer taborder = 360
end type

type pb_print_part from w_inheritance`pb_print_part within w_oifiting_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oifiting_m
integer x = 5166
integer y = 72
integer taborder = 300
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oifiting_m
integer x = 4782
integer y = 72
integer taborder = 270
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
string     ls_orderno

// sale_order_no 수주번호
// ask_no        요청번호

if dw_2.rowcount() < 1 then 
	MessageBox("확인","해당하는 내용이 없습니다.")
	RETURN
end if

if cbx_4.checked = true then		// A4 출력(제품상차내역서)
	ls_orderno = dw_2.object.fit_no[1]
   dw_7.retrieve( ls_orderno )
	
	l_print.st_datawindow  = dw_7
	l_print.st_print_sheet = " 프린트용지 : A4"
	GS_Print_Control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
	
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
else										// 라벨프린트
	PrintSetup()
	dw_6.Modify('DataWindow.Print.Paper.Size=9 DataWindow.Print.Orientation=1 Datawindow.Zoom=100')
	dw_6.settransobject(sqlca)
	
	dw_6.Reset()
	dw_6.InsertRow(0)
	WF_Print( dw_6 )
	
	ls_orderno = dw_6.object.order_no[1]
	if isnull(ls_orderno) OR ls_orderno = "" then
		// 10, 20... 페이지 공난출력 방지
	else
		dw_6.print()
	end if
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oifiting_m
integer x = 4590
integer y = 72
integer taborder = 440
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_cancel::clicked;call super::clicked;// 
dw_2.reset()
dw_3.reset()

end event

type pb_delete from w_inheritance`pb_delete within w_oifiting_m
integer x = 4398
integer y = 72
integer taborder = 460
end type

event pb_delete::clicked;call super::clicked;// 삭제
string ls_fitno, ls_dono
long   ll_row, ll_dw1row, ll_dw3cnt, ll_totdono

ls_fitno = dw_2.object.fit_no[1]
if isnull( ls_fitno ) or ls_fitno = "" then RETURN

if MessageBox("확인", "출고계획을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN

///////////////////////////////////////////////////////////////////////
// 출고팀의 송장발행 시점과 현 데이터 조회 시점차이 발생으로 재확인 
///////////////////////////////////////////////////////////////////////
ll_totdono = dw_3.object.totdono[1]
SELECT count(do_no) INTO :ll_dw3cnt  FROM fitdet  WHERE fit_no = :ls_fitno AND do_no IS NOT NULL;
if ll_totdono <> ll_dw3cnt then
	MessageBox("삭제","출고계획 내역이 변경되었습니다. 재 조회후 작업하시기 바랍니다.", exclamation!)
	RETURN
end if
///////////////////////////////////////////////////////////////////////

dw_3.setredraw( false )
for ll_row = dw_3.rowcount() TO 1 step -1
	dw_3.deleterow(ll_row)
next
dw_3.setredraw( true )

ll_dw1row = dw_1.getrow()		// 조회목록 저장

dw_2.deleterow( 1 )
if WF_Update2( dw_2, dw_3, "Y") = true then
else
	MessageBox("삭제","출고계획 삭제중 오류가 발생했습니다.", exclamation!)
end if

//
pb_retrieve.triggerevent( clicked! )
if dw_1.rowcount() >= ll_dw1row then dw_1.scrolltorow( ll_dw1row )	// 조회목록 이동


end event

type pb_insert from w_inheritance`pb_insert within w_oifiting_m
integer x = 4206
integer y = 72
integer taborder = 470
end type

event pb_insert::clicked;call super::clicked;//
string ls_custno, ls_custname, ls_sceneno, ls_scenename
long   ll_row, ll_totchk

ll_totchk = dw_1.object.totchk[1]
if ll_totchk < 1 then 
	MessageBox("확인", "출고요청, 물품이동 항목을 선택 후 작업하시기 바랍니다.")
	RETURN
end if

ls_custno    = dw_1.object.cust_no[dw_1.getrow()]
ls_custname  = dw_1.object.cust_name[dw_1.getrow()]

dw_3.reset()
dw_2.reset()
dw_2.insertrow(0)

dw_2.object.cust_no[1]    = ls_custno
dw_2.object.cust_name[1]  = ls_custname
dw_2.object.area_no[1]    = gs_area
dw_2.object.fit_date[1]   = gf_today()
dw_2.object.fit_user[1]   = gs_userid
dw_2.object.user_name[1]  = gs_username

cb_6.triggerevent( clicked! )
//cb_6.enabled = true		// 선택 가져오기

cb_sort.triggerevent( clicked! )
dw_3.setcolumn( 'ship_qty' )
dw_3.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oifiting_m
integer x = 4014
integer y = 72
integer taborder = 260
boolean default = true
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_area, ls_accept, ls_cat, ls_sdate, ls_end

this.default = false
//cb_2.triggerevent( clicked! )		// 필터해지

if rb_1.checked = true then
	ls_cat = '%'
elseif rb_2.checked = true then
	ls_cat = '출하'
elseif rb_3.checked = true then
	ls_cat = '이동'
end if

// 사업장
ls_area  = dw_area.object.area[1]
if isnull(ls_area) OR ls_area = "" then RETURN

// 접수자
ls_accept = dw_9.object.accept_user[1]
if isnull(ls_accept) OR ls_accept = "" then 
	MessageBox("확인", "해당하는 출고사업장의 접수자를 선택하시기 바랍니다.")
	RETURN
end if

//
ls_sdate = em_1.Text

dw_1.Retrieve( ls_area, ls_accept, ls_cat, ls_sdate )
if dw_1.rowcount() > 0 then
	dw_1.scrolltorow( 1 )
else
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if



end event

type gb_3 from w_inheritance`gb_3 within w_oifiting_m
integer x = 1312
integer y = 16
integer width = 1056
integer height = 228
integer taborder = 390
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oifiting_m
integer x = 3237
integer y = 16
integer width = 731
integer height = 228
integer taborder = 320
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oifiting_m
integer x = 3982
integer y = 16
integer width = 1403
integer height = 228
integer taborder = 330
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oifiting_m
string tag = "d_orsale_receipt"
integer x = 3058
integer y = 484
integer width = 1957
integer height = 428
integer taborder = 350
string title = "d_orsale_jajae2"
string dataobject = "d_oifiting_m"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::retrieveend;call super::retrieveend;//
if isnull(dw_2.object.fit_no[1]) then
	cb_6.enabled = true		// 선택 가져오기
else
	cb_6.enabled = false		// 선택 가져오기
end if

end event

type cb_3 from commandbutton within w_oifiting_m
boolean visible = false
integer x = 3849
integer y = 60
integer width = 457
integer height = 92
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;
string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
if dw_3.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw_3.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_3.SaveAs(ls_DocName, CSV!, TRUE)
      end if
end if

end event

type em_1 from editmask within w_oifiting_m
integer x = 3269
integer y = 136
integer width = 448
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	em_no.text = "FS"+string(date(this.text),"yyyymmdd")
end if

end event

type st_3 from statictext within w_oifiting_m
integer x = 361
integer y = 304
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_oifiting_m
integer x = 549
integer y = 288
integer width = 480
integer height = 632
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_oifiting_m
integer x = 590
integer y = 268
integer width = 311
integer height = 88
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_4 from statictext within w_oifiting_m
integer x = 1061
integer y = 304
integer width = 165
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_oifiting_m
integer x = 119
integer y = 376
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oifiting_m
integer x = 690
integer y = 376
integer width = 206
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_8"
		arg_dw  = dw_8
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oifiting_m
integer x = 901
integer y = 376
integer width = 206
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_8"
		arg_dw  = dw_8
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_oifiting_m
integer x = 1111
integer y = 376
integer width = 206
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_8"
		arg_dw  = dw_8
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oifiting_m
integer x = 1321
integer y = 376
integer width = 206
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_8"
		arg_dw  = dw_8
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_6 from datawindow within w_oifiting_m
integer x = 887
integer y = 88
integer width = 146
integer height = 100
integer taborder = 410
boolean bringtotop = true
string title = "라벨"
string dataobject = "d_label_fiting"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oifiting_m
integer x = 727
integer y = 88
integer width = 146
integer height = 100
integer taborder = 370
boolean bringtotop = true
string title = "수주상황접수부"
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type cbx_2 from checkbox within w_oifiting_m
integer x = 114
integer y = 304
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
long    ll_row
decimal ld_rlseqty
string  ls_orderno

pointer oldpointer // Declares a pointer variable

oldpointer = SetPointer(HourGlass!)
for ll_row =  1 to dw_1.rowcount()
	if this.checked = true then
		ls_orderno = dw_1.object.order_no[ll_row]
		SELECT sum(order_qty - rlse_qty) INTO :ld_rlseqty FROM saledet WHERE order_no = :ls_orderno;
		
		if ld_rlseqty < 1 then 
		else
			dw_1.object.chk[ll_row] = "Y"
		end if
	else
		dw_1.object.chk[ll_row] = "N"
	end if
next

SetPointer(oldpointer)
MessageBox('확인', '작업완료')

end event

type rb_1 from radiobutton within w_oifiting_m
integer x = 2414
integer y = 56
integer width = 219
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
end type

type rb_2 from radiobutton within w_oifiting_m
integer x = 2414
integer y = 112
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고요청"
boolean checked = true
end type

type rb_3 from radiobutton within w_oifiting_m
integer x = 2414
integer y = 168
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "물품이동"
end type

type dw_4 from datawindow within w_oifiting_m
integer x = 41
integer y = 1872
integer width = 2967
integer height = 612
integer taborder = 310
boolean bringtotop = true
string title = "none"
string dataobject = "d_oifiting_l2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_oifiting_m
integer x = 4133
integer y = 304
integer width = 165
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op2 from dropdownlistbox within w_oifiting_m
integer x = 4302
integer y = 288
integer width = 297
integer height = 512
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value2 from singlelineedit within w_oifiting_m
integer x = 3195
integer y = 376
integer width = 567
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_7 from commandbutton within w_oifiting_m
integer x = 3767
integer y = 376
integer width = 206
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld2, ddlb_op2, sle_value2, ddlb_dwtitles2)

end event

type cb_8 from commandbutton within w_oifiting_m
integer x = 3977
integer y = 376
integer width = 206
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2UnFilter( arg_dw )

ddlb_op2.text   = ""
ddlb_fld2.text  = ""
sle_value2.text = ""


end event

type cb_9 from commandbutton within w_oifiting_m
integer x = 4187
integer y = 376
integer width = 206
integer height = 76
integer taborder = 230
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld2, "A", ddlb_dwtitles2 )

end event

type cb_10 from commandbutton within w_oifiting_m
integer x = 4398
integer y = 376
integer width = 206
integer height = 76
integer taborder = 250
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld2, "D", ddlb_dwtitles2 )

end event

type cbx_4 from checkbox within w_oifiting_m
integer x = 3273
integer y = 72
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "A4"
end type

type dw_3 from datawindow within w_oifiting_m
integer x = 3058
integer y = 924
integer width = 1957
integer height = 1560
integer taborder = 290
string title = "d_label_main_prt"
string dataobject = "d_oifitingdet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld2, ddlb_dwtitles2 )
GF_DWClick2Info(this, ddlb_fld2, ddlb_op2, sle_value2, row, dwo.name, ddlb_dwtitles2)

end event

event itemfocuschanged;//
string ls_colname, ls_shipqty
long   ll_len

choose case dwo.name
	case 'ship_qty'
		ls_shipqty = string(this.object.ship_qty[row], "#,##0")
		ll_len     = LenA(ls_shipqty)
		this.SelectText( 1, LenA( ls_shipqty ) )
		this.SetFocus()
end choose

end event

type cbx_3 from checkbox within w_oifiting_m
integer x = 3200
integer y = 304
integer width = 224
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "전체"
end type

event clicked;// 전체
long  ll_row

for ll_row = 1 to dw_3.rowcount()
	if this.checked = true then
		dw_3.object.chk[ll_row] = 'Y'
	else
		dw_3.object.chk[ll_row] = 'N'
	end if
next

end event

type cb_6 from commandbutton within w_oifiting_m
integer x = 2304
integer y = 300
integer width = 654
integer height = 144
integer taborder = 420
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택항목 가져오기"
end type

event clicked;// 선택 가져오기
string   ls_cat,  ls_orderno, ls_cust, ls_scene, ls_custno, ls_custname, ls_sceneno, ls_scenename
string   ls_area, ls_itemno, ls_itemname, ls_qa, ls_uom, ls_fitno, ls_getfitting
string   ls_null, ls_rem, ls_saleno, ls_salesman, ls_username
long     li_null, li_reqseq, li_seq, ll_row, ll_dw3cnt, ll_dw9cnt, ll_totchk, ll_find, ll_copycnt
decimal  ld_orderqty, ld_rlseqty, ld_janqty, ld_shipqty
datetime ldt_reqdate

setnull( ls_null ) ; setnull( li_null )

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

//
dw_3.setredraw( false )
for ll_row = 1 to dw_1.rowcount()
   if dw_1.object.chk[ll_row] = "N" then CONTINUE
	
	ls_custno     = dw_1.object.cust_no[ll_row]	
	if dw_2.object.cust_no[1] <> ls_custno then
		MessageBox("확인","["+string(ll_row)+"]행 동일한 거래처가 아닙니다.")
		RETURN
	end if			
	
	ls_cat        = dw_1.object.cat[ll_row]
	ls_custname   = dw_1.object.cust_name[ll_row]
	ldt_reqdate   = dw_1.object.req_date[ll_row]
	ls_salesman   = dw_1.object.salesman[ll_row]
	li_reqseq     = dw_1.object.req_seq[ll_row]
	ls_username   = dw_1.object.user_name[ll_row]
			
	ls_cust       = dw_1.object.cust_no[ll_row]		// 거래처
	ls_scene      = dw_1.object.scene_code[ll_row]	// 현장
	ls_orderno    = dw_1.object.order_no[ll_row]
	if isnull(ls_orderno) OR ls_orderno = "" then
		MessageBox("확인","["+string(ll_row)+"]행 수주번호가 존재하지 않습니다.")
		RETURN
   end if
	
	dw_4.setredraw( false )
	dw_4.reset()
	dw_4.Retrieve( ls_area, ls_custno, ls_scene, ls_orderno )	// 수주상세
	dw_4.setredraw( true )

	if dw_4.rowcount() > 0 then
		if dw_4.object.totjanqty[1] = 0 then			// 미출고수량 확인
			//dw_1.object.protectyn[ ll_row ] = "Y"		// Protect
			dw_1.object.chk[ ll_row ]       = "N"    	// 선택안함
		else			
			for ll_dw9cnt = 1 to dw_4.rowcount()
				ls_getfitting = dw_4.object.get_fitting[ll_dw9cnt]
				ls_orderno    = dw_4.object.order_no[ll_dw9cnt]
				li_seq        = dw_4.object.seq_no[ll_dw9cnt]
				ls_custno     = dw_4.object.cust_no[ll_dw9cnt]
				ls_custname   = dw_4.object.cust_name[ll_dw9cnt]
				ls_sceneno    = dw_4.object.scene_code[ll_dw9cnt]
				ls_scenename  = dw_4.object.scene_desc[ll_dw9cnt]
				ls_itemno     = dw_4.object.item_no[ll_dw9cnt]
				ls_itemname   = dw_4.object.item_name[ll_dw9cnt]
				ls_qa         = dw_4.object.qa[ll_dw9cnt]
				ls_uom        = dw_4.object.uom[ll_dw9cnt]
				ls_rem        = dw_4.object.rem[ll_dw9cnt]
				ld_orderqty   = dw_4.object.order_qty[ll_dw9cnt]
				ld_rlseqty    = dw_4.object.rlse_qty[ll_dw9cnt]				
				ld_janqty     = dw_4.object.jan_qty[ll_dw9cnt]
	
				ll_find = dw_3.find("sale_no = '" + ls_orderno + "' AND seq_no = " + string(li_seq), 1, dw_3.RowCount() )
				if ll_find > 0 then	// 중복 SKIP
				else
					if ld_janqty > 0 then		// 잔량존재시
						ll_dw3cnt = dw_3.insertrow( 0 )
		
						dw_3.object.get_fitting[ll_dw3cnt]    = ls_getfitting
						dw_3.object.fit_no[ll_dw3cnt]         = ls_fitno
						dw_3.object.fit_seq[ll_dw3cnt]        = ll_dw3cnt
						
						dw_3.object.req_date[ll_dw3cnt]       = ldt_reqdate
						dw_3.object.salesman[ll_dw3cnt]       = ls_salesman
						dw_3.object.user_name[ll_dw3cnt]      = ls_username
						dw_3.object.req_seq[ll_dw3cnt]        = li_reqseq
						dw_3.object.req_flag[ll_dw3cnt]       = ''
						
						dw_3.object.cust_no[ll_dw3cnt]        = ls_custno
						dw_3.object.cust_name[ll_dw3cnt]      = ls_custname
						dw_3.object.scene_code[ll_dw3cnt]     = ls_sceneno
						dw_3.object.scene_desc[ll_dw3cnt]     = ls_scenename
						dw_3.object.item_no[ll_dw3cnt]        = ls_itemno
						dw_3.object.item_name[ll_dw3cnt]      = ls_itemname
						dw_3.object.qa[ll_dw3cnt]             = ls_qa
						dw_3.object.qa1[ll_dw3cnt]            = ls_qa
						dw_3.object.uom[ll_dw3cnt]            = ls_uom
						dw_3.object.rem[ll_dw3cnt]            = ls_rem
						dw_3.object.order_qty[ll_dw3cnt]      = ld_orderqty		// 주문수량
						dw_3.object.rlse_qty[ll_dw3cnt]       = ld_rlseqty			// 기출수량
						
						if isnull(dw_3.object.ship_qty[ll_dw3cnt]) then
							ld_shipqty = ld_orderqty - ld_rlseqty
							dw_3.object.ship_qty[ll_dw3cnt]    = ld_shipqty			// 상차수량
						end if
						
						dw_3.object.sale_no[ll_dw3cnt]        = ls_orderno
						dw_3.object.seq_no[ll_dw3cnt]         = li_seq
						dw_3.object.do_no[ll_dw3cnt]          = ls_null
						dw_3.object.oi_no[ll_dw3cnt]          = li_null
						dw_3.object.issue_flag[ll_dw3cnt]     = ''
						dw_3.object.issue_schedule[ll_dw3cnt] = ''
						dw_3.object.ship_flag[ll_dw3cnt]      = ''
						dw_3.object.ship_case[ll_dw3cnt]      = ''
						dw_3.object.tel[ll_dw3cnt]            = ''
						dw_3.object.rem[ll_dw3cnt]            = ''
						dw_3.object.sys_date[ll_dw3cnt]       = gf_today()
						
						ll_copycnt = ll_copycnt + 1
					end if		// 잔량존재시						
				end if		// 중복 SKIP
			next		// dw_4.rowcount()
		end if
	end if
next
dw_3.setredraw( true )

if ll_copycnt > 0 then
	MessageBox("확인",string(ll_copycnt,"#,##0") + " 행 가져오기 완료 ")
else
	dw_2.reset()	// 1행도 없으면 헤더 삭제
end if

end event

type st_1 from statictext within w_oifiting_m
integer x = 3461
integer y = 304
integer width = 174
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_dwtitles2 from dropdownlistbox within w_oifiting_m
integer x = 3680
integer y = 268
integer width = 311
integer height = 88
integer taborder = 240
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_fld2 from dropdownlistbox within w_oifiting_m
integer x = 3648
integer y = 288
integer width = 439
integer height = 632
integer taborder = 190
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type cb_11 from commandbutton within w_oifiting_m
integer x = 1554
integer y = 300
integer width = 731
integer height = 144
integer taborder = 450
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주상황부 일괄출력"
end type

event clicked;//
w_repsuper w_print
st_print   l_print
string ls_orderno, ls_dw5sql, ls_where, ls_sql, ls_scenehp
long   ll_row

if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

PrintSetup()

dw_5.settransobject(sqlca)
ls_dw5sql  = dw_5.describe("datawindow.table.select")

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.chk[ll_row] = "Y" then
		ls_orderno = dw_1.object.order_no[ll_row]	// 수주번호
		
//		ls_where   = "" ; ls_sql = ""
//		ls_where   = " and sale.order_no        = ~~'" + ls_orderno + "~~'" &
//					  + " and sale.confirm_flag LIKE ~~'" + "%" + "~~'"
//		ls_sql     = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
			
//		dw_5.modify( ls_sql )
//		dw_5.retrieve(	ls_scenehp )	// 수주상황접수부

		dw_5.retrieve( ls_scenehp, ls_orderno,  ls_orderno, '%')		
		
		dw_5.modify( 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100' )
		dw_5.print()
	
		//l_print.st_datawindow  = dw_5
		//l_print.st_print_sheet = " 프린트용지 : A4"
		//gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
		
		//// LANDSCAPE:1, PORTRAIT:2
		//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
		//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
	end if
next

end event

type cbx_custscene from checkbox within w_oifiting_m
integer x = 59
integer y = 212
integer width = 727
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처, 현장 중복체크"
boolean checked = true
end type

type gb_4 from groupbox within w_oifiting_m
integer x = 41
integer y = 256
integer width = 4978
integer height = 212
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type pb_del from picturebutton within w_oifiting_m
integer x = 2971
integer y = 300
integer width = 206
integer height = 144
integer taborder = 430
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
vtextalign vtextalign = vcenter!
end type

event clicked;// 행삭제
string ls_fitno, ls_saleno, ls_dono, ls_dochk
long   ll_row, ll_totdono, ll_dw3cnt, ll_seqno

ls_fitno  = dw_2.object.fit_no[1]

dw_3.setredraw( false )
for ll_row = dw_3.rowcount() to 1 step - 1
	if dw_3.object.chk[ll_row] = "Y" then
		ls_dochk  = dw_3.object.do_no[ll_row]
		
		if isnull( ls_dochk ) OR ls_dochk = "" then
			ls_saleno = dw_3.object.sale_no[ll_row]
			ll_seqno  = dw_3.object.seq_no[ll_row]
			
			///////////////////////////////////////////////////////////////////////
			// 출고팀의 송장발행 시점과 현 데이터 조회 시점차이 발생으로 재확인 
			///////////////////////////////////////////////////////////////////////
			SELECT do_no INTO :ls_dono 
			  FROM fitdet  
			 WHERE fit_no = :ls_fitno AND sale_no = :ls_saleno AND seq_no = :ll_seqno;
			if isnull( ls_dono ) OR ls_dono = "" then
			else
				MessageBox("삭제","출고계획 상세내역이 변경되었습니다. 재 조회후 작업하시기 바랍니다.", exclamation!)
				RETURN
			end if
			///////////////////////////////////////////////////////////////////////
			
			dw_3.deleterow( ll_row )
		end if
	end if
next
dw_3.setredraw( true )
//
//if WF_Update1( dw_3, "Y" ) = false then
//	MessageBox("삭제","출고계획 상세내역 삭제중 오류발생.", exclamation!)
//end if
end event

type dw_7 from datawindow within w_oifiting_m
integer x = 1061
integer y = 88
integer width = 146
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "제품상차내역서"
string dataobject = "d_oifiting_print"
boolean livescroll = true
end type

type cbx_5 from checkbox within w_oifiting_m
integer x = 3739
integer y = 168
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "내일"
end type

event clicked;// 내일
datetime ldtday

cbx_7.checked = false	// 전일
cbx_8.checked = false	// 오늘
//cbx_5.checked = false	// 내일

if this.checked = true then
	SELECT top 1 DATEADD(day, 1, getdate()) INTO :ldtday FROM login;
	em_1.text = string(ldtday, 'yyyy/mm/dd')
else
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(today(), 'yyyy/mm/dd')
end if

end event

type st_5 from statictext within w_oifiting_m
integer x = 50
integer y = 160
integer width = 539
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "거래명세서_출고계획"
boolean focusrectangle = false
end type

type dw_8 from datawindow within w_oifiting_m
integer x = 256
integer y = 840
integer width = 2537
integer height = 716
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_oifiting_result"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event rowfocuschanged;//
string ls_area, ls_orderno, ls_custno, ls_scene
long   ll_row, ll_cnt

dw_3.reset()
dw_4.reset()
if dw_8.rowcount() < 1 then RETURN

cb_8.triggerevent( clicked! )		// 필터해지

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ls_orderno = dw_8.object.order_no[currentrow]	// 수주번호
ls_custno  = dw_8.object.cust_no[currentrow]		// 거래처
ls_scene   = dw_8.object.scene_code[currentrow]	// 현장

if isnull(ls_orderno) OR ls_orderno = "" then
else
	dw_4.Retrieve( ls_area, ls_custno, ls_scene, ls_orderno )	// 수주상세
end if

end event

type cbx_6 from checkbox within w_oifiting_m
integer x = 782
integer y = 212
integer width = 517
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "출고내역(전체)"
end type

event clicked;// 출고내역
string ls_sdate, ls_edate

if this.checked = true then
	dw_8.x       = dw_1.x
	dw_8.y       = dw_1.y
	dw_8.width   = dw_1.width
	dw_8.height  = dw_1.height
	dw_8.visible = true
	cb_11.enabled  = false		// 수주상황부 일괄출력
	
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_cancel.enabled = false
	pb_print.enabled  = false
	pb_save.enabled   = false
	pb_del.enabled    = false	// 행삭제
	
	ls_sdate     = em_1.Text
	
	dw_8.reset()
	dw_8.Retrieve( ls_sdate )
	if dw_8.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if
else
	dw_8.reset()
	dw_8.visible = false
	cb_11.enabled  = true		// 수주상황부 일괄출력

	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_cancel.enabled = true
	pb_print.enabled  = true
	pb_save.enabled   = true
	pb_del.enabled    = true	// 행삭제
end if

end event

type cbx_7 from checkbox within w_oifiting_m
integer x = 3739
integer y = 56
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전일"
end type

event clicked;// 전일
datetime ldtday

//cbx_7.checked = false	// 전일
cbx_8.checked = false	// 오늘
cbx_5.checked = false	// 내일

if this.checked = true then
	SELECT top 1 DATEADD(day, -1, getdate()) INTO :ldtday FROM login;
	em_1.text = string(ldtday, 'yyyy/mm/dd')
else
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(today(), 'yyyy/mm/dd')
end if

end event

type cbx_8 from checkbox within w_oifiting_m
integer x = 3739
integer y = 112
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "오늘"
end type

event clicked;// 오늘
datetime ldtday

cbx_7.checked = false	// 전일
//cbx_8.checked = false	// 오늘
cbx_5.checked = false	// 내일

if this.checked = true then
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(ldtday, 'yyyy/mm/dd')
else
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(today(), 'yyyy/mm/dd')
end if

end event

type dw_area from datawindow within w_oifiting_m
integer x = 1614
integer y = 60
integer width = 535
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string ls_area

//
this.accepttext()
ls_area = this.object.area[1]

idwc_accept.setfilter( "area_no = '" + ls_area + "' " )
idwc_accept.filter()

dw_9.object.accept_user[1] = ""


end event

type st_6 from statictext within w_oifiting_m
integer x = 1335
integer y = 64
integer width = 279
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_9 from datawindow within w_oifiting_m
integer x = 2825
integer y = 144
integer width = 370
integer height = 80
integer taborder = 400
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdaccept_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 접수자
string ls_accept, ls_manager

if isnull(row) OR row < 1 then RETURN

this.accepttext()

ls_accept = this.object.accept_user[1]
if isnull(ls_accept) OR ls_accept = "" then RETURN

SELECT loc_manager INTO :ls_manager FROM location WHERE loc_manager = :ls_accept;
if isnull(ls_manager) OR ls_manager = "" then RETURN

//pb_insert.enabled = false
//pb_delete.enabled = false
//pb_save.enabled   = false
//
//if ls_manager = gs_userid then
//	pb_insert.enabled = true
//	pb_delete.enabled = true
//	pb_save.enabled   = true
//end if
//
end event

type st_7 from statictext within w_oifiting_m
integer x = 2830
integer y = 60
integer width = 366
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "접수자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_oifiting_m
integer x = 3026
integer y = 480
integer height = 2008
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.width  = dw_1.width

end event

type st_horizontal from u_splitbar_horizontal within w_oifiting_m
integer x = 41
integer y = 1844
integer width = 2967
boolean bringtotop = true
end type

type st_8 from statictext within w_oifiting_m
integer x = 1335
integer y = 144
integer width = 279
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "상차번호"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_no from editmask within w_oifiting_m
integer x = 1614
integer y = 140
integer width = 562
integer height = 84
integer taborder = 410
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XX########-###"
end type

event getfocus;//
this.SelectText(12, 3)
end event

event modified;//
cb_find.default = true

end event

type cb_find from commandbutton within w_oifiting_m
integer x = 2181
integer y = 136
integer width = 165
integer height = 92
integer taborder = 420
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "찾기"
end type

event clicked;//
string ls_fitno

ls_fitno  = em_no.text

dw_2.retrieve( ls_fitno )
dw_3.retrieve( ls_fitno )

end event

type cb_sort from commandbutton within w_oifiting_m
integer x = 4622
integer y = 300
integer width = 329
integer height = 148
integer taborder = 440
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "기본정렬"
end type

event clicked;// 기본정렬
if dw_3.rowcount() > 0 then
	dw_3.setsort( "get_fitting D, scene_desc A, item_name A, qa A" )
	dw_3.sort()
end if

end event

type cbx_fit from checkbox within w_oifiting_m
integer x = 3442
integer y = 72
integer width = 279
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "부자재"
end type

type ddlb_op from dropdownlistbox within w_oifiting_m
integer x = 1225
integer y = 288
integer width = 302
integer height = 500
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type gb_5 from groupbox within w_oifiting_m
integer x = 2802
integer y = 16
integer width = 416
integer height = 228
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_6 from groupbox within w_oifiting_m
integer x = 2377
integer y = 16
integer width = 407
integer height = 228
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

