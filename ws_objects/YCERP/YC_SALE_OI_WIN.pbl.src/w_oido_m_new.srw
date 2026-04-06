$PBExportHeader$w_oido_m_new.srw
$PBExportComments$거래명세서작성(2003/09/08,이인호)
forward
global type w_oido_m_new from w_inheritance
end type
type gb_5 from groupbox within w_oido_m_new
end type
type gb_4 from groupbox within w_oido_m_new
end type
type dw_3 from datawindow within w_oido_m_new
end type
type dw_inaudit from datawindow within w_oido_m_new
end type
type dw_dodet from datawindow within w_oido_m_new
end type
type dw_8 from datawindow within w_oido_m_new
end type
type dw_5 from datawindow within w_oido_m_new
end type
type em_3 from editmask within w_oido_m_new
end type
type st_2 from statictext within w_oido_m_new
end type
type st_4 from statictext within w_oido_m_new
end type
type cbx_10 from checkbox within w_oido_m_new
end type
type cbx_source from checkbox within w_oido_m_new
end type
type dw_source from datawindow within w_oido_m_new
end type
type cbx_1 from checkbox within w_oido_m_new
end type
type cbx_2 from checkbox within w_oido_m_new
end type
type cbx_temp from checkbox within w_oido_m_new
end type
type st_1 from statictext within w_oido_m_new
end type
type cbx_3 from checkbox within w_oido_m_new
end type
type cbx_4 from checkbox within w_oido_m_new
end type
type pb_1 from picturebutton within w_oido_m_new
end type
type cbx_5 from checkbox within w_oido_m_new
end type
type cbx_6 from checkbox within w_oido_m_new
end type
type dw_4 from datawindow within w_oido_m_new
end type
type cbx_issue from checkbox within w_oido_m_new
end type
type sle_prt from singlelineedit within w_oido_m_new
end type
type dw_6 from datawindow within w_oido_m_new
end type
type cbx_ship from checkbox within w_oido_m_new
end type
type st_left from statictext within w_oido_m_new
end type
type em_left from editmask within w_oido_m_new
end type
type st_9 from statictext within w_oido_m_new
end type
type em_top from editmask within w_oido_m_new
end type
type st_3 from statictext within w_oido_m_new
end type
type st_pick from structure within w_oido_m_new
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oido_m_new from w_inheritance
integer y = 160
integer width = 4933
integer height = 2496
string title = "거래명세서 작성(w_oido_m_new)"
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
cbx_temp cbx_temp
st_1 st_1
cbx_3 cbx_3
cbx_4 cbx_4
pb_1 pb_1
cbx_5 cbx_5
cbx_6 cbx_6
dw_4 dw_4
cbx_issue cbx_issue
sle_prt sle_prt
dw_6 dw_6
cbx_ship cbx_ship
st_left st_left
em_left em_left
st_9 st_9
em_top em_top
st_3 st_3
end type
global w_oido_m_new w_oido_m_new

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

public subroutine wf_print (datawindow arg_dw);// 양식지 출력
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

if dw_1.rowcount() < 1 then RETURN

ls_orderno = dw_1.object.do_no[1]	
ls_dr  = trim(dw_1.object.rem[1]) + " " + trim(dw_1.object.do_dr_hp[1])
ll_idx = 0
ll_int = 0

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

for ll_count = 1 to dw_dodet.rowcount()
	if ll_idx = 0 then
		ll_int = ll_int + 1
		
		arg_dw.object.register[ll_int]     = is_sno
		arg_dw.object.saler_name[ll_int]   = is_sh
		arg_dw.object.saler_cap[ll_int]    = is_nm
		arg_dw.object.saler_addr[ll_int]   = is_js
		
      arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]

		if arg_dw.dataobject = 'd_oigiving_r_22_a5' then	// 인수증(A5)
			arg_dw.object.acc_24[1] = "*" + dw_1.object.do_no[1] + "*"
			arg_dw.object.acc_25[1] = "*" + dw_1.object.do_no[1] + "*"
		else
			arg_dw.object.ls_user[ll_int] = ls_username		// 출력자
		end if
 	   arg_dw.object.addr[ll_int]      = dw_1.object.shipto_addr[1]			// 운송처주소
   	arg_dw.object.tel[ll_int]       = dw_1.object.tel_no[1]					// 연락처
   	arg_dw.object.telno_cap[ll_int] = dw_1.object.telno_cap[1]				// 보조연락처
      arg_dw.object.scene[ll_int]     = dw_1.object.scene_scene_desc[1]		// 현장명
		
   	ls_cust_no = dw_1.object.cust_no[1]
	   SELECT register_no INTO :ls_cap_name FROM customer with(nolock) WHERE cust_no = :ls_cust_no;
	   arg_dw.object.cust[ll_int]     = dw_1.object.customer_cust_name[1]
   	arg_dw.object.cap_name[ll_int] = ls_cap_name

		string ls_salesphone, ls_time
      SELECT s.hp_no INTO :ls_salesphone
        FROM customer c with(nolock) 
             LEFT OUTER JOIN salehp S with(nolock) ON c.salesman = s.user_id 
       WHERE c.cust_no = :ls_cust_no;

		// 송천건업일 경우 매장전화번호 출력 
		if ls_cust_no = "U580" then 
			ls_salesphone = "(02)2690-1999"
			arg_dw.object.salesman[1]     = "유창영업담당: " + ls_salesphone
		else
			// 출력시간체크
			ls_time = string(gf_today(),"hh:mm")
			if ls_time >= "18:00" then
				arg_dw.object.salesman[1]     = "유창영업담당: " + ls_salesphone
			end if
		end if
	end if
	
	ll_idx     = ll_idx + 1
	ls_item_no = dw_dodet.object.item_no[ll_count]
   SELECT item_name INTO :ls_item_name  FROM groupitem with(nolock) WHERE item_no = :ls_item_no;	
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
     	ls_real_uom = 'EA'
  	else
		if ls_uom = "SS" then
			ls_real_uom = "SH"
			ls_uom = "M2"
		else
	     	ls_real_uom = ls_uom
		end if
	end if
   ///////////////////////////////////////////////////////////////////////////////////////////
	// 거래명세서/출고증의 비고에 생산일자또는 입고일자 또는 재고일자(출고일자)을 기록
	// ISO에 의한 시화 진달수 과장의 요청에의하여 추가 2000/06/13, easthero
   ///////////////////////////////////////////////////////////////////////////////////////////
	ls_desc    = dw_dodet.object.rem[ll_count]
	ls_sale_no = dw_dodet.object.sale_no[ll_count]
	li_seq_no  = dw_dodet.object.seq_no[ll_count]
	
	setnull(ld_date)
	
	SELECT max(sfc_date) INTO :ld_date  
	   FROM sfcday with(nolock) 
	WHERE sale_no = :ls_sale_no AND seq_no = :li_seq_no;
	
	if sqlca.sqlcode = 100 then
		/* 2018.08.22까지 사용 
		SELECT max(insp_date) INTO :ld_date 
		  FROM insp, inspdet, purdet
		 WHERE insp.insp_no    = inspdet.insp_no
		   AND purdet.order_no = inspdet.pur_no
			AND purdet.seq_no   = inspdet.seq_no
			AND purdet.sale_no  = :ls_sale_no
			AND purdet.sale_seq = :li_seq_no;
		*/	
		/*2018.08.23 jowonsuk 수정 */	
		SELECT max(insp_date) INTO :ld_date 
		  FROM insp with(nolock) inner join inspdet with(nolock) on  insp.insp_no    = inspdet.insp_no
				                                 inner join purdet  with(nolock) on 	purdet.order_no = inspdet.pur_no
										                                                   and purdet.seq_no   = inspdet.seq_no
		 WHERE purdet.sale_no  = :ls_sale_no
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
	
   if ll_idx = 0 then
		arg_dw.object.cash[ll_int] = ls_null
		arg_dw.object.vat[ll_int]  = ls_null
		arg_dw.object.tot_amount[ll_int] = ls_null
	end if		
next

// 운송비 대여청구
if dw_1.object.ship_flag[1] = 'D' and dw_1.object.shipamt_case[1] = 'R' then 
	if dw_1.object.ship_amount[1] <> 0 then
		if ll_idx = 0 then
			ll_int = ll_int + 1
					
			arg_dw.object.register[ll_int]     = is_sno
			arg_dw.object.saler_name[ll_int]   = is_sh
			arg_dw.object.saler_cap[ll_int]    = is_nm
			arg_dw.object.saler_addr[ll_int]   = is_js
	
			arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
			arg_dw.object.do_no[ll_int] = dw_1.object.do_no[1]
         if arg_dw.dataobject = 'd_oigiving_r_22_a5' then	// 인수증(A5)
				arg_dw.object.acc_24[1] = "*" + dw_1.object.do_no[1] + "*"
				arg_dw.object.acc_25[1] = "*" + dw_1.object.do_no[1] + "*"
			else
				arg_dw.object.ls_user[ll_int] = ls_username
			end if
			arg_dw.object.addr[ll_int]      = dw_1.object.shipto_addr[1]			// 운송처주소
			arg_dw.object.tel[ll_int]       = dw_1.object.tel_no[1]					// 연락처
			arg_dw.object.telno_cap[ll_int] = dw_1.object.telno_cap[1]  			// 보조연락처
			arg_dw.object.scene[ll_int]     = dw_1.object.scene_scene_desc[1]		// 현장명
			
			ls_cust_no = dw_1.object.cust_no[1]
			SELECT register_no INTO :ls_cap_name FROM customer with(nolock) WHERE cust_no = :ls_cust_no;
			arg_dw.object.cust[ll_int]     = dw_1.object.customer_cust_name[1]
			arg_dw.object.cap_name[ll_int] = ls_cap_name
		end if
		
		ll_idx = ll_idx + 1
		ls_ship_cash = string(dw_1.object.ship_amount[1], '#,###,###,##0')
		ls_ship_vat  = string(truncate(dw_1.object.ship_amount[1] / 10 + 0.0000001, 0 ), '#,###,###,##0')	
		if dw_1.object.do_rate[1] <> 0 then
		else
			ls_ship_vat = '           0'
		end if
		
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

// 2014/10/20
if ll_int > arg_dw.rowcount() then
	INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del)
	VALUES (:gs_userid, '1999010s', getdate(), '송장출력ERROR: ' +:ls_orderno, 'N');	
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
	dw_1.object.do_rate[1] = truncate((dw_1.object.do_cash[1] / 10) + 0.0000001, 0) 
elseif dw_1.object.do_cash[1] < 0 then
	dw_1.object.do_rate[1] = truncate((dw_1.object.do_cash[1] / 10) - 0.0000001, 0) 
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

public subroutine wf_locno (string arg_docase);// 저장소
string  ls_where, ls_itemno, ls_itemqa, ls_sql, ls_select, ls_dwname
//datawindowchild ldwc_lot

dw_2.setredraw(false)
if arg_docase <> 'C' then	// 미수불(C)
   ls_dwname = dw_2.Describe("loc_no.dddw.name")
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
		idwc_locno.setredraw( false )
		idwc_locno.insertrow(1)
		idwc_locno.settransobject(sqlca)
		idwc_locno.setredraw( true )
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
		idwc_locno.setredraw( false )
		idwc_locno.settransobject(sqlca)
		idwc_locno.retrieve()
		idwc_locno.setredraw( true )
	else
		dw_2.getchild("loc_no", idwc_locno)
	end if
	
	idwc_locno.SetSort("loc_name")
	idwc_locno.Sort( )
end if

dw_2.accepttext()
dw_2.setredraw( true )

RETURN


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

event open;call super::open;// "log_date" 는 schema 기본값으로 설정됨
//
//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// d_oi_do_m_test_prt11    WIDTH = 4713
// d_oi_do_m_test_prt22    WIDTH = 4713
// d_oi_do_m_test_prt33    WIDTH = 4713
// d_oi_do_m_test_prt44    WIDTH = 4713

//////////////////////////////////////////////////////////////////////////////
string  ls_left, ls_top

