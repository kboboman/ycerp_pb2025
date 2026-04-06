$PBExportHeader$w_whitemlocqohmulti_w3.srw
$PBExportComments$담당자별품목관리품목선택윈도우(2009/06/17)
forward
global type w_whitemlocqohmulti_w3 from window
end type
type cb_23 from commandbutton within w_whitemlocqohmulti_w3
end type
type tab_1 from tab within w_whitemlocqohmulti_w3
end type
type tabpage_1 from userobject within tab_1
end type
type sle_paint from singlelineedit within tabpage_1
end type
type rb_9 from radiobutton within tabpage_1
end type
type rb_8 from radiobutton within tabpage_1
end type
type dw_2 from datawindow within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type rb_3 from radiobutton within tabpage_1
end type
type rb_2 from radiobutton within tabpage_1
end type
type rb_1 from radiobutton within tabpage_1
end type
type rb_0 from radiobutton within tabpage_1
end type
type em_1 from editmask within tabpage_1
end type
type em_2 from editmask within tabpage_1
end type
type em_3 from editmask within tabpage_1
end type
type em_4 from editmask within tabpage_1
end type
type cb_ins from commandbutton within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type st_7 from statictext within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type st_10 from statictext within tabpage_1
end type
type st_11 from statictext within tabpage_1
end type
type cbx_4 from checkbox within tabpage_1
end type
type rb_code from radiobutton within tabpage_1
end type
type rb_name from radiobutton within tabpage_1
end type
type st_12 from statictext within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_10 from commandbutton within tabpage_1
end type
type cb_11 from commandbutton within tabpage_1
end type
type cb_12 from commandbutton within tabpage_1
end type
type cb_13 from commandbutton within tabpage_1
end type
type cb_14 from commandbutton within tabpage_1
end type
type cb_15 from commandbutton within tabpage_1
end type
type cb_16 from commandbutton within tabpage_1
end type
type cb_17 from commandbutton within tabpage_1
end type
type cb_18 from commandbutton within tabpage_1
end type
type cb_19 from commandbutton within tabpage_1
end type
type cb_20 from commandbutton within tabpage_1
end type
type cb_21 from commandbutton within tabpage_1
end type
type cb_22 from commandbutton within tabpage_1
end type
type rb_7 from radiobutton within tabpage_1
end type
type rb_6 from radiobutton within tabpage_1
end type
type rb_5 from radiobutton within tabpage_1
end type
type rb_4 from radiobutton within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type gb_3 from groupbox within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
sle_paint sle_paint
rb_9 rb_9
rb_8 rb_8
dw_2 dw_2
dw_3 dw_3
cb_3 cb_3
cb_4 cb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
rb_0 rb_0
em_1 em_1
em_2 em_2
em_3 em_3
em_4 em_4
cb_ins cb_ins
st_5 st_5
st_6 st_6
st_7 st_7
cbx_1 cbx_1
st_10 st_10
st_11 st_11
cbx_4 cbx_4
rb_code rb_code
rb_name rb_name
st_12 st_12
cb_5 cb_5
cb_7 cb_7
cb_10 cb_10
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
dw_4 dw_4
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type
type tab_1 from tab within w_whitemlocqohmulti_w3
tabpage_1 tabpage_1
end type
type cb_9 from commandbutton within w_whitemlocqohmulti_w3
end type
type cbx_2 from checkbox within w_whitemlocqohmulti_w3
end type
type cb_8 from commandbutton within w_whitemlocqohmulti_w3
end type
type cb_6 from commandbutton within w_whitemlocqohmulti_w3
end type
type cb_2 from commandbutton within w_whitemlocqohmulti_w3
end type
type cb_1 from commandbutton within w_whitemlocqohmulti_w3
end type
type dw_1 from datawindow within w_whitemlocqohmulti_w3
end type
type gb_4 from groupbox within w_whitemlocqohmulti_w3
end type
type dw_loc from datawindow within w_whitemlocqohmulti_w3
end type
end forward

global type w_whitemlocqohmulti_w3 from window
integer x = 727
integer y = 136
integer width = 3465
integer height = 2040
boolean titlebar = true
string title = "저장소별품목선택(w_whitemlocqohmulti_w3)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_23 cb_23
tab_1 tab_1
cb_9 cb_9
cbx_2 cbx_2
cb_8 cb_8
cb_6 cb_6
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_4 gb_4
dw_loc dw_loc
end type
global w_whitemlocqohmulti_w3 w_whitemlocqohmulti_w3

