$PBExportHeader$w_icitemstock_m.srw
$PBExportComments$장기재고관리(2003/08/25, 이인호)
forward
global type w_icitemstock_m from w_inheritance
end type
type rb_1 from radiobutton within w_icitemstock_m
end type
type rb_2 from radiobutton within w_icitemstock_m
end type
type rb_3 from radiobutton within w_icitemstock_m
end type
type dw_3 from datawindow within w_icitemstock_m
end type
type dw_4 from datawindow within w_icitemstock_m
end type
type dw_5 from datawindow within w_icitemstock_m
end type
type st_3 from statictext within w_icitemstock_m
end type
type ddlb_fld from dropdownlistbox within w_icitemstock_m
end type
type ddlb_dwtitles from dropdownlistbox within w_icitemstock_m
end type
type st_4 from statictext within w_icitemstock_m
end type
type ddlb_op from dropdownlistbox within w_icitemstock_m
end type
type sle_value from singlelineedit within w_icitemstock_m
end type
type cb_1 from commandbutton within w_icitemstock_m
end type
type cb_2 from commandbutton within w_icitemstock_m
end type
type cb_3 from commandbutton within w_icitemstock_m
end type
type cb_5 from commandbutton within w_icitemstock_m
end type
type st_1 from statictext within w_icitemstock_m
end type
type st_vertical from u_splitbar_vertical within w_icitemstock_m
end type
type st_horizontal from u_splitbar_horizontal within w_icitemstock_m
end type
type cb_10 from commandbutton within w_icitemstock_m
end type
type tab_1 from tab within w_icitemstock_m
end type
type tabpage_1 from userobject within tab_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type pb_2 from picturebutton within tabpage_1
end type
type dw_6 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cbx_1 cbx_1
pb_2 pb_2
dw_6 dw_6
end type
type tabpage_2 from userobject within tab_1
end type
type ddlb_term from dropdownlistbox within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type em_3 from editmask within tabpage_2
end type
type em_2 from editmask within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type st_7 from statictext within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type dw_7 from datawindow within tabpage_2
end type
type dw_area from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
ddlb_term ddlb_term
cb_6 cb_6
st_5 st_5
em_3 em_3
em_2 em_2
st_6 st_6
st_7 st_7
cb_4 cb_4
dw_7 dw_7
dw_area dw_area
end type
type tabpage_3 from userobject within tab_1
end type
type cb_8 from commandbutton within tabpage_3
end type
type cb_7 from commandbutton within tabpage_3
end type
type em_5 from editmask within tabpage_3
end type
type em_4 from editmask within tabpage_3
end type
type st_9 from statictext within tabpage_3
end type
type dw_area2 from datawindow within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type dw_8 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_8 cb_8
cb_7 cb_7
em_5 em_5
em_4 em_4
st_9 st_9
dw_area2 dw_area2
st_8 st_8
dw_8 dw_8
end type
type tab_1 from tab within w_icitemstock_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type pb_excel from picturebutton within w_icitemstock_m
end type
end forward

global type w_icitemstock_m from w_inheritance
integer width = 6862
integer height = 2272
string title = "장기재고관리(w_icitemstock_m)"
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_1 st_1
st_vertical st_vertical
st_horizontal st_horizontal
cb_10 cb_10
tab_1 tab_1
pb_excel pb_excel
end type
global w_icitemstock_m w_icitemstock_m

type variables
datawindowchild idwc_reason, idwc_area, idwc_area2
integer i_index
end variables

forward prototypes
public subroutine wf_dw1ret (integer al_row)
public function boolean wf_move ()
public function boolean wf_move2 ()
end prototypes

public subroutine wf_dw1ret (integer al_row);//
string ls_locno, ls_item, ls_qa

dw_2.accepttext()
dw_3.accepttext()

dw_1.reset()
if al_row < 1 or dw_2.rowcount() < 1 then RETURN


ls_locno = trim(dw_3.object.loc_no[1])
ls_item  = dw_2.object.item_no[al_row]
ls_qa    = dw_2.object.qa[al_row]

dw_1.setredraw( false )

if dw_1.retrieve( ls_locno, ls_item, ls_qa ) < 1 then
	//dw_1.insertrow(1)		// 내용
	dw_1.enabled = false
else
	dw_1.enabled = true
end if

dw_1.setredraw( true )


end subroutine

public function boolean wf_move ();long ll_rowcount,ll_rowcount1,ll_cnt,ll_find,ll_row,ll_count
string ls_plan,ls_order, ls_uom, ls_supp, ls_qa, ls_item, ls_subcon
string ls_qa1, ls_loc, ls_comp, ls_sale, ls_scene
decimal {4} lr_cost
datetime  l_date

ls_loc = dw_3.object.loc_no[1]
			
ll_rowcount1 = tab_1.tabpage_1.dw_6.rowcount()
ll_rowcount  = tab_1.tabpage_2.dw_7.rowcount()

ll_count = 0
for ll_cnt = 1 to ll_rowcount
	if tab_1.tabpage_2.dw_7.isselected(ll_cnt) then
      ll_count ++
	end if
next

if ll_count = 0 then
	messagebox('오류','외주가공대상물품을 선택하십시요.',exclamation!)
	return false
end if

select convert(datetime, getdate() )
  into :l_date
from dual;


for ll_cnt = 1 to ll_rowcount
	if tab_1.tabpage_2.dw_7.isselected(ll_cnt) then
	
		if ll_rowcount1 < 1 then
			ll_find = 0
		else
