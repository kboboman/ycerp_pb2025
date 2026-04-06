$PBExportHeader$w_orsamp_m.srw
$PBExportComments$샘플관리(2003/08/04,정갑용)
forward 
global type w_orsamp_m from w_inheritance
end type
type gb_5 from groupbox within w_orsamp_m
end type
type gb_4 from groupbox within w_orsamp_m
end type
type dw_4 from datawindow within w_orsamp_m
end type
type dw_6 from datawindow within w_orsamp_m
end type
type em_3 from editmask within w_orsamp_m
end type
type st_1 from statictext within w_orsamp_m
end type
type em_2 from editmask within w_orsamp_m
end type
type em_1 from editmask within w_orsamp_m
end type
type dw_3 from datawindow within w_orsamp_m
end type
type em_4 from editmask within w_orsamp_m
end type
type st_2 from statictext within w_orsamp_m
end type
type dw_8 from datawindow within w_orsamp_m
end type
type pb_1 from picturebutton within w_orsamp_m
end type
type st_8 from statictext within w_orsamp_m
end type
type ddlb_col from dropdownlistbox within w_orsamp_m
end type
type st_9 from statictext within w_orsamp_m
end type
type ddlb_2 from dropdownlistbox within w_orsamp_m
end type
type sle_value from singlelineedit within w_orsamp_m
end type
type cb_filteron from commandbutton within w_orsamp_m
end type
type cb_filteroff from commandbutton within w_orsamp_m
end type
type cb_7 from commandbutton within w_orsamp_m
end type
type cb_4 from commandbutton within w_orsamp_m
end type
end forward

global type w_orsamp_m from w_inheritance
integer x = 5
integer y = 148
integer width = 4727
integer height = 2564
string title = "샘플관리(w_orsamp_m)"
boolean resizable = false
gb_5 gb_5
gb_4 gb_4
dw_4 dw_4
dw_6 dw_6
em_3 em_3
st_1 st_1
em_2 em_2
em_1 em_1
dw_3 dw_3
em_4 em_4
st_2 st_2
dw_8 dw_8
pb_1 pb_1
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_7 cb_7
cb_4 cb_4
end type
global w_orsamp_m w_orsamp_m

type variables
datawindowchild  idwc_scene
datawindowchild idwc_qa, idwc_cust, idwc_item
datawindowchild idwc_loc_no

string is_scenesql

end variables

forward prototypes
public subroutine wf_retrieve (string as_order)
public subroutine wf_sceneretrieve (string as_cust)
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_retrieve (string as_order);string ls_scene_code, ls_scene_name

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_2.retrieve(as_order) //samp_no

setnull(ls_scene_code)
setnull(ls_scene_name)
ls_scene_code = dw_2.object.scene_code[1]
select scene_desc into :ls_scene_name from scene
 where scene_code = :ls_scene_code;
idwc_scene.SetItem(1, "scene_code", ls_scene_code)
idwc_scene.SetItem(1, "scene_desc", ls_scene_name)

dw_3.retrieve(as_order) //samp_no
dw_2.setredraw(true)
dw_3.setredraw(true)

end subroutine

public subroutine wf_sceneretrieve (string as_cust);string ls_where, ls_sql
ls_where = "WHERE scene.cust_no = ~~'" + as_cust + "~~'"
ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

dw_2.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.modify(ls_sql)
idwc_scene.retrieve()

end subroutine

public subroutine wf_print (datawindow arg_dw);long ll_count, ll_idx, ll_int, ll_cnt
w_repsuper w_print
st_print l_print
string ls_orderno, ls_cust_name, ls_cap_name, ls_cust_no, ls_null, ls_rate_cash
string ls_ship_cash, ls_ship_vat, ls_ship_qty, ls_acc_qty, ls_price, ls_amount
string ls_item_name, ls_item_no, ls_qa, ls_cash, ls_uom, ls_dr, ls_real_uom
dec ld_amount
string ls_sale_no, ls_desc
int li_seq_no
datetime ld_date

arg_dw.reset()

setnull(ls_null)

ls_orderno = dw_2.object.samp_no[dw_2.getrow()]	
ls_dr = trim(dw_2.object.rem[dw_2.getrow()])	
ll_idx = 0
ll_int = 0

for ll_count = 1 to dw_3.rowcount()
	if ll_idx = 0 then
		ll_int = ll_int + 1
	   arg_dw.object.do_date[ll_int] = string(dw_2.object.order_date[dw_2.getrow()], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int] = dw_2.object.samp_no[dw_2.getrow()]
 	   arg_dw.object.addr[ll_int] = dw_2.object.rem[dw_2.getrow()]
   	arg_dw.object.tel[ll_int] = ''
		IF isnull(dw_2.object.scene_code[dw_2.getrow()]) then
	      arg_dw.object.scene[ll_int] = ls_null
		else
   		dw_2.getchild("scene_code", idwc_scene)
	   	idwc_scene.settransobject(sqlca)
	      arg_dw.object.scene[ll_int] = idwc_scene.getitemstring(idwc_scene.getrow(), 'scene_desc')
		end if
   	ls_cust_no = dw_2.object.cust_no[dw_2.getrow()]
	   select cust_name, captain_name into :ls_cust_name, :ls_cap_name from customer
   	    where cust_no = :ls_cust_no;
	   arg_dw.object.cust[ll_int] = ls_cust_name
   	arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	ll_idx = ll_idx + 1
	ls_item_no = dw_3.object.item_no[ll_count]
	ls_qa = dw_3.object.qa[ll_count]
	ls_uom = dw_3.object.uom[ll_count]
   SELECT item_name INTO :ls_item_name FROM groupitem
	   WHERE item_no = :ls_item_no;
  	ls_qa = MidA(dw_3.object.qa[ll_count], 1, 3) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 5, 4) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 10, 4) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 15, 5) 

	ls_ship_qty = string(dw_3.object.issue_qty[ll_count], '###,###,###.00')
	ls_acc_qty = ' ' //string(dw_dodet.object.c_acc_aty[ll_count], '###,###,###.00')
	ls_price = string(dw_3.object.price[ll_count], '####,###,##0')
	ld_amount = 0 //truncate(dw_dodet.object.c_acc_aty[ll_count] * dw_dodet.object.price[ll_count] + 0.0000001, 0)
	ls_amount = '0' //string(ld_amount, '####,###,##0')
	ls_rate_cash = '0' //string(dw_dodet.object.rate_cash[ll_count], '####,###,##0')
	IF trim(ls_uom) = 'M' OR ls_uom = 'M2' then
   	ls_real_uom ='EA'
	ELSE
		if ls_uom = "SS" then
			ls_real_uom = "SH"
			ls_uom = "M2"
		else
	     	ls_real_uom = ls_uom
		end if
//     	ls_real_uom = ls_uom
//		select uom_to into :ls_uom from uom where uom_from = :ls_uom;
//		if sqlca.sqlcode = 0 then
//	     	ls_real_uom = ls_uom
//		end if
		
	end if
// 거래명세서/출고증의 비고에 생산일자또는 입고일자또는 재고일자(출고일자)을 기록
// iso에 의한 시화 진달수 과장의 요청에의하여 추가 2000/06/13, easthero
	ls_desc = dw_3.object.rem[ll_count]
	ls_sale_no = dw_2.object.samp_no[dw_2.getrow()]
	li_seq_no = dw_3.object.seq_no[ll_count]
	setnull(ld_date)
	select max(samp.order_date) into :ld_date from samp, sampdet
	 where samp.samp_no = :ls_sale_no
	   and sampdet.seq_no = :li_seq_no;
	if sqlca.sqlcode = 100 then
