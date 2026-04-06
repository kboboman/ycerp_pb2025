$PBExportHeader$w_label_box.srw
$PBExportComments$유압반 박스 규격&수량
forward
global type w_label_box from window
end type
type st_1 from statictext within w_label_box
end type
type cb_2 from commandbutton within w_label_box
end type
type cb_1 from commandbutton within w_label_box
end type
type dw_1 from datawindow within w_label_box
end type
type st_3 from statictext within w_label_box
end type
end forward

global type w_label_box from window
integer x = 1938
integer y = 700
integer width = 2871
integer height = 1556
boolean titlebar = true
string title = "박스선택(w_label_box)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
st_3 st_3
end type
global w_label_box w_label_box

type variables
gs_where istr_where

end variables

on w_label_box.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_3=create st_3
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.st_3}
end on

on w_label_box.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_3)
end on

event open;//
istr_where = message.powerobjectparm

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = 130

dw_1.retrieve()

end event

event closequery;IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

type st_1 from statictext within w_label_box
integer x = 27
integer y = 44
integer width = 2789
integer height = 116
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "박스선택"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_label_box
integer x = 2048
integer y = 1276
integer width = 777
integer height = 168
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;istr_where.chk = "N"
closewithreturn(parent, istr_where)

end event

type cb_1 from commandbutton within w_label_box
integer x = 1266
integer y = 1276
integer width = 777
integer height = 168
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인[ENT]"
boolean default = true
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
//	istr_where.str1 = dw_1.object.user_id[ll_row]
	istr_where.str1 = string(dw_1.object.QTY[ll_row])
	istr_where.dec1 = dw_1.object.sno[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_label_box
string tag = "d_user"
integer x = 27
integer y = 220
integer width = 2798
integer height = 1032
integer taborder = 10
string title = "d_label_box"
string dataobject = "d_label_box"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;////
//if isnull(row) OR row < 1 then RETURN
//
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
end event

type st_3 from statictext within w_label_box
integer x = 27
integer y = 16
integer width = 2798
integer height = 164
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

