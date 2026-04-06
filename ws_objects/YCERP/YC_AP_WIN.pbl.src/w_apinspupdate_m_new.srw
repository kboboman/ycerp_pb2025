$PBExportHeader$w_apinspupdate_m_new.srw
$PBExportComments$발주입고 수정및삭제(1999/05/21, 이인호)
forward
global type w_apinspupdate_m_new from w_inheritance
end type
type dw_3 from datawindow within w_apinspupdate_m_new
end type
type dw_4 from datawindow within w_apinspupdate_m_new
end type
type dw_7 from datawindow within w_apinspupdate_m_new
end type
type st_1 from statictext within w_apinspupdate_m_new
end type
type dw_5 from datawindow within w_apinspupdate_m_new
end type
type dw_8 from datawindow within w_apinspupdate_m_new
end type
type em_s from editmask within w_apinspupdate_m_new
end type
type em_e from editmask within w_apinspupdate_m_new
end type
type dw_9 from datawindow within w_apinspupdate_m_new
end type
type st_22 from statictext within w_apinspupdate_m_new
end type
type dw_area from datawindow within w_apinspupdate_m_new
end type
type dw_6 from datawindow within w_apinspupdate_m_new
end type
type dw_10 from datawindow within w_apinspupdate_m_new
end type
type dw_11 from datawindow within w_apinspupdate_m_new
end type
type em_3 from editmask within w_apinspupdate_m_new
end type
type cb_1 from commandbutton within w_apinspupdate_m_new
end type
type st_3 from statictext within w_apinspupdate_m_new
end type
type cb_2 from commandbutton within w_apinspupdate_m_new
end type
type tab_1 from tab within w_apinspupdate_m_new
end type
type tabpage_1 from userobject within tab_1
end type
type st_row from statictext within tabpage_1
end type
type hpb_2 from hprogressbar within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type hpb_1 from hprogressbar within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_row st_row
hpb_2 hpb_2
ddlb_1 ddlb_1
hpb_1 hpb_1
cb_4 cb_4
st_4 st_4
cb_3 cb_3
cb_5 cb_5
end type
type tabpage_2 from userobject within tab_1
end type
type sle_1 from singlelineedit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
sle_1 sle_1
end type
type tab_1 from tab within w_apinspupdate_m_new
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_12 from datawindow within w_apinspupdate_m_new
end type
type cbx_inupt from checkbox within w_apinspupdate_m_new
end type
type cb_inupt from commandbutton within w_apinspupdate_m_new
end type
type gb_4 from groupbox within w_apinspupdate_m_new
end type
type pb_1 from picturebutton within w_apinspupdate_m_new
end type
type st_vertical from u_splitbar_vertical within w_apinspupdate_m_new
end type
type st_horizontal from u_splitbar_horizontal within w_apinspupdate_m_new
end type
type cb_comuom from commandbutton within w_apinspupdate_m_new
end type
type st_2 from statictext within w_apinspupdate_m_new
end type
type ddlb_fld from dropdownlistbox within w_apinspupdate_m_new
end type
type ddlb_dwtitles from dropdownlistbox within w_apinspupdate_m_new
end type
type st_5 from statictext within w_apinspupdate_m_new
end type
type ddlb_op from dropdownlistbox within w_apinspupdate_m_new
end type
type sle_value from singlelineedit within w_apinspupdate_m_new
end type
type cb_6 from commandbutton within w_apinspupdate_m_new
end type
type cb_7 from commandbutton within w_apinspupdate_m_new
end type
type cb_8 from commandbutton within w_apinspupdate_m_new
end type
type cb_9 from commandbutton within w_apinspupdate_m_new
end type
type st_6 from statictext within w_apinspupdate_m_new
end type
type st_pick from structure within w_apinspupdate_m_new
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_apinspupdate_m_new from w_inheritance
integer width = 4928
integer height = 2212
string title = "발주입고 수정및삭제(w_apinspupdate_m_NEW)"
dw_3 dw_3
dw_4 dw_4
dw_7 dw_7
st_1 st_1
dw_5 dw_5
dw_8 dw_8
em_s em_s
em_e em_e
dw_9 dw_9
st_22 st_22
dw_area dw_area
dw_6 dw_6
dw_10 dw_10
dw_11 dw_11
em_3 em_3
cb_1 cb_1
st_3 st_3
cb_2 cb_2
tab_1 tab_1
dw_12 dw_12
cbx_inupt cbx_inupt
cb_inupt cb_inupt
gb_4 gb_4
pb_1 pb_1
st_vertical st_vertical
st_horizontal st_horizontal
cb_comuom cb_comuom
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
st_6 st_6
end type
global w_apinspupdate_m_new w_apinspupdate_m_new

type variables
st_print i_print
datawindowchild idwc_supp, idwc_insupp, idwc_area
string is_dw, is_supp_no, is_enable_unit_qty = 'N', is_filename
int    ii_row, ii_Sheet
date   id_start_date, id_end_date

//
OLEObject OleExcel, xlSheet
Boolean SWContinue = False

end variables

forward prototypes
public subroutine wf_sum ()
public function boolean wf_update ()
public function boolean wf_delete (long arg_cnt)
public function boolean wf_flag (string as_cs, string as_coil, string as_newloc)
public function boolean wf_dodet_check (long arg_row)
end prototypes

public subroutine wf_sum ();int li_int

dw_1.object.insp_cash[1] = 0
dw_1.object.insp_rate[1] = 0
dw_1.object.insp_total[1] = 0
dw_1.accepttext()
dw_2.accepttext()
for li_int = 1 to dw_2.rowcount()
	    dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
   	 dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
end for
dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]
end subroutine

public function boolean wf_update ();//
int    li_int, li_seq
long   ll_year, ll_wlen, ll_seq
dec    ld_qty, ld_unit
string ls_month, ls_supp_no, ls_inspno, ls_coil, ls_sheet, ls_oc
string ls_case
string ls_yyyymm, ls_magamyn, ls_order
string ls_supp_coil_no, ls_origin_supp_coil_no
long   l_wlen, l_origin_wlen

dw_2.accepttext()

ls_inspno = dw_4.object.insp_no[dw_4.getrow()]
ls_case   = dw_1.object.insp_insp_case[1]

dw_1.object.insp_cash[1]  = 0
dw_1.object.insp_rate[1]  = 0
dw_1.object.insp_total[1] = 0


/* 마감관리 로직 반영 2017.10.24 조원석 */
/* sys_gb = '10' 10 구매 마감 로직 	 시작 */
ls_yyyymm = string(dw_1.object.insp_date[1], "yyyymm")

SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';

//if ls_magamyn <> "N" then
//	MessageBox('확인','해당년월은 마감되었습니다.~n~n',Stopsign!)
//	return
//end if

/* 마감관리 로직 반영 2017.10.24 조원석  끝 */


