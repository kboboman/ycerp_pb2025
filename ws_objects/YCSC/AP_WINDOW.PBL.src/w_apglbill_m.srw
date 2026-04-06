$PBExportHeader$w_apglbill_m.srw
$PBExportComments$어음관리(1999/05/25, 이인호)
forward
global type w_apglbill_m from w_inheritance
end type
type gb_7 from groupbox within w_apglbill_m
end type
type gb_6 from groupbox within w_apglbill_m
end type
type gb_5 from groupbox within w_apglbill_m
end type
type gb_4 from groupbox within w_apglbill_m
end type
type dw_3 from datawindow within w_apglbill_m
end type
type em_1 from editmask within w_apglbill_m
end type
type em_2 from editmask within w_apglbill_m
end type
type st_1 from statictext within w_apglbill_m
end type
type ddlb_1 from dropdownlistbox within w_apglbill_m
end type
type rb_1 from radiobutton within w_apglbill_m
end type
type rb_2 from radiobutton within w_apglbill_m
end type
type rb_3 from radiobutton within w_apglbill_m
end type
type cb_1 from commandbutton within w_apglbill_m
end type
type dw_4 from datawindow within w_apglbill_m
end type
type pb_1 from picturebutton within w_apglbill_m
end type
end forward

global type w_apglbill_m from w_inheritance
integer x = 23
integer y = 112
integer width = 3465
integer height = 2164
string title = "어음관리(w_apglbill_m)"
boolean resizable = false
gb_7 gb_7
gb_6 gb_6
gb_5 gb_5
gb_4 gb_4
dw_3 dw_3
em_1 em_1
em_2 em_2
st_1 st_1
ddlb_1 ddlb_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cb_1 cb_1
dw_4 dw_4
pb_1 pb_1
end type
global w_apglbill_m w_apglbill_m

type variables
string is_bill_class, is_sqlbill, is_bill, is_set_flag
string ist_bank_code, ist_branch, ist_draft
datetime ist_start_date, ist_end_date
end variables

on w_apglbill_m.create
int iCurrent
call super::create
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_4=create gb_4
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cb_1=create cb_1
this.dw_4=create dw_4
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_7
this.Control[iCurrent+2]=this.gb_6
this.Control[iCurrent+3]=this.gb_5
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.ddlb_1
this.Control[iCurrent+10]=this.rb_1
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.rb_3
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.pb_1
end on

on w_apglbill_m.destroy
call super::destroy
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cb_1)
destroy(this.dw_4)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_4.visible = false

is_sqlbill = dw_3.describe("datawindow.table.select")
em_1.text  = string(today(), 'YYYY/MM/DD')
em_2.text  = string(today(), 'YYYY/MM/DD')
ddlb_1.text   = "전체"
is_bill_class = 'A' //전체


end event

