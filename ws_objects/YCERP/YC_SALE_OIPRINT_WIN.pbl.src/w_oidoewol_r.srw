$PBExportHeader$w_oidoewol_r.srw
$PBExportComments$거래처별 이월내역
forward
global type w_oidoewol_r from w_inheritance
end type
type rb_1 from radiobutton within w_oidoewol_r
end type
type rb_2 from radiobutton within w_oidoewol_r
end type
type rb_3 from radiobutton within w_oidoewol_r
end type
type rb_4 from radiobutton within w_oidoewol_r
end type
type st_2 from statictext within w_oidoewol_r
end type
type dw_area from datawindow within w_oidoewol_r
end type
type em_1 from editmask within w_oidoewol_r
end type
type em_2 from editmask within w_oidoewol_r
end type
type pb_1 from picturebutton within w_oidoewol_r
end type
type st_1 from statictext within w_oidoewol_r
end type
type st_3 from statictext within w_oidoewol_r
end type
type dw_3 from datawindow within w_oidoewol_r
end type
type st_4 from statictext within w_oidoewol_r
end type
type dw_4 from datawindow within w_oidoewol_r
end type
type dw_5 from datawindow within w_oidoewol_r
end type
type st_5 from statictext within w_oidoewol_r
end type
type st_6 from statictext within w_oidoewol_r
end type
type ddlb_fld from dropdownlistbox within w_oidoewol_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oidoewol_r
end type
type st_7 from statictext within w_oidoewol_r
end type
type sle_value from singlelineedit within w_oidoewol_r
end type
type cb_1 from commandbutton within w_oidoewol_r
end type
type cb_2 from commandbutton within w_oidoewol_r
end type
type cb_3 from commandbutton within w_oidoewol_r
end type
type cb_5 from commandbutton within w_oidoewol_r
end type
type rb_5 from radiobutton within w_oidoewol_r
end type
type rb_6 from radiobutton within w_oidoewol_r
end type
type ddlb_op from dropdownlistbox within w_oidoewol_r
end type
end forward

global type w_oidoewol_r from w_inheritance
integer x = 5
integer y = 36
integer width = 4590
integer height = 2288
string title = "거래처별 이월내역(w_oidoewol_r)"
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_2 st_2
dw_area dw_area
em_1 em_1
em_2 em_2
pb_1 pb_1
st_1 st_1
st_3 st_3
dw_3 dw_3
st_4 st_4
dw_4 dw_4
dw_5 dw_5
st_5 st_5
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
rb_5 rb_5
rb_6 rb_6
ddlb_op ddlb_op
end type
global w_oidoewol_r w_oidoewol_r

type variables
date   id_date1, id_date2
string is_area,  is_cust

st_print i_print
datawindowchild idwc_area, idwc_cust

date    id_start, id_end
gs_custdo_str ist_code

end variables

on w_oidoewol_r.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_2=create st_2
this.dw_area=create dw_area
this.em_1=create em_1
this.em_2=create em_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_3=create st_3
this.dw_3=create dw_3
this.st_4=create st_4
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_5=create st_5
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.rb_5=create rb_5
this.rb_6=create rb_6
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.em_2
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.dw_3
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.dw_5
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.ddlb_fld
this.Control[iCurrent+19]=this.ddlb_dwtitles
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.sle_value
this.Control[iCurrent+22]=this.cb_1
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.cb_3
this.Control[iCurrent+25]=this.cb_5
this.Control[iCurrent+26]=this.rb_5
this.Control[iCurrent+27]=this.rb_6
this.Control[iCurrent+28]=this.ddlb_op
end on

on w_oidoewol_r.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.st_4)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.ddlb_op)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_4.visible = false
dw_5.visible = false

dw_1.settransobject(sqlca)

dw_4.settransobject(sqlca)
dw_4.sharedata(dw_5)

dw_2.settransobject(sqlca)
dw_1.sharedata(dw_2)

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

// 전체거래처
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
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_oidoewol_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_oidoewol_r
integer x = 32
integer y = 396
integer width = 4480
integer height = 1756
integer taborder = 50
string dataobject = "d_oidoewol_t"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return
this.scrolltorow(row)

//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oidoewol_r
integer x = 37
integer y = 48
integer width = 1225
integer height = 148
string text = "거래처별 이월내역"
end type