type variables
gs_where2 istr_where
string is_where, is_loc
int ii_sw = 1
datawindow dw2,dw3,dw4,dw5,dw6
end variables

forward prototypes
public subroutine wf_filter (string as_word, string as_first, string as_second)
public subroutine wf_filitem (string as_item)
public subroutine wf_filter1 (string as_flag)
end prototypes

public subroutine wf_filter (string as_word, string as_first, string as_second);string  ls_result
dw2.setredraw(false)

ls_result = "mid(item_name,1,2) = '" + as_word + "'or (mid(item_name,1,2) >= '" + as_first + "' and mid(item_name,1,2) < '" + as_second + "')"

dw2.SelectRow(0,  false)
dw2.setfilter(ls_result)
dw2.filter()
dw2.setredraw(true)
dw2.sort()

string ls_item
if dw2.getrow() < 1 then return
ls_item = dw2.object.item_no[dw2.getrow()]
dw3.setredraw(false)
dw3.reset()
dw3.retrieve(is_loc, ls_item )
dw3.setredraw(true)
tab_1.tabpage_1.rb_code.checked = true
dw4.object.cust_no[1] = ''

end subroutine

public subroutine wf_filitem (string as_item);tab_1.tabpage_1.rb_code.checked = true
tab_1.tabpage_1.rb_code.triggerevent(clicked!)
dw4.object.cust_no[1] = as_item
tab_1.tabpage_1.cb_4.postevent(clicked!)


end subroutine

public subroutine wf_filter1 (string as_flag);
dw4.object.cust_no[1] = ''
if as_flag = '' then
	dw2.setfilter("")
else
	dw2.setfilter(" source = '" + as_flag + "' ")
end if
dw2.Filter( )

if dw2.rowcount() > 1 then
		dw2.ScrollToRow(1)
end if

end subroutine

on w_whitemlocqohmulti_w3.create
this.cb_23=create cb_23
this.tab_1=create tab_1
this.cb_9=create cb_9
this.cbx_2=create cbx_2
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_4=create gb_4
this.dw_loc=create dw_loc
this.Control[]={this.cb_23,&
this.tab_1,&
this.cb_9,&
this.cbx_2,&
this.cb_8,&
this.cb_6,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_4,&
this.dw_loc}
end on

on w_whitemlocqohmulti_w3.destroy
destroy(this.cb_23)
destroy(this.tab_1)
destroy(this.cb_9)
destroy(this.cbx_2)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_4)
destroy(this.dw_loc)
end on

event open;long ll_found
dw2 = tab_1.tabpage_1.dw_2
dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_1.dw_4
//dw5 = tab_1.tabpage_2.dw_5
//dw6 = tab_1.tabpage_2.dw_6
dw2.settransobject(sqlca)					 /*2018/03/13 조원석 추가 */
dw3.settransobject(sqlca)
//dw5.SetTransObject(SQLCA)
//dw6.SetTransObject(SQLCA)
//dw6.insertrow(1)
//dw6.visible = false
//dw6.object.user_id[1] =  gs_userid
istr_where = Message.PowerObjectParm
//gs_ds_ITEMall.sharedata(dw2)               /*2018/03/13 조원석 주석처리 */

if istr_where.chk = 'S' then
	dw_1.enabled = false
	cbx_2.enabled = false
	cb_6.enabled = false
	cb_8.enabled = false
	cb_9.enabled = false
end if
is_loc = istr_where.chk1
if isnull(is_loc) or trim(is_loc) = '' then
	select def_loc into :is_loc from area
	 where area_no = :gs_area;
end if
dw_loc.settransobject(sqlca)
dw_loc.insertrow(1)
dw_loc.object.loc_no[1] = is_loc

dw2.retrieve() 					 /*2018/03/13 조원석 추가 */

dw4.insertrow(1)

