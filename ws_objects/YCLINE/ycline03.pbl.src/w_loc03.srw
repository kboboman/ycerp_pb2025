$PBExportHeader$w_loc03.srw
$PBExportComments$스리팅 출고저장소
forward
global type w_loc03 from window
end type
type st_1 from statictext within w_loc03
end type
type cb_2 from commandbutton within w_loc03
end type
type cb_1 from commandbutton within w_loc03
end type
type dw_1 from datawindow within w_loc03
end type
end forward

global type w_loc03 from window
integer width = 1481
integer height = 1780
boolean titlebar = true
string title = "저장소선택(w_loc03)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_loc03 w_loc03

type variables
gs_where istr_where

end variables

on w_loc03.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_loc03.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//
dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

istr_where = Message.PowerObjectParm
dw_1.retrieve(istr_where.chk, istr_where.str1)

if istr_where.chk = "I" then
	dw_1.SetSort('loc_type D, loc_no A')
	
	this.title = '출고저장소 선택'
	st_1.text  = '출고 저장소'
	st_1.backcolor= rgb(0,0,255)

elseif istr_where.chk = "O" then
	dw_1.SetSort('loc_type A, loc_no A')
	this.title = '입고저장소 선택'
	st_1.text  = '입고 저장소'
	st_1.backcolor= rgb(0,128,0)

else
	dw_1.SetSort('loc_type A, loc_no A')
	this.title = '저장소 선택'
	st_1.text  = '저장소'
	st_1.backcolor= rgb(0,128,0)

end if
SetNull(istr_where.chk)

end event

event closequery;IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

type st_1 from statictext within w_loc03
integer x = 46
integer y = 16
integer width = 1367
integer height = 120
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 15780518
string text = "출고 저장소"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_loc03
integer x = 731
integer y = 1540
integer width = 681
integer height = 128
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

type cb_1 from commandbutton within w_loc03
integer x = 46
integer y = 1540
integer width = 681
integer height = 128
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
	istr_where.str1 = dw_1.object.loc_no[ll_row]
	istr_where.name = dw_1.object.loc_name[ll_row]
//	istr_where.str2 = dw_1.object.work_manager[ll_row]
	
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
//	rollback;
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_loc03
integer x = 46
integer y = 148
integer width = 1367
integer height = 1376
integer taborder = 10
string title = "none"
string dataobject = "d_loc03"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

