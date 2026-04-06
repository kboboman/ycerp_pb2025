$PBExportHeader$w_ioin_m.srw
$PBExportComments$자재입고관리(2000/05/25,이인호)
forward
global type w_ioin_m from w_inheritance
end type
type gb_6 from groupbox within w_ioin_m
end type
type cbx_1 from checkbox within w_ioin_m
end type
type dw_5 from datawindow within w_ioin_m
end type
type dw_inspdet from datawindow within w_ioin_m
end type
type st_2 from statictext within w_ioin_m
end type
type pb_1 from picturebutton within w_ioin_m
end type
type rb_1 from radiobutton within w_ioin_m
end type
type rb_2 from radiobutton within w_ioin_m
end type
type dw_6 from datawindow within w_ioin_m
end type
type dw_7 from datawindow within w_ioin_m
end type
type dw_9 from datawindow within w_ioin_m
end type
type dw_8 from datawindow within w_ioin_m
end type
type dw_4 from datawindow within w_ioin_m
end type
type dw_area from datawindow within w_ioin_m
end type
type st_22 from statictext within w_ioin_m
end type
type cbx_2 from checkbox within w_ioin_m
end type
type dw_3 from datawindow within w_ioin_m
end type
type rb_3 from radiobutton within w_ioin_m
end type
type rb_4 from radiobutton within w_ioin_m
end type
type dw_10 from datawindow within w_ioin_m
end type
type st_4 from statictext within w_ioin_m
end type
type ddlb_fld from dropdownlistbox within w_ioin_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ioin_m
end type
type st_7 from statictext within w_ioin_m
end type
type ddlb_op from dropdownlistbox within w_ioin_m
end type
type sle_value from singlelineedit within w_ioin_m
end type
type cb_19 from commandbutton within w_ioin_m
end type
type cb_20 from commandbutton within w_ioin_m
end type
type cb_21 from commandbutton within w_ioin_m
end type
type cb_22 from commandbutton within w_ioin_m
end type
type cb_1 from commandbutton within w_ioin_m
end type
type st_1 from statictext within w_ioin_m
end type
type cb_2 from commandbutton within w_ioin_m
end type
type cb_3 from commandbutton within w_ioin_m
end type
type gb_4 from groupbox within w_ioin_m
end type
end forward

global type w_ioin_m from w_inheritance
integer width = 4690
integer height = 2756
string title = "발주자재 입고관리(w_ioin_m)"
boolean controlmenu = false
gb_6 gb_6
cbx_1 cbx_1
dw_5 dw_5
dw_inspdet dw_inspdet
st_2 st_2
pb_1 pb_1
rb_1 rb_1
rb_2 rb_2
dw_6 dw_6
dw_7 dw_7
dw_9 dw_9
dw_8 dw_8
dw_4 dw_4
dw_area dw_area
st_22 st_22
cbx_2 cbx_2
dw_3 dw_3
rb_3 rb_3
rb_4 rb_4
dw_10 dw_10
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
cb_1 cb_1
st_1 st_1
cb_2 cb_2
cb_3 cb_3
gb_4 gb_4
end type
global w_ioin_m w_ioin_m

type variables
string is_supp, is_curr
datawindowchild  idwc_supp,idwc_area
string is_select, is_clause, is_where
string is_select1, is_clause1, is_where1
gs_codere_str  ist_code
dec {6} ia_rate, is_rate
end variables

forward prototypes
public subroutine wf_cals (long arg_row)
public subroutine wf_amt ()
public subroutine wf_cals1 (long arg_row)
public function boolean wf_save2 (long arg_cnt, string arg_inspno, integer arg_inspseq)
public function boolean wf_alter (long arg_cnt)
public subroutine wf_print (string arg_flag, date arg_date)
public function boolean wf_jajaeout (string arg_plan, string arg_subcon, long arg_cnt, string arg_inspno, long arg_inspseq)
public function string wf_coil (long arg_row)
public subroutine wf_calc2 (long arg_row)
public subroutine wf_multiprint (string as_insp_no)
end prototypes

public subroutine wf_cals (long arg_row);string ls_qa,ls_uom
real   lr_orderqty,lr_rlseqty,lr_unitqty,lr_price
long   ll_cnt

dw_2.accepttext()
dw_5.accepttext()
dw_2.setredraw(false)

ls_qa       = trim(dw_2.object.qa[arg_row])
ls_uom      = trim(dw_2.object.com_uom[arg_row])
lr_orderqty = dw_2.object.order_qty[arg_row]
lr_rlseqty  = dw_2.object.rlse_qty[arg_row]
if isnull(lr_rlseqty) then
	lr_rlseqty = 0
end if

ll_cnt = dw_2.object.cnt[arg_row]
if isnull(ll_cnt) then
	dw_2.object.cnt[arg_row] = 1
	ll_cnt = 1
end if

lr_price   = dw_2.object.price[arg_row]
lr_unitqty = dw_2.object.unit_qty[arg_row]
//if mid(ls_item,4,1) = "1" OR mid( ls_item ,4,1) = '2' then
//	dw_2.object.rcpt_qty[arg_row] = ll_cnt * lr_unitqty
//else
	dw_2.object.rcpt_qty[arg_row] = lr_orderqty - lr_rlseqty
//end if

if dw_2.object.rcpt_qty[arg_row] = 0 then
   dw_2.object.rcpt_qty[arg_row] = dw_2.object.order_qty[arg_row]
end if

