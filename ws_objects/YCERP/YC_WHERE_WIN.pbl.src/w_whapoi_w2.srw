$PBExportHeader$w_whapoi_w2.srw
$PBExportComments$구매일보/월보 출력 조건(1999/06/010, 이인호)
forward 
global type w_whapoi_w2 from window
end type
type rb_2 from radiobutton within w_whapoi_w2
end type
type rb_1 from radiobutton within w_whapoi_w2
end type
type ddlb_3 from dropdownlistbox within w_whapoi_w2
end type
type ddlb_2 from dropdownlistbox within w_whapoi_w2
end type
type ddlb_1 from dropdownlistbox within w_whapoi_w2
end type
type em_1 from editmask within w_whapoi_w2
end type
type pb_2 from picturebutton within w_whapoi_w2
end type
type pb_1 from picturebutton within w_whapoi_w2
end type
type gb_1 from groupbox within w_whapoi_w2
end type
end forward

global type w_whapoi_w2 from window
integer x = 832
integer y = 360
integer width = 1326
integer height = 640
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 79220952
boolean center = true
rb_2 rb_2
rb_1 rb_1
ddlb_3 ddlb_3
ddlb_2 ddlb_2
ddlb_1 ddlb_1
em_1 em_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_whapoi_w2 w_whapoi_w2

type variables
gs_codere_str  ist_code
int ii_year, ii_mon
end variables

on w_whapoi_w2.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.ddlb_3=create ddlb_3
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.em_1=create em_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.rb_2,&
this.rb_1,&
this.ddlb_3,&
this.ddlb_2,&
this.ddlb_1,&
this.em_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_whapoi_w2.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.ddlb_3)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;ist_code = message.powerobjectparm
ddlb_1.text = "상품"
ist_code.flag = "S"
em_1.text = string(today(),"YYYY/MM/DD")
ddlb_2.text = string(today(),"YYYY")
ddlb_3.text = string(today(),"MM")

end event

type rb_2 from radiobutton within w_whapoi_w2
integer x = 55
integer y = 252
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월보"
end type

event clicked;if	this.checked = true then
	em_1.enabled = false
	ddlb_2.enabled = true
	ddlb_3.enabled = true
end if
end event

type rb_1 from radiobutton within w_whapoi_w2
integer x = 55
integer y = 128
integer width = 233
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "일보"
boolean checked = true
end type

event clicked;if	this.checked = true then
	em_1.enabled = true
	ddlb_2.enabled = false
	ddlb_3.enabled = false
end if
end event

type ddlb_3 from dropdownlistbox within w_whapoi_w2
integer x = 667
integer y = 248
integer width = 215
integer height = 772
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_mon = integer(this.text)

end event

type ddlb_2 from dropdownlistbox within w_whapoi_w2
integer x = 402
integer y = 248
integer width = 247
integer height = 772
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
string item[] = {"1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_mon = integer(this.text)

end event

type ddlb_1 from dropdownlistbox within w_whapoi_w2
integer x = 910
integer y = 112
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
string item[] = {"상품","원자재","부자재","외주가공","공사원가"}
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
	CASE 5
		ist_code.flag = "A"
END CHOOSE

end event

type em_1 from editmask within w_whapoi_w2
integer x = 320
integer y = 112
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

type pb_2 from picturebutton within w_whapoi_w2
integer x = 1006
integer y = 392
integer width = 279
integer height = 144
integer taborder = 50
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

type pb_1 from picturebutton within w_whapoi_w2
integer x = 722
integer y = 392
integer width = 279
integer height = 144
integer taborder = 40
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

event clicked;//
ist_code.okcancel = 'Y'

if rb_1.checked = true then
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = "N"
else
	ist_code.start_no = trim(string(ddlb_2.text))
	ist_code.end_no = trim(string(ddlb_3.text))
end if

closewithreturn(parent, ist_code)

end event

type gb_1 from groupbox within w_whapoi_w2
integer x = 27
integer y = 12
integer width = 1262
integer height = 364
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