//		select max(insp_date) into :ld_date from insp, inspdet, purdet
//		 where insp.insp_no = inspdet.insp_no
//		   and purdet.order_no = inspdet.pur_no
//			and purdet.seq_no = inspdet.seq_no
//			and purdet.sale_no = :ls_sale_no
//			and purdet.sale_seq = :li_seq_no;
	end if
	if DATE(ld_date) > date(dw_2.object.order_date[dw_2.getrow()]) or sqlca.sqlcode = 100 or isnull(ld_date) then
		ld_date = dw_2.object.order_date[dw_2.getrow()]
	end if
	
////////////////////////// insert easthero end
	CHOOSE CASE ll_idx
	CASE 1
   	arg_dw.object.item_1[ll_int] = ls_item_name
   	arg_dw.object.qa_1[ll_int] = ls_qa
  	   arg_dw.object.auom_1[ll_int] = ls_real_uom
   	arg_dw.object.ship_1[ll_int] = ls_ship_qty
   	arg_dw.object.buom_1[ll_int] = ls_uom
   	arg_dw.object.acc_1[ll_int] = ls_acc_qty
   	arg_dw.object.cost_1[ll_int] = ls_price
   	arg_dw.object.price_1[ll_int] = ls_amount
   	arg_dw.object.rate_1[ll_int] = ls_rate_cash
   	arg_dw.object.pdate1[ll_int] = DATE(ld_date)
   	arg_dw.object.desc1[ll_int] = ls_desc
	CASE 2
   	arg_dw.object.item_2[ll_int] = ls_item_name
   	arg_dw.object.qa_2[ll_int] = ls_qa
  	   arg_dw.object.auom_2[ll_int] = ls_real_uom
   	arg_dw.object.ship_2[ll_int] = ls_ship_qty
   	arg_dw.object.buom_2[ll_int] = ls_uom
   	arg_dw.object.acc_2[ll_int] = ls_acc_qty
   	arg_dw.object.cost_2[ll_int] = ls_price
   	arg_dw.object.price_2[ll_int] = ls_amount
   	arg_dw.object.rate_2[ll_int] = ls_rate_cash
   	arg_dw.object.pdate2[ll_int] = DATE(ld_date)
   	arg_dw.object.desc2[ll_int] = ls_desc
	CASE 3
   	arg_dw.object.item_3[ll_int] = ls_item_name
   	arg_dw.object.qa_3[ll_int] = ls_qa
  	   arg_dw.object.auom_3[ll_int] = ls_real_uom
   	arg_dw.object.ship_3[ll_int] = ls_ship_qty
   	arg_dw.object.buom_3[ll_int] = ls_uom
   	arg_dw.object.acc_3[ll_int] = ls_acc_qty
   	arg_dw.object.cost_3[ll_int] = ls_price
   	arg_dw.object.price_3[ll_int] = ls_amount
   	arg_dw.object.rate_3[ll_int] = ls_rate_cash
   	arg_dw.object.pdate3[ll_int] = DATE(ld_date)
   	arg_dw.object.desc3[ll_int] = ls_desc
	CASE 4
   	arg_dw.object.item_4[ll_int] = ls_item_name
   	arg_dw.object.qa_4[ll_int] = ls_qa
  	   arg_dw.object.auom_4[ll_int] = ls_real_uom
   	arg_dw.object.ship_4[ll_int] = ls_ship_qty
   	arg_dw.object.buom_4[ll_int] = ls_uom
   	arg_dw.object.acc_4[ll_int] = ls_acc_qty
   	arg_dw.object.cost_4[ll_int] = ls_price
   	arg_dw.object.price_4[ll_int] = ls_amount
   	arg_dw.object.rate_4[ll_int] = ls_rate_cash
   	arg_dw.object.pdate4[ll_int] = DATE(ld_date)
   	arg_dw.object.desc4[ll_int] = ls_desc
	CASE 5
   	arg_dw.object.item_5[ll_int] = ls_item_name
   	arg_dw.object.qa_5[ll_int] = ls_qa
  	   arg_dw.object.auom_5[ll_int] = ls_real_uom
   	arg_dw.object.ship_5[ll_int] = ls_ship_qty
   	arg_dw.object.buom_5[ll_int] = ls_uom
   	arg_dw.object.acc_5[ll_int] = ls_acc_qty
   	arg_dw.object.cost_5[ll_int] = ls_price
   	arg_dw.object.price_5[ll_int] = ls_amount
   	arg_dw.object.rate_5[ll_int] = ls_rate_cash
   	arg_dw.object.pdate5[ll_int] = DATE(ld_date)
   	arg_dw.object.desc5[ll_int] = ls_desc
	CASE 6
   	arg_dw.object.item_6[ll_int] = ls_item_name
   	arg_dw.object.qa_6[ll_int] = ls_qa
  	   arg_dw.object.auom_6[ll_int] = ls_real_uom
   	arg_dw.object.ship_6[ll_int] = ls_ship_qty
   	arg_dw.object.buom_6[ll_int] = ls_uom
   	arg_dw.object.acc_6[ll_int] = ls_acc_qty
   	arg_dw.object.cost_6[ll_int] = ls_price
   	arg_dw.object.price_6[ll_int] = ls_amount
   	arg_dw.object.rate_6[ll_int] = ls_rate_cash
   	arg_dw.object.pdate6[ll_int] = DATE(ld_date)
   	arg_dw.object.desc6[ll_int] = ls_desc
	CASE 7
   	arg_dw.object.item_7[ll_int] = ls_item_name
   	arg_dw.object.qa_7[ll_int] = ls_qa
  	   arg_dw.object.auom_7[ll_int] = ls_real_uom
   	arg_dw.object.ship_7[ll_int] = ls_ship_qty
   	arg_dw.object.buom_7[ll_int] = ls_uom
   	arg_dw.object.acc_7[ll_int] = ls_acc_qty
   	arg_dw.object.cost_7[ll_int] = ls_price
   	arg_dw.object.price_7[ll_int] = ls_amount
   	arg_dw.object.rate_7[ll_int] = ls_rate_cash
   	arg_dw.object.pdate7[ll_int] = DATE(ld_date)
   	arg_dw.object.desc7[ll_int] = ls_desc
	CASE 8
   	arg_dw.object.item_8[ll_int] = ls_item_name
   	arg_dw.object.qa_8[ll_int] = ls_qa
  	   arg_dw.object.auom_8[ll_int] = ls_real_uom
   	arg_dw.object.ship_8[ll_int] = ls_ship_qty
   	arg_dw.object.buom_8[ll_int] = ls_uom
   	arg_dw.object.acc_8[ll_int] = ls_acc_qty
   	arg_dw.object.cost_8[ll_int] = ls_price
   	arg_dw.object.price_8[ll_int] = ls_amount
   	arg_dw.object.rate_8[ll_int] = ls_rate_cash
   	arg_dw.object.pdate8[ll_int] = DATE(ld_date)
   	arg_dw.object.desc8[ll_int] = ls_desc
	CASE 9
   	arg_dw.object.item_9[ll_int] = ls_item_name
   	arg_dw.object.qa_9[ll_int] = ls_qa
  	   arg_dw.object.auom_9[ll_int] = ls_real_uom
   	arg_dw.object.ship_9[ll_int] = ls_ship_qty
   	arg_dw.object.buom_9[ll_int] = ls_uom
   	arg_dw.object.acc_9[ll_int] = ls_acc_qty
   	arg_dw.object.cost_9[ll_int] = ls_price
   	arg_dw.object.price_9[ll_int] = ls_amount
   	arg_dw.object.rate_9[ll_int] = ls_rate_cash
   	arg_dw.object.pdate9[ll_int] = DATE(ld_date)
   	arg_dw.object.desc9[ll_int] = ls_desc
	CASE 10
   	arg_dw.object.item_10[ll_int] = ls_item_name
   	arg_dw.object.qa_10[ll_int] = ls_qa
  	   arg_dw.object.auom_10[ll_int] = ls_real_uom
   	arg_dw.object.ship_10[ll_int] = ls_ship_qty
   	arg_dw.object.buom_10[ll_int] = ls_uom
   	arg_dw.object.acc_10[ll_int] = ls_acc_qty
   	arg_dw.object.cost_10[ll_int] = ls_price
   	arg_dw.object.price_10[ll_int] = ls_amount
   	arg_dw.object.rate_10[ll_int] = ls_rate_cash
   	arg_dw.object.pdate10[ll_int] = DATE(ld_date)
   	arg_dw.object.desc10[ll_int] = ls_desc
	CASE 11
   	arg_dw.object.item_11[ll_int] = ls_item_name
   	arg_dw.object.qa_11[ll_int] = ls_qa
  	   arg_dw.object.auom_11[ll_int] = ls_real_uom
   	arg_dw.object.ship_11[ll_int] = ls_ship_qty
   	arg_dw.object.buom_11[ll_int] = ls_uom
   	arg_dw.object.acc_11[ll_int] = ls_acc_qty
   	arg_dw.object.cost_11[ll_int] = ls_price
   	arg_dw.object.price_11[ll_int] = ls_amount
   	arg_dw.object.rate_11[ll_int] = ls_rate_cash
   	arg_dw.object.pdate11[ll_int] = DATE(ld_date)
   	arg_dw.object.desc11[ll_int] = ls_desc
	CASE 12
   	arg_dw.object.item_12[ll_int] = ls_item_name
   	arg_dw.object.qa_12[ll_int] = ls_qa
  	   arg_dw.object.auom_12[ll_int] = ls_real_uom
   	arg_dw.object.ship_12[ll_int] = ls_ship_qty
   	arg_dw.object.buom_12[ll_int] = ls_uom
   	arg_dw.object.acc_12[ll_int] = ls_acc_qty
   	arg_dw.object.cost_12[ll_int] = ls_price
   	arg_dw.object.price_12[ll_int] = ls_amount
   	arg_dw.object.rate_12[ll_int] = ls_rate_cash
   	arg_dw.object.pdate12[ll_int] = DATE(ld_date)
   	arg_dw.object.desc12[ll_int] = ls_desc
	   ll_idx = 0
   END CHOOSE
   IF ll_idx = 0 THEN
		arg_dw.object.cash[ll_int] = ls_null
		arg_dw.object.vat[ll_int] = ls_null
		arg_dw.object.tot_amount[ll_int] = ls_null
	END IF		
