$PBExportHeader$w_mpsfcrel_m.srw
$PBExportComments$작업지시서 발행(1998/05/08, 이인호)
forward
global type w_mpsfcrel_m from w_inheritance
end type
type dw_4 from datawindow within w_mpsfcrel_m
end type
type tab_1 from tab within w_mpsfcrel_m
end type
type tabpage_1 from userobject within tab_1
end type
type st_1 from statictext within tabpage_1
end type
type cb_6 from commandbutton within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_1 st_1
cb_6 cb_6
cb_5 cb_5
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_2
end type
type cbx_3 from checkbox within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_7 dw_7
cbx_3 cbx_3
cb_1 cb_1
dw_6 dw_6
end type
type tab_1 from tab within w_mpsfcrel_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_5 from datawindow within w_mpsfcrel_m
end type
type rb_1 from radiobutton within w_mpsfcrel_m
end type
type rb_2 from radiobutton within w_mpsfcrel_m
end type
type cbx_1 from checkbox within w_mpsfcrel_m
end type
type em_1 from editmask within w_mpsfcrel_m
end type
type dw_area from datawindow within w_mpsfcrel_m
end type
type st_2 from statictext within w_mpsfcrel_m
end type
type gb_4 from groupbox within w_mpsfcrel_m
end type
end forward

global type w_mpsfcrel_m from w_inheritance
integer width = 4690
integer height = 2572
string title = "작업지시서 발행(w_mpsfcrel_m)"
dw_4 dw_4
tab_1 tab_1
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
cbx_1 cbx_1
em_1 em_1
dw_area dw_area
st_2 st_2
gb_4 gb_4
end type
global w_mpsfcrel_m w_mpsfcrel_m

type variables
st_print i_print
string is_wcno, is_mess
date id_date
datawindowchild idwc_wc
datawindow dw3,dw6,dw7
end variables

forward prototypes
public subroutine wf_sfcrel_insert (string as_fact)
end prototypes

public subroutine wf_sfcrel_insert (string as_fact);long   ll_cnt , ll_row , ll_dw1row
string ls_cust, ls_scene, ls_orderno, ls_overtime, ls_remark

// 지시내역
ll_cnt = dw3.rowcount()

ls_orderno = dw_4.object.order_no[dw_4.getrow()]
SELECT overtime, rem INTO :ls_overtime, :ls_remark
  FROM MPSORDER 
 WHERE ORDER_NO = :ls_orderno;
 
for ll_row = 1 to ll_cnt step 10
	ll_dw1row = dw_1.insertrow(0)

	dw_1.object.start_date[ll_dw1row] = datetime(id_date)
	dw_1.object.orderno[ll_dw1row]    = "*" + ls_orderno + "*"
	dw_1.object.orderno1[ll_dw1row]   = "*" + ls_orderno + "*"
	dw_1.object.orderno2[ll_dw1row]   = ls_orderno
	dw_1.object.overtime[ll_dw1row]   = ls_overtime
	dw_1.object.remark[ll_dw1row]     = ls_remark
	dw_1.object.work_name[ll_dw1row]  = dw_4.object.wc_work_name[dw_4.getrow()]
	
// 1행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''
	
	dw_1.object.seq1[ll_dw1row]  = dw3.object.order_seq[ll_row]
	dw_1.object.desc1[ll_dw1row] = dw3.object.mpsdet_rem[ll_row]
	dw_1.object.qa1[ll_dw1row]   = dw3.object.qa[ll_row]
	dw_1.object.name1[ll_dw1row] = dw3.object.groupitem_item_name[ll_row]
	dw_1.object.uom1[ll_dw1row]  = dw3.object.uom[ll_row]
	dw_1.object.qty1[ll_dw1row]  = dw3.object.order_qty[ll_row]
	dw_1.object.c1[ll_dw1row]    = dw3.object.color_color_name[ll_row]
	dw_1.object.cust1[ll_dw1row] = ls_cust + ls_scene	
	dw_1.object.saleno01[ll_dw1row]     = dw3.object.sale_no[ll_row]
	dw_1.object.work_manager[ll_dw1row] = dw3.object.wc_work_manager[ll_row]
	
	dw_1.object.muom1[ll_dw1row] = dw3.object.mpsdet_uom[ll_row]
	if as_fact = '1' then
		dw_1.object.planq1[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row], &
																dw3.object.qa[ll_row], &
																dw3.object.mpsdet_uom[ll_row], &
																dw3.object.order_qty[ll_row])
	else
		dw_1.object.planq1[ll_dw1row] = dw3.object.rcpt_qty[ll_row]
	end if
	IF ll_cnt < ll_row + 1 then EXIT
	
