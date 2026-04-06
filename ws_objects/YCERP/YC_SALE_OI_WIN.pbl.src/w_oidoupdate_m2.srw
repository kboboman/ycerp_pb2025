$PBExportHeader$w_oidoupdate_m2.srw
$PBExportComments$거래명새서수정및 취소(1998/4/23,성삼지)
forward
global type w_oidoupdate_m2 from w_inheritance
end type
type dw_3 from datawindow within w_oidoupdate_m2
end type
type dw_4 from datawindow within w_oidoupdate_m2
end type
type dw_8 from datawindow within w_oidoupdate_m2
end type
type dw_9 from datawindow within w_oidoupdate_m2
end type
type em_1 from editmask within w_oidoupdate_m2
end type
type st_1 from statictext within w_oidoupdate_m2
end type
type em_2 from editmask within w_oidoupdate_m2
end type
type dw_inaudit from datawindow within w_oidoupdate_m2
end type
type dw_7 from datawindow within w_oidoupdate_m2
end type
type cbx_2 from checkbox within w_oidoupdate_m2
end type
type cbx_3 from checkbox within w_oidoupdate_m2
end type
type em_3 from editmask within w_oidoupdate_m2
end type
type st_3 from statictext within w_oidoupdate_m2
end type
type cb_1 from commandbutton within w_oidoupdate_m2
end type
type cbx_4 from checkbox within w_oidoupdate_m2
end type
type cb_2 from commandbutton within w_oidoupdate_m2
end type
type cbx_5 from checkbox within w_oidoupdate_m2
end type
type cb_3 from commandbutton within w_oidoupdate_m2
end type
type cb_4 from commandbutton within w_oidoupdate_m2
end type
type gb_4 from groupbox within w_oidoupdate_m2
end type
type cbx_source from checkbox within w_oidoupdate_m2
end type
type dw_source from datawindow within w_oidoupdate_m2
end type
type st_permission from statictext within w_oidoupdate_m2
end type
type cbx_6 from checkbox within w_oidoupdate_m2
end type
type cbx_7 from checkbox within w_oidoupdate_m2
end type
type cbx_8 from checkbox within w_oidoupdate_m2
end type
type cbx_9 from checkbox within w_oidoupdate_m2
end type
type st_2 from statictext within w_oidoupdate_m2
end type
type st_info from statictext within w_oidoupdate_m2
end type
type st_left from statictext within w_oidoupdate_m2
end type
type em_left from editmask within w_oidoupdate_m2
end type
type st_9 from statictext within w_oidoupdate_m2
end type
type em_top from editmask within w_oidoupdate_m2
end type
type gb_5 from groupbox within w_oidoupdate_m2
end type
type gb_8 from groupbox within w_oidoupdate_m2
end type
type st_pick from structure within w_oidoupdate_m2
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oidoupdate_m2 from w_inheritance
integer width = 5454
integer height = 2492
string title = "거래명세서 수정(주요업무)(w_oidoupdate_m2)"
boolean resizable = false
dw_3 dw_3
dw_4 dw_4
dw_8 dw_8
dw_9 dw_9
em_1 em_1
st_1 st_1
em_2 em_2
dw_inaudit dw_inaudit
dw_7 dw_7
cbx_2 cbx_2
cbx_3 cbx_3
em_3 em_3
st_3 st_3
cb_1 cb_1
cbx_4 cbx_4
cb_2 cb_2
cbx_5 cbx_5
cb_3 cb_3
cb_4 cb_4
gb_4 gb_4
cbx_source cbx_source
dw_source dw_source
st_permission st_permission
cbx_6 cbx_6
cbx_7 cbx_7
cbx_8 cbx_8
cbx_9 cbx_9
st_2 st_2
st_info st_info
st_left st_left
em_left em_left
st_9 st_9
em_top em_top
gb_5 gb_5
gb_8 gb_8
end type
global w_oidoupdate_m2 w_oidoupdate_m2

type variables
st_print i_print
datawindowchild idwc_scene, idwc_cust, idwc_car
string   is_old_time, is_scenesql, is_custscenesql
int      ii_rowleeinho
gs_where2 lstr_where_row[]

datetime id_do_date, id_fdodate // 이월체크
string   is_f_do_no, is_t_do_no, is_f_do_user_id, is_t_do_user_id, is_f_do_area_no, is_t_do_area_no, is_f_ship_flag, is_t_ship_flag, is_f_do_case, is_t_do_case, is_cust_no, is_spot_code
datetime id_f_do_date, id_t_do_date, id_f_issue_date, id_t_issue_date
dec      idc_f_ship_amount, idc_f_do_cash, idc_f_do_rate, idc_f_do_total, idc_t_ship_amount
dec      idc_t_do_cash, idc_t_do_rate, idc_t_do_total

string   is_sno, is_sh, is_nm, is_js, is_type, is_jobdesc

string   IS_Permission[8] = {'N','N','N','N','N','N','N','N'}


//string   is_f_do_no, is_t_do_no, is_f_do_user_id, is_t_do_user_id, is_f_do_area_no, is_t_do_area_no, is_f_ship_flag, is_t_ship_flag, is_f_do_case, is_t_do_case, is_cust_no, is_spot_code
//string   is_f_do_no, is_t_do_no, is_f_do_user_id, is_t_do_user_id, is_f_do_area_no, is_t_do_area_no, is_f_ship_flag, is_t_ship_flag, is_f_do_case, is_t_do_case, is_cust_no, is_spot_code

end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
public subroutine wf_calc ()
public function boolean wf_delete (long al_row)
public function boolean wf_itemalter (string as_do_no, long al_doseq, long al_row)
public subroutine wf_calc2 ()
public subroutine wf_permission ()
public function boolean wf_ewol (datawindow ad_do, datawindow ad_dodet)
end prototypes

public subroutine wf_print (datawindow arg_dw);//
long   ll_count, ll_idx, ll_int,  ll_cnt, ll_line_cnt
string ls_orderno, ls_cap_name,   ls_cust_no, ls_null, ls_rate_cash, ls_username
string ls_ship_cash, ls_ship_vat, ls_ship_qty, ls_acc_qty, ls_price, ls_amount
string ls_item_name, ls_item_no,  ls_qa, ls_cash, ls_uom, ls_dr, ls_real_uom
dec    ld_amount
string ls_sale_no, ls_desc, ls_unit_qty, ls_cnt
int    li_seq_no
dateTIME ld_date

if pb_cancel.enabled = false then
	return
end if

ls_username = gs_username
ll_line_cnt = 16		// 라인줄수

// 도로명주소 가져오기
if dw_1.object.do_date[1] < DateTime("2014/01/01") then
else
	is_sno  = "1 4 0 - 8 1  - 4 8 1 9 8"   // dw_source.object.reg_r[ll_row]
	is_sh   = "주식회사 유창"					// dw_source.object.part_name[ll_row]
	is_nm   = "조용선, 조우제"					// dw_source.object.captain_name[ll_row]
	is_js   = "경기도 시흥시 공단1대로321번길 45 (정왕동)"	// dw_source.object.addr[ll_row]
// is_type = "제조, 건설"						// dw_source.object.indust_type[ll_row]
// is_code = "건축자재 外"						// dw_source.object.indust_code[ll_row]
end if

setnull(ls_null)
ls_orderno = dw_1.object.do_no[1]	
ls_dr  = trim(dw_1.object.rem[1]) + " " + trim(dw_1.object.tel_no[1])
ll_idx = 0
ll_int = 0
arg_dw.reset()

for ll_count = 1 to dw_2.rowcount()
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
 	   arg_dw.object.addr[ll_int]      = dw_1.object.shipto_addr[1]			// 운송처주소
   	arg_dw.object.tel[ll_int]       = dw_1.object.tel_no[1]              // 연락처
		arg_dw.object.telno_cap[ll_int] = dw_1.object.telno_cap[1]  			// 보조연락처
		IF isnull(dw_1.object.spot_code[1]) then
	      arg_dw.object.scene[ll_int] = ls_null
		else
	      arg_dw.object.scene[ll_int] = dw_1.object.scene_scene_desc[1]		// 현장명
		end if
		
   	ls_cust_no = dw_1.object.cust_no[1]
	   SELECT register_no INTO :ls_cap_name FROM customer  WHERE cust_no = :ls_cust_no;
		arg_dw.object.cust[ll_int]     = dw_1.object.customer_cust_name[1]
   	arg_dw.object.cap_name[ll_int] = ls_cap_name

		string ls_c_chk
		if cbx_source.checked = true then
			ls_c_chk = 'Y'
		else
			ls_c_chk = 'N'
		end if
	end if
	
	ll_idx     = ll_idx + 1
	ls_item_no = dw_2.object.item_no[ll_count]
	///////////////////////////////////////////////////////////////////
	// 규격(송장) 값이 존재하면 규격으로 출력함
	///////////////////////////////////////////////////////////////////
	ls_qa      = dw_2.object.qa[ll_count]
   SELECT item_name INTO :ls_item_name FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa;
   if isnull(dw_2.object.qa_cust[ll_count]) then
	else
		ls_qa   = dw_2.object.qa_cust[ll_count]
	end if
	ls_qa      = MidA(ls_qa,  1, 3) + ' X ' + MidA(ls_qa,  5, 4) + ' X ' + &
		          MidA(ls_qa, 10, 4) + ' X ' + MidA(ls_qa, 15, 5)
	///////////////////////////////////////////////////////////////////
	ls_uom       = dw_2.object.uom[ll_count]
	ls_ship_qty  = string(dw_2.object.ship_qty[ll_count], '###,###,###.00')
	ls_acc_qty   = string(dw_2.object.rlse_acc_qty[ll_count], '###,###,###.00')
	ls_price     = string(dw_2.object.price[ll_count], '####,###,##0')
	ls_amount    = string(dw_2.object.rlse_amount[ll_count], '####,###,##0')
	ls_rate_cash = string(dw_2.object.rate_cash[ll_count], '####,###,##0')
	IF trim(ls_uom) = 'M' OR ls_uom = 'M2' then
   	ls_real_uom ='EA'
	ELSE
		if ls_uom = "SS" then
			ls_real_uom = "SH"
			ls_uom = "M2"
		else
	     	ls_real_uom = ls_uom
		end if		
	end if
	
// 거래명세서/출고증의 비고에 생산일자또는 입고일자또는 재고일자(출고일자)을 기록
// ISO에 의한 시화 진달수 과장의 요청에의하여 추가 2000/06/13, easthero
	ls_desc    = dw_2.object.rem[ll_count]
	ls_sale_no = dw_2.object.sale_no[ll_count]
	li_seq_no  = dw_2.object.seq_no[ll_count]
	setnull(ld_date)
	SELECT max(sfc_date) INTO :ld_date FROM sfcday WHERE sale_no = :ls_sale_no AND seq_no = :li_seq_no;
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
	if not isnull(dw_2.object.coil_no[ll_count]) and trim(dw_2.object.coil_no[ll_count]) <> '' then
		ls_unit_qty = string(truncate(dw_2.object.ship_qty[ll_count] / dw_2.object.cnt[ll_count], 2), '###,###,###.00')
		ls_cnt      = string(dw_2.object.cnt[ll_count], '###,###')
   	ls_ship_qty = ls_unit_qty + space(9 - LenA(ls_unit_qty) - LenA(ls_cnt))+ ' X ' + ls_cnt
		ls_desc     = trim(ls_desc) + dw_2.object.coil_no[ll_count]
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

// 운반비 대여
if dw_1.object.ship_flag[1] = 'D' and dw_1.object.shipamt_case[1] = 'R' then 
	if dw_1.object.ship_amount[1] <> 0 then
		if ll_idx = 0 then
			ll_int = ll_int + 1
		
			arg_dw.object.register[1]     = is_sno
			arg_dw.object.saler_name[1]   = is_sh
			arg_dw.object.saler_cap[1]    = is_nm
			arg_dw.object.saler_addr[1]   = is_js
			
			if arg_dw.dataobject = 'd_oigiving_r_22_a5' then
			else
				arg_dw.object.ls_user[ll_int] = ls_username
			end if
			
			arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
			arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]
			if arg_dw.dataobject = 'd_oigiving_r_22_a5' then
			else
				arg_dw.object.ls_user[ll_int] = ls_username
			end if
			
			arg_dw.object.addr[ll_int]      = dw_1.object.shipto_addr[1]			// 운송처주소
			arg_dw.object.tel[ll_int]       = dw_1.object.tel_no[1]					// 연락처
		   arg_dw.object.telno_cap[ll_int] = dw_1.object.telno_cap[1]  			// 보조연락처
			IF isnull(dw_1.object.spot_code[1]) then
				arg_dw.object.scene[ll_int] = ls_null
			else
//				dw_3.getchild("scene_code", idwc_scene)
//				idwc_scene.settransobject(sqlca)
//				arg_dw.object.scene[ll_int] = idwc_scene.getitemstring(idwc_scene.getrow(), 'scene_desc')
	     		arg_dw.object.scene[ll_int] = dw_1.object.scene_scene_desc[1]		// 현장명
			end if
			
			ls_cust_no = dw_1.object.cust_no[1]
			SELECT register_no INTO :ls_cap_name FROM customer WHERE cust_no = :ls_cust_no;
			arg_dw.object.cust[ll_int]     = dw_1.object.customer_cust_name[1]
			arg_dw.object.cap_name[ll_int] = ls_cap_name
		end if
		
		ll_idx = ll_idx + 1
		ls_ship_cash = string(dw_1.object.ship_amount[1], '####,###,##0')
		ls_ship_vat  = string(truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0 ), '####,###,##0')
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

arg_dw.object.cash[ll_int]       = string(dw_1.object.do_cash[1], '####,###,###,###')
arg_dw.object.vat[ll_int]        = string(dw_1.object.do_rate[1], '####,###,###,###')
arg_dw.object.tot_amount[ll_int] = string(dw_1.object.do_total[1], '####,###,###,###')
arg_dw.object.dr_man[ll_int]     = ls_dr

end subroutine

public subroutine wf_calc ();// 총SUM 후 계산
long  ll_row

dw_1.Accepttext()
dw_2.Accepttext()
if dw_1.rowcount() < 1 then RETURN

dw_1.object.do_cash[1]  = 0
dw_1.object.do_rate[1]  = 0
dw_1.object.do_total[1] = 0

//
for ll_row = 1 to dw_2.rowcount()
	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_2.object.rlse_amount[ll_row]
next

//
dw_1.Accepttext()

if dw_1.object.do_cash[1] < 0 then
	dw_1.object.do_rate[1] = truncate((dw_1.object.do_cash[1] / 10) - 0.0000001, 0)	 
elseif dw_1.object.do_cash[1] > 0 then
	dw_1.object.do_rate[1] = truncate((dw_1.object.do_cash[1] / 10) + 0.0000001, 0)	 
end if

//
if dw_1.object.ship_flag[1] = "D" AND dw_1.object.shipamt_case[1] = "R" then
	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]
	
	if dw_1.object.sale_flag[1] <> "E" then
		if dw_1.object.ship_amount[1] < 0 then
			dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 - 0.0000001, 0)
		elseif dw_1.object.ship_amount[1] > 0 then
			dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0)
		end if
	end if
end if

//
dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]

end subroutine

public function boolean wf_delete (long al_row);//
integer  li_seq
string   ls_do_no, ls_item_no, ls_qa, ls_loc, ls_sale_no, ls_cust_no, ls_lot
long     ll_cnt, ll_do_seq, ll_inauditrow
dec      ld_qoh, ld_do_amount
datetime ldt_getdate

ls_sale_no = dw_2.object.sale_no[al_row]
li_seq     = dw_2.object.seq_no[al_row]
ls_item_no = dw_2.object.item_no[al_row]
ls_qa      = dw_2.object.qa[al_row]
ls_lot     = dw_2.object.coil_no[al_row]
ls_loc     = dw_2.object.loc_no[al_row]
ll_cnt     = dw_2.object.cnt[al_row]
ls_do_no   = dw_2.object.do_no[al_row]
ll_do_seq  = dw_2.object.oi_no[al_row]


UPDATE itemstockdet
SET out_qty = out_qty - B.qty,
		  qty  = in_qty + b.qty