type pb_save from w_inheritance`pb_save within w_apglbill_m
integer x = 2985
integer taborder = 170
end type

event pb_save::clicked;dwitemstatus l_status
string ls_vc_no, ls_auto_no, ls_auto_no1, ls_type, ls_seq, ls_today, ls_set_flag
string ls_billdet_vcno, ls_billdet_no, ls_billdet_class, ls_supp_no, ls_billdet_bank
string ls_billdet_draft, ls_billdet_rem, ls_billdet_area
integer li_seq, li_b, li_c, li_d, li_e, li_f, li_g
decimal lr_billdet_amount, lr_amount
datetime ldt_billdet_close, ldt_billdet_start
long ll_row


if dw_1.getrow() <= 0 then
	return
elseif messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
end if

dw_1.accepttext()
dw_2.accepttext()

//detail의 마지막 row data check
ll_row = dw_2.rowcount()
if ll_row > 0 then
	l_status = dw_2.getitemstatus(ll_row, 0, primary!)
	if l_status = new! or l_status = newmodified! then
		ls_billdet_class = dw_2.object.det_class[ll_row]
		lr_billdet_amount = dw_2.object.amount[ll_row]
	
		if isnull(ls_billdet_class) or ls_billdet_class = '' then
			messagebox("확인","지불구분을 입력하세요!", information!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("det_class")
			dw_2.setfocus()
			return
		elseif isnull(lr_billdet_amount) or lr_billdet_amount = 0 then
			messagebox("확인","금액을 입력하세요!", information!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("amount")
			dw_2.setfocus()
			return
		elseif ls_billdet_class = 'B' then
			ldt_billdet_start = dw_2.object.start_date[ll_row]
			ldt_billdet_close = dw_2.object.close_date[ll_row]
			ls_billdet_no = trim(dw_2.object.billdet_no[ll_row])
			ls_billdet_bank = dw_2.object.bank_code[ll_row]
			ls_billdet_area = trim(dw_2.object.bill_area[ll_row])
			ls_billdet_draft = trim(dw_2.object.draft[ll_row])
			
			if isnull(ls_billdet_no) or ls_billdet_no = '' then
				messagebox("확인","어음번호를 입력하세요!",information!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("billdet_no")
				dw_2.setfocus()
				return
			elseif isnull(ls_billdet_draft) or ls_billdet_draft = '' then
				messagebox("확인","발행자를 입력하세요!",information!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("draft")
				dw_2.setfocus()
				return
			elseif isnull(ldt_billdet_start) then
				messagebox("확인","개설일을 입력하세요!",information!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("start_date")
				dw_2.setfocus()
				return
			elseif isnull(ldt_billdet_close) then
				messagebox("확인","만기일을 입력하세요!",information!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("close_date")
				dw_2.setfocus()
				return
			elseif isnull(ls_billdet_bank) or ls_billdet_bank = '' then
				messagebox("확인","은행을 입력하세요!",information!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("bank_code")
				dw_2.setfocus()
				return
			elseif isnull(ls_billdet_area) or ls_billdet_area = '' then
				messagebox("확인","지점을 입력하세요!",information!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("bill_area")
				dw_2.setfocus()
				return
			end if
		end if
	end if
end if

//처리번호 자동부여
ls_today = string(wf_today(), 'YYYYMMDD')
for ll_row = 1 to dw_2.rowcount()
	l_status = dw_2.getitemstatus(ll_row, 0, primary!)
	if l_status = newmodified! then
		ls_type = dw_2.object.det_class[ll_row]
		
		if ls_type = 'B' and li_b > 0 then     //어음
			li_b = li_b + 1
			ls_seq = '000' + string(li_b)
			ls_seq = RightA(ls_seq, 3)
			ls_auto_no = ls_type + ls_today + ls_seq
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no
		elseif ls_type = 'C' and li_c > 0 then //부도대
			li_c = li_c + 1
			ls_seq = '000' + string(li_c)
			ls_seq = RightA(ls_seq, 3)
			ls_auto_no = ls_type + ls_today + ls_seq
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no
		elseif ls_type = 'D' and li_d > 0 then //교환대
			li_d = li_d + 1
			ls_seq = '000' + string(li_d)
			ls_seq = RightA(ls_seq, 3)
			ls_auto_no = ls_type + ls_today + ls_seq
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no
		elseif ls_type = 'E' and li_e > 0 then //수입이자
			li_e = li_e + 1
			ls_seq = '000' + string(li_e)
			ls_seq = RightA(ls_seq, 3)
			ls_auto_no = ls_type + ls_today + ls_seq
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no
		elseif ls_type = 'F' and li_f > 0 then //물품대
			li_e = li_e + 1
			ls_seq = '000' + string(li_e)
			ls_seq = RightA(ls_seq, 3)
			ls_auto_no = ls_type + ls_today + ls_seq
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no
		elseif ls_type = 'G' and li_g > 0 then //상계
			li_e = li_e + 1
			ls_seq = '000' + string(li_e)
			ls_seq = RightA(ls_seq, 3)
			ls_auto_no = ls_type + ls_today + ls_seq
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no	
		else			
  	   	ls_auto_no = ls_type + ls_today + '%'
		
			SELECT MAX(billdet_vcno) INTO :ls_auto_no1
			  FROM apbilldet
			 WHERE billdet_vcno LIKE :ls_auto_no;
		
			if isnull(ls_auto_no1) or ls_auto_no1 = '' then
				ls_auto_no = ls_type + ls_today + '001'
				li_seq = 1
			else
				li_seq = integer(RightA(ls_auto_no1, 3))
				li_seq = li_seq + 1
				ls_seq = '000' + string(li_seq)
				ls_seq = RightA(ls_seq, 3)
				ls_auto_no = ls_type + ls_today + ls_seq
			end if
			
			dw_2.object.billdet_vcno[ll_row] = ls_auto_no
			choose case ls_type
				case 'B'
					li_b = li_seq
				case 'C'
					li_c = li_seq
				case 'I'
					li_d = li_seq
				case 'E'
					li_e = li_seq
				case 'F'
					li_f = li_seq
				case 'G'
					li_g = li_seq
			end choose
		end if
	end if
next

//지불관리에서 등록된 받을어음 정보 변경시 apoivc table update 
if ist_start_date <> dw_1.object.start_date[1] or &
   ist_end_date <> dw_1.object.close_date[1] or &
   ist_bank_code <> dw_1.object.bank_code[1] or &
	ist_branch <> dw_1.object.bill_area[1] or &
	ist_draft <> dw_1.object.draft[1] then

	ls_vc_no = dw_1.object.vc_no[1]
	UPDATE apoivc 
	   SET cheque_start = :ist_start_date,
		 	 cheque_end = :ist_end_date,
			 bank_code = :ist_bank_code,
			 branch = :ist_branch,
			 large = :ist_draft
	 WHERE vc_no = :ls_vc_no;
					
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
		return
	end if
end if

dw_2.accepttext()
if is_bill = 'R' and dw_1.object.bill_class[1] = 'P' then
else
	//상세에 어음등록시
	for ll_row = 1 to dw_2.rowcount()
		l_status = dw_2.getitemstatus(ll_row, 0, primary!)
		if l_status = newmodified! and dw_2.object.det_class[ll_row] = 'B' then
			ls_billdet_vcno = dw_2.object.billdet_vcno[ll_row]
			ls_billdet_no = dw_2.object.billdet_no[ll_row]
			ls_supp_no = dw_1.object.supp_no[1]
			ldt_billdet_close = dw_2.object.close_date[ll_row]
			ldt_billdet_start = dw_2.object.start_date[ll_row]
			ls_billdet_bank = dw_2.object.bank_code[ll_row]
			ls_billdet_area = trim(dw_2.object.bill_area[ll_row])
			lr_billdet_amount = dw_2.object.amount[ll_row]
			ls_billdet_draft = trim(dw_2.object.draft[ll_row])
			ls_billdet_rem = trim(dw_2.object.rem[ll_row])
			
			INSERT INTO apbill(vc_no, bill_no, bill_class, supp_no, close_date, start_date,
									 bank_code, bill_area, bill_amount, set_flag, draft, rem)
				  VALUES (:ls_billdet_vcno, :ls_billdet_no, 'R', :ls_supp_no,
				  			 :ldt_billdet_close, :ldt_billdet_start, :ls_billdet_bank, 
							 :ls_billdet_area, :lr_billdet_amount, 'N', :ls_billdet_draft, 
							 :ls_billdet_rem);	
			
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if
			
			
			//supp TABLE 어음미결액 UPDATE
			UPDATE supp 
			   SET bill_amount = bill_amount + :lr_billdet_amount
			 WHERE supp_no = :ls_supp_no;
		 
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if
		end if
	next
end if

//지불관리에 의해 등록된 어음의 결재여부에 따라 supp table의 어음미결액 update
ls_set_flag = dw_1.object.set_flag[1]
if is_set_flag <> ls_set_flag then
	ls_supp_no = dw_1.object.supp_no[1]
	lr_amount = dw_1.object.bill_amount[1]
	if ls_set_flag = 'Y' then
		UPDATE supp 
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE supp_no = :ls_supp_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	else
		UPDATE supp 
		   SET bill_amount = bill_amount + :lr_amount
		 WHERE supp_no = :ls_supp_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	end if
end if
		
dw_1.accepttext()
dw_2.accepttext()

if dw_2.rowcount() > 0 then
	if wf_update2(dw_1, dw_2, 'Y') = true then
		if is_bill <> dw_1.object.bill_class[1] then
			dw_1.reset()
			dw_2.reset()
			pb_retrieve.postevent(clicked!)
		end if
	end if
else
	if wf_update1(dw_1, 'Y') = true then
		if is_bill <> dw_1.object.bill_class[1] then
			dw_1.reset()
			pb_retrieve.postevent(clicked!)
		end if
	end if
end if
		
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apglbill_m
integer x = 896
integer y = 280
integer width = 2473
integer height = 584
integer taborder = 100
string dataobject = "d_apgibill_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::retrieveend;//wst_update lst_update

if this.getrow() > 0 then
	if this.object.bill_class[1] = 'E' or this.object.bill_class[1] = 'D' then //만기,부도어음
		this.object.bill_class.protect = true
		this.object.bill_class.background.color = 78682240
		
	elseif this.object.set_flag[1] = 'Y' then //어음 결재시
		this.object.bill_class.protect = true
		this.object.bill_class.background.color = 78682240
		this.object.rem.protect = true
		this.object.rem.background.color = 78682240
		dw_2.modify("datawindow.readonly = yes")
		pb_insert.enabled = false
		pb_delete.enabled = false
		
	else 		
		this.object.bill_class.protect = false
		this.object.bill_class.background.color = 1087434968	
		this.object.rem.protect = false
		this.object.rem.background.color = 1087434968
		dw_2.modify("datawindow.readonly = no")
		pb_insert.enabled = true
		pb_delete.enabled = true
	end if
	
	is_set_flag = this.object.set_flag[1]
	is_bill = this.object.bill_class[1]
	ist_start_date = this.object.start_date[1]
	ist_end_date = this.object.close_date[1]
	ist_bank_code = this.object.bank_code[1]
	ist_branch = this.object.bill_area[1]
	ist_draft = this.object.draft[1]
//	lst_update.start_date = this.object.start_date[1]
//	lst_update.end_date = this.object.close_date[1]
//	lst_update.bank_code = this.object.bank_code[1]
//	lst_update.branch = this.object.bill_area[1]
//	lst_update.draft = this.object.draft[1]
end if
	
end event

event dw_1::itemchanged;datetime ldt_null
long ll_row
integer li_count

this.accepttext()
dw_2.accepttext()
choose case dwo.name
	case 'set_flag'
		if data = 'Y' then
			this.object.set_date[1] = wf_today()
			this.object.set_user[1] = gs_userid
		else
			setnull(ldt_null)
			this.object.set_date[1] = ldt_null
			this.object.set_user[1] = ''
		end if
		
	case 'bill_class'
		choose case is_bill
			case 'R' 
				if data = 'P' then
					ll_row = dw_2.insertrow(0)
					dw_2.scrolltorow(ll_row)
					dw_2.object.det_class[ll_row] = 'B'
					dw_2.object.amount[ll_row] = this.object.bill_amount[1]
					dw_2.object.billdet_no[ll_row] = this.object.bill_no[1]
					dw_2.object.start_date[ll_row] = this.object.start_date[1]
					dw_2.object.bank_code[ll_row] = this.object.bank_code[1]
					dw_2.object.rem[ll_row] = this.object.rem[1]
					dw_2.object.draft[ll_row] = this.object.draft[1]
					dw_2.object.close_date[ll_row] = this.object.close_date[1]
					dw_2.object.bill_area[ll_row] = this.object.bill_area[1]
					dw_2.object.vc_no[ll_row] = this.object.vc_no[1]
					dw_2.object.bill_no[ll_row] = this.object.bill_no[1]
					dw_2.object.user_id[ll_row] = gs_userid
				elseif data <> 'P' then
					for ll_row = dw_2.rowcount() to 1 step -1
						dw_2.deleterow(ll_row)
					next
				end if
			case 'P' //지급어음을 수정시
				if data = 'R' then
					if LeftA(this.object.vc_no[1], 1) <> 'B' and dw_2.rowcount() <= 0 then
						messagebox("확인","지불관리에서 타회사로 지불된 어음입니다." + &
									  "~r~n받을어음로 수정하시려면 지불관리에서 지불을 취소하세요!",information!)
						return 1
					elseif dw_2.rowcount() > 0 then
						for ll_row = 1 to dw_2.rowcount() 
							if MidA(dw_2.object.billdet_vcno[ll_row], 9, 1) = 'B' then
								li_count = li_count + 1
							end if
						next
						
						if li_count > 0 then
							messagebox("확인","지불관리에서 타회사로 지불된 어음입니다." + &
									  	  "~r~n받을어음로 수정하시려면 지불관리에서 지불을 취소하세요!",information!)
							return 1
						else
							if messagebox("확인","받을어음으로 수정하시겠습니까?",question!,okcancel!,1) = 2 then
								return 1
							else
								for ll_row = dw_2.rowcount() to 1 step -1
									dw_2.deleterow(ll_row)
								next
								
								dw_1.accepttext()
								dw_2.accepttext()
								
								cb_1.postevent(clicked!)
							end if
						end if
					end if
				elseif data = 'C' then
					messagebox("확인","지급어음을 교환어음으로 수정할 수 없습니다.",information!)
					return 1
				end if
				
			case 'C' //교환어음을 수정시
				if data = 'R' then
					if dw_2.rowcount() > 0 then
						messagebox("확인","이 어음의 상세내역을 먼저 삭제하세요!",information!)
						return 1
					end if
				elseif data = 'P' then
					messagebox("확인","교환어음을 지급어음으로 수정할 수 없습니다.",information!)
					return 1
				elseif data = 'E' then
					messagebox("확인","교환어음을 만기어음으로 수정할 수 없습니다.",information!)
					return 1
				elseif data = 'D' then
					messagebox("확인","교환어음을 부도어음으로 수정할 수 없습니다.",information!)
					return 1
				end if
		end choose
end choose
end event

event dw_1::itemerror;call super::itemerror;this.object.bill_class[1] = is_bill
return 2
end event

type dw_2 from w_inheritance`dw_2 within w_apglbill_m
integer x = 901
integer y = 1060
integer width = 2482
integer height = 968
integer taborder = 110
string dataobject = "d_apglbilldet_m"
boolean border = false
end type

