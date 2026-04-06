$PBExportHeader$w_mpproc1106_r.srw
$PBExportComments$수주별 생산계획 조회(1998/05/21,곽용덕)
forward
global type w_mpproc1106_r from w_inheritance
end type
type st_1 from statictext within w_mpproc1106_r
end type
type em_1 from editmask within w_mpproc1106_r
end type
type em_2 from editmask within w_mpproc1106_r
end type
type tab_1 from tab within w_mpproc1106_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
end type
type tab_1 from tab within w_mpproc1106_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type st_cust from statictext within w_mpproc1106_r
end type
type em_3 from editmask within w_mpproc1106_r
end type
type st_3 from statictext within w_mpproc1106_r
end type
type st_2 from statictext within w_mpproc1106_r
end type
type ddlb_fld from dropdownlistbox within w_mpproc1106_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpproc1106_r
end type
type st_5 from statictext within w_mpproc1106_r
end type
type ddlb_op from dropdownlistbox within w_mpproc1106_r
end type
type sle_value from singlelineedit within w_mpproc1106_r
end type
type cb_5 from commandbutton within w_mpproc1106_r
end type
type cb_6 from commandbutton within w_mpproc1106_r
end type
type cb_7 from commandbutton within w_mpproc1106_r
end type
type cb_8 from commandbutton within w_mpproc1106_r
end type
type dw_5 from datawindow within w_mpproc1106_r
end type
type st_vertical from u_splitbar_vertical within w_mpproc1106_r
end type
type st_horizontal from u_splitbar_horizontal within w_mpproc1106_r
end type
end forward

global type w_mpproc1106_r from w_inheritance
integer x = 23
integer y = 172
integer width = 4219
integer height = 2240
string title = "생산계획 조회(수주별)(w_mpproc1106_r)"
st_1 st_1
em_1 em_1
em_2 em_2
tab_1 tab_1
st_cust st_cust
em_3 em_3
st_3 st_3
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
dw_5 dw_5
st_vertical st_vertical
st_horizontal st_horizontal
end type
global w_mpproc1106_r w_mpproc1106_r

type variables
//
int    ii_sort = 0
date   id_start, id_end
string is_dw, is_order, is_cust_no
datawindowchild idwc_cust

end variables

on w_mpproc1106_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.tab_1=create tab_1
this.st_cust=create st_cust
this.em_3=create em_3
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.dw_5=create dw_5
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.st_cust
this.Control[iCurrent+6]=this.em_3
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.cb_6
this.Control[iCurrent+16]=this.cb_7
this.Control[iCurrent+17]=this.cb_8
this.Control[iCurrent+18]=this.dw_5
this.Control[iCurrent+19]=this.st_vertical
this.Control[iCurrent+20]=this.st_horizontal
end on

on w_mpproc1106_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.tab_1)
destroy(this.st_cust)
destroy(this.em_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.dw_5)
destroy(this.st_vertical)
destroy(this.st_horizontal)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_5)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_5)
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(tab_1)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_5.insertrow(0)
dw_5.enabled = false

// 거래처 
dw_1.SetTransObject(SQLCA)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

idwc_cust.retrieve( "%" )
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체거래처")
idwc_cust.accepttext()
dw_1.object.cust_no[1] = "%"

//
em_1.text = string(today(),'yyyy/mm/01')
em_2.text = string(today(),'yyyy/mm/dd')

// 수주번호
em_3.text    = 'HD' + string(today(),'yyyymm')
em_3.setfocus()

end event

event resize;call super::resize;//
long  ll_width, ll_height

gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_5.x + dw_5.width
st_vertical.height = dw_5.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x

st_horizontal.y      = dw_5.y + dw_5.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

tab_1.y      = st_horizontal.y + st_horizontal.height
tab_1.width  = newwidth  - (gb_3.x * 2)
tab_1.height = newheight - tab_1.y - gb_3.x

tab_1.tabpage_1.dw_3.width  = tab_1.width  - 64
tab_1.tabpage_1.dw_3.height = tab_1.height - 152

tab_1.tabpage_2.dw_4.width  = tab_1.width  - 64
tab_1.tabpage_2.dw_4.height = tab_1.height - 152

end event

type pb_save from w_inheritance`pb_save within w_mpproc1106_r
boolean visible = false
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_mpproc1106_r
integer x = 2249
integer y = 136
integer width = 613
integer height = 84
string dataobject = "d_oiscenecust_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//
dw_2.reset()

this.accepttext()

is_cust_no = this.object.cust_no[1]
pb_retrieve.triggerevent( clicked! )

end event

type st_title from w_inheritance`st_title within w_mpproc1106_r
integer x = 32
integer y = 20
integer width = 1326
integer height = 136
string text = "생산계획 조회(수주별)"
end type