FROM itemstockdet A inner JOIN (
												  select seq, sum(qty) qty
												  from itemstockout
												  where use_yn = 'Y'
													 AND do_no  = :ls_do_no
													 AND oi_no   = :ll_do_seq
												  group by seq
										    ) B ON A.id = B.seq;
											 
/*2019-10-25 jowonsuk 장기재고 반영 */
delete itemstockout		/*장기재고 출고테이블*/
where  do_no  = :ls_do_no
and oi_no   = :ll_do_seq;											 


ll_inauditrow = dw_inaudit.insertrow(0)

SELECT getdate() INTO :ldt_getdate FROM dual;

//////////////////////////////
// 수불부
//////////////////////////////
dw_inaudit.object.inaudit_time[ll_inauditrow] = ldt_getdate
dw_inaudit.object.inaudit_date[ll_inauditrow] = dw_1.GetItemdatetime(1, "issue_date", Primary!, TRUE)
dw_inaudit.object.inaudit_item[ll_inauditrow] = dw_2.object.item_no[al_row]
dw_inaudit.object.qa[ll_inauditrow]           = dw_2.object.qa[al_row]
dw_inaudit.object.loc_no[ll_inauditrow]       = ls_loc
dw_inaudit.object.inaudit_type[ll_inauditrow] = 'IS'
dw_inaudit.object.order_no[ll_inauditrow]     = ls_do_no
dw_inaudit.object.rcpt_qty[ll_inauditrow]     = 0
//dw_inaudit.object.issue_qty[ll_inauditrow]    = dw_2.GetItemNumber(al_row, "ship_qty", Primary!, TRUE) * -1
dw_inaudit.object.issue_qty[ll_inauditrow]    = dw_2.object.ori_ship[al_row] * -1
dw_inaudit.object.cost[ll_inauditrow]         = dw_2.object.price[al_row]
dw_inaudit.object.destination[ll_inauditrow]  = dw_1.object.cust_no[1]
dw_inaudit.object.rem[ll_inauditrow]          = dw_2.object.rem[al_row]
dw_inaudit.object.serial_id[ll_inauditrow]    = ls_lot
if dw_2.object.cnt[al_row] <> 0 then
	//dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.GetItemNumber(al_row, "ship_qty", Primary!, TRUE) / dw_2.object.cnt[al_row]
	  dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.object.ori_ship[al_row] / dw_2.object.cnt[al_row]
else
	//dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.GetItemNumber(al_row, "ship_qty", Primary!, TRUE)
	  dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.object.ori_ship[al_row]
end if
dw_inaudit.object.com_qty[ll_inauditrow]      = dw_2.object.cnt[al_row]
dw_inaudit.object.cnt[ll_inauditrow]          = ll_do_seq		
dw_inaudit.object.user_id[ll_inauditrow]      = gs_userid

// 추가 coil판매와 sheet판매시의 coilmst와 sheetmst 의 open_close = 'C' - 01/5/4이인호 
if trim(ls_lot) <> '' and not isnull(ls_lot) then
	if MidA(ls_item_no, 4, 1) = "1" then
		UPDATE coilmst 
		   SET qcnt = qcnt + :ll_cnt, open_close = 'O'
		 WHERE coil_no = :ls_lot AND loc_no = :ls_loc;
		if sqlca.sqlcode < 0 then
			rollback;
			MessageBox("저장","coilmst저장도중 오류가 발생하였습니다!",exclamation!)
			return  false
		end if		
	elseif MidA(ls_item_no, 4, 1) = "2" then
		UPDATE sheetmst 
		   SET qcnt = qcnt + :ll_cnt, open_close = 'O'
		 WHERE sheet_no = :ls_lot AND loc_no = :ls_loc;
		if sqlca.sqlcode < 0 then
			rollback;
			MessageBox("저장","sheetmst저장도중 오류가 발생하였습니다!",exclamation!)
			return  false
		end if	
	end if
end if

//if cbx_2.checked = true then
//	select count(*) into :ll_cnt from intemp
//	 where exists (select * from dodet 
//						 where dodet.do_no   = :ls_do_no
//	  						and dodet.oi_no   = :ll_do_seq
//						 	and dodet.sale_no = intemp.order_no
//						 	and dodet.seq_no  = intemp.seq_no);
//	IF ll_cnt > 0 THEN
//		delete FROM intemp 
//		where exists (select * from dodet 
//						 where dodet.do_no   = :ls_do_no
//	  						and dodet.oi_no   = :ll_do_seq
//						 	and dodet.sale_no = intemp.order_no
//						 	and dodet.seq_no  = intemp.seq_no);
//		IF sqlca.sqlcode < 0 THEN
//			ROLLBACK;
//			messagebox("저장","가입고 삭제시 오류가 발생했습니다.",exclamation!)
//			return false
//		END IF	
//	END IF	
//end if
return true

end function

public function boolean wf_itemalter (string as_do_no, long al_doseq, long al_row);//long ll_inauditrow
//string ls_flag, ls_loc
//string ls_srcitem, ls_srcqa, ls_taritem, ls_tarqa, ls_dono
//int li_count
//dec ld_src_qty, ld_tar_qty
//
//dw_1.accepttext()
//dw_2.accepttext()
//setnull(ls_flag)
//ls_taritem = dw_2.object.item_no[al_row]
//ls_tarqa = dw_2.object.qa[al_row]
//ls_loc = dw_2.object.loc_no[al_row]
//
//select src_item, src_qa, src_qty, tar_qty, issue_flag 
// into :ls_srcitem, :ls_srcqa, :ld_src_qty, :ld_tar_qty, :ls_flag from itemalter
//where do_no = :as_do_no
//  and do_seq = :al_doseq;
// 
//if sqlca.sqlcode <> 0 then return true
//// 대체 출고
//// 입출고내역저장
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
//dw_inaudit.object.qa[ll_inauditrow]           = ls_srcqa
//dw_inaudit.object.loc_no[ll_inauditrow]       = dw_2.object.loc_no[al_row]
//dw_inaudit.object.inaudit_type[ll_inauditrow] = 'IA'
//dw_inaudit.object.order_no[ll_inauditrow]     = dw_1.object.do_no[1]
//dw_inaudit.object.rcpt_qty[ll_inauditrow]     = 0
//dw_inaudit.object.issue_qty[ll_inauditrow]    = ld_src_qty * -1
//dw_inaudit.object.cost[ll_inauditrow]         = dw_2.object.price[al_row]
//dw_inaudit.object.destination[ll_inauditrow]  = dw_2.object.loc_no[al_row]
//dw_inaudit.object.rem[ll_inauditrow]          = '거래명세삭제시 대체출고삭제'
//dw_inaudit.object.serial_id[ll_inauditrow]    = 'D'
//dw_inaudit.object.unit_qty[ll_inauditrow]     = ld_src_qty
//dw_inaudit.object.com_qty[ll_inauditrow]      = ld_src_qty
//dw_inaudit.object.cnt[ll_inauditrow]          = al_doseq		
//dw_inaudit.object.user_id[ll_inauditrow]      = gs_userid		
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
//dw_inaudit.object.inaudit_item[ll_inauditrow] = dw_2.object.item_no[al_row]
//dw_inaudit.object.qa[ll_inauditrow]           = dw_2.object.qa[al_row]
//dw_inaudit.object.loc_no[ll_inauditrow]       = dw_2.object.loc_no[al_row]
//dw_inaudit.object.inaudit_type[ll_inauditrow] = 'RA'
//dw_inaudit.object.order_no[ll_inauditrow]     = dw_1.object.do_no[1]
//dw_inaudit.object.rcpt_qty[ll_inauditrow]     = ld_tar_qty * -1
//dw_inaudit.object.issue_qty[ll_inauditrow]    = 0
//dw_inaudit.object.cost[ll_inauditrow]         = dw_2.object.price[al_row]
//dw_inaudit.object.destination[ll_inauditrow]  = dw_2.object.loc_no[al_row]
//dw_inaudit.object.rem[ll_inauditrow]          = '거래명세삭제시 대체입고삭제'
//dw_inaudit.object.serial_id[ll_inauditrow]    = 'D'
//dw_inaudit.object.unit_qty[ll_inauditrow]     = ld_tar_qty
//dw_inaudit.object.com_qty[ll_inauditrow]      = ld_tar_qty
//dw_inaudit.object.cnt[ll_inauditrow]          = al_doseq		
//dw_inaudit.object.user_id[ll_inauditrow]      = gs_userid	
//
return true

end function

public subroutine wf_calc2 ();// 개별 합계용.
long  ll_row

dw_1.Accepttext()
dw_2.Accepttext()
if dw_1.rowcount() < 1 then RETURN

dw_1.object.do_cash[1]  = 0
dw_1.object.do_rate[1]  = 0
dw_1.object.do_total[1] = 0

//
for ll_row = 1 to dw_2.rowcount()
   dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_2.object.rlse_amount[ll_row]
  /*2021.09.11 jowonsuk 부가세 소수점 빼면 총합 부가세 일의 자릿수 맞지 않는 문제 발생으로 detail 부가세는 소수점 1일의 자리수까지 받는 로직 변경*/
//   if dw_2.object.rate_cash[ll_row] < 0 then
//		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_2.object.rate_cash[ll_row] - 0.0000001, 0)	 
//	elseif dw_2.object.rate_cash[ll_row] > 0 then
//		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_2.object.rate_cash[ll_row] + 0.0000001, 0)	 
//	end if
next

dw_1.object.do_rate[1] = truncate( dw_1.object.do_cash[1]/10 + 0.0000001, 0)
//
dw_1.Accepttext()

if dw_1.object.ship_flag[1] = "D" AND dw_1.object.shipamt_case[1] = "R" then
	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]

	if dw_1.object.sale_flag[1] <> "E" then
		if dw_1.object.ship_amount[1] < 0 then
			dw_1.object.do_rate[1] = truncate(dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 - 0.0000001, 0) - 0.0000001, 0)
		elseif dw_1.object.ship_amount[1] > 0 then
			dw_1.object.do_rate[1] = truncate(dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0) + 0.0000001, 0)
		end if
	end if
end if

//
dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]

end subroutine

public subroutine wf_permission ();//
if dw_1.rowcount() < 1 then return 
if dw_2.rowcount() < 1 then return

if GF_PERMISSION('거래명세서_전체기능', gs_userid ) = 'Y' then
	pb_save.enabled       = TRUE
	pb_delete.enabled     = TRUE   
	pb_insert.enabled     = TRUE   
	pb_compute.enabled    = TRUE   
	pb_print_part.enabled = TRUE

//	if GF_PERMISSION('거래명세서_미수불작성', gs_userid ) = 'Y' then
//		dw_2.object.issue_flag.protect = 0
//		dw_2.object.issue_flag.background.color = RGB(255, 255, 255)
//	else
		dw_2.object.issue_flag.protect = 1
		dw_2.object.issue_flag.background.color = 78682240