ls_left = ProfileString("YCERP.INI","DO_PRT","LEFT", " ")
ls_top  = ProfileString("YCERP.INI","DO_PRT","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = "115"
if isnull(ls_top)  OR ls_top  = "" then ls_top  = "110"

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////
sle_prt.enabled = false

string ls_loc

dw_source.settransobject(sqlca)
dw_source.visible = false
is_sno = "" ; is_sh  = "" ; is_nm  = "" ; is_js  = ""

dw_6.SetTransObject( SQLCA )
dw_6.visible = false

dw_3.SetTransObject( SQLCA )
dw_4.SetTransObject( SQLCA )		// 봉투
//dw_dodet_m.SetTransObject( SQLCA )
dw_inaudit.SetTransObject( SQLCA )
dw_dodet.SetTransObject( SQLCA )

dw_3.insertrow(0)
dw_3.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

dw_3.getchild("scene_code", idwc_scene)
idwc_scene.insertrow(1)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_1.getchild("driver", idwc_car)

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
dw_4.visible       = false		// 봉투
dw_5.visible       = false
dw_dodet.visible   = false
dw_8.visible       = false

// 출고의뢰작성 활성화는 수주관리에서 함
pb_insert.enabled  = false

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

//
if GF_PERMISSION('거래명세서_30일체크', gs_userid) = 'Y' then	
	cbx_temp.enabled = true
else
	cbx_temp.enabled = false
end if
//
if GF_PERMISSION('출고의뢰서_체크제외', gs_userid) = 'Y' then	
	cbx_issue.enabled = true
else
	cbx_issue.enabled = false
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

on w_oido_m_new.create
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
this.cbx_temp=create cbx_temp
this.st_1=create st_1
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.pb_1=create pb_1
this.cbx_5=create cbx_5
this.cbx_6=create cbx_6
this.dw_4=create dw_4
this.cbx_issue=create cbx_issue
this.sle_prt=create sle_prt
this.dw_6=create dw_6
this.cbx_ship=create cbx_ship
this.st_left=create st_left
this.em_left=create em_left
this.st_9=create st_9
this.em_top=create em_top
this.st_3=create st_3
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
this.Control[iCurrent+16]=this.cbx_temp
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.cbx_3
this.Control[iCurrent+19]=this.cbx_4
this.Control[iCurrent+20]=this.pb_1
this.Control[iCurrent+21]=this.cbx_5
this.Control[iCurrent+22]=this.cbx_6
this.Control[iCurrent+23]=this.dw_4
this.Control[iCurrent+24]=this.cbx_issue
this.Control[iCurrent+25]=this.sle_prt
this.Control[iCurrent+26]=this.dw_6
this.Control[iCurrent+27]=this.cbx_ship
this.Control[iCurrent+28]=this.st_left
this.Control[iCurrent+29]=this.em_left
this.Control[iCurrent+30]=this.st_9
this.Control[iCurrent+31]=this.em_top
this.Control[iCurrent+32]=this.st_3
end on

on w_oido_m_new.destroy
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
destroy(this.cbx_temp)
destroy(this.st_1)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.pb_1)
destroy(this.cbx_5)
destroy(this.cbx_6)
destroy(this.dw_4)
destroy(this.cbx_issue)
destroy(this.sle_prt)
destroy(this.dw_6)
destroy(this.cbx_ship)
destroy(this.st_left)
destroy(this.em_left)
destroy(this.st_9)
destroy(this.em_top)
destroy(this.st_3)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_source.width = newwidth  - dw_source.x - gb_3.x

dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

//
dw_6.width  = 3584
dw_6.height = 1360
dw_6.x      = (newwidth  - dw_6.width) / 2
dw_6.y      = (newheight - dw_6.height) / 2

end event

event activate;call super::activate;//
if GF_PERMISSION('출고의뢰서_체크제외', gs_userid) = 'Y' then	
	cbx_issue.enabled = true
else
	cbx_issue.enabled = false
end if

end event

event closequery;call super::closequery;//
if MessageBox("확인", "작업을 종료 하시겠습니까?", Question!, YesNo!) = 2 then
	RETURN 1
else
	RETURN 0
end if
end event

