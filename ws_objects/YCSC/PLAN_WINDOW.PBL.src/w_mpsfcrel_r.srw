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
end forward

global type w_mpsfcrel_r from w_inheritance
integer width = 3657
integer height = 2196
string title = "작업지시서 발행(w_mpsfcrel_r)"
em_1 em_1
dw_4 dw_4
cbx_1 cbx_1
tab_1 tab_1
cbx_2 cbx_2
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
end type
global w_mpsfcrel_r w_mpsfcrel_r

type variables
st_print i_print
string is_wcno, is_mess
date id_date
datawindowchild idwc_wc
end variables

forward prototypes
public subroutine wf_sfcrel_insert (string as_fact)
end prototypes

public subroutine wf_sfcrel_insert (string as_fact);long ll_cnt , ll_row , ll_dw1row
string ls_cust, ls_scene
datawindow dw3

dw3 = tab_1.tabpage_1.dw_3
ll_cnt = dw3.rowcount()

for ll_row = 1 to ll_cnt step 10
	ll_dw1row = dw_1.insertrow(0)
	if as_fact <> '1' then
		dw_1.object.order_no[ll_dw1row] = dw_4.object.order_no[dw_4.getrow()]
	end if
	dw_1.object.start_date[ll_dw1row] = datetime(id_date)
	dw_1.object.work_name[ll_dw1row] = idwc_wc.GetItemString(idwc_wc.getrow(), "work_name")
// 1
	ls_cust = trim(dw3.object.customer_cust_name[ll_row])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq1[ll_dw1row] = dw3.object.priority[ll_row]
	dw_1.object.desc1[ll_dw1row] = dw3.object.mpsdet_rem[ll_row]
// 	dw_1.object.item_no1[ll_dw1row] = dw3.object.item_no[ll_row]
	dw_1.object.qa1[ll_dw1row] = dw3.object.qa[ll_row]
	dw_1.object.name1[ll_dw1row] = dw3.object.groupitem_item_name[ll_row]
	dw_1.object.uom1[ll_dw1row] = dw3.object.uom[ll_row]
	dw_1.object.qty1[ll_dw1row] = dw3.object.order_qty[ll_row]
	dw_1.object.c1[ll_dw1row] = dw3.object.color_color_name[ll_row]
	dw_1.object.cust1[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom1[ll_dw1row] = dw3.object.mpsdet_uom[ll_row]
		dw_1.object.planq1[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row], &
																dw3.object.qa[ll_row], &
																dw3.object.mpsdet_uom[ll_row], &
																dw3.object.order_qty[ll_row])
	else
		dw_1.object.planq1[ll_dw1row] = dw3.object.rcpt_qty[ll_row]
	end if
					
//	mpsdet_rem
//	messagebox  ('1', '1')
	IF ll_cnt < ll_row + 1 then EXIT
// 2
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 1])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 1])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq2[ll_dw1row] = dw3.object.priority[ll_row + 1]
	dw_1.object.desc2[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 1]
// 	dw_1.object.item_no2[ll_dw1row] = dw3.object.item_no[ll_row + 1]
	dw_1.object.qa2[ll_dw1row] = dw3.object.qa[ll_row + 1]
	dw_1.object.name2[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 1]
	dw_1.object.uom2[ll_dw1row] = dw3.object.uom[ll_row + 1]
	dw_1.object.qty2[ll_dw1row] = dw3.object.order_qty[ll_row + 1]
	dw_1.object.c2[ll_dw1row] = dw3.object.color_color_name[ll_row + 1]
	dw_1.object.cust2[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom2[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 1]
		dw_1.object.planq2[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 1], &
																dw3.object.qa[ll_row + 1], &
																dw3.object.mpsdet_uom[ll_row + 1], &
																dw3.object.order_qty[ll_row + 1])
	else
		dw_1.object.planq2[ll_dw1row] = dw3.object.rcpt_qty[ll_row]
	end if
