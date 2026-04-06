$PBExportHeader$w_mpjaego_r.srw
$PBExportComments$수주물픔에대한재고(1998/09/26,곽용덕)
forward
global type w_mpjaego_r from w_inheritance
end type
type cbx_1 from checkbox within w_mpjaego_r
end type
type sle_1 from singlelineedit within w_mpjaego_r
end type
type st_3 from statictext within w_mpjaego_r
end type
type st_2 from statictext within w_mpjaego_r
end type
type sle_2 from singlelineedit within w_mpjaego_r
end type
type st_1 from statictext within w_mpjaego_r
end type
type gb_15 from groupbox within w_mpjaego_r
end type
type gb_4 from groupbox within w_mpjaego_r
end type
type dw_area from datawindow within w_mpjaego_r
end type
end forward

global type w_mpjaego_r from w_inheritance
integer width = 3758
integer height = 2064
string title = "수주물품 재고현황(w_mpjaego_r)"
cbx_1 cbx_1
sle_1 sle_1
st_3 st_3
st_2 st_2
sle_2 sle_2
st_1 st_1
gb_15 gb_15
gb_4 gb_4
dw_area dw_area
end type
global w_mpjaego_r w_mpjaego_r

type variables
st_print i_print
string is_select,is_where,is_clause
end variables

on w_mpjaego_r.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.sle_2=create sle_2
this.st_1=create st_1
this.gb_15=create gb_15
this.gb_4=create gb_4
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.gb_15
this.Control[iCurrent+8]=this.gb_4
this.Control[iCurrent+9]=this.dw_area
end on

on w_mpjaego_r.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.st_1)
destroy(this.gb_15)
destroy(this.gb_4)
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

dw_1.object.datawindow.print.preview = true
sle_1.setfocus()
//dw_2.retrieve()
end event

event resize;call super::resize;gb_2.width  = this.width  - 110
gb_2.height = this.height - 508

dw_1.width  = this.width  - 179
dw_1.height = this.height - 596

end event

type pb_save from w_inheritance`pb_save within w_mpjaego_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpjaego_r
integer y = 424
integer width = 3579
integer height = 1468
integer taborder = 60
string dataobject = "d_mpjaego_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpjaego_r
boolean visible = false
integer x = 1906
integer y = 40
integer width = 178
integer height = 156
integer taborder = 70
string dataobject = "d_ipnotrcpt_r"
end type

type st_title from w_inheritance`st_title within w_mpjaego_r
integer x = 32
integer y = 32
integer width = 1472
string text = "수주물품 재고현황"
end type

type st_tips from w_inheritance`st_tips within w_mpjaego_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpjaego_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpjaego_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpjaego_r
integer x = 3470
integer y = 48
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpjaego_r
integer x = 3273
integer y = 48
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 수주물품에 대한 재고현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpjaego_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpjaego_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpjaego_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpjaego_r
integer x = 3031
integer y = 48
integer taborder = 170
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve(dw_area.object.area[1])
//dw_1.Preview(TRUE)
//dw_2.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_mpjaego_r
boolean visible = false
integer x = 2624
integer y = 20
integer width = 82
integer height = 84
integer taborder = 100
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_mpjaego_r
integer y = 368
integer width = 3648
integer height = 1556
integer taborder = 110
end type

type gb_1 from w_inheritance`gb_1 within w_mpjaego_r
integer x = 2994
integer y = 8
integer width = 690
end type

type cbx_1 from checkbox within w_mpjaego_r
integer x = 2345
integer y = 264
integer width = 608
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "중간공정만 조회"
end type

event clicked;if this.checked then
	dw_1.dataobject = 'd_mpjaego_r1'
	dw_1.SetTransObject(SQLCA)
else
	dw_1.dataobject = 'd_mpjaego_r'
	dw_1.SetTransObject(SQLCA)
end if

end event

type sle_1 from singlelineedit within w_mpjaego_r
integer x = 654
integer y = 256
integer width = 608
integer height = 92
integer taborder = 80
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

event modified;string ls_data

ls_data = trim(this.text)

if isnull(ls_data) or ls_data = '' then
	dw_1.setfilter("")
	dw_1.filter()
else
	ls_data = "%" + ls_data + "%"
	dw_1.setfilter("item_item_name LIKE '" + ls_data + "'")
	dw_1.filter()
end if

end event

type st_3 from statictext within w_mpjaego_r
integer x = 302
integer y = 276
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
string text = "제품명"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpjaego_r
integer x = 1326
integer y = 276
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

type sle_2 from singlelineedit within w_mpjaego_r
integer x = 1682
integer y = 256
integer width = 608
integer height = 92
integer taborder = 90
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

event modified;string ls_data

ls_data = trim(this.text)

if isnull(ls_data) or ls_data = '' then
	dw_1.setfilter("")
	dw_1.filter()
else
	ls_data = ls_data + "%"
	dw_1.setfilter("saledet_item_no like '" + ls_data + "'")
	dw_1.filter()
end if

end event

type st_1 from statictext within w_mpjaego_r
integer x = 105
integer y = 276
integer width = 274
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

type gb_15 from groupbox within w_mpjaego_r
integer x = 2373
integer y = 36
integer width = 567
integer height = 168
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_4 from groupbox within w_mpjaego_r
integer x = 32
integer y = 212
integer width = 3648
integer height = 156
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_area from datawindow within w_mpjaego_r
integer x = 2409
integer y = 100
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

