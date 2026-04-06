$PBExportHeader$w_apoivc_m.srw
$PBExportComments$지불관리(1999/05/24, 이인호)
forward 
global type w_apoivc_m from w_inheritance
end type
type dw_4 from datawindow within w_apoivc_m
end type
type st_1 from statictext within w_apoivc_m
end type
type dw_3 from datawindow within w_apoivc_m
end type
type em_2 from editmask within w_apoivc_m
end type
type em_1 from editmask within w_apoivc_m
end type
type st_2 from statictext within w_apoivc_m
end type
type st_vertical from u_splitbar_vertical within w_apoivc_m
end type
type st_horizontal from u_splitbar_horizontal within w_apoivc_m
end type
type st_5 from statictext within w_apoivc_m
end type
type ddlb_fld from dropdownlistbox within w_apoivc_m
end type
type ddlb_dwtitles from dropdownlistbox within w_apoivc_m
end type
type st_6 from statictext within w_apoivc_m
end type
type ddlb_op from dropdownlistbox within w_apoivc_m
end type
type sle_value from singlelineedit within w_apoivc_m
end type
type cb_1 from commandbutton within w_apoivc_m
end type
type cb_2 from commandbutton within w_apoivc_m
end type
type cb_3 from commandbutton within w_apoivc_m
end type
type cb_5 from commandbutton within w_apoivc_m
end type
end forward

global type w_apoivc_m from w_inheritance
integer x = 5
integer y = 200
integer width = 4389
integer height = 2024
string title = "지불관리(w_apoivc_m)"
dw_4 dw_4
st_1 st_1
dw_3 dw_3
em_2 em_2
em_1 em_1
st_2 st_2
st_vertical st_vertical
st_horizontal st_horizontal
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_apoivc_m w_apoivc_m

type variables
st_print i_print
st_apoivc ist_apoivc
datawindowchild idwc_cheque_no
end variables

on w_apoivc_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_1=create st_1
this.dw_3=create dw_3
this.em_2=create em_2
this.em_1=create em_1
this.st_2=create st_2
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_vertical
this.Control[iCurrent+8]=this.st_horizontal
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
end on

on w_apoivc_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_4 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_rightobject( dw_3 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_2 )
st_horizontal.of_set_bottomobject( dw_3 )
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

pb_save.enabled = false
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_1.insertrow(0)

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_4.height = newheight - dw_4.y - gb_3.x

st_vertical.x       = dw_4.x + dw_4.width
st_vertical.height  = dw_4.height

dw_2.width  = newwidth  - dw_2.x - gb_3.x

st_horizontal.y     = dw_2.y + dw_2.height
st_horizontal.width = dw_2.width

dw_3.width  = newwidth  - dw_3.x - gb_3.x
dw_3.height = newheight - dw_3.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_apoivc_m
integer x = 3077
integer y = 64
integer taborder = 70
end type

event pb_save::clicked;//
string ls_vc_no, ls_vc_no1, ls_oi_date, ls_paid_type, ls_seq, ls_supp_no, ls_vc_type, ls_month
string ls_cheque_no, ls_cheque_start, ls_cheque_end, ls_large, ls_bank_code, ls_branch
string ls_billvc_no, ls_supp_name, ls_bill_type, ls_rem
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
ls_supp_no = dw_2.object.supp_no[1]
lr_amount = dw_2.object.amount[1]
lr_bill = dw_2.object.amount[1]

setpointer(hourglass!)

if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
elseif wf_nullchk(dw_2) = false then
	return
end if

if dw_2.object.paid_type[1] = 'B' then //어음지불시 입력정보check
	ls_vc_type      = dw_2.object.vc_type[1]
	ls_cheque_no    = trim(dw_2.object.cheque_no[1])
	ldt_start       = dw_2.object.cheque_start[1]
	ldt_end         = dw_2.object.cheque_end[1]
	ls_cheque_start = string(dw_2.object.cheque_start[1])
	ls_cheque_end   = string(dw_2.object.cheque_end[1])
	ls_large        = trim(dw_2.object.large[1])
	ls_bank_code    = trim(dw_2.object.bank_code[1])
	ls_branch       = trim(dw_2.object.branch[1])
	ls_bill_type    = dw_2.object.bill_type[1]
	ls_rem          = dw_2.object.rem[1]
	
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
elseif dw_2.object.paid_type[1] = 'A' then   //예금지불시 입력정보check
	ls_bank_code = trim(dw_2.object.bank_code[1])
	ls_branch    = trim(dw_2.object.branch[1])
		
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
	messagebox("확인","지불액을 입력하세요!",information!)
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