// 2행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 1])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 1])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq2[ll_dw1row]  = dw3.object.order_seq[ll_row + 1]
	dw_1.object.desc2[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 1]
	dw_1.object.qa2[ll_dw1row]   = dw3.object.qa[ll_row + 1]
	dw_1.object.name2[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 1]
	dw_1.object.uom2[ll_dw1row]  = dw3.object.uom[ll_row + 1]
	dw_1.object.qty2[ll_dw1row]  = dw3.object.order_qty[ll_row + 1]
	dw_1.object.c2[ll_dw1row]    = dw3.object.color_color_name[ll_row + 1]
	dw_1.object.cust2[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno02[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom2[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 1]
	if as_fact = '1' then
		dw_1.object.planq2[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 1], &
																dw3.object.qa[ll_row + 1], &
																dw3.object.mpsdet_uom[ll_row + 1], &
																dw3.object.order_qty[ll_row + 1])
	else
		dw_1.object.planq2[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 1]
	end if
	IF ll_cnt < ll_row + 2 then EXIT
	
// 3행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 2])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 2])
	if isnull(ls_cust)  then ls_cust = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq3[ll_dw1row]  = dw3.object.order_seq[ll_row + 2]
	dw_1.object.desc3[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 2]
	dw_1.object.qa3[ll_dw1row]   = dw3.object.qa[ll_row + 2]
	dw_1.object.name3[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 2]
	dw_1.object.uom3[ll_dw1row]  = dw3.object.uom[ll_row + 2]
	dw_1.object.qty3[ll_dw1row]  = dw3.object.order_qty[ll_row + 2]
	dw_1.object.c3[ll_dw1row]    = dw3.object.color_color_name[ll_row + 2]
	dw_1.object.cust3[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno03[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom3[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 2]
	if as_fact = '1' then
		dw_1.object.planq3[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 2], &
																dw3.object.qa[ll_row + 2], &
																dw3.object.mpsdet_uom[ll_row + 2], &
																dw3.object.order_qty[ll_row + 2])
	else
		dw_1.object.planq3[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 2]
	end if
	IF ll_cnt < ll_row + 3 then EXIT
	
// 4행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 3])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 3])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq4[ll_dw1row]  = dw3.object.order_seq[ll_row + 3]
	dw_1.object.desc4[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 3]
	dw_1.object.qa4[ll_dw1row]   = dw3.object.qa[ll_row + 3]
	dw_1.object.name4[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 3]
	dw_1.object.uom4[ll_dw1row]  = dw3.object.uom[ll_row + 3]
	dw_1.object.qty4[ll_dw1row]  = dw3.object.order_qty[ll_row + 3]
	dw_1.object.c4[ll_dw1row]    = dw3.object.color_color_name[ll_row + 3]
	dw_1.object.cust4[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno04[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom4[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 3]
	if as_fact = '1' then
		dw_1.object.planq4[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 3], &
																dw3.object.qa[ll_row + 3], &
																dw3.object.mpsdet_uom[ll_row + 3], &
																dw3.object.order_qty[ll_row + 3])
	else
		dw_1.object.planq4[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 3]
	end if
	IF ll_cnt < ll_row + 4 then EXIT
	
// 5행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 4])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 4])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq5[ll_dw1row]  = dw3.object.order_seq[ll_row + 4]
	dw_1.object.desc5[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 4]
	dw_1.object.qa5[ll_dw1row]   = dw3.object.qa[ll_row + 4]
	dw_1.object.name5[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 4]
	dw_1.object.uom5[ll_dw1row]  = dw3.object.uom[ll_row + 4]
	dw_1.object.qty5[ll_dw1row]  = dw3.object.order_qty[ll_row + 4]
	dw_1.object.c5[ll_dw1row]    = dw3.object.color_color_name[ll_row + 4]
	dw_1.object.cust5[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno05[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom5[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 4]
	if as_fact = '1' then
		dw_1.object.planq5[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 4], &
																dw3.object.qa[ll_row + 4], &
																dw3.object.mpsdet_uom[ll_row + 4], &
																dw3.object.order_qty[ll_row + 4])
	else
		dw_1.object.planq5[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 4]
	end if
	IF ll_cnt < ll_row + 5 then EXIT
	
// 6행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 5])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 5])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq6[ll_dw1row]  = dw3.object.order_seq[ll_row + 5]
	dw_1.object.desc6[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 5]
	dw_1.object.qa6[ll_dw1row]   = dw3.object.qa[ll_row + 5]
	dw_1.object.name6[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 5]
	dw_1.object.uom6[ll_dw1row]  = dw3.object.uom[ll_row + 5]
	dw_1.object.qty6[ll_dw1row]  = dw3.object.order_qty[ll_row + 5]
	dw_1.object.c6[ll_dw1row]    = dw3.object.color_color_name[ll_row + 5]
	dw_1.object.cust6[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno06[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom6[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 5]
	if as_fact = '1' then
		dw_1.object.planq6[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 5], &
																dw3.object.qa[ll_row + 5], &
																dw3.object.mpsdet_uom[ll_row + 5], &
																dw3.object.order_qty[ll_row + 5])
	else
		dw_1.object.planq6[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 5]
	end if
	IF ll_cnt < ll_row + 6 then EXIT
	
// 7행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 6])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 6])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq7[ll_dw1row]  = dw3.object.order_seq[ll_row + 6]
	dw_1.object.desc7[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 6]
	dw_1.object.qa7[ll_dw1row]   = dw3.object.qa[ll_row + 6]
	dw_1.object.name7[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 6]
	dw_1.object.uom7[ll_dw1row]  = dw3.object.uom[ll_row + 6]
	dw_1.object.qty7[ll_dw1row]  = dw3.object.order_qty[ll_row + 6]
	dw_1.object.c7[ll_dw1row]    = dw3.object.color_color_name[ll_row + 6]
	dw_1.object.cust7[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno07[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom7[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 6]
	if as_fact = '1' then
		dw_1.object.planq7[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 6], &
																dw3.object.qa[ll_row + 6], &
																dw3.object.mpsdet_uom[ll_row + 6], &
																dw3.object.order_qty[ll_row + 6])
	else
		dw_1.object.planq7[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 6]
	end if
	IF ll_cnt < ll_row + 7 then EXIT
	
// 8행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 7])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 7])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq8[ll_dw1row]  = dw3.object.order_seq[ll_row + 7]
	dw_1.object.desc8[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 7]
	dw_1.object.qa8[ll_dw1row]   = dw3.object.qa[ll_row + 7]
	dw_1.object.name8[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 7]
	dw_1.object.uom8[ll_dw1row]  = dw3.object.uom[ll_row + 7]
	dw_1.object.qty8[ll_dw1row]  = dw3.object.order_qty[ll_row + 7]
	dw_1.object.c8[ll_dw1row]    = dw3.object.color_color_name[ll_row + 7]
	dw_1.object.cust8[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno08[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom8[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 7]
	if as_fact = '1' then
		dw_1.object.planq8[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 7], &
																dw3.object.qa[ll_row + 7], &
																dw3.object.mpsdet_uom[ll_row + 7], &
																dw3.object.order_qty[ll_row + 7])
	else
		dw_1.object.planq8[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 7]
	end if
	IF ll_cnt < ll_row + 8 then EXIT
	
// 9행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 8])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 8])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq9[ll_dw1row]  = dw3.object.order_seq[ll_row + 8]
	dw_1.object.desc9[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 8]
	dw_1.object.qa9[ll_dw1row]   = dw3.object.qa[ll_row + 8]
	dw_1.object.name9[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 8]
	dw_1.object.uom9[ll_dw1row]  = dw3.object.uom[ll_row + 8]
	dw_1.object.qty9[ll_dw1row]  = dw3.object.order_qty[ll_row + 8]
	dw_1.object.c9[ll_dw1row]    = dw3.object.color_color_name[ll_row + 8]
	dw_1.object.cust9[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno09[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom9[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 8]
	if as_fact = '1' then
		dw_1.object.planq9[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 8], &
																dw3.object.qa[ll_row + 8], &
																dw3.object.mpsdet_uom[ll_row + 8], &
																dw3.object.order_qty[ll_row + 8])
	else
		dw_1.object.planq9[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 8]
	end if
	IF ll_cnt < ll_row + 9 then EXIT
	
// 10행
	ls_cust  = trim(dw3.object.customer_cust_name[ll_row + 9])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 9])
	if isnull(ls_cust)  then ls_cust  = ''
	if isnull(ls_scene) then ls_scene = ''

	dw_1.object.seq10[ll_dw1row]  = dw3.object.order_seq[ll_row + 9]
	dw_1.object.desc10[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 9]
	dw_1.object.qa10[ll_dw1row]   = dw3.object.qa[ll_row + 9]
	dw_1.object.name10[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 9]
	dw_1.object.uom10[ll_dw1row]  = dw3.object.uom[ll_row + 9]
	dw_1.object.qty10[ll_dw1row]  = dw3.object.order_qty[ll_row + 9]
	dw_1.object.c10[ll_dw1row]    = dw3.object.color_color_name[ll_row + 9]
	dw_1.object.cust10[ll_dw1row] = ls_cust + ls_scene
	dw_1.object.saleno10[ll_dw1row]     = dw3.object.sale_no[ll_row]
	
	dw_1.object.muom10[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 9]
	if as_fact = '1' then
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

on w_mpsfcrel_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.tab_1=create tab_1
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_1=create cbx_1
this.em_1=create em_1
this.dw_area=create dw_area
this.st_2=create st_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.dw_area
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.gb_4
end on

on w_mpsfcrel_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.tab_1)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_1)
destroy(this.em_1)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw3 = tab_1.tabpage_1.dw_3
dw6 = tab_1.tabpage_2.dw_6
dw7 = tab_1.tabpage_2.dw_7
dw3.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)

dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.visible = false
dw_5.visible = false
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)

em_1.text = string(today(), "YYYY/MM/DD")
id_date   = date(string(today(), "YYYY/MM/DD"))
is_mess   = "오늘 일자에는  "
pb_insert.postevent(clicked!)

end event

event resize;call super::resize;// 작업지시서 목록
//dw_4.width  = this.width  - 3753
dw_4.height = this.height - 524

tab_1.width  = this.width  - 1015
tab_1.height = this.height - 516

// 지시내역
tab_1.tabpage_1.dw_3.width  = this.width  - 1065
tab_1.tabpage_1.dw_3.height = this.height - 772

// 미지시내역
//tab_1.tabpage_2.dw_7.width  = this.width  - 3991
tab_1.tabpage_2.dw_7.height = this.height - 772

tab_1.tabpage_2.dw_6.width  = this.width  - 1760
tab_1.tabpage_2.dw_6.height = this.height - 772

end event

type pb_save from w_inheritance`pb_save within w_mpsfcrel_m
integer x = 4219
integer y = 56
integer taborder = 40
end type

event pb_save::clicked;call super::clicked;date    ld_date
long    ll_row
integer li_num
string  ls_date, ls_num, ls_like, ls_order, ls_area, ls_flag, ls_loc

dw3.accepttext()
dw_2.accepttext()
if dw3.rowcount()  < 1 then return
if dw_2.rowcount() < 1 then return

ls_order = dw_2.object.order_no[1]
ls_flag  = trim(dw_2.object.wc_no[1])
if isnull(ls_flag) or ls_flag = '' then
	messagebox("확인","작업장을 선택하십시요")
	dw_2.setcolumn('wc_no')
	dw_2.setfocus()
	return
end if

if isnull(ls_order) or trim(ls_order) = '' then
	ls_area = LeftA(dw_area.object.area[1],1)
	ls_flag = trim(dw_2.object.wc_no[1])
	ls_date = string(dw_2.object.order_date[1],'yyyymmdd')
	ls_like = ls_area + ls_flag + ls_date + '%'
	SELECT max(order_no) INTO :ls_order FROM mpsorder  WHERE order_no  LIKE :ls_like;
	if sqlca.sqlcode < 0 then
		messagebox("오류","수행중 오류가 발생했습니다.",exclamation!)
		return
	else
		if isnull(ls_order) then
			ls_order = ls_area + ls_flag + ls_date + '-01'
		else
			ls_order = trim(ls_order)
			li_num   = integer(RightA(ls_order,2))
			li_num++
			ls_num   = RightA('000' + string(li_num),2)
			ls_order = ls_area + ls_flag + ls_date + "-" + ls_num
		end if
	end if
end if

//////////////////////////////////////////////////////////////////////////////////
// mpsdet 중복 작업지시 체크
//////////////////////////////////////////////////////////////////////////////////
if ls_flag = "P01" or ls_flag = "P02" then  // 도장1,2호기 이면
	// mpsdet 중복 작업지시 방지 해야함(현장과 사무실 동일화면 작업시 발생함) //
	// 작업장, 수주번호, 수주순번, 품목, 규격, 지시수량, 주문수량, 색상, 비고 
	string ls_dw3_wcno,  ls_dw3_saleno,     ls_dw3_item, ls_dw3_qa, ls_dw3_color
	string ls_dw3_bigo,  ls_mpsorder_order, ls_division
	long   ll_dw3_seqno, ll_dw3_orderqty,   ll_findcnt                                                                            
	for ll_row = 1 to dw3.rowcount()                                                                  
		ls_dw3_wcno     = dw_2.object.wc_no[1]
		ls_dw3_saleno   = dw3.object.sale_no[ll_row]
		ll_dw3_seqno    = dw3.object.seq_no[ll_row]
		ls_dw3_item     = dw3.object.item_no[ll_row]
		ls_dw3_qa       = dw3.object.qa[ll_row]
		ll_dw3_orderqty = dw3.object.order_qty[ll_row]
		ls_dw3_color    = dw3.object.item_color[ll_row]
		ls_dw3_bigo     = dw3.object.mpsdet_rem[ll_row] 
		SELECT mpsorder_order INTO :ls_mpsorder_order 
		  FROM MPSDET
		 WHERE wc_no      = :ls_dw3_wcno  AND sale_no = :ls_dw3_saleno  AND seq_no    = :ll_dw3_seqno
			AND item_no    = :ls_dw3_item  AND qa      = :ls_dw3_qa      AND order_qty = :ll_dw3_orderqty
			AND item_color = :ls_dw3_color AND rem     = :ls_dw3_bigo;
		if ls_mpsorder_order <> "" then
			if MessageBox("확인", "[" + STRING(ll_row) + "행 " + ls_mpsorder_order + "] 중복된 작업 지시서 입니다.~n~n" + &
			                      "작업실적 처리시 오류가 발생할 수 도 있습니다.~n~n" + &
										 "작업을 계속 진행 하시겠습니까?(도장1,2호기만 중복체크)",Exclamation!, OKCancel!, 2) = 2 then
				RETURN
			end if
		end if
	next                                                                                              
end if
//////////////////////////////////////////////////////////////////////////////////

//SF0520040226-01
dw_2.object.order_no[1] = ls_order
for ll_row = 1 to dw3.rowcount()
	dw3.SetItemStatus(ll_row, 0, Primary!, DataModified!)
	dw3.object.order_seq[ll_row]      = ll_row
	dw3.object.mpsorder_order[ll_row] = ls_order
next

dw_2.accepttext()
dw3.accepttext()
if wf_update2(dw_2,dw3, 'Y') = true then
	pb_retrieve.postevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_mpsfcrel_m
integer x = 1230
integer y = 52
integer width = 101
integer height = 76
integer taborder = 60
string title = "생산목표  및  실적"
string dataobject = "d_mpsfcrel_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcrel_m
integer x = 23
integer y = 252
integer width = 4581
integer height = 92
integer taborder = 80
string dataobject = "d_mpsfcrel_m1"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;long ll_row

this.accepttext()
is_wcno = dw_2.object.wc_no[1]
id_date = date(dw_2.object.order_date[1])

end event

type st_title from w_inheritance`st_title within w_mpsfcrel_m
integer x = 14
integer y = 40
integer width = 1111
string text = "작업지시서 발행"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcrel_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcrel_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcrel_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_mpsfcrel_m
integer x = 4411
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcrel_m
integer x = 2857
integer y = 56
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print
string ls_order, ls_fact

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

is_wcno = dw_2.object.wc_no[1]
if rb_1.checked = True then		// 작업지시서
	if dw3.rowcount() < 1 then return
	
	SELECT fact_wc INTO :ls_fact FROM wc WHERE work_no = :is_wcno;
	if dw_area.object.area[1] = 'B0001' or dw_area.object.area[1] = 'T0001' then
		ls_fact = 'B'
		dw_1.dataobject = 'd_mpsfcrel_r3' 		// 생산수량 입력 가능(생산계획 번호 있음).
	else
		if ls_fact = '1'  then
			dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
		else
			dw_1.dataobject = 'd_mpsfcrel_r3'  	// 생산수량 입력 가능(생산계획 번호 있음).
		end if
	end if	
	dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
	dw_1.SetTransObject(SQLCA)

	// ls_fact( B : 반월, T : 화성 )
	wf_sfcrel_insert(ls_fact)
	
	i_print.st_datawindow  = dw_1
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획내역을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)
	
elseif rb_2.checked = True then		// 공정이동식별표
	ls_order = dw_4.object.order_no[dw_4.getrow()]
	if dw_5.retrieve(ls_order) < 1 then return
	
	i_print.st_datawindow  = dw_5
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 공정 이동 식별표를 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcrel_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcrel_m
integer x = 4027
integer y = 56
integer taborder = 170
end type

event pb_delete::clicked;call super::clicked;long   ll_row, ll_cnt
string ls_order

dw3.accepttext()
if messagebox("확인", "작업지시내역을 삭제하시겠습니까", Exclamation!, OKCancel!, 2) = 2 then return
if dw3.rowcount() < 1 then return

setnull(ls_order)
setnull(ll_cnt)
for ll_row = 1 to dw3.rowcount()
	dw3.object.order_seq[ll_row]      = ll_cnt
	dw3.object.mpsorder_order[ll_row] = ls_order
next

dw_2.deleterow(1)
dw_2.accepttext()
dw3.accepttext()
if wf_update2(dw_2,dw3, 'Y') = true then
	pb_insert.triggerevent(clicked!)
	pb_retrieve.postevent(clicked!)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpsfcrel_m
integer x = 3835
integer y = 56
integer taborder = 180
end type

event pb_insert::clicked;call super::clicked;//
dw_2.setredraw(false)

dw_2.reset()
dw3.reset()
dw_4.reset()
dw6.reset()
dw7.reset()

cbx_1.checked = false // 추가 지시

// MPSORDER
dw_2.insertrow(0)
dw_2.object.order_date[1] = datetime(date(em_1.text))
dw_2.object.wc_no[1]      = is_wcno
dw_2.object.planner[1]    = gs_userid
dw_2.object.area_no[1]    = dw_area.object.area[1]
dw_2.accepttext()

dw_2.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcrel_m
integer x = 3643
integer y = 56
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_falg[4]

if tab_1.SelectedTab = 2 and cbx_1.checked = true then
else
	dw3.reset()
	dw_4.reset()
	dw6.reset()
	dw7.reset()
end if

dw_2.accepttext( )
id_date = date(em_1.text)
if isnull(id_date) then	return

dw_2.accepttext()
if tab_1.SelectedTab = 1 then
	if dw_4.retrieve(id_date,  dw_area.object.area[1]) < 1 then
		em_1.SelectText(9, 2)
		em_1.SetFocus( )
	end if
	is_mess = "해당일자에 "
else
	is_wcno = dw_2.object.wc_no[1]
	if isnull(is_wcno) or trim(is_wcno) = '' then 
		messagebox("확인","작업장을 선택하십시요")
		dw_2.setcolumn('wc_no')
		dw_2.setfocus()
		return
	end if

	if cbx_1.checked = false then	pb_insert.triggerevent(clicked!)
	dw7.retrieve(is_wcno,id_date,  dw_area.object.area[1])
end if


end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcrel_m
integer x = 2267
integer y = 4
integer width = 823
integer height = 212
integer taborder = 90
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcrel_m
integer x = 5
integer y = 216
integer width = 4622
integer height = 140
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcrel_m
integer x = 3113
integer width = 1513
integer taborder = 50
end type

type dw_4 from datawindow within w_mpsfcrel_m
integer x = 5
integer y = 376
integer width = 937
integer height = 2048
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_mpsfcrel_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)
end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