for li_int = 1 to dw_2.rowcount()
	
	if ls_case = 'A' then
		if dw_2.object.rate_cash[li_int] <> dw_2.object.rlse_rate[li_int] then
			dw_2.object.rate_cash[li_int] = dw_2.object.rlse_rate[li_int]
		end if

		// 입고후 단중을 변경 할수 있게함 넘 힘든과정 이었음..
		// 1. inaudit변경 = 그래야 ineoday ineoym itemloc item 이 qoh가 변경 되니깐.
		// 2. coilmst, sheetmst 변경 = 변경시에 로트번호 변경 체크..
		if dw_2.object.unit_qty[li_int] <> dw_2.getitemdecimal(li_int, 'unit_qty', primary!, true) then
			
			li_seq  = dw_2.object.oi_no[li_int]
			ld_unit = dw_2.object.unit_qty[li_int]
			ld_qty  = ld_unit * dw_2.object.cnt[li_int]
			ls_coil = trim(dw_2.object.coil_no[li_int])
	
			if MidA(dw_2.object.item_no[li_int] ,4,1) = '2' then 
				// SHEET 단중 변경
				SELECT open_close INTO :ls_oc FROM sheetmst WHERE sheet_no = :ls_coil;
				if ls_oc <> 'O' then
					ROLLBACK;
					MessageBox("확인1","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중 입니다.~n~r" &
										+  "이 코드에 대한 후처리를 삭제후에 단중을 변경하십시요")
					RETURN false
				end if
				
				UPDATE sheetmst SET unit_qty = :ld_unit, rcpt_qty = :ld_unit WHERE sheet_no = :ls_coil;
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox("저장2","sheetmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					RETURN false
				end if		
			else
				// COIL 단중 변경
				SELECT open_close INTO :ls_oc FROM coilmst WHERE coil_no = :ls_coil;
				if ls_oc <> 'O' then
					ROLLBACK;
					MessageBox("확인3","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중입니다" &
										+  "이 코드에 대한 후처리를 삭제후에 단중을 변경하십시요")
					RETURN false
				end if

				UPDATE coilmst SET unit_qty = :ld_unit, rcpt_qty = :ld_unit WHERE coil_no = :ls_coil;
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox("저장4","sheetmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					RETURN false
				end if		
			end if

			// inaudit 입고 수량 변경
			UPDATE inaudit 
			   SET rcpt_qty = :ld_qty, unit_qty = :ld_unit, com_qty = :ld_qty
/*			 WHERE (inaudit_type = 'RO' or inaudit_type = 'RI')*/
			 WHERE (inaudit_type in ('RO' , 'RI') )
				AND order_no = :ls_inspno
				AND cnt = :li_seq;
				
			if sqlca.sqlcode <> 0 then
				ROLLBACK;
				MessageBox("저장5","inaudit update중 오류가 발생하였습니다!~n~r" &
										+ sqlca.sqlerrtext,exclamation!)
				RETURN false
			end if		
		end if
      
		// 특기사항만 처리
		if dw_2.object.coilmst_etc_no[li_int] <> dw_2.getitemstring(li_int, 'coilmst_etc_no', primary!, true) then
			ls_coil = trim(dw_2.object.coil_no[li_int])
	
			if MidA(dw_2.object.item_no[li_int] ,4,1) = '2' then 
			else
				// coil 특기사항
				SELECT open_close INTO :ls_oc FROM coilmst WHERE coil_no = :ls_coil;
				if ls_oc <> 'O' then
					ROLLBACK;
					MessageBox("확인5-1","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중입니다" &
										+  "이 코드에 대한 후처리를 삭제후에 단중을 변경하십시요")
					RETURN false
				end if

				string ls_etc_no
				ls_etc_no = dw_2.object.coilmst_etc_no[dw_2.getrow()]
				UPDATE coilmst SET etc_no = :ls_etc_no WHERE coil_no = :ls_coil;
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox("저장5-2","coilmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					RETURN false
				end if		
			end if
		end if
      //////////////////////////////////////////////////
	end if
	dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
	dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
	
	
	/*supp_coil_no, wlen 변경발생시  2018.06.22 jowonsuk 시작 */
//	if dw_2.object.supp_coil_no[li_int] <> dw_2.getitemstring(li_int, 'supp_coil_no', primary!, true)  or &
//   	   dw_2.object.wlen[li_int] <> dw_2.getitemdecimal(li_int, 'wlen', primary!, true) then
	/*supp_coil_no, wlen 변경발생시  2018.11.09 jowonsuk 시작 */
	ls_supp_coil_no = dw_2.object.supp_coil_no[li_int] 
	ls_origin_supp_coil_no = dw_2.object.origin_supp_coil_no[li_int]
	dw_2.object.origin_supp_coil_no[li_int] = ls_supp_coil_no	
	l_wlen = dw_2.object.wlen[li_int] 
	l_origin_wlen = dw_2.object.origin_wlen[li_int] 
	dw_2.object.origin_wlen[li_int]  = l_wlen
	
	if isnull(ls_supp_coil_no) then
		ls_supp_coil_no = ''
	end if
	
	if isnull(ls_origin_supp_coil_no) then
		ls_origin_supp_coil_no = ''
	end if
	
	if isnull(l_wlen) then
		l_wlen = 0
	end if

	if isnull(l_origin_wlen) then
		l_origin_wlen = 0
	end if	
	
	
	if ls_supp_coil_no <> ls_origin_supp_coil_no  or l_wlen <> l_origin_wlen then	
		
			ll_wlen = dw_2.object.wlen[li_int]
			ls_supp_coil_no = dw_2.object.supp_coil_no[li_int]
			ls_order = dw_2.object.pur_no[li_int]
			ll_seq = dw_2.object.seq_no[li_int]
			ls_coil = trim(dw_2.object.coil_no[li_int])
			
			if MidA(dw_2.object.item_no[li_int] ,4,1) = '1' then 
				
				// COIL 길이 변경
				if l_wlen <> l_origin_wlen then 
				 
					SELECT open_close INTO :ls_oc FROM coilmst WHERE coil_no = :ls_coil;
					
					if ls_oc <> 'O' then
						ROLLBACK;
						MessageBox("확인3","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중입니다" &
											+  "이 코드에 대한 후처리를 삭제후에 길이를 변경하십시요")
						RETURN false
					end if
				
			     end if

				UPDATE coilmst 
					SET length = :ll_wlen, 
						   rcpt_len = :ll_wlen,
						   pcoil_no = :ls_supp_coil_no
				WHERE coil_no = :ls_coil;
				
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox("저장4","sheetmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					RETURN false
				end if		
				
				/*jowonsuk 2018.06.22 추가 */
				UPDATE purdet 
					SET supp_coil_no = :ls_supp_coil_no								/*jowonsuk 2018.06.22 추가 */
						  , wlen               = :ll_wlen												/*jowonsuk 2018.06.22 추가 */
				 WHERE order_no = :ls_order AND seq_no = :ll_seq;
				 
				if sqlca.sqlcode < 0 then
					 ROLLBACK;
					 MessageBox('오류','purdet update2 수행중 오류가 발생하였습니다.'&
								+ string(sqlca.sqlerrtext) + "~r~n" ,exclamation!)
					return false
				end if	
				/*jowonsuk 2018.06.22 추가 */				
				
			end if

			
	end if
	/*supp_coil_no, wlen 변경발생시  2018.06.22 jowonsuk 끝 */
	
next

// 운송방법(대여)
if dw_1.object.ship_flag[1] = "D" then
   //dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]		// 입고금액
	
   //if dw_1.object.insp_rate[1] <> 0 then
   //   dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + (dw_1.object.ship_amount[1] / 10)
   //end if
	
	dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]	// 입고금액
else
	dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1] 											// 입고금액
end if

if dw_1.object.insp_total[1] <> dw_1.getitemdecimal(1, 'insp_total', primary!, true) then
	ld_qty     = dw_1.getitemdecimal(1, 'insp_total', primary!, true) - dw_1.object.insp_total[1] 
	ls_supp_no = dw_1.object.supp_no[1]

	UPDATE supp SET balance_amt = balance_amt - :ld_qty WHERE supp_no = :ls_supp_no;
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("저장6","supp UPDATE중 오류가 발생하였습니다!",exclamation!)
		RETURN false
	end if		
end if

cbx_inupt.checked = false

WF_Update2( dw_1, dw_2, 'Y' )
RETURN true

end function

public function boolean wf_delete (long arg_cnt);
decimal {1} ld_wid, ld_w_wid
real   lr_newqty, lr_unitqty, lr_rlseqty, lr_newqty10
long   ll_cnt, ll_cnt2, ll_row, ll_i
int    li_seq, li_division, li_operation, li_exist, li_wcnt, li_oino
string ls_item4, ls_wqa, ls_loc, ls_inspno
string ls_item, ls_product, ls_newloc, ls_qa, ls_coil, ls_sheet, ls_order
string ls_subcon, ls_coilorder, ls_flag, ls_w_coil, ls_sale, ls_array[1], ls_wc, ls_supp
string ls_case
string ls_locno, ls_destination, ls_serial_id, LS_TYPE, ls_rem, ls_sqlerrtext, ls_order_no
decimal L_rcpt_qty, L_issue_qty, l_cost, l_unit_qty, l_cnt, l_com_qty
datetime ldt_insp_date

ls_supp    = trim(dw_1.object.supp_no[1])

ls_item    = trim(dw_2.object.item_no[arg_cnt])
ls_product = trim(dw_2.object.product_no[arg_cnt])		// 생산주문번호
ls_newloc  = trim(dw_2.object.loc_no[arg_cnt])			
lr_newqty  = dw_2.object.rcpt_qty[arg_cnt]
ls_order   = trim(dw_2.object.pur_no[arg_cnt])
li_seq     = dw_2.object.seq_no[arg_cnt]
ls_qa      = trim(dw_2.object.qa[arg_cnt])
ld_wid     = dec(string(MidA(ls_qa,5,4) + "." + MidA(ls_qa,10,1)))
ls_coil    = trim(dw_2.object.coil_no[arg_cnt])
ls_sheet   = trim(dw_2.object.purdet_work_type[arg_cnt])
ls_subcon  = trim(dw_2.object.subcon[arg_cnt])

ls_inspno  = trim(dw_2.object.insp_no[arg_cnt])		// 입고번호
li_oino    = dw_2.object.oi_no[arg_cnt]


if dw_1.object.insp_insp_case[1] = 'A' then

	ls_type = dw_2.object.iotype[arg_cnt]
	L_rcpt_qty = dw_2.object.rcpt_qty[arg_cnt]*(-1)
	L_issue_qty = 0
	l_cost = dw_2.object.price[arg_cnt]
	ls_destination = dw_2.object.supp_no[arg_cnt]
	ls_serial_id = dw_2.object.coil_no[arg_cnt]
	l_unit_qty = dw_2.object.unit_qty[arg_cnt]
	l_cnt = dw_2.object.oi_no[arg_cnt]
	l_com_qty = dw_2.object.comqty[arg_cnt]
	ls_rem = '입고내역삭제'
	ldt_insp_date = dw_2.object.insp_date[arg_cnt]	
	ls_order_no  = trim(dw_2.object.insp_no[arg_cnt])
	
	 INSERT INTO inaudit ( inaudit_time,    inaudit_date,   inaudit_item,       qa,         order_no,        loc_no,    inaudit_type,         rcpt_qty,      issue_qty,     cost,       destination,       serial_id,      rem,       unit_qty,     cnt,     com_qty,      user_id )  
			   	      VALUES (      getdate(), :ldt_insp_date,         :ls_item, :ls_qa,    :ls_order_no,  :ls_newloc,           :ls_type,    :L_rcpt_qty, :L_issue_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem,   :l_unit_qty, :l_cnt, :l_com_qty, :gs_userid );
								 
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = string(sqlca.sqlerrtext)
		ROLLBACK;				
		MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
		RETURN false
	end if	
	
end if	


SELECT count(*) INTO :ll_cnt 
  FROM apoi, apoiinv
 WHERE insp_no = :ls_inspno AND oi_no = :li_seq
   AND apoi.apoiinv_no = apoiinv.apoiinv_no AND apoiinv.delete_flag = 'N';
	
if ll_cnt > 0 then
	ROLLBACK;
	MessageBox('오류1', string(arg_cnt) + '번째 자료는 이미 매입이 발생한 자료입니다~r~n 매입 삭제후에 삭제하십시요..',exclamation!)
	RETURN false
end if

ll_cnt     = dw_2.object.cnt[arg_cnt]
lr_unitqty = dw_2.object.unit_qty[arg_cnt]
ll_cnt2    = dw_2.object.comqty[arg_cnt]

// 구매발주 입고수량 업데이트
lr_newqty10 = lr_newqty * (-1)

ll_row = dw_5.Retrieve( ls_order, li_seq )
for ll_i = ll_row to 1 step -1
    dw_5.object.result_type[ll_i] = "N"
	 
    lr_rlseqty = dw_5.object.rlse_qty[ll_i]	 
    if lr_rlseqty > 0 then
	    if lr_rlseqty >= abs(lr_newqty10) then
		    dw_5.object.rlse_qty[ll_i]  = lr_rlseqty + lr_newqty10
		    dw_5.object.rlse_date[ll_i] = wf_today()
		    EXIT
	    else
		    if ll_i = 1 then
			    dw_5.object.rlse_qty[ll_i]  = 0
			    dw_5.object.rlse_date[ll_i] = wf_today()
			    EXIT
		    else
			    dw_5.object.rlse_qty[ll_i]  = 0
			    dw_5.object.rlse_date[ll_i] = wf_today()
			    lr_newqty10 = lr_rlseqty + lr_newqty10 
			    CONTINUE
		    end if
	    end if
    end if
next

if dw_5.update() <> 1 then 
	ROLLBACK;
   MessageBox('오류2','[WF_Delete][dw_5] update중 DB오류발생하였습니다.',exclamation!)
   RETURN false					
end if

// 미수불
ls_case    = dw_1.object.insp_insp_case[1]
if ls_case = 'C' then RETURN true

debugbreak()

// 외주여부
if (ls_subcon = 'N') OR (ls_subcon = 'C') OR (ls_subcon = 'J') OR (ls_subcon = 'W') then
   // 저장소 변경 있는 수량오류보정을 위한 출고 및 입고
   choose case ls_subcon
	   case 'C'
			if ls_product = "" or isnull(ls_product) then
				MessageBox("확인","입고번호의 [" + ls_inspno + "] 작업지시 번호가 존재하지 않습니다.")
				// 작지번호가 존재하지 않은 경우와 구매발주 입고수량 업데이트 관계 파악계속(2012/09/17)
				RETURN false
			end if
			
			UPDATE coilsliting SET proc_flag = 'O' WHERE order_no = :ls_product AND seq = :ll_cnt2;				
			if sqlca.sqlcode <> 0 then
				ROLLBACK;
				MessageBox('오류3',"[coilsliting]UPDATE 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				RETURN false
			end if
			
			SELECT proc_flag, coilorder_order, coil_no, wid, cnt, loc_no
			  INTO :ls_flag, :ls_coilorder, :ls_w_coil, :ld_w_wid, :li_wcnt, :ls_loc
			  FROM coilorderdet
			 WHERE order_no = :ls_product;
			if sqlca.sqlcode <> 0 then
				ROLLBACK;
				MessageBox('오류4',"코일작업오더[coilorderdet]SELECT 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				RETURN false
			end if
			
			if ls_flag <> "P" then
				
				UPDATE coilorderdet SET proc_flag = 'P' WHERE order_no = :ls_product;
				
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox('오류5',"코일작업오더[coilorderdet]UPDATE 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					RETURN false
				end if
				
				UPDATE coilorder SET open_close = 'O' WHERE order_no = :ls_coilorder;
				
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox('오류6',"코일작업오더[coilorder]UPDATE 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					RETURN false
				end if
				
				UPDATE coilmst 
				   SET qcnt = qcnt + :li_wcnt, open_close = 'S'
				 WHERE coil_no = :ls_w_coil AND loc_no = :ls_supp AND open_close <> 'S';
				 
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox('오류7','[wf_save2]coilmst UPDATE중 DB오류발생하였습니다.~r~n' &
								+ ' coil_no=[' + ls_w_coil + '] wid = ' + string(ld_w_wid, "####.0"),exclamation!)
					RETURN false	
				end if
				
				ls_array[1] = ls_product
				dw_9.retrieve( ls_array )
				
				for ll_row = 1 to dw_9.rowcount()
					ls_w_coil = dw_9.object.coil_no[ll_row]
					ls_loc    = dw_9.object.loc_no[ll_row]
					ld_w_wid  = dw_9.object.wid[ll_row]
					li_wcnt   = dw_9.object.cnt[ll_row]
					
					UPDATE coilmst 
					   SET qcnt = qcnt + :li_wcnt, open_close = "S"
					 WHERE coil_no = :ls_w_coil AND loc_no = :ls_supp;
					if sqlca.sqlcode <> 0 then
						ROLLBACK;
						MessageBox('오류8',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
						RETURN false
					end if
				next
			end if
			
			//스리팅코일 삭제
			if ls_sheet = "S" then
				DELETE FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_newloc;
				if sqlca.sqldbcode <> 0 then
					ROLLBACK;
					MessageBox('오류9','[sheet마스터] delete중 DB오류발생하였습니다.',exclamation!)
					RETURN false
				end if
			else
				DELETE FROM coilmst WHERE coil_no = :ls_coil   AND loc_no = :ls_newloc;
				if sqlca.sqldbcode <> 0 then
					ROLLBACK;
					MessageBox('오류10','[코일마스터] delete중 DB오류발생하였습니다.',exclamation!)
					RETURN false
				end if
			end if
	
		case 'J'
			  UPDATE jajaesudo SET flag = 'Y', out_type = 'Y' WHERE order_no = :ls_product;
		     if sqlca.sqlcode < 0 then
			     ROLLBACK;
			     MessageBox('오류11','[WF_Delete][jajaesudo] update중 DB오류발생하였습니다.',exclamation!)
			     RETURN false
		     end if
			  
		case 'W'
			  // 원코일구매 삭제
			  SELECT open_close INTO :ls_flag FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_newloc;
				if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
					ROLLBACK;
					MessageBox("확인12","코일자료가 없습니다.")
					RETURN false
				end if
				
				CHOOSE CASE ls_flag
					CASE "M"
					   ROLLBACK;
						MessageBox("확인13","이 코일번호[" + ls_coil + "]은 지금 저장소에 없거나 생산계획중입니다.")
						RETURN false
					CASE "P"
			    		ROLLBACK;
						MessageBox("확인14","이 코일번호[" + ls_coil + "]은 지금 저장소에 없거나 작업지시중입니다.")
						RETURN false
					CASE "C"
			    		ROLLBACK;
						MessageBox("확인15","이 코일번호[" + ls_coil + "]은 이미 저장소에 없거나 사용이 완료되었습니다")
						RETURN false
					CASE "S"
			    		ROLLBACK;
						MessageBox("확인16","이 코일번호[" + ls_coil + "]은 이미 저장소에 없거나 외주로 이동되어있습니다")
						RETURN false
					CASE ELSE
			    		ROLLBACK;
						MessageBox("확인17","이 코일번호[" + ls_coil + "]은 이미 저장소에 없거나 외주로 이동되어있습니다")
						RETURN false
				END CHOOSE
			  
			  DELETE FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_newloc;
			  if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox('오류18','[WF_Delete][코일마스터] delete중 DB오류발생하였습니다.',exclamation!)
					RETURN false
			  end if
    end choose
    //if (ls_subcon = 'N') OR (ls_subcon = 'C') OR (ls_subcon = 'J') OR (ls_subcon = 'W') then
	 
else // subcon = 'L' OR 'P' OR 'Y'
   choose case ls_subcon
	     case 'Y'
		     UPDATE sudodet1 SET rcpt_qty = rcpt_qty - :lr_newqty, sudo_type = 'B' WHERE order_no = :ls_product;
		     if sqlca.sqlcode < 0 then
			     ROLLBACK;
			     MessageBox('오류19','[WF_Delete][sudodet] update중 DB오류발생하였습니다.',exclamation!)
			     RETURN false
		     end if
	     case 'P'
		     UPDATE sudodet  SET rcpt_qty = rcpt_qty - :lr_newqty, sudo_type = 'B' WHERE order_no = :ls_product;
		     if sqlca.sqlcode < 0 then
			     ROLLBACK;
			     MessageBox('오류20','[WF_Delete][sudodet1] update중 DB오류발생하였습니다.',exclamation!)
			     RETURN false
		     end if
    end choose
	 
	 SELECT sale_no, seq_no, division, wc_no, operation
	   INTO :ls_sale, :li_seq,:li_division, :ls_wc, :li_operation
	   FROM mpsdet
	  WHERE plan_no = :ls_product;
	 if sqlca.sqlcode < 0 then
	    ROLLBACK;
       MessageBox('오류21','[WF_Delete][mpsdet] select수행중 오류가 발생했습니다.',exclamation!)
	    RETURN false
	 else
		 UPDATE mpsdet SET rcpt_qty = rcpt_qty - :lr_newqty WHERE plan_no = :ls_product;
		 if sqlca.sqlcode < 0 then
	   	 ROLLBACK;
			 MessageBox('오류22','DB오류발생하였습니다.',exclamation!)
			 RETURN false
		 end if

//		 select operation into :li_operation from routtempnew
//		  where division = :li_division 
//		    and sale_no = :ls_sale 
//			 and seq_no = :li_seq
//		    and wc_no = :ls_wc;
//	    if sqlca.sqlcode < 0 then
//	       ROLLBACK;
//          MessageBox('오류23','[WF_Delete][routtempnew] select오류가 발생했습니다.',exclamation!)
//	       RETURN false
//		 else
			 UPDATE routtempnew 
			    SET make_qty = make_qty - :lr_newqty
		     WHERE division = :li_division AND sale_no = :ls_sale AND seq_no = :li_seq AND operation = :li_operation;
			 if sqlca.sqlcode < 0 then
	      	 ROLLBACK;
				 MessageBox('오류24','DB오류발생하였습니다.',exclamation!)
				 RETURN false
			 end if
			 
			 li_operation ++
		    SELECT operation INTO :li_operation FROM routtempnew
		     WHERE division = :li_division AND sale_no = :ls_sale AND seq_no = :li_seq AND operation = :li_operation;
			 if sqlca.sqlcode = 100 then
//					update item set sales_reserved = sales_reserved - :lr_newqty
//					 where item_no = :ls_item and qa = :ls_qa;
//					if sqlca.sqlcode < 0 then
//						ROLLBACK;
//						MessageBox('오류25','판매예약량 update중 DB오류가 발생했습니다.',exclamation!)
//						RETURN false
//					end if

				UPDATE saledet 
				   SET plan_qty = plan_qty + :lr_newqty
					  , sol_qty = (case when sol_qty - :lr_newqty < 0 then 0 else sol_qty - :lr_newqty end)
					  , saledet_text = 'P'
				 WHERE order_no = :ls_sale AND seq_no = :li_seq;
					if sqlca.sqlcode < 0 then
						ROLLBACK;
						MessageBox('오류26','update중 DB오류가 발생했습니다.',exclamation!)
						RETURN false
					end if
			 else
				 if sqlca.sqlcode < 0 then
	             ROLLBACK;
					 MessageBox('오류27','[WF_Delete] DB오류발생하였습니다.',exclamation!)
					 RETURN false
				 end if
				 
				 // 후공정처리
				li_exist = 0
	         SELECT count(*) INTO :li_exist FROM routtempnew
   	       WHERE division = :li_division AND sale_no = :ls_sale
      	      AND seq_no = :li_seq AND operation = :li_operation
					AND process_flag = 'E';
//	         if sqlca.sqlcode < 0 then
//	            ROLLBACK;
//	            MessageBox('오류28','[WF_Delete][routtempnew] select중 DB오류가 발생했습니다.',exclamation!)
//	            RETURN false
//	         end if
				
				if li_exist > 0 then
					// 다음공정의 작업일보가 등록되어 마감이 되었기때문에 process_flag를 'N'으로
					// 바꾸지 않음
				else
					UPDATE routtempnew 
					   SET process_flag = 'N'
			       WHERE division = :li_division AND sale_no = :ls_sale
					   AND seq_no = :li_seq AND operation = :li_operation;
					 if sqlca.sqlcode < 0 then
		             ROLLBACK;
						 MessageBox('오류29','DB오류발생하였습니다.',exclamation!)
						 RETURN false
					 end if
				end if
			 end if
//		 end if
	 end if
end if

//
if (ls_subcon = 'W') OR (ls_subcon = 'C') then
else
	ls_item4 = MidA(ls_item, 4, 1)
	if ls_item4 = '1' then // 1: coil, 2: sheet
	   // 원코일구매 삭제
		if WF_Flag( 'C', ls_coil, ls_newloc ) = FALSE then
			ROLLBACK;
			RETURN false
		end if
		  
		DELETE FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_newloc;
	   if sqlca.sqlcode <> 0 then
			ROLLBACK;
			MessageBox('오류36','[WF_Delete][코일마스터] Delete중 DB오류 발생하였습니다.',exclamation!)
			RETURN false
	   end if
	elseif ls_item4 = '2' then
	   // SHEET코일구매 삭제
		if WF_Flag( 'S', ls_coil, ls_newloc ) = FALSE then
			ROLLBACK;
			RETURN false
		end if
		  
		DELETE FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_newloc;
		if sqlca.sqldbcode <> 0 then
			ROLLBACK;
			MessageBox('오류37','[WF_Delete][쉬트마스터] Delete중 DB오류 발생하였습니다.',exclamation!)
			RETURN false
		end if
	end if
end if

RETURN true


end function

public function boolean wf_flag (string as_cs, string as_coil, string as_newloc);//
string ls_flag

if as_cs = "C" then
	SELECT open_close INTO :ls_flag FROM coilmst  WHERE coil_no  = :as_coil AND loc_no = :as_newloc;
else
	SELECT open_close INTO :ls_flag FROM sheetmst WHERE sheet_no = :as_coil AND loc_no = :as_newloc;
end if
if sqlca.sqlcode = 100 OR sqlca.sqlcode < 0 then
	ROLLBACK;
	MessageBox("확인30","LOT 자료가 없습니다.")
	RETURN false
end if

choose case ls_flag
	case "M"
	   ROLLBACK;
		MessageBox("확인31","이 LOT번호[" + as_coil + "]은 지금 생산계획중입니다.")
		RETURN false
	case "P"
		ROLLBACK;
		MessageBox("확인32","이 LOT번호[" + as_coil + "]은 지금 작업지시중입니다.")
		RETURN false
	case "C"
		ROLLBACK;
		MessageBox("확인33","이 LOT번호[" + as_coil + "]은 이미 사용이 완료되었습니다")
		RETURN false
	case "S"
		ROLLBACK;
		MessageBox("확인34","이 LOT번호[" + as_coil + "]은 이미 외주로 이동되어있습니다")
		RETURN false
	case "O"
		
	case else
		ROLLBACK;
		MessageBox("확인35","이 LOT번호[" + as_coil + "]의 상태가 오류가 발생하였습니다.")
		RETURN false
end choose
		  
RETURN true

end function

public function boolean wf_dodet_check (long arg_row);String	ls_coil_no
long		ll_cnt

dw_2.AcceptText()
ls_coil_no = dw_2.Object.coil_no[arg_row]

SELECT top 1 isNULL(count(dodet.coil_no),0)
INTO :ll_cnt
FROM dodet (nolock)
WHERE dodet.coil_no = :ls_coil_no
using sqlca;

if ll_cnt > 0 then
	RETURN TRUE
else
	RETURN FALSE
end if
end function

event open;call super::open;//
this.hide()
///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("발주입고_수정및삭제", gs_userid) = "Y" then
else
	MessageBox("확인","발주입고_수정및삭제 권한이 존재하지 않습니다.")
	close(this)
end if

tab_1.visible = false
tab_1.x  = dw_1.x
tab_1.y  = dw_1.y

cb_2.enabled = false
tab_1.tabpage_1.hpb_1.position = 0
tab_1.tabpage_1.hpb_2.position = 0

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

pb_delete.enabled = false
pb_save.enabled   = false

// 입고처변경작업
cbx_inupt.enabled = false
dw_12.enabled     = false
cb_inupt.enabled  = false
dw_12.object.supp_no.Background.Color   = 67108864

//
if GF_Permission('발주입고미수불', gs_userid) = 'Y' then
	dw_1.object.insp_insp_case.visible = true
else
//	if gs_area = 'B0001' then 
//		dw_area.getchild('area',idwc_area)
//		idwc_area.settransobject(sqlca)
//		idwc_area.setfilter('area_no = "B0001" or area_no = "C0001"')
//		idwc_area.filter()
//	else
//		dw_area.enabled = false
//	end if
	dw_1.object.insp_insp_case.visible = false
end if

em_s.text = string(today(), "yyyy/mm/dd")
em_e.text = string(today(), "yyyy/mm/dd")
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)
dw_12.settransobject(sqlca)		// 입고처

dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false
dw_9.visible = false
dw_10.visible = false
dw_11.visible = false
dw_12.enabled = false

// 거래처
dw_12.insertrow(0)
dw_12.getchild("supp_no", idwc_insupp)
idwc_insupp.settransobject(sqlca)

// 
dw_3.insertrow(0)
dw_3.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(sqlca)


if GF_Permission('발주입고입력자1', gs_userid) = 'Y' then	
	dw_2.object.unit_qty.tabsequence = 20
	dw_2.object.coilmst_etc_no.tabsequence = 25
	dw_2.object.comqty.tabsequence = 30
	is_enable_unit_qty = 'Y'
else
	dw_2.object.comqty.tabsequence = 30
	is_enable_unit_qty = 'N'
end if

if GF_Permission('발주입고입력자2', gs_userid) = 'Y' then		
	dw_2.object.coilmst_etc_no.tabsequence = 25
end if
em_3.text = "SN" + string(today(), "yyyymmdd")
em_3.SelectText(9, 2)
em_3.setfocus()

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
this.show()

end event

on w_apinspupdate_m_new.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_7=create dw_7
this.st_1=create st_1
this.dw_5=create dw_5
this.dw_8=create dw_8
this.em_s=create em_s
this.em_e=create em_e
this.dw_9=create dw_9
this.st_22=create st_22
this.dw_area=create dw_area
this.dw_6=create dw_6
this.dw_10=create dw_10
this.dw_11=create dw_11
this.em_3=create em_3
this.cb_1=create cb_1
this.st_3=create st_3
this.cb_2=create cb_2
this.tab_1=create tab_1
this.dw_12=create dw_12
this.cbx_inupt=create cbx_inupt
this.cb_inupt=create cb_inupt
this.gb_4=create gb_4
this.pb_1=create pb_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.cb_comuom=create cb_comuom
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.st_6=create st_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_7
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.dw_8
this.Control[iCurrent+7]=this.em_s
this.Control[iCurrent+8]=this.em_e
this.Control[iCurrent+9]=this.dw_9
this.Control[iCurrent+10]=this.st_22
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.dw_6
this.Control[iCurrent+13]=this.dw_10
this.Control[iCurrent+14]=this.dw_11
this.Control[iCurrent+15]=this.em_3
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.tab_1
this.Control[iCurrent+20]=this.dw_12
this.Control[iCurrent+21]=this.cbx_inupt
this.Control[iCurrent+22]=this.cb_inupt
this.Control[iCurrent+23]=this.gb_4
this.Control[iCurrent+24]=this.pb_1
this.Control[iCurrent+25]=this.st_vertical
this.Control[iCurrent+26]=this.st_horizontal
this.Control[iCurrent+27]=this.cb_comuom
this.Control[iCurrent+28]=this.st_2
this.Control[iCurrent+29]=this.ddlb_fld
this.Control[iCurrent+30]=this.ddlb_dwtitles
this.Control[iCurrent+31]=this.st_5
this.Control[iCurrent+32]=this.ddlb_op
this.Control[iCurrent+33]=this.sle_value
this.Control[iCurrent+34]=this.cb_6
this.Control[iCurrent+35]=this.cb_7
this.Control[iCurrent+36]=this.cb_8
this.Control[iCurrent+37]=this.cb_9
this.Control[iCurrent+38]=this.st_6
end on

on w_apinspupdate_m_new.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_7)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.dw_8)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.dw_9)
destroy(this.st_22)
destroy(this.dw_area)
destroy(this.dw_6)
destroy(this.dw_10)
destroy(this.dw_11)
destroy(this.em_3)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.tab_1)
destroy(this.dw_12)
destroy(this.cbx_inupt)
destroy(this.cb_inupt)
destroy(this.gb_4)
destroy(this.pb_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.cb_comuom)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.st_6)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_apinspupdate_m_new
string tag = "저장"
integer x = 4384
integer taborder = 100
end type

event pb_save::clicked;int  li_count

dw_1.Accepttext()
dw_2.Accepttext()

li_count = WF_ModifyCount(dw_1) + WF_ModifyCount(dw_2)
if li_count >= 1 then
	WF_Update()
else
	MessageBox("확인", "변경된 내역이 없습니다.")
end if

// 환산단위 
dw_2.Object.com_uom.TabSequence = 0

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apinspupdate_m_new
integer x = 1815
integer y = 412
integer width = 2981
integer height = 540
integer taborder = 200
boolean enabled = false
string dataobject = "d_apinspupdate_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::itemchanged;int li_int

dw_1.Accepttext()
if this.rowcount() < 1 then return

dw_2.Accepttext()

dw_1.object.insp_cash[1]  = 0
dw_1.object.insp_rate[1]  = 0
dw_1.object.insp_total[1] = 0

for li_int = 1 to dw_2.rowcount()
    dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
    dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
next

// 운반비 발생시 기본값을 "대여"로 변경하기
choose case dwo.name
	case "ship_flag"
		if data <> "D" then
			dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1] 		// 입고금액
		end if
		
	case "ship_amount"
		if long(data) > 0 then
			if this.object.ship_flag[row] <> "D" then
				if MessageBox("확인","운송방법을 [대여]로 변경 하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 then
					this.object.ship_flag[row] = "D"
				end if
			end if
		end if
end choose

// 운송방법(대여)
if dw_1.object.ship_flag[1] = "D" then
   //dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]		// 입고금액
	
   //if dw_1.object.insp_rate[1] <> 0 then
   //   dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + (dw_1.object.ship_amount[1] / 10)
   //end if
	
	dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]	// 입고금액
