$PBExportHeader$w_orsale_shopcon.srw
$PBExportComments$쇼핑몰 주문관리(접수)
forward
global type w_orsale_shopcon from w_inheritance
end type
type st_1 from statictext within w_orsale_shopcon
end type
type em_1 from editmask within w_orsale_shopcon
end type
type em_2 from editmask within w_orsale_shopcon
end type
type dw_3 from datawindow within w_orsale_shopcon
end type
type dw_4 from datawindow within w_orsale_shopcon
end type
type st_4 from statictext within w_orsale_shopcon
end type
type st_5 from statictext within w_orsale_shopcon
end type
type st_6 from statictext within w_orsale_shopcon
end type
type st_8 from statictext within w_orsale_shopcon
end type
type ddlb_fld from dropdownlistbox within w_orsale_shopcon
end type
type st_9 from statictext within w_orsale_shopcon
end type
type ddlb_op from dropdownlistbox within w_orsale_shopcon
end type
type sle_value from singlelineedit within w_orsale_shopcon
end type
type cb_filteron from commandbutton within w_orsale_shopcon
end type
type cb_filteroff from commandbutton within w_orsale_shopcon
end type
type cb_1 from commandbutton within w_orsale_shopcon
end type
type cb_2 from commandbutton within w_orsale_shopcon
end type
type gb_4 from groupbox within w_orsale_shopcon
end type
type ddlb_dwtitles from dropdownlistbox within w_orsale_shopcon
end type
type st_2 from statictext within w_orsale_shopcon
end type
type st_3 from statictext within w_orsale_shopcon
end type
end forward

global type w_orsale_shopcon from w_inheritance
integer y = 112
integer width = 4695
integer height = 2360
string title = "쇼핑몰 접수확인(w_orsale_shopcon)"
long backcolor = 79416533
st_1 st_1
em_1 em_1
em_2 em_2
dw_3 dw_3
dw_4 dw_4
st_4 st_4
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
st_2 st_2
st_3 st_3
end type
global w_orsale_shopcon w_orsale_shopcon

type variables
string is_sale_flag, is_ret
datawindowchild idwc_user, idwc_area
end variables

on w_orsale_shopcon.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_4=create st_4
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
this.st_2=create st_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_8
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.st_9
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_filteron
this.Control[iCurrent+15]=this.cb_filteroff
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.gb_4
this.Control[iCurrent+19]=this.ddlb_dwtitles
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.st_3
end on

on w_orsale_shopcon.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_4)
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
destroy(this.st_2)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_level_userid, ls_chk
string ls_area, ls_salesman


ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_1.sharedata(dw_2)

// 일자
em_1.text = string(RelativeDate(today(), - 10), 'YYYY/MM/DD')
em_2.text = string(RelativeDate(today(), + 10), 'YYYY/MM/DD')

// 사업장
dw_4.settransobject(sqlca)
dw_4.insertrow(1)

dw_4.getchild("area",idwc_area)
idwc_area.settransobject(sqlca)
dw_4.object.area[1] = gs_area

if GF_PERMISSION("쇼핑몰_접수관리", gs_userid) = "Y" then
else
	pb_save.enabled = false
end if

// 담당자
dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.object.user[1] = gs_userid

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 82
dw_1.height = newheight - 572

end event