//	messagebox  ('2', '2')
	IF ll_cnt < ll_row + 2 then EXIT
// 3
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 2])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 2])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq3[ll_dw1row] = dw3.object.priority[ll_row + 2]
	dw_1.object.desc3[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 2]
// 	dw_1.object.item_no3[ll_dw1row] = dw3.object.item_no[ll_row + 2]
	dw_1.object.qa3[ll_dw1row] = dw3.object.qa[ll_row + 2]
	dw_1.object.name3[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 2]
	dw_1.object.uom3[ll_dw1row] = dw3.object.uom[ll_row + 2]
	dw_1.object.qty3[ll_dw1row] = dw3.object.order_qty[ll_row + 2]
	dw_1.object.c3[ll_dw1row] = dw3.object.color_color_name[ll_row + 2]
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
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 3])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 3])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq4[ll_dw1row] = dw3.object.priority[ll_row + 3]
	dw_1.object.desc4[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 3]
// 	dw_1.object.item_no4[ll_dw1row] = dw3.object.item_no[ll_row + 3]
	dw_1.object.qa4[ll_dw1row] = dw3.object.qa[ll_row + 3]
	dw_1.object.name4[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 3]
	dw_1.object.uom4[ll_dw1row] = dw3.object.uom[ll_row + 3]
	dw_1.object.qty4[ll_dw1row] = dw3.object.order_qty[ll_row + 3]
	dw_1.object.c4[ll_dw1row] = dw3.object.color_color_name[ll_row + 3]
	dw_1.object.cust4[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom4[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 3]
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
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 4])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 4])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq5[ll_dw1row] = dw3.object.priority[ll_row + 4]
	dw_1.object.desc5[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 4]
// 	dw_1.object.item_no5[ll_dw1row] = dw3.object.item_no[ll_row + 4]
	dw_1.object.qa5[ll_dw1row] = dw3.object.qa[ll_row + 4]
	dw_1.object.name5[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 4]
	dw_1.object.uom5[ll_dw1row] = dw3.object.uom[ll_row + 4]
	dw_1.object.qty5[ll_dw1row] = dw3.object.order_qty[ll_row + 4]
	dw_1.object.c5[ll_dw1row] = dw3.object.color_color_name[ll_row + 4]
	dw_1.object.cust5[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom5[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 4]
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
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 5])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 5])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq6[ll_dw1row] = dw3.object.priority[ll_row + 5]
	dw_1.object.desc6[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 5]
// 	dw_1.object.item_no6[ll_dw1row] = dw3.object.item_no[ll_row + 5]
	dw_1.object.qa6[ll_dw1row] = dw3.object.qa[ll_row + 5]
	dw_1.object.name6[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 5]
	dw_1.object.uom6[ll_dw1row] = dw3.object.uom[ll_row + 5]
	dw_1.object.qty6[ll_dw1row] = dw3.object.order_qty[ll_row + 5]
	dw_1.object.c6[ll_dw1row] = dw3.object.color_color_name[ll_row + 5]
	dw_1.object.cust6[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom6[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 5]
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
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 6])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 6])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq7[ll_dw1row] = dw3.object.priority[ll_row + 6]
	dw_1.object.desc7[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 6]
// 	dw_1.object.item_no7[ll_dw1row] = dw3.object.item_no[ll_row + 6]
	dw_1.object.qa7[ll_dw1row] = dw3.object.qa[ll_row + 6]
	dw_1.object.name7[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 6]
	dw_1.object.uom7[ll_dw1row] = dw3.object.uom[ll_row + 6]
	dw_1.object.qty7[ll_dw1row] = dw3.object.order_qty[ll_row + 6]
	dw_1.object.c7[ll_dw1row] = dw3.object.color_color_name[ll_row + 6]
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
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 7])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 7])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq8[ll_dw1row] = dw3.object.priority[ll_row + 7]
	dw_1.object.desc8[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 7]
