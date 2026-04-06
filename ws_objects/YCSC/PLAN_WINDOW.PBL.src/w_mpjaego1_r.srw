$PBExportHeader$w_mpjaego1_r.srw
$PBExportComments$물품재고현황(1998/10/15,곽용덕)
forward
global type w_mpjaego1_r from w_inheritance
end type
type gb_15 from groupbox within w_mpjaego1_r
end type
type gb_4 from groupbox within w_mpjaego1_r
end type
type st_1 from statictext within w_mpjaego1_r
end type
type st_3 from statictext within w_mpjaego1_r
end type
type sle_1 from singlelineedit within w_mpjaego1_r
end type
type st_2 from statictext within w_mpjaego1_r
end type
type sle_2 from singlelineedit within w_mpjaego1_r
end type
type dw_area from datawindow within w_mpjaego1_r
end type
end forward

global type w_mpjaego1_r from w_inheritance
integer width = 3552
integer height = 2056
string title = "재고물품현황(w_mpjaego1_r)"
gb_15 gb_15
gb_4 gb_4
st_1 st_1
st_3 st_3
sle_1 sle_1
st_2 st_2
sle_2 sle_2
dw_area dw_area
end type
global w_mpjaego1_r w_mpjaego1_r

type variables
st_print i_print
string is_select,is_where,is_clause
end variables

on w_mpjaego1_r.create
int iCurrent
call super::create
this.gb_15=create gb_15
this.gb_4=create gb_4
this.st_1=create st_1
this.st_3=create st_3
this.sle_1=create sle_1
this.st_2=create st_2
this.sle_2=create sle_2
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_15
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_2
this.Control[iCurrent+8]=this.dw_area
end on

on w_mpjaego1_r.destroy
call super::destroy
destroy(this.gb_15)
destroy(this.gb_4)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.dw_area)
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

type pb_save from w_inheritance`pb_save within w_mpjaego1_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpjaego1_r
integer x = 50
integer y = 284
integer width = 3419
integer height = 1604
integer taborder = 50
string dataobject = "d_mpjaego1_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpjaego1_r
boolean visible = false
integer x = 1906
integer y = 40
integer width = 178
integer height = 156
integer taborder = 70
end type

type st_title from w_inheritance`st_title within w_mpjaego1_r
integer x = 37
integer y = 32
integer width = 914
integer textsize = -20
string text = "재고물품현황"
end type

type st_tips from w_inheritance`st_tips within w_mpjaego1_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpjaego1_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpjaego1_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpjaego1_r
integer x = 3273
integer y = 48
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpjaego1_r
integer x = 3077
integer y = 48
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 재고유지물품에 대한 재고현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpjaego1_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpjaego1_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpjaego1_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpjaego1_r
integer x = 2857
integer y = 48
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_str,ls_str2

ls_str = trim(sle_1.text) + '%'
ls_str2 = trim(sle_2.text) + '%'

dw_1.retrieve(ls_str2, ls_str, dw_area.object.area[1])
end event

type gb_3 from w_inheritance`gb_3 within w_mpjaego1_r
boolean visible = false
integer x = 2624
integer y = 20
integer width = 82
integer height = 84
integer taborder = 80
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_mpjaego1_r
integer y = 236
integer width = 3465
integer height = 1684
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_mpjaego1_r
integer x = 2825
integer y = 8
integer width = 663
end type

type gb_15 from groupbox within w_mpjaego1_r
integer x = 997
integer y = 52
integer width = 567
integer height = 168
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_4 from groupbox within w_mpjaego1_r
integer x = 1591
integer width = 1198
integer height = 236
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_1 from statictext within w_mpjaego1_r
integer x = 1632
integer y = 60
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "검색 :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpjaego1_r
integer x = 1851
integer y = 60
integer width = 265
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

type sle_1 from singlelineedit within w_mpjaego1_r
integer x = 2153
integer y = 44
integer width = 608
integer height = 84
integer taborder = 120
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

type st_2 from statictext within w_mpjaego1_r
integer x = 1819
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

type sle_2 from singlelineedit within w_mpjaego1_r
integer x = 2153
integer y = 136
integer width = 608
integer height = 84
integer taborder = 110
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

type dw_area from datawindow within w_mpjaego1_r
integer x = 1033
integer y = 104
integer width = 503
integer height = 76
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