type pb_save from w_inheritance`pb_save within w_oido_m_new
event gi_print pbm_uonexternal01
integer x = 4133
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

event pb_save::clicked;// 저장
DataWindowChild dwc1, ldwc_driver

string   ls_chk,  ls_do_no, ls_do_no1,  ls_sale_flag, ls_do_date,   ls_seq,     ls_null
string   ls_item, ls_qa,    ls_qa_cust, ls_loc,       ls_old_time,  ls_cust_no, ls_month, ls_area,  ls_sale
string   ls_lot,  ls_oc,    ls_case,    ls_do_dr_hp,  ls_fitno,     ls_orderno

string   ls_car_text
string   ls_s_cust_name, ls_s_scene_desc, ls_s_do_date,  ls_driver, ls_driverdw1, ls_cargubun, ls_itemcd
string   ls_s_hp_no,     ls_s_scene_tel,  ls_s_cust_tel, ls_callback, ls_s_msg, ls_csmsg, ls_s_hp_no1

string   ls_sale_control, ls_cust_chk, ls_spot_code, ls_timearrival, ls_gubun


int      li_int,  li_seq,   ll_row,  ll_int,       li_count,  li_saleseq
long     ll_year, ll_inauditrow,     ll_coilcnt,   ll_cnt,    ll_receiptid,  ll_fitseq
decimal  ld_qoh,  ld_qty,            ld_do_amount, ld_rcpt,   ld_order_qty,  ld_issue_qty, ld_shipqty, ld_dototal
decimal  ld_issueqty_org

datetime ldt_today, ldt_etime
boolean  lb_chk, lb_mmssend 

dw_dodet.reset()		// 출고
dw_inaudit.reset()	// 재고

dw_1.AcceptText()
dw_2.AcceptText()

//dw_dodet_m.AcceptText()
dw_inaudit.AcceptText()
dw_dodet.AcceptText()
dw_source.AcceptText()

setnull(ls_null)
ls_chk = 'N'

// 운송처 주소
cbx_ship.checked = true
cbx_ship.triggerevent( clicked! )

ls_spot_code = dw_1.object.spot_code[dw_1.getrow()]
if isnull(ls_spot_code) or ls_spot_code = "" then // 출고현장
	MessageBox("저장오류","출고현장은 반드시 선택하시기 바랍니다.",stopsign!)
	RETURN
end if

ls_cust_chk = dw_1.object.cust_no[dw_1.getrow()]
SELECT isnull(sale_control,'N') INTO :ls_sale_control FROM customer WHERE cust_no = :ls_cust_chk;
if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
	MessageBox("저장오류","매출통제 대상 거래처입니다. ~r~n~n" + "영업지원팀에 문의 바랍니다.!",stopsign!)
	RETURN
end if

//////////////////////////////////
// 출고일자 CHECK(금일부터 30일)
//////////////////////////////////
DateTime ldt_dodate,   ldt_gftoday
Int      li_today, li_todaycnt

ldt_etime      = dw_1.object.time_arrival[dw_1.getrow()]
ls_timearrival = string(ldt_etime, "yyyy/mm/dd")
if isnull(ls_timearrival) OR ls_timearrival = "" then // 도착예정
   ls_driverdw1 = dw_1.object.driver[dw_1.getrow()]
	
	dw_1.GetChild('driver', ldwc_driver)
	ls_driver   = ldwc_driver.getitemstring(ldwc_driver.getrow(),'driver')
	ls_cargubun = dw_1.object.do_car_gbn[1]

	if isnull(ls_driverdw1) OR ls_driverdw1 = "" OR PosA(ls_driver,"택배") > 0 OR ls_cargubun > "07" then
	else
		SELECT item_cd INTO :ls_itemcd FROM codemst WHERE type = '도착예정시간_사용' AND use_yn = 'Y';
		if string(gf_today(),"yyyy/mm/dd") > ls_itemcd then 
			MessageBox("저장오류","도착예정 시간은 반드시 입력하시기 바랍니다.",stopsign!)
			dw_1.setcolumn( "time_arrival")
			RETURN
		end if
	end if
end if


ldt_dodate  = dw_1.object.do_date[1]		// 출고일자
ldt_gftoday = GF_TODAY()						// 시스템일자
if date(ldt_dodate) <> date(ldt_gftoday) then
	li_today = DaysAfter(date(ldt_gftoday), date(ldt_dodate))
	
	if li_today > 0 then
		if MessageBox("경고", "정상적인 작업처리가 아니면 출고일자를 금일자 이후로 발행하면 안됩니다.~n~n" + &
		              "그래도 작업을 계속 하시겠습니까?" , Exclamation!, OKCancel!, 2) = 2 then
			RETURN
		end if
	end if
	
	if li_today <  0 then li_today = li_today * -1  // 반품, 출고누락인가?
	
	SELECT sort INTO :li_todaycnt FROM codemst WHERE type = '거래명세서_30일체크' AND use_yn = 'Y';
	//if li_today < 31 then 
	if li_todaycnt < li_today then
		// 출고일자 정상처리 : 금일부터 30일 이내 수정가능 
	else
		MessageBox("경고", "출고일자는 금일(" + LeftA(string(ldt_gftoday),10) + ") 부터 30일(이전, 이후) 까지만 처리가능 합니다.")  
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
if ls_shipflag = "B" AND ( ls_budam_desc = "BD000" OR  isnull(ls_budam_desc) OR trim(ls_budam_desc) = "") then
	MessageBox("경고", "운송방법이 부담인 경우는 반드시 부담사유를 선택해주세요.",stopsign!,ok!)
	RETURN
end if
//////////////////////////////////

//////////////////////////////////
// [착불]과 이름/화물 CHECK
//////////////////////////////////
if dw_1.object.ship_flag[1] = "C" and dw_1.object.rem[1] = "[착불]" then // 착불	
	MessageBox("경고", "착불인 경우 '이름/화물'를 선택(입력)하시기 바랍니다.",stopsign!,ok!)
	RETURN
end if
//////////////////////////////////

//////////////////////////////////
// 출고지 다중검사
//////////////////////////////////
string ls_shipaddr
long   ll_addrchk

ls_shipaddr = ""
for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_cnt] = 'Y'  then		// 수불
		ls_shipaddr = dw_2.object.shipto_addr[ll_cnt]
		exit
	end if
next

// 출고지 다중체크
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
	if MessageBox("경고", "운송처 주소가 한곳 이상입니다.~n~r" + & 
	              "현재 운송처로 출하시에는 '확인'를 선택하시기 바랍니다.",question!,okcancel!,2) = 2 then 
      dw_1.setcolumn("shipto_addr")
		dw_1.setfocus()
		RETURN
	end if
end if
//////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 출고항목들 선택 검사
///////////////////////////////////////////////////////////////////////////////////////////////////////
string   ls_coils, ls_sdate, ls_edate
datetime ld_reqdate
long     ll_dw2_coil, ll_reqcnt

for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_cnt] = "Y"  then		
		if (Not isnull(dw_2.object.loc_no[ll_cnt])) AND trim(dw_2.object.loc_no[ll_cnt]) <> "" then	// 저장소
			ls_coils = MidA(dw_2.object.item_no[ll_cnt], 4, 1)	// 품목
			ls_gubun = MidA(dw_2.object.item_no[ll_cnt], 1, 1)	// 품목
			ls_lot   = dw_2.object.coil_no[ll_cnt]					// COIL_NO
			
			if dw_2.object.issue_qty[ll_cnt] > 0 THEN		// 수량
			
			
				if ls_case <> "C" AND ( ls_coils = "1" or ls_coils = "2" ) AND &
					( isnull(ls_lot) or trim(ls_lot) = "" or dw_2.object.cnt[ll_cnt] < 1 ) then

					if ls_gubun = 'M' then /*자재인경우만 오류 출력, jowonsuk 2018.07.03*/
							MessageBox("LOT번호 오류", string(ll_cnt,'000') + " 행 로트번호, 갯수를 확인 하십시요.")
							dw_2.scrolltorow(ll_cnt)
							dw_2.setcolumn('coil_no')
							dw_2.setfocus()
							RETURN 
					end if
				else	// 코일품목, 로트번호, 수량 정상인 경우 중복검사					
					if isnull(ls_lot) or ls_lot = "" then	
						// 로트번호 없으면 SKIP
					else
						for ll_dw2_coil = 1 to dw_2.rowcount()
							if ll_cnt = ll_dw2_coil then		// 자신행 SKIP
							else
								if ls_lot = dw_2.object.coil_no[ll_dw2_coil] then
									MessageBox("확인", string(ll_cnt) + " 행, " + string(ll_dw2_coil) + " 행 로트번호 중복입니다.")
									dw_2.scrolltorow(ll_cnt)
									dw_2.setcolumn('coil_no')
									dw_2.setfocus()
									RETURN 
								end if
							end if
						next
					end if
				end if
				ls_chk = 'Y'
			else
				MessageBox("확인","출고수량을 확인하십시요.!",exclamation!)
				dw_2.scrolltorow(ll_cnt)
				dw_2.setcolumn('issue_qty')
				dw_2.setfocus()
				RETURN 
			end if
		else
			MessageBox("확인","저장소를 확인하십시요.!",exclamation!)
			dw_2.scrolltorow(ll_cnt)
			dw_2.setcolumn('loc_no')
			dw_2.setfocus()
			RETURN 
		end if
	end if
next
if ls_chk <> 'Y' then
	MessageBox("확인","선택된 물품이 없습니다!",exclamation!)
	RETURN
end if
///////////////////////////////////////////////////////////////////////////////////////////////////////

if isnull(dw_1.object.do_car_gbn[1]) OR trim(dw_1.object.do_car_gbn[1]) = "" then
	MessageBox("확인","출하 차량구분이 입력되지 않았습니다.!",exclamation!)
	dw_1.setcolumn('do_car_gbn')
	dw_1.setfocus()
	RETURN
end if

if isnull(dw_1.object.do_dr_hp[1]) OR trim(dw_1.object.do_dr_hp[1]) = "" then
	MessageBox("확인","운전자 연락처(HP)가 입력되지 않았습니다.!",exclamation!)
	dw_1.setcolumn('do_dr_hp')
	dw_1.setfocus()
	RETURN
end if

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 합계금액, 출고의뢰 체크
///////////////////////////////////////////////////////////////////////////////////////////////////////
ld_dototal = dw_1.object.do_total[1]
/*2018.08.22 jowonsuk 정확하지 않다. 주석처리  */
/*
for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_cnt] = "Y"  then		
		if (cbx_issue.checked = true) OR (ld_dototal < 0) then
			// 출고의뢰서 체크제외
		else
			// 출고될 수주번호가 당일자로 출고의뢰서에 확정되었는지 체크함(저장소 체크안함)
			ls_orderno = dw_2.object.order_no[ll_cnt]
			
			SELECT b.req_date INTO :ld_reqdate
			  FROM issuereqdet A
					 LEFT OUTER JOIN issuereq B ON a.req_date = b.req_date AND a.salesman = b.salesman AND a.req_seq= b.req_seq
			 WHERE convert(char(10),b.req_date,111) = convert(char(10),getdate(),111) 
			   AND b.confirm_flag   = 'Y' /*확정    */
            AND a.req_flag       = 'A' /*출고의뢰*/
            AND a.sale_no        = :ls_orderno;
			 
			ls_sdate   = string(ld_reqdate,"yyyy/mm/dd")
			ls_edate   = string(ldt_gftoday,"yyyy/mm/dd")
			if ls_sdate <> ls_edate then
				MessageBox("출고의뢰서 오류", string(ll_cnt,'000') + " 행 수주번호는 출고의뢰서 미작성(생산확인 상태) 항목 입니다.",exclamation!)
				dw_2.scrolltorow(ll_cnt)
				dw_2.setcolumn('issue_qty')
				dw_2.setfocus()
				RETURN
			end if
		end if
	end if
next
*/
//////////////////////////////////////////////////////////////////////////////////////////////////
// 부가세는 공급가액의 10% 검사
//////////////////////////////////////////////////////////////////////////////////////////////////
if dw_1.object.calc_chk[1] = 'Y' then
	if ( (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) - 1) > dw_1.object.do_rate[1] or &
	     (truncate(dw_1.object.do_cash[1] * 0.1 + 0.0000001, 0) + 1) < dw_1.object.do_rate[1]) and &
	 not (dw_2.object.compute_4[1] = 0 and dw_1.object.do_rate[1] = 0) then
		MessageBox("경고", "부가세는 공급가액의 10%의 (±1원) 이내 입니다. 확인 바랍니다.")
		RETURN
	end if		
else
	wf_calc()
end if
//////////////////////////////////////////////////////////////////////////////////////////////////

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//////////////////////////////////////////////////////////////////////////////////////////////////
// 미출고내역 확인후 피드백
//////////////////////////////////////////////////////////////////////////////////////////////////
string ls_feedback, ls_feedcust, ls_feedscene, ls_locno, ls_locno_def, ls_areano
long   ll_feedback

ls_feedback  = ""
ls_feedcust  = dw_1.object.customer_cust_name[1]
ls_feedscene = dw_1.object.scene_scene_desc[1]
ls_areano    = dw_1.object.do_area_no[1]
SELECT def_loc INTO :ls_locno_def FROM area WHERE area_no = :ls_areano;

ls_feedcust  = GF_Hangle_TR(ls_feedcust, 20)
ls_feedscene = GF_Hangle_TR(ls_feedscene,20)

for ll_cnt = 1 to dw_2.rowcount()
	ls_locno  = dw_2.object.loc_no[ll_cnt]

	if ls_locno_def = ls_locno then		// 동일한 저장소에서 
		ld_issue_qty    = dw_2.object.issue_qty[ll_cnt]
		ld_issueqty_org = dw_2.object.issueqty_org[ll_cnt]
		
		if ld_issueqty_org <> ld_issue_qty then		// 출고수량이 다른 경우
			ll_feedback = dw_2.object.issueqty_org[ll_cnt] - dw_2.object.issue_qty[ll_cnt]
			if ll_feedback < 0 then
				// 마이너스 출고 SKIP
			else			
				ls_feedback = ls_feedback + dw_2.object.order_no[ll_cnt] + "-" &
								+ string(dw_2.object.seq_no[ll_cnt]) + "|" &
								+ dw_2.object.item_name[ll_cnt] + "|" &
								+ dw_2.object.qa[ll_cnt] + "|" &
								+ string(ll_feedback,"#,##0")
			end if
		end if
	end if
next
if ls_feedback <> "" then ls_feedback = "[유창]미출고:" + ls_feedcust + "|" + ls_feedscene + "|" + ls_feedback
//////////////////////////////////////////////////////////////////////////////////////////////////

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
		RETURN
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
	ls_loc = dw_2.object.loc_no[ll_int]		// 출고지
	
	if dw_2.object.source[ll_int] = "N" then CONTINUE		// 선택
	
	if dw_2.object.source[ll_int] = "Y" and (not isnull(ls_loc)) and trim(ls_loc) <> "" and &
	   dw_2.object.issue_qty[ll_int] > 0 then
	else
		CONTINUE
	end if
	
	// 출고상세저장
	ll_row       = ll_row + 1
	ls_sale      = dw_2.object.order_no[ll_int]
	li_saleseq   = dw_2.object.seq_no[ll_int]
	ld_order_qty = dw_2.object.order_qty[ll_int]
	ld_issue_qty = dw_2.object.issue_qty[ll_int]

	// 기출고수량
	SELECT isnull(rlse_qty,0) INTO :ld_rcpt FROM saledet WHERE order_no = :ls_sale AND seq_no = :li_saleseq;
	if ld_order_qty < ld_rcpt + ld_issue_qty then
		rollback;
		MessageBox("오류",string(ll_int) + "행 [기출고수량(" + string(ld_rcpt) + ") + 현재출고수량(" + string(ld_issue_qty) + &
		           ") > 주문수량(" + string(ld_order_qty) + ")] 재 조회 후 작업하시기 바랍니다.!",exclamation!)
		RETURN
	end if

   ////////////////////////////////////////
   // 미수불(C)                          //
	//====================================//
	// 출고수량과 저장소 재고수량 CHECK   //
	////////////////////////////////////////
	if ls_case = 'C' then
   else
		ls_item = dw_2.object.item_no[ll_int]
		ls_qa   = dw_2.object.qa[ll_int]
		ld_qoh  = 0		// 현재고
		ld_qty  = 0		// 장기재고
		
		
		/*장개재고 수량은 의미가 없다. jowonsuk  2018.06.22 주석처리  ld_qty = 0 */		
		// 장기재고 수량
		/*
		SELECT isnull( sum(qty), 0) INTO :ld_qty FROM itemstock
		 WHERE itemstock.item_no = :ls_item AND itemstock.qa = :ls_qa AND itemstock.loc_no = :ls_loc;		  
		*/
		ld_qty = 0; /*장기재고 수량은 의미가 없다. jowonsuk  2018.06.22 주석처리  ld_qty = 0 */	
		 
		// 현재고 수량
		SELECT isnull( sum(qoh), 0) INTO :ld_qoh FROM itemloc
		 WHERE itemloc.item_no = :ls_item   AND itemloc.qa = :ls_qa   AND itemloc.loc_no = :ls_loc;		
		 
		if ld_issue_qty > ld_qoh + ld_qty then		/* 재고량보다 출고선정량이 많으면 0처리를 한다. */
			dw_2.object.issue_qty[ll_int] = 0
			
			dw_2.accepttext()
			dw_2.scrolltorow(ll_int)

			dw_2.setcolumn('issue_qty')
			dw_2.setfocus()
//			MessageBox("확인", "출고수량은 저장소+장기재고 수량보다 클수 없습니다.") 2018.08.13 jowonsuk 
			MessageBox("확인", "출고수량은 저장소 수량보다 클수 없습니다.")
			
			dw_2.setredraw(true)
			RETURN
		end if
	end if
	////////////////////////////////////////

	////////////////////////////////////////
	// FITDET(출고대기) 출고번호, 기출수량
	////////////////////////////////////////
//	ls_fitno  = dw_2.object.customer_fit_no[ll_int] /2018.08.21 jowonsuk 수정 /
	ls_fitno  = dw_2.object.fit_no[ll_int]
	ll_fitseq = dw_2.object.seq_no[ll_int]
	ld_shipqty= dw_2.object.issue_qty[ll_int]
	
	if isnull(ls_fitno) or ls_fitno = "" then		// Not Found
	else
		UPDATE fitdet 
		   SET do_no = :ls_do_no1, oi_no = :ll_row, rlse_qty = order_qty - :ld_shipqty 
	    WHERE fit_no = :ls_fitno AND fit_seq = :ll_fitseq;
		if sqlca.sqlcode < 0 then
			rollback;
			MessageBox("저장","FITDET UPDATE중 오류가 발생하였습니다!",exclamation!)
			RETURN
		end if		
	end if
	////////////////////////////////////////

	ls_lot = dw_2.object.coil_no[ll_int]
	
	dw_dodet.object.do_no[ll_row]     = ls_do_no1
	dw_dodet.object.oi_no[ll_row]     = ll_row
	dw_dodet.object.seq_no[ll_row]    = dw_2.object.seq_no[ll_int]
	dw_dodet.object.item_no[ll_row]   = dw_2.object.item_no[ll_int]
	dw_dodet.object.qa[ll_row]        = dw_2.object.qa[ll_int]
	dw_dodet.object.qa_cust[ll_row]   = dw_2.object.qa_cust[ll_int]			// 규격(송장)
	dw_dodet.object.ship_qty[ll_row]  = dw_2.object.issue_qty[ll_int]
	dw_dodet.object.price[ll_row]     = dw_2.object.price[ll_int]
	dw_dodet.object.aroi_qty[ll_row]  = 0
	dw_dodet.object.c_acc_aty[ll_row] = dw_2.object.rlse_acc_qty[ll_int]
	dw_dodet.object.uom[ll_row]       = dw_2.object.uom[ll_int]
	dw_dodet.object.sale_no[ll_row]   = dw_2.object.order_no[ll_int]
	dw_dodet.object.rate_cash[ll_row] = dw_2.object.rlse_rate[ll_int]
	dw_dodet.object.rem[ll_row]       = dw_2.object.rem[ll_int]
	dw_dodet.object.do_rem[ll_row]    = dw_2.object.saledet_do_rem[ll_int]
	dw_dodet.object.stock_qty[ll_row] = dw_2.object.stock_issue[ll_int]		// 장기재고
	
	if trim(ls_lot) = "" then setnull(ls_lot)
	dw_dodet.object.coil_no[ll_row]   = ls_lot
	dw_dodet.object.loc_no[ll_row]    = ls_loc
	dw_dodet.object.cnt[ll_row]       = dw_2.object.cnt[ll_int]
		
	dw_dodet.object.req_date[ll_row]      = dw_2.object.req_date[ll_int]
	dw_dodet.object.salesman[ll_row]    = dw_2.object.salesman[ll_int]
	dw_dodet.object.req_seq[ll_row]       = dw_2.object.req_seq[ll_int]
	dw_dodet.object.seq[ll_row]       	  = dw_2.object.seq[ll_int]	

	// 미수불(C)
	if ls_case = 'C' then 	
   else
		// 대체내역 저장
		is_old_time = string(now(),'hh:mm:ss:fff')	
	//	if wf_itemalter(ls_sale, dw_2.object.seq_no[ll_int], ll_int, ll_row) = true then
	//	else
	//		rollback;
	//		messagebox("저장","대체내역저장도중 오류가 발생하였습니다!",exclamation!)
	//		RETURN
	//	end if		

		//
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
				RETURN
			end if		
		elseif MidA(dw_2.object.item_no[ll_int], 4, 1) = "2" then  //sheet
			UPDATE sheetmst
			   SET qcnt = qcnt - :ll_coilcnt, open_close = :ls_oc
			 WHERE sheet_no = :ls_lot AND loc_no = :ls_loc;
			if sqlca.sqlcode < 0 then
				rollback;
				MessageBox("저장","sheetmst UPDATE중 오류가 발생하였습니다!",exclamation!)
				RETURN
			end if		
		end if
	end if
next


////////////////////////////////////////////////////////////////////////////
// 저장 : WF_Update3(dw_1, dw_dodet, dw_inaudit, "N")
// 포맷 : dw_inaudit.object.inaudit_time FORMAT "yyyy/mm/dd hh:mm:ss:fff"
////////////////////////////////////////////////////////////////////////////
dw_1.accepttext()
dw_2.accepttext()
dw_dodet.accepttext()

if ls_case = "C" then		// 미수불(C)
	lb_chk = WF_Update2(dw_1, dw_dodet, "N")
else
	dw_inaudit.accepttext()	
   lb_chk = WF_Update3(dw_1, dw_dodet, dw_inaudit, "N")
end if
//
if lb_chk then
	pb_insert.enabled  = false		// 출고의뢰작성
	
	if MessageBox("확인", "생성된 출고번호는 " + ls_do_no1 + " 입니다.~r~n" + &
                 "거래명세서를 출력 하시겠습니까?", Question!, OKCancel!, 1) = 1 then
		string ls_c_chk
		if cbx_source.checked = true then
			ls_c_chk = "Y"
			// 공급자 변경 체크시 필수 선택하도록 수정
			if is_sno = '' OR IsNull(is_sno) OR is_sh = "" OR IsNull(is_sh) OR is_nm = "" OR IsNull(is_nm) then
				Messagebox("확인","공급자 변경 체크시 반드시 사업장을 선택하셔야 합니다.")
				RETURN
			end if				
		else
			ls_c_chk = "N"
		end if

		// DO_PRT 설정
		string  ls_left, ls_top
		ls_left = em_left.text ; ls_top = em_top.text
				  
		if cbx_1.checked = true OR cbx_2.checked = true OR cbx_3.checked = true OR cbx_4.checked = true then
			PrintSetup()
			//PrintSetupPrinter()
			//=============================================//
			//OpenWithParm(w_pop_print, dw_8)
			//IF Message.DoubleParm <> 1 THEN RETURN
			//=============================================//
		end if

		string old_dwnm
		old_dwnm = dw_8.dataobject
		
		if cbx_1.checked = true then							// 명세서
			dw_8.dataobject = 'd_oigiving_r_21_a5'		
			dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
		if cbx_2.checked = true then							// 인수증
			dw_8.dataobject = 'd_oigiving_r_22_a5'		
			dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
		if cbx_4.checked = true then							// 납품증
			dw_8.dataobject = 'd_oigiving_r_24_a5'		
			dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		dw_8.dataobject = old_dwnm
		
		if cbx_3.checked = true then							// 출고증
			dw_8.dataobject = 'd_oigiving_r_23_a5'		
			dw_8.Modify('DataWindow.Print.Paper.Size  = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
			dw_8.settransobject(sqlca)
			wf_print(dw_8)
			dw_8.print()
		end if
		
      /////////////////////////////////////////////////////////////////////
		// 출고봉투
      /////////////////////////////////////////////////////////////////////
		if cbx_6.checked = true then							
			DataWindowChild ldwc_cargbn
			
			dw_1.getchild("do_car_gbn", ldwc_cargbn)

			// 프린트 선택
			string ls_setprn
			
			ls_setprn = trim(sle_prt.text)
			if ls_setprn = "" then
				MessageBox("확인","출고봉투 프린터 이름을 입력하시기 바랍니다.")
			else
				PrintSetPrinter( ls_setprn )
	
				dw_4.dataobject = "d_label_main_prt"
				dw_4.settransobject(sqlca)
	
				dw_4.object.car[1]        = ldwc_cargbn.getitemstring(ldwc_cargbn.getrow(),'item_nm')
				dw_4.object.cust_name[1]  = dw_1.object.customer_cust_name[1]
				dw_4.object.scene_name[1] = dw_1.object.scene_scene_desc[1]
				dw_4.object.scene_tel[1]  = dw_1.object.tel_no[1]
				dw_4.object.scene_addr[1] = dw_1.object.shipto_addr[1]
	
				dw_4.Modify('DataWindow.Print.Orientation = 2')
				dw_4.print()
			end if
		end if
      /////////////////////////////////////////////////////////////////////

		
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
	
	dw_1.reset() ; dw_2.reset()
	
	////////////////////////////
	// SMS 단문전송
	////////////////////////////
	string ls_s_sms_yn, ls_s_area_no, ls_s_tel, ls_phonecheck, ls_sms_custno, ls_s_support
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

	// 거래처 문자전송 
	string ls_useyn
	SELECT item_cd INTO :ls_useyn FROM codemst WHERE type = '출고_피드백' AND use_yn = 'Y';

	SELECT top 1 b.cust_no
		  , b.cust_name
		  , c.scene_desc
		  , convert(varchar(10), a.do_date, 111)
		  , replace(substring(ltrim(rtrim(isnull(d.hp_no,    ''))),1,13), '-', '')
		  , replace(substring(ltrim(rtrim(isnull(c.scene_tel,''))),1,13), '-', '')
		  , replace(substring(ltrim(rtrim(isnull(b.buyer1_hp,''))),1,13), '-', '')
		  , replace(substring(ltrim(rtrim(isnull(e.phone,    ''))),1,13), '-', '')
		  , replace(substring(ltrim(rtrim(isnull(F.hp_no,    ''))),1,13), '-', '')		  /*2018.07.16 jowonsuk 반영 작업 부담당자 문자 차주 정보 발송 */
	  INTO :ls_sms_custno, :ls_s_cust_name, :ls_s_scene_desc, :ls_s_do_date
		  , :ls_s_hp_no   , :ls_s_scene_tel, :ls_s_cust_tel  , :ls_s_support, :ls_s_hp_no1
	  FROM do       A with(nolock)
		    LEFT OUTER JOIN customer B with(nolock) ON a.cust_no  = b.cust_no
		    LEFT OUTER JOIN scene    C with(nolock) ON a.cust_no  = c.cust_no AND a.spot_code   = c.scene_code
		    LEFT OUTER JOIN salehp   D with(nolock) ON b.salesman = d.user_id
		    LEFT OUTER JOIN login    E with(nolock) ON b.support  = e.user_id AND e.use_flag <> 'N'
		    LEFT OUTER JOIN salehp   F with(nolock) ON b.salesman_bu = F.user_id			 
	 WHERE a.do_no  = :ls_do_no1;

	//
	dw_1.GetChild('do_car_gbn', dwc1)
	ls_car_text    = dwc1.getitemstring(dwc1.getrow(),'item_nm')
	
	if isnull(ldt_etime) then
	else
		ls_timearrival = "예정:" + string(ldt_etime, "mm/dd hh") + "시"
	end if

		
	ls_s_cust_name = GF_Hangle_TR(ls_s_cust_name,24)
	ls_s_msg = '[유창]차주:' + ls_do_dr_hp + ',' + ls_car_text + ',' + ls_s_cust_name + ',' + ls_s_scene_desc + ',' + ls_timearrival
	ls_s_msg = GF_Hangle_TR(ls_s_msg,80)

	ls_csmsg = '[유창]차주:' + ls_do_dr_hp + ',' + ls_car_text + ',' + ls_s_scene_desc + ',' + ls_timearrival
	ls_csmsg = GF_Hangle_TR(ls_csmsg,80)
	
	// 사업장 기본 발신번호
	SELECT top 1 replace(substring(ltrim(rtrim(isnull(d.hp_no,''))),1,13), '-', '') 
	  INTO :ls_callback
	  FROM salehp d
	 WHERE user_id = :ls_s_tel;

	choose case gs_team
		case "74000"	// 동부점
			ls_callback = "0317551600"
	end choose			
	
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

	choose case LeftA(ls_s_support,3)
		case '010','011','016','017','018','019'
		case else
			ls_s_support = ''
	end choose

	// 미인증 발신번호는 모두 차단
	choose case ls_callback	
		case "0226404628", "0226901999",	"0226489600",	"0226404675",	"0226481998" &
			, "0314999600", "0313559631",	"0317551600",	"0426357002"
			  // 한미란, 서부영업소(화곡), 관리본부, 기술영업부, 고객센터
			  // 시화공장, 화성공장, 동부영업소(성남), 중부호남영업지점
				if ls_useyn = "FEEDBACK" then
					if ls_feedback <> "" then
						GF_MMSSEND( gs_userid, ls_callback, ls_s_hp_no, '영업사원', ls_feedback )	// 피드백
			
						if ls_s_support <> "" then
							GF_MMSSEND( gs_userid, ls_callback, ls_s_support, '고객지원', ls_feedback )	// 피드백
						end if
					end if
				end if
		
				if ls_s_sms_yn = 'Y' then
					// 영업사원
					//if ls_s_hp_no = "" OR isnull(ls_s_hp_no) then
					//else
						choose case ls_sms_custno
							case "U968"		// (주)송천건업 동부(성남)
								SELECT replace(tel_no,'-','') INTO :ls_s_hp_no FROM location WHERE loc_no = 'WS00000012';
								GF_MMSSEND( gs_userid, ls_callback, ls_s_hp_no, '영업사원', ls_s_msg )	// 출고지
								
							case "U580" 	// (주)송천건업
								SELECT replace(tel_no,'-','') INTO :ls_s_hp_no FROM location WHERE loc_no = 'WS00000007';
								GF_MMSSEND( gs_userid, ls_callback, ls_s_hp_no, '영업사원', ls_s_msg )	// 출고지					
								
							case else
								GF_MMSSEND( gs_userid, ls_callback, ls_s_hp_no, '영업사원', ls_s_msg )	// 출고지
						end choose	
						
						/* 2018.07.16 jowonsuk 문자 발송 부지정자 발송 */
						if ls_s_hp_no1 = '' or isnull(ls_s_hp_no1) then
						else
							GF_MMSSEND( gs_userid, ls_callback, ls_s_hp_no1, '영업사원', ls_s_msg )	// 출고지
						end if						
					//end if
	
					// 현장담당
					if ls_s_scene_tel = "" OR isnull(ls_s_scene_tel) then
					else
						GF_MMSSEND( gs_userid, ls_callback, ls_s_scene_tel, '현장담당', ls_s_msg )	// 차주정보
					end if
	
					// 구매담당
					if ls_s_cust_tel = "" OR isnull(ls_s_cust_tel) OR LeftA(ls_s_cust_tel,1) <> '0' then
					else
						GF_MMSSEND( gs_userid, ls_callback, ls_s_cust_tel,  '구매담당', ls_s_msg )	// 출고지
					end if
				end if

		case else
			MessageBox("[발신번호]"+ls_callback, "2015년10월 16일부터 미인증 발신번호는 모두 차단입니다.",Exclamation!)
	end choose		
	COMMIT USING SQLCA;
	
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

type dw_1 from w_inheritance`dw_1 within w_oido_m_new
event ue_1 pbm_custom01
event ue_2 ( )
integer x = 55
integer y = 392
integer width = 4037
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

