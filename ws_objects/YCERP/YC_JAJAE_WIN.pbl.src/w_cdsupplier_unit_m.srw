$PBExportHeader$w_cdsupplier_unit_m.srw
$PBExportComments$구매처별 단가관리(1998/02/09,곽용덕)
forward
global type w_cdsupplier_unit_m from w_inheritance
end type
type em_2 from editmask within w_cdsupplier_unit_m
end type
type em_3 from editmask within w_cdsupplier_unit_m
end type
type em_4 from editmask within w_cdsupplier_unit_m
end type
type st_3 from statictext within w_cdsupplier_unit_m
end type
type ddlb_fld from dropdownlistbox within w_cdsupplier_unit_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdsupplier_unit_m
end type
type st_4 from statictext within w_cdsupplier_unit_m
end type
type ddlb_op from dropdownlistbox within w_cdsupplier_unit_m
end type
type sle_value from singlelineedit within w_cdsupplier_unit_m
end type
type cb_1 from commandbutton within w_cdsupplier_unit_m
end type
type cb_2 from commandbutton within w_cdsupplier_unit_m
end type
type cb_4 from commandbutton within w_cdsupplier_unit_m
end type
type cb_5 from commandbutton within w_cdsupplier_unit_m
end type
type dw_5 from datawindow within w_cdsupplier_unit_m
end type
type dw_4 from datawindow within w_cdsupplier_unit_m
end type
type pb_1 from picturebutton within w_cdsupplier_unit_m
end type
type rb_1 from radiobutton within w_cdsupplier_unit_m
end type
type rb_2 from radiobutton within w_cdsupplier_unit_m
end type
type dw_9 from datawindow within w_cdsupplier_unit_m
end type
type cbx_4 from checkbox within w_cdsupplier_unit_m
end type
type gb_4 from groupbox within w_cdsupplier_unit_m
end type
type dw_3 from datawindow within w_cdsupplier_unit_m
end type
type cb_6 from commandbutton within w_cdsupplier_unit_m
end type
type pb_2 from picturebutton within w_cdsupplier_unit_m
end type
type pb_3 from picturebutton within w_cdsupplier_unit_m
end type
type pb_excel from picturebutton within w_cdsupplier_unit_m
end type
end forward

global type w_cdsupplier_unit_m from w_inheritance
integer width = 7415
integer height = 2636
string title = "구매처 단가관리(w_cdsupplier_unit_m)"
em_2 em_2
em_3 em_3
em_4 em_4
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
dw_5 dw_5
dw_4 dw_4
pb_1 pb_1
rb_1 rb_1
rb_2 rb_2
dw_9 dw_9
cbx_4 cbx_4
gb_4 gb_4
dw_3 dw_3
cb_6 cb_6
pb_2 pb_2
pb_3 pb_3
pb_excel pb_excel
end type
global w_cdsupplier_unit_m w_cdsupplier_unit_m

type variables
date   id_startday, id_endday
string is_supp, is_select
datawindowchild idwc_item,idwc_qa, idwc_item2

long i_dw1_width
string is_dw = 'dw_2'

string i_check = 'false'
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);//
datetime ld_date
dec    ld_amount
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt
string ls_orderno, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_itemno, ls_item_name, ls_qa, ls_qty, ls_bigo, ls_cnt
int    li_seq_no

debugbreak()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
ll_line_cnt = 10
ll_pagetot  = dw_5.rowcount()
if mod(dw_5.rowcount(), ll_line_cnt) > 0 then
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt) + 1
else
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt)
end if

for ll_row = 1 to dw_5.rowcount()
	if dw_5.object.order_no[ll_row] = "" then continue
	
	if ll_line = 0 then
		ls_orderno    = dw_5.object.order_no[ll_row]
		ls_cust_name  = dw_5.object.cust_name[ll_row]
		ls_scene_name = dw_5.object.scene_desc[ll_row]
		
		arg_dw.object.order_no[1]   = ls_orderno
		arg_dw.object.barcode1[1]   = "*" + trim(ls_orderno) + "*"
		arg_dw.object.barcode2[1]   = "*" + trim(ls_orderno) + "*"
		arg_dw.object.cust_name[1]  = ls_cust_name
		arg_dw.object.scene_name[1] = ls_scene_name
		arg_dw.object.pagecnt[1]    = string(ll_pagecnt + 1) + " / " + string(ll_pagetot)
	end if
	
	ls_item_name = dw_5.object.item_name[ll_row]
	ls_qa        = dw_5.object.com_qa[ll_row]
	ls_qty       = string(dw_5.object.chulgo_qty[ll_row], '###,###,##0')
   ls_bigo      = dw_5.object.rem[ll_row]

	
	ll_line    = ll_line + 1
	arg_dw.setitem(1, 'item_name' + string(ll_line,"00"), ls_item_name)
	arg_dw.setitem(1, 'qa'        + string(ll_line,"00"), ls_qa)
	arg_dw.setitem(1, 'qty'       + string(ll_line,"00"), ls_qty)
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

