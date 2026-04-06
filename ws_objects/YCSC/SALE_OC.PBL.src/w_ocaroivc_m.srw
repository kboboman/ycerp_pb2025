$PBExportHeader$w_ocaroivc_m.srw
$PBExportComments$판매수금관리(1998/04/20, 정재수)
forward
global type w_ocaroivc_m from w_inheritance
end type
type gb_4 from groupbox within w_ocaroivc_m
end type
type dw_4 from datawindow within w_ocaroivc_m
end type
type st_1 from statictext within w_ocaroivc_m
end type
type st_salesman from statictext within w_ocaroivc_m
end type
type st_3 from statictext within w_ocaroivc_m
end type
type st_phone from statictext within w_ocaroivc_m
end type
type st_level from statictext within w_ocaroivc_m
end type
type st_2 from statictext within w_ocaroivc_m
end type
type st_4 from statictext within w_ocaroivc_m
end type
type cbx_1 from checkbox within w_ocaroivc_m
end type
type cbx_open from checkbox within w_ocaroivc_m
end type
end forward

global type w_ocaroivc_m from w_inheritance
integer width = 3758
integer height = 1876
string title = "판매수금관리(w_ocaroivc_m)"
boolean resizable = false
long backcolor = 79219928
gb_4 gb_4
dw_4 dw_4
st_1 st_1
st_salesman st_salesman
st_3 st_3
st_phone st_phone
st_level st_level
st_2 st_2
st_4 st_4
cbx_1 cbx_1
cbx_open cbx_open
end type
global w_ocaroivc_m w_ocaroivc_m

type variables
st_print  i_print
st_aroivc ist_aroivc
decimal ir_amount
datawindowchild idwc_cheque_no, idwc_cust, idwc_cust_name
end variables

on w_ocaroivc_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_4=create dw_4
this.st_1=create st_1
this.st_salesman=create st_salesman
this.st_3=create st_3
this.st_phone=create st_phone
this.st_level=create st_level
this.st_2=create st_2
this.st_4=create st_4
this.cbx_1=create cbx_1
this.cbx_open=create cbx_open
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_salesman
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_phone
this.Control[iCurrent+7]=this.st_level
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.cbx_open
end on

on w_ocaroivc_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.st_salesman)
destroy(this.st_3)
destroy(this.st_phone)
destroy(this.st_level)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.cbx_open)
end on

event open;call super::open;// 일별 수금현황(w_ocaroivcday_r), d_ocaroivcday_r6
// 판매거래처관리, 

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

long   ll_row
string ls_open, ls_zero, ls_salesman

// 2007.11.08 수금유형에 대손상각 G 추가.
dw_4.settransobject(sqlca)
///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

ls_zero     = "%"
ls_salesman = "%"

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
///////////////////////////////////////////


end event

