$PBExportHeader$w_oido_m.srw
$PBExportComments$거래명세서작성(2003/09/08,이인호)
forward
global type w_oido_m from w_inheritance
end type
type gb_5 from groupbox within w_oido_m
end type
type gb_4 from groupbox within w_oido_m
end type
type dw_3 from datawindow within w_oido_m
end type
type dw_inaudit from datawindow within w_oido_m
end type
type dw_dodet from datawindow within w_oido_m
end type
type dw_8 from datawindow within w_oido_m
end type
type dw_5 from datawindow within w_oido_m
end type
type em_3 from editmask within w_oido_m
end type
type st_2 from statictext within w_oido_m
end type
type st_4 from statictext within w_oido_m
end type
type cbx_10 from checkbox within w_oido_m
end type
type cbx_source from checkbox within w_oido_m
end type
type dw_source from datawindow within w_oido_m
end type
type cbx_1 from checkbox within w_oido_m
end type
type cbx_2 from checkbox within w_oido_m
end type
type rb_a4 from radiobutton within w_oido_m
end type
type rb_a5 from radiobutton within w_oido_m
end type
type cbx_temp from checkbox within w_oido_m
end type
type gb_8 from groupbox within w_oido_m
end type
type st_1 from statictext within w_oido_m
end type
type cbx_3 from checkbox within w_oido_m
end type
type cbx_4 from checkbox within w_oido_m
end type
type st_3 from statictext within w_oido_m
end type
type st_5 from statictext within w_oido_m
end type
type em_left from editmask within w_oido_m
end type
type em_top from editmask within w_oido_m
end type
type st_pick from structure within w_oido_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oido_m from w_inheritance
integer y = 160
integer width = 4754
integer height = 2996
string title = "거래명세서 작성(w_oido_m)"
gb_5 gb_5
gb_4 gb_4
dw_3 dw_3
dw_inaudit dw_inaudit
dw_dodet dw_dodet
dw_8 dw_8
dw_5 dw_5
em_3 em_3
st_2 st_2
st_4 st_4
cbx_10 cbx_10
cbx_source cbx_source
dw_source dw_source
cbx_1 cbx_1
cbx_2 cbx_2
rb_a4 rb_a4
rb_a5 rb_a5
cbx_temp cbx_temp
gb_8 gb_8
st_1 st_1
cbx_3 cbx_3
cbx_4 cbx_4
st_3 st_3
st_5 st_5
em_left em_left
em_top em_top
end type
global w_oido_m w_oido_m

type variables
public string is_addr
st_print i_print
datawindowchild idwc_scene, idwc_cust, idwc_car, idwc_lot, idwc_locno
string is_old_time, is_scenesql, is_custscenesql, is_locnosql, is_sel_orderno = 'N' 
string is_sno, is_sh, is_nm, is_js

string is_dw1_syntax, is_dwdet_syntax, is_dwaudit_syntax
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
public subroutine wf_calc ()
public function boolean wf_itemalter (string as_sale, long al_seq, long al_int, long al_row)
public subroutine wf_cleardddw ()
public subroutine wf_coildddw (string as_item, string as_qa, string as_loc)
public subroutine wf_sheetdddw (string as_item, string as_qa, string as_loc)
public subroutine wf_locno (string arg_docase)
end prototypes

public subroutine wf_print (datawindow arg_dw);//
datetime ld_date
dec    ld_amount
long   ll_count,   ll_idx, ll_int, ll_cnt, ll_line_cnt
string ls_orderno, ls_cust_name,   ls_cap_name, ls_cust_no, ls_null, ls_rate_cash, ls_username
string ls_ship_cash, ls_ship_vat, ls_ship_qty, ls_acc_qty, ls_price, ls_amount
string ls_item_name, ls_item_no, ls_qa, ls_cash, ls_uom, ls_dr, ls_real_uom, ls_cnt
string ls_sale_no, ls_desc, ls_unit_qty
int    li_seq_no

dw_1.accepttext()
dw_dodet.accepttext()
arg_dw.reset()

setnull(ls_null)

ls_orderno = dw_1.object.do_no[1]	
ls_dr  = trim(dw_1.object.rem[1]) + " " + trim(dw_1.object.do_dr_hp[1])
ll_idx = 0
ll_int = 0

ls_username = gs_username
if rb_A5.checked = true then
	ll_line_cnt = 16
else
	ll_line_cnt = 25
end if

for ll_count = 1 to dw_dodet.rowcount()
	if ll_idx = 0 then
		ll_int = ll_int + 1
		
		arg_dw.object.register[1]     = is_sno
		arg_dw.object.saler_name[1]   = is_sh
		arg_dw.object.saler_cap[1]    = is_nm
		arg_dw.object.saler_addr[1]   = is_js
		
      arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]
		if arg_dw.dataobject = 'd_oigiving_r_22_a5' then
		else
			arg_dw.object.ls_user[ll_int] = ls_username
		end if
 	   arg_dw.object.addr[ll_int]    = dw_1.object.shipto_addr[1]
   	arg_dw.object.tel[ll_int]     = dw_1.object.tel_no[1]
      arg_dw.object.scene[ll_int]   = dw_1.object.scene_scene_desc[1]
		
   	ls_cust_no = dw_1.object.cust_no[1]
	   SELECT register_no INTO :ls_cap_name FROM customer WHERE cust_no = :ls_cust_no;
	   arg_dw.object.cust[ll_int]     =  dw_1.object.customer_cust_name[1]
   	arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	
	ll_idx     = ll_idx + 1
	ls_item_no = dw_dodet.object.item_no[ll_count]
   SELECT item_name INTO :ls_item_name  FROM groupitem WHERE item_no = :ls_item_no;	
	///////////////////////////////////////////////////////////////////
	// 규격(송장) 값이 존재하면 규격으로 출력함
	///////////////////////////////////////////////////////////////////
	ls_qa      = dw_dodet.object.qa[ll_count]
   if isnull(dw_dodet.object.qa_cust[ll_count]) then
	else
		ls_qa   = dw_dodet.object.qa_cust[ll_count]
	end if
  	ls_qa = MidA(ls_qa,  1, 3) + ' X ' + MidA(ls_qa,  5, 4) + ' X ' + &
		     MidA(ls_qa, 10, 4) + ' X ' + MidA(ls_qa, 15, 5) 
	///////////////////////////////////////////////////////////////////
	ls_uom       = dw_dodet.object.uom[ll_count]
	ls_ship_qty  = string(dw_dodet.object.ship_qty[ll_count],  '###,###,###.00')
	ls_acc_qty   = string(dw_dodet.object.c_acc_aty[ll_count], '###,###,###.00')
	ls_price     = string(dw_dodet.object.price[ll_count],     '#,###,###,##0')
	ld_amount    = truncate(dw_dodet.object.c_acc_aty[ll_count] * dw_dodet.object.price[ll_count] + 0.0000001, 0)
	ls_amount    = string(ld_amount, '#,###,###,##0')
	ls_rate_cash = string(dw_dodet.object.rate_cash[ll_count], '#,###,###,##0')
	if trim(ls_uom) = 'M' OR ls_uom = 'M2' then
     	ls_real_uom ='EA'
  	else
		if ls_uom = "SS" then
			ls_real_uom = "SH"
			ls_uom = "M2"
		else
	     	ls_real_uom = ls_uom
		end if
	end if

	// 거래명세서/출고증의 비고에 생산일자또는 입고일자또는 재고일자(출고일자)을 기록
	// iso에 의한 시화 진달수 과장의 요청에의하여 추가 2000/06/13, easthero
	ls_desc    = dw_dodet.object.rem[ll_count]
	ls_sale_no = dw_dodet.object.sale_no[ll_count]
	li_seq_no  = dw_dodet.object.seq_no[ll_count]
	setnull(ld_date)
	SELECT max(sfc_date) INTO :ld_date  FROM sfcday
	 WHERE sale_no = :ls_sale_no AND seq_no = :li_seq_no;
	if sqlca.sqlcode = 100 then
		SELECT max(insp_date) INTO :ld_date 
		  FROM insp, inspdet, purdet
		 WHERE insp.insp_no    = inspdet.insp_no
		   AND purdet.order_no = inspdet.pur_no
			AND purdet.seq_no   = inspdet.seq_no
			AND purdet.sale_no  = :ls_sale_no
			AND purdet.sale_seq = :li_seq_no;
	end if
	if DATE(ld_date) > date(dw_1.object.do_date[1]) or sqlca.sqlcode = 100 or isnull(ld_date) then
		ld_date = dw_1.object.do_date[1]
	end if
	
	////////////////////////// insert easthero 
	if not isnull(dw_dodet.object.coil_no[ll_count]) and trim(dw_dodet.object.coil_no[ll_count]) <> '' then
		ls_unit_qty = string(truncate(dw_dodet.object.ship_qty[ll_count] / dw_dodet.object.cnt[ll_count], 2), '###,###,###.00')
		ls_cnt      = string(dw_dodet.object.cnt[ll_count], '###,###')
   	ls_ship_qty = ls_unit_qty + space(9 - LenA(ls_unit_qty) - LenA(ls_cnt))+ ' X ' + ls_cnt
		ls_desc     = trim(ls_desc) + dw_dodet.object.coil_no[ll_count]
	end if
	////////////////////////// insert easthero end
	
	arg_dw.setitem(ll_int, 'item_'  + string(ll_idx), ls_item_name)
	arg_dw.setitem(ll_int, 'qa_'    + string(ll_idx), ls_qa)
	arg_dw.setitem(ll_int, 'auom_'  + string(ll_idx), ls_real_uom)
	arg_dw.setitem(ll_int, 'ship_'  + string(ll_idx), ls_ship_qty)
	arg_dw.setitem(ll_int, 'buom_'  + string(ll_idx), ls_uom)
	arg_dw.setitem(ll_int, 'acc_'   + string(ll_idx), ls_acc_qty)
	arg_dw.setitem(ll_int, 'cost_'  + string(ll_idx), ls_price)
	arg_dw.setitem(ll_int, 'price_' + string(ll_idx), ls_amount)
	arg_dw.setitem(ll_int, 'rate_'  + string(ll_idx), ls_rate_cash)
	arg_dw.setitem(ll_int, 'pdate'  + string(ll_idx), DATE(ld_date))
	arg_dw.setitem(ll_int, 'desc'   + string(ll_idx), ls_desc)
	if ll_idx = ll_line_cnt then // A4 : 25, A5 : 16
		arg_dw.object.dr_man[ll_int] = ls_dr
		ll_idx = 0
	end if
	
   IF ll_idx = 0 THEN
		arg_dw.object.cash[ll_int] = ls_null
		arg_dw.object.vat[ll_int]  = ls_null
		arg_dw.object.tot_amount[ll_int] = ls_null
	END IF		
next

if dw_1.object.ship_flag[1] = 'D' and dw_1.object.shipamt_case[1] = 'R' then 
	if dw_1.object.ship_amount[1] <> 0 then
		if ll_idx = 0 then
			ll_int = ll_int + 1
					
			arg_dw.object.register[1]     = is_sno
			arg_dw.object.saler_name[1]   = is_sh
			arg_dw.object.saler_cap[1]    = is_nm
			arg_dw.object.saler_addr[1]   = is_js
	
			arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
			arg_dw.object.do_no[ll_int] = dw_1.object.do_no[1]
			if arg_dw.dataobject = 'd_oigiving_r_22_a5' then
			else
				arg_dw.object.ls_user[ll_int] = ls_username
			end if
			arg_dw.object.addr[ll_int]  = dw_1.object.shipto_addr[1]
			arg_dw.object.tel[ll_int]   = dw_1.object.tel_no[1]
			arg_dw.object.scene[ll_int] = dw_1.object.scene_scene_desc[1]
			
			ls_cust_no = dw_1.object.cust_no[1]
			SELECT register_no INTO :ls_cap_name FROM customer WHERE cust_no = :ls_cust_no;
			arg_dw.object.cust[ll_int]     = dw_1.object.customer_cust_name[1]
			arg_dw.object.cap_name[ll_int] = ls_cap_name
		end if
		
		ll_idx = ll_idx + 1
		ls_ship_cash = string(dw_1.object.ship_amount[1], '#,###,###,##0')
		ls_ship_vat  = string(truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0 ), '#,###,###,##0')	
		if dw_1.object.do_rate[1] <> 0 then
		ELSE
			ls_ship_vat = '           0'
		END IF
		
		arg_dw.setitem(ll_int, 'item_'  + string(ll_idx), '운송비')
		arg_dw.setitem(ll_int, 'qa_'    + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'auom_'  + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'ship_'  + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'buom_'  + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'acc_'   + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'cost_'  + string(ll_idx), ls_ship_cash)
		arg_dw.setitem(ll_int, 'price_' + string(ll_idx), ls_ship_cash)
		arg_dw.setitem(ll_int, 'rate_'  + string(ll_idx), ls_ship_vat)
	end if
end if

arg_dw.object.cash[ll_int] = string(dw_1.object.do_cash[1], '#,###,###,###,###')
arg_dw.object.vat[ll_int]  = string(dw_1.object.do_rate[1], '#,###,###,###,###')
arg_dw.object.tot_amount[ll_int] = string(dw_1.object.do_total[1], '#,###,###,###,###')
arg_dw.object.dr_man[ll_int]     = ls_dr