on w_cdsupplier_unit_m.create
int iCurrent
call super::create
this.em_2=create em_2
this.em_3=create em_3
this.em_4=create em_4
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_5=create dw_5
this.dw_4=create dw_4
this.pb_1=create pb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_9=create dw_9
this.cbx_4=create cbx_4
this.gb_4=create gb_4
this.dw_3=create dw_3
this.cb_6=create cb_6
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_excel=create pb_excel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_2
this.Control[iCurrent+2]=this.em_3
this.Control[iCurrent+3]=this.em_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.dw_5
this.Control[iCurrent+15]=this.dw_4
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.rb_1
this.Control[iCurrent+18]=this.rb_2
this.Control[iCurrent+19]=this.dw_9
this.Control[iCurrent+20]=this.cbx_4
this.Control[iCurrent+21]=this.gb_4
this.Control[iCurrent+22]=this.dw_3
this.Control[iCurrent+23]=this.cb_6
this.Control[iCurrent+24]=this.pb_2
this.Control[iCurrent+25]=this.pb_3
this.Control[iCurrent+26]=this.pb_excel
end on

on w_cdsupplier_unit_m.destroy
call super::destroy
destroy(this.em_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_9)
destroy(this.cbx_4)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.cb_6)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_excel)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

datawindowchild idwc_supp

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
//========================================================//
//ddlb_fld2.reset()
//ddlb_dwtitles2.reset()
//ddlb_dwtitles2.visible = false

//GF_DWTitle2ddlb( dw_3, ddlb_fld2, ddlb_dwtitles2 )
//========================================================//


//dw_4.Visible = False
dw_5.Visible = False
//dw_6.Visible = False
//dw_7.Visible = False
//dw_8.Visible = false

pb_1.visible = false
pb_1.enabled = false		// 행추가
//pb_2.enabled = false		// 행삭제

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)


dw_5.SetTransObject(SQLCA)
//dw_6.SetTransObject(SQLCA)
//dw_9.SetTransObject(SQLCA)

//em_1.text = string(today(), 'yyyy/mm/dd')
//em_2.text = string(today(), 'yyyy/mm/dd')
//em_3.text = "HD" + string(today(), "yyyymmdd")

//em_3.SelectText(9, 2)
//em_3.setfocus()
//em_1.text = trim(gf_today2s())
//
//idwc_supp.setredraw(false)
//dw_11.getchild("supp_no", idwc_supp)
//idwc_supp.settransobject(sqlca)
//idwc_supp.insertrow(1)
//idwc_supp.setitem(1, "supp_no", "%")
//idwc_supp.setitem(1, "supp_name", "전체")

//idwc_supp.accepttext()
//idwc_supp.setredraw(false)