//
l_status = dw_2.getitemstatus(1, 0, primary!)
ls_vc_no = trim(dw_2.object.vc_no[1])

if l_status = newmodified! then
	// 지불번호 자동생성
	ls_oi_date   = string(dw_2.object.oi_date[1], 'YYYYMMDD')
	ls_paid_type = dw_2.object.paid_type[1]
	ls_vc_no     = ls_oi_date + ls_paid_type + '%'
	
	SELECT max(vc_no) INTO :ls_vc_no1
	  FROM apoivc
	 WHERE vc_no LIKE :ls_vc_no;
//	messagebox("",ls_vc_no + "#" +ls_vc_no1)
	  
	if isnull(ls_vc_no1) or ls_vc_no1 = '' then
		li_seq = 1
	else
		li_seq = integer(RightA(ls_vc_no1, 3)) + 1
	end if
	
//	messagebox("",string(li_seq))
	ls_seq   = '000' + string(li_seq)
	ls_seq   = RightA(ls_seq, 3)
	ls_vc_no = ls_oi_date + ls_paid_type + ls_seq //지불번호
//	messagebox("",ls_vc_no)
	
   if dw_2.object.paid_type[1] = 'B' then //어음일 경우
		if ls_vc_type = 'P' and dw_2.object.bill_type[1] = 'T' then //타수로 지불할 경우
			// apbilldet table insert
			dw_1.accepttext()
			
			ls_supp_name = dw_1.getitemstring(dw_1.getrow(), "supp_name")
			ls_billvc_no = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "vc_no")
			INSERT INTO apbilldet(vc_no, bill_no, billdet_vcno, billdet_no, det_class, 
				                   close_date, start_date, bank_code, bill_area, amount, draft, rem, user_id)
			VALUES (:ls_billvc_no, :ls_cheque_no, :ls_vc_no, :ls_cheque_no, 'B', 
				     :ldt_end, :ldt_start, :ls_bank_code, :ls_branch, :lr_bill, :ls_large, :ls_supp_name, :gs_userid);	
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if		
			
			UPDATE apbill SET bill_class = 'P'
			 WHERE vc_no = :ls_billvc_no;
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if		 
		else		
			//apbill table insert
			INSERT INTO apbill(vc_no, bill_no, bill_class, supp_no, close_date, start_date,
			                   bank_code, bill_area, bill_amount, set_flag, draft, rem)
		   VALUES(:ls_vc_no, :ls_cheque_no, :ls_vc_type, :ls_supp_no, :ldt_end, :ldt_start,
			   	 :ls_bank_code, :ls_branch, :lr_bill, 'N', :ls_large, :ls_rem);
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if
			
			dw_2.object.cheque_no[1] = dw_2.object.a_bill_no[1]
		end if

		// supp table의 어음미지급액 update
		UPDATE supp 
		   SET bill_amount = bill_amount + :lr_amount
		 WHERE supp_no = :ls_supp_no;		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	end if
	
	ll_year  = long(string(dw_2.object.oi_date[1], 'yyyy'))
   ls_month = string(dw_2.object.oi_date[1], 'mm')
	if dw_2.object.vc_type[1] = 'R' then   //지불형태중 수금인 경우	
		lr_amount = lr_amount * -1
	else                                   //지불형태중 지불인 경우	
	end if
	
	// supp table의 미지급액 update
	UPDATE supp 
	   SET balance_amt = balance_amt + :lr_amount
	 WHERE supp_no = :ls_supp_no;
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
	dw_2.object.vc_no[1] = ls_vc_no
	