event dw_1::itemchanged;//
string ls_car,  ls_curr_code, ls_area
string ls_null, ls_loc, ls_where, ls_item, ls_qa, ls_sql, ls_case, ls_dw2locno, ls_drhp, ls_temp
int    li_int
long   ll_row, ll_rowmax, ll_cnt, ll_found
dec    ld_itemloc_qoh, lr_exp_rate, ld_janqoh
datetime ldt_oi_date

this.Accepttext()

ll_cnt = dw_2.rowcount()

choose case dwo.name
	case "driver"			// 차량NO
		if this.object.ship_flag[1] = "C" then // 착불
			ls_temp = "[착불] "
		else
			ls_temp = ""
		end if
		
		this.object.rem[1] = ls_temp + LeftA(idwc_car.getitemstring(idwc_car.getrow(),"driver") + " " &
								 + idwc_car.getitemstring(idwc_car.getrow(),"name") + " " &
								 + idwc_car.getitemstring(idwc_car.getrow(),"cargo_name"), 43)
//		if isnull(idwc_car.getitemstring(idwc_car.getrow(),"hp")) then
//			ls_car = ""
//		else
//			ls_car = trim(idwc_car.getitemstring(idwc_car.getrow(),"hp")) + " "
//		end if

		// 해당수주번호의 운송처주소를 가져오기함
      ll_rowmax = dw_2.rowcount()
		this.object.shipto_addr[1] = ls_car + dw_2.object.shipto_addr[ll_rowmax]

		SELECT docar.hp INTO :ls_drhp FROM docar WHERE docar.open_close = 'O' AND docar.driver = :data;
		if isnull(ls_drhp) or ls_drhp = "" then
			this.object.do_dr_hp[1] = "00"
		else
			this.object.do_dr_hp[1] = ls_drhp
		end if
	
	case "do_date"			// 출고일자
		if this.object.curr_code[1] <> "WON" then
			ldt_oi_date  = this.object.do_date[1]
			ls_curr_code = this.object.curr_code[1]
					
			SELECT exp_rate INTO :lr_exp_rate FROM currency WHERE curr_code = :ls_curr_code	AND curr_date = :ldt_oi_date;				  
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_exp_rate
			end if
		end if
		
	case "do_chk"			// 전체출고
		setnull(ls_null)

		ls_case = dw_1.object.do_case[1]		// 미수불
		WF_LocNO( ls_case )
		
		//////////////////////////////////////////////////////////
		// 하나의 사업장에 다수의 저장소 존재시(기본저장소)			
		//////////////////////////////////////////////////////////
		ls_area = dw_1.object.do_area_no[1]
		
		SELECT rtrim(bigo) INTO :ls_loc FROM codemst 
		 WHERE type = '사업장기본저장소' AND item_cd = :gs_userid AND use_yn = 'Y';
		 
		if isnull(ls_loc) OR ls_loc = "" then
			SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
		end if
		//////////////////////////////////////////////////////////	

		dw_2.setredraw(false)
		
		if data = "Y" then
			for ll_row = 1 to ll_cnt
				dw_2.object.source[ll_row] = "Y"
				if ls_case <> "C" then
					ld_itemloc_qoh = 0

					dw_2.object.loc_no[ll_row] = ls_loc
					ls_item   = dw_2.getitemstring(ll_row, "item_no")
					ls_qa     = dw_2.getitemstring(ll_row, "qa")
					
					ld_janqoh = dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row]
					
					SELECT qoh INTO :ld_itemloc_qoh 
					  FROM itemloc
					 WHERE loc_no  = :ls_loc AND item_no = :ls_item	AND qa = :ls_qa;
					if ld_itemloc_qoh > ld_janqoh then
						dw_2.setitem(ll_row, "issue_qty",    ld_janqoh )
					else
						if ld_itemloc_qoh <= 0 then
							dw_2.object.loc_no[ll_row]       = ls_loc
							dw_2.object.issue_qty[ll_row]    = 0
						else
							dw_2.setitem(ll_row, "issue_qty",    ld_itemloc_qoh)	
						end if
					end if
				else
					dw_2.setitem(ll_row, "issue_qty", ld_janqoh)
				end if
			next
			dw_2.accepttext()
		else
			for ll_row = 1 to ll_cnt
				dw_2.object.source[ll_row]       = "N"
				dw_2.object.loc_no[ll_row]       = ls_null
				dw_2.object.issue_qty[ll_row]    = 0
				
				ls_item = dw_2.object.item_no[ll_row]
				if MidA(ls_item, 4, 1) = "1" or MidA(ls_item, 4, 1) = "2" then
					wf_cleardddw()
				end if
				dw_2.object.coil_no[ll_row] = ls_null
			next
		end if
		
		dw_2.setredraw(true)
		this.postevent("ue_1")
