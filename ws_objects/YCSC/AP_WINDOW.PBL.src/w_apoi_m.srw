$PBExportHeader$w_apoi_m.srw
$PBExportComments$자재매입관리(1999/05/21, 이인호)
forward
global type w_apoi_m from w_inheritance
end type
type gb_7 from groupbox within w_apoi_m
end type
type gb_6 from groupbox within w_apoi_m
end type
type dw_4 from datawindow within w_apoi_m
end type
type em_1 from editmask within w_apoi_m
end type
type em_2 from editmask within w_apoi_m
end type
type st_1 from statictext within w_apoi_m
end type
type dw_5 from datawindow within w_apoi_m
end type
type dw_6 from datawindow within w_apoi_m
end type
type ddlb_1 from dropdownlistbox within w_apoi_m
end type
type mle_1 from multilineedit within w_apoi_m
end type
type dw_area from datawindow within w_apoi_m
end type
type ddlb_2 from dropdownlistbox within w_apoi_m
end type
type gb_4 from groupbox within w_apoi_m
end type
type gb_5 from groupbox within w_apoi_m
end type
end forward

global type w_apoi_m from w_inheritance
integer x = 37
integer y = 136
integer width = 3598
integer height = 2160
string title = "매입관리(w_apoi_m)"
boolean resizable = false
gb_7 gb_7
gb_6 gb_6
dw_4 dw_4
em_1 em_1
em_2 em_2
st_1 st_1
dw_5 dw_5
dw_6 dw_6
ddlb_1 ddlb_1
mle_1 mle_1
dw_area dw_area
ddlb_2 ddlb_2
gb_4 gb_4
gb_5 gb_5
end type
global w_apoi_m w_apoi_m

type variables
datawindowchild idwc_supp
string is_pur_flag, is_round ='N', is_flag
gs_codere_str  ist_code
end variables

forward prototypes
public subroutine wf_calc ()
end prototypes

public subroutine wf_calc ();long ll_row

dw_2.accepttext()
dw_4.accepttext()
DW_4.GROUPCALC()
ll_row = dw_4.rowcount()
if ll_row < 1 then return

dw_2.setredraw(false)
dw_2.object.apoiinv_cash[1] = truncate(dw_4.object.samt[ll_row], 0 )
if dw_2.object.dc_rate[1] > 0 then
	dw_2.object.dc[1] = truncate(dw_2.object.apoiinv_cash[1] * (dw_2.object.dc_rate[1] / 100), 0)
end if
dw_2.accepttext()
dw_2.object.apoiinv_rate[1] = truncate(dw_2.object.amount[1] * 0.1, 0)
dw_2.setredraw(true)

end subroutine

on w_apoi_m.create
int iCurrent
call super::create
this.gb_7=create gb_7
this.gb_6=create gb_6
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.ddlb_1=create ddlb_1
this.mle_1=create mle_1
this.dw_area=create dw_area
this.ddlb_2=create ddlb_2
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_7
this.Control[iCurrent+2]=this.gb_6
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.ddlb_1
this.Control[iCurrent+10]=this.mle_1
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.ddlb_2
this.Control[iCurrent+13]=this.gb_4
this.Control[iCurrent+14]=this.gb_5
end on

on w_apoi_m.destroy
call super::destroy
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.ddlb_1)
destroy(this.mle_1)
destroy(this.dw_area)
destroy(this.ddlb_2)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// apoiinv_open_close = 'O': 매입 등록, 'S': 매입 확정, 'T': 지불등록 , 'C' :마감
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_area.settransobject(sqlca)

dw_5.visible = false
dw_6.visible = false
pb_compute.enabled = false

dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.insertrow(0)
dw_1.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(sqlca)

em_1.text   = string(today(), 'YYYY/MM/DD')
em_2.text   = string(today(), 'YYYY/MM/DD')
is_pur_flag = 'N'
ddlb_1.text = "내수"

//if gs_userid = 'root' or gs_userid = '1999010s' then
//else
//	dw_area.visible = false
//end if

if GF_PERMISSION("매입관리", gs_userid) = "Y" then
else
	MessageBox("확인","매입관리 권한이 존재하지 않습니다.")
	close(this)
end if

end event

event resize;call super::resize;//
dw_4.width  = this.width  - 73
dw_4.height = this.height - 856

end event