dw_3.getchild('item_no',idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild('qa',idwc_qa)
idwc_qa.insertrow(0)
idwc_qa.settransobject(sqlca)


is_select = idwc_qa.Describe("DataWindow.Table.Select")

pb_retrieve.triggerevent( clicked! )

dw_2.InsertRow(0)
end event

event resize;call super::resize;//
//dw_9.y      = dw_1.y + dw_1.height
//dw_9.height = newheight - dw_9.y - dw_1.height

dw_1.height = newheight - gb_4.height - gb_3.height - 50

//dw_4.width  = dw_1.width +   dw_3.width + dw_4.width  + dw_9.width

dw_3.height = dw_1.height - dw_2.height -150
dw_4.height = dw_1.height 
//dw_9.height = dw_3.height 


end event

type pb_save from w_inheritance`pb_save within w_cdsupplier_unit_m
integer x = 3090
integer y = 64
integer taborder = 220
end type

event pb_save::clicked;call super::clicked;
dwItemStatus l_status
long   l_new_ver, l_max_ver
long   ll_count, l_count
string ls_name, ls_tel, ls_kind
string ls_supp_no, ls_yyyymm, ls_half_gubun, ls_insang_gubun 
decimal l_insang_value

debugbreak()

setpointer(hourglass!)

dw_2.AcceptText()
dw_3.AcceptText()

if i_check = 'false' then

	l_status = dw_2.GetItemStatus(1, 0, Primary!)
	
	if l_status = NewModified! then
		
		
		 ls_supp_no = dw_2.object.supp_no[1]
		 l_insang_value = dec(dw_2.object.insang_value[1])
		 
		 ls_yyyymm = dw_2.object.yyyymm[1]
		 
		 
		 if isnull(ls_yyyymm)  or ls_yyyymm = '' then
			 MessageBox("확인","년월은 필수 입력사항입니다.",exclamation!)	 
			 return
		 end if
		 
		 
		 dw_2.object.use_yn[1] = 'Y'
		 
		 
		 if isnull(l_insang_value) then
			dw_2.object.insang_value[1] = 0
		  end if
		
		select max(ver)
		INTO :l_max_ver
		from supplier_unit
		where supp_no = :ls_supp_no;
		
		if isnull(l_max_ver) or l_max_ver = 0 then
			l_new_ver = 1
		else
			l_new_ver = l_max_ver + 1		
		end if	
		
		dw_2.object.ver[1] = l_new_ver
		
		if isnull(dw_2.object.write_date[1]) then
				dw_2.object.write_date[1] = trim(gf_today2s())
		end if
		
		if isnull(dw_2.object.write_user_id[1]) then
				dw_2.object.write_user_id[1] = gs_userid
		end if	
		
	end if
	
	
	
	l_insang_value = dw_2.object.insang_value[1]
	ls_insang_gubun = dw_2.object.insang_gubun[1]  /*1: 퍼센트, 2: 금액*/
	ls_half_gubun = dw_2.object.half_gubun[1]            /*Y: 반올림, N: 반올림 안함*/
	
	FOR ll_count = 1 TO dw_3.rowcount()
	
		l_status = dw_3.GetItemStatus(ll_count, 0, Primary!)
		
		if l_status = NewModified! or l_status = DataModified! then	
			
			dw_3.object.supp_no[ll_count] = dw_2.object.supp_no[1]
			dw_3.object.ver[ll_count] = dw_2.object.ver[1]
			
			if dw_3.object.amount[ll_count]  = dw_3.object.origin_amount[ll_count]  then
				
				IF ls_insang_gubun = '2' then
					dw_3.object.amount[ll_count] = ( dw_3.object.pre_amount[ll_count] + l_insang_value )
				else
					if ls_half_gubun = 'Y' then 
						dw_3.object.amount[ll_count] = round( dw_3.object.pre_amount[ll_count]*(1+ l_insang_value/100), 2)
					else
						dw_3.object.amount[ll_count] = ( dw_3.object.pre_amount[ll_count]*(1+ l_insang_value/100) )
					end if
					
				end if	
				
			end if
			
			dw_3.object.write_date[ll_count] = trim(gf_today2s())
			dw_3.object.write_user_id[ll_count] = gs_userid
		end if
	
	NEXT
	
	l_status = dw_2.GetItemStatus(1, 0, Primary!)
		
	FOR ll_count = 1 TO dw_3.rowcount()
	
		
		if l_status = DataModified! then	
			
			if dw_3.object.amount[ll_count]  = dw_3.object.origin_amount[ll_count]  then
	//			dw_3.object.amount[ll_count] = ( dw_3.object.pre_amount[ll_count]*(1+ l_insang_value/100) )
				IF ls_insang_gubun = '2' then
					if ls_half_gubun = 'Y' then 
						dw_3.object.amount[ll_count] = round( dw_3.object.pre_amount[ll_count] + l_insang_value, 0)
					else
						dw_3.object.amount[ll_count] = ( dw_3.object.pre_amount[ll_count] + l_insang_value )						
					end if
				else
					if ls_half_gubun = 'Y' then 
						dw_3.object.amount[ll_count] = round( dw_3.object.pre_amount[ll_count]*(1+ l_insang_value/100), 0)
					else
						dw_3.object.amount[ll_count] = ( dw_3.object.pre_amount[ll_count]*(1+ l_insang_value/100) )
					end if
					
				end if	
			end if
			
			dw_3.object.write_date[ll_count] = trim(gf_today2s())
			dw_3.object.write_user_id[ll_count] = gs_userid
		end if
	
	NEXT
	
end if

if wf_update2( dw_2, dw_3, "Y" ) = false then
	RETURN
else
	//pb_retrieve.triggerevent( clicked! )
	
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdsupplier_unit_m
integer x = 37
integer y = 448
integer width = 1701
integer height = 2036
integer taborder = 290
string dataobject = "d_supplier_unit_r"
boolean hscrollbar = false
boolean hsplitscroll = true
boolean livescroll = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string ls_con_code, ls_cat, ls_orderno, ls_askno, ls_seqno
long   ll_row, ll_cnt

debugbreak()

//dw_2.reset()
//dw_3.reset()
//dw_9.reset()
//if dw_1.rowcount() < 1 then RETURN

//ls_con_code   = dw_1.object.con_code[currentrow]
//ls_orderno = dw_1.object.order_no[currentrow]
//if isnull(ls_fitno) or ls_fitno = "" then
//else
//dw_2.Retrieve( ls_con_code )
//	dw_3.Retrieve( ls_fitno )
//end if
//
//if isnull(ls_orderno) or ls_orderno = "" then
//else
//	dw_9.Retrieve( ls_orderno )
//end if


//ls_cat   = dw_1.object.cat[ll_row]
//if ls_cat = "O" then	// 수주출고
//	ls_orderno  =  dw_1.Object.order_no[ll_row]
//   if isnull(ls_orderno) or ls_orderno = "" then
//	else
//		em_3.text = mid(ls_orderno, 1, 10)
//		em_4.text = right(ls_orderno, 3)
//		
//		if dw_2.Retrieve( ls_orderno ) < 1 then dw_2.insertrow(0)
//		dw_4.Retrieve( ls_orderno )
//		dw_5.Retrieve( ls_orderno )
//		dw_6.Retrieve( ls_orderno )
//	end if
//else		// 물품요청
//	ls_askno  =  dw_1.Object.order_no[ll_row]
//   if isnull(ls_askno) or ls_askno = "" then
//   else
//		em_3.text = mid(ls_askno, 1, 9)
//		em_4.text = right(ls_askno, 2)
//		
//		dw_2.Retrieve( ls_askno )
//		dw_4.Retrieve( ls_askno )
//		dw_5.Retrieve( ls_askno )
//		dw_6.Retrieve( ls_askno )
//	end if
//end if
//
end event

event dw_1::clicked;call super::clicked;string ls_supp_no
long   l_ver

i_check = 'false'

is_dw = 'dw_2'

if row = 0 then return

this.SetRedraw(FALSE)

debugbreak()
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


if dw_1.rowcount() < 1 then RETURN

ls_supp_no      = dw_1.object.supp_no[row]
l_ver   		    =  dw_1.object.max_ver[row]

if isnull(ls_supp_no) then
else	
	dw_2.Retrieve( ls_supp_no,  l_ver)
	dw_3.Retrieve( ls_supp_no,  l_ver)
	dw_4.Retrieve( ls_supp_no)	
end if

this.SetRedraw(TRUE)
end event

type st_title from w_inheritance`st_title within w_cdsupplier_unit_m
integer x = 46
integer width = 1298
string text = "구매처 단가관리"
end type

type st_tips from w_inheritance`st_tips within w_cdsupplier_unit_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsupplier_unit_m
integer x = 3282
integer y = 64
integer width = 178
integer taborder = 310
end type

event pb_compute::clicked;call super::clicked;string ls_supp_no, 	ls_item_no, ls_item_name, ls_qa, ls_uom, ls_part_no, ls_rem, ls_write_date, ls_write_user_id, ls_yyyymm
string ls_sqlerrtext, ls_insang_gubun, ls_half_gubun
long   l_new_ver, l_max_ver, l_insert_row
decimal 	l_amount, l_insang_value

DECLARE supplier_item_cursor CURSOR FOR
select a.item_no,
           b.item_name,
           a.qa,
           a.uom,
           a.amount,
           a.part_no,
           a.rem
from supplier_unit_det a inner join groupitem b on a.item_no = b.item_no
where a.supp_no = :ls_supp_no
   and  a.ver = :l_max_ver;

dw_2.accepttext()

ls_supp_no = dw_2.object.supp_no[1]

 l_insang_value = 0
 
// ls_supp_no = dw_11.object.supp_no[1]
// l_insang_value = dec(em_5.text)
// ls_yyyymm = left(em_1.text,4)+right(em_1.text,2)

select max(ver)
INTO :l_max_ver
from supplier_unit
where supp_no = :ls_supp_no;

if sqlca.sqlcode = 100 then
	l_new_ver = 1
else
	l_new_ver = l_max_ver + 1		
end if


//dw_2.reset()	
dw_3.reset()
	

//dw_2.insertrow(0)

//dw_2.object.supp_no[1] = ls_supp_no
dw_2.object.ver[1] = l_new_ver			 
dw_2.object.use_yn[1] = 'Y'
//dw_2.object.yyyymm[1] = ls_yyyymm
l_insang_value = dw_2.object.insang_value[1] 
dw_2.object.write_date[1] =  trim(gf_today2s())
dw_2.object.write_user_id[1] =  gs_userid	

ls_insang_gubun = dw_2.object.insang_gubun[1]
ls_half_gubun = dw_2.object.half_gubun[1]

OPEN supplier_item_cursor;

	FETCH supplier_item_cursor INTO :ls_item_no, :ls_item_name, :ls_qa, :ls_uom, :l_amount, :ls_part_no, :ls_rem;

	Do While sqlca.sqlcode = 0	
	
		l_insert_row = dw_3.insertrow(0)

		dw_3.object.supp_no[l_insert_row] = ls_supp_no
		dw_3.object.ver[l_insert_row] = l_new_ver
		dw_3.object.item_no[l_insert_row] = ls_item_no
		dw_3.object.item_name[l_insert_row] = ls_item_name
		dw_3.object.qa[l_insert_row] = ls_qa
		dw_3.object.uom[l_insert_row] = ls_uom
		dw_3.object.pre_amount[l_insert_row] = l_amount	
		dw_3.object.amount[l_insert_row] = (l_amount*(1 + l_insang_value/100)) /*인상률 반영*/
		
		IF ls_insang_gubun = '2' then
			if ls_half_gubun = 'Y' then
				dw_3.object.amount[l_insert_row] = round( dw_3.object.pre_amount[l_insert_row] + l_insang_value, 0)
			else
				dw_3.object.amount[l_insert_row] = ( dw_3.object.pre_amount[l_insert_row] + l_insang_value )				
			end if 
		else
			if ls_half_gubun = 'Y' then 
				dw_3.object.amount[l_insert_row] = round( dw_3.object.pre_amount[l_insert_row]*(1+ l_insang_value/100), 0)
			else
				dw_3.object.amount[l_insert_row] = ( dw_3.object.pre_amount[l_insert_row]*(1+ l_insang_value/100) )
			end if
			
		end if	
			
		dw_3.object.part_no[l_insert_row] = ls_part_no
		dw_3.object.rem[l_insert_row] = ls_rem							 
		dw_3.object.write_date[l_insert_row] =  trim(gf_today2s())			
		dw_3.object.write_user_id[l_insert_row] =  gs_userid
				 
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = string(sqlca.sqlerrtext)
			ROLLBACK;				
			MessageBox('오류32','[supplier_item_cursor] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
			RETURN 0
		end if			
			
		FETCH supplier_item_cursor INTO :ls_item_no, :ls_item_name, :ls_qa, :ls_uom, :l_amount, :ls_part_no, :ls_rem;
		
	Loop
	

CLOSE supplier_item_cursor;

i_check = 'true'

// dw_1.Modify("aaa_qty.EditMask.Mask='" + String('#,###.00') + "'")



end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"단가생성",parent, li_x, li_y)
end event

type pb_print_part from w_inheritance`pb_print_part within w_cdsupplier_unit_m
boolean visible = false
integer x = 4069
integer y = 48
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_cdsupplier_unit_m
integer x = 3634
integer y = 64
integer taborder = 250
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsupplier_unit_m
integer x = 2898
integer y = 64
integer taborder = 210
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
string     ls_orderno

// sale_order_no 수주번호
// ask_no        요청번호

debugbreak()
if dw_1.rowcount() < 1 then 
	MessageBox("확인","해당하는 내용이 없습니다.")
end if

if cbx_4.checked = true then		// A4 출력
//	l_print.st_datawindow  = dw_8
//	l_print.st_print_sheet = " 프린트용지 : A4"
//	gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
//	
//	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
else
//	PrintSetup()
//	dw_7.dataobject = "d_label_main_prt"
//	dw_7.Modify('DataWindow.Print.Paper.Size=9 DataWindow.Print.Orientation=1 Datawindow.Zoom=100')
//	dw_7.settransobject(sqlca)
//	
//	dw_7.Reset()
//	dw_7.InsertRow(0)
//	wf_print( dw_3 )
//	
//	ls_orderno = dw_7.object.order_no[1]
//	if isnull(ls_orderno) or ls_orderno = "" then
//		// 10, 20... 페이지 공난출력 방지
//	else
//		dw_7.print()
//	end if
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsupplier_unit_m
integer x = 2706
integer y = 64
integer taborder = 380
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"취소",parent, li_x, li_y)

