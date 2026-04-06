$PBExportHeader$w_osaroimst_r.srw
$PBExportComments$매출대장(1998/05/15, 정재수)
forward 
global type w_osaroimst_r from w_inheritance
end type
type st_1 from statictext within w_osaroimst_r
end type
type em_1 from editmask within w_osaroimst_r
end type
type em_2 from editmask within w_osaroimst_r
end type
type st_2 from statictext within w_osaroimst_r
end type
type dw_area from datawindow within w_osaroimst_r
end type
type pb_1 from picturebutton within w_osaroimst_r
end type
type dw_5 from datawindow within w_osaroimst_r
end type
type st_4 from statictext within w_osaroimst_r
end type
type ddlb_fld from dropdownlistbox within w_osaroimst_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osaroimst_r
end type
type st_5 from statictext within w_osaroimst_r
end type
type ddlb_op from dropdownlistbox within w_osaroimst_r
end type
type sle_value from singlelineedit within w_osaroimst_r
end type
type cb_1 from commandbutton within w_osaroimst_r
end type
type cb_2 from commandbutton within w_osaroimst_r
end type
type cb_3 from commandbutton within w_osaroimst_r
end type
type cb_5 from commandbutton within w_osaroimst_r
end type
type st_3 from statictext within w_osaroimst_r
end type
type gb_4 from groupbox within w_osaroimst_r
end type
end forward

global type w_osaroimst_r from w_inheritance
integer y = 112
integer width = 4229
integer height = 2288
string title = "매출대장(w_osaroimst_r)"
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
dw_area dw_area
pb_1 pb_1
dw_5 dw_5
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
st_3 st_3
gb_4 gb_4
end type
global w_osaroimst_r w_osaroimst_r

type prototypes

end prototypes

type variables
string is_sale_flag, is_areaname
end variables

on w_osaroimst_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.dw_5=create dw_5
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
this.st_3=create st_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.gb_4
end on

on w_osaroimst_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.dw_5)
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
destroy(this.st_3)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

datawindowchild ldwc_area, ldwc_cust

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

dw_1.sharedata(dw_2)

// 사업장
dw_area.settransobject(sqlca)

dw_area.insertrow(0)  
dw_area.object.area[1] = " "
dw_area.getchild('area',ldwc_area)

ldwc_area.insertrow(1)
ldwc_area.setitem(1,'area_no',' ')
ldwc_area.setitem(1,'area_name','전체')

ldwc_area.accepttext()
dw_area.accepttext()

// 거래처
dw_5.settransobject(sqlca)
dw_5.getchild("cust_no", ldwc_cust)
ldwc_cust.settransobject(sqlca)

ldwc_cust.retrieve( "%" )
ldwc_cust.insertrow(1)
ldwc_cust.setitem(1, "cust_no", "%")
ldwc_cust.setitem(1, "cust_name", "전체")
ldwc_cust.accepttext()

dw_5.object.cust_no[1] = "%"
dw_5.accepttext()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_osaroimst_r
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_osaroimst_r
integer x = 27
integer y = 440
integer width = 4123
integer height = 1720
integer taborder = 0
string dataobject = "d_osaroimstrep_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

This.SelectRow(0,  false)
This.SelectRow(row, TRUE)

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osaroimst_r
integer y = 24
integer width = 1408
integer height = 140
string text = "매출대장(계산서기준)"
end type