//	end if
else
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// 담당자별 권한 내역                                                                              //
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// SELECT BIGO FROM CODEMST WHERE TYPE = '거래명세서_수정/삭제'                                    //
	// 1 2 3 4 5 6 7 8                                                                                 //
	// Y,N,N,N,Y,Y,Y,Y  :  단가수정,송장삭제,라인삭제,수량변경,업체변경,기사변경,운반비수정,출고일변경 //
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	String  ls_Permission, ls_shipclose
	Integer ii
	SELECT  RTRIM(BIGO) INTO :ls_Permission  FROM  CODEMST
	 WHERE  type     =  '거래명세서_수정/삭제'
		AND  USE_YN   =  'Y' AND  item_cd  =  :gs_userid;
	if SQLCA.SQLDBCODE = 0 then   
		st_permission.text = ls_Permission
		for ii = 1 to 8
			if MidA(ls_Permission,ii,1) = "Y" OR MidA(ls_Permission,ii,1) = "N" then
				IS_Permission[ii] = MidA(ls_Permission,ii,1)
			else
				IS_Permission[ii] = "N"
			end if
		next
				
		// 운반비 마감여부( C : 마감, O : 오픈 )
		ls_shipclose = dw_1.object.ship_close[1]
		
		// 1. 단가수정   : 부가세(do_rate), 라인_출고단가(price), 라인_환산출고수량(rate_cash)
		if IS_Permission[1] = "Y" then
			dw_1.Object.do_rate.protect   = 0
			dw_2.Object.price.protect     = 0
			dw_2.Object.rate_cash.protect = 0

			dw_1.object.do_rate.background.color   = RGB(255,255,255)
			dw_2.object.price.background.color     = RGB(255,255,255)
			dw_2.object.rate_cash.background.color = RGB(255,255,255)
		else
			dw_1.Object.do_rate.protect   = 1
			dw_2.Object.price.protect     = 1
			dw_2.Object.rate_cash.protect = 1
	
			dw_1.object.do_rate.background.color   = 78682240
			dw_2.object.price.background.color     = 78682240
			dw_2.object.rate_cash.background.color = 78682240
		end if
			
		// 2. 송장삭제   : 저장(pb_delete)
		if IS_Permission[2] = "Y" then
			pb_delete.enabled =  true
		else
			pb_delete.enabled =  false   
		end if         
		
		// 3. 라인삭제   : 라인삭제(pb_print_part)
		if IS_Permission[3] = "Y" then
			pb_print_part.enabled = TRUE
		else
			pb_print_part.enabled = false
		end if         
		
		// 4. 수량변경   : 라인_출고수량(dw_2.ship_qty)
		if IS_Permission[4] = "Y" then
			dw_2.Object.ship_qty.protect = 0
			dw_2.Object.ship_qty.background.color = RGB(255,255,255)
		else
			dw_2.Object.ship_qty.protect = 1
			dw_2.Object.ship_qty.background.color = 78682240
		end if
					
		// 5. 업체변경   : 거래처변경(pb_compute)
		if IS_Permission[5] = "Y" then
			pb_compute.enabled = TRUE   
		else
			pb_compute.enabled = FALSE
		end if

      ////////////////////////////////////////////////////////////////////
		// 매출이월의 기준 : 출고일자(do_date) > 운반비일자(do_ship_date)
		////////////////////////////////////////////////////////////////////
		// 6. 기사변경   : 차량(driver),         운반비일자(do_ship_date), 이름/화물(rem)
		//                 운송자번호(do_dr_hp), 운송처주소(shipto_addr),  구분(do_car_gbn)
		// 이름/화물, 운송처주소 작성자와 수정자가 다른 경우 일부 오류 발생됨(2012/02/17)
		if IS_Permission[6] = "Y" then
			if ls_shipclose  = "C" then // 운반비 마감된 경우는
				dw_1.Object.driver.protect      = 1		// 차량
				dw_1.Object.do_ship_date.protect= 1		// 운반비일자
				dw_1.Object.rem.protect         = 1		// 이름/화물
				dw_1.Object.do_dr_hp.protect    = 1		// 운송자번호
				dw_1.Object.shipto_addr.protect = 1		// 운송처주소
				dw_1.Object.do_car_gbn.protect  = 1		// 구분
				
				dw_1.Object.driver.background.color      = 78682240
				dw_1.Object.do_ship_date.background.color= 78682240
				dw_1.Object.rem.background.color         = 78682240
				dw_1.Object.do_dr_hp.background.color    = 78682240
				dw_1.Object.shipto_addr.background.color = 78682240
				dw_1.Object.do_car_gbn.background.color  = 78682240
			else												// 운반비 오픈된 경우
				dw_1.Object.driver.protect      = 0		// 차량
			   dw_1.Object.do_ship_date.protect= 0		// 운반비일자
				dw_1.Object.rem.protect         = 0		// 이름/화물
				dw_1.Object.do_dr_hp.protect    = 0		// 운송자번호
				dw_1.Object.shipto_addr.protect = 0		// 운송처주소
				dw_1.Object.do_car_gbn.protect  = 0		// 구분

				dw_1.Object.driver.background.color      = RGB(255,255,255)
			   dw_1.Object.do_ship_date.background.color= RGB(255,255,255)
				dw_1.Object.rem.background.color         = RGB(255,255,255)
				dw_1.Object.do_dr_hp.background.color    = RGB(255,255,255)
				dw_1.Object.shipto_addr.background.color = RGB(255,255,255)
				dw_1.Object.do_car_gbn.background.color  = RGB(255,255,255)
			end if
		else
			dw_1.Object.driver.protect      		= 1	// 차량
			dw_1.Object.do_ship_date.protect		= 1	// 운반비일자
			dw_1.Object.rem.protect         		= 1	// 이름/화물
			dw_1.Object.do_dr_hp.protect    		= 1	// 운송자번호
			dw_1.Object.shipto_addr.protect 		= 1	// 운송처주소
			dw_1.Object.do_car_gbn.protect  		= 1	// 구분
			
			dw_1.Object.driver.background.color      = 78682240
			dw_1.Object.do_ship_date.background.color= 78682240
			dw_1.Object.rem.background.color         = 78682240
			dw_1.Object.do_dr_hp.background.color    = 78682240
			dw_1.Object.shipto_addr.background.color = 78682240
			dw_1.Object.do_car_gbn.background.color  = 78682240
		end if
	
		// 7. 운반비수정 : 운송비용(ship_amount), 운송방법(ship_flag), 현금,외상(shipamt_case)
		//                 부담사유(budam_desc),  사유2(budam_desc2)
		if IS_Permission[7] = "Y" then
			if ls_shipclose  = "C" then	// 운반비 마감된 경우
				dw_1.object.ship_amount.protect = 1			// 운송비용
				dw_1.object.ship_flag.protect   = 1			// 운송방법
				dw_1.object.shipamt_case.protect= 1			// 현금,외상
				dw_1.object.budam_desc.protect  = 1			// 부담사유	
				dw_1.object.budam_desc2.protect = 1			// 사유2
				
				dw_1.object.ship_amount.background.color  = 78682240
				dw_1.object.ship_flag.background.color    = 78682240
				dw_1.object.shipamt_case.background.color = 78682240
				dw_1.object.budam_desc.background.color   = 78682240
				dw_1.object.budam_desc2.background.color  = 78682240
			else													// 운반비 오픈된 경우
				dw_1.object.ship_amount.protect = 0			// 운송비용
				dw_1.Object.ship_flag.protect   = 0			// 운송방법
				dw_1.object.shipamt_case.protect= 0			// 현금,외상
				dw_1.object.budam_desc.protect  = 0			// 부담사유	
				
				dw_1.object.ship_amount.background.color  = RGB(255,255,255)
				dw_1.object.ship_flag.background.color    = RGB(255,255,255)
				dw_1.object.shipamt_case.background.color = RGB(255,255,255)
				dw_1.object.budam_desc.background.color   = RGB(255,255,255)				
				if dw_1.Object.ship_flag[1] = "D" OR dw_1.Object.ship_flag[1] = "B" then  // 운송방법(대여, 부담)
					dw_1.object.budam_desc2.protect = 0		// // 사유2
					dw_1.object.budam_desc2.background.color = RGB(255,255,255)
				else
					dw_1.object.budam_desc2.protect = 1		// // 사유2
					dw_1.object.budam_desc2.background.color = 78682240
				end if
			end if
		else	// 7. 운반비수정 권한
			dw_1.Object.ship_amount.protect    = 1		// 운송비용
			dw_1.Object.ship_flag.protect      = 1		// 운송방법
			dw_1.Object.shipamt_case.protect   = 1		// 현금,외상
			dw_1.object.budam_desc.protect     = 1    // 부담사유	
			dw_1.object.budam_desc2.protect    = 1		// // 사유2

			dw_1.Object.ship_amount.background.color  = 78682240
			dw_1.Object.ship_flag.background.color    = 78682240
			dw_1.Object.shipamt_case.background.color = 78682240
			dw_1.object.budam_desc.background.color   = 78682240
			dw_1.object.budam_desc2.background.color  = 78682240
		end if
		
      ////////////////////////////////////////////////////////////////////
		// 매출이월의 기준 : 출고일자(do_date) > 운반비일자(do_ship_date)
		////////////////////////////////////////////////////////////////////
		// 8. 출고일변경 : 출고일자(dw_1.do_date)
		if IS_Permission[8] = "Y" then
			dw_1.Object.do_date.protect = 0
			dw_1.Object.do_date.background.color = RGB(255,255,255)
		else
			dw_1.Object.do_date.protect = 1
			dw_1.Object.do_date.background.color = 78682240
		end if
		///////////////////////////////////////
		PB_SAVE.Enabled = TRUE	// 저장권한
		///////////////////////////////////////
	else	// 거래명세서_수정/삭제
		pb_save.enabled       = FALSE
		pb_delete.enabled     = FALSE   
		pb_insert.enabled     = FALSE   
		pb_compute.enabled    = FALSE   
		pb_print_part.enabled = FALSE   
		
		dw_2.object.price.protect      = 1
		dw_2.object.uom.protect        = 1
		dw_2.object.ship_qty.protect   = 1
		dw_2.object.stock_qty.protect  = 1
		dw_2.object.rate_cash.protect  = 1
		dw_2.object.issue_flag.protect = 1
		
		dw_1.modify("datawindow.readonly = Yes")
		dw_2.modify("datawindow.readonly = Yes")
		
		dw_1.object.do_date.background.color      = 78682240
		dw_1.object.do_ship_date.background.color = 78682240
		dw_1.object.rem.background.color          = 78682240
		dw_1.object.shipto_addr.background.color  = 78682240
		dw_1.object.ship_flag.background.color    = 78682240
		dw_1.object.driver.background.color       = 78682240
		dw_1.object.fob.background.color          = 78682240
		dw_1.object.shipamt_case.background.color = 78682240
		dw_1.object.do_case.background.color      = 78682240
		dw_1.object.ship_amount.background.color  = 78682240
		dw_1.object.do_rate.background.color      = 78682240
		dw_1.object.tel_no.background.color       = 78682240
		dw_1.object.budam_desc.background.color   = 78682240
		dw_1.object.sms_yn.background.color       = 78682240
		dw_1.object.do_jobdesc.background.color   = 78682240
				
		dw_2.object.uom.background.color          = 78682240
		dw_2.object.issue_flag.background.color   = 78682240
		dw_2.object.ship_qty.background.color     = 78682240
		dw_2.object.stock_qty.background.color    = 78682240
		dw_2.object.rate_cash.background.color    = 78682240
		dw_2.object.price.background.color        = 78682240
	end if  // SQLCA.SQLDBCODE = 0 
end if     // GF_PERMISSION('거래명세서_전체기능', gs_userid ) = 'Y'

if LeftA(dw_1.object.rem[1],13) = "매출할인_결재" then
	string ls_runid
	SELECT top 1 item_cd INTO :ls_runid FROM codemst WHERE type = '매출할인_결재_송장삭제' AND use_yn = 'Y';
	if gs_userid = ls_runid then
	else
		pb_delete.enabled = false
		dw_1.Object.rem.protect         		= 1	// 이름/화물
		dw_1.Object.rem.background.color    = 78682240
		MessageBox("확인","매출할인_결재 송장입니다.(삭제불가)",stopsign!)
	end if
else
	//pb_delete.enabled = true  //잘못된 로직 /* 2018.3.13 조원석 주석 처리 */
end if

/////////////////////////////////////////////////////////////////////
// 매출이월의 기준 : 출고일자(do_date) > 운반비일자(do_ship_date)
/////////////////////////////////////////////////////////////////////
if GF_PERMISSION('거래명세서_전체기능', gs_userid ) = 'Y' then
	if dw_1.object.ship_close[1] = "O" then
		dw_1.object.do_ship_date.protect = 0
		dw_1.object.do_ship_date.background.color = rgb(255,255,153)
	else
		dw_1.object.do_ship_date.protect = 1
		dw_1.object.do_ship_date.background.color = 78682240
	end if
else
	dw_1.object.do_ship_date.protect = 1
	dw_1.object.do_ship_date.background.color = 78682240
end if


///////////////////////////////////////////////////////////////////////
//// 거래명세서_수정(주요업무), 거래명세서 수정/삭제 이원화
///////////////////////////////////////////////////////////////////////
string   ls_orderno, ls_applyend
integer  li_days
datetime ldt_issuedate

ls_orderno = dw_1.object.do_no[1]

if GF_PERMISSION("거래명세서_수정(주요업무)", gs_userid) = "Y" then
	////////////////////////////////////
	// 결재유무
	////////////////////////////////////
	
	if gs_userid = '1999010s' then
		ls_applyend  = 'Y'
	else
	
		SELECT a.apply_end INTO :ls_applyend 
		  FROM dotrans  A
				 LEFT OUTER JOIN dotransdet B ON  a.trans_no  = b.trans_no
		 WHERE ( b.do_no = :ls_orderno )
		     and a.apply_end is not null;  
		 
	end if
	
	/*2020-11-02 jowonsuk */
	if gs_userid = '1999010s' then
		ls_applyend = "Y"
	end if
	 
	if ls_applyend = "Y" then	
		st_info.text   = "승인"
		pb_print_part.enabled = true		// 행삭제
		pb_insert.enabled  = true			// 행추가
		pb_delete.enabled  = true			// 송장삭제
		dw_2.object.ship_qty.TabSequence = 30	// 출고수량

//		pb_compute.enabled = false			// 거래처변경
		pb_save.enabled    = true

		dw_1.enabled = true
		dw_2.enabled = true
		dw_source.enabled = true
	else
		st_info.text   = "미결"
		pb_print_part.enabled = false		// 행삭제
		pb_insert.enabled  = false			// 행추가
		pb_delete.enabled  = false			// 송장삭제
		dw_2.object.ship_qty.TabSequence = 0	// 출고수량
		
//		pb_compute.enabled= false			// 거래처변경
		pb_save.enabled   = false			// Ctrl+S 사용할 수 있음
		
		dw_1.enabled = false
		dw_2.enabled = false
		dw_source.enabled = false
	end if

	////////////////////////////////////	
end if

RETURN

end subroutine

public function boolean wf_ewol (datawindow ad_do, datawindow ad_dodet);boolean lb_ewol

lb_ewol = false
if ad_do.rowcount()    < 1 then return lb_ewol
if ad_dodet.rowcount() < 1 then return lb_ewol

RETURN lb_ewol

end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////////////////////
// 담당자별 권한 내역                                                                              //
/////////////////////////////////////////////////////////////////////////////////////////////////////
// SELECT BIGO FROM CODEMST WHERE TYPE = '거래명세서_수정/삭제'                                    //
// Y,N,N,N,Y,Y,Y,Y  :  단가수정,송장삭제,라인삭제,수량변경,업체변경,기사변경,운반비수정,출고일변경 //
/////////////////////////////////////////////////////////////////////////////////////////////////////
dw_source.settransobject(sqlca)
dw_source.visible = false
is_sno = ''
is_sh  = ''
is_nm  = ''
is_js  = ''

string  ls_permission
SELECT  RTRIM(BIGO) INTO :ls_permission
  FROM  CODEMST
 WHERE  type     =  '거래명세서_수정/삭제' AND USE_YN = 'Y'	AND item_cd = :gs_userid;
st_permission.text = ls_permission

if isnull(ls_permission) or ls_permission = "" then
	pb_save.enabled = false
	MessageBox("확인", "거래명세서_수정/삭제 권한이 없습니다.")
end if

//////////////////////////////////////////////////////////////////////////////
string  ls_left, ls_top

ls_left = ProfileString("YCERP.INI","DO_PRT","LEFT", " ")
ls_top  = ProfileString("YCERP.INI","DO_PRT","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = "115"
if isnull(ls_top)  OR ls_top  = "" then ls_top  = "110"

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////


em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')
cbx_2.visible = false

dw_inaudit.visible = false
dw_7.visible = false
dw_8.visible = false
dw_9.visible = false

//dw_3.settransobject(sqlca)
dw_inaudit.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_3.getchild("scene_code", idwc_scene)

dw_1.getchild("driver", idwc_car)

idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")
dw_3.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)
dw_3.insertrow(0)

is_custscenesql = dw_4.describe("datawindow.table.select")

// 
em_3.text = LeftA(gs_area,1) + "D" + string(today(), "yyyymmdd") + "001"
em_3.SelectText(9, 6)
em_3.setfocus()
//cbx_9.triggerevent(clicked!)

string ls_loc
if GF_PERMISSION("거래명세서_기본공급자", gs_userid) = "Y" then
	SELECT bigo INTO :ls_loc  FROM  CODEMST
	 WHERE type = '거래명세서_기본공급자' AND item_cd = :gs_userid;
	if ls_loc  =  'S' or ls_loc  =  'D' or ls_loc  =  'H' or ls_loc  =  'B' then
		cbx_source.Checked  =  TRUE
		cbx_source.triggerevent(clicked!)
	else
		cbx_source.Checked  =  FALSE
	end if
end if

end event

on w_oidoupdate_m2.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_8=create dw_8
this.dw_9=create dw_9
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.dw_inaudit=create dw_inaudit
this.dw_7=create dw_7
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.em_3=create em_3
this.st_3=create st_3
this.cb_1=create cb_1
this.cbx_4=create cbx_4
this.cb_2=create cb_2
this.cbx_5=create cbx_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.gb_4=create gb_4
this.cbx_source=create cbx_source
this.dw_source=create dw_source
this.st_permission=create st_permission
this.cbx_6=create cbx_6
this.cbx_7=create cbx_7
this.cbx_8=create cbx_8
this.cbx_9=create cbx_9
this.st_2=create st_2
this.st_info=create st_info
this.st_left=create st_left
this.em_left=create em_left
this.st_9=create st_9
this.em_top=create em_top
this.gb_5=create gb_5
this.gb_8=create gb_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_8
this.Control[iCurrent+4]=this.dw_9
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.dw_inaudit
this.Control[iCurrent+9]=this.dw_7
this.Control[iCurrent+10]=this.cbx_2
this.Control[iCurrent+11]=this.cbx_3
this.Control[iCurrent+12]=this.em_3
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cbx_4
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cbx_5
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.gb_4
this.Control[iCurrent+21]=this.cbx_source
this.Control[iCurrent+22]=this.dw_source
this.Control[iCurrent+23]=this.st_permission
this.Control[iCurrent+24]=this.cbx_6
this.Control[iCurrent+25]=this.cbx_7
this.Control[iCurrent+26]=this.cbx_8
this.Control[iCurrent+27]=this.cbx_9
this.Control[iCurrent+28]=this.st_2
this.Control[iCurrent+29]=this.st_info
this.Control[iCurrent+30]=this.st_left
this.Control[iCurrent+31]=this.em_left
this.Control[iCurrent+32]=this.st_9
this.Control[iCurrent+33]=this.em_top
this.Control[iCurrent+34]=this.gb_5
this.Control[iCurrent+35]=this.gb_8
end on

on w_oidoupdate_m2.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_8)
destroy(this.dw_9)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.dw_inaudit)
destroy(this.dw_7)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.em_3)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.cbx_4)
destroy(this.cb_2)
destroy(this.cbx_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.gb_4)
destroy(this.cbx_source)
destroy(this.dw_source)
destroy(this.st_permission)
destroy(this.cbx_6)
destroy(this.cbx_7)
destroy(this.cbx_8)
destroy(this.cbx_9)
destroy(this.st_2)
destroy(this.st_info)
destroy(this.st_left)
destroy(this.em_left)
destroy(this.st_9)
destroy(this.em_top)
destroy(this.gb_5)
destroy(this.gb_8)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_source.width  = newwidth  - dw_source.x - gb_3.x

dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x


end event

event key;call super::key;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "거래명세서 내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	END IF
END IF

end event

