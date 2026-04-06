$PBExportHeader$w_mpwcq_r.srw
$PBExportComments$작업장별 생산계획조회(1998/05/05, 이인호)
forward 
global type w_mpwcq_r from w_inheritance
end type
type dw_3 from datawindow within w_mpwcq_r
end type
type em_1 from editmask within w_mpwcq_r
end type
type em_2 from editmask within w_mpwcq_r
end type
type st_1 from statictext within w_mpwcq_r
end type
type st_3 from statictext within w_mpwcq_r
end type
type dw_area from datawindow within w_mpwcq_r
end type
type pb_1 from picturebutton within w_mpwcq_r
end type
type st_2 from statictext within w_mpwcq_r
end type
type cbx_1 from checkbox within w_mpwcq_r
end type
type dw_4 from datawindow within w_mpwcq_r
end type
type cbx_2 from checkbox within w_mpwcq_r
end type
type dw_5 from datawindow within w_mpwcq_r
end type
type st_4 from statictext within w_mpwcq_r
end type
type ddlb_fld from dropdownlistbox within w_mpwcq_r
end type
type st_5 from statictext within w_mpwcq_r
end type
type ddlb_op from dropdownlistbox within w_mpwcq_r
end type
type sle_value from singlelineedit within w_mpwcq_r
end type
type cb_1 from commandbutton within w_mpwcq_r
end type
type cb_2 from commandbutton within w_mpwcq_r
end type
type cb_3 from commandbutton within w_mpwcq_r
end type
type cb_5 from commandbutton within w_mpwcq_r
end type
type gb_15 from groupbox within w_mpwcq_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpwcq_r
end type
type cbx_3 from checkbox within w_mpwcq_r
end type
end forward

global type w_mpwcq_r from w_inheritance
integer x = 5
integer y = 72
integer width = 4407
integer height = 2336
string title = "생산계획 조회(작업장별)(w_mpwcq_r)"
dw_3 dw_3
em_1 em_1
em_2 em_2
st_1 st_1
st_3 st_3
dw_area dw_area
pb_1 pb_1
st_2 st_2
cbx_1 cbx_1
dw_4 dw_4
cbx_2 cbx_2
dw_5 dw_5
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_15 gb_15
ddlb_dwtitles ddlb_dwtitles
cbx_3 cbx_3
end type
global w_mpwcq_r w_mpwcq_r

type variables
st_print i_print
string is_wc, is_dw
datawindowchild idwc_wc
end variables

on w_mpwcq_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_3=create st_3
this.dw_area=create dw_area
this.pb_1=create pb_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.dw_4=create dw_4
this.cbx_2=create cbx_2
this.dw_5=create dw_5
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_15=create gb_15
this.ddlb_dwtitles=create ddlb_dwtitles
this.cbx_3=create cbx_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.dw_4
this.Control[iCurrent+11]=this.cbx_2
this.Control[iCurrent+12]=this.dw_5
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.st_5
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_3
this.Control[iCurrent+21]=this.cb_5
this.Control[iCurrent+22]=this.gb_15
this.Control[iCurrent+23]=this.ddlb_dwtitles
this.Control[iCurrent+24]=this.cbx_3
end on