end subroutine

public subroutine wf_calc ();//
int li_int

dw_1.Accepttext()
dw_2.Accepttext()
if dw_1.rowcount() < 1 then return

dw_1.setredraw(false)
dw_1.object.do_cash[1]  = 0
dw_1.object.do_rate[1]  = 0
dw_1.object.do_total[1] = 0

for li_int = 1 to dw_2.rowcount()
    dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_2.object.rlse_amount[li_int]
//  dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_2.object.rlse_rate[li_int] + 0.0000001, 0)	 
next

if dw_1.object.do_cash[1] > 0 then
	dw_1.object.do_rate[1] =  truncate((dw_1.object.do_cash[1] / 10) + 0.0000001, 0) 
elseif dw_1.object.do_cash[1] < 0 then
	dw_1.object.do_rate[1] =  truncate((dw_1.object.do_cash[1] / 10) - 0.0000001, 0) 
end if

if dw_1.object.ship_flag[1] = 'D' AND dw_1.object.shipamt_case[1] = 'R' then
	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]
	if dw_1.object.sale_flag[1] <> 'E' then
		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0)
	end if
end if
// 합계금액
dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]
dw_1.setredraw(true)


// 2007-12-05 부가세 계산방식 변경
//int li_int
//
//dw_1.Accepttext()
//dw_2.Accepttext()
//if dw_1.rowcount() < 1 then return
//
//dw_1.setredraw(false)
//dw_1.object.do_cash[1] = 0
//dw_1.object.do_rate[1] = 0
//dw_1.object.do_total[1] = 0
//for li_int = 1 to dw_2.rowcount()
//    dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_2.object.rlse_amount[li_int]
//    dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_2.object.rlse_rate[li_int] + 0.0000001, 0)	 
//next
//if dw_1.object.ship_flag[1] = 'D' AND dw_1.object.shipamt_case[1] = 'R' then
//	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]
//	IF dw_1.object.sale_flag[1] <> 'E' then
//		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0)
//	end if
//end if
//dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]
//dw_1.setredraw(true)

end subroutine

public function boolean wf_itemalter (string as_sale, long al_seq, long al_int, long al_row);// 사용중지 2004/09/24 이인호 
// 거래명세서 발행시 대체윈도우에서 저장시 바로 inaudit 발생하도록 변경
//
//long   ll_inauditrow
//string ls_flag, ls_loc
//string ls_srcitem, ls_srcqa, ls_taritem, ls_tarqa, ls_dono
//int li_count
//dec ld_src_qty, ld_tar_qty
//
//dw_1.accepttext()
//dw_2.accepttext()
//is_old_time = string(now(),'hh:mm:ss:fff')	
//setnull(ls_flag)
//ls_taritem = dw_2.object.item_no[al_int]
//ls_tarqa = dw_2.object.qa[al_int]
//ls_loc = dw_2.object.loc_no[al_int]
//
//select top 1 src_item, src_qa, src_qty, tar_qty, issue_flag 
// into :ls_srcitem, :ls_srcqa, :ld_src_qty, :ld_tar_qty, :ls_flag from itemalter
// where order_no = :as_sale
//	and seq = :al_seq
//	and tar_item = :ls_taritem
//	and tar_qa = :ls_tarqa
//	and tar_loc = :ls_loc
//	and issue_flag = 'N';
//if sqlca.sqlcode = 100 or isnull(ls_srcitem) or trim(ls_srcitem) = '' then
//	return true
//end if
//// 대체 출고
////입출고내역저장
//for li_count = 1 to 100000
//	IF is_old_time <> string(now(),'hh:mm:ss:fff') then
//		is_old_time  = string(now(),'hh:mm:ss:fff')	
//		exit
//	END IF	
//NEXT
//ll_inauditrow = dw_inaudit.insertrow(0)
//dw_inaudit.object.inaudit_time[ll_inauditrow] = gf_today()
//dw_inaudit.object.inaudit_date[ll_inauditrow] = dw_1.object.do_date[1]
//dw_inaudit.object.inaudit_item[ll_inauditrow] = ls_srcitem
//dw_inaudit.object.qa[ll_inauditrow] = ls_srcqa
//dw_inaudit.object.loc_no[ll_inauditrow] = dw_2.object.loc_no[al_int]
//dw_inaudit.object.inaudit_type[ll_inauditrow] = 'IA'
//dw_inaudit.object.order_no[ll_inauditrow] = dw_1.object.do_no[1]
//dw_inaudit.object.rcpt_qty[ll_inauditrow] = 0
//dw_inaudit.object.issue_qty[ll_inauditrow] = ld_src_qty
//dw_inaudit.object.cost[ll_inauditrow] = dw_2.object.price[al_int] * dw_1.object.curr_rate[1]
//dw_inaudit.object.destination[ll_inauditrow] = dw_2.object.loc_no[al_int]
//dw_inaudit.object.rem[ll_inauditrow] = '제품출고시 대체출고'
//dw_inaudit.object.serial_id[ll_inauditrow] = 'D'
//dw_inaudit.object.unit_qty[ll_inauditrow] = ld_src_qty
//dw_inaudit.object.com_qty[ll_inauditrow] = ld_src_qty
//dw_inaudit.object.cnt[ll_inauditrow] = al_row		
//dw_inaudit.object.user_id[ll_inauditrow] = gs_userid		
//// 대체 입고
//for li_count = 1 to 100000
//	IF is_old_time <> string(now(),'hh:mm:ss:fff') then
//		is_old_time  = string(now(),'hh:mm:ss:fff')	
//		exit
//	END IF	
//NEXT
//ll_inauditrow = dw_inaudit.insertrow(0)
//dw_inaudit.object.inaudit_time[ll_inauditrow] = gf_today()
//dw_inaudit.object.inaudit_date[ll_inauditrow] = dw_1.object.do_date[1]
//dw_inaudit.object.inaudit_item[ll_inauditrow] = dw_2.object.item_no[al_int]
//dw_inaudit.object.qa[ll_inauditrow] = dw_2.object.qa[al_int]
//dw_inaudit.object.loc_no[ll_inauditrow] = dw_2.object.loc_no[al_int]
//dw_inaudit.object.inaudit_type[ll_inauditrow] = 'RA'
//dw_inaudit.object.order_no[ll_inauditrow] = dw_1.object.do_no[1]
//dw_inaudit.object.rcpt_qty[ll_inauditrow] = ld_tar_qty
//dw_inaudit.object.issue_qty[ll_inauditrow] = 0
//dw_inaudit.object.cost[ll_inauditrow] = dw_2.object.price[al_int] * dw_1.object.curr_rate[1]
//dw_inaudit.object.destination[ll_inauditrow] = dw_2.object.loc_no[al_int]
//dw_inaudit.object.rem[ll_inauditrow] = '제품출고시 대체입고'
//dw_inaudit.object.serial_id[ll_inauditrow] = 'D'
//dw_inaudit.object.unit_qty[ll_inauditrow] = ld_tar_qty
//dw_inaudit.object.com_qty[ll_inauditrow] = ld_tar_qty
//dw_inaudit.object.cnt[ll_inauditrow] = al_row		
//dw_inaudit.object.user_id[ll_inauditrow] = gs_userid	
//ls_dono = dw_1.object.do_no[1]
//
////UPDATE itemalter SET issue_flag ='Y', do_no = :ls_dono, do_seq = :al_row
//// where alter_time = ( select min(alter_time) from itemalter
////							 where order_no = :as_sale
////								and seq = :al_seq
////								and tar_item = :ls_taritem
////								and tar_qa = :ls_tarqa
////								and tar_loc = :ls_loc
////								and issue_flag = 'N');
////if sqlca.sqlcode < 0 then
////	rollback;
////	messagebox("저장","coilmst저장도중 오류가 발생하였습니다!",exclamation!)
////	return FALSE
////end if		
return true

end function

public subroutine wf_cleardddw ();
dw_2.Modify("coil_no.edit.case=any")
dw_2.Modify("coil_no.edit.autoselect=yes")
dw_2.Modify("coil_no.edit.nilisnull=yes")

return
end subroutine

public subroutine wf_coildddw (string as_item, string as_qa, string as_loc);string  ls_where, ls_clause, ls_select
datawindowchild ldwc_lot

dw_2.Modify("coil_no.dddw.Name='d_cdcoil_c'")
dw_2.Modify("coil_no.dddw.allowedit=no")
dw_2.Modify("coil_no.dddw.displayColumn='coil_no'")
dw_2.Modify("coil_no.dddw.DataColumn='coil_no'")
dw_2.Modify("coil_no.dddw.percentwidth='480'")
dw_2.Modify("coil_no.dddw.vscrollbar=yes")

dw_2.getchild('coil_no',ldwc_lot)
ldwc_lot.settransobject(sqlca)

ls_select = ldwc_lot.Describe("DataWindow.Table.Select")

//ls_qa = "%" + mid(as_qa, 4,7) + "%"
ls_where = " and item_no = ~~'" + as_item + "~~'"   &
			 + " and qa = ~~'" + as_qa + "~~'"   &
			 + " and coilmst.loc_no = ~~'" + as_loc + "~~'"

ls_clause = "DataWindow.Table.Select='"  + ls_select + ls_where + "'"
ldwc_lot.modify(ls_clause)
if ldwc_lot.retrieve() > 0 then
	ldwc_lot.SetSort("unit_qty , coil_no")
	ldwc_lot.Sort( )
end if

return
end subroutine

public subroutine wf_sheetdddw (string as_item, string as_qa, string as_loc);string  ls_where, ls_clause, ls_select
datawindowchild ldwc_lot

dw_2.Modify("coil_no.dddw.Name='d_cdsheet_c'")
dw_2.Modify("coil_no.dddw.allowedit=no")

dw_2.Modify("coil_no.dddw.displayColumn='sheet_no'")
dw_2.Modify("coil_no.dddw.DataColumn='sheet_no'")
dw_2.Modify("coil_no.dddw.percentwidth='480'")
dw_2.Modify("coil_no.dddw.vscrollbar=yes")

dw_2.getchild('coil_no',ldwc_lot)
ldwc_lot.settransobject(sqlca)
ls_select = ldwc_lot.Describe("DataWindow.Table.Select")

ls_where = " and item_no = ~~'" + as_item + "~~'"   &
			 + " and qa like ~~'" + as_qa + "~~'" &
			 + " and sheetmst.loc_no = ~~'" + as_loc + "~~'"

//ls_where = ' and item_no = ~~"' + as_item + '~~" '
ls_clause = "DataWindow.Table.Select='"  + ls_select + ls_where + "'"
ldwc_lot.modify(ls_clause)
if ldwc_lot.retrieve() > 0 then
	ldwc_lot.SetSort("qa , sheet_no")
	ldwc_lot.Sort( )
end if
return

end subroutine

public subroutine wf_locno (string arg_docase);//
string  ls_where, ls_itemno, ls_itemqa, ls_sql, ls_select
//datawindowchild ldwc_lot

dw_2.setredraw(false)
if arg_docase <> 'C' then
	if dw_2.Describe("loc_no.dddw.name") <> 'd_oicustlocno_s' then
		dw_2.Modify("loc_no.dddw.Name='d_oicustlocno_s'")
		dw_2.Modify("loc_no.dddw.allowedit=no")
		dw_2.Modify("loc_no.dddw.percentwidth='350'")
		dw_2.Modify("loc_no.dddw.lines='10'")
		dw_2.Modify("loc_no.dddw.displayColumn='location_loc_name'")
		dw_2.Modify("loc_no.dddw.DataColumn='itemloc_loc_no'")
		dw_2.Modify("loc_no.dddw.vscrollbar=no")
		dw_2.Modify("loc_no.dddw.AutoRetrieve=no") 
	
		dw_2.getchild("loc_no", idwc_locno)
		idwc_locno.setredraw(false)
		idwc_locno.insertrow(1)
		idwc_locno.settransobject(sqlca)
		idwc_locno.setredraw(true)
		is_locnosql = idwc_locno.describe("datawindow.table.select")
	else
		dw_2.getchild("loc_no", idwc_locno)
	end if
else
	if dw_2.Describe("loc_no.dddw.name") <> 'd_cdlocation_c' then
		dw_2.Modify("loc_no.dddw.Name='d_cdlocation_c'")
		dw_2.Modify("loc_no.dddw.allowedit=no")
		dw_2.Modify("loc_no.dddw.percentwidth='300'")
		dw_2.Modify("loc_no.dddw.lines='10'")
		dw_2.Modify("loc_no.dddw.displayColumn='loc_name'")
		dw_2.Modify("loc_no.dddw.DataColumn='loc_no'")
		dw_2.Modify("loc_no.dddw.vscrollbar=yes")
		dw_2.Modify("loc_no.dddw.AutoRetrieve=no") 
		dw_2.getchild("loc_no", idwc_locno)
		idwc_locno.setredraw(false)
		idwc_locno.settransobject(sqlca)
		idwc_locno.retrieve()
		idwc_locno.setredraw(true)
	else
		dw_2.getchild("loc_no", idwc_locno)
	end if
	idwc_locno.SetSort("loc_name")
	idwc_locno.Sort( )
