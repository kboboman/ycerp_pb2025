$PBExportHeader$w_mpslititemt_r.srw
$PBExportComments$물품별 스리팅현황(집계)
forward 
global type w_mpslititemt_r from w_inheritance
end type
type gb_4 from groupbox within w_mpslititemt_r
end type
type dw_3 from datawindow within w_mpslititemt_r
end type
type em_1 from editmask within w_mpslititemt_r
end type
type em_2 from editmask within w_mpslititemt_r
end type
type dw_area from datawindow within w_mpslititemt_r
end type
type pb_1 from picturebutton within w_mpslititemt_r
end type
type st_2 from statictext within w_mpslititemt_r
end type
type st_13 from statictext within w_mpslititemt_r
end type
type ddlb_fld from dropdownlistbox within w_mpslititemt_r
end type
type st_14 from statictext within w_mpslititemt_r
end type
type ddlb_op from dropdownlistbox within w_mpslititemt_r
end type
type sle_value from singlelineedit within w_mpslititemt_r
end type
type cb_10 from commandbutton within w_mpslititemt_r
end type
type cb_14 from commandbutton within w_mpslititemt_r
end type
type cb_15 from commandbutton within w_mpslititemt_r
end type
type cb_16 from commandbutton within w_mpslititemt_r
end type
type rb_1 from radiobutton within w_mpslititemt_r
end type
type rb_2 from radiobutton within w_mpslititemt_r
end type
type rb_3 from radiobutton within w_mpslititemt_r
end type
type cbx_loc from checkbox within w_mpslititemt_r
end type
type dw_4 from datawindow within w_mpslititemt_r
end type
type dw_5 from datawindow within w_mpslititemt_r
end type
type rb_4 from radiobutton within w_mpslititemt_r
end type
type st_1 from statictext within w_mpslititemt_r
end type
end forward

global type w_mpslititemt_r from w_inheritance
integer x = 5
integer y = 36
integer width = 4695
integer height = 2896
string title = "물품별 원재료 출고현황(집계)(w_mpslititemt_r)"
gb_4 gb_4
dw_3 dw_3
em_1 em_1
em_2 em_2
dw_area dw_area
pb_1 pb_1
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
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cbx_loc cbx_loc
dw_4 dw_4
dw_5 dw_5
rb_4 rb_4
st_1 st_1
end type
global w_mpslititemt_r w_mpslititemt_r

type variables
date   id_date1, id_date2
string is_locno, is_wcno

st_print i_print
datawindowchild idwc_area, idwc_loc, idwc_wc

end variables

on w_mpslititemt_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.pb_1=create pb_1
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
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cbx_loc=create cbx_loc
this.dw_4=create dw_4
this.dw_5=create dw_5
this.rb_4=create rb_4
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_13
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.st_14
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_10
this.Control[iCurrent+14]=this.cb_14
this.Control[iCurrent+15]=this.cb_15
this.Control[iCurrent+16]=this.cb_16
this.Control[iCurrent+17]=this.rb_1
this.Control[iCurrent+18]=this.rb_2
this.Control[iCurrent+19]=this.rb_3
this.Control[iCurrent+20]=this.cbx_loc
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.dw_5
this.Control[iCurrent+23]=this.rb_4
this.Control[iCurrent+24]=this.st_1
end on

