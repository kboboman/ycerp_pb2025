$PBExportHeader$w_osteamopeom_r.srw
$PBExportComments$매출실적 현황(직원)
forward 
global type w_osteamopeom_r from w_inheritance
end type
type em_1 from editmask within w_osteamopeom_r
end type
type st_1 from statictext within w_osteamopeom_r
end type
type pb_1 from picturebutton within w_osteamopeom_r
end type
type st_4 from statictext within w_osteamopeom_r
end type
type ddlb_fld from dropdownlistbox within w_osteamopeom_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osteamopeom_r
end type
type st_5 from statictext within w_osteamopeom_r
end type
type ddlb_op from dropdownlistbox within w_osteamopeom_r
end type
type sle_value from singlelineedit within w_osteamopeom_r
end type
type cb_1 from commandbutton within w_osteamopeom_r
end type
type cb_2 from commandbutton within w_osteamopeom_r
end type
type cb_3 from commandbutton within w_osteamopeom_r
end type
type cb_5 from commandbutton within w_osteamopeom_r
end type
end forward

global type w_osteamopeom_r from w_inheritance
integer x = 23
integer y = 112
integer width = 4370
integer height = 2288
string title = "매출실적 현황(직원)(w_osteamopeom_r)"
string icon = "Hand!"
em_1 em_1
st_1 st_1
pb_1 pb_1
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
global w_osteamopeom_r w_osteamopeom_r

type variables
integer ii_month
end variables

on w_osteamopeom_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.pb_1=create pb_1
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
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
end on

on w_osteamopeom_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.pb_1)
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

debugbreak()

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("매출_실적현황(직원)", gs_userid) = "Y" then
else
	RETURN
end if

dw_2.visible = false

em_1.text = string(gf_today(),"yyyy/mm/dd")


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_osteamopeom_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osteamopeom_r
integer x = 32
integer y = 404
integer width = 4256
integer height = 1748
integer taborder = 140
string dataobject = "d_osteamopeom_rr"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osteamopeom_r
integer y = 12
integer width = 1321
string text = "매출 실적현황(직원)"
end type

type st_tips from w_inheritance`st_tips within w_osteamopeom_r
end type

type pb_compute from w_inheritance`pb_compute within w_osteamopeom_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_osteamopeom_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osteamopeom_r
integer x = 4059
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osteamopeom_r
integer x = 3867
integer taborder = 40
end type

event pb_print::clicked;////
//w_repsuper w_print
//st_print   l_print
// 
//if dw_1.rowcount() < 1 then return
//
////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//l_print.st_datawindow  = dw_2
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 월매출 실적집계 현황(주간)을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_osteamopeom_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_osteamopeom_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_osteamopeom_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osteamopeom_r
integer x = 3483
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_sdate, ls_edate, ls_yyyymm
long   ll_year, ll_month

dw_1.reset()

ll_year  = Year(date(em_1.text))

dw_1.setredraw(false)
dw_1.retrieve( ll_year )
dw_1.setredraw(true)

MessageBox("확인","조회완료",information!)

end event

type gb_3 from w_inheritance`gb_3 within w_osteamopeom_r
integer x = 2633
integer y = 12
integer width = 809
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osteamopeom_r
integer y = 224
integer width = 4256
integer height = 160
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_osteamopeom_r
integer x = 3456
integer width = 827
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osteamopeom_r
integer x = 50
integer y = 168
integer width = 110
integer height = 72
integer taborder = 80
string title = "d_osteamaroiweek_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_osteamopeom_r
integer x = 2999
integer y = 88
integer width = 411
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
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
string displaydata = "T"
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_osteamopeom_r
integer x = 2688
integer y = 104
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "조회년도:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_osteamopeom_r
integer x = 3675
integer y = 52
integer width = 187
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos, li_value
DataWindow dwxls

dwxls = dw_1

if dwxls.rowcount() > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	
	MessageBox("확인", "작업완료")
end if
end event

type st_4 from statictext within w_osteamopeom_r
integer x = 96
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_osteamopeom_r
integer x = 283
integer y = 276
integer width = 480
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_osteamopeom_r
integer x = 338
integer y = 292
integer width = 311
integer height = 88
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

type st_5 from statictext within w_osteamopeom_r
integer x = 800
integer y = 292
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

type ddlb_op from dropdownlistbox within w_osteamopeom_r
integer x = 969
integer y = 276
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_osteamopeom_r
integer x = 1289
integer y = 284
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_osteamopeom_r
integer x = 1870
integer y = 284
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_osteamopeom_r
integer x = 2034
integer y = 284
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_osteamopeom_r
integer x = 2199
integer y = 284
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osteamopeom_r
integer x = 2363
integer y = 284
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