end if

dw_2.accepttext()
dw_2.setredraw(true)
return


/* d_oicustlocno_s
  SELECT itemloc.qoh         
       , location.loc_name   
       , itemloc.loc_no      
       , location.loc_type  
    FROM (SELECT il.loc_no, il.item_no, il.qa, qoh = SUM(il.qoh) 
            FROM ( 
                 SELECT loc_no = loc_no, item_no = item_no, qa = qa, qoh = qoh 
                   FROM itemloc
                  WHERE qoh > 0
                 ) il
            GROUP BY il.loc_no, il.item_no, il.qa
         ) itemloc   
         INNER JOIN location  ON itemloc.loc_no = location.loc_no 
   WHERE ( itemloc.qoh       > 0   ) 
     AND ( location.loc_type = 'N' ) 
*/
/* d_cdlocation_c
  SELECT location.loc_no,   
         location.loc_name,   
         location.position,   
         location.tel_no,   
         location.loc_manager,   
         location.loc_type,   
         location.rem,   
         location.use_yn  
    FROM location   
*/

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// d_oi_do_m_test_prt11    WIDTH = 4713
// d_oi_do_m_test_prt22    WIDTH = 4713
// d_oi_do_m_test_prt33    WIDTH = 4713
// d_oi_do_m_test_prt44    WIDTH = 4713

//////////////////////////////////////////////////////////////////////////////
string ls_margin, ls_values[], ls_left, ls_top

SELECT BIGO INTO :ls_margin FROM CODEMST WHERE ITEM_CD = :gs_team AND TYPE = '거래명세_출력여백';
if isnull(ls_margin) OR ls_margin = "" then
	ls_margin = "115,15"
end if
GF_Split(ls_margin, ",", ls_values)

ls_left  = ProfileString("YCSC.INI","Database","LEFT", " ")
ls_top   = ProfileString("YCSC.INI","Database","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = ls_values[1]
if isnull(ls_top)  OR ls_top  = "" then ls_top  = ls_values[2]

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////

string  ls_loc

dw_source.settransobject(sqlca)
dw_source.visible = false
is_sno = ""
is_sh  = ""
is_nm  = ""
is_js  = ""

dw_3.settransobject(sqlca)
//dw_dodet_m.settransobject(sqlca)
dw_inaudit.settransobject(sqlca)
dw_dodet.settransobject(sqlca)

dw_3.getchild("scene_code", idwc_scene)
idwc_scene.insertrow(1)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_1.getchild("driver", idwc_car)

dw_3.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)
dw_3.insertrow(0)

if gs_area = 'B0001'then
	em_3.text = "BD" + string(today(), "yyyymmdd") + "001"
elseif gs_area = 'T0001'then
	em_3.text = "TD" + string(today(), "yyyymmdd") + "001"
else
	em_3.text = "HD" + string(today(), "yyyymmdd") + "001"
end if
is_custscenesql = dw_2.describe("datawindow.table.select")

//dw_dodet_m.visible = false
dw_inaudit.visible = false		// 수불부
dw_5.visible       = false
dw_dodet.visible   = false
dw_8.visible       = false

/////////////////////////////////////////////////
// 거래명세서 작성권한 
/////////////////////////////////////////////////
// 2012/09/01 현재 관리자만 권한 존재함 
if GF_PERMISSION('거래명세서_미수불작성', gs_userid) = 'Y' then	
	dw_1.object.do_case.tabsequence = 150
	dw_1.object.do_case.visible = 1
else
	dw_1.object.do_case.tabsequence = 0
	dw_1.object.do_case.visible = 0
end if

if GF_PERMISSION('거래명세서_기본공급자', gs_userid) = 'Y' then
	SELECT bigo INTO :ls_loc FROM codemst WHERE type = '거래명세서_기본공급자' AND item_cd = :gs_userid;
	if ls_loc  =  'S' or ls_loc  =  'D' or ls_loc  =  'H' or ls_loc  =  'B' then
		cbx_source.Checked  =  TRUE
		cbx_source.triggerevent(clicked!)
	else
		cbx_source.Checked  =  FALSE
	end if
end if

if GF_PERMISSION("거래명세서_작성부서", gs_userid ) = "Y" or gs_userid = "1999010s" then
else
   pb_save.enabled = false  // 저장기능 삭제
end if

if GF_PERMISSION('거래명세서_30일체크', gs_userid) = 'Y' then	
	cbx_temp.enabled = true
else
	cbx_temp.enabled = false
end if
/////////////////////////////////////////////////

em_3.SelectText(9, 6)
em_3.setfocus()

//테스트
dw_2.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)
idwc_locno.retrieve()

//dw_2.getchild("loc_no", idwc_locno)
//idwc_locno.insertrow(1)
//idwc_locno.settransobject(sqlca)
//is_locnosql = idwc_locno.describe("datawindow.table.select")

end event

on w_oido_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_inaudit=create dw_inaudit
this.dw_dodet=create dw_dodet
this.dw_8=create dw_8
this.dw_5=create dw_5
this.em_3=create em_3
this.st_2=create st_2
this.st_4=create st_4
this.cbx_10=create cbx_10
this.cbx_source=create cbx_source
this.dw_source=create dw_source
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.rb_a4=create rb_a4
this.rb_a5=create rb_a5
this.cbx_temp=create cbx_temp
this.gb_8=create gb_8
this.st_1=create st_1
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.st_3=create st_3
this.st_5=create st_5
this.em_left=create em_left
this.em_top=create em_top
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_inaudit
this.Control[iCurrent+5]=this.dw_dodet
this.Control[iCurrent+6]=this.dw_8
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.em_3
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.cbx_10
this.Control[iCurrent+12]=this.cbx_source
this.Control[iCurrent+13]=this.dw_source
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.cbx_2
this.Control[iCurrent+16]=this.rb_a4
this.Control[iCurrent+17]=this.rb_a5
this.Control[iCurrent+18]=this.cbx_temp
this.Control[iCurrent+19]=this.gb_8
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.cbx_3
this.Control[iCurrent+22]=this.cbx_4
this.Control[iCurrent+23]=this.st_3
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.em_left
this.Control[iCurrent+26]=this.em_top
end on

on w_oido_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_inaudit)
destroy(this.dw_dodet)
destroy(this.dw_8)
destroy(this.dw_5)
destroy(this.em_3)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.cbx_10)
destroy(this.cbx_source)
destroy(this.dw_source)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.rb_a4)
destroy(this.rb_a5)
destroy(this.cbx_temp)
destroy(this.gb_8)
destroy(this.st_1)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.em_left)
destroy(this.em_top)
end on

event resize;call super::resize;//
dw_2.width  = this.width  - 97
dw_2.height = this.height - 1092
end event

