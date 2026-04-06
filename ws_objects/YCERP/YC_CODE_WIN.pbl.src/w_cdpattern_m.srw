$PBExportHeader$w_cdpattern_m.srw
$PBExportComments$공정패턴관리(1998/08/25,곽용덕)
forward
global type w_cdpattern_m from w_inheritance
end type
type st_3 from statictext within w_cdpattern_m
end type
type ddlb_fld from dropdownlistbox within w_cdpattern_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdpattern_m
end type
type st_4 from statictext within w_cdpattern_m
end type
type sle_value from singlelineedit within w_cdpattern_m
end type
type cb_1 from commandbutton within w_cdpattern_m
end type
type cb_2 from commandbutton within w_cdpattern_m
end type
type cb_3 from commandbutton within w_cdpattern_m
end type
type cb_5 from commandbutton within w_cdpattern_m
end type
type ddlb_op from dropdownlistbox within w_cdpattern_m
end type
end forward

global type w_cdpattern_m from w_inheritance
integer width = 2743
integer height = 2140
string title = "패턴관리(w_cdpattern_m)"
boolean controlmenu = false
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_cdpattern_m w_cdpattern_m

on w_cdpattern_m.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_op
end on

on w_cdpattern_m.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if gs_userid = "1999010s" then
	dw_2.object.bigo.TabSequence = 40
else
	dw_2.object.bigo.TabSequence = 0
end if

dw_2.retrieve()
dw_1.visible = false
end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_2.width  = newwidth  - (32 * 2)
dw_2.height = newheight - dw_2.y - 32

end event

type pb_save from w_inheritance`pb_save within w_cdpattern_m
integer x = 2254
integer y = 80
end type

event pb_save::clicked;wf_update1(dw_2, 'Y')

end event

type dw_1 from w_inheritance`dw_1 within w_cdpattern_m
integer x = 1289
integer y = 76
integer width = 123
integer height = 88
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_cdpattern_m
integer width = 969
string text = "패턴관리"
end type

type st_tips from w_inheritance`st_tips within w_cdpattern_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdpattern_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdpattern_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdpattern_m
integer x = 2450
integer y = 80
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdpattern_m
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdpattern_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdpattern_m
integer x = 2057
integer y = 80
end type

event pb_delete::clicked;long ll_rowcount,k

dw_2.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_cdpattern_m
integer x = 1861
integer y = 80
end type

event pb_insert::clicked;long ll_row,ll_pat 

dw_2.accepttext()
dw_2.setredraw(false)
ll_row = dw_2.insertrow(dw_2.getrow() + 1)

dw_2.object.pat_no[ll_row] = dw_2.object.pat_no[ll_row - 1]
dw_2.groupcalc()
dw_2.scrolltorow(ll_row)
dw_2.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdpattern_m
integer x = 1664
integer y = 80
end type

event pb_retrieve::clicked;call super::clicked;dw_2.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdpattern_m
integer x = 32
integer y = 272
integer width = 2638
integer height = 164
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_cdpattern_m
boolean visible = false
integer y = 8
integer width = 1061
integer height = 152
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_cdpattern_m
integer x = 1614
integer y = 28
integer width = 1051
integer height = 224
end type

type dw_2 from w_inheritance`dw_2 within w_cdpattern_m
integer x = 32
integer y = 448
integer width = 2638
integer height = 1556
string dataobject = "d_cdpattern_m"
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if row < 1 then return
this.scrolltorow(row)

end event

type st_3 from statictext within w_cdpattern_m
integer x = 110
integer y = 340
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

type ddlb_fld from dropdownlistbox within w_cdpattern_m
integer x = 297
integer y = 324
integer width = 443
integer height = 632
integer taborder = 120
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

type ddlb_dwtitles from dropdownlistbox within w_cdpattern_m
integer x = 329
integer y = 336
integer width = 311
integer height = 88
integer taborder = 130
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

type st_4 from statictext within w_cdpattern_m
integer x = 768
integer y = 340
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

type sle_value from singlelineedit within w_cdpattern_m
integer x = 1257
integer y = 332
integer width = 567
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cdpattern_m
integer x = 1829
integer y = 332
integer width = 160
integer height = 76
integer taborder = 110
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

type cb_2 from commandbutton within w_cdpattern_m
integer x = 1993
integer y = 332
integer width = 160
integer height = 76
integer taborder = 120
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

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdpattern_m
integer x = 2158
integer y = 332
integer width = 160
integer height = 76
integer taborder = 130
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

type cb_5 from commandbutton within w_cdpattern_m
integer x = 2322
integer y = 332
integer width = 160
integer height = 76
integer taborder = 140
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

type ddlb_op from dropdownlistbox within w_cdpattern_m
integer x = 942
integer y = 324
integer width = 306
integer height = 500
integer taborder = 70
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