if UpperBound(istr_where.str1) > 0 then
	if not isnull(istr_where.str1[1]) and trim(istr_where.str1[1]) <> '' then
		dw2.setsort('item_no A')
		dw2.sort()
		tab_1.tabpage_1.rb_code.checked = true
		tab_1.tabpage_1.rb_name.checked = false
		dw4.object.cust_no[1] = istr_where.str1[1]
		tab_1.tabpage_1.cb_4.triggerevent(clicked!)
		dw2.SelectRow(1,  true)
		if isnull(istr_where.str2[1]) or trim(istr_where.str2[1]) = '' then
		else
			ll_found = dw3.Find("qa = '" + istr_where.str2[1] + "'", 1, dw3.RowCount())
			if ll_found > 0 then
				dw3.scrolltorow(ll_found)
				dw3.SelectRow(ll_found, true)
			end if
		end if
	else
		dw2.setsort('item_name A')
		dw2.sort()
		dw2.SelectRow(1,  true)
	end if
else
	dw2.setsort('item_name A')
	dw2.sort()
	dw2.SelectRow(1,  true)
end if
	
end event

event closequery;dw2.setfilter("")
dw2.Filter( )

end event

type cb_23 from commandbutton within w_whitemlocqohmulti_w3
integer x = 3022
integer y = 1392
integer width = 416
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼ 규격전체"
end type

event clicked;dw3.SelectRow(0, true)
cb_6.postevent(clicked!)
end event

type tab_1 from tab within w_whitemlocqohmulti_w3
event create ( )
event destroy ( )
integer x = 27
integer y = 12
integer width = 3410
integer height = 1300
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

event selectionchanged;//if newindex = 2 and tabpage_2.rb_sale.checked = true then
//	tabpage_2.em_5.SelectText(9, 2)
//	tabpage_2.em_5.setfocus()
//end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3374
integer height = 1184
long backcolor = 79741120
string text = "품목검색"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
sle_paint sle_paint
rb_9 rb_9
rb_8 rb_8
dw_2 dw_2
dw_3 dw_3
cb_3 cb_3
cb_4 cb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
rb_0 rb_0
em_1 em_1
em_2 em_2
em_3 em_3
em_4 em_4
cb_ins cb_ins
st_5 st_5
st_6 st_6
st_7 st_7
cbx_1 cbx_1
st_10 st_10
st_11 st_11
cbx_4 cbx_4
rb_code rb_code
rb_name rb_name
st_12 st_12
cb_5 cb_5
cb_7 cb_7
cb_10 cb_10
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
dw_4 dw_4
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type

on tabpage_1.create
this.sle_paint=create sle_paint
this.rb_9=create rb_9
this.rb_8=create rb_8
this.dw_2=create dw_2
this.dw_3=create dw_3
this.cb_3=create cb_3
this.cb_4=create cb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.rb_0=create rb_0
this.em_1=create em_1
this.em_2=create em_2
this.em_3=create em_3
this.em_4=create em_4
this.cb_ins=create cb_ins
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.cbx_1=create cbx_1
this.st_10=create st_10
this.st_11=create st_11
this.cbx_4=create cbx_4
this.rb_code=create rb_code
this.rb_name=create rb_name
this.st_12=create st_12
this.cb_5=create cb_5
this.cb_7=create cb_7
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_13=create cb_13
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.cb_17=create cb_17
this.cb_18=create cb_18
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.dw_4=create dw_4
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.sle_paint,&
this.rb_9,&
this.rb_8,&
this.dw_2,&
this.dw_3,&
this.cb_3,&
this.cb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.rb_0,&
this.em_1,&
this.em_2,&
this.em_3,&
this.em_4,&
this.cb_ins,&
this.st_5,&
this.st_6,&
this.st_7,&
this.cbx_1,&
this.st_10,&
this.st_11,&
this.cbx_4,&
this.rb_code,&
this.rb_name,&
this.st_12,&
this.cb_5,&
this.cb_7,&
this.cb_10,&
this.cb_11,&
this.cb_12,&
this.cb_13,&
this.cb_14,&
this.cb_15,&
this.cb_16,&
this.cb_17,&
this.cb_18,&
this.cb_19,&
this.cb_20,&
this.cb_21,&
this.cb_22,&
this.rb_7,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.dw_4,&
this.gb_1,&
this.gb_3,&
this.gb_2}
end on

on tabpage_1.destroy
destroy(this.sle_paint)
destroy(this.rb_9)
destroy(this.rb_8)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.rb_0)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.cb_ins)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.cbx_1)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.cbx_4)
destroy(this.rb_code)
destroy(this.rb_name)
destroy(this.st_12)
destroy(this.cb_5)
destroy(this.cb_7)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.cb_17)
destroy(this.cb_18)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.dw_4)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
end on