type pb_save from w_inheritance`pb_save within w_oido_m
event gi_print pbm_uonexternal01
integer x = 4242
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::gi_print;//
string old_dwnm

old_dwnm = dw_8.dataobject

PrintSetup()
//PrintSetupPrinter()
//=============================================//
//OpenWithParm(w_pop_print, dw_8)
//IF Message.DoubleParm <> 1 THEN RETURN
//=============================================//
if MessageBox("확인","선택된 출고번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"한번출력을 시키면 시간이 많이걸립니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	return
end if

if cbx_1.checked = true then	// 1장
	dw_8.dataobject = 'd_oigiving_r_21'		// 거래명세서(단가)
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
end if

if cbx_2.checked = true then
	dw_8.dataobject = 'd_oigiving_r_22'		// 인수증
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
	
	dw_8.dataobject = 'd_oigiving_r_23'		// 출고증
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
	
	dw_8.dataobject = 'd_oigiving_r_24'		// 납품증
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
end if

dw_8.dataobject = old_dwnm

end event

event pb_save::clicked;//
string   ls_chk,  ls_do_no, ls_do_no1,  ls_sale_flag, ls_do_date,   ls_seq,     ls_null
string   ls_item, ls_qa,    ls_qa_cust, ls_loc,       ls_old_time,  ls_cust_no, ls_month, ls_area,  ls_sale
string   ls_lot,  ls_oc,    ls_case,   ls_do_dr_hp
int      li_int,  li_seq,   ll_row,    ll_int,       li_count,     li_saleseq
long     ll_year, ll_inauditrow,       ll_coilcnt,   ll_cnt
dec      ld_qoh,  ld_do_amount,        ld_rcpt,      ld_order_qty, ld_issue_qty
datetime ldt_today
boolean  lb_chk

dw_1.accepttext()
dw_2.accepttext()

dw_dodet.reset()		// 출고
dw_inaudit.reset()	// 재고

//dw_dodet_m.accepttext()
dw_inaudit.accepttext()
dw_dodet.accepttext()
dw_source.AcceptText()

setnull(ls_null)
ls_chk = 'N'

string ls_sale_control, ls_cust_chk, ls_spot_code

ls_spot_code = dw_1.object.spot_code[dw_1.getrow()]
if isnull(ls_spot_code) or ls_spot_code = "" then // 출고현장
	MessageBox("저장오류","출고현장은 반드시 선택하시기 바랍니다.",stopsign!)
	return
end if

ls_cust_chk = dw_1.object.cust_no[dw_1.getrow()]
SELECT isnull(sale_control,'N') INTO :ls_sale_control FROM customer WHERE cust_no = :ls_cust_chk;
if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
	MessageBox("저장오류","매출통제 대상 거래처입니다. ~r~n~n" + "영업지원팀에 문의 바랍니다.!",stopsign!)
	return
end if

//////////////////////////////////
// 출고일자 CHECK(금일부터 30일)
//////////////////////////////////
DateTime ld_date,   ld_gftoday
Int      li_today

ld_date    = dw_1.object.do_date[1]
ld_gftoday = GF_TODAY()
if ld_date <> ld_gftoday then
	li_today = DaysAfter(date(ld_gftoday), date(ld_date))
	if li_today <  0 then li_today = li_today * -1  // 반품인가?
	if li_today < 31 then 
		// 출고일자 정상처리 : 금일부터 30일 이내 수정가능 
	else
		MessageBox("경고", "출고일자는 금일(" + LeftA(String(ld_gftoday),10) + ") 부터 30일(이전, 이후) 까지만 처리가능 합니다.")  
		dw_1.setcolumn('do_date')
		dw_1.setfocus()
		if cbx_temp.checked = true then	// 거래일CHECK(30일)
			RETURN
		else
			MessageBox("경고", "거래명세서 출력(비정상) 후에는 반드시 삭제해야 합니다.")  
			//	INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date, ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code)
			//	VALUES (convert(datetime, convert(varchar(10), getdate(), 112)), :li_seqno, :gs_userid, :is_f_do_no, :is_f_do_user_id, :is_f_do_area_no, :is_f_do_case, :id_f_do_date, :id_f_issue_date, :idc_f_ship_amount, :idc_f_do_cash, :idc_f_do_rate, :idc_f_do_total, null, :is_cust_no, :is_spot_code);
			//	COMMIT;
		end if
	end if
end if
//////////////////////////////////

//////////////////////////////////
// 부담사유 CHECK
//////////////////////////////////
string ls_shipflag, ls_budam_desc
ls_shipflag    = dw_1.object.ship_flag[1]
ls_budam_desc  = dw_1.object.budam_desc[1]
if ls_shipflag = 'B' and ( ls_budam_desc = 'BD000' or  isnull(ls_budam_desc) or  trim(ls_budam_desc) = '') then
	MessageBox("경고", "운송방법이 부담인 경우는 반드시 부담사유를 선택해주세요.",stopsign!,ok!)
	return
end if
//////////////////////////////////

//////////////////////////////////
// [착불]과 이름/화물 CHECK
//////////////////////////////////
if dw_1.object.ship_flag[1] = "C" and dw_1.object.rem[1] = "[착불]" then // 착불	
	MessageBox("경고", "착불인 경우 '이름/화물'를 선택(입력)하시기 바랍니다.",stopsign!,ok!)
	return
end if
//////////////////////////////////

//////////////////////////////////
// 출고지 다중검사
//////////////////////////////////
string ls_shipaddr
long   ll_addrchk
ls_shipaddr = ""
for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_cnt] = 'Y'  then
		ls_shipaddr = dw_2.object.shipto_addr[ll_cnt]
		exit
	end if
next

ll_addrchk = 0
for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_cnt] = 'Y'  then
		if ls_shipaddr = dw_2.object.shipto_addr[ll_cnt] then
		else
			ll_addrchk = ll_addrchk + 1
		end if
	end if
next
if ll_addrchk > 0 then // 출고지 다중인 경우
	if MessageBox("경고", "운송처 주소가 한곳 이상입니다. 현재 운송처로 출하시에는 '확인'를 선택하시기 바랍니다.",question!,okcancel!,2) = 2 then 
      dw_1.setcolumn("shipto_addr")
		dw_1.setfocus()
		return
	end if
end if
//////////////////////////////////


//////////////////////////////////
// 출고항목들 선택 검사
//////////////////////////////////
for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_cnt] = "Y"  then
		if (Not isnull(dw_2.object.loc_no[ll_cnt])) AND trim(dw_2.object.loc_no[ll_cnt]) <> "" then
			string ls_coils
			ls_coils = MidA(dw_2.object.item_no[ll_cnt], 4, 1)
			
			if dw_2.object.issue_qty[ll_cnt] > 0 THEN
				if ls_case <> "C" and ( ls_coils = "1" or ls_coils = "2" ) &
					and (isnull(dw_2.object.coil_no[ll_cnt])      &
						 or trim(dw_2.object.coil_no[ll_cnt]) = "" &
						 or dw_2.object.cnt[ll_cnt]           < 1 ) then
					MessageBox("LOT번호 오류", STRING(ll_cnt,'000') + " 번째줄의 해당로트번호 또는 갯수를 확인하십시요")
					dw_2.scrolltorow(ll_cnt)
					dw_2.setcolumn('coil_no')
					dw_2.setfocus()
					RETURN 						
				end if
				ls_chk = 'Y'
			else
				MessageBox("확인","출고수량을 확인하십시요.!",exclamation!)
				dw_2.scrolltorow(ll_cnt)
				dw_2.setcolumn('issue_qty')
				dw_2.setfocus()
				return 
			end if
		else
			MessageBox("확인","저장소를 확인하십시요.!",exclamation!)
			dw_2.scrolltorow(ll_cnt)
			dw_2.setcolumn('loc_no')
			dw_2.setfocus()
			return 
		end if
	end if
next
if ls_chk <> 'Y' then
	MessageBox("확인","선택된 물품이 없습니다!",exclamation!)
	return
end if
//////////////////////////////////

if isnull(dw_1.object.do_car_gbn[1]) or trim(dw_1.object.do_car_gbn[1]) = "" then
	MessageBox("확인","출하 차량구분이 입력되지 않았습니다.!",exclamation!)
	dw_1.setcolumn('do_car_gbn')
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.do_dr_hp[1]) or trim(dw_1.object.do_dr_hp[1]) = "" then
	MessageBox("확인","운전자 연락처(HP)가 입력되지 않았습니다.!",exclamation!)
	dw_1.setcolumn('do_dr_hp')
	dw_1.setfocus()
	return
end if

//////////////////////////////////
// 부가세는 공급가액의 10% 검사
//////////////////////////////////
if dw_1.object.calc_chk[1] = 'Y' then
//	if ( (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) - 1) > dw_1.object.do_rate[1] &
//	  or (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) + 1) < dw_1.object.do_rate[1]) then
//		MessageBox("경고", "부가세가 출고금액의 10%의 (±1원) 범위를 벗어 날수 없습니다.")
//		return
//	end if
	if ( (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) - 1) > dw_1.object.do_rate[1] &
	  or (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) + 1) < dw_1.object.do_rate[1]) &
	  and not( dw_2.object.compute_4[1] = 0 and dw_1.object.do_rate[1] = 0) then
		MessageBox("경고", "부가세는 공급가액의 10%의 (±1원) 이내 입니다. 확인 바랍니다.")
		return
	end if		
else
	wf_calc()
end if
//////////////////////////////////

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
ls_do_dr_hp = dw_1.object.do_dr_hp[1]

/////////////////////////////
// 출고번호 부여
/////////////////////////////
ls_area      = LeftA(gs_area, 1)							// 사업장
ls_case      = dw_1.object.do_case[1]					// 미수불
ls_sale_flag = dw_3.getitemstring(1, "sale_flag")	// 수주유형

if trim(dw_1.object.do_no[1]) = "" OR isnull(dw_1.object.do_no[1]) then
	ls_do_date = string(dw_1.object.do_date[1], "yyyymmdd")
	ls_do_no1  = ls_area + ls_sale_flag + ls_do_date + "-" + "%"
	
	SELECT max(do_no) INTO :ls_do_no  FROM do WHERE do_no LIKE :ls_do_no1;		
	if isnull(ls_do_no) or ls_do_no = "" then
		ls_do_no1 = ls_area + ls_sale_flag + ls_do_date + "-" + "001"
	else
		li_seq = integer(MidA(ls_do_no, 12, 3))
		li_seq = li_seq + 1
		ls_seq = "00" + string(li_seq)
		ls_do_no1 = LeftA(ls_do_no1, 11) + RightA(ls_seq, 3)
	end if
else
	setnull(ls_do_no)
	ls_do_no1 = dw_1.object.do_no[1]		
	
	SELECT do_no INTO :ls_do_no  FROM do WHERE do_no = :ls_do_no1;		
	if trim(ls_do_no) = "" OR isnull(ls_do_no) then
	else
		MessageBox("저장","거래명세서 번호가 이미 존재합니다.", exclamation!)
		return
	end if
end if
/////////////////////////////

dw_1.object.do_no[1]         = ls_do_no1
dw_1.object.sale_flag[1]     = ls_sale_flag
dw_1.object.do_ship_date[1]  = dw_1.object.do_date[1]
dw_1.object.do_issue_date[1] = dw_1.object.do_date[1]
ll_row      = 0
li_seq      = 0
ls_old_time = string(now(),'hh:mm:ss:fff')	

/////////////////////////////
// 출고품목 
/////////////////////////////
for ll_int = 1 to dw_2.rowcount()
	ls_loc = dw_2.object.loc_no[ll_int]
	if dw_2.object.source[ll_int] = "N" then continue
	
	if dw_2.object.source[ll_int] = "Y" and (not isnull(ls_loc)) and trim(ls_loc) <> "" and &
	   dw_2.object.issue_qty[ll_int] > 0 then
	else
		continue
	end if
	
	// 출고상세저장
	ll_row       = ll_row + 1
	ls_sale      = dw_2.object.order_no[ll_int]
	li_saleseq   = dw_2.object.seq_no[ll_int]
	ld_order_qty = dw_2.object.order_qty[ll_int]
	ld_issue_qty = dw_2.object.issue_qty[ll_int]

debugbreak()
	// 기출고수량
	SELECT isnull(rlse_qty,0) INTO :ld_rcpt FROM saledet WHERE order_no = :ls_sale AND seq_no = :li_saleseq;
	if ld_order_qty < ld_rcpt + ld_issue_qty then
		rollback;
		MessageBox("오류","재조회하여 작업하십시요!",exclamation!)
		return
	end if

   // 미수불(C)
	if ls_case = 'C' then
   else
		ls_item = dw_2.object.item_no[ll_int]
		ls_qa   = dw_2.object.qa[ll_int]
		ld_qoh  = 0
		SELECT isnull( sum( qoh), 0) INTO :ld_qoh FROM itemloc
		 WHERE itemloc.item_no = :ls_item AND itemloc.qa = :ls_qa AND itemloc.loc_no = :ls_loc;		  
		if ld_issue_qty > ld_qoh then
			dw_2.object.issue_qty[ll_int] = 0
			
			dw_2.accepttext()
			dw_2.scrolltorow(ll_int)

			dw_2.setcolumn('issue_qty')
			dw_2.setfocus()
			MessageBox("확인", "출고수량이 저장소 수량보다 클수 없습니다.")
			
			dw_2.setredraw(true)
			RETURN
		end if
	end if
		
	ls_lot = dw_2.object.coil_no[ll_int]
	dw_dodet.object.do_no[ll_row]     = ls_do_no1
	dw_dodet.object.oi_no[ll_row]     = ll_row
	dw_dodet.object.seq_no[ll_row]    = dw_2.object.seq_no[ll_int]
	dw_dodet.object.item_no[ll_row]   = dw_2.object.item_no[ll_int]
	dw_dodet.object.qa[ll_row]        = dw_2.object.qa[ll_int]
	dw_dodet.object.qa_cust[ll_row]   = dw_2.object.qa_cust[ll_int]		// 규격(송장)
	dw_dodet.object.ship_qty[ll_row]  = dw_2.object.issue_qty[ll_int]
	dw_dodet.object.price[ll_row]     = dw_2.object.price[ll_int]
	dw_dodet.object.aroi_qty[ll_row]  = 0
	dw_dodet.object.c_acc_aty[ll_row] = dw_2.object.rlse_acc_qty[ll_int]
	dw_dodet.object.uom[ll_row]       = dw_2.object.uom[ll_int]
	dw_dodet.object.sale_no[ll_row]   = dw_2.object.order_no[ll_int]
	dw_dodet.object.rate_cash[ll_row] = dw_2.object.rlse_rate[ll_int]
	dw_dodet.object.rem[ll_row]       = dw_2.object.rem[ll_int]
	dw_dodet.object.do_rem[ll_row]    = dw_2.object.saledet_do_rem[ll_int]
	dw_dodet.object.stock_qty[ll_row] = dw_2.object.stock_issue[ll_int]
	
	if trim(ls_lot) = "" then setnull(ls_lot)
	dw_dodet.object.coil_no[ll_row]   = ls_lot
	dw_dodet.object.loc_no[ll_row]    = ls_loc
	dw_dodet.object.cnt[ll_row]       = dw_2.object.cnt[ll_int]

	// 미수불(C)
	if ls_case = 'C' then 	
   else
		// 대체내역 저장
		is_old_time = string(now(),'hh:mm:ss:fff')	
	//	if wf_itemalter(ls_sale, dw_2.object.seq_no[ll_int], ll_int, ll_row) = true then
	//	else
	//		rollback;
	//		messagebox("저장","대체내역저장도중 오류가 발생하였습니다!",exclamation!)
	//		return
	//	end if		

		// 재고 KEY Index 생성(2012/09/01 현재 KEY값 중복됨 FORMAT 변경 'hh:mm:ss:fff')
		for li_count = 1 to 100000
			if ls_old_time <> string(now(),'hh:mm:ss:fff') then
				ls_old_time  = string(now(),'hh:mm:ss:fff')	
				exit
			end if	
		next

		ll_inauditrow = dw_inaudit.insertrow(0)

		dw_inaudit.object.inaudit_time[ll_inauditrow] = gf_today()		             // yyyy/mm/dd hh:mm:ss:fff 2012-09-05 16:37:15.513
		dw_inaudit.object.inaudit_date[ll_inauditrow] = dw_1.object.do_date[1]      // 2012-09-05 00:00:00
		dw_inaudit.object.inaudit_item[ll_inauditrow] = dw_2.object.item_no[ll_int] // PZZSSANZZZ
		dw_inaudit.object.qa[ll_inauditrow]           = dw_2.object.qa[ll_int]      // 160X7000X0050X00150 
		dw_inaudit.object.loc_no[ll_inauditrow]       = ls_loc                      // WS00000000
		dw_inaudit.object.inaudit_type[ll_inauditrow] = "IS"	                      // 제품출고
		
		dw_inaudit.object.order_no[ll_inauditrow]     = ls_do_no1
		dw_inaudit.object.rcpt_qty[ll_inauditrow]     = 0
		dw_inaudit.object.issue_qty[ll_inauditrow]    = dw_2.object.issue_qty[ll_int]
		dw_inaudit.object.cost[ll_inauditrow]         = dw_2.object.price[ll_int]
		dw_inaudit.object.destination[ll_inauditrow]  = dw_1.object.cust_no[1]
		dw_inaudit.object.rem[ll_inauditrow]          = dw_2.object.rem[ll_int]
		dw_inaudit.object.serial_id[ll_inauditrow]    = ls_lot
		dw_inaudit.object.unit_qty[ll_inauditrow]     = dw_2.object.unit_qty[ll_int]
		dw_inaudit.object.com_qty[ll_inauditrow]      = dw_2.object.cnt[ll_int]
		dw_inaudit.object.cnt[ll_inauditrow]          = ll_row		
		dw_inaudit.object.user_id[ll_inauditrow]      = gs_userid		

		ll_coilcnt = dw_2.object.cnt[ll_int]
		
		// 추가 coil판매와 sheet판매시의 coilmst와 sheetmst 의 open_close = 'C' - 2001/5/4이인호 
		if dw_2.object.cnt[ll_int] < dw_2.object.qcnt[ll_int] then
			ls_oc = 'O'
		else
			ls_oc = 'C'
		end if
		
		// COILMST, SHEETMST 수정
		if MidA(dw_2.object.item_no[ll_int], 4, 1) = "1" then  	//coil
			UPDATE coilmst 
			   SET qcnt = qcnt - :ll_coilcnt, open_close = :ls_oc
			 WHERE coil_no = :ls_lot AND loc_no = :ls_loc;
			if sqlca.sqlcode < 0 then
				rollback;
				MessageBox("저장","coilmst UPDATE중 오류가 발생하였습니다!",exclamation!)
				return
			end if		
		elseif MidA(dw_2.object.item_no[ll_int], 4, 1) = "2" then  //sheet
			UPDATE sheetmst
			   SET qcnt = qcnt - :ll_coilcnt, open_close = :ls_oc
			 WHERE sheet_no = :ls_lot AND loc_no = :ls_loc;
			if sqlca.sqlcode < 0 then
				rollback;
				MessageBox("저장","sheetmst UPDATE중 오류가 발생하였습니다!",exclamation!)
				return
			end if		
		end if
	end if
next


////////////////////////////////////////////////////////////////////////////
// 저장 : wf_update3(dw_1, dw_dodet, dw_inaudit, "N")
// 포맷 : dw_inaudit.object.inaudit_time FORMAT "yyyy/mm/dd hh:mm:ss:fff"
////////////////////////////////////////////////////////////////////////////
dw_1.accepttext()
dw_2.accepttext()
dw_dodet.accepttext()

if ls_case = "C" then		// 미수불(C)
	lb_chk = wf_update2(dw_1, dw_dodet, "N")
else
	dw_inaudit.accepttext()	
   lb_chk = wf_update3(dw_1, dw_dodet, dw_inaudit, "N")
end if
//
if lb_chk then
	if MessageBox("확인", "생성된 출고번호는 " + ls_do_no1 + " 입니다.~r~n" + &
                 "거래명세서를 출력 하시겠습니까?", Question!, OKCancel!, 1) = 1 then
		string ls_c_chk
		if cbx_source.checked = true then
			ls_c_chk = "Y"
			// 공급자 변경 체크시 필수 선택하도록 수정
			if is_sno = '' or IsNull(is_sno) or is_sh = "" or IsNull(is_sh) or is_nm = "" or IsNull(is_nm) then
				Messagebox("확인","공급자 변경 체크시 반드시 사업장을 선택하셔야 합니다.")
				Return
			end if				
		else
			ls_c_chk = "N"
		end if

		string ls_left, ls_top
		
		ls_left = em_left.text
		ls_top  = em_top.text
		SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
		SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)
				  
		PrintSetup()
		//PrintSetupPrinter()
		//=============================================//
		//OpenWithParm(w_pop_print, dw_8)
		//IF Message.DoubleParm <> 1 THEN RETURN
		//=============================================//

		string old_dwnm
		old_dwnm = dw_8.dataobject
		
		if cbx_1.checked = true then							// 명세서
			if rb_A4.checked = true then
				dw_8.dataobject = 'd_oigiving_r_21'			
				dw_8.Modify('DataWindow.Print.Paper.Size  = 9')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			else
				dw_8.dataobject = 'd_oigiving_r_21_a5'		
				dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			end if
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
		if cbx_2.checked = true then							// 인수증
			if rb_A4.checked = true then
				dw_8.dataobject = 'd_oigiving_r_22'
				dw_8.Modify('DataWindow.Print.Paper.Size  = 9')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			else
				dw_8.dataobject = 'd_oigiving_r_22_a5'		
				dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			end if
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
		if cbx_3.checked = true then							// 출고증
			if rb_A4.checked = true then
				dw_8.dataobject = 'd_oigiving_r_23'
				dw_8.Modify('DataWindow.Print.Paper.Size = 9')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			else
				dw_8.dataobject = 'd_oigiving_r_23_a5'		
				dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			end if
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
		if cbx_4.checked = true then							// 납품증
			if rb_A4.checked = true then
				dw_8.dataobject = 'd_oigiving_r_24'
				dw_8.Modify('DataWindow.Print.Paper.Size = 9')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			else
				dw_8.dataobject = 'd_oigiving_r_24_a5'		
				dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
				dw_8.modify("DataWindow.print.margin.left = " + ls_left )
				dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
				dw_8.Modify('DataWindow.Print.Orientation = 1')
			end if
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
		dw_8.dataobject = old_dwnm

		
		string ls_search_do_no
		ls_search_do_no = trim(dw_1.object.do_no[1])
		UPDATE do
		   SET prt_date = getdate()
	 	 WHERE do_no = :ls_search_do_no AND prt_date is null;		
		if sqlca.sqlcode = 0 then
			commit;
		else
			rollback;
			messagebox("확인", "출력일시가 정상적으로 저장되지 않았습니다.")
		end if
	END IF
	
	pb_cancel.enabled   = FALSE
	pb_save.enabled     = FALSE
	pb_retrieve.enabled = TRUE
	dw_1.enabled = FALSE
	dw_2.enabled = FALSE
	dw_3.enabled = TRUE
	
	dw_1.reset()
	dw_2.reset()
	
	////////////////////////////
	// SMS 단문전송
	////////////////////////////
	string ls_s_sms_yn, ls_s_area_no, ls_s_tel
	SELECT isnull(sms_yn,'N'), area_no INTO :ls_s_sms_yn, :ls_s_area_no
	  FROM do
	 WHERE do_no = :ls_do_no1;
	
	choose case ls_s_area_no
		case 'H0001'
			ls_s_tel = 'chulha_t_h'
		case 'S0001', 'B0001'
			ls_s_tel = 'chulha_t_s'
		case 'T0001'
			ls_s_tel = 'chulha_t_t'
		case 'Z0001'
			ls_s_tel = 'chulha_t_z'
		case else
			ls_s_tel = 'chulha_t_0'
	end choose

	if ls_s_sms_yn = 'Y' then
		String ls_car_text
		DataWindowChild dwc1

		dw_1.GetChild('do_car_gbn', dwc1)
		ls_car_text = dwc1.getitemstring(dwc1.getrow(),'item_nm')

		string ls_s_cust_name, ls_s_scene_desc, ls_s_do_date
		string ls_s_hp_no,     ls_s_scene_tel,  ls_s_cust_tel, ls_s_msg, ls_s_stel

		// 거래처 현장 desc
		SELECT top 1 b.cust_name, c.scene_desc, convert(varchar(10), a.do_date, 111),
				 replace(substring(ltrim(rtrim(isnull(d.hp_no,''))),1,13), '-', ''),
				 replace(substring(ltrim(rtrim(isnull(c.scene_tel,''))),1,13), '-', ''),
				 replace(substring(ltrim(rtrim(isnull(b.buyer1_hp,''))),1,13), '-', '')
		  INTO :ls_s_cust_name, :ls_s_scene_desc, :ls_s_do_date, :ls_s_hp_no, :ls_s_scene_tel, :ls_s_cust_tel
		  FROM do a with(nolock) inner join customer b with(nolock) on a.cust_no     = b.cust_no
			  							  inner join scene c with(nolock) on a.cust_no = c.cust_no and a.spot_code   = c.scene_code
			  							  left outer join salehp d with(nolock) on b.salesman = d.user_id										  
		 WHERE a.do_no       = :ls_do_no1;
			
      ls_s_cust_name = gf_hangle_tr(ls_s_cust_name,24)
		ls_s_msg = '[송천]차주:' + ls_do_dr_hp + ',' + ls_car_text + ',' + ls_s_cust_name + ',' + ls_s_scene_desc		
      ls_s_msg = gf_hangle_tr(ls_s_msg,80)
		
		SELECT top 1 replace(substring(ltrim(rtrim(isnull(d.hp_no,''))),1,13), '-', '') 
		  INTO :ls_s_stel
		  FROM salehp d
		 WHERE user_id = :ls_s_tel;
		
		choose case LeftA(ls_s_hp_no,3)
			case '010','011','016','017','018','019'
			case else
				ls_s_hp_no = ''
		end choose
		choose case LeftA(ls_s_scene_tel,3)
			case '010','011','016','017','018','019'
			case else
				ls_s_scene_tel = ''
		end choose
		choose case LeftA(ls_s_cust_tel,3)
			case '010','011','016','017','018','019'
			case else
				ls_s_cust_tel = ''
		end choose

		//=====================================
		// GW SMS Profile 
		//=====================================
		string TRAN_PHONE, TRAN_CALLBACK, TRAN_STATUS, TRAN_MSG
		string SMSSERVER

		SELECT ITEM_NM INTO :SMSSERVER FROM CODEMST WHERE ITEM_CD = 'SMSSERVER' AND USE_YN = 'Y';
		IF SMSSERVER = "" THEN SMSSERVER = "192.168.1.5"
		
		// 영업사원
		if ls_s_hp_no = '' or isnull(ls_s_hp_no) then
		else
			choose case SMSSERVER
				case '192.168.1.5'
					INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG)
					VALUES ( GetDate(), '0', '00', :ls_s_hp_no, :ls_s_stel, :ls_s_msg );				// 출고지

				case else
			end choose
		end if

		// 현장담당
		if ls_s_scene_tel = '' or isnull(ls_s_scene_tel) then
		else
			choose case SMSSERVER
				case '192.168.1.5'
					INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG)
					VALUES ( GetDate(), '0', '00', :ls_s_scene_tel, :ls_do_dr_hp, :ls_s_msg );		// 차주

				case else
			end choose
		end if

		// 구매담당
		if ls_s_cust_tel = '' or isnull(ls_s_cust_tel) or LeftA(ls_s_cust_tel,1) <> '0' then
		else
			choose case SMSSERVER
				case '192.168.1.5'
					INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG)
					VALUES ( GetDate(), '0', '00', :ls_s_cust_tel, :ls_s_stel, :ls_s_msg );			// 출고지

//				case 'www.yoo-chang.co.kr', '218.159.85.109'
//					If SQLCA1.SQLCode = 0 Then 
//						TRAN_PHONE    = ls_s_cust_tel
//						TRAN_MSG      = ls_s_msg
//
//						INSERT INTO EM_TRAN ( TRAN_PHONE, TRAN_CALLBACK, TRAN_STATUS, TRAN_DATE, TRAN_MSG, TRAN_ETC3 )
//				  		VALUES ( :TRAN_PHONE, :TRAN_CALLBACK, :TRAN_STATUS, GETDATE(), :TRAN_MSG, :LS_S_HP_NO) USING SQLCA1;			  
//					END IF
				case else
			end choose
		end if

//		//GW SMS=====================================
//		choose case SMSSERVER
//			case 'www.yoo-chang.co.kr', '218.159.85.109'
//				If SQLCA1.SQLCode = 0 Then 
//					COMMIT USING SQLCA1; 
//					//MessageBox( "MS-SQL INFO", "문자전송 성공" ) 
//				Else 
//					 MessageBox("MS-SQL ERROR", "SMS전송 오류.~r~n" + &
//								  "ErrorCode: " + String(SQLCA1.SQLDBCode ) + "~r~n" + &
//								  "ErrorText: " + SQLCA1.SQLErrText, StopSign!, OK!, 1 )
//					 ROLLBACK USING SQLCA1; 
//				End If 
//				DISCONNECT USING SQLCA1;
//
//			case else
//		end choose
//		//GW SMS=====================================

		COMMIT USING SQLCA;
	end if
else	//	lb_chk = wf_update3(dw_1, dw_dodet, dw_inaudit, 'N')
	string ls_dberror

	ROLLBACK;

	ls_dberror = "[DB]출고번호:" + ls_do_no1 + "내용: " + is_dwaudit_syntax
	INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, '1999010s', getdate(), :ls_dberror,'N');	
	COMMIT;

   is_dwdet_syntax   = ""
	is_dwaudit_syntax = ""
	MessageBox("저장2","저장중 오류가 발생 하였습니다!",exclamation!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oido_m
event ue_1 pbm_custom01
event ue_2 ( )
integer x = 18
integer y = 392
integer width = 3703
integer height = 568
integer taborder = 70
boolean enabled = false
string dataobject = "d_oigiving_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::ue_1;int li_int

dw_1.Accepttext()
dw_2.Accepttext()
if dw_1.rowcount() < 1 then return

if dw_1.object.ship_flag[1] = 'D' AND dw_1.object.shipamt_case[1] = 'R' then
	dw_1.object.do_cash[1]   = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]
	if dw_1.object.sale_flag[1] <> 'E' then
		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0)
	end if
end if

dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]


end event

event dw_1::ue_2();// 부가세 계산
wf_calc()

end event

event dw_1::itemchanged;string ls_car,  ls_curr_code, ls_area
string ls_null, ls_loc, ls_where, ls_item, ls_qa, ls_sql, ls_case, ls_dw2locno, ls_drhp, ls_temp
int    li_int
long   ll_row, ll_rowmax, ll_cnt, ll_found
dec    ld_itemloc_qoh, lr_exp_rate
datetime ldt_oi_date

this.Accepttext()
ll_cnt = dw_2.rowcount()
choose case dwo.name
	case 'driver'
		if this.object.ship_flag[1] = "C" then // 착불
			ls_temp = "[착불] "
		else
			ls_temp = ""
		end if
		
		this.object.rem[1] = ls_temp + LeftA(idwc_car.getitemstring(idwc_car.getrow(),'driver') + " " &
								 + idwc_car.getitemstring(idwc_car.getrow(),'name') + " " &
								 + idwc_car.getitemstring(idwc_car.getrow(),'cargo_name'), 43)
//		if isnull(idwc_car.getitemstring(idwc_car.getrow(),'hp')) then
//			ls_car = ''
//		else
//			ls_car = trim(idwc_car.getitemstring(idwc_car.getrow(),'hp')) + " "
//		end if

// 해당수주번호의 운송처주소를 가져오기함
      ll_rowmax = dw_2.rowcount()
		this.object.shipto_addr[1] = ls_car + dw_2.object.shipto_addr[ll_rowmax]

		SELECT docar.hp INTO :ls_drhp FROM docar 
		 WHERE docar.open_close = 'O' AND docar.driver = :data;
		if isnull(ls_drhp) or ls_drhp = "" then
			this.object.do_dr_hp[1] = "00"
		else
			this.object.do_dr_hp[1] = ls_drhp
		end if
	
	case 'do_date'
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date  = this.object.do_date[1]
			ls_curr_code = this.object.curr_code[1]
					
			SELECT exp_rate INTO :lr_exp_rate FROM currency
			 WHERE curr_code = :ls_curr_code	AND curr_date = :ldt_oi_date;				  
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_exp_rate
			end if
		end if
		
	case 'do_chk'
		ls_case = dw_1.object.do_case[1]		// 미수불
		wf_locno(ls_case)
		
		ls_area = dw_1.object.do_area_no[1]
		SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
		setnull(ls_null)
		
		dw_2.setredraw(false)
		if data = 'Y' then
			for ll_row = 1 to ll_cnt
				dw_2.object.source[ll_row] = 'Y'
				if ls_case <> 'C' then
					dw_2.object.loc_no[ll_row] = ls_loc
					ls_item = dw_2.getitemstring(ll_row, "item_no")
					ls_qa   = dw_2.getitemstring(ll_row, "qa")
					ld_itemloc_qoh = 0
					SELECT qoh INTO :ld_itemloc_qoh FROM itemloc
					 WHERE loc_no  = :ls_loc AND item_no = :ls_item	AND qa = :ls_qa;
					if ld_itemloc_qoh > ( dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ) then
						dw_2.setitem(ll_row, "issue_qty", ( dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ))
					else
						if ld_itemloc_qoh <= 0 then
							dw_2.object.loc_no[ll_row]    = ls_loc
							dw_2.object.issue_qty[ll_row] = 0
						else
							dw_2.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
						end if
					end if
				else
//					If gs_area = 'B0001' Then dw_2.object.loc_no[ll_row] = ls_loc
					dw_2.setitem(ll_row, "issue_qty", ( dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ))
				end if
			next
			dw_2.accepttext()
		else
			for ll_row = 1 to ll_cnt
				dw_2.object.source[ll_row]    = 'N'
				dw_2.object.loc_no[ll_row]    = ls_null
				dw_2.object.issue_qty[ll_row] = 0
				ls_item = dw_2.object.item_no[ll_row]
				if MidA(ls_item, 4, 1) = "1" or MidA(ls_item, 4, 1) = "2" then
					wf_cleardddw()
				end if
				dw_2.object.coil_no[ll_row] = ls_null
			next
		end if
		
		dw_2.setredraw(true)
		this.postevent('ue_1')
///////////////////// 밑에

	case 'do_area_no'
		for ll_row = 1 to dw_2.rowcount()
			dw_2.object.loc_no[ll_row] = ls_null
		next

   case 'do_case'		// 미수불
		wf_locno(data)

		if data <> 'C' then
			dw_2.object.flag.visible = 1
			for ll_row = 1 to ll_cnt
				dw_2.object.loc_no[ll_row] = ls_null
			next
		else
			dw_2.object.flag.visible = 0

			for ll_row = 1 to ll_cnt
//				dw_2.object.loc_no[ll_row] = ls_null
				ls_item = dw_2.object.item_no[ll_row]
				dw_2.setitem(ll_row, "issue_qty", ( dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ))
				if MidA(ls_item, 4, 1) = "1" or MidA(ls_item, 4, 1) = "2" then
					wf_cleardddw()
				end if
				dw_2.object.coil_no[ll_row] = ls_null
			next
		end if
		
/////////////////////
	case 'ship_flag'
		if data = 'M' or data = 'H' or data = 'T' or data = 'P' or data = 'Y' then //각 방문, Y:반월은 sort가 null
			this.object.shipamt_case[1] = 'C'	//현금
		end if
		if data = 'D' or data = 'B' then		//부담,대여
			this.object.shipamt_case[1] = 'R'	//외상
		end if		

		if this.object.ship_flag[1] = "C" then // 착불
			this.object.rem[1] = "[착불]"
		else
			this.object.rem[1] = ""
		end if
end choose

if  dwo.name <> 'do_rate' and dwo.name <> 'calc_chk' then
	this.postevent('ue_2')
else
	dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]
end if

end event

event dw_1::losefocus;this.accepttext()
end event

event dw_1::doubleclicked;//
if dwo.name = 'driver' then
	idwc_car.settransobject(sqlca)
	idwc_car.reset()
	idwc_car.retrieve()
end if
end event

event dw_1::getfocus;call super::getfocus;//
pb_compute.default = false
end event

event dw_1::itemerror;call super::itemerror;CHOOSE CASE dwo.name
	CASE 'ship_amount'
		this.object.ship_amount[row] = 0
END CHOOSE

return 1
end event

event dw_1::retrieveend;call super::retrieveend;string ls_sale_control, ls_cust_chk

ls_cust_chk = this.object.cust_no[this.getrow()]
SELECT isnull(sale_control,'N') INTO :ls_sale_control 
  FROM customer
 WHERE cust_no = :ls_cust_chk;
if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
	MessageBox("확인","매출통제 대상 거래처입니다. ~r~n~n" &
							+ "영업지원팀에 문의 바랍니다.!",stopsign!)
	return 1
end if

end event

event dw_1::dberror;call super::dberror;//
is_dw1_syntax = sqlsyntax + "~n~n" + sqlerrtext

end event

type dw_2 from w_inheritance`dw_2 within w_oido_m
event ue_1 pbm_custom01
integer x = 5
integer y = 980
integer width = 4626
integer height = 1800
integer taborder = 80
boolean enabled = false
string dataobject = "d_oidodet_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::ue_1;// 합계금액
wf_calc()

