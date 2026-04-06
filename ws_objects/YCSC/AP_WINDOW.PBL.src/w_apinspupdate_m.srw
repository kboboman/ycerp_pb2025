$PBExportHeader$w_apinspupdate_m.srw
$PBExportComments$발주입고 수정및삭제(1999/05/21, 이인호)
forward
global type w_apinspupdate_m from w_inheritance
end type
type gb_5 from groupbox within w_apinspupdate_m
end type
type dw_3 from datawindow within w_apinspupdate_m
end type
type dw_4 from datawindow within w_apinspupdate_m
end type
type dw_7 from datawindow within w_apinspupdate_m
end type
type st_1 from statictext within w_apinspupdate_m
end type
type dw_5 from datawindow within w_apinspupdate_m
end type
type pb_1 from picturebutton within w_apinspupdate_m
end type
type dw_8 from datawindow within w_apinspupdate_m
end type
type em_s from editmask within w_apinspupdate_m
end type
type em_e from editmask within w_apinspupdate_m
end type
type st_2 from statictext within w_apinspupdate_m
end type
type dw_9 from datawindow within w_apinspupdate_m
end type
type st_22 from statictext within w_apinspupdate_m
end type
type dw_area from datawindow within w_apinspupdate_m
end type
type dw_6 from datawindow within w_apinspupdate_m
end type
type dw_10 from datawindow within w_apinspupdate_m
end type
type dw_11 from datawindow within w_apinspupdate_m
end type
type em_3 from editmask within w_apinspupdate_m
end type
type cb_1 from commandbutton within w_apinspupdate_m
end type
type st_3 from statictext within w_apinspupdate_m
end type
type cb_2 from commandbutton within w_apinspupdate_m
end type
type tab_1 from tab within w_apinspupdate_m
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
type tab_1 from tab within w_apinspupdate_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type gb_4 from groupbox within w_apinspupdate_m
end type
type st_pick from structure within w_apinspupdate_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_apinspupdate_m from w_inheritance
integer width = 4297
integer height = 2316
string title = "발주입고 수정및삭제(w_apinspupdate_m)"
boolean resizable = false
gb_5 gb_5
dw_3 dw_3
dw_4 dw_4
dw_7 dw_7
st_1 st_1
dw_5 dw_5
pb_1 pb_1
dw_8 dw_8
em_s em_s
em_e em_e
st_2 st_2
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
gb_4 gb_4
end type
global w_apinspupdate_m w_apinspupdate_m

type variables
st_print i_print
datawindowchild idwc_supp, idwc_area
string is_supp_no, is_enable_unit_qty = 'N', is_filename
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

public function boolean wf_update ();int  li_int, li_seq
long ll_year
dec ld_qty, ld_unit
string ls_month, ls_supp_no, ls_inspno, ls_coil, ls_sheet, ls_oc
string ls_case
		
ls_inspno = dw_4.object.insp_no[dw_4.getrow()]
ls_case = dw_1.object.insp_insp_case[1]