type st_title from w_inheritance`st_title within w_apglbill_m
string text = "매입 어음관리"
end type

type st_tips from w_inheritance`st_tips within w_apglbill_m
end type

type pb_compute from w_inheritance`pb_compute within w_apglbill_m
boolean visible = false
integer taborder = 190
end type

type pb_print_part from w_inheritance`pb_print_part within w_apglbill_m
boolean visible = false
integer taborder = 120
end type

type pb_close from w_inheritance`pb_close within w_apglbill_m
integer x = 3177
integer taborder = 180
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apglbill_m
integer x = 2793
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_set_flag, ls_where, ls_sql, ls_flag[], ls_class[]
date ld_start, ld_end

gs_glbillprn_str lst_glbill
w_repsuper w_print
st_print l_print

if is_bill_class = '' then
	messagebox("확인","어음유형을 선택하세요!",information!)
	ddlb_1.setfocus()
	return
elseif em_1.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif date(em_1.text) > date(em_2.text) then
	messagebox("확인","기간을 잘못 입력하셨습니다.",information!)
	em_1.setfocus()
	return
end if

ld_start = date(em_1.text)
ld_end = date(em_2.text)

openwithparm(w_whglbillrep_w, lst_glbill)

lst_glbill = message.powerobjectparm

if lst_glbill.flag = 'N' then
	return
end if

choose case lst_glbill.kind
	case '1'
		dw_4.dataobject = 'd_apglbill_r'
		if rb_1.checked = true then
			ls_flag[1] = 'Y'
			ls_flag[2] = 'N'
		elseif rb_2.checked = true then
			ls_flag[1] = 'Y'
		else
			ls_flag[1] = 'N'
		end if
			
		choose case is_bill_class
			case 'A'
				ls_class[1] = 'R'
				ls_class[2] = 'P'
				ls_class[3] = 'C'
				ls_class[4] = 'E'
				ls_class[5] = 'D'
			case else
				ls_class[1] = is_bill_class
		end choose
						
	case '2'
		dw_4.dataobject = 'd_apglbill_r1'
		l_print.name = 'd_apglbill_r1'
		if rb_1.checked = true then
			ls_flag[1] = 'Y'
			ls_flag[2] = 'N'
		elseif rb_2.checked = true then
			ls_flag[1] = 'Y'
		else
			ls_flag[1] = 'N'
		end if
		
		choose case is_bill_class
			case 'A'
				ls_class[1] = 'R'
				ls_class[2] = 'P'
				ls_class[3] = 'C'
				ls_class[4] = 'E'
				ls_class[5] = 'D'
			case else
				ls_class[1] = is_bill_class
		end choose
end choose

dw_4.settransobject(sqlca)
dw_4.retrieve(ls_class, ls_flag, ld_start, ld_end)
dw_4.object.c_start[1] = string(ld_start, 'YYYY/MM/DD')
dw_4.object.c_end[1] = string(ld_end, 'YYYY/MM/DD')

if dw_4.rowcount() < 1 then
	return
end if

choose case lst_glbill.kind
	case '1'
		l_print.st_datawindow = dw_4
		l_print.st_print_sheet = " 프린트용지 : B4"
		l_print.st_print_desc = " 이 프로그램은 어음현황을 출력합니다." 

		// LANDSCAPE:1, PORTRAIT:2
		// SIZE 9-A4, 12-B4

		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
      		             'Datawindow.Zoom=100'
		opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	case '2'
		l_print.st_datawindow = dw_4
		l_print.st_print_sheet = " 프린트용지 : A4"
		l_print.st_print_desc = " 이 프로그램은 어음처리내역을 출력합니다." 

		// LANDSCAPE:1, PORTRAIT:2
		// SIZE 9-A4, 12-B4

		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
      		             'Datawindow.Zoom=100'
		opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end choose
end event

type pb_cancel from w_inheritance`pb_cancel within w_apglbill_m
boolean visible = false
integer taborder = 200
end type