end event

event dw_2::losefocus;//
this.accepttext()

end event

event dw_2::itemchanged;//
string  ls_item, ls_qa, ls_null, ls_loc, ls_source, ls_where, ls_sql, ls_area
string  ls_order
decimal ld_qoh, ld_locqoh, ld_issue_qty, ld_rlse_qty, ld_order_qty, ld_itemloc_qoh
decimal ld_do_stock
integer ll_row, ll_found, li_seq

dw_1.Accepttext()
dw_2.Accepttext()

ll_row    = this.getrow()
ls_item   = this.getitemstring(ll_row, "item_no")
ls_qa     = this.getitemstring(ll_row, "qa")
ls_loc    = this.object.loc_no[ll_row]
ls_source = this.object.source[ll_row]

setnull(ls_null)
choose case dwo.name
	case 'source'	
		wf_locno(dw_1.object.do_case[1])
		
		if data = 'Y' then
			// 출고품목의 현장주소를 보여줌
			dw_1.object.shipto_addr[1] = dw_2.object.shipto_addr[row]		// 운송자HP/운송처주소			

			ls_area = dw_1.object.do_area_no[1]
			SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
			
			if dw_1.object.do_case[1] <> 'C' then
				dw_2.setredraw(false)
				ls_item = dw_2.getitemstring(ll_row, "item_no")
				ls_qa   = dw_2.getitemstring(ll_row, "qa")
								
				if gf_permission('거래명세서작성출고품목정보', gs_userid) = 'Y' then
					ls_where = " AND itemloc.item_no = ~~'" + ls_item + "~~' AND itemloc.qa = ~~'" + ls_qa + "~~'" 
				else
					ls_where = " AND itemloc.item_no  = ~~'" + ls_item + "~~'" &
								+ " AND itemloc.qa       = ~~'" + ls_qa   + "~~'" &
								+ " AND location.area_no = ~~'" + ls_area + "~~'" 
				end if

