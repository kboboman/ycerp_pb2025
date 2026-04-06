$PBExportHeader$w_cditemcalc_m.srw
$PBExportComments$제품별 계산식관리(98/03/10,이인호)
forward
global type w_cditemcalc_m from w_inheritance
end type
type st_8 from statictext within w_cditemcalc_m
end type
type ddlb_col from dropdownlistbox within w_cditemcalc_m
end type
type st_9 from statictext within w_cditemcalc_m
end type
type ddlb_2 from dropdownlistbox within w_cditemcalc_m
end type
type sle_value from singlelineedit within w_cditemcalc_m
end type
type cb_filteron from commandbutton within w_cditemcalc_m
end type
type cb_filteroff from commandbutton within w_cditemcalc_m
end type
type cb_11 from commandbutton within w_cditemcalc_m
end type
type cb_12 from commandbutton within w_cditemcalc_m
end type
end forward

global type w_cditemcalc_m from w_inheritance
integer x = 82
integer y = 212
integer width = 3538
integer height = 2016
string title = "품목별 계산식관리(w_cditemcalc_m)"
boolean resizable = false
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
end type
global w_cditemcalc_m w_cditemcalc_m

type variables
string is_where,is_select,is_clause,is_select1,is_where1,is_clause1
st_print i_print
datawindowchild idwc_item,idwc_date
int il_row = 0
string ls_dr
end variables

on w_cditemcalc_m.create
int iCurrent
call super::create
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.ddlb_col
this.Control[iCurrent+3]=this.st_9
this.Control[iCurrent+4]=this.ddlb_2
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_filteron
this.Control[iCurrent+7]=this.cb_filteroff
this.Control[iCurrent+8]=this.cb_11
this.Control[iCurrent+9]=this.cb_12
end on

on w_cditemcalc_m.destroy
call super::destroy
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
end event

event resize;call super::resize;//
this.width  = 3506
gb_2.height = this.height - 372
dw_1.height = this.height - 552

end event

type pb_save from w_inheritance`pb_save within w_cditemcalc_m
integer x = 3067
integer y = 76
end type

event pb_save::clicked;integer li_count
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.Accepttext()
li_count = wf_modifycount(dw_1)
IF li_count >= 1 THEN
	   wf_update1(dw_1, 'Y')
END IF

end event

type dw_1 from w_inheritance`dw_1 within w_cditemcalc_m
event mousemove pbm_mousemove
integer x = 73
integer y = 392
integer width = 3369
integer height = 1464
string dragicon = "C:\Bmp\Arrowl.ico"
string dataobject = "d_cditemcalc_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;string ls_col, ls_text

if row < 1 then return
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

choose case dwo.name
	case "item_no"
		ls_col  = "품목코드"
		ls_text = string(this.object.item_no[row])
	case "groupitem_item_name"
		ls_col  = "품목명"
		ls_text = string(this.object.groupitem_item_name[row])
	case "calc_cd"
		ls_col  = "계산식"
		ls_text = this.object.calc_cd[row]
end choose

choose case ls_col
	case "계산식"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text



end event

type dw_2 from w_inheritance`dw_2 within w_cditemcalc_m
integer x = 1883
integer y = 68
integer width = 123
integer height = 88
string dataobject = "d_cditemcalc_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_cditemcalc_m
integer width = 1545
string text = "품목별계산식 관리(YSP)"
end type

type st_tips from w_inheritance`st_tips within w_cditemcalc_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemcalc_m
boolean visible = false
integer x = 2770
integer y = 48
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemcalc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemcalc_m
integer x = 3259
integer y = 76
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemcalc_m
integer x = 2875
integer y = 76
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 제품별 계산식 리스트를 출력합니다." 
i_print.name = 'd_cditemcalc_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemcalc_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cditemcalc_m
integer x = 2683
integer y = 76
end type

event pb_delete::clicked;call super::clicked;dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_cditemcalc_m
integer x = 2491
integer y = 76
end type

event pb_insert::clicked;gs_where2 lstr_where
long ll_row, ll_cnt, ll_count

pb_retrieve.triggerevent(clicked!)
ll_count = dw_1.rowcount()

openwithparm(w_whitemselectmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return
dw_1.SETREDRAW(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)
	dw_1.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_1.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next
dw_1.scrolltorow(ll_count + 1)
dw_1.SETREDRAW(TRUE)



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemcalc_m
integer x = 2299
integer y = 76
end type

event pb_retrieve::clicked;dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cditemcalc_m
boolean visible = false
integer x = 27
integer y = 224
integer width = 3538
integer height = 156
end type

type gb_2 from w_inheritance`gb_2 within w_cditemcalc_m
integer x = 46
integer y = 240
integer width = 3424
integer height = 1644
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_cditemcalc_m
integer x = 2277
integer y = 36
integer width = 1193
end type

type st_8 from statictext within w_cditemcalc_m
integer x = 110
integer y = 308
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

type ddlb_col from dropdownlistbox within w_cditemcalc_m
integer x = 288
integer y = 292
integer width = 402
integer height = 532
integer taborder = 70
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
string item[] = {"품목코드","품명","계산식"}
end type

type st_9 from statictext within w_cditemcalc_m
integer x = 709
integer y = 308
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

type ddlb_2 from dropdownlistbox within w_cditemcalc_m
integer x = 878
integer y = 292
integer width = 279
integer height = 512
integer taborder = 80
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

type sle_value from singlelineedit within w_cditemcalc_m
integer x = 1184
integer y = 292
integer width = 658
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cditemcalc_m
integer x = 1856
integer y = 292
integer width = 238
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "품목코드"
			ls_col = "item_no "
		case "품목명"
			ls_col = "groupitem_item_name "
		case "계산식"
			ls_col = "calc_cd "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + "datetime('" + trim(sle_value.text) + "') "
		elseif ls_col = "calc_cd " then
			ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end if
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
dw_1.triggerevent(rowfocuschanged!)

end event

type cb_filteroff from commandbutton within w_cditemcalc_m
integer x = 2094
integer y = 292
integer width = 238
integer height = 76
integer taborder = 30
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_11 from commandbutton within w_cditemcalc_m
integer x = 2331
integer y = 292
integer width = 238
integer height = 76
integer taborder = 40
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
String ls_col
choose case trim(ddlb_col.text)
	case "품목코드"
		ls_col = "item_no "
	case "품목명"
		ls_col = "groupitem_item_name "
	case "계산식"
		ls_col = "calc_cd "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_cditemcalc_m
integer x = 2569
integer y = 292
integer width = 238
integer height = 76
integer taborder = 50
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
String ls_col
choose case trim(ddlb_col.text)
	case "품목코드"
		ls_col = "item_no "
	case "품목명"
		ls_col = "groupitem_item_name "
	case "계산식"
		ls_col = "calc_cd "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

