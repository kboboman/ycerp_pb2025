$PBExportHeader$w_mpsfcrel_r.srw
$PBExportComments$작업지시서 발행(1998/05/08, 이인호)
forward 
global type w_mpsfcrel_r from w_inheritance
end type
type em_1 from editmask within w_mpsfcrel_r
end type
type dw_4 from datawindow within w_mpsfcrel_r
end type
type cbx_1 from checkbox within w_mpsfcrel_r
end type
type tab_1 from tab within w_mpsfcrel_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_mpsfcrel_r
tabpage_1 tabpage_1
end type
type cbx_2 from checkbox within w_mpsfcrel_r
end type
type dw_5 from datawindow within w_mpsfcrel_r
end type
type rb_1 from radiobutton within w_mpsfcrel_r
end type
type rb_2 from radiobutton within w_mpsfcrel_r
end type
type st_2 from statictext within w_mpsfcrel_r
end type
type st_4 from statictext within w_mpsfcrel_r
end type
type ddlb_fld from dropdownlistbox within w_mpsfcrel_r
end type
type st_5 from statictext within w_mpsfcrel_r
end type
type ddlb_op from dropdownlistbox within w_mpsfcrel_r
end type
type sle_value from singlelineedit within w_mpsfcrel_r
end type
type cb_1 from commandbutton within w_mpsfcrel_r
end type
type cb_2 from commandbutton within w_mpsfcrel_r
end type
type cb_3 from commandbutton within w_mpsfcrel_r
end type
type cb_5 from commandbutton within w_mpsfcrel_r
end type
type gb_4 from groupbox within w_mpsfcrel_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcrel_r
end type
type st_6 from statictext within w_mpsfcrel_r
end type
type dw_area from datawindow within w_mpsfcrel_r
end type
end forward

global type w_mpsfcrel_r from w_inheritance
integer width = 4347
integer height = 2392
string title = "작업지시서 발행(w_mpsfcrel_r)"
em_1 em_1
dw_4 dw_4
cbx_1 cbx_1
tab_1 tab_1
cbx_2 cbx_2
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
st_2 st_2
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
dw_area dw_area
end type
global w_mpsfcrel_r w_mpsfcrel_r

type variables
st_print i_print
string is_wcno, is_mess
date id_date
datawindowchild idwc_area, idwc_wc
end variables

forward prototypes
public subroutine wf_sfcrel_insert (string as_fact)
end prototypes

public subroutine wf_sfcrel_insert (string as_fact);//
string  ls_cust, ls_scene, ls_itemno, ls_qa, ls_uom
decimal lr_qty
long    ll_cnt , ll_row , ll_dw1row
datawindow dw3

dw3 = tab_1.tabpage_1.dw_3
ll_cnt = dw3.rowcount()

for ll_row = 1 to ll_cnt step 10
	ll_dw1row = dw_1.insertrow(0)

	if as_fact <> '1' then
		dw_1.object.order_no[ll_dw1row] = dw_4.object.order_no[dw_4.getrow()]
	end if
	dw_1.object.start_date[ll_dw1row] = datetime(id_date)
	dw_1.object.work_name[ll_dw1row]  = idwc_wc.GetItemString(idwc_wc.getrow(), "work_name")

// 1
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq1[ll_dw1row]  = dw3.object.priority[ll_row]
	dw_1.object.desc1[ll_dw1row] = dw3.object.mpsdet_rem[ll_row]
// dw_1.object.item_no1[ll_dw1row] = dw3.object.item_no[ll_row]
	dw_1.object.qa1[ll_dw1row]   = dw3.object.qa[ll_row]
	dw_1.object.name1[ll_dw1row] = dw3.object.groupitem_item_name[ll_row]
	dw_1.object.uom1[ll_dw1row]  = dw3.object.uom[ll_row]
	dw_1.object.qty1[ll_dw1row]  = dw3.object.order_qty[ll_row]
	dw_1.object.c1[ll_dw1row]    = dw3.object.color_color_name[ll_row]
	dw_1.object.cust1[ll_dw1row] = ls_cust + ls_scene
	
	if as_fact = '1' then
		dw_1.object.muom1[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row]
		
		ls_itemno  = dw3.object.item_no[ll_row]
		ls_qa      = dw3.object.qa[ll_row]
		ls_uom     = dw3.object.mpsdet_uom[ll_row]
		lr_qty     = dw3.object.order_qty[ll_row]
		dw_1.object.planq1[ll_dw1row] = GF_GetQTY(ls_itemno, ls_qa, ls_uom, lr_qty)
	else
		dw_1.object.planq1[ll_dw1row] = dw3.object.rcpt_qty[ll_row]
	end if
					
