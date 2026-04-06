$PBExportHeader$w_ioinslting_m.srw
$PBExportComments$외주스리팅/SHEET입고관리(2000/08/18,이인호)
forward
global type w_ioinslting_m from w_inheritance
end type
type dw_5 from datawindow within w_ioinslting_m
end type
type dw_inspdet from datawindow within w_ioinslting_m
end type
type st_2 from statictext within w_ioinslting_m
end type
type dw_7 from datawindow within w_ioinslting_m
end type
type dw_9 from datawindow within w_ioinslting_m
end type
type dw_8 from datawindow within w_ioinslting_m
end type
type dw_10 from datawindow within w_ioinslting_m
end type
type dw_4 from datawindow within w_ioinslting_m
end type
type cbx_2 from checkbox within w_ioinslting_m
end type
type st_22 from statictext within w_ioinslting_m
end type
type dw_area from datawindow within w_ioinslting_m
end type
type cbx_1 from checkbox within w_ioinslting_m
end type
type st_4 from statictext within w_ioinslting_m
end type
type ddlb_fld from dropdownlistbox within w_ioinslting_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ioinslting_m
end type
type st_7 from statictext within w_ioinslting_m
end type
type ddlb_op from dropdownlistbox within w_ioinslting_m
end type
type sle_value from singlelineedit within w_ioinslting_m
end type
type cb_19 from commandbutton within w_ioinslting_m
end type
type cb_20 from commandbutton within w_ioinslting_m
end type
type cb_21 from commandbutton within w_ioinslting_m
end type
type cb_22 from commandbutton within w_ioinslting_m
end type
type cb_3 from commandbutton within w_ioinslting_m
end type
type cb_2 from commandbutton within w_ioinslting_m
end type
type cb_1 from commandbutton within w_ioinslting_m
end type
type st_1 from statictext within w_ioinslting_m
end type
type st_vertical from u_splitbar_vertical within w_ioinslting_m
end type
type st_horizontal from u_splitbar_horizontal within w_ioinslting_m
end type
end forward

global type w_ioinslting_m from w_inheritance
integer y = 148
integer width = 4722
integer height = 2476
string title = "외주스리팅/SHEET 입고(w_ioinslting_m)"
dw_5 dw_5
dw_inspdet dw_inspdet
st_2 st_2
dw_7 dw_7
dw_9 dw_9
dw_8 dw_8
dw_10 dw_10
dw_4 dw_4
cbx_2 cbx_2
st_22 st_22
dw_area dw_area
cbx_1 cbx_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
st_vertical st_vertical
st_horizontal st_horizontal
end type
global w_ioinslting_m w_ioinslting_m

type variables
string is_supp, is_curr
datawindowchild  idwc_supp

gs_codere_str  ist_code
end variables

forward prototypes
public subroutine wf_cals (long arg_row)
public subroutine wf_amt ()
public subroutine wf_cals1 (long arg_row)
public function boolean wf_save2 (long arg_cnt, string arg_inspno, integer arg_inspseq)
public subroutine wf_print (string arg_flag, date arg_date)
public function string wf_coil (long arg_row)
public subroutine wf_multiprint (string as_insp_no)
end prototypes

public subroutine wf_cals (long arg_row);string ls_item,ls_qa,ls_uom
real   lr_orderqty,lr_rlseqty,lr_unitqty,lr_price
long   ll_cnt

dw_2.accepttext()

ls_item     = trim(dw_2.object.item_no[arg_row])
ls_qa       = trim(dw_2.object.qa[arg_row])
ls_uom      = trim(dw_2.object.com_uom[arg_row])
lr_orderqty = dw_2.object.order_qty[arg_row]			// 발주수량
lr_rlseqty  = dw_2.object.rlse_qty[arg_row]			// 기입고수량
if isnull(lr_rlseqty) then	lr_rlseqty = 0

ll_cnt = dw_2.object.cnt[arg_row]
if isnull(ll_cnt)  then
	dw_2.object.cnt[arg_row] = 1
	ll_cnt = 1
end if

lr_price   = dw_2.object.price[arg_row]
lr_unitqty = dw_2.object.unit_qty[arg_row]

// 품목코드 4번째: 소재구분
if MidA(ls_item,4,1) = "1" then		// 1:코일, 2:SHEET
	dw_2.object.rcpt_qty[arg_row] = ll_cnt * lr_unitqty
else
	dw_2.object.rcpt_qty[arg_row] = lr_orderqty - lr_rlseqty 
	dw_2.object.cnt[arg_row]      = lr_orderqty - lr_rlseqty 
end if

if dw_2.object.rcpt_qty[arg_row] = 0 then
	dw_2.object.cnt[arg_row] = 1
	dw_2.object.rcpt_qty[arg_row] = dw_2.object.order_qty[arg_row]
end if