string ls_order
ls_order = this.object.order_no[ll_row]
dw_2.retrieve(ls_order)
dw3.retrieve(ls_order)

end event

type tab_1 from tab within w_mpsfcrel_m
integer x = 951
integer y = 372
integer width = 3675
integer height = 2056
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 78160032
boolean raggedright = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;choose case newindex
	case 1
		pb_delete.enabled = true
		pb_save.enabled = true
	case 2
		pb_delete.enabled = false
		pb_save.enabled = false
end choose

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3639
integer height = 1928
long backcolor = 78160032
string text = "지시내역"
long tabtextcolor = 16711680
long tabbackcolor = 78160032
string picturename = "Project!"
long picturemaskcolor = 553648127
st_1 st_1
cb_6 cb_6
cb_5 cb_5
dw_3 dw_3
end type

on tabpage_1.create
this.st_1=create st_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.dw_3=create dw_3
this.Control[]={this.st_1,&
this.cb_6,&
this.cb_5,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.st_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.dw_3)
end on

type st_1 from statictext within tabpage_1
integer x = 389
integer y = 16
integer width = 1563
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "다중선택 : 클릭 => [Shift] + 클릭"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within tabpage_1
integer x = 114
integer width = 114
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;long ll_row, ll_curseq, ll_cnt