//	mpsdet_rem
//	messagebox  ('1', '1')
	if ll_cnt < ll_row + 1 then EXIT
	
// 2
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 1])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 1])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq2[ll_dw1row]  = dw3.object.priority[ll_row + 1]
	dw_1.object.desc2[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 1]
// dw_1.object.item_no2[ll_dw1row] = dw3.object.item_no[ll_row + 1]
	dw_1.object.qa2[ll_dw1row]   = dw3.object.qa[ll_row + 1]
	dw_1.object.name2[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 1]
	dw_1.object.uom2[ll_dw1row]  = dw3.object.uom[ll_row + 1]
	dw_1.object.qty2[ll_dw1row]  = dw3.object.order_qty[ll_row + 1]
	dw_1.object.c2[ll_dw1row]    = dw3.object.color_color_name[ll_row + 1]
	dw_1.object.cust2[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom2[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 1]

		ls_itemno  = dw3.object.item_no[ll_row + 1]
		ls_qa      = dw3.object.qa[ll_row + 1]
		ls_uom     = dw3.object.mpsdet_uom[ll_row + 1]
		lr_qty     = dw3.object.order_qty[ll_row + 1]
		dw_1.object.planq2[ll_dw1row] = gf_getqty(ls_itemno, ls_qa, ls_uom, lr_qty)
	else
		dw_1.object.planq2[ll_dw1row] = dw3.object.rcpt_qty[ll_row]
	end if
//	messagebox  ('2', '2')
	if ll_cnt < ll_row + 2 then EXIT
	
// 3
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 2])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 2])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq3[ll_dw1row]  = dw3.object.priority[ll_row + 2]
	dw_1.object.desc3[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 2]
// 	dw_1.object.item_no3[ll_dw1row] = dw3.object.item_no[ll_row + 2]
	dw_1.object.qa3[ll_dw1row]   = dw3.object.qa[ll_row + 2]
	dw_1.object.name3[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 2]
	dw_1.object.uom3[ll_dw1row]  = dw3.object.uom[ll_row + 2]
	dw_1.object.qty3[ll_dw1row]  = dw3.object.order_qty[ll_row + 2]
	dw_1.object.c3[ll_dw1row]    = dw3.object.color_color_name[ll_row + 2]
	dw_1.object.cust3[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom3[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 2]
		dw_1.object.planq3[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 2], &
																dw3.object.qa[ll_row + 2], &
																dw3.object.mpsdet_uom[ll_row + 2], &
																dw3.object.order_qty[ll_row + 2])
	else
		dw_1.object.planq3[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 2]
	end if
//	messagebox  ('2', '3')
	IF ll_cnt < ll_row + 3 then EXIT
	
// 4
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 3])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 3])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''
	
	dw_1.object.seq4[ll_dw1row]  = dw3.object.priority[ll_row + 3]
	dw_1.object.desc4[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 3]
// 	dw_1.object.item_no4[ll_dw1row] = dw3.object.item_no[ll_row + 3]
	dw_1.object.qa4[ll_dw1row]   = dw3.object.qa[ll_row + 3]
	dw_1.object.name4[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 3]
	dw_1.object.uom4[ll_dw1row]  = dw3.object.uom[ll_row + 3]
	dw_1.object.qty4[ll_dw1row]  = dw3.object.order_qty[ll_row + 3]
	dw_1.object.c4[ll_dw1row]    = dw3.object.color_color_name[ll_row + 3]
	dw_1.object.cust4[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom4[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row + 3]
		dw_1.object.planq4[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 3], &
																dw3.object.qa[ll_row + 3], &
																dw3.object.mpsdet_uom[ll_row + 3], &
																dw3.object.order_qty[ll_row + 3])
	else
		dw_1.object.planq4[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 3]
	end if
