$PBExportHeader$w_whitemloc_w.srw
$PBExportComments$저장소별재고검색(2004/10/11, 이인호)
forward 
global type w_whitemloc_w from window
end type
type st_1 from statictext within w_whitemloc_w
end type
type st_5 from statictext within w_whitemloc_w
end type
type st_6 from statictext within w_whitemloc_w
end type
type dw_1 from datawindow within w_whitemloc_w
end type
end forward

global type w_whitemloc_w from window
integer x = 1938
integer y = 700
integer width = 2327
integer height = 1128
boolean titlebar = true
string title = "재고검색(w_whitemloc_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
st_5 st_5
st_6 st_6
dw_1 dw_1
end type
global w_whitemloc_w w_whitemloc_w

type variables
gs_where istr_where

end variables

on w_whitemloc_w.create
this.st_1=create st_1
this.st_5=create st_5
this.st_6=create st_6
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.st_5,&
this.st_6,&
this.dw_1}
end on

on w_whitemloc_w.destroy
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_1)
end on

event open;istr_where = message.powerobjectparm
long ll_row

dw_1.SetTransObject(SQLCA)

st_6.text = istr_where.str2
st_5.text = istr_where.name
dw_1.retrieve(istr_where.str2, istr_where.str3)
ll_row = dw_1.Find( "loc_no = '" + istr_where.str1 + "'", 1, dw_1.RowCount())
IF ll_row > 0 THEN
	dw_1.ScrollToRow(ll_row)
end if

end event

type st_1 from statictext within w_whitemloc_w
integer x = 14
integer y = 100
integer width = 2277
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수주잔량은 장기재고를 포함한 수량 입니다."
boolean focusrectangle = false
end type

type st_5 from statictext within w_whitemloc_w
integer x = 384
integer y = 8
integer width = 1906
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_whitemloc_w
integer x = 14
integer y = 8
integer width = 361
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_whitemloc_w
integer x = 14
integer y = 176
integer width = 2277
integer height = 836
integer taborder = 10
string title = "none"
string dataobject = "d_whlocqoh_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;This.SelectRow(0, FALSE)	
This.SelectRow(row, TRUE)

end event