type sle_paint from singlelineedit within tabpage_1
boolean visible = false
integer x = 2327
integer y = 164
integer width = 795
integer height = 80
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_9 from radiobutton within tabpage_1
integer x = 2203
integer y = 1108
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M3A2"
end type

event clicked;wf_filitem(this.text)
end event

type rb_8 from radiobutton within tabpage_1
integer x = 1970
integer y = 1108
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M1A2"
end type

event clicked;wf_filitem(this.text)
end event

type dw_2 from datawindow within tabpage_1
integer y = 260
integer width = 1952
integer height = 828
integer taborder = 200
string title = "none"
string dataobject = "d_whitemname_all"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)


end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
this.setredraw( false)
string ls_item

dw_3.setredraw(false)
dw_3.reset()
ls_item = this.object.item_no[ll_row]
dw_3.retrieve(is_loc, ls_item )
dw_3.setredraw(true)
this.SelectRow(0,  false)
this.SelectRow(ll_row,  true)
this.setredraw( true)
end event

type dw_3 from datawindow within tabpage_1
event mousemove pbm_dwnmousemove
integer x = 1957
integer y = 344
integer width = 1417
integer height = 744
integer taborder = 200
string title = "none"
string dataobject = "d_whitemalllocqoh_c"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event clicked;if row < 1 then return
this.SelectRow(0, false)
this.SelectRow(row,  NOT this.IsSelected(row))
this.scrolltorow(row)
cb_6.postevent(clicked!)

end event

event doubleclicked;if row < 1 then return
this.scrolltorow(row)
if istr_where.chk = 'M' then
else
	cb_1.postevent(clicked!)
end if

end event

event rbuttondown;//int li_int
//string ls_item, ls_qa, ls_area
//date ld_date, ld_date_from
//
//if row < 1 then return
//this.scrolltorow(row)
////if dw_area.object.area[1] = 'H0001' then
////	ls_area = 'S0001'
////else
////	ls_area = dw_area.object.area[1]
////end if
//m_manager NewMenu
//
//NewMenu = CREATE m_manager
//gs_print_control = ""
//li_int = m_manager.m_itemret.PopMenu(w_whitemlocqohmulti_w.parentwindow().PointerX(),  w_whitemlocqohmulti_w.parentwindow().PointerY())
//
//ld_date = date(gdt_today) //date(em_1.text)
////w_frame.PointerX(), w_frame.PointerY())
//ld_date_from = RelativeDate(ld_date, -61)
////ld_date_from = date(ld_date_from)
//ls_item = trim(dw2.object.item_no[dw2.getrow()])
//ls_qa   = trim(this.object.qa[row])
////CHOOSE CASE gs_print_control
////	CASE 'sale'
////		open(w_whsale_w)
////		w_whsale_w.em_1.text = string(ld_date_from, 'yyyy/mm/dd')
////		w_whsale_w.em_2.text = em_1.text
////		w_whsale_w.st_item.text = ls_item
////		w_whsale_w.st_name.text = this.object.groupitem_item_name[row]
////		w_whsale_w.st_qa.text = ls_qa
////		w_whsale_w.is_loc = is_loc
////		w_whsale_w.is_area = ls_area
////		w_whsale_w.is_FLAG = 'SALE'
////		w_whsale_w.cb_1.postevent(clicked!)
////END CHOOSE
////
end event

type cb_3 from commandbutton within tabpage_1
integer x = 14
integer y = 32
integer width = 361
integer height = 92
integer taborder = 170
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재검색"
end type

event clicked;dw_4.object.cust_no[1] = ""
dw_2.SetFilter("")
dw_2.Filter( )
dw_1.SetFilter("")
dw_1.Filter( )

end event

type cb_4 from commandbutton within tabpage_1
integer x = 1783
integer y = 160
integer width = 270
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_filter, ls_name

dw_4.accepttext()
ls_name = trim(UPPER(dw_4.object.cust_no[1]))

IF ISNULL(ls_name) OR ls_name = "" THEN 
	is_where = ""
ELSE
	if rb_code.checked = true then
		ls_filter = ls_name + '%'
		is_where = "item_no like '" + ls_filter + "'"
	else
		ls_filter = '%' + ls_name + '%'
		is_where = "item_name like '" + ls_filter + "'"
	end if
END IF
dw_2.SetFilter(is_where)
dw_2.Filter( )