type st_tips from w_inheritance`st_tips within w_oidoewol_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidoewol_r
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidoewol_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oidoewol_r
integer x = 4293
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidoewol_r
integer x = 3918
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
if rb_5.checked = true then			// 집계
	ls_zoom = "85"
	dwprt   = dw_2
elseif rb_6.checked = true then		// 거래처
	dwprt   = dw_5
end if

if dwprt.rowcount() < 1 then return 

i_print.st_datawindow  = dwprt
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 물품별 출고현황(집계)을  출력합니다." 

gs_print_control  = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=" + ls_zoom
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oidoewol_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oidoewol_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oidoewol_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidoewol_r
integer x = 3726
integer y = 60
integer taborder = 140
boolean default = true
end type

event pb_retrieve::clicked;string ls_area, ls_cust,  ls_start, ls_end, ls_category
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

if rb_1.checked = true then		// 전체
	ls_category = "%"
elseif rb_2.checked = true then	// 제품
	ls_category = "P%"
elseif rb_3.checked = true then	// 상품
	ls_category = "G%"
elseif rb_4.checked = true then	// 원재료
	ls_category = "M%"
end if

dw_2.setredraw(false)
if rb_5.checked = true then			// 집계
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	ll_row = dw_1.retrieve( ls_area, ls_start, ls_end, ls_cust, ls_category )

elseif rb_6.checked = true then		// 거래처
	GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
	ll_row = dw_4.retrieve( ls_area, ls_start, ls_end, ls_cust, ls_category )
end if

if ll_row < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	return
else
	MessageBox("확인", "작업완료.",information!)
end if

dw_2.sort()
dw_2.groupcalc()
dw_2.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_oidoewol_r
integer x = 1422
integer y = 16
integer width = 2263
integer height = 204
integer taborder = 70
integer textsize = -10
end type

type gb_2 from w_inheritance`gb_2 within w_oidoewol_r
integer width = 4480
integer height = 156
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oidoewol_r
integer x = 3694
integer y = 16
integer width = 814
integer taborder = 40
integer textsize = -10
end type

type dw_2 from w_inheritance`dw_2 within w_oidoewol_r
integer x = 1175
integer y = 8
integer width = 87
integer height = 68
integer taborder = 60
string dataobject = "d_oidoewol_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type rb_1 from radiobutton within w_oidoewol_r
integer x = 1472
integer y = 64
integer width = 242
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
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_oidoewol_r
integer x = 1719
integer y = 64
integer width = 247
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
string text = "제품"
end type

type rb_3 from radiobutton within w_oidoewol_r
integer x = 1472
integer y = 140
integer width = 247
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
string text = "상품"
end type

type rb_4 from radiobutton within w_oidoewol_r
integer x = 1719
integer y = 140
integer width = 315
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
string text = "원재료"
end type

type st_2 from statictext within w_oidoewol_r
integer x = 2030
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

type dw_area from datawindow within w_oidoewol_r
integer x = 2030
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

type em_1 from editmask within w_oidoewol_r
integer x = 2789
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
id_date1 = date(this.text)

end event

type em_2 from editmask within w_oidoewol_r
integer x = 3246
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
id_date2 = date(this.text)

end event

type pb_1 from picturebutton within w_oidoewol_r
event mousemove pbm_mousemove
integer x = 4105
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

if rb_5.checked = true then			// 집계
	dwxls = dw_1
elseif rb_6.checked = true then		// 거래처
	dwxls = dw_4
end if

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

type st_1 from statictext within w_oidoewol_r
integer x = 2555
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

type st_3 from statictext within w_oidoewol_r
integer x = 3200
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

type dw_3 from datawindow within w_oidoewol_r
integer x = 2789
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

type st_4 from statictext within w_oidoewol_r
integer x = 2555
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

type dw_4 from datawindow within w_oidoewol_r
integer x = 270
integer y = 672
integer width = 4165
integer height = 1132
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidoewol_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_5 from datawindow within w_oidoewol_r
integer x = 1275
integer y = 8
integer width = 87
integer height = 68
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidoewol_r1"
boolean livescroll = true
end type

type st_5 from statictext within w_oidoewol_r
integer x = 2455
integer y = 272
integer width = 613
integer height = 96
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현황과 원본, 월분석은 단수차이 발생."
boolean focusrectangle = false
end type

type st_6 from statictext within w_oidoewol_r
integer x = 73
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

type ddlb_fld from dropdownlistbox within w_oidoewol_r
integer x = 261
integer y = 276
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

type ddlb_dwtitles from dropdownlistbox within w_oidoewol_r
integer x = 302
integer y = 288
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

type st_7 from statictext within w_oidoewol_r
integer x = 759
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

type sle_value from singlelineedit within w_oidoewol_r
integer x = 1248
integer y = 284
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

type cb_1 from commandbutton within w_oidoewol_r
integer x = 1778
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidoewol_r
integer x = 1943
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidoewol_r
integer x = 2107
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidoewol_r
integer x = 2272
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type rb_5 from radiobutton within w_oidoewol_r
integer x = 3154
integer y = 292
integer width = 242
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
string text = "집계"
boolean checked = true
end type

event clicked;// 집계표
if this.checked = true then
	dw_1.visible = true
	dw_4.visible = false
else
	dw_1.visible = false
	dw_4.visible = false
end if

pb_retrieve.postevent( clicked! )

end event

type rb_6 from radiobutton within w_oidoewol_r
integer x = 3406
integer y = 292
integer width = 311
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
string text = "거래처"
end type

event clicked;// 거래처계
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = true
else
	dw_1.visible = false
	dw_4.visible = false
end if

pb_retrieve.postevent( clicked! )

end event

type ddlb_op from dropdownlistbox within w_oidoewol_r
integer x = 933
integer y = 276
integer width = 302
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

