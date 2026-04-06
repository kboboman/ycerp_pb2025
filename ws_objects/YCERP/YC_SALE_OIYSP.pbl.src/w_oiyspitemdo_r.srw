$PBExportHeader$w_oiyspitemdo_r.srw
$PBExportComments$YSP물품별 실적현황(2000/03/06,이인호)
forward 
global type w_oiyspitemdo_r from w_inheritance
end type
type st_2 from statictext within w_oiyspitemdo_r
end type
type em_1 from editmask within w_oiyspitemdo_r
end type
type em_2 from editmask within w_oiyspitemdo_r
end type
type rb_1 from radiobutton within w_oiyspitemdo_r
end type
type rb_2 from radiobutton within w_oiyspitemdo_r
end type
type rb_3 from radiobutton within w_oiyspitemdo_r
end type
type rb_4 from radiobutton within w_oiyspitemdo_r
end type
type rb_5 from radiobutton within w_oiyspitemdo_r
end type
type st_3 from statictext within w_oiyspitemdo_r
end type
type ddlb_fld from dropdownlistbox within w_oiyspitemdo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiyspitemdo_r
end type
type st_4 from statictext within w_oiyspitemdo_r
end type
type ddlb_op from dropdownlistbox within w_oiyspitemdo_r
end type
type sle_value from singlelineedit within w_oiyspitemdo_r
end type
type cb_1 from commandbutton within w_oiyspitemdo_r
end type
type cb_2 from commandbutton within w_oiyspitemdo_r
end type
type cb_3 from commandbutton within w_oiyspitemdo_r
end type
type cb_5 from commandbutton within w_oiyspitemdo_r
end type
type gb_4 from groupbox within w_oiyspitemdo_r
end type
end forward

global type w_oiyspitemdo_r from w_inheritance
integer y = 112
integer width = 4329
integer height = 1844
string title = "YSP 물품별 실적현황(w_oiyspitemdo_r)"
st_2 st_2
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
end type
global w_oiyspitemdo_r w_oiyspitemdo_r

type variables
st_print i_print

end variables

on w_oiyspitemdo_r.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.rb_5
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.gb_4
end on

on w_oiyspitemdo_r.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_oiyspitemdo_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_oiyspitemdo_r
integer x = 32
integer y = 448
integer width = 4219
integer height = 1252
integer taborder = 0
string dataobject = "d_oiyspitemdo_s2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiyspitemdo_r
integer x = 32
integer y = 24
integer width = 1335
integer height = 136
string text = "YSP 물품별 실적현황"
end type

type st_tips from w_inheritance`st_tips within w_oiyspitemdo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiyspitemdo_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiyspitemdo_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_oiyspitemdo_r
integer x = 3525
integer y = 64
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiyspitemdo_r
integer x = 3333
integer y = 64
integer taborder = 40
end type

event pb_print::clicked;w_repsuper w_print

date ld_start, ld_end


if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//i_print.name = 'd_oiyspitemdo_r'
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 YSP물품별 실적현황(M2)을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oiyspitemdo_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_oiyspitemdo_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_oiyspitemdo_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiyspitemdo_r
integer x = 3141
integer y = 64
integer taborder = 30
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
gs_itemdo_str1 lst_code
string ls_sql, ls_where, ls_flag
date   ld_start, ld_end


ld_start = date(em_1.text)
ld_end   = date(em_2.text)
//
dw_1.setredraw(false)
if rb_4.checked = true then
	dw_1.dataobject = 'd_oiyspitemdo_s'
	dw_2.dataobject = 'd_oiyspitemdo_r'
else
	dw_1.dataobject = 'd_oiyspitemdo_s2'
	dw_2.dataobject = 'd_oiyspitemdo_r2'
end if
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

if rb_1.checked = true then
	ls_flag = 'A'
elseif rb_2.checked = true then
	ls_flag = 'P'
else
	ls_flag = 'Q'
end if
dw_1.retrieve( '%', ld_start, ld_end, ls_flag)
dw_1.groupcalc()
dw_2.retrieve( '%', ld_start, ld_end, ls_flag)
dw_2.groupcalc()
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if
	
end event

type gb_3 from w_inheritance`gb_3 within w_oiyspitemdo_r
integer x = 32
integer y = 256
integer width = 4219
integer height = 180
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiyspitemdo_r
integer x = 1417
integer y = 16
integer width = 1339
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiyspitemdo_r
integer x = 3113
integer y = 16
integer width = 631
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiyspitemdo_r
integer x = 55
integer y = 184
integer width = 101
integer height = 80
integer taborder = 0
boolean enabled = false
string dataobject = "d_oiyspitemdo_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_2 from statictext within w_oiyspitemdo_r
integer x = 1449
integer y = 56
integer width = 750
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oiyspitemdo_r
integer x = 1449
integer y = 136
integer width = 370
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiyspitemdo_r
integer x = 1824
integer y = 136
integer width = 370
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_oiyspitemdo_r
integer x = 2226
integer y = 64
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_oiyspitemdo_r
integer x = 2226
integer y = 148
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "판넬"
end type

type rb_3 from radiobutton within w_oiyspitemdo_r
integer x = 2491
integer y = 148
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부속"
end type

type rb_4 from radiobutton within w_oiyspitemdo_r
integer x = 2807
integer y = 64
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판매"
end type

type rb_5 from radiobutton within w_oiyspitemdo_r
integer x = 2807
integer y = 140
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "생산"
boolean checked = true
end type

type st_3 from statictext within w_oiyspitemdo_r
integer x = 96
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_oiyspitemdo_r
integer x = 283
integer y = 316
integer width = 443
integer height = 632
integer taborder = 110
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

type ddlb_dwtitles from dropdownlistbox within w_oiyspitemdo_r
integer x = 315
integer y = 328
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

type st_4 from statictext within w_oiyspitemdo_r
integer x = 754
integer y = 332
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

type ddlb_op from dropdownlistbox within w_oiyspitemdo_r
integer x = 923
integer y = 316
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oiyspitemdo_r
integer x = 1243
integer y = 324
integer width = 526
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

type cb_1 from commandbutton within w_oiyspitemdo_r
integer x = 1778
integer y = 324
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiyspitemdo_r
integer x = 1943
integer y = 324
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiyspitemdo_r
integer x = 2107
integer y = 324
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiyspitemdo_r
integer x = 2272
integer y = 324
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_oiyspitemdo_r
integer x = 2779
integer y = 16
integer width = 311
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

