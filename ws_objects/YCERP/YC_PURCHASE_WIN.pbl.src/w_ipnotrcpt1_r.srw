$PBExportHeader$w_ipnotrcpt1_r.srw
$PBExportComments$물품별 미입고현황(1998/10/15,곽용덕)
forward 
global type w_ipnotrcpt1_r from w_inheritance
end type
type dw_3 from datawindow within w_ipnotrcpt1_r
end type
type dw_area from datawindow within w_ipnotrcpt1_r
end type
type st_2 from statictext within w_ipnotrcpt1_r
end type
type pb_1 from picturebutton within w_ipnotrcpt1_r
end type
type st_3 from statictext within w_ipnotrcpt1_r
end type
type ddlb_fld from dropdownlistbox within w_ipnotrcpt1_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ipnotrcpt1_r
end type
type st_4 from statictext within w_ipnotrcpt1_r
end type
type ddlb_op from dropdownlistbox within w_ipnotrcpt1_r
end type
type sle_value from singlelineedit within w_ipnotrcpt1_r
end type
type cb_1 from commandbutton within w_ipnotrcpt1_r
end type
type cb_2 from commandbutton within w_ipnotrcpt1_r
end type
type cb_3 from commandbutton within w_ipnotrcpt1_r
end type
type cb_5 from commandbutton within w_ipnotrcpt1_r
end type
end forward

global type w_ipnotrcpt1_r from w_inheritance
integer width = 4110
integer height = 1784
string title = "물품별 미입고현황(w_ipnotrcpt1_r)"
dw_3 dw_3
dw_area dw_area
st_2 st_2
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_ipnotrcpt1_r w_ipnotrcpt1_r

type variables
st_print i_print
string is_dw, is_item
date   id_date1, id_date2
date   id_startday, id_endday
datawindowchild idwc_area, idwc_no

end variables

on w_ipnotrcpt1_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_area=create dw_area
this.st_2=create st_2
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_area
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
end on

on w_ipnotrcpt1_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
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

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

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
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_ipnotrcpt1_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ipnotrcpt1_r
integer x = 32
integer y = 408
integer width = 4009
integer height = 1244
integer taborder = 60
string dataobject = "d_ipnotrcpt1_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ipnotrcpt1_r
integer x = 32
integer y = 20
integer width = 1257
integer height = 140
string text = "미입고현황(물품별)"
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
integer x = 3817
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipnotrcpt1_r
integer x = 3625
integer y = 56
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
integer x = 3433
integer y = 56
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
integer width = 4009
integer height = 164
integer taborder = 80
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_ipnotrcpt1_r
integer x = 1330
integer y = 16
integer width = 2053
integer height = 204
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipnotrcpt1_r
integer x = 3401
integer y = 16
integer width = 635
end type

type dw_2 from w_inheritance`dw_2 within w_ipnotrcpt1_r
integer x = 41
integer y = 180
integer width = 78
integer height = 52
integer taborder = 70
string dataobject = "d_ipnotrcpt1_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ipnotrcpt1_r
integer x = 1893
integer y = 52
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

event rbuttondown;//
gs_calendar lstr_calendar

choose case dwo.name
	case "ymd1", "ymd2"
		lstr_calendar.sdate = string(this.object.ymd1[1])
		lstr_calendar.edate = string(this.object.ymd2[1])
		OpenWithParm(w_calendar2, lstr_calendar)
		lstr_calendar = Message.PowerObjectParm
		
		if lstr_calendar.chk <> 'N' then
			this.object.ymd1[1] = date(lstr_calendar.sdate)
			this.object.ymd2[1] = date(lstr_calendar.edate)
		end if
end choose

this.postevent(itemchanged!)

end event

type dw_area from datawindow within w_ipnotrcpt1_r
integer x = 1362
integer y = 128
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
integer x = 1362
integer y = 52
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

type pb_1 from picturebutton within w_ipnotrcpt1_r
integer x = 2949
integer y = 52
integer width = 398
integer height = 152
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

type st_3 from statictext within w_ipnotrcpt1_r
integer x = 87
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_ipnotrcpt1_r
integer x = 274
integer y = 280
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ipnotrcpt1_r
integer x = 306
integer y = 292
integer width = 311
integer height = 88
integer taborder = 130
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

type st_4 from statictext within w_ipnotrcpt1_r
integer x = 745
integer y = 296
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
integer x = 914
integer y = 280
integer width = 297
integer height = 512
integer taborder = 130
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

type sle_value from singlelineedit within w_ipnotrcpt1_r
integer x = 1234
integer y = 284
integer width = 567
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ipnotrcpt1_r
integer x = 1806
integer y = 284
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ipnotrcpt1_r
integer x = 1970
integer y = 284
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose

ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ipnotrcpt1_r
integer x = 2135
integer y = 284
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ipnotrcpt1_r
integer x = 2299
integer y = 284
integer width = 160
integer height = 76
integer taborder = 140
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