choose case ls_uom
	case 'M'
		dw_2.object.com_qty[arg_row] = truncate((real(MidA(ls_qa,15,5)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0 )
	case 'M2'
		dw_2.object.com_qty[arg_row] = truncate((real(MidA(ls_qa,5,4)) / 1000.0) * (real(MidA(ls_qa,10,4)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
	case 'KG'
		if dw_2.object.uom[arg_row] = 'SH' then
			dw_2.object.com_qty[arg_row] = TRUNCATE(ll_cnt * lr_unitqty, 3)
		else
			dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row]
		end if
  case else
		dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row] 
end choose

end subroutine

public subroutine wf_amt ();int li_int
//
dw_5.object.insp_cash[1] = 0
dw_5.object.insp_rate[1] = 0
dw_5.object.insp_total[1] = 0
dw_5.accepttext()
dw_2.accepttext()
dw_2.groupcalc()
dw_5.setredraw(false)
for li_int = 1 to dw_2.rowcount()
	if dw_2.object.chk[li_int] = "Y" then
	    dw_5.object.insp_cash[1] = dw_5.object.insp_cash[1] + dw_2.object.amt[li_int]
   	 dw_5.object.insp_rate[1] = dw_5.object.insp_rate[1] + dw_2.object.rcpt_rate[li_int]
	end if
end for
dw_5.accepttext()
dw_5.groupcalc()
dw_5.object.insp_total[1] = dw_5.object.insp_rate[1] + dw_5.object.insp_cash[1] + dw_5.object.ship_amount[1]
dw_5.setredraw(true)

end subroutine

public subroutine wf_cals1 (long arg_row);string ls_item, ls_qa,ls_uom
real   lr_rlseqty,lr_unitqty,lr_price
long   ll_cnt

dw_2.accepttext()

ls_item = trim(dw_2.object.item_no[arg_row])
ls_qa   = trim(dw_2.object.qa[arg_row])
ls_uom  = trim(dw_2.object.com_uom[arg_row])
ll_cnt  = dw_2.object.cnt[arg_row]
if isnull(ll_cnt) then
	dw_2.object.cnt[arg_row] = 1
	ll_cnt = 1
end if

// 품목코드 4번째: 소재구분( 1:코일, 2:SHEET )
if MidA(ls_item,4,1) = "1" then
	dw_2.object.rcpt_qty[arg_row] = dw_2.object.cnt[arg_row] * dw_2.object.unit_qty[arg_row]
else
	dw_2.object.rcpt_qty[arg_row] = dw_2.object.cnt[arg_row]
end if

lr_price   = dw_2.object.price[arg_row]
lr_unitqty = dw_2.object.unit_qty[arg_row]

if  dw_2.object.work_type[arg_row] = "S" then
else
	choose case ls_uom
		case 'M'
			 dw_2.object.com_qty[arg_row] = truncate((real(MidA(ls_qa,15,5)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0 )
		case 'M2'
			 dw_2.object.com_qty[arg_row] = truncate((real(MidA(ls_qa,5,4)) / 1000.0) * (real(MidA(ls_qa,10,4)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
		case 'KG'
			if dw_2.object.uom[arg_row] = 'SH' then
				dw_2.object.com_qty[arg_row] = TRUNCATE(ll_cnt * lr_unitqty, 3)
			else
				dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row]
			end if
		case else
			 dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row] 
	end choose
end if

end subroutine

public function boolean wf_save2 (long arg_cnt, string arg_inspno, integer arg_inspseq);// 
string ls_inspno, ls_item, ls_supp, ls_newloc, ls_qa, ls_coilorder, ls_coil, ls_etc
string ls_product_no, ls_wcoil, ls_subcon, ls_result, ls_flag
string ls_slitflag, ls_orderflag, ls_old_time, ls_sheet, ls_sqlerrtext
string ls_loc, ls_oc, ls_witem_no, ls_wqa, ls_array[1], ls_destination, ls_wloc
int    li_inspseq,  li_cnt, li_wunit_qty, li_wcoilcnt, li_wcoil_cnt
long   ll_cnt, ll_seq, ll_count, ll_row, ll_qcnt
real   lr_unitqty, lr_com_qty, lr_newqty, lr_orderqty, lr_rlseqty
datetime ldt_date
decimal{4} lr_price
decimal{1} ld_w_wid, ld_wid
dec{2} ld_length
string ls_check, ls_check_sum

dw_1.accepttext()
dw_2.accepttext()
dw_5.accepttext()

ls_inspno   = trim(arg_inspno)
li_inspseq  = arg_inspseq

ldt_date    = dw_5.object.insp_date[1]
ls_item     = trim(dw_2.object.item_no[arg_cnt])
ls_supp     = trim(dw_1.object.supp_no[1])
ls_newloc   = trim(dw_2.object.loc_no[arg_cnt])
ll_cnt      = dw_2.object.cnt[arg_cnt]
lr_orderqty = dw_2.object.order_qty[arg_cnt]
lr_newqty   = dw_2.object.rcpt_qty[arg_cnt]
lr_rlseqty  = dw_2.object.rlse_qty[arg_cnt]
lr_price    = dw_2.object.price[arg_cnt]
ls_qa       = trim(dw_2.object.qa[arg_cnt])
ld_wid      = dec(MidA(dw_2.object.qa[arg_cnt], 5,4) + "." + MidA(dw_2.object.qa[arg_cnt], 10,1))

ls_sheet    = dw_2.object.work_type[arg_cnt]
ls_coil     = trim(dw_2.object.coil_no[arg_cnt])
ls_product_no = trim(dw_2.object.product_no[arg_cnt])		// 생산주문번호
ll_seq      = dw_2.object.serial_no[arg_cnt]
ls_subcon   = trim(dw_2.object.pur_subcon[arg_cnt])
ls_result   = trim(dw_2.object.result_type[arg_cnt])
lr_unitqty  = dw_2.object.unit_qty[arg_cnt]
lr_com_qty  = dw_2.object.com_qty[arg_cnt]

if ls_result = "P" then
	ls_flag = "P"	// 작업중(부분입고중)
else
	ls_flag = "C"	// 입고완료
end if

// 스리팅계획
UPDATE coilsliting SET proc_flag = :ls_flag WHERE order_no = :ls_product_no AND seq = :ll_seq;

if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
	MessageBox('UPDATE오류1',"[coilsliting]UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
	RETURN FALSE
end if

SELECT count(*) INTO :li_cnt FROM coilsliting WHERE order_no = :ls_product_no	AND proc_flag in ( 'P', 'O');

if li_cnt > 0 then
	ls_slitflag = "P"// 작업중(부분입고중)
else
	ls_slitflag = "C"// 입고완료
end if

// 코일생산계획 상세
UPDATE coilorderdet SET proc_flag = :ls_slitflag WHERE order_no = :ls_product_no;

if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
	MessageBox('UPDATE오류6',"코일작업오더[coilorderdet]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
	RETURN FALSE
end if


//ls_check = ''
//ls_check_sum = ''
/*2019-09-02 jowonsuk rem4이 N이면 inaudit에서 외주출고(IO)중 코일합체건이 일어나야 함, 'Y'이면 이미출고가 일어났으므로 더이상 출고 하면 안된다. */
/*2019-09-02 jowonsuk rem5이 N이면 inaudit에서 외주출고(IO)가 일어나야 함, 'Y'이면 이미출고가 일어났으므로 더이상 출고 하면 안된다. */
/*2020-08-10 jowonsuk 주석처리 필요없는 로직, 부분 입고는 없다. 무조건 한번에 다 해결 */
SELECT coilorder_order, cnt 
INTO :ls_coilorder, :li_wcoil_cnt
FROM coilorderdet
WHERE order_no = :ls_product_no;

SELECT count(*) INTO :li_cnt 
FROM coilorderdet
WHERE coilorder_order = :ls_coilorder	AND proc_flag = 'P';
 
if li_cnt > 0 then
	ls_orderflag = "O"// 작업중(구매발주중)
else
	ls_orderflag = "C"// 입고완료
end if

// 코일작업지시
UPDATE coilorder SET open_close = :ls_orderflag WHERE order_no = :ls_coilorder;

if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
	MessageBox('UPDATE오류7',"코일작업오더[coilorder]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
	RETURN FALSE
end if

// 스리팅계획
SELECT coil_no, wid, loc_no INTO :ls_wcoil, :ld_w_wid, :ls_wloc 
FROM coilsliting
WHERE order_no = :ls_product_no AND seq = :ll_seq;
 
if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
	MessageBox('select오류',"코일마스터[coilsliting]select시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
	RETURN FALSE
end if

setnull(ls_oc) ; setnull(ls_witem_no) ; setnull(ls_wqa) ; setnull(li_wunit_qty) ; ld_length = 0

// 코일마스터
SELECT item_no, qa, open_close, unit_qty, length, qcnt
INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty, :ld_length, :ll_qcnt
FROM coilmst
WHERE coil_no = :ls_wcoil	AND loc_no = :ls_supp;
 
if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
	if sqlca.sqlcode = 100 then
		MessageBox('확인',"원코일 [" + ls_wcoil + "] 이 거래처로 이동이 되지 않았습니다.~r~n" &
					       + "코일 이동관리에서 원코일을 이동후에 작업하십시요")
	else
		MessageBox('오류 7-1',"코일마스터[coilmst]select시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
	end if
	RETURN FALSE
end if

if ls_slitflag = "C" then
	UPDATE coilmst 
	SET qcnt = qcnt - :li_wcoil_cnt, open_close = ( CASE WHEN  qcnt - :li_wcoil_cnt > 0 THEN open_close ELSE 'C' END ) /*2020-08-08 JOWONSUK 수정*/
	WHERE coil_no = :ls_wcoil	AND loc_no = :ls_supp AND open_close <> 'C';
		 
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		ROLLBACK;
		MessageBox('오류','[wf_save2]coilmst UPDATE중 DB오류발생하였습니다.~r~n' &
							+ ' coil_no=[' + ls_wcoil + '] wid = ' + string(ld_w_wid, "####.0"),exclamation!)
		RETURN FALSE	
	end if
				  
	// [IO]외주에서 출고 로직입니다.	
	// 재고수불 
	/*2019.06.24 jowonsuk li_wunit_qty => li_wunit_	qty*li_wcoil_cnt 로 변경 */	
	INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
			 rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty , user_id)  	
	VALUES (getdate(), :ldt_date, :ls_witem_no, :ls_wqa, :ls_supp, 'IO', :ls_inspno,
			  0, :li_wunit_qty*:li_wcoil_cnt, 0, :ls_supp, :ls_wcoil, '외주스리팅/sheet', :li_wunit_qty, :li_inspseq, :li_wunit_qty, :gs_userid);
			  
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		ROLLBACK;
		MessageBox('오류9','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
		RETURN FALSE
	end if		
end if


//////////////////////////////////////////////////////////
ls_array[1] = ls_product_no
dw_8.retrieve( ls_array )			// 코일생산계획(합체)
//////////////////////////////////////////////////////////

IF ls_slitflag = "C" THEN
	for ll_row = 1 to dw_8.rowcount()
		ls_wcoil  = dw_8.object.coil_no[ll_row]
		ls_wloc   = dw_8.object.loc_no[ll_row]
		
		setnull(ls_oc) ; setnull(ls_witem_no) ; setnull(ls_wqa) ; setnull(li_wunit_qty) ; ld_length = 0
		
		SELECT item_no, qa, open_close, unit_qty, length, etc_no
		INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty, :ld_length, :ls_etc 
		FROM coilmst
		WHERE coil_no = :ls_wcoil	AND loc_no = :ls_supp;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			ROLLBACK;
			MessageBox('오류18',ls_wcoil + " " + ls_supp + " 코일마스터[coilmst]select시 오류가 발생했습니다.(코일생산계획(합체))~r~n" + ls_sqlerrtext,exclamation!)
			RETURN FALSE
		end if
		
		li_wcoilcnt   = dw_8.object.cnt[ll_row]
		ls_product_no = dw_8.object.order_no[ll_row]
		
		UPDATE coilmst 
		SET qcnt = qcnt - :li_wcoilcnt, open_close = ( CASE WHEN  qcnt - :li_wcoilcnt > 0 THEN open_close ELSE 'C' END ) /*2020-08-08 JOWONSUK 수정*/
		WHERE coil_no = :ls_wcoil	AND loc_no = :ls_supp;
		 
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			ROLLBACK;
			MessageBox('오류2',"코일마스터에 자료가 없습니다.~r~n" + ls_sqlerrtext,exclamation!)
			RETURN FALSE
		end if
		
		// [IO]외주출고 로직입니다.
		INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
				 rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty , user_id)  
		VALUES ( getdate(), :ldt_date, :ls_witem_no, :ls_wqa, :ls_supp, 'IO', :ls_inspno,
				 0, :li_wunit_qty * :li_wcoilcnt, 0, :ls_supp, :ls_wcoil, 'coilsum_IO', :li_wunit_qty, :li_inspseq, :li_wunit_qty, :gs_userid);			 
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			ROLLBACK;
			MessageBox('오류16','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN FALSE
		end if	

	next
end if

//스리팅코일추가
if MidA(ls_item ,4,1) = "1" then // 1; coil , 2 : sheet
	INSERT INTO coilmst (coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
					cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close,
					rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
	VALUES (:ls_coil, :ld_wid, :ls_item, :ls_qa, :ls_newloc, :ldt_date, convert(dec, :lr_unitqty), :ld_length,
			  :ll_cnt, :ll_cnt,    :ls_inspno,  :ls_supp, 'S', :ls_product_no, :ll_seq, 'O', 
			  '외주가공입고', convert(dec, :lr_unitqty), :ld_length, :ls_etc, :ls_wcoil);
	if sqlca.sqldbcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		ROLLBACK;
		MessageBox('오류10','[코일마스터]' + string(arg_cnt) + '행 insert중 DB오류발생하였습니다.',exclamation!)
		RETURN FALSE
	end if
ELSE
	//sheet추가
	INSERT INTO sheetmst (sheet_no,  item_no,   qa,    loc_no,  rcpt_date, unit_qty,   
			 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close, rem, rcpt_qty)
	VALUES (:ls_coil, :ls_item, :ls_qa, :ls_newloc, :ldt_date, :lr_unitqty, 
			:ll_cnt, :ll_cnt,    :ls_inspno,  :ls_supp, 'S', :ls_product_no, :ll_seq, 'O', 
			'외주가공입고', :lr_unitqty);
	if sqlca.sqldbcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		ROLLBACK;
		MessageBox('오류10-1','[sheet마스터] insert중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
		RETURN FALSE
	end if
end if
		 
// 외주가공입고 로직입니다.
INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type,	order_no, destination, 
		 rcpt_qty, issue_qty, cost,  cnt, unit_qty, serial_id, com_qty, rem, user_id)
VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_newloc, 'RO',   :ls_inspno, :ls_supp,
		 :lr_newqty, 0, :lr_price,  :li_inspseq, :lr_unitqty, :ls_coil, :ll_seq, :ls_product_no, :gs_userid);   
		 
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
   MessageBox('오류','입출고역에 추가중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
   RETURN FALSE					
end if

RETURN true

end function

public subroutine wf_print (string arg_flag, date arg_date);long ll_row, ll_cnt
string ls_class
datawindow dw_print
ll_row = dw_8.rowcount()
CHOOSE CASE arg_flag
	CASE 'S'
		ls_class = "상품"
		dw_print = dw_10
	CASE 'W'
		dw_print = dw_9
		ls_class = "원자재"
	CASE 'B'
		dw_print = dw_10
		ls_class = "부자재"
	CASE 'Y'
		dw_print = dw_10
		ls_class = "외주가공"
END CHOOSE

dw_print.reset()
for ll_cnt = 1 to ll_row
	dw_print.object.item_class[ll_cnt] = ls_class
	dw_print.object.in_date[ll_cnt] = arg_date
	dw_print.object.cust_name[ll_cnt] = dw_8.object.supp_supp_name[ll_cnt]
	dw_print.object.group_name[ll_cnt] = trim(dw_8.object.inspdet_insp_no[ll_cnt])
	dw_print.object.item_name[ll_cnt] = dw_8.object.groupitem_item_name[ll_cnt]
	dw_print.object.seq[ll_cnt] = dw_8.object.inspdet_oi_no[ll_cnt]
	dw_print.object.qa[ll_cnt] = dw_8.object.qa[ll_cnt]
	dw_print.object.ea[ll_cnt] = dw_8.object.uom[ll_cnt]
	dw_print.object.qty[ll_cnt] = dw_8.object.comqty[ll_cnt]
//	if arg_flag = "W" then
//		dw_print.object.cost[ll_cnt] = 0
//		dw_print.object.amount[ll_cnt] = 0
//	else
		dw_print.object.cost[ll_cnt] = dw_8.object.price[ll_cnt]
		dw_print.object.amount[ll_cnt] = dw_8.object.ori_amount[ll_cnt]
//	end if
//	dw_print.object.dept[ll_cnt] = dw_8.object.[ll_cnt]
//	dw_print.object.acct_desc[ll_cnt] = dw_8.object.[ll_cnt]
	dw_print.object.rem[ll_cnt] = dw_8.object.rem[ll_cnt]
next
end subroutine

public function string wf_coil (long arg_row);/*
long ll_row, ll_count, l_len, l_pos
int li_col
string ls_coil, ls_date, ls_loc, ls_item, ls_code1, ls_code2

dw_2.accepttext()
dw_5.accepttext()
ls_loc = dw_2.object.loc_no[arg_row] 
ls_item =  trim(dw_2.object.item_no[arg_row])
// 2001/05/31변경
		//===================================================
		// 로트 번호 부여 규칙.
		//소재   형태
		//A :알미늄 C :원코일
		//S :스틸   H :sheet
		//			   S :외주스리팅
		//Y S : 유창작업장내 스리팅 -- 사내 작업일보시만 적용.
		// 예)SC010531001 :스틸 원코일2001년 5월 31일자 001번째 로트번호
		//===================================================
		// 현 코드규칙
		// mid(item_no, 1,1) = 'M' : 자재
		// 	mid(item_no, 2,1) = '1' : 원코일
		// 	mid(item_no, 2,1) = '3' : 스리팅
		// 		mid(item_no, 3,1) = 'A' : 알미늄
		// 		mid(item_no, 3,1) = 'S' : 스틸
		// 			mid(item_no, 4,1) = '1' : COIL
		// 			mid(item_no, 4,1) = '2' : SHEET
		//===================================================
		// loss 코드규칙(2001/07/16,이대준)
		// 		mid(item_no, 1,1) = 'A' : 알미늄
		// 		mid(item_no, 1,1) = 'S' : 스틸
		//    	mid(item_no, 2,1) = 'L' : loss
		// 	
		// 예)AL01071701, SL01071701
		//===================================================
	


//CHOOSE CASE mid(ls_item ,3,1)
//	CASE 'A' // 알미늄
//		ls_code1 = 'A'
//	CASE 'S' // 스틸
//		ls_code1 = 'S'
//END CHOOSE
ls_code1 = mid(ls_item ,3,1)

select  count(item_no) into :ll_count
from lossitem
where loss_item = :ls_item;

if ll_count > 0 then
	ls_code2 = 'L'
	li_col = 11
else
	CHOOSE CASE mid(ls_item ,2,1)
	CASE '1' // 원코일
		ls_code2 = 'C'
	CASE '3' // 스리팅
		ls_code2 = 'S'
   END CHOOSE

	CHOOSE CASE mid(ls_item ,4,1)
		CASE '2' //SHEET
			ls_code2 = 'H'
	END CHOOSE
	li_col = 12
end if
// 2001/05/31변경 end
//ls_date = ls_code1 + ls_code2 + mid(string(dw_5.object.insp_date[1], 'yyyymmdd'), 3) + "%"
//
//setnull(ls_coil)
//if mid(ls_item ,4,1) = "1" then
//	select max(coil_no) into :ls_coil from coilmst
//	 where coil_no like :ls_date
//	   and ( substring(coil_no,:li_col,1) is null or substring(coil_no,:li_col,1) = '' );
//else
//	select max(sheet_no) into :ls_coil from sheetmst
//	 where sheet_no like :ls_date
//	   and ( substring(sheet_no,:li_col,1) is null or substring(sheet_no,:li_col,1) = '' );
//end if

/*2021.02.26 jowonsuk like에서 %로 검색시, 1000 이상이 검색이 안됨.*/
ls_date = ls_code1 + ls_code2 + mid(string(dw_5.object.insp_date[1], 'yyyymmdd'), 3)
setnull(ls_coil)
l_len = 0
if mid(ls_item ,4,1) = '1' then // 1; coil , 2 : sheet
	SELECT :ls_date + ( case when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 10 then convert(char(1), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                                when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 100 then convert(char(2), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                                when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 1000 then convert(char(3), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                                when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 10000 then convert(char(4), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                       end ) INTO :ls_coil
	  FROM coilmst
	   where substring(coil_no,1,8) = :ls_date
	    AND ( ( substring(coil_no,:li_col,1) is null or  substring(coil_no,:li_col,1) = '' ) OR ( substring(coil_no,:li_col+1,1) is null or  substring(coil_no,:li_col+1,1) = '' ) ) ;
else
	SELECT :ls_date + ( case when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 10 then convert(char(1), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                               when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 100 then convert(char(2), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                               when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 1000 then convert(char(3), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                               when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 10000 then convert(char(4), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                  end ) INTO :ls_coil
	  FROM sheetmst
	  where substring(sheet_no,1,8) = :ls_date
	    AND ( ( substring(sheet_no,:li_col,1) is null or  substring(sheet_no,:li_col,1) = '' ) OR ( substring(sheet_no,:li_col+1,1) is null or  substring(sheet_no,:li_col+1,1) = '' ) ) ;
end if

select len(substring(:ls_coil,9,len(:ls_coil)) ) 
  into :l_len
from dual;

//if isnull(ls_coil) then
//	if ll_count > 0 then
//		ls_coil = left(ls_date, 8) + "00"
//	else
//	   ls_coil = left(ls_date, 8) + "000"
//   end if  
//end if

// 2021.08.25 주석처리
//if l_len = 0 then
//   if ll_count > 0 then
//		ls_coil = left(ls_date, 8) + "00"
//   else
//	   ls_coil = left(ls_date, 8) + "000"
//   end if  	
//
//  l_len = 3
//end if	

// 2021.08.25 신규로직
if l_len <= 3 then
	
	if ll_count > 0 then
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,2))  ,'00')
	else
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,3))  ,'000')
	end if
	
	if l_len = 0 then
	  l_len = 3
	end if		
	
else

	if ll_count > 0 then
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,3))  ,'000')
	else
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,4))  ,'0000')
	end if	
	
end if

l_pos = 0

if l_len <= 3 then
	
	for ll_row = 1 to dw_2.rowcount()
		if dw_2.object.chk[ll_row] = "Y" and not isnull(dw_2.object.coil_no[ll_row]) then
			
			l_pos = pos( dw_2.object.coil_no[ll_row] , '-' )
			
			if l_pos = 0 then
				l_pos = 9
			else
				l_pos = l_pos - 1
			end if
			
			if left(ls_coil,2) = left(dw_2.object.coil_no[ll_row], 2) &
				and long(mid(ls_coil,3,9)) < long(mid(dw_2.object.coil_no[ll_row],3, l_pos)) then
				ls_coil = dw_2.object.coil_no[ll_row] 
			end if
			
		end if
	next
	
else
	
	if ll_count > 0 then
		li_col = 12
	else
		li_col = 13
	end if 
	
	for ll_row = 1 to dw_2.rowcount()
		if dw_2.object.chk[ll_row] = "Y" and not isnull(dw_2.object.coil_no[ll_row]) then
			
			l_pos = pos( dw_2.object.coil_no[ll_row] , '-' )
			
			if l_pos = 0 then
				l_pos = 4
			else
				l_pos =  l_pos - 1
			end if			

			if left(ls_coil,2) = left(dw_2.object.coil_no[ll_row], 2) &
				and long(mid(ls_coil,3,9)) < long(mid(dw_2.object.coil_no[ll_row],3, l_pos)) then
				ls_coil = dw_2.object.coil_no[ll_row] 
			end if
			
		end if
	next	
	
end if

select len(substring(:ls_coil,9,len(:ls_coil)) ) 
  into :l_len
from dual;

if l_len <= 3 then
	
	if ll_count > 0 then
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,2)) + 1 ,'00')
	else
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,3)) + 1 ,'000')
	end if
	
else

	if ll_count > 0 then
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,3)) + 1 ,'000')
	else
		ls_coil = left(ls_coil, 8) + string(integer(mid(ls_coil,9,4)) + 1 ,'0000')
	end if	
	