type pb_save from w_inheritance`pb_save within w_oidoupdate_m2
integer x = 4946
integer y = 56
integer taborder = 60
end type

event pb_save::clicked;//
long    ll_row,   ll_inauditrow, li_oi_no, lll_row
int     li_count, li_chk,    li_int,   li_seq,     ll_do_seq, ll_saleseq, l_id
string  ls_date,  ls_do_no1, ls_do_no, ls_do_date, ls_seq,    ls_sale,    ls_case, ls_old_time
string  ls_loc,   ls_do_jobdesc
dec{4}  ld_remissue, ld_currship
decimal ld_ship_qty, l_amt, l_do_cash, l_ship_amount, ld_ship_tax_amount, ld_total, ld_tax_amount
string ls_ship_flag, ls_ship_case
boolean lb_ewol,  lb_goback
dwitemstatus l_status, l_jobdesc_status

if dw_1.Accepttext() <> 1 then return
if dw_2.Accepttext() <> 1 then return
if dw_1.rowcount() < 1 then return 
if dw_2.rowcount() < 1 then return 

///* 2020-07-30 jowonsuk 합계공급가액과 공급가액이 다를 경우 재계산하는 로직.시작 */
//l_amt = dw_2.object.compute_2[1] 
//l_do_cash = dw_1.object.do_cash[1]
//l_ship_amount = dw_1.object.ship_amount[1]
//
//ls_ship_flag = dw_1.object.ship_flag[1]
//ls_ship_case = dw_1.object.shipamt_case[1]
//
//if ls_ship_flag = 'D' then	
//	if ls_ship_case = 'C' then
//		l_ship_amount = 0
//	else
//		l_ship_amount = l_ship_amount
//	end if		
//else
//	l_ship_amount = 0
//end if
//
//if l_amt <> ( l_do_cash - l_ship_amount ) then
//	if MessageBox("확인","공급가액합계와 공급가액이 차이가 있습니다. 계산을 다시 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//		wf_calc2()
//	end if	
//end if
///* 2020-07-30 jowonsuk 합계공급가액과 공급가액이 다를 경우 재계산하는 로직.끝 */

/* 2022-01-7 jowonsuk 합계공급가액과 공급가액이 다를 경우 재계산하는 로직. 다시 반영 */
l_amt = dw_2.object.compute_1[1]
l_do_cash = dw_1.object.do_cash[1]
l_ship_amount = dw_1.object.ship_amount[1]
ld_total = dw_1.object.do_total[1]

ls_ship_flag = dw_1.object.ship_flag[1]
ls_ship_case = dw_1.object.shipamt_case[1]

ld_tax_amount = dw_1.object.do_rate[1]						/* 2022-07-05 jowonsuk 영세율 경우, 부가세가 0이면 체크를 한번 해주기 위해서 */

if isnull(ld_tax_amount) then
	ld_tax_amount = 0
end if 


if ls_ship_flag = 'D' then	
	if ls_ship_case = 'C' then
		l_ship_amount = 0
	else
		l_ship_amount = l_ship_amount
	end if		
else
	l_ship_amount = 0
end if

if l_ship_amount < 0 then
	ld_ship_tax_amount = truncate( truncate(l_ship_amount * 1.1 - 0.0000001, 0) - 0.0000001,0)
elseif l_ship_amount > 0 then
	ld_ship_tax_amount = truncate( truncate(l_ship_amount * 1.1 + 0.0000001, 0) + 0.0000001,0)
end if

//if l_amt <> ( l_do_cash - l_ship_amount ) then
/*2021-12-10 JOWONSUK 디테일합계와 마스터합계 차이 날때 재계산 */
/* (디테일 공급가 + 디테일 공급가vat ) - (마스터합계금액 - (운송비+운송비vat) ) 차이량이 1이 넘어가면 재계산 물어봄   */
/*2022-01-07 JOWONSUK 디테일합계와 마스터합계 차이 날때 재계산 오류 수정*/
/* (디테일 공급가 + 디테일 공급가vat ) - (마스터합계금액 - (운송비+운송비vat) ) 차이량이 1이 넘어가면 재계산 물어봄   */
//if abs( l_amt - (ld_total - ld_ship_tax_amount ) ) > 1  then
//	if MessageBox("확인","마스터 공급가액합계와 디테일 공급가액합계 차이로 계산을 다시 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//		wf_calc2()
//	end if	
//end if
/* 2022-01-7 jowonsuk 합계공급가액과 공급가액이 다를 경우 재계산하는 로직. 다시 반영.끝 */

if abs( l_amt - (ld_total - ld_ship_tax_amount ) ) > 1  then
	/* 2022-07-05 jowonsuk 부가세가 0일때 처리 로직 추가 */
	if ld_tax_amount = 0 then
		if MessageBox("확인","영세율 거래 명세서인가요?", Exclamation!, OKCancel!, 2) = 1 then
			if abs( l_amt - ld_total ) > 1 then
				if MessageBox("확인","마스터 공급가액합계와 디테일 공급가액합계 차이로 계산을 다시 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
					wf_calc2()
				end if	
			end if			
		else
			if MessageBox("확인","마스터 공급가액합계와 디테일 공급가액합계 차이로 계산을 다시 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				wf_calc2()
			end if				
		end if
	else
		if MessageBox("확인","마스터 공급가액합계와 디테일 공급가액합계 차이로 계산을 다시 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			wf_calc2()
		end if						
	end if
end if

//
/////////////////////////
// 출고일자 조정건
/////////////////////////
DateTime ld_cdodate,   ld_shipdate, ld_gftoday, ld_ship_date
Int      li_date30, li_today
string   ls_yymm1,  ls_yymm2, ls_yyyymm, ls_magam

lb_ewol    = false	// 매출이월
lb_goback  = false	// 소급
ld_cdodate = dw_1.object.do_date[1]		// 수정출고일자
//	id_fdodate  dw_1 RetrieveEnd 조회출고일자

/////////////////////////
// 출고단가 조정건
/////////////////////////
ls_yyyymm  = string(ld_cdodate, "yyyymm")
SELECT magam_yn INTO :ls_magam  FROM mmagam WHERE yyyymm  = :ls_yyyymm;
if ls_magam = "Y" then
	MessageBox("경고", "출고일자는 " + string(ld_cdodate,"yyyy/mm") + " 월 시스템 마감으로 수정불가 합니다.")  
	dw_1.setcolumn('do_date')
	dw_1.setfocus()
	RETURN
end if
/////////////////////////

// 변경내역
if isnull(dw_1.object.do_jobtype[1]) or dw_1.object.do_jobtype[1] = "JD000" then
	if string(dw_1.object.do_date[1],"yyyy/mm/dd") < "2014/03/01" then
		dw_1.object.do_jobtype[1] = "JD009"		// 기타
	else
		MessageBox("확인","변경내역을 반드시 선택하시기 바랍니다.")
		RETURN
	end if	
end if

choose case dw_1.object.do_jobtype[1]			// 변경내역
	case "JD005", "JD006", "JD007"
		if isnull(dw_1.object.do_jobdesc[1]) or trim(dw_1.object.do_jobdesc[1]) = "" then
			MessageBox("확인","[JD005, JD006, JD007]인 경우는 변경내역을 반드시 입력하시기 바랍니다.")
			RETURN
		end if
end choose
		
if GF_PERMISSION("거래명세서_매출이월", gs_userid) = "Y" then			// 30일 이상 한미란만 존재함
	if ld_cdodate <> id_fdodate then		// 수정출고일자, 조회출고일자
		ls_yymm1 = string(ld_cdodate,"yyyy") + string(ld_cdodate,"mm")	// 출고년월
		ls_yymm2 = string(id_fdodate,"yyyy") + string(id_fdodate,"mm") // 이전출고일
		if ls_yymm1 <> ls_yymm2 then lb_ewol   = true
		if ls_yymm1  < ls_yymm2 then lb_goback = true	// 소급
	end if
else	// 매출이월 권한이 없으면 30일 이상 이월불가	
	if ld_cdodate <> id_f_do_date then	// 수정출고일자, 실출고일자
		li_date30 = DaysAfter(date(ld_cdodate), date(id_f_do_date))
		if li_date30 <  0 then li_date30 = li_date30 * -1		// 반품인가?	
		if li_date30 > 30 then 		// 매출이월 30일 초과한 경우
			MessageBox("경고", "출고일자는 " + string(id_f_do_date,"yyyy/mm/dd") + " 부터 30일 범위내에서만 수정 가능합니다.")  
			dw_1.setcolumn('do_date')
			dw_1.setfocus()
			RETURN
		end if
		
		ls_yymm1 = string(ld_cdodate,"yyyy") + string(ld_cdodate,"mm")	// 출고년월
		ls_yymm2 = string(id_fdodate,"yyyy") + string(id_fdodate,"mm") // 이전출고일
		if ls_yymm1 <> ls_yymm2 then lb_ewol   = true	// 30일 이내 이월표시함(2013/11/26)
		if ls_yymm1  < ls_yymm2 then lb_goback = true	// 소급

		if date(ld_cdodate) > date(id_f_issue_date) then // 실출고일자
			ld_gftoday = GF_TODAY()
			li_today   = DaysAfter(date(id_f_issue_date), date(ld_cdodate))
			if li_today < 0 then li_today = li_today * -1
			if ( li_date30 < 31 and li_today < 31 ) then 
				// 출고일자 정상 처리 : 수정일자 범위는 -30일 부터 그리고 금일부터 30일 이내 수정가능 
			else
				MessageBox("경고", "매출일자 수정이나 이월된 매출을 수정하는 경우는 " + string(ld_gftoday,"yyyy/mm/dd") + " 부터 -30일 까지 처리가능 합니다.")  
				dw_1.setcolumn('do_date')
				dw_1.setfocus()
				RETURN
			end if
		end if
	end if

	// 출고일자 정상 처리 : 수정일자 범위는 금일부터 30일 이내
	/////////////////////////
	// 운반비 일자
	/////////////////////////
	ld_ship_date = dw_1.object.do_ship_date[1]
	if ld_ship_date <> id_f_issue_date then		// 운반비일자, 실출고일자
		li_date30 = DaysAfter(date(id_f_issue_date), date(ld_ship_date))
		if li_date30 < 0 then li_date30 = li_date30 * -1
		if li_date30 > 30 then // 운반비일자, 실출고일자 30일 초과한 경우
			MessageBox("경고", "운송비일자는 " + string(ld_cdodate,"yyyy/mm/dd") + " 부터 30일 범위내에서만 수정 가능합니다.")  
			dw_1.setcolumn('do_ship_date')
			dw_1.setfocus()
			RETURN
		end if
	end if
end if


li_count = wf_modifycount(dw_1) + wf_modifycount(dw_2) 
dw_inaudit.reset()
if li_count >= 1 then
	li_chk = MessageBox("확인", "변경된 내역을 저장하시겠습니까 ?", Question!, OKCancel!, 1)
   if li_chk = 1 then 
		string ls_shipflag, ls_budam_desc
		ls_shipflag   = dw_1.object.ship_flag[1]
		ls_budam_desc = dw_1.object.budam_desc[1]
		if ls_shipflag = 'B' and ( ls_budam_desc = 'BD000' or isnull(ls_budam_desc) or trim(ls_budam_desc) = '') then
			MessageBox("경고", "운송방법이 부담인 경우는 반드시 부담사유를 선택해주세요.",stopsign!,ok!)
			return
		end if
		
		l_jobdesc_status = dw_1.GetItemStatus(dw_1.GetRow(), "do_jobdesc", Primary!)	
		if l_jobdesc_status = Notmodified! then
			MessageBox("경고", "변경내역을 정확히 넣어 주십시요.")
			dw_1.setcolumn('do_jobdesc')
			dw_1.setfocus()
			return 
		end if
		
		ls_do_jobdesc = dw_1.object.do_jobdesc[dw_1.getrow()]
		if isnull(ls_do_jobdesc) or trim(ls_do_jobdesc) = "" then
			choose case dw_1.object.do_jobtype[1]			// 변경내역
				case "JD005", "JD006", "JD007"
					MessageBox("경고", "수정 및 삭제를 할경우, 반드시 변경내역을 입력하셔야 합니다.")
					dw_1.setcolumn('do_jobdesc')
					dw_1.setfocus()
					return 
			end choose
		else	// 수정사유 가 동일하면 오류.
			if is_type = trim(dw_1.object.do_jobtype[1]) then
				if is_jobdesc = trim(dw_1.object.do_jobdesc[1]) then
					MessageBox("경고", "수정 및 삭제를 할경우, 반드시 변경내역을 입력하셔야 합니다.")
					dw_1.setcolumn('do_jobdesc')
					dw_1.setfocus()
					RETURN 
				end if
			end if
		end if
	
		if ( (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) - 1) > dw_1.object.do_rate[1]  &
		  or (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) + 1) < dw_1.object.do_rate[1]) &
		  and not( dw_2.object.compute_4[1] = 0 and dw_1.object.do_rate[1] = 0) then
			MessageBox("경고", "부가세가 공급가액의 10%의 (±1원) 범위를 벗어 날수 없습니다.")
			return
		end if		

		//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
		GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
		//================================================================================================

		//출고번호 부여
		ls_date    = MidA(dw_1.object.do_no[1], 3,8)	
		ls_do_date = string(dw_1.object.do_date[1], "yyyymmdd")
		
		ls_do_no1 = dw_1.object.do_no[1]
		if ls_date <> ls_do_date then
			ls_do_no1 = LeftA(dw_1.object.do_no[1], 2) + ls_do_date + "-%"	
			SELECT max(do_no) INTO :ls_do_no FROM do WHERE do_no LIKE :ls_do_no1;		
			if isnull(ls_do_no) or ls_do_no = "" then
				ls_do_no1 = LeftA(ls_do_no1, 11) + "001"
			else
				li_seq = integer(MidA(ls_do_no, 12, 3))
				li_seq = li_seq + 1
				ls_seq = '00' + string(li_seq)
				ls_do_no1 = LeftA(ls_do_no1, 11) + RightA(ls_seq, 3)
			end if
			
			dw_1.object.do_no[1] = ls_do_no1
			for ll_row = 1 to dw_2.rowcount()
				dw_2.object.do_no[ll_row] = ls_do_no1
			next
		end if

		dw_1.object.issue_date[1] = dw_1.object.do_ship_date[1]		// 실출고일자
		ls_case = dw_1.object.do_case[1]

		
/*2020-11-02 JOWONSUK 주석처리. 시작 */		
//		for ll_row = 1 to dw_2.rowcount()
//			l_status = dw_2.getitemstatus(ll_row, 0, primary!)
			
//			if l_status = Notmodified! then CONTINUE
//			if dw_2.object.issue_flag[ll_row] = "Y" then CONTINUE
				
			
//			SELECT isnull(order_qty - rlse_qty, 0) INTO :ld_remissue 
//			  FROM saledet
//			 WHERE order_no = :ls_sale AND seq_no = :ll_saleseq;
			 
			 
//			/*2019.08.01 jowonsuk 로직변경 */ 					
//			ls_do_no = dw_2.object.do_no[ll_row]
//			li_oi_no = dw_2.object.oi_no[ll_row]
//			
//			select ship_qty
//				into :ld_ship_qty
//			from dodet
//			where do_no = :ls_do_no and oi_no = :li_oi_no;				 
//
//			if ld_remissue + ld_ship_qty < dw_2.object.ship_qty[ll_row] then
//				MessageBox("확인","잔량출고수량 보다 출고수량이 클수 없습니다.")
//				dw_2.setcolumn('ship_qty')
//				dw_2.setfocus()
//				dw_2.scrolltorow(ll_row)
//				return
//			end if

//		next
/*2020-11-02 JOWONSUK 주석처리. 끝 */		

		if ls_case <> 'C' and ls_case <> 'D' then
			for ll_row = 1 to dw_2.rowcount()
				l_status = dw_2.getitemstatus(ll_row, 0, primary!)
				
				/* 2019.04.15 jowonsuk */
				//if l_status = notModified! then CONTINUE
				
				if l_status = DataModified! then 
				
						dw_2.object.price[ll_row] = truncate(dw_2.object.price[ll_row], 2)
						/*if dw_2.object.issue_flag[ll_row] = 'Y' then CONTINUE*/
						
						/*2019.08.01 jowonsuk 로직변경 */ 					
						ls_do_no = dw_2.object.do_no[ll_row]
						li_oi_no = dw_2.object.oi_no[ll_row]
						
//						select ship_qty
//							into :ld_ship_qty
//						from dodet
//						where do_no = :ls_do_no and oi_no = :li_oi_no;				 		 						
						
						if dw_2.object.ship_qty[ll_row] <>  dw_2.object.ori_ship[ll_row] OR &
							dw_1.object.issue_date[1] <> dw_1.object.original_issue_date[1] then /*2018.12.28 jownsuk 반영*/				
							/*dw_1.GetItemdatetime(1, "issue_date", Primary!, TRUE) <> dw_1.GetItemdatetime(1, "issue_date", Primary!, FALSE) OR &*/
							/*dw_1.GetItemdatetime(1, "do_date", Primary!, TRUE) <> dw_1.GetItemdatetime(1, "do_date", Primary!, FALSE)*/  /*dw_1.GetItemdatetime(1, "do_date", Primary!, TRUE) <> dw_1.GetItemdatetime(1, "do_date", Primary!, FALSE)  jowonsuk 2018.06.12 반영 */
							//입출고내역저장
							ls_loc    = dw_2.object.loc_no[ll_row]
							ll_do_seq = dw_2.object.oi_no[ll_row]
							//l_status  = dw_2.getitemstatus(ll_row, 0, primary!)
							//if  l_status = DataModified!  then 
//								for li_count = 1 to 100000
//									if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//										ls_old_time  = string(now(),'hh:mm:ss:fff')	
//										exit
//									end if	
//								next
								
								ll_inauditrow = dw_inaudit.insertrow(0)
								dw_inaudit.object.inaudit_time[ll_inauditrow] = gf_today()
								dw_inaudit.object.inaudit_date[ll_inauditrow] = dw_1.object.original_issue_date[1]  /*dw_1.GetItemdatetime(1, "issue_date", Primary!, TRUE) 2018.12.28 jowonsuk 주석처리 */
								dw_inaudit.object.inaudit_item[ll_inauditrow] = dw_2.object.item_no[ll_row]
								dw_inaudit.object.qa[ll_inauditrow]           = dw_2.object.qa[ll_row]
								dw_inaudit.object.loc_no[ll_inauditrow]       = ls_loc
								dw_inaudit.object.inaudit_type[ll_inauditrow] = 'IS'
								dw_inaudit.object.order_no[ll_inauditrow]     = dw_2.getitemstring(ll_row, 'do_no', Primary!, TRUE)
								dw_inaudit.object.rcpt_qty[ll_inauditrow]     = 0
								dw_inaudit.object.issue_qty[ll_inauditrow]    = dw_2.object.ori_ship[ll_row] * -1
								dw_inaudit.object.cost[ll_inauditrow]         = dw_2.object.price[ll_row]
								dw_inaudit.object.destination[ll_inauditrow]  = dw_1.object.cust_no[1]
								dw_inaudit.object.rem[ll_inauditrow]          = dw_2.object.rem[ll_row]
								dw_inaudit.object.serial_id[ll_inauditrow]    = dw_2.object.coil_no[ll_row]
								if dw_2.object.cnt[ll_row] = 0 or isnull(dw_2.object.cnt[ll_row]) then
									dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.object.ship_qty[ll_row]
								else
									dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.object.ship_qty[ll_row] / dw_2.object.cnt[ll_row]
								end if
								dw_inaudit.object.com_qty[ll_inauditrow]      = dw_2.object.cnt[ll_row]
								dw_inaudit.object.cnt[ll_inauditrow]          = ll_do_seq		
								dw_inaudit.object.user_id[ll_inauditrow]      = gs_userid		
							//end if
							
//							for li_count = 1 to 100000
//								IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
//									ls_old_time  = string(now(),'hh:mm:ss:fff')	
//									exit
//								END IF	
//							NEXT
							
							ll_inauditrow = dw_inaudit.insertrow(0)
							dw_inaudit.object.inaudit_time[ll_inauditrow] = gf_today()
							dw_inaudit.object.inaudit_date[ll_inauditrow] = dw_1.GetItemdatetime(1, "issue_date", Primary!, FALSE)
							dw_inaudit.object.inaudit_item[ll_inauditrow] = dw_2.object.item_no[ll_row]
							dw_inaudit.object.qa[ll_inauditrow]           = dw_2.object.qa[ll_row]
							dw_inaudit.object.loc_no[ll_inauditrow]       = ls_loc
							dw_inaudit.object.inaudit_type[ll_inauditrow] = "IS"
							dw_inaudit.object.order_no[ll_inauditrow]     = ls_do_no1
							dw_inaudit.object.rcpt_qty[ll_inauditrow]     = 0
							dw_inaudit.object.issue_qty[ll_inauditrow]    = dw_2.object.ship_qty[ll_row]
							dw_inaudit.object.cost[ll_inauditrow]         = dw_2.object.price[ll_row]
							dw_inaudit.object.destination[ll_inauditrow]  = dw_1.object.cust_no[1]
							dw_inaudit.object.rem[ll_inauditrow]          = dw_2.object.rem[ll_row]
							if dw_2.object.cnt[ll_row] = 0 or isnull(dw_2.object.cnt[ll_row]) then
								dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.object.ship_qty[ll_row]
							else
								dw_inaudit.object.unit_qty[ll_inauditrow]  = dw_2.object.ship_qty[ll_row] / dw_2.object.cnt[ll_row]
							end if
							dw_inaudit.object.com_qty[ll_inauditrow]      = dw_2.object.cnt[ll_row]
							dw_inaudit.object.cnt[ll_inauditrow]          = ll_do_seq		
							dw_inaudit.object.user_id[ll_inauditrow]      = gs_userid		
						end if
						/* 2020.11.02 위치를 이곳으로 바꿈 */	
						dw_2.object.ori_ship[ll_row] = dw_2.object.ship_qty[ll_row] /* 2020.11.02 변경전 원본값을 변경 값으로 바꾼다. */
						
						ls_sale    = dw_2.object.sale_no[ll_row]
						ll_saleseq = dw_2.object.seq_no[ll_row]
						ls_do_no = dw_2.object.do_no[ll_row]		
						li_oi_no = dw_2.object.oi_no[ll_row]
						
						/*2019-10-30 jowonsuk 장기재고 로직  반영 */
						if dw_2.object.stock_qty[ll_row] > 0 then
						
							for lll_row = 1 to UpperBound(lstr_where_row[ll_row].qty3)         
								
								l_id = lstr_where_row[ll_row].qty1[lll_row]
								
								update itemstockout
								  set use_yn = 'Y'
								where id = :l_id;
								
								
								UPDATE itemstockdet
								SET out_qty = isnull(out_qty,0) + B.sale_qty,
										  qty  = qty - b.sale_qty ,
										  close_yn = (case when  qty - b.sale_qty = 0 then 'C' else 'O' end)	  
								FROM itemstockdet A inner JOIN (
																				  select seq, qty sale_qty
																				  from itemstockout
																				  where use_yn = 'Y'
																					AND id = :l_id
																			 ) B ON A.id = B.seq;				
								
									
							next						
						
						else 
							if dw_2.object.stock_o_qty[ll_row] > 0 then
								
								/*장기재고 사용했던값을 0으로 바꿈 기존 내용 지움 */
								l_id = lstr_where_row[ll_row].qty1[lll_row]
																
								UPDATE itemstockdet
								SET out_qty = isnull(out_qty,0) - B.qty,
										  qty  = in_qty + b.qty ,
										  close_yn = (case when  in_qty + b.qty = 0 then 'C' else 'O' end)	  
								FROM itemstockdet A inner JOIN (
																				  select seq, qty
																				  from itemstockout
																				  where use_yn = 'Y'
																					AND id = :l_id
																			 ) B ON A.id = B.seq;				
																			 
								delete itemstockout
								where id = :l_id;																											 
								
							end if
						
						end if
				end if						
				
			next
		end if
		
		// 품목삭제시 순번변경 로직 누락임
		
		/////////////////////////////////////////
		// 이월데이터 변경하기 
		/////////////////////////////////////////
		string   ls_applyYN, ls_applyDONO, ls_transday

		if lb_ewol = true then		// 출고일자 변경
         ////////////////////////////////////////////////			
			// 매출이월 결재정보 확인하기
         ////////////////////////////////////////////////			
			SELECT item_nm INTO :ls_transday FROM codemst WHERE item_cd = 'DOTRANS_DAY' AND use_yn = 'Y';
			if isnull(ls_transday) or ls_transday = "" then
			else
				if string(dw_1.object.do_date[1],"yyyy/mm/dd") >= ls_transday then
					ls_applyDONO = dw_1.object.do_no[1]		// 출고일자 변경된 출고번호(오류)
					ls_applyDONO = is_f_do_no					// 출고일자 변경전 출고번호
		
					SELECT a.apply_end INTO :ls_applyYN
					  FROM dotrans a LEFT OUTER JOIN dotransdet b ON a.trans_no = b.trans_no
					 WHERE b.do_no = :ls_applyDONO;
					if ls_applyYN = "Y" then
						// 매출이월 최종결재 완료					
					else
						MessageBox("확인","거래명세서_매출이관이월 결재정보가 없습니다.")
						dw_1.setcolumn('do_date')
						dw_1.setfocus()
						RETURN
					end if
				else
					// 매출이월 결재체크 안함
				end if
			end if
         ////////////////////////////////////////////////			
			dw_1.object.do_ewol[1] = "Y"
         ////////////////////////////////////////////////			
			
         // 기존 이월분 삭제하기
			if lb_goback = true then
				dw_1.object.do_ewol[1] = "N"
			end if
		end if
		/////////////////////////////////////////

		/////////////////////////////////////////
		// 거래명세서 수정/삭제 저장하기 
		/////////////////////////////////////////
		if wf_update3(dw_1, dw_2, dw_inaudit, "Y") = false then
			RETURN 
		end if
		/////////////////////////////////////////
		
		/////////////////////////////////////////
		// 변경 후 내용
		/////////////////////////////////////////
		is_t_do_no        = dw_1.object.do_no[1]
		is_t_do_user_id   = dw_1.object.do_user_id[1]
		is_t_do_area_no   = dw_1.object.do_area_no[1]
		is_t_do_case      = dw_1.object.do_case[1]
		id_t_do_date      = dw_1.object.do_date[1]
		id_t_issue_date   = dw_1.object.issue_date[1]
		idc_t_ship_amount = dw_1.object.ship_amount[1]
		is_t_ship_flag    = dw_1.object.ship_flag[1]
		idc_t_do_cash     = dw_1.object.do_cash[1]
		idc_t_do_rate     = dw_1.object.do_rate[1]
		idc_t_do_total    = dw_1.object.do_total[1]

		/////////////////////////////////////////
		// 출하번호 변경 메시지 전송
		/////////////////////////////////////////
		string  ls_merge, ls_pgmname
		integer li_seqno
		date    ld_today

		ls_pgmname = "주요업무"
		ls_merge = "송장:" + is_f_do_no + " 의 자료가 " + gs_username + " (" + gs_userid + ")에 의해 변경되었습니다."
		ls_merge = ls_merge + ' 변경내역:' + ls_do_jobdesc
		ld_today = date(gf_today())
		
		SELECT isnull(max(log_seq),0) + 1 INTO :li_seqno FROM do_log WHERE log_date = :ld_today;
		 
		INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date
		     , ship_amount, ship_flag, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code, pgm_name, contents)
		VALUES (convert(datetime, convert(nvarchar, getdate(), 120)), :li_seqno, :gs_userid, :is_f_do_no, :is_f_do_user_id, :is_f_do_area_no, :is_f_do_case, :id_f_do_date, :id_f_issue_date
		     , :idc_f_ship_amount, :is_f_ship_flag, :idc_f_do_cash, :idc_f_do_rate, :idc_f_do_total, null, :is_cust_no, :is_spot_code, :ls_pgmname, :ls_merge);
			  
		li_seqno++
		INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date
		     , ship_amount, ship_flag, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code, pgm_name, contents)
		VALUES (convert(datetime, convert(nvarchar, getdate(), 120)), :li_seqno, :gs_userid, :is_t_do_no, :is_t_do_user_id, :is_t_do_area_no, :is_t_do_case, :id_t_do_date, :id_t_issue_date
		     , :idc_t_ship_amount, :is_t_ship_flag, :idc_t_do_cash, :idc_t_do_rate, :idc_t_do_total, :ls_do_jobdesc, :is_cust_no, :is_spot_code, :ls_pgmname, :ls_merge);		
		COMMIT;
		/////////////////////////////////////////
   end if
	
else
	MessageBox("확인", "변경된 내역이 없습니다.")
end if

//pb_retrieve.postevent(clicked!)

end event

type dw_1 from w_inheritance`dw_1 within w_oidoupdate_m2
event ue_1 pbm_custom01
event ue_2 pbm_custom02
integer x = 864
integer y = 380
integer width = 3671
integer height = 776
integer taborder = 130
boolean enabled = false
string dataobject = "d_oigiupdate_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::ue_1;
dw_1.Accepttext()
dw_2.Accepttext()