dw_3.accepttext()

ll_row = dw_3.rowcount()

if ll_row <= 1 then return

ll_curseq = dw_3.GetSelectedRow(0)
if ll_curseq = 0 then return
ll_cnt = 0
for ll_row = dw_3.rowcount() to ll_curseq step -1
	if dw_3.isselected(ll_row) = true then exit
	ll_cnt = ll_cnt + 1
next
if ll_cnt = 0 then return
dw_3.setredraw(false)
ll_cnt = 0
for ll_row = ll_curseq to dw_3.rowcount()
	if dw_3.isselected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		dw_3.object.order_seq[ll_row] = ll_row  + 1
	end if
next
if ll_curseq > 0 then
	dw_3.object.order_seq[ll_curseq + ll_cnt] = ll_curseq  //- ll_cnt +1
end if	
dw_3.sort()
dw_3.setredraw(true)

end event

type cb_5 from commandbutton within tabpage_1
integer width = 114
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;long ll_row, ll_curseq, ll_cnt

dw_3.accepttext()

ll_row = dw_3.rowcount()

if ll_row <= 1 then return

ll_curseq = dw_3.GetSelectedRow(0)
if ll_curseq <= 1 then return
dw_3.setredraw(false)
ll_cnt = 0
for ll_row = ll_curseq to dw_3.rowcount()
	if dw_3.isselected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		dw_3.object.order_seq[ll_row] = ll_row - 1
	end if