//		   ll_find = tab_1.tabpage_1.dw_6.find("product_no = '" + ls_plan + "'",1,tab_1.tabpage_1.dw_6.rowcount())
		end if
		
		if ll_find = 0 then
			
			ls_item = trim(tab_1.tabpage_2.dw_7.object.item_no[ll_cnt])
			ls_qa   = trim(tab_1.tabpage_2.dw_7.object.qa[ll_cnt])
			ls_uom  = trim(tab_1.tabpage_2.dw_7.object.uom[ll_cnt])

			ll_row = tab_1.tabpage_1.dw_6.insertrow(0)
			
//			tab_1.tabpage_1.dw_6.object.uom[ll_row] = gf_uom(ls_uom)
//			tab_1.tabpage_1.dw_6.object.loc_no[ll_row]   = 

//			tab_1.tabpage_1.dw_6.object.order_no[ll_row]   = ls_order
//			tab_1.tabpage_1.dw_6.object.seq[ll_row]   		= ls_order

			tab_1.tabpage_1.dw_6.object.item_no[ll_row]    = ls_item			
			tab_1.tabpage_1.dw_6.object.qa[ll_row]         = ls_qa
			
			
			tab_1.tabpage_1.dw_6.object.user_date[ll_row]  = l_date		
			tab_1.tabpage_1.dw_6.object.qty[ll_row]         = tab_1.tabpage_2.dw_7.object.make_qty[ll_cnt] - tab_1.tabpage_2.dw_7.object.ship_qty[ll_cnt]
			tab_1.tabpage_1.dw_6.object.in_qty[ll_row]         = tab_1.tabpage_1.dw_6.object.qty[ll_row]		
			tab_1.tabpage_1.dw_6.object.out_qty[ll_row]		= 0
     			tab_1.tabpage_1.dw_6.object.groupitem_item_name[ll_row]  =  tab_1.tabpage_2.dw_7.object.item_name[ll_cnt]
			tab_1.tabpage_1.dw_6.object.sale_no[ll_row]    =  tab_1.tabpage_2.dw_7.object.sale_no[ll_cnt]
			tab_1.tabpage_1.dw_6.object.sale_seq[ll_row]   =  tab_1.tabpage_2.dw_7.object.seq_no[ll_cnt]
			tab_1.tabpage_1.dw_6.object.order_no[ll_row]    =  tab_1.tabpage_2.dw_7.object.order_no[ll_cnt]
			
			tab_1.tabpage_1.dw_6.object.cust_name[ll_row]    =  tab_1.tabpage_2.dw_7.object.cust_name[ll_cnt]
			tab_1.tabpage_1.dw_6.object.scene_desc[ll_row]    =  tab_1.tabpage_2.dw_7.object.scene_desc[ll_cnt]			
			
			tab_1.tabpage_1.dw_6.object.loc_no[ll_row]    = ls_loc			
			tab_1.tabpage_1.dw_6.object.itemstockdet_kind[ll_row]    = '1' /* 생산미출고: 1, 반품: 2 */
			tab_1.tabpage_1.dw_6.object.itemstockdet_close_yn[ll_row]    = 'O'
			
//			dw3.object.coil_no[ll_row]      =  dw4.object.issue_lot[ll_cnt] //원코일번호
	//		tab_1.tabpage_2.dw_7.RowsMove ( ll_cnt, ll_cnt, Primary!, tab_1.tabpage_2.dw_7, 1, Filter! )
			
			tab_1.tabpage_2.dw_7.RowsMove ( ll_cnt, ll_cnt, Primary!, tab_1.tabpage_2.dw_7, 1, Filter! )
			
						
			ll_cnt = ll_cnt - 1
			
		end if
	end if
next

//tab_1.tabpage_2.dw_7.RowsMove( 1, tab_1.tabpage_2.dw_7.filteredcount(), Filter!, tab_1.tabpage_2.dw_7, 1, Primary! )

//if wf_update1(tab_1.tabpage_1.dw_6,'N') = false then
//	return false
//end if
messagebox('확인','생산미출고품목이 이동되었습니다.',information!)
return true



return true
end function

public function boolean wf_move2 ();long ll_rowcount,ll_rowcount1,ll_cnt,ll_find,ll_row,ll_count
string ls_plan,ls_order, ls_uom, ls_supp, ls_qa, ls_item, ls_subcon
string ls_qa1, ls_loc, ls_comp, ls_sale, ls_scene
decimal {4} lr_cost
datetime  l_date

ls_loc = dw_3.object.loc_no[1]
			
ll_rowcount1 = tab_1.tabpage_1.dw_6.rowcount()
ll_rowcount  = tab_1.tabpage_3.dw_8.rowcount()

ll_count = 0
for ll_cnt = 1 to ll_rowcount
	if tab_1.tabpage_3.dw_8.isselected(ll_cnt) then
      ll_count ++
	end if
next

if ll_count = 0 then
	messagebox('오류','외주가공대상물품을 선택하십시요.',exclamation!)
	return false
end if

select convert(datetime, getdate() )
  into :l_date
from dual;


for ll_cnt = 1 to ll_rowcount
	if tab_1.tabpage_3.dw_8.isselected(ll_cnt) then
	
		if ll_rowcount1 < 1 then
			ll_find = 0
		else
//		   ll_find = tab_1.tabpage_1.dw_6.find("product_no = '" + ls_plan + "'",1,tab_1.tabpage_1.dw_6.rowcount())
		end if
		
		if ll_find = 0 then
			
			ls_item = trim(tab_1.tabpage_3.dw_8.object.item_no[ll_cnt])
			ls_qa   = trim(tab_1.tabpage_3.dw_8.object.retdet_qa[ll_cnt])
			ls_uom  = trim(tab_1.tabpage_3.dw_8.object.retdet_uom[ll_cnt])

			ll_row = tab_1.tabpage_1.dw_6.insertrow(0)
			
