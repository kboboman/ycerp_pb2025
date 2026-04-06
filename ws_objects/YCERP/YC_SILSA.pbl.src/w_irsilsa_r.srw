$PBExportHeader$w_irsilsa_r.srw
$PBExportComments$실사목록보고서(1998/05/13,곽용덕)
forward 
global type w_irsilsa_r from w_inheritance
end type
type dw_4 from datawindow within w_irsilsa_r
end type
type sle_1 from singlelineedit within w_irsilsa_r
end type
type rb_1 from radiobutton within w_irsilsa_r
end type
type rb_2 from radiobutton within w_irsilsa_r
end type
type rb_3 from radiobutton within w_irsilsa_r
end type
type rb_4 from radiobutton within w_irsilsa_r
end type
type st_3 from statictext within w_irsilsa_r
end type
type em_1 from editmask within w_irsilsa_r
end type
type st_1 from statictext within w_irsilsa_r
end type
type ddlb_fld from dropdownlistbox within w_irsilsa_r
end type
type ddlb_dwtitles from dropdownlistbox within w_irsilsa_r
end type
type st_2 from statictext within w_irsilsa_r
end type
type ddlb_op from dropdownlistbox within w_irsilsa_r
end type
type sle_value from singlelineedit within w_irsilsa_r
end type
type cb_2 from commandbutton within w_irsilsa_r
end type
type cb_3 from commandbutton within w_irsilsa_r
end type
type cb_4 from commandbutton within w_irsilsa_r
end type
type cb_5 from commandbutton within w_irsilsa_r
end type
type gb_4 from groupbox within w_irsilsa_r
end type
end forward

global type w_irsilsa_r from w_inheritance
integer y = 36
integer width = 3634
integer height = 2204
string title = "실사목록표 출력(w_irsilsa_r)"
dw_4 dw_4
sle_1 sle_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_3 st_3
em_1 em_1
st_1 st_1
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
gb_4 gb_4
end type
global w_irsilsa_r w_irsilsa_r

type variables
//
st_print i_print
datawindowchild  idwc_loc
string is_dw

end variables

on w_irsilsa_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.sle_1=create sle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_3=create st_3
this.em_1=create em_1
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_4
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.gb_4
end on

on w_irsilsa_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.sle_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_4.settransobject(sqlca)
dw_2.insertrow(0)

dw_2.getchild("loc_no", idwc_loc)
idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

dw_4.visible = false

em_1.text  = string(today(), "yyyy/mm")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_irsilsa_r
boolean visible = false
integer x = 3159
integer y = 48
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_irsilsa_r
integer x = 32
integer y = 420
integer width = 3520
integer height = 1644
integer taborder = 50
string dataobject = "d_irincoun_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_irsilsa_r
integer x = 32
integer y = 28
integer width = 1083
integer height = 136
string text = "실사목록표 출력"
end type

type st_tips from w_inheritance`st_tips within w_irsilsa_r
end type

type pb_compute from w_inheritance`pb_compute within w_irsilsa_r
boolean visible = false
integer x = 1687
integer y = 68
integer height = 140
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_irsilsa_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_irsilsa_r
integer x = 3319
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irsilsa_r
integer x = 3131
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;w_repsuper w_print

string ls_year, ls_mon, ls_location, ls_code, ls_name
 
dw_2.accepttext()
ls_location = trim(dw_2.object.loc_no[1])

if isnull(ls_location) then
	messagebox('오류','저장소를 입력하십시오.',exclamation!)
	return	
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_year = LeftA(em_1.text,4)
ls_mon  = RightA(em_1.text,2)

dw_4.reset()
CHOOSE CASE rb_1.checked
	CASE true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	CASE ELSE
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
END CHOOSE

if dw_4.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name) < 1 then return

i_print.st_datawindow = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 실사목록 리스트를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_irsilsa_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_irsilsa_r
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_irsilsa_r
boolean visible = false
integer x = 2775
integer y = 48
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_irsilsa_r
integer x = 2944
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_year, ls_mon, ls_location, ls_code, ls_name
 
ls_location = trim(dw_2.object.loc_no[1])

if isnull(ls_location) then
	messagebox('오류','저장소를 입력하십시오.',exclamation!)
	return	
end if

ls_year = LeftA(em_1.text,4)
ls_mon  = RightA(em_1.text,2)

choose case rb_1.checked
	case true
		ls_code = sle_1.text + "%"
		ls_name = "%"
		
	case else
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
end choose

dw_1.reset()
dw_1.retrieve( ls_location, ls_year, ls_mon, ls_code, ls_name )

end event

type gb_3 from w_inheritance`gb_3 within w_irsilsa_r
integer x = 32
integer y = 240
integer width = 3520
integer height = 160
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_irsilsa_r
integer x = 1175
integer y = 8
integer width = 1294
integer height = 204
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_irsilsa_r
integer x = 2894
integer y = 8
integer width = 658
integer taborder = 40
integer textsize = -10
end type

type dw_2 from w_inheritance`dw_2 within w_irsilsa_r
integer x = 1463
integer y = 80
integer width = 992
integer height = 88
integer taborder = 60
string dataobject = "d_irsilsainput_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;dw_1.reset()

end event

type dw_4 from datawindow within w_irsilsa_r
integer x = 50
integer y = 188
integer width = 78
integer height = 60
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_irincoun_r"
boolean livescroll = true
end type

type sle_1 from singlelineedit within w_irsilsa_r
integer x = 2981
integer y = 288
integer width = 521
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
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_irsilsa_r
integer x = 2583
integer y = 312
integer width = 215
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
string text = "코드"
boolean checked = true
end type

type rb_2 from radiobutton within w_irsilsa_r
integer x = 2807
integer y = 312
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
string text = "명"
end type

type rb_3 from radiobutton within w_irsilsa_r
integer x = 1211
integer y = 48
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
boolean checked = true
end type

event clicked;idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

end event

type rb_4 from radiobutton within w_irsilsa_r
integer x = 1211
integer y = 124
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

event clicked;idwc_loc.setfilter("loc_type = 'Y'")
idwc_loc.filter()

end event

type st_3 from statictext within w_irsilsa_r
integer x = 2533
integer y = 52
integer width = 297
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_irsilsa_r
integer x = 2533
integer y = 124
integer width = 297
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

type st_1 from statictext within w_irsilsa_r
integer x = 82
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_irsilsa_r
integer x = 270
integer y = 288
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_irsilsa_r
integer x = 311
integer y = 300
integer width = 311
integer height = 88
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

type st_2 from statictext within w_irsilsa_r
integer x = 768
integer y = 304
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

type ddlb_op from dropdownlistbox within w_irsilsa_r
integer x = 937
integer y = 288
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_irsilsa_r
integer x = 1257
integer y = 296
integer width = 567
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
end type

type cb_2 from commandbutton within w_irsilsa_r
integer x = 1829
integer y = 296
integer width = 160
integer height = 76
integer taborder = 90
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

type cb_3 from commandbutton within w_irsilsa_r
integer x = 1993
integer y = 296
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_irsilsa_r
integer x = 2158
integer y = 296
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

type cb_5 from commandbutton within w_irsilsa_r
integer x = 2322
integer y = 296
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

type gb_4 from groupbox within w_irsilsa_r
integer x = 2496
integer y = 8
integer width = 370
integer height = 204
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

