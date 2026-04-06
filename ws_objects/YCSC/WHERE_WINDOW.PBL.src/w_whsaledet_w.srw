$PBExportHeader$w_whsaledet_w.srw
$PBExportComments$수주상황접수부/수주리스트 출력 조건(1999/11/16, 이인호)
forward
global type w_whsaledet_w from window
end type
type rb_7 from radiobutton within w_whsaledet_w
end type
type rb_6 from radiobutton within w_whsaledet_w
end type
type rb_5 from radiobutton within w_whsaledet_w
end type
type em_4 from editmask within w_whsaledet_w
end type
type em_2 from editmask within w_whsaledet_w
end type
type em_6 from editmask within w_whsaledet_w
end type
type em_5 from editmask within w_whsaledet_w
end type
type rb_4 from radiobutton within w_whsaledet_w
end type
type rb_1 from radiobutton within w_whsaledet_w
end type
type st_2 from statictext within w_whsaledet_w
end type
type em_3 from editmask within w_whsaledet_w
end type
type em_1 from editmask within w_whsaledet_w
end type
type pb_2 from picturebutton within w_whsaledet_w
end type
type pb_1 from picturebutton within w_whsaledet_w
end type
type st_1 from statictext within w_whsaledet_w
end type
type rb_3 from radiobutton within w_whsaledet_w
end type
type rb_2 from radiobutton within w_whsaledet_w
end type
type gb_3 from groupbox within w_whsaledet_w
end type
type gb_2 from groupbox within w_whsaledet_w
end type
type gb_1 from groupbox within w_whsaledet_w
end type
end forward

global type w_whsaledet_w from window
integer x = 832
integer y = 360
integer width = 1326
integer height = 1080
boolean titlebar = true
string title = "수주상황접수부/리스트출력(w_whsaledet_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean toolbarvisible = false
boolean center = true
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
em_4 em_4
em_2 em_2
em_6 em_6
em_5 em_5
rb_4 rb_4
rb_1 rb_1
st_2 st_2
em_3 em_3
em_1 em_1
pb_2 pb_2
pb_1 pb_1
st_1 st_1
rb_3 rb_3
rb_2 rb_2
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_whsaledet_w w_whsaledet_w

type variables
gs_itembaldo_str  ist_code
end variables

on w_whsaledet_w.create
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.em_4=create em_4
this.em_2=create em_2
this.em_6=create em_6
this.em_5=create em_5
this.rb_4=create rb_4
this.rb_1=create rb_1
this.st_2=create st_2
this.em_3=create em_3
this.em_1=create em_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.rb_7,&
this.rb_6,&
this.rb_5,&
this.em_4,&
this.em_2,&
this.em_6,&
this.em_5,&
this.rb_4,&
this.rb_1,&
this.st_2,&
this.em_3,&
this.em_1,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.rb_3,&
this.rb_2,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_whsaledet_w.destroy
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.em_4)
destroy(this.em_2)
destroy(this.em_6)
destroy(this.em_5)
destroy(this.rb_4)
destroy(this.rb_1)
destroy(this.st_2)
destroy(this.em_3)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;string ls_area
ist_code = message.powerobjectparm

IF gs_area = "B0001" THEN
	ls_area = "BD"
ELSEIF gs_area = "T0001" THEN
	ls_area = "TD"
ELSE
	ls_area = "HD"
END IF
//order_no
if isnull(ist_code.start_no) or trim(ist_code.start_no) = '' then
	em_1.text = ls_area + string(today(),'yyyy')
else
	em_1.text = LeftA(ist_code.start_no,6)
	em_2.text = MidA(ist_code.start_no,7,4) + MidA(ist_code.start_no,12,3) 
end if
if isnull(ist_code.end_no) or trim(ist_code.end_no) = '' then
	em_3.text = ls_area + string(today(),'yyyy')
else
	em_3.text = LeftA(ist_code.start_no,6)
	em_4.text = MidA(ist_code.end_no,7,4) + MidA(ist_code.end_no,12,3) 
end if

//date
if isnull(ist_code.start_date) or not isdate(ist_code.start_date) then
	em_5.text = string(today(),'yyyy/mm/dd')
else
	em_5.text = ist_code.start_date
end if
if isnull(ist_code.end_date) or not isdate(ist_code.end_date) then
	em_6.text = string(today(),'yyyy/mm/dd')
else
	em_6.text = ist_code.end_date
end if

end event

type rb_7 from radiobutton within w_whsaledet_w
integer x = 818
integer y = 708
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "미확정"
end type

event clicked;this.textcolor = rgb(0,0,255)
rb_5.textcolor = rgb(0,0,0)
rb_6.textcolor = rgb(0,0,0)

end event

type rb_6 from radiobutton within w_whsaledet_w
integer x = 448
integer y = 708
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "확정"
end type

event clicked;this.textcolor = rgb(0,0,255)
rb_5.textcolor = rgb(0,0,0)
rb_7.textcolor = rgb(0,0,0)

