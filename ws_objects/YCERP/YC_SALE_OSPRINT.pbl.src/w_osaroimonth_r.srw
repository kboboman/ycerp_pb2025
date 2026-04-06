$PBExportHeader$w_osaroimonth_r.srw
$PBExportComments$물품별 월 매출집계(1998/05/15, 정재수)
forward 
global type w_osaroimonth_r from w_inheritance
end type
type st_1 from statictext within w_osaroimonth_r
end type
type em_1 from editmask within w_osaroimonth_r
end type
type dw_area from datawindow within w_osaroimonth_r
end type
type st_3 from statictext within w_osaroimonth_r
end type
type pb_1 from picturebutton within w_osaroimonth_r
end type
type st_4 from statictext within w_osaroimonth_r
end type
type ddlb_fld from dropdownlistbox within w_osaroimonth_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osaroimonth_r
end type
type st_5 from statictext within w_osaroimonth_r
end type
type ddlb_op from dropdownlistbox within w_osaroimonth_r
end type
type sle_value from singlelineedit within w_osaroimonth_r
end type
type cb_1 from commandbutton within w_osaroimonth_r
end type
type cb_2 from commandbutton within w_osaroimonth_r
end type
type cb_3 from commandbutton within w_osaroimonth_r
end type
type cb_5 from commandbutton within w_osaroimonth_r
end type
type cbx_1 from checkbox within w_osaroimonth_r
end type
type gb_4 from groupbox within w_osaroimonth_r
end type
end forward

global type w_osaroimonth_r from w_inheritance
integer y = 112
integer width = 3845
integer height = 2180
string title = "물품별 월 매출집계(w_osaroimonth_r)"
st_1 st_1
em_1 em_1
dw_area dw_area
st_3 st_3
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
cbx_1 cbx_1
gb_4 gb_4
end type
global w_osaroimonth_r w_osaroimonth_r

type variables
string is_sale_flag
end variables

on w_osaroimonth_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.dw_area=create dw_area
this.st_3=create st_3
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
this.cbx_1=create cbx_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.gb_4
end on

on w_osaroimonth_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.dw_area)
destroy(this.st_3)
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
destroy(this.cbx_1)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

datawindowchild ldwc_area

em_1.text = string(today(), 'yyyy/mm')

dw_2.visible = false

dw_1.sharedata(dw_2)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.object.area[1] = gs_area
dw_area.getchild('area',ldwc_area)
ldwc_area.insertrow(1)
ldwc_area.setitem(1,'area_no','%')
ldwc_area.setitem(1,'area_name','전체')
ldwc_area.accepttext()
dw_area.accepttext()

end event

event resize;call super::resize;//
gb_2.width  = newwidth - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x



end event

type pb_save from w_inheritance`pb_save within w_osaroimonth_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osaroimonth_r
integer x = 32
integer y = 404
integer width = 3744
integer height = 1640
integer taborder = 0
string dataobject = "d_osaroimonth_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osaroimonth_r
integer y = 20
integer width = 1239
integer height = 132
string text = "물품별 월 매출집계"
end type

type st_tips from w_inheritance`st_tips within w_osaroimonth_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroimonth_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroimonth_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osaroimonth_r
integer x = 3026
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroimonth_r
integer x = 2834
integer taborder = 40
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_1.rowcount() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_osaroimonth_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 물품별 월 매출집계를 출력합니다." 
// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroimonth_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osaroimonth_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osaroimonth_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroimonth_r
integer x = 2450
integer taborder = 30
end type

event pb_retrieve::clicked;//
string  ls_area, ls_sale_flag[]
long    ll_year, ll_month
pointer oldpointer // Declares a pointer variable
st_security lst_security

oldpointer = SetPointer(HourGlass!)
if em_1.text = '' then
	messagebox("확인","매출년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ll_year  = long(LeftA(em_1.text, 4))
ll_month = long(RightA(em_1.text, 2))

ls_sale_flag[1] = 'D'
ls_sale_flag[2] = 'L'
ls_sale_flag[3] = 'E'

string ls_level
Choose Case gs_level
	Case 'A', 'B'
		ls_level = '%'
	Case 'C'
		ls_level = gs_userid
End Choose

debugbreak()

dw_1.retrieve( ls_area, ls_sale_flag, ll_year, ll_month, ls_level)
dw_1.setfocus()
SetPointer(oldpointer)
	
end event

type gb_3 from w_inheritance`gb_3 within w_osaroimonth_r
integer x = 1970
integer y = 0
integer width = 430
integer height = 224
integer taborder = 0
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_osaroimonth_r
integer width = 3744
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroimonth_r
integer x = 2423
integer y = 0
integer width = 823
integer height = 224
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_osaroimonth_r
integer x = 46
integer y = 168
integer width = 96
integer height = 64
integer taborder = 0
string dataobject = "d_osaroimonth_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::retrieverow;//if row < 1 then return
//
//long ll_year, ll_month
//ll_year = long(left(em_1.text, 4))
//ll_month = long(right(em_1.text, 2))
//this.object.cc_year[row] = string(ll_year)
//this.object.cc_month[row] = right('0' + string(ll_month), 2)
//
end event

type st_1 from statictext within w_osaroimonth_r
integer x = 2007
integer y = 40
integer width = 357
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "매출년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_osaroimonth_r
integer x = 2007
integer y = 124
integer width = 357
integer height = 80
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
string mask = "yyyy/mm"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_area from datawindow within w_osaroimonth_r
integer x = 1381
integer y = 124
integer width = 530
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type st_3 from statictext within w_osaroimonth_r
integer x = 1381
integer y = 40
integer width = 526
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
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_osaroimonth_r
event mousemove pbm_mousemove
integer x = 2642
integer y = 52
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_4 from statictext within w_osaroimonth_r
integer x = 101
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

type ddlb_fld from dropdownlistbox within w_osaroimonth_r
integer x = 288
integer y = 276
integer width = 480
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

type ddlb_dwtitles from dropdownlistbox within w_osaroimonth_r
integer x = 329
integer y = 288
integer width = 311
integer height = 88
integer taborder = 200
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

type st_5 from statictext within w_osaroimonth_r
integer x = 786
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

type ddlb_op from dropdownlistbox within w_osaroimonth_r
integer x = 955
integer y = 276
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

type sle_value from singlelineedit within w_osaroimonth_r
integer x = 1275
integer y = 284
integer width = 567
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_osaroimonth_r
integer x = 1847
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_osaroimonth_r
integer x = 2011
integer y = 284
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

type cb_3 from commandbutton within w_osaroimonth_r
integer x = 2176
integer y = 284
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osaroimonth_r
integer x = 2341
integer y = 284
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_1 from checkbox within w_osaroimonth_r
integer x = 2542
integer y = 296
integer width = 402
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "소계보기"
end type

event clicked;// 소계보기
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=80")	// 소계
else
	dw_1.Modify("DataWindow.Detail.Height=80")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=80")	// 소계
end if

end event

type gb_4 from groupbox within w_osaroimonth_r
integer x = 1344
integer width = 599
integer height = 224
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