next
if ll_curseq > 1 then
	dw_3.object.order_seq[ll_curseq - 1] = ll_curseq + ll_cnt -1 
end if	
dw_3.sort()
dw_3.setredraw(true)

end event

type dw_3 from datawindow within tabpage_1
integer y = 108
integer width = 3625
integer height = 1800
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpsfcrel_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

if KeyDown(KeyShift!) THEN 
	this.setredraw(false)
	long ll_row, ll_selrow
	string ls_sel
	
	ls_sel = 'N'
	ll_selrow = this.GetSelectedRow(row -1)
	for ll_row = 1 to row
		if ls_sel = 'Y' then
			this.selectrow(ll_row,true)
		else
			if isselected(ll_row) then
				ls_sel = 'Y'
			end if
		end if
	next
	this.setredraw(true)
else
	this.SelectRow(0, false)
	this.SelectRow(row, true)
end if

end event

event rowfocuschanged;//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then return
//if KeyDown(KeyShift!) THEN return
//this.SelectRow(0, false)
//this.SelectRow(ll_row, true)
//
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3639
integer height = 1928
long backcolor = 78160032
string text = "미지시내역"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
long picturemaskcolor = 536870912
dw_7 dw_7
cbx_3 cbx_3
cb_1 cb_1
dw_6 dw_6
end type