end if

return ls_coil
*/



long ll_row, ll_count, l_len, l_pos, l_pos_o, l_seq
int li_col
string ls_coil, ls_date, ls_loc, ls_item, ls_code1, ls_code2

dw_2.accepttext()
dw_5.accepttext()
ls_loc = dw_2.object.loc_no[arg_row] 
ls_item =  trim(dw_2.object.item_no[arg_row])
// 2001/05/31변경
		//===================================================
		// 로트 번호 부여 규칙.
		//소재   형태
		//A :알미늄 C :원코일
		//S :스틸   H :sheet
		//			   S :외주스리팅
		//Y S : 유창작업장내 스리팅 -- 사내 작업일보시만 적용.
		// 예)SC010531001 :스틸 원코일2001년 5월 31일자 001번째 로트번호
		//===================================================
		// 현 코드규칙
		// mid(item_no, 1,1) = 'M' : 자재
		// 	mid(item_no, 2,1) = '1' : 원코일
		// 	mid(item_no, 2,1) = '3' : 스리팅
		// 		mid(item_no, 3,1) = 'A' : 알미늄
		// 		mid(item_no, 3,1) = 'S' : 스틸
		// 			mid(item_no, 4,1) = '1' : COIL
		// 			mid(item_no, 4,1) = '2' : SHEET
		//===================================================
		// loss 코드규칙(2001/07/16,이대준)
		// 		mid(item_no, 1,1) = 'A' : 알미늄
		// 		mid(item_no, 1,1) = 'S' : 스틸
		//    	mid(item_no, 2,1) = 'L' : loss
		// 	
		// 예)AL01071701, SL01071701
		//===================================================
	


