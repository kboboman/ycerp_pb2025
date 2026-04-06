$PBExportHeader$w_whopeom_w.srw
$PBExportComments$거래처매출검색(2004/08/11, 이인호)
forward
global type w_whopeom_w from window
end type
type st_2 from statictext within w_whopeom_w
end type
type st_telno from statictext within w_whopeom_w
end type
type em_1 from editmask within w_whopeom_w
end type
type st_7 from statictext within w_whopeom_w
end type
type st_5 from statictext within w_whopeom_w
end type
type st_4 from statictext within w_whopeom_w
end type
type st_6 from statictext within w_whopeom_w
end type
type cb_1 from commandbutton within w_whopeom_w
end type
type dw_1 from datawindow within w_whopeom_w
end type
end forward

global type w_whopeom_w from window
integer x = 1938
integer y = 700
integer width = 3323
integer height = 1060
boolean titlebar = true
string title = "거래처 매출검색(w_whopeom_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_telno st_telno
em_1 em_1
st_7 st_7
st_5 st_5
st_4 st_4
st_6 st_6
cb_1 cb_1
dw_1 dw_1
end type
global w_whopeom_w w_whopeom_w

type variables
gs_where istr_where

end variables

on w_whopeom_w.create
this.st_2=create st_2
this.st_telno=create st_telno
this.em_1=create em_1
this.st_7=create st_7
this.st_5=create st_5
this.st_4=create st_4
this.st_6=create st_6
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.st_telno,&
this.em_1,&
this.st_7,&
this.st_5,&
this.st_4,&
this.st_6,&
this.cb_1,&
this.dw_1}
end on

on w_whopeom_w.destroy
destroy(this.st_2)
destroy(this.st_telno)
destroy(this.em_1)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//
string ls_custno, ls_telno

istr_where = message.powerobjectparm
dw_1.SetTransObject(SQLCA)

st_5.text = istr_where.str1
st_6.text = istr_where.name
em_1.text = string(today(),'yyyy')

ls_custno = istr_where.str1
SELECT tel_no INTO :ls_telno FROM customer WHERE cust_no = :ls_custno;
st_telno.text = ls_telno

dw_1.retrieve(st_5.text, integer(em_1.text))

end event

type st_2 from statictext within w_whopeom_w
integer x = 9
integer y = 12
integer width = 384
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "판매거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_telno from statictext within w_whopeom_w
integer x = 2126
integer y = 12
integer width = 558
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_whopeom_w
event us_modified pbm_enchange
integer x = 3017
integer y = 8
integer width = 265
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = " "
string minmax = "1990~~2100"
end type

event us_modified;dw_1.retrieve(st_5.text, integer(em_1.text))
end event

event modified;dw_1.retrieve(st_5.text, integer(em_1.text))

end event

type st_7 from statictext within w_whopeom_w
integer x = 2702
integer y = 8
integer width = 315
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_whopeom_w
integer x = 393
integer y = 12
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_whopeom_w
integer x = 1920
integer y = 12
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "전화"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_whopeom_w
integer x = 640
integer y = 12
integer width = 1275
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whopeom_w
integer x = 2848
integer y = 872
integer width = 439
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
end type

event clicked;
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whopeom_w
integer x = 5
integer y = 96
integer width = 3310
integer height = 772
integer taborder = 10
string title = "none"
string dataobject = "d_cdinvcoll_q"
boolean border = false
end type