next
//if dw_1.object.ship_flag[1] = 'D' and dw_1.object.shipamt_case[1] = 'R' then 
//	if dw_1.object.ship_amount[1] <> 0 then
//		if ll_idx = 0 then
//			ll_int = ll_int + 1
//			arg_dw.object.ls_user[ll_int] = gs_userid
//			arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
//			arg_dw.object.do_no[ll_int] = dw_1.object.do_no[1]
//			arg_dw.object.addr[ll_int] = dw_1.object.shipto_addr[1]
//			arg_dw.object.tel[ll_int] = dw_1.object.tel_no[1]
//			IF isnull(dw_1.object.spot_code[1]) then
//				arg_dw.object.scene[ll_int] = ls_null
//			else
//				dw_3.getchild("scene_code", idwc_scene)
//				idwc_scene.settransobject(sqlca)
//				arg_dw.object.scene[ll_int] = idwc_scene.getitemstring(idwc_scene.getrow(), 'scene_desc')
//			end if
//			ls_cust_no = dw_1.object.cust_no[1]
//			select cust_name, captain_name into :ls_cust_name, :ls_cap_name from customer
//				 where cust_no = :ls_cust_no;
//			arg_dw.object.cust[ll_int] = ls_cust_name
//			arg_dw.object.cap_name[ll_int] = ls_cap_name
//		end if
//		ll_idx = ll_idx + 1
//		ls_ship_cash = string(dw_1.object.ship_amount[1], '####,###,##0')
//		ls_ship_vat = string(truncate(dw_1.object.ship_amount[1] / 10 + 0.000001, 0), '####,###,##0')	
//		if dw_1.object.do_rate[1] <> 0 then
//		ELSE
//			ls_ship_vat = '           0'
//		END IF
//		CHOOSE CASE ll_idx
//		CASE 1
//			arg_dw.object.item_1[ll_int] = '운송비'
//			arg_dw.object.qa_1[ll_int] = ls_null
//			arg_dw.object.auom_1[ll_int] = ls_null
//			arg_dw.object.ship_1[ll_int] = ls_null
//			arg_dw.object.buom_1[ll_int] = ls_null
//			arg_dw.object.acc_1[ll_int] = ls_null
//			arg_dw.object.cost_1[ll_int] = ls_ship_cash
//			arg_dw.object.price_1[ll_int] = ls_ship_cash
//			arg_dw.object.rate_1[ll_int] = ls_ship_vat
//		CASE 2
//			arg_dw.object.item_2[ll_int] = '운송비'
//			arg_dw.object.qa_2[ll_int] = ls_null
//			arg_dw.object.auom_2[ll_int] = ls_null
//			arg_dw.object.ship_2[ll_int] = ls_null
//			arg_dw.object.buom_2[ll_int] = ls_null
//			arg_dw.object.acc_2[ll_int] = ls_null
//			arg_dw.object.cost_2[ll_int] = ls_ship_cash
//			arg_dw.object.price_2[ll_int] = ls_ship_cash
//			arg_dw.object.rate_2[ll_int] = ls_ship_vat
//		CASE 3
//			arg_dw.object.item_3[ll_int] = '운송비'
//			arg_dw.object.qa_3[ll_int] = ls_null
//			arg_dw.object.auom_3[ll_int] = ls_null
//			arg_dw.object.ship_3[ll_int] = ls_null
//			arg_dw.object.buom_3[ll_int] = ls_null
//			arg_dw.object.acc_3[ll_int] = ls_null
//			arg_dw.object.cost_3[ll_int] = ls_ship_cash
//			arg_dw.object.price_3[ll_int] = ls_ship_cash
//			arg_dw.object.rate_3[ll_int] = ls_ship_vat
//		CASE 4
//			arg_dw.object.item_4[ll_int] = '운송비'
//			arg_dw.object.qa_4[ll_int] = ls_null
//			arg_dw.object.auom_4[ll_int] = ls_null
//			arg_dw.object.ship_4[ll_int] = ls_null
//			arg_dw.object.buom_4[ll_int] = ls_null
//			arg_dw.object.acc_4[ll_int] = ls_null
//			arg_dw.object.cost_4[ll_int] = ls_ship_cash
//			arg_dw.object.price_4[ll_int] = ls_ship_cash
//			arg_dw.object.rate_4[ll_int] = ls_ship_vat
//		CASE 5
//			arg_dw.object.item_5[ll_int] = '운송비'
//			arg_dw.object.qa_5[ll_int] = ls_null
//			arg_dw.object.auom_5[ll_int] = ls_null
//			arg_dw.object.ship_5[ll_int] = ls_null
//			arg_dw.object.buom_5[ll_int] = ls_null
//			arg_dw.object.acc_5[ll_int] = ls_null
//			arg_dw.object.cost_5[ll_int] = ls_ship_cash
//			arg_dw.object.price_5[ll_int] = ls_ship_cash
//			arg_dw.object.rate_5[ll_int] = ls_ship_vat
//		CASE 6
//			arg_dw.object.item_6[ll_int] = '운송비'
//			arg_dw.object.qa_6[ll_int] = ls_null
//			arg_dw.object.auom_6[ll_int] = ls_null
//			arg_dw.object.ship_6[ll_int] = ls_null
//			arg_dw.object.buom_6[ll_int] = ls_null
//			arg_dw.object.acc_6[ll_int] = ls_null
//			arg_dw.object.cost_6[ll_int] = ls_ship_cash
//			arg_dw.object.price_6[ll_int] = ls_ship_cash
//			arg_dw.object.rate_6[ll_int] = ls_ship_vat
//		CASE 7
//			arg_dw.object.item_7[ll_int] = '운송비'
//			arg_dw.object.qa_7[ll_int] = ls_null
//			arg_dw.object.auom_7[ll_int] = ls_null
//			arg_dw.object.ship_7[ll_int] = ls_null
//			arg_dw.object.buom_7[ll_int] = ls_null
//			arg_dw.object.acc_7[ll_int] = ls_null
//			arg_dw.object.cost_7[ll_int] = ls_ship_cash
//			arg_dw.object.price_7[ll_int] = ls_ship_cash
//			arg_dw.object.rate_7[ll_int] = ls_ship_vat
//		CASE 8
//			arg_dw.object.item_8[ll_int] = '운송비'
//			arg_dw.object.qa_8[ll_int] = ls_null      
//			arg_dw.object.auom_8[ll_int] = ls_null
//			arg_dw.object.ship_8[ll_int] = ls_null
//			arg_dw.object.buom_8[ll_int] = ls_null
//			arg_dw.object.acc_8[ll_int] = ls_null
//			arg_dw.object.cost_8[ll_int] = ls_ship_cash
//			arg_dw.object.price_8[ll_int] = ls_ship_cash
//			arg_dw.object.rate_8[ll_int] = ls_ship_vat
//		CASE 9
//			arg_dw.object.item_9[ll_int] = '운송비'
//			arg_dw.object.qa_9[ll_int] = ls_null
//			arg_dw.object.auom_9[ll_int] = ls_null
//			arg_dw.object.ship_9[ll_int] = ls_null
//			arg_dw.object.buom_9[ll_int] = ls_null
//			arg_dw.object.acc_9[ll_int] = ls_null
//			arg_dw.object.cost_9[ll_int] = ls_ship_cash
//			arg_dw.object.price_9[ll_int] = ls_ship_cash
//			arg_dw.object.rate_9[ll_int] = ls_ship_vat
//		CASE 10
//			arg_dw.object.item_10[ll_int] = '운송비'
//			arg_dw.object.qa_10[ll_int] = ls_null
//			arg_dw.object.auom_10[ll_int] = ls_null
//			arg_dw.object.ship_10[ll_int] = ls_null
//			arg_dw.object.buom_10[ll_int] = ls_null
//			arg_dw.object.acc_10[ll_int] = ls_null
//			arg_dw.object.cost_10[ll_int] = ls_ship_cash
//			arg_dw.object.price_10[ll_int] = ls_ship_cash
//			arg_dw.object.rate_10[ll_int] = ls_ship_vat
//		CASE 11
//			arg_dw.object.item_11[ll_int] = '운송비'
//			arg_dw.object.qa_11[ll_int] = ls_null
//			arg_dw.object.auom_11[ll_int] = ls_null
//			arg_dw.object.ship_11[ll_int] = ls_null
//			arg_dw.object.buom_11[ll_int] = ls_null
//			arg_dw.object.acc_11[ll_int] = ls_null
//			arg_dw.object.cost_11[ll_int] = ls_ship_cash
//			arg_dw.object.price_11[ll_int] = ls_ship_cash
//			arg_dw.object.rate_11[ll_int] = ls_ship_vat
//		CASE 12
//			arg_dw.object.item_12[ll_int] = '운송비'
//			arg_dw.object.qa_12[ll_int] = ls_null
//			arg_dw.object.auom_12[ll_int] = ls_null
//			arg_dw.object.ship_12[ll_int] = ls_null
//			arg_dw.object.buom_12[ll_int] = ls_null
//			arg_dw.object.acc_12[ll_int] = ls_null
//			arg_dw.object.cost_12[ll_int] = ls_ship_cash
//			arg_dw.object.price_12[ll_int] = ls_ship_cash
//			arg_dw.object.rate_12[ll_int] = ls_ship_vat
//		END CHOOSE
//	end if
//end if
arg_dw.object.cash[ll_int] = '0' //string(dw_1.object.do_cash[1], '####,###,###,###')
arg_dw.object.vat[ll_int] = '0' //string(dw_1.object.do_rate[1], '####,###,###,###')
arg_dw.object.tot_amount[ll_int] = '0' //string(dw_1.object.do_total[1], '####,###,###,###')
arg_dw.object.dr_man[ll_int] = ls_dr