type pb_save from w_inheritance`pb_save within w_ocaroivc_m
integer x = 3301
integer y = 56
integer taborder = 60
end type

event pb_save::clicked;if gf_permission('판매수금권한자', gs_userid) = 'Y' then
else
	messagebox("확인", "이 프로그램 사용권한이 없습니다.")
	return
end if

string ls_vc_no, ls_vc_no1, ls_oi_date, ls_rcpt_type, ls_seq, ls_cust_no, ls_vc_type, ls_month
string ls_cheque_no, ls_cheque_start, ls_cheque_end, ls_large, ls_bank_code, ls_branch
string ls_billvc_no, ls_cust_name, ls_bill_type, ls_rem, ls_vc_type2
decimal lr_amount
decimal{0} lr_bill
integer li_seq
datetime ldt_start, ldt_end
long ll_year
dwitemstatus l_status

if dw_2.rowcount() < 1 then return

dw_2.accepttext()
dw_2.object.login_id[1] = gs_userid
dw_2.object.sys_date[1] = wf_today()
ls_cust_no = dw_2.object.cust_no[1]
lr_amount  = dw_2.object.amount[1]
lr_bill    = dw_2.object.amount[1]
if LenA(trim(dw_2.object.vc_inseq[1])) < 6 then
	messagebox('확인', '입금전표번호 6자리로 입력하세요.')
	return
end if
if (trim(dw_2.object.vc_type2[1]) = '' or isnull(dw_2.object.vc_type2[1]))  then
	messagebox('확인', '유형선택이 잘못되었습니다. 유형을 선택하세요.')
	return
end if

setpointer(hourglass!)

if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
elseif wf_nullchk(dw_2) = false then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_2.object.rcpt_type[1] = 'B' then //어음수금시 입력정보check
	ls_vc_type   = dw_2.object.vc_type[1]
	ls_cheque_no = trim(dw_2.object.cheque_no[1])
	ldt_start    = dw_2.object.cheque_start[1]
	ldt_end      = dw_2.object.cheque_end[1]
	ls_cheque_start = string(dw_2.object.cheque_start[1])
	ls_cheque_end   = string(dw_2.object.cheque_end[1])
	ls_large     = trim(dw_2.object.large[1])
	ls_bank_code = trim(dw_2.object.bank_code[1])
	ls_branch    = trim(dw_2.object.branch[1])
	ls_bill_type = dw_2.object.bill_type[1]
	ls_rem       = dw_2.object.rem[1]
	ls_vc_type2  = dw_2.object.vc_type2[1]

	long   ll_cnt, ll_cnt2
	string ls_a_bill_no
	ls_a_bill_no = trim(dw_2.object.a_bill_no[1])

	select count(*) into :ll_cnt 
	  from aroivc
	 where cheque_no  = :ls_cheque_no
	   and delete_key = 'N'
	   and cheque_no is not null;

	select count(*) into :ll_cnt2 
	  from aroivc
	 where cheque_no  = :ls_a_bill_no
	   and delete_key = 'N'
	   and cheque_no is not null;

	if (ll_cnt + ll_cnt2) > 0 then
		messagebox('경고', '어음번호가 중복 됩니다. 다시 확인하고 입력하세요.', stopsign!, ok!)
		return
	end if		
		
	if ls_vc_type = 'P' and ls_bill_type = 'A' then
		messagebox("확인","자수 또는 타수를 선택하세요!", information!)
		dw_2.setcolumn("bill_type")
		dw_2.setfocus()
		return
	elseif isnull(ls_cheque_no) or ls_cheque_no = '' then
		messagebox("확인","어음번호를 입력하세요!",information!)
		if ls_vc_type = 'P' and dw_2.object.bill_type[1] = 'T' then
			dw_2.setcolumn("cheque_no")
		else
			dw_2.setcolumn("a_bill_no")
		end if
		dw_2.setfocus()
		return
	elseif isnull(ls_cheque_start) or ls_cheque_start = '' then
		messagebox("확인","어음발행일을 입력하세요!",information!)
		dw_2.setcolumn("cheque_start")
		dw_2.setfocus()
		return
	elseif isnull(ls_cheque_end) or ls_cheque_end = '' then
		messagebox("확인","어음마감일을 입력하세요!",information!)
		dw_2.setcolumn("cheque_end")
		dw_2.setfocus()
		return
	elseif isnull(ls_large) or ls_large = '' then
		messagebox("확인","어음발행인을 입력하세요!",information!)
		dw_2.setcolumn("large")
		dw_2.setfocus()
		return
	elseif isnull(ls_bank_code) or ls_bank_code = '' then
		messagebox("확인","발행은행을 입력하세요!",information!)
		dw_2.setcolumn("bank_code")
		dw_2.setfocus()
		return
	elseif isnull(ls_branch) or ls_branch = '' then
		messagebox("확인","지점명을 입력하세요!",information!)
		dw_2.setcolumn("branch")
		dw_2.setfocus()
		return
	end if
elseif dw_2.object.rcpt_type[1] = 'A' then   //예금수금시 입력정보check
	ls_bank_code = trim(dw_2.object.bank_code[1])
	ls_branch = trim(dw_2.object.branch[1])
		
	if isnull(ls_bank_code) or ls_bank_code = '' then
		messagebox("확인","발행은행을 입력하세요!",information!)
		dw_2.setcolumn("bank_code")
		dw_2.setfocus()
		return
	elseif isnull(ls_branch) or ls_branch = '' then
		messagebox("확인","지점명을 입력하세요!",information!)
		dw_2.setcolumn("branch")
		dw_2.setfocus()
		return
	end if
end if

if lr_amount = 0 then
	messagebox("확인","수금액을 입력하세요!",information!)
	dw_2.setcolumn("amount")
	dw_2.setfocus()
	return
elseif lr_amount > 0 or ls_vc_type = 'R' then	//수금금액 한번더 check
	if messagebox("확인","수금한 금액이 " + string(lr_amount, '#,###.00') + "입니까?", + & 
	              question!,okcancel!,1) = 2 then 
		dw_2.setcolumn("amount")
	   dw_2.setfocus()
		return
	end if
elseif lr_amount > 0 or ls_vc_type = 'P' then
	if messagebox("확인","지불한 금액이 " + string(lr_amount, '#,###.00') + "입니까?", + & 
	              question!,okcancel!,1) = 2 then 
		dw_2.setcolumn("amount")
	   dw_2.setfocus()
		return
	end if
end if

l_status = dw_2.getitemstatus(1, 0, primary!)
ls_vc_no = trim(dw_2.object.vc_no[1])
if l_status = newmodified! then
	//수금번호 자동생성
	ls_oi_date = string(dw_2.object.oi_date[1], 'YYYYMMDD')
	ls_rcpt_type = dw_2.object.rcpt_type[1]
	ls_vc_no = ls_oi_date + ls_rcpt_type + '%'
	
	SELECT MAX(vc_no) INTO :ls_vc_no1
	  FROM aroivc
	 WHERE vc_no LIKE :ls_vc_no;
	  
	if isnull(ls_vc_no1) or ls_vc_no1 = '' then
		li_seq = 1
	else
		li_seq = integer(RightA(ls_vc_no1, 3)) + 1
	end if
	ls_seq   = '000' + string(li_seq)
	ls_seq   = RightA(ls_seq, 3)
	ls_vc_no = ls_oi_date + ls_rcpt_type + ls_seq //수금번호
	
   if dw_2.object.rcpt_type[1] = 'B' then //어음일 경우
		if ls_vc_type = 'P' and dw_2.object.bill_type[1] = 'T' then //타수로 지불할 경우
			//glbilldet table insert
			dw_1.accepttext()
			ls_cust_name = dw_1.getitemstring(dw_1.getrow(), "cust_name")
			ls_billvc_no = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "vc_no")
			INSERT INTO glbilldet(vc_no, bill_no, billdet_vcno, billdet_no, det_class, 
			                      close_date, start_date, bank_code, bill_area, amount,
										 draft, rem, user_id)
			VALUES (:ls_billvc_no, :ls_cheque_no, :ls_vc_no, :ls_cheque_no, 'B', 
				  			 :ldt_end, :ldt_start, :ls_bank_code, :ls_branch, :lr_bill, 
							 :ls_large, :ls_cust_name, :gs_userid);	

			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if		
			
			UPDATE glbill SET bill_class = 'P'
			 WHERE vc_no = :ls_billvc_no;
			 
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if		 
		else		
			//glbill table insert
			INSERT INTO glbill(vc_no, bill_no, bill_class, cust_no, close_date, start_date,
			                   bank_code, bill_area, bill_amount, set_flag, draft, rem, vc_type2)
		   VALUES(:ls_vc_no, :ls_cheque_no, :ls_vc_type, :ls_cust_no, :ldt_end, :ldt_start,
			   	      :ls_bank_code, :ls_branch, :lr_bill, 'N', :ls_large, :ls_rem, :ls_vc_type2);
						
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if
			
			dw_2.object.cheque_no[1] = dw_2.object.a_bill_no[1]
		end if

		//customer table의 어음미결액 update
		UPDATE customer 
		   SET bill_amount = bill_amount + :lr_amount
		 WHERE cust_no = :ls_cust_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	end if
	
	ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
   ls_month = string(dw_2.object.oi_date[1], 'mm')
	if dw_2.object.vc_type[1] = 'R' then   //수금형태중 수금인 경우	
//		//customer table의 미수금액 update
//		UPDATE customer SET balance_amt = balance_amt - :lr_amount
//		 WHERE cust_no = :ls_cust_no;
//		  
//		if sqlca.sqlcode <> 0 then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
		
		//opeom table의 수금액 update
//		if wf_opeom_up1(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if       
	else                                   //수금형태중 수금인 경우	
		//customer table의 미수금액 update
//		UPDATE customer SET balance_amt = balance_amt + :lr_amount
//		 WHERE cust_no = :ls_cust_no;
//		  
//		if sqlca.sqlcode <> 0 then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
		
		//opeom table의 수금액 update
//		if wf_opeom_up2(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
	end if
	
	dw_2.object.vc_no[1] = ls_vc_no
elseif lr_amount <> ir_amount then //수금액에 변동이 있을 경우
	ls_vc_no = dw_2.object.vc_no[1]
	lr_amount = ir_amount - lr_amount
	if dw_2.object.rcpt_type[1] = 'B' then //어음인 경우
		//customer table의 어음미결액 update
		UPDATE customer 
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE cust_no = :ls_cust_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if

		//glbill table의 어음금액 update  
		UPDATE glbill
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE vc_no = :ls_vc_no;                    
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	end if
		
	ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
   ls_month = string(dw_2.object.oi_date[1], 'mm')
	if dw_2.object.vc_type[1] = 'R' then //수금형태중 수금인 경우	
		//customer table의 미수금액 update
		
	
//		UPDATE customer SET balance_amt = balance_amt + :lr_amount
//		 WHERE cust_no = :ls_cust_no;
//		 
//		if sqlca.sqlcode <> 0 then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
		
		//opeom table의 수금액 update
//		if wf_opeom_up2(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
		
	else                                 //수금형태중 지불인 경우	
//		//customer table의 미수금액 update
//		UPDATE customer SET balance_amt = balance_amt - :lr_amount
//		 WHERE cust_no = :ls_cust_no;
//		  
//		if sqlca.sqlcode <> 0 then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
		
		//opeom table의 수금액 update
//		if wf_opeom_up1(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//			rollback;
//			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//			return
//		end if
	end if
end if

dw_2.accepttext()
if wf_update1(dw_2, 'Y') = true then
	// 문자전송
	choose case st_level.text
		case "A","B","C","E","S"
			string ls_message, ls_sender, ls_recipient
			String SMSSERVER
			
			SELECT ITEM_NM INTO :SMSSERVER FROM CODEMST
			 WHERE ITEM_CD = 'SMSSERVER' AND USE_YN = 'Y';
			IF SMSSERVER = "" THEN SMSSERVER = "192.168.1.5"
		
			string ls_office
			SELECT RTRIM(BIGO) INTO :ls_office 
			  FROM CODEMST 
			 WHERE TYPE = 'SMSSEND' AND ITEM_CD = :gs_userid;
			if isnull(ls_office) or ls_office = "" then
				ls_sender   = "0226481998"	
			else
				ls_sender   = ls_office
			end if
			
			SELECT B.CUST_NAME + ' \' + 
					 REPLACE(LTRIM(CONVERT(VARCHAR, CONVERT(MONEY, A.AMOUNT), 1)), '.00', '') +
					 '원 [' + (CASE WHEN A.RCPT_TYPE = 'C' THEN '현금'
										 WHEN A.RCPT_TYPE = 'B' THEN '어음'
										 WHEN A.RCPT_TYPE = 'A' THEN '예금'
										 WHEN A.RCPT_TYPE = 'D' THEN 'D/C'
										 WHEN A.RCPT_TYPE = 'S' THEN '상계'
										 WHEN A.RCPT_TYPE = 'E' THEN '잡이익'
										 WHEN A.RCPT_TYPE = 'P' THEN '처리어음'
										 WHEN A.RCPT_TYPE = 'Z' THEN '기타'
										 WHEN A.RCPT_TYPE = 'F' THEN '하자보수'
										 WHEN A.RCPT_TYPE = 'G' THEN '대손상각'
								  END) + '/' +
								 (CASE WHEN A.VC_TYPE2 = '01' THEN '자수'
										 WHEN A.VC_TYPE2 = '02' THEN '타수'
										 WHEN A.VC_TYPE2 = '03' THEN '융통'
										 WHEN A.VC_TYPE2 = '04' THEN '전자결재'
										 WHEN A.VC_TYPE2 = '05' THEN '기타'
								  END) + ']' 
			  INTO :ls_message
			  FROM AROIVC  A
					 LEFT OUTER JOIN CUSTOMER B  ON A.CUST_NO = B.CUST_NO
			 WHERE A.VC_NO    = :ls_vc_no;
 
			ls_message   = GF_HANGLE_TR(ls_message,80)
			ls_recipient = st_phone.text
			choose case LeftA(ls_recipient,3)
				case '010','011','016','017','018','019'
				case else
					ls_recipient = ''
			end choose
			
			// 수신처
			if ls_recipient = '' or isnull(ls_recipient) then
			else
				choose case SMSSERVER
					case '192.168.1.5'
						if cbx_1.checked = true then
							INSERT  INTO  SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG, TR_ETC6 )
							VALUES ( GetDate(), '0', '00', :ls_recipient, :ls_sender, :ls_message, :gs_userid );
			
							COMMIT;
						end if
				end choose
			end if
	end choose
	
	dw_2.reset()
	dw_4.reset()
	dw_4.retrieve(ls_cust_no)
end if
	
end event

type dw_1 from w_inheritance`dw_1 within w_ocaroivc_m
integer x = 1262
integer y = 268
integer width = 2427
integer height = 92
integer taborder = 20
string dataobject = "d_occustddw_c"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;datawindowchild ldwc_cust
string ls_cust_no, ls_cust_name, ls_salesman, ls_phone, ls_level