///////////////////// 밑에

	case "do_area_no"			// 출고지
		for ll_row = 1 to dw_2.rowcount()
			dw_2.object.loc_no[ll_row] = ls_null
		next

   case "do_case"				// 미수불
		wf_locno( data )

		if data <> "C" then
			dw_2.object.flag.visible = 1
			for ll_row = 1 to ll_cnt
				dw_2.object.loc_no[ll_row] = ls_null
			next
		else
			dw_2.object.flag.visible = 0

			for ll_row = 1 to ll_cnt
//				dw_2.object.loc_no[ll_row] = ls_null
				ls_item   = dw_2.object.item_no[ll_row]
            ld_janqoh = dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row]

				dw_2.setitem(ll_row, "issue_qty",    ld_janqoh)
				if MidA(ls_item, 4, 1) = "1" or MidA(ls_item, 4, 1) = "2" then
					wf_cleardddw()
				end if
				dw_2.object.coil_no[ll_row] = ls_null
			next
		end if
		
/////////////////////
	case "ship_flag"			// 운송방법
		if data = "M" or data = "H" or data = "T" or data = "P" or data = "Y" then //각 방문, Y:반월은 sort가 null
			this.object.shipamt_case[1] = "C"	// 현금
		end if
		
		if data = "D" or data = "B" then			// 부담,대여
			this.object.shipamt_case[1] = "R"	// 외상
		end if		

		if this.object.ship_flag[1] = "C" then // 착불
			this.object.rem[1] = "[착불]"
		else
			this.object.rem[1] = ""
		end if
end choose

if dwo.name <> "do_rate" and dwo.name <> "calc_chk" then		// 부가세, 변경
	this.postevent("ue_2")
else
	dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]
end if

end event

event dw_1::losefocus;this.accepttext()
end event

event dw_1::doubleclicked;// 도착예정시간, 차량NO
gs_codere_str lst_code
datetime ldt_timearrival
date     ldt_date
time     ldt_time

setnull( ldt_timearrival )
setnull( ldt_date )
setnull( ldt_time )

choose case dwo.name
	case "driver"
		idwc_car.settransobject(sqlca)
		idwc_car.reset()
		idwc_car.retrieve()

	case "time_arrival"
		OpenWithParm(w_whdatetime_w, lst_code)
		
		lst_code = Message.PowerObjectParm
		if lst_code.okcancel = 'N' then
		else
			ldt_date = date(lst_code.start_no)
			ldt_time = time(lst_code.end_no + ".000")

			dw_1.object.time_arrival[1] = datetime(ldt_date, ldt_time)
			dw_1.setcolumn( "ship_flag" )
			dw_1.setfocus()
		end if		
end choose

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

event dw_1::itemfocuschanged;call super::itemfocuschanged;// 도착예정시간
gs_codere_str lst_code
datetime ldt_timearrival
date     ldt_date
time     ldt_time

setnull( ldt_timearrival )
setnull( ldt_date )
setnull( ldt_time )

choose case dwo.name
	case "time_arrival"
		OpenWithParm(w_whdatetime_w, lst_code)
		
		lst_code = Message.PowerObjectParm
		if lst_code.okcancel = 'N' then
		else
			ldt_date = date(lst_code.start_no)
			ldt_time = time(lst_code.end_no + ".000")

			dw_1.object.time_arrival[1] = datetime(ldt_date, ldt_time)
			dw_1.setcolumn( "ship_flag" )
			dw_1.setfocus()
		end if		
end choose

end event

type st_title from w_inheritance`st_title within w_oido_m_new
integer y = 28
integer width = 1010
string text = "거래명세서 작성"
end type

type st_tips from w_inheritance`st_tips within w_oido_m_new
end type

type pb_compute from w_inheritance`pb_compute within w_oido_m_new
integer x = 1609
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

event pb_compute::clicked;/////////////////////////////////////////////////////////
// 수주번호 조회
// 시화출고시 수주확정 분을 체크하는 경우는 생산계획에 
// 포함되어 재생산될수 있음
/////////////////////////////////////////////////////////
string ls_cust, ls_scene, ls_orderno, ls_name, ls_sale_flag
long   ll_row

ls_orderno = trim(em_3.text)
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

setnull(ls_cust) ; setnull(ls_scene)
SELECT cust_no, scene_code, sale_flag
    INTO :ls_cust, :ls_scene, :ls_sale_flag 
  FROM sale
 WHERE order_no = :ls_orderno;
if sqlca.sqlcode = 100 then 
	pb_cancel.triggerevent(clicked!)		// CLEAR
	em_3.SelectText(9, 2)
	em_3.setfocus()
	RETURN
end if

dw_3.object.cust_no[1]    = ls_cust
dw_3.object.scene_code[1] = ls_scene
dw_3.object.sale_flag[1]  = ls_sale_flag

if isnull(ls_scene) OR trim(ls_scene) = "" then
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

// 조회
is_sel_orderno = 'Y'
pb_retrieve.enabled = true
pb_retrieve.postevent(clicked!)

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oido_m_new
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

type pb_close from w_inheritance`pb_close within w_oido_m_new
integer x = 4325
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;   close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oido_m_new
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

type pb_cancel from w_inheritance`pb_cancel within w_oido_m_new
integer x = 3941
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

type pb_delete from w_inheritance`pb_delete within w_oido_m_new
boolean visible = false
integer x = 2528
integer y = 60
integer taborder = 150
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_oido_m_new
integer x = 3410
integer width = 325
integer taborder = 170
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출고의뢰자동생성"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_insert::mousemove;//
end event

event pb_insert::clicked;call super::clicked;// 출고의뢰작성
string   ls_reqdate, ls_salesman, ls_rem, ls_reqtext, ls_confirm, ls_auser, ls_aarea, ls_schedule, ls_shipflag
string   ls_saleno, ls_addscene, ls_custno, ls_scene, ls_itemno, ls_itemnm, ls_qa,    ls_uom,  ls_locno,   ls_telno
string   ls_null,   ls_SQLErrText
integer  li_reqseq, li_seq
long     ll_row,    ll_seqno, ll_selrow
decimal  ld_issueqty
datetime ld_reqdate

setnull( ls_null )

if dw_1.rowcount() < 1 then RETURN

ls_reqdate = string(GF_TODAY(),"yyyy/mm/dd")

// 의뢰자별 마지막 차수
SELECT max(req_seq) INTO :li_reqseq 
  FROM issuereq 
 WHERE convert(char(10),req_date,111) = :ls_reqdate
   AND salesman   = :gs_userid;
 
if isnull(li_reqseq) OR li_reqseq = 0 then
	li_reqseq = 1
else
	li_reqseq = li_reqseq + 1
end if

ls_custno   = dw_1.object.cust_no[1]
ls_scene    = dw_1.object.spot_code[1]
ls_shipflag = dw_1.object.ship_flag[1]
ls_telno    = dw_1.object.tel_no[1]

// 출고예정
ls_schedule= "C"		// 자동작성
//choose case gs_area
//	case "S0001"
//		MessageBox("확인","시화사업장은 출고의뢰서 작성 후 작업하시기 바랍니다.")
//		RETURN
//	case else
//		ls_schedule= "C"		// 자동작성
//end choose