l_print.st_datawindow = arg_dw
l_print.st_print_sheet = " 프린트용지 : 거래명세표"
l_print.st_print_desc = " 이 프로그램은 거래명세표를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
return
end subroutine

on w_orsamp_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.dw_4=create dw_4
this.dw_6=create dw_6
this.em_3=create em_3
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_3=create dw_3
this.em_4=create em_4
this.st_2=create st_2
this.dw_8=create dw_8
this.pb_1=create pb_1
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_7=create cb_7
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.dw_6
this.Control[iCurrent+5]=this.em_3
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.em_4
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.dw_8
this.Control[iCurrent+13]=this.pb_1
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.ddlb_col
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.ddlb_2
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_filteron
this.Control[iCurrent+20]=this.cb_filteroff
this.Control[iCurrent+21]=this.cb_7
this.Control[iCurrent+22]=this.cb_4
end on

on w_orsamp_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.em_3)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.em_4)
destroy(this.st_2)
destroy(this.dw_8)
destroy(this.pb_1)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_7)
destroy(this.cb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.visible = false 		// B0001, H0001 프린트
dw_8.visible = false 		// 목동프린트

dw_2.SetTransObject(SQLCA) //샘플헤더
dw_6.settransobject(sqlca) //사업장
dw_4.settransobject(sqlca) // 수주번호 리스트
dw_6.insertrow(0)  
dw_6.object.area[1] = gs_area 
if gs_userid = "1999010s" then 
	dw_6.enabled = true
else
	dw_6.enabled = false
end if

dw_2.getchild("cust_no", idwc_cust) 	//거래처
gs_ds_whcustret.sharedata(idwc_cust) 	//데이터스토어

dw_2.getchild("scene_code", idwc_scene) //현장
idwc_scene.settransobject(sqlca)
idwc_scene.insertrow(0)  
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)
dw_3.settransobject(sqlca)

em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
em_3.text = LeftA(gs_area, 1) + "Q" + string(today(), "yyyymmdd") //샘플번호 타입
em_3.SelectText(9, 2)
em_3.setfocus()

end event

event resize;call super::resize;//
dw_3.width  = this.width  - 87
dw_3.height = this.height - 996

end event