type st_tips from w_inheritance`st_tips within w_mpproc1106_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpproc1106_r
boolean visible = false
integer x = 1998
integer y = 76
integer taborder = 180
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;//
end event

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
long ll_row, ll_rowcount

is_order = trim(em_3.text)

dw_5.retrieve(is_order)

if dw_5.rowcount() > 0 then
	tab_1.tabpage_2.dw_4.retrieve( is_order )
	ll_row = tab_1.tabpage_1.dw_3.retrieve( is_order )
	if ll_row < 1 then
		MessageBox("확인","생산계획 자료가 없습니다.")
		RETURN
	end if
else
	tab_1.tabpage_2.dw_4.reset()
	tab_1.tabpage_1.dw_3.reset()
end if

this.default = false
em_3.setfocus()

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpproc1106_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpproc1106_r
integer x = 3301
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;CLOSE(PARENT)
end event

type pb_print from w_inheritance`pb_print within w_mpproc1106_r
boolean visible = false
integer taborder = 250
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpproc1106_r
boolean visible = false
integer taborder = 260
end type

type pb_delete from w_inheritance`pb_delete within w_mpproc1106_r
boolean visible = false
integer taborder = 280
end type

type pb_insert from w_inheritance`pb_insert within w_mpproc1106_r
boolean visible = false
integer taborder = 290
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpproc1106_r
integer x = 3109
integer y = 64
integer taborder = 70
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

debugbreak()

string ls_orderno, ls_custno, ls_sdate, ls_edate
long   ll_row, ll_find, ll_rowcount

//
dw_1.accepttext()
ls_custno  = dw_1.object.cust_no[1]

//
ls_sdate   = trim(em_1.text)
ls_edate   = trim(em_2.text)

//
ls_orderno = trim(em_3.text)
if LenA(ls_orderno) < 14 then
	ls_orderno = ls_orderno + "%"
end if

//
dw_2.retrieve( ls_sdate, ls_edate, ls_custno, ls_orderno )	// 수주번호

if LenA(ls_orderno) = 14 then
	ll_find    = dw_2.find( "order_no = '" + ls_orderno + "'", 1, dw_2.rowcount() )
	if ll_find > 0 then 
		dw_2.scrolltorow( ll_find )
	end if
end if

//
tab_1.tabpage_1.dw_3.reset()		// 생산현황
tab_1.tabpage_2.dw_4.reset()		// 수주현황

dw_5.retrieve( ls_orderno )		// 수주헤더
if dw_5.rowcount() > 0 then
	ll_row = tab_1.tabpage_2.dw_4.retrieve( ls_orderno )	// 수주현황
	ll_row = tab_1.tabpage_1.dw_3.retrieve( ls_orderno )	// 생산현황
	if ll_row < 1 then
		//MessageBox("확인","생산계획 자료가 없습니다.")
	end if
else
	dw_5.insertrow(0)
end if
MessageBox("확인","조회완료")


end event