//				IF gs_userid = "1999010s" or gs_userid = "1999010b" or gs_userid = 'etwas' &
//					or gs_userid = 'plh' or gs_userid = '960626' or gs_userid = 'kga' or gs_userid = "yyl" &
//					or gs_userid = 'kimms' or gs_userid = 'shinjy' or gs_userid = 'sjh4279' &
//					or gs_userid = 'leejh' or gs_userid = 'kimsh' then
//					ls_where = " AND itemloc.item_no = ~~'" + ls_item + "~~' AND itemloc.qa = ~~'" &
//								+ ls_qa  + "~~'" 
//				else
//					ls_where = " AND itemloc.item_no = ~~'" + ls_item  + "~~'" &
//								+ " AND itemloc.qa = ~~'" + ls_qa  + "~~'" &
//								+ " AND location.area_no = ~~'" + ls_area + "~~'" 
//				end if
				ls_sql = 'datawindow.table.select = "' + is_locnosql + ls_where + '"'
				idwc_locno.modify(ls_sql)
				idwc_locno.retrieve()
	
				dw_2.object.loc_no[ll_row] = ls_loc
				ll_found = idwc_locno.find("itemloc_loc_no = '" + ls_loc + "'" , 1, idwc_locno.rowcount())
				if ll_found > 0 then
					idwc_locno.scrolltorow(ll_found)
				
					ld_itemloc_qoh = idwc_locno.getitemdecimal(idwc_locno.getrow(), "loc_qoh")
					if dw_2.object.stock_qty[ll_row] > 0 then
						ls_order = this.object.order_no[ll_row]
						li_seq   = this.object.seq_no[ll_row]
						SELECT sum(stock_qty) INTO :ld_do_stock FROM dodet WHERE sale_no = :ls_order AND seq_no = :li_seq;
						if isnull(ld_do_stock) then ld_do_stock = 0
					end if
					
					if ld_itemloc_qoh > ( dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ) then
						dw_2.setitem(ll_row, "issue_qty", ( dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ))
						dw_2.setitem(ll_row, "stock_issue", ( dw_2.object.stock_qty[ll_row] - ld_do_stock ) )
					else
						if ld_itemloc_qoh <= 0 then
							dw_2.object.loc_no[ll_row]      = ls_null
							dw_2.object.issue_qty[ll_row]   = 0
							dw_2.object.stock_issue[ll_row] = 0
						else
							dw_2.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
							if ld_itemloc_qoh > ( dw_2.object.stock_qty[ll_row] - ld_do_stock) then
								dw_2.setitem(ll_row, "stock_issue", ( dw_2.object.stock_qty[ll_row] ))	
							else
								dw_2.setitem(ll_row, "stock_issue", ld_itemloc_qoh)	
							end if
						end if
					end if
				else
					dw_2.object.loc_no[ll_row]      = ls_null
					dw_2.object.issue_qty[ll_row]   = 0
					dw_2.object.stock_issue[ll_row] = 0
				end if
				
				dw_2.accepttext()
				dw_2.setredraw(true)
			else
//				If gs_area = 'B0001' Then
//					dw_2.object.loc_no[ll_row] = ls_loc
//				end if
				dw_2.setitem(ll_row, "issue_qty", (dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row]) )
			end if  // 'C' 
		else
			this.object.loc_no[ll_row]    = ls_null
			this.object.issue_qty[ll_row] = 0
			this.object.coil_no[ll_row]   = ls_null
			if MidA(ls_item, 4, 1) = "1" or MidA(ls_item, 4, 1) = "2" then
				wf_cleardddw()
			end if
	   end if
		
	case 'issue_qty'
		if dw_1.object.do_case[1] <> 'C' then
//			select qoh into :ld_locqoh from itemloc
//			 where item_no = :ls_item and qa = :ls_qa and loc_no = :ls_loc;
			SELECT isnull(sum(qoh), 0) INTO :ld_locqoh FROM itemloc
			 WHERE item_no = :ls_item AND qa = :ls_qa AND loc_no = :ls_loc;
			 
			ld_issue_qty = this.getitemdecimal(ll_row,"issue_qty")
			ld_order_qty = this.getitemdecimal(ll_row,"order_qty")
			ld_rlse_qty  = this.getitemdecimal(ll_row,"rlse_qty")	
			if ld_issue_qty > ld_locqoh then
				messagebox("확인", "저장소 수량보다 클수 없습니다.")
				return 1
			end if
			
			if (ld_issue_qty + ld_rlse_qty) > ld_order_qty then
				messagebox("확인", "주문수량보다 클수 없습니다.")
				return 1
			end if		
		end if
		
	case 'coil_no'	
		if ls_source = 'N' then return
		
		if dw_1.object.do_case[1] = 'C' then	// 미수불
		else
			if trim(ls_loc) = '' or isnull(ls_loc) then
			else
				if MidA(ls_item, 4, 1) = "1" then
					dw_2.getchild("coil_no", idwc_lot)
					if idwc_lot.rowcount() > 0 then
						this.object.qcnt[ll_row]     = idwc_lot.getitemnumber(idwc_lot.getrow(), 'qcnt')
						this.object.unit_qty[ll_row] = idwc_lot.getitemnumber(idwc_lot.getrow(), 'unit_qty')
					end if
				elseif MidA(ls_item, 4, 1) = "2" then
					dw_2.getchild("coil_no", idwc_lot)
					if idwc_lot.rowcount() > 0 then
						this.object.qcnt[ll_row]     = idwc_lot.getitemnumber(idwc_lot.getrow(), 'qcnt')
						this.object.unit_qty[ll_row] = idwc_lot.getitemnumber(idwc_lot.getrow(), 'unit_qty')
					end if
				end if
			end if
		end if
		
	case 'cnt'
		if dw_1.object.do_case[1] = 'C' then	// 미수불
		else
			if integer(data) > this.getitemnumber(ll_row,"qcnt") then
				messagebox("확인", "로트 재고 갯수보다 클수 없습니다.")
				return 1
			end if
		end if
		
	case 'stock_issue'
		if dw_1.object.do_case[1] = 'C' then	// 미수불
		else
			if this.getitemdecimal(ll_row, "stock_issue") > this.getitemdecimal(ll_row, "issue_qty") then
				messagebox("확인", "장기재고 수량이 선정 수량보다 클수 없습니다.")
				return 1
			end if
		end if
