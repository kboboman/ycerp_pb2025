$PBExportHeader$w_mpproc1106_r.srw
$PBExportComments$수주별 생산계획 조회(1998/05/21,곽용덕)
forward
global type w_mpproc1106_r from w_inheritance
end type
type st_1 from statictext within w_mpproc1106_r
end type
type cb_1 from commandbutton within w_mpproc1106_r
end type
type cb_2 from commandbutton within w_mpproc1106_r
end type
type cb_3 from commandbutton within w_mpproc1106_r
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
type st_33 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
st_33 st_33
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
type cb_4 from commandbutton within w_mpproc1106_r
end type
type em_3 from editmask within w_mpproc1106_r
end type
type dw_5 from datawindow within w_mpproc1106_r
end type
type st_4 from statictext within w_mpproc1106_r
end type
type st_2 from statictext within w_mpproc1106_r
end type
end forward

global type w_mpproc1106_r from w_inheritance
integer x = 23
integer y = 172
integer width = 4645
integer height = 2620
string title = "수주별 생산계획 조회(w_mpproc1106_r)"
boolean resizable = false
st_1 st_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
em_1 em_1
em_2 em_2
tab_1 tab_1
st_cust st_cust
cb_4 cb_4
em_3 em_3
dw_5 dw_5
st_4 st_4
st_2 st_2
end type
global w_mpproc1106_r w_mpproc1106_r

type variables
int ii_sort = 0
date id_start, id_end
string is_order, is_cust_no

end variables

on w_mpproc1106_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.em_1=create em_1
this.em_2=create em_2
this.tab_1=create tab_1
this.st_cust=create st_cust
this.cb_4=create cb_4
this.em_3=create em_3
this.dw_5=create dw_5
this.st_4=create st_4
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.st_cust
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.em_3
this.Control[iCurrent+11]=this.dw_5
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_2
end on

on w_mpproc1106_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.tab_1)
destroy(this.st_cust)
destroy(this.cb_4)
destroy(this.em_3)
destroy(this.dw_5)
destroy(this.st_4)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_5.visible = false
dw_5.enabled = false

dw_1.insertrow(0)  //춘 19
em_1.text = string(today(),'yyyy/mm/dd')
id_start  = today()
em_2.text = string(today(),'yyyy/mm/dd')
id_end    = today()

st_4.visible = false
tab_1.tabpage_1.st_33.visible = false
em_3.text = 'HD' + string(today(),'yyyy')

end event

event resize;call super::resize;//
dw_5.x  = dw_2.x
dw_5.y  = dw_2.y
dw_5.width  = dw_2.width
dw_5.height = dw_2.height

tab_1.width  = newwidth  - 91
tab_1.height = newheight - 1196

tab_1.tabpage_1.dw_3.width  = tab_1.width  - 78
tab_1.tabpage_1.dw_3.height = tab_1.height - 160

tab_1.tabpage_2.dw_4.width  = tab_1.width  - 78
tab_1.tabpage_2.dw_4.height = tab_1.height - 160


end event

type pb_save from w_inheritance`pb_save within w_mpproc1106_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpproc1106_r
integer x = 3113
integer y = 136
integer width = 864
integer height = 88
integer taborder = 170
string dataobject = "d_oiscenecust_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;
dw_2.reset()
this.accepttext()
is_cust_no = this.object.cust_no[1]

end event

type dw_2 from w_inheritance`dw_2 within w_mpproc1106_r
integer x = 37
integer y = 412
integer width = 4544
integer height = 720
integer taborder = 40
string dataobject = "d_mpsaleproc_s"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rowfocuschanged;string ls_sale,ls_order,ls_plan,ls_temp
long ll_rowcount,i, ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row < 1 then 
   st_4.visible = true
	return
end if

is_order = trim(this.object.order_no[ll_row])
cb_4.triggerevent(clicked!)
end event

type st_title from w_inheritance`st_title within w_mpproc1106_r
integer x = 46
integer y = 40
integer width = 1422
integer height = 128
string text = "수주별 생산계획 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpproc1106_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpproc1106_r
integer x = 2574
integer y = 64
integer taborder = 140
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;//
end event

event pb_compute::clicked;long ll_rowcount

dw_2.visible = false
dw_5.visible = true

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
is_order = trim(em_3.text)
IF dw_5.retrieve(is_order) > 0 THEN
	tab_1.tabpage_2.dw_4.retrieve(is_order)
	tab_1.tabpage_1.dw_3.setredraw(false)
	ll_rowcount = tab_1.tabpage_1.dw_3.retrieve(is_order)
	IF ll_rowcount < 1 then
		tab_1.tabpage_1.st_33.visible = true
		tab_1.tabpage_1.dw_3.setredraw(true)
		return
	end if
	tab_1.tabpage_1.st_33.visible = false
	tab_1.tabpage_1.dw_3.setredraw(true)
ELSE
	TAB_1.TABPAGE_2.DW_4.RESET()
	TAB_1.TABPAGE_1.DW_3.RESET()
END IF
THIS.DEFAULT = false
em_3.setfocus()

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpproc1106_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpproc1106_r
integer x = 4320
integer y = 64
integer taborder = 180
end type

event pb_close::clicked;CLOSE(PARENT)
end event

type pb_print from w_inheritance`pb_print within w_mpproc1106_r
boolean visible = false
integer taborder = 190
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpproc1106_r
boolean visible = false
integer taborder = 200
end type

type pb_delete from w_inheritance`pb_delete within w_mpproc1106_r
boolean visible = false
integer taborder = 210
end type

type pb_insert from w_inheritance`pb_insert within w_mpproc1106_r
boolean visible = false
integer taborder = 230
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpproc1106_r
integer x = 4128
integer y = 64
integer taborder = 220
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_cust