dw_2.reset()
dw_4.reset()
choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no   = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		ls_cust_name = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_name")
		this.object.cust_name[1] = ls_cust_name
		ist_aroivc.curr_code     = ldwc_cust.getitemstring(ldwc_cust.getrow(), "curr_code")
		ist_aroivc.balance_amt   = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "balance_amt")
		ist_aroivc.bill_amount   = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "bill_amount")
		ist_aroivc.saleman       = ldwc_cust.getitemstring(ldwc_cust.getrow(), "salesman")
//		dw_4.retrieve(ls_cust_no)
		
	case 'cust_name'
		this.getchild("cust_name", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		this.object.cust_no[1] = ls_cust_no
		ist_aroivc.curr_code   = ldwc_cust.getitemstring(ldwc_cust.getrow(), "curr_code")
		ist_aroivc.balance_amt = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "balance_amt")
		ist_aroivc.bill_amount = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "bill_amount")
		ist_aroivc.saleman     = ldwc_cust.getitemstring(ldwc_cust.getrow(), "salesman")		
//		dw_4.retrieve(ls_cust_no)
end choose


SELECT B.USER_NAME, ISNULL(REPLACE(C.HP_NO,'-',''),''), A.CREDIT_LEVEL
  INTO :ls_salesman, :ls_phone, :ls_level
  FROM CUSTOMER A
       LEFT OUTER JOIN LOGIN    B ON A.SALESMAN = B.USER_ID
       LEFT OUTER JOIN SALEHP   C ON A.SALESMAN = C.USER_ID
 WHERE CUST_NO = :ls_cust_no;