dw_3.reset()
if dw_2.getrow() < 1 then return
ls_name = dw_2.object.item_no[dw_2.getrow()]
dw_3.setredraw(false)
dw_3.retrieve(is_loc, ls_name )
dw_3.setredraw(true)

end event

type rb_3 from radiobutton within tabpage_1
integer x = 791
integer y = 1108
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "구매품"
end type

event clicked;wf_filter1('B')

end event

type rb_2 from radiobutton within tabpage_1
integer x = 512
integer y = 1108
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "반제품"
end type

event clicked;wf_filter1('M')

end event

type rb_1 from radiobutton within tabpage_1
integer x = 233
integer y = 1108
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완제품"
end type

event clicked;wf_filter1('W')

end event

type rb_0 from radiobutton within tabpage_1
integer x = 14
integer y = 1108
integer width = 219
integer height = 64
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

event clicked;wf_filter1('')

end event

type em_1 from editmask within tabpage_1
boolean visible = false
integer x = 2327
integer y = 164
integer width = 128
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "000"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
boolean autoskip = true
end type

type em_2 from editmask within tabpage_1
boolean visible = false
integer x = 2510
integer y = 164
integer width = 155
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0000"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
boolean autoskip = true
end type

type em_3 from editmask within tabpage_1
boolean visible = false
integer x = 2720
integer y = 164
integer width = 155
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0000"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
boolean autoskip = true
end type

type em_4 from editmask within tabpage_1
boolean visible = false
integer x = 2930
integer y = 164
integer width = 187
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "00000"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
boolean autoskip = true
end type

type cb_ins from commandbutton within tabpage_1
boolean visible = false
integer x = 2885
integer y = 156
integer width = 448
integer height = 88
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "규격전체추가"
end type

event clicked;//if tab_1.SelectedTab = 1 then

	dw3.SelectRow(0, true)
//elseif tab_1.SelectedTab = 2 then
//	dw5.SelectRow(0,  this.checked)
//end if
cb_6.postevent(clicked!)
end event

type st_5 from statictext within tabpage_1
boolean visible = false
integer x = 2459
integer y = 168
integer width = 46
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_1
boolean visible = false
integer x = 2670
integer y = 168
integer width = 46
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_1
boolean visible = false
integer x = 2880
integer y = 168
integer width = 46
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within tabpage_1
boolean visible = false
integer x = 1979
integer y = 172
integer width = 347
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "규격추가"
end type

event clicked;if dw_3.rowcount() < 1 then return
em_1.text = MidA(dw_3.object.qa[dw_3.getrow()], 1,3)
em_2.text = MidA(dw_3.object.qa[dw_3.getrow()], 5,4)
em_3.text = MidA(dw_3.object.qa[dw_3.getrow()], 10,4)
em_4.text = MidA(dw_3.object.qa[dw_3.getrow()], 15,5)
cb_ins.enabled = this.checked
end event

type st_10 from statictext within tabpage_1
integer x = 1961
integer y = 268
integer width = 649
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "규격"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_11 from statictext within tabpage_1
integer x = 2619
integer y = 268
integer width = 645
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "현재고"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cbx_4 from checkbox within tabpage_1
boolean visible = false
integer x = 2551
integer y = 1112
integer width = 805
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "현재고가 0 이 아닌것만"
end type

event clicked;if this.checked = true then
	dw_3.setfilter('qoh > 0')
else
	dw_3.setfilter('')
end if
dw_3.filter()
end event

type rb_code from radiobutton within tabpage_1
integer x = 425
integer y = 176
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "물품코드"
end type

event clicked;string ls_sort

dw_2.setredraw(false)
IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_no A"
else
	ii_sw = 0
	ls_sort = "item_no D"
end if
dw_2.SetSort(ls_sort)
dw_2.Sort( )
dw_2.scrolltorow(1)
dw_2.SelectRow(0,  false)
dw_2.SelectRow(1,  true)
dw_2.setredraw(true)

end event

type rb_name from radiobutton within tabpage_1
integer x = 206
integer y = 176
integer width = 219
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품명"
boolean checked = true
end type

event clicked;string ls_sort

dw_2.setredraw(false)
IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_name A "
else
	ii_sw = 0
	ls_sort = "item_name D "
end if
dw_2.SetSort(ls_sort)
dw_2.Sort( )
dw_2.scrolltorow(1)
dw_2.SelectRow(0,  false)
dw_2.SelectRow(1,  true)
dw_2.setredraw(true)