type pb_save from w_inheritance`pb_save within w_apoi_m
integer x = 3145
integer taborder = 90
end type

event pb_save::clicked;long    ll_row, ll_row1, ll_find, ll_year
integer li_seq, li_count, li_seq_no
string  ls_insp_no, ls_insp_no1, ls_supp_no,  ls_month, ls_apoi_date
string  ls_area,    ls_apoi_no,  ls_apoi_no1, ls_seq
decimal lr_total

if dw_2.getrow()    < 1     then return
if wf_nullchk(dw_2) = false then	return

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
else
	for ll_row = 1 to dw_4.rowcount()
		if dw_4.object.pick[ll_row] = 'Y' then
			li_count = li_count + 1
		end if
	next
	if li_count <= 0 then
		MessageBox("확인","선정된 물품이 없습니다!",information!)
		return
	end if
end if

setpointer(hourglass!)
dw_2.accepttext()
dw_4.accepttext()

// 매입코드 자동 부여
ls_area      = MidA(dw_2.object.inv_area[1], 1, 1)
ls_apoi_date = string(dw_2.object.oi_date[1], "yyyymm")
ls_apoi_no1  = ls_area + 'A' + ls_apoi_date + '-' + '%'

SELECT MAX(apoiinv_no) INTO :ls_apoi_no FROM apoiinv WHERE apoiinv_no LIKE :ls_apoi_no1;			
if isnull(ls_apoi_no) or ls_apoi_no = '' then
	ls_apoi_no1 = ls_area + 'A' + ls_apoi_date + '-' + '001'
else
	li_seq_no   = integer(MidA(ls_apoi_no, 10, 3))
	li_seq_no   = li_seq_no + 1
	ls_seq      = '00' + string(li_seq_no)
	ls_apoi_no1 = LeftA(ls_apoi_no1, 9) + RightA(ls_seq, 3)
end if

dw_2.object.apoiinv_no[1] = ls_apoi_no1
ls_insp_no1 = 'XXX'
dw_5.reset()
if dw_4.rowcount() > 0 then
	for ll_row = 1 to dw_4.rowcount() 
		if dw_4.object.pick[ll_row] = 'Y' then
			//선매입수량
			dw_4.object.apoi_qty[ll_row]    = dw_4.object.apoi_qty[ll_row] + dw_4.object.a_qty[ll_row]
			
			//자재매입관리 detail 			
			ll_row1 = dw_5.insertrow(0)
			dw_5.object.apoiinv_no[ll_row1] = ls_apoi_no1
			
			li_seq = li_seq + 1
			dw_5.object.seq_no[ll_row1]     = li_seq
			ls_insp_no = dw_4.object.insp_no[ll_row] 
			dw_5.object.insp_no[ll_row1]    = ls_insp_no
			
			dw_5.object.oi_no[ll_row1]      = dw_4.object.oi_no[ll_row]
			dw_5.object.item_no[ll_row1]    = dw_4.object.item_no[ll_row]
			dw_5.object.qa[ll_row1]         = dw_4.object.qa[ll_row]
			dw_5.object.uom[ll_row1]        = dw_4.object.uom[ll_row]
			dw_5.object.rcpt_qty[ll_row1]   = dw_4.object.a_qty[ll_row] 
			dw_5.object.comqty[ll_row1]     = dw_4.object.comqty[ll_row] 
			dw_5.object.price[ll_row1]      = dw_4.object.a_price[ll_row]
			dw_5.object.rate_cash[ll_row1]  = dw_4.object.amt[ll_row] * 0.1
			dw_5.object.ori_amount[ll_row1] = dw_4.object.amt[ll_row]
			dw_5.object.pur_no[ll_row1]     = dw_4.object.pur_no[ll_row]
//			dw_5.object.dc_rate[ll_row1]    = dw_4.object.c_an[ll_row]
			dw_5.object.rem[ll_row1]        = dw_4.object.rem[ll_row]
			
			//insp table update
//			if li_seq = 1 then
//				ls_insp_no = dw_4.object.insp_no[ll_row]
//				ll_find    = dw_6.find("insp_no = '" + trim(ls_insp_no) + "'",1, dw_6.rowcount())
//				dw_6.object.invoice_print[ll_find] = 'Y'
//				dw_6.object.insp_flag[ll_find]     = dw_4.object.insp_flag[ll_row]
//			else
			if ls_insp_no1 <> ls_insp_no then
				ls_insp_no1 = ls_insp_no
				ll_find     = dw_6.find("insp_no = '" + trim(ls_insp_no) + "'",1, dw_6.rowcount())
				dw_6.object.invoice_print[ll_find] = 'Y'
				dw_6.object.insp_flag[ll_find]     = dw_4.object.insp_flag[ll_row]
			end if
		end if
	next
end if

//if dw_7.rowcount() > 0 then  //운송비가 적용된 입고번호에 대해 insp table update
//	for ll_row = 1 to dw_7.rowcount()
//		if dw_7.object.pick[ll_row] = 'Y' then
//			dw_7.object.insp_inv_no[ll_row] = ls_apoi_no1
//		end if
//	next
//end if

//lr_total   = dw_2.object.c_vat[1]
//ls_supp_no = dw_1.object.supp_no[dw_1.getrow()]
//if lr_total <> 0 then
//	//에누리금액만큼 supp TABLE의 미지급금액 차감
//	UPDATE supp SET balance_amt = balance_amt - :lr_total	 WHERE supp_no = :ls_supp_no;
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		MessageBox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if		
//end if

dw_2.accepttext()
dw_4.accepttext()
dw_5.accepttext()
dw_6.accepttext()

//if wf_update5(dw_2,dw_4,dw_5,dw_6,dw_7,'N') = true then
if wf_update4(dw_2,dw_4,dw_5,dw_6,'N') = true then
	MessageBox("확인", "생성된 매입번호는 " + ls_apoi_no1 + " 입니다.")
	mle_1.text = trim(mle_1.text) +  ls_apoi_no1
	dw_2.reset()
	dw_4.reset()
	dw_5.reset()
	dw_6.reset()
else
	MessageBox("저장오류","저장중 오류가 발생하였습니다!",exclamation!)
	return
end if
	
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apoi_m
integer x = 50
integer y = 448
integer width = 873
integer height = 96
integer taborder = 30
string dataobject = "d_apsupp_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;dw_2.reset()
if dw_4.rowcount() > 0 then
	dw_4.reset()
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_2 from w_inheritance`dw_2 within w_apoi_m
integer x = 960
integer y = 260
integer width = 2574
integer height = 468
integer taborder = 60
string dataobject = "d_apoi_m"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;long ll_row, ll_rate, ll_price, ll_dc, ll_row1, ll_data
decimal lr_amount, lr_vat, lr_rev_rate, lr_amt, lr_dc
datetime ldt_oi_date
string ls_curr_code, ls_data