end choose

this.postevent('ue_1')


end event

event dw_2::clicked;call super::clicked;//
gs_alter_str lstr_where
datetime ld_date
string   ls_item, ls_qa,  ls_source, ls_loc, ls_null, ls_where, ls_sql, ls_area, ls_area2
int      li_int
		
dw_1.Accepttext()
this.Accepttext()
if row < 1 then return

this.scrolltorow(row)

ls_source = this.object.source[row]
if ls_source = "N" then return		// 선택

if dw_1.object.do_case[1] = "C" then return // 미수불

setnull(ls_null)
ls_item = this.object.item_no[row]
ls_qa   = this.object.qa[row]
ls_loc  = this.object.loc_no[row]

choose case dwo.name
	case 'source'	// 선택
		wf_locno( dw_1.object.do_case[1] )		// 미수불 기본값: "A"
		
	case 'coil_no'	//
		if trim(ls_loc) <> '' and not isnull(ls_loc) then
			if MidA(ls_item, 4, 1) = "1" then
				wf_coildddw(ls_item, ls_qa, ls_loc )
			elseif MidA(ls_item, 4, 1) = "2" then
				wf_sheetdddw(ls_item, ls_qa, ls_loc)
			end if
		end if
		
	case 'flag'	// 가입고, 대체
		if GF_PERMISSION("거래명세서_가입고대체", gs_userid) = "Y" then			
			m_manager NewMenu
	
			NewMenu = CREATE m_manager
			gs_print_control = ""
			li_int = m_manager.m_oigiving.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())
	
			lstr_where.item_no   = trim(dw_2.object.item_no[row])
			lstr_where.qa        = trim(dw_2.object.qa[row])
			lstr_where.uom       = trim(dw_2.object.uom[row])
			lstr_where.order_no  = dw_2.object.order_no[row]
			lstr_where.seq       = dw_2.object.seq_no[row]
			lstr_where.order_qty = dw_2.object.order_qty[row] - dw_2.object.rlse_qty[row]
			
			SELECT top 1 dateadd(month, -2, convert(smalldatetime, :ld_date, 111)) into :ld_date FROM login;
			 
			choose case gs_print_control
				case 'intemp'	// 가입고
					//ls_area2 = this.object.sale_area_no[row]
					SELECT def_loc into :ls_loc FROM area WHERE area_no = :gs_area;
					 
					lstr_where.item_name = ls_loc
					lstr_where.chk       = "DO"
					openwithparm(w_whintemp_m, lstr_where)
					lstr_where = message.powerobjectparm
					if lstr_where.chk = "N" then return
					
					if lstr_where.chk = "D" then
						this.object.flag[row]      = 'N'
						this.object.loc_no[row]    = ls_null
						this.object.issue_qty[row] = 0
					else
						this.object.flag[row] = '가입'
					end if
	
				case 'alter'	// 물품대체
					lstr_where.cust_name = trim(dw_1.object.customer_cust_name[1])
					lstr_where.item_name = trim(dw_2.object.item_name[row])
					
					lstr_where.chk = "D" // "S": 수주확정시 대체저장, "D":출고시 대체저장
					openwithparm(w_whalter_w, lstr_where)
					lstr_where = message.powerobjectparm
					if lstr_where.chk = "N" then return
					
					if lstr_where.chk = "X" then
						this.object.flag[row] = 'N'
					elseif lstr_where.chk = "Y" then
						this.object.flag[row] = '대체'
					end if
			end choose
		else
			MessageBox("확인", "거래명세서_가입고대체 권한이 없습니다.")
			return
		end if
		
	CASE 'loc_no', 'issue_qty'	// 저장소, 수량
		ls_area = dw_1.object.do_area_no[1]
		if GF_PERMISSION('거래명세서작성저장소관리', gs_userid) = 'Y' then	
			ls_where = " AND itemloc.item_no  = ~~'" + ls_item + "~~' AND itemloc.qa = ~~'" + ls_qa + "~~'" 
		else
			ls_where = " AND itemloc.item_no  = ~~'" + ls_item + "~~'" &
						+ " AND itemloc.qa       = ~~'" + ls_qa   + "~~'" &
						+ " AND location.area_no = ~~'" + ls_area + "~~'" 
		end if

		ls_sql = 'datawindow.table.select = "' + is_locnosql + ls_where + '"'
		idwc_locno.modify(ls_sql)
		idwc_locno.settransobject(sqlca)
		idwc_locno.retrieve()
end choose

this.accepttext()


end event

event dw_2::itemerror;call super::itemerror;//
integer ll_row

ll_row = this.getrow()
CHOOSE CASE dwo.name
	CASE 'issue_qty'
		this.object.issue_qty[ll_row] = 0
		
	CASE 'cnt'
		this.object.cnt[ll_row] = 0
		
	case 'stock_issue'
		this.object.stock_issue[ll_row] = 0
END CHOOSE

return 1
end event

event dw_2::rowfocuschanged;call super::rowfocuschanged;//
string  ls_itemno, ls_itemqa, ls_where, ls_sql, ls_null, ls_source, ls_loc
integer ll_row

dw_1.Accepttext()
dw_2.Accepttext()

if dw_1.rowcount() < 1 then return

ll_row = this.getrow()	
if ll_row < 1 then return

if dw_1.object.do_case[1] = 'C' Then	// 미수불
else	
	ls_itemno = this.getitemstring(ll_row, "item_no")
	ls_itemqa = this.getitemstring(ll_row, "qa")
	
	ls_source = this.object.source[ll_row]
	ls_loc    = this.object.loc_no[ll_row]
	
	setnull(ls_null)
	if ls_source = 'N' then
		this.object.loc_no[ll_row]   = ls_null
		this.object.coil_no[ll_row]  = ls_null
		this.object.rlse_qty[ll_row] = 0
		if MidA(ls_itemno, 4, 1) = "1" or MidA(ls_itemno, 4, 1) = "2" then
			wf_cleardddw()
		end if
	else		
		if GF_PERMISSION("거래명세서_작성부서", gs_userid) = "Y" then	
			ls_where = " AND itemloc.item_no = ~~'" + ls_itemno + "~~' AND itemloc.qa = ~~'" + ls_itemqa  + "~~'" 
		else
			ls_where = " AND itemloc.item_no  = ~~'" + ls_itemno  + "~~'" &
						+ " AND itemloc.qa       = ~~'" + ls_itemqa  + "~~'" &
						+ " AND location.area_no = ~~'" + gs_area + "~~'" 
		end if

		ls_sql = 'datawindow.table.select = "' + is_locnosql + ls_where + '"'
		this.getchild("loc_no", idwc_locno)
		idwc_locno.settransobject(sqlca)
		idwc_locno.modify(ls_sql)
		idwc_locno.retrieve()
	end if
end if

end event

event dw_2::getfocus;call super::getfocus;//
pb_compute.default = false

end event

type st_title from w_inheritance`st_title within w_oido_m
integer x = 41
integer y = 44
integer width = 1147
string text = "거래명세서 작성"
end type

type st_tips from w_inheritance`st_tips within w_oido_m
end type

type pb_compute from w_inheritance`pb_compute within w_oido_m
integer x = 1774
integer y = 72
integer width = 174
integer height = 124
integer taborder = 20
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::clicked;string ls_cust, ls_scene, ls_orderno, ls_name, ls_sale_flag
long   ll_row
 
ls_orderno = TRIM(em_3.TEXT)
if isnull(ls_orderno) or ls_orderno = '' then return

setnull(ls_cust)
setnull(ls_scene)
select cust_no, scene_code, sale_flag into :ls_cust, :ls_scene, :ls_sale_flag 
  from sale
 where order_no = :ls_orderno;
if sqlca.sqlcode = 100 then 
	pb_cancel.triggerevent(clicked!)
	beep(2)
	em_3.SelectText(9, 2)
	em_3.setfocus()
	return
end if
dw_3.object.cust_no[1]    = ls_cust
dw_3.object.scene_code[1] = ls_scene
dw_3.object.sale_flag[1]  = ls_sale_flag

if isnull(ls_scene) or trim(ls_scene) = '' then
	dw_3.object.scene_code.background.color = 78682240
else
	dw_3.getchild("scene_code", idwc_scene)
	setnull(ls_name)
	select scene_desc into :ls_name from scene
	 where cust_no = :ls_cust
	   and scene_code = :ls_scene;
	if idwc_scene.rowcount() < 1 then
		idwc_scene.insertrow(1)
	end if
	idwc_scene.setitem(1, 'scene_code', ls_scene)
	idwc_scene.setitem(1, 'scene_desc', ls_name)
	dw_3.object.scene_code.background.color = RGB(255,255,255)
end if
this.default = false

pb_retrieve.enabled = true
is_sel_orderno = 'Y'
pb_retrieve.postevent(clicked!)

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oido_m
boolean visible = false
integer x = 3406
integer y = 512
integer width = 183
integer height = 132
integer taborder = 30
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_close from w_inheritance`pb_close within w_oido_m
integer x = 4434
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;   close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oido_m
boolean visible = false
integer x = 2254
integer y = 60
integer taborder = 130
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "목동출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print::clicked;call super::clicked;wf_print(dw_5)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oido_m
integer x = 4050
integer taborder = 140
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;//
pb_cancel.enabled   = FALSE
pb_save.enabled     = FALSE
pb_retrieve.enabled = TRUE
dw_1.enabled = FALSE
dw_2.enabled = FALSE
dw_3.enabled = TRUE

dw_1.reset()
dw_2.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_oido_m
boolean visible = false
integer x = 2528
integer y = 60
integer taborder = 150
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_oido_m
integer x = 3529
integer width = 315
integer taborder = 170
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출고의뢰조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_insert::mousemove;//
end event

event pb_insert::clicked;call super::clicked;string ls_ret
date   ld_start, ld_end

open( w_whissuereq_s )
w_whissuereq_s.WindowState = Normal!
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oido_m
integer x = 3858
integer taborder = 160
boolean enabled = false
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_cust_no,  ls_scene_code, ls_where, ls_sql, ls_sale_flag, ls_curr_code, ls_null
string ls_custname, ls_addr, ls_scenename, ls_addr2, ls_order_no
dec    ld_curr_rate
datetime ldt_dodate

if GF_PERMISSION("거래명세서_작성부서", gs_userid ) = "Y" or gs_userid = "1999010s" then
else
   pb_save.visible = false  // 저장기능 삭제
end if

setnull(ls_null)
dw_3.accepttext()

ls_cust_no = dw_3.object.cust_no[1]	
if isnull(ls_cust_no) or trim(ls_cust_no) = "" then return

ls_scene_code = dw_3.object.scene_code[1]	
if trim(ls_scene_code) = "" then	ls_scene_code = ls_null

ls_sale_flag = dw_3.object.sale_flag[1]	
dw_2.setredraw(false)
dw_1.setredraw(false)
dw_1.reset()
//if is_sel_orderno = 'N' then
//	if isnull(ls_scene_code) then
//		ls_where = " WHERE saledet.order_qty > saledet.rlse_qty AND sale.open_close = ~~'O~~' AND sale.cust_no = ~~'" &
//					  + ls_cust_no + "~~'"
//	else
//		ls_where = " WHERE saledet.order_qty > saledet.rlse_qty AND sale.open_close = ~~'O~~' AND sale.scene_code = ~~'" &
//					  + ls_scene_code + "~~' AND sale.cust_no = ~~'" + ls_cust_no + "~~'"
//	end if
//else
//	ls_order_no    = em_3.text
//	is_sel_orderno ='N'
//	ls_where = " WHERE saledet.order_qty > saledet.rlse_qty AND sale.open_close = ~~'O~~'" & 
//	         + " AND sale.order_no = ~~'" + ls_order_no + "~~'"
//end if // 출고지시서 where조건.
//ls_sql = "datawindow.table.select = '" + is_custscenesql + ls_where + "'"
////dw_2.modify(ls_sql)
//dw_2.retrieve()

if is_sel_orderno = 'N' then
	if isnull(ls_scene_code) then
      ls_where = " AND sale.order_date >= DateAdd(year, -1, getdate() )" + &
		           " AND sale.cust_no    = ~~'" + ls_cust_no + "~~'"
	else
      ls_where = " AND sale.order_date >= DateAdd(year, -1, getdate() )" + &
		           " AND sale.cust_no = ~~'" + ls_cust_no + "~~' AND sale.scene_code = ~~'" + ls_scene_code + "~~'"
	end if
else	// 수주번호 조회(Y)
	ls_order_no    = em_3.text
	is_sel_orderno = 'N'
	ls_where = " AND sale.order_no = ~~'" + ls_order_no + "~~'"