on w_mpslititemt_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.pb_1)
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
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cbx_loc)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.rb_4)
destroy(this.st_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_4.visible = false
dw_5.visible = false

dw_1.settransobject(sqlca)
dw_1.sharedata(dw_2)

dw_4.settransobject(sqlca)
dw_4.sharedata(dw_5)

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

// 전체저장소
dw_3.settransobject(sqlca)
dw_3.insertrow(0)  

em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")
id_date1  = date(em_1.text)
id_date2  = date(em_2.text)

idwc_loc.setredraw(false)
dw_3.getchild("loc_no", idwc_loc)
idwc_loc.settransobject(sqlca)
idwc_loc.insertrow(1)
idwc_loc.setitem(1, "loc_no", " ")
idwc_loc.setitem(1, "loc_name", "전체")

dw_3.object.loc_no[1] = " " // 전체
idwc_loc.accepttext()
idwc_loc.setredraw(false)

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_mpslititemt_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_mpslititemt_r
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
integer taborder = 50
string dataobject = "d_mpcoilouttot_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return
this.scrolltorow(row)

// 
string ls_col, ls_text

choose case dwo.name
	case "item_name"
		ls_col  = "물품명"
		ls_text = string(this.object.item_name[row])
	case "qa"
		ls_col  = "규격"
		ls_text = string(this.object.qa[row])
	case "uom"
		ls_col  = "단위"
		ls_text = string(this.object.uom[row])
	case "qty"
		ls_col  = "수량"
		ls_text = string(this.object.qty[row])
	case "c_qty"
		ls_col  = "환산수량"
		ls_text = string(this.object.c_qty[row])
	case "c_price"
		ls_col  = "단가"
		ls_text = string(this.object.c_price[row])
	case "c_amt"
		ls_col  = "공급가액"
		ls_text = string(this.object.c_amt[row])
	case "c_rate"
		ls_col  = "세액"
		ls_text = string(this.object.c_rate[row])
	case "c_tot"
		ls_col  = "합계"
		ls_text = string(this.object.c_tot[row])
end choose

choose case ls_col
	case "물품명", "규격", "단위"
		ddlb_op.text = "LIKE"
	case else
		ddlb_op.text = "="
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

end event

type st_title from w_inheritance`st_title within w_mpslititemt_r
integer x = 46
integer y = 40
integer width = 1696
integer height = 148
string text = "물품별 원코일 출고현황(집계)"
end type

type st_tips from w_inheritance`st_tips within w_mpslititemt_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpslititemt_r
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslititemt_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpslititemt_r
integer x = 4407
integer y = 48
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslititemt_r
integer x = 4027
integer y = 48
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
datawindow dwprt
string     ls_zoom

if cbx_loc.checked = true then
	dwprt   = dw_5
	ls_zoom = "100"
else
	dwprt   = dw_2
	ls_zoom = "80"
end if

i_print.st_datawindow  = dwprt
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 물품별 원재료 출고현황(집계)을  출력합니다." 

gs_print_control  = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=" + ls_zoom
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslititemt_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mpslititemt_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mpslititemt_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslititemt_r
integer x = 3835
integer y = 48
integer taborder = 140
end type

event pb_retrieve::clicked;st_security   lst_security
string ls_area, ls_start, ls_end, ls_category, ls_locno
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_area.accepttext()
ls_area   = trim(dw_area.object.area[1])
if isnull(ls_area)  or ls_area  = "" then ls_area  = "%"

dw_3.accepttext()
ls_start  = string(id_date1,"yyyy/mm/dd")
ls_end    = string(id_date2,"yyyy/mm/dd")
ls_locno  = trim(dw_3.object.loc_no[1])
if isnull(ls_locno) or ls_locno = "" then ls_locno = "%"


if rb_1.checked = true then		// 전체
	ls_category = "%"
elseif rb_2.checked = true then	// 판매
	ls_category = "S"
elseif rb_3.checked = true then	// 사내
	ls_category = "I"
elseif rb_4.checked = true then	// 외주
	ls_category = "O"
end if

dw_1.reset()
dw_2.reset()
dw_4.reset()
dw_5.reset()
ll_row = dw_1.retrieve(ls_area, ls_start, ls_end, ls_locno, ls_category)
ll_row = dw_4.retrieve(ls_area, ls_start, ls_end, ls_locno, ls_category)
if ll_row < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고내역이 없습니다.",information!)
	return
else
	MessageBox("확인", "조회완료.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpslititemt_r
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mpslititemt_r
integer y = 344
integer width = 4590
integer height = 2424
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpslititemt_r
integer x = 3799
integer y = 0
integer width = 823
integer height = 216
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_mpslititemt_r
integer x = 1271
integer y = 12
integer width = 114
integer height = 88
integer taborder = 60
string dataobject = "d_mpcoilouttot_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type gb_4 from groupbox within w_mpslititemt_r
integer x = 1778
integer width = 1998
integer height = 216
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

type dw_3 from datawindow within w_mpslititemt_r
integer x = 2898
integer y = 32
integer width = 859
integer height = 84
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.accepttext()

is_wcno    = trim(this.object.loc_no[row])
if is_locno = "" then	is_locno = "%"
if RightA(is_locno,2) = "00" then
	is_locno = LeftA(is_locno,1) + "%"
end if

end event

type em_1 from editmask within w_mpslititemt_r
integer x = 2894
integer y = 120
integer width = 407
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;id_date1 = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_date1 = date(this.text)

end event

type em_2 from editmask within w_mpslititemt_r
integer x = 3333
integer y = 120
integer width = 407
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;id_date2 = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_date2 = date(this.text)

end event

type dw_area from datawindow within w_mpslititemt_r
integer x = 2345
integer y = 120
integer width = 526
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

end event

type pb_1 from picturebutton within w_mpslititemt_r
event mousemove pbm_mousemove
integer x = 4215
integer y = 48
integer width = 187
integer height = 144
integer taborder = 120
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

type st_2 from statictext within w_mpslititemt_r
integer x = 2345
integer y = 36
integer width = 526
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_13 from statictext within w_mpslititemt_r
integer x = 78
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

type ddlb_fld from dropdownlistbox within w_mpslititemt_r
integer x = 251
integer y = 264
integer width = 402
integer height = 532
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
string item[] = {"품명","규격","단위","수량","환산수량","단가","공급가액","세액","합계"}
end type

type st_14 from statictext within w_mpslititemt_r
integer x = 672
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

type ddlb_op from dropdownlistbox within w_mpslititemt_r
integer x = 841
integer y = 264
integer width = 279
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpslititemt_r
integer x = 1134
integer y = 264
integer width = 704
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_10 from commandbutton within w_mpslititemt_r
integer x = 1847
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
		case "품명"
			ls_col  = "item_name"
		case "규격"
			ls_col  = "qa"
		case "단위"
			ls_col  = "uom"
		case "수량"
			ls_col  = "qty"
		case "환산수량"
			ls_col  = "c_qty"
		case "단가"
			ls_col  = "c_price"
		case "공급가액"
			ls_col  = "c_amt"
		case "세액"
			ls_col  = "c_rate"
		case "합계"
			ls_col  = "c_tot"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "insp_log_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "ship_qty", "c_qty", "c_price", "c_amt", "c_rate", "c_tot"
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

type cb_14 from commandbutton within w_mpslititemt_r
integer x = 1998
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

type cb_15 from commandbutton within w_mpslititemt_r
integer x = 2149
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
string text = "오름"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "item_name"
	case "규격"
		ls_col  = "qa"
	case "단위"
		ls_col  = "uom"
	case "수량"
		ls_col  = "qty"
	case "환산수량"
		ls_col  = "c_qty"
	case "단가"
		ls_col  = "c_price"
	case "공급가액"
		ls_col  = "c_amt"
	case "세액"
		ls_col  = "c_rate"
	case "합계"
		ls_col  = "c_tot"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_mpslititemt_r
integer x = 2295
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
string text = "내림"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "item_name"
	case "규격"
		ls_col  = "qa"
	case "단위"
		ls_col  = "uom"
	case "수량"
		ls_col  = "qty"
	case "환산수량"
		ls_col  = "c_qty"
	case "단가"
		ls_col  = "c_price"
	case "공급가액"
		ls_col  = "c_amt"
	case "세액"
		ls_col  = "c_rate"
	case "합계"
		ls_col  = "c_tot"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type rb_1 from radiobutton within w_mpslititemt_r
integer x = 1819
integer y = 48
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpslititemt_r
integer x = 2066
integer y = 48
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "판매"
end type

type rb_3 from radiobutton within w_mpslititemt_r
integer x = 1819
integer y = 128
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
end type

type cbx_loc from checkbox within w_mpslititemt_r
integer x = 3840
integer y = 276
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "저장소별 집계"
end type

event clicked;// 저장소별 집계
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = true
else
	dw_1.visible = true
	dw_4.visible = false
end if
end event

type dw_4 from datawindow within w_mpslititemt_r
integer x = 1390
integer y = 12
integer width = 114
integer height = 88
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpcoilouttot_t1"
boolean livescroll = true
end type

event clicked;if row < 1 then return
this.scrolltorow(row)

end event

type dw_5 from datawindow within w_mpslititemt_r
integer x = 1509
integer y = 12
integer width = 114
integer height = 88
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpcoilouttot_r1"
boolean livescroll = true
end type

type rb_4 from radiobutton within w_mpslititemt_r
integer x = 2066
integer y = 128
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

type st_1 from statictext within w_mpslititemt_r
integer x = 2464
integer y = 260
integer width = 1262
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "원재료(코드:M1) 출고는 판매,스리팅(사내,외주),유압,YSP직접투입"
boolean focusrectangle = false
end type