this.accepttext()
choose case dwo.name
	case 'oi_date'
//		if this.object.curr_code[1] <> 'WON' then
//			ldt_oi_date = this.object.oi_date[1]
//			ls_curr_code = this.object.curr_code[1]
//						
//			SELECT rev_rate INTO :lr_rev_rate
//			  FROM currency
//			 WHERE curr_code = :ls_curr_code
//			 	AND curr_date = :ldt_oi_date;
//					  
//			if isnull(lr_rev_rate) or lr_rev_rate = 0 then
//				this.object.gl_cur_rate[1] = 1
//			else
//				this.object.gl_cur_rate[1] = lr_rev_rate
//			end if
//			
//			dw_2.object.gl_cur_rate.tabsequence = 1
//			dw_2.object.gl_cur_rate.background.color = 1087434968
//		end if
		
	case 'c_apoi_chk'
		ls_data = data
		IF ls_data = 'Y' then
			dw_4.setredraw(false)
			for ll_row1 = 1 to dw_4.rowcount()
				dw_4.object.a_qty[ll_row1] = dw_4.object.rcpt_qty[ll_row1] - dw_4.object.apoi_qty[ll_row1]
				dw_4.object.a_price[ll_row1] = dw_4.object.price[ll_row1]
				dw_4.object.pick[ll_row1] = 'Y'
				if is_round = "Y" then
					dw_4.object.amt[ll_row1] = round(truncate(dw_4.object.a_price[ll_row1] * dw_4.object.comqty[ll_row1], 1), 0)
				else
					dw_4.object.amt[ll_row1] = truncate(dw_4.object.a_price[ll_row1] * dw_4.object.comqty[ll_row1], 0)
				end if
			next
			dw_4.setredraw(true)
		else
