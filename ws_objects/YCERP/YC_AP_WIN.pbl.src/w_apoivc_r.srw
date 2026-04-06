$PBExportHeader$w_apoivc_r.srw
$PBExportComments$월별지불총괄현황(2001/12/08, 이대준)
forward 
global type w_apoivc_r from w_inheritance
end type
type st_1 from statictext within w_apoivc_r
end type
type em_1 from editmask within w_apoivc_r
end type
type st_4 from statictext within w_apoivc_r
end type
type ddlb_fld from dropdownlistbox within w_apoivc_r
end type
type ddlb_dwtitles from dropdownlistbox within w_apoivc_r
end type
type st_5 from statictext within w_apoivc_r
end type
type ddlb_op from dropdownlistbox within w_apoivc_r
end type
type sle_value from singlelineedit within w_apoivc_r
end type
type cb_1 from commandbutton within w_apoivc_r
end type
type cb_2 from commandbutton within w_apoivc_r
end type
type cb_3 from commandbutton within w_apoivc_r
end type
type cb_5 from commandbutton within w_apoivc_r
end type
end forward

global type w_apoivc_r from w_inheritance
integer width = 3369
integer height = 2212
string title = "월별지불총괄현황(w_apoivc_r)"
st_1 st_1
em_1 em_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_apoivc_r w_apoivc_r

type variables
st_print i_print
end variables

on w_apoivc_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
end on

on w_apoivc_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

em_1.text = string(today(),"yyyy/mm")

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_apoivc_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_apoivc_r
integer x = 32
integer y = 420
integer width = 3259
integer height = 1640
integer taborder = 50
string dataobject = "d_apoivc_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_apoivc_r
integer y = 36
integer width = 1216
integer height = 132
string text = "월별지불 총괄현황"
end type

type st_tips from w_inheritance`st_tips within w_apoivc_r
end type

type pb_compute from w_inheritance`pb_compute within w_apoivc_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoivc_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoivc_r
integer x = 2432
integer taborder = 100
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoivc_r
integer x = 2240
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then return

i_print.st_datawindow  = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 월별지불총괄현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apoivc_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_apoivc_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_apoivc_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoivc_r
integer x = 2048
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date

ls_date = em_1.text

dw_1.setredraw(false)
if dw_1.retrieve(ls_date) < 1 then
	dw_1.reset()
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_apoivc_r
integer x = 1317
integer y = 12
integer width = 677
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_apoivc_r
integer width = 3259
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_apoivc_r
integer x = 2011
integer width = 635
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_apoivc_r
boolean visible = false
integer x = 27
integer y = 4
integer width = 142
integer height = 116
integer taborder = 60
end type

type st_1 from statictext within w_apoivc_r
integer x = 1367
integer y = 96
integer width = 174
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "년월"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within w_apoivc_r
integer x = 1568
integer y = 84
integer width = 366
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

type st_4 from statictext within w_apoivc_r
integer x = 73
integer y = 300
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

type ddlb_fld from dropdownlistbox within w_apoivc_r
integer x = 261
integer y = 284
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

type ddlb_dwtitles from dropdownlistbox within w_apoivc_r
integer x = 302
integer y = 296
integer width = 311
integer height = 88
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

type st_5 from statictext within w_apoivc_r
integer x = 759
integer y = 300
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

type ddlb_op from dropdownlistbox within w_apoivc_r
integer x = 928
integer y = 284
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_apoivc_r
integer x = 1248
integer y = 292
integer width = 494
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_apoivc_r
integer x = 1755
integer y = 292
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_apoivc_r
integer x = 1920
integer y = 292
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if
//
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_apoivc_r
integer x = 2085
integer y = 292
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_apoivc_r
integer x = 2249
integer y = 292
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