elseif lr_amount <> dw_2.getitemdecimal(1, 'amount', Primary!, TRUE) then //지급액에 변동이 있을 경우
	ls_vc_no  = dw_2.object.vc_no[1]
	lr_amount = dw_2.getitemdecimal(1, 'amount', Primary!, TRUE) - lr_amount
	
	if dw_2.object.paid_type[1] = 'B' then //어음인 경우
		// supp table의 어음미결액 update
		UPDATE supp 
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE supp_no = :ls_supp_no;
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if

		// apbill table의 어음금액 update  
		UPDATE apbill 
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE vc_no = :ls_vc_no;                    
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	end if
		
	ll_year  = long(string(dw_2.object.oi_date[1], 'yyyy'))
   ls_month = string(dw_2.object.oi_date[1], 'mm')
	if dw_2.object.vc_type[1] = 'R' then //지불형태중 수금인 경우	
	else                                 //수금형태중 지불인 경우	
		lr_amount = lr_amount * -1
	end if
	
	// supp table의 미지급액 update
	UPDATE supp 
	   SET balance_amt = balance_amt + :lr_amount
	 WHERE supp_no = :ls_supp_no;
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","supp저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if		
end if

dw_2.accepttext()
if WF_Update1(dw_2, 'Y') = true then
	dw_2.reset()
	dw_4.reset()
	dw_4.retrieve(ls_supp_no)
end if
	
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apoivc_m
integer x = 1353
integer y = 52
integer width = 864
integer height = 92
integer taborder = 20
string dataobject = "d_apinspdsupp_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//
datawindowchild ldwc_supp

//
choose case dwo.name
	case 'supp_no'
		this.getchild("supp_no", ldwc_supp)
		ldwc_supp.settransobject(sqlca)
		ist_apoivc.curr_code = ldwc_supp.getitemstring(ldwc_supp.getrow(), "currency_type")
end choose


string ls_supp_no
date ld_sdate, ld_edate


ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	

if em_1.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if

dw_1.accepttext()
ls_supp_no = dw_1.getitemstring(dw_1.getrow(), "supp_no")