st_salesman.text = ls_salesman
st_level.text    = ls_level
st_phone.text    = ls_phone

end event

type dw_2 from w_inheritance`dw_2 within w_ocaroivc_m
integer x = 1253
integer y = 516
integer width = 2427
integer height = 1232
integer taborder = 30
string dataobject = "d_ocaroivc_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::retrieveend;//
if this.getrow() > 0 then
	ir_amount = this.object.amount[1]
	this.object.a_bill_no[1] = this.object.cheque_no[1]
end if

if this.object.open_close[1] = 'C' then
	pb_cancel.enabled = false
	pb_save.enabled   = false
else
	pb_cancel.enabled = true
	pb_save.enabled   = true
end if

end event

event dw_2::itemchanged;call super::itemchanged;datetime ldt_oi_date, ldt_null
string   ls_curr_code, ls_rcpt_type, ls_vc_type
decimal  lr_exp_rate
long     ll_cnt 

this.AcceptText()

choose case dwo.name
	case 'oi_date'
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date  = this.object.oi_date[1]
			ls_curr_code = this.object.curr_code[1]
						
			SELECT exp_rate INTO :lr_exp_rate
			  FROM currency
			 WHERE curr_code = :ls_curr_code	AND curr_date = :ldt_oi_date;
					  
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_exp_rate
			end if
		end if

	case "rcpt_type"		// if(isrownew(),1087434968, 78682240)
		ls_vc_type   = this.object.vc_type[1]
		ls_rcpt_type = this.object.rcpt_type[1]
		if ls_vc_type = "R" and ls_rcpt_type = "N" then	// 수금/대손어음
			// 폰트칼러 유심히 볼것
		end if
	
	case 'cheque_no'	// 어음번호
		if this.object.vc_type[1] = 'P' and this.object.rcpt_type[1] = 'B' and this.object.bill_type[1] = 'T' then
			
			this.getchild("cheque_no", idwc_cheque_no)
			idwc_cheque_no.settransobject(sqlca)
			this.object.amount[1]       = idwc_cheque_no.getitemdecimal(idwc_cheque_no.getrow(), "bill_amount")
			this.object.cheque_start[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "start_date")
			this.object.cheque_end[1]   = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "close_date")
			this.object.large[1]        = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "draft")
			this.object.bank_code[1]    = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bank_code")
			this.object.branch[1]       = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bill_area")
		end if
		
		if this.object.rcpt_type[1] = 'P' then		// 처리어음
			this.getchild("cheque_no", idwc_cheque_no)
			idwc_cheque_no.settransobject(sqlca)
			this.object.cheque_start[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "start_date")
			this.object.cheque_end[1]   = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "close_date")
			this.object.large[1]        = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "draft")
			this.object.bank_code[1]    = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bank_code")
			this.object.branch[1]       = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bill_area")
		end if
		
		SELECT count(*) INTO :ll_cnt FROM aroivc WHERE cheque_no = :data AND delete_key = 'N' AND cheque_no is not null;
		if ll_cnt > 0 then
			messagebox('경고', '어음번호가 중복 됩니다. 다시 확인하고 입력하세요.', stopsign!, ok!)
			return 1	
		end if
		
	case 'bill_type'
		setnull(ldt_null)
		this.object.amount[1]       = 0
		this.object.cheque_no[1]    = ''
		this.object.a_bill_no[1]    = ''
		this.object.cheque_start[1] = ldt_null
		this.object.cheque_end[1]   = ldt_null
		this.object.large[1]        = ''
		this.object.bank_code[1]    = ''
		this.object.branch[1]       = ''
		
	case 'a_bill_no'
		this.object.cheque_no[1] = this.object.a_bill_no[1]
		SELECT count(*) INTO :ll_cnt 
		  FROM aroivc
		 WHERE cheque_no = :data AND delete_key = 'N' AND cheque_no is not null;
		if ll_cnt > 0 then
			messagebox('경고', '어음번호가 중복 됩니다. 다시 확인하고 입력하세요.', stopsign!, ok!)
			return 1	
		end if
end choose

end event

event dw_2::rbuttondown;//
CHOOSE CASE dwo.name
	CASE 'oi_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.oi_date[row] = datetime(date(message.stringparm))
		end if
END CHOOSE

this.accepttext()

end event

event dw_2::itemerror;call super::itemerror;//
choose case dwo.name
	case 'cheque_no'
		this.object.cheque_no[row] = ''
	case 'a_bill_no'
		this.object.a_bill_no[row] = ''
end choose

return 2
end event

event dw_2::itemfocuschanged;call super::itemfocuschanged;//// DataWinodw AutoSelection = true 대체
//
//choose case dwo.name
//	case "amount"
//		this.SelectText(1, len(GetText()))		// 금액전체 선택
//end choose
end event

type st_title from w_inheritance`st_title within w_ocaroivc_m
integer x = 41
integer y = 64
integer width = 1179
string text = "판매수금관리"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivc_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivc_m
boolean visible = false
integer x = 1659
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivc_m
boolean visible = false
integer x = 2811
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_ocaroivc_m
integer x = 3493
integer y = 56
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivc_m
boolean visible = false
integer x = 2606
integer y = 48
integer taborder = 50
end type

