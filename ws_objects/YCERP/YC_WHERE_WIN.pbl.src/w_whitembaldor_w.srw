$PBExportHeader$w_whitembaldor_w.srw
$PBExportComments$제품별출고/미출고보고서윈도우(1998/05/14,성삼지)
forward 
global type w_whitembaldor_w from window
end type
type st_4 from statictext within w_whitembaldor_w
end type
type em_2 from editmask within w_whitembaldor_w
end type
type em_1 from editmask within w_whitembaldor_w
end type
type rb_7 from radiobutton within w_whitembaldor_w
end type
type rb_6 from radiobutton within w_whitembaldor_w
end type
type st_3 from statictext within w_whitembaldor_w
end type
type st_2 from statictext within w_whitembaldor_w
end type
type em_4 from editmask within w_whitembaldor_w
end type
type em_3 from editmask within w_whitembaldor_w
end type
type pb_2 from picturebutton within w_whitembaldor_w
end type
type pb_1 from picturebutton within w_whitembaldor_w
end type
type st_1 from statictext within w_whitembaldor_w
end type
type rb_2 from radiobutton within w_whitembaldor_w
end type
type rb_1 from radiobutton within w_whitembaldor_w
end type
type gb_2 from groupbox within w_whitembaldor_w
end type
type gb_1 from groupbox within w_whitembaldor_w
end type
end forward

global type w_whitembaldor_w from window
integer x = 832
integer y = 360
integer width = 1326
integer height = 924
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 79220952
st_4 st_4
em_2 em_2
em_1 em_1
rb_7 rb_7
rb_6 rb_6
st_3 st_3
st_2 st_2
em_4 em_4
em_3 em_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
rb_2 rb_2
rb_1 rb_1
gb_2 gb_2
gb_1 gb_1
end type
global w_whitembaldor_w w_whitembaldor_w

type variables
gs_itembaldo_str  ist_code
end variables

on w_whitembaldor_w.create
this.st_4=create st_4
this.em_2=create em_2
this.em_1=create em_1
this.rb_7=create rb_7
this.rb_6=create rb_6
this.st_3=create st_3
this.st_2=create st_2
this.em_4=create em_4
this.em_3=create em_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_4,&
this.em_2,&
this.em_1,&
this.rb_7,&
this.rb_6,&
this.st_3,&
this.st_2,&
this.em_4,&
this.em_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.rb_2,&
this.rb_1,&
this.gb_2,&
this.gb_1}
end on

on w_whitembaldor_w.destroy
destroy(this.st_4)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;ist_code = message.powerobjectparm
em_3.text = string(today(),'yyyy/mm/dd')
em_4.text = string(today(),'yyyy/mm/dd')
end event

type st_4 from statictext within w_whitembaldor_w
integer x = 50
integer y = 688
integer width = 571
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "조회: 우측마우스"
boolean focusrectangle = false
end type

type em_2 from editmask within w_whitembaldor_w
integer x = 905
integer y = 532
integer width = 366
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event rbuttondown;gs_where2 lst_whitemret

lst_whitemret.chk = "S"
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	em_2.text = lst_whitemret.str1[1]
end if

end event

type em_1 from editmask within w_whitembaldor_w
integer x = 489
integer y = 532
integer width = 366
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event rbuttondown;gs_where2 lst_whitemret

lst_whitemret.chk = "S"
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	em_1.text = lst_whitemret.str1[1]
end if
if not isnull(em_1.text) or trim(em_1.text) <> "" then
	em_2.text = em_1.text
end if
em_2.setfocus()
end event

type rb_7 from radiobutton within w_whitembaldor_w
event clicked pbm_bnclicked
integer x = 791
integer y = 96
integer width = 329
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "미출고"
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type rb_6 from radiobutton within w_whitembaldor_w
event clicked pbm_bnclicked
integer x = 69
integer y = 96
integer width = 558
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "출고/미출고"
boolean checked = true
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type st_3 from statictext within w_whitembaldor_w
integer x = 133
integer y = 200
integer width = 343
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 79219928
boolean enabled = false
string text = "납기기간"
boolean focusrectangle = false
end type

type st_2 from statictext within w_whitembaldor_w
integer x = 859
integer y = 216
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

type em_4 from editmask within w_whitembaldor_w
integer x = 905
integer y = 200
integer width = 366
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_3 from editmask within w_whitembaldor_w
integer x = 494
integer y = 200
integer width = 366
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_2 from picturebutton within w_whitembaldor_w
integer x = 1006
integer y = 688
integer width = 279
integer height = 144
integer taborder = 60
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

type pb_1 from picturebutton within w_whitembaldor_w
integer x = 722
integer y = 688
integer width = 279
integer height = 144
integer taborder = 50
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
	ist_code.sel_flag = 'A'
else
	ist_code.sel_flag = 'P'
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = trim(em_2.text)
end if

if rb_6.checked = true then
	ist_code.do_flag = 'Y'
ELSE
	ist_code.do_flag = 'N'
end if

ist_code.start_date = trim(em_3.text)
ist_code.end_date = trim(em_4.text)
closewithreturn(parent, ist_code)
end event

type st_1 from statictext within w_whitembaldor_w
integer x = 855
integer y = 552
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

type rb_2 from radiobutton within w_whitembaldor_w
integer x = 50
integer y = 540
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

type rb_1 from radiobutton within w_whitembaldor_w
integer x = 50
integer y = 420
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

type gb_2 from groupbox within w_whitembaldor_w
integer x = 23
integer y = 16
integer width = 1262
integer height = 284
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "보고서선택"
end type

type gb_1 from groupbox within w_whitembaldor_w
integer x = 23
integer y = 316
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
string text = "출력물품범위"
end type