dw_2.visible = true
dw_5.visible = false

ls_cust = trim(is_cust_no) + "%"
st_4.visible = false
dw_2.retrieve(id_start, id_end, ls_cust)

end event

type gb_3 from w_inheritance`gb_3 within w_mpproc1106_r
integer x = 37
integer y = 240
integer width = 4544
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 400
long textcolor = 16711680
string text = "정렬"
borderstyle borderstyle = StyleLowered!
end type

type gb_2 from w_inheritance`gb_2 within w_mpproc1106_r
integer x = 2002
integer y = 16
integer width = 2016
integer height = 220
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
borderstyle borderstyle = StyleLowered!
end type

type gb_1 from w_inheritance`gb_1 within w_mpproc1106_r
integer x = 4055
integer y = 16
integer width = 526
integer height = 220
integer weight = 400
end type

type st_1 from statictext within w_mpproc1106_r
integer x = 2811
integer y = 56
integer width = 302
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "수주일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_mpproc1106_r
integer x = 69
integer y = 284
integer width = 306
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주번호"
end type

event clicked;if ii_sort = 0 then
	ii_sort = 1
	dw_2.setsort("order_no A")
	dw_2.sort()
else
	ii_sort = 0
	dw_2.setsort("order_no D")
	dw_2.sort()
end if
end event

type cb_2 from commandbutton within w_mpproc1106_r
integer x = 379
integer y = 284
integer width = 306
integer height = 88
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처"
end type

event clicked;if ii_sort = 0 then
	ii_sort = 1
	dw_2.setsort("customer_cust_name A, order_no A")
	dw_2.sort()
else
	ii_sort = 0
	dw_2.setsort("customer_cust_name D, order_no A")
	dw_2.sort()
end if
end event

type cb_3 from commandbutton within w_mpproc1106_r
integer x = 686
integer y = 284
integer width = 306
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "현장"
end type

event clicked;if ii_sort = 0 then
	ii_sort = 1
	dw_2.setsort("scene_scene_desc A, order_no A")
	dw_2.sort()
else
	ii_sort = 0
	dw_2.setsort("scene_scene_desc D, order_no A")
	dw_2.sort()
end if
end event

type em_1 from editmask within w_mpproc1106_r
integer x = 3113
integer y = 56
integer width = 398
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_start = date(this.text)
end if

end event

type em_2 from editmask within w_mpproc1106_r
integer x = 3575
integer y = 56
integer width = 398
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_end = date(this.text)
end if

end event

type tab_1 from tab within w_mpproc1106_r
event create ( )
event destroy ( )
integer x = 37
integer y = 1160
integer width = 4544
integer height = 1344
integer taborder = 60
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
integer width = 4507
integer height = 1216
long backcolor = 79741120
string text = "생산진행현황"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Library!"
long picturemaskcolor = 553648127
dw_3 dw_3
st_33 st_33
end type

on tabpage_1.create
this.dw_3=create dw_3
this.st_33=create st_33
this.Control[]={this.dw_3,&
this.st_33}
end on

on tabpage_1.destroy
destroy(this.dw_3)
destroy(this.st_33)
end on

type dw_3 from datawindow within tabpage_1
integer x = 18
integer y = 20
integer width = 4466
integer height = 1356
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_mpproc1106_r"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_row,ll_found
string ls_item,ls_itemname,ls_qa


CHOOSE CASE dwo.name
	CASE 'groupitem_item_name', 'routtempnew_assy_qa'

	open(w_mpjaegoc_r)

	ll_row = this.getrow()
	if ll_row < 1 then return
	ls_item = trim(this.object.routtempnew_assy_item[ll_row])
	ls_itemname = trim(this.object.groupitem_item_name[ll_row])
	ls_qa   = trim(this.object.routtempnew_assy_qa[ll_row])
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

type st_33 from statictext within tabpage_1
integer x = 1280
integer y = 552
integer width = 2094
integer height = 220
boolean bringtotop = true
integer textsize = -20
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "생산계획 자료가 없습니다"
alignment alignment = center!
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4507
integer height = 1216
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
integer x = 18
integer y = 16
integer width = 4466
integer height = 1184
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_mpproc1106_r2"
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

type st_cust from statictext within w_mpproc1106_r
integer x = 2811
integer y = 140
integer width = 302
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_mpproc1106_r
integer x = 1189
integer y = 1172
integer width = 352
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재조회"
end type

event clicked;long ll_rowcount

tab_1.tabpage_2.dw_4.retrieve(is_order)
tab_1.tabpage_1.dw_3.setredraw(false)
ll_rowcount = tab_1.tabpage_1.dw_3.retrieve(is_order)
IF ll_rowcount < 1 then
   tab_1.tabpage_1.st_33.visible = true
	tab_1.tabpage_1.dw_3.setredraw(true)
	return
end if
tab_1.tabpage_1.st_33.visible = false
tab_1.tabpage_1.dw_3.setredraw(true)

end event

type em_3 from editmask within w_mpproc1106_r
integer x = 2043
integer y = 140
integer width = 480
integer height = 76
integer taborder = 130
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

event modified;is_order = trim(em_3.text)
pb_compute.DEFAULT = true

end event

type dw_5 from datawindow within w_mpproc1106_r
integer x = 174
integer y = 576
integer width = 2734
integer height = 492
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpsaleq_t"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_mpproc1106_r
integer x = 571
integer y = 716
integer width = 1851
integer height = 112
boolean bringtotop = true
integer textsize = -20
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "수주 자료가 없습니다"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpproc1106_r
integer x = 2043
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
long textcolor = 16711680
long backcolor = 79741120
string text = "수주번호조회"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