on tabpage_2.create
this.dw_7=create dw_7
this.cbx_3=create cbx_3
this.cb_1=create cb_1
this.dw_6=create dw_6
this.Control[]={this.dw_7,&
this.cbx_3,&
this.cb_1,&
this.dw_6}
end on

on tabpage_2.destroy
destroy(this.dw_7)
destroy(this.cbx_3)
destroy(this.cb_1)
destroy(this.dw_6)
end on

type dw_7 from datawindow within tabpage_2
integer y = 108
integer width = 699
integer height = 1800
integer taborder = 90
string title = "none"
string dataobject = "d_mpsfcrel_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)
//string ls_order
//ls_order = this.object.order_no[row]
//dw6.retrieve(ls_order)

end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
string ls_order
ls_order = this.object.order_no[ll_row]
dw6.retrieve(ls_order)

end event

type cbx_3 from checkbox within tabpage_2
integer x = 517
integer y = 28
integer width = 379
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "전체추가"
end type

event clicked;long ll_row, ll_cnt, ll_cnt2

if dw7.rowcount() = 0 then return 

ll_cnt2 = dw3.rowcount() + 1
for ll_row = 1 to dw7.rowcount()
	if dw3.rowcount() = 0 then 
		ll_cnt = 1
	else
		ll_cnt = dw3.rowcount() + 1
	end if
	dw_7.scrolltorow(ll_row)

	dw6.rowscopy(1, dw6.rowcount(), Primary!, dw3, ll_cnt, Primary!)