//			tab_1.tabpage_1.dw_6.object.uom[ll_row] = gf_uom(ls_uom)
//			tab_1.tabpage_1.dw_6.object.loc_no[ll_row]   = 

//			tab_1.tabpage_1.dw_6.object.order_no[ll_row]   = ls_order
//			tab_1.tabpage_1.dw_6.object.seq[ll_row]   		= ls_order

			tab_1.tabpage_1.dw_6.object.item_no[ll_row]    = ls_item			
			tab_1.tabpage_1.dw_6.object.qa[ll_row]         = ls_qa
			
			
			tab_1.tabpage_1.dw_6.object.user_date[ll_row]  = l_date		
			tab_1.tabpage_1.dw_6.object.qty[ll_row]         = tab_1.tabpage_3.dw_8.object.acc_qty[ll_cnt]
			tab_1.tabpage_1.dw_6.object.in_qty[ll_row]         = tab_1.tabpage_1.dw_6.object.qty[ll_row]		
			tab_1.tabpage_1.dw_6.object.out_qty[ll_row]		= 0			
     			tab_1.tabpage_1.dw_6.object.groupitem_item_name[ll_row]  =  tab_1.tabpage_3.dw_8.object.groupitem_item_name[ll_cnt]
			tab_1.tabpage_1.dw_6.object.sale_no[ll_row]    =  tab_1.tabpage_3.dw_8.object.sale_no[ll_cnt]
			tab_1.tabpage_1.dw_6.object.sale_seq[ll_row]   =  tab_1.tabpage_3.dw_8.object.seq_no[ll_cnt]
			tab_1.tabpage_1.dw_6.object.order_no[ll_row]    =  tab_1.tabpage_3.dw_8.object.ret_ret_no[ll_cnt]
			
			tab_1.tabpage_1.dw_6.object.cust_name[ll_row]    =  tab_1.tabpage_3.dw_8.object.customer_cust_name[ll_cnt]
			tab_1.tabpage_1.dw_6.object.scene_desc[ll_row]    =  tab_1.tabpage_3.dw_8.object.scene_scene_desc[ll_cnt]			
			
			tab_1.tabpage_1.dw_6.object.seq[ll_row]    =  tab_1.tabpage_3.dw_8.object.ret_seq[ll_cnt]
			tab_1.tabpage_1.dw_6.object.loc_no[ll_row]    = ls_loc			
			tab_1.tabpage_1.dw_6.object.itemstockdet_kind[ll_row]    = '2' /* 생산미출고: 1, 반품: 2 */
			tab_1.tabpage_1.dw_6.object.itemstockdet_close_yn[ll_row]    = 'O'
			
//			dw3.object.coil_no[ll_row]      =  dw4.object.issue_lot[ll_cnt] //원코일번호
	//		tab_1.tabpage_3.dw_8.RowsMove ( ll_cnt, ll_cnt, Primary!, tab_1.tabpage_3.dw_8, 1, Filter! )
			
			tab_1.tabpage_3.dw_8.RowsMove ( ll_cnt, ll_cnt, Primary!, tab_1.tabpage_3.dw_8, 1, Filter! )
			
						
			ll_cnt = ll_cnt - 1
			
		end if
	end if
next

//tab_1.tabpage_3.dw_8.RowsMove( 1, tab_1.tabpage_3.dw_8.filteredcount(), Filter!, tab_1.tabpage_3.dw_8, 1, Primary! )

//if wf_update1(tab_1.tabpage_1.dw_6,'N') = false then
//	return false
//end if
messagebox('확인','반품품목이 이동되었습니다.',information!)
return true



return true
end function

on w_icitemstock_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_1=create st_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.cb_10=create cb_10
this.tab_1=create tab_1
this.pb_excel=create pb_excel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.st_vertical
this.Control[iCurrent+19]=this.st_horizontal
this.Control[iCurrent+20]=this.cb_10
this.Control[iCurrent+21]=this.tab_1
this.Control[iCurrent+22]=this.pb_excel
end on

on w_icitemstock_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.cb_10)
destroy(this.tab_1)
destroy(this.pb_excel)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_5)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_rightobject(tab_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(tab_1)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_loc

dw_2.SetTransObject(sqlca)
dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)
dw_5.SetTransObject(sqlca)
tab_1.tabpage_1.dw_6.SetTransObject(sqlca)
tab_1.tabpage_2.dw_7.SetTransObject(sqlca)
tab_1.tabpage_3.dw_8.SetTransObject(sqlca)

dw_1.getchild("reason_code", idwc_reason)
idwc_reason.SetTransObject(sqlca)

SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;

dw_1.insertrow(1)		// 내용
//dw_1.enabled = false

dw_3.insertrow(1)
dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()

//dw_2.sharedata(dw_4)
dw_4.visible = false

datetime ldt_sdate, ldt_edate

SELECT top 1 DateAdd(month, -1, getdate()), DateAdd(day, -1, getdate()) 
  INTO :ldt_sdate, :ldt_edate 
  FROM login;

tab_1.tabpage_2.em_2.text = string(ldt_sdate, "yyyy/mm/dd")
tab_1.tabpage_2.em_3.text = string(ldt_edate, "yyyy/mm/dd")

