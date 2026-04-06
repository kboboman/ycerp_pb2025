$PBExportHeader$w_orsalesaleman_r_2.srw
$PBExportComments$영업사원별 수주현황(1998/05/15, 정재수)
forward
global type w_orsalesaleman_r_2 from w_inheritance
end type
type st_1 from statictext within w_orsalesaleman_r_2
end type
type em_1 from editmask within w_orsalesaleman_r_2
end type
type em_2 from editmask within w_orsalesaleman_r_2
end type
type st_3 from statictext within w_orsalesaleman_r_2
end type
type st_2 from statictext within w_orsalesaleman_r_2
end type
type ddlb_1 from dropdownlistbox within w_orsalesaleman_r_2
end type
type dw_3 from datawindow within w_orsalesaleman_r_2
end type
type dw_4 from datawindow within w_orsalesaleman_r_2
end type
type st_4 from statictext within w_orsalesaleman_r_2
end type
type cbx_1 from checkbox within w_orsalesaleman_r_2
end type
type st_5 from statictext within w_orsalesaleman_r_2
end type
type st_6 from statictext within w_orsalesaleman_r_2
end type
type st_8 from statictext within w_orsalesaleman_r_2
end type
type ddlb_fld from dropdownlistbox within w_orsalesaleman_r_2
end type
type st_9 from statictext within w_orsalesaleman_r_2
end type
type ddlb_op from dropdownlistbox within w_orsalesaleman_r_2
end type
type sle_value from singlelineedit within w_orsalesaleman_r_2
end type
type cb_filteron from commandbutton within w_orsalesaleman_r_2
end type
type cb_filteroff from commandbutton within w_orsalesaleman_r_2
end type
type cb_1 from commandbutton within w_orsalesaleman_r_2
end type
type cb_2 from commandbutton within w_orsalesaleman_r_2
end type
type gb_4 from groupbox within w_orsalesaleman_r_2
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r_2
end type
end forward

global type w_orsalesaleman_r_2 from w_inheritance
integer y = 112
integer width = 4699
integer height = 2368
string title = "수주접수 확인(w_orsalesaleman_r_2)"
long backcolor = 79416533
st_1 st_1
em_1 em_1
em_2 em_2
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_3 dw_3
dw_4 dw_4
st_4 st_4
cbx_1 cbx_1
st_5 st_5
st_6 st_6
st_8 st_8
ddlb_fld ddlb_fld
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
end type
global w_orsalesaleman_r_2 w_orsalesaleman_r_2

type variables
string is_sale_flag, is_ret
datawindowchild idwc_user, idwc_area
end variables

on w_orsalesaleman_r_2.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_4=create st_4
this.cbx_1=create cbx_1
this.st_5=create st_5
this.st_6=create st_6
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_filteron
this.Control[iCurrent+19]=this.cb_filteroff
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.gb_4
this.Control[iCurrent+23]=this.ddlb_dwtitles
end on

on w_orsalesaleman_r_2.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


dw_3.settransobject(sqlca)
dw_3.insertrow(1)

st_security lst_security
string ls_level_userid, ls_chk

if GF_PERMISSION("수주접수확인(eSALE)", gs_userid) = "Y" then
else
	pb_save.enabled = false
end if

choose case gs_level
	case 'A', 'B'
		ls_chk = 'Y'
	case 'C'
		ls_chk = 'N'
end choose