end event

type st_12 from statictext within tabpage_1
integer x = 27
integer y = 176
integer width = 178
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "정렬:"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within tabpage_1
integer x = 425
integer y = 36
integer width = 110
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄱ"
end type

event clicked;wf_filter('ㄱ','가','나')

end event

type cb_7 from commandbutton within tabpage_1
integer x = 539
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄴ"
end type

event clicked;wf_filter('ㄴ','나','다')
end event

type cb_10 from commandbutton within tabpage_1
integer x = 663
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄷ"
end type

event clicked;wf_filter('ㄷ','다','라')
end event

type cb_11 from commandbutton within tabpage_1
integer x = 786
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄹ"
end type

event clicked;wf_filter('ㄹ','라','마')
end event

type cb_12 from commandbutton within tabpage_1
integer x = 910
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅁ"
end type

event clicked;wf_filter('ㅁ','마','바')
end event

type cb_13 from commandbutton within tabpage_1
integer x = 1033
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅂ"
end type

event clicked;wf_filter('ㅂ','바','사')

end event

type cb_14 from commandbutton within tabpage_1
integer x = 1157
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅅ"
end type

event clicked;wf_filter('ㅅ','사','아')
end event

type cb_15 from commandbutton within tabpage_1
integer x = 1280
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅇ"
end type

event clicked;wf_filter('ㅇ','아','자')
end event

type cb_16 from commandbutton within tabpage_1
integer x = 1403
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅈ"
end type

event clicked;wf_filter('ㅈ','자','차')
end event

type cb_17 from commandbutton within tabpage_1
integer x = 1527
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅊ"
end type

event clicked;wf_filter('ㅊ','자', '카')
end event

type cb_18 from commandbutton within tabpage_1
integer x = 1650
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅋ"
end type

event clicked;wf_filter('ㅋ','카', '타')
end event

type cb_19 from commandbutton within tabpage_1
integer x = 1774
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅌ"
end type

event clicked;wf_filter('ㅌ','타','파')
end event

type cb_20 from commandbutton within tabpage_1
integer x = 1897
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅍ"
end type

event clicked;wf_filter('ㅍ','파','하')
end event

type cb_21 from commandbutton within tabpage_1
integer x = 2021
integer y = 36
integer width = 119
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅎ"
end type

event clicked;wf_filter('ㅎ','하','힣')
end event

type cb_22 from commandbutton within tabpage_1
integer x = 2144
integer y = 36
integer width = 178
integer height = 88
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ABC.."
end type

event clicked;m_dynamic lm_Addmenu
string ls_item
int li_int

lm_Addmenu = CREATE m_dynamic
li_int = 0

DECLARE c_item CURSOR FOR  
  SELECT Distinct substring(item_no,1,2) 
    FROM groupitem 
   WHERE substring(item_no,1,1)  <> 'E'
   ORDER BY substring(item_no,1,2);

open c_item;
FETCH c_item INTO :ls_item;
DO WHILE sqlca.sqlcode = 0
	li_int = li_int + 1
	lm_Addmenu.item[li_int].Text = ls_item
	lm_Addmenu.item[li_int].Tag = string(li_int)
	lm_Addmenu.item[li_int].visible = true
	FETCH c_item INTO :ls_item;
LOOP
close c_item;

lm_Addmenu.PopMenu(parent.PointerX(), parent. PointerY())
if lm_Addmenu.tag = "" then return

ls_item = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
if isnumber(ls_item) then
else
	wf_filitem(ls_item)
end if

end event

type rb_7 from radiobutton within tabpage_1
integer x = 1746
integer y = 1108
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M3A1"
end type

event clicked;wf_filitem(this.text)
end event

type rb_6 from radiobutton within tabpage_1
integer x = 1522
integer y = 1108
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M1A1"
end type

event clicked;wf_filitem(this.text)
end event

type rb_5 from radiobutton within tabpage_1
integer x = 1294
integer y = 1108
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M3S1"
end type

event clicked;wf_filitem(this.text)
end event

type rb_4 from radiobutton within tabpage_1
integer x = 1070
integer y = 1108
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M1S1"
end type

event clicked;wf_filitem(this.text)
end event

type dw_4 from datawindow within tabpage_1
integer x = 773
integer y = 160
integer width = 1088
integer height = 88
integer taborder = 170
string title = "none"
string dataobject = "d_whitemcode_s2"
boolean border = false
boolean livescroll = true
end type