end event

event pb_cancel::clicked;call super::clicked;// 

i_check = 'false'

dw_2.reset()
dw_3.reset()
dw_4.reset()

dw_2.insertrow(0)
end event

type pb_delete from w_inheritance`pb_delete within w_cdsupplier_unit_m
integer x = 2514
integer y = 64
integer taborder = 390
end type

event pb_delete::clicked;call super::clicked;// 삭제
long l_personal_id
long   ll_row, ll_dw1row

//	if is_dw = 'dw_2' then
		
		if MessageBox("확인", "현재 단가등록 내용을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
	
		for ll_row = dw_3.rowcount() TO 1 step -1
			dw_3.deleterow(ll_row)
		next
		
		dw_2.deleterow( 1 )
		
		if wf_update2( dw_2, dw_3, "N" ) = false then
			RETURN
		else
			pb_retrieve.triggerevent( clicked! )			
		end if		
		 
//	elseif is_dw = 'dw_3' then
		
//		if MessageBox("확인", "제품 단가를 삭제 하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
		
//		ll_row = dw_3.getrow()
//		dw_3.deleterow(ll_row)
	
//	end if
end event

type pb_insert from w_inheritance`pb_insert within w_cdsupplier_unit_m
integer x = 2322
integer y = 64
integer taborder = 400
end type