type pb_delete from w_inheritance`pb_delete within w_apglbill_m
integer x = 3195
integer y = 896
integer taborder = 140
end type

event pb_delete::clicked;dwitemstatus l_status
string ls_billdet_vcno, ls_forward_no, ls_billdet_no
string ls_bank_code, ls_bill_area, ls_draft, ls_rem, ls_vc_no, ls_bill_no
decimal lr_bill_amount
datetime ldt_start_date, ldt_end_date
long ll_row
boolean lb_flag = false

dw_1.accepttext() 
dw_2.accepttext()

if dw_1.rowcount() < 1 then return

if dw_1.object.bill_class[1] = 'E' or dw_1.object.set_flag[1] = 'Y' then //만기어음시
	return
elseif dw_2.rowcount() <= 0 then
	return
end if

l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
if l_status = new! or l_status = newmodified! then
	dw_2.deleterow(dw_2.getrow())
elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	choose case is_bill
		case 'P' //HEAD가 지급어음일 경우
			if MidA(dw_2.object.billdet_vcno[dw_2.getrow()], 9, 1) = 'B' then
				messagebox("확인","수금관리에서 타회사로 지불된 어음입니다." + &
							  "~r~n삭제하실 수 없습니다!",information!)
				return
			end if
			
		case 'C' //HEAD가 교환어음일 경우
			if dw_2.object.det_class[dw_2.getrow()] = 'B' then
				ls_billdet_vcno = dw_2.object.billdet_vcno[dw_2.getrow()]
				SELECT bill_class INTO :ls_forward_no
				  FROM apbill
				 WHERE vc_no = :ls_billdet_vcno;
				 
				if ls_forward_no <> 'R' then
					messagebox("확인","교환된 어음이 처리되었습니다." + &
							  "~r~n삭제할 수 없습니다!",information!)
					return
				else
					DELETE FROM apbill
					      WHERE vc_no = :ls_billdet_vcno;
				
					if sqlca.sqlcode <> 0 then
						rollback;
						messagebox("삭제","삭제도중 오류가 발생하였습니다.",exclamation!)
						return
					end if
				
					lb_flag = true
					parent.setredraw(false)
				end if
			end if

		case 'D' //부도어음일 경우
			if dw_2.object.det_class[dw_2.getrow()] = 'B' then
				if MidA(dw_2.object.billdet_vcno[dw_2.getrow()], 9, 1) = 'B' then
					messagebox("확인","수금관리에서 타회사로 지불된 어음입니다." + &
								  "~r~n삭제하실 수 없습니다!",information!)
					return
				end if
				
				ls_billdet_vcno = dw_2.object.billdet_vcno[dw_2.getrow()]
				SELECT bill_class INTO :ls_forward_no
				  FROM apbill
				 WHERE vc_no = :ls_billdet_vcno;
			 
				if ls_forward_no <> 'R' then
					messagebox("확인","부도어음 대신 받은 어음이 처리되었습니다." + &
							  "~r~n삭제할 수 없습니다!",information!)
					return
				else
					DELETE FROM apbill
					      WHERE vc_no = :ls_billdet_vcno;
					
					if sqlca.sqlcode <> 0 then
						rollback;
						messagebox("삭제","삭제도중 오류가 발생하였습니다.",exclamation!)
						return
					end if
				
					lb_flag = true
					parent.setredraw(false)
				end if
			end if
	end choose				  
	
	ls_billdet_vcno = dw_2.object.billdet_vcno[dw_2.getrow()]
	ls_billdet_no = dw_2.object.billdet_no[dw_2.getrow()]
	DELETE FROM apbilldet
			WHERE billdet_vcno = :ls_billdet_vcno;
			
	if sqlca.sqlcode <> 0 then
		rollback;
		parent.setredraw(true)
		messagebox("삭제","삭제도중 오류가 발생하였습니다.",exclamation!)
		return
	end if		
	
	dw_2.accepttext()	
	dw_2.deleterow(dw_2.getrow())
	
	if is_bill_class = 'A' then
		if lb_flag = true then
			ls_vc_no = dw_1.object.vc_no[1]
			ls_bill_no = dw_1.object.bill_no[1]
		
			ll_row = dw_3.find("vc_no = '" + ls_billdet_vcno + "' and " + &
			                   "bill_no = '" + ls_billdet_no + "'", 1, dw_3.rowcount())
			dw_3.deleterow(ll_row)
		
			ll_row = dw_3.find("vc_no = '" + ls_vc_no + "' and " + &
			                   "bill_no = '" + ls_bill_no + "'", 1, dw_3.rowcount())
			dw_3.scrolltorow(ll_row)
		
			parent.setredraw(true)
		end if
	else
		parent.setredraw(true)
	end if
end if
	
end event

type pb_insert from w_inheritance`pb_insert within w_apglbill_m
integer x = 3003
integer y = 896
integer taborder = 130
end type