//	messagebox  ('2', '4')
	IF ll_cnt < ll_row + 4 then EXIT
	
// 5
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 4])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 4])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq5[ll_dw1row]  = dw3.object.priority[ll_row + 4]
	dw_1.object.desc5[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 4]
// 	dw_1.object.item_no5[ll_dw1row] = dw3.object.item_no[ll_row + 4]
	dw_1.object.qa5[ll_dw1row]   = dw3.object.qa[ll_row + 4]
	dw_1.object.name5[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 4]
	dw_1.object.uom5[ll_dw1row]  = dw3.object.uom[ll_row + 4]
	dw_1.object.qty5[ll_dw1row]  = dw3.object.order_qty[ll_row + 4]
	dw_1.object.c5[ll_dw1row]    = dw3.object.color_color_name[ll_row + 4]
	dw_1.object.cust5[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom5[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row + 4]
		dw_1.object.planq5[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 4], &
																dw3.object.qa[ll_row + 4], &
																dw3.object.mpsdet_uom[ll_row + 4], &
																dw3.object.order_qty[ll_row + 4])
	else
		dw_1.object.planq5[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 4]
	end if
//	messagebox  ('2', '5')
	IF ll_cnt < ll_row + 5 then EXIT
	
// 6
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 5])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 5])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq6[ll_dw1row]  = dw3.object.priority[ll_row + 5]
	dw_1.object.desc6[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 5]
// 	dw_1.object.item_no6[ll_dw1row] = dw3.object.item_no[ll_row + 5]
	dw_1.object.qa6[ll_dw1row]   = dw3.object.qa[ll_row + 5]
	dw_1.object.name6[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 5]
	dw_1.object.uom6[ll_dw1row]  = dw3.object.uom[ll_row + 5]
	dw_1.object.qty6[ll_dw1row]  = dw3.object.order_qty[ll_row + 5]
	dw_1.object.c6[ll_dw1row]    = dw3.object.color_color_name[ll_row + 5]
	dw_1.object.cust6[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom6[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row + 5]
		dw_1.object.planq6[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 5], &
																dw3.object.qa[ll_row + 5], &
																dw3.object.mpsdet_uom[ll_row + 5], &
																dw3.object.order_qty[ll_row + 5])
	else
		dw_1.object.planq6[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 5]
	end if
//	messagebox  ('2', '6')
	IF ll_cnt < ll_row + 6 then EXIT
	
// 7
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 6])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 6])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq7[ll_dw1row]  = dw3.object.priority[ll_row + 6]
	dw_1.object.desc7[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 6]
// 	dw_1.object.item_no7[ll_dw1row] = dw3.object.item_no[ll_row + 6]
	dw_1.object.qa7[ll_dw1row]   = dw3.object.qa[ll_row + 6]
	dw_1.object.name7[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 6]
	dw_1.object.uom7[ll_dw1row]  = dw3.object.uom[ll_row + 6]
	dw_1.object.qty7[ll_dw1row]  = dw3.object.order_qty[ll_row + 6]
	dw_1.object.c7[ll_dw1row]    = dw3.object.color_color_name[ll_row + 6]
	dw_1.object.cust7[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom7[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 6]
		dw_1.object.planq7[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 6], &
																dw3.object.qa[ll_row + 6], &
																dw3.object.mpsdet_uom[ll_row + 6], &
																dw3.object.order_qty[ll_row + 6])
	else
		dw_1.object.planq7[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 6]
	end if
//	messagebox  ('2', '7')
	IF ll_cnt < ll_row + 7 then EXIT
	
// 8
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 7])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 7])
	if isnull(ls_cust)  then ls_cust = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq8[ll_dw1row]  = dw3.object.priority[ll_row + 7]
	dw_1.object.desc8[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 7]