tab_1.tabpage_3.em_4.text = string(ldt_sdate, "yyyy/mm/dd")
tab_1.tabpage_3.em_5.text = string(ldt_edate, "yyyy/mm/dd")
//
//// 사업장
//tab_1.tabpage_2.dw_area.object.area.Background.Color   = 67108864
tab_1.tabpage_2.dw_area.settransobject(sqlca)
tab_1.tabpage_2.dw_area.insertrow(0)  

tab_1.tabpage_2.dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
tab_1.tabpage_2.dw_area.object.area[1] = 'S0001'  // gs_area

//// 사업장
//tab_1.tabpage_3.dw_area2.object.area.Background.Color   = 67108864
tab_1.tabpage_3.dw_area2.settransobject(sqlca)
tab_1.tabpage_3.dw_area2.insertrow(0)  

tab_1.tabpage_3.dw_area2.getchild("area", idwc_area2)
idwc_area2.settransobject(sqlca)
idwc_area2.insertrow(1)
idwc_area2.setitem(1, 'area_no', '%')
idwc_area2.setitem(1, 'area_name', '전체사업장')
tab_1.tabpage_3.dw_area2.object.area[1] = 'S0001'  // gs_area


tab_1.tabpage_2.ddlb_term.text = ' 3일이후'

pb_print_part.enabled = false	// 추가
pb_compute.enabled = false		// 저장
pb_cancel.enabled  = false		// 삭제 2013.07.29(이재형) 통제함


if GF_PERMISSION("장기재고_관리", gs_userid) = "Y" then
else

	
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

pb_retrieve.postevent(clicked!)

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 1)

//st_vertical.x      = dw_5.width
st_vertical.height = newheight 

//dw_5.x      = st_vertical.x + st_vertical.width
//dw_5.width  = newwidth  - dw_5.x - gb_3.x

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = newwidth  - (gb_3.x * 3)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x 

tab_1.width = dw_2.width
tab_1.height = dw_2.height


tab_1.tabpage_1.width  = gb_3.width - dw_5.width
tab_1.tabpage_1.height = newheight - dw_2.y - gb_3.x 

tab_1.tabpage_1.dw_6.y = tab_1.tabpage_1.y      
tab_1.tabpage_1.dw_6.width = gb_3.width - dw_5.width - gb_3.x
tab_1.tabpage_1.dw_6.height = newheight - dw_2.y - (gb_3.x*10)

tab_1.tabpage_2.width  = newwidth  - (gb_3.x * 3)
tab_1.tabpage_2.height = newheight - dw_2.y - gb_3.x 

tab_1.tabpage_2.dw_7.y = tab_1.tabpage_1.y      
tab_1.tabpage_2.dw_7.width = gb_3.width - dw_5.width - gb_3.x
tab_1.tabpage_2.dw_7.height = newheight - dw_2.y - (gb_3.x*10)


tab_1.tabpage_3.width  = newwidth  - (gb_3.x * 3)
tab_1.tabpage_3.height = newheight - dw_2.y - (gb_3.x*3)

tab_1.tabpage_3.dw_8.y = tab_1.tabpage_1.y      
tab_1.tabpage_3.dw_8.width = gb_3.width - dw_5.width - gb_3.x
tab_1.tabpage_3.dw_8.height =newheight - dw_2.y - (gb_3.x*10)

dw_5.height = dw_1.height + dw_2.height + st_horizontal.height

end event

type pb_save from w_inheritance`pb_save within w_icitemstock_m
integer x = 2848
integer y = 80
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row

ll_row = dw_2.getrow()
//wf_update1(dw_1, 'Y')
//if wf_update2(dw_1, dw_2, 'Y') = true then

if wf_update2(dw_1, tab_1.tabpage_1.dw_6, 'Y') = true then
	pb_retrieve.postevent(clicked!)
end if
end event

type dw_1 from w_inheritance`dw_1 within w_icitemstock_m
integer x = 2373
integer y = 420
integer width = 3237
integer height = 496
integer taborder = 20
string dataobject = "d_icitemstock_new_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::doubleclicked;call super::doubleclicked;//
if row < 1 then return

string ls_user, ls_null

dwitemstatus l_status
l_status = dw_1.getitemstatus(row, 0, primary!)

setnull(ls_null)
choose case dwo.name
	case 'chk1_user'
		ls_user = this.object.chk1_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk1_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user then
				if this.object.chk1_user[row] = gs_userid then
					this.object.chk1_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if

	case 'chk2_user'
		ls_user = this.object.chk2_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk2_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user  then
				if this.object.chk2_user[row] = gs_userid then
					this.object.chk2_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;gs_where2 lstr_where
long   ll_row, ll_cnt
dec{2} ld_qoh
string ls_location


if dwo.name = 'groupitem_item_name' then
	if dw_3.accepttext( ) = -1 then return

	ls_location = trim(dw_3.object.loc_no[1])
	if trim(ls_location) = '' or isnull(ls_location) then
		MessageBox("확인","저장소를 선택하십시요")
		return
	end if
	
	lstr_where.chk     = 'M'   // M:multi S:single
	lstr_where.chk1    = ls_location
	lstr_where.str8[1] = string(wf_today(),"yyyy/mm/dd")
	OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
	lstr_where = Message.PowerObjectParm
	if lstr_where.chk = 'N' then RETURN

	dw_1.object.user_date[1] = wf_today()		// 시스템일자
	dw_1.object.loc_no[1]    = ls_location		// 저장소
	dw_1.object.item_no[1]   = trim(lstr_where.str1[1])		// 품목
	dw_1.object.qa[1]        = trim(lstr_where.str2[1])		// 규격
	dw_1.object.uom[1] = trim(lstr_where.str3[1])
	dw_1.object.itemstockdet_close_yn[1] = 'O'
	dw_1.object.groupitem_item_name[1] = trim(lstr_where.name[1])
	dw_1.object.qty[1]       = lstr_where.qty1[1]
	dw_1.object.in_qty[1]       = lstr_where.qty1[1]	
	dw_1.object.reason1[1]   = lstr_where.str5[1]			// 비고1
	
