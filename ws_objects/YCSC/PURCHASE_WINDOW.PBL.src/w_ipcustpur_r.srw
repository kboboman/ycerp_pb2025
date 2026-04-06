$PBExportHeader$w_ipcustpur_r.srw
$PBExportComments$거래처별입고내역(1998/05/13,곽용덕)
forward
global type w_ipcustpur_r from w_inheritance
end type
type dw_3 from datawindow within w_ipcustpur_r
end type
type gb_4 from groupbox within w_ipcustpur_r
end type
type rb_2 from radiobutton within w_ipcustpur_r
end type
type rb_1 from radiobutton within w_ipcustpur_r
end type
type rb_3 from radiobutton within w_ipcustpur_r
end type
type st_2 from statictext within w_ipcustpur_r
end type
type dw_area from datawindow within w_ipcustpur_r
end type
type pb_1 from picturebutton within w_ipcustpur_r
end type
type st_13 from statictext within w_ipcustpur_r
end type
type ddlb_fld from dropdownlistbox within w_ipcustpur_r
end type
type st_14 from statictext within w_ipcustpur_r
end type
type ddlb_op from dropdownlistbox within w_ipcustpur_r
end type
type sle_value from singlelineedit within w_ipcustpur_r
end type
type cb_10 from commandbutton within w_ipcustpur_r
end type
type cb_14 from commandbutton within w_ipcustpur_r
end type
type cb_15 from commandbutton within w_ipcustpur_r
end type
type cb_16 from commandbutton within w_ipcustpur_r
end type
type dw_4 from datawindow within w_ipcustpur_r
end type
type dw_5 from datawindow within w_ipcustpur_r
end type
type st_1 from statictext within w_ipcustpur_r
end type
end forward

global type w_ipcustpur_r from w_inheritance
integer width = 4695
integer height = 2896
string title = "거래처별 입고내역(w_ipcustpur_r)"
dw_3 dw_3
gb_4 gb_4
rb_2 rb_2
rb_1 rb_1
rb_3 rb_3
st_2 st_2
dw_area dw_area
pb_1 pb_1
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
dw_4 dw_4
dw_5 dw_5
st_1 st_1
end type
global w_ipcustpur_r w_ipcustpur_r

type variables
st_print i_print
string is_supp
date   id_date1, id_date2
datawindowchild idwc_cust, idwc_area, idwc_loc
end variables

on w_ipcustpur_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.gb_4=create gb_4
this.rb_2=create rb_2
this.rb_1=create rb_1
this.rb_3=create rb_3
this.st_2=create st_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.st_13
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.st_14
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_10
this.Control[iCurrent+15]=this.cb_14
this.Control[iCurrent+16]=this.cb_15
this.Control[iCurrent+17]=this.cb_16
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.dw_5
this.Control[iCurrent+20]=this.st_1
end on

on w_ipcustpur_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_4)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.rb_3)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = FALSE
dw_4.visible = FALSE
dw_5.visible = FALSE
dw_1.sharedata(dw_2)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area

// 전체거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("supp_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/dd"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))
id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "supp_no", "%")
idwc_loc.setitem(1, "supp_name", "전체")

if LeftA(gs_team,1) = "9" then
	dw_3.object.supp_no[1] = "%"
end if

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

end event