on w_mpwcq_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.dw_4)
destroy(this.cbx_2)
destroy(this.dw_5)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_15)
destroy(this.ddlb_dwtitles)
destroy(this.cbx_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_1.visible = false
dw_4.visible = false
dw_5.visible = false

cbx_1.enabled = false
cbx_2.enabled = false

dw_3.sharedata(dw_1)

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

is_dw = "dw_3"

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

// 작업장
dw_2.insertrow(0)
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

em_1.setfocus()

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_3.width  = newwidth  - 68
dw_3.height = newheight - 432

dw_4.x = dw_3.x ; dw_4.y = dw_3.y 
dw_4.width  = dw_3.width
dw_4.height = dw_3.height

dw_5.x = dw_3.x ; dw_5.y = dw_3.y 
dw_5.width  = dw_3.width
dw_5.height = dw_3.height

end event

type pb_save from w_inheritance`pb_save within w_mpwcq_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpwcq_r
integer x = 46
integer y = 172
integer width = 82
integer height = 64
string dataobject = "d_mpplansale_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::rowfocuschanged;//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then
//	return
//end if
//
//is_wcno = dw_1.object.wc_no[ll_row]
//dw_2.retrieve(is_wcno)
//tab_1.tabpage_1.dw_3.retrieve(is_wcno,id_start,id_end)
//
end event

type st_title from w_inheritance`st_title within w_mpwcq_r
integer x = 41
integer y = 20
integer width = 1463
integer height = 132
string text = "생산계획 조회(작업장별)"
end type

type st_tips from w_inheritance`st_tips within w_mpwcq_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpwcq_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpwcq_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpwcq_r
integer x = 3822
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpwcq_r
integer x = 3630
integer y = 56
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpwcq_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpwcq_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpwcq_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpwcq_r
integer x = 3237
integer y = 56
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate, ls_date,  ls_area, ls_wcname, ls_work, ls_flag
date   ld_date1, ld_date2
long   ll_row

dw_2.accepttext()
dw_area.accepttext()

ls_area = dw_area.object.area[1]

ls_sdate = trim(em_1.text)
ls_edate = trim(em_2.text)

ld_date1 = date(ls_sdate)
ld_date2 = date(ls_edate)

ls_wcname = trim(is_wc) + "%"  //작업장명
ls_flag   = "Y"

//if left(ls_wcname, 4) = "도장" OR left(ls_wcname, 4) = "절곡" then
//	dw_3.dataobject = "d_mpwcq_t2"
//else
//	dw_3.dataobject = "d_mpwcq_t1"
//end if
//dw_3.SetTransObject(SQLCA)

ll_row = dw_1.retrieve(ls_wcname, ld_date1, ld_date2, ls_flag, ls_area)
ll_row = dw_3.retrieve(ls_wcname, ld_date1, ld_date2, ls_flag, ls_area)
if cbx_1.checked = true then		// 절곡반
	ll_row = dw_4.retrieve( ls_sdate, ls_edate )
end if

if cbx_2.checked = true then		// 절곡반 집계
	ll_row = dw_5.retrieve( ls_sdate, ls_edate )
end if

if ll_row < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpwcq_r
integer x = 37
integer y = 232
integer width = 4302
integer height = 184
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpwcq_r
integer x = 2450
integer y = 8
integer width = 731
integer height = 220
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpwcq_r
integer x = 3205
integer y = 8
integer width = 837
integer height = 220
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpwcq_r
integer x = 1801
integer y = 132
integer width = 608
integer height = 76
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;//
this.accepttext()

is_wc = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if LeftA(is_wc,4) = "절곡" then
	cbx_1.enabled = true
	cbx_2.enabled = true
else
	cbx_1.enabled = false
	cbx_2.enabled = false
end if

if is_wc = "전체" then is_wc = ""


end event

type dw_3 from datawindow within w_mpwcq_r
integer x = 37
integer y = 432
integer width = 4302
integer height = 1772
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_mpwcq_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
CHOOSE CASE gs_print_control
	CASE 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
	CASE 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
END CHOOSE

end event

event clicked;//
is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_1 from editmask within w_mpwcq_r
integer x = 2784
integer y = 48
integer width = 366
integer height = 76
integer taborder = 100
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
string displaydata = ""
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_mpwcq_r
integer x = 2784
integer y = 128
integer width = 366
integer height = 76
integer taborder = 110
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
string displaydata = "~b"
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_1 from statictext within w_mpwcq_r
integer x = 1573
integer y = 132
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpwcq_r
integer x = 2478
integer y = 48
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpwcq_r
integer x = 1806
integer y = 48
integer width = 526
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area

this.accepttext()

ls_area = this.object.area[1]

idwc_wc.setfilter( "area_no = '" + ls_area + "'" )
idwc_wc.filter()

end event

type pb_1 from picturebutton within w_mpwcq_r
event mousemove pbm_mousemove
integer x = 3433
integer y = 56
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

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_3.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	                        ls_Docname, ls_Named, "XLS",  &
	                        "엑셀 (*.XLS), *.XLS," + &
                           "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_3.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dw_3.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type st_2 from statictext within w_mpwcq_r
integer x = 1573
integer y = 48
integer width = 229
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_mpwcq_r
integer x = 82
integer y = 280
integer width = 274
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "절곡반"
end type

event clicked;// 절곡반
cbx_2.checked = false

if this.checked = true then
	dw_4.visible = true
	dw_3.visible = false
	dw_5.visible = false
else
	dw_3.visible = true
	dw_4.visible = false
	dw_5.visible = false
end if

end event

type dw_4 from datawindow within w_mpwcq_r
string tag = "d_mproutday"
integer x = 805
integer y = 724
integer width = 2994
integer height = 1068
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_routbdet_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cbx_2 from checkbox within w_mpwcq_r
integer x = 82
integer y = 344
integer width = 402
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "절곡반 집계"
end type

event clicked;// 절곡반 집계
cbx_1.checked = false

if this.checked = true then
	dw_5.visible = true
	dw_3.visible = false
	dw_4.visible = false
else
	dw_3.visible = true
	dw_4.visible = false
	dw_5.visible = false
end if

end event

type dw_5 from datawindow within w_mpwcq_r
integer x = 1179
integer y = 944
integer width = 2386
integer height = 648
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_routbdet_sum"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_4 from statictext within w_mpwcq_r
integer x = 526
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_mpwcq_r
integer x = 713
integer y = 296
integer width = 443
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

type st_5 from statictext within w_mpwcq_r
integer x = 1198
integer y = 312
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

type ddlb_op from dropdownlistbox within w_mpwcq_r
integer x = 1367
integer y = 292
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

type sle_value from singlelineedit within w_mpwcq_r
integer x = 1687
integer y = 296
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

type cb_1 from commandbutton within w_mpwcq_r
integer x = 2258
integer y = 296
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("학인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpwcq_r
integer x = 2423
integer y = 296
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("학인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpwcq_r
integer x = 2587
integer y = 296
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("학인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpwcq_r
integer x = 2752
integer y = 296
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("학인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_15 from groupbox within w_mpwcq_r
integer x = 1545
integer y = 8
integer width = 882
integer height = 220
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_mpwcq_r
integer x = 754
integer y = 304
integer width = 311
integer height = 88
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

type cbx_3 from checkbox within w_mpwcq_r
integer x = 2953
integer y = 308
integer width = 421
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "비오염 제외"
end type

event clicked;//
string ls_itemnm

if this.checked = true then
	cb_1.enabled = false
	cb_2.enabled = false
	ls_itemnm = "groupitem_item_name <> 'SELF-CLEANING COATING' "
else
	cb_1.enabled = true
	cb_2.enabled = true
	ls_itemnm = ""
end if

//
datawindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose

dw_1.setfilter( ls_itemnm )
dw_1.filter()
dw_1.groupcalc()

arg_dw.setfilter( ls_itemnm )
arg_dw.filter()
arg_dw.groupcalc()

end event