event pb_insert::clicked;call super::clicked;//
string ls_custno, ls_custname, ls_sceneno, ls_scenename
long   ll_row, ll_totchk

i_check = 'false'

//ll_totchk = dw_1.object.totchk[1]
//if ll_totchk < 1 then 
//	MessageBox("확인", "출고요청, 물품이동 항목을 선택 후 작업하시기 바랍니다.")
//	RETURN
//end if

//ls_custno    = dw_1.object.cust_no[dw_1.getrow()]
//ls_custname  = dw_1.object.cust_name[dw_1.getrow()]
//ls_sceneno   = dw_1.object.scene_code[dw_1.getrow()]
//ls_scenename = dw_1.object.scene_desc[dw_1.getrow()]

//dw_3.reset()
//dw_2.reset()

//if is_dw = 'dw_2' then
	dw_2.reset()
	dw_2.insertrow(0)
	dw_3.reset()	
	dw_4.reset()	
//elseif 	is_dw = 'dw_3' then
//	dw_3.insertrow(0)	
//end if

//dw_2.object.cust_no[1]    = ls_custno
//dw_2.object.cust_name[1]  = ls_custname
//dw_2.object.scene_code[1] = ls_sceneno
//dw_2.object.scene_desc[1] = ls_scenename
//dw_2.object.area_no[1]    = gs_area
//dw_2.object.fit_date[1]   = gf_today()
//dw_2.object.fit_user[1]   = gs_userid
//dw_2.object.user_name[1]  = gs_username
//
//cb_6.triggerevent( clicked! )
//cb_6.enabled = true		// 선택 가져오기
//pb_1.enabled = true		// 행추가
//pb_2.enabled = true		// 행삭제