else
	dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1] 											// 입고금액
end if

end event

event dw_1::losefocus;dw_1.Accepttext()

end event

type st_title from w_inheritance`st_title within w_apinspupdate_m_new
integer y = 24
integer width = 1257
string text = "발주입고 수정및삭제"
end type

type st_tips from w_inheritance`st_tips within w_apinspupdate_m_new
end type

type pb_compute from w_inheritance`pb_compute within w_apinspupdate_m_new
boolean visible = false
integer y = 48
integer taborder = 260
end type

type pb_print_part from w_inheritance`pb_print_part within w_apinspupdate_m_new
boolean visible = false
integer taborder = 90
end type

type pb_close from w_inheritance`pb_close within w_apinspupdate_m_new
integer x = 4571
integer taborder = 270
end type

event pb_close::clicked;//int li_count, li_chk, li_int
//long ll_year
//dec ld_balance
//string ls_month, ls_supp_no
//
//dw_1.Accepttext()
//dw_2.Accepttext()
//dw_6.Accepttext()
//
//li_count = wf_modifycount(dw_1)
//IF li_count >= 1 THEN
//	li_chk = MessageBox("확인", "변경된 내역을 저장하시겠습니까 ?", Question!, YesNoCancel!, 3)
//   IF li_chk = 1 THEN 
//      dw_1.object.insp_cash[1] = 0
//      dw_1.object.insp_rate[1] = 0
//      dw_1.object.insp_total[1] = 0
//      for li_int = 1 to dw_2.rowcount()
//         dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
//         dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
//      end for
//		if dw_1.object.ship_flag[1] = 'D' then
//		   dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]
//		   IF dw_1.object.insp_rate[1] <> 0 then
//		      dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + (dw_1.object.ship_amount[1] / 10)
//		   end if
//		end if
//      dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1]
//		IF dw_1.object.insp_total[1] <> dw_6.object.insp_total[1] then
//			ld_balance = dw_6.object.insp_total[1] - dw_1.object.insp_total[1] 
//         ls_supp_no = dw_1.object.supp_no[1]
//
//         UPDATE supp SET balance_amt = balance_amt - :ld_balance
//            WHERE supp_no = :ls_supp_no;
//
//         if sqlca.sqlcode <> 0 then
//	         rollback;
//	         messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//	         return
//         end if		
//	
//		end if
//	   wf_update1(dw_1, 'Y')
//	ELSEIF li_chk = 3 THEN
//		return
//   END IF
//END IF
close(parent)

end event

type pb_print from w_inheritance`pb_print within w_apinspupdate_m_new
string tag = "프린트"
integer x = 4009
integer taborder = 280
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_where lst_where

