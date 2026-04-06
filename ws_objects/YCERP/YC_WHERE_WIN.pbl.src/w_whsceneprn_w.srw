$PBExportHeader$w_whsceneprn_w.srw
$PBExportComments$현장관리 프린트 조건 윈도우(1998/05/08, 정재수)
forward 
global type w_whsceneprn_w from window
end type
type pb_2 from picturebutton within w_whsceneprn_w
end type
type pb_1 from picturebutton within w_whsceneprn_w
end type
type st_1 from statictext within w_whsceneprn_w
end type
type em_2 from editmask within w_whsceneprn_w
end type
type em_1 from editmask within w_whsceneprn_w
end type
type rb_2 from radiobutton within w_whsceneprn_w
end type
type rb_1 from radiobutton within w_whsceneprn_w
end type
type gb_1 from groupbox within w_whsceneprn_w
end type
end forward

global type w_whsceneprn_w from window
integer x = 832
integer y = 360
integer width = 1326
integer height = 640
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_1 st_1
em_2 em_2
em_1 em_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_whsceneprn_w w_whsceneprn_w

type variables
gs_codere_str  ist_code
end variables

on w_whsceneprn_w.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_1,&
this.em_2,&
this.em_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_whsceneprn_w.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;ist_code = message.powerobjectparm


end event

type pb_2 from picturebutton within w_whsceneprn_w
integer x = 1006
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
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whsceneprn_w
integer x = 722
integer y = 392
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

if rb_1.checked = true then
	ist_code.flag = 'A'
else
	ist_code.flag = 'P'
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = trim(em_2.text)
end if

CloseWithReturn(parent, ist_code)
end event

type st_1 from statictext within w_whsceneprn_w
integer x = 837
integer y = 240
integer width = 46
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_whsceneprn_w
integer x = 878
integer y = 228
integer width = 389
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxx"
boolean autoskip = true
string displaydata = "?a"
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	this.text = lst_whcustret.cust_no
end if

end event

type em_1 from editmask within w_whsceneprn_w
integer x = 448
integer y = 228
integer width = 389
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxx"
boolean autoskip = true
string displaydata = ""
end type

event modified;if not isnull(em_2.text) or trim(em_2.text) <> "" then
	em_2.text = this.text
end if

end event

event rbuttondown;gs_whcustret_str lst_whcustret

OpenWithParm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_whcustret.cust_chk = 'Y' then
	this.text = lst_whcustret.cust_no
end if

end event

type rb_2 from radiobutton within w_whsceneprn_w
integer x = 46
integer y = 228
integer width = 402
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "부분출력"
end type

event clicked;em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968
end event

type rb_1 from radiobutton within w_whsceneprn_w
integer x = 46
integer y = 116
integer width = 402
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체출력"
boolean checked = true
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type gb_1 from groupbox within w_whsceneprn_w
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
string text = "출력조건"
end type