type st_tips from w_inheritance`st_tips within w_osaroimst_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroimst_r
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroimst_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_osaroimst_r
integer x = 3931
integer y = 68
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroimst_r
integer x = 3547
integer y = 68
integer taborder = 50
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print

long   ll_cnt
date   ld_sdate, ld_edate
string ls_area,  ls_custno, ls_userid
 
if em_1.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","매출기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_5.accepttext()

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

ls_custno= dw_5.object.cust_no[1]
ls_area  = LeftA(trim(dw_area.object.area[1]), 1) + '%'

choose case gs_level
	case 'A', 'B'
		ls_userid = '%'
	case 'C'
		ls_userid = gs_userid
end choose

dw_2.retrieve( ls_custno, ld_sdate, ld_edate, ls_area, ls_userid )
if dw_2.rowcount() > 0 then
	if trim(LeftA(dw_area.object.area[1], 1)) = '' then
		is_areaname = '전체'
	else
		ls_area = dw_area.object.area[1]
		SELECT area_name INTO :is_areaname FROM area WHERE area_no = :ls_area;
	end if
	
	for ll_cnt = 1 to dw_2.rowcount()
		dw_2.object.c_start[ll_cnt] = string(ld_sdate, 'YYYY/MM/DD')
		dw_2.object.c_end[ll_cnt]   = string(ld_edate, 'YYYY/MM/DD')
//		dw_2.object.c_area[ll_cnt]  = is_areaname
	next
	
	l_print.name = 'd_osaroimstrep_r1'
	l_print.st_datawindow  = dw_2
	l_print.st_print_sheet = " 프린트용지 : B4"
	l_print.st_print_desc  = " 이 프로그램은 매출대장을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroimst_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_osaroimst_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_osaroimst_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroimst_r
integer x = 3355
integer y = 68
integer taborder = 40
end type

event pb_retrieve::clicked;//
string  ls_area,  ls_custno, ls_userid
date    ld_sdate, ld_edate
st_security lst_security
 
if em_1.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","매출기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_5.accepttext()

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

ls_custno= dw_5.object.cust_no[1]
ls_area  = LeftA(trim(dw_area.object.area[1]), 1) + '%'

choose case gs_level
	case 'A', 'B'
		ls_userid = '%'
	case 'C'
		ls_userid = gs_userid
end choose

dw_1.retrieve( ls_custno, ld_sdate, ld_edate, ls_area, ls_userid )
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_osaroimst_r
integer x = 2080
integer y = 16
integer width = 1230
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroimst_r
integer x = 27
integer y = 248
integer width = 4123
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroimst_r
integer x = 3328
integer y = 16
integer width = 818
integer height = 224
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroimst_r
integer x = 1015
integer y = 4
integer width = 105
integer height = 92
integer taborder = 0
boolean enabled = false
string dataobject = "d_osaroimstrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_1 from statictext within w_osaroimst_r
integer x = 2117
integer y = 56
integer width = 325
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "매출기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_osaroimst_r
integer x = 2450
integer y = 56
integer width = 411
integer height = 80
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
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_osaroimst_r
integer x = 2871
integer y = 56
integer width = 411
integer height = 80
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
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_osaroimst_r
integer x = 2117
integer y = 144
integer width = 325
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "거 래 처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_osaroimst_r
integer x = 1513
integer y = 148
integer width = 517
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if

end event

event losefocus;this.accepttext()
end event

type pb_1 from picturebutton within w_osaroimst_r
event mousemove pbm_mousemove
integer x = 3739
integer y = 68
integer width = 187
integer height = 144
integer taborder = 60
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt

ll_cnt = dw_1.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type dw_5 from datawindow within w_osaroimst_r
integer x = 2450
integer y = 140
integer width = 626
integer height = 84
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

type st_4 from statictext within w_osaroimst_r
integer x = 142
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

type ddlb_fld from dropdownlistbox within w_osaroimst_r
integer x = 329
integer y = 300
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_osaroimst_r
integer x = 361
integer y = 312
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

type st_5 from statictext within w_osaroimst_r
integer x = 800
integer y = 320
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

type ddlb_op from dropdownlistbox within w_osaroimst_r
integer x = 969
integer y = 304
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

type sle_value from singlelineedit within w_osaroimst_r
integer x = 1289
integer y = 308
integer width = 567
integer height = 80
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

type cb_1 from commandbutton within w_osaroimst_r
integer x = 1861
integer y = 312
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

type cb_2 from commandbutton within w_osaroimst_r
integer x = 2025
integer y = 312
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

type cb_3 from commandbutton within w_osaroimst_r
integer x = 2190
integer y = 312
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

type cb_5 from commandbutton within w_osaroimst_r
integer x = 2354
integer y = 312
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

type st_3 from statictext within w_osaroimst_r
integer x = 1513
integer y = 64
integer width = 517
integer height = 80
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

type gb_4 from groupbox within w_osaroimst_r
integer x = 1486
integer y = 16
integer width = 576
integer height = 224
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

