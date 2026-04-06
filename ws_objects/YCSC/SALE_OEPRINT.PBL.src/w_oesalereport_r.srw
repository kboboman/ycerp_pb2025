$PBExportHeader$w_oesalereport_r.srw
$PBExportComments$영업일지(고객이력)
forward
global type w_oesalereport_r from w_inheritance
end type
type gb_4 from groupbox within w_oesalereport_r
end type
type st_2 from statictext within w_oesalereport_r
end type
type dw_area from datawindow within w_oesalereport_r
end type
type em_1 from editmask within w_oesalereport_r
end type
type em_2 from editmask within w_oesalereport_r
end type
type pb_1 from picturebutton within w_oesalereport_r
end type
type st_1 from statictext within w_oesalereport_r
end type
type st_3 from statictext within w_oesalereport_r
end type
type dw_3 from datawindow within w_oesalereport_r
end type
type st_4 from statictext within w_oesalereport_r
end type
type st_6 from statictext within w_oesalereport_r
end type
type ddlb_fld from dropdownlistbox within w_oesalereport_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oesalereport_r
end type
type st_7 from statictext within w_oesalereport_r
end type
type ddlb_op from dropdownlistbox within w_oesalereport_r
end type
type sle_value from singlelineedit within w_oesalereport_r
end type
type cb_1 from commandbutton within w_oesalereport_r
end type
type cb_2 from commandbutton within w_oesalereport_r
end type
type cb_3 from commandbutton within w_oesalereport_r
end type
type cb_5 from commandbutton within w_oesalereport_r
end type
type cbx_1 from checkbox within w_oesalereport_r
end type
end forward

global type w_oesalereport_r from w_inheritance
integer x = 5
integer y = 36
integer width = 5691
integer height = 5716
string title = "영업일지(고객이력)(w_oesalereport_r)"
gb_4 gb_4
st_2 st_2
dw_area dw_area
em_1 em_1
em_2 em_2
pb_1 pb_1
st_1 st_1
st_3 st_3
dw_3 dw_3
st_4 st_4
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_1 cbx_1
end type
global w_oesalereport_r w_oesalereport_r

type variables
date   id_date1, id_date2
string is_area,  is_cust

st_print i_print
datawindowchild idwc_area, idwc_cust

date    id_start, id_end
gs_custdo_str ist_code

end variables

on w_oesalereport_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.st_2=create st_2
this.dw_area=create dw_area
this.em_1=create em_1
this.em_2=create em_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_3=create st_3
this.dw_3=create dw_3
this.st_4=create st_4
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_7
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.cbx_1
end on

on w_oesalereport_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = " "

// 전체작업장
dw_3.settransobject(sqlca)
dw_3.insertrow(0)  

em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")

idwc_cust.setredraw(false)
dw_3.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")

dw_3.object.cust_no[1] = "%" // 전체
idwc_cust.accepttext()
idwc_cust.setredraw(false)

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 488

dw_1.width  = this.width  - 165
dw_1.height = this.height - 564


end event

type pb_save from w_inheritance`pb_save within w_oesalereport_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_oesalereport_r
integer x = 59
integer y = 412
integer width = 4530
integer height = 2332
integer taborder = 50
string dataobject = "d_customer_det_list"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return
this.scrolltorow(row)

//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_oesalereport_r
integer x = 1175
integer y = 8
integer width = 219
integer height = 132
integer taborder = 60
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oesalereport_r
integer x = 37
integer y = 48
integer width = 1417
integer height = 148
string text = "영업일지(고객이력)"
end type

type st_tips from w_inheritance`st_tips within w_oesalereport_r
end type