for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.source[ll_row] = "Y" then
		ll_selrow = ll_row
		exit
	end if
next
if ll_selrow < 1 then 
	MessageBox("확인","출고할 품목을 선택 하시기 바랍니다.")
	RETURN
end if

ls_locno   = dw_2.object.loc_no[ll_selrow]
if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("확인",string(ll_selrow) + " 번 출고품목의 저장소를 확인하시기 바랍니다.",exclamation!)
	RETURN
end if

ls_saleno  = dw_2.object.order_no[ll_selrow]
ls_itemnm  = dw_2.object.item_name[ll_selrow] + ' 外'
ls_uom     = dw_2.object.uom[ll_selrow]

/////////////////////////////////////////////////////////////
ld_reqdate = datetime(date(GF_TODAY()), time("00:00:00")) // 의뢰일자
ls_salesman= gs_userid						// 의뢰자

// 수신자, 수신사업장
SELECT loc_manager, area_no INTO :ls_auser, :ls_aarea 
  FROM location 
 WHERE loc_no = :ls_locno AND use_yn = 'Y';
if isnull(ls_auser) OR ls_auser = "" then
	MessageBox("저장",string(ll_selrow) + " 번 품목의 저장소 담당자 확인 바랍니다.",exclamation!)
	RETURN
end if

ls_rem     = "거래명세서작성"				// 참조
ls_reqtext = "[" + gs_username + "]"	// 비고
ls_confirm = "Y"								// 확정구분

// 출고헤더
INSERT INTO issuereq (req_date, salesman, req_seq, accept_user, rem, req_text, accept_area, confirm_flag, sys_date )
VALUES (:ld_reqdate, :ls_salesman, :li_reqseq, :ls_auser, :ls_rem, :ls_reqtext, :ls_aarea, :ls_confirm, getdate() );
if sqlca.sqlcode = 0 then
	// 출고상세
	INSERT INTO issuereqdet (req_date, salesman, req_seq, req_flag, seq, cust_no, scene_code, add_scene, sale_no
			 , item_name, uom, issue_flag, issue_schedule, ship_flag, ship_case, tel, sys_date)
	VALUES (:ld_reqdate, :ls_salesman, :li_reqseq, 'A', 1, :ls_custno, :ls_scene, :ls_null, :ls_saleno
			 , :ls_itemnm, :ls_uom, 'A', :ls_schedule, :ls_shipflag, 'E', :ls_telno, getdate());
	if sqlca.sqlcode = 0 then
		// 출고상세선정수량
		for ll_row = 1 to dw_2.rowcount()
			ll_seqno    = dw_2.object.seq_no[ll_row]
			ls_itemno   = dw_2.object.item_no[ll_row]
			ls_qa       = dw_2.object.qa[ll_row]
			ld_issueqty = dw_2.object.order_qty[ll_row]
			
			INSERT INTO issuereqdet_sale (req_date, salesman, req_seq, seq, order_no, seq_no, item_no, qa, issue_qty, sys_date)
			VALUES (:ld_reqdate, :ls_salesman, :li_reqseq, 1, :ls_saleno, :ll_seqno, :ls_itemno, :ls_qa, :ld_issueqty, getdate());
			if sqlca.sqlcode = 0 then
				COMMIT;	
			else
				ls_SQLErrText = sqlca.SQLErrText
				MessageBox("저장","issuereqdet_sale INSERT중 오류가 발생하였습니다!~n~n"+ls_SQLErrText,exclamation!)
				RETURN
			end if
		next
	else
		ls_SQLErrText = sqlca.SQLErrText
		MessageBox("저장","issuereqdet INSERT중 오류가 발생하였습니다!~n~n"+ls_SQLErrText,exclamation!)
		RETURN
	end if		
else	
	ls_SQLErrText = sqlca.SQLErrText
	MessageBox("저장","issuereq INSERT중 오류가 발생하였습니다!!~n~n"+ &
	           string(ld_reqdate,"yyyy/mm/dd") + "|" + ls_salesman + "|" + string(li_reqseq) + "~n~n" + &
				  ls_SQLErrText,exclamation!)
	RETURN
end if		

MessageBox("저장","출고의뢰서 작성완료")

////Open( w_whissuereq_s )
////w_whissuereq_s.WindowState = Normal!
//
//if IsValid( w_all_main ) = true then
//	OpenSheet(w_oiissuereq_m, w_all_main,6, original!)
//else
//	OpenSheet(w_oiissuereq_m, w_o_main,6, original!)
//end if

/*
의뢰일자   req_date,   의뢰자     salesman,       차수       req_seq
의뢰형태   req_flag,   순번       seq,            거래처     cust_no
현장       scene_code, 도착지     add_scene,      수주번호   sale_no
품명       item_name,  단위       uom,            의뢰수량   issue_qty
출고형태   issue_flag, 출고예정   issue_schedule, 운임       ship_flag
운송방법   ship_case,  연락처     tel,            비고       rem
출하시간   do_date,    등록일자   sys_date
*/


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oido_m_new
integer x = 3749
integer taborder = 160
boolean enabled = false
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;// 조회
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string   ls_custno,   ls_scene_code, ls_where, ls_sql, ls_sale_flag, ls_curr_code, ls_null, as_req_date, as_order_no, as_cust_no, as_scene_code, as_loc_no
string   ls_custname, ls_addr, ls_scenename, ls_addr2, ls_order_no, ls_shipto_addr, ls_telno, ls_telnocap, ls_pre_sale_yn
dec      ld_curr_rate
datetime ldt_dodate
long     ll_dw6row, ll_find

if GF_PERMISSION("거래명세서_작성부서", gs_userid ) = "Y" OR gs_userid = "1999010s" then
else
   pb_save.visible = false  // 저장기능 삭제
end if

setnull(ls_null)
dw_3.accepttext()

as_req_date = gf_today2s()
ls_custno    = dw_3.object.cust_no[1]	
if isnull(ls_custno) OR trim(ls_custno) = "" then RETURN

as_cust_no = ls_custno

if isnull(ls_custno) OR trim(ls_custno) = "" then
	as_cust_no = '%'
end if

ls_scene_code = dw_3.object.scene_code[1]	
if trim(ls_scene_code) = "" then	ls_scene_code = ls_null


as_scene_code = ls_scene_code
if isnull(ls_scene_code) OR trim(ls_scene_code) = "" then
	as_scene_code = '%'
end if

ls_sale_flag  = dw_3.object.sale_flag[1]	

//==============================================================================================//
dw_1.setredraw(false) ; dw_2.setredraw(false)
dw_1.reset()

/*2018.08.21 jowonsuk DateAdd(year, -1, getdate() ) -> DateAdd(month, -6, getdate() ) */
/*2018.08.21 jowonsuk 주석처리  시작 */
/*
if is_sel_orderno = 'N' then
	if isnull(ls_scene_code) then
      ls_where = " AND sale.order_date >= DateAdd(month, -6, getdate() )" + &
		           " AND sale.cust_no    = ~~'" + ls_custno + "~~'"
	else
      ls_where = " AND sale.order_date >= DateAdd(month, -6, getdate() )" + &
		           " AND sale.cust_no = ~~'" + ls_custno + "~~' AND sale.scene_code = ~~'" + ls_scene_code + "~~'"
	end if
else	// 수주번호 조회(Y)
	ls_order_no    = em_3.text
	is_sel_orderno = 'N'
	ls_where = " AND sale.order_no = ~~'" + ls_order_no + "~~'"
end if // 출고지시서 where조건.
//ls_sql = "datawindow.table.select = '" + is_custscenesql + ls_where + "'"

//dw_2.modify(ls_sql)
  dw_2.object.DataWindow.table.select = is_custscenesql + ls_where /2018.08.21 jowonsuk 주석처리 /
*/

	ls_order_no    = em_3.text
	as_order_no    = em_3.text
	is_sel_orderno = 'N'
	
	if isnull(as_order_no) or as_order_no = '' then
		as_order_no = '%'
	end if

/* 2018.08.21 jowonsuk 개선 조회하는걸로 변경 */
SELECT DEF_LOC
   into :as_loc_no
FROM AREA with(nolock)
WHERE AREA_NO = :gs_area;

dw_2.retrieve(  as_loc_no, as_req_date, as_order_no, as_cust_no, as_scene_code)
/*2018.08.21 jowonsuk 개선 */
//==============================================================================================//

if dw_2.rowcount() > 0 then
	dw_6.visible = false
	dw_6.reset()
	for ll_dw6row = 1 to dw_2.rowcount()
		ls_order_no    = dw_2.object.order_no[ll_dw6row]
		ls_shipto_addr = dw_2.object.shipto_addr[ll_dw6row]
		ls_telno       = dw_2.object.tel_no[ll_dw6row]
		ls_telnocap    = dw_2.object.telno_cap[ll_dw6row]
		
//		ll_find  = dw_6.find("order_no = '" + ls_order_no + "' AND shipto_addr = '" + ls_shipto_addr + "'", 1, dw_6.rowcount() )
//		if ll_find > 0 then
//			//
//		else
			dw_6.InsertRow(0)
			dw_6.setitem(ll_dw6row, "order_no",    ls_order_no )
			dw_6.setitem(ll_dw6row, "shipto_addr", ls_shipto_addr )
			dw_6.setitem(ll_dw6row, "tel_no",      ls_telno )
			dw_6.setitem(ll_dw6row, "telno_cap",   ls_telnocap )