event pb_insert::clicked;long ll_row
string ls_det_class, ls_bank_code, ls_bill_area, ls_billdet_no, ls_draft 
decimal lr_amount
datetime ldt_start, ldt_end

dw_1.accepttext() 
if dw_1.getrow() <= 0 then
	return
elseif dw_1.object.bill_class[1] = 'E' or dw_1.object.bill_class[1] = 'R' then //만기어음시
	return
//지불관리에서 타수로 지불된 어음인 경우 상세내역 insert no!
elseif is_bill = 'P' and LeftA(dw_1.object.bill_no[1], 1) <> 'B' and & 
	    dw_2.rowcount() <= 0 then 
	return
end if

ll_row = dw_2.insertrow(0)

if dw_2.rowcount() > 1 then
	ls_det_class = dw_2.object.det_class[ll_row - 1]
	lr_amount = dw_2.object.amount[ll_row - 1]

	if isnull(ls_det_class) or ls_det_class = '' then
		messagebox("확인","지불구분을 입력하세요!", information!)
		dw_2.deleterow(ll_row)
		dw_2.scrolltorow(ll_row - 1)
		dw_2.setcolumn("det_class")
		dw_2.setfocus()
		return
	elseif isnull(lr_amount) or lr_amount = 0 then
		messagebox("확인","금액을 입력하세요!", information!)
		dw_2.deleterow(ll_row)
		dw_2.scrolltorow(ll_row - 1)
		dw_2.setcolumn("amount")
		dw_2.setfocus()
		return
	elseif ls_det_class = 'B' then
		ldt_start = dw_2.object.start_date[ll_row - 1]
		ldt_end = dw_2.object.close_date[ll_row - 1]
		ls_billdet_no = trim(dw_2.object.billdet_no[ll_row - 1])
		ls_bank_code = dw_2.object.bank_code[ll_row - 1]
		ls_bill_area = trim(dw_2.object.bill_area[ll_row - 1])
		ls_draft = trim(dw_2.object.draft[ll_row - 1])
		
		if isnull(ls_billdet_no) or ls_billdet_no = '' then
			messagebox("확인","어음번호를 입력하세요!",information!)
			dw_2.deleterow(ll_row)
			dw_2.scrolltorow(ll_row - 1)
			dw_2.setcolumn("billdet_no")
			dw_2.setfocus()
			return
		elseif isnull(ls_draft) or ls_draft = '' then
			messagebox("확인","발행자를 입력하세요!",information!)
			dw_2.deleterow(ll_row)
			dw_2.scrolltorow(ll_row - 1)
			dw_2.setcolumn("draft")
			dw_2.setfocus()
			return
		elseif isnull(ldt_start) then
			messagebox("확인","개설일을 입력하세요!",information!)
			dw_2.deleterow(ll_row)
			dw_2.scrolltorow(ll_row - 1)
			dw_2.setcolumn("start_date")
			dw_2.setfocus()
			return
		elseif isnull(ldt_end) then
			messagebox("확인","만기일을 입력하세요!",information!)
			dw_2.deleterow(ll_row)
			dw_2.scrolltorow(ll_row - 1)
			dw_2.setcolumn("close_date")
			dw_2.setfocus()
			return
		elseif isnull(ls_bank_code) or ls_bank_code = '' then
			messagebox("확인","은행을 입력하세요!",information!)
			dw_2.deleterow(ll_row)
			dw_2.scrolltorow(ll_row - 1)
			dw_2.setcolumn("bank_code")
			dw_2.setfocus()
			return
		elseif isnull(ls_bill_area) or ls_bill_area = '' then
			messagebox("확인","지점을 입력하세요!",information!)
			dw_2.deleterow(ll_row)
			dw_2.scrolltorow(ll_row - 1)
			dw_2.setcolumn("bill_area")
			dw_2.setfocus()
			return
		end if
	end if
