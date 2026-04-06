$PBExportHeader$w_personal_w.srw
$PBExportComments$수부번호 제품의 저장소별재고검색(2004/10/11, 조원석)
forward
global type w_personal_w from window
end type
type cb_5 from commandbutton within w_personal_w
end type
type cb_3 from commandbutton within w_personal_w
end type
type cb_4 from commandbutton within w_personal_w
end type
type cb_2 from commandbutton within w_personal_w
end type
type sle_value from singlelineedit within w_personal_w
end type
type ddlb_op from dropdownlistbox within w_personal_w
end type
type st_4 from statictext within w_personal_w
end type
type st_3 from statictext within w_personal_w
end type
type ddlb_fld from dropdownlistbox within w_personal_w
end type
type ddlb_dwtitles from dropdownlistbox within w_personal_w
end type
type dw_2 from datawindow within w_personal_w
end type
type dw_1 from datawindow within w_personal_w
end type
type gb_4 from groupbox within w_personal_w
end type
end forward

global type w_personal_w from window
integer x = 1938
integer y = 700
integer width = 4905
integer height = 1780
boolean titlebar = true
string title = "인맥 검색(w_personal_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
cb_3 cb_3
cb_4 cb_4
cb_2 cb_2
sle_value sle_value
ddlb_op ddlb_op
st_4 st_4
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
dw_2 dw_2
dw_1 dw_1
gb_4 gb_4
end type
global w_personal_w w_personal_w

type variables
gs_where istr_where
string is_gubun
end variables

on w_personal_w.create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_2=create cb_2
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_4=create gb_4
this.Control[]={this.cb_5,&
this.cb_3,&
this.cb_4,&
this.cb_2,&
this.sle_value,&
this.ddlb_op,&
this.st_4,&
this.st_3,&
this.ddlb_fld,&
this.ddlb_dwtitles,&
this.dw_2,&
this.dw_1,&
this.gb_4}
end on

on w_personal_w.destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_4)
end on

event open;istr_where = message.powerobjectparm
long ll_row

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

is_gubun = trim(Message.StringParm)

dw_1.retrieve(is_gubun)
//if left(gs_area,1) = "S" then
//	order_no1.text = "HD" + string(today(), "yyyymmdd")
//else
//	order_no1.text = left(gs_area, 1) + "D" + string(today(), "yyyymmdd")
//end if
//
//order_no1.SelectText(9, 2)
end event

type cb_5 from commandbutton within w_personal_w
integer x = 2565
integer y = 56
integer width = 160
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_3 from commandbutton within w_personal_w
integer x = 2235
integer y = 56
integer width = 160
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_personal_w
integer x = 2400
integer y = 56
integer width = 160
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_personal_w
integer x = 2071
integer y = 56
integer width = 160
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type sle_value from singlelineedit within w_personal_w
integer x = 1499
integer y = 56
integer width = 567
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_personal_w
integer x = 1179
integer y = 48
integer width = 297
integer height = 512
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_4 from statictext within w_personal_w
integer x = 1010
integer y = 64
integer width = 165
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type st_3 from statictext within w_personal_w
integer x = 325
integer y = 64
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_personal_w
integer x = 512
integer y = 48
integer width = 480
integer height = 632
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_personal_w
boolean visible = false
integer x = 553
integer y = 60
integer width = 311
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type dw_2 from datawindow within w_personal_w
integer x = 3634
integer y = 172
integer width = 1243
integer height = 1520
string title = "none"
string dataobject = "d_personal_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;This.SelectRow(0, FALSE)	
This.SelectRow(row, TRUE)

end event

type dw_1 from datawindow within w_personal_w
integer x = 9
integer y = 172
integer width = 3607
integer height = 1508
integer taborder = 20
string title = "none"
string dataobject = "d_personal_r1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_orderno, ls_item_no, ls_qa
long   i_personal_id

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


i_personal_id= this.object.personal_id[row]

dw_2.retrieve(i_personal_id, is_gubun)

end event

event doubleclicked;long i_personal_id
string ls_personal_id


i_personal_id= this.object.personal_id[row]

CloseWithReturn(parent, i_personal_id)
end event

type gb_4 from groupbox within w_personal_w
integer x = 9
integer width = 4869
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