//         dw_2.object.c_rate[1] = 0
		end if
	wf_calc()	
end choose
RETURN 0
		
end event

event dw_2::itemerror;

return 2
end event

event dw_2::editchanged;this.accepttext()
RETURN 0
end event

type st_title from w_inheritance`st_title within w_apoi_m
integer x = 37
integer width = 855
string text = "매입관리"
end type

type st_tips from w_inheritance`st_tips within w_apoi_m
end type

type pb_compute from w_inheritance`pb_compute within w_apoi_m
integer x = 2953
integer taborder = 140
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"운송비",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_apoi_m
boolean visible = false
integer x = 1915
integer taborder = 120
end type

type pb_close from w_inheritance`pb_close within w_apoi_m
integer x = 3337
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoi_m
boolean visible = false
integer x = 2953
integer taborder = 80
end type

type pb_cancel from w_inheritance`pb_cancel within w_apoi_m
boolean visible = false
integer x = 2427
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_apoi_m
boolean visible = false
integer x = 2738
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_apoi_m
integer x = 2761
integer taborder = 70
end type

event pb_insert::clicked;string ls_supp_no, ls_register_no, ls_curr_code, ls_area
date ld_sdate, ld_edate

ls_supp_no = dw_1.getitemstring(dw_1.getrow(), "supp_no")

if isnull(is_pur_flag) or is_pur_flag = '' then
	messagebox("확인","매입유형을 선택하세요!",information!)
	ddlb_1.setfocus()
	return
end if
if isnull(is_flag) or is_flag = '' then
	messagebox("확인","입고유형을 선택하세요!",information!)
	ddlb_2.setfocus()
	return
end if
if isnull(ls_supp_no) or ls_supp_no = '' then
	messagebox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

ls_register_no = idwc_supp.getitemstring(idwc_supp.getrow(), "register_no")
ls_curr_code = idwc_supp.getitemstring(idwc_supp.getrow(), "currency_type")
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)
select round into :is_round from supp
 where supp_no = :ls_supp_no;

 if isnull(is_round) or trim(is_round) = '' then is_round = 'N' // 'N':원단위미만 절사, 'Y':원단위 반올림
 
//if rb_1.checked = true then
if em_1.text = '' then
	messagebox("확인","입고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","입고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","입고기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if

dw_2.reset()
dw_4.reset()

dw_2.setredraw(false)
dw_2.insertrow(0)
dw_2.object.supp_no[1] = ls_supp_no
dw_2.object.pur_flag[1] = is_flag
dw_2.object.register_no[1] = trim(ls_register_no)
dw_2.object.curr_code[1] = ls_curr_code
dw_2.object.inv_type[1] = 'Y'
dw_2.object.sys_date[1] = wf_today()
dw_2.object.oi_date[1] = datetime(date(em_2.text))
dw_2.object.login_id[1] = gs_userid
dw_2.object.inv_area[1] = dw_area.object.area[1]
dw_2.object.c_vat_flag[1] = is_pur_flag	
		
dw_4.retrieve(ls_supp_no, ld_sdate, ld_edate, LeftA(dw_area.object.area[1],1), is_flag)
dw_6.retrieve(ls_supp_no, ld_sdate, ld_edate,  LeftA(dw_area.object.area[1],1), is_flag)
dw_2.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_apoi_m
boolean visible = false
integer x = 2313
integer width = 251
integer taborder = 170
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "물품그룹"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_retrieve::clicked;////openwithparm(w_cdgroup_m)
//open(w_cdgroup_m)
end event

type gb_3 from w_inheritance`gb_3 within w_apoi_m
integer x = 951
integer width = 2601
integer height = 504
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_apoi_m
integer x = 27
integer y = 388
integer width = 919
integer height = 168
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
string text = "구매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_apoi_m
integer x = 2734
integer y = 8
integer width = 814
integer taborder = 0
end type

type gb_7 from groupbox within w_apoi_m
integer x = 27
integer y = 224
integer width = 919
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "매입유형"
end type

type gb_6 from groupbox within w_apoi_m
integer x = 27
integer y = 560
integer width = 919
integer height = 172
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "입고기간"
end type

type dw_4 from datawindow within w_apoi_m
event ue_calc pbm_custom01
integer x = 27
integer y = 748
integer width = 3525
integer height = 1304
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_apoi_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_calc;wf_calc()	