// 	dw_1.object.item_no8[ll_dw1row] = dw3.object.item_no[ll_row + 7]
	dw_1.object.qa8[ll_dw1row]   = dw3.object.qa[ll_row + 7]
	dw_1.object.name8[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 7]
	dw_1.object.uom8[ll_dw1row]  = dw3.object.uom[ll_row + 7]
	dw_1.object.qty8[ll_dw1row]  = dw3.object.order_qty[ll_row + 7]
	dw_1.object.c8[ll_dw1row]    = dw3.object.color_color_name[ll_row + 7]
	dw_1.object.cust8[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom8[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row + 7]
		dw_1.object.planq8[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 7], &
																dw3.object.qa[ll_row + 7], &
																dw3.object.mpsdet_uom[ll_row + 7], &
																dw3.object.order_qty[ll_row + 7])
	else
		dw_1.object.planq8[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 7]
	end if
//	messagebox  ('2', '8')
	IF ll_cnt < ll_row + 8 then EXIT
	
// 9
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 8])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 8])
	if isnull(ls_cust)  then ls_cust = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq9[ll_dw1row]  = dw3.object.priority[ll_row + 8]
	dw_1.object.desc9[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 8]
// 	dw_1.object.item_no9[ll_dw1row] = dw3.object.item_no[ll_row + 8]
	dw_1.object.qa9[ll_dw1row]   = dw3.object.qa[ll_row + 8]
	dw_1.object.name9[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 8]
	dw_1.object.uom9[ll_dw1row]  = dw3.object.uom[ll_row + 8]
	dw_1.object.qty9[ll_dw1row]  = dw3.object.order_qty[ll_row + 8]
	dw_1.object.c9[ll_dw1row]    = dw3.object.color_color_name[ll_row + 8]
	dw_1.object.cust9[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom9[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row + 8]
		dw_1.object.planq9[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 8], &
																dw3.object.qa[ll_row + 8], &
																dw3.object.mpsdet_uom[ll_row + 8], &
																dw3.object.order_qty[ll_row + 8])
	else
		dw_1.object.planq9[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 8]
	end if
//	messagebox  ('2', '9')
	IF ll_cnt < ll_row + 9 then EXIT
	
// 10
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 9])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 9])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq10[ll_dw1row]  = dw3.object.priority[ll_row + 9]
	dw_1.object.desc10[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 9]
// 	dw_1.object.item_no10[ll_dw1row] = dw3.object.item_no[ll_row + 9]
	dw_1.object.qa10[ll_dw1row]   = dw3.object.qa[ll_row + 9]
	dw_1.object.name10[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 9]
	dw_1.object.uom10[ll_dw1row]  = dw3.object.uom[ll_row + 9]
	dw_1.object.qty10[ll_dw1row]  = dw3.object.order_qty[ll_row + 9]
	dw_1.object.c10[ll_dw1row]    = dw3.object.color_color_name[ll_row + 9]
	dw_1.object.cust10[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom10[ll_dw1row]  = dw3.object.mpsdet_uom[ll_row + 9]
		dw_1.object.planq10[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 9], &
																dw3.object.qa[ll_row + 9], &
																dw3.object.mpsdet_uom[ll_row + 9], &
																dw3.object.order_qty[ll_row + 9])
	else
		dw_1.object.planq10[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 9]
	end if
next

RETURN


end subroutine

on w_mpsfcrel_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.tab_1=create tab_1
this.cbx_2=create cbx_2
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2=create st_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.st_6
this.Control[iCurrent+22]=this.dw_area
end on

on w_mpsfcrel_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.tab_1)
destroy(this.cbx_2)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_1.visible = false
dw_5.visible = false

// 사업장 
string ls_area
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = gs_area
dw_area.object.area[1] = ls_area

// 작업장
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.setsort( "area_no A, wc_no A" )
idwc_wc.sort()
idwc_wc.setfilter( "area_no = '" + ls_area + "'" )
idwc_wc.filter()
dw_2.insertrow(0)

// 일자
em_1.text = string(today(), "YYYY/MM/DD")

rb_1.checked = True

dw_1.retrieve()

end event

event resize;call super::resize;//
long  ll_width, ll_height

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_4.height = newheight - dw_4.y - gb_2.x

tab_1.width  = newwidth  - tab_1.x - gb_2.x
tab_1.height = newheight - tab_1.y - gb_2.x