if isnull(ls_supp_no) or ls_supp_no = '' then
	messagebox("확인","구매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_4.reset()
dw_2.reset()
dw_4.retrieve(ls_supp_no, ld_sdate, ld_edate)

end event

type st_title from w_inheritance`st_title within w_apoivc_m
integer y = 24
integer width = 887
integer height = 140
string text = "지불관리"
end type

type st_tips from w_inheritance`st_tips within w_apoivc_m
end type

type pb_compute from w_inheritance`pb_compute within w_apoivc_m
boolean visible = false
integer x = 837
integer y = 72
integer width = 160
integer height = 116
integer taborder = 120
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_apoivc_m
boolean visible = false
integer x = 2811
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_apoivc_m
integer x = 3269
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoivc_m
integer x = 2885
integer y = 64
integer taborder = 60
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

type pb_cancel from w_inheritance`pb_cancel within w_apoivc_m
integer x = 2697
integer y = 64
integer taborder = 130
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_cancel::clicked;long ll_year
string ls_month, ls_supp_no, ls_vc_no, ls_bevc_no
decimal lr_amount

if dw_2.getrow() < 1 then return

if (dw_2.object.set_flag[1] = 'Y' AND dw_2.object.paid_type[1] <> 'P' ) then
	messagebox("확인","어음이 이미 결재되어 취소하실수 없습니다!",information!) 
	return
elseif messagebox("취소","이 지불내역을 취소하시겠습니까?",question!,okcancel!,2) = 2 then
	return
end if

dw_4.triggerevent(rowfocuschanged!)

ls_vc_no = dw_2.object.vc_no[1]
ls_supp_no = dw_2.object.supp_no[1]
lr_amount = dw_2.object.amount[1]

if dw_2.object.paid_type[1] = 'B' then //어음일 경우
	//supp table의 어음미결액 update
	UPDATE supp 
	   SET bill_amount = bill_amount - :lr_amount
	 WHERE supp_no = :ls_supp_no;
	  
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
	
	if dw_2.object.vc_type[1] = 'P' and dw_2.object.bill_type[1] = 'T' then
		SELECT vc_no INTO :ls_bevc_no
		  FROM apbilldet
		 WHERE billdet_vcno = :ls_vc_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
		
		//타수된 어음을 지급에서 받을어음으로 update
		UPDATE apbill SET bill_class = 'R'
		 WHERE vc_no = :ls_bevc_no;
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
		
		//타수에 대한 어음상세내역 삭제
		DELETE FROM apbilldet
				WHERE billdet_vcno = :ls_vc_no;
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	else
		select vc_no into :ls_vc_no from apbilldet WHERE vc_no = :ls_vc_no;
		if sqlca.sqlcode <> 100 then
			rollback;
			messagebox("저장","어음처리내역이 존재합니다!",exclamation!)
			return
		end if

   	DELETE FROM apbill
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
if dw_2.object.vc_type[1] = 'R' then //지불형태중 수금인 경우	
	//supp table의 미지급금액 update
	UPDATE supp 
	   SET balance_amt = balance_amt + :lr_amount
	 WHERE supp_no = :ls_supp_no;
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
else                                 //지불형태중 지불인 경우	
	//supp table의 미지급액 update
	UPDATE supp 
	   SET balance_amt = balance_amt - :lr_amount 
	 WHERE supp_no = :ls_supp_no;
	  
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
	
end if

dw_2.object.delete_key[1] = 'Y'
dw_2.accepttext()
if wf_update1(dw_2, 'N') = true then
	messagebox("취소","지급내역을 취소하였습니다.",information!)
	dw_2.reset()
	dw_4.reset()
	dw_4.retrieve(ls_supp_no)
end if
end event

type pb_delete from w_inheritance`pb_delete within w_apoivc_m
boolean visible = false
integer x = 1856
integer y = 60
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_apoivc_m
integer x = 2505
integer y = 64
integer taborder = 50
end type

event pb_insert::clicked;//
string ls_supp_no

dw_1.accepttext()

ls_supp_no = dw_1.object.supp_no[1] 
if isnull(ls_supp_no) or ls_supp_no = '' then
	MessageBox("확인","구매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	RETURN
end if

dw_2.reset()
dw_2.insertrow(0)

dw_2.object.supp_no[1]   = ls_supp_no
dw_2.object.paid_type.background.color = 1087434968
dw_2.object.curr_code[1] = ist_apoivc.curr_code

SELECT balance_amt, bill_amount, buyer 
  INTO :ist_apoivc.balance_amt, :ist_apoivc.bill_amount, :ist_apoivc.saleman 
  FROM supp
 WHERE supp_no = :ls_supp_no;
 
//if dw_3.getrow() < 1 then 
//	MessageBox("확인","매입자료를 조회후 추가 하십시요")
//	RETURN
//end if
                                                                        
dw_2.object.amount[1] = dw_3.object.amount[dw_3.getrow()] + dw_3.object.apoiinv_apoiinv_rate[dw_3.getrow()]

dw_2.object.balance_amt[1] = ist_apoivc.balance_amt
dw_2.object.bill_amount[1] = ist_apoivc.bill_amount
dw_2.object.salesman[1]    = ist_apoivc.saleman
dw_2.object.oi_date[1]     = wf_today()

pb_cancel.enabled = false

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_apoivc_m
integer x = 2313
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp_no
date ld_sdate, ld_edate


ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	

if em_1.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if

dw_1.accepttext()
ls_supp_no = dw_1.getitemstring(dw_1.getrow(), "supp_no")

if isnull(ls_supp_no) or ls_supp_no = '' then
	messagebox("확인","구매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

dw_2.reset()
dw_3.retrieve(ls_supp_no, ld_sdate, ld_edate)

end event

type gb_3 from w_inheritance`gb_3 within w_apoivc_m
integer x = 32
integer y = 244
integer width = 4274
integer height = 188
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_apoivc_m
integer x = 1015
integer y = 16
integer width = 1234
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_apoivc_m
integer x = 2277
integer y = 16
integer width = 1225
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_apoivc_m
integer x = 1838
integer y = 452
integer width = 2464
integer height = 528
integer taborder = 40
string dataobject = "d_apoivc_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::retrieveend;pb_cancel.enabled = true
end event

event dw_2::itemchanged;datetime ldt_oi_date, ldt_null
string ls_curr_code
decimal lr_rev_rate

this.accepttext()
choose case dwo.name
	case 'oi_date'
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date = this.object.oi_date[1]
			ls_curr_code = this.object.curr_code[1]
						
			SELECT rev_rate INTO :lr_rev_rate
			  FROM currency
			 WHERE curr_code = :ls_curr_code
			 	AND curr_date = :ldt_oi_date;
					  
			if isnull(lr_rev_rate) or lr_rev_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_rev_rate
			end if
		end if
	case 'cheque_no'
		if this.object.vc_type[1] = 'P' and this.object.paid_type[1] = 'B' and &
		   this.object.bill_type[1] = 'T' then
			
			this.getchild("cheque_no", idwc_cheque_no)
			idwc_cheque_no.settransobject(sqlca)
			this.object.amount[1] = idwc_cheque_no.getitemdecimal(idwc_cheque_no.getrow(), "bill_amount")
			this.object.cheque_start[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "start_date")
			this.object.cheque_end[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "close_date")
			this.object.large[1] = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "draft")
			this.object.bank_code[1] = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bank_code")
			this.object.branch[1] = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bill_area")
		end if
		if this.object.paid_type[1] = 'P' then
			this.getchild("cheque_no", idwc_cheque_no)
			idwc_cheque_no.settransobject(sqlca)
			this.object.cheque_start[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "start_date")
			this.object.cheque_end[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "close_date")
			this.object.large[1] = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "draft")
			this.object.bank_code[1] = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bank_code")
			this.object.branch[1] = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "bill_area")
		end if
		
	case 'bill_type'
		setnull(ldt_null)
		this.object.amount[1] = 0
		this.object.cheque_no[1] = ''
		this.object.a_bill_no[1] = ''
		this.object.cheque_start[1] = ldt_null
		this.object.cheque_end[1] = ldt_null
		this.object.large[1] = ''
		this.object.bank_code[1] = ''
		this.object.branch[1] = ''
	case 'a_bill_no'
		this.object.cheque_no[1] = this.object.a_bill_no[1]
