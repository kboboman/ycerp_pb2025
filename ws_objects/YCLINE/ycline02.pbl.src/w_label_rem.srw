$PBExportHeader$w_label_rem.srw
$PBExportComments$유압반 비고
forward
global type w_label_rem from window
end type
type st_1 from statictext within w_label_rem
end type
type cb_2 from commandbutton within w_label_rem
end type
type cb_1 from commandbutton within w_label_rem
end type
type dw_1 from datawindow within w_label_rem
end type
type st_3 from statictext within w_label_rem
end type
end forward

global type w_label_rem from window
integer x = 1938
integer y = 700
integer width = 1947
integer height = 1380
boolean titlebar = true
string title = "작업자선택(w_label_rem)"
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
global w_label_rem w_label_rem

type variables
gs_where istr_where

end variables

on w_label_rem.create
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

on w_label_rem.destroy
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

type st_1 from statictext within w_label_rem
integer x = 27
integer y = 36
integer width = 1861
integer height = 116
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "비고"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_label_rem
integer x = 1120
integer y = 1088
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

type cb_1 from commandbutton within w_label_rem
integer x = 338
integer y = 1088
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
	istr_where.dec1 = dw_1.object.sno[ll_row]
	istr_where.str1 = dw_1.object.rem[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_label_rem
string tag = "d_user"
integer x = 27
integer y = 220
integer width = 1870
integer height = 848
integer taborder = 10
string title = "d_label_rem"
string dataobject = "d_label_rem"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_label_rem
integer x = 27
integer y = 12
integer width = 1870
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