//		end if
	next
	
	dw_1.insertrow(0)
	
	// 거래명세서 발행구분 A:거래명세서, B:직거래명세서, C:비거래명세서
	// 거래명세서 발행구분 A:수불발생, C:미수불
	dw_1.object.do_case[1]    = 'A' 
  	dw_1.object.do_area_no[1] = gs_area

   //=========================================================================//
   // 거래처/현장 인수자번호는 항상 거래처현장관리의 번호로 발송함
   //=========================================================================//
   // 1. 수주폰번호 사용 인 경우는 수주번호의 인수자번호를 가져옴
   // 2. 동일한 거래처의 현장에서 폰번호가 다르면 마지막 수주의 인수자 번호 선택
   //=========================================================================//
   //	dw_1.object.tel_no[1]     = dw_2.object.tel_no[1]
	string ls_scene_phone, ls_scenehp, ls_scenehpcap, ls_orderno, ls_salenochk = "N"
	long   ll_iY, ll_rowmax
		
	// 수주폰번호 사용 체크
	SELECT scene_phone 
	      INTO :ls_scene_phone  
	    FROM customer with(nolock) 
      WHERE cust_no = :ls_custno;
	
	if ls_scene_phone = "Y" then
		ls_orderno = dw_2.object.order_no[1]
		
		for ll_iY = 1 to dw_2.rowcount()
			
		   if ls_orderno = dw_2.object.order_no[ll_iY] then
				ls_salenochk = "Y"		// 수주번호 한건 
		   else
				ls_salenochk = "N"		// 수주번호 한건 이상인 경우
		   end if
			
		next
		
		if ls_salenochk = "Y" then
			ls_scenehp    = dw_2.object.tel_no[1]		// 연락처
			ls_scenehpcap = dw_2.object.telno_cap[1]	// 보조연락처
		else			
			SELECT top 1 tel_no, telno_cap INTO :ls_scenehp, :ls_scenehpcap
			  FROM sale with (nolock)
	          WHERE cust_no = :ls_custno  AND scene_code = :ls_scene_code
                 ORDER BY substring(order_no,3,12) DESC;
		end if
	else
		SELECT scene_tel, scene_telcap  INTO :ls_scenehp, :ls_scenehpcap
		  FROM scene with (nolock)
	 	 WHERE cust_no = :ls_custno  AND scene_code = :ls_scene_code;
	end if
	
	dw_1.object.tel_no[1]      = ls_scenehp			// 연락처
	dw_1.object.telno_cap[1]   = ls_scenehpcap		// 보조연락처

   // 마지막 수주번호의 운송처주소를 가져오기함
	ll_rowmax = dw_2.rowcount()
  	dw_1.object.shipto_addr[1] = dw_2.object.shipto_addr[ll_rowmax]		// 운송자HP/운송처주소	  
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
	
	dw_1.object.cust_no[1]    = ls_custno
	dw_1.object.spot_code[1]  = ls_scene_code
	dw_1.object.do_user_id[1] = gs_userid

	setnull(ls_custname)	
	SELECT cust_name,  curr_code INTO :ls_custname, :ls_curr_code 
	  FROM customer with (nolock)
	 WHERE cust_no = :ls_custno;
	dw_1.object.customer_cust_name[1] = ls_custname
	
	setnull(ls_scenename)
	dw_1.object.spot_code[1] = ls_scene_code
	SELECT scene_desc, scene_addr INTO :ls_scenename, :ls_addr2 
	  FROM scene with (nolock)
	 WHERE scene_code = :ls_scene_code;

	if trim(ls_scene_code) <> "" and not isnull(ls_scene_code) then
		dw_1.object.scene_scene_desc[1] = ls_scenename
	else
		dw_1.object.scene_scene_desc[1] = ls_null
	end if
	
	if isnull(ls_addr2) OR trim(ls_addr2) = "" then
	else
		ls_addr = ls_addr2
	end if

	dw_1.object.sale_flag[1]   = ls_sale_flag
	dw_1.object.curr_code[1]   = ls_curr_code
	
	dw_1.object.do_date[1] = datetime(date(string(today(),'yyyy/mm/dd')))
	ldt_dodate = datetime(today())
	
	dw_1.object.curr_rate[1] = 1
	if dw_1.object.curr_code[1] <> "WON" then
		SELECT exp_rate
		     INTO :ld_curr_rate
		   FROM currency with(nolock)
		 WHERE curr_code = :ls_curr_code 
		       AND curr_date = :ldt_dodate;
		dw_1.object.curr_rate[1] = ld_curr_rate		  
	end if
	
	/////////////////////////////////////////////////////////////
	// 마감단가 불러오기
	/////////////////////////////////////////////////////////////
	string  ls_scene, ls_itemno, ls_qa, ls_uom
	long    ll_row
	decimal ld_amount
	
	if MessageBox("확인","마감단가를 불러오기를 하겠습니까?",Exclamation!, OKCancel!, 1) = 1 then	
		ls_custno  = dw_1.object.cust_no[1]
		ls_scene   = dw_1.object.spot_code[1]
		
		for ll_row = 1 to dw_2.rowcount()
			ls_itemno = dw_2.object.item_no[ll_row]
			ls_uom    = trim(dw_2.object.uom[ll_row])
			
			if ls_uom = "M" then
				ls_qa  = LeftA(dw_2.object.qa[ll_row],13)


				SELECT max(a.price) INTO :ld_amount
				  FROM (
								 SELECT top 100 price
									FROM dodet with(nolock)
										  LEFT OUTER JOIN do with(nolock) ON dodet.do_no = do.do_no
								  WHERE do.cust_no    = :ls_custno
									 AND do.spot_code  = :ls_scene
									 AND dodet.item_no = :ls_itemno
									 AND substring(dodet.qa,1,13) = :ls_qa
								  ORDER BY do.do_date DESC
						 ) A;


			else
				ls_qa  = dw_2.object.qa[ll_row]

				SELECT max(a.price) INTO :ld_amount
				  FROM (
								 SELECT top 100 price
									FROM dodet with(nolock)  
										  LEFT OUTER JOIN do with(nolock) ON dodet.do_no = do.do_no
								  WHERE do.cust_no    = :ls_custno
									 AND do.spot_code  = :ls_scene
									 AND dodet.item_no = :ls_itemno
									 AND dodet.qa      = :ls_qa
								  ORDER BY do.do_date DESC
						 ) A;
			end if
			
			// NULL 체크 
			if isnull(ld_amount) OR ld_amount = 0 then
			else
				dw_2.object.price[ll_row]  = ld_amount	 
			end if
		next
	end if
	/////////////////////////////////////////////////////////////
		
   dw_1.enabled = TRUE
   dw_2.enabled = TRUE
   dw_3.enabled = FALSE
   pb_cancel.enabled   = TRUE
   pb_save.enabled     = TRUE
   pb_retrieve.enabled = FALSE
else
  	MessageBox("확인", "해당하는 수주내역이 없습니다.")
	em_3.setfocus()
end if
dw_1.setredraw( true ) ; dw_2.setredraw( true )
dw_2.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oido_m_new
integer x = 32
integer y = 224
integer width = 4782
integer height = 140
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oido_m_new
integer y = 352
integer width = 4091
integer height = 616
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oido_m_new
integer x = 3383
integer width = 1166
integer taborder = 60
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oido_m_new
event ue_1 pbm_custom01
integer x = 32
integer y = 980
integer width = 4773
integer height = 1372
integer taborder = 80
boolean enabled = false
string dataobject = "d_oidodet_m_new"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::ue_1;// 합계금액
wf_calc()

end event

event dw_2::losefocus;//
this.accepttext()

end event

event dw_2::itemchanged;//
string  ls_item, ls_qa, ls_null, ls_loc, ls_source, ls_where, ls_sql, ls_area
string  ls_order, ls_saleno, ls_shipflag, ls_ship_flag
decimal ld_qoh, ld_locqoh, ld_issue_qty, ld_rlse_qty, ld_order_qty, ld_itemloc_qoh
decimal ld_do_stock, ld_janqoh
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
	case "source"	
		WF_LocNO(dw_1.object.do_case[1])

		if data = "Y" then
			// 운반비(대여,부담,착불 등)
			ls_saleno = this.object.order_no[ll_row]
			SELECT top 1 ship_flag INTO :ls_shipflag FROM issuereqdet WHERE sale_no = :ls_saleno ORDER BY req_date desc;
			if isnull(ls_shipflag) then
				MessageBox("확인","출고의뢰서 미작성분 입니다. 확인 바랍니다.")
				//RETURN
			end if
			dw_1.object.ship_flag[1]  = ls_shipflag
		
			// 출고품목의 현장주소를 보여줌
			dw_1.object.shipto_addr[1] = dw_2.object.shipto_addr[row]		// 운송자HP/운송처주소			

			//////////////////////////////////////////////////////////
			// 하나의 사업장에 다수의 저장소 존재시(기본저장소)			
			//////////////////////////////////////////////////////////
			ls_area = dw_1.object.do_area_no[1]
			
			SELECT rtrim(bigo) INTO :ls_loc FROM codemst 
			 WHERE type = '사업장기본저장소' AND item_cd = :gs_userid AND use_yn = 'Y';
			if isnull(ls_loc) OR ls_loc = "" then
				SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
			end if
			//////////////////////////////////////////////////////////	
		
			if dw_1.object.do_case[1] <> 'C' then		// 미수불 C, 수불 체크 하는 로직 
				dw_2.setredraw(false)
				
				ls_item = dw_2.getitemstring(ll_row, "item_no")
				ls_qa   = dw_2.getitemstring(ll_row, "qa")
								
				if GF_Permission('거래명세서작성출고품목정보', gs_userid) = 'Y' then
					ls_where = " AND itemloc.item_no = ~~'" + ls_item + "~~' AND itemloc.qa = ~~'" + ls_qa + "~~'" 
				else
					ls_where = " AND itemloc.item_no  = ~~'" + ls_item + "~~'" &
								+ " AND itemloc.qa       = ~~'" + ls_qa   + "~~'" &
								+ " AND location.area_no = ~~'" + ls_area + "~~'" 
				end if
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
						SELECT sum(stock_qty) INTO :ld_do_stock 
						  FROM dodet 
						 WHERE sale_no = :ls_order AND seq_no = :li_seq;
						if isnull(ld_do_stock) then ld_do_stock = 0
					end if
					
					ld_janqoh  = dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row]
					if ld_itemloc_qoh > ld_janqoh then
						dw_2.setitem(ll_row, "issue_qty",    ld_janqoh)
						dw_2.setitem(ll_row, "stock_issue", ( dw_2.object.stock_qty[ll_row] - ld_do_stock ) )
					else
						if ld_itemloc_qoh <= 0 then
							dw_2.object.loc_no[ll_row]       = ls_null
							dw_2.object.issue_qty[ll_row]    = 0
							dw_2.object.stock_issue[ll_row]  = 0
						else
							dw_2.setitem(ll_row, "issue_qty",    ld_itemloc_qoh)	
							if ld_itemloc_qoh > ( dw_2.object.stock_qty[ll_row] - ld_do_stock) then
								dw_2.setitem(ll_row, "stock_issue", ( dw_2.object.stock_qty[ll_row] ))	
							else
								dw_2.setitem(ll_row, "stock_issue", ld_itemloc_qoh)	
							end if
						end if
					end if
				else
					dw_2.object.loc_no[ll_row]       = ls_null
					dw_2.object.issue_qty[ll_row]    = 0
					dw_2.object.stock_issue[ll_row]  = 0
				end if
				
				dw_2.accepttext()				
				dw_2.setredraw(true)
			else
				dw_2.setitem(ll_row, "issue_qty",    (dw_2.object.order_qty[ll_row] - dw_2.object.rlse_qty[ll_row]) )
			end if  // 'C' 
		else
			this.object.loc_no[ll_row]       = ls_null
			this.object.issue_qty[ll_row]    = 0
			this.object.coil_no[ll_row]      = ls_null
			if MidA(ls_item, 4, 1) = "1" OR MidA(ls_item, 4, 1) = "2" then
				WF_ClearDddw()
			end if
	   end if
	
	case "issue_qty"
		if dw_1.object.do_case[1] <> 'C' then
			SELECT isnull(sum(qoh), 0) INTO :ld_locqoh 
			  FROM itemloc
			 WHERE item_no = :ls_item AND qa = :ls_qa AND loc_no = :ls_loc;
			 
			ld_order_qty = this.getitemdecimal(ll_row,"order_qty")
			ld_issue_qty = this.getitemdecimal(ll_row,"issue_qty")
			ld_rlse_qty  = this.getitemdecimal(ll_row,"rlse_qty")	
			
			if ld_issue_qty > ld_locqoh then
				MessageBox("확인", "저장소 수량보다 클수 없습니다.")
				RETURN 1
			end if
			
			if (ld_issue_qty + ld_rlse_qty) > ld_order_qty then
				MessageBox("확인", "주문수량보다 클수 없습니다.")
				RETURN 1
			end if		
		end if
		
	case "stock_issue"
		if dw_1.object.do_case[1] = "C" then	// 미수불
		else
			if this.getitemdecimal(ll_row, "stock_issue") > this.getitemdecimal(ll_row, "issue_qty") then
				MessageBox("확인", "장기재고 수량이 선정 수량보다 클수 없습니다.")
				RETURN 1
			end if
		end if
		
	case "coil_no"		// 코일번호	
		if ls_source = "N" then RETURN
		
		if dw_1.object.do_case[1] = "C" then	// 미수불
		else
			if trim(ls_loc) = "" OR isnull(ls_loc) then
			else
				choose case MidA(ls_item, 4, 1)
					case "1", "2"
						dw_2.getchild("coil_no", idwc_lot)
						if idwc_lot.rowcount() > 0 then
							this.object.qcnt[ll_row]     = idwc_lot.getitemnumber(idwc_lot.getrow(), 'qcnt')
							this.object.unit_qty[ll_row] = idwc_lot.getitemnumber(idwc_lot.getrow(), 'unit_qty')
						end if
				end choose
			end if
		end if
		
	case "cnt"
		if dw_1.object.do_case[1] = "C" then	// 미수불
		else
			if integer(data) > this.getitemnumber(ll_row,"qcnt") then
				MessageBox("확인", "로트 재고 갯수보다 클수 없습니다.")
				RETURN 1
			end if
		end if
end choose

this.postevent("ue_1")	// 합계금액



end event

event dw_2::clicked;call super::clicked;//
gs_alter_str lstr_where
datetime ld_date
string   ls_item, ls_qa,  ls_source, ls_loc, ls_null, ls_where, ls_sql, ls_area, ls_area2
string   ls_reqdate
int      li_int
		
setnull(ls_null)

dw_1.Accepttext()
this.Accepttext()

if isnull(row) OR row < 1 then return

this.scrolltorow(row)

ls_source = this.object.source[row]
if ls_source = "N" then return		// 선택

if dw_1.object.do_case[1] = "C" then return 	// 미수불

