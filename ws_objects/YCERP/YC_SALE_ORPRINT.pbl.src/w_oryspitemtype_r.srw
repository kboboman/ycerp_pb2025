$PBExportHeader$w_oryspitemtype_r.srw
$PBExportComments$YSP TYPE 수주현황(2003/03/12,임기천)
forward 
global type w_oryspitemtype_r from w_inheritance
end type
type em_1 from editmask within w_oryspitemtype_r
end type
type em_2 from editmask within w_oryspitemtype_r
end type
type rb_1 from radiobutton within w_oryspitemtype_r
end type
type rb_2 from radiobutton within w_oryspitemtype_r
end type
type rb_3 from radiobutton within w_oryspitemtype_r
end type
type st_1 from statictext within w_oryspitemtype_r
end type
type st_3 from statictext within w_oryspitemtype_r
end type
type ddlb_fld from dropdownlistbox within w_oryspitemtype_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oryspitemtype_r
end type
type st_4 from statictext within w_oryspitemtype_r
end type
type ddlb_op from dropdownlistbox within w_oryspitemtype_r
end type
type sle_value from singlelineedit within w_oryspitemtype_r
end type
type cb_1 from commandbutton within w_oryspitemtype_r
end type
type cb_2 from commandbutton within w_oryspitemtype_r
end type
type cb_3 from commandbutton within w_oryspitemtype_r
end type
type cb_5 from commandbutton within w_oryspitemtype_r
end type
type gb_4 from groupbox within w_oryspitemtype_r
end type
end forward

global type w_oryspitemtype_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2180
string title = "YSP TYPE 수주현황(w_oryspitemtype_r)"
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_1 st_1
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
global w_oryspitemtype_r w_oryspitemtype_r

type variables
st_print i_print
string   is_dw

end variables

on w_oryspitemtype_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_1=create st_1
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
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.gb_4
end on

on w_oryspitemtype_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_1)
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

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x



end event

type pb_save from w_inheritance`pb_save within w_oryspitemtype_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oryspitemtype_r
integer x = 32
integer y = 432
integer width = 3543
integer height = 1612
integer taborder = 0
string dataobject = "d_oryspitemtype_s1"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oryspitemtype_r
integer y = 24
integer width = 1234
integer height = 140
string text = "YSP TYPE 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_oryspitemtype_r
end type

type pb_compute from w_inheritance`pb_compute within w_oryspitemtype_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oryspitemtype_r
integer x = 3177
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "CrossTab!"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos

// 
ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS)")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_1.SaveAsAscII(ls_DocName)
	end if
end if


end event

type pb_close from w_inheritance`pb_close within w_oryspitemtype_r
integer x = 3369
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oryspitemtype_r
integer x = 2985
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 YSP TYPE별 수주현황을 출력합니다." 

OpenWithParm(w_printsetup, i_print) // cross tab은 sharedata가 안됨으로 직접프린트함.easthero
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
//


end event

type pb_cancel from w_inheritance`pb_cancel within w_oryspitemtype_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_oryspitemtype_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_oryspitemtype_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oryspitemtype_r
integer x = 2793
integer taborder = 10
end type

event pb_retrieve::clicked;//
gs_itemdo_str1 lst_code
string ls_sdate, ls_edate
date   ld_sdate, ld_edate

dw_1.SetTransObject(SQLCA)
dw_1.reset()

// 월별
//if rb_1.checked = true then
	ls_sdate  = LeftA(em_1.text,7) + "/01"
	ld_sdate  = date( em_1.text )

	ls_edate  = GF_ReplaceAll(em_2.text,"/","")
	SELECT top 1 dbo.UF_GetLastDAY( :ls_edate ) INTO :ls_edate FROM login;
	em_2.text = ls_edate
	ld_edate  = date(ls_edate)
//else
//	ld_sdate  = date(em_1.text)
//	ld_edate  = date(em_2.text)
//end if

//
dw_1.setredraw(false)
dw_1.retrieve( ld_sdate, ld_edate)
dw_1.groupcalc()
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_oryspitemtype_r
integer x = 32
integer y = 240
integer width = 3543
integer height = 176
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oryspitemtype_r
integer x = 2139
integer y = 8
integer width = 585
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oryspitemtype_r
integer x = 2738
integer y = 8
integer width = 850
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oryspitemtype_r
integer x = 55
integer y = 184
integer width = 73
integer height = 64
integer taborder = 0
boolean enabled = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::retrieveend;if this.rowcount() < 1 then return

string ls_start, ls_end
long ll_row

ls_start = em_1.text
ls_end = em_2.text

for ll_row = 1 to this.rowcount()
	this.object.start_date[ll_row] = ls_start
	this.object.end_date[ll_row] = ls_end
next

end event

type em_1 from editmask within w_oryspitemtype_r
integer x = 1339
integer y = 128
integer width = 375
integer height = 80
integer taborder = 70
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
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

end event

type em_2 from editmask within w_oryspitemtype_r
integer x = 1714
integer y = 128
integer width = 375
integer height = 80
integer taborder = 80
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
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

end event

type rb_1 from radiobutton within w_oryspitemtype_r
integer x = 2194
integer y = 64
integer width = 247
integer height = 68
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
string text = "전체"
end type

type rb_2 from radiobutton within w_oryspitemtype_r
integer x = 2450
integer y = 64
integer width = 247
integer height = 68
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
boolean checked = true
end type

event clicked;dw_1.dataobject = 'd_oryspitemtype_s1'

end event

type rb_3 from radiobutton within w_oryspitemtype_r
integer x = 2450
integer y = 140
integer width = 247
integer height = 68
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
string text = "부속"
end type

event clicked;dw_1.dataobject = 'd_oiyspitemtype2_s1'

end event

type st_1 from statictext within w_oryspitemtype_r
integer x = 1339
integer y = 48
integer width = 750
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "수주년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oryspitemtype_r
integer x = 82
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_oryspitemtype_r
integer x = 270
integer y = 300
integer width = 443
integer height = 632
integer taborder = 150
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

type ddlb_dwtitles from dropdownlistbox within w_oryspitemtype_r
integer x = 302
integer y = 312
integer width = 311
integer height = 88
integer taborder = 160
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

type st_4 from statictext within w_oryspitemtype_r
integer x = 741
integer y = 316
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

type ddlb_op from dropdownlistbox within w_oryspitemtype_r
integer x = 910
integer y = 300
integer width = 297
integer height = 512
integer taborder = 160
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

type sle_value from singlelineedit within w_oryspitemtype_r
integer x = 1230
integer y = 308
integer width = 526
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oryspitemtype_r
integer x = 1765
integer y = 308
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oryspitemtype_r
integer x = 1929
integer y = 308
integer width = 160
integer height = 76
integer taborder = 150
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

type cb_3 from commandbutton within w_oryspitemtype_r
integer x = 2094
integer y = 308
integer width = 160
integer height = 76
integer taborder = 160
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

type cb_5 from commandbutton within w_oryspitemtype_r
integer x = 2258
integer y = 308
integer width = 160
integer height = 76
integer taborder = 170
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

type gb_4 from groupbox within w_oryspitemtype_r
integer x = 1307
integer y = 8
integer width = 814
integer height = 216
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