if dw_4.getrow() < 1 then return

lst_where.str1 = dw_4.object.insp_no[dw_4.getrow()]
lst_where.str2 = string(dw_2.object.oi_no[dw_2.getrow()])
//lst_where.str3 = string(dw_2.object.cnt[dw_2.getrow()])
lst_where.str4 = MidA(dw_2.object.qa[dw_2.getrow()],5,4) + "." + MidA(dw_2.object.qa[dw_2.getrow()], 10,1)

OpenWithParm ( w_multiprint_r, lst_where)  // 입고번호 날려야 됨.
//w_repsuper w_print
//st_print l_print
//
//if dw_4.getrow() < 1 then return
////dw_11.dataobject = 'd_ioinsliting_r'
//dw_11.settransobject(sqlca)
//dw_11.retrieve(dw_4.object.insp_no[dw_4.getrow()])
//
//l_print.st_datawindow = dw_11
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 입고명세서를 출력합니다."
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)
//
//
//
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
//////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
//////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
//////Microsoft Fax,WPSUNI,FAX
////
////
//////LONG msgHWND_BROADCAST = 65535 // HEX FFFF
//////LONG msgWM_WININICHANGE = 26   // HEX 1A
//////
////////// 첫번째프린터에는 FAX(시화로 출력)
////////WriteProfileStringA("windows", "device", &
////////				"Microsoft Fax,WPSUNI,FAX");
////////WriteProfileStringA("","",""); // flushes cached WIN.INI
////////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////////dw_11.print()
//////// 첫번째프린터에는 HP5000(시화로 출력)
//////WriteProfileStringA("windows", "device", &
//////				"HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\192.168.1.11");
//////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////dw_11.print()
////
//////// 두번째프린터에는 4MV(목동(판매부)으로 출력)
//////WriteProfileStringA("windows", "device", &
//////				"HP LaserJet 4MV,HPPCL5MS,\\HP_Network_Printers\122.1.1.203");
//////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////dw_11.print()
////
//////시화에서 목동프린터(HP NET PRINTER : 4MV) 로 프린팅과
////// 시화 HP NET PRINTER(HP5000) 로 의 동시 프린팅 테스트
////////			dw_11.print()
////// SYSEDIT.EXE "WIN.INI"의 프린터 구성정보의 마직막에 있음
//////원래는 HP LaserJet 4MV=HPPCL5MS,4mv_122.1.1.192
//////       HP LaserJet 5000 PCL 6=HPBXLB,\\HP_Network_Printers\203.240.212.201
////// 로 "="을 "," 로만 바꾸면 됨
//////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
//////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
//////Microsoft Fax,WPSUNI,FAX
////
////dw_11.dataobject = 'd_ioinsliting_r'
////dw_11.settransobject(sqlca)
////dw_11.retrieve(as_insp_no)
////
//////
//////string ls_dw7sql, ls_sql,ls_where
//////
//////		ls_dw7sql = dw_11.describe("datawindow.table.select")
//////		ls_where = " and sale.order_no between ~~'hd20040317-001~~'" &
//////					+ " and ~~'hd20040317-003~~'"  
//////		ls_sql = "datawindow.table.select = '" + ls_dw7sql + ls_where + "'"
//////			
//////		dw_11.modify(ls_sql)
//////
////LONG msgHWND_BROADCAST = 65535 // HEX FFFF
////LONG msgWM_WININICHANGE = 26   // HEX 1A
////WriteProfileStringA("windows", "device", &
////				"\\\\박상준\\hp officejet 6100 series,winspool,Ne00");
////dw_11.print()
////////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////dw_11.Modify('DataWindow.Print.Orientation = 1')
//////\\192.168.3.30\tsc-243 xp,winspool,Ne09:
//////\\박상준\hp officejet 6100 series,winspool,Ne00:
//////"HP officejet 6100 series,HPBXLB,\\
////WriteProfileStringA("windows", "device", &
////				"HP LaserJet 5100 PCL 5e,winspool,Ne05:");
////dw_11.print()
////