//dw_1.object.do_cash[1]  = 0
//dw_1.object.do_rate[1]  = 0
//dw_1.object.do_total[1] = 0
//if dw_1.object.ship_flag[1] = 'D' AND dw_1.object.shipamt_case[1] = 'R' then
//	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]
//	if dw_1.object.sale_flag[1] <> 'E' then
//		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0)
//	end if
//end if
dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]



end event

event dw_1::ue_2;// 부가세 계산식
wf_calc()

end event

event dw_1::itemchanged;string  ls_shipclose, ls_car, ls_driver, ls_name, ls_cargo_name, ls_hp

This.AcceptText()

//// 운반비 마감여부( C : 마감, O : 오픈 )
//ls_shipclose = dw_1.object.ship_close[1]

choose case dwo.name
	case "do_cash", "do_rate"	// 공급가액, 부가세
		this.postevent("ue_1")
		
	case "driver"			// 차량
	  SELECT docar.driver, docar.name, docar.cargo_name, hp = (case when docar.hp is null then '' else docar.hp end)
		 INTO :ls_driver, :ls_name, :ls_cargo_name, :ls_hp
		 FROM docar  
		WHERE docar.open_close = 'O' AND docar.driver = :data;

		this.object.rem[1] = LeftA(ls_driver + "/" + ls_name + "/" + ls_cargo_name, 43)
		ls_car             = trim(ls_hp) + "/"
		this.object.shipto_addr[1] = ls_car + this.object.shipto_addr[1]		// 운송처주소

	case "ship_flag"		// 운송방법
      // A: 공사원가,B: 부담,C: 착불,D: 대여,
		// H: 화곡방문,M: 시화방문,P: 강건방문,T: 화성방문,Z: 대전방문
		// R: 재료원가
		choose case data
			case "M", "H", "T", "P", "Y"	//각 방문, Y:반월은 sort가 null
				this.object.shipamt_case[1] = 'C' //현금
			
			case "D", "R"	//부담,대여		
				this.object.shipamt_case[1]     = 'R'	//외상
			//	this.object.budam_desc2.protect = 0
			//	this.object.budam_desc2.background.color = RGB(255,255,255)

			case else
			//	this.object.budam_desc2.protect = 1
			//	this.object.budam_desc2.background.color = 78682240			
		end choose
		
		if data <> "B" then		// 2008/01/16 부담이 아닐 경우 부담사유 000 으로
			this.object.budam_desc[1] = 'BD000'
		end if
		this.postevent('ue_2')		

	case "do_jobtype"			// 변경내역
		this.object.do_jobdesc[1] = ""
		choose case data
			case "JD005", "JD006", "JD007"
				if isnull(this.object.do_jobdesc[1]) or trim(this.object.do_jobdesc[1]) = "" then
					MessageBox("확인","[JD005, JD006, JD007]인 경우는 변경내역을 반드시 입력하시기 바랍니다.")
				end if
		end choose
		
	case else
		this.postevent('ue_2')
end choose

end event

event dw_1::losefocus;//
this.accepttext()

end event

event dw_1::doubleclicked;//
if dwo.name = 'driver' then
	idwc_car.settransobject(sqlca)
	idwc_car.reset()
	idwc_car.retrieve()
end if

end event

event dw_1::itemerror;call super::itemerror;//
choose case dwo.name
	case "ship_amount"
		this.object.ship_amount[row] = 0

	case "do_rate"
		this.object.do_rate[row] = 0
end choose

RETURN 1
end event

event dw_1::retrieveend;call super::retrieveend;//
string ls_yyyymm, ls_magam
string ls_sale_control, ls_cust_chk
datetime ldt_date