type pb_save from w_inheritance`pb_save within w_orsamp_m
event ue_print pbm_custom01
integer x = 4288
integer y = 48
integer width = 178
integer taborder = 140
end type

event pb_save::clicked;dwitemstatus l_status2, l_status3
string  ls_sale_no, ls_sale_no1, ls_sale_date, ls_seq, ls_sale_flag, ls_area
string  ls_samp_no, ls_qa, ls_loc, ls_item_no, ls_issue_qty, ls_cust_no, ls_rem,  ls_old_time
int     li_seq
long    ll_row, ll_dw3rowcount, ll_count
decimal lr_issue_qty, ld_qoh
datetime ldt_date

dw_2.accepttext()
dw_3.accepttext()

if dw_2.rowcount() < 1 then return
	
l_status2 = dw_2.getitemstatus(1, 0, primary!)

ll_dw3rowcount = dw_3.rowcount()
if ll_dw3rowcount < 1 then
	messagebox("저장","등록된 물품이 없습니다!",exclamation!)
	return
end if

if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)

if l_status2 = newmodified! or l_status2 = new! then
	ls_area      = LeftA(dw_2.object.area_no[1],1) //출고지역
	ls_sale_flag = 'Q'
	ls_sale_date = string(dw_2.object.order_date[1], "yyyymmdd")
	ls_sale_no1  = ls_area + ls_sale_flag + ls_sale_date + '-' + '%'
		
	SELECT MAX(samp_no) INTO :ls_sale_no FROM samp WHERE samp_no LIKE :ls_sale_no1;
	if isnull(ls_sale_no) or ls_sale_no = '' then
		ls_sale_no1 = ls_area + ls_sale_flag + ls_sale_date + '-' + '001'
	else
		li_seq      = integer(MidA(ls_sale_no, 12, 3))
		li_seq      = li_seq + 1
		ls_seq      = '00' + string(li_seq)
		ls_sale_no1 = LeftA(ls_sale_no1, 11) + RightA(ls_seq, 3)
	end if
				
	for ll_row = 1 to ll_dw3rowcount
		dw_3.object.samp_no[ll_row] = ls_sale_no1
	next
	dw_2.object.samp_no[1] = ls_sale_no1
end if
	
select getdate() into :ldt_date from login where user_id = :gs_userid;

dw_2.accepttext()
dw_3.accepttext()

for ll_row = 1 to ll_dw3rowcount
	l_status3 = dw_3.GetItemStatus(ll_row, 0, Primary!)
	if l_status3 = new! or  l_status3 = newmodified! then
	else
		continue
	end if
	
	ls_samp_no   = dw_3.getitemstring(ll_row,  'item_no')
	ls_qa        = dw_3.getitemstring(ll_row,  'qa')
	ls_loc       = dw_3.getitemstring(ll_row,  'loc_no')
	lr_issue_qty = dw_3.getitemdecimal(ll_row, "issue_qty")
	
	if ls_samp_no = '' or isnull(ls_samp_no) then
		messagebox("확인","물품을 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.scrolltorow(ll_row)			
		dw_3.setcolumn("item_no")
		return
	end if

	if ls_qa = '' or isnull(ls_qa) then
		messagebox("확인","규격을 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.scrolltorow(ll_row)			
		dw_3.setcolumn("qa")
		return
	end if

	if ls_loc = '' or isnull(ls_loc) then
		messagebox("확인","저장소를 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.scrolltorow(ll_row)			
		dw_3.setcolumn("loc_no")
		return
	end if

	if lr_issue_qty = 0 or isnull(lr_issue_qty) then
		messagebox("확인","샘플수량을 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.scrolltorow(ll_row)			
		dw_3.setcolumn("issue_qty")
		return
	end if
next


ls_old_time = string(now(),'hh:mm:ss:fff')
for ll_row = 1 to ll_dw3rowcount
	l_status3 = dw_3.GetItemStatus(ll_row, 0, Primary!)
	if l_status3 = new! or  l_status3 = newmodified! then
	else
		continue
	end if
	
	ldt_date     = dw_2.getitemdatetime(1, 'order_date')
	ls_cust_no   = dw_2.getitemstring(1,   'cust_no')
	ls_samp_no   = dw_2.getitemstring(1,   'samp_no')

	li_seq       = dw_3.getitemdecimal(ll_row, 'seq_no')
	ls_item_no   = dw_3.getitemstring(ll_row,  'item_no')
	ls_qa        = dw_3.getitemstring(ll_row,  'qa')
	ls_loc       = dw_3.getitemstring(ll_row,  'loc_no')
	lr_issue_qty = dw_3.getitemdecimal(ll_row, 'issue_qty')
	ls_rem       = dw_3.getitemstring(ll_row,  'rem')

	select qoh into :ld_qoh from itemloc where loc_no = :ls_loc and item_no = :ls_item_no and qa = :ls_qa;
	if ld_qoh < lr_issue_qty then
		messagebox("확인","저장소 수량보다 출고 수량이 큽니다. 수량을 확인하십시요",exclamation!)
		dw_3.scrolltorow(ll_row)
		dw_3.setcolumn('issue_qty')
		dw_3.setfocus()
		return
	end if

	for ll_count = 1 to 100000
		IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
			ls_old_time  = string(now(),'hh:mm:ss:fff')	
			exit
		END IF	
	NEXT		

	insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		    rcpt_qty,   issue_qty, cost, destination, rem, cnt, user_id)  
	values (getdate(), :ldt_date, :ls_item_no, :ls_qa, :ls_loc, 'IQ', :ls_samp_no,
	        0, :lr_issue_qty, 0, :ls_cust_no, :ls_rem, :li_seq, :gs_userid);
	if sqlca.sqlcode < 0 then
		messagebox('오류17',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
		rollback;
		return
	end if		
next //dw_3.rowcount()


if wf_update2(dw_2, dw_3, 'Y') = FALSE  THEN   RETURN
if ls_sale_no1 = '' or isnull(ls_sale_no1) then // 비고(rem) 수정시 메세지변경
	ls_sale_no1 = dw_2.object.samp_no[1] 
	if MessageBox("확인", "샘플번호는 " + ls_sale_no1 + " 입니다." + &
					  "~r~n거래명세서를 출력하시겠습니까?", Question!, OKCancel!, 1) = 1 THEN
		pb_print.triggerevent(clicked!)
	end if
else
	if MessageBox("확인", "생성된 샘플번호는 " + ls_sale_no1 + " 입니다." + &
					  "~r~n거래명세서를 출력하시겠습니까?", Question!, OKCancel!, 1) = 1 THEN
		pb_print.triggerevent(clicked!)
	end if
end if

em_1.text = string(dw_2.object.order_date[1], "YYYY/MM/DD")
em_2.text = string(dw_2.object.order_date[1], "YYYY/MM/DD")
dw_4.setredraw(false)

date  ld_start_date, ld_end_date

ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
dw_4.retrieve(ld_start_date,ld_end_date)

dw_4.setredraw(true)
ll_row = dw_4.Find( "samp_no = '"+ ls_sale_no1 +"'", 1, dw_4.rowcount())
dw_4.scrolltorow(ll_row)

end event

type dw_1 from w_inheritance`dw_1 within w_orsamp_m
integer x = 663
integer y = 4
integer width = 96
integer height = 68
string dataobject = "d_oigiving_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_orsamp_m
integer x = 32
integer y = 36
integer width = 864
string text = "샘 플 관 리"
end type

type st_tips from w_inheritance`st_tips within w_orsamp_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsamp_m
integer x = 4174
integer y = 764
integer width = 155
integer height = 112
string picturename = "c:\bmp\delete.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)
end event

event pb_compute::clicked;call super::clicked;integer li_row
dwitemstatus l_status2

dw_2.accepttext()
dw_3.accepttext()
li_row =  dw_3.rowcount()
l_status2 = dw_2.getitemstatus(1, 0, primary!)
if l_status2 = newmodified! or l_status2 = new! then
else
	return
end if
if li_row > 0 then
	dw_3.deleterow(dw_3.getrow())
end if


end event

type pb_print_part from w_inheritance`pb_print_part within w_orsamp_m
integer x = 4014
integer y = 764
integer width = 155
integer height = 112
string picturename = "c:\bmp\pencil.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event pb_print_part::clicked;call super::clicked;long ll_row, ll_seq, ll_front
decimal lr_order_qty
integer li_row
string ls_samp_no, ls_qa, ls_loc
dwitemstatus l_status2