end event

type pb_cancel from w_inheritance`pb_cancel within w_apinspupdate_m_new
string tag = "취소"
integer x = 3822
integer taborder = 290
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;integer li_count, li_chk

dw_1.Accepttext()
//li_count = wf_modifycount(dw_1)
//IF li_count >= 1 THEN
//	li_chk = MessageBox("확인", "변경된 내역을 저장하시겠습니까 ?", Question!, OKCancel!, 1)
//   IF li_chk = 1 THEN 
//	   wf_update()
//   END IF
//END IF

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

type pb_delete from w_inheritance`pb_delete within w_apinspupdate_m_new
string tag = "삭제"
integer x = 4197
integer taborder = 300
end type

event pb_delete::clicked;string   ls_order_no, ls_supp_no, ls_case, ls_msg
long     ll_row, ll_cnt
integer  li_chk, li_seq
dec      ld_insp_amount
date     ldt_user_date
datetime ldt_today, ldt_getdate, ldt_insp_date
string ls_ITEM_NO, ls_QA, ls_locno, ls_destination, ls_serial_id, LS_TYPE, ls_rem, ls_sqlerrtext
decimal L_rcpt_qty, L_issue_qty, l_cost, l_unit_qty, l_cnt, l_com_qty

if dw_1.rowcount() < 1 then RETURN

dw_4.TriggerEvent(rowfocuschanged!)

dw_1.Accepttext()
dw_2.Accepttext()
dw_3.Accepttext()
dw_4.Accepttext()

if dw_4.rowcount() < 1 then RETURN

//ls_order_no = dw_4.object.insp_no[dw_4.getrow()]
/*JOWONSUK 수정 2019.07.31*/
ls_order_no = dw_1.object.insp_no[1]
/*li_seq  = dw_4.object.oi_no[dw_4.getrow()]*/
if isnull(ls_order_no) OR trim(ls_order_no) = '' then
	MessageBox("삭제", "선택된 입고번호가 없습니다.")
	RETURN
end if

// 출고자료 확인
for ll_cnt = 1 to dw_2.RowCount()
	if WF_DODET_Check(ll_cnt) = true then	// 자료 존재함
		ls_msg  = string(ll_cnt) + " 라인 자료는 이미 출고 완료된 자료입니다.~n~n"
		ls_msg += "확인하여 주시기 바랍니다.~n~n"
		MessageBox("확인", ls_msg, StopSign!)
		RETURN
	end if
next