setnull( ldt_date )
if this.rowcount() < 1 then
	id_fdodate        = ldt_date
	is_f_do_no        = ""
	is_f_do_user_id   = ""
	is_f_do_area_no   = ""
	is_f_do_case      = ""
	id_f_do_date      = ldt_date
	id_f_issue_date   = ldt_date
	idc_f_ship_amount = 0
	is_f_ship_flag    = ""
	idc_f_do_cash     = 0
	idc_f_do_rate     = 0
	idc_f_do_total    = 0

	is_cust_no        = ""
	is_spot_code      = ""
	is_type           = ""
	is_jobdesc        = ""
		
	ls_sale_control   = ""
	/////////////////////////////
	// 출고단가, 수량 마감체크
	/////////////////////////////
	ls_yyyymm  = string(id_fdodate, "yyyymm")
	SELECT magam_yn INTO :ls_magam  FROM mmagam WHERE yyyymm  = :ls_yyyymm;
	if ls_magam = "Y" then
		pb_save.enabled = false
	else
		pb_save.enabled = true
	end if
	/////////////////////////	
	RETURN
end if

if isnull(dw_1.object.do_no[1]) OR trim(dw_1.object.do_no[1]) = "" then
else
	/////////////////////////////////////////
	// 변경 전 내용 저장하기 
	/////////////////////////////////////////
	id_fdodate        = dw_1.object.do_date[1]	// 출고일자
	is_f_do_no        = dw_1.object.do_no[1]
	is_f_do_user_id   = dw_1.object.do_user_id[1]
	is_f_do_area_no   = dw_1.object.do_area_no[1]
	is_f_do_case      = dw_1.object.do_case[1]
	id_f_do_date      = dw_1.object.do_date[1]
	id_f_issue_date   = dw_1.object.issue_date[1]
	idc_f_ship_amount = dw_1.object.ship_amount[1]
	is_f_ship_flag    = dw_1.object.ship_flag[1]
	idc_f_do_cash     = dw_1.object.do_cash[1]
	idc_f_do_rate     = dw_1.object.do_rate[1]
	idc_f_do_total    = dw_1.object.do_total[1]

	is_cust_no        = dw_1.object.cust_no[1]
	is_spot_code      = dw_1.object.spot_code[1]
	is_type           = dw_1.object.do_jobtype[1]
	is_jobdesc        = dw_1.object.do_jobdesc[1]
		
	ls_cust_chk = this.object.cust_no[this.getrow()]
	SELECT isnull(sale_control,'N') INTO :ls_sale_control FROM customer WHERE cust_no = :ls_cust_chk;
	if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
		MessageBox("확인","매출통제 대상 거래처입니다.",stopsign!)
		return 1
	end if
	
	/////////////////////////////
	// 출고단가, 수량 마감체크
	/////////////////////////////
	ls_yyyymm  = string(id_fdodate, "yyyymm")
	SELECT magam_yn INTO :ls_magam  FROM mmagam WHERE yyyymm  = :ls_yyyymm;
	if ls_magam = "Y" then
		pb_save.enabled = false
	else
		pb_save.enabled = true
	end if
	/////////////////////////////
end if

dw_1.object.sms_yn[dw_1.getrow()] = "N" // SMS 방지
dw_1.object.sms_yn.TabSequence    = 0

end event