choose case ls_uom
	case 'M'
		dw_2.object.com_qty[arg_row] = TRUNCATE((real(MidA(ls_qa,15,5)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
	case 'M2'
		dw_2.object.com_qty[arg_row] = TRUNCATE((real(MidA(ls_qa, 5,4)) / 1000.0) * (real(MidA(ls_qa,10,4)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
	case 'KG'
		if dw_2.object.uom[arg_row] = 'SH' then
			dw_2.object.com_qty[arg_row] = TRUNCATE(ll_cnt * lr_unitqty, 4)
		else
			dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row]
		end if
	case else
		dw_2.object.com_qty[arg_row] = TRUNCATE(dw_2.object.rcpt_qty[arg_row] ,0)
end choose

if isnull(dw_2.object.com_qty[arg_row]) or dw_2.object.com_qty[arg_row] = 0 then
	dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row] 
end if
dw_2.setredraw(true)


end subroutine

public subroutine wf_amt ();int li_int
//
dw_2.accepttext()
dw_5.accepttext()
if dw_5.rowcount() < 1 then return

dw_5.object.insp_cash[1]  = 0
dw_5.object.insp_rate[1]  = 0
dw_5.object.insp_total[1] = 0

dw_5.accepttext()
dw_2.groupcalc()

dw_5.setredraw(false)
li_int = dw_2.rowcount()
dw_5.object.insp_cash[1] = dw_5.object.insp_cash[1] + dw_2.object.samt[li_int]
dw_5.object.insp_rate[1] = dw_5.object.insp_rate[1] + dw_2.object.svat[li_int]

dw_5.accepttext()
dw_5.groupcalc()
dw_5.object.insp_total[1] = dw_5.object.insp_rate[1] + dw_5.object.insp_cash[1] + dw_5.object.ship_amount[1]
dw_5.setredraw(true)

end subroutine

public subroutine wf_cals1 (long arg_row);string ls_qa,ls_uom
real   lr_rlseqty,lr_unitqty,lr_price
long   ll_cnt

dw_2.accepttext()

ls_qa  = trim(dw_2.object.qa[arg_row])
ls_uom = trim(dw_2.object.com_uom[arg_row])
ll_cnt = dw_2.object.cnt[arg_row]
if isnull(ll_cnt) then
	dw_2.object.cnt[arg_row] = 1
	ll_cnt = 1
end if

lr_price   = dw_2.object.price[arg_row]
lr_unitqty = dw_2.object.unit_qty[arg_row]
choose case ls_uom
  case 'M'
		 dw_2.object.com_qty[arg_row] = TRUNCATE((real(MidA(ls_qa,15,5)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
  case 'M2'
		 dw_2.object.com_qty[arg_row] = TRUNCATE((real(MidA(ls_qa,5,4)) / 1000.0) * (real(MidA(ls_qa,10,4)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
  case 'KG'
	  if dw_2.object.uom[arg_row] = 'SH' then
			dw_2.object.com_qty[arg_row] = TRUNCATE(ll_cnt * lr_unitqty, 3)
	  else
		 	dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row]
	  end if
  case else
		 dw_2.object.com_qty[arg_row] = TRUNCATE(dw_2.object.rcpt_qty[arg_row] , 0)
end choose

end subroutine

public function boolean wf_save2 (long arg_cnt, string arg_inspno, integer arg_inspseq);string ls_inspno, ls_item, ls_supp, ls_newloc, ls_qa, ls_order, ls_coil, ls_product_no
string ls_subcon, ls_result, ls_str, ls_coiltype, ls_chk, ls_sale, ls_wc
string ls_wcoil, ls_item4, ls_name, ls_oc, ls_etc, ls_type
int li_seq, li_division, li_operation, li_inspseq, li_exist
long ll_cnt, ll_seq, k, ll_len, ll_count
real lr_newqty, lr_unitqyt, lr_com_qty, lr_newqty10, lr_unitqty, lr_planqty, lr_rcptqty
real lr_orderqty, lr_solqty, lr_rlseqty
datetime ldt_date
decimal {4} lr_price, lr_sheet_unitqty, ld_yrate
dec{2} ld_length
decimal {1} ld_wid, ld_w_wid

dw_1.accepttext()
dw_2.accepttext()
dw_5.accepttext()

ls_inspno = trim(arg_inspno)
li_inspseq = arg_inspseq

ldt_date  = dw_5.object.insp_date[1]
//dw_5.object.log_date[1] = ldt_date
dw_5.object.user_date[1] = ldt_date
ls_item   = trim(dw_2.object.item_no[arg_cnt])
ls_supp   = trim(dw_1.object.supp_no[1])
ls_newloc = trim(dw_2.object.loc_no[arg_cnt])
ll_cnt    = dw_2.object.cnt[arg_cnt]
lr_newqty = dw_2.object.rcpt_qty[arg_cnt]
lr_price = dw_2.object.price[arg_cnt]
ls_qa     = trim(dw_2.object.qa[arg_cnt])
ld_wid     = dec(string(MidA(ls_qa,5,4) + "." + MidA(ls_qa,10,1)))

ls_order  = trim(dw_2.object.order_no[arg_cnt])
ls_coil   = trim(dw_2.object.coil_no[arg_cnt])
ls_etc   = trim(dw_2.object.etc[arg_cnt])
ls_product_no    = trim(dw_2.object.product_no[arg_cnt])
ll_seq    = dw_2.object.serial_no[arg_cnt]
ls_subcon = trim(dw_2.object.pur_subcon[arg_cnt])
ls_result = trim(dw_2.object.result_type[arg_cnt])
lr_unitqty = dw_2.object.unit_qty[arg_cnt]
ll_len = dw_2.object.wlen[arg_cnt]
lr_com_qty = dw_2.object.com_qty[arg_cnt]

setnull(ls_type)
// type = A.명송 , B.통일
select type into :ls_type from supp
 where supp_no = :ls_supp;

//구매발주 입고수량 업데이트 
lr_newqty10 = lr_newqty
// 구매발주입고(N),,원코일입고(W),자재가공(J)에 대한 처리 // 수입(L) 추가(2005/11/16)
if (ls_subcon = 'N')  or (ls_subcon = 'W')  or (ls_subcon = 'J') or (ls_subcon = 'L') then 
   choose case ls_subcon
	    case 'J'
		    if ls_result = "P" then
			    ls_chk = 'B'
	       else
			    ls_chk = 'C'
		    end if
		    update jajaesudo set out_qty = out_qty - :lr_newqty, flag = :ls_chk 
			 where order_no = :ls_product_no;
		    if sqlca.sqlcode < 0 then
				 
			    messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
			    return false
		    end if				 
	    case 'W'
			  //원코일 인서트
			  select coil_no into :ls_str from coilmst 
				where coil_no = :ls_coil 
				  and loc_no = :ls_newloc;
			  if sqlca.sqlcode = 100 then
					insert into coilmst
						  (coil_no,  wid,    item_no,   qa,    loc_no,    rcpt_date, unit_qty, length,  
							cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, 
							open_close, rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
					values (:ls_coil, :ld_wid, :ls_item, :ls_qa, :ls_newloc, :ldt_date, convert(dec,:lr_unitqty), :ll_len,
							:ll_cnt,     :ll_cnt,    "",      :ls_supp, "W", :ls_order, :li_inspseq, 
							 "O", "", convert(dec,:lr_unitqty), :ll_len, :ls_etc, '원코일');
					if sqlca.sqldbcode <> 0 then
						 messagebox('오류W1','[wf_save2][코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
						 return false					
					end if
			  else
					messagebox('오류w2','[wf_save2][코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
					return false			
			  end if
   end choose	
else// 구매발주입고(N),,원코일입고(W),자재가공(J) // 수입(L) 추가(2005/11/16) 이외에 대한 처리
	choose case ls_result 
		case 'C'
			 goto gotolevel
		case else
			
	end choose
   choose case ls_subcon
	    case 'Y'
		    if ls_result = "P" then
			    ls_chk = 'B'
	       else
			    ls_chk = 'C'
		    end if
		    update sudodet1 set rcpt_qty = rcpt_qty + :lr_newqty,sudo_type = :ls_chk
		     where order_no = :ls_product_no;
		    if sqlca.sqlcode < 0 then
			    messagebox('오류','외주구매자료가 없습니다.',exclamation!)
			    
			    return false
		    end if		  
	    case 'P'
		    if ls_result = "P" then
			    ls_chk = 'B'
	       else
			    ls_chk = 'C'
		    end if
		    update sudodet set rcpt_qty = rcpt_qty + :lr_newqty, sudo_type = :ls_chk
		     where order_no = :ls_product_no;
		    if sqlca.sqlcode < 0 then
			    messagebox('오류','외주가공자료가 없습니다.',exclamation!)
			    
			    return false
		    end if
    end choose	
	 select sale_no,seq_no,division,wc_no
	    into :ls_sale,:li_seq,:li_division,:ls_wc
	    from mpsdet
	 where plan_no = :ls_product_no;
	 if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
		
		ls_sale = trim(dw_2.object.purdet_sale_no[arg_cnt])
		select open_close into :ls_oc from sale
		 where order_no = :ls_sale ;
		if sqlca.sqlcode = 100 then
			messagebox('오류32','수주번호[' + ls_sale + ']를 찾을 수 없습니다.판매부로 연락바랍니다.')
			return false
		else
			if ls_oc = 'C' then
				if messagebox('오류32','수주번호[' + ls_sale + ']가 이미 마감되었습니다.' &
							+ '계속진행하시겠습니까?.', Exclamation!, OKCancel!, 1) = 2 then
					return false
				else
					goto lavel1
				end if
			end if
		end if
		messagebox('오류3','생산계획자료가 없거나, 수행중 오류가 발생했습니다.',exclamation!)
		return false		 
	 else
		// type = A.명송 , B.통일
		if ls_type <> 'A' or isnull(ls_type) then
			update mpsdet set rcpt_qty = rcpt_qty + :lr_newqty
			 where plan_no = :ls_product_no;
			if sqlca.sqlcode < 0 then
				messagebox('오류4','DB오류발생하였습니다.',exclamation!)
				return false
			end if		
		end if

		 select operation into :li_operation from routtempnew
		  where division = :li_division 
		    and sale_no = :ls_sale 
			 and seq_no = :li_seq
		    and wc_no = :ls_wc
			 and assy_item = :ls_item;
	    if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
          messagebox('오류5','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 자동생산계획자료가 없거나, 수행중 오류가 발생했습니다.',exclamation!)
	       return false
		 else
			// type = A.명송 , B.통일
			if ls_type <> 'A' or isnull(ls_type) then
				 update routtempnew set make_qty = make_qty + :lr_newqty, process_flag = 'E'
				  where division = :li_division and sale_no = :ls_sale 
					 and seq_no = :li_seq and operation = :li_operation;
				 if sqlca.sqlcode < 0 then
					 messagebox('오류55','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 수행중 오류가 발생하였습니다.',exclamation!)
					 return false
				 end if			
			end if
			 li_operation ++
		    select operation into :li_operation from routtempnew
		     where division = :li_division 
			    and sale_no = :ls_sale 
				 and seq_no = :li_seq
		       and operation = :li_operation;
			 if sqlca.sqlcode = 100 then
//					update item set sales_reserved = sales_reserved + :lr_newqty
//					 where item_no = :ls_item and qa = :ls_qa;
//					if sqlca.sqlcode < 0 then
//						messagebox('오류44','판매예약량 update중 DB오류가 발생했습니다.',exclamation!)
//						
//						return false
//					end if						
					update saledet set plan_qty = (case when plan_qty - :lr_newqty <= 0 then 0 else plan_qty - :lr_newqty end),
											sol_qty = sol_qty + :lr_newqty
					 where order_no = :ls_sale and seq_no = :li_seq;
					if sqlca.sqlcode < 0 then
						messagebox('오류44','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 수행중 saledet update중 DB오류가 발생했습니다.',exclamation!)
						
						return false
					end if					
					select order_qty,plan_qty,sol_qty,rlse_qty
						 into :lr_orderqty,:lr_planqty,:lr_solqty,:lr_rlseqty
						 from saledet
					where order_no = :ls_sale and seq_no = :li_seq;
					if sqlca.sqlcode < 0 then
						messagebox('오류45','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 수행중 [saledet] 해당자료가 없거나, DB오류가 발생했습니다.',exclamation!)
						
						return false
					end if					
					if (lr_planqty + lr_solqty + lr_rlseqty) >= lr_orderqty then
						update saledet set saledet_text = 'X'
						where order_no = :ls_sale and seq_no = :li_seq;	
						if sqlca.sqlcode < 0 then
							messagebox('오류46','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 수행중 saledet update중 DB오류가 발생했습니다.',exclamation!)
							
							return false
						end if						
					end if
			 else
				 if sqlca.sqlcode < 0 then
					 messagebox('오류','[wf_save2] DB오류발생하였습니다.',exclamation!)
					 return false
				 end if
				 // 후공정처리
				li_exist = 0
	         select count(*) into :li_exist from routtempnew 
   	       where division = :li_division 
				   and sale_no = :ls_sale 
      	      and seq_no = :li_seq 
					and operation = :li_operation
					and process_flag = 'E';	
	         if sqlca.sqlcode < 0 then
	            messagebox('오류31','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 수행중 [routtempnew] select중 DB오류가 발생했습니다.',exclamation!)
	            return false
	         end if				
				
				if li_exist > 0 then
					// 다음공정의 작업일보가 등록되어 마감이 되었기때문에 process_flag를 'N'으로
					// 바꾸지 않음
				else
					 update routtempnew set process_flag = 'Y'
			       where division = :li_division and sale_no = :ls_sale 
					   and seq_no = :li_seq and operation = :li_operation;
					 if sqlca.sqlcode < 0 then
						 messagebox('오류','수주번호[' + ls_sale + ']의 ' + string(li_seq) &
			 				+ ' 번째 수행중 오류발생하였습니다.',exclamation!)
						 return false
					 end if					
				end if
			 end if
		 end if
	 end if
end if
lavel1:
if ls_subcon <> 'W' then
	ls_item4 = MidA(dw_2.object.item_no[arg_cnt], 4, 1)
	choose case ls_subcon
		case 'N'
			ls_name = "N발주입고"
		case 'Y'
			ls_name = "Y외주발주입고"
//			case 'W'
//				ls_name = "W원코일입고"
		case 'P'
			ls_name = "P외주가공입고"
//			case 'C'//일수가 없다. 외주 sliting/sheet입고에서 처리
//				ls_name = "C외주SHEET입고"
		case 'J'
			ls_name = "J자재가공입고"
		case 'L'
			ls_name = "L수입입고"
		case ELSE
			ls_name = "입고"
	end choose
	if LeftA(dw_2.object.item_no[arg_cnt],  2) = 'M1' and ls_item4 = '1' then // 1; coil , 2 : sheet
		  select coil_no into :ls_str from coilmst 
			where coil_no = :ls_coil 
			  and loc_no = :ls_newloc;
		  if sqlca.sqlcode = 100 then
				insert into coilmst
					  (coil_no,  wid,    item_no,   qa,    loc_no,    rcpt_date, unit_qty, length,  
						cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, 
						open_close, rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
				values (:ls_coil, :ld_wid, :ls_item, :ls_qa, :ls_newloc,:ldt_date, convert(dec,:lr_unitqty), :ll_len,
						:ll_cnt,     :ll_cnt,    "",      :ls_supp, "W", :ls_order, :li_inspseq, 
						 "O", "", convert(dec,:lr_unitqty), :ll_len, :ls_etc, '원코일');
				if sqlca.sqldbcode <> 0 then
					 messagebox('오류W1','[wf_save2][코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
					 return false					
				end if
		  else
				messagebox('오류w2','[wf_save2][코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
				return false			
		  end if
	elseif LeftA(dw_2.object.item_no[arg_cnt],  2) = 'M3' and ls_item4 = '1' then
		ld_length = 0
		select length into :ld_length from coilmst
		 where coil_no = :ls_wcoil
			and loc_no = :ls_newloc;
		if sqlca.sqlcode <> 100 then
			messagebox('update오류7-1',"코일마스터[coilmst]select시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			return false
		end if
	//스리팅코일추가
		insert into coilmst
			  (coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
				cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close,
				rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
		values (:ls_coil, :ld_wid, :ls_item, :ls_qa, :ls_newloc, :ldt_date, convert(dec,:lr_unitqty), :ld_length,
				:ll_cnt, :ll_cnt,    :ls_inspno,  :ls_supp, "S", :ls_product_no, :ll_seq, "O", 
				:ls_name, convert(dec,:lr_unitqty), :ld_length, :ls_etc, '구매입고');
		if sqlca.sqldbcode <> 0 then
			messagebox('오류10','[코일마스터] insert중 DB오류발생하였습니다.~r~n' + sqlca.sqlerrtext,exclamation!)
			return false
		end if
	elseif  LeftA(dw_2.object.item_no[arg_cnt],  1) = 'M' and ls_item4 = '2' then
		//sheet추가
//		if mid(ls_item, 3,1 ) = "A" then
//			ld_yrate = ia_rate
//		else
//			ld_yrate = is_rate
//		end if // sheet 단중 = 두께 * 폭 * 길이 * 요율(스틸 = 8.12, 알미늄 = 2.72)
//ld_rate * (real(mid(ls_qa,1,3)) / 100.0) * (real(mid(ls_qa,5,4)) / 1000.0) * (real(mid(ls_qa,10,4)) / 1000.0)

//		lr_sheet_unitqty = truncate(real(mid(ls_qa,1,3))  / 100.0 &
//												* real( mid(ls_qa ,  5,4 )) / 1000.0 &
//												* real( mid(ls_qa , 10,4 )) / 1000.0 &
//												* ld_yrate + 0.000000001,  4)
		insert into sheetmst
			  (sheet_no,  item_no,   qa,    loc_no,  rcpt_date, unit_qty,   
				cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close,
				rem, rcpt_qty)
		values (:ls_coil, :ls_item, :ls_qa, :ls_newloc, :ldt_date, :lr_unitqty, 
				:ll_cnt, :ll_cnt,    :ls_inspno,  :ls_supp, "S", :ls_product_no, :ll_seq, "O", 
				:ls_name, :lr_unitqty);
		if sqlca.sqldbcode <> 0 then
			messagebox('오류10-1','[sheet마스터] insert중 DB오류발생하였습니다.~r~n' + sqlca.sqlerrtext,exclamation!)
			return false
		end if
	end if
end if
gotolevel:
sleep(0.5)
choose case ls_subcon
	 case 'N','Y','W','L' // n:구매 , y외주발주: , W:원코일 // 수입(L) 추가(2005/11/16)
      insert into inaudit
       (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,destination,rcpt_qty,issue_qty,cost,cnt,unit_qty,serial_id,com_qty, rem,user_id)
      values (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_newloc,'RI',:ls_inspno,:ls_supp,:lr_newqty,0,:lr_price,:li_inspseq,:lr_unitqty,:ls_coil,:lr_com_qty, :ls_product_no, :gs_userid);   
		if sqlca.sqlcode <> 0 then 
//			messagebox('오류','입출고역에 추가중 DB오류발생하였습니다.',exclamation!)
			MessageBox('오류',sqlca.sqlerrtext)		
			return false					
		end if
	 case 'P','J' // p:외주가공 , j : 자재가공
      insert into inaudit
       (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,destination,rcpt_qty,issue_qty,cost,cnt,unit_qty,serial_id,com_qty,rem,user_id)
      values (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_newloc,'RO',:ls_inspno,:ls_supp,:lr_newqty,0,:lr_price,:li_inspseq,:lr_unitqty,:ls_coil,:lr_com_qty, :ls_product_no, :gs_userid);   
		if sqlca.sqlcode <> 0 then
//			messagebox('오류','입출고역에 추가중 DB오류발생하였습니다.',exclamation!)
			MessageBox('오류',sqlca.sqlerrtext)				
			return false					
		end if
	 case ELSE
      insert into inaudit
       (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,destination,rcpt_qty,issue_qty,cost,cnt,unit_qty,serial_id,com_qty, rem,user_id)
      values (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_newloc,'RO',:ls_inspno,:ls_supp,:lr_newqty,0,:lr_price,:li_inspseq,:lr_unitqty,:ls_coil,:lr_com_qty, :ls_product_no, :gs_userid);   
		if sqlca.sqlcode <> 0 then
//			messagebox('오류','입출고역에 추가중 DB오류발생하였습니다.',exclamation!)
			MessageBox('오류',sqlca.sqlerrtext)	
			return false					
		end if

end choose


return true




end function

public function boolean wf_alter (long arg_cnt);//
long   i
real   lr_solqty,lr_canqoh,lr_notqty,lr_canqoh1,lr_canqoh2
string ls_item,ls_qa
int    li_seq

for i = 1 to arg_cnt
	ls_item = trim(dw_6.object.item_no[i])
	ls_qa   = trim(dw_6.object.qa[i])
    
	SELECT sum(itemloc.qoh) INTO :lr_canqoh1 FROM itemloc, location
	 WHERE itemloc.loc_no  = location.loc_no 
	   AND itemloc.item_no = :ls_item AND itemloc.qa = :ls_qa AND location.loc_type = 'N';
	 if sqlca.sqlcode < 0 then
		 messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
		 return false
	 end if
	 
	 if isnull(lr_canqoh1) then lr_canqoh1 = 0
	 
//	 select sales_reserved into :lr_canqoh2 from item where item_no = :ls_item and qa = :ls_qa;
//	 if sqlca.sqlcode < 0 then
//		 messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
//		 return false
//	 end if

	 if isnull(lr_canqoh2) then lr_canqoh2 = 0
	 lr_canqoh = lr_canqoh1 - lr_canqoh2
    lr_notqty = dw_6.object.notqty[i]
    lr_solqty = dw_6.object.sol_qty[i]
	 if lr_canqoh >= lr_notqty then
//		 update item 
//        set sales_reserved = sales_reserved + :lr_notqty
//		  where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류',sqlca.sqlerrtext,exclamation!)
//		    return false
//	    end if		 
		 dw_6.object.saledet_text[i] = 'X'
		 dw_6.object.sol_qty[i]      = lr_solqty + lr_notqty
	 else 
//		 update item 
//        set sales_reserved = sales_reserved + :lr_canqoh
//		  where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류',sqlca.sqlerrtext,exclamation!)
//		    return false
//	    end if		 
		 dw_6.object.saledet_text[i] = 'P'
		 dw_6.object.sol_qty[i]      = lr_solqty + lr_canqoh		
	 end if
next

return true

end function

public subroutine wf_print (string arg_flag, date arg_date);long   ll_row, ll_cnt, ll_insertrow
string ls_class
string ls_sort 

ll_row = dw_8.rowcount()
choose case arg_flag
	case 'S'
		ls_class = "상품"
	case 'W'
		ls_class = "원자재"
	case 'B'
		ls_class = "부자재"
	case 'Y'
		ls_class = "외주가공"
end choose

dw_9.setredraw(false)
dw_9.reset()
for ll_cnt = 1 to ll_row
	ll_insertrow = dw_9.insertrow(0)
	
	dw_9.object.item_class[ll_insertrow] = ls_class
	dw_9.object.cust_name[ll_insertrow]  = dw_8.object.supp_supp_name[ll_cnt]
	dw_9.object.group_name[ll_insertrow] = trim(dw_8.object.inspdet_insp_no[ll_cnt])
	dw_9.object.item_name[ll_insertrow]  = dw_8.object.groupitem_item_name[ll_cnt]
	dw_9.object.seq[ll_insertrow]        = dw_8.object.inspdet_oi_no[ll_cnt]
	dw_9.object.qa[ll_insertrow]         = dw_8.object.inspdet_qa[ll_cnt]
	dw_9.object.in_date[ll_insertrow]    = arg_date
	dw_9.object.ea[ll_insertrow]         = dw_8.object.inspdet_com_uom[ll_cnt]
	dw_9.object.qty[ll_insertrow]        = dw_8.object.comqty[ll_cnt]
	dw_9.object.cost[ll_insertrow]       = dw_8.object.price[ll_cnt]
	dw_9.object.amount[ll_insertrow]     = dw_8.object.ori_amount[ll_cnt]
//	dw_9.object.dept[ll_cnt]             = dw_8.object.[ll_cnt]
//	dw_9.object.acct_desc[ll_cnt]        = dw_8.object.[ll_cnt]
	dw_9.object.rem[ll_insertrow]        = dw_8.object.rem[ll_cnt]
next

ls_sort = "cust_name, item_name, qa"
dw_9.setsort(ls_sort)
dw_9.sort()
dw_9.groupcalc()
dw_9.setredraw(true)

end subroutine

public function boolean wf_jajaeout (string arg_plan, string arg_subcon, long arg_cnt, string arg_inspno, long arg_inspseq);//
string ls_item, ls_supp, ls_qa, ls_order, ls_rem
string ls_destination, ls_temp, ls_suppname, ls_flag, ls_loc
string ls_w_coil, ls_item4, ls_oc, ls_old_time, ls_item1, ls_type
dec{1} ld_w_wid
real   lr_newqty
long   ll_cnt, ll_qcnt, ll_count
datetime ldt_date

dw_1.accepttext()
dw_2.accepttext()
dw_5.accepttext()

ldt_date = dw_5.object.insp_date[1]
ls_supp  = trim(dw_1.object.supp_no[1])
ls_qa    = trim(dw_2.object.qa[arg_cnt])
ls_order = trim(dw_2.object.order_no[arg_cnt])
ls_destination = trim(dw_1.object.supp_no[1])
lr_newqty = dw_2.object.rcpt_qty[arg_cnt]
ls_rem    = trim(dw_2.object.product_no[arg_cnt])
ls_item1  = dw_2.object.item_no[arg_cnt] 
ls_loc    = dw_2.object.loc_no[arg_cnt] 

// 발주구분(구매 N, 외주가공 P, 외주구매 Y, 외주스리팅 C, 자재가공 J, 원코일 W, 수입 L)
if arg_subcon = 'J' then	// 자재가공
	SELECT issue_lot,assy_item, assy_qa, flag, out_qty
	  INTO :ls_w_coil,:ls_item,:ls_qa,:ls_flag , :ll_cnt
	  FROM jajaesudo
	 WHERE order_no = :arg_plan;
else								// 외주가공
	SELECT issue_lot, component, component_qa, sudo_type, out_qty 
	  INTO :ls_w_coil, :ls_item, :ls_qa, :ls_flag, :ll_cnt
	  FROM sudodet
	 WHERE order_no = :arg_plan AND item_no = :ls_item1 AND qa = :ls_qa;    	
end if
				  
choose case sqlca.sqlcode
	case 0
		if trim(ls_flag) = 'C' then 
			messagebox('오류',string (arg_cnt) + "번째 자료 [" + arg_plan +']이미 마감된 자료입니다.',exclamation!)
			return false
		end if
		
      ls_item = trim(ls_item)
		ls_qa   = trim(ls_qa) 
		
	case 100
		messagebox('오류',string (arg_cnt) + "번째 자료 [" + arg_plan + "][" +ls_item + "] [" + ls_qa +'] 가공출고내역이 없습니다.',exclamation!)
		return false
		
	case else
		messagebox('오류',"가공출고내역 검색중 " + string (arg_cnt) + "번째 자료에서 오류가 발생했습니다."&
							+ "~r~n" + sqlca.sqlerrtext,exclamation!)
		return false		
end choose

SELECT loc_no INTO :ls_temp FROM location WHERE loc_no = :ls_supp;
choose case sqlca.sqlcode
	case 0
		
	case 100
		SELECT supp_name INTO :ls_suppname FROM supp WHERE supp_no = :ls_supp;
		ls_suppname = trim(ls_suppname)
		
		INSERT INTO location (loc_no,loc_name,loc_type) VALUES (:ls_supp,:ls_suppname,'Y');
		if sqlca.sqlcode < 0 then		   
		   messagebox('오류','저장소 추가중 오류가 발생하였습니다.',exclamation!)
		   return false
		end if
		
	case else		
		messagebox('오류','저장소 검색중 오류가 발생하였습니다.',exclamation!)
		return false		
end choose

//ls_item4 = mid(ls_item,4,1)
//if ls_item4 = '1' then // 1; coil , 2 : sheet
//	ld_w_wid = dec(mid(ls_qa,5,4)) + dec("0." + mid(ls_qa,10,1))
//	update coilmst set qcnt = 0, open_close = 'C'
//	 where coil_no = :ls_w_coil
//	  and loc_no = :ls_supp
//	  and open_close <> 'C';
//	if sqlca.sqlcode < 0 then
//		rollback;
//		messagebox('오류35','coilmst UPDATE중 DB오류발생하였습니다.~r~n' &
//						+ ' coil_no=[' + ls_w_coil + '] wid = ' + string(ld_w_wid, "####.0"),exclamation!)
//		return false	
//	end if
//else
//	select qcnt into :ll_qcnt from sheetmst 
//	where sheet_no = :ls_w_coil
//	  and loc_no = :ls_supp;
//	if ll_qcnt > ll_cnt then
//		ls_oc = 'S'
//	else
//		ls_oc = 'C'
//	end if
//	update sheetmst set qcnt = qcnt - :ll_cnt, open_close = :ls_oc
//	 where sheet_no = :ls_w_coil
//	   and loc_no = :ls_supp;
//	if sqlca.sqlcode < 0 then
//		rollback;
//		messagebox('오류','[wf_save2]coilmst UPDATE중 DB오류발생하였습니다.~r~n' &
//						+ ' coil_no=[' + ls_w_coil + '] wid = ' + string(ld_w_wid, "####.0"),exclamation!)
//		return false	
//	end if
//end if
//for ll_count = 1 to 100000
//	IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
//		ls_old_time  = string(now(),'hh:mm:ss:fff')	
//		exit
//	END IF	
//next		


//////////////////////////////////////////////////////////////////////////////////////
// 외주가공형태 추가 (2001/07/19,이인호)
// J:자재가공, P:외주가공 일때만 적용(inaudit 추가 안함)
//////////////////////////////////////////////////////////////////////////////////////
// A.명송 외주가공 플로우	
//
//		1. 스리팅 코일 이동
//		2. 제품 생산계획
//			- 임의 생산계획 작성후 명송에서 받은 작업일보에서 해당 제품 입고
//		3. 스리팅 코일 수불 
//			- 작업일보에서 잔량 및 사용량 등록
//		4. 수주접수후 외주생산계획작성
//		5. 제품 외주 가공 발주
//			- 출고되는 스리팅코일은 로트번호없는 스리팅코드로만 외주가공 발주
//		6. 입고
//			- 제품입고시에 명송에 있는 제품을 사용한것으로 해야함
//
// B. 통일 외주가공 플로우	
//		1. 코일 이동 - 외주발주에 의한 코일이동시 스리팅 수불 안함
//		2. 수주접수후 외주생산계획 작성
//		3. 외주가공발주 
//			- 출고되는 스리팅코일은 로트번호없는 스리팅코드로만 외주가공 발주
//		4. 입고 
//       - 입고시 스리팅코일의 사용을 추가 해야함	
//////////////////////////////////////////////////////////////////////////////////////

setnull(ls_type)
SELECT type INTO :ls_type FROM supp WHERE supp_no = :ls_supp;

// A.명송 , B.통일과 같은 경우는 inaudit 추가 안함
if ls_type = "A" then
	ls_item   = dw_2.object.item_no[arg_cnt]
	ls_qa     = trim(dw_2.object.qa[arg_cnt])
	setnull(ls_w_coil)
	lr_newqty = dw_2.object.rcpt_qty[arg_cnt]
elseif ls_type = "B" then 
	return true
end if
		
INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,  loc_no,inaudit_type,order_no,
  		 rcpt_qty, issue_qty, cost, destination, serial_id, cnt, unit_qty, rem, user_id)
VALUES (getdate(),:ldt_date,:ls_item,:ls_qa,  :ls_supp,'IO',:arg_inspno,
		 0,:  lr_newqty,  0,   :ls_loc, :ls_w_coil, :arg_inspseq,:ld_w_wid, :ls_rem, :gs_userid);   

if sqlca.sqlcode < 0 then	
   messagebox('오류','입출고내역에 추가중 ' + string (arg_cnt) + '번째 자료에서 DB오류가 발생하였습니다.',exclamation!)
	return false
end if

return true

end function

public function string wf_coil (long arg_row);long   ll_row, ll_count
int    li_col
string ls_coil, ls_date, ls_item, ls_loc, ls_code1, ls_code2

dw_2.accepttext()
dw_5.accepttext()
ls_date = string(dw_5.object.insp_date[1], 'yyyymmdd') + "%"

setnull(ls_coil)

ls_loc  = dw_2.object.loc_no[arg_row]
ls_item = trim(dw_2.object.item_no[arg_row])
// 2001/05/31변경
		//===================================================
		// 로트 번호 부여 규칙.
		//===================================================
		// 소재      형태
		//===================================================
		// A :알미늄 C :원코일
		// S :스틸   H :SHEET
		//           S :외주스리팅
		//===================================================
		// H S : 유창작업장내 스리팅 -- 사내 작업일보시만 적용.
		// 예) SC010531001 :스틸 원코일2001년 5월 31일자 001번째 로트번호
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

SELECT count(item_no) INTO :ll_count FROM lossitem WHERE loss_item = :ls_item;
if ll_count > 0 then
	ls_code2 = 'L'
	li_col = 11
else
	choose case MidA(ls_item ,2,1)
		case '1' // 원코일
			ls_code2 = 'C'
		case '3' // 스리팅
			ls_code2 = 'S'
	end choose

	choose case MidA(ls_item ,4,1)
		case '2' //SHEET
			ls_code2 = 'H'
	end choose
	li_col = 12
end if
	
// 2001/05/31변경 end

ls_date = ls_code1 + ls_code2 + MidA(string(dw_5.object.insp_date[1], 'yyyymmdd'), 3) + "%"
if MidA(ls_item ,4,1) = '1' then // 1; coil , 2 : sheet
	SELECT max(coil_no) INTO :ls_coil FROM coilmst
	 WHERE coil_no      LIKE :ls_date
		AND ( substring(coil_no,:li_col,1) is null or  substring(coil_no,:li_col,1) = '') ;
else
	SELECT max(sheet_no) INTO :ls_coil FROM sheetmst
	 WHERE sheet_no      LIKE :ls_date
		AND ( substring(sheet_no,:li_col,1) is null or  substring(sheet_no,:li_col,1) = '');
end if

if isnull(ls_coil) then
	if ll_count > 0 then
		ls_coil = LeftA(ls_date, 8) + "00"
	else
	   ls_coil = LeftA(ls_date, 8) + "000"
   end if  
end if

for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.chk[ll_row] = "Y" and not isnull(dw_2.object.coil_no[ll_row]) then
		if LeftA(ls_coil,2) = LeftA(dw_2.object.coil_no[ll_row], 2) &
			and ls_coil < LeftA(dw_2.object.coil_no[ll_row], li_col - 1) then
			ls_coil = dw_2.object.coil_no[ll_row] 
		end if
	end if
next

if ll_count > 0 then
	ls_coil = LeftA(ls_coil, 8) + string(integer(MidA(ls_coil,9,2)) + 1 ,'00')
else
	ls_coil = LeftA(ls_coil, 8) + string(integer(MidA(ls_coil,9,3)) + 1 ,'000')
end if

return ls_coil

end function

public subroutine wf_calc2 (long arg_row);string ls_qa,ls_uom
real   lr_orderqty,lr_rlseqty,lr_unitqty,lr_price
long   ll_cnt

dw_2.accepttext()
dw_5.accepttext()
dw_2.setredraw(false)

ls_qa       = trim(dw_2.object.qa[arg_row])
ls_uom      = trim(dw_2.object.com_uom[arg_row])
lr_orderqty = dw_2.object.order_qty[arg_row]
lr_rlseqty  = dw_2.object.rlse_qty[arg_row]
if isnull(lr_rlseqty) then
	lr_rlseqty = 0
end if

ll_cnt = dw_2.object.cnt[arg_row]
if isnull(ll_cnt) then
	dw_2.object.cnt[arg_row] = 1
	ll_cnt = 1
end if

lr_price   = dw_2.object.price[arg_row]
lr_unitqty = dw_2.object.unit_qty[arg_row]
//if mid(ls_item,4,1) = "1" OR mid( ls_item ,4,1) = '2' then
//	dw_2.object.rcpt_qty[arg_row] = ll_cnt * lr_unitqty
//else
	dw_2.object.rcpt_qty[arg_row] = lr_orderqty - lr_rlseqty
//end if

if dw_2.object.rcpt_qty[arg_row] = 0 then
   dw_2.object.rcpt_qty[arg_row] = dw_2.object.order_qty[arg_row]
end if

if lr_rlseqty > 0 then
	choose case ls_uom
		case 'M'
			dw_2.object.com_qty[arg_row] = TRUNCATE((real(MidA(ls_qa,15,5)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
		case 'M2'
			dw_2.object.com_qty[arg_row] = TRUNCATE((real(MidA(ls_qa, 5,4)) / 1000.0) * (real(MidA(ls_qa,10,4)) / 1000.0) * dw_2.object.rcpt_qty[arg_row], 0)
		case 'KG'
			if dw_2.object.uom[arg_row] = 'SH' then
				dw_2.object.com_qty[arg_row] = TRUNCATE(ll_cnt * lr_unitqty, 3)
			else
				dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row]
			end if
		case else
			dw_2.object.com_qty[arg_row] = TRUNCATE(dw_2.object.rcpt_qty[arg_row] ,0)
	end choose
	if isnull(dw_2.object.com_qty[arg_row]) or dw_2.object.com_qty[arg_row] = 0 then
		dw_2.object.com_qty[arg_row] = dw_2.object.rcpt_qty[arg_row] 
	end if
end if
dw_2.setredraw(true)


end subroutine

public subroutine wf_multiprint (string as_insp_no);//
String ls_Return, ls_bar_ttpw, ls_bar_ttps, ls_rcpt_prt
gs_where lst_where

lst_where.str1 = as_insp_no
lst_where.str2 = '0'

OpenWithParm (w_multiprint_r, lst_where)  // 입고번호 날려야 됨.
ls_Return = Message.StringParm

if ls_Return = '1' then
//	if gf_permission('w_barcode_coilmst_r', gs_userid ) = 'Y' then
//		select bar_ttps into :ls_bar_ttpw from globals;
//	else
//		select bar_ttpw into :ls_bar_ttpw from globals;
//	end if

	// W : 큰것, S : 작은것, rcpt_prt : 일반 프린트
	SELECT bar_ttpw, bar_ttps, rcpt_prt INTO :ls_bar_ttpw, :ls_bar_ttps, :ls_rcpt_prt FROM globals;
	dw_10.Object.DataWindow.Printer = ls_bar_ttpw
	dw_10.print()	
end if

end subroutine

on w_ioin_m.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.dw_inspdet=create dw_inspdet
this.st_2=create st_2
this.pb_1=create pb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_6=create dw_6
this.dw_7=create dw_7
this.dw_9=create dw_9
this.dw_8=create dw_8
this.dw_4=create dw_4
this.dw_area=create dw_area
this.st_22=create st_22
this.cbx_2=create cbx_2
this.dw_3=create dw_3
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_10=create dw_10
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
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.dw_inspdet
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.dw_6
this.Control[iCurrent+10]=this.dw_7
this.Control[iCurrent+11]=this.dw_9
this.Control[iCurrent+12]=this.dw_8
this.Control[iCurrent+13]=this.dw_4
this.Control[iCurrent+14]=this.dw_area
this.Control[iCurrent+15]=this.st_22
this.Control[iCurrent+16]=this.cbx_2
this.Control[iCurrent+17]=this.dw_3
this.Control[iCurrent+18]=this.rb_3
this.Control[iCurrent+19]=this.rb_4
this.Control[iCurrent+20]=this.dw_10
this.Control[iCurrent+21]=this.st_4
this.Control[iCurrent+22]=this.ddlb_fld
this.Control[iCurrent+23]=this.ddlb_dwtitles
this.Control[iCurrent+24]=this.st_7
this.Control[iCurrent+25]=this.ddlb_op
this.Control[iCurrent+26]=this.sle_value
this.Control[iCurrent+27]=this.cb_19
this.Control[iCurrent+28]=this.cb_20
this.Control[iCurrent+29]=this.cb_21
this.Control[iCurrent+30]=this.cb_22
this.Control[iCurrent+31]=this.cb_1
this.Control[iCurrent+32]=this.st_1
this.Control[iCurrent+33]=this.cb_2
this.Control[iCurrent+34]=this.cb_3
this.Control[iCurrent+35]=this.gb_4
end on

on w_ioin_m.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.dw_inspdet)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.dw_4)
destroy(this.dw_area)
destroy(this.st_22)
destroy(this.cbx_2)
destroy(this.dw_3)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_10)
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
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

if GF_PERMISSION("발주자재_입고관리", gs_userid) = "Y" then
else
	MessageBox("확인","발주자재_입고관리 권한이 존재하지 않습니다.")
	RETURN
end if

dw_inspdet.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_7.settransobject(sqlca)

dw_10.visible = False
dw_10.Reset()
dw_10.InsertRow(0)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

if GF_PERMISSION("발주자재_입고관리", gs_userid) = "Y" then
	dw_5.object.insp_case.tabsequence = 150		// 미수불
	dw_5.object.insp_case.visible = false
else
	dw_5.object.insp_case.tabsequence = 0
	dw_5.object.insp_case.visible = false
end if

string ls_loc
SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;
 
dw_1.insertrow(0)
pb_cancel.enabled = false
pb_delete.enabled = false
pb_save.enabled   = false
pb_retrieve.enabled = true

gb_3.enabled = false
rb_1.enabled = false	// 시화수주
rb_2.enabled = false	// YSP수주

// 구매처 사용
dw_1.enabled = true
dw_1.object.supp_no.background.color  = rgb(255,255,255)
dw_1.object.pur_flag.background.color = rgb(255,255,255)

dw_5.enabled = false
dw_2.enabled = false
dw_8.visible = false
dw_9.visible = false
dw_3.visible = false
dw_inspdet.visible = false

dw_1.getchild('supp_no',idwc_supp)
idwc_supp.settransobject(sqlca)

dw_4.settransobject(sqlca)
dw_4.insertrow(0)
dw_4.object.loc_no[1] = ls_loc

dw_6.settransobject(sqlca)
is_select = dw_6.Describe("DataWindow.Table.Select")

dw_6.visible = false
if gs_area = 'M0001' then
	dw_area.enabled = false
	dw_4.enabled    = false
end if

SELECT al_rate, st_rate INTO :ia_rate, :is_rate FROM globals;		// AL, STL 비중 

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - 73

dw_2.width  = newwidth  - 73
dw_2.height = newheight - 1038


end event

type pb_save from w_inheritance`pb_save within w_ioin_m
integer x = 3214
integer y = 56
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_save::clicked;//
dwItemStatus l_status
datetime ldt_date, ldt_duedate, ldt_today
long   ll_dw2row,ll_cnt,ll_seq,ll_serial,ll_insprow, ll_row, ll_rcptqty
dec    ld_insp_amount
real   lr_rcptqty, lr_orderqty,lr_rlseqty
int    li_seq, li_cnt, li_count

string ls_chk,ls_supp,ls_order,ls_type,ls_subcon,ls_plan,ls_coil, ls_item, ls_qa
string ls_pur_flag, ls_area, ls_insp_date, ls_insp_no1, ls_insp_no, ls_seq, ls_supp_no
string ls_case

// 필터링, 정렬 기준값으로 환원 
dw_2.setfilter( "" )
dw_2.filter()
dw_2.setsort( "order_no A, seq_no A" )
dw_2.sort()

dw_2.accepttext()
dw_5.accepttext()

///////////////////////////////////////////////////////////////////////////////////////////
if dw_2.rowcount() < 1 then return

if isnull(dw_5.object.insp_flag[1]) then 
	MessageBox("확인","입고유형을 확인 하십시요!")
	return
end if

// 입고라벨 Reset() 후 신규 입력 
dw_10.Reset()
dw_10.InsertRow(0)

dw_inspdet.reset()
ll_dw2row = dw_2.rowcount()
ls_chk    = "N"
ls_case   = dw_5.object.insp_case[1]		// 미수불(C)

for ll_cnt = 1 to ll_dw2row
	if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
		ls_type  = dw_2.object.result_type[ll_cnt]		// E 완료, P 부분, C 취소, N 미입
		if ls_type = "E" OR ls_type = "P" then
			li_cnt = dw_2.object.cnt[ll_cnt]
			if isnull(li_cnt) then dw_2.object.cnt[ll_cnt] = 1
			
			if ls_case = 'A' then
				lr_orderqty = dw_2.object.order_qty[ll_cnt]		// 발주수량
				lr_rlseqty  = dw_2.object.rlse_qty[ll_cnt]		// 기입고수량
				
				if lr_orderqty - lr_rlseqty < dw_2.object.rcpt_qty[ll_cnt] then		// 입고수량(rcpt_qty)
					if GF_PERMISSION("발주입고_초과입력", gs_userid) = "Y" then
						if (lr_orderqty - lr_rlseqty) * 1.1 < dw_2.object.rcpt_qty[ll_cnt] then
							dw_2.object.unit_qty[ll_cnt] = 0		// 단중
							dw_2.object.rcpt_qty[ll_cnt] = 0		// 입고수량
							dw_2.object.com_qty[ll_cnt]  = 0		// 환산수량

							dw_2.setcolumn('com_qty')
							dw_2.setfocus()
							MessageBox("확인",string(ll_cnt) + " 번째 입고수량오류!~r~n(입고가능 수량은 최대 10%까지만 인정됩니다.)")
						end if
					else
						dw_2.object.unit_qty[ll_cnt] = 0
						dw_2.object.rcpt_qty[ll_cnt] = 0
						dw_2.object.com_qty[ll_cnt]  = 0

						dw_2.setcolumn('com_qty')
						dw_2.setfocus()
						MessageBox("확인",string(ll_cnt) + " 번째 입고수량이 입고가능 수량보다 큽니다!")
						return
					end if
				else
					if ls_type = "E" and lr_orderqty - lr_rlseqty > dw_2.object.rcpt_qty[ll_cnt] then
						if messagebox("확인",string(ll_cnt) &
								+ " 번째가 입고완료이면서 전체 입고가능 수량보다 적습니다! ~r~n " &
								+ " 계속진행 하시겠습니까?",question!,okcancel!,1) = 2 then
								return
						end if
					end if
				end if
				
				if dw_2.object.loc_no[ll_cnt] = "" or isnull(dw_2.object.loc_no[ll_cnt]) then
					MessageBox('오류',string(ll_cnt) + ' 번째 저장소를 입력하십시요.',exclamation!)
					return
				end if
				
				if dw_2.object.com_qty[ll_cnt] = 0 then
					MessageBox("확인",string(ll_cnt) + " 번째 입고수량이 0 입니다!")
					return
				end if 
				
				ls_item = MidA(dw_2.object.item_no[ll_cnt],4,1)
				if (ls_item = '1' or ls_item = '2' ) then
					ls_coil = trim(dw_2.object.coil_no[ll_cnt])
					if ls_coil = "" or isnull(ls_coil) then
					  MessageBox('오류lot','코일번호를 입력하십시요.',exclamation!)
					  return
					else
						if ls_item = '1' then // 1; coil , 2 : sheet
							SELECT count(*) INTO :li_count FROM coilmst	 WHERE coil_no = :ls_coil;
						else
							SELECT count(*) INTO :li_count FROM sheetmst	 WHERE sheet_no = :ls_coil;
						end if
						if li_count > 0 then
							MessageBox('오류lot','lot번호가 이미 있습니다.',exclamation!)
							return
						end if							
					end if	// COIL, SHEET
				end if
			end if
			
			ls_chk = "Y"
		end if
	end if
next
if ls_chk = "N" then
	MessageBox("확인","입고할 물품을 선택하십시요!")
	return
end if
	
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 1 then
	setpointer(hourglass!)
	// 입고번호 부여
	ls_area = LeftA(dw_area.object.area[1], 1)
	dw_5.object.area_no[1] = dw_area.object.area[1]
  	ls_pur_flag = dw_1.getitemstring(1, "pur_flag")
	  
	if trim(dw_5.object.insp_no[1]) = '' OR isnull(dw_5.object.insp_no[1]) then
	   ls_insp_date = string(dw_5.object.insp_date[1], "yyyymmdd")
   	ls_insp_no1  = ls_area + ls_pur_flag + ls_insp_date + '-' + '%'			
		
	   SELECT MAX(insp_no) INTO :ls_insp_no FROM insp WHERE insp_no LIKE :ls_insp_no1;		
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
   	if trim(ls_insp_no) = '' OR isnull(ls_insp_no) then
      else
			MessageBox("저장","거래명세서 번호가 이미 존재합니다.", exclamation!)
			return
		end if
	end if
	
	dw_5.object.insp_no[1]  = ls_insp_no1
	dw_5.object.pur_flag[1] = ls_pur_flag
else
	return
end if

ll_insprow = 0
for ll_cnt = 1 to ll_dw2row
	if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
		ls_type    = dw_2.object.result_type[ll_cnt]
		ll_insprow = ll_insprow + 1
		
		ldt_date   = dw_5.object.insp_date[1]
		dw_2.object.rlse_date[ll_cnt] = ldt_date
		if ls_type <> "C" then				// C 취소,
			ls_item     = dw_2.object.item_no[ll_cnt]
			ls_qa       = dw_2.object.qa[ll_cnt]
			ldt_duedate = dw_2.object.due_date[ll_cnt]
			lr_rcptqty  = dw_2.object.rcpt_qty[ll_cnt]
			ll_seq      = dw_2.object.seq_no[ll_cnt]
			ls_type     = dw_2.object.result_type[ll_cnt]
			ls_order    = dw_2.object.order_no[ll_cnt]
			ls_subcon   = trim(dw_2.object.pur_subcon[ll_cnt])		// 발주구분(구매 N, 외주가공 P, 외주구매 Y, 외주스리팅 C, 자재가공 J, 원코일 W, 수입 L)
			ls_plan     = trim(dw_2.object.product_no[ll_cnt])
			ls_order    = trim(dw_2.object.order_no[ll_cnt])
			ls_coil     = trim(dw_2.object.coil_no[ll_cnt])
			ll_serial   = dw_2.object.serial_no[ll_cnt]
			
			//Label Print test
			string ls_custnm, ls_rem, ls_scene, ls_gitem, ls_gorder, ls_suppno
			ls_scene    = dw_2.Object.purdet_cust_name[ll_cnt]
			ls_rem      = dw_5.Object.rem[1]
			ls_suppno   = dw_5.Object.supp_no[1]

		//	SELECT supp_name INTO  :ls_custnm FROM supp WHERE  supp_no = :ls_suppno;
			ls_gitem    = dw_2.Object.groupitem_item_name[ll_cnt]
			ls_gorder   = dw_2.Object.purdet_sale_no[ll_cnt]
			ll_rcptqty  = dw_2.object.rcpt_qty[ll_cnt]
			
			dw_10.Object.item_name[ll_insprow]   =  ls_gitem
			dw_10.Object.qa[ll_insprow]          =  ls_qa
			dw_10.Object.order_no[ll_insprow]    =  ls_gorder
		//	dw_10.Object.supp_no[ll_insprow]     =  ls_custnm
			dw_10.Object.qty[ll_insprow]         =  ll_rcptqty
			dw_10.Object.in_date[ll_insprow]     =  ldt_date
			dw_10.Object.rem[ll_insprow]         =  ls_rem
			dw_10.Object.scene_name[ll_insprow]  =  ls_scene
			/////////////////////////////////////////////////
			
			// 입고상세저장
			dw_inspdet.object.insp_no[ll_insprow]  = ls_insp_no1
			dw_inspdet.object.oi_no[ll_insprow]    = ll_insprow
			
			dw_inspdet.object.item_no[ll_insprow]  = dw_2.object.item_no[ll_cnt]
			dw_inspdet.object.qa[ll_insprow]       = dw_2.object.qa[ll_cnt]
			dw_inspdet.object.rcpt_qty[ll_insprow] = lr_rcptqty
			dw_inspdet.object.uom[ll_insprow]      = dw_2.object.uom[ll_cnt]
			dw_inspdet.object.price[ll_insprow]    = dw_2.object.price[ll_cnt]
			dw_inspdet.object.apoi_qty[ll_insprow] = 0
			dw_inspdet.object.rate_cash[ll_insprow]= dw_2.object.rcpt_rate[ll_cnt]
			dw_inspdet.object.pur_no[ll_insprow]   = dw_2.object.order_no[ll_cnt]
			dw_inspdet.object.seq_no[ll_insprow]   = dw_2.object.seq_no[ll_cnt]
			dw_inspdet.object.rem[ll_insprow]      = dw_2.object.rem[ll_cnt]
			dw_inspdet.object.loc_no[ll_insprow]   = dw_2.object.loc_no[ll_cnt]
			dw_inspdet.object.cnt[ll_insprow]      = dw_2.object.cnt[ll_cnt]
			dw_inspdet.object.comqty[ll_insprow]   = dw_2.object.com_qty[ll_cnt]
			dw_inspdet.object.unit_qty[ll_insprow] = dw_2.object.unit_qty[ll_cnt]
			dw_inspdet.object.coil_no[ll_insprow]  = ls_coil
			dw_inspdet.object.com_uom[ll_insprow]  = dw_2.object.com_uom[ll_cnt]
			
			UPDATE purdet 
			   SET result_type = :ls_type
				  , rlse_qty    = rlse_qty + :lr_rcptqty
				  , rlse_date   = :ldt_date
			 WHERE order_no = :ls_order AND seq_no = :ll_seq;
			if sqlca.sqlcode < 0 then
				 rollback;
				 MessageBox('오류','purdet update2 수행중 오류가 발생하였습니다.'&
							+ string(sqlca.sqlerrtext) + "~r~n" ,exclamation!)
				 Goto ERROR_LABEL
			end if
			
			if ls_case = 'A' then		// 수불(A), 미수불(C)
				choose case ls_subcon	// 발주구분(구매 N, 외주가공 P, 외주구매 Y, 외주스리팅 C, 자재가공 J, 원코일 W, 수입 L)
				  case 'J','P'				// 자재가공, 외주가공
						if wf_jajaeout(ls_plan,ls_subcon,ll_cnt,ls_insp_no1,ll_insprow) = FALSE THEN
							rollback;
							MessageBox('오류','wf_jajaeout 수행중 오류가 발생하였습니다.'&
										+ "~r~n" + string(sqlca.sqlerrtext) ,exclamation!)
							Goto ERROR_LABEL				
						end if
				end choose
				
				if wf_save2(ll_cnt,ls_insp_no1,ll_insprow) = false then
					rollback;
					MessageBox('오류','wf_save2 수행중 오류가 발생하였습니다.' ,exclamation!)
					Goto ERROR_LABEL
				end if
			end if
		end if
	end if
next

ld_insp_amount = dw_5.object.insp_total[1] 
ls_supp_no     = dw_5.object.supp_no[1]

UPDATE supp 
   SET balance_amt = balance_amt + :ld_insp_amount
	  , last_tran_date = :ldt_today
 WHERE supp_no = :ls_supp_no;
if sqlca.sqlcode <> 0 then
	rollback;
	MessageBox("저장","supp 저장도중 오류가 발생하였습니다!",exclamation!)
	Goto ERROR_LABEL
end if		

//commit;
if wf_update2(dw_5,dw_inspdet, "N") = false then
	Goto ERROR_LABEL
end if


ll_row = dw_7.insertrow(0) 
dw_7.scrolltorow( ll_row )
dw_7.object.insp_no[ll_row] = ls_insp_no1

if MessageBox('확인',"저장이 완료되었습니다. ~r~n 생성된 입고번호는 " + ls_insp_no1 + " 입니다." + &
			  "~r~n입고확인서 및 라벨을 출력하시겠습니까?", Question!, OKCancel!, 1) = 1 THEN
	wf_multiprint(ls_insp_no1)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

pb_cancel.enabled   = FALSE
pb_save.enabled     = FALSE
pb_retrieve.enabled = TRUE

dw_5.enabled  = FALSE
dw_2.enabled  = FALSE

// 구매처 사용
dw_1.enabled = true
dw_1.object.supp_no.background.color  = rgb(255,255,255)
dw_1.object.pur_flag.background.color = rgb(255,255,255)

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

type dw_1 from w_inheritance`dw_1 within w_ioin_m
integer x = 270
integer y = 252
integer width = 1445
integer height = 88
integer taborder = 60
string dataobject = "d_iopurrcpt_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//
dw_2.reset()
this.accepttext()

is_supp = trim(this.object.supp_no[1])
is_curr = idwc_supp.GetItemString(idwc_supp.getrow(), "currency_type")
if is_curr <> "WON" THEN
	this.object.pur_flag[1] = "L"
end if

//dw_2.retrieve(is_supp)
pb_retrieve.postevent( clicked! )

end event

type dw_2 from w_inheritance`dw_2 within w_ioin_m
event ue_calc pbm_custom01
integer x = 32
integer y = 1008
integer width = 4581
integer height = 1612
integer taborder = 150
string dataobject = "d_iopurin_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::ue_calc;//
this.accepttext()
if dw_2.rowcount() < 1 then return
wf_amt()

end event

event dw_2::itemchanged;long ll_row
string ls_loc, ls_null

this.accepttext()
setnull(ls_null)

ll_row = this.getrow()
choose case dwo.name
	case 'chk'
		if trim(data) = 'Y' then
			this.object.result_type[ll_row] = 'E'
			//체크중
//			dw_5.object.log_date[1] = this.object.due_date[ll_row]
//			dw_5.object.insp_date[1] = this.object.due_date[ll_row]
			//
			ls_loc = trim(dw_4.object.loc_no[1])
			if isnull(this.object.loc_no[ll_row]) then
				this.object.loc_no[ll_row] = ls_loc
			end if
			if isnull(this.object.com_uom[ll_row]) then
				CHOOSE CASE this.object.uom[ll_row]
					CASE 'M', 'M2'
						this.object.com_uom[ll_row] = 'EA'
					CASE 'SH'
						this.object.com_uom[ll_row] = 'KG'
					CASE ELSE
						this.object.com_uom[ll_row] = this.object.uom[ll_row]
				END CHOOSE
			end if
//			this.object.unit_qty[ll_row] = this.object.order_qty[ll_row]
			this.object.result_type[ll_row] = 'E'
			wf_calc2(ll_row)
			// 코일 선택
			if MidA(this.object.item_no[ll_row], 4,1) = '1' &
				or MidA(this.object.item_no[ll_row], 4,1) = '2' then
				this.object.coil_no[ll_row] = wf_coil(ll_row)
				this.object.loc_no[ll_row] = ls_loc
			end if
		else
			this.object.result_type[ll_row] = 'N'
			this.object.coil_no[ll_row] = ls_null
			this.object.loc_no[ll_row] = ls_null
			this.SetItemStatus(ll_row, 0, Primary!, NotModified!)
		end if
		
	case 'unit_qty', 'uom','com_uom', 'ea'
			wf_cals(ll_row)
			
	case 'rcpt_qty'
		// 2/25일 추가 start
			if this.object.com_uom[ll_row] = 'SH' then
		 		this.object.cnt[ll_row] = this.object.rcpt_qty[ll_row]
			else
		 		this.object.unit_qty[ll_row] = this.object.rcpt_qty[ll_row]
			end if
		// 2/25일 추가 end
			wf_cals1(ll_row)
	case 'cnt'
			wf_cals(ll_row)
end choose

this.postevent('ue_calc')

end event

event dw_2::losefocus;call super::losefocus;//
this.accepttext()

end event

event dw_2::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if row < 1 then return
this.scrolltorow(row)

end event

type st_title from w_inheritance`st_title within w_ioin_m
integer x = 32
integer y = 48
integer width = 1079
integer height = 132
string text = "발주자재 입고관리"
end type

type st_tips from w_inheritance`st_tips within w_ioin_m
end type

type pb_compute from w_inheritance`pb_compute within w_ioin_m
boolean visible = false
integer taborder = 180
end type

type pb_print_part from w_inheritance`pb_print_part within w_ioin_m
integer x = 2158
integer y = 56
integer width = 206
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품그룹"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;//openwithparm(w_cdgroup_m)
open(w_cdgroup_m)
end event

type pb_close from w_inheritance`pb_close within w_ioin_m
integer x = 3406
integer y = 56
integer taborder = 200
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioin_m
integer x = 2373
integer y = 56
integer taborder = 210
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "구매일보"
string picturename = ""
vtextalign vtextalign = multiline!
end type

event pb_print::clicked;//
string ls_sql, ls_where, ls_flag, ls_area
date   ld_date
long   ll_count
w_repsuper w_print
st_print   l_print


OpenWithParm(w_whapoi_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

dw_8.settransobject(sqlca)
//dw_9.settransobject(sqlca)
ls_flag = ist_code.flag
ld_date = date(ist_code.start_no)
ls_area = trim(ist_code.end_no)

if dw_8.retrieve(ls_flag, ld_date, ls_area, ist_code.sel ) < 1 then
	MessageBox("확인","해당 일자에는 자료가 없습니다")
	return
end if
wf_print(ls_flag, ld_date)

l_print.st_datawindow  = dw_9
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 구매일보 보고서를 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
OpenSheetWithParm(w_print, l_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ioin_m
integer x = 2830
integer y = 56
integer taborder = 220
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;//
pb_cancel.enabled   = FALSE
pb_save.enabled     = FALSE
pb_retrieve.enabled = TRUE
dw_5.enabled = FALSE
dw_2.enabled = FALSE
// 구매처 사용
dw_1.enabled = true
dw_1.object.supp_no.background.color  = rgb(255,255,255)
dw_1.object.pur_flag.background.color = rgb(255,255,255)

dw_5.reset()
dw_2.reset()

cbx_1.checked = false
cbx_2.checked = false

end event

type pb_delete from w_inheritance`pb_delete within w_ioin_m
integer x = 3022
integer y = 56
integer taborder = 230
end type

event pb_delete::clicked;long ll_dw2row,ll_cnt
string ls_chk,ls_type

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

ll_dw2row = dw_2.rowcount()
ls_chk = "N"
for ll_cnt = 1 to ll_dw2row
    if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
		 ls_type  = dw_2.object.result_type[ll_cnt]
		 if ls_type = "C" then
			ls_chk = "Y"
		end if
	end if
next
if ls_chk = "N" then
	messagebox("확인","삭제할 물품을 선택하십시요!")
	return
end if
	
if messagebox("저장","삭제하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

wf_update1(dw_2, "Y")

pb_delete.enabled   = FALSE
pb_cancel.enabled   = FALSE
pb_save.enabled     = FALSE
pb_retrieve.enabled = TRUE
dw_5.enabled = FALSE
dw_2.enabled = FALSE
// 구매처 사용
dw_1.enabled = true
dw_1.object.supp_no.background.color  = rgb(255,255,255)
dw_1.object.pur_flag.background.color = rgb(255,255,255)

dw_inspdet.reset()
dw_5.reset()
dw_2.reset()
cbx_1.checked = FALSE

end event

type pb_insert from w_inheritance`pb_insert within w_ioin_m
boolean visible = false
integer x = 2679
integer taborder = 250
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ioin_m
integer x = 2638
integer y = 56
integer taborder = 240
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp_no, ls_where, ls_curr_code
dec ld_curr_rate
datetime ldt_inspdate

ls_supp_no = dw_1.object.supp_no[dw_1.getrow()]	
dw_2.retrieve(is_supp, LeftA(dw_area.object.area[1],1))

if dw_2.rowcount() > 0 then
	dw_5.reset()
	
	dw_5.insertrow(0)
	dw_5.object.fob[1]         = dw_2.object.pur_fob[1]	
	dw_5.object.supp_no[1]     = ls_supp_no
	dw_5.object.insp_date[1]   = datetime(date(string(today(),'yyyy/mm/dd')))
	dw_5.object.log_date[1]    = dw_5.object.insp_date[1]
	dw_5.object.user_date[1]   = dw_5.object.insp_date[1]
	ldt_inspdate               = datetime(today())
  	dw_5.object.shipto_addr[1] = dw_2.object.pur_shipto_addr[1]
	dw_5.object.curr_code[1]   = is_curr
	dw_5.object.curr_rate[1]   = 1
	dw_5.object.insp_case[1]   = 'A'
	dw_5.object.login_id[1]    = gs_userid
	dw_5.object.area_no[1]     = dw_area.object.area[1]
//	if is_curr <> "WON" then
//		select rev_rate into :ld_curr_rate from currency
//		   where curr_code = :ls_curr_code
//			  AND curr_date = :ldt_inspdate;
		dw_5.object.curr_rate[1] = 1		  
//	end if

	//시화사업장"S0001"에서만 가능하게 퇴사로 김선영(syzang77) //20060206 모듈라 이용이(yonga252)추가
	if gs_area = "S0001" or gs_area = "T0001" or gs_area = "B0001" &
      OR GF_PERMISSION("발주자재_입고관리", gs_userid) = "Y" THEN		// 발주입고관리
		pb_save.enabled   = TRUE
		pb_delete.enabled = TRUE	
	else
		pb_save.enabled   = FALSE
		pb_delete.enabled = FALSE
	end if

	// 구매처 수정불가  
	dw_1.enabled = FALSE
	dw_1.object.supp_no.background.color  = rgb(192,192,192)
	dw_1.object.pur_flag.background.color = rgb(192,192,192)
	
	dw_5.enabled = TRUE
	dw_2.enabled = TRUE
	pb_cancel.enabled    = TRUE
	pb_retrieve.enabled  = FALSE
else
  	MessageBox("확인", "해당하는 구매발주 내역이 없습니다.")
end if
dw_2.setredraw(true)


end event

type gb_3 from w_inheritance`gb_3 within w_ioin_m
integer x = 3630
integer y = 216
integer width = 983
integer height = 140
integer taborder = 160
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_ioin_m
integer x = 27
integer y = 216
integer width = 3589
integer height = 140
integer taborder = 170
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_ioin_m
integer x = 2606
integer width = 1010
end type

type gb_6 from groupbox within w_ioin_m
integer x = 1787
integer y = 12
integer width = 805
integer height = 204
integer taborder = 190
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type cbx_1 from checkbox within w_ioin_m
integer x = 64
integer y = 904
integer width = 384
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
string ls_loc

dw_4.accepttext()
if dw_2.rowcount() < 1 then return

if this.checked = true then
	ls_loc = trim(dw_4.object.loc_no[1])
   for ll_row = 1 to dw_2.rowcount()
		dw_2.object.chk[ll_row]         = "Y"
		dw_2.object.result_type[ll_row] = 'E'
		if isnull(dw_2.object.loc_no[ll_row]) then dw_2.object.loc_no[ll_row] = ls_loc
		
		if isnull(dw_2.object.com_uom[ll_row]) then
			choose case dw_2.object.uom[ll_row]
				case 'M', 'M2'
					dw_2.object.com_uom[ll_row] = 'EA'
				case else
					dw_2.object.com_uom[ll_row] = dw_2.object.uom[ll_row]
			end choose
		end if
		dw_2.object.unit_qty[ll_row] = dw_2.object.order_qty[ll_row]
	  	dw_2.object.loc_no[ll_row]   = dw_4.object.loc_no[dw_4.getrow()]
		wf_cals(ll_row)
	next
else
   for ll_row = 1 to dw_2.rowcount()
		dw_2.object.chk[ll_row] = "N"
	next
end if

dw_2.accepttext()
wf_amt()

end event

type dw_5 from datawindow within w_ioin_m
integer x = 32
integer y = 360
integer width = 3584
integer height = 492
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_iopurrcpt_head_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string   ls_curr_code
decimal  lr_exp_rate
datetime ldt_oi_date

this.Accepttext()

choose case dwo.name
	case 'insp_date', 'curr_code'
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date  = this.object.insp_date[1]
			ls_curr_code = this.object.curr_code[1]
					
			SELECT rev_rate INTO :lr_exp_rate
			  FROM currency
			 WHERE curr_code = :ls_curr_code AND curr_date = :ldt_oi_date;
				  
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_exp_rate
			end if
		end if
end choose

wf_amt()
end event

event rbuttondown;//
choose case dwo.name
	case 'insp_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.insp_date[row] = datetime(date(message.stringparm))
		end if

	case 'log_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.log_date[row] = datetime(date(message.stringparm))
		end if
end choose

this.accepttext()


end event

type dw_inspdet from datawindow within w_ioin_m
integer x = 1445
integer y = 28
integer width = 160
integer height = 112
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_iopurrcpt_inspdet_m"
end type

type st_2 from statictext within w_ioin_m
integer x = 50
integer y = 256
integer width = 219
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ioin_m
integer x = 1819
integer y = 56
integer width = 325
integer height = 144
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "자동수주계산"
vtextalign vtextalign = multiline!
end type

event clicked;// 자동수주계산
long    ll_maxrow
integer li_seq

if rb_1.checked = true then		// 시화수주
	rb_1.triggerevent(clicked!)
else
	rb_2.triggerevent(clicked!)	// YSP수주
end if
	
//start 가용재고로 대체
ll_maxrow = dw_6.rowcount()
if ll_maxrow < 1 then return

if wf_alter(ll_maxrow) = true then
	if dw_6.update() = 1 then
		commit;
	else
		rollback;
	end if
end if

MessageBox("확인","자동수주계산이 완료되었습니다.",information!)
commit;

end event

type rb_1 from radiobutton within w_ioin_m
integer x = 3666
integer y = 272
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
long backcolor = 79741120
string text = "시화수주"
boolean checked = true
end type

event clicked;//
dw_6.dataobject = 'd_mpautosale1_m'
dw_6.settransobject(sqlca)

is_select = dw_6.Describe("DataWindow.Table.Select")
is_clause = " and sale.confirm_flag     = ~~'Y~~'" &
          + " and sale.open_close       = ~~'O~~'" &
          + " and saledet.saledet_text in (~~'N~~',~~'P~~',~~'Q~~')" &
          + " and routtempnew.division  = 1" &
			 + " and substring(saledet.item_no,1,1) in (~~'M~~',~~'G~~')"
is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"

dw_6.Modify(is_where)
dw_6.settransobject(sqlca)
dw_6.retrieve()

end event

type rb_2 from radiobutton within w_ioin_m
integer x = 4055
integer y = 272
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "YSP수주"
end type

event clicked;//
dw_6.dataobject = 'd_mpautosale2_m'
dw_6.settransobject(sqlca)
is_select1 = dw_6.Describe("DataWindow.Table.Select")
is_clause1 = " and sale.confirm_flag        = ~~'Y~~'" &
           + " and sale.open_close          = ~~'O~~'" &
           + " and saledetysp.saledet_text in (~~'N~~',~~'P~~',~~'Q~~')" &
           + " and routtempnew.division     = 1" &
			  + " and substring(saledetysp.item_no,1,1) in (~~'M~~',~~'G~~')"
is_where1  = "DataWindow.Table.Select='"  + is_select1 + is_clause1 + "'"

dw_6.Modify(is_where1)
dw_6.settransobject(sqlca)
dw_6.retrieve()

end event

type dw_6 from datawindow within w_ioin_m
integer x = 1614
integer y = 28
integer width = 160
integer height = 112
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_mpautosale1_m"
boolean livescroll = true
end type

type dw_7 from datawindow within w_ioin_m
integer x = 3630

integer y = 360
integer width = 983
integer height = 492
integer taborder = 80
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

type dw_9 from datawindow within w_ioin_m
integer x = 1065
integer y = 28
integer width = 96
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_apoi_r"
end type

type dw_8 from datawindow within w_ioin_m
integer x = 1275
integer y = 28
integer width = 160
integer height = 112
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_iopurrcpt_h22"
boolean livescroll = true
end type

type dw_4 from datawindow within w_ioin_m
integer x = 1723
integer y = 256
integer width = 1088
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

type dw_area from datawindow within w_ioin_m
integer x = 3058
integer y = 256
integer width = 521
integer height = 80
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_22 from statictext within w_ioin_m
integer x = 2848
integer y = 256
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

type cbx_2 from checkbox within w_ioin_m
integer x = 4169
integer y = 904
integer width = 384
integer height = 64
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

event clicked;// 취소
long ll_rowcount, ll_cnt

if this.checked = true then
	pb_save.enabled = false
	ll_rowcount = dw_2.rowcount()
	for ll_cnt = 1 to ll_rowcount
	    if trim(dw_2.object.chk[ll_cnt]) = 'Y' then
			  dw_2.object.result_type[ll_cnt] = "C"
	    end if
	next
else
	if gs_area = "S0001" or gs_area = "T0001" or gs_area = "B0001" &
      OR GF_PERMISSION("발주자재_입고관리", gs_userid) = "Y" THEN		// 발주입고관리
		pb_save.enabled = true
	end if
end if

end event

type dw_3 from datawindow within w_ioin_m
integer x = 1170
integer y = 28
integer width = 96
integer height = 84
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_ioinsliting_r"
end type

type rb_3 from radiobutton within w_ioin_m
integer x = 2551
integer y = 780
integer width = 439
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "개별부가세"
boolean checked = true
end type

event clicked;string ls_dw2modify1 , ls_dw2modify2

ls_dw2modify1 = " sum( if( chk  ='Y',  if( pur_tax_sign  = 'Y', TRUNCATE(  if( chk  ='Y', if (round = 'Y' , round( com_qty *  price , 0 ), truncate(com_qty *  price + 0.0000001 , 0)), 0) /10, 0) + 0.0000001, 0),0) for all) "
ls_dw2modify2 = 'svat.expression = "' + ls_dw2modify1 + '"'

dw_2.modify( ls_dw2modify2 ) 
wf_amt()
end event

type rb_4 from radiobutton within w_ioin_m
integer x = 2994
integer y = 780
integer width = 613
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "총공급가 부가세"
end type

event clicked;dw_2.modify("svat.expression = ' truncate( samt / 10 + 0.0000001, 0) '") 

wf_amt()
end event

type dw_10 from datawindow within w_ioin_m
integer x = 955
integer y = 28
integer width = 96
integer height = 84
integer taborder = 90
boolean bringtotop = true
string title = "label_printer"
string dataobject = "d_ioin_label_prt"
end type

type st_4 from statictext within w_ioin_m
integer x = 453
integer y = 908
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

type ddlb_fld from dropdownlistbox within w_ioin_m
integer x = 631
integer y = 892
integer width = 430
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_ioin_m
integer x = 677
integer y = 900
integer width = 256
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

type st_7 from statictext within w_ioin_m
integer x = 1070
integer y = 908
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

type ddlb_op from dropdownlistbox within w_ioin_m
integer x = 1253
integer y = 892
integer width = 293
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ioin_m
integer x = 1554
integer y = 896
integer width = 562
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_19 from commandbutton within w_ioin_m
integer x = 2126
integer y = 896
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_ioin_m
integer x = 2290
integer y = 896
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

type cb_21 from commandbutton within w_ioin_m
integer x = 2455
integer y = 896
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_ioin_m
integer x = 2619
integer y = 896
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_1 from commandbutton within w_ioin_m
integer x = 3630
integer y = 896
integer width = 485
integer height = 76
integer taborder = 170
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

type st_1 from statictext within w_ioin_m
integer x = 1147
integer y = 152
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

type cb_2 from commandbutton within w_ioin_m
integer x = 2971
integer y = 896
integer width = 315
integer height = 76
integer taborder = 180
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

type cb_3 from commandbutton within w_ioin_m
integer x = 3301
integer y = 896
integer width = 315
integer height = 76
integer taborder = 190
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
string ls_suppno, ls_orderno, ls_itemno, ls_qa, ls_sdate, ls_edate, ls_find
long   ll_seqno, ll_row, ll_ordercnt, ll_itemcnt, ll_foundrow

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
	
debugbreak()
	ls_suppno  = dw_1.object.supp_no[1]	
	ls_orderno = dw_2.object.order_no[dw_2.getrow()]
	ll_seqno   = dw_2.object.seq_no[dw_2.getrow()]
	ls_itemno  = dw_2.object.item_no[dw_2.getrow()]
	ls_qa      = dw_2.object.qa[dw_2.getrow()]

	SELECT convert(char(10),order_date,111) INTO :ls_sdate FROM pur WHERE order_no = :ls_orderno;
	if isnull(ls_sdate) or ls_sdate = "" then
		ls_sdate = string(today(), "yyyy/mm/dd")
	else
		ls_edate = ls_sdate
	end if

   w_ippurchasenew_m.dw_11.object.supp_no[1] = ls_suppno
	w_ippurchasenew_m.em_s.text = ls_sdate	// string(today(), "yyyy/mm/dd")
	w_ippurchasenew_m.em_e.text = ls_edate	// string(today(), "yyyy/mm/dd")
//	w_ippurchasenew_m.triggerevent("ue_1")
	w_ippurchasenew_m.pb_retrieve.triggerevent( clicked! )
	ll_ordercnt = w_ippurchasenew_m.dw_2.rowcount()
	if ll_ordercnt > 1 then
		ll_foundrow = w_ippurchasenew_m.dw_2.Find( "order_no = '" + ls_orderno + "'", 1, ll_ordercnt)
		w_ippurchasenew_m.dw_2.scrolltorow( ll_foundrow )
		
		ll_itemcnt  = w_ippurchasenew_m.tab_1.tabpage_1.dw_3.rowcount()
		if ll_itemcnt > 1 then
			ls_find  = "order_no = '" + ls_orderno + "' AND seq_no = " + string(ll_seqno) + ""
			ll_foundrow = w_ippurchasenew_m.tab_1.tabpage_1.dw_3.Find( ls_find, 1, ll_itemcnt)
			w_ippurchasenew_m.tab_1.tabpage_1.dw_3.scrolltorow( ll_foundrow )
			w_ippurchasenew_m.tab_1.tabpage_1.dw_3.setfocus()
		end if
	end if
end if

end event

type gb_4 from groupbox within w_ioin_m
integer x = 32
integer y = 852
integer width = 4581
integer height = 140
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