//CHOOSE CASE mid(ls_item ,3,1)
//	CASE 'A' // 알미늄
//		ls_code1 = 'A'
//	CASE 'S' // 스틸
//		ls_code1 = 'S'
//END CHOOSE
ls_code1 = MidA(ls_item ,3,1)

select  count(item_no) into :ll_count
from lossitem
where loss_item = :ls_item;

if ll_count > 0 then
	ls_code2 = 'L'
	li_col = 11
else
	CHOOSE CASE MidA(ls_item ,2,1)
	CASE '1' // 원코일
		ls_code2 = 'C'
	CASE '3' // 스리팅
		ls_code2 = 'S'
   END CHOOSE

	CHOOSE CASE MidA(ls_item ,4,1)
		CASE '2' //SHEET
			ls_code2 = 'H'
	END CHOOSE
	li_col = 12
end if

/*2021.02.26 jowonsuk like에서 %로 검색시, 1000 이상이 검색이 안됨.*/
ls_date = ls_code1 + ls_code2 + MidA(string(dw_5.object.insp_date[1], 'yyyymmdd'), 3)
setnull(ls_coil)
l_len = 0

if MidA(ls_item ,4,1) = '1' then // 1; coil , 2 : sheet
	SELECT :ls_date + ( case when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 10 then convert(char(1), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                                when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 100 then convert(char(2), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                                when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 1000 then convert(char(3), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                                when max(convert(decimal, substring(coil_no, 9, len(coil_no))))  < 10000 then convert(char(4), max(convert(decimal, substring(coil_no, 9, len(coil_no)))) )
                                       end ) INTO :ls_coil
	  FROM coilmst
	   where substring(coil_no,1,8) = :ls_date;
else
	SELECT :ls_date + ( case when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 10 then convert(char(1), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                               when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 100 then convert(char(2), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                               when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 1000 then convert(char(3), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                               when max(convert(decimal, substring(sheet_no, 9, len(sheet_no))))  < 10000 then convert(char(4), max(convert(decimal, substring(sheet_no, 9, len(sheet_no)))) )
                                  end ) INTO :ls_coil
	  FROM sheetmst
	  where substring(sheet_no,1,8) = :ls_date;
end if


//if isnull(ls_coil) then
//	if ll_count > 0 then
//		ls_coil = left(ls_date, 8) + "00"
//	else
//	   ls_coil = left(ls_date, 8) + "000"
//   end if  
//end if

/*신규로직 2022-04-27, 시작*/
IF ISNULL(ls_coil) THEN
	ls_coil = LeftA(ls_coil, 8) + string(l_seq ,  '00')
ELSE	
	//select LEN(CONVERT(DECIMAL, substring(:ls_coil,9, len(:ls_coil)) ) + 1),  CONVERT( decimal, substring(:ls_coil,9, len(:ls_coil) ) ) + 1
	select LEN(CONVERT(DECIMAL, substring(:ls_coil,9, len(:ls_coil)) ) ),  CONVERT( decimal, substring(:ls_coil,9, len(:ls_coil) ) )
		INTO :l_len, :l_seq
	from dual;
	
	if l_len < 2 then
		ls_coil = LeftA(ls_coil, 8) + string(l_seq ,  '00')
	else
		ls_coil = LeftA(ls_coil, 8) + string(l_seq)
	end if
END IF

/*신규로직 2022-04-27, 종료*/

l_pos = 0
l_pos_o = 0

//if l_len <= 3 then
	
	for ll_row = 1 to dw_2.rowcount()
		if dw_2.object.chk[ll_row] = "Y" and not isnull(dw_2.object.coil_no[ll_row]) then
			
			l_pos = PosA( dw_2.object.coil_no[ll_row] , '-' )
			l_pos_o = 8 + l_len
			
			if l_pos = 0 then
//				l_pos = 9
				l_pos = 12
			else
				l_pos = l_pos - 1
			end if
			
			if LeftA(ls_coil,2) = LeftA(dw_2.object.coil_no[ll_row], 2) &
				and dec(MidA(ls_coil,3,l_pos_o)) < dec(MidA(dw_2.object.coil_no[ll_row],3, l_pos)) then /*2022-07-01 jowonsuk  long -> dec */
				ls_coil = dw_2.object.coil_no[ll_row] 
			end if
			
		end if
	next
	
//else
//	
//	if ll_count > 0 then
//		li_col = 12
//	else
//		li_col = 13
//	end if 
//	
//	for ll_row = 1 to dw_2.rowcount()
//		if dw_2.object.chk[ll_row] = "Y" and not isnull(dw_2.object.coil_no[ll_row]) then
//			
//			l_pos = pos( dw_2.object.coil_no[ll_row] , '-' )
//			
//			if l_pos = 0 then
//				l_pos = 4
//			else
//				l_pos =  l_pos - 1
//			end if			
//
//			if left(ls_coil,2) = left(dw_2.object.coil_no[ll_row], 2) &
//				and long(mid(ls_coil,3,9)) < long(mid(dw_2.object.coil_no[ll_row],3, l_pos)) then
//				ls_coil = dw_2.object.coil_no[ll_row] 
//			end if
//			
//		end if
//	next	
//	
//end if


/*신규로직 2022-04-27, 시작*/
IF ISNULL(ls_coil) THEN
	ls_coil = LeftA(ls_coil, 8) + string(l_seq ,  '00')
ELSE	
//	select LEN(CONVERT(DECIMAL, substring(:ls_coil,9, len(:ls_coil)) ) ),  CONVERT( decimal, substring(:ls_coil,9, len(:ls_coil) ) )
	select LEN(CONVERT(DECIMAL, substring(:ls_coil,9, len(:ls_coil)) ) + 1),  CONVERT( decimal, substring(:ls_coil,9, len(:ls_coil) ) ) + 1
		INTO :l_len, :l_seq
	from dual;
	
	if l_len < 2 then
		ls_coil = LeftA(ls_coil, 8) + string(l_seq ,  '00')
	else
		ls_coil = LeftA(ls_coil, 8) + string(l_seq)
	end if
END IF
/*신규로직 2022-04-27, 끝*/
return ls_coil
end function

public subroutine wf_multiprint (string as_insp_no);gs_where lst_where

lst_where.str1 = as_insp_no
lst_where.str2 = '0'

OpenWithParm ( w_multiprint_r, lst_where)  // 입고번호 날려야 됨.
//w_repsuper w_print
//st_print l_print
//
//dw_8.dataobject = 'd_ioinsliting_r'
//dw_8.settransobject(sqlca)
//dw_8.retrieve(as_insp_no)
//
//l_print.st_datawindow = dw_8
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 입고명세서를 출력합니다."
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)
//
////
////
////// 멀티 프린트.
//////Windows Registry Editor Version 5.00
//////[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows]
//////"Device"="\\\\내컴\\HP LaserJet 4V,winspool,Ne04:"
//////프린터가 여러대라고 하니, 아마도 랜으로 공유한것 같네요.
//////위와 같은 레지스트리를 수정하시고 프린터 하시면 되겠네요.
//////디바이스 명을 수정하시면 기본 프린터가 변경 될것입니다.
//////[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Devices] 에 
//////프린터 이름이 나옵니다.
//////여기에 올라 와 있는 프린터 이름중에서 기본 프린터로 정하고자 하는 것을 
//////디바이스에 적어 주시면 될 것입니다.
//// 
////dw_8.dataobject = 'd_ioinsliting_r'
////dw_8.settransobject(sqlca)
////dw_8.retrieve(as_insp_no)
////
//////
//////string ls_dw7sql, ls_sql,ls_where
//////
//////		ls_dw7sql = dw_8.describe("datawindow.table.select")
//////		ls_where = " and sale.order_no between ~~'hd20040317-001~~'" &
//////					+ " and ~~'hd20040317-003~~'"  
//////		ls_sql = "datawindow.table.select = '" + ls_dw7sql + ls_where + "'"
//////			
//////		dw_8.modify(ls_sql)
//////
////LONG msgHWND_BROADCAST = 65535 // HEX FFFF
////LONG msgWM_WININICHANGE = 26   // HEX 1A
////WriteProfileStringA("windows", "device", &
////				"\\\\박상준\\hp officejet 6100 series,winspool,Ne00");
////dw_8.print()
////////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////dw_8.Modify('DataWindow.Print.Orientation = 1')
//////\\192.168.3.30\tsc-243 xp,winspool,Ne09:
//////\\박상준\hp officejet 6100 series,winspool,Ne00:
//////"HP officejet 6100 series,HPBXLB,\\
////WriteProfileStringA("windows", "device", &
////				"HP LaserJet 5100 PCL 5e,winspool,Ne05:");
////dw_8.print()
////
////
////////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
////////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
////////Microsoft Fax,WPSUNI,FAX
//////
////////LONG msgHWND_BROADCAST = 65535 // HEX FFFF
////////LONG msgWM_WININICHANGE = 26   // HEX 1A
////////
//////////// 첫번째프린터에는 FAX(시화로 출력)
//////////WriteProfileStringA("windows", "device", &
//////////				"Microsoft Fax,WPSUNI,FAX");
//////////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////////dw_8.print()
////////// 첫번째프린터에는 HP5000(시화로 출력)
////////WriteProfileStringA("windows", "device", &
////////				"HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\192.168.1.11");
////////WriteProfileStringA("","",""); // flushes cached WIN.INI
////////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////////dw_8.print()
//////
////////// 두번째프린터에는 4MV(목동(판매부)으로 출력)
////////WriteProfileStringA("windows", "device", &
////////				"HP LaserJet 4MV,HPPCL5MS,\\HP_Network_Printers\122.1.1.203");
////////WriteProfileStringA("","",""); // flushes cached WIN.INI
////////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////////dw_8.print()
//////
////////시화에서 목동프린터(HP NET PRINTER : 4MV) 로 프린팅과
//////// 시화 HP NET PRINTER(HP5000) 로 의 동시 프린팅 테스트
//////////			dw_8.print()
//////// SYSEDIT.EXE "WIN.INI"의 프린터 구성정보의 마직막에 있음
////////원래는 HP LaserJet 4MV=HPPCL5MS,4mv_122.1.1.192
////////       HP LaserJet 5000 PCL 6=HPBXLB,\\HP_Network_Printers\203.240.212.201
//////// 로 "="을 "," 로만 바꾸면 됨
////////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
////////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
////////Microsoft Fax,WPSUNI,FAX
//////
//////
end subroutine

on w_ioinslting_m.create
int iCurrent
call super::create
this.dw_5=create dw_5
this.dw_inspdet=create dw_inspdet
this.st_2=create st_2
this.dw_7=create dw_7
this.dw_9=create dw_9
this.dw_8=create dw_8
this.dw_10=create dw_10
this.dw_4=create dw_4
this.cbx_2=create cbx_2
this.st_22=create st_22
this.dw_area=create dw_area
this.cbx_1=create cbx_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_5
this.Control[iCurrent+2]=this.dw_inspdet
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_7
this.Control[iCurrent+5]=this.dw_9
this.Control[iCurrent+6]=this.dw_8
this.Control[iCurrent+7]=this.dw_10
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.st_22
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.cbx_1
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_19
this.Control[iCurrent+20]=this.cb_20
this.Control[iCurrent+21]=this.cb_21
this.Control[iCurrent+22]=this.cb_22
this.Control[iCurrent+23]=this.cb_3
this.Control[iCurrent+24]=this.cb_2
this.Control[iCurrent+25]=this.cb_1
this.Control[iCurrent+26]=this.st_1
this.Control[iCurrent+27]=this.st_vertical
this.Control[iCurrent+28]=this.st_horizontal
end on

on w_ioinslting_m.destroy
call super::destroy
destroy(this.dw_5)
destroy(this.dw_inspdet)
destroy(this.st_2)
destroy(this.dw_7)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.dw_10)
destroy(this.dw_4)
destroy(this.cbx_2)
destroy(this.st_22)
destroy(this.dw_area)
destroy(this.cbx_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_5)
st_vertical.of_set_rightobject(dw_7)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_5)
st_horizontal.of_set_topobject(dw_7)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_PERMISSION("외주스리팅_SHEET입고", gs_userid) = "Y" then
else
	MessageBox("확인","외주스리팅_SHEET입고 권한이 존재하지 않습니다.")
	RETURN
end if

// ZOOM
string  ls_setting
ls_setting = ProfileString("YCERP.INI", "DATABASE", "IOIN",  " ")	
if IsNumber(ls_setting) then
	dw_2.Object.DataWindow.Zoom = integer(ls_setting)
end if

dw_inspdet.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_7.settransobject(sqlca)

dw_1.insertrow(0)
pb_cancel.enabled = FALSE
pb_delete.enabled = FALSE
pb_save.enabled   = FALSE
pb_retrieve.enabled = TRUE
pb_print.enabled  = FALSE

dw_5.enabled  = FALSE
dw_2.enabled  = FALSE
dw_1.enabled  = TRUE
dw_8.visible  = FALSE
dw_9.visible  = FALSE
dw_10.visible = FALSE
dw_inspdet.visible = FALSE

// 거래처
dw_1.getchild('supp_no',idwc_supp)
idwc_supp.settransobject(sqlca)

// 입고저장소
dw_4.settransobject(sqlca)
dw_4.insertrow(0)
dw_4.object.loc_no[1]  = 'WW01'

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_5.x + dw_5.width
st_vertical.height = dw_5.height

dw_7.x      = st_vertical.x + st_vertical.width
dw_7.width  = newwidth  - dw_7.x - gb_3.x

st_horizontal.y      = dw_5.y + dw_5.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_ioinslting_m
integer x = 4206
integer y = 64
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;//
dwItemStatus l_status
datetime ldt_date, ldt_duedate, ldt_today
long   ll_dw2row, ll_cnt, ll_seq, ll_serial, ll_insprow, ll_row
dec    ld_insp_amount
real   lr_rcptqty, lr_price, lr_orderqty, lr_rlseqty
int    li_seq, li_cnt, li_count
string ls_chk, ls_supp, ls_order, ls_type, ls_subcon, ls_plan, ls_coil, ls_item, ls_qa
string ls_pur_flag, ls_area, ls_insp_date, ls_insp_no1, ls_insp_no, ls_seq, ls_supp_no
string ls_sqlerrtext
string ls_yyyymm, ls_magamyn

// 19921209 : 김영호부장님과 YCH001 : 윤용수 부장님만 발주수량 초과 입력가능.
// 김영호이사 인수인계 심상철부장(ssch3015), 신준현과장(sjh4279) 심부장과 동일권한요청
dw_8.dataobject = 'd_mpslitcon_h'
dw_8.settransobject(sqlca)

dw_2.accepttext()
dw_5.accepttext()

if dw_2.rowcount() < 1 then RETURN

/* 마감관리 로직 반영 2017.10.24 조원석 */
/* sys_gb = '10' 10 구매 마감 로직 	 시작 */
ls_yyyymm = string(dw_5.object.insp_date[1], "yyyymm")
SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';
/* 마감관리 로직 반영 2017.10.24 조원석  끝 */

dw_inspdet.reset()
ll_dw2row = dw_2.rowcount()
ls_chk = "N"
for ll_cnt = 1 to ll_dw2row
    if trim(dw_2.object.chk[ll_cnt]) = 'Y' then		// CHK
		 ls_type  = dw_2.object.result_type[ll_cnt]	// 입고여부
		 if ls_type = "E" OR ls_type = "P" then		// 완료(E), 부분(P), 취소(C), 미입(N)
			li_cnt = dw_2.object.cnt[ll_cnt]
			if isnull(li_cnt) or li_cnt = 0 then
				MessageBox('오류',string(ll_cnt) + '번째 입고갯수를 확인하십시요.',exclamation!)
				RETURN
			end if
			
			lr_orderqty = dw_2.object.order_qty[ll_cnt]
			lr_rlseqty  = dw_2.object.rlse_qty[ll_cnt]
			if dw_2.object.work_type[ll_cnt] = "S" then	// S(Sheet), C(Coil)
			else
				if lr_orderqty - lr_rlseqty < dw_2.object.rcpt_qty[ll_cnt] then
					if GF_PERMISSION("발주입고_초과입력", gs_userid) = "Y" then
							if (lr_orderqty - lr_rlseqty) * 1.1 < dw_2.object.rcpt_qty[ll_cnt] then
								MessageBox("확인",string(ll_cnt) + " 번째 입고수량오류!~r~n (입고가능수량은 최대 10%까지만 인정됩니다.)")
								dw_2.setredraw(false)
								dw_2.setcolumn('com_qty')
								dw_2.setfocus()
								dw_2.object.rcpt_qty[ll_cnt] = 0
								dw_2.object.com_qty[ll_cnt] = 0
								dw_2.setredraw(true)
							end if
					else
							MessageBox("확인",string(ll_cnt) + " 번째 입고수량이 입고가능수량 보다 큽니다!")
							dw_2.setredraw(false)
							dw_2.setcolumn('com_qty')
							dw_2.setfocus()
							dw_2.object.rcpt_qty[ll_cnt] = 0
							dw_2.object.com_qty[ll_cnt]  = 0
							dw_2.setredraw(true)
							RETURN
					end if
				else
						if ls_type = "E" and lr_orderqty - lr_rlseqty > dw_2.object.rcpt_qty[ll_cnt] then
							if MessageBox("확인",string(ll_cnt) &
									+ " 번째가 입고완료이면서 전체입고가능수량 보다 적습니다! ~r~n " &
									+ " 계속진행 하시겠습니까?",question!,okcancel!,1) = 2 then
									RETURN
							end if
						end if
				end if
			end if
			
			if dw_2.object.loc_no[ll_cnt] = "" or isnull(dw_2.object.loc_no[ll_cnt]) then
				MessageBox('오류',string(ll_cnt) + ' 번째 저장소를 입력하십시요.',exclamation!)
				RETURN
			end if
			
			if dw_2.object.com_qty[ll_cnt] = 0 then
				MessageBox("확인",string(ll_cnt) + " 번째 입고수량이 0 입니다!")
				RETURN
			end if
			
			
			/*2020-11-04 jowonsuk 내용추가 wf_coil을 다시 작업해서
			  sheet_no, coil_no를 다시 받음
			  itemchanged에서 sheet_no, coil_no를 받지만 여기서 한번 더 받음.
			*/
			if MidA(dw_2.object.item_no[ll_cnt], 4,1) = '1' &
				or MidA(dw_2.object.item_no[ll_cnt], 4,1) = '2' then
				dw_2.object.coil_no[ll_cnt] = wf_coil(ll_cnt)
			end if
			
			ls_coil = trim(dw_2.object.coil_no[ll_cnt])
			if ls_coil = "" or isnull(ls_coil) then
				  MessageBox('오류,로트번호','로트번호를 입력하십시요.',exclamation!)
				  RETURN
			else
				if ls_item = '1' then // 1(coil), 2(sheet)
					SELECT count(*) INTO :li_count FROM coilmst  WHERE coil_no = :ls_coil;
				else
					SELECT count(*) INTO :li_count FROM sheetmst WHERE sheet_no = :ls_coil;
				end if
				if li_count > 0 then
					MessageBox('오류lot','lot번호가 이미 있습니다.',exclamation!)
					RETURN
				end if
			end if
			
			ls_chk = "Y"
		end if
	end if
next
if ls_chk = "N" then
	MessageBox("확인","입고할 물품을 선택하십시요!")
	RETURN
end if

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 1 then
	setpointer(hourglass!)
	// 입고번호 부여
	ls_area     = LeftA(gs_area, 1)
  	ls_pur_flag = dw_1.getitemstring(1, "pur_flag")
	IF trim(dw_5.object.insp_no[1]) = "" OR isnull(dw_5.object.insp_no[1]) then
		ls_insp_date = string(dw_5.object.insp_date[1], "yyyymmdd")
		ls_insp_no1  = ls_area + ls_pur_flag + ls_insp_date + '-' + '%'			
		SELECT MAX(insp_no) INTO :ls_insp_no  FROM insp WHERE insp_no LIKE :ls_insp_no1;		
	
		if isnull(ls_insp_no) or ls_insp_no = '' then
			ls_insp_no1 = ls_area + ls_pur_flag + ls_insp_date + '-' + '001'
		else
			li_seq = integer(MidA(ls_insp_no, 12, 3))
			li_seq = li_seq + 1
			ls_seq = '00' + string(li_seq)
			ls_insp_no1 = LeftA(ls_insp_no1, 11) + RightA(ls_seq, 3)
		end if
	else
		setnull(ls_insp_no)
		ls_insp_no1 = dw_5.object.insp_no[1]		
		SELECT insp_no INTO :ls_insp_no  FROM insp WHERE insp_no = :ls_insp_no1;		
		
		if trim(ls_insp_no) = "" OR isnull(ls_insp_no) then
		else
			MessageBox("저장","입고번호가 이미 존재합니다.", exclamation!)
			RETURN
		end if
	end if
	
	dw_5.object.log_date[1] = dw_5.object.insp_date[1]
	dw_5.object.insp_no[1]  = ls_insp_no1
	dw_5.object.pur_flag[1] = ls_pur_flag
else
	RETURN
end if

ll_insprow = 0
for ll_cnt = 1 to ll_dw2row
	if trim(dw_2.object.chk[ll_cnt]) = 'Y' then		// CHK
		ls_type  = dw_2.object.result_type[ll_cnt]	// 입고구분
		if ls_type <> "C" then								// 완료(E), 부분(P), 취소(C), 미입(N)
			ll_insprow  = ll_insprow + 1
			
			ldt_date    = dw_5.object.insp_date[1]
			dw_2.object.rlse_date[ll_cnt] = dw_5.object.insp_date[1]
			
			ls_item     = dw_2.object.item_no[ll_cnt]
			ls_qa       = dw_2.object.qa[ll_cnt]
			ldt_duedate = dw_2.object.due_date[ll_cnt]
			lr_rcptqty  = dw_2.object.rcpt_qty[ll_cnt]
			ll_seq      = dw_2.object.seq_no[ll_cnt]
			ls_type     = dw_2.object.result_type[ll_cnt]
			ls_order    = dw_2.object.order_no[ll_cnt]
			ls_subcon   = trim(dw_2.object.pur_subcon[ll_cnt])
			ls_plan     = trim(dw_2.object.product_no[ll_cnt])
			ls_order    = trim(dw_2.object.order_no[ll_cnt])
			ls_coil     = trim(dw_2.object.coil_no[ll_cnt])
			ll_serial   = dw_2.object.serial_no[ll_cnt]
			
			// 입고상세 저장
			dw_inspdet.object.insp_no[ll_insprow]   = ls_insp_no1
			dw_inspdet.object.oi_no[ll_insprow]     = ll_insprow
			dw_inspdet.object.item_no[ll_insprow]   = dw_2.object.item_no[ll_cnt]
			dw_inspdet.object.qa[ll_insprow]        = dw_2.object.qa[ll_cnt]
			dw_inspdet.object.rcpt_qty[ll_insprow]  = dw_2.object.rcpt_qty[ll_cnt]
			dw_inspdet.object.uom[ll_insprow]       = dw_2.object.uom[ll_cnt]
			dw_inspdet.object.price[ll_insprow]     = dw_2.object.price[ll_cnt]
			dw_inspdet.object.apoi_qty[ll_insprow]  = 0
			dw_inspdet.object.rate_cash[ll_insprow] = dw_2.object.rcpt_rate[ll_cnt]
			dw_inspdet.object.pur_no[ll_insprow]    = dw_2.object.order_no[ll_cnt]
			dw_inspdet.object.seq_no[ll_insprow]    = dw_2.object.seq_no[ll_cnt]
			dw_inspdet.object.rem[ll_insprow]       = dw_2.object.rem[ll_cnt]
			dw_inspdet.object.loc_no[ll_insprow]    = dw_2.object.loc_no[ll_cnt]
			dw_inspdet.object.cnt[ll_insprow]       = dw_2.object.cnt[ll_cnt]
			dw_inspdet.object.comqty[ll_insprow]    = dw_2.object.com_qty[ll_cnt]
			dw_inspdet.object.unit_qty[ll_insprow]  = dw_2.object.unit_qty[ll_cnt]
			dw_inspdet.object.coil_no[ll_insprow]   = ls_coil
			dw_inspdet.object.com_uom[ll_insprow]   = dw_2.object.com_uom[ll_cnt]
			
			// 구매발주상세
			UPDATE purdet 
			   SET result_type = :ls_type
				    , rlse_qty    = rlse_qty + :lr_rcptqty
				    , price       = :lr_price
				    , rlse_date   = :ldt_date
			 WHERE order_no = :ls_order AND seq_no = :ll_seq;
			 
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				ROLLBACK;
				MessageBox('오류','purdet update2 수행중 오류가 발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
				Goto ERROR_LABEL
			end if

			DEBUGBREAK()
			/////////////////////////////////////////////////////////////////
			if wf_save2(ll_cnt, ls_insp_no1, ll_insprow) = false then
				ROLLBACK;
				MessageBox('오류','wf_save2 수행중 오류가 발생하였습니다.~r~n',exclamation!)
				Goto ERROR_LABEL
			end if
			/////////////////////////////////////////////////////////////////
		end if
	end if
next

ld_insp_amount = dw_5.object.insp_total[1] 
ls_supp_no     = dw_5.object.supp_no[1]

UPDATE supp 
   SET balance_amt = balance_amt + :ld_insp_amount, last_tran_date = :ldt_today
 WHERE supp_no = :ls_supp_no;
if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	ROLLBACK;
	MessageBox("저장","supp 저장도중 오류가 발생하였습니다!~r~n" + ls_sqlerrtext,exclamation!)
	Goto ERROR_LABEL
end if		
//commit;

if wf_update2(dw_5, dw_inspdet, "N") = false then
	Goto ERROR_LABEL
end if

ll_row = dw_7.insertrow(0) 
dw_7.object.insp_no[ll_row] = ls_insp_no1
IF MessageBox('확인',"저장이 완료되었습니다. ~r~n 생성된 입고번호는 " + ls_insp_no1 + " 입니다." + &
			  "~r~n거래명세서를 출력하시겠습니까?", Question!, OKCancel!, 1) = 1 THEN
	wf_multiprint(ls_insp_no1)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

pb_cancel.enabled   = FALSE
pb_save.enabled     = FALSE
pb_retrieve.enabled = TRUE
dw_5.enabled = FALSE
dw_2.enabled = FALSE
dw_1.enabled = TRUE

dw_inspdet.reset()
dw_5.reset()
dw_2.reset()
cbx_1.checked = FALSE

RETURN

ERROR_LABEL:
	MessageBox('확인','저장이 취소되었습니다.')
	pb_cancel.enabled   = FALSE
	pb_save.enabled     = FALSE
	pb_retrieve.enabled = TRUE
	dw_5.enabled = FALSE
	dw_2.enabled = FALSE
	dw_1.enabled = TRUE
	
	dw_inspdet.reset()
	dw_5.reset()
	dw_2.reset()
	cbx_1.checked = FALSE
RETURN
end event

type dw_1 from w_inheritance`dw_1 within w_ioinslting_m
integer x = 1746
integer y = 132
integer width = 1426
integer height = 88
integer taborder = 50
string dataobject = "d_iopurrcpt_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;dw_2.reset()

is_supp = trim(this.object.supp_no[1])
is_curr = idwc_supp.GetItemString(idwc_supp.getrow(), "currency_type")
if is_curr <> "WON" THEN
	this.object.pur_flag[1] = "L"
end if

pb_retrieve.postevent( clicked! )

end event

type st_title from w_inheritance`st_title within w_ioinslting_m
integer x = 32
integer y = 20
integer width = 1431
integer height = 140
string text = "외주스리팅/SHEET 입고"
end type

type st_tips from w_inheritance`st_tips within w_ioinslting_m
end type

type pb_compute from w_inheritance`pb_compute within w_ioinslting_m
boolean visible = false
integer taborder = 160
end type

type pb_print_part from w_inheritance`pb_print_part within w_ioinslting_m
boolean visible = false
integer x = 2075
integer y = 56
integer width = 206
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_ioinslting_m
integer x = 4398
integer y = 64
integer taborder = 170
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioinslting_m
integer x = 4014
integer y = 64
integer taborder = 180
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "구매일보"
string picturename = ""
vtextalign vtextalign = multiline!
end type

event pb_print::clicked;string ls_sql, ls_where, ls_flag, ls_area
date ld_date
long ll_count
w_repsuper w_print
st_print l_print

openwithparm(w_whapoi_w, ist_code)

ist_code = message.powerobjectparm

if ist_code.okcancel = 'N' then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_8.dataobject = 'd_iopurrcpt_h2'
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)
ls_flag = ist_code.flag
ld_date = date(ist_code.start_no)
ls_area = trim(ist_code.end_no)

if dw_8.retrieve(ls_flag, ld_date, ls_area, ist_code.sel ) < 1 then
	messagebox("확인","해당 일자에는 자료가 없습니다")
	return
end if
wf_print(ls_flag, ld_date)

if ls_flag = "W" then
	l_print.st_datawindow = dw_9
else
	l_print.st_datawindow = dw_10
end if
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 구매일보 보고서를 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ioinslting_m
integer x = 3625
integer y = 64
integer taborder = 190
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;pb_cancel.enabled = FALSE
pb_save.enabled = FALSE
pb_retrieve.enabled = TRUE
dw_5.enabled = FALSE
dw_2.enabled = FALSE
dw_1.enabled = TRUE
dw_5.reset()
dw_2.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_ioinslting_m
integer x = 3817
integer y = 64
integer taborder = 200
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;long ll_dw2row, ll_cnt, ll_seq
string ls_chk, ls_type, ls_order

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

ll_dw2row = dw_2.rowcount()
ls_chk = "N"
for ll_cnt = 1 to ll_dw2row
    if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
		 ls_type  = dw_2.object.result_type[ll_cnt]
		 ls_order = dw_2.object.product_no[ll_cnt]
		 ll_seq = dw_2.object.serial_no[ll_cnt]
		 if ls_type = "C" then
			
			update coilsliting set proc_flag = 'C'
			 where order_no = :ls_order
			   and seq = :ll_seq;
				
			if sqlca.sqlcode < 0 then
				messagebox('오류','[wf_save2]coilsliting UPDATE중 DB오류발생하였습니다.~r~n' &
					+ ' order_no=[' + ls_order + '] seq = ' + string(ll_seq) ,exclamation!)
				return
			end if

			ls_chk = "Y"
		end if
	end if
next
if ls_chk = "N" then
	messagebox("확인","삭제할 물품을 선택하십시요!")
	return
end if
	
if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN
if wf_update1(dw_2, "Y") = false then
			 Goto ERROR_LABEL
end if

pb_DELETE.enabled = FALSE
pb_cancel.enabled = FALSE
pb_save.enabled = FALSE
pb_retrieve.enabled = TRUE
dw_5.enabled = FALSE
dw_2.enabled = FALSE
dw_1.enabled = TRUE
dw_inspdet.reset()
dw_5.reset()
dw_2.reset()
cbx_1.checked = FALSE

RETURN

ERROR_LABEL:
   messagebox('확인','저장이 취소되었습니다.')
   pb_cancel.enabled = FALSE
   pb_save.enabled = FALSE
   pb_DELETE.enabled = FALSE
   pb_retrieve.enabled = TRUE
   dw_5.enabled = FALSE
   dw_2.enabled = FALSE
   dw_1.enabled = TRUE
   dw_inspdet.reset()
   dw_5.reset()
   dw_2.reset()
   cbx_1.checked = FALSE
RETURN


end event

type pb_insert from w_inheritance`pb_insert within w_ioinslting_m
boolean visible = false
integer x = 2679
integer taborder = 220
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ioinslting_m
integer x = 3433
integer y = 64
integer taborder = 210
integer weight = 400
fontcharset fontcharset = ansi!
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_where, ls_curr_code
dec ld_curr_rate
datetime ldt_inspdate

dw_5.reset()	//master
dw_2.reset()	//list
if dw_area.accepttext( ) = -1 then return

if dw_2.retrieve(is_supp) > 0 then
	dw_5.insertrow(0)
	dw_5.object.fob[1]			= dw_2.object.pur_fob[1]								//결재방법	
	dw_5.object.supp_no[1]		= is_supp													//구매거래처
	dw_5.object.insp_date[1]	= datetime(date(string(today(),'yyyy/mm/dd')))
	dw_5.object.log_date[1]		= datetime(date(string(today(),'yyyy/mm/dd')))
	ldt_inspdate 					= datetime(today())
  	dw_5.object.shipto_addr[1] = dw_2.object.pur_shipto_addr[1]						//운송처 주소
	dw_5.object.curr_code[1] 	= is_curr
	dw_5.object.curr_rate[1] 	= 1
	dw_5.object.area_no[1] 		= dw_area.object.area[1]
	dw_5.object.login_id[1] 	= gs_userid
	IF is_curr <> "WON" THEN
		select 
			rev_rate 
		into 
			:ld_curr_rate from currency
		where 
			curr_code = :ls_curr_code
		AND 
			curr_date = :ldt_inspdate
		using sqlca;
		dw_5.object.curr_rate[1] = ld_curr_rate		  
	end if

	if gf_permission('외주스리팅입고관리', gs_userid) = 'Y' then	
		pb_save.enabled	= TRUE
		pb_delete.enabled = TRUE	
	else
		pb_save.enabled	= FALSE
		pb_delete.enabled = FALSE
	end if

	dw_1.enabled = FALSE
	dw_5.enabled = TRUE
	dw_2.enabled = TRUE
	pb_cancel.enabled = TRUE
	pb_retrieve.enabled = FALSE
	dw_5.object.insp_flag[1] = "Y"
	dw_5.object.insp_flag.tabsequence = 0
	dw_5.object.insp_flag.background.color = 78682240
else
  	messagebox("확인", "만족하는 구매발주내역이 없습니다.")
	dw_1.setcolumn('supp_no')
	dw_1.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ioinslting_m
integer x = 32
integer y = 240
integer width = 4590
integer height = 184
integer taborder = 140
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ioinslting_m
integer x = 1504
integer y = 16
integer width = 1883
integer height = 216
integer taborder = 150
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ioinslting_m
integer x = 3401
integer y = 16
integer width = 1221
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ioinslting_m
event ue_calc pbm_custom01
integer x = 32
integer y = 912
integer width = 4581
integer height = 1424
integer taborder = 130
string dataobject = "d_ioinsliting_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::ue_calc;wf_amt()

end event

event dw_2::itemchanged;long   ll_row
string ls_loc, ls_null

setnull(ls_null)
debugbreak()

dw_4.accepttext()
ll_row = row
choose case dwo.name
	case 'chk'
		if trim(data) = 'Y' then
			this.object.result_type[ll_row] = 'E'
			ls_loc = trim(dw_4.object.loc_no[1])
			this.object.loc_no[ll_row] = ls_loc
			if isnull(this.object.com_uom[ll_row]) then
				CHOOSE CASE this.object.uom[ll_row]
					CASE 'M', 'M2'
						this.object.com_uom[ll_row] = 'EA'
					CASE ELSE
						this.object.com_uom[ll_row] = this.object.uom[ll_row]
				END CHOOSE
			end if

			// 품목코드 4번째: 소재구분( 1:코일, 2:SHEET )
			wf_cals(ll_row)			
			this.object.coil_no[ll_row] = wf_coil(ll_row)

		else
			this.object.coil_no[ll_row] = ls_null
			this.object.rcpt_qty[ll_row] = 0
			this.object.cnt[ll_row] = 0
			this.object.result_type[ll_row] = 'N'
		end if
		
	case 'unit_qty', 'uom', 'com_uom' //, 'cnt'
		// 품목코드 4번째: 소재구분( 1:코일, 2:SHEET )
		wf_cals(ll_row)
	case 'cnt'
		wf_cals1(ll_row)
end choose

if this.object.result_type[ll_row] <> 'C' and this.object.result_type[ll_row] <> 'N' then
	if dw_2.object.order_qty[ll_row] <= dw_2.object.rlse_qty[ll_row] &
												+ dw_2.object.rcpt_qty[ll_row] then
		this.object.result_type[ll_row] = 'E'
	end if
end if
this.postevent('ue_calc')


end event

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if row < 1 then return
this.scrolltorow(row)

end event

event dw_2::other;call super::other;CONSTANT integer WM_MOUSEWHEEL = 522 
string   ls_setting

if Message.Number = WM_MOUSEWHEEL AND KeyDown(KeyControl!) then
	ls_setting = This.Describe("DataWindow.Zoom")
	SetProfileString("YCERP.INI", "DATABASE", "IOIN",  ls_setting)	
end if

end event

type dw_5 from datawindow within w_ioinslting_m
integer x = 32
integer y = 440
integer width = 3438
integer height = 424
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_iopurrcpt_head_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_curr_code
decimal lr_exp_rate
datetime ldt_oi_date

choose case dwo.name
	case 'insp_date', 'curr_code'
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date = this.object.insp_date[1]
			ls_curr_code = this.object.curr_code[1]
					
			SELECT rev_rate INTO :lr_exp_rate
			FROM currency
			WHERE curr_code = :ls_curr_code
			AND curr_date = :ldt_oi_date;
				  
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_exp_rate
			end if
		end if
end choose
wf_amt()
end event

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'insp_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.insp_date[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.accepttext()

end event

type dw_inspdet from datawindow within w_ioinslting_m
integer x = 1079
integer y = 136
integer width = 123
integer height = 88
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_iopurrcpt_inspdet_m"
end type

type st_2 from statictext within w_ioinslting_m
integer x = 1531
integer y = 140
integer width = 210
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "거래처"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_7 from datawindow within w_ioinslting_m
integer x = 3529
integer y = 440
integer width = 1093
integer height = 424
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_whinsp_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;gs_where lstr_where
string ls_inspno
THIS.ACCEPTTEXT()
if row < 1 then return
ls_inspno = this.object.insp_no[row]
lstr_where.str1 = ls_inspno
openwithparm(w_whinspdet_w,lstr_where)

end event

type dw_9 from datawindow within w_ioinslting_m
integer x = 805
integer y = 136
integer width = 123
integer height = 88
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_apoi_r"
boolean livescroll = true
end type

type dw_8 from datawindow within w_ioinslting_m
integer x = 667
integer y = 136
integer width = 123
integer height = 88
integer taborder = 120
boolean bringtotop = true
string title = "d_iopurrcpt_h2"
string dataobject = "d_mpslitcon_h"
boolean livescroll = true
end type

type dw_10 from datawindow within w_ioinslting_m
integer x = 942
integer y = 136
integer width = 123
integer height = 88
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_apoi_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_ioinslting_m
integer x = 2290
integer y = 52
integer width = 1070
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_iopur_loc_s2"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_loc
long ll_rowcount, ll_cnt

ls_loc = trim(data)
ll_rowcount = dw_2.rowcount()
for ll_cnt = 1 to ll_rowcount
    if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
		  dw_2.object.loc_no[ll_cnt] = ls_loc
    end if
next

end event

type cbx_2 from checkbox within w_ioinslting_m
integer x = 3269
integer y = 356
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "입고취소"
end type

event clicked;long ll_rowcount, ll_cnt

if this.checked = true then
	pb_save.enabled = false
	ll_rowcount = dw_2.rowcount()
	for ll_cnt = 1 to ll_rowcount
	    if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
			  dw_2.object.result_type[ll_cnt] = "C"
	    end if
	next
else
	//	gs_userid = 'ybs'
	if gf_permission('외주스리팅취소관리', gs_userid) = 'Y' then	
		pb_save.enabled = TRUE
	end if
//	if gs_userid = '1999010s' or gs_userid = 'kga' or gs_userid = 'yyl' or gs_userid = 'bestvic' or &
//		gs_userid = 'k0172h' or gs_userid = 'etwas' or gs_userid = 'plh' or gs_userid = 'kunta' or &
//		gs_userid = 'root'  or gs_userid = '960626' or gs_userid = 'bestvic' or gs_userid = 'kimms' or &
//		gs_userid = 'kimkj' or gs_userid = 'shinjy' or gs_userid = 'sjh4279' &
//		or gs_userid = 'leejh' or gs_userid = 'kimsh' then
//		pb_save.enabled = TRUE
//	end if
end if

end event

type st_22 from statictext within w_ioinslting_m
integer x = 1531
integer y = 56
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_ioinslting_m
integer x = 1746
integer y = 52
integer width = 526
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type cbx_1 from checkbox within w_ioinslting_m
integer x = 64
integer y = 320
integer width = 389
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
string text = "전체입고"
end type

event clicked;long ll_row
string ls_loc,ls_null

setnull(ls_null)

dw_4.accepttext()
dw_2.setredraw(false)
if this.checked = true then
	ls_loc = trim(dw_4.object.loc_no[1])
   for ll_row = 1 to dw_2.rowcount()
		dw_2.object.chk[ll_row] = "Y"
		dw_2.object.result_type[ll_row] = 'E'
		dw_2.object.coil_no[ll_row] = wf_coil(ll_row)
		dw_2.object.loc_no[ll_row] = ls_loc
		wf_cals(ll_row)
	next
else
   for ll_row = 1 to dw_2.rowcount()
		dw_2.object.chk[ll_row] = "N"
		dw_2.object.rcpt_qty[ll_row] = 0
		dw_2.object.result_type[ll_row] = 'N'
	next
end if
dw_2.setredraw(true)
wf_amt()

end event

type st_4 from statictext within w_ioinslting_m
integer x = 480
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

type ddlb_fld from dropdownlistbox within w_ioinslting_m
integer x = 658
integer y = 308
integer width = 430
integer height = 632
integer taborder = 110
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
string item[] = {""}
end type

type ddlb_dwtitles from dropdownlistbox within w_ioinslting_m
integer x = 713
integer y = 316
integer width = 256
integer height = 88
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

type st_7 from statictext within w_ioinslting_m
integer x = 1097
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

type ddlb_op from dropdownlistbox within w_ioinslting_m
integer x = 1280
integer y = 304
integer width = 293
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ioinslting_m
integer x = 1582
integer y = 308
integer width = 562
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

type cb_19 from commandbutton within w_ioinslting_m
integer x = 2153
integer y = 308
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_ioinslting_m
integer x = 2318
integer y = 308
integer width = 160
integer height = 76
integer taborder = 150
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

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_21 from commandbutton within w_ioinslting_m
integer x = 2482
integer y = 308
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

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_ioinslting_m
integer x = 2647
integer y = 308
integer width = 160
integer height = 76
integer taborder = 170
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

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_3 from commandbutton within w_ioinslting_m
integer x = 2848
integer y = 348
integer width = 389
integer height = 72
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주등록"
end type

event clicked;// 발주등록 관리
string  ls_suppno, ls_orderno, ls_itemno, ls_qa, ls_sdate, ls_edate, ls_find, ls_coilno
decimal ll_comqty
long    ll_seqno, ll_row, ll_ordercnt, ll_itemcnt, ll_foundrow, ll_cnt

if dw_2.rowcount() > 0 then
	if IsValid(w_o_main) then 
		OpenSheet( w_ippurchasenew_m,  w_o_main,   5, original! )
	elseif IsValid(w_i_main) then 
		OpenSheet( w_ippurchasenew_m,  w_i_main,   5, original! )
	elseif IsValid(w_m_main) then 
		OpenSheet( w_ippurchasenew_m,  w_m_main,   5, original! )
	elseif IsValid(w_all_main) then 
		OpenSheet( w_ippurchasenew_m,  w_all_main, 5, original! )
	end if
	
	ls_suppno  = dw_1.object.supp_no[1]	
	ls_orderno = dw_2.object.order_no[dw_2.getrow()]

	ls_itemno  = dw_2.object.item_no[dw_2.getrow()]
	ls_qa      = dw_2.object.qa[dw_2.getrow()]
	ls_coilno  = dw_2.object.coil_no[dw_2.getrow()]
	ll_comqty  = dw_2.object.com_qty[dw_2.getrow()]
	ll_cnt     = dw_2.object.cnt[dw_2.getrow()]

	SELECT convert(char(10),order_date,111) INTO :ls_sdate FROM pur WHERE order_no = :ls_orderno;
	if isnull(ls_sdate) or ls_sdate = "" then
		ls_sdate = string(today(), "yyyy/mm/dd")
	else
		ls_edate = ls_sdate
	end if

   w_ippurchasenew_m.dw_11.object.supp_no[1] = ls_suppno
	w_ippurchasenew_m.em_s.text = ls_sdate		// string(today(), "yyyy/mm/dd")
	w_ippurchasenew_m.em_e.text = ls_edate		// string(today(), "yyyy/mm/dd")
//	w_ippurchasenew_m.triggerevent("ue_1")
	w_ippurchasenew_m.pb_retrieve.triggerevent( clicked! )
	ll_ordercnt = w_ippurchasenew_m.dw_2.rowcount()

	if ll_ordercnt > 0 then
		ll_foundrow = w_ippurchasenew_m.dw_2.Find( "order_no = '" + ls_orderno + "'", 1, ll_ordercnt)
		w_ippurchasenew_m.dw_2.scrolltorow( ll_foundrow )
		w_ippurchasenew_m.dw_2.TriggerEvent( rowfocuschanged! )
		
		ll_itemcnt  = w_ippurchasenew_m.tab_1.tabpage_1.dw_3.rowcount()
		if ll_itemcnt > 0 then
			ls_find  = "item_no = '" + ls_itemno + "' AND qa = '" + ls_qa + "' AND " + &
			           "coil_no = '" + ls_coilno + "' AND com_qty = " + string(ll_comqty) + " AND cnt = " + string(ll_cnt) + ""
			ll_foundrow = w_ippurchasenew_m.tab_1.tabpage_1.dw_3.Find( ls_find, 1, ll_itemcnt)
			w_ippurchasenew_m.tab_1.tabpage_1.dw_3.scrolltorow( ll_foundrow )
			w_ippurchasenew_m.tab_1.tabpage_1.dw_3.setfocus()
		end if
	end if
end if

end event

type cb_2 from commandbutton within w_ioinslting_m
integer x = 2848
integer y = 272
integer width = 389
integer height = 72
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주취소"
end type

event clicked;// 발주확정 취소관리
string ls_suppno, ls_orderno, ls_itemno, ls_qa, ls_sdate, ls_edate
long   ll_row, ll_ordercnt, ll_foundrow

if dw_2.rowcount() > 0 then
	if IsValid(w_o_main) then 
		OpenSheet(w_ippurcancel_m,  w_o_main, 5, original!)
	elseif IsValid(w_i_main) then 
		OpenSheet(w_ippurcancel_m,  w_i_main, 5, original!)
	elseif IsValid(w_m_main) then 
		OpenSheet(w_ippurcancel_m,  w_m_main, 5, original!)
	elseif IsValid(w_all_main) then 
		OpenSheet(w_ippurcancel_m,  w_all_main, 5, original!)
	end if
	
	ls_suppno  = dw_1.object.supp_no[1]	
	ls_orderno = dw_2.object.order_no[dw_2.getrow()]
	ls_itemno  = dw_2.object.item_no[dw_2.getrow()]
	ls_qa      = dw_2.object.qa[dw_2.getrow()]

	SELECT convert(char(10),order_date,111) INTO :ls_sdate FROM pur WHERE order_no = :ls_orderno;
	if isnull(ls_sdate) or ls_sdate = "" then
		ls_sdate = string(today(), "yyyy/mm/dd")
	else
		ls_edate = ls_sdate
	end if
   w_ippurcancel_m.dw_11.object.supp_no[1] = ls_suppno
	w_ippurcancel_m.em_s.text = ls_sdate	// string(today(), "yyyy/mm/dd")
	w_ippurcancel_m.em_e.text = ls_edate	// string(today(), "yyyy/mm/dd")

	w_ippurcancel_m.pb_retrieve.triggerevent( clicked! )
	ll_ordercnt = w_ippurcancel_m.dw_4.rowcount()
	if ll_ordercnt > 1 then
		ll_foundrow = w_ippurcancel_m.dw_4.Find( "order_no = '" + ls_orderno + "'", 1, ll_ordercnt)
		w_ippurcancel_m.dw_4.scrolltorow( ll_foundrow )
		w_ippurcancel_m.dw_4.setfocus()
	end if
end if

end event

type cb_1 from commandbutton within w_ioinslting_m
integer x = 3269
integer y = 272
integer width = 567
integer height = 72
integer taborder = 200
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "입고수량 재확인"
end type

event clicked;// 입고수량 확인
// 발주수량 보다 입고수량이 많은 경우(재고품)  발주확정 취소 -> 발주수량 수정 -> 입고작업
// 입고수량 오류 있을 수 있음(현업) -> 절차대로 수정요함.((발주입고_초과입력 10% 권한)

string  ls_suppno, ls_orderno, ls_itemno, ls_qa
decimal ld_orderqty, ld_queryqty
long    ll_row

ll_row     = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_suppno  = dw_1.object.supp_no[1]				// 구매처

ls_orderno = dw_2.object.order_no[ll_row] 	// 발주번호
ls_itemno  = dw_2.object.item_no[ll_row]		// 발주품목
ls_qa      = dw_2.object.qa[ll_row]				// 발주규격
ld_orderqty= dw_2.object.order_qty[ll_row]	// 발주수량

SELECT order_qty INTO :ld_queryqty
  FROM purdet a
       LEFT OUTER JOIN pur b  ON a.order_no = b.order_no
 WHERE a.order_no = :ls_orderno  AND a.item_no  = :ls_itemno AND a.qa = :ls_qa;
if sqlca.sqlcode = 0 then	//	0	Success, 100	Fetched row not found
   if ld_queryqty <> 0 then
	else
		if ld_orderqty <> ld_queryqty then
			if MessageBox("확인","기 발주수량과 현재 발주수량이 변경 되었습니다. 반영하시겠습니까?",question!,okcancel!,1) = 2 then
				return
			else
				dw_2.object.order_qty[ll_row] = ld_queryqty
			end if
		end if
	end if
end if

end event

type st_1 from statictext within w_ioinslting_m
integer x = 46
integer y = 188
integer width = 480
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "발주입고_초과입력"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_ioinslting_m
integer x = 3493
integer y = 440
integer height = 424
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_ioinslting_m
integer x = 32
integer y = 880
integer width = 4581
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_5.height

end event

