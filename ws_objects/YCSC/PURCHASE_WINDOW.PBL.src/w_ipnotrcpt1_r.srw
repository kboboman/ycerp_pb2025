$PBExportHeader$w_ipnotrcpt1_r.srw
$PBExportComments$물품별 미입고현황(1998/10/15,곽용덕)
forward
global type w_ipnotrcpt1_r from w_inheritance
end type
type gb_4 from groupbox within w_ipnotrcpt1_r
end type
type dw_3 from datawindow within w_ipnotrcpt1_r
end type
type dw_area from datawindow within w_ipnotrcpt1_r
end type
type st_2 from statictext within w_ipnotrcpt1_r
end type
type st_13 from statictext within w_ipnotrcpt1_r
end type
type ddlb_fld from dropdownlistbox within w_ipnotrcpt1_r
end type
type st_14 from statictext within w_ipnotrcpt1_r
end type
type ddlb_op from dropdownlistbox within w_ipnotrcpt1_r
end type
type sle_value from singlelineedit within w_ipnotrcpt1_r
end type
type cb_10 from commandbutton within w_ipnotrcpt1_r
end type
type cb_14 from commandbutton within w_ipnotrcpt1_r
end type
type cb_15 from commandbutton within w_ipnotrcpt1_r
end type
type cb_16 from commandbutton within w_ipnotrcpt1_r
end type
type pb_1 from picturebutton within w_ipnotrcpt1_r
end type
end forward

global type w_ipnotrcpt1_r from w_inheritance
integer width = 4695
integer height = 2896
string title = "물품별 미입고현황(w_ipnotrcpt1_r)"
gb_4 gb_4
dw_3 dw_3
dw_area dw_area
st_2 st_2
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
pb_1 pb_1
end type
global w_ipnotrcpt1_r w_ipnotrcpt1_r

type variables
st_print i_print
string is_item
date   id_date1, id_date2
date   id_startday, id_endday
datawindowchild idwc_area, idwc_no

end variables

on w_ipnotrcpt1_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_area=create dw_area
this.st_2=create st_2
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_13
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.st_14
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_10
this.Control[iCurrent+11]=this.cb_14
this.Control[iCurrent+12]=this.cb_15
this.Control[iCurrent+13]=this.cb_16
this.Control[iCurrent+14]=this.pb_1
end on

on w_ipnotrcpt1_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = FALSE
dw_1.sharedata(dw_2)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area

// 전체품목
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("item_no", idwc_no)
idwc_no.settransobject(SQLCA)

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/dd"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))
id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

idwc_no.insertrow(1)
idwc_no.setitem(1, "item_no", "%")
idwc_no.setitem(1, "item_name", "전체")

if LeftA(gs_team,1) = "9" then
	dw_3.object.item_no[1] = "%"
end if

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

end event

type pb_save from w_inheritance`pb_save within w_ipnotrcpt1_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ipnotrcpt1_r
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
integer taborder = 60
string dataobject = "d_ipnotrcpt1_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "order_no"
		ls_col  = "발주번호"
		ls_text = this.object.order_no[row]
	case "supp_supp_name"
		ls_col  = "구매처"
		ls_text = this.object.supp_supp_name[row]
	case "groupitem_item_name"
		ls_col  = "물품명"
		ls_text = this.object.groupitem_item_name[row]
	case "qa"
		ls_col  = "규격"
		ls_text = this.object.qa[row]
	case "uom"
		ls_col  = "단위"
		ls_text = this.object.uom[row]
	case "due_date"
		ls_col  = "납기일자"
		ls_text = string(this.object.due_date[row])
	case "a"
		ls_col  = "발주수량"
		ls_text = string(this.object.a[row])
	case "rlse_qty"
		ls_col  = "입고수량"
		ls_text = string(this.object.rlse_qty[row])
	case "compute_1"
		ls_col  = "미입고수량"
		ls_text = string(this.object.compute_1[row])
end choose

choose case ls_col
	case "납기일자", "발주수량", "입고수량", "미입고수량"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

end event

type dw_2 from w_inheritance`dw_2 within w_ipnotrcpt1_r
integer x = 1344
integer y = 68
integer width = 96
integer height = 72
integer taborder = 70
string dataobject = "d_ipnotrcpt1_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ipnotrcpt1_r
integer x = 32
integer y = 32
integer width = 1257
string text = "물품별 미입고현황"
end type