end event

type rb_5 from radiobutton within w_whsaledet_w
integer x = 78
integer y = 708
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "전체"
boolean checked = true
end type

event clicked;this.textcolor = rgb(0,0,255)
rb_6.textcolor = rgb(0,0,0)
rb_7.textcolor = rgb(0,0,0)

end event

type em_4 from editmask within w_whsaledet_w
integer x = 727
integer y = 176
integer width = 293
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "####-###"
end type

type em_2 from editmask within w_whsaledet_w
integer x = 727
integer y = 84
integer width = 293
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "####-###"
boolean autoskip = true
end type

event modified;if isnull(em_4.text) or trim(em_4.text) = "" or this.text > em_4.text then
	em_4.text = LeftA(this.text,4) + MidA(this.text,6,3)
end if
end event

type em_6 from editmask within w_whsaledet_w
integer x = 896
integer y = 292
integer width = 366
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_5 from editmask within w_whsaledet_w
integer x = 485
integer y = 292
integer width = 366
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if isnull(em_6.text) or not isdate(em_6.text) or this.text > em_6.text then
	em_6.text = this.text
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_4 from radiobutton within w_whsaledet_w
event clicked pbm_bnclicked
integer x = 736
integer y = 508
integer width = 517
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "수주리스트"
end type

event clicked;rb_3.textcolor = rgb(0,0,0)
this.textcolor = rgb(0,0,255)

end event

type rb_1 from radiobutton within w_whsaledet_w
event clicked pbm_bnclicked
integer x = 50
integer y = 84
integer width = 416
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "수주번호"
boolean checked = true
end type

event clicked;this.textcolor = rgb(0,0,255)
rb_2.textcolor = rgb(0,0,0)
em_1.enabled = true
em_2.enabled = true
em_3.enabled = true
em_4.enabled = true
em_5.enabled = false
em_6.enabled = false
em_2.setfocus()
end event

type st_2 from statictext within w_whsaledet_w
integer x = 320
integer y = 192
integer width = 151
integer height = 40
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "～"
boolean focusrectangle = false
end type

type em_3 from editmask within w_whsaledet_w
integer x = 485
integer y = 176
integer width = 242
integer height = 76
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!####"
end type

type em_1 from editmask within w_whsaledet_w
integer x = 485
integer y = 84
integer width = 242
integer height = 76
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!####"
boolean autoskip = true
end type

event modified;if isnull(em_3.text) then
	em_3.text = this.text
end if
end event

type pb_2 from picturebutton within w_whsaledet_w
integer x = 1006
integer y = 828
integer width = 279
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whsaledet_w
integer x = 709
integer y = 828
integer width = 279
integer height = 144
integer taborder = 60
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

if rb_1.checked = true then	// 수주번호
	ist_code.order_flag = 'O'
	ist_code.start_no = trim(em_1.text) + trim(em_2.text)
	ist_code.end_no = trim(em_3.text) + trim(em_4.text)
else									// 수주일자
	ist_code.order_flag = 'D'
	ist_code.start_date = em_5.text
	ist_code.end_date = em_6.text
end if

//messagebox("","#" + ist_code.start_no + "#" + ist_code.end_no + "#" )
if rb_3.checked = true then	// 수주상황접수부
	ist_code.sel_flag = 'S'
ELSE									// 수주리스트
	ist_code.sel_flag = 'L'
end if

if rb_5.checked = true then	// 전체
	ist_code.do_flag = "%"
ELSEif rb_6.checked = true then	// 확정
	ist_code.do_flag = "Y"
else										// 미확정
	ist_code.do_flag = "N"
end if
closewithreturn(parent, ist_code)
end event

type st_1 from statictext within w_whsaledet_w
integer x = 855
integer y = 300
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

type rb_3 from radiobutton within w_whsaledet_w
integer x = 78
integer y = 504
integer width = 645
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "수주상황접수부"
boolean checked = true
end type

event clicked;this.textcolor = rgb(0,0,255)
rb_4.textcolor = rgb(0,0,0)

end event

type rb_2 from radiobutton within w_whsaledet_w
integer x = 50
integer y = 292
integer width = 416
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "수주일자"
end type

event clicked;this.textcolor = rgb(0,0,255)
rb_1.textcolor = rgb(0,0,0)
em_1.enabled = false
em_2.enabled = false
em_3.enabled = false
em_4.enabled = false
em_5.enabled = true
em_6.enabled = true
em_5.setfocus()
end event

type gb_3 from groupbox within w_whsaledet_w
integer x = 23
integer y = 648
integer width = 1262
integer height = 152
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79219928
string text = "수주선택"
end type

type gb_2 from groupbox within w_whsaledet_w
integer x = 23
integer y = 16
integer width = 1262
integer height = 388
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79219928
string text = "수주범위"
end type

type gb_1 from groupbox within w_whsaledet_w
integer x = 23
integer y = 428
integer width = 1262
integer height = 188
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79219928
string text = "보고서선택"
end type

