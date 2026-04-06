$PBExportHeader$w_mpcanqoh_m.srw
$PBExportComments$가용재고리스트(1998/04/25,곽용덕)
forward 
global type w_mpcanqoh_m from w_inheritance
end type
type gb_15 from groupbox within w_mpcanqoh_m
end type
type gb_5 from groupbox within w_mpcanqoh_m
end type
type st_3 from statictext within w_mpcanqoh_m
end type
type sle_1 from singlelineedit within w_mpcanqoh_m
end type
type sle_2 from singlelineedit within w_mpcanqoh_m
end type
type st_2 from statictext within w_mpcanqoh_m
end type
type dw_area from datawindow within w_mpcanqoh_m
end type
type st_1 from statictext within w_mpcanqoh_m
end type
end forward

global type w_mpcanqoh_m from w_inheritance
integer width = 4517
integer height = 2620
string title = "가용재고 리스트(w_mpcanqoh_m)"
gb_15 gb_15
gb_5 gb_5
st_3 st_3
sle_1 sle_1
sle_2 sle_2
st_2 st_2
dw_area dw_area
st_1 st_1
end type
global w_mpcanqoh_m w_mpcanqoh_m

on w_mpcanqoh_m.create
int iCurrent
call super::create
this.gb_15=create gb_15
this.gb_5=create gb_5
this.st_3=create st_3
this.sle_1=create sle_1
this.sle_2=create sle_2
this.st_2=create st_2
this.dw_area=create dw_area
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_15
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.sle_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.st_1
end on

on w_mpcanqoh_m.destroy
call super::destroy
destroy(this.gb_15)
destroy(this.gb_5)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// area 추가 2003/02/26
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26
sle_1.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 73
gb_2.height = newheight - 276

dw_1.width  = newwidth  - 133
dw_1.height = newheight - 356

end event

type pb_save from w_inheritance`pb_save within w_mpcanqoh_m
boolean visible = false
integer x = 3031
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_mpcanqoh_m
integer x = 59
integer y = 300
integer width = 4347
integer height = 2160
integer taborder = 90
string dataobject = "d_mpcanqoh_t"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpcanqoh_m
integer x = 46
integer width = 1038
integer height = 144
string text = "가용재고 리스트"
end type

type st_tips from w_inheritance`st_tips within w_mpcanqoh_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpcanqoh_m
boolean visible = false
integer x = 2071
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpcanqoh_m
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_mpcanqoh_m
integer x = 4219
integer y = 64
integer taborder = 150
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpcanqoh_m
boolean visible = false
integer taborder = 160
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpcanqoh_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_mpcanqoh_m
boolean visible = false
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_mpcanqoh_m
boolean visible = false
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpcanqoh_m
integer x = 4023
integer y = 64
integer taborder = 40
string text = " "
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_str,ls_str2

ls_str = trim(sle_1.text) + '%'
ls_str2 = trim(sle_2.text) + '%'

dw_1.retrieve(ls_str2, ls_str, dw_area.object.area[1])
end event

type gb_3 from w_inheritance`gb_3 within w_mpcanqoh_m
boolean visible = false
integer x = 1902
integer y = 28
integer width = 261
integer height = 156
integer taborder = 120
end type

type gb_2 from w_inheritance`gb_2 within w_mpcanqoh_m
integer y = 244
integer width = 4407
integer height = 2240
integer taborder = 130
end type

type gb_1 from w_inheritance`gb_1 within w_mpcanqoh_m
integer x = 2789
integer y = 16
integer width = 1175
integer height = 216
integer taborder = 80
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpcanqoh_m
boolean visible = false
integer x = 1947
integer y = 80
integer width = 174
integer height = 80
integer taborder = 100
end type

type gb_15 from groupbox within w_mpcanqoh_m
integer x = 2171
integer y = 16
integer width = 599
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_5 from groupbox within w_mpcanqoh_m
integer x = 3986
integer y = 16
integer width = 453
integer height = 216
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type st_3 from statictext within w_mpcanqoh_m
integer x = 3072
integer y = 68
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "제품명"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_mpcanqoh_m
integer x = 3319
integer y = 52
integer width = 608
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_mpcanqoh_m
integer x = 3319
integer y = 136
integer width = 608
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_mpcanqoh_m
integer x = 3003
integer y = 144
integer width = 297
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "제품코드"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpcanqoh_m
integer x = 2208
integer y = 136
integer width = 521
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_1 from statictext within w_mpcanqoh_m
integer x = 2208
integer y = 56
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