ll_width  = tab_1.tabpage_1.width
ll_height = tab_1.tabpage_1.height

tab_1.tabpage_1.dw_3.width  = ll_width
tab_1.tabpage_1.dw_3.height = ll_height


end event

type pb_save from w_inheritance`pb_save within w_mpsfcrel_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcrel_r
integer x = 55
integer y = 184
integer width = 78
integer height = 56
string dataobject = "d_mpsfcrel_r3"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsfcrel_r
integer x = 32
integer y = 20
integer width = 1056
integer height = 140
string text = "작업지시서 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcrel_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcrel_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcrel_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcrel_r
integer x = 3456
integer y = 60
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcrel_r
integer x = 3264
integer y = 60
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
gs_print_str lstr_print
string  ls_fact

if tab_1.tabpage_1.dw_3.getrow() < 1 then RETURN

SELECT fact_wc INTO :ls_fact FROM wc WHERE work_no = :is_wcno;
if gs_area = 'B0001' or gs_area = 'T0001' then
	ls_fact = 'B'
	dw_1.dataobject = 'd_mpsfcrel_r3' 		// 생산계획 번호 있음
else
	if ls_fact = '1'  then
		dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
	else
	 //dw_1.dataobject = 'd_mpsfcrel_r2'  	// 생산수량 입력 가능.
		dw_1.dataobject = 'd_mpsfcrel_r3'  	// 생산수량 입력 가능.
	end if
end if
dw_1.SetTransObject(SQLCA)

WF_SfcRel_Insert( ls_fact )

if rb_1.checked = True then
	i_print.st_datawindow  = dw_1
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획내역을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)

elseif rb_2.checked = True then
	i_print.st_datawindow  = dw_5
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 공정 이동 식별표를 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)
end if



end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcrel_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcrel_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcrel_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcrel_r
integer x = 3077
integer y = 60
integer taborder = 150
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_wcno
date   ld_date
long   ll_row

// 사업장
dw_area.AcceptText()
ls_area = dw_area.object.area[1]

//
dw_2.accepttext()
ls_wcno = dw_2.object.wc_no[1]
ld_date = date(em_1.text)

dw_4.reset()
dw_4.retrieve( ls_wcno, ld_date, ls_area )

tab_1.tabpage_1.dw_3.retrieve( ls_wcno, ld_date, ls_area )

dw_5.retrieve( ls_wcno, ld_date, ls_area )

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcrel_r
integer x = 2053
integer y = 16
integer width = 983
integer height = 212
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcrel_r
integer y = 244
integer width = 4238
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcrel_r
integer x = 3058
integer y = 16
integer width = 613
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcrel_r
integer x = 1161
integer y = 136
integer width = 864
integer height = 80
integer taborder = 60
string dataobject = "d_mpwcno_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpsfcrel_r
integer x = 2085
integer y = 140
integer width = 370
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_date = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_4 from datawindow within w_mpsfcrel_r
integer x = 27
integer y = 444
integer width = 1189
integer height = 1812
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_mpsfcrel_s1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if cbx_2.checked = true then return
if this.getrow() < 1 then return

string ls_order

if cbx_1.checked = false then
	ls_order = this.object.order_no[currentrow]
	tab_1.tabpage_1.dw_3.SetFilter("order_no = '" + ls_order + "'")
	tab_1.tabpage_1.dw_3.Filter( )
	dw_5.SetFilter("order_no = '" + ls_order + "'")
	dw_5.Filter( )
end if




end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 전체
if cbx_2.checked = true then RETURN

string ls_filter, ls_order
long   ll_row
int    li_cnt

if cbx_1.checked = true then
	this.SelectRow(row, NOT this.IsSelected(row))
	
	ls_filter = ''
	li_cnt = 0
	for ll_row = 1 to this.rowcount()
		if this.isselected(ll_row) = true then
			ls_order = this.object.order_no[ll_row]
			if li_cnt = 0 then
				ls_filter = "order_no = '" + ls_order + "'"
				li_cnt = 1
			else
				ls_filter = ls_filter + " OR order_no = '" + ls_order + "'"
			end if
		end if
	next
	
	if ls_filter = '' then
		ls_order = this.object.order_no[row]
		tab_1.tabpage_1.dw_3.SetFilter("order_no = '" + ls_order + "'")
		tab_1.tabpage_1.dw_3.Filter( )
		dw_5.SetFilter("order_no = '" + ls_order + "'")
		dw_5.Filter( )
	else
		tab_1.tabpage_1.dw_3.SetFilter(ls_filter)
		tab_1.tabpage_1.dw_3.Filter( )
		dw_5.SetFilter(ls_filter)
		dw_5.Filter( )
	end if
end if



end event

type cbx_1 from checkbox within w_mpsfcrel_r
integer x = 82
integer y = 352
integer width = 233
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
string text = "선택"
end type

type tab_1 from tab within w_mpsfcrel_r
integer x = 1243
integer y = 444
integer width = 3031
integer height = 1812
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 78160032
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2994
integer height = 1684
long backcolor = 78160032
string text = "생산계획"
long tabtextcolor = 8388608
long tabbackcolor = 78160032
string picturename = "Project!"
long picturemaskcolor = 553648127
dw_3 dw_3
end type

on tabpage_1.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_1.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_1
integer width = 2985
integer height = 1668
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpsfcrel_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cbx_2 from checkbox within w_mpsfcrel_r
integer x = 82
integer y = 292
integer width = 233
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
string text = "전체"
end type

event clicked;//
long ll_row

for ll_row = 1 to dw_4.rowcount()
	dw_4.SelectRow(ll_row, this.checked)
next

tab_1.tabpage_1.dw_3.SetFilter("")
tab_1.tabpage_1.dw_3.Filter( )

dw_5.SetFilter("")
dw_5.Filter( )

end event

type dw_5 from datawindow within w_mpsfcrel_r
integer x = 165
integer y = 184
integer width = 78
integer height = 56
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcrel_r4"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_mpsfcrel_r
integer x = 2473
integer y = 76
integer width = 411
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "작업지시서"
end type

type rb_2 from radiobutton within w_mpsfcrel_r
integer x = 2473
integer y = 156
integer width = 544
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "공정이동식별표"
end type

type st_2 from statictext within w_mpsfcrel_r
integer x = 2085
integer y = 56
integer width = 370
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsfcrel_r
integer x = 334
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

type ddlb_fld from dropdownlistbox within w_mpsfcrel_r
integer x = 521
integer y = 304
integer width = 443
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

type st_5 from statictext within w_mpsfcrel_r
integer x = 992
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

type ddlb_op from dropdownlistbox within w_mpsfcrel_r
integer x = 1161
integer y = 304
integer width = 297
integer height = 512
integer taborder = 130
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

type sle_value from singlelineedit within w_mpsfcrel_r
integer x = 1481
integer y = 312
integer width = 526
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

type cb_1 from commandbutton within w_mpsfcrel_r
integer x = 2025
integer y = 312
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

arg_dw  = tab_1.tabpage_1.dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsfcrel_r
integer x = 2190
integer y = 312
integer width = 160
integer height = 76
integer taborder = 120
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

arg_dw  = tab_1.tabpage_1.dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsfcrel_r
integer x = 2354
integer y = 312
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = tab_1.tabpage_1.dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsfcrel_r
integer x = 2519
integer y = 312
integer width = 160
integer height = 76
integer taborder = 140
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

arg_dw  = tab_1.tabpage_1.dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_mpsfcrel_r
integer x = 1143
integer y = 16
integer width = 891
integer height = 216
integer taborder = 41
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsfcrel_r
integer x = 553
integer y = 316
integer width = 311
integer height = 88
integer taborder = 130
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

type st_6 from statictext within w_mpsfcrel_r
integer x = 1166
integer y = 52
integer width = 210
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpsfcrel_r
integer x = 1376
integer y = 52
integer width = 526
integer height = 84
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area, ls_defloc

this.accepttext()
ls_area = data	// this.object.area[this.getrow()]

idwc_wc.setsort( "area_no A, wc_no A" )
idwc_wc.sort()
idwc_wc.setfilter( "area_no = '" + ls_area + "'" )
idwc_wc.filter()

end event