type pb_save from w_inheritance`pb_save within w_ipcustpur_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ipcustpur_r
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
integer taborder = 60
string dataobject = "d_ipcustpur_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "purdet_order_no"
		ls_col  = "발주번호"
		ls_text = this.object.purdet_order_no[row]
	case "purdet_sale_no"
		ls_col  = "수주번호"
		ls_text = this.object.purdet_sale_no[row]
	case "purdet_cust_name"
		ls_col  = "판매거래처"
		ls_text = this.object.purdet_cust_name[row]
	case "groupitem_item_name"
		ls_col  = "물품명"
		ls_text = this.object.groupitem_item_name[row]
	case "inspdet_qa"
		ls_col  = "규격"
		ls_text = this.object.inspdet_qa[row]
	case "insp_log_date"
		ls_col  = "일보일자"
		ls_text = string(this.object.insp_log_date[row])
	case "insp_insp_date"
		ls_col  = "매입일자"
		ls_text = string(this.object.insp_insp_date[row])
	case "inspdet_rcpt_qty"
		ls_col  = "입고수량"
		ls_text = string(this.object.inspdet_rcpt_qty[row])
	case "inspdet_uom"
		ls_col  = "단위"
		ls_text = this.object.inspdet_uom[row]
	case "inspdet_comqty"
		ls_col  = "환산수량"
		ls_text = string(this.object.inspdet_comqty[row])
	case "purdet_com_uom"
		ls_col  = "환단"
		ls_text = this.object.purdet_com_uom[row]
	case "inspdet_price"
		ls_col  = "단가"
		ls_text = string(this.object.inspdet_price[row])
	case "compute_1"
		ls_col  = "금액"
		ls_text = string(this.object.compute_1[row])
	case "inspdet_insp_no"
		ls_col  = "입고번호"
		ls_text = this.object.inspdet_insp_no[row]
	case "inspdet_oi_no"
		ls_col  = "NO"
		ls_text = string(this.object.inspdet_oi_no[row])
	case "inspdet_loc_no"
		ls_col  = "저장소"
		ls_text = this.object.inspdet_loc_no[row]
	case "pur_order_date"
		ls_col  = "발주일자"
		ls_text = string(this.object.pur_order_date[row])
	case "etc_name"
		ls_col  = "특기사항"
		ls_text = this.object.etc_name[row]
	case "supp_supp_name"
		ls_col  = "구매거래처명"
		ls_text = this.object.supp_supp_name[row]
	case "groupitem_item_no"
		ls_col  = "품목"
		ls_text = this.object.groupitem_item_no[row]
end choose

choose case ls_col
	case "일보일자", "매입일자", "입고수량", "환산단위", "단가", "금액", "NO", "발주일자"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

end event

type dw_2 from w_inheritance`dw_2 within w_ipcustpur_r
integer x = 1339
integer y = 24
integer width = 123
integer height = 88
integer taborder = 70
string dataobject = "d_ipcustpur_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ipcustpur_r
integer x = 50
integer width = 1339
string text = "거래처별 입고내역"
end type