if MessageBox("확인", "입고 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN

ldt_today      = datetime(today())
ld_insp_amount = dw_1.object.insp_total[1] 		// 합계금액
ls_supp_no     = dw_1.object.supp_no[1]			// 구매처
ldt_insp_date  = dw_1.GetItemDateTime( 1, 'insp_date', Primary!, True)
ldt_user_date  = date(dw_1.GetItemDateTime( 1, 'insp_date', Primary!, True))
/*ldt_user_date  = date(dw_1.GetItemDateTime( 1, 'user_date', Primary!, True)) 	*/			/*2018-05-15 jowonsuk user_date -> insp_date*/

for ll_cnt = 1 to dw_2.rowcount()
	
	// 코일체크
	if WF_Delete(ll_cnt) = false then 
		 ROLLBACK;
		 dw_2.scrolltorow(ll_cnt)
		 RETURN
	end if
	
next

UPDATE supp 
   SET balance_amt = balance_amt - :ld_insp_amount, last_tran_date = :ldt_today
 WHERE supp_no = :ls_supp_no;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
	RETURN
end if		

dw_1.DeleteRow(0)
dw_2.RowsMove(1, dw_2.rowCount(), primary!, dw_2, 1, Delete!)

/* 2018.05.15 jowonsuk 변경 */
if WF_Update2( dw_1, dw_2, "Y" ) = true then
	pb_retrieve.PostEvent(clicked!)
end if
end event

type pb_insert from w_inheritance`pb_insert within w_apinspupdate_m_new
boolean visible = false
integer x = 2309
integer y = 60
integer taborder = 320
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apinspupdate_m_new
string tag = "조회"
integer x = 3634
integer taborder = 310
boolean enabled = false
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string  ls_area,  ls_suppno
date    ld_sdate, ld_edate

dw_area.accepttext()
ls_area   = LeftA(dw_area.object.area[1],1)

dw_3.accepttext()
ls_suppno = dw_3.object.supp_no[dw_3.getrow()]	

ld_sdate  = date(em_s.text)
ld_edate  = date(em_e.text)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
cb_2.enabled = true   // 단가작업

dw_4.setredraw(false)
dw_4.reset()
dw_4.retrieve( ls_suppno, ld_sdate, ld_edate, ls_area )
dw_4.setredraw(true)

if dw_4.rowcount() > 0 then
   dw_1.enabled = TRUE
   dw_2.enabled = TRUE
   dw_4.enabled = TRUE	
   dw_3.enabled = FALSE
   pb_cancel.enabled   = TRUE
   pb_retrieve.enabled = FALSE

	if GF_Permission('발주입고_변경작업', gs_userid) = 'Y' then
		cbx_inupt.enabled = true
	end if	
else
	dw_3.setcolumn('supp_no')
	dw_3.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_apinspupdate_m_new
integer x = 32
integer width = 4763
integer height = 168
integer taborder = 230
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_apinspupdate_m_new
integer x = 2071
integer y = 4
integer width = 1499
integer height = 216
integer taborder = 250
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_apinspupdate_m_new
integer x = 3593
integer y = 4
integer width = 1202
integer height = 216
integer taborder = 170
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_apinspupdate_m_new
integer x = 27
integer y = 988
integer width = 4768
integer height = 1068
integer taborder = 210
boolean enabled = false
string dataobject = "d_apinspdetupdate_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::itemchanged;//
string  ls_qa, ls_uom
int     li_int
real    lr_orderqty, lr_rlseqty, lr_unitqty, lr_price
long    ll_row, ll_cnt

if dw_1.getrow() < 1 then RETURN
ll_row = this.getrow()
if ll_row < 1 then RETURN

dw_1.Accepttext()
dw_2.Accepttext()

dw_1.object.insp_cash[1]  = 0
dw_1.object.insp_rate[1]  = 0
dw_1.object.insp_total[1] = 0

choose case dwo.name
	case 'rlse_rate'
		dw_2.object.rate_cash[ll_row] = dw_2.object.rlse_rate[ll_row]
		
	case 'unit_qty'
		if dw_2.object.apoi_qty[ll_row] > 0 then
			MessageBox("확인","이미 매입처리가 완료 되었습니다. 매입처리를 삭제후에 작업하십시요")
			RETURN 1
		end if
		dw_2.object.rcpt_qty[ll_row] = dw_2.object.unit_qty[ll_row] * dw_2.object.cnt[ll_row]
		dw_2.object.comqty [ll_row]  = dw_2.object.rcpt_qty[ll_row]
end choose
	
for li_int = 1 to dw_2.rowcount()
    dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
    dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
next
if dw_1.object.ship_flag[1] = 'D' then
   dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]
   IF dw_1.object.insp_rate[1] <> 0 then
      dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + (dw_1.object.ship_amount[1] / 10)
   end if
end if
dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1]

end event

event dw_2::losefocus;this.accepttext()

end event

event dw_2::itemerror;CHOOSE CASE dwo.name
	CASE 'unit_qty'
		this.setcolumn('rlse_rate')
		this.object.unit_qty[row] = this.getitemdecimal(row, 'unit_qty', primary!, true)
		this.SetItemStatus(row, "unit_qty", Primary!, NotModified!)
END CHOOSE
return 2
end event

type dw_3 from datawindow within w_apinspupdate_m_new
integer x = 2313
integer y = 112
integer width = 864
integer height = 88
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_apinspdsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()
is_supp_no = this.getitemstring(1, "supp_no")	

pb_retrieve.enabled = true
this.setfocus()

end event

event editchanged;//
string ls_data,  ls_supp
long   ll_found, ll_row
int    li_line

this.getchild("supp_no", idwc_supp)
choose case dwo.name
	case 'supp_no'
		 ls_data  = data + '%'
		 ll_row   = idwc_supp.RowCount( )
		 ll_found = idwc_supp.Find(" AND supp_name like '" + ls_data + "'", 1, ll_row)
		 li_line  = integer(this.Describe("supp_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_supp.scrolltorow(ll_found)
end choose
RETURN 0

end event

type dw_4 from datawindow within w_apinspupdate_m_new
integer x = 27
integer y = 412
integer width = 1728
integer height = 540
integer taborder = 190
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_apinspupdate_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string  ls_orderno

if this.rowcount() > 0  then
	ii_row     = this.getrow()
   ls_orderno = this.object.insp_no[ii_row]
	
	if this.object.invoice_print[ii_row] = 'N' then
		pb_delete.enabled = true
		pb_save.enabled   = true
		pb_1.enabled      = true
	else
		pb_delete.enabled = false
		pb_save.enabled   = false
		pb_1.enabled      = false
	end if
   dw_1.retrieve(ls_orderno)
   dw_2.retrieve(ls_orderno)
end if


end event

event retrieveend;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

IF this.object.invoice_print[ll_row] = 'N' THEN
	pb_delete.enabled = true
	pb_save.enabled = true
	pb_1.enabled = true
ELSE
	pb_delete.enabled = false
	pb_save.enabled = false
	pb_1.enabled = false
END IF

end event

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_7 from datawindow within w_apinspupdate_m_new
integer x = 251
integer y = 160
integer width = 82
integer height = 72
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oiupinaudit"
end type

type st_1 from statictext within w_apinspupdate_m_new
integer x = 2094
integer y = 120
integer width = 224
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
boolean enabled = false
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_apinspupdate_m_new
integer x = 41
integer y = 160
integer width = 82
integer height = 72
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_appurdetin_h"
boolean livescroll = true
end type

type dw_8 from datawindow within w_apinspupdate_m_new
integer x = 357
integer y = 160
integer width = 82
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_apinspupdate_inaudit_m"
boolean livescroll = true
end type

type em_s from editmask within w_apinspupdate_m_new
integer x = 3177
integer y = 36
integer width = 366
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_s.text
lstr_calendar.edate = em_e.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_s.text = lstr_calendar.sdate
	em_e.text = lstr_calendar.edate
end if

end event

type em_e from editmask within w_apinspupdate_m_new
integer x = 3177
integer y = 120
integer width = 366
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_s.text
lstr_calendar.edate = em_e.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_s.text = lstr_calendar.sdate
	em_e.text = lstr_calendar.edate
end if

end event

type dw_9 from datawindow within w_apinspupdate_m_new
integer x = 462
integer y = 160
integer width = 82
integer height = 72
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_prslitcon_h"
boolean livescroll = true
end type

type st_22 from statictext within w_apinspupdate_m_new
integer x = 2094
integer y = 40
integer width = 224
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
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_apinspupdate_m_new
integer x = 2322
integer y = 36
integer width = 526
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type dw_6 from datawindow within w_apinspupdate_m_new
integer x = 146
integer y = 160
integer width = 82
integer height = 72
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oiupinaudit"
end type

type dw_10 from datawindow within w_apinspupdate_m_new
integer x = 567
integer y = 160
integer width = 82
integer height = 72
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_oiupinaudit_det"
boolean livescroll = true
end type

type dw_11 from datawindow within w_apinspupdate_m_new
integer x = 709
integer y = 160
integer width = 82
integer height = 72
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_ioinsliting_r"
boolean livescroll = true
end type

type em_3 from editmask within w_apinspupdate_m_new
integer x = 1362
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

event getfocus;em_3.SelectText(9,2)


end event

type cb_1 from commandbutton within w_apinspupdate_m_new
integer x = 1851
integer y = 88
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
string   ls_supp, ls_inspno, ls_name
long     ll_row, ll_found
datetime ldt_date
 
setnull(ls_supp) ; setnull(ldt_date)

ls_inspno = trim(em_3.text)
if isnull(ls_inspno) OR ls_inspno = "" then RETURN

//
SELECT supp_no, insp_date INTO :ls_supp, :ldt_date FROM insp WHERE insp.insp_no = :ls_inspno;
if sqlca.sqlcode = 100 then 
	pb_cancel.triggerevent(clicked!)
	em_3.setfocus()
	RETURN
end if

dw_3.object.supp_no[1] = ls_supp
em_s.text = string(ldt_date,'yyyy/mm/dd')
em_e.text = string(ldt_date,'yyyy/mm/dd')

pb_retrieve.enabled = true
pb_retrieve.triggerevent(clicked!)

ll_found = dw_4.Find( "insp_no = '"+ ls_inspno +"'", 1, dw_4.rowcount())
if ll_found = 0 then
	if dw_4.rowcount() > 0 then
		MessageBox("확인", "검색한 입고번호가 없습니다.")
	end if
	em_3.setfocus()
else
	dw_4.scrolltorow(ll_found)
end if 

end event

type st_3 from statictext within w_apinspupdate_m_new
integer x = 1358
integer y = 4
integer width = 265
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
string text = "입고번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_apinspupdate_m_new
integer x = 3813
integer y = 264
integer width = 375
integer height = 116
integer taborder = 330
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단가작업"
end type

event clicked;// 거래처별 입고내역에서 엑셀 출력 후 '입고단가','환산수량' 수정후 
// 발주입고 수정 및 삭제 작업 진행
//

tab_1.visible = true

tab_1.tabpage_1.ddlb_1.enabled = false
tab_1.tabpage_1.cb_4.enabled   = false
//
dw_3.accepttext()
if is_supp_no = "" then
	messagebox("거래처", "거래처를 선택 하세요.")
	return
end if

MessageBox("거래처별 입고내역 일괄변경작업","[조회]->[발주조회]->[거래처별 입고내역]에서 ~n~n" + &
			"작업 대상을 엑셀파일로 저장한 후 '단가(0.0), 환산수량'을 [공난처리불가] 수정한 파일을 사용해야 합니다.~n~n" + &
			"검색범위는 2행부터 1번 컬럼이 빈행까지만 검색합니다. 중간의 소계행과 합계행은 지워야 합니다.~n~n~n~n" + &
			"[주의사항]~n~n엑셀파일의 컬럼위치를 변경하거나 삭제하면 정상적인 작업이 수행되지 않습니다.~n~n" + &
			"현재 사용중인 엑셀 프로그램을 모두 종료한 후에 작업하시기 바랍니다.~n~n" + &
			"Windows 작업관리자 메뉴(Ctrl+Alt+del)에서도 EXCEL.EXE가 백그라운드로 실행되는지 확인 바랍니다.~n~n" + &
			"'발주입고 수정및삭제' 프로그램은 거래처 단위로 작업 종료후 작업결과를 반드시 확인 바랍니다.")

end event

type tab_1 from tab within w_apinspupdate_m_new
integer x = 1385
integer y = 1312
integer width = 1637
integer height = 440
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
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

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1600
integer height = 324
long backcolor = 79741120
string text = "발주입고"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_row st_row
hpb_2 hpb_2
ddlb_1 ddlb_1
hpb_1 hpb_1
cb_4 cb_4
st_4 st_4
cb_3 cb_3
cb_5 cb_5
end type

on tabpage_1.create
this.st_row=create st_row
this.hpb_2=create hpb_2
this.ddlb_1=create ddlb_1
this.hpb_1=create hpb_1
this.cb_4=create cb_4
this.st_4=create st_4
this.cb_3=create cb_3
this.cb_5=create cb_5
this.Control[]={this.st_row,&
this.hpb_2,&
this.ddlb_1,&
this.hpb_1,&
this.cb_4,&
this.st_4,&
this.cb_3,&
this.cb_5}
end on

on tabpage_1.destroy
destroy(this.st_row)
destroy(this.hpb_2)
destroy(this.ddlb_1)
destroy(this.hpb_1)
destroy(this.cb_4)
destroy(this.st_4)
destroy(this.cb_3)
destroy(this.cb_5)
end on

type st_row from statictext within tabpage_1
integer x = 41
integer y = 244
integer width = 274
integer height = 52
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "Row:"
boolean focusrectangle = false
end type

type hpb_2 from hprogressbar within tabpage_1
integer x = 37
integer y = 176
integer width = 1527
integer height = 52
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 722
integer y = 24
integer width = 837
integer height = 292
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// 
tab_1.tabpage_1.cb_4.enabled = true

ii_Sheet = index

end event

type hpb_1 from hprogressbar within tabpage_1
integer x = 37
integer y = 120
integer width = 1527
integer height = 52
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_4 from commandbutton within tabpage_1
integer x = 462
integer y = 236
integer width = 869
integer height = 84
integer taborder = 240
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단가, 환산수량 가져오기"
end type

event clicked;//
String  ls_insp_no, ls_supp, ls_item, ls_qa, ls_pur_no, ls_loc_name, ls_Sheet
Integer iRet, li_int, li_Change
Long    ll_row, ll_status, ll_seq, ll_max, ll_allrow, ll_allmax
Dec     ld_price, ld_comqty
Boolean SWExit = True

OLEObject MyExcel

MyExcel = CREATE OLEObject

iRet = MyExcel.ConnectToObject("", "excel.application") 
if iRet <> 0 then DESTROY MyExcel 

MyExcel.Application.Visible = true

if IsValid(xlSheet) then DESTROY xlSheet
xlSheet = MyExcel.Application.Sheets(ii_Sheet)

debugbreak()

ls_supp    = trim(dw_1.object.supp_no[1])       // 매입처
if ls_supp = "" OR isnull(ls_supp) then
	MessageBox("매입처","매입처를 선택 하세요.")
	return
end if 


this.enabled = false

Long numcols, numrows, iCol, iRow

ll_allmax = dw_4.rowcount()
for ll_allrow = 1 to ll_allmax		// 입고번호 전체 
   hpb_2.position = (ll_allrow / ll_allmax) * 100
   hpb_1.position = 0

   ll_max = dw_2.rowcount()
   For ll_row = 1 To ll_max
      hpb_1.position = (ll_row / ll_max) * 100
      
      ls_insp_no  = trim(dw_2.object.insp_no[ll_row])        // 입고번호   
      ll_seq      = dw_2.object.oi_no[ll_row]                // 입고순번   
      ls_item     = dw_2.object.item_no[ll_row]              // 품목       
      ls_qa       = dw_2.object.qa[ll_row]                   // 규격       
      ls_loc_name = dw_2.object.location_loc_name[ll_row]    // 입고저장소 
      ls_pur_no   = dw_2.object.pur_no[ll_row]               // 발주번호   
      
      // 엑셀 데이터 검색하기
      iRow = 2
      SWExit = true   
      Do While SWExit
			tab_1.tabpage_1.st_row.text = "Row: " + string(irow)
//         if ls_insp_no  = String(xlSheet.Cells[iRow, 15].Value) And &
//            ll_seq      = Long(String(xlSheet.Cells[iRow, 16].Value)) And &
//            ls_item     = String(xlSheet.Cells[iRow, 21].Value) And &
//            ls_qa       = String(xlSheet.Cells[iRow,  6].Value) And &
//            ls_loc_name = String(xlSheet.Cells[iRow, 17].Value) And &
//            ls_pur_no   = String(xlSheet.Cells[iRow,  2].Value) Then

         if ls_insp_no  = String(xlSheet.Cells[iRow,      18].Value) And &
            ll_seq      = Long(String(xlSheet.Cells[iRow, 19].Value)) And &
            ls_item     = String(xlSheet.Cells[iRow,      23].Value) And &
            ls_qa       = String(xlSheet.Cells[iRow,       8].Value) And &
            ls_loc_name = String(xlSheet.Cells[iRow,      20].Value) And &
            ls_pur_no   = String(xlSheet.Cells[iRow,       2].Value) Then
   
            ld_comqty   = xlSheet.Cells[iRow, 13].Value   // 환산수량
            ld_price    = xlSheet.Cells[iRow, 15].Value   // 입고단가
				//================================================================//
				// 
				//================================================================//
            dw_2.object.comqty[ll_row]  = ld_comqty       // xls 환산수량
            dw_2.object.price[ll_row]   = ld_price        // xls 입고단가
				//================================================================//
            
            SWExit = false
   
            dw_1.object.insp_cash[1]  = 0
            dw_1.object.insp_rate[1]  = 0
            dw_1.object.insp_total[1] = 0         
            for li_int = 1 to dw_2.rowcount()
                dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
                dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
            next
            if dw_1.object.ship_flag[1] = 'D' then
               dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]
               IF dw_1.object.insp_rate[1] <> 0 then
                  dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + (dw_1.object.ship_amount[1] / 10)
               end if
            end if
            dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1]         
         end if
         
         iRow = iRow + 1
         if IsNull(xlSheet.Cells[iRow, 1].Value) then SWExit = false
      Loop
		tab_1.tabpage_1.st_row.text = "Row: "
   Next
   
   if SWContinue = False then
      iRet = MessageBox("작업완료","단가, 환산수량 가져오기 작업을 완료 하였습니다.~n~n계속해서 자동 저장 하시겠습니까?", Exclamation!, OKCancel!, 2)
      IF iRet = 1 THEN
         SWContinue = true
         pb_save.TriggerEvent(Clicked!) 
      END IF
		dw_4.ScrollToRow(ll_allrow + 1)
   else
      IF iRet = 1 THEN
			dw_1.Accepttext()
			dw_2.Accepttext()
			
			li_Change = wf_modifycount(dw_1) + wf_modifycount(dw_2)
			IF li_Change > 0 THEN
//				pb_save.TriggerEvent(Clicked!) 
				wf_update()
				tab_1.tabpage_2.sle_1.text = tab_1.tabpage_2.sle_1.text + "SAVE: " + ls_pur_no + "~n"
			ELSE
			END IF
		end if
		
		dw_4.ScrollToRow(ll_allrow + 1)
	end if
next

// Quits Excel
MyExcel.Application.Quit()

iRet = MyExcel.DisconnectObject()       
If iRet < 0 then
	MessageBox("ERROR","DisconnectObject Failed")
End If

Destroy MyExcel
Destroy xlSheet
Destroy OleExcel

end event

type st_4 from statictext within tabpage_1
integer x = 457
integer y = 36
integer width = 274
integer height = 52
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "Sheet:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within tabpage_1
integer x = 32
integer y = 16
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "엑셀"
end type

event clicked;//

String  ls_supp_no, ls_supp, ls_seq, ls_item, ls_qa
Integer iRet
Long    ll_row, ll_status
Dec     ld_price, ld_comqty
	
//setpointer(hourglass!)

String ls_filename, named
String defext = ""
String Filter = "Microsoft Excel Files (*.xls*),*.xls*"


//tab_1.tabpage_1.ddlb_1.DeleteItems()
//
if IsValid(OleExcel) then DESTROY OleExcel
if IsValid(xlSheet) then DESTROY xlSheet

OleExcel = CREATE OleObject
xlSheet  = CREATE OleObject

tab_1.tabpage_1.ddlb_1.reset()
iRet = GetFileOpenName("Microsoft Excel Files", ls_filename, named, defext, filter)
if iRet = 1 then
	if ls_filename <> "" then
		iRet = OleExcel.ConnectToNewObject("excel.application") 
		if iRet <> 0 then DESTROY OleExcel 

		// Visible = True의 경우 엑셀 프로그램이 띄워지며 
		// False인 경우 아이콘화된다. 
		OleExcel.Application.Visible = true

		// 엑셀을 로드한 후 Empty Sheet를 연다. 
		is_filename = ls_filename
		OleExcel.WorkBooks.Open(ls_filename) 

		Integer ii, iSheetCount, rownbr
		String  ls_Sheet
		
		iSheetCount = OleExcel.Application.Sheets.Count
		for ii = 1 to iSheetCount
			ls_Sheet = OleExcel.Application.Sheets(ii).Name
			rownbr = tab_1.tabpage_1.ddlb_1.AddItem(ls_Sheet)
		next
		
		if iSheetCount > 0 then
			ii_Sheet =  1
//			tab_1.tabpage_1.ddlb_1.SelectItem(OleExcel.Application.Sheets(1).Name, 1)
			tab_1.tabpage_1.ddlb_1.enabled = true
//			if iSheetCount =  1 then tab_1.tabpage_1.ddlb_1.PostEvent(selectionchanged!)
//			selectionchanged(1)
		end if
	else
		return
	end if
else
	return
END IF

Destroy xlSheet
Destroy OleExcel

end event

type cb_5 from commandbutton within tabpage_1
integer x = 1335
integer y = 236
integer width = 233
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;//
tab_1.visible = false

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1600
integer height = 324
long backcolor = 79741120
string text = "작업결과"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
sle_1 sle_1
end type

on tabpage_2.create
this.sle_1=create sle_1
this.Control[]={this.sle_1}
end on

on tabpage_2.destroy
destroy(this.sle_1)
end on

type sle_1 from singlelineedit within tabpage_2
integer x = 27
integer y = 20
integer width = 1541
integer height = 288
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_12 from datawindow within w_apinspupdate_m_new
integer x = 2789
integer y = 280
integer width = 1019
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 입고처선택
string ls_insupp

this.accepttext()
ls_insupp = this.object.supp_no[1]

if isnull(ls_insupp) OR ls_insupp = "" then
	cb_inupt.enabled = false
else
	cb_inupt.enabled = true
end if

end event

type cbx_inupt from checkbox within w_apinspupdate_m_new
integer x = 2395
integer y = 260
integer width = 375
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "입고처변경"
end type

event clicked;//
long  ll_purcnt

debugbreak()
if GF_Permission('발주입고_변경작업', gs_userid) = 'Y' then
	ll_purcnt  = dw_4.object.compute_1[1]
//	if ll_purcnt > 1 then
//		MessageBox("확인","주문번호가 하나이상인 경우는 입고처변경이 안됩니다.")
//		RETURN
//	else
		if this.checked = true then
			dw_12.enabled     = true
			cb_inupt.enabled  = false	
			dw_12.object.supp_no.Background.Color = rgb(255, 255, 255)
	
			dw_1.enabled    = false
			dw_2.enabled    = false
			dw_area.enabled = false
			cb_2.enabled    = false		// 단가작업
			
			pb_retrieve.enabled = false// 조회
			pb_cancel.enabled = false	// 취소
			pb_print.enabled  = false	// 출력
			
			pb_delete.enabled = false	// 삭제
			pb_save.enabled   = false	// 저장
			pb_1.enabled      = false	// 행삭제
		else
			dw_12.enabled     = false
			cb_inupt.enabled  = false	
			dw_12.object.supp_no.Background.Color = 67108864
	
			dw_1.enabled    = true
			dw_2.enabled    = true
			dw_area.enabled = true
			
			cb_2.enabled    = true		// 단가작업
			pb_retrieve.enabled = true // 조회
			pb_cancel.enabled = true	// 취소
			pb_print.enabled  = true	// 출력

			pb_delete.enabled = true	// 삭제
			pb_save.enabled   = true	// 저장
			pb_1.enabled      = true	// 행삭제
		end if
//	end if
else
	dw_12.enabled     = false
	cb_inupt.enabled  = false
	dw_12.object.supp_no.Background.Color = 67108864
end if

end event

type cb_inupt from commandbutton within w_apinspupdate_m_new
integer x = 2391
integer y = 320
integer width = 384
integer height = 64
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "변경저장"
end type

event clicked;// 변경작업(입고내역, 코일재고현황, 발주내역)
string ls_inspno, ls_suppno, ls_purno

dw_1.accepttext()
dw_12.accepttext()
dw_2.accepttext()

ls_inspno   = dw_1.object.insp_no[1]
ls_suppno   = dw_12.object.supp_no[1] 
ls_purno    = dw_2.object.pur_no[1]

if isnull(ls_inspno) OR ls_inspno = "" then RETURN
if isnull(ls_suppno) OR ls_suppno = "" then RETURN
if isnull(ls_purno)  OR ls_purno  = "" then RETURN

// 입고내역
UPDATE INSP SET SUPP_NO = :ls_suppno WHERE INSP_NO = :ls_inspno;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("저장","입고내역 수정중 오류가 발생하였습니다!",exclamation!)
	RETURN
else
	// 코일재고
	UPDATE COILMST SET SUPP_NO = :ls_suppno WHERE PORDER_NO = :ls_purno;
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("저장","코일재고 수정중 오류가 발생하였습니다!",exclamation!)
		RETURN
	else
		// 발주내역
		UPDATE PUR  
		   SET SUPP_NO     = :ls_suppno
		     , SHIPTO_ADDR = (SELECT ADDR FROM SUPP WHERE SUPP_NO = :ls_suppno)
		 WHERE ORDER_NO    = :ls_purno;
		if sqlca.sqlcode <> 0 then
			ROLLBACK;
			MessageBox("저장","코일재고 수정중 오류가 발생하였습니다!",exclamation!)
			RETURN
		else
			COMMIT;
			MessageBox("저장","입고처 변경완료!",exclamation!)
		end if
	end if		
end if		

//
dw_12.enabled     = false
cb_inupt.enabled  = false	
dw_12.object.supp_no.Background.Color = 67108864

dw_1.enabled      = true
dw_2.enabled      = true
dw_area.enabled   = true
cb_2.enabled      = true	// 단가작업

pb_retrieve.enabled = true // 조회
pb_cancel.enabled = true	// 취소
pb_print.enabled  = true	// 출력

pb_delete.enabled = true	// 삭제
pb_save.enabled   = true	// 저장
pb_1.enabled      = true	// 행삭제

end event

type gb_4 from groupbox within w_apinspupdate_m_new
integer x = 1326
integer width = 722
integer height = 216
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79220952
end type

type pb_1 from picturebutton within w_apinspupdate_m_new
integer x = 4535
integer y = 264
integer width = 229
integer height = 116
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DEL"
vtextalign vtextalign = vcenter!
end type

event clicked;//
string ls_orderno, ls_inspno, ls_supp_no, ls_msg, ls_area, ls_order_no
long   ll_row , ll_cnt
int    li_seq
dec    ld_insp_amount
datetime ldt_today, ldt_getdate, ldt_insp_date, ldt_old_time
date   ld_sdate, ld_edate, ld_user_date

string ls_ITEM_NO, ls_QA, ls_locno, ls_destination, ls_serial_id, LS_TYPE, ls_rem, ls_sqlerrtext
decimal L_rcpt_qty, L_issue_qty, l_cost, l_unit_qty, l_cnt, l_com_qty


dw_2.AcceptText()
ll_row = dw_2.getrow()
if ll_row < 1 then RETURN

ls_area   = LeftA(dw_area.object.area[1],1)

ls_inspno = dw_4.object.insp_no[dw_4.getrow()]
if isnull(ls_inspno) OR trim(ls_inspno) = "" then
	MessageBox("삭제", "선택된 입고상세가 없습니다.")
	RETURN
end if

// 출고자료 확인
if WF_DoDet_Check(ll_row) = true then	// 자료 존재함
	ls_msg  = "해당 자료는 이미 출고 완료된 자료입니다.~n~n"
	ls_msg += "확인하여 주시기 바랍니다.~n~n"
	MessageBox("확인",ls_msg,StopSign!)
	RETURN
end if
	
if MessageBox("확인", "선택한 입고상세 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN

//
ldt_today      = datetime(today())
ld_insp_amount = dw_2.object.rlse_amount[ll_row] 
ls_supp_no     = dw_1.object.supp_no[1]
li_seq         = dw_2.object.oi_no[ll_row]
ls_order_no = dw_2.object.insp_no[1]

if WF_Delete(ll_row) = false then 
	ROLLBACK;
	dw_2.retrieve( ls_inspno )
	dw_2.scrolltorow( ll_row )
	RETURN
end if

UPDATE supp 
   SET balance_amt = balance_amt - :ld_insp_amount, last_tran_date = :ldt_today
 WHERE supp_no = :ls_supp_no;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
	dw_2.retrieve( ls_inspno )	
	RETURN
end if		

dw_2.DeleteRow( ll_row )
/*ld_user_date  = date(dw_1.GetItemDateTime( 1, 'user_date', Primary!, True))*/
ld_user_date  = date(dw_1.GetItemDateTime( 1, 'insp_date', Primary!, True))	/*2018-05-18 jowonsuk 수정 현재는 user_date 사용 안함, insp_date 사용 */
ldt_insp_date  = dw_1.GetItemDateTime( 1, 'insp_date', Primary!, True)

if dw_2.rowcount() < 1 then
	dw_1.DeleteRow(1)
else
	WF_Sum()
end if

ls_orderno = dw_4.object.insp_no[dw_4.getrow()]

/*2018.05.15 jowonsuk 신규 로직으로 주석처리
dw_6.reset()

dw_10.retrieve( ld_user_date, "RO", ls_orderno, li_seq )
dw_10.RowsCopy(1,  dw_10.RowCount(), Primary!, dw_6, 1, Primary!)

dw_10.retrieve( ld_user_date, "RI", ls_orderno, li_seq )
dw_10.RowsCopy(1,  dw_10.RowCount(), Primary!, dw_6, 1, Primary!)

dw_10.retrieve( ld_user_date, "IO", ls_orderno, li_seq )
dw_10.RowsCopy(1,  dw_10.RowCount(), Primary!, dw_6, 1, Primary!)

dw_6.accepttext()

SELECT top 1 getdate() INTO :ldt_getdate FROM login;
ldt_old_time = ldt_getdate



for ll_row = 1 to dw_6.rowcount()
	
	dw_6.object.inaudit_time[ll_row] = ldt_getdate
	dw_6.object.inaudit_date[ll_row] = ldt_insp_date
	dw_6.object.rcpt_qty[ll_row]     = dw_6.object.rcpt_qty[ll_row]  * -1
	dw_6.object.issue_qty[ll_row]    = dw_6.object.issue_qty[ll_row] * -1
	dw_6.object.user_id[ll_row]      = gs_userid
	
	Do While ldt_old_time = ldt_getdate
		SELECT top 1 getdate() INTO :ldt_getdate FROM login;
	Loop
	ldt_old_time = ldt_getdate
	
next
*/


/*2018.05.15 jowonsuk 신규 삭제 로직 */

//		DECLARE inaudit_cursor CURSOR FOR  
/*		  SELECT     
						inaudit.inaudit_item,   
						inaudit.qa,   
						inaudit.loc_no,   
						inaudit.inaudit_type,   
						ISNULL(inaudit.rcpt_qty,0)* -1 rcpt_qty,   
						ISNULL(inaudit.issue_qty,0)* -1 issue_qty,   
						inaudit.cost,   
						inaudit.destination,   
						inaudit.serial_id,   
						inaudit.unit_qty,   
						inaudit.cnt,   
						inaudit.com_qty,
						inaudit.rem
			 FROM inaudit  
			WHERE ( inaudit.inaudit_date = :ld_user_date ) AND  
					( inaudit.inaudit_type in ('RO', 'RI', 'IO') ) AND  
					( inaudit.order_no = :ls_orderno ) AND 
					( inaudit.cnt = :li_seq) and				
					( ISNULL(inaudit.rcpt_qty,0) ) >= 0 and
					( ISNULL(inaudit.issue_qty,0) ) >= 0 and							
					( inaudit.rem not like '%입고삭제%');
*/

//			  SELECT  inspdet.item_no     
//					 , inspdet.qa        
//					 , inspdet.loc_no 
//					 , ( case when pur.subcon = 'N' then 'RI'
//									when pur.subcon = 'Y' then 'RI'
//									when pur.subcon = 'W' then 'RI'
//									when pur.subcon = 'L' then 'RI'
//						 else 'RO' end) iotype 
//					 , inspdet.rcpt_qty*-1 rcpt_qty
//					 , 0 issue_qty            
//					 , inspdet.price                        
//					 , insp.supp_no destination  
//					 , inspdet.coil_no        
//					 , inspdet.unit_qty
//					 , inspdet.oi_no cnt
//					 , purdet.com_qty         
//					 , '행입고삭제' rem              
//					 , inspdet.insp_no           
//					 , insp.insp_date
//				 FROM insp with(nolock) inner join inspdet with(nolock) ON insp.insp_no    = inspdet.insp_no
//						            LEFT OUTER JOIN pur with(nolock) ON inspdet.pur_no  = pur.order_no
//								  LEFT OUTER JOIN purdet with(nolock) ON inspdet.pur_no  = purdet.order_no AND inspdet.seq_no = purdet.seq_no
//				WHERE ( inspdet.insp_no    = :ls_order_no )
//				         and ( inspdet.oi_no    = :li_seq );

//		ls_item_no = dw_2.object.item_no[ll_row]
//		ls_qa = dw_2.object.qa[ll_row]
//		ls_locno = dw_2.object.loc_no[ll_row]
//		ls_type = dw_2.object.iotype[ll_row]
//		L_rcpt_qty = dw_2.object.rcpt_qty[ll_row]*(-1)
//		L_issue_qty = 0
//		l_cost = dw_2.object.price[ll_row]
//		ls_destination = dw_2.object.supp_no[ll_row]
//		ls_serial_id = dw_2.object.coil_no[ll_row]
//		l_unit_qty = dw_2.object.unit_qty[ll_row]
//		l_cnt = dw_2.object.oi_no[ll_row]
//		l_com_qty = dw_2.object.comqty[ll_row]
//		ls_rem = '행입고삭제'
//		ldt_insp_date = dw_2.object.insp_date[ll_row]
//		
//		
//		 INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa,  order_no,        loc_no,     inaudit_type, rcpt_qty,     issue_qty,   cost,      destination,      serial_id, 	   	   rem,         unit_qty,     cnt,     com_qty,   user_id )  
//					  VALUES ( getdate(), :ldt_insp_date, :ls_ITEM_NO, :ls_QA,    :ls_orderno,  :ls_locno, :LS_TYPE,    :L_rcpt_qty, :L_issue_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem,   :l_unit_qty, :l_cnt, :l_com_qty, :gs_userid  );
//				 
//				 
//		if sqlca.sqlcode < 0 then
//			ls_sqlerrtext = string(sqlca.sqlerrtext)
//			ROLLBACK;				
//			MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
//			RETURN 0
//		end if					 		
//		
//		commit;
		
		
//		OPEN inaudit_cursor;
//		
//				FETCH inaudit_cursor INTO  :ls_ITEM_NO, :ls_QA, :ls_locno, :LS_TYPE,  :L_rcpt_qty, :L_issue_qty, :l_cost, :ls_destination, :ls_serial_id, :l_unit_qty, :l_cnt, :l_com_qty, :ls_rem, :ls_orderno, :ldt_insp_date;
//				
//				Do While sqlca.sqlcode = 0
//			
//				
//					 INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa,  order_no,        loc_no,     inaudit_type, rcpt_qty,     issue_qty,   cost,      destination,      serial_id, 	   	   rem,         unit_qty,     cnt,     com_qty,   user_id )  
//						        VALUES ( getdate(), :ldt_insp_date, :ls_ITEM_NO, :ls_QA,    :ls_orderno,  :ls_locno, :LS_TYPE,    :L_rcpt_qty, :L_issue_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem,   :l_unit_qty, :l_cnt, :l_com_qty, :gs_userid  );
//							 
//							 
//					if sqlca.sqlcode < 0 then
//						ls_sqlerrtext = string(sqlca.sqlerrtext)
//						ROLLBACK;				
//						MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
//						RETURN 0
//					end if					 
//				
//						
//					FETCH inaudit_cursor INTO  :ls_ITEM_NO, :ls_QA, :ls_locno, :LS_TYPE,  :L_rcpt_qty, :L_issue_qty, :l_cost, :ls_destination, :ls_serial_id, :l_unit_qty, :l_cnt, :l_com_qty, :ls_rem, :ls_orderno, :ldt_insp_date;
//					
//				Loop
//				
//			
//		CLOSE inaudit_cursor;


/*2018.05.15 jowonsuk 신규 로직으로 주석처리  */
//dw_6.accepttext()
//WF_Update3( dw_6, dw_1, dw_2, "Y" )

/*2018.05.15 jowonsuk 신규 로직 */
WF_Update2( dw_1, dw_2, "Y" )

if dw_2.rowcount() < 1 then
	dw_4.retrieve( is_supp_no, id_start_date, id_end_date, ls_area )
end if

if dw_4.rowcount() > 0  then
	ii_row    = dw_4.getrow()
	ls_inspno = dw_4.object.insp_no[ii_row]
	
	dw_1.retrieve( ls_inspno )
	dw_2.retrieve( ls_inspno )	
else
	if dw_1.enabled = true then
		pb_cancel.enabled   = false
		pb_save.enabled     = false
		pb_delete.enabled   = false
		pb_retrieve.enabled = true
		
		dw_1.enabled = false ; dw_2.enabled = false ; dw_4.enabled = false
		dw_3.enabled = true
		dw_1.reset() ; dw_2.reset() ; dw_4.reset()		
	end if
end if

end event

type st_vertical from u_splitbar_vertical within w_apinspupdate_m_new
integer x = 1774
integer y = 412
integer height = 540
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_apinspupdate_m_new
integer x = 27
integer y = 960
integer width = 4768
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type cb_comuom from commandbutton within w_apinspupdate_m_new
integer x = 4201
integer y = 264
integer width = 315
integer height = 116
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "환단변경"
end type

event clicked;//
string ls_msg

if dw_2.rowcount() < 1 then RETURN

if MessageBox("확인", "환산단위만 수정할 수 있습니다.~n~n환산수량까지 수정되지는 않습니다.",Exclamation!, OKCancel!, 2) = 2 then RETURN

dw_2.Object.com_uom.TabSequence = 15

end event

type st_2 from statictext within w_apinspupdate_m_new
integer x = 82
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_apinspupdate_m_new
integer x = 270
integer y = 280
integer width = 480
integer height = 632
integer taborder = 20
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

type ddlb_dwtitles from dropdownlistbox within w_apinspupdate_m_new
integer x = 311
integer y = 288
integer width = 311
integer height = 88
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
end type

type st_5 from statictext within w_apinspupdate_m_new
integer x = 768
integer y = 292
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

type ddlb_op from dropdownlistbox within w_apinspupdate_m_new
integer x = 937
integer y = 280
integer width = 297
integer height = 512
integer taborder = 30
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

type sle_value from singlelineedit within w_apinspupdate_m_new
integer x = 1257
integer y = 284
integer width = 443
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_6 from commandbutton within w_apinspupdate_m_new
integer x = 1714
integer y = 284
integer width = 160
integer height = 76
integer taborder = 90
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

choose case is_dw
	case "dw_4"
		arg_dw = dw_4	
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_7 from commandbutton within w_apinspupdate_m_new
integer x = 1879
integer y = 284
integer width = 160
integer height = 76
integer taborder = 100
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

choose case is_dw
	case "dw_4"
		arg_dw = dw_4	
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_8 from commandbutton within w_apinspupdate_m_new
integer x = 2043
integer y = 284
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_4"
		arg_dw = dw_4	
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_9 from commandbutton within w_apinspupdate_m_new
integer x = 2208
integer y = 284
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_4"
		arg_dw = dw_4	
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_6 from statictext within w_apinspupdate_m_new
integer x = 2862
integer y = 36
integer width = 306
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
string text = "입고일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