end event

event itemchanged;long ll_row, ll_cnt
string ls_inspno

ll_row = this.getrow()

this.accepttext()
dw_2.accepttext()
choose case dwo.name
	case 'insp_flag'
      ls_inspno = trim(this.object.insp_no[ll_row])
		for ll_cnt = 1 to this.rowcount()
			if ls_inspno = this.object.insp_no[ll_cnt] then
				this.object.insp_flag[ll_cnt] = data
			end if
		next
		
	case 'pick'
		if data = 'Y' then
			this.object.a_qty[ll_row] = this.object.rcpt_qty[ll_row] - this.object.apoi_qty[ll_row]
			this.object.a_price[ll_row] = this.object.price[ll_row]
			if is_round = "Y" then
				this.object.amt[ll_row] = round(truncate(this.object.a_price[ll_row] * this.object.comqty[ll_row], 1), 0)
			else
				this.object.amt[ll_row] = truncate(this.object.a_price[ll_row] * this.object.comqty[ll_row], 0)
			end if
		else
			this.object.a_qty[ll_row] = 0
			this.object.a_price[ll_row] = 0 
			this.object.amt[ll_row] = 0
		end if
		
	case 'comqty', 'a_price'
			if is_round = "Y" then
				this.object.amt[ll_row] = round(truncate(this.object.a_price[ll_row] * this.object.comqty[ll_row], 1), 0)
			else
				this.object.amt[ll_row] = truncate(this.object.a_price[ll_row] * this.object.comqty[ll_row], 0)
			end if
	case 'a_qty'
		//입고수량과 매입수량 비교
		if this.object.a_qty[ll_row] > this.object.rcpt_qty[ll_row] - this.object.apoi_qty[ll_row] then
			messagebox("확인","매입수량이 입고 수량을 초과하였습니다!",exclamation!)
			return 1
		end if
		
end choose
this.postevent('ue_calc')
end event

event itemerror;long ll_row
decimal lr_amount, lr_vat

ll_row = this.getrow()
this.object.a_qty[ll_row] = this.object.rcpt_qty[ll_row] - this.object.apoi_qty[ll_row]

this.triggerevent('ue_calc')
return 2
end event

event losefocus;this.accepttext()
end event

type em_1 from editmask within w_apoi_m
integer x = 46
integer y = 620
integer width = 402
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

type em_2 from editmask within w_apoi_m
integer x = 503
integer y = 620
integer width = 421
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
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

type st_1 from statictext within w_apoi_m
integer x = 453
integer y = 636
integer width = 46
integer height = 60
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

type dw_5 from datawindow within w_apoi_m
integer x = 727
integer y = 20
integer width = 82
integer height = 72
boolean bringtotop = true
string dataobject = "d_apoi_h"
boolean livescroll = true
end type

type dw_6 from datawindow within w_apoi_m
integer x = 814
integer y = 20
integer width = 82
integer height = 72
boolean bringtotop = true
string dataobject = "d_apoi_h1"
boolean livescroll = true
end type

type ddlb_1 from dropdownlistbox within w_apoi_m
integer x = 55
integer y = 280
integer width = 334
integer height = 288
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
string item[] = {"내수","수입"}
end type

event selectionchanged;choose case index
	case 1
		is_pur_flag = 'N'
	case 2
		is_pur_flag = 'Y'
end choose

if dw_2.rowcount() > 0 then
	dw_2.reset()
	dw_4.reset()
end if
end event

type mle_1 from multilineedit within w_apoi_m
integer x = 1426
integer y = 60
integer width = 613
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_area from datawindow within w_apoi_m
integer x = 2139
integer y = 84
integer width = 539
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type ddlb_2 from dropdownlistbox within w_apoi_m
integer x = 439
integer y = 276
integer width = 462
integer height = 436
integer taborder = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"상품","원자재","부자재","외주가공"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_flag = "S"
	CASE 2
		is_flag = "W"
	CASE 3
		is_flag = "B"
	CASE 4
		is_flag = "Y"
END CHOOSE

end event

type gb_4 from groupbox within w_apoi_m
integer x = 2098
integer y = 8
integer width = 613
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사업장"
end type

type gb_5 from groupbox within w_apoi_m
integer x = 1390
integer y = 8
integer width = 677
integer height = 212
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "생성된 매입번호"
end type