type st_tips from w_inheritance`st_tips within w_ipnotrcpt1_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipnotrcpt1_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipnotrcpt1_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipnotrcpt1_r
integer x = 4421
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipnotrcpt1_r
integer x = 4229
integer y = 48
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품별 미입고현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipnotrcpt1_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipnotrcpt1_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipnotrcpt1_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipnotrcpt1_r
integer x = 4037
integer y = 48
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area

dw_3.accepttext()

ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then	ls_area = "%"
if is_item = "" then is_item = "%"

dw_1.reset()
ll_row = dw_1.retrieve( is_item, id_date1, id_date2, ls_area )
if ll_row < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipnotrcpt1_r
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 80
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_ipnotrcpt1_r
integer y = 344
integer width = 4590
integer height = 2424
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_ipnotrcpt1_r
integer x = 4014
integer y = 8
integer width = 613
end type

type gb_4 from groupbox within w_ipnotrcpt1_r
integer x = 2345
integer y = 8
integer width = 1627
integer height = 204
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_3 from datawindow within w_ipnotrcpt1_r
integer x = 2907
integer y = 44
integer width = 1038
integer height = 160
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ipsupp1_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_1.reset()
this.accepttext()

is_item     = this.object.item_no[1]
id_startday = this.object.ymd1[1]
id_endday   = this.object.ymd2[1]

end event

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'ymd1'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd1[row] = datetime(date(message.stringparm))
		end if
		this.SetColumn('ymd2')
	CASE 'ymd2'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd2[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.postevent(itemchanged!)

end event

type dw_area from datawindow within w_ipnotrcpt1_r
integer x = 2377
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

type st_2 from statictext within w_ipnotrcpt1_r
integer x = 2377
integer y = 44
integer width = 521
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_13 from statictext within w_ipnotrcpt1_r
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_ipnotrcpt1_r
integer x = 261
integer y = 264
integer width = 402
integer height = 532
integer taborder = 130
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
string item[] = {"발주번호","구매처","물품명","규격","단위","납기일자","발주수량","입고수량","미입고수량"}
end type

type st_14 from statictext within w_ipnotrcpt1_r
integer x = 681
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

type ddlb_op from dropdownlistbox within w_ipnotrcpt1_r
integer x = 850
integer y = 264
integer width = 279
integer height = 512
integer taborder = 140
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

type sle_value from singlelineedit within w_ipnotrcpt1_r
integer x = 1143
integer y = 264
integer width = 704
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

type cb_10 from commandbutton within w_ipnotrcpt1_r
integer x = 1856
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
			ls_col  = "order_no"
		case "구매처"
			ls_col  = "supp_supp_name"
		case "물품명"
			ls_col  = "groupitem_item_name"
		case "규격"
			ls_col  = "qa"
		case "단위"
			ls_col  = "uom"
		case "납기일자"
			ls_col  = "due_date"
		case "발주수량"
			ls_col  = "a"
		case "입고수량"
			ls_col  = "rlse_qty"
		case "미입고수량"
			ls_col  = "compute_1"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "due_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "a", "rlse_qty", "compute_1"
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

type cb_14 from commandbutton within w_ipnotrcpt1_r
integer x = 2007
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
string text = "해지"
end type

event clicked;//
ddlb_fld.text  = "물품명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()

pb_retrieve.triggerevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_15 from commandbutton within w_ipnotrcpt1_r
integer x = 2158
integer y = 264
integer width = 146
integer height = 76
integer taborder = 180
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
		ls_col  = "order_no"
	case "구매처"
		ls_col  = "supp_supp_name"
	case "물품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "qa"
	case "단위"
		ls_col  = "uom"
	case "납기일자"
		ls_col  = "due_date"
	case "발주수량"
		ls_col  = "a"
	case "입고수량"
		ls_col  = "rlse_qty"
	case "미입고수량"
		ls_col  = "compute_1"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_ipnotrcpt1_r
integer x = 2304
integer y = 264
integer width = 146
integer height = 76
integer taborder = 190
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
		ls_col  = "order_no"
	case "구매처"
		ls_col  = "supp_supp_name"
	case "물품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "qa"
	case "단위"
		ls_col  = "uom"
	case "납기일자"
		ls_col  = "due_date"
	case "발주수량"
		ls_col  = "a"
	case "입고수량"
		ls_col  = "rlse_qty"
	case "미입고수량"
		ls_col  = "compute_1"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type pb_1 from picturebutton within w_ipnotrcpt1_r
integer x = 1934
integer y = 24
integer width = 398
integer height = 188
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품선택"
boolean default = true
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;gs_where2 lstr_where
string ls_null
long   ll_row

dw_3.accepttext()

lstr_where.chk = "S"
openwithparm(w_whitemselectmulti_w,lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk = "Y" then
	dw_3.SETREDRAW(FALSE)
	dw_3.object.item_no[1] = lstr_where.str1[1]
	setnull(ls_null)
	dw_3.SETREDRAW(TRUE)
	pb_retrieve.triggerevent(clicked!)
end if

end event