if ls_chk = 'Y' Then
	is_ret = '%'
	dw_3.getchild('user',idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_3.object.user[1] = '%'
else
	dw_3.object.user[1] = gs_userid
	is_ret = 'N'
end if

string ls_area, ls_salesman

em_1.text = string(RelativeDate(today(), - 10), 'YYYY/MM/DD')
em_2.text = string(RelativeDate(today(), + 10), 'YYYY/MM/DD')
ddlb_1.text  = '전체'
is_sale_flag = 'A'

dw_2.visible = false
dw_1.sharedata(dw_2)

dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
idwc_area.accepttext()
ls_area = "%"
dw_4.object.area[1] = ls_area


end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 82
dw_1.height = newheight - dw_1.y - 23

end event

type pb_save from w_inheritance`pb_save within w_orsalesaleman_r_2
integer x = 4206
integer y = 64
integer taborder = 90
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row_ar[],     ll_row, ll_dw1cnt, ll_row_row, ll_ar_cnt, ll_row_no
string ls_orderno_ar[], ls_sale_no, ls_sale_no1, ls_sale_date, ls_seq, ls_sale_flag, ls_area
string ls_sale_control, ls_cust_chk, ls_order_chk
int    li_seq 

setpointer(hourglass!)

dw_1.AcceptText()

ll_dw1cnt = dw_1.rowcount()
for ll_row = 1 to ll_dw1cnt
	if dw_1.object.chk_yn[ll_row] = 'Y' then
		ll_row_row += 1
		ls_orderno_ar[ll_row_row] = dw_1.object.saletemp_order_no[ll_row]
		ll_row_ar[ll_row_row]     = ll_row
	end if
next

ll_ar_cnt = UpperBound(ls_orderno_ar)
if ll_ar_cnt < 1 then
	MessageBox('확인', '선택된 항목이 없습니다.')
	return
end if

//
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

dw_1.SetRedraw(false)

for ll_row = 1 to ll_ar_cnt
	ls_order_chk = ls_orderno_ar[ll_row]
	
	ll_row_no    = ll_row_ar[ll_row]
	ls_cust_chk  = dw_1.object.saletemp_cust_no[ll_row_no]  

	SELECT isnull(sale_control,'N') INTO :ls_sale_control FROM customer WHERE cust_no = :ls_cust_chk;
	if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
		messagebox("저장오류","매출통제 대상 거래처입니다!",stopsign!)
		return
	end if
	
   /////////////////////////////////////////////////////////////	
   //	일반 제품, 상품은 : 화곡사업장, YSP 품목은 : YSP사업장
   //===========================================================
	// 코일등 원재료는 기존 방식으로 진행
   /////////////////////////////////////////////////////////////	
	ls_area      = LeftA(dw_1.object.area_no[ll_row_no], 1)
	ls_sale_flag = dw_1.getitemstring(1, "saletemp_sale_flag")
	ls_sale_date = string(dw_1.object.saletemp_order_date[ll_row_no], "yyyymmdd") // GF_TODAY2S()
	ls_sale_no1  = ls_area + ls_sale_flag + ls_sale_date + '-' + '%'
		
	SELECT MAX(order_no) INTO :ls_sale_no FROM sale WHERE order_no LIKE :ls_sale_no1;
	if isnull(ls_sale_no) or ls_sale_no = "" then
		ls_sale_no1 = ls_area + ls_sale_flag + ls_sale_date + '-' + '001'
	else
		li_seq = integer(MidA(ls_sale_no, 12, 3))
		li_seq = li_seq + 1
		ls_seq = '00' + string(li_seq)
		ls_sale_no1 = LeftA(ls_sale_no1, 11) + RightA(ls_seq, 3)
	end if
				
	UPDATE saletemp
	   SET sale_no  = :ls_sale_no1, jupsu_flag = 'Y', jupsu_date = getdate()
	 WHERE order_no = :ls_order_chk  AND sale_no is null
	   AND (jupsu_flag is null or rtrim(jupsu_flag) = '' or rtrim(jupsu_flag) = 'N');
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
		MessageBox("확인", "주문관리 테이블에 오류가 발생했습니다.~r~n요청번호: " + ls_order_chk + "~r~n다시 조회후 확인하고 처리 하시기 바랍니다.")
		return
	end if

	// SALE
	INSERT INTO sale (order_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code, cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date, tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr, rem, revision_no, revision_date, input_date, login_id, tel_no, ship_case, rem1, rem2, plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2 )
	SELECT sale_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code, cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date, tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr, rem, 0, getdate(), getdate(), :gs_userid, tel_no, ship_case, rem1, rem2, plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2
	  FROM saletemp
	 WHERE order_no = :ls_order_chk AND sale_no  = :ls_sale_no1;
	if sqlca.sqlcode = 0 then
		// SALEDET
		INSERT INTO saledet(order_no, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text, action, sol_qty, loc_no, issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color, price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang)
		SELECT :ls_sale_no1, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text, action, sol_qty, loc_no, issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color, price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang 
		  FROM saletempdet
		 WHERE order_no = :ls_order_chk;	
		if sqlca.sqlcode = 0 then
			commit;
		else
			rollback;
			MessageBox("확인", "수주접수(상세) 오류가 발생했습니다.~r~n요청번호: " + ls_order_chk + " , 수주번호: " + ls_sale_no1)
			return
		end if
	else
		rollback;
		MessageBox("확인", "수주접수 오류가 발생했습니다.~r~n요청번호: " + ls_order_chk + " , 수주번호: " + ls_sale_no1)
		return
	end if

	dw_1.object.chk_yn[ll_row_no] = 'N'
	dw_1.Object.jupsu_flag[ll_row_no] = 'Y'			//상태값 변환
	dw_1.Object.sale_no[ll_row_no] 	 = ls_sale_no1	//수주번호 변환
	
next

ll_row = dw_1.GetRow()
dw_1.Triggerevent( Clicked! )
dw_1.SetRow(ll_row)

dw_1.SetRedraw(true)

MessageBox("확인", "승인 처리가 완료 되었습니다. 다시 조회하여 접수 확인을 하세요.")

end event

type dw_1 from w_inheritance`dw_1 within w_orsalesaleman_r_2
integer x = 37
integer y = 524
integer width = 4581
integer height = 1692
integer taborder = 0
string dataobject = "d_orsalesalemanrep_r_2"
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;string ls_saleno

if row < 1 then return

this.scrolltorow( row )
choose case dwo.name
	case 'sale_cust_no', 'customer_cust_name'
		gs_where lstr_where
		lstr_where.str1 = this.object.saletemp_cust_no[row]
		lstr_where.name = this.object.customer_cust_name[row]
		openwithparm(w_whopeom_w, lstr_where)

	case 'jupsu_flag'
		if this.object.jupsu_flag[row] = 'Y' then
			ls_saleno = this.object.sale_no[row]
			
			if IsValid(w_all_main) = true then
				opensheet(w_orsale_m, w_all_main, 5, original!)
			else
				opensheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

event dw_1::clicked;call super::clicked;//
this.scrolltorow( row )

//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_orsalesaleman_r_2
integer x = 1307
integer y = 52
integer width = 174
integer height = 116
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsalesalemanrep_r1_2"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_orsalesaleman_r_2
integer y = 40
integer width = 1234
string text = "수주접수 확인"
end type

type st_tips from w_inheritance`st_tips within w_orsalesaleman_r_2
end type

type pb_compute from w_inheritance`pb_compute within w_orsalesaleman_r_2
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsalesaleman_r_2
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsalesaleman_r_2
integer x = 4398
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalesaleman_r_2
integer x = 4014
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print


if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=56'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsalesaleman_r_2
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_orsalesaleman_r_2
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsalesaleman_r_2
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsalesaleman_r_2
integer x = 3822
integer y = 64
integer taborder = 40
end type

event pb_retrieve::clicked;st_security lst_security
string ls_sale_flag[], ls_saleman, ls_area, ls_ret
date   ld_start, ld_end
 
dw_3.AcceptText()
dw_1.reset()
if em_1.text = '' then
	messagebox("확인","납기일자를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","납기일자를 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","납기일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

if is_sale_flag = 'A' then
	ls_sale_flag[1] = 'D'
	ls_sale_flag[2] = 'L'
	ls_sale_flag[3] = 'E'
else
	ls_sale_flag[1] = is_sale_flag
end if

//갑용추가
//IF ISNULL(ls_saleman) THEN ls_saleman = '%'
// 각 팀장들..
//if is_ret = '%' then
//	ls_saleman = dw_3.object.user[1]
//else
ls_ret =  is_ret
if cbx_1.checked = true  then		// 팀
	long ll_cnt, ll_chk
	ll_cnt = 0
	SELECT count(*) INTO :ll_cnt FROM team WHERE parent_code = '70000' AND team_manager = :gs_userid;
	if ll_cnt > 0  then
		ls_ret =  'T'
		ls_saleman = gs_userid
	else
		if is_ret = '%' then
			ls_saleman = dw_3.object.user[1]
		else
			ls_saleman = gs_userid
		end if
	end if
else
	if is_ret = '%' then
		ls_saleman = dw_3.object.user[1]
	else
		ls_saleman = gs_userid
	end if
end if


ls_area = dw_4.object.area[1]
dw_1.retrieve(ls_sale_flag, ld_start, ld_end, ls_saleman, ls_area, ls_ret)

dw_1.setcolumn('saletempdet_seq_no')
dw_1.setfocus()

	
end event

type gb_3 from w_inheritance`gb_3 within w_orsalesaleman_r_2
integer x = 2057
integer y = 8
integer width = 1723
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsalesaleman_r_2
integer x = 37
integer y = 312
integer width = 4581
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsalesaleman_r_2
integer x = 3794
integer y = 8
integer width = 818
integer height = 224
integer taborder = 0
integer weight = 400
end type

type st_1 from statictext within w_orsalesaleman_r_2
integer x = 2615
integer y = 48
integer width = 279
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "주문기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsalesaleman_r_2
integer x = 2907
integer y = 48
integer width = 357
integer height = 80
integer taborder = 10
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
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_orsalesaleman_r_2
integer x = 3387
integer y = 48
integer width = 357
integer height = 80
integer taborder = 20
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
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_orsalesaleman_r_2
integer x = 3301
integer y = 52
integer width = 41
integer height = 72
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_orsalesaleman_r_2
integer x = 2615
integer y = 136
integer width = 279
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "수주유형"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_orsalesaleman_r_2
integer x = 2912
integer y = 136
integer width = 352
integer height = 384
integer taborder = 30
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
string item[] = {"전체","내수","L/C","수출"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index 
	case 1
		is_sale_flag = 'A'
	case 2
		is_sale_flag = 'D'
	case 3
		is_sale_flag = 'L'
	case 4
		is_sale_flag = 'E'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_3 from datawindow within w_orsalesaleman_r_2
integer x = 3269
integer y = 140
integer width = 329
integer height = 76
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.AcceptText()
end event

type dw_4 from datawindow within w_orsalesaleman_r_2
integer x = 2085
integer y = 136
integer width = 526
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()

end event

type st_4 from statictext within w_orsalesaleman_r_2
integer x = 2085
integer y = 48
integer width = 526
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사 업 장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_orsalesaleman_r_2
integer x = 3598
integer y = 144
integer width = 146
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "팀"
boolean lefttext = true
end type

type st_5 from statictext within w_orsalesaleman_r_2
integer x = 41
integer y = 256
integer width = 1120
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처 더블클릭시 현황조회됩니다."
boolean focusrectangle = false
end type

type st_6 from statictext within w_orsalesaleman_r_2
integer x = 1198
integer y = 256
integer width = 2286
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "~"접수~" 더블 클릭시 수주화면으로 이동, 수주삭제시 미접수 상태로 롤백."
boolean focusrectangle = false
end type

type st_8 from statictext within w_orsalesaleman_r_2
integer x = 105
integer y = 392
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

type ddlb_fld from dropdownlistbox within w_orsalesaleman_r_2
integer x = 288
integer y = 372
integer width = 480
integer height = 580
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
end type

type st_9 from statictext within w_orsalesaleman_r_2
integer x = 805
integer y = 392
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_orsalesaleman_r_2
integer x = 978
integer y = 372
integer width = 261
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsalesaleman_r_2
integer x = 1253
integer y = 376
integer width = 581
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_orsalesaleman_r_2
integer x = 1847
integer y = 372
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_orsalesaleman_r_2
integer x = 2048
integer y = 372
integer width = 197
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_orsalesaleman_r_2
integer x = 2249
integer y = 372
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_orsalesaleman_r_2
integer x = 2437
integer y = 372
integer width = 183
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type gb_4 from groupbox within w_orsalesaleman_r_2
boolean visible = false
integer x = 1554
integer y = 76
integer width = 393
integer height = 120
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r_2
integer x = 347
integer y = 380
integer width = 306
integer height = 92
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