event pb_print::clicked;call super::clicked;//w_repsuper w_print
//
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivc_m
integer x = 3109
integer y = 56
integer taborder = 100
end type

event pb_cancel::clicked;// 김양숙 대리의 요청으로 김양수대리만 가능하게함  퇴사로 김원규(berrygrl), 김선영(syzang77)
// 2005.10.25 조봉기차장(bonggie) 삭제권한 추가(해외판매부만 컨트롤해야 되는데..)
// 2006/02/04 전수미(20000302),김지숙(ji79) 추가 -> // 2007.05.28  조세은(se3346)추가
//	2006.04.19
//	김선영퇴사 최나미권한이양 김선영아이디 syzang77을 동일하게 사용처리
//	2006.06.01
//	성계숙씨(cider74) 추가 - 김원규대리 권한승계 gs_userid = 'cider74'
//or gs_userid = "bj5879" 
// 2009.03.03  김명정  =====>  추은지, 박수진 
//IF gs_userid = "root" or gs_userid = "19921102" or gs_userid = "19970508" or gs_userid = "bonggie" & 
//	or gs_userid = "1999010s" or gs_userid = "1999010h" or gs_userid = "berrygrl" or gs_userid = "syzang77" &
//	or gs_userid = "JDS" or gs_userid = "hanmr" or gs_userid = "20000302"   or gs_userid = '19981214' &
//	or gs_userid = "ji79" or gs_userid = "se3346" or gs_userid = 'haejin00' or gs_userid = 'cider74' &
//	or gs_userid = 'saka0310' or gs_userid = 'kmj3377' or gs_userid = 'hi7508' &
//	or gs_userid = 'parkji' or gs_userid = 'myungya' or gs_userid = 'campsky' &
//	or gs_userid = 'sujung10' or gs_userid = "kkj8967" or gs_userid = "010203" or gs_userid = 'ggakdooki' &
//	or gs_userid = 'yang78' or gs_userid = 'chanx3' or gs_userid = 'kgyoung' or gs_userid = 'milkit18' &
//	or gs_userid = 'jsok' or gs_userid = 'ryubin2' or gs_userid = 'skok'   or gs_userid = 'suj0118'  or gs_userid = 'milkit18' then
//else
if gf_permission('판매수금권한자', gs_userid) = 'Y' then
else
	messagebox("권한", "이프로그램의 사용권한이 없습니다(판매부로 문의 바랍니다)")
	return