event editchanged;long ll_found

dw_2.setredraw(false)
if rb_code.checked = true then
	if ii_sw = 0 then
		ii_sw = 1
		dw_2.SetSort("item_no A ")
		dw_2.Sort( )
	end if
	ll_found = dw_2.Find("item_no > '" + data + "'", 1, dw_2.RowCount())
else
	if ii_sw = 0 then
		ii_sw = 1
		dw_2.SetSort("item_name A ")
		dw_2.Sort( )
	end if
	ll_found = dw_2.Find("item_name > '" + data + "'", 1, dw_2.RowCount())
end if
dw_2.scrolltorow(ll_found)
dw_2.setredraw(true)

end event

event getfocus;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
this.SelectText(ll_row, LenA(this.GetText()))
end event

type gb_1 from groupbox within tabpage_1
integer x = 5
integer y = 1076
integer width = 3369
integer height = 104
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within tabpage_1
integer x = 393
integer width = 2976
integer height = 136
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within tabpage_1
integer x = 5
integer y = 124
integer width = 3365
integer height = 136
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_9 from commandbutton within w_whitemlocqohmulti_w3
integer x = 3022
integer y = 1608
integer width = 416
integer height = 80
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "◀ CLEAR"
end type

event clicked;DW_1.RESET()
end event

type cbx_2 from checkbox within w_whitemlocqohmulti_w3
boolean visible = false
integer x = 3049
integer y = 1340
integer width = 343
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;//if tab_1.SelectedTab = 1 then
	dw3.SelectRow(0,  this.checked)
//elseif tab_1.SelectedTab = 2 then
//	dw5.SelectRow(0,  this.checked)
//end if
cb_6.postevent(clicked!)
end event

type cb_8 from commandbutton within w_whitemlocqohmulti_w3
integer x = 3022
integer y = 1500
integer width = 416
integer height = 80
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲ 삭제"
end type

event clicked;long  ll_row
dw_1.AcceptText()
ll_row  =  dw_1.GetRow()
dw_1.deleterow(ll_row)
end event

type cb_6 from commandbutton within w_whitemlocqohmulti_w3
boolean visible = false
integer x = 3040
integer y = 1448
integer width = 379
integer height = 80
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼ 추가"
end type

event clicked;long ll_row, ll_cnt, ll_dw1row, ll_dw1rowcount, ll_dw2row
string ls_exist, ls_use, ls_item, ls_qa

DW_1.SETREDRAW(FALSE)
dw_1.accepttext()
dw3.accepttext()
if istr_where.chk = 'M' then
else
	dw_1.reset()
end if
ll_dw1rowcount = dw_1.rowcount()

if tab_1.SelectedTab = 1 then
	ll_dw2row = dw2.getrow()
	for ll_row = dw3.GetSelectedRow(0) to dw3.rowcount()
		if dw3.IsSelected(ll_row) = true then
			ls_exist = 'N'
			for ll_dw1row = 1 to ll_dw1rowcount
				if dw2.object.item_no[ll_dw2row] = dw_1.object.item_no[ll_dw1row] and &
					dw3.object.qa[ll_row] = dw_1.object.qa[ll_dw1row] then
					ls_exist = 'Y'
					exit
				end if
			next
			if ls_exist = 'Y' then continue
			ls_item = dw2.object.item_no[ll_dw2row]
			ls_qa = dw3.object.qa[ll_row]
			SETNULL(ls_use)
			select use_flag into :ls_use from item
			 where item_no = :ls_item
				and qa = :ls_qa;
			if ls_use = 'C' then
				messagebox("확인", "선택하신품목은 사용불가인 품목입니다 ~r~n" + &
										 "물품RELOAD 를 하신후에 다시 작업하여 주시기바랍니다")
				dw3.SelectRow(0, false)
				cbx_2.checked = false
				dw_1.scrolltorow(ll_cnt)
				DW_1.SETREDRAW(TRUE)
				RETURN
			end if
	
			ll_cnt = dw_1.insertrow(0)
			dw_1.object.item_no[ll_cnt] = ls_item
			dw_1.object.qa[ll_cnt] = ls_qa
			dw_1.object.uom[ll_cnt] = dw2.object.uom[ll_dw2row]
			dw_1.object.source[ll_cnt] = dw2.object.source[ll_dw2row]
			dw_1.object.loc_no[ll_cnt] = is_loc
			dw_1.object.item_name[ll_cnt] = dw2.object.item_name[ll_dw2row]
			dw_1.object.qoh[ll_cnt] = dw3.object.qoh[ll_row]
		end if
	next
	dw3.SelectRow(0, false)