if dw_2.rowcount() < 1 then return
l_status2 = dw_2.getitemstatus(1, 0, primary!)
if l_status2 = newmodified! or l_status2 = new! then
else
	return
end if
	
dw_2.accepttext()
li_row = dw_2.getrow()
if ( dw_2.object.cust_no[li_row] = '' or isnull(dw_2.object.cust_no[li_row]) ) then
	messagebox('알림','판매거래처를 선택하세요.')
	return
end if

dw_3.accepttext()
if wf_nullchk(dw_3) = false then
	return
end if

li_row = dw_3.getrow()
if li_row > 0 then
	ls_samp_no = dw_3.getitemstring(li_row, 'item_no')
	ls_qa = dw_3.getitemstring(li_row, 'qa')
	lr_order_qty = dw_3.getitemdecimal(li_row, "issue_qty")

	if ls_samp_no = '' or isnull(ls_samp_no) then
		messagebox("확인","물품을 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.setcolumn("item_no")
		return
	end if

	if ls_qa = '' or isnull(ls_qa) then
		messagebox("확인","규격을 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.scrolltorow(li_row)			
		dw_3.setcolumn("qa")
		return
	end if

	if lr_order_qty = 0 or isnull(lr_order_qty) then
		messagebox("확인","샘플수량을 입력하세요!",exclamation!)
		dw_3.setfocus()
		dw_3.setcolumn("issue_qty")
		return
	end if
end if

setpointer(hourglass!)
ll_row = dw_3.insertrow(0)
dw_3.scrolltorow(ll_row)
ll_seq = dw_3.rowcount()

if ll_seq > 1 then //순번
	ll_front = dw_3.object.seq_no[ll_row - 1]
	dw_3.object.seq_no[ll_row] = ll_front + 1
else
	dw_3.object.seq_no[ll_row] = ll_row
end if

dw_3.setcolumn("item_no")
dw_3.setfocus()
dw_3.object.item_no.protect = 0
dw_3.object.qa.protect = 0
dw_3.object.issue_qty.protect = 0
dw_3.object.price.protect = 0
dw_3.object.rem.protect = 0

end event

type pb_close from w_inheritance`pb_close within w_orsamp_m
integer x = 4471
integer y = 48
integer width = 178
integer taborder = 250
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsamp_m
integer x = 3739
integer y = 48
integer width = 178
integer taborder = 260
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status

l_status = dw_2.getitemstatus(1, 0, primary!)
if ( l_status = newmodified! or l_status = new! ) or ( dw_2.rowcount() < 1 ) then return
if gs_area = 'B0001' or gs_area = 'H0001' then
	wf_print(dw_1)
else
	wf_print(dw_8)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_orsamp_m
integer x = 2862
integer y = 68
integer width = 160
integer height = 124
integer taborder = 30
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_cancel::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sampno
long ll_row

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_4.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_4.setredraw(true)

ls_sampno = TRIM(em_3.TEXT) + '-' + RightA ( '000' + trim(em_4.text), 3)

if isnull(ls_sampno) or ls_sampno = '' then return

select count(*) into :ll_row from samp
 where samp_no = :ls_sampno;
if ll_row < 1 then 
	beep(2)
	em_3.SelectText(9, 2)
	em_3.setfocus()
	dw_2.setredraw(true)
	dw_3.setredraw(true)
	return
end if
wf_retrieve(ls_sampno)



end event

type pb_delete from w_inheritance`pb_delete within w_orsamp_m
integer x = 4105
integer y = 48
integer width = 178
integer taborder = 270
end type

event pb_delete::clicked;dwitemstatus l_status, l_status3
datetime ldt_date
long    ll_row, ll_count, ll_rowcount
string  ls_order_no, ls_old_time, ls_cust_no, ls_item_no, ls_qa, ls_loc, ls_rem
integer li_seq
decimal lr_issue_qty

if dw_2.rowcount() < 1 then return

dw_2.accepttext()
dw_3.accepttext()
l_status    = dw_2.getitemstatus(1, 0, primary!)
ls_order_no = dw_2.object.samp_no[1] 

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	if l_status = newmodified! or l_status = new! then
	else
		ll_rowcount = dw_3.rowcount()
		ls_old_time = string(now(),'hh:mm:ss:fff')
		for ll_row = 1 to ll_rowcount
			l_status3    = dw_3.GetItemStatus(ll_row, 0, Primary!)			
			ldt_date     = dw_2.getitemdatetime(1, 'order_date')
			ls_cust_no   = dw_2.getitemstring(1, 'cust_no')

			li_seq       = dw_3.getitemdecimal(ll_row, 'seq_no')
			ls_item_no   = dw_3.getitemstring(ll_row, 'item_no')
			ls_qa        = dw_3.getitemstring(ll_row, 'qa')
			ls_loc       = dw_3.getitemstring(ll_row, 'loc_no')
			lr_issue_qty = dw_3.getitemdecimal(ll_row, 'issue_qty')
			ls_rem       = dw_3.getitemstring(ll_row, 'rem')
		
			for ll_count = 1 to 100000
				IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
					ls_old_time  = string(now(),'hh:mm:ss:fff')	
					exit
				END IF	
			NEXT		
		
			insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
				    rcpt_qty, issue_qty, cost, destination, rem, cnt, user_id)  		
			values (getdate(), :ldt_date, :ls_item_no, :ls_qa, :ls_loc, 'IQ', :ls_order_no,
					 0, :lr_issue_qty * -1, 0, :ls_cust_no, :ls_rem, :li_seq, :gs_userid);		
			if sqlca.sqlcode < 0 then
				messagebox('오류17',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
				rollback;
				return
			end if						
		next //dw_3.rowcount()
		
		SELECT COUNT(*) into :ll_count from sampdet where samp_no = :ls_order_no;
		IF ll_count > 0 THEN
			DELETE FROM sampdet WHERE samp_no = :ls_order_no;
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("삭제","sampdet삭제도중 오류가 발생하였습니다.")
				return
			end if
			
			dw_2.deleterow(1)

			dw_3.setredraw(false)
			dw_3.reset()
			dw_3.setredraw(true)

			if wf_update1(dw_2,'Y') = false then return
			dw_4.deleterow(dw_4.getrow())
		end if
	end if
	if dw_4.rowcount() > 0 then
		dw_2.retrieve(dw_4.getitemstring(dw_4.getrow(), "samp_no"))
		dw_3.retrieve(dw_4.getitemstring(dw_4.getrow(), "samp_no"))
	else
		dw_2.setredraw(false)
		dw_2.reset()
		dw_2.setredraw(true)
	end if
end if


end event

type pb_insert from w_inheritance`pb_insert within w_orsamp_m
integer x = 3922
integer y = 48
integer width = 178
integer taborder = 290
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long ll_row

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_6.accepttext()

ll_row = dw_2.insertrow(0)

dw_2.setredraw(true)
dw_3.setredraw(true)

dw_2.object.order_date[1] = wf_today() //오늘일자
dw_2.object.area_no[1] = dw_6.object.area[1] //변경된 사업장
dw_2.object.login_id[1] = gs_userid  //입력자

dw_2.object.cust_no.protect = 0
dw_2.object.cust_no.background.color = rgb(255,255,255)
dw_2.object.order_date.protect = 0
dw_2.object.area_no.protect = 0
dw_2.object.salesman.protect = 0
dw_2.object.rem.protect = 0
dw_2.object.scene_code.background.color = rgb(192,192,192)
dw_2.object.scene_code.protect = 1


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsamp_m
integer x = 2007
integer y = 80
integer width = 128
integer height = 96
integer taborder = 280
end type

event pb_retrieve::clicked;date  ld_start_date, ld_end_date
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_4.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_4.reset()
dw_2.reset()
dw_3.reset()
ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
dw_4.retrieve(ld_start_date,ld_end_date) // 샘플번호 리스트
dw_4.setfocus()
dw_4.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)
dw_2.setcolumn('rem')
dw_2.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_orsamp_m
integer x = 3072
integer y = 8
integer width = 603
integer height = 204
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_orsamp_m
integer x = 27
integer y = 212
integer width = 2007
integer height = 548
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsamp_m
integer x = 3703
integer y = 8
integer width = 965
integer taborder = 180
end type

type dw_2 from w_inheritance`dw_2 within w_orsamp_m
integer x = 2048
integer y = 232
integer width = 2619
integer height = 524
integer taborder = 60
string dataobject = "d_orsamp_m"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;string  ls_salesman, ls_item_no, ls_qa, ls_qoh
string ls_data, ls_area, ls_loc_no
long ll_found, ll_cnt, ll_qoh
integer li_row

this.accepttext()
choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", idwc_cust)
		
		ls_data = data
		select count(*) into :ll_found from customer
		 where cust_no = :ls_data;
		if ll_found = 0 then
			messagebox("확인","위와 같은고객이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		select salesman into :ls_salesman from customer
		 where cust_no = :ls_data;

		this.object.scene_code[1] = ''
		select count(*) into :ll_cnt from scene
		 where cust_no = :ls_data;
		 idwc_scene.reset() 
		if ll_cnt > 0 then
			wf_sceneretrieve(ls_data)
			this.object.scene_code.protect = 0
			this.object.scene_code.background.color = rgb(255,255,255)
		else
			dw_2.object.scene_code.background.color = rgb(192,192,192)
			dw_2.object.scene_code.protect = 1
		end if
		//거래처 선택후 수정불가
		this.object.cust_no.background.color = rgb(192,192,192)
		this.object.cust_no.protect = 1
		this.object.salesman[1] = ls_salesman
		
		this.setfocus()
	case 'scene_code'
		ls_data = data
		select count(*) into :ll_found from scene
		 where scene_code = :ls_data;
		if ll_found = 0 then
			messagebox("확인","위와 같은현장은 존재하지 않습니다!",exclamation!)
			return 1
		end if
		this.setcolumn("order_date")
		this.setfocus()
	case 'area_no'
		ll_cnt = dw_3.rowcount()
//		if ll_cnt < 1 then return
		ls_area = dw_2.object.area_no[1]
		select def_loc into :ls_loc_no from area
		 where area_no = :ls_area;
//		if sqlca.sqlcode <> 0 then
//			messagebox("확인","기본 저장소 찾기에서 오류가 발생하였습니다.",exclamation!)
//			return 1
//		end if

		for li_row = 1 to ll_cnt
			dw_3.object.loc_no[li_row] = ls_loc_no
//// qa 선택후 저장소별 재고파악
			ls_item_no = dw_3.getitemstring(li_row, "item_no")
			ls_qa = dw_3.getitemstring(li_row, "qa")
			ll_qoh = 0
			select qoh into :ll_qoh from itemloc
			  where item_no = :ls_item_no and
					  qa = :ls_qa and
					  loc_no = :ls_loc_no ;
			if sqlca.sqlcode <> 0 then
				dw_3.object.qoh[li_row] = 0
			else
				dw_3.object.qoh[li_row] = ll_qoh
			end if
		next
		dw_3.accepttext()
		dw_3.setfocus()
end choose
return 0

end event

event dw_2::itemerror;string ls_null
setnull(ls_null)
CHOOSE CASE dwo.name
	CASE 'cust_no'
		this.object.cust_no[1] = ls_null
	CASE 'scene_code'
		this.object.scene_code[1] = ls_null
END CHOOSE
return 2
end event

event dw_2::retrieveend;call super::retrieveend;dw_2.object.cust_no.protect = 1
dw_2.object.scene_code.protect = 1
dw_2.object.order_date.protect = 1
dw_2.object.area_no.protect = 1
dw_2.object.salesman.protect = 1

end event

event dw_2::editchanged;call super::editchanged;//dwitemstatus l_status2
//choose case dwo.name
//	case 'rem'
//		l_status2 = dw_2.getitemstatus(1,0,primary!)	
//		if l_status2 = new! or l_status2 = newmodified! then
//		else
//			pb_save.enabled = true
//		end if
//end choose
//return 0
end event

event dw_2::losefocus;call super::losefocus;dw_2.accepttext()

end event

type gb_5 from groupbox within w_orsamp_m
integer x = 1211
integer y = 8
integer width = 955
integer height = 204
integer taborder = 220
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "조회일자"
end type

type gb_4 from groupbox within w_orsamp_m
integer x = 2181
integer y = 8
integer width = 864
integer height = 204
integer taborder = 210
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "샘플번호"
end type

type dw_4 from datawindow within w_orsamp_m
integer x = 50
integer y = 392
integer width = 1961
integer height = 348
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_orsamp_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow < 1 then return

wf_retrieve(this.object.samp_no[currentrow])

end event

event clicked;string ls_col, ls_text

if row < 1 then return
this.scrolltorow(row)

choose case dwo.name
	case "samp_no"
		ls_col = "샘플번호"
		ls_text = this.object.samp_no[row]
	case "order_date"
		ls_col = "주문일자"
		ls_text = string(this.object.order_date[row])
	case "cust_name"
		ls_col = "거래처명"
		ls_text = this.object.cust_name[row]
end choose		

choose case ls_col
	case "샘플번호", "주문일자"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type dw_6 from datawindow within w_orsamp_m
integer x = 3104
integer y = 88
integer width = 530
integer height = 88
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type em_3 from editmask within w_orsamp_m
event keydown pbm_dwnkey
integer x = 2203
integer y = 88
integer width = 379
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF

END IF



end event

type st_1 from statictext within w_orsamp_m
integer x = 1605
integer y = 104
integer width = 46
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_orsamp_m
integer x = 1641
integer y = 92
integer width = 357
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_1 from editmask within w_orsamp_m
integer x = 1248
integer y = 92
integer width = 357
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

type dw_3 from datawindow within w_orsamp_m
event keydown pbm_dwnkey
integer x = 27
integer y = 884
integer width = 4640
integer height = 1568
integer taborder = 80
string dataobject = "d_orsamp_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_item_no, ls_qa, ls_item_name, ls_data
string ls_uom, ls_cust_no, ls_scene_no, ls_null, ls_area, ls_loc_no
long ll_row1, ll_found, ll_cnt, ll_qoh
decimal lr_order_qty

this.accepttext()
dw_2.accepttext()
setnull(ls_null)

ls_item_no = this.getitemstring(row, "item_no")
ls_data = data
choose case dwo.name
	case 'item_no'
		select count(*) into :ll_cnt from groupitem
		 where item_no = :ls_item_no
			and use_flag = 'C'; 
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 코드입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		 select item_name into :ls_item_name from groupitem 
		  where item_no = :ls_data
		    and use_flag = 'Y';
		 if sqlca.sqlcode = 100 then 
			 return 1
		 end if

		this.object.groupitem_item_name[row] = ls_item_name
		
		dw_3.getchild("qa", idwc_qa) //규격
		gs_ds_qaall.ShareData(idwc_qa)

		if ls_item_no <> '' then
			select count(*) into :ll_cnt from item
			 where item_no = :ls_item_no
			   and use_flag = 'Y';
			if ll_cnt > 0 then
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			end if
			
			if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
				this.setcolumn("qa")
				this.setfocus()
			else
				this.setcolumn("item_no")
				this.setfocus()
			end if
		else
				this.setfocus()
		end if

	case 'qa'
		select count(*) into :ll_cnt from item
		 where item_no = :ls_item_no
			and qa = :ls_data
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if

		ls_area = dw_2.object.area_no[1]
		select def_loc into :ls_loc_no from area
		 where area_no = :ls_area;
		if sqlca.sqlcode <> 0 then
			messagebox("확인","기본 저장소 찾기에서 오류가 발생하였습니다.",exclamation!)
			return 1
		end if
		dw_3.object.loc_no[row] = ls_loc_no
		dw_3.accepttext()
		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[row] = ls_uom
		this.object.issue_qty[row] = 0
		this.object.price[row] = 0 
		this.object.rem[row] = ls_null
		this.object.qoh[row] = 0
//// qa 선택후 저장소별 재고파악
		ls_qa = this.getitemstring(row, "qa")
		ls_loc_no = this.getitemstring(row,"loc_no")
		select qoh into :ll_qoh from itemloc
		  where item_no = :ls_item_no and
		        qa = :ls_qa and
				  loc_no = :ls_loc_no ;
  		if sqlca.sqlcode <> 0 then
//			messagebox("확인","해당 저장소에 선택한 물품이 없습니다.",exclamation!)
//			this.setcolumn("qa")
//			this.setfocus()
//			return 1
			this.object.qoh[row] = 0
		end if
		this.object.qoh[row] = ll_qoh
		this.setcolumn("issue_qty")
		this.setfocus()

	case 'issue_qty'
		if this.object.issue_qty[row] > this.object.qoh[row] then
			messagebox("확인","출고될 수량이 저장소 재고보다 많습니다!~n~r저장소 재고를 확인해 주십시요!",exclamation!)
			dw_3.setcolumn('issue_qty')
			dw_3.setfocus()
			return 1
		end if				  
end choose
return 0
end event

event retrieveend;
if rowcount > 0 then
	dw_3.object.item_no.protect = 1
	dw_3.object.qa.protect = 1
	dw_3.object.issue_qty.protect = 1
	dw_3.object.price.protect = 1
	dw_3.object.rem.protect = 1
end if

end event

event rowfocuschanged;string ls_item_no

if currentrow > 0 then
	this.accepttext()
	ls_item_no = this.object.item_no[this.getrow()]
	if ls_item_no = '' or isnull(ls_item_no) then
		return
	else
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
	end if
end if
end event

event itemerror;string ls_null

setnull(ls_null)
choose case dwo.name
	case 'item_no'
			this.object.item_no[row] = ls_null
	case 'qa'
			this.object.qa[row] = ls_null
//	case 'loc_no'
//			this.object.loc_no[row] = ls_null
	case 'issue_qty'
			this.object.issue_qty[row] = 0
	case 'price'
			this.object.price[row] = 0
end choose
return 1
end event

event losefocus;this.accepttext()
end event

type em_4 from editmask within w_orsamp_m
integer x = 2624
integer y = 88
integer width = 224
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
boolean spin = true
string minmax = "1~~999"
end type

type st_2 from statictext within w_orsamp_m
integer x = 2583
integer y = 104
integer width = 46
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "-"
boolean focusrectangle = false
end type

type dw_8 from datawindow within w_orsamp_m
integer x = 768
integer y = 4
integer width = 96
integer height = 68
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_oigiving_r1"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_orsamp_m
integer x = 4334
integer y = 764
integer width = 334
integer height = 112
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;gs_where2 lst_whitemret
long ll_row
dwitemstatus l_status2

l_status2 = dw_2.getitemstatus(1, 0, primary!)
if l_status2 = newmodified! or l_status2 = new! then
else
	return
end if
string ls_area, ls_loc

ls_area = dw_2.object.area_no[1]
select def_loc into :ls_loc from area
 where area_no = :ls_area;
 
lst_whitemret.chk = 'M' //M:multi S:single
lst_whitemret.chk1 = ls_loc
openwithparm(w_whitemlocqohmulti_w, lst_whitemret)  //물품선택윈도우
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk <> 'Y' then return
string ls_item, ls_null
long ll_cnt

dw_3.SETREDRAW(false)
ll_cnt = 0
setnull(ls_null)
for ll_row = 1 to UpperBound(lst_whitemret.str1)						
	ll_cnt = dw_3.insertrow(0)
	if ll_cnt = 1 then 
		dw_3.object.seq_no[ll_cnt] = 1
	else
		dw_3.object.seq_no[ll_cnt] = dw_3.object.seq_no[ll_cnt - 1] + 1
	end if
	dw_3.object.item_no[ll_cnt] = lst_whitemret.str1[ll_row]
	dw_3.object.qa[ll_cnt] = lst_whitemret.str2[ll_row]
	dw_3.object.uom[ll_cnt] = lst_whitemret.str3[ll_row]
	dw_3.object.issue_qty[ll_cnt] = 0
	dw_3.object.price[ll_cnt] = 0 
	dw_3.object.qoh[ll_cnt] = lst_whitemret.qty1[ll_row] 
	dw_3.object.loc_no[ll_cnt] = ls_loc
	dw_3.object.groupitem_item_name[ll_cnt] = lst_whitemret.name[ll_row]
next
dw_3.scrolltorow(1)
dw_3.getchild("qa", idwc_qa)
idwc_qa.setfilter("item_no = '" + lst_whitemret.str1[1] + "'")
idwc_qa.filter()

dw_3.setcolumn('issue_qty')
dw_3.setfocus()
dw_3.SETREDRAW(true)

end event

type st_8 from statictext within w_orsamp_m
integer x = 64
integer y = 296
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

type ddlb_col from dropdownlistbox within w_orsamp_m
integer x = 247
integer y = 276
integer width = 402
integer height = 344
integer taborder = 210
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
string item[] = {"샘플번호","주문일자","거래처명"}
end type

type st_9 from statictext within w_orsamp_m
integer x = 663
integer y = 296
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_orsamp_m
integer x = 846
integer y = 276
integer width = 279
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

type sle_value from singlelineedit within w_orsamp_m
integer x = 1138
integer y = 280
integer width = 498
integer height = 76
integer taborder = 420
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_orsamp_m
integer x = 1650
integer y = 252
integer width = 178
integer height = 68
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_4.FilteredCount() > 0 THEN
	dw_4.setfilter(ls_temp)
	dw_4.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "샘플번호"
			ls_col = "samp_no"
		case "주문일자"
			ls_col = "order_date"
		case "거래처명"
			ls_col = "cust_name"
	end choose		
		
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "order_date " then
			ls_column = ls_col + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_4.setfilter(ls_temp)
dw_4.filter()

dw_4.scrolltorow(1)
dw_4.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_orsamp_m
integer x = 1833
integer y = 252
integer width = 178
integer height = 68
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "거래처명"
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()

end event

type cb_7 from commandbutton within w_orsamp_m
integer x = 1650
integer y = 320
integer width = 178
integer height = 68
integer taborder = 170
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
String ls_col
choose case trim(ddlb_col.text)
	case "샘플번호"
		ls_col = "samp_no"
	case "주문일자"
		ls_col = "order_date"
	case "거래처명"
		ls_col = "cust_name"
end choose

dw_4.SetSort(ls_col + " A")
dw_4.sort()

end event

type cb_4 from commandbutton within w_orsamp_m
integer x = 1833
integer y = 320
integer width = 178
integer height = 68
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
String ls_col
choose case trim(ddlb_col.text)
	case "샘플번호"
		ls_col = "samp_no"
	case "주문일자"
		ls_col = "order_date"
	case "거래처명"
		ls_col = "cust_name"
end choose		

dw_4.SetSort(ls_col + " D")
dw_4.sort()

end event

