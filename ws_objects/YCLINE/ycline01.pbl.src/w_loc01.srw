$PBExportHeader$w_loc01.srw
$PBExportComments$저장소 조회
forward
global type w_loc01 from window
end type
type st_1 from statictext within w_loc01
end type
type cb_2 from commandbutton within w_loc01
end type
type cb_1 from commandbutton within w_loc01
end type
type dw_1 from datawindow within w_loc01
end type
end forward

global type w_loc01 from window
integer width = 1481
integer height = 1780
boolean titlebar = true
string title = "저장소 선택(w_loc01)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_loc01 w_loc01

type variables
gs_where istr_where

end variables

on w_loc01.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_loc01.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//
string ls_coiltype

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

istr_where  = Message.PowerObjectParm
ls_coiltype = istr_where.str5
dw_1.retrieve( gs_workno, ls_coiltype )		// COIL TYPE

setnull( istr_where.chk )

end event

event closequery;//
IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

type st_1 from statictext within w_loc01
integer x = 46
integer y = 4
integer width = 1367
integer height = 176
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "저장소 선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_loc01
integer x = 731
integer y = 1532
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

event clicked;// 취소[ESC]
istr_where.chk = "N"
closewithreturn(parent, istr_where)

end event

type cb_1 from commandbutton within w_loc01
integer x = 46
integer y = 1532
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

event clicked;// 확인[ENT]
long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
	istr_where.str1 = dw_1.object.loc_no[ll_row]
	istr_where.name = dw_1.object.loc_name[ll_row]
	
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_loc01
integer x = 46
integer y = 212
integer width = 1371
integer height = 1300
integer taborder = 10
string title = "none"
string dataobject = "d_loc01"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