//dw_3.setcolumn( 'ship_qty' )
//dw_3.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsupplier_unit_m
integer x = 2135
integer y = 64
integer taborder = 200
end type

event pb_retrieve::clicked;call super::clicked;//
//string ls_cat, ls_start, ls_end
//
//if rb_1.checked = true then
//	ls_cat = '%'
//elseif rb_2.checked = true then
//	ls_cat = '출하'
//elseif rb_3.checked = true then
//	ls_cat = '이동'
//end if
//
//ls_start = em_1.Text
//ls_end   = em_2.Text

dw_1.reset()
dw_2.reset()
dw_3.reset()


//if gs_level = '3' then
//	dw_1.retrieve('%')
//else
	dw_1.retrieve()	
//end if


// 필터해지
//cb_8.triggerevent( clicked! )		


end event

type gb_3 from w_inheritance`gb_3 within w_cdsupplier_unit_m
boolean visible = false
integer x = 3831
integer y = 16
integer width = 727
integer height = 228
integer taborder = 10
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean enabled = false
string text = "구분"
end type

type gb_2 from w_inheritance`gb_2 within w_cdsupplier_unit_m
boolean visible = false
integer x = 4571
integer y = 16
integer width = 809
integer height = 228
integer taborder = 270
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean enabled = false
string text = "제품상차 번호"
end type

