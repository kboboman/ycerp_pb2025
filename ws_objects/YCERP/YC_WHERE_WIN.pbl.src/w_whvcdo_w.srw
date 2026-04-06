$PBExportHeader$w_whvcdo_w.srw
$PBExportComments$거래처별 여신선택(1998/5/12,성삼지)
forward 
global type w_whvcdo_w from window
end type
type st_2 from statictext within w_whvcdo_w
end type
type em_3 from editmask within w_whvcdo_w
end type
type rb_5 from radiobutton within w_whvcdo_w
end type
type rb_4 from radiobutton within w_whvcdo_w
end type
type rb_3 from radiobutton within w_whvcdo_w
end type
type pb_2 from picturebutton within w_whvcdo_w
end type
type pb_1 from picturebutton within w_whvcdo_w
end type
type st_1 from statictext within w_whvcdo_w
end type
type em_2 from editmask within w_whvcdo_w
end type
type em_1 from editmask within w_whvcdo_w
end type
type rb_2 from radiobutton within w_whvcdo_w
end type
type rb_1 from radiobutton within w_whvcdo_w
end type
type gb_2 from groupbox within w_whvcdo_w
end type
type gb_1 from groupbox within w_whvcdo_w
end type
end forward

global type w_whvcdo_w from window
integer x = 832
integer y = 360
integer width = 1326
integer height = 1020
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 79220952
boolean center = true
st_2 st_2
em_3 em_3
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
em_2 em_2
em_1 em_1
rb_2 rb_2
rb_1 rb_1
gb_2 gb_2
gb_1 gb_1
end type
global w_whvcdo_w w_whvcdo_w

type variables
gs_dovc_str  ist_code
end variables

on w_whvcdo_w.create
this.st_2=create st_2
this.em_3=create em_3
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.em_3,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.em_2,&
this.em_1,&
this.rb_2,&
this.rb_1,&
this.gb_2,&
this.gb_1}
end on

on w_whvcdo_w.destroy
destroy(this.st_2)
destroy(this.em_3)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;ist_code = message.powerobjectparm
em_3.text = string(today(),'YYYY')

end event

type st_2 from statictext within w_whvcdo_w
integer x = 608
integer y = 108
integer width = 375
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "해당년도:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_3 from editmask within w_whvcdo_w
integer x = 992
integer y = 112
integer width = 274
integer height = 76
integer taborder = 2
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = "~r"
string minmax = "1996~~2020"
end type

type rb_5 from radiobutton within w_whvcdo_w
integer x = 37
integer y = 280
integer width = 686
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "담당자별"
end type

type rb_4 from radiobutton within w_whvcdo_w
integer x = 37
integer y = 196
integer width = 594
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "팀별"
end type

type rb_3 from radiobutton within w_whvcdo_w
integer x = 37
integer y = 112
integer width = 251
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체"
boolean checked = true
end type

type pb_2 from picturebutton within w_whvcdo_w
integer x = 1006
integer y = 784
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

type pb_1 from picturebutton within w_whvcdo_w
integer x = 722
integer y = 784
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

event clicked;ist_code.okcancel = 'Y'

if rb_1.checked = true then	// 전체거래처 조회
	ist_code.sel_flag = 'A'
else
	ist_code.sel_flag = 'P'
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = trim(em_2.text)
end if

if rb_3.checked = true then	// 보고서 전체
	ist_code.order_flag = '1'
elseif rb_4.checked = true then	// 팀별
	ist_code.order_flag = '2'
else
	ist_code.order_flag = '3'
end if
ist_code.dovc_year = string(em_3.text)
closewithreturn(parent, ist_code)
end event

type st_1 from statictext within w_whvcdo_w
integer x = 855
integer y = 636
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

type em_2 from editmask within w_whvcdo_w
integer x = 901
integer y = 624
integer width = 366
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
boolean autoskip = true
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_2.text = lst_whcustret.cust_no
end if

end event

event getfocus;if not isnull(em_1.text) or trim(em_1.text) <> "" then
	em_2.text = em_1.text
end if

end event

type em_1 from editmask within w_whvcdo_w
integer x = 489
integer y = 624
integer width = 366
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
boolean autoskip = true
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_1.text = lst_whcustret.cust_no
end if
em_2.setfocus()

end event

type rb_2 from radiobutton within w_whvcdo_w
integer x = 50
integer y = 624
integer width = 439
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "부분조회"
end type

event clicked;em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968
end event

type rb_1 from radiobutton within w_whvcdo_w
integer x = 50
integer y = 504
integer width = 439
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체조회"
boolean checked = true
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type gb_2 from groupbox within w_whvcdo_w
integer x = 23
integer y = 16
integer width = 1262
integer height = 368
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "보고서선택"
end type

type gb_1 from groupbox within w_whvcdo_w
integer x = 23
integer y = 400
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
string text = "판매거래처 출력조건"
end type