next
dw6.reset()
dw7.rowsmove(1, dw7.rowcount(), Primary!, dw7, 1, Filter!)
for ll_row = ll_cnt2 to dw3.rowcount()
	dw3.object.order_seq[ll_row] = ll_row
next
tab_1.selecttab(1)
THIS.CHECKED = FALSE

end event

type cb_1 from commandbutton within tabpage_2
integer x = 9
integer y = 12
integer width = 457
integer height = 92
integer taborder = 41
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<= 내역추가"
end type

event clicked;long ll_row, ll_cnt

// 생산계획 번호 
if dw7.rowcount() = 0 then return 

if cbx_1.checked = true then
	if dw_4.rowcount() = 0 then 
		messagebox("확인","기존 작업지시번호를 선택후 작업하십시요")
		return 
	end if
	if dw_7.object.wc_no[dw7.getrow()] <> dw_4.object.wc_no[dw_4.getrow()] then
		messagebox("확인","조회된 작업장과 일치하지 않습니다. 확인하시고 작업하십시요")
		return 
	end if
end if

// 지시내역이 존재하는지 확인 
if dw3.rowcount() = 0 then 
	ll_cnt = 1
else
	ll_cnt = dw3.rowcount() + 1
end if
dw6.rowscopy(1, dw6.rowcount(), Primary!, dw3, ll_cnt, Primary!)
dw3.accepttext()