type gb_3 from w_inheritance`gb_3 within w_mpproc1106_r
integer x = 32
integer y = 244
integer width = 4087
integer height = 184
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpproc1106_r
integer x = 1413
integer y = 16
integer width = 1632
integer height = 216
integer taborder = 160
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpproc1106_r
integer x = 3067
integer y = 16
integer width = 457
integer height = 216
integer taborder = 80
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpproc1106_r
integer x = 2944
integer y = 452
integer width = 1175
integer height = 628
integer taborder = 90
string dataobject = "d_mpsaleproc_s"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


string ls_orderno

ls_orderno = this.object.order_no[row]

dw_5.retrieve( ls_orderno )

end event

type st_1 from statictext within w_mpproc1106_r
integer x = 1934
integer y = 56
integer width = 311
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
string text = "수주일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpproc1106_r
integer x = 2249
integer y = 56
integer width = 375
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_start = date(this.text)

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
id_start = date(this.text)

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if
//
end event

type em_2 from editmask within w_mpproc1106_r
integer x = 2633
integer y = 56
integer width = 375
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)

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
id_end = date(this.text)

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if
//
end event

type tab_1 from tab within w_mpproc1106_r
event create ( )
event destroy ( )
integer x = 32
integer y = 1136
integer width = 4087
integer height = 948
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4050
integer height = 820
long backcolor = 79741120
string text = "생산진행현황"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Library!"
long picturemaskcolor = 553648127
dw_3 dw_3
end type

on tabpage_1.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_1.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_1
integer width = 4050
integer height = 820
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_mpproc1106_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
long   ll_row, ll_found
string ls_item, ls_itemname, ls_qa


CHOOSE CASE dwo.name
	CASE 'groupitem_item_name', 'routtempnew_assy_qa'

	open(w_mpjaegoc_r)

	ll_row = this.getrow()
	if ll_row < 1 then return
	
	ls_item     = trim(this.object.routtempnew_assy_item[ll_row])
	ls_itemname = trim(this.object.groupitem_item_name[ll_row])
	ls_qa       = trim(this.object.routtempnew_assy_qa[ll_row])
	
	w_mpjaegoc_r.dw_1.object.item_no[1]   = ls_item
	w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
	w_mpjaegoc_r.dw_2.retrieve(ls_item)
	ll_found = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
	if ll_found > 0 then
		w_mpjaegoc_r.dw_2.scrolltorow(ll_found)
	end if
END CHOOSE


end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 OR row > this.rowcount() then
	this.selectrow( 0, false )
else
	this.selectrow( 0, false )
	this.selectrow( row, true )
end if

end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4050
integer height = 820
long backcolor = 79741120
string text = "수주현황"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_2.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_2.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_2
integer width = 4050
integer height = 820
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_mpproc1106_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_row,ll_found
string ls_item,ls_itemname,ls_qa


CHOOSE CASE dwo.name
	CASE 'item_no', 'qa', 'groupitem_item_name'

	open(w_mpjaegoc_r)

	ll_row = this.getrow()
	if ll_row < 1 then return
	ls_item = trim(this.object.item_no[ll_row])
	ls_itemname = trim(this.object.groupitem_item_name[ll_row])
	ls_qa   = trim(this.object.qa[ll_row])
	//dw_2.reset()
	//dw_3.reset()
	w_mpjaegoc_r.dw_1.object.item_no[1] = ls_item
	w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
	w_mpjaegoc_r.dw_2.retrieve(ls_item)
	ll_found = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
	if ll_found > 0 then
		w_mpjaegoc_r.dw_2.scrolltorow(ll_found)
	end if
END CHOOSE


end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_cust from statictext within w_mpproc1106_r
integer x = 1934
integer y = 136
integer width = 311
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_3 from editmask within w_mpproc1106_r
integer x = 1440
integer y = 136
integer width = 480
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
end type

event modified;//
pb_retrieve.triggerevent( clicked! )

end event

event getfocus;//
this.SelectText( 7, LenA(this.text) )

end event

type st_3 from statictext within w_mpproc1106_r
integer x = 1440
integer y = 56
integer width = 480
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
string text = "수주번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpproc1106_r
integer x = 91
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_mpproc1106_r
integer x = 279
integer y = 304
integer width = 480
integer height = 632
integer taborder = 220
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

type ddlb_dwtitles from dropdownlistbox within w_mpproc1106_r
integer x = 334
integer y = 320
integer width = 311
integer height = 88
integer taborder = 270
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

type st_5 from statictext within w_mpproc1106_r
integer x = 795
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

type ddlb_op from dropdownlistbox within w_mpproc1106_r
integer x = 965
integer y = 304
integer width = 297
integer height = 512
integer taborder = 240
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

type sle_value from singlelineedit within w_mpproc1106_r
integer x = 1285
integer y = 312
integer width = 567
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_5 from commandbutton within w_mpproc1106_r
integer x = 1865
integer y = 312
integer width = 160
integer height = 76
integer taborder = 190
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = tab_1.tabpage_1.dw_3
	case "dw_4"
		arg_dw  = tab_1.tabpage_2.dw_4
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_6 from commandbutton within w_mpproc1106_r
integer x = 2030
integer y = 312
integer width = 160
integer height = 76
integer taborder = 200
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = tab_1.tabpage_1.dw_3
	case "dw_4"
		arg_dw  = tab_1.tabpage_2.dw_4
end choose
GF_DW2UnFilter( arg_dw )

end event

type cb_7 from commandbutton within w_mpproc1106_r
integer x = 2194
integer y = 312
integer width = 160
integer height = 76
integer taborder = 210
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = tab_1.tabpage_1.dw_3
	case "dw_4"
		arg_dw  = tab_1.tabpage_2.dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_8 from commandbutton within w_mpproc1106_r
integer x = 2359
integer y = 312
integer width = 160
integer height = 76
integer taborder = 230
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = tab_1.tabpage_1.dw_3
	case "dw_4"
		arg_dw  = tab_1.tabpage_2.dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_mpproc1106_r
integer x = 32
integer y = 452
integer width = 2853
integer height = 628
integer taborder = 130
string dataobject = "d_mpsaleq_t"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;////
//is_dw = "dw_5"
//GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
end event

type st_vertical from u_splitbar_vertical within w_mpproc1106_r
integer x = 2903
integer y = 452
integer height = 628
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_mpproc1106_r
integer x = 32
integer y = 1096
integer width = 4087
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_5.height

end event

