$PBExportHeader$w_whapoi_w.srw
$PBExportComments$구매일보출력 조건(1999/06/01, 이인호)
forward
global type w_whapoi_w from window
end type
type rb_3 from radiobutton within w_whapoi_w
end type
type rb_2 from radiobutton within w_whapoi_w
end type
type rb_1 from radiobutton within w_whapoi_w
end type
type st_22 from statictext within w_whapoi_w
end type
type dw_area from datawindow within w_whapoi_w
end type
type ddlb_1 from dropdownlistbox within w_whapoi_w
end type
type em_1 from editmask within w_whapoi_w
end type
type pb_2 from picturebutton within w_whapoi_w
end type
type pb_1 from picturebutton within w_whapoi_w
end type
type gb_1 from groupbox within w_whapoi_w
end type
end forward

global type w_whapoi_w from window
integer x = 832
integer y = 360
integer width = 1335
integer height = 724
boolean titlebar = true
string title = "구매일보 출력조건(w_whapoi_w)"
windowtype windowtype = response!
long backcolor = 79220952
boolean center = true
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
st_22 st_22
dw_area dw_area
ddlb_1 ddlb_1
em_1 em_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_whapoi_w w_whapoi_w

type variables
gs_codere_str ist_code
end variables

on w_whapoi_w.create
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_22=create st_22
this.dw_area=create dw_area
this.ddlb_1=create ddlb_1
this.em_1=create em_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.rb_3,&
this.rb_2,&
this.rb_1,&
this.st_22,&
this.dw_area,&
this.ddlb_1,&
this.em_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_whapoi_w.destroy
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_22)
destroy(this.dw_area)
destroy(this.ddlb_1)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;// left(dw_area.object.area[1],1)
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
//if gs_userid = 'root' or gs_userid = '1999010s' then
//else
//	dw_area.enabled = false
//end if

ist_code = message.powerobjectparm
ddlb_1.text   = "상품"
ist_code.flag = "S"
em_1.text     = string(today(),"YYYY/MM/DD")
end event

type rb_3 from radiobutton within w_whapoi_w
integer x = 763
integer y = 368
integer width = 288
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "COIL외"
end type

type rb_2 from radiobutton within w_whapoi_w
integer x = 407
integer y = 368
integer width = 233
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "COIL"
end type

type rb_1 from radiobutton within w_whapoi_w
integer x = 105
integer y = 368
integer width = 233
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type st_22 from statictext within w_whapoi_w
integer x = 87
integer y = 96
integer width = 210
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
string text = "사업장"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_whapoi_w
integer x = 297
integer y = 96
integer width = 521
integer height = 80
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type ddlb_1 from dropdownlistbox within w_whapoi_w
integer x = 782
integer y = 208
integer width = 334
integer height = 364
integer taborder = 20
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
		ist_code.flag = "S"
	CASE 2
		ist_code.flag = "W"
	CASE 3
		ist_code.flag = "B"
	CASE 4
		ist_code.flag = "Y"
END CHOOSE

end event

type em_1 from editmask within w_whapoi_w
integer x = 78
integer y = 208
integer width = 562
integer height = 100
integer taborder = 10
integer textsize = -12
integer weight = 700
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
boolean spin = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_2 from picturebutton within w_whapoi_w
integer x = 1010
integer y = 480
integer width = 279
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whapoi_w
integer x = 727
integer y = 480
integer width = 279
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'Y'

ist_code.start_no = trim(em_1.text)
ist_code.end_no   = LeftA(dw_area.object.area[1], 1)
if rb_1.checked = true then
	ist_code.sel = 'A'
elseif rb_2.checked = true then
	ist_code.sel = 'C'
else
	ist_code.sel = 'Y'
end if
closewithreturn(parent, ist_code)
end event

type gb_1 from groupbox within w_whapoi_w
integer x = 27
integer y = 12
integer width = 1262
integer height = 452
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "구매일보 출력조건"
end type