end if // 출고지시서 where조건.
//ls_sql = "datawindow.table.select = '" + is_custscenesql + ls_where + "'"

//dw_2.modify(ls_sql)
dw_2.object.DataWindow.table.select = is_custscenesql + ls_where
dw_2.retrieve()


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_2.rowcount() > 0 then
	dw_1.insertrow(0)
	// 거래명세서 발행구분 A:거래명세서, B:직거래명세서, C:비거래명세서
	// =>변경 2003/10/01 거래명세서 발행구분 A:수불발생, C:미수불
   // 정갑용- YSP사업장에서 작성할때는 미수불로 작성 2003년 10월 11일(한달정도 더 미수불로 하게요청(유갑부장))
   //	If gs_area = 'B0001' Then
   //		dw_1.object.do_case[1] = 'C'
   //	else
		   dw_1.object.do_case[1] = 'A' 
   //	End IF

  	dw_1.object.do_area_no[1] = gs_area

   //=========================================================================//
   // 거래처/현장 인수자번호는 항상 현장관리의 번호로 발송함
   //=========================================================================//
   // 현장 폰번호 사용안함 인 경우는 수주번호의 인수자번호를 가져옴
   // 동일한 거래처의 현장에서 폰번호가 다르면 마지막 수주의 인수자 번호 선택
   //=========================================================================//
   //	dw_1.object.tel_no[1]     = dw_2.object.tel_no[1]
	string ls_scene_phone, ls_scenehp
	
	SELECT scene_phone INTO :ls_scene_phone  FROM CUSTOMER WHERE cust_no = :ls_cust_no;
	if ls_scene_phone = "Y" then
		if dw_2.rowcount() = 1 then
			ls_scenehp = dw_2.object.tel_no[1]
		else
			SELECT TOP 1 tel_no INTO :ls_scenehp FROM SALE
	       WHERE cust_no = :ls_cust_no  AND scene_code = :ls_scene_code
          ORDER BY substring(order_no,3,12) DESC;
		end if
	else
		SELECT scene_tel  INTO :ls_scenehp  FROM SCENE  
	 	 WHERE cust_no = :ls_cust_no  AND scene_code = :ls_scene_code;
	end if
	dw_1.object.tel_no[1]     = ls_scenehp
//=========================================================================//

	dw_1.object.ship_flag[1]  = dw_2.object.ship_flag[1]	
	if dw_1.object.ship_flag[1] = "C" then // 착불
		dw_1.object.rem[1]     = "[착불] "
	end if

	dw_1.object.fob[1]        = dw_2.object.fob[1]	
	if isnull(dw_2.object.shipamt_case[1]) then
		dw_1.object.shipamt_case[1] = 'R'
	else
		dw_1.object.shipamt_case[1] = dw_2.object.shipamt_case[1]	
	end if
	
	dw_1.object.cust_no[1]    = ls_cust_no
	dw_1.object.spot_code[1]  = ls_scene_code
	dw_1.object.do_user_id[1] = gs_userid

	setnull(ls_custname)
	SELECT cust_name,  curr_code INTO :ls_custname, :ls_curr_code 
	  FROM customer
	 WHERE cust_no = :ls_cust_no;
	dw_1.object.customer_cust_name[1] = ls_custname
	
	setnull(ls_scenename)
	dw_1.object.spot_code[1] = ls_scene_code
	SELECT scene_desc, scene_addr INTO :ls_scenename, :ls_addr2 
	  FROM scene
	 WHERE scene_code = :ls_scene_code;

	if trim(ls_scene_code) <> "" and not isnull(ls_scene_code) then
		dw_1.object.scene_scene_desc[1] = ls_scenename
	else
		dw_1.object.scene_scene_desc[1] = ls_null
	end if
	
	if isnull(ls_addr2) or trim(ls_addr2) = "" then
	else
		ls_addr = ls_addr2
	end if

   // 해당수주번호의 운송처주소를 가져오기함
   long ll_rowmax
	ll_rowmax = dw_2.rowcount()
  	dw_1.object.shipto_addr[1] = dw_2.object.shipto_addr[ll_rowmax]		// 운송자HP/운송처주소
	dw_1.object.sale_flag[1]   = ls_sale_flag
	dw_1.object.curr_code[1]   = ls_curr_code
	
	dw_1.object.do_date[1] = datetime(date(string(today(),'yyyy/mm/dd')))
	ldt_dodate = datetime(today())
	dw_1.object.curr_rate[1] = 1
	if dw_1.object.curr_code[1] <> "WON" then
		SELECT exp_rate INTO :ld_curr_rate FROM currency WHERE curr_code = :ls_curr_code AND curr_date = :ldt_dodate;
		dw_1.object.curr_rate[1] = ld_curr_rate		  
	end if
   dw_1.enabled = TRUE
   dw_2.enabled = TRUE
   dw_3.enabled = FALSE
   pb_cancel.enabled   = TRUE
   pb_save.enabled     = TRUE
   pb_retrieve.enabled = FALSE
else
  	messagebox("확인", "해당하는 수주내역이 없습니다.")
	em_3.setfocus()
end if
dw_1.setredraw(true)
dw_2.setredraw(true)
dw_2.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oido_m
integer x = 5
integer y = 224
integer width = 3730
integer height = 140
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oido_m
integer x = 5
integer y = 352
integer width = 3730
integer height = 616
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oido_m
integer x = 3493
integer width = 1166
integer taborder = 60
long backcolor = 79220952
end type

type gb_5 from groupbox within w_oido_m
integer x = 1970
integer y = 12
integer width = 475
integer height = 204
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력형태"
end type

type gb_4 from groupbox within w_oido_m
integer x = 1243
integer y = 12
integer width = 727
integer height = 204
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "수주번호"
end type

type dw_3 from datawindow within w_oido_m
integer x = 32
integer y = 260
integer width = 3333
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oicustgiving_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_cust_no, ls_scenehp, ls_where, ls_sql, ls_null
long   ll_cnt

this.accepttext()
CHOOSE CASE dwo.name
	CASE 'cust_no'
		ls_cust_no = data
		setnull(ls_null)
		this.object.scene_code[1] = ls_null
		
		select count(*) into :ll_cnt from scene
		 where cust_no = :ls_cust_no;
		if ll_cnt > 0 then
			dw_3.getchild("scene_code", idwc_scene)
						  
		   ls_where = " WHERE scene.cust_no = ~~'" + ls_cust_no + "~~'" + &
				" and ( scene.scene_code in (select distinct scene_code from sale" + &
			   " where cust_no = ~~'" + ls_cust_no + "~~'" + &
				" AND open_close = ~~'O~~' ))"

//		   ls_where = " WHERE scene.cust_no = ~~'" + ls_cust_no + "~~'" + &
//				" and ( scene.scene_code in (select distinct scene_code from sale" + &
//			   " where cust_no = ~~'" + ls_cust_no + "~~'" + &
//				" AND confirm_flag = ~~'Y~~' " + &
//				" AND open_close = ~~'O~~' ))"
//
			ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
			
			idwc_scene.modify(ls_sql)
			idwc_scene.settransobject(sqlca)
			ll_cnt = idwc_scene.retrieve()			
		end if
			
		if ll_cnt > 0 then			
			this.object.scene_code.protect = 0
			this.object.scene_code.background.color = RGB(255,255,255)
		else
			this.object.scene_code.protect = 1 
			this.object.scene_code.background.color = 78682240
		end if
	CASE ELSE
//		<statementblock>
END CHOOSE


pb_retrieve.enabled = true
this.setfocus()

end event

type dw_inaudit from datawindow within w_oido_m
integer x = 722
integer y = 12
integer width = 96
integer height = 84
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oiinaudit"
boolean livescroll = true
end type

event dberror;//
is_dwaudit_syntax = sqlsyntax + "~n~n" + sqlerrtext

end event

type dw_dodet from datawindow within w_oido_m
integer x = 837
integer y = 12
integer width = 96
integer height = 84
boolean bringtotop = true
string dataobject = "d_oidodet"
boolean livescroll = true
end type

event dberror;//
is_dwdet_syntax = sqlsyntax + "~n~n" + sqlerrtext

end event

type dw_8 from datawindow within w_oido_m
integer x = 946
integer y = 12
integer width = 96
integer height = 84
boolean bringtotop = true
string dataobject = "d_oigiving_r_22"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oido_m
integer x = 1056
integer y = 12
integer width = 96
integer height = 84
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type em_3 from editmask within w_oido_m
integer x = 1275
integer y = 96
integer width = 480
integer height = 80
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
string mask = "!!########-###"
boolean autoskip = true
end type

event getfocus;em_3.SelectText(9,6)
pb_compute.default = true

end event

type st_2 from statictext within w_oido_m
integer x = 3465
integer y = 812
integer width = 256
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 33521663
string text = "가입고"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_oido_m
integer x = 3753
integer y = 772
integer width = 795
integer height = 104
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "<= 부가세 수정할 경우  변경에 체크하세요."
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_10 from checkbox within w_oido_m
integer x = 4352
integer y = 244
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "결재자"
boolean checked = true
end type

type cbx_source from checkbox within w_oido_m
integer x = 3771
integer y = 244
integer width = 581
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "공급자 선택변경"
end type

event clicked;string ls_loc
long   ll_row

if this.checked = true then
	dw_source.retrieve()
	dw_source.visible = true
	
	IF gf_permission('거래명세서_기본공급자', gs_userid) = 'Y' THEN
		SELECT bigo INTO :ls_loc FROM codemst
		 WHERE type = '거래명세서_기본공급자' AND item_cd = :gs_userid;
		choose case ls_loc
			case "S", "B"
				ll_row = 1
			case "D"
				ll_row = 8
			case "H"
				ll_row = 2
		end choose
		dw_source.Object.c_chk[ll_row] = 'Y'
		dw_source.ScrollToRow(ll_row)			
		is_sno = dw_source.object.reg_r[ll_row]
		is_sh  = dw_source.object.part_name[ll_row]
		is_nm  = dw_source.object.captain_name[ll_row]
		is_js  = dw_source.object.addr[ll_row]

		// 도로명주소 가져오기
//		if dw_1.object.do_date[1] < "2014/01/01" then
//		else          
//			is_sno  = "1 0 9 - 8 6  - 3 7 9 1 0"   // dw_source.object.reg_r[ll_row]
//			is_sh   = "(주)송천건업"					// dw_source.object.part_name[ll_row]
//			is_nm   = "이명섭"							// dw_source.object.captain_name[ll_row]
//			is_js   = "서울특별시 강서구 강서로41길 12 (화곡동)"	// dw_source.object.addr[ll_row]
//		// is_type = "부동산외"						   // dw_source.object.indust_type[ll_row]
//		// is_code = "임대외"						   // dw_source.object.indust_code[ll_row]
//		end if		
	END IF	
else
	dw_source.visible = false
	is_sno = ''
	is_sh  = ''
	is_nm  = ''
	is_js  = ''
end if

end event

type dw_source from datawindow within w_oido_m
integer x = 3739
integer y = 308
integer width = 937
integer height = 444
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiglpart_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;integer li_i
choose case dwo.name
	case 'c_chk'
		if data = 'Y' then
			for li_i = 1 to this.rowcount()
				if li_i = row then
					is_sno = this.object.reg_r[li_i]
					is_sh = this.object.part_name[li_i]
					is_nm = this.object.captain_name[li_i]
					is_js = this.object.addr[li_i]
					continue
				end if
				this.object.c_chk[li_i] = 'N'
			next
		end if
end choose


end event

type cbx_1 from checkbox within w_oido_m
integer x = 2002
integer y = 72
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "명세"
end type

type cbx_2 from checkbox within w_oido_m
integer x = 2222
integer y = 72
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "인수"
boolean checked = true
end type

type rb_a4 from radiobutton within w_oido_m
integer x = 2514
integer y = 60
integer width = 311
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "A4 양식"
end type

type rb_a5 from radiobutton within w_oido_m
integer x = 2514
integer y = 116
integer width = 311
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "A5 양식"
boolean checked = true
end type

type cbx_temp from checkbox within w_oido_m
integer x = 2894
integer y = 16
integer width = 576
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "거래일CHECK(30일)"
boolean checked = true
end type

type gb_8 from groupbox within w_oido_m
integer x = 2464
integer y = 12
integer width = 416
integer height = 204
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력용지"
end type

type st_1 from statictext within w_oido_m
integer x = 3465
integer y = 752
integer width = 256
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 20564718
string text = "대체"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_oido_m
integer x = 2002
integer y = 136
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고"
boolean checked = true
end type

type cbx_4 from checkbox within w_oido_m
integer x = 2222
integer y = 136
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "납품"
boolean checked = true
end type

type st_3 from statictext within w_oido_m
integer x = 2885
integer y = 92
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "왼쪽"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_oido_m
integer x = 3191
integer y = 92
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "상단"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_left from editmask within w_oido_m
integer x = 3022
integer y = 80
integer width = 160
integer height = 68
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "115"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)

end event

type em_top from editmask within w_oido_m
integer x = 3323
integer y = 80
integer width = 160
integer height = 68
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "110"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)

end event