end if

long ll_year
string ls_month, ls_cust_no, ls_vc_no, ls_bevc_no
decimal lr_amount

if dw_2.getrow() < 1 then return

if (dw_2.object.set_flag[1] = 'Y' AND dw_2.object.rcpt_type[1] <> 'P' ) then
	messagebox("확인","어음이 이미 결재되어 취소하실수 없습니다!",information!) 
	return
elseif messagebox("취소","이 수금내역을 취소하시겠습니까?",question!,okcancel!,2) = 2 then
	return
end if

dw_4.triggerevent(rowfocuschanged!)

ls_vc_no = dw_2.object.vc_no[1]
ls_cust_no = dw_2.object.cust_no[1]
lr_amount = dw_2.object.amount[1]

if dw_2.object.rcpt_type[1] = 'B' then //어음일 경우
	//customer table의 어음미결액 update
	UPDATE customer 
	   SET bill_amount = bill_amount - :lr_amount
	 WHERE cust_no = :ls_cust_no;
	  
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
	
//	DELETE FROM glbill
//	      WHERE vc_no = :ls_vc_no; 
//
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
	if dw_2.object.vc_type[1] = 'P' and dw_2.object.bill_type[1] = 'T' then
		SELECT vc_no INTO :ls_bevc_no
		  FROM glbilldet
		 WHERE billdet_vcno = :ls_vc_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
		
		//타수된 어음을 지급에서 받을어음으로 update
		UPDATE glbill SET bill_class = 'R'
		 WHERE vc_no = :ls_bevc_no;
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
		
		//타수에 대한 어음상세내역 삭제
		DELETE FROM glbilldet
				WHERE billdet_vcno = :ls_vc_no;
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	else
		select vc_no into :ls_vc_no from glbilldet WHERE vc_no = :ls_vc_no;
		if sqlca.sqlcode <> 100 then
			rollback;
			messagebox("저장","어음처리내역이 존재합니다!",exclamation!)
			return
		end if

   	DELETE FROM glbill
	      WHERE vc_no = :ls_vc_no; 

	   if sqlca.sqlcode <> 0 then
		   rollback;
		   messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
	   	return
		end if		
	end if