end if


end event

type st_title from w_inheritance`st_title within w_icitemstock_m
integer x = 41
integer y = 28
integer width = 1024
integer height = 144
string text = "장기재고 관리"
end type

type st_tips from w_inheritance`st_tips within w_icitemstock_m
end type

type pb_compute from w_inheritance`pb_compute within w_icitemstock_m
boolean visible = false
integer x = 389
integer y = 188
integer width = 96
integer height = 68
integer taborder = 120
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_icitemstock_m
boolean visible = false
integer x = 178
integer y = 188
integer width = 96
integer height = 68
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_icitemstock_m
integer x = 3035
integer y = 80
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_icitemstock_m
boolean visible = false
integer x = 3881
integer y = 60
integer taborder = 170
boolean enabled = false
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_4.rowcount() < 1 then
	return
end if

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 장기재고 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=93'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_icitemstock_m
boolean visible = false
integer x = 283
integer y = 188
integer width = 96
integer height = 68
integer taborder = 210
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_icitemstock_m
integer x = 2473
integer y = 80
integer taborder = 250
end type

event pb_delete::clicked;call super::clicked;//if mid(gs_team, 2,1) <> '0' then return
string ls_user1, ls_user2
long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_user1 = dw_1.object.chk1_user[ll_row]
ls_user2 = dw_1.object.chk2_user[ll_row]
if not isnull(ls_user1) or trim(ls_user1) <> '' or not isnull(ls_user2) or trim(ls_user2) <> '' then
	messagebox("확인", "확인이 안되어 있는 품목만 삭제가 가능합니다.")
else
	dw_1.deleterow(0)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_icitemstock_m
integer x = 2281
integer y = 80
integer taborder = 280
end type

event pb_insert::clicked;call super::clicked;// 추가
gs_where2 lstr_where
long   ll_row, ll_cnt
dec{2} ld_qoh
string ls_location

dw_3.accepttext()
ls_location = trim(dw_3.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	MessageBox("확인","저장소를 선택하십시요")
	return
end if

/////////////////////////////////////////////////////////////////
// 다중추가 화면
/////////////////////////////////////////////////////////////////
//lstr_where.chk     = "M"   // M:multi S:single
//lstr_where.chk1    = ls_location
//lstr_where.str8[1] = em_1.text
//OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
//lstr_where = Message.PowerObjectParm
////if lstr_where.chk = "N" then RETURN
/////////////////////////////////////////////////////////////////

//dw_2.accepttext()
dw_1.reset()
dw_1.insertrow(0)
tab_1.tabpage_1.dw_6.reset()

//for ll_row = 1 to UpperBound(lstr_where.str1)						
//	ll_cnt = dw_2.insertrow(0)
////	if gs_area = 'H0001' then
////		dw_2.object.chk2_user[ll_cnt] = gs_userid
////	else
////		dw_2.object.chk1_user[ll_cnt] = gs_userid
////	end if
//
//	dw_2.object.user_date[ll_cnt] = wf_today()		// 시스템일자
//	dw_2.object.loc_no[ll_cnt]    = ls_location		// 저장소
//	dw_2.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])		// 품목
//	dw_2.object.qa[ll_cnt]        = trim(lstr_where.str2[ll_row])		// 규격
////	dw_2.object.groupitem_uom[ll_cnt] = trim(lstr_where.str3[ll_row])
//	dw_2.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
//	dw_2.object.qty[ll_cnt]       = lstr_where.qty1[ll_row]
//	dw_2.object.loc_qoh[ll_cnt]   = lstr_where.qty1[ll_row]
//	dw_2.object.reason1[ll_cnt]   = lstr_where.str5[ll_row]			// 비고1
//	dw_2.object.reason[ll_cnt]    = lstr_where.str5[ll_row]			// 비고1 + 비고2 + 비고3
//next

//dw_2.scrolltorow(ll_cnt)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_icitemstock_m
integer x = 2089
integer y = 80
integer taborder = 270
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_locno, ls_sdate

dw_1.setredraw(false)
dw_2.setredraw(false)

dw_2.reset()
dw_2.setfilter('')
dw_2.filter()

dw_3.accepttext()

ls_locno = dw_3.object.loc_no[1]

tab_1.tabpage_1.dw_6.reset()
dw_1.reset()
dw_1.insertrow(0)

//dw_2.retrieve( ls_locno, ls_sdate )
dw_5.retrieve( ls_locno)
dw_4.retrieve( ls_locno)
dw_2.retrieve( ls_locno)

dw_1.setredraw(true)
dw_2.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_icitemstock_m
integer x = 32
integer y = 252
integer width = 4169
integer height = 164
integer taborder = 100
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_icitemstock_m
integer x = 1129
integer y = 16
integer width = 896
integer height = 232
integer taborder = 110
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_icitemstock_m
integer x = 2053
integer y = 20
integer width = 1230
integer height = 232
integer taborder = 60
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_icitemstock_m
boolean visible = false
integer x = 2683
integer y = 2072
integer width = 2395
integer height = 332
integer taborder = 0
boolean enabled = false
string dataobject = "d_icitemstock_excel"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;//
//long ll_row
//
//ll_row = this.getrow()
//WF_dw1ret(ll_row)
//
end event

event dw_2::clicked;call super::clicked;decimal l_id

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

l_id = this.object.id[row]

dw_1.retrieve(l_id)

end event

event dw_2::itemerror;call super::itemerror;return 2
end event

event dw_2::doubleclicked;call super::doubleclicked;//
string ls_user, ls_null

if row < 1 then return
this.scrolltorow(row)

dwitemstatus l_status
l_status = dw_1.getitemstatus(row, 0, primary!)

setnull(ls_null)
choose case dwo.name
	case 'chk1_user'
		ls_user = this.object.chk1_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk1_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user then
				if this.object.chk1_user[row] = gs_userid then
					this.object.chk1_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
	case 'chk2_user'
		ls_user = this.object.chk2_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk2_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user  then
				if this.object.chk2_user[row] = gs_userid then
					this.object.chk2_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
end choose

end event

type rb_1 from radiobutton within w_icitemstock_m
integer x = 2665
integer y = 296
integer width = 283
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
dw_2.setfilter('')
dw_2.filter()

//wf_dw1ret(1)
end event

type rb_2 from radiobutton within w_icitemstock_m
integer x = 2665
integer y = 348
integer width = 489
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "창고 미확인"
end type

event clicked;// 창고미확인
dw_2.setfilter('isnull(chk1_user)')
dw_2.filter()

//wf_dw1ret(1)

end event

type rb_3 from radiobutton within w_icitemstock_m
integer x = 3154
integer y = 348
integer width = 489
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판매 미확인"
end type

event clicked;// 판매미확인
dw_2.setfilter('isnull(chk2_user)')
dw_2.filter()

//wf_dw1ret(1)

end event

type dw_3 from datawindow within w_icitemstock_m
integer x = 1157
integer y = 100
integer width = 855
integer height = 92
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_icitemstock_m
integer x = 37
integer y = 192
integer width = 91
integer height = 68
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_icitemstock_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_icitemstock_m
integer x = 32
integer y = 420
integer width = 2309
integer height = 1736
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_icitemstock_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_sdate, ls_locno, ls_item_no, ls_qa


if dw_5.rowcount() = 0 then return

ls_locno = dw_3.object.loc_no[1]
ls_item_no = dw_5.object.item_no[row]
ls_qa = dw_5.object.qa[row]

dw_1.reset()
dw_1.insertrow(0)

tab_1.tabpage_1.dw_6.retrieve( ls_locno, ls_item_no,  ls_qa)
end event

type st_3 from statictext within w_icitemstock_m
integer x = 82
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_icitemstock_m
integer x = 270
integer y = 304
integer width = 443
integer height = 632
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_icitemstock_m
integer x = 302
integer y = 316
integer width = 311
integer height = 88
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
end type

type st_4 from statictext within w_icitemstock_m
integer x = 741
integer y = 320
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

type ddlb_op from dropdownlistbox within w_icitemstock_m
integer x = 910
integer y = 304
integer width = 297
integer height = 512
integer taborder = 230
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

type sle_value from singlelineedit within w_icitemstock_m
integer x = 1230
integer y = 312
integer width = 567
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_icitemstock_m
integer x = 1801
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if i_index = 1 then
	arg_dw  = tab_1.tabpage_1.dw_6
elseif i_index = 2 then
	arg_dw  = tab_1.tabpage_2.dw_7	
elseif i_index = 3 then	
	arg_dw  = tab_1.tabpage_3.dw_8	
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_icitemstock_m
integer x = 1966
integer y = 312
integer width = 160
integer height = 76
integer taborder = 200
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

if i_index = 1 then
	arg_dw  = tab_1.tabpage_1.dw_6
elseif i_index = 2 then
	arg_dw  = tab_1.tabpage_2.dw_7	
elseif i_index = 3 then	
	arg_dw  = tab_1.tabpage_3.dw_8	
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_icitemstock_m
integer x = 2130
integer y = 312
integer width = 160
integer height = 76
integer taborder = 240
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

if i_index = 1 then
	arg_dw  = tab_1.tabpage_1.dw_6
elseif i_index = 2 then
	arg_dw  = tab_1.tabpage_2.dw_7	
elseif i_index = 3 then	
	arg_dw  = tab_1.tabpage_3.dw_8	
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_icitemstock_m
integer x = 2295
integer y = 312
integer width = 160
integer height = 76
integer taborder = 260
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

if i_index = 1 then
	arg_dw  = tab_1.tabpage_1.dw_6
elseif i_index = 2 then
	arg_dw  = tab_1.tabpage_2.dw_7	
elseif i_index = 3 then	
	arg_dw  = tab_1.tabpage_3.dw_8	
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_1 from statictext within w_icitemstock_m
integer x = 2482
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
string text = "필터: "
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_icitemstock_m
integer x = 2345
integer y = 416
integer height = 1740
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_icitemstock_m
integer x = 2359
integer y = 928
integer width = 4169
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_1.height

end event

type cb_10 from commandbutton within w_icitemstock_m
integer x = 3291
integer y = 88
integer width = 183
integer height = 140
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "도움말"
end type

event clicked;//
string ls_msg

ls_msg  =  "A: 발주취소(잔량반품)~n"
ls_msg += "B: 발주취소(원인불명)~n"
ls_msg += "C: 발주취소(발주오류)~n"
ls_msg += "D: 발주취소(업체취소)~n"
ls_msg += "E: 발주취소(채권관련)~n"
ls_msg += "F: 발주취소(마감수주)~n"
ls_msg += "G: 수주입력오류~n"
ls_msg += "H: 이중생산(강건)~n"
ls_msg += "I: 이중생산(외주)~n"
ls_msg += "J: 이중생산(유창)~n"
ls_msg += "K: 대체출고~n"
ls_msg += "L: 원인불명~n"
ls_msg += "M: 재고생산분~n"
ls_msg += "N: 출고대기~n"
ls_msg += "Y: 기타~n"
ls_msg += "Z: 실사마감(재고조정)~n"

MessageBox("확인",ls_msg)


end event

type tab_1 from tab within w_icitemstock_m
integer x = 2368
integer y = 948
integer width = 3899
integer height = 1056
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean boldselectedtext = true
alignment alignment = right!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;i_index = newindex
end event

type tabpage_1 from userobject within tab_1
string tag = "상세내역"
integer x = 18
integer y = 112
integer width = 3863
integer height = 928
long backcolor = 79741120
string text = "상세내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PasteSpecial!"
long picturemaskcolor = 536870912
cbx_1 cbx_1
pb_2 pb_2
dw_6 dw_6
end type

on tabpage_1.create
this.cbx_1=create cbx_1
this.pb_2=create pb_2
this.dw_6=create dw_6
this.Control[]={this.cbx_1,&
this.pb_2,&
this.dw_6}
end on

on tabpage_1.destroy
destroy(this.cbx_1)
destroy(this.pb_2)
destroy(this.dw_6)
end on

type cbx_1 from checkbox within tabpage_1
integer x = 14
integer y = 28
integer width = 334
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선택유무"
end type

type pb_2 from picturebutton within tabpage_1
integer x = 384
integer width = 137
integer height = 108
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_rowcount,ll_rowcount1,ll_cnt,ll_find,ll_row,ll_count
string ls_plan,ls_order, ls_uom, ls_supp, ls_qa, ls_item, ls_subcon
string ls_qa1, ls_loc, ls_comp, ls_sale, ls_scene
decimal {4} lr_cost
datetime  l_date
		
ll_rowcount  = tab_1.tabpage_1.dw_6.rowcount()

ll_count = 0

for ll_cnt = 1 to ll_rowcount
	if tab_1.tabpage_1.dw_6.isselected(ll_cnt) then				
		
		tab_1.tabpage_1.dw_6.deleterow(ll_cnt)
		
		ll_cnt = ll_cnt - 1
	end if
			
next

return 1
end event

type dw_6 from datawindow within tabpage_1
integer y = 108
integer width = 3863
integer height = 824
integer taborder = 190
string title = "none"
string dataobject = "d_icitemstock_new_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;decimal l_id

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if cbx_1.checked then

	this.ScrollToRow( row )
	this.SelectRow( row, NOT this.IsSelected(row) )
	
end if 	


l_id = this.object.id[row]
dw_1.retrieve(l_id)
end event

type tabpage_2 from userobject within tab_1
string tag = "생산미출고내역"
integer x = 18
integer y = 112
integer width = 3863
integer height = 928
long backcolor = 79741120
string text = "생산미출고내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Preferences!"
long picturemaskcolor = 536870912
ddlb_term ddlb_term
cb_6 cb_6
st_5 st_5
em_3 em_3
em_2 em_2
st_6 st_6
st_7 st_7
cb_4 cb_4
dw_7 dw_7
dw_area dw_area
end type

on tabpage_2.create
this.ddlb_term=create ddlb_term
this.cb_6=create cb_6
this.st_5=create st_5
this.em_3=create em_3
this.em_2=create em_2
this.st_6=create st_6
this.st_7=create st_7
this.cb_4=create cb_4
this.dw_7=create dw_7
this.dw_area=create dw_area
this.Control[]={this.ddlb_term,&
this.cb_6,&
this.st_5,&
this.em_3,&
this.em_2,&
this.st_6,&
this.st_7,&
this.cb_4,&
this.dw_7,&
this.dw_area}
end on

on tabpage_2.destroy
destroy(this.ddlb_term)
destroy(this.cb_6)
destroy(this.st_5)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.cb_4)
destroy(this.dw_7)
destroy(this.dw_area)
end on

type ddlb_term from dropdownlistbox within tabpage_2
integer x = 2414
integer y = 16
integer width = 466
integer height = 324
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string item[] = {" 3일이후"," 7일이후","15일이후","30일이후"}
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within tabpage_2
integer x = 3177
integer y = 12
integer width = 229
integer height = 84
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이동"
end type

event clicked;dw_1.reset()
dw_1.insertrow(0)
tab_1.tabpage_1.dw_6.reset()
wf_move()

tab_1.selecttab(1)

end event

type st_5 from statictext within tabpage_2
integer x = 946
integer y = 16
integer width = 334
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "생산일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_3 from editmask within tabpage_2
integer x = 1655
integer y = 16
integer width = 361
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type em_2 from editmask within tabpage_2
integer x = 1289
integer y = 16
integer width = 361
integer height = 72
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type st_6 from statictext within tabpage_2
integer x = 2030
integer y = 16
integer width = 379
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "생산일기준"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_2
integer x = 55
integer y = 16
integer width = 334
integer height = 80
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

type cb_4 from commandbutton within tabpage_2
integer x = 2889
integer y = 12
integer width = 279
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_sdate, ls_edate, ls_salesman, ls_area, ls_openclose, ls_calctime, ls_ssale_date

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

ls_sdate = tab_1.tabpage_2.em_2.text
ls_edate = tab_1.tabpage_2.em_3.text


select  substring(a.ls_date,1,4) + '/' + substring(a.ls_date,5,2) + '/' + substring(a.ls_date,7,2) lsdate
   into :ls_ssale_date
from 
(   
    select MIN(SUBSTRING(sfcday.SALE_NO,3,8)) ls_date
      from sfcday with(nolock)
      where sfcday.sfc_date between :ls_sdate + ' 00:00:00' AND :ls_edate + ' 23:59:59' 
    	 and sfcday.item_no = sfcday.assembly
    	 and sfcday.qa = sfcday.assembly_qa
    	 and sfcday.type = 'C'
    	 and sfcday.cust_no  <> ''  
    	 AND ISNULL(sfcday.MAKE_QTY,0) > 0
) a;


// 사업장
tab_1.tabpage_2.dw_area.accepttext()
ls_area     = tab_1.tabpage_2.dw_area.object.area[1]

if ls_area <> '%' then
	ls_area = '%'+ls_area+'%'
end if

ls_calctime = trim(LeftA(tab_1.tabpage_2.ddlb_term.text,2))


tab_1.tabpage_2.dw_7.retrieve( ls_area, ls_sdate, ls_edate, ls_calctime, ls_ssale_date)
//엑셀 출력용 2017.12.13 조원석 추가 

if tab_1.tabpage_2.dw_7.rowcount() < 1 then
	MessageBox("확인","해당월에 조회한 자료가 없습니다",Exclamation!)
else
	MessageBox("확인","조회완료")
end if

end event

type dw_7 from datawindow within tabpage_2
integer y = 108
integer width = 3835
integer height = 780
integer taborder = 10
string title = "none"
string dataobject = "d_icitemstock_new_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


this.ScrollToRow( row )
this.SelectRow( row, NOT this.IsSelected(row) )

end event

type dw_area from datawindow within tabpage_2
integer x = 398
integer y = 16
integer width = 526
integer height = 80
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()
end event

type tabpage_3 from userobject within tab_1
string tag = "반품내역"
integer x = 18
integer y = 112
integer width = 3863
integer height = 928
long backcolor = 79741120
string text = "반품내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Database!"
long picturemaskcolor = 536870912
cb_8 cb_8
cb_7 cb_7
em_5 em_5
em_4 em_4
st_9 st_9
dw_area2 dw_area2
st_8 st_8
dw_8 dw_8
end type

on tabpage_3.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.em_5=create em_5
this.em_4=create em_4
this.st_9=create st_9
this.dw_area2=create dw_area2
this.st_8=create st_8
this.dw_8=create dw_8
this.Control[]={this.cb_8,&
this.cb_7,&
this.em_5,&
this.em_4,&
this.st_9,&
this.dw_area2,&
this.st_8,&
this.dw_8}
end on

on tabpage_3.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.em_5)
destroy(this.em_4)
destroy(this.st_9)
destroy(this.dw_area2)
destroy(this.st_8)
destroy(this.dw_8)
end on

type cb_8 from commandbutton within tabpage_3
integer x = 3177
integer y = 12
integer width = 229
integer height = 84
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이동"
end type

event clicked;dw_1.reset()
dw_1.insertrow(0)
tab_1.tabpage_1.dw_6.reset()

wf_move2()

tab_1.selecttab(1)
end event

type cb_7 from commandbutton within tabpage_3
integer x = 2889
integer y = 12
integer width = 279
integer height = 84
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_sdate, ls_edate, ls_salesman, ls_area, ls_openclose, ls_calctime, ls_ssale_date

//ddlb_fld.reset()
//ddlb_dwtitles.reset()
//ddlb_dwtitles.visible = false

ls_sdate = tab_1.tabpage_3.em_4.text
ls_edate = tab_1.tabpage_3.em_5.text



// 사업장
tab_1.tabpage_3.dw_area2.accepttext()
ls_area     = tab_1.tabpage_3.dw_area2.object.area[1]

if ls_area <> '%' then
	ls_area = '%'+ls_area+'%'
end if


tab_1.tabpage_3.dw_8.retrieve( ls_area, ls_sdate, ls_edate)
//엑셀 출력용 2017.12.13 조원석 추가 

if tab_1.tabpage_3.dw_8.rowcount() < 1 then
	MessageBox("확인","해당월에 조회한 자료가 없습니다",Exclamation!)
else
	MessageBox("확인","조회완료")
end if

end event

type em_5 from editmask within tabpage_3
integer x = 1655
integer y = 16
integer width = 361
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type em_4 from editmask within tabpage_3
integer x = 1289
integer y = 16
integer width = 361
integer height = 72
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type st_9 from statictext within tabpage_3
integer x = 946
integer y = 16
integer width = 334
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "반품일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area2 from datawindow within tabpage_3
integer x = 398
integer y = 16
integer width = 526
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()
end event

type st_8 from statictext within tabpage_3
integer x = 55
integer y = 16
integer width = 334
integer height = 80
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

type dw_8 from datawindow within tabpage_3
integer y = 108
integer width = 3333
integer height = 900
integer taborder = 10
string title = "none"
string dataobject = "d_icitemstock_new_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


this.ScrollToRow( row )
this.SelectRow( row, NOT this.IsSelected(row) )
end event

type pb_excel from picturebutton within w_icitemstock_m
event mousemove pbm_mousemove
integer x = 2661
integer y = 80
integer width = 187
integer height = 144
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"엑셀저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dw_xls

//if cbx_stock.checked = true then
//	dwxls = dw_2
//else
	dw_xls = dw_2
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_xls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_xls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