event dw_1::keydown;call super::keydown;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
if keyflags = 2 then
	if key = KeyS! then
		if MessageBox("확인", "거래명세서 내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	end if
end if

end event

type st_title from w_inheritance`st_title within w_oidoupdate_m2
integer y = 20
integer width = 1582
integer height = 128
string text = "거래명세서 수정(주요업무)"
end type

type st_tips from w_inheritance`st_tips within w_oidoupdate_m2
end type

type pb_compute from w_inheritance`pb_compute within w_oidoupdate_m2
integer x = 3639
integer y = 132
integer width = 425
integer height = 92
integer taborder = 200
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "거래처변경"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;call super::clicked;// 거래처 변경시 변경되어야 할 테이블의 cust_no
// do, sale, purdet, mpsdet, sfcday, ret
//w_whcustupdate_m
long ll_row, ll_cnt
gs_where lstr_where

ll_row = dw_1.getrow()
if ll_row < 1 then
	MessageBox("확인","출고번호를 선택하십시요")
	return
end if

lstr_where.str1 = dw_1.object.do_no[ll_row]
lstr_where.str2 = dw_1.object.cust_no[1]
lstr_where.str3 = dw_1.object.spot_code[1]
//if MessageBox("확인","출고번호[" + lstr_where.str1 + "]에 해당하는 모든 수주의 거래처를 변경 하시겠습니까?", &
//    Exclamation!, OKCancel!, 2) = 2 then return
OpenWithParm( w_whcustupdate_m, lstr_where )
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_3.object.cust_no[1]	  = lstr_where.str2
dw_3.object.scene_code[1] = lstr_where.str3

pb_retrieve.postevent(clicked!)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oidoupdate_m2
integer x = 5179
integer y = 1016
integer taborder = 30
string picturename = "c:\bmp\delete.bmp"
end type

event pb_print_part::mousemove;//
end event

event pb_print_part::clicked;call super::clicked;long   ll_row,   ll_do_seq, ll_dw2row
string ls_do_no, ls_del
string  ls_merge, ls_pgmname, ls_do_jobdesc
date    ld_today
integer li_seqno
	
dwitemstatus l_status, l_status1

dw_1.accepttext()
dw_2.accepttext()

ll_dw2row = dw_2.getrow()
IF ll_dw2row < 1 then RETURN

ls_do_no = dw_1.object.do_no[1]
IF isnull(ls_do_no) OR trim(ls_do_no) = '' THEN
	MessageBox("삭제", "선택된 출고번호가 없습니다.")
	RETURN
END IF

IF MessageBox("확인", "선택한 거래명세서 상세내역을 삭제하시겠습니까?~r~n" &
			+ "(*주의*) 확인즉시 삭제됩니다!!!", Question!, OKCancel!, 2) = 2 THEN	RETURN
			
ls_do_jobdesc = dw_1.object.do_jobdesc[1]
if isnull(ls_do_jobdesc) or trim(ls_do_jobdesc) = '' then
	MessageBox("경고", "수정 및 삭제를 할경우, 반드시 변경내역을 입력하셔야 합니다.")
	dw_1.setcolumn('do_jobdesc')
	dw_1.setfocus()
	RETURN 
end if

/*2020-12-24 jowonsuk 삭제, 수정을 동시할때 수정건이 inaudit 누락됨, 방지를 위해서 */
if dw_2.ModifiedCount( ) > 0 then
	MessageBox("경고", "수정과 삭제를 동시에 할 수 없습니다.")
	dw_2.retrieve(ls_do_no)
	RETURN
end if

dw_inaudit.reset()
ll_do_seq = dw_2.object.oi_no[ll_dw2row]

/*2020-11-02 jowonsuk 미수불체크 로직이 없음.시작 */
//ls_del = 'N'
//for ll_row = dw_2.rowcount() to 1 step -1
//	l_status = dw_2.getitemstatus(ll_row, 0, primary!)
//	
//	if l_status = Notmodified! then continue
//	if dw_2.object.issue_flag[ll_row] = 'N' then continue /*2020-11-02 항상 미수불체크를 해야 'Y'인데,  체크할 일이 없어 'N', 그러면 아래 로직을 행할일이 없음. */
//	dw_2.deleterow(ll_row)
//	ls_del = 'Y'
//next
//
//if ls_del = 'N' then
//	ll_dw2row = dw_2.getrow()
//	l_status = dw_2.getitemstatus(ll_dw2row, 0, primary!)
//	if l_status = New! or l_status = NewModified! then 
//		dw_2.deleterow(ll_dw2row)
//		RETURN
//	end if
//	
//	if wf_delete(ll_dw2row) = false then RETURN
//	
//	dw_inaudit.accepttext()
//	dw_2.deleterow(ll_dw2row)
//end if
/*2020-11-02 jowonsuk 미수불체크가 없음.끝 */

ll_dw2row = dw_2.getrow()
l_status = dw_2.getitemstatus(ll_dw2row, 0, primary!)
if l_status = New! or l_status = NewModified! then 
	dw_2.deleterow(ll_dw2row)
	RETURN
end if

if wf_delete(ll_dw2row) = false then RETURN

dw_inaudit.accepttext()
dw_2.deleterow(ll_dw2row)

dw_2.accepttext()
wf_calc()


if wf_update3(dw_1, dw_2, dw_inaudit, "Y") = true then
	ls_pgmname = "일상업무"
	ls_merge = '송장:' + is_f_do_no + ' 의 자료가 ' + gs_username + ' (' + gs_userid + ')에 의해 삭제 되었습니다.'
	ld_today = date(gf_today())
	
	SELECT isnull(max(log_seq),0) + 1 INTO :li_seqno FROM do_log WHERE log_date = :ld_today ;
	INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date
	     , ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code, pgm_name, contents)
	VALUES (convert(datetime, convert(nvarchar, getdate(), 120)), :li_seqno, :gs_userid, :is_f_do_no, :is_f_do_user_id, :is_f_do_area_no, :is_f_do_case, :id_f_do_date, :id_f_issue_date
	     , :idc_f_ship_amount, :idc_f_do_cash, :idc_f_do_rate, :idc_f_do_total, null, :is_cust_no, :is_spot_code, :ls_pgmname, :ls_merge);

	li_seqno++
	INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date
	     , ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code, pgm_name, contents)
	VALUES (convert(datetime, convert(nvarchar, getdate(), 120)), :li_seqno, :gs_userid, convert(varchar, :li_seqno - 1) + '번 삭제처리', null, null, null, null, null
	     , 0, 0, 0, 0, :ls_do_jobdesc, :is_cust_no, :is_spot_code, :ls_pgmname, :ls_merge);
	COMMIT;

	dw_4.retrieve()	
	if dw_4.rowcount() > 0  then
		ls_do_no = dw_4.object.do_no[dw_4.getrow()]
		dw_1.retrieve(ls_do_no)
		dw_2.retrieve(ls_do_no)	
	else
		IF dw_1.enabled = TRUE THEN
			messagebox("확인", "더 이상 만족하는 출고내역이 없습니다.")
			pb_cancel.enabled   = FALSE
			pb_save.enabled     = FALSE
			pb_delete.enabled   = FALSE
			pb_retrieve.enabled = TRUE
			
			dw_1.enabled = FALSE
			dw_2.enabled = FALSE
			dw_4.enabled = FALSE
			dw_3.enabled = TRUE
			dw_1.reset() ;	dw_2.reset() ;	dw_4.reset()
		END IF
	end if	
end if
end event

type pb_close from w_inheritance`pb_close within w_oidoupdate_m2
integer x = 5138
integer y = 56
integer taborder = 210
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oidoupdate_m2
integer x = 4741
integer y = 56
integer taborder = 220
end type

event pb_print::clicked;dwitemstatus l_status

l_status    = dw_1.getitemstatus(1, 0, primary!)
if l_status = Notmodified! then
else
	messagebox('확인', '저장 또는 다시 조회 후 출력하세요.')
	return
end if

string ls_c_chk
if cbx_source.checked = true then
	ls_c_chk = 'Y'
	// 공급자 변경 체크시 필수 선택
	IF is_sno = '' or IsNull(is_sno) or is_sh = '' or IsNull(is_sh) or is_nm = '' or IsNull(is_nm) THEN
		Messagebox('확인','공급자 변경을 체크하였으면 변경하고자 하는 사업장을 선택하셔야 합니다.')
		Return
	END IF				
else
	ls_c_chk = 'N'
end if

long ll_row
for ll_row = 1 to dw_2.getrow()
	l_status = dw_2.getitemstatus(ll_row, 0, primary!)
	if l_status = Notmodified! then
	else
		messagebox('확인', '저장 또는 다시 조회 후 출력하세요.')
		return
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_prt
string old_dwnm

old_dwnm = dw_9.dataobject

// DO_PRT 설정
string  ls_left, ls_top
ls_left = em_left.text ; ls_top  = em_top.text
		  
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

if cbx_6.checked = true then	// 명세
	dw_9.dataobject = 'd_oigiving_r_21_a5'
	dw_9.Modify('DataWindow.Print.Paper.Size = 11')
	dw_9.modify("DataWindow.print.margin.left = " + ls_left )
	dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_9.Modify('DataWindow.Print.Orientation = 1')
	dw_9.settransobject(sqlca)
	wf_print(dw_9)
	dw_9.print()
end if

if cbx_7.checked = true then	// 인수
	dw_9.dataobject = 'd_oigiving_r_22_a5'
	dw_9.Modify('DataWindow.Print.Paper.Size = 11')
	dw_9.modify("DataWindow.print.margin.left = " + ls_left )
	dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_9.Modify('DataWindow.Print.Orientation = 1')
	dw_9.settransobject(sqlca)
	wf_print(dw_9)
	dw_9.print()
end if

if cbx_8.checked = true then	// 출고
	dw_9.dataobject = 'd_oigiving_r_23_a5'
	dw_9.Modify('DataWindow.Print.Paper.Size = 11')
	dw_9.modify("DataWindow.print.margin.left = " + ls_left )
	dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_9.Modify('DataWindow.Print.Orientation = 1')		
	dw_9.settransobject(sqlca)
	wf_print(dw_9)
	dw_9.print()
end if

if cbx_9.checked = true then	// 납품
	dw_9.dataobject = 'd_oigiving_r_24_a5'
	dw_9.Modify('DataWindow.Print.Paper.Size = 11')
	dw_9.modify("DataWindow.print.margin.left = " + ls_left )
	dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_9.Modify('DataWindow.Print.Orientation = 1')
	dw_9.settransobject(sqlca)
	wf_print(dw_9)
	dw_9.print()
end if

dw_9.dataobject = old_dwnm


string ls_search_do_no
ls_search_do_no = trim(dw_1.object.do_no[1])
UPDATE do
   SET prt_date = getdate()
 WHERE do_no = :ls_search_do_no AND prt_date is null;
if sqlca.sqlcode = 0 then
	commit;
else
	rollback;
	messagebox('확인', '출력일시가 정상적으로 저장되지 않았습니다.~r~n전산실에 문의 하세요.')
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oidoupdate_m2
integer x = 4357
integer y = 56
integer taborder = 230
end type

event pb_cancel::clicked;integer li_count, li_chk

pb_cancel.enabled = FALSE
pb_save.enabled = FALSE
pb_delete.enabled = FALSE
pb_retrieve.enabled = TRUE
dw_1.enabled = FALSE
dw_2.enabled = FALSE
dw_4.enabled = FALSE
dw_3.enabled = TRUE
dw_1.reset()
dw_2.reset()		
dw_4.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_oidoupdate_m2
integer x = 4549
integer y = 56
integer taborder = 240
end type

event pb_delete::clicked;//
string ls_do_no, ls_case, ls_sms_yn, ls_s_area_no, ls_s_tel, ls_do_jobdesc
long   ll_row, ll_cnt
date   ldt_issue_date
dwitemstatus l_status, l_jobdesc_status

//dw_4.triggerevent(rowfocuschanged!)

if dw_1.rowcount() < 1 then return
dw_1.Accepttext()
dw_2.Accepttext()
dw_3.Accepttext()
dw_4.Accepttext()


ldt_issue_date =  date(dw_1.object.issue_date[1])
if isnull(ldt_issue_date) or ldt_issue_date < date('2000/01/01') then
	ldt_issue_date = date(dw_1.object.do_date[1])
end if

ls_do_no = dw_1.object.do_no[1]
if isnull(ls_do_no) OR trim(ls_do_no) = '' then
	MessageBox("삭제", "선택된 출고번호가 없습니다.")
	return
end if

SELECT count(*) INTO :ll_cnt FROM ret WHERE do_no = :ls_do_no;
if ll_cnt > 0 then
	MessageBox("확인", "반품된 거래명세서 입니다. 반품매출정리에서 조회후 삭제 바랍니다.")
	return
end if
ls_case = dw_1.object.do_case[1] 

IF MessageBox("확인", "거래명세서 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 THEN	return

ls_do_jobdesc = dw_1.object.do_jobdesc[1]
if isnull(ls_do_jobdesc) or trim(ls_do_jobdesc) = '' then
	MessageBox("경고", "수정 및 삭제를 할경우, 반드시 변경내역을 입력하셔야 합니다.")
	dw_1.setcolumn('do_jobdesc')
	dw_1.setfocus()
	return 
end if

l_jobdesc_status = dw_1.GetItemStatus(dw_1.GetRow(), "do_jobdesc", Primary!)	
if l_jobdesc_status = Notmodified! then
	MessageBox("경고", "변경내역을 정확히 넣어 주십시요.")
	dw_1.setcolumn('do_jobdesc')
	dw_1.setfocus()
	return 
end if


if ls_case = 'C' or ls_case = 'D' then
else
	dw_inaudit.reset()
	datetime ldt_old_time, ldt_getdate
	
	SELECT top 1 getdate() INTO :ldt_getdate FROM login;
	
	setnull(ldt_old_time)
	for ll_row = 1 TO dw_2.rowcount()
		if l_status = New! or l_status = NewModified! then continue
		if dw_2.object.issue_flag[ll_row] = 'Y' then continue
		
		Do While ldt_old_time = ldt_getdate
			SELECT top 1 getdate() INTO :ldt_getdate FROM login;
		Loop
		
		ldt_old_time = ldt_getdate
		////////////////////////////////////////////
		if wf_delete(ll_row) = false then return
		////////////////////////////////////////////
	next
end if

DELETE FROM do WHERE do_no = :ls_do_no;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("저장","출고헤더 삭제시 오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext), exclamation!)
	return
end if

// 이월분 삭제하기
DELETE dodet_ewol WHERE do_no = :is_f_do_no;
if SQLCA.SQLCode = 0 then
	DELETE do_ewol    WHERE do_no = :is_f_do_no;				
	if SQLCA.SQLCode = 0 then
		COMMIT;
	end if
end if

// 재고수불부
dw_inaudit.accepttext()
for ll_row = dw_2.rowcount() TO 1 step -1
	dw_2.deleterow(ll_row)
next

if wf_update2(dw_2, dw_inaudit,"Y") = true then
	string  ls_merge, ls_pgmname
	date    ld_today
	integer li_seqno
	
	ls_pgmname = "주요업무"
	ls_merge = '송장:' + is_f_do_no + ' 의 자료가 ' + gs_username + ' (' + gs_userid + ')에 의해 삭제 되었습니다.'
	ld_today = date(gf_today())
	
	SELECT isnull(max(log_seq),0) + 1 INTO :li_seqno FROM do_log WHERE log_date = :ld_today;
	
	INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date
	     , ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code, pgm_name, contents)
	VALUES (convert(datetime, convert(nvarchar, getdate(), 120)), :li_seqno, :gs_userid, :is_f_do_no, :is_f_do_user_id, :is_f_do_area_no, :is_f_do_case, :id_f_do_date, :id_f_issue_date
	     , :idc_f_ship_amount, :idc_f_do_cash, :idc_f_do_rate, :idc_f_do_total, null, :is_cust_no, :is_spot_code, :ls_pgmname, :ls_merge);

	li_seqno++
	INSERT INTO do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date
	     , ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code, pgm_name, contents)
	VALUES (convert(datetime, convert(nvarchar, getdate(), 120)), :li_seqno, :gs_userid, convert(varchar, :li_seqno - 1) + '번 삭제처리', null, null, null, null, null
	     , 0, 0, 0, 0, :ls_do_jobdesc, :is_cust_no, :is_spot_code, :ls_pgmname, :ls_merge);
	COMMIT;
	
	dw_4.retrieve()	
	if dw_4.rowcount() > 0  then
		ls_do_no = dw_4.object.do_no[dw_4.getrow()]
		dw_1.retrieve(ls_do_no)
		dw_2.retrieve(ls_do_no)	
	else
		IF dw_1.enabled = TRUE THEN
			MessageBox("확인", "더 이상 해당하는 출고내역이 없습니다.")
			pb_cancel.enabled   = FALSE
			pb_save.enabled     = FALSE
			pb_delete.enabled   = FALSE
			pb_retrieve.enabled = TRUE
			dw_1.enabled = FALSE
			dw_2.enabled = FALSE
			dw_4.enabled = FALSE
			dw_3.enabled = TRUE
			dw_1.reset() ;	dw_2.reset() ;	dw_4.reset()		
		END IF
	end if	
end if

end event

type pb_insert from w_inheritance`pb_insert within w_oidoupdate_m2
integer x = 4983
integer y = 1016
integer taborder = 260
end type

event pb_insert::mousemove;//
end event

event pb_insert::clicked;call super::clicked;gs_where2 lstr_where
long   ll_row, ll_cnt,  ll_row2, ll_oino
string ls_chk, ls_sale, ls_do

dw_2.accepttext()
dw_1.accepttext()
if dw_1.rowcount() < 1 then return

ll_row = dw_2.getrow()
if ll_row < 1 then
	MessageBox("확인","추가하려는 출고상세를 선택하십시요")
	return
end if

ls_sale = dw_2.object.sale_no[ll_row]
if messagebox("확인", "수주번호[" + ls_sale + "] 의 수주내역(출고수량=0)을 검색합니다. ~n~r" &
			+ "수주번호가 맞으면 [확인]을 누르십시요", Exclamation!, OKCancel!, 1) = 2 then return
lstr_where.chk = ls_sale
openwithparm(w_whsalenotindodet_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_2.setredraw(false)
ls_chk = 'N'
ls_do  = dw_1.object.do_no[1]
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_2.insertrow(0)
	if ls_chk = 'N' then
		ll_row2 = ll_cnt
		ls_chk  = 'Y'
		SELECT max(oi_no) INTO :ll_oino FROM dodet WHERE do_no = :ls_do;
	end if
	if isnull(ll_oino) or ll_oino = 0 then 
		MessageBox("오류","추가하려는 출고상세에 오류가 있습니다.")
		return
	else
		ll_oino = ll_oino + 1
		dw_2.object.oi_no[ll_cnt] = ll_oino
	end if
	
	dw_2.object.do_no[ll_cnt]        = ls_do
	dw_2.object.seq_no[ll_cnt]       = lstr_where.seq1[ll_row]
	dw_2.object.item_no[ll_cnt]      = trim(lstr_where.str1[ll_row])
	dw_2.object.item_name[ll_cnt]    = trim(lstr_where.name[ll_row])
	dw_2.object.qa[ll_cnt]           = trim(lstr_where.str2[ll_row])
	dw_2.object.ship_qty[ll_cnt]     = lstr_where.qty1[ll_row]
	dw_2.object.price[ll_cnt]        = lstr_where.qty2[ll_row]
	dw_2.object.aroi_qty[ll_cnt]     = 0
	dw_2.object.uom[ll_cnt]          = trim(lstr_where.str6[ll_row])
	dw_2.object.sale_no[ll_cnt]      = trim(lstr_where.str3[ll_row])
	dw_2.object.rate_cash[ll_cnt]    = truncate((lstr_where.qty2[ll_row] * lstr_where.qty1[ll_row]) / 10, 0)
	dw_2.object.loc_no[ll_cnt]       = dw_2.object.loc_no[ll_cnt - 1]
	dw_2.object.ori_ship[ll_cnt]     = 0
	dw_2.object.do_curr_code[ll_cnt] = 'WON'
	
	if lstr_where.qty2[ll_row] > 0 then
		dw_2.object.sort_qty[ll_cnt] = 0
	else
		dw_2.object.sort_qty[ll_cnt] = 1
	end if
	dw_2.object.tax_sign[ll_cnt]    = trim(lstr_where.str7[ll_row])
	dw_2.object.do_rem[ll_cnt]      = trim(lstr_where.str8[ll_row])
next
wf_calc()

dw_2.setredraw(TRUE)
dw_2.scrolltorow(ll_row2)
dw_2.setcolumn('ship_qty')
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidoupdate_m2
integer x = 4137
integer y = 56
integer taborder = 250
boolean enabled = false
string text = " "
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_cust_no, ls_scene_code, ls_where, ls_sql, ls_start, ls_end
string ls_printchk		// 매출유무(송장출력)
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

pb_save.enabled = FALSE             // 저장
dw_2.object.issue_flag.protect = 1  // 라인_미수불 권한
dw_2.object.issue_flag.background.color = 78682240

cb_1.default = false
dw_3.accepttext()

ls_cust_no    = dw_3.object.cust_no[1]   
ls_scene_code = dw_3.object.scene_code[1]

if GF_PERMISSION("거래명세서_작성부서", gs_team ) = "Y" Or GF_PERMISSION("거래명세서_수정/삭제", gs_userid ) = "Y" then
else
   integer li_custcnt
   SELECT count(*) INTO :li_custcnt
     FROM customer
    WHERE cust_no  = :ls_cust_no AND salesman = :gs_userid ;

   if li_custcnt < 1 then
      messagebox('확인','거래명세서_작성부서가 아니며, 해당 거래처의 담당자만 조회 가능합니다.')
      return
   end if

   dw_1.modify("datawindow.readonly = Yes")
   dw_2.modify("datawindow.readonly = Yes")
   cbx_2.enabled = false	// 가입고삭제
   cbx_3.enabled = false	// 재고대체삭제
   cbx_4.enabled = false	// 선택
   cbx_5.enabled = false	// 전체선택
	
   pb_compute.enabled    = false		// 거래처변경
   cb_2.enabled 		    = false		// 연속출력
   pb_insert.enabled     = false		// 품목추가
   pb_print_part.enabled = false    // 품목삭제
end if

ls_start = em_1.text
ls_end   = em_2.text

dw_4.reset()
dw_4.setredraw( false )


ls_printchk = 'N'			// 매출유무(송장출력)
if isnull(ls_scene_code) then
   ls_where = " WHERE invoice_print = ~~'" + ls_printchk + "~~'" + &
	           "   AND cust_no       = ~~'" + ls_cust_no  + "~~'" + &
              "   AND do_date BETWEEN ~~'" + ls_start    + "~~' and ~~'" + ls_end + "~~'"
else
   ls_where = " WHERE invoice_print = ~~'" + ls_printchk   + "~~'" + &
	           "   AND spot_code     = ~~'" + ls_scene_code + "~~'" + &
				  "   AND cust_no       = ~~'" + ls_cust_no    + "~~'" + &
              "   AND do_date BETWEEN ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'"
end if
ls_sql = "datawindow.table.select = '" + is_custscenesql + ls_where + "'"
dw_4.modify( ls_sql )
dw_4.retrieve()		// 출고목록
dw_4.setredraw( true )

if dw_4.rowcount() > 0 then
   dw_1.enabled        = true
   dw_2.enabled        = true
   dw_3.enabled        = false
   dw_4.enabled        = true   
	
   pb_cancel.enabled   = true
   pb_retrieve.enabled = false

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// 담당자별 권한 내역                                                                              //
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// SELECT BIGO FROM CODEMST WHERE TYPE = '거래명세서_수정/삭제'                                    //
	// 1 2 3 4 5 6 7 8                                                                                 //
	// Y,N,N,N,Y,Y,Y,Y  :  단가수정,송장삭제,라인삭제,수량변경,업체변경,기사변경,운반비수정,출고일변경 //
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	wf_permission()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oidoupdate_m2
integer x = 32
integer width = 5335
integer height = 136
integer taborder = 150
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oidoupdate_m2
integer x = 841
integer y = 352
integer width = 3726
integer height = 812
integer taborder = 170
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oidoupdate_m2
integer x = 4105
integer y = 8
integer width = 1257
integer height = 216
integer taborder = 90
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oidoupdate_m2
event ue_1 ( )
integer x = 32
integer y = 1176
integer width = 5339
integer height = 1188
integer taborder = 140
boolean enabled = false
string dataobject = "d_oigiupdate_m2"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::ue_1();//
wf_calc2()


end event

event dw_2::itemchanged;call super::itemchanged;//
this.accepttext()

choose case dwo.name
	case "price", "uom", "ship_qty"
		if this.object.tax_sign[row] = "Y" then
			if this.object.rlse_amount[row] < 0 then
				  /*2021.09.11 jowonsuk 부가세 소수점 빼면 총합 부가세 일의 자릿수 맞지 않는 문제 발생으로 detail 부가세는 소수점 1일의 자리수까지 받는 로직 변경*/
				  /*2021.10.06 jowonsuk 원복시킴*/				  
				dw_2.object.rate_cash[row] = truncate(dw_2.object.rlse_amount[row] / 10 - 0.0000001, 0)
			elseif this.object.rlse_amount[row] > 0 then
				dw_2.object.rate_cash[row] = truncate(dw_2.object.rlse_amount[row] / 10 + 0.0000001, 0)
			end if
		else
			dw_2.object.rate_cash[row] = 0
		end if
end choose

this.triggerevent('ue_1')

end event

event dw_2::itemerror;call super::itemerror;//
choose case dwo.name
	case 'stock_qty'
		this.object.stock_qty[row] = 0
		
	case 'rate_cash'
		this.object.rate_cash[row] = 0
		
	case 'price'
		this.object.price[row] = 0
		
	case 'ship_qty'
		this.object.ship_qty[row] = 0
end choose

return 1
end event

event dw_2::editchanged;call super::editchanged;//
this.AcceptText()
end event

event dw_2::losefocus;call super::losefocus;//
this.accepttext()
end event

event dw_2::keydown;call super::keydown;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "거래명세서 내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	END IF
END IF


end event

event dw_2::itemfocuschanged;call super::itemfocuschanged;//
choose case dwo.name
	case "price", "ship_qty"
		this.SelectText( 1, LenA(GetText()) )
end choose

end event

event dw_2::rbuttondown;call super::rbuttondown;long l_stock_qty = 0, ll_row
gs_where2 lstr_where
string ls_do_no, ls_sale_no
long l_seq_no, l_oi_no



choose case dwo.name
	case "stock_qty"	
		
		///////////////////////////////////////////////////////////////////
		// 다중추가 화면								  //
		///////////////////////////////////////////////////////////////////
		lstr_where.str1[1]    = this.object.item_no[row]
		lstr_where.str2[1]    = this.object.qa[row]
		lstr_where.str3[1]    = this.object.sale_no[row]		
		lstr_where.qty1[1]    = this.object.seq_no[row]
		lstr_where.chk	      = this.object.loc_no[row]
		lstr_where.str4[1]    = this.object.do_no[row]
		lstr_where.qty2[1]    = this.object.oi_no[row]	


		OpenWithParm( w_itemstockdet_w, lstr_where )
		lstr_where = Message.PowerObjectParm
		
		lstr_where_row[row] = Message.PowerObjectParm
		
		for ll_row = 1 to UpperBound(lstr_where_row[row].qty3)         
				l_stock_qty = l_stock_qty + lstr_where_row[row].qty3[ll_row] 		
		next

		this.object.stock_qty[row] = l_stock_qty
			
end choose	
end event

type dw_3 from datawindow within w_oidoupdate_m2
integer x = 1038
integer y = 264
integer width = 2528
integer height = 88
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_oigiuodate_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_cust_no, ls_where, ls_sql, ls_null
long   ll_cnt

this.accepttext()
CHOOSE CASE dwo.name
	CASE 'cust_no'
		ls_cust_no = data
		setnull(ls_null)
		this.object.scene_code[1] = ls_null
		
		this.getchild("cust_no", idwc_cust)
		SELECT count(*) INTO :ll_cnt FROM scene WHERE cust_no = :ls_cust_no;
		if ll_cnt > 0 then
			dw_3.getchild("scene_code", idwc_scene)
			// 19981126 이인호 속도증가를 위해 saledet뺌
			//ls_where = " AND sale.confirm_flag <> ~~'Y~~' AND saledet.saledet_text = ~~'N~~' AND sale.open_close <> ~~'C~~' AND scene.cust_no = ~~'" + &
			//           ls_cust_no + "~~' AND saledet.order_qty > saledet.rlse_qty "
			ls_where = " AND do.invoice_print = ~~'N~~' AND do.cust_no = ~~'" + ls_cust_no + "~~'"
			ls_sql   = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
			
			idwc_scene.modify(ls_sql)
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
		//	<statementblock>
END CHOOSE

pb_retrieve.enabled = true
this.setfocus()

end event

event losefocus;//
this.accepttext()

end event

type dw_4 from datawindow within w_oidoupdate_m2
integer x = 32
integer y = 448
integer width = 786
integer height = 716
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_oiupdateordno_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;integer li_count, li_idx,     li_chk
string  ls_locno, ls_orderno, ls_itemno, ls_itemqa, ls_where, ls_sql, ls_chk, ls_applyend
decimal ld_issue_qty

dw_1.Accepttext()
dw_1.reset()
dw_2.reset()

if isnull(currentrow) or currentrow < 1 then RETURN

if this.rowcount() > 0 then
	if isnull(this.object.do_no[currentrow]) then
	else
		ls_orderno = this.object.do_no[currentrow]
		dw_1.retrieve( ls_orderno )
		dw_2.retrieve( ls_orderno )	
		cbx_2.visible = true	// 가입고삭제
	//	cbx_3.visible = true // 재고대체삭제
	
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		// 담당자별 권한 내역                                                                              //
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		// SELECT BIGO FROM CODEMST WHERE TYPE = '거래명세서_수정/삭제'                                    //
		// 1 2 3 4 5 6 7 8                                                                                 //
		// Y,N,N,N,Y,Y,Y,Y  :  단가수정,송장삭제,라인삭제,수량변경,업체변경,기사변경,운반비수정,출고일변경 //
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		WF_Permission()
	end if
else
 	cbx_2.visible = false
//	cbx_3.visible = false
end if

///////////////////////////////////////////////////////////////////////
//// 거래명세서_수정(주요업무), 거래명세서 수정/삭제 이원화
///////////////////////////////////////////////////////////////////////
integer  li_days
datetime ldt_issuedate

//debugbreak()
ls_orderno = this.object.do_no[currentrow]
if GF_PERMISSION("거래명세서_수정(주요업무)", gs_userid) = "Y" then
	////////////////////////////////////
	// 결재유무
	////////////////////////////////////
	SELECT a.apply_end INTO :ls_applyend 
	  FROM dotrans  A
			 LEFT OUTER JOIN dotransdet B ON  a.trans_no  = b.trans_no
	 WHERE ( b.do_no = :ls_orderno ); 
	
	if ls_applyend = "Y" then	
		st_info.text   = "승인"
		pb_print_part.enabled = true		// 행삭제
		pb_insert.enabled  = true			// 행추가
		pb_delete.enabled  = true			// 송장삭제
		dw_2.object.ship_qty.TabSequence = 30	// 출고수량

		pb_compute.enabled= true			// 거래처변경
		pb_delete.enabled = true
		pb_save.enabled   = true

		dw_1.enabled = true
		dw_2.enabled = true
		dw_source.enabled = true
	else
		st_info.text   = "미결"
		pb_print_part.enabled = false		// 행삭제
		pb_insert.enabled  = false			// 행추가
		pb_delete.enabled  = false			// 송장삭제
		dw_2.object.ship_qty.TabSequence = 0	// 출고수량
		
		pb_compute.enabled= false			// 거래처변경
		pb_delete.enabled = false
		pb_save.enabled   = false			// Ctrl+S 사용할 수 있음
		
		dw_1.enabled = false
		dw_2.enabled = false
		dw_source.enabled = false
	end if

	////////////////////////////////////	
end if

//==============================
// 바쁘니까?
// 출고일자 0000/00/00 표기 방지
//==============================
dw_1.setcolumn("rem")
dw_1.setfocus()
// 트릭
dw_4.setcolumn("do_no")
dw_4.setfocus()
//==============================

end event

event retrieveend;//
IF this.rowcount() < 1 THEN
	messagebox("확인", "해당하는 출고내역이 없습니다.")
END IF

end event

event clicked;if row < 1 then return

this.scrolltorow(row)
if cbx_4.checked = true then
	this.SelectRow(row,  NOT this.IsSelected(row))
end if

// !!########-###
em_3.text = LeftA(this.object.do_no[row],10) + RightA(this.object.do_no[row],3)
end event

type dw_8 from datawindow within w_oidoupdate_m2
integer x = 686
integer width = 105
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_9 from datawindow within w_oidoupdate_m2
string tag = "d_oigiving_r_21_a5"
integer x = 795
integer width = 105
integer height = 80
integer taborder = 70
boolean bringtotop = true
string title = "d_oigiving_r1"
string dataobject = "d_oigiving_r_21_a5"
boolean livescroll = true
end type

type em_1 from editmask within w_oidoupdate_m2
integer x = 251
integer y = 268
integer width = 361
integer height = 76
integer taborder = 180
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_1 from statictext within w_oidoupdate_m2
integer x = 617
integer y = 280
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_oidoupdate_m2
integer x = 667
integer y = 268
integer width = 361
integer height = 76
integer taborder = 190
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_inaudit from datawindow within w_oidoupdate_m2
integer x = 905
integer width = 105
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oiupinaudit"
boolean livescroll = true
end type

type dw_7 from datawindow within w_oidoupdate_m2
string tag = "d_oigiving_r2"
integer x = 1015
integer width = 105
integer height = 80
integer taborder = 100
boolean bringtotop = true
string title = "d_oigiving_r3_2"
string dataobject = "d_oigiving_r2"
boolean livescroll = true
end type

type cbx_2 from checkbox within w_oidoupdate_m2
integer x = 2071
integer y = 384
integer width = 361
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "가입고삭제"
boolean checked = true
end type

type cbx_3 from checkbox within w_oidoupdate_m2
integer x = 2459
integer y = 384
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "재고대체삭제"
boolean checked = true
end type

type em_3 from editmask within w_oidoupdate_m2
integer x = 2034
integer y = 104
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


end event

event modified;cb_1.default = true
end event

type st_3 from statictext within w_oidoupdate_m2
integer x = 2048
integer y = 4
integer width = 270
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "출고번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_oidoupdate_m2
integer x = 2523
integer y = 96
integer width = 155
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;//
string ls_cust, ls_scene, ls_dono, ls_name
long   ll_row,  ll_found

//debugbreak()

ls_dono = TRIM(em_3.TEXT)
if isnull(ls_dono) or ls_dono = '' then return

setnull(ls_cust)
setnull(ls_scene)
SELECT cust_no, spot_code INTO :ls_cust, :ls_scene FROM do WHERE do_no = :ls_dono;
if sqlca.sqlcode = 100 then 
	pb_cancel.triggerevent(clicked!)
	em_3.SelectText(9, 2)
	em_3.setfocus()
	return
end if

if GF_PERMISSION("거래명세서_작성부서", gs_team ) = "Y" Or GF_PERMISSION("거래명세서_수정/삭제", gs_userid ) = "Y" then
else
   integer li_custcnt
   SELECT count(*) INTO :li_custcnt
     FROM customer
    WHERE cust_no  = :ls_cust  AND salesman = :gs_userid;

	if li_custcnt < 1 then
		messagebox('확인','해당 거래처의 담당자만 조회 가능합니다.')
		return
	end if

	dw_1.modify("datawindow.readonly = Yes")
	dw_2.modify("datawindow.readonly = Yes")
	cbx_2.enabled = false
	cbx_3.enabled = false
end if
// 추가끝1

dw_3.object.cust_no[1]    = ls_cust
dw_3.object.scene_code[1] = ls_scene
if isnull(ls_scene) or trim(ls_scene) = '' then
	dw_3.object.scene_code.background.color = 78682240
else
	dw_3.getchild("scene_code", idwc_scene)
	setnull(ls_name)
   SELECT scene_desc INTO :ls_name FROM scene WHERE cust_no = :ls_cust  AND scene_code = :ls_scene;
	if idwc_scene.rowcount() < 1 then
		idwc_scene.insertrow(1)
	end if
	idwc_scene.setitem(1, 'scene_code', ls_scene)
	idwc_scene.setitem(1, 'scene_desc', ls_name)
	dw_3.object.scene_code.background.color = RGB(255,255,255)
end if

this.default = false
em_1.text = MidA(em_3.text, 3,4) + '/' + MidA(em_3.text, 7,2) + '/' + MidA(em_3.text, 9,2)
em_2.text = MidA(em_3.text, 3,4) + '/' + MidA(em_3.text, 7,2) + '/' + MidA(em_3.text, 9,2)

pb_retrieve.enabled = true
pb_retrieve.triggerevent(clicked!)

ll_found = dw_4.Find( "do_no = '"+ ls_dono +"'", 1, dw_4.rowcount())
if ll_found = 0 then
	if dw_4.rowcount() > 0 then
		messagebox("확인", "검색한 출고번호가 없습니다.")
	end if
	em_3.SelectText(9, 2)
	em_3.setfocus()
else
	dw_4.scrolltorow(ll_found)
end if 

end event

event losefocus;this.default = false

end event

type cbx_4 from checkbox within w_oidoupdate_m2
integer x = 37
integer y = 180
integer width = 238
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "선택"
end type

event clicked;//
if this.checked = false then dw_4.SelectRow(0, this.checked)

end event

type cb_2 from commandbutton within w_oidoupdate_m2
integer x = 695
integer y = 168
integer width = 325
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "연속출력"
end type

event clicked;// 연속출력
long ll_row
datawindow dw_prt

if dw_4.rowcount() < 1 then return

// 공급자 변경 체크시 필수 선택
IF is_sno = '' or IsNull(is_sno) or is_sh = '' or IsNull(is_sh) or is_nm = '' or IsNull(is_nm) THEN
	MessageBox('확인','공급자 변경을 체크하셨으면 변경하고자 하는 사업장을 선택해야 합니다.')
	Return
END IF				

// DO_PRT 설정
string  ls_left, ls_top
ls_left = em_left.text ; ls_top  = em_top.text
		  
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

dw_1.setredraw(false)
dw_2.setredraw(false)
for ll_row = 1 to dw_4.rowcount()
	dw_4.scrolltorow(ll_row)
	if dw_4.IsSelected(ll_row) = false then continue
	
	if cbx_6.checked = true then	// 명세(1장)
		dw_9.dataobject = 'd_oigiving_r_21_a5'
		dw_9.Modify('DataWindow.Print.Paper.Size = 11')
		dw_9.modify("DataWindow.print.margin.left = " + ls_left )
		dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_9.Modify('DataWindow.Print.Orientation = 1')
		dw_9.settransobject(sqlca)
		wf_print(dw_9)
		dw_9.print()
	end if
	
	if cbx_7.checked = true then	// 인수
		dw_9.dataobject = 'd_oigiving_r_22_a5'
		dw_9.Modify('DataWindow.Print.Paper.Size = 11')
		dw_9.modify("DataWindow.print.margin.left = " + ls_left )
		dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_9.Modify('DataWindow.Print.Orientation = 1')
		dw_9.settransobject(sqlca)
		wf_print(dw_9)
		dw_9.print()			
	end if
		
	if cbx_8.checked = true then	// 출고
		dw_9.dataobject = 'd_oigiving_r_23_a5'
		dw_9.Modify('DataWindow.Print.Paper.Size = 11')
		dw_9.modify("DataWindow.print.margin.left = " + ls_left )
		dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_9.Modify('DataWindow.Print.Orientation = 1')
		dw_9.settransobject(sqlca)
		wf_print(dw_9)
		dw_9.print()			
	end if
	
	if cbx_9.checked = true then	// 납품
		dw_9.dataobject = 'd_oigiving_r_24_a5'
		dw_9.Modify('DataWindow.Print.Paper.Size = 11')
		dw_9.modify("DataWindow.print.margin.left = " + ls_left )
		dw_9.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_9.Modify('DataWindow.Print.Orientation = 1')
		dw_9.settransobject(sqlca)
		wf_print(dw_9)
		dw_9.print()
	end if
next

dw_1.setredraw(true)
dw_2.setredraw(true)

end event

type cbx_5 from checkbox within w_oidoupdate_m2
integer x = 320
integer y = 180
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;//
dw_4.SelectRow(0, this.checked)
end event

type cb_3 from commandbutton within w_oidoupdate_m2
string tag = "출고번호 SORT"
integer x = 32
integer y = 372
integer width = 265
integer height = 72
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "번호정렬"
end type

event clicked;dw_4.setsort("do_no")
dw_4.sort()

end event

type cb_4 from commandbutton within w_oidoupdate_m2
string tag = "출고순번 SORT"
integer x = 302
integer y = 372
integer width = 242
integer height = 72
integer taborder = 150
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "순번정렬"
end type

event clicked;dw_4.setsort("mid(do_no,3)")
dw_4.sort()

end event

type gb_4 from groupbox within w_oidoupdate_m2
integer x = 2002
integer y = 8
integer width = 713
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79220952
end type

type cbx_source from checkbox within w_oidoupdate_m2
integer x = 4613
integer y = 276
integer width = 585
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
	
	IF GF_PERMISSION('거래명세서_기본공급자', gs_userid) = 'Y' THEN
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
		is_sno = dw_source.object.reg_r[ll_row]
		is_sh  = dw_source.object.part_name[ll_row]
		is_nm  = dw_source.object.captain_name[ll_row]
		is_js  = dw_source.object.addr[ll_row]
		dw_source.ScrollToRow(ll_row)
	end if
else
	dw_source.visible = false
	is_sno = ''
	is_sh  = ''
	is_nm  = ''
	is_js  = ''
end if

end event

type dw_source from datawindow within w_oidoupdate_m2
integer x = 4599
integer y = 380
integer width = 763
integer height = 624
integer taborder = 90
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

type st_permission from statictext within w_oidoupdate_m2
string tag = "권한내용"
integer x = 3639
integer y = 36
integer width = 411
integer height = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
string text = "권한내용"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

event clicked;MessageBox('확인','----------------------------------------------------------------------------------------------~n' + &
                  '---->>> 거래명세서_수정/삭제(문의: 영업관리부)  ~n' + &
                  '~n' + &
                  '---->>>// 1. 단가수정   : 부가세, 라인_출고단가, 라인_환산출고수량 ~n~n' + &
                  '---->>>// 2. 송장삭제   : 저장 ~n~n' + &
                  '---->>>// 3. 라인삭제   : 라인삭제 ~n~n' + &
                  '---->>>// 4. 수량변경   : 라인_출고수량 ~n~n' + &
                  '---->>>// 5. 업체변경   : 거래처변경 ~n~n' + &
                  '---->>>// 6. 기사변경   : 차량, 이름/화물, 운송처주소, 구분 ~n~n' + &
                  '---->>>// 7. 운반비수정 : 운송비용, 운송방법, 현금,외상, 사유2(대여) ~n~n' + &
                  '---->>>// 8. 출고일변경 : 출고일자 ~n' + &
                  '----------------------------------------------------------------------------------------------  ')

end event

event getfocus;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"담당자별 권한내역 ",parent, li_x, li_y)

end event

type cbx_6 from checkbox within w_oidoupdate_m2
integer x = 2770
integer y = 68
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

type cbx_7 from checkbox within w_oidoupdate_m2
integer x = 2990
integer y = 68
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

type cbx_8 from checkbox within w_oidoupdate_m2
integer x = 2770
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

type cbx_9 from checkbox within w_oidoupdate_m2
integer x = 2990
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

type st_2 from statictext within w_oidoupdate_m2
integer x = 549
integer y = 372
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "계산서"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//
MessageBox('확인','거래명세서의 계산서번호가 지워지지 않은 오류입니다.~n~r' + &
           '계산서발행과, 계산서전송에 영향을 미치고 있습니다.')

end event

type st_info from statictext within w_oidoupdate_m2
integer x = 1664
integer y = 52
integer width = 306
integer height = 124
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
long textcolor = 128
long backcolor = 79220952
string text = "미결"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_left from statictext within w_oidoupdate_m2
integer x = 3287
integer y = 80
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "왼쪽"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_left from editmask within w_oidoupdate_m2
integer x = 3438
integer y = 68
integer width = 146
integer height = 64
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCERP.INI", "DO_PRT", "LEFT", ls_left)
SetProfileString("YCERP.INI", "DO_PRT", "TOP",  ls_top)

end event

type st_9 from statictext within w_oidoupdate_m2
integer x = 3287
integer y = 148
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상단"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_top from editmask within w_oidoupdate_m2
integer x = 3438
integer y = 136
integer width = 146
integer height = 64
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCERP.INI", "DO_PRT", "LEFT", ls_left)
SetProfileString("YCERP.INI", "DO_PRT", "TOP",  ls_top)

end event

type gb_5 from groupbox within w_oidoupdate_m2
integer x = 2729
integer y = 8
integer width = 507
integer height = 216
integer taborder = 30
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

type gb_8 from groupbox within w_oidoupdate_m2
integer x = 3250
integer y = 8
integer width = 375
integer height = 216
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력여백"
end type

