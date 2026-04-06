$PBExportHeader$w_poptag.srw
forward
global type w_poptag from window
end type
type st_5 from statictext within w_poptag
end type
type st_4 from statictext within w_poptag
end type
type st_3 from statictext within w_poptag
end type
type st_2 from statictext within w_poptag
end type
type st_1 from statictext within w_poptag
end type
type cb_1 from commandbutton within w_poptag
end type
type sle_text from singlelineedit within w_poptag
end type
end forward

global type w_poptag from window
integer width = 1728
integer height = 660
boolean titlebar = true
string title = "tag번호(w_poptag)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
sle_text sle_text
end type
global w_poptag w_poptag

on w_poptag.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.sle_text=create sle_text
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.sle_text}
end on

on w_poptag.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.sle_text)
end on

event open;sle_text.text = Message.StringParm
end event

type st_5 from statictext within w_poptag
integer x = 46
integer y = 216
integer width = 1408
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "<사용법>"
boolean focusrectangle = false
end type

type st_4 from statictext within w_poptag
integer x = 119
integer y = 468
integer width = 1545
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "해당번호부터 넘버링됨."
boolean focusrectangle = false
end type

type st_3 from statictext within w_poptag
integer x = 46
integer y = 308
integer width = 1609
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "1.앞두자리를 지정해주시면 예) A1+순번(세자리)"
boolean focusrectangle = false
end type

type st_2 from statictext within w_poptag
integer x = 46
integer y = 384
integer width = 1545
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "2.앞두자리와순번(세자리)를 지정해주면"
boolean focusrectangle = false
end type

type st_1 from statictext within w_poptag
integer x = 375
integer y = 72
integer width = 293
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "시작번호"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_poptag
integer x = 905
integer y = 60
integer width = 261
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;string ls_return

ls_return = trim(sle_text.text)

CloseWithReturn(parent, ls_return)
end event

type sle_text from singlelineedit within w_poptag
integer x = 677
integer y = 60
integer width = 224
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

