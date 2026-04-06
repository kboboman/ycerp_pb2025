$PBExportHeader$w_whitemwc_w.srw
$PBExportComments$공정추가보조윈도우(1998/04/22, 이인호)
forward
global type w_whitemwc_w from window
end type
type cb_2 from commandbutton within w_whitemwc_w
end type
type cb_1 from commandbutton within w_whitemwc_w
end type
type em_1 from editmask within w_whitemwc_w
end type
type st_1 from statictext within w_whitemwc_w
end type
end forward

global type w_whitemwc_w from window
integer x = 1408
integer y = 524
integer width = 1106
integer height = 404
boolean titlebar = true
string title = "공정추가(w_cditemwc_c)"
windowtype windowtype = response!
long backcolor = 78160032
boolean center = true
cb_2 cb_2
cb_1 cb_1
em_1 em_1
st_1 st_1
end type
global w_whitemwc_w w_whitemwc_w

type variables
gs_itemwc_str istr_select
end variables

on w_whitemwc_w.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.em_1=create em_1
this.st_1=create st_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.em_1,&
this.st_1}
end on

on w_whitemwc_w.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.st_1)
end on

type cb_2 from commandbutton within w_whitemwc_w
integer x = 741
integer y = 180
integer width = 315
integer height = 108
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;istr_select.str_insert_count = 0
istr_select.str_ok = FALSE
closewithreturn(parent, istr_select)
end event

type cb_1 from commandbutton within w_whitemwc_w
integer x = 411
integer y = 180
integer width = 315
integer height = 108
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;istr_select.str_insert_count = integer(em_1.text)
istr_select.str_ok = TRUE
closewithreturn(parent, istr_select)
end event

type em_1 from editmask within w_whitemwc_w
integer x = 795
integer y = 24
integer width = 261
integer height = 112
integer taborder = 20
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 16777215
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "1~~100"
end type

type st_1 from statictext within w_whitemwc_w
integer x = 9
integer y = 48
integer width = 745
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 78160032
boolean enabled = false
string text = "추가할 공정의 갯수 "
boolean focusrectangle = false
end type