type pb_compute from w_inheritance`pb_compute within w_oesalereport_r
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oesalereport_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oesalereport_r
integer x = 4407
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oesalereport_r
integer x = 4032
integer y = 60
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
datawindow dwprt
string     ls_zoom

ls_zoom = "100"
dwprt   = dw_2

if dwprt.rowcount() < 1 then return 

i_print.st_datawindow  = dwprt
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 물품별 출고현황(집계)을  출력합니다." 

gs_print_control  = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=" + ls_zoom
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oesalereport_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oesalereport_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oesalereport_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oesalereport_r
integer x = 3840
integer y = 60
integer taborder = 140
boolean default = true
end type

event pb_retrieve::clicked;string ls_area, ls_cust,  ls_start, ls_end
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_area.accepttext()
ls_area   = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

dw_3.accepttext()
ls_cust   = trim(dw_3.object.cust_no[1])
if isnull(ls_cust) or ls_cust = "" then ls_cust = "%"

ls_start  = em_1.text
ls_end    = em_2.text

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

// 거래처 + 등록일자 정렬
cbx_1.checked = false
cbx_1.triggerevent( clicked! )

ll_row = dw_1.retrieve( ls_start, ls_end, ls_cust )
if ll_row < 1 then
	MessageBox("확인", "조회조건에 내역이 없습니다.",information!)
	return
else
	MessageBox("확인", "작업완료.",information!)
end if

dw_2.sort()
dw_2.groupcalc()
dw_2.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_oesalereport_r
integer x = 2107
integer y = 16
integer width = 1691
integer height = 204
integer taborder = 70
integer textsize = -10
end type

type gb_2 from w_inheritance`gb_2 within w_oesalereport_r
integer y = 360
integer width = 4590
integer height = 2408
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oesalereport_r
integer x = 3808
integer y = 16
integer width = 814
integer taborder = 40
integer textsize = -10
end type

type gb_4 from groupbox within w_oesalereport_r
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

type st_2 from statictext within w_oesalereport_r
integer x = 2144
integer y = 52
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oesalereport_r
integer x = 2144
integer y = 128
integer width = 521
integer height = 84
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

event rowfocuschanged;//
dw_1.reset()
this.accepttext()

is_area    = trim(this.object.area[1])
if isnull(is_area) or is_area = "" then is_area = "%"

end event

type em_1 from editmask within w_oesalereport_r
integer x = 2903
integer y = 132
integer width = 407
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;id_date1 = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_date1 = date(this.text)

end event

type em_2 from editmask within w_oesalereport_r
integer x = 3360
integer y = 132
integer width = 407
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;//
id_date2 = date(this.text)
pb_retrieve.default = true

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_date2 = date(this.text)

end event

type pb_1 from picturebutton within w_oesalereport_r
event mousemove pbm_mousemove
integer x = 4219
integer y = 60
integer width = 187
integer height = 144
integer taborder = 130
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
datawindow dwxls

dwxls = dw_1

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
										"엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인","작업완료")
	end if
end if
end event

type st_1 from statictext within w_oesalereport_r
integer x = 2670
integer y = 52
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oesalereport_r
integer x = 3314
integer y = 144
integer width = 46
integer height = 52
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "~~"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oesalereport_r
integer x = 2903
integer y = 48
integer width = 869
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;//
dw_1.reset()
this.accepttext()

is_cust    = trim(this.object.cust_no[1])
if isnull(is_cust) or is_cust = "" then is_cust = "%"

end event

event losefocus;this.accepttext()

end event

type st_4 from statictext within w_oesalereport_r
integer x = 2670
integer y = 132
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oesalereport_r
integer x = 73
integer y = 272
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

type ddlb_fld from dropdownlistbox within w_oesalereport_r
integer x = 261
integer y = 256
integer width = 480
integer height = 632
integer taborder = 10
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

type ddlb_dwtitles from dropdownlistbox within w_oesalereport_r
integer x = 302
integer y = 268
integer width = 311
integer height = 88
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

type st_7 from statictext within w_oesalereport_r
integer x = 759
integer y = 272
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

type ddlb_op from dropdownlistbox within w_oesalereport_r
integer x = 928
integer y = 256
integer width = 297
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_oesalereport_r
integer x = 1248
integer y = 264
integer width = 517
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oesalereport_r
integer x = 1778
integer y = 264
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

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oesalereport_r
integer x = 1943
integer y = 264
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

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oesalereport_r
integer x = 2107
integer y = 264
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

type cb_5 from commandbutton within w_oesalereport_r
integer x = 2272
integer y = 264
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

type cbx_1 from checkbox within w_oesalereport_r
integer x = 2455
integer y = 276
integer width = 878
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처 + 등록일자 정렬"
end type

event clicked;// 거래처 + 등록일자 정렬
if this.checked = true then
	dw_1.setsort( 'cust_name, idate desc, seq desc' )
	dw_1.sort()
else
	dw_1.setsort( 'idate desc, seq desc' )
	dw_1.sort()
end if

end event