end if

dw_2.scrolltorow(ll_row)
dw_2.object.vc_no[ll_row] = dw_1.object.vc_no[1]
dw_2.object.bill_no[ll_row] = dw_1.object.bill_no[1]
dw_2.object.user_id[ll_row] = gs_userid

	



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_apglbill_m
integer x = 2409
integer taborder = 90
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_start_date, ls_end_date, ls_set_flag, ls_where, ls_sql

ls_start_date = em_1.text
ls_end_date = em_2.text

if is_bill_class = '' then
	messagebox("확인","어음유형을 선택하세요!",information!)
	ddlb_1.setfocus()
	return
elseif em_1.text = '' then
	messagebox("확인","마감기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","마감기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif date(em_1.text) > date(em_2.text) then
	messagebox("확인","마감기간을 잘못 입력하셨습니다.",information!)
	em_1.setfocus()
	return
end if

if rb_2.checked = true then
	ls_set_flag = 'Y'
elseif rb_3.checked = true then
	ls_set_flag = 'N'
end if

if is_bill_class = 'A' and rb_1.checked = true then //결재유무에 상관없이 전체어음
	ls_where = " where apbill.close_date between ~~'" + ls_start_date + "~~' and ~~'" + ls_end_date + "~~'"
	ls_sql = "datawindow.table.select = '" + is_sqlbill + ls_where + "'"
	dw_3.modify(ls_sql)
	dw_3.retrieve()
	
elseif is_bill_class = 'A' and rb_1.checked = false then //결재유무에 따른 전체어음
	ls_where = " where apbill.set_flag = ~~'" + ls_set_flag + "~~' and" + & 
	           " apbill.close_date between ~~'" + ls_start_date + "~~' and ~~'" + ls_end_date + "~~'"
	ls_sql = "datawindow.table.select = '" + is_sqlbill + ls_where + "'"
	dw_3.modify(ls_sql)
	dw_3.retrieve()
	
elseif is_bill_class <> 'A' and rb_1.checked = true then //결재유무에 상관없이 어음유형따라
	ls_where = " where apbill.bill_class = ~~'" + is_bill_class + "~~' and" + &
	           " apbill.close_date between ~~'" + ls_start_date + "~~' and ~~'" + ls_end_date + "~~'"
	ls_sql = "datawindow.table.select = '" + is_sqlbill + ls_where + "'"
	dw_3.modify(ls_sql)
	dw_3.retrieve()
else																		//어음유형에 따른 결재유무 
	ls_where = " where apbill.bill_class = ~~'" + is_bill_class + "~~' and" + &
	           " apbill.set_flag = ~~'" + ls_set_flag + "~~' and" + &
	           " apbill.close_date between ~~'" + ls_start_date + "~~' and ~~'" + ls_end_date + "~~'"
	ls_sql = "datawindow.table.select = '" + is_sqlbill + ls_where + "'"
	dw_3.modify(ls_sql)
	dw_3.retrieve()
	
end if


end event

type gb_3 from w_inheritance`gb_3 within w_apglbill_m
integer x = 878
integer y = 1020
integer width = 2514
integer height = 1016
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_apglbill_m
integer x = 878
integer y = 232
integer width = 2514
integer height = 660
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_apglbill_m
integer x = 2386
integer width = 1006
integer taborder = 0
end type

type gb_7 from groupbox within w_apglbill_m
integer x = 32
integer y = 704
integer width = 837
integer height = 188
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "결재여부"
end type

type gb_6 from groupbox within w_apglbill_m
integer x = 32
integer y = 232
integer width = 837
integer height = 188
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "어음유형"
end type

type gb_5 from groupbox within w_apglbill_m
integer x = 32
integer y = 892
integer width = 837
integer height = 1144
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type gb_4 from groupbox within w_apglbill_m
integer x = 32
integer y = 472
integer width = 837
integer height = 188
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "만기기간"
end type

type dw_3 from datawindow within w_apglbill_m
integer x = 46
integer y = 936
integer width = 814
integer height = 1084
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_apglbill_s"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if this.rowcount() > 0 then
	dw_1.retrieve(this.object.vc_no[this.getrow()], this.object.bill_no[this.getrow()])
	dw_2.retrieve(this.object.vc_no[this.getrow()])
end if
end event

event retrieveend;if this.rowcount() > 0 then
	dw_1.retrieve(this.object.vc_no[this.getrow()], this.object.bill_no[this.getrow()])
	dw_2.retrieve(this.object.vc_no[this.getrow()])
end if
end event

type em_1 from editmask within w_apglbill_m
integer x = 64
integer y = 544
integer width = 352
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;dw_1.reset()
if dw_2.rowcount() > 0 then
	dw_2.reset()
elseif dw_3.rowcount() > 0 then
	dw_3.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_apglbill_m
integer x = 475
integer y = 544
integer width = 352
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;dw_1.reset()
if dw_2.rowcount() > 0 then
	dw_2.reset()
elseif dw_3.rowcount() > 0 then
	dw_3.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_apglbill_m
integer x = 425
integer y = 556
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_apglbill_m
integer x = 69
integer y = 308
integer width = 763
integer height = 620
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","받을어음","지급어음","교환어음","만기어음","부도어음"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 1
		is_bill_class = 'A' //전체
	case 2
		is_bill_class = 'R' //받을어음
	case 3
		is_bill_class = 'P' //지급어음
	case 4
		is_bill_class = 'C' //교환어음
	case 5
		is_bill_class = 'E' //만기어음
	case 6  
		is_bill_class = 'D' //부도어음
end choose

dw_1.reset()
dw_2.reset()
dw_3.reset()

end event

type rb_1 from radiobutton within w_apglbill_m
integer x = 78
integer y = 788
integer width = 219
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;dw_1.reset()
if dw_2.rowcount() > 0 then
	dw_2.reset()
elseif dw_3.rowcount() > 0 then
	dw_3.reset()
end if
end event

type rb_2 from radiobutton within w_apglbill_m
integer x = 338
integer y = 788
integer width = 224
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "결재"
end type

event clicked;dw_1.reset()
if dw_2.rowcount() > 0 then
	dw_2.reset()
elseif dw_3.rowcount() > 0 then
	dw_3.reset()
end if
end event

type rb_3 from radiobutton within w_apglbill_m
integer x = 603
integer y = 788
integer width = 224
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "미결"
end type

event clicked;dw_1.reset()
if dw_2.rowcount() > 0 then
	dw_2.reset()
elseif dw_3.rowcount() > 0 then
	dw_3.reset()
end if
end event

type cb_1 from commandbutton within w_apglbill_m
boolean visible = false
integer x = 1723
integer y = 48
integer width = 137
integer height = 108
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;if wf_update2(dw_1, dw_2, 'N') = true then
	messagebox("수정","받을어음으로 수정되었습니다.",information!)
	pb_retrieve.postevent(clicked!)
else
	messagebox("수정","받을어음으로 수정도중 오류가 발생하였습니다.",exclamation!)
	dw_3.postevent(rowfocuschanged!)
end if

end event

type dw_4 from datawindow within w_apglbill_m
integer x = 1682
integer y = 48
integer width = 160
integer height = 132
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_apglbill_r"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_apglbill_m
event mousemove pbm_mousemove
integer x = 2601
integer y = 52
integer width = 187
integer height = 144
integer taborder = 161
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\ysp_2.bmp"
string disabledname = "c:\bmp\ysp_2.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"배서자",parent, li_x, li_y)

end event

event clicked;string ls_bill_no

dw_1.accepttext()
if dw_1.rowcount() < 1 then return

ls_bill_no = dw_1.object.bill_no[1]

openwithparm(w_apglbillen_m, ls_bill_no)


end event