end if

ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
ls_month = string(dw_2.object.oi_date[1], 'mm')
if dw_2.object.vc_type[1] = 'R' then //수금형태중 수금인 경우	
	//customer table의 미수금액 update
//	UPDATE customer 
//	   SET balance_amt = balance_amt + :lr_amount
//	 WHERE cust_no = :ls_cust_no;
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
//	//opeom table의 수금액 update
//	if wf_opeom_up2(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
else                                 //수금형태중 지불인 경우	
//	//customer table의 미수금액 update
//	UPDATE customer 
//	   SET balance_amt = balance_amt - :lr_amount 
//	 WHERE cust_no = :ls_cust_no;
//	  
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
//	//opeom table의 수금액 update
//	if wf_opeom_up1(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
end if

dw_2.object.delete_key[1] = 'Y'
dw_2.accepttext()
if wf_update1(dw_2, 'N') = true then
	messagebox("취소","수금내역을 취소하였습니다.",information!)
	dw_2.reset()
	dw_4.reset()
	dw_4.retrieve(ls_cust_no)
end if
end event

type pb_delete from w_inheritance`pb_delete within w_ocaroivc_m
boolean visible = false
integer x = 1856
integer y = 60
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivc_m
integer x = 2917
integer y = 56
integer taborder = 40
end type

event pb_insert::clicked;//
if gf_permission('판매수금권한자', gs_userid) = 'Y' then
else
	messagebox("권한", "이프로그램의 사용권한이 없습니다.")
	return
end if

string ls_cust_no

dw_1.accepttext()
ls_cust_no = dw_1.object.cust_no[1] 
if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if 

dw_2.reset()
dw_2.insertrow(0)

dw_2.object.cust_no[1]   = ls_cust_no
dw_2.object.rcpt_type.background.color = 1087434968
dw_2.object.curr_code[1] = ist_aroivc.curr_code

SELECT balance_amt, bill_amount INTO :ist_aroivc.balance_amt, :ist_aroivc.bill_amount 
  FROM customer
 WHERE cust_no = :ls_cust_no;
dw_2.object.balance_amt[1] = ist_aroivc.balance_amt
dw_2.object.bill_amount[1] = ist_aroivc.bill_amount
dw_2.object.salesman[1]    = ist_aroivc.saleman
dw_2.object.oi_date[1]     = wf_today()

pb_save.enabled   = true
pb_cancel.enabled = false

dw_2.setcolumn("vc_inseq")
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivc_m
integer x = 2725
integer y = 56
integer taborder = 120
end type

event pb_retrieve::clicked;string ls_cust_no
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")

if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
else	
	dw_4.reset()
	dw_2.reset()
   dw_4.retrieve(ls_cust_no)
end if
end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivc_m
integer x = 1234
integer y = 368
integer width = 2469
integer height = 1400
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivc_m
integer x = 1234
integer width = 2469
integer height = 140
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivc_m
integer x = 2702
integer y = 16
integer width = 997
integer taborder = 0
end type

type gb_4 from groupbox within w_ocaroivc_m
integer x = 41
integer y = 228
integer width = 1179
integer height = 1540
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "수금번호"
end type

type dw_4 from datawindow within w_ocaroivc_m
integer x = 55
integer y = 300
integer width = 1147
integer height = 1448
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_ocaroivc_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
if this.rowcount() > 0 then
	dw_2.retrieve(this.object.vc_no[this.getrow()])
	dw_2.object.rcpt_type.background.color = 78682240
end if
end event

type st_1 from statictext within w_ocaroivc_m
integer x = 1262
integer y = 420
integer width = 393
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_salesman from statictext within w_ocaroivc_m
integer x = 1659
integer y = 420
integer width = 357
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ocaroivc_m
integer x = 2482
integer y = 420
integer width = 393
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
string text = "휴대폰"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_phone from statictext within w_ocaroivc_m
integer x = 2880
integer y = 420
integer width = 581
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_level from statictext within w_ocaroivc_m
integer x = 2245
integer y = 420
integer width = 178
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ocaroivc_m
integer x = 2048
integer y = 420
integer width = 192
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
string text = "신용"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ocaroivc_m
integer x = 2222
integer y = 164
integer width = 457
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
string text = "판매수금권한자"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_ocaroivc_m
integer x = 1385
integer y = 84
integer width = 1152
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "저장시 문자전송(신용: A,B,C,E,S )"
boolean checked = true
end type

type cbx_open from checkbox within w_ocaroivc_m
integer x = 3131
integer y = 280
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "사용불가 제외"
end type

event clicked;long   ll_row
string ls_open

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if this.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
///////////////////////////////////////////

end event