type st_tips from w_inheritance`st_tips within w_ipcustpur_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipcustpur_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipcustpur_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipcustpur_r
integer x = 4421
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipcustpur_r
integer x = 4018
integer y = 48
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_supp,ls_order
long   ll_row

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 거래처별 입고내역 보고서를 출력합니다."

if rb_1.checked = true then
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'
else
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=82'
end if
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_ipcustpur_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipcustpur_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipcustpur_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipcustpur_r
integer x = 3826
integer y = 48
integer taborder = 150
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area

dw_3.accepttext()

ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then ls_area = "%"
if is_supp = "" then is_supp = "%"

dw_1.reset()
ll_row = dw_1.retrieve( is_supp, id_date1, id_date2, ls_area )
              dw_2.retrieve( is_supp, id_date1, id_date2, ls_area )
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipcustpur_r
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ipcustpur_r
integer y = 344
integer width = 4590
integer height = 2424
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipcustpur_r
integer x = 3799
integer y = 8
integer width = 823
integer taborder = 50
end type

type dw_3 from datawindow within w_ipcustpur_r
integer x = 2139
integer y = 44
integer width = 1056
integer height = 156
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ipsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_1.reset()
this.accepttext()
id_date1 = this.object.ymd1[1]
id_date2 = this.object.ymd2[1]
is_supp = trim(this.object.supp_no[1])


end event

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'ymd1'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd1[row] = datetime(date(message.stringparm))
		end if
		this.Setcolumn('ymd2')
	CASE 'ymd2'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd2[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.postevent(itemchanged!)
end event

type gb_4 from groupbox within w_ipcustpur_r
integer x = 1568
integer y = 8
integer width = 2217
integer height = 208
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
end type

type rb_2 from radiobutton within w_ipcustpur_r
integer x = 3214
integer y = 144
integer width = 256
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
string text = "집계1"
end type

event clicked;// 집계1
dw_1.dataobject = 'd_ipcustpur_t2'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r2'
dw_2.settransobject(sqlca)
//dw_1.sharedata(dw_2)

end event

type rb_1 from radiobutton within w_ipcustpur_r
integer x = 3214
integer y = 64
integer width = 224
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
string text = "상세"
boolean checked = true
end type

event clicked;// 상세
dw_1.dataobject = 'd_ipcustpur_t'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r'
dw_2.settransobject(sqlca)
//dw_1.sharedata(dw_2)

end event

type rb_3 from radiobutton within w_ipcustpur_r
integer x = 3479
integer y = 144
integer width = 256
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
string text = "집계2"
end type

event clicked;// 집계2
dw_1.dataobject = 'd_ipcustpur_t3'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r3'
dw_2.settransobject(sqlca)
//dw_1.sharedata(dw_2)

end event

type st_2 from statictext within w_ipcustpur_r
integer x = 1614
integer y = 44
integer width = 521
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_ipcustpur_r
integer x = 1614
integer y = 120
integer width = 521
integer height = 84
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type pb_1 from picturebutton within w_ipcustpur_r
event mousemove pbm_mousemove
integer x = 4206
integer y = 48
integer width = 187
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type st_13 from statictext within w_ipcustpur_r
integer x = 64
integer y = 280
integer width = 160
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

type ddlb_fld from dropdownlistbox within w_ipcustpur_r
integer x = 238
integer y = 264
integer width = 402
integer height = 532
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"발주번호","수주번호","판매거래처","물품명","규격","일보일자","매입일자","입고수량","단위","환산수량","환단","단가","금액","입고번호","NO","저장소","발주일자","특기사항","구매거래처명","품목"}
end type

type st_14 from statictext within w_ipcustpur_r
integer x = 658
integer y = 280
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

type ddlb_op from dropdownlistbox within w_ipcustpur_r
integer x = 827
integer y = 264
integer width = 279
integer height = 512
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_ipcustpur_r
integer x = 1120
integer y = 264
integer width = 704
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

type cb_10 from commandbutton within w_ipcustpur_r
integer x = 1833
integer y = 264
integer width = 146
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_fld.text) = "" then
	ls_column = ""
else
	string ls_col
	choose case trim(ddlb_fld.text)
		case "발주번호"
			ls_col  = "purdet_order_no"
		case "수주번호"
			ls_col  = "purdet_sale_no"
		case "판매거래처"
			ls_col  = "purdet_cust_name"
		case "물품명"
			ls_col  = "groupitem_item_name"
		case "규격"
			ls_col  = "inspdet_qa"
		case "일보일자"
			ls_col  = "insp_log_date"
		case "매입일자"
			ls_col  = "insp_insp_date"
		case "입고수량"
			ls_col  = "inspdet_rcpt_qty"
		case "단위"
			ls_col  = "inspdet_uom"
		case "환산수량"
			ls_col  = "inspdet_comqty"
		case "환단"
			ls_col  = "purdet_com_uom"
		case "단가"
			ls_col  = "inspdet_price"
		case "금액"
			ls_col  = "compute_1"
		case "입고번호"
			ls_col  = "inspdet_insp_no"
		case "NO"
			ls_col  = "inspdet_oi_no"
		case "저장소"
			ls_col  = "inspdet_loc_no"
		case "발주일자"
			ls_col  = "pur_order_date"
		case "특기사항"
			ls_col  = "etc_name"
		case "구매거래처명"
			ls_col  = "supp_supp_name"
		case "품목"
			ls_col  = "groupitem_item_no"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "insp_log_date", "insp_insp_date", "pur_order_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "inspdet_rcpt_qty", "inspdet_comqty", "inspdet_price", "compute_1"
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_14 from commandbutton within w_ipcustpur_r
integer x = 1984
integer y = 264
integer width = 146
integer height = 76
integer taborder = 150
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
ddlb_fld.text  = "품목명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()

pb_retrieve.triggerevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_15 from commandbutton within w_ipcustpur_r
integer x = 2135
integer y = 264
integer width = 146
integer height = 76
integer taborder = 160
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
string ls_col
choose case trim(ddlb_fld.text)
	case "발주번호"
		ls_col  = "purdet_order_no"
	case "수주번호"
		ls_col  = "purdet_sale_no"
	case "판매거래처"
		ls_col  = "purdet_cust_name"
	case "물품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "inspdet_qa"
	case "일보일자"
		ls_col  = "insp_log_date"
	case "매입일자"
		ls_col  = "insp_insp_date"
	case "입고수량"
		ls_col  = "inspdet_rcpt_qty"
	case "단위"
		ls_col  = "inspdet_uom"
	case "환산수량"
		ls_col  = "inspdet_comqty"
	case "환단"
		ls_col  = "purdet_com_uom"
	case "단가"
		ls_col  = "inspdet_price"
	case "금액"
		ls_col  = "compute_1"
	case "입고번호"
		ls_col  = "inspdet_insp_no"
	case "NO"
		ls_col  = "inspdet_oi_no"
	case "저장소"
		ls_col  = "inspdet_loc_no"
	case "발주일자"
		ls_col  = "pur_order_date"
	case "특기사항"
		ls_col  = "etc_name"
	case "구매거래처명"
		ls_col  = "supp_supp_name"
	case "품목"
		ls_col  = "groupitem_item_no"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_ipcustpur_r
integer x = 2281
integer y = 264
integer width = 146
integer height = 76
integer taborder = 170
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
string ls_col
choose case trim(ddlb_fld.text)
	case "발주번호"
		ls_col  = "purdet_order_no"
	case "수주번호"
		ls_col  = "purdet_sale_no"
	case "판매거래처"
		ls_col  = "purdet_cust_name"
	case "물품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "inspdet_qa"
	case "일보일자"
		ls_col  = "insp_log_date"
	case "매입일자"
		ls_col  = "insp_insp_date"
	case "입고수량"
		ls_col  = "inspdet_rcpt_qty"
	case "단위"
		ls_col  = "inspdet_uom"
	case "환산수량"
		ls_col  = "inspdet_comqty"
	case "환단"
		ls_col  = "purdet_com_uom"
	case "단가"
		ls_col  = "inspdet_price"
	case "금액"
		ls_col  = "compute_1"
	case "입고번호"
		ls_col  = "inspdet_insp_no"
	case "NO"
		ls_col  = "inspdet_oi_no"
	case "저장소"
		ls_col  = "inspdet_loc_no"
	case "발주일자"
		ls_col  = "pur_order_date"
	case "특기사항"
		ls_col  = "etc_name"
	case "구매거래처명"
		ls_col  = "supp_supp_name"
	case "품목"
		ls_col  = "groupitem_item_no"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type dw_4 from datawindow within w_ipcustpur_r
integer x = 453
integer y = 732
integer width = 3899
integer height = 676
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipcustpur_t2"
boolean livescroll = true
end type

type dw_5 from datawindow within w_ipcustpur_r
integer x = 453
integer y = 1468
integer width = 3899
integer height = 676
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipcustpur_t3"
boolean livescroll = true
end type

type st_1 from statictext within w_ipcustpur_r
integer x = 2670
integer y = 280
integer width = 1925
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "상세내역 엑셀출력 순서는 발주입고 수정및삭제에서 사용함."
alignment alignment = right!
boolean focusrectangle = false
end type