type gb_1 from w_inheritance`gb_1 within w_cdsupplier_unit_m
integer x = 2112
integer y = 8
integer width = 1815
integer height = 228
integer taborder = 280
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdsupplier_unit_m
string tag = "d_construction_m"
integer x = 1751
integer y = 456
integer width = 4763
integer height = 392
integer taborder = 300
boolean bringtotop = false
string title = "d_construction_m"
string dataobject = "d_supplier_unit_m"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::clicked;call super::clicked;is_dw = 'dw_2'
end event

event dw_2::itemchanged;call super::itemchanged;integer l_count
string ls_name, ls_tel
dwItemStatus l_status

this.accepttext()

choose case dwo.name
	case 'name'

//		ls_name = trim(data)
//		
//		l_count = 0
//		
//		select  count(*)
//		    into :l_count
//		from personal_connection
//		where name = :ls_name;
//		
//		if l_count >0 then
//			messagebox('알림' , '기존 동일한 이름의 사용자가 존재합니다.',exclamation!)
//		end if
		
	case 'tel'
		
		l_status = this.GetItemStatus(1, 0, Primary!)
		
		if l_status = NewModified! then		
		
				ls_name = trim(this.object.name[row])
				ls_tel 	    = trim(data)
				
				l_count = 0
				
				select  count(*)
					 into :l_count
				from personal_connection
				where name = :ls_name
					and replace(rtrim(ltrim(tel)),'-', '') = replace(:ls_tel,'-', '');
				
				if l_count >0 then
					messagebox('알림' , '기존 동일한 이름, 전화번호 사용자가 존재합니다.',exclamation!)
					return 0
				end if
			
			
			
				
	end if
		
end choose
end event

type em_2 from editmask within w_cdsupplier_unit_m
boolean visible = false
integer x = 4434
integer y = 100
integer width = 357
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_3 from editmask within w_cdsupplier_unit_m
event keydown pbm_dwnkey
boolean visible = false
integer x = 4005
integer y = 44
integer width = 379
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

type em_4 from editmask within w_cdsupplier_unit_m
boolean visible = false
integer x = 4393
integer y = 44
integer width = 137
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "1"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;//
this.SelectText(1, 3)


end event

type st_3 from statictext within w_cdsupplier_unit_m
integer x = 352
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_cdsupplier_unit_m
integer x = 539
integer y = 308
integer width = 480
integer height = 632
integer taborder = 120
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

type ddlb_dwtitles from dropdownlistbox within w_cdsupplier_unit_m
integer x = 581
integer y = 320
integer width = 311
integer height = 88
integer taborder = 140
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

type st_4 from statictext within w_cdsupplier_unit_m
integer x = 1038
integer y = 324
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

type ddlb_op from dropdownlistbox within w_cdsupplier_unit_m
integer x = 1207
integer y = 308
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cdsupplier_unit_m
integer x = 1527
integer y = 316
integer width = 567
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cdsupplier_unit_m
integer x = 2098
integer y = 316
integer width = 160
integer height = 76
integer taborder = 110
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cdsupplier_unit_m
integer x = 2263
integer y = 316
integer width = 160
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_cdsupplier_unit_m
integer x = 2427
integer y = 316
integer width = 160
integer height = 76
integer taborder = 160
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdsupplier_unit_m
integer x = 2592
integer y = 316
integer width = 160
integer height = 76
integer taborder = 180
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_cdsupplier_unit_m
integer x = 1728
integer y = 68
integer width = 146
integer height = 100
integer taborder = 370
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdsupplier_unit_excel"
boolean livescroll = true
end type

type dw_4 from datawindow within w_cdsupplier_unit_m
integer x = 6537
integer y = 456
integer width = 562
integer height = 2044
integer taborder = 320
boolean bringtotop = true
string title = "none"
string dataobject = "d_supplier_unit_ver_r"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string  ls_supp_no
long    l_ver

is_dw = 'dw_4'

this.SetRedraw(FALSE)

ls_supp_no  = this.object.supp_no[row]
l_ver			= this.object.ver[row]

dw_2.Retrieve( ls_supp_no,  l_ver)
dw_3.Retrieve( ls_supp_no,  l_ver)

this.SetRedraw(TRUE)
end event

type pb_1 from picturebutton within w_cdsupplier_unit_m
integer x = 1422
integer y = 52
integer width = 155
integer height = 104
integer taborder = 330
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;//

end event

type rb_1 from radiobutton within w_cdsupplier_unit_m
boolean visible = false
integer x = 3867
integer y = 76
integer width = 311
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
string text = "전체"
end type

type rb_2 from radiobutton within w_cdsupplier_unit_m
boolean visible = false
integer x = 4183
integer y = 76
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
string text = "출고요청"
boolean checked = true
end type

type dw_9 from datawindow within w_cdsupplier_unit_m
boolean visible = false
integer x = 311
integer y = 2496
integer width = 1527
integer height = 68
integer taborder = 260
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_orsale_l3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_4 from checkbox within w_cdsupplier_unit_m
boolean visible = false
integer x = 3867
integer y = 156
integer width = 311
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
string text = "A4 출력"
boolean checked = true
end type

type gb_4 from groupbox within w_cdsupplier_unit_m
integer x = 37
integer y = 256
integer width = 4704
integer height = 200
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_3 from datawindow within w_cdsupplier_unit_m
integer x = 1751
integer y = 972
integer width = 4768
integer height = 1532
integer taborder = 240
string title = "d_label_main_prt"
string dataobject = "d_supplier_unit_det_m"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
pb_save.default = true


end event

event losefocus;//
pb_retrieve.default = true

end event

event itemfocuschanged;////
//string ls_colname, ls_shipqty
//long   ll_len
//
//debugbreak()
//choose case dwo.name
//	case 'ship_qty'
//		ls_shipqty = string(this.object.ship_qty[row], "#,##0")
//		ll_len     = len(ls_shipqty)
//		this.SelectText( 1, Len( ls_shipqty ) )
//		this.SetFocus()
//end choose
//
end event

event clicked;is_dw = 'dw_3'

GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
end event

event itemchanged;long ll_row, ll_row1, ll_found, ll_cnt
string ls_item, ls_qa, ls_data, ls_item_name, ls_uom, ls_where, ls_sql

this.accepttext()
ll_row = this.getrow()
ls_item = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

choose case dwo.name

	case 'item_no'

		this.object.qa[ll_row] = ''
		this.object.uom[ll_row] = ''
		this.object.rem[ll_row] = ''
		this.object.qa.tabsequence = 0
		
		this.getchild("item_no", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	     ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		 select item_name, uom into :ls_item_name, :ls_uom from groupitem 
		  where item_no = :ls_data;
		 if sqlca.sqlcode = 100 then 
			 return 1
		 end if
		this.object.uom[ll_row] = ls_uom
		this.object.item_name[this.getrow()] = ls_item_name
		
		if ls_item <> '' then
			this.getchild("qa", idwc_qa)
			ls_where = 'AND itemcost.item_no = ~~"' + ls_item + '~~"'
			ls_sql = "DataWindow.Table.Select = '" + is_select + ls_where + "'"
			
			dw_2.getchild("qa", idwc_qa)
			idwc_qa.settransobject(sqlca)
			idwc_qa.modify(ls_sql)
			idwc_qa.retrieve()
			
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		
//	case 'qa'
//		ls_qa = data
//		select count(*) into :ll_cnt from item
//		 where item_no = :ls_item
//		   and qa = :ls_qa;
//		 if sqlca.sqlcode = 100 then 
//			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
//				+ "신규규격 " + ls_qa +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
//				gf_iteminsert(ls_item, ls_qa)
//			else
//				return 1
//			end if
//		 end if
////		this.getchild("qa", idwc_qa)
////		gs_ds_qaall.ShareData(idwc_qa)
//
//		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
//		this.object.uom[ll_row] = ls_uom

end choose

end event

type cb_6 from commandbutton within w_cdsupplier_unit_m
integer x = 1760
integer y = 852
integer width = 457
integer height = 112
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
end type

event clicked;gs_where2 lstr_where
long ll_row, ll_cnt, ll_row1
decimal l_insang_value

lstr_where.chk =  'M' //'M' //M:multi S:single

i_check = 'false'

openwithparm(w_whitemlocqohmulti_w, lstr_where)

lstr_where = Message.PowerObjectParm

if lstr_where.chk <> "Y" then return 0

string ls_supp
dec {3} ld_cost
date ld_date
long ll,kk

//ll = UpperBound(lstr_where.str1)
//kk = UpperBound(lstr_where.str2)
//dw_3.SETREDRAW(FALSE)

if dw_2.rowcount() <= 0 then return 0

l_insang_value = dw_2.object.insang_value[1]

for ll_row = 1 to UpperBound(lstr_where.str1)	

	ll_cnt = dw_3.insertrow(0)

	dw_3.object.supp_no[ll_cnt] = dw_2.object.supp_no[1]
	dw_3.object.ver[ll_cnt] = dw_2.object.ver[1]
	
	dw_3.object.amount[ll_cnt] = round(dw_3.object.amount[ll_cnt]*(1+ l_insang_value/100),0)
	
	dw_3.object.write_date[ll_cnt] = trim(gf_today2s())
	dw_3.object.write_user_id[ll_cnt] = gs_userid

	
	dw_3.object.item_no[ll_cnt]  = lstr_where.str1[ll_row]
	dw_3.object.qa[ll_cnt]       = lstr_where.str2[ll_row]
	dw_3.object.uom[ll_cnt]  = lstr_where.str3[ll_row]
	dw_3.object.item_name[ll_cnt]  = lstr_where.name[ll_row]	

	

next
end event

type pb_2 from picturebutton within w_cdsupplier_unit_m
integer x = 2231
integer y = 848
integer width = 151
integer height = 120
integer taborder = 350
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
string powertiptext = "추가"
end type

event clicked;
	dw_3.insertrow(0)	
end event

type pb_3 from picturebutton within w_cdsupplier_unit_m
integer x = 2386
integer y = 848
integer width = 151
integer height = 120
integer taborder = 360
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
string powertiptext = "삭제"
end type

event clicked;long ll_row

if MessageBox("확인", "제품 단가를 삭제 하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN 0


ll_row = dw_3.getrow()
dw_3.deleterow(ll_row)

if wf_update1(dw_3, "N" ) = false then
	RETURN
else
end if
end event

type pb_excel from picturebutton within w_cdsupplier_unit_m
event mousemove pbm_mousemove
integer x = 3461
integer y = 64
integer width = 178
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"엑셀생성",parent, li_x, li_y)
end event

event clicked;
string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

dw_5.retrieve()

if dw_5.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw_5.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_5.SaveAs(ls_DocName, CSV!, TRUE)
      end if
end if

end event