ls_item    = this.object.item_no[row]			// 품목
ls_qa      = this.object.qa[row]					// 규격
ls_loc     = this.object.loc_no[row]			// 저장소
ls_reqdate = string(GF_TODAY(),"yyyy/mm/dd")	// 의뢰일자

choose case dwo.name
	// 선택
	case "source"	
		WF_LocNO( dw_1.object.do_case[1] )		// 미수불 기본값: "A"

		// 출고의뢰 확인
		SELECT count(sale_no) INTO :li_int 
		  FROM issuereqdet 
		 WHERE convert(char(10),req_date,111) = :ls_reqdate;
		if isnull(li_int) OR li_int = 0 then
			if cbx_issue.checked = true then		// 출고의뢰서 체크제외
			else
				MessageBox("확인", "출고의뢰서 미작성 수주는 출고할 수 없습니다.")
			end if
		end if

	case "coil_no"	//
		if trim(ls_loc) <> "" and not isnull(ls_loc) then
			if MidA(ls_item, 4, 1) = "1" then
				wf_coildddw(ls_item, ls_qa, ls_loc )
			elseif MidA(ls_item, 4, 1) = "2" then
				wf_sheetdddw(ls_item, ls_qa, ls_loc)
			end if
		end if
		
	// 가입고, 대체
	case "flag"	
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
				case "intemp"	// 가입고
					//ls_area2 = this.object.sale_area_no[row]
					SELECT def_loc into :ls_loc FROM area WHERE area_no = :gs_area;

					lstr_where.item_name = ls_loc
					lstr_where.chk       = "DO"
					OpenWithParm( w_whintemp_m, lstr_where )
					lstr_where = message.powerobjectparm
					if lstr_where.chk = "N" then return
					
					if lstr_where.chk = "D" then
						this.object.flag[row]         = "N"
						this.object.loc_no[row]       = ls_null
						this.object.issue_qty[row]    = 0
					else
						this.object.flag[row] = "가입"
					end if
	
				case "alter"	// 물품대체
					lstr_where.cust_name = trim(dw_1.object.customer_cust_name[1])
					lstr_where.item_name = trim(dw_2.object.item_name[row])
					
					lstr_where.chk = "D" // "S": 수주확정시 대체저장, "D":출고시 대체저장
					OpenWithParm(w_whalter_w, lstr_where)
					lstr_where = message.powerobjectparm
					if lstr_where.chk = "N" then return
					
					if lstr_where.chk = "X" then
						this.object.flag[row] = "N"
					elseif lstr_where.chk = "Y" then
						this.object.flag[row] = "대체"
					end if
			end choose
		else
			MessageBox("확인", "거래명세서_가입고대체 권한이 없습니다.")
			return
		end if
		
	// 저장소, 수량
	case "loc_no", "issue_qty"	
		ls_area = dw_1.object.do_area_no[1]

		if GF_PERMISSION("거래명세서작성저장소관리", gs_userid) = "Y" then	
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
			WF_ClearDddw()
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

type gb_5 from groupbox within w_oido_m_new
integer x = 1824
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

type gb_4 from groupbox within w_oido_m_new
integer x = 1079
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

type dw_3 from datawindow within w_oido_m_new
integer x = 69
integer y = 264
integer width = 3333
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oicustgiving_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 거래처, 현장 조회
string ls_cust_no, ls_scenehp, ls_where, ls_sql, ls_null
long   ll_cnt

setnull(ls_null)

this.accepttext()

choose case dwo.name
	case "cust_no"
		ls_cust_no = data
		this.object.scene_code[1] = ls_null
		
		SELECT count(*) INTO :ll_cnt FROM scene WHERE cust_no = :ls_cust_no;
		if ll_cnt > 0 then
			dw_3.getchild("scene_code", idwc_scene)
						  
		   ls_where = " WHERE scene.cust_no = ~~'" + ls_cust_no + "~~'" + &
						  "   AND ( scene.scene_code IN (SELECT distinct scene_code FROM sale" + &
			   		  "                               WHERE cust_no = ~~'" + ls_cust_no + "~~'" + &
						  "                                 AND open_close = ~~'O~~' )" + &
						  "       )"
			ls_sql   = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
			
			idwc_scene.modify(ls_sql)
			idwc_scene.settransobject(sqlca)
			ll_cnt   = idwc_scene.retrieve()			
		end if
			
		if ll_cnt > 0 then			
			this.object.scene_code.protect = 0
			this.object.scene_code.background.color = RGB(255,255,255)
		else
			this.object.scene_code.protect = 1 
			this.object.scene_code.background.color = 78682240
		end if
end choose

pb_retrieve.enabled = true
this.setfocus()

end event

type dw_inaudit from datawindow within w_oido_m_new
integer x = 361
integer y = 16
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

type dw_dodet from datawindow within w_oido_m_new
integer x = 475
integer y = 16
integer width = 96
integer height = 84
boolean bringtotop = true
string dataobject = "d_oidodet"
boolean livescroll = true
end type

event dberror;//
is_dwdet_syntax = sqlsyntax + "~n~n" + sqlerrtext

end event

type dw_8 from datawindow within w_oido_m_new
string tag = "d_oigiving_r_21_a5"
integer x = 585
integer y = 16
integer width = 96
integer height = 84
boolean bringtotop = true
string title = "d_oigiving_r_22"
string dataobject = "d_oigiving_r_22_a5"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oido_m_new
integer x = 695
integer y = 16
integer width = 96
integer height = 84
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type em_3 from editmask within w_oido_m_new
integer x = 1111
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

event getfocus;//
em_3.SelectText(9,6)
pb_compute.default = true

end event

type st_2 from statictext within w_oido_m_new
integer x = 3826
integer y = 812
integer width = 247
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

type st_4 from statictext within w_oido_m_new
integer x = 4137
integer y = 772
integer width = 731
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
string text = "<= 부가세 수정할경우 변경에 체크하세요."
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_10 from checkbox within w_oido_m_new
integer x = 4485
integer y = 276
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

type cbx_source from checkbox within w_oido_m_new
integer x = 3904
integer y = 276
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
	end if
else
	dw_source.visible = false
	is_sno = ''
	is_sh  = ''
	is_nm  = ''
	is_js  = ''
end if

end event

type dw_source from datawindow within w_oido_m_new
integer x = 4137
integer y = 376
integer width = 923
integer height = 340
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

type cbx_1 from checkbox within w_oido_m_new
integer x = 1856
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

event clicked;// 시화사업장
if gs_area = "S0001" then
	MessageBox("확인","시화사업장은 명세서를 출력할 수 없습니다.")
	this.checked = false
	RETURN
end if

end event

type cbx_2 from checkbox within w_oido_m_new
integer x = 2075
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

type cbx_temp from checkbox within w_oido_m_new
integer x = 2373
integer y = 16
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "거래일CHECK(30일)"
boolean checked = true
end type

type st_1 from statictext within w_oido_m_new
integer x = 3570
integer y = 812
integer width = 247
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

type cbx_3 from checkbox within w_oido_m_new
integer x = 1856
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

type cbx_4 from checkbox within w_oido_m_new
integer x = 2075
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

type pb_1 from picturebutton within w_oido_m_new
event mousemove pbm_mousemove
integer x = 4910
integer y = 760
integer width = 151
integer height = 120
integer taborder = 120
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

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_2

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인","작업완료")
	end if
end if	

end event

type cbx_5 from checkbox within w_oido_m_new
integer x = 4142
integer y = 896
integer width = 1147
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "출고계획 수량 가져오기(부자재)"
end type

event clicked;// 출고대기 수량 가져오기
// YCERP_JAJE 에서 입력한 출고대기 수량을 출고수량(issue_qty) 으로 가져오기
long	 ll_row,  ll_fitseq, ll_cnt
string ls_null, ls_fitno,  ls_source
decimal ld_shipqty

setnull(ls_null)
if dw_2.object.totsource[1] < 1 then
	this.checked = false
	MessageBox("확인", "출고할 품목을 선택한 후 실행하시기 바랍니다.")
	RETURN
end if

ll_cnt = 0
for ll_row = 1 to dw_2.rowcount()
	if this.checked = true then
		ls_source = dw_2.object.source[ll_row]	// 선택
		if ls_source = "Y" then
			ls_fitno  = dw_2.object.customer_fit_no[ll_row]
			ll_fitseq = dw_2.object.fit_seq[ll_row]
			
			SELECT ship_qty INTO :ld_shipqty FROM fitdet	 
			 WHERE do_no  IS NULL  AND fit_no = :ls_fitno AND fit_seq = :ll_fitseq;
			if isnull(ld_shipqty) or ld_shipqty = 0 then
				// ld_shipqty = 0		// 출고계획에서 ZERO 저장안됨.
			else				
				ll_cnt    = ll_cnt + 1
				dw_2.object.issue_qty[ll_row] = ld_shipqty	
			end if
		end if
	else
	//	dw_2.object.source[ll_row]      = "N"
	//	dw_2.object.loc_no[ll_row]      = ls_null
	//	dw_2.object.issue_qty[ll_row]   = 0
	//	dw_2.object.stock_issue[ll_row] = 0
	end if
next

cbx_5.checked = false 		
if ll_cnt > 0 then
	MessageBox("확인",string(ll_cnt,"#,##0") + "건 대기수량 가져오기 완료")
else
	MessageBox("확인","대기수량 한건도 없음")
end if

dw_2.accepttext()

// 합계금액
wf_calc()

end event

type cbx_6 from checkbox within w_oido_m_new
integer x = 2373
integer y = 152
integer width = 370
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "출고봉투"
end type

event clicked;//
string ls_prt

if this.checked = true then
	sle_prt.enabled = true

	ls_prt  = ProfileString("YCERP.INI","Database","DO_PRT", " ")	
	if isnull(ls_prt) OR ls_prt = "" then ls_prt = PrintGetPrinter()
	sle_prt.text = ls_prt
else
	sle_prt.enabled = false
end if

end event

type dw_4 from datawindow within w_oido_m_new
integer x = 805
integer y = 16
integer width = 96
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_label_main_prt"
boolean livescroll = true
end type

type cbx_issue from checkbox within w_oido_m_new
integer x = 2373
integer y = 88
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "출고의뢰서 체크제외"
end type

type sle_prt from singlelineedit within w_oido_m_new
integer x = 2743
integer y = 140
integer width = 571
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//
string ls_prt

ls_prt = sle_prt.text
SetProfileString("YCERP.INI", "Database", "DO_PRT", ls_prt)

end event

type dw_6 from datawindow within w_oido_m_new
integer x = 914
integer y = 16
integer width = 96
integer height = 84
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "운송처 주소(더블 클릭시 선택)"
string dataobject = "d_orsale_shipaddr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;// 운송처 주소
string ls_shipto_addr, ls_telno, ls_telnocap
long   ll_row

ll_row  = this.getrow()

ls_shipto_addr = dw_6.object.shipto_addr[ll_row]
ls_telno       = dw_6.object.tel_no[ll_row]
ls_telnocap    = dw_6.object.telno_cap[ll_row]

dw_1.object.shipto_addr[1] = ls_shipto_addr
dw_1.object.tel_no[1]      = ls_telno
dw_1.object.telno_cap[1]   = ls_telnocap


cbx_ship.checked = false
cbx_ship.triggerevent( clicked! )

end event

type cbx_ship from checkbox within w_oido_m_new
integer x = 3410
integer y = 276
integer width = 485
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "운송처 주소"
end type

event clicked;//
if this.checked = true then 
	dw_6.visible = true
else
	dw_6.visible = false
end if

end event

type st_left from statictext within w_oido_m_new
integer x = 3017
integer y = 16
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

type em_left from editmask within w_oido_m_new
integer x = 3168
integer y = 4
integer width = 146
integer height = 64
integer taborder = 10
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

type st_9 from statictext within w_oido_m_new
integer x = 3017
integer y = 84
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

type em_top from editmask within w_oido_m_new
integer x = 3168
integer y = 72
integer width = 146
integer height = 64
integer taborder = 20
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

type st_3 from statictext within w_oido_m_new
integer x = 983
integer y = 580
integer width = 2395
integer height = 652
boolean bringtotop = true
integer textsize = -72
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "미 사용"
boolean focusrectangle = false
end type