dw_1.object.insp_cash[1] = 0
dw_1.object.insp_rate[1] = 0
dw_1.object.insp_total[1] = 0
for li_int = 1 to dw_2.rowcount()
	if ls_case = 'A' then
		if dw_2.object.rate_cash[li_int] <> dw_2.object.rlse_rate[li_int] then
			dw_2.object.rate_cash[li_int] = dw_2.object.rlse_rate[li_int]
		end if
		//김영호 부장님의 요구로 입고후 단중을 변경 할수 있게함 넘 힘든과정 이었음..
		//1. inaudit변경 = 그래야 ineoday ineoym itemloc item 이 qoh가 변경 되니깐.
		//2. coilmst, sheetmst 변경 = 변경시에 로트번호 변경 체크..
		IF dw_2.object.unit_qty[li_int] <> dw_2.getitemdecimal(li_int, 'unit_qty', primary!, true) then
			li_seq = dw_2.object.oi_no[li_int]
			ld_unit = dw_2.object.unit_qty[li_int]
			ld_qty = ld_unit * dw_2.object.cnt[li_int]
			ls_coil = trim(dw_2.object.coil_no[li_int])
	
			if MidA(dw_2.object.item_no[li_int] ,4,1) = '2' then 
				//SHEET 단중 변경
				SELECT open_close INTO :ls_oc FROM sheetmst WHERE sheet_no = :ls_coil;
				if ls_oc <> 'O' then
					rollback;
					messagebox("확인1","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중입니다" &
										+  "이 코드에 대한 후처리를 삭제후에 단중을 변경하십시요")
					return false
				end if
				
				UPDATE sheetmst SET unit_qty = :ld_unit, rcpt_qty = :ld_unit WHERE sheet_no = :ls_coil;
				if sqlca.sqlcode <> 0 then
					rollback;
					messagebox("저장2","sheetmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					return false
				end if		
			else
				// coil 단중 변경
				SELECT open_close INTO :ls_oc FROM coilmst WHERE coil_no = :ls_coil;
				if ls_oc <> 'O' then
					rollback;
					messagebox("확인3","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중입니다" &
										+  "이 코드에 대한 후처리를 삭제후에 단중을 변경하십시요")
					return false
				end if

				UPDATE coilmst SET unit_qty = :ld_unit, rcpt_qty = :ld_unit WHERE coil_no = :ls_coil;
				if sqlca.sqlcode <> 0 then
					rollback;
					messagebox("저장4","sheetmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					return false
				end if		
			end if

			// inaudit 입고 수량 변경
			UPDATE inaudit SET rcpt_qty = :ld_qty, unit_qty = :ld_unit, com_qty = :ld_qty
			 WHERE (inaudit_type = 'RO' or inaudit_type = 'RI')
				AND order_no = :ls_inspno
				AND cnt = :li_seq;
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장5","inaudit update중 오류가 발생하였습니다!~n~r" &
										+ sqlca.sqlerrtext,exclamation!)
				return false
			end if		
		end if
//---------------- 2006/03/16 특기사항만 처리
		IF dw_2.object.coilmst_etc_no[li_int] <> dw_2.getitemstring(li_int, 'coilmst_etc_no', primary!, true) then
			ls_coil = trim(dw_2.object.coil_no[li_int])
	
			if MidA(dw_2.object.item_no[li_int] ,4,1) = '2' then 
			else
				// coil 특기사항
				SELECT open_close INTO :ls_oc FROM coilmst WHERE coil_no = :ls_coil;
				if ls_oc <> 'O' then
					rollback;
					messagebox("확인5-1","이 로트번호[" + ls_coil + "]는 이미 다른 처리 중입니다" &
										+  "이 코드에 대한 후처리를 삭제후에 단중을 변경하십시요")
					return false
				end if

				string ls_etc_no
				ls_etc_no = dw_2.object.coilmst_etc_no[dw_2.getrow()]
				UPDATE coilmst SET etc_no = :ls_etc_no WHERE coil_no = :ls_coil;
				if sqlca.sqlcode <> 0 then
					rollback;
					messagebox("저장5-2","coilmst update중 오류가 발생하였습니다!~n~r" &
											+ sqlca.sqlerrtext,exclamation!)
					return false
				end if		
			end if
		end if
//---------------- 
	end if
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
IF dw_1.object.insp_total[1] <> dw_1.getitemdecimal(1, 'insp_total', primary!, true) then
	ld_qty = dw_1.getitemdecimal(1, 'insp_total', primary!, true) - dw_1.object.insp_total[1] 
	ls_supp_no = dw_1.object.supp_no[1]

	UPDATE supp SET balance_amt = balance_amt - :ld_qty WHERE supp_no = :ls_supp_no;
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장6","supp UPDATE중 오류가 발생하였습니다!",exclamation!)
		return false
	end if		

end if

wf_update2(dw_1, dw_2, 'Y')
return true
end function

public function boolean wf_delete (long arg_cnt);//
decimal {1} ld_wid, ld_w_wid
real   lr_newqty, lr_unitqty, lr_rlseqty, lr_newqty10
long   ll_cnt, ll_cnt2, ll_row, ll_i
int    li_seq, li_division, li_operation, li_exist, li_wcnt, li_oino
string ls_item4, ls_wqa, ls_loc, ls_inspno
string ls_item, ls_product, ls_newloc, ls_qa, ls_coil, ls_sheet, ls_order
string ls_subcon, ls_coilorder, ls_flag, ls_w_coil, ls_sale, ls_array[1], ls_wc, ls_supp
string ls_case

ls_supp    = trim(dw_1.object.supp_no[1])
ls_item    = trim(dw_2.object.item_no[arg_cnt])
ls_product = trim(dw_2.object.product_no[arg_cnt])		// 생산주문번호
ls_newloc  = trim(DW_2.object.loc_no[arg_cnt])
lr_newqty  = dw_2.object.rcpt_qty[arg_cnt]
li_seq     = dw_2.object.seq_no[arg_cnt]
ls_qa      = trim(dw_2.object.qa[arg_cnt])
ld_wid     = dec(string(MidA(ls_qa,5,4) + "." + MidA(ls_qa,10,1)))
ls_coil    = trim(dw_2.object.coil_no[arg_cnt])
ls_sheet   = trim(dw_2.object.purdet_work_type[arg_cnt])
ls_order   = trim(dw_2.object.pur_no[arg_cnt])
ls_subcon  = trim(dw_2.object.subcon[arg_cnt])

ls_inspno  = trim(dw_2.object.insp_no[arg_cnt])		// 입고번호
li_oino    = dw_2.object.oi_no[arg_cnt]
SELECT count(*) INTO :ll_cnt 
  FROM apoi, apoiinv
 WHERE insp_no = :ls_inspno AND oi_no = :li_seq
   AND apoi.apoiinv_no = apoiinv.apoiinv_no AND apoiinv.delete_flag = 'N';
if ll_cnt > 0 then
	rollback;
	messagebox('오류1', string(arg_cnt) + '번째 자료는 이미 매입이 발생한 자료입니다~r~n 매입 삭제후에 삭제하십시요..',exclamation!)
	return false
end if

ll_cnt     = dw_2.object.cnt[arg_cnt]
lr_unitqty = dw_2.object.unit_qty[arg_cnt]
ll_cnt2    = dw_2.object.comqty[arg_cnt]

// 구매발주 입고수량 업데이트
lr_newqty10 = lr_newqty * (-1)
ll_row      = dw_5.retrieve(ls_order,li_seq)
for ll_i = ll_row to 1 step -1
    lr_rlseqty = dw_5.object.rlse_qty[ll_i]
    dw_5.object.result_type[ll_i] = "N"
    if lr_rlseqty > 0 then
	    if lr_rlseqty >= abs(lr_newqty10) then
		    dw_5.object.rlse_qty[ll_i]  = lr_rlseqty + lr_newqty10
		    dw_5.object.rlse_date[ll_i] = wf_today()
		    exit
	    else
		    if ll_i = 1 then
			    dw_5.object.rlse_qty[ll_i]  = 0
			    dw_5.object.rlse_date[ll_i] = wf_today()
			    exit
		    else
			    dw_5.object.rlse_qty[ll_i]  = 0
			    dw_5.object.rlse_date[ll_i] = wf_today()
			    lr_newqty10 = lr_rlseqty + lr_newqty10 
			    continue
		    end if
	    end if
    end if
next

if dw_5.update() <> 1 then 
	rollback;
   messagebox('오류2','[wf_delete][dw_5] update중 DB오류발생하였습니다.',exclamation!)
   return false					
end if

ls_case    = dw_1.object.insp_insp_case[1]
if ls_case = 'C' then return true

debugbreak()
if (ls_subcon = 'N') or (ls_subcon = 'C') or (ls_subcon = 'W') or (ls_subcon = 'J') then
   // 저장소 변경 있는 수량오류보정을 위한 출고 및 입고
   choose case ls_subcon
	   case 'C'
			if ls_product = "" or isnull(ls_product) then
				MessageBox("확인","입고번호의 [" + ls_inspno + "] 작업지시 번호가 존재하지 않습니다.")
				// 작지번호가 존재하지 않은 경우와  구매발주 입고수량 업데이트 관계 파악계속(2012/09/17)
				return false
			end if
			
			UPDATE coilsliting SET proc_flag = 'O' WHERE order_no = :ls_product AND seq = :ll_cnt2;				
			if sqlca.sqlcode <> 0 then
				messagebox('오류3',"[coilsliting]UPDATE 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return false
			end if
			
			SELECT proc_flag, coilorder_order, coil_no, wid, cnt, loc_no
			  INTO :ls_flag, :ls_coilorder, :ls_w_coil, :ld_w_wid, :li_wcnt, :ls_loc
			  FROM coilorderdet
			 WHERE order_no = :ls_product;
			if sqlca.sqlcode <> 0 then
				messagebox('오류4',"코일작업오더[coilorderdet]SELECT 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return false
			end if
			
			if ls_flag <> "P" then
				UPDATE coilorderdet SET proc_flag = 'P' WHERE order_no = :ls_product;
				if sqlca.sqlcode <> 0 then
					messagebox('오류5',"코일작업오더[coilorderdet]UPDATE 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					rollback;
					return false
				end if
				
				UPDATE coilorder SET open_close = 'O' WHERE order_no = :ls_coilorder;
				if sqlca.sqlcode <> 0 then
					messagebox('오류6',"코일작업오더[coilorder]UPDATE 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					rollback;
					return false
				end if
				
				UPDATE coilmst 
				   SET qcnt = qcnt + :li_wcnt, open_close = 'S'
				 WHERE coil_no = :ls_w_coil AND loc_no = :ls_supp AND open_close <> 'S';
				if sqlca.sqlcode <> 0 then
					rollback;
					messagebox('오류7','[wf_save2]coilmst UPDATE중 DB오류발생하였습니다.~r~n' &
									+ ' coil_no=[' + ls_w_coil + '] wid = ' + string(ld_w_wid, "####.0"),exclamation!)
					return false	
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
						messagebox('오류8',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
						rollback;
						return false
					end if
				next
			end if
			
			//스리팅코일 삭제
			if ls_sheet = "S" then
				DELETE FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_newloc;
				if sqlca.sqldbcode <> 0 then
					rollback;
					messagebox('오류9','[sheet마스터] delete중 DB오류발생하였습니다.',exclamation!)
					return false
				end if
			else
				DELETE FROM coilmst WHERE coil_no = :ls_coil   AND loc_no = :ls_newloc;
				if sqlca.sqldbcode <> 0 then
					rollback;
					messagebox('오류10','[코일마스터] delete중 DB오류발생하였습니다.',exclamation!)
					return false
				end if
			end if
	
	    case 'J'
			  UPDATE jajaesudo SET flag = 'Y', out_type = 'Y' WHERE order_no = :ls_product;
		     if sqlca.sqlcode < 0 then
			     rollback;
			     messagebox('오류11','[wf_delete][jajaesudo] update중 DB오류발생하였습니다.',exclamation!)
			     return false
		     end if
			  
	    case 'W'
			  //원코일구매 삭제
			  SELECT open_close INTO :ls_flag FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_newloc;
				if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
					rollback;
					messagebox("확인12","코일자료가 없습니다. 전산실로 연락바랍니다")
					return false
				end if
				
				CHOOSE CASE ls_flag
					CASE "M"
					  rollback;
						messagebox("확인13","이 코일번호[" + ls_coil + "]은 지금 생산계획중입니다.")
						return false
					CASE "P"
			    		rollback;
						messagebox("확인14","이 코일번호[" + ls_coil + "]은 지금 작업지시중입니다.")
						return false
					CASE "C"
			    		rollback;
						messagebox("확인15","이 코일번호[" + ls_coil + "]은 이미 사용이 완료되었습니다")
						return false
					CASE "S"
			    		rollback;
						messagebox("확인16","이 코일번호[" + ls_coil + "]은 이미 외주로 이동되어있습니다")
						return false
					CASE ELSE
			    		rollback;
						messagebox("확인17","이 코일번호[" + ls_coil + "]은 이미 외주로 이동되어있습니다")
						return false
				END CHOOSE
			  
			  DELETE FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_newloc;
			  if sqlca.sqlcode <> 0 then
					rollback;
					messagebox('오류18','[wf_delete][코일마스터] delete중 DB오류발생하였습니다.',exclamation!)
					return false
			  end if
    end choose
    //if (ls_subcon = 'N') or (ls_subcon = 'C') or (ls_subcon = 'W') or (ls_subcon = 'J') then
	 
else // subcon = 'L' or 'P' or 'Y'
   choose case ls_subcon
	     case 'Y'
		     UPDATE sudodet1 SET rcpt_qty = rcpt_qty - :lr_newqty, sudo_type = 'B' WHERE order_no = :ls_product;
		     if sqlca.sqlcode < 0 then
			     rollback;
			     messagebox('오류19','[wf_delete][sudodet] update중 DB오류발생하였습니다.',exclamation!)
			     return false
		     end if
	     case 'P'
		     UPDATE sudodet  SET rcpt_qty = rcpt_qty - :lr_newqty, sudo_type = 'B' WHERE order_no = :ls_product;
		     if sqlca.sqlcode < 0 then
			     rollback;
			     messagebox('오류20','[wf_delete][sudodet1] update중 DB오류발생하였습니다.',exclamation!)
			     return false
		     end if
    end choose
	 
	 SELECT sale_no, seq_no, division, wc_no, operation
	   INTO :ls_sale, :li_seq,:li_division, :ls_wc, :li_operation
	   FROM mpsdet
	  WHERE plan_no = :ls_product;
	 if sqlca.sqlcode < 0 then
	    rollback;
       messagebox('오류21','[wf_delete][mpsdet] select수행중 오류가 발생했습니다.',exclamation!)
	    return false
	 else
		 UPDATE mpsdet SET rcpt_qty = rcpt_qty - :lr_newqty WHERE plan_no = :ls_product;
		 if sqlca.sqlcode < 0 then
	   	 rollback;
			 messagebox('오류22','DB오류발생하였습니다.',exclamation!)
			 return false
		 end if

//		 select operation into :li_operation from routtempnew
//		  where division = :li_division 
//		    and sale_no = :ls_sale 
//			 and seq_no = :li_seq
//		    and wc_no = :ls_wc;
//	    if sqlca.sqlcode < 0 then
//	       rollback;
//          messagebox('오류23','[wf_delete][routtempnew] select오류가 발생했습니다.',exclamation!)
//	       return false
//		 else
			 UPDATE routtempnew 
			    SET make_qty = make_qty - :lr_newqty
		     WHERE division = :li_division AND sale_no = :ls_sale AND seq_no = :li_seq AND operation = :li_operation;
			 if sqlca.sqlcode < 0 then
	      	 rollback;
				 messagebox('오류24','DB오류발생하였습니다.',exclamation!)
				 return false
			 end if
			 
			 li_operation ++
		    SELECT operation INTO :li_operation FROM routtempnew
		     WHERE division = :li_division AND sale_no = :ls_sale AND seq_no = :li_seq AND operation = :li_operation;
			 if sqlca.sqlcode = 100 then
//					update item set sales_reserved = sales_reserved - :lr_newqty
//					 where item_no = :ls_item and qa = :ls_qa;
//					if sqlca.sqlcode < 0 then
//						rollback;
//						messagebox('오류25','판매예약량 update중 DB오류가 발생했습니다.',exclamation!)
//						return false
//					end if

				UPDATE saledet 
				   SET plan_qty = plan_qty + :lr_newqty
					  , sol_qty = (case when sol_qty - :lr_newqty < 0 then 0 else sol_qty - :lr_newqty end)
					  , saledet_text = 'P'
				 WHERE order_no = :ls_sale AND seq_no = :li_seq;
					if sqlca.sqlcode < 0 then
						rollback;
						messagebox('오류26','update중 DB오류가 발생했습니다.',exclamation!)
						return false
					end if
			 else
				 if sqlca.sqlcode < 0 then
	             rollback;
					 messagebox('오류27','[wf_delete] DB오류발생하였습니다.',exclamation!)
					 return false
				 end if
				 
				 // 후공정처리
				li_exist = 0
	         SELECT count(*) INTO :li_exist FROM routtempnew
   	       WHERE division = :li_division AND sale_no = :ls_sale
      	      AND seq_no = :li_seq AND operation = :li_operation
					AND process_flag = 'E';
//	         if sqlca.sqlcode < 0 then
//	            rollback;
//	            messagebox('오류28','[wf_delete][routtempnew] select중 DB오류가 발생했습니다.',exclamation!)
//	            return false
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
		             rollback;
						 messagebox('오류29','DB오류발생하였습니다.',exclamation!)
						 return false
					 end if
				end if
			 end if
//		 end if
	 end if
end if

if (ls_subcon = 'W') OR (ls_subcon = 'C') then
else
	ls_item4 = MidA(ls_item, 4, 1)
	if ls_item4 = '1' then // 1; coil , 2 : sheet
	  //원코일구매 삭제
		IF wf_flag('C',ls_coil, ls_newloc) = FALSE THEN
			rollback;
			RETURN false
		end if
		  
	  DELETE FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_newloc;
	  if sqlca.sqlcode <> 0 then
			rollback;
			messagebox('오류36','[wf_delete][코일마스터] delete중 DB오류발생하였습니다.',exclamation!)
			return false
	  end if
	elseif ls_item4 = '2' then
		IF wf_flag('S', ls_coil, ls_newloc) = FALSE THEN
			rollback;
			RETURN false
		end if
		  
		DELETE FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_newloc;
		if sqlca.sqldbcode <> 0 then
			rollback;
			messagebox('오류37','[sheet마스터] delete중 DB오류발생하였습니다.',exclamation!)
			return false
		end if
	end if
end if

return true


end function

public function boolean wf_flag (string as_cs, string as_coil, string as_newloc);string ls_flag

if as_cs = "C" then
	select open_close into :ls_flag from coilmst 
	where coil_no = :as_coil
	  and loc_no = :as_newloc;
else
	select open_close into :ls_flag from sheetmst 
	where sheet_no = :as_coil
	  and loc_no = :as_newloc;
end if
if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
	rollback;
	messagebox("확인30","LOT자료가 없습니다. 전산실로 연락바랍니다")
	return false
end if
CHOOSE CASE ls_flag
	CASE "M"
	  rollback;
		messagebox("확인31","이 LOT번호[" + as_coil + "]은 지금 생산계획중입니다.")
		return false
	CASE "P"
		rollback;
		messagebox("확인32","이 LOT번호[" + as_coil + "]은 지금 작업지시중입니다.")
		return false
	CASE "C"
		rollback;
		messagebox("확인33","이 LOT번호[" + as_coil + "]은 이미 사용이 완료되었습니다")
		return false
	CASE "S"
		rollback;
		messagebox("확인34","이 LOT번호[" + as_coil + "]은 이미 외주로 이동되어있습니다")
		return false
	CASE "O"
	CASE ELSE
		rollback;
		messagebox("확인35","이 LOT번호[" + as_coil + "]의 상태가 오류가 발생하였습니다. ~r~n" &
								+ "전산실로 연락 바랍니다.")
		return false
END CHOOSE
		  
return true
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

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.visible = false
tab_1.x  = dw_1.x
tab_1.y  = dw_1.y

cb_2.enabled = false
tab_1.tabpage_1.hpb_1.position = 0
tab_1.tabpage_1.hpb_2.position = 0

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

if gf_permission('발주입고미수불', gs_userid) = 'Y' then
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

dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false
dw_9.visible = false
dw_10.visible = false
dw_11.visible = false

dw_3.insertrow(0)
dw_3.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(sqlca)

if gf_permission('발주입고입력자1', gs_userid) = 'Y' then	
	dw_2.object.unit_qty.tabsequence = 20
	dw_2.object.coilmst_etc_no.tabsequence = 25
	dw_2.object.comqty.tabsequence = 30
	is_enable_unit_qty = 'Y'
else
	dw_2.object.comqty.tabsequence = 30
	is_enable_unit_qty = 'N'
end if

if gf_permission('발주입고입력자2', gs_userid) = 'Y' then		
	dw_2.object.coilmst_etc_no.tabsequence = 25
end if
em_3.text = "SN" + string(today(), "yyyymmdd")
em_3.SelectText(9, 2)
em_3.setfocus()

if GF_PERMISSION("발주입고_수정및삭제", gs_userid) = "Y" then
else
	MessageBox("확인","발주입고_수정및삭제 권한이 존재하지 않습니다.")
	close(this)
end if

end event

on w_apinspupdate_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_7=create dw_7
this.st_1=create st_1
this.dw_5=create dw_5
this.pb_1=create pb_1
this.dw_8=create dw_8
this.em_s=create em_s
this.em_e=create em_e
this.st_2=create st_2
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
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.dw_7
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.dw_8
this.Control[iCurrent+9]=this.em_s
this.Control[iCurrent+10]=this.em_e
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.dw_9
this.Control[iCurrent+13]=this.st_22
this.Control[iCurrent+14]=this.dw_area
this.Control[iCurrent+15]=this.dw_6
this.Control[iCurrent+16]=this.dw_10
this.Control[iCurrent+17]=this.dw_11
this.Control[iCurrent+18]=this.em_3
this.Control[iCurrent+19]=this.cb_1
this.Control[iCurrent+20]=this.st_3
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.tab_1
this.Control[iCurrent+23]=this.gb_4
end on

on w_apinspupdate_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_7)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.dw_8)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.st_2)
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
destroy(this.gb_4)
end on

event resize;call super::resize;//
dw_2.width  = this.width  - 69
dw_2.height = this.height - 908

end event

type pb_save from w_inheritance`pb_save within w_apinspupdate_m
string tag = "저장"
integer x = 3835
integer y = 44
integer taborder = 40
boolean enabled = false
end type

event pb_save::clicked;int  li_count

dw_1.Accepttext()
dw_2.Accepttext()

li_count = wf_modifycount(dw_1) + wf_modifycount(dw_2)
IF li_count >= 1 THEN
		wf_update()
ELSE
	MessageBox("확인", "변경된 내역이 없습니다.")
END IF

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apinspupdate_m
integer x = 645
integer y = 372
integer width = 2875
integer height = 408
integer taborder = 170
boolean enabled = false
string dataobject = "d_apinspupdate_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;int li_int

dw_1.Accepttext()
if this.rowcount() < 1 then return

dw_2.Accepttext()
dw_1.object.insp_cash[1] = 0
dw_1.object.insp_rate[1] = 0
dw_1.object.insp_total[1] = 0
for li_int = 1 to dw_2.rowcount()
    dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_2.object.rlse_amount[li_int]
    dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + dw_2.object.rlse_rate[li_int]
end for
if dw_1.object.ship_flag[1] = 'D' then
   dw_1.object.insp_cash[1] = dw_1.object.insp_cash[1] + dw_1.object.ship_amount[1]
   IF dw_1.object.insp_rate[1] <> 0 then
      dw_1.object.insp_rate[1] = dw_1.object.insp_rate[1] + (dw_1.object.ship_amount[1] / 10)
   end if
end if
dw_1.object.insp_total[1] = dw_1.object.insp_rate[1] + dw_1.object.insp_cash[1]

end event

event dw_1::losefocus;dw_1.Accepttext()

end event

type dw_2 from w_inheritance`dw_2 within w_apinspupdate_m
integer x = 18
integer y = 808
integer width = 4210
integer height = 1248
integer taborder = 180
boolean enabled = false
string dataobject = "d_apinspdetupdate_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;integer ll_row
int li_int

if dw_1.getrow() < 1 then return
ll_row = this.getrow()
if ll_row < 1 then return
dw_1.Accepttext()
dw_2.Accepttext()
dw_1.object.insp_cash[1] = 0
dw_1.object.insp_rate[1] = 0
dw_1.object.insp_total[1] = 0

CHOOSE CASE dwo.name
	CASE 'rlse_rate'
		dw_2.object.rate_cash[ll_row] = dw_2.object.rlse_rate[ll_row]
	CASE 'unit_qty'
		if dw_2.object.apoi_qty[ll_row] > 0 then
			messagebox("확인","이미 매입처리가 완료 되었습니다. 매입처리를 삭제후에 작업하십시요")
			return 1
		end if
		dw_2.object.rcpt_qty[ll_row] = dw_2.object.unit_qty[ll_row] * dw_2.object.cnt[ll_row]
		dw_2.object.comqty [ll_row] = dw_2.object.rcpt_qty[ll_row]
END CHOOSE
	
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

type st_title from w_inheritance`st_title within w_apinspupdate_m
integer y = 48
integer width = 1257
string text = "발주입고 수정및삭제"
end type

type st_tips from w_inheritance`st_tips within w_apinspupdate_m
end type

type pb_compute from w_inheritance`pb_compute within w_apinspupdate_m
boolean visible = false
integer y = 48
integer taborder = 240
end type

type pb_print_part from w_inheritance`pb_print_part within w_apinspupdate_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_apinspupdate_m
integer x = 4023
integer y = 44
integer taborder = 260
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

type pb_print from w_inheritance`pb_print within w_apinspupdate_m
string tag = "프린트"
integer x = 3461
integer y = 44
integer taborder = 270
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

type pb_cancel from w_inheritance`pb_cancel within w_apinspupdate_m
string tag = "취소"
integer x = 3273
integer y = 44
integer taborder = 280
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

type pb_delete from w_inheritance`pb_delete within w_apinspupdate_m
string tag = "삭제"
integer x = 3648
integer y = 44
integer taborder = 290
boolean enabled = false
end type

event pb_delete::clicked;integer li_chk
string  ls_order_no, ls_supp_no, ls_case, ls_msg
long    ll_row, ll_cnt
dec     ld_insp_amount
datetime ldt_today, ldt_getdate, ldt_insp_date
date    ldt_user_date

dw_4.triggerevent(rowfocuschanged!)

dw_1.Accepttext()
dw_2.Accepttext()
dw_3.Accepttext()
dw_4.Accepttext()

if dw_4.rowcount() < 1 then return
ls_order_no = dw_4.object.insp_no[dw_4.getrow()]
IF isnull(ls_order_no) OR trim(ls_order_no) = '' THEN
	MessageBox("삭제", "선택된 입고번호가 없습니다.")
	return
END IF

//-- 2012.06.26(이재형) : 출고자료 확인 --//
for ll_cnt = 1 to dw_2.RowCount()
	if wf_dodet_check(ll_cnt) = true then	//자료 존재함
		ls_msg = string(ll_cnt) + " 라인 자료는 이미 출고 완료된 자료입니다.~n~n"
		ls_msg += "확인하여 주시기 바랍니다.~n~n"
		MessageBox("확인",ls_msg,StopSign!)
		return
	end if
next

IF MessageBox("확인", "입고 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then return

ldt_today      = datetime(today())
ld_insp_amount = dw_1.object.insp_total[1] 
ls_supp_no     = dw_1.object.supp_no[1]
ldt_insp_date  = dw_1.GetItemDateTime( 1, 'insp_date', Primary!, True)
ldt_user_date  = date(dw_1.GetItemDateTime( 1, 'user_date', Primary!, True))
for ll_cnt = 1 to dw_2.rowcount()
	IF wf_delete(ll_cnt) = false then 
		 rollback;
		 dw_2.scrolltorow(ll_cnt)
		 return
	END IF
next

UPDATE supp 
   SET balance_amt = balance_amt - :ld_insp_amount, last_tran_date = :ldt_today
 WHERE supp_no = :ls_supp_no;
if sqlca.sqlcode <> 0 then
	rollback;
	messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
	return
end if		

ls_case = dw_1.object.insp_insp_case[1]
dw_1.deleterow(0)
dw_2.RowsMove(1, dw_2.rowCount(), primary!, dw_2, 1, Delete!)
	
if ls_case = 'A' then
	dw_6.reset()
	dw_7.retrieve(ldt_user_date, "RO", ls_order_no)
	dw_7.RowsCopy(1,  dw_7.RowCount(), Primary!, dw_6, 1, Primary!)
	
	dw_7.retrieve(ldt_user_date, "RI", ls_order_no)
	dw_7.RowsCopy(1,  dw_7.RowCount(), Primary!, dw_6, 1, Primary!)
	
	dw_7.retrieve(ldt_user_date, "IO", ls_order_no)
	dw_7.RowsCopy(1,  dw_7.RowCount(), Primary!, dw_6, 1, Primary!)
	dw_6.accepttext()
	
	datetime ldt_old_time
	SELECT top 1 getdate() INTO :ldt_getdate FROM login;
	ldt_old_time = ldt_getdate
	for ll_row = 1 to dw_6.rowcount()
		dw_6.object.inaudit_time[ll_row] = ldt_getdate
		dw_6.object.inaudit_date[ll_row] = ldt_insp_date
		dw_6.object.rcpt_qty[ll_row]     = dw_6.object.rcpt_qty[ll_row]  * -1
		dw_6.object.issue_qty[ll_row]    = dw_6.object.issue_qty[ll_row] * -1
		dw_6.object.user_id[ll_row]      = gs_userid
		do while ldt_old_time = ldt_getdate
			SELECT top 1 getdate() INTO :ldt_getdate FROM login;
		loop
		ldt_old_time = ldt_getdate
	next
end if

dw_6.accepttext()
if wf_update3(dw_6, dw_1, dw_2,"Y") = true then
	pb_retrieve.postevent(clicked!)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_apinspupdate_m
boolean visible = false
integer x = 2309
integer y = 60
integer taborder = 310
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apinspupdate_m
string tag = "조회"
integer x = 3086
integer y = 44
integer taborder = 300
boolean enabled = false
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_3.accepttext()
cb_1.default = false
cb_2.enabled = true   // 단가작업
is_supp_no = dw_3.object.supp_no[dw_3.getrow()]	

id_start_date = date(em_s.text)
id_end_date   = date(em_e.text)
if not isdate(em_s.text) then
	beep(1)
	em_s.setfocus()
	return
end if
if not isdate(em_e.text) then
	beep(1)
	em_e.setfocus()
	return
end if

dw_4.setredraw(false)
dw_4.reset()
dw_4.retrieve(is_supp_no, id_start_date, id_end_date, LeftA(dw_area.object.area[1],1))

if dw_4.rowcount() > 0 then
   dw_1.enabled = TRUE
   dw_2.enabled = TRUE
   dw_4.enabled = TRUE	
   dw_3.enabled = FALSE
   pb_cancel.enabled = TRUE
   pb_retrieve.enabled = FALSE
else
	dw_3.setcolumn('supp_no')
	dw_3.setfocus()
end if
dw_4.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_apinspupdate_m
integer x = 613
integer y = 204
integer width = 3447
integer height = 132
integer taborder = 200
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_apinspupdate_m
integer x = 18
integer y = 200
integer width = 585
integer height = 596
integer taborder = 230
integer textsize = -10
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
string text = "입고번호"
end type

type gb_1 from w_inheritance`gb_1 within w_apinspupdate_m
integer x = 2629
integer y = 0
integer width = 1609
integer taborder = 140
long backcolor = 79220952
end type

type gb_5 from groupbox within w_apinspupdate_m
integer x = 613
integer y = 332
integer width = 3447
integer height = 464
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
end type

type dw_3 from datawindow within w_apinspupdate_m
integer x = 955
integer y = 236
integer width = 882
integer height = 88
integer taborder = 220
boolean bringtotop = true
string dataobject = "d_apinspdsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
is_supp_no = this.getitemstring(1, "supp_no")	
pb_retrieve.enabled = true
this.setfocus()

end event

event editchanged;string ls_data,ls_supp
long ll_found,ll_row
int li_line

this.getchild("supp_no", idwc_supp)
choose case dwo.name
	case 'supp_no'
		 ls_data = data + '%'
		 ll_row = idwc_supp.RowCount( )
		 ll_found = idwc_supp.Find(" AND supp_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("supp_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_supp.scrolltorow(ll_found)
end choose
RETURN 0

end event

type dw_4 from datawindow within w_apinspupdate_m
integer x = 27
integer y = 248
integer width = 567
integer height = 540
integer taborder = 160
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_apinspupdate_s"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
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

type dw_7 from datawindow within w_apinspupdate_m
integer x = 681
integer width = 82
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_oiupinaudit"
end type

type st_1 from statictext within w_apinspupdate_m
integer x = 649
integer y = 248
integer width = 302
integer height = 76
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
string text = "거래처"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_apinspupdate_m
integer x = 471
integer width = 82
integer height = 72
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_appurdetin_h"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_apinspupdate_m
integer x = 4064
integer y = 664
integer width = 165
integer height = 132
integer taborder = 210
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;//
date   ldt_user_date
long   ll_row , ll_cnt
string ls_order_no

dw_2.AcceptText()
ll_row = dw_2.getrow()
if ll_row < 1 then return

string ls_inspno, ls_supp_no, ls_msg
int    li_chk, li_seq
dec    ld_insp_amount
datetime ldt_today, ldt_getdate, ldt_insp_date

ls_inspno = dw_4.object.insp_no[dw_4.getrow()]
IF isnull(ls_inspno) OR trim(ls_inspno) = '' THEN
	MessageBox("삭제", "선택된 입고상세가 없습니다.")
	return
END IF

//-- 2012.06.26(이재형) : 출고자료 확인 --//
if wf_dodet_check(ll_row) = true then	//자료 존재함
	ls_msg = "해당 자료는 이미 출고 완료된 자료입니다.~n~n"
	ls_msg += "확인하여 주시기 바랍니다.~n~n"
	MessageBox("확인",ls_msg,StopSign!)
	return
end if
	
li_chk = MessageBox("확인", "선택한 입고상세 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2)
IF li_chk = 2 THEN return

ldt_today      = datetime(today())
ld_insp_amount = dw_2.object.rlse_amount[ll_row] 
ls_supp_no     = dw_1.object.supp_no[1]
li_seq         = dw_2.object.oi_no[ll_row]

if wf_delete(ll_row) = false then 
	rollback;
	dw_2.retrieve(ls_inspno)
	dw_2.scrolltorow(ll_row)
	return
end if

UPDATE supp 
   SET balance_amt = balance_amt - :ld_insp_amount, last_tran_date = :ldt_today
 WHERE supp_no = :ls_supp_no;
if sqlca.sqlcode <> 0 then
	rollback;
	messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
	dw_2.retrieve(ls_inspno)	
	return
end if		

dw_2.deleterow(ll_row)
ldt_user_date = date(dw_1.GetItemDateTime( 1, 'user_date', Primary!, True))
ldt_insp_date = dw_1.GetItemDateTime( 1, 'insp_date', Primary!, True)
if dw_2.rowcount() < 1 then
	dw_1.deleterow(1)
else
	wf_sum()
end if

ls_order_no = dw_4.object.insp_no[dw_4.getrow()]

dw_6.reset()
dw_10.retrieve(ldt_user_date, "RO", ls_order_no, li_seq)
dw_10.RowsCopy(1,  dw_10.RowCount(), Primary!, dw_6, 1, Primary!)

dw_10.retrieve(ldt_user_date, "RI", ls_order_no, li_seq)
dw_10.RowsCopy(1,  dw_10.RowCount(), Primary!, dw_6, 1, Primary!)

dw_10.retrieve(ldt_user_date, "IO", ls_order_no, li_seq)
dw_10.RowsCopy(1,  dw_10.RowCount(), Primary!, dw_6, 1, Primary!)

dw_6.accepttext()

datetime ldt_old_time
select top 1 getdate() into :ldt_getdate from login;
ldt_old_time = ldt_getdate

for ll_row = 1 to dw_6.rowcount()
	dw_6.object.inaudit_time[ll_row] = ldt_getdate
	dw_6.object.inaudit_date[ll_row] = ldt_insp_date
	dw_6.object.rcpt_qty[ll_row]     = dw_6.object.rcpt_qty[ll_row]  * -1
	dw_6.object.issue_qty[ll_row]    = dw_6.object.issue_qty[ll_row] * -1
	dw_6.object.user_id[ll_row]      = gs_userid
	do while ldt_old_time = ldt_getdate
		select top 1 getdate() into :ldt_getdate from login;
	loop
	ldt_old_time = ldt_getdate
next

dw_6.accepttext()
if wf_update3(dw_6, dw_1, dw_2, "Y") = false then
end if
if dw_2.rowcount() < 1 then
	dw_4.retrieve(is_supp_no, id_start_date, id_end_date)
end if

if dw_4.rowcount() > 0  then
	ii_row    = dw_4.getrow()
	ls_inspno = dw_4.object.insp_no[ii_row]
	dw_1.retrieve(ls_inspno)
	dw_2.retrieve(ls_inspno)	
else
	IF dw_1.enabled = TRUE THEN
		pb_cancel.enabled   = FALSE
		pb_save.enabled     = FALSE
		pb_delete.enabled   = FALSE
		pb_retrieve.enabled = TRUE
		
		dw_1.enabled = FALSE
		dw_2.enabled = FALSE
		dw_4.enabled = FALSE
		dw_3.enabled = TRUE
		dw_1.reset()
		dw_2.reset()		
		dw_4.reset()		
	END IF
end if

end event

type dw_8 from datawindow within w_apinspupdate_m
integer x = 786
integer width = 82
integer height = 72
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_apinspupdate_inaudit_m"
boolean livescroll = true
end type

type em_s from editmask within w_apinspupdate_m
integer x = 1829
integer y = 244
integer width = 366
integer height = 76
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_e from editmask within w_apinspupdate_m
integer x = 2290
integer y = 244
integer width = 366
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

type st_2 from statictext within w_apinspupdate_m
integer x = 2213
integer y = 240
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -18
integer weight = 400
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

type dw_9 from datawindow within w_apinspupdate_m
integer x = 891
integer width = 82
integer height = 72
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_prslitcon_h"
boolean livescroll = true
end type

type st_22 from statictext within w_apinspupdate_m
integer x = 2834
integer y = 248
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

type dw_area from datawindow within w_apinspupdate_m
integer x = 3045
integer y = 244
integer width = 526
integer height = 80
integer taborder = 250
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type dw_6 from datawindow within w_apinspupdate_m
integer x = 576
integer width = 82
integer height = 72
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oiupinaudit"
end type

type dw_10 from datawindow within w_apinspupdate_m
integer x = 997
integer width = 82
integer height = 72
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oiupinaudit_det"
boolean livescroll = true
end type

type dw_11 from datawindow within w_apinspupdate_m
integer x = 1138
integer width = 82
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_ioinsliting_r"
boolean livescroll = true
end type

type em_3 from editmask within w_apinspupdate_m
integer x = 1467
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

event modified;cb_1.default = true
end event

type cb_1 from commandbutton within w_apinspupdate_m
integer x = 1957
integer y = 88
integer width = 155
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_supp, ls_inspno, ls_name
datetime  ld_date
long ll_row, ll_found
 
ls_inspno = TRIM(em_3.TEXT)
if isnull(ls_inspno) or ls_inspno = '' then return

setnull(ls_supp)
setnull(ld_date)
SELECT  supp_no,  insp_date into :ls_supp, :ld_date
 FROM insp  
WHERE insp.insp_no = :ls_inspno;
if sqlca.sqlcode = 100 then 
	pb_cancel.triggerevent(clicked!)
	beep(2)
	em_3.setfocus()
	return
end if
dw_3.object.supp_no[1] = ls_supp
em_s.text = string(ld_date,'yyyy/mm/dd')
em_e.text = string(ld_date,'yyyy/mm/dd')
this.default = false
pb_retrieve.enabled = true
pb_retrieve.triggerevent(clicked!)

ll_found = dw_4.Find( "insp_no = '"+ ls_inspno +"'", 1, dw_4.rowcount())
if ll_found = 0 then
	if dw_4.rowcount() > 0 then
		messagebox("확인", "검색한 입고번호가 없습니다.")
	end if
	em_3.setfocus()
else
	dw_4.scrolltorow(ll_found)
end if 

end event

event losefocus;this.default = false

end event

type st_3 from statictext within w_apinspupdate_m
integer x = 1481
integer y = 16
integer width = 238
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

type cb_2 from commandbutton within w_apinspupdate_m
integer x = 2661
integer y = 44
integer width = 402
integer height = 144
integer taborder = 320
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
                  "작업 대상을 엑셀파일로 저장한 후 '단가, 환산수량'을 수정하여 저장한 파일을 사용해야 합니다.~n~n" + &
						"검색범위는 2행부터 1번 컬럼이 빈행까지만 검색합니다. 중간의 소계행과 합계행은 지워야 합니다.~n~n~n~n" + &
						"[주의사항]~n~n엑셀파일의 컬럼위치를 변경하거나 삭제하면 정상적인 작업이 수행되지 않습니다.~n~n" + &
						"현재 사용중인 엑셀 프로그램을 모두 종료한 후에 작업하시기 바랍니다.~n~n" + &
						"Windows 작업관리자 메뉴(Ctrl+Alt+del)에서도 EXCEL.EXE가 백그라운드로 실행되는지 확인 바랍니다.~n~n" + &
						"'발주입고 수정및삭제' 프로그램은 거래처 단위로 작업 종료후 작업결과를 반드시 확인 바랍니다.")

end event

type tab_1 from tab within w_apinspupdate_m
integer x = 1504
integer y = 524
integer width = 1637
integer height = 440
integer taborder = 320
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


ls_supp    = trim(dw_1.object.supp_no[1])       // 매입처
if ls_supp = '' Or isnull(ls_supp) then
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

         if ls_insp_no  = String(xlSheet.Cells[iRow,      17].Value) And &
            ll_seq      = Long(String(xlSheet.Cells[iRow, 18].Value)) And &
            ls_item     = String(xlSheet.Cells[iRow,      22].Value) And &
            ls_qa       = String(xlSheet.Cells[iRow,       8].Value)  And &
            ls_loc_name = String(xlSheet.Cells[iRow,      19].Value) And &
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
xlSheet = CREATE OleObject

iRet = GetFileOpenName("Microsoft Excel Files", ls_filename, named, defext, filter)
IF iRet = 1 THEN
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

type gb_4 from groupbox within w_apinspupdate_m
integer x = 1449
integer y = 36
integer width = 681
integer height = 172
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79220952
end type