type pb_save from w_inheritance`pb_save within w_orsale_shopcon
integer x = 4206
integer y = 60
integer taborder = 90
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

long   ll_shoprow[],   ll_nullarray[], ll_row,    ll_dw1cnt, ll_shopcnt
string ls_shoporder[], ls_nullarray[], ls_saleno, ls_saleno1, ls_saledate, ls_seq, ls_saleflag, ls_area
string ls_custno, ls_salecontrol, ls_orderno, ls_orguser, ls_chkyn, ls_sqlerror
int    li_seq 

setpointer(hourglass!)

dw_1.AcceptText()

ls_shoporder = ls_nullarray		// 주문초기화
ll_shoprow   = ll_nullarray		// 행번호초기화

//////////////////////////////////////////////////////////////////////////
// 선택항목 체크
//////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw_1.rowcount()
	setnull(ls_chkyn)
	ls_chkyn  = dw_1.object.chk_yn[ll_row]
	
	if ls_chkyn = "Y" then
		ll_dw1cnt = ll_dw1cnt + 1
		
		ls_shoporder[ll_dw1cnt] = dw_1.object.order_no[ll_row]		// 쇼핑몰주문번호
		ll_shoprow[ll_dw1cnt]   = ll_row										// dw1 행번호
	end if
next

if UpperBound(ls_shoporder) < 1 then
	MessageBox("확인", "선택된 항목이 없습니다.")
	RETURN
end if
//////////////////////////////////////////////////////////////////////////

//
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

dw_1.SetRedraw(false)

for ll_row = 1 to UpperBound(ls_shoporder)
	ls_orderno = ls_shoporder[ll_row]				// 쇼핑몰 주문번호	
	ll_dw1cnt  = ll_shoprow[ll_row]					// 행번호
	
	ls_custno  = dw_1.object.cust_no[ll_dw1cnt]  // 거래처

	SELECT isnull(sale_control,'N') INTO :ls_salecontrol FROM customer WHERE cust_no = :ls_custno;
	if ls_salecontrol = "A" OR ls_salecontrol = "Y" then // 매출통제
		MessageBox("저장오류","매출통제 대상 거래처입니다!",stopsign!)
		RETURN
	end if
	
   ////////////////////////////////////////////////////////////////////////////////////////////	
   //	일반제품, 상품: 화곡사업장, YSP 품목: YSP사업장 입력하지만 쇼핑몰에서는 취급안함
   ////////////////////////////////////////////////////////////////////////////////////////////	
	ls_area     = LeftA(dw_1.object.area_no[ll_dw1cnt], 1)
	ls_saleflag = dw_1.object.sale_flag[ll_dw1cnt]
	ls_saledate = string(dw_1.object.order_date[ll_dw1cnt], "yyyymmdd") // GF_TODAY2S()
	ls_saleno1  = ls_area + ls_saleflag + ls_saledate + "-" + "%"
	
	SELECT max(order_no) INTO :ls_saleno FROM sale WHERE order_no LIKE :ls_saleno1;
	if isnull(ls_saleno) OR ls_saleno = "" then
		ls_saleno1 = ls_area + ls_saleflag + ls_saledate + "-" + "001"
	else
		li_seq     = integer(MidA(ls_saleno, 12, 3))
		ls_seq     = "00" + string(li_seq + 1)
		ls_saleno1 = LeftA(ls_saleno1, 11) + RightA(ls_seq, 3)
	end if
				
	// 쇼핑몰주문번호와 ERP주문번호 매칭 
	UPDATE saleshop
	   SET sale_no  = :ls_saleno1, jupsu_flag = 'Y', jupsu_date = getdate()
	 WHERE order_no = :ls_orderno;
	if sqlca.sqlcode = 0 then
		COMMIT;
	else
		ROLLBACK;
		MessageBox("확인", "주문관리 테이블에 오류가 발생했습니다.~r~n요청번호: " + ls_orderno + "~r~n다시 조회후 확인하고 처리 하시기 바랍니다.")
		RETURN
	end if

	// SALE
	INSERT INTO sale (order_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code
	     , cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date
		  , tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr, rem
		  , revision_no, revision_date, input_date, login_id,  tel_no, ship_case, rem1, rem2
		  , plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2 )
	SELECT sale_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code
	     , cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date
		  , tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr, rem
		  , 0,           getdate(),     getdate(), :gs_userid, tel_no, ship_case, rem1, rem2
		  , plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2
	  FROM saleshop
	 WHERE order_no = :ls_orderno;
	if sqlca.sqlcode = 0 then
		// SALEDET
		INSERT INTO saledet(order_no, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text
		     , action, sol_qty, loc_no, issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color
			  , price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang)
		SELECT :ls_saleno1, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text
		     , action, sol_qty, loc_no, issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color
			  , price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang 
		  FROM saleshopdet
		 WHERE order_no = :ls_orderno;	
		if sqlca.sqlcode = 0 then
			COMMIT;
		else
			ls_sqlerror = SQLCA.SQLErrText
			ROLLBACK;
			MessageBox("확인", "쇼핑몰접수(상세) 오류가 발생했습니다.~r~n요청번호: " + ls_orderno + "~r~n" + ls_sqlerror)
			RETURN
		end if
	else
      ls_sqlerror = SQLCA.SQLErrText
		ROLLBACK;
		MessageBox("확인", "쇼핑몰접수(헤더) 오류가 발생했습니다.~r~n요청번호: " + ls_orderno + "~r~n" + ls_sqlerror)
		RETURN
	end if

	dw_1.object.chk_yn[ll_dw1cnt]     = "N"
	dw_1.object.jupsu_flag[ll_dw1cnt] = "Y"			// 상태값 변환
	dw_1.object.sale_no[ll_dw1cnt] 	 = ls_saleno1	// 수주번호 변환	
next

ll_row = dw_1.GetRow()
dw_1.Triggerevent( Clicked! )
dw_1.SetRow(ll_row)

dw_1.SetRedraw(true)

pb_retrieve.triggerevent( clicked! )

MessageBox("확인", "승인 처리가 완료 되었습니다.")

end event

type dw_1 from w_inheritance`dw_1 within w_orsale_shopcon
integer x = 37
integer y = 524
integer width = 4581
integer height = 1692
integer taborder = 0
string dataobject = "d_orsale_shopcon_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;//
gs_where lstr_where
string   ls_saleno