end choose
end event

type dw_4 from datawindow within w_apoivc_m
integer x = 27
integer y = 452
integer width = 1755
integer height = 1440
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_apoivc_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.rowcount() > 0 then
	dw_2.retrieve(this.object.vc_no[this.getrow()])
	dw_2.object.paid_type.background.color = 78682240
end if
end event

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_1 from statictext within w_apoivc_m
integer x = 1047
integer y = 56
integer width = 311
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

type dw_3 from datawindow within w_apoivc_m
integer x = 1838
integer y = 1032
integer width = 2464
integer height = 860
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_apoivc_m2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_2 from editmask within w_apoivc_m
integer x = 1787
integer y = 140
integer width = 416
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
alignment alignment = center!
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

type em_1 from editmask within w_apoivc_m
integer x = 1362
integer y = 140
integer width = 416
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
alignment alignment = center!
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

type st_2 from statictext within w_apoivc_m
integer x = 1047
integer y = 140
integer width = 311
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
string text = "지불일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_apoivc_m
integer x = 1797
integer y = 452
integer height = 1440
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = dw_2.x
st_horizontal.width = dw_2.width 
end event

type st_horizontal from u_splitbar_horizontal within w_apoivc_m
integer x = 1838
integer y = 996
integer width = 2464
boolean bringtotop = true
end type

type st_5 from statictext within w_apoivc_m
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_apoivc_m
integer x = 270
integer y = 308
integer width = 480
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_apoivc_m
integer x = 311
integer y = 320
integer width = 311
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

type st_6 from statictext within w_apoivc_m
integer x = 768
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

type ddlb_op from dropdownlistbox within w_apoivc_m
integer x = 937
integer y = 308
integer width = 297
integer height = 512
integer taborder = 40
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

type sle_value from singlelineedit within w_apoivc_m
integer x = 1257
integer y = 316
integer width = 494
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
end type

type cb_1 from commandbutton within w_apoivc_m
integer x = 1765
integer y = 316
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_apoivc_m
integer x = 1929
integer y = 316
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if
//
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_apoivc_m
integer x = 2094
integer y = 316
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_apoivc_m
integer x = 2258
integer y = 316
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