// 	dw_1.object.item_no8[ll_dw1row] = dw3.object.item_no[ll_row + 7]
	dw_1.object.qa8[ll_dw1row] = dw3.object.qa[ll_row + 7]
	dw_1.object.name8[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 7]
	dw_1.object.uom8[ll_dw1row] = dw3.object.uom[ll_row + 7]
	dw_1.object.qty8[ll_dw1row] = dw3.object.order_qty[ll_row + 7]
	dw_1.object.c8[ll_dw1row] = dw3.object.color_color_name[ll_row + 7]
	dw_1.object.cust8[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom8[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 7]
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
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq9[ll_dw1row] = dw3.object.priority[ll_row + 8]
	dw_1.object.desc9[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 8]
// 	dw_1.object.item_no9[ll_dw1row] = dw3.object.item_no[ll_row + 8]
	dw_1.object.qa9[ll_dw1row] = dw3.object.qa[ll_row + 8]
	dw_1.object.name9[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 8]
	dw_1.object.uom9[ll_dw1row] = dw3.object.uom[ll_row + 8]
	dw_1.object.qty9[ll_dw1row] = dw3.object.order_qty[ll_row + 8]
	dw_1.object.c9[ll_dw1row] = dw3.object.color_color_name[ll_row + 8]
	dw_1.object.cust9[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom9[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 8]
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
	ls_cust = trim(dw3.object.customer_cust_name[ll_row + 9])
	ls_scene = trim(dw3.object.scene_scene_desc[ll_row + 9])
	if isnull(ls_cust) then 
		ls_cust = ''
	end if
	if isnull(ls_scene) then 
		ls_scene = ''
	end if
	dw_1.object.seq10[ll_dw1row] = dw3.object.priority[ll_row + 9]
	dw_1.object.desc10[ll_dw1row] = dw3.object.mpsdet_rem[ll_row + 9]
// 	dw_1.object.item_no10[ll_dw1row] = dw3.object.item_no[ll_row + 9]
	dw_1.object.qa10[ll_dw1row] = dw3.object.qa[ll_row + 9]
	dw_1.object.name10[ll_dw1row] = dw3.object.groupitem_item_name[ll_row + 9]
	dw_1.object.uom10[ll_dw1row] = dw3.object.uom[ll_row + 9]
	dw_1.object.qty10[ll_dw1row] = dw3.object.order_qty[ll_row + 9]
	dw_1.object.c10[ll_dw1row] = dw3.object.color_color_name[ll_row + 9]
	dw_1.object.cust10[ll_dw1row] = ls_cust + ls_scene
	if as_fact = '1' then
		dw_1.object.muom10[ll_dw1row] = dw3.object.mpsdet_uom[ll_row + 9]
		dw_1.object.planq10[ll_dw1row] = gf_getqty(dw3.object.item_no[ll_row + 9], &
																dw3.object.qa[ll_row + 9], &
																dw3.object.mpsdet_uom[ll_row + 9], &
																dw3.object.order_qty[ll_row + 9])
	else
		dw_1.object.planq10[ll_dw1row] = dw3.object.rcpt_qty[ll_row + 9]
	end if
next
return
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
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
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_1.visible = false
dw_5.visible = false
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
dw_2.insertrow(0)
em_1.text = string(today(), "YYYY/MM/DD")
id_date = date(em_1.text)
is_mess = "오늘 일자에는  "
dw_1.retrieve()
rb_1.checked = True

end event

type pb_save from w_inheritance`pb_save within w_mpsfcrel_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcrel_r
integer x = 1339
integer y = 0
integer width = 78
integer height = 60
string dataobject = "d_mpsfcrel_r3"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcrel_r
integer x = 1934
integer y = 44
integer width = 878
integer height = 92
integer taborder = 60
string dataobject = "d_mpwcno_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;long ll_row

this.accepttext()
is_wcno = dw_2.object.wc_no[1]
id_date = date(em_1.text)

end event

type st_title from w_inheritance`st_title within w_mpsfcrel_r
integer x = 50
integer y = 40
integer width = 1253
string text = "작업지시서 발행"
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
integer x = 3296
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcrel_r
integer x = 3104
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source, ls_fact
gs_print_str lstr_print

IF tab_1.tabpage_1.dw_3.getrow() <= 0 THEN
   RETURN
END IF

select fact_wc into :ls_fact from wc
 where work_no = :is_wcno;
if gs_area = 'B0001' or gs_area = 'T0001' then
	ls_fact = 'B'
	dw_1.dataobject = 'd_mpsfcrel_r3' // 생산계획 번호 있음
else
	if ls_fact = '1'  then
		dw_1.dataobject = 'd_mpsfcrel_r'// 생산수량 입력 불가능.
	else
//		dw_1.dataobject = 'd_mpsfcrel_r2'  // 생산수량 입력 가능.
		dw_1.dataobject = 'd_mpsfcrel_r3'  // 생산수량 입력 가능.
	end if
end if
dw_1.SetTransObject(SQLCA)
wf_sfcrel_insert(ls_fact)

if rb_1.checked = True then
	i_print.st_datawindow = dw_1
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc = " 이 프로그램은 작업장별 생산계획내역을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end if

if rb_2.checked = True then
	i_print.st_datawindow = dw_5
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc = " 이 프로그램은 공정 이동 식별표를 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
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
integer x = 2917
integer taborder = 150
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_falg[4]

id_date = date(em_1.text)
if isnull(id_date) then
	return
end if
dw_2.accepttext()
dw_4.reset()
//if gs_userid = '1999010s' and gs_userid = 'root' then
//		ls_falg[1] = 'Y'
//		ls_falg[2] = 'B'
//		ls_falg[3] = 'N'
//		ls_falg[4] = 'E'
//else
//	if gs_area = 'B0001' THEN
//		ls_falg[1] = 'Y'
//		ls_falg[2] = 'B'
//	else
//		ls_falg[1] = 'N'
//		ls_falg[2] = 'E'
//	end if
//end if
dw_4.retrieve(is_wcno,id_date,  gs_area)
tab_1.tabpage_1.dw_3.retrieve(is_wcno,id_date,  gs_area)
dw_5.retrieve(is_wcno,id_date,  gs_area)

if dw_4.rowcount() < 1 then
	beep(2)
end if
em_1.SetFocus( )
is_mess = "해당일자에 "



end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcrel_r
integer x = 1426
integer y = 4
integer width = 1394
integer height = 212
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcrel_r
integer x = 14
integer y = 216
integer width = 686
integer height = 208
integer taborder = 80
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcrel_r
integer x = 2898
integer width = 613
end type

type em_1 from editmask within w_mpsfcrel_r
integer x = 1454
integer y = 40
integer width = 471
integer height = 88
integer taborder = 100
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

type dw_4 from datawindow within w_mpsfcrel_r
integer x = 5
integer y = 452
integer width = 695
integer height = 1596
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

event clicked;if row < 1 or cbx_2.checked = true then return
//if row < 1 then return

string ls_filter, ls_order
long ll_row
int li_cnt

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
integer x = 41
integer y = 260
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선택"
end type

type tab_1 from tab within w_mpsfcrel_r
integer x = 704
integer y = 232
integer width = 2894
integer height = 1824
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
integer width = 2857
integer height = 1696
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
integer x = 5
integer y = 12
integer width = 2848
integer height = 1680
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpsfcrel_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_mpsfcrel_r
integer x = 41
integer y = 332
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;
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
integer x = 1339
integer y = 76
integer width = 78
integer height = 60
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcrel_r4"
boolean border = false
boolean livescroll = true
end type

type rb_1 from radiobutton within w_mpsfcrel_r
integer x = 1509
integer y = 128
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
end type

type rb_2 from radiobutton within w_mpsfcrel_r
integer x = 2075
integer y = 128
integer width = 635
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