// 지시내역의 작업순서 정렬하기
for ll_row = ll_cnt to dw3.rowcount()
	dw3.object.order_seq[ll_row] = ll_row
next
dw7.rowsmove(dw7.getrow(), dw7.getrow(), Primary!, dw7, 1, Filter!)

// 지시내역 이동
tab_1.selecttab(1)

end event

type dw_6 from datawindow within tabpage_2
integer x = 699
integer y = 108
integer width = 2930
integer height = 1800
integer taborder = 80
string title = "none"
string dataobject = "d_mpsfcrel_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_mpsfcrel_m
integer x = 1339
integer y = 52
integer width = 101
integer height = 76
integer taborder = 100
boolean bringtotop = true
string title = "공정이동 식별표"
string dataobject = "d_mpsfcrel_r4"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_mpsfcrel_m
integer x = 2309
integer y = 56
integer width = 485
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "작업지시서"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpsfcrel_m
integer x = 2309
integer y = 132
integer width = 544
integer height = 76
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

type cbx_1 from checkbox within w_mpsfcrel_m
integer x = 3145
integer y = 144
integer width = 471
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "추가 지시"
end type

type em_1 from editmask within w_mpsfcrel_m
integer x = 3141
integer y = 52
integer width = 471
integer height = 88
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
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

type dw_area from datawindow within w_mpsfcrel_m
integer x = 1687
integer y = 120
integer width = 521
integer height = 84
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

event losefocus;this.accepttext()
end event

type st_2 from statictext within w_mpsfcrel_m
integer x = 1687
integer y = 40
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_mpsfcrel_m
integer x = 1650
integer y = 4
integer width = 599
integer height = 212
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
borderstyle borderstyle = stylebox!
end type