if isnull(row) OR row < 1 then RETURN

this.scrolltorow( row )

choose case dwo.name
	case "cust_no", "cust_name"
		lstr_where.str1 = this.object.cust_no[row]
		lstr_where.name = this.object.cust_name[row]
		OpenWithParm( w_whopeom_w, lstr_where )

	case "jupsu_flag"
	
	case else
		if this.object.jupsu_flag[row] = "Y" then
			ls_saleno = this.object.sale_no[row]
			
			if IsValid(w_all_main) = true then
				OpenSheet(w_orsale_m, w_all_main, 6, original!)
			else
				OpenSheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

event dw_1::clicked;call super::clicked;//
if isnull( row ) OR row < 1 then RETURN

this.scrolltorow( row )
//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_orsale_shopcon
integer x = 1307
integer y = 52
integer width = 119
integer height = 92
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

type st_title from w_inheritance`st_title within w_orsale_shopcon
integer y = 40
integer width = 1234
string text = "쇼핑몰 접수확인"
end type

type st_tips from w_inheritance`st_tips within w_orsale_shopcon
end type

type pb_compute from w_inheritance`pb_compute within w_orsale_shopcon
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsale_shopcon
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsale_shopcon
integer x = 4398
integer y = 60
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsale_shopcon
integer x = 4014
integer y = 60
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

type pb_cancel from w_inheritance`pb_cancel within w_orsale_shopcon
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_orsale_shopcon
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsale_shopcon
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsale_shopcon
integer x = 3822
integer y = 60
integer taborder = 40
end type

event pb_retrieve::clicked;//
string ls_saleman, ls_area, ls_sdate, ls_edate
long   ll_cnt,   ll_chk
 
dw_1.reset()

if em_1.text = "" then
	MessageBox("확인","납기일자를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","납기일자를 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","납기일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_4.AcceptText()
ls_area = dw_4.object.area[1]

// 담당자
dw_3.AcceptText()
ls_saleman = dw_3.object.user[1]

dw_1.retrieve( ls_area, ls_sdate, ls_edate )
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
else
	dw_1.setcolumn("seq_no")
	dw_1.setfocus()
end if

	
end event

type gb_3 from w_inheritance`gb_3 within w_orsale_shopcon
integer x = 2144
integer y = 8
integer width = 1627
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsale_shopcon
integer x = 37
integer y = 312
integer width = 4581
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsale_shopcon
integer x = 3794
integer y = 8
integer width = 818
integer height = 224
integer taborder = 0
integer weight = 400
end type

type st_1 from statictext within w_orsale_shopcon
integer x = 2702
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

type em_1 from editmask within w_orsale_shopcon
integer x = 2990
integer y = 48
integer width = 370
integer height = 84
integer taborder = 10
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

type em_2 from editmask within w_orsale_shopcon
integer x = 3369
integer y = 48
integer width = 370
integer height = 84
integer taborder = 20
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

type dw_3 from datawindow within w_orsale_shopcon
integer x = 2990
integer y = 140
integer width = 663
integer height = 76
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.AcceptText()
end event

type dw_4 from datawindow within w_orsale_shopcon
integer x = 2171
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

type st_4 from statictext within w_orsale_shopcon
integer x = 2171
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

type st_5 from statictext within w_orsale_shopcon
integer x = 41
integer y = 256
integer width = 1061
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처 더블클릭: 여신현황조회."
boolean focusrectangle = false
end type

type st_6 from statictext within w_orsale_shopcon
integer x = 1129
integer y = 256
integer width = 914
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "더블 클릭시 수주화면 이동."
boolean focusrectangle = false
end type

type st_8 from statictext within w_orsale_shopcon
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

type ddlb_fld from dropdownlistbox within w_orsale_shopcon
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

type st_9 from statictext within w_orsale_shopcon
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

type ddlb_op from dropdownlistbox within w_orsale_shopcon
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

type sle_value from singlelineedit within w_orsale_shopcon
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

type cb_filteron from commandbutton within w_orsale_shopcon
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

type cb_filteroff from commandbutton within w_orsale_shopcon
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

type cb_1 from commandbutton within w_orsale_shopcon
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

type cb_2 from commandbutton within w_orsale_shopcon
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

type gb_4 from groupbox within w_orsale_shopcon
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

type ddlb_dwtitles from dropdownlistbox within w_orsale_shopcon
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

type st_2 from statictext within w_orsale_shopcon
integer x = 2702
integer y = 136
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_orsale_shopcon
integer x = 2153
integer y = 256
integer width = 1376
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "수주관리에서 삭제시 미접수 상태로 롤백."
boolean focusrectangle = false
end type