//else
//	for ll_row = 1 to dw5.rowcount()
//		if dw5.IsSelected(ll_row) = true then
//			ls_exist = 'N'
//			for ll_dw1row = 1 to ll_dw1rowcount
//				if dw5.object.item_no[ll_row] = dw_1.object.item_no[ll_dw1row] and &
//					dw5.object.qa[ll_row] = dw_1.object.qa[ll_dw1row] then
//					ls_exist = 'Y'
//					exit
//				end if
//			next
//			if ls_exist = 'Y' then continue
//			ls_item = dw5.object.item_no[ll_row]
//			ls_qa = dw5.object.qa[ll_row]
//			SETNULL(ls_use)
//			select use_flag into :ls_use from item
//			 where item_no = :ls_item
//				and qa = :ls_qa;
//			if ls_use = 'C' then
//				messagebox("확인", "선택하신품목은 사용불가인 품목입니다 ~r~n" + &
//										 "물품RELOAD 를 하신후에 다시 작업하여 주시기바랍니다")
//				dw5.SelectRow(0, false)
//				cbx_2.checked = false
//				RETURN
//			end if
//	
//			ll_cnt = dw_1.insertrow(0)
//			dw_1.object.item_no[ll_cnt] = ls_item
//			dw_1.object.qa[ll_cnt] = ls_qa
//			dw_1.object.uom[ll_cnt] = dw5.object.uom[ll_row]
//			dw_1.object.loc_no[ll_cnt] = is_loc
//			dw_1.object.item_name[ll_cnt] = dw5.object.item_name[ll_row]
//			dw_1.object.qoh[ll_cnt] = dw5.object.qoh[ll_row]
//
//			if tab_1.tabpage_2.rb_sale.checked = true then
//				dw_1.object.sale_no[ll_cnt] = dw5.object.order_no[ll_row]
//				dw_1.object.cust_name[ll_cnt] = dw5.object.cust_name[ll_row]
//				dw_1.object.order_qty[ll_cnt] = dw5.object.order_qty[ll_row]
//				dw_1.object.price[ll_cnt] = dw5.object.price[ll_row]
//			end if
//		end if
//	next
//	dw5.SelectRow(0, false)
end if
cbx_2.checked = false
dw_1.scrolltorow(ll_cnt)
DW_1.SETREDRAW(TRUE)

end event

type cb_2 from commandbutton within w_whitemlocqohmulti_w3
integer x = 3022
integer y = 1824
integer width = 416
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type cb_1 from commandbutton within w_whitemlocqohmulti_w3
integer x = 3022
integer y = 1716
integer width = 416
integer height = 80
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;long ll_row, ll_cnt

ll_cnt = 0
dw_1.accepttext()
for ll_row = 1 to dw_1.rowcount()
	ll_cnt = ll_cnt + 1
	istr_where.str1[ll_cnt] = dw_1.object.item_no[ll_row]
	istr_where.str2[ll_cnt] = dw_1.object.qa[ll_row]
	istr_where.str3[ll_cnt] = dw_1.object.uom[ll_row]
	istr_where.qty1[ll_cnt] = dw_1.object.qoh[ll_row]
	istr_where.name[ll_cnt] = dw_1.object.item_name[ll_row]

next
if ll_cnt = 0 then return
istr_where.chk = "Y"
CloseWithReturn(parent, istr_where)
end event

type dw_1 from datawindow within w_whitemlocqohmulti_w3
integer x = 32
integer y = 1316
integer width = 2976
integer height = 616
integer taborder = 20
string dataobject = "d_whitemlocqohmulti_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(row,  true)

end event

event doubleclicked;//dw_1.deleterow(row)
end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()

if ll_row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(ll_row,  true)

end event

type gb_4 from groupbox within w_whitemlocqohmulti_w3
boolean visible = false
integer x = 3017
integer y = 1300
integer width = 425
integer height = 212
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_loc from datawindow within w_whitemlocqohmulti_w3
integer x = 2583
integer y = 4
integer width = 846
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//this.accepttext()
////tab_1.tabpage_2.cb_ret.postevent(clicked!)
////
end event

event losefocus;this.accepttext()

end event

