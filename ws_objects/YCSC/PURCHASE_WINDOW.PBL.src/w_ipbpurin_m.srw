$PBExportHeader$w_ipbpurin_m.srw
$PBExportComments$조업자재 구매일보((1999/06/07,이인호)
forward
global type w_ipbpurin_m from w_inheritance
end type
type em_1 from editmask within w_ipbpurin_m
end type
type cb_1 from commandbutton within w_ipbpurin_m
end type
type cb_2 from commandbutton within w_ipbpurin_m
end type
type st_1 from statictext within w_ipbpurin_m
end type
type cb_3 from commandbutton within w_ipbpurin_m
end type
type tab_1 from tab within w_ipbpurin_m
end type
type tabpage_1 from userobject within tab_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type em_2 from editmask within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cbx_1 cbx_1
st_2 st_2
st_3 st_3
em_2 em_2
st_4 st_4
cb_4 cb_4
st_5 st_5
cb_5 cb_5
end type
type tab_1 from tab within w_ipbpurin_m
tabpage_1 tabpage_1
end type
type em_3 from editmask within w_ipbpurin_m
end type
type dw_3 from datawindow within w_ipbpurin_m
end type
type st_6 from statictext within w_ipbpurin_m
end type
type cbx_2 from checkbox within w_ipbpurin_m
end type
type dw_area from datawindow within w_ipbpurin_m
end type
type st_7 from statictext within w_ipbpurin_m
end type
type dw_4 from datawindow within w_ipbpurin_m
end type
type cbx_cust from checkbox within w_ipbpurin_m
end type
type dw_5 from datawindow within w_ipbpurin_m
end type
type cbx_3 from checkbox within w_ipbpurin_m
end type
type gb_15 from groupbox within w_ipbpurin_m
end type
end forward

global type w_ipbpurin_m from w_inheritance
integer x = 23
integer y = 36
integer width = 4704
integer height = 2388
string title = "조업자재 구매일보(w_ipbpurin_m)"
em_1 em_1
cb_1 cb_1
cb_2 cb_2
st_1 st_1
cb_3 cb_3
tab_1 tab_1
em_3 em_3
dw_3 dw_3
st_6 st_6
cbx_2 cbx_2
dw_area dw_area
st_7 st_7
dw_4 dw_4
cbx_cust cbx_cust
dw_5 dw_5
cbx_3 cbx_3
gb_15 gb_15
end type
global w_ipbpurin_m w_ipbpurin_m

type variables
int ii_sw = 0, ii_sw2 = 0
datawindowchild idwc_area, idwc_bsupp, idwc_bitem
string is_filter
end variables

forward prototypes
public subroutine wf_print (date arg_date)
end prototypes

public subroutine wf_print (date arg_date);long ll_row, ll_cnt
string ls_class, ls_rem, ls_code, ls_name

ll_row = dw_1.rowcount()

dw_2.reset()
for ll_cnt = 1 to ll_row
	dw_2.object.item_class[ll_cnt] = "조 업 자 재"
	dw_2.object.in_date[ll_cnt] = arg_date
	dw_2.object.cust_name[ll_cnt] = dw_1.object.bsupp_supp_name[ll_cnt]
	dw_2.object.group_name[ll_cnt] = ""
	dw_2.object.item_name[ll_cnt] = dw_1.object.bitem_item_name[ll_cnt]
//	dw_2.object.seq[ll_cnt] = dw_1.object.[ll_cnt]
	dw_2.object.qa[ll_cnt] = dw_1.object.qa[ll_cnt]
	dw_2.object.ea[ll_cnt] = dw_1.object.uom[ll_cnt]
	dw_2.object.qty[ll_cnt] = dw_1.object.qty[ll_cnt]
	dw_2.object.cost[ll_cnt] = dw_1.object.cost[ll_cnt]
	dw_2.object.amount[ll_cnt] = dw_1.object.amount[ll_cnt]
	ls_code = dw_1.object.part_code[ll_cnt]
	setnull(ls_name)
   select part_name into :ls_name from bpart where part_no = :ls_code;
	dw_2.object.dept[ll_cnt] = ls_name
//	dw_2.object.acct_desc[ll_cnt] = dw_1.object.[ll_cnt]
	ls_rem = trim(dw_1.object.rem[ll_cnt])
	if ls_rem = '' or isnull(ls_rem) then
		ls_rem = ''
	else
		ls_rem = '※' + ls_rem
	end if
	dw_2.object.rem[ll_cnt] = ls_rem
next
end subroutine

on w_ipbpurin_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_3=create cb_3
this.tab_1=create tab_1
this.em_3=create em_3
this.dw_3=create dw_3
this.st_6=create st_6
this.cbx_2=create cbx_2
this.dw_area=create dw_area
this.st_7=create st_7
this.dw_4=create dw_4
this.cbx_cust=create cbx_cust
this.dw_5=create dw_5
this.cbx_3=create cbx_3
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.tab_1
this.Control[iCurrent+7]=this.em_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.cbx_2
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.dw_4
this.Control[iCurrent+14]=this.cbx_cust
this.Control[iCurrent+15]=this.dw_5
this.Control[iCurrent+16]=this.cbx_3
this.Control[iCurrent+17]=this.gb_15
end on

on w_ipbpurin_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.tab_1)
destroy(this.em_3)
destroy(this.dw_3)
destroy(this.st_6)
destroy(this.cbx_2)
destroy(this.dw_area)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.cbx_cust)
destroy(this.dw_5)
destroy(this.cbx_3)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

em_1.text = string(today(), "yyyy/mm/01")
em_3.text = string(today(), "yyyy/mm/dd")

dw_2.visible  = false
dw_4.visible  = false
dw_5.visible  = false
tab_1.visible = false

// 전체거래처
dw_3.getchild("bsupp_no", idwc_bsupp)
idwc_bsupp.settransobject(sqlca)
idwc_bsupp.retrieve()
idwc_bsupp.insertrow(1)
idwc_bsupp.setitem(1, "supp_no", "%")
idwc_bsupp.setitem(1, "supp_name", "전체")

// 전체품목
dw_3.getchild("bitem_no", idwc_bitem)
idwc_bitem.settransobject(sqlca)
idwc_bitem.retrieve()
idwc_bitem.insertrow(1)
idwc_bitem.setitem(1, "item_no", 0)
idwc_bitem.setitem(1, "item_name", "전체")
dw_3.insertrow(0)

dw_1.settransobject(sqlca)
dw_1.sharedata(dw_2)
//datawindowchild ldwc_pur
//
//dw_2.insertrow(0)
//dw_2.object.area_no[1] = gs_area
//dw_2.getchild('pur_no',ldwc_pur)
//ldwc_pur.settransobject(sqlca)
//is_select = ldwc_pur.Describe("DataWindow.Table.Select")
//
//is_clause = " where bpurdet.area_no = ~~'" + gs_area + "~~'" &
//          + " and bpurdet.openclose = ~~'P~~'" &   
//          + " order by bpurdet.pur_no desc"
//is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"
//wf_retrievechild(ldwc_pur,is_where)
//
//dw_1.getchild('item_no',idwc_pur)
//idwc_pur.settransobject(sqlca)
//is_select1 = idwc_pur.Describe("DataWindow.Table.Select")

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
dw_area.object.area[1] = gs_area


end event

event resize;call super::resize;//
gb_2.width  = this.width  - 119
gb_2.height = this.height - 588

dw_1.width  = this.width  - 183
dw_1.height = this.height - 664

end event

type pb_save from w_inheritance`pb_save within w_ipbpurin_m
integer x = 4210
integer y = 64
integer taborder = 70
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

Long   ll_row
String ls_add
dwitemstatus l_status

dw_1.accepttext()
dw_1.SetRedraw(false)
dw_1.setfilter('')
dw_1.filter()
if dw_1.rowcount() > 0 then
	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.seq[ll_row] = ll_row
	next
end if
dw_1.accepttext()
wf_update1(dw_1, "Y")
dw_1.setfilter(is_filter)
dw_1.filter()
dw_1.SetRedraw(true)
end event

type dw_1 from w_inheritance`dw_1 within w_ipbpurin_m
integer y = 484
integer width = 4521
integer height = 1724
integer taborder = 150
string dataobject = "d_ipbpurin_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;string ls_itemname, ls_uom, ls_suppname, ls_suppno
integer li_itemno
long ll_cnt
dec ld_cost

this.accepttext()
choose case dwo.name
	case 'bsupp_supp_name'
		if ii_sw = 1 then
			ii_sw = 0
			cb_1.postevent(clicked!)
		else
			ls_suppname = trim(data)
			select count(*) into :ll_cnt from bsupp
			 where supp_name like :ls_suppname;
			if ll_cnt < 1 then
				ls_suppname = trim(data) + "%"
				select count(*) into :ll_cnt from bsupp
				 where supp_name like :ls_suppname;
			end if
			if ll_cnt = 1 then
				select supp_name, supp_no into :ls_suppname , :ls_suppno from bsupp
				 where supp_name like :ls_suppname;
				 this.object.bsupp_supp_name[row] = ls_suppname
				 this.object.supp_no[row] = ls_suppno
				 return 1
			else
				cb_1.postevent(clicked!)
			end if
		end if
		
	case 'bitem_item_name'
		if ii_sw2 = 1 then
			ii_sw2 = 0
			cb_2.postevent(clicked!)
		end if
		ls_itemname = trim(data)
		select count(*) into :ll_cnt from bitem
		 where item_name like :ls_itemname;
		if ll_cnt < 1 then
			ls_itemname = trim(data) + "%"
			select count(*) into :ll_cnt from bitem
			 where item_name like :ls_itemname;
		end if
		if ll_cnt = 1 then
			select item_name, item_no, uom into :ls_itemname , :li_itemno, :ls_uom from bitem
			 where item_name like :ls_itemname;
			 this.object.bitem_item_name[row] = ls_itemname
			 this.object.item_no[row] = li_itemno
			 this.object.uom[row] = ls_uom
			 return 1
		else
			cb_2.postevent(clicked!)
		end if
		li_itemno = this.object.item_no[row]
		select cost into :ld_cost from binitem
		 where item_no = :li_itemno
		  order by in_date Desc;
		this.object.cost[row] = ld_cost
		this.object.amount[row] = this.object.qty[row] * this.object.cost[row]

	case 'qty', 'cost'
//		if this.object.amount[row] <= 0 then
			this.object.amount[row] = this.object.qty[row] * this.object.cost[row]
//		end if
		
end choose

end event

event dw_1::doubleclicked;CHOOSE CASE dwo.name
	CASE 'bsupp_supp_name'
		ii_sw = 1
		if this.accepttext() = 1 then
			if ii_sw = 1 then
				ii_sw = 0
				cb_1.triggerevent(clicked!)
			end if
		end if
	CASE 'bitem_item_name'
		ii_sw2 = 1
		if this.accepttext() = 1 then
			if ii_sw2 = 1 then
				ii_sw2 = 0
				cb_2.triggerevent(clicked!)
			end if
		end if
END CHOOSE

end event

event dw_1::itemerror;choose case dwo.name
	case 'bsupp_supp_name'
//		this.setcolumn('bitem_item_name')
//		this.setfocus()
		
	case 'bitem_item_name'
//		this.setcolumn('qa')
//		this.setfocus()
end choose
return 2
end event

event dw_1::rbuttondown;//These statements in the RButtonDown script 
//for the window display a popup menu at the cursor position. 
//Menu4 was created in the Menu painter and includes a menu called m_language. 
//Menu4 is not the menu for the active window and therefore needs to be created. 
//NewMenu is an instance of Menu4 (data type Menu4):
////

int li_int

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = NewMenu.m_insdel.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())
CHOOSE CASE gs_print_control
	CASE "insert"
		this.insertrow(row)
		this.object.in_date[row] = date(em_1.text)
		this.object.area_no[row] = gs_area
		this.object.user_id[row] = gs_userid
		this.object.sys_date[row] = gf_today()
		for li_int = row to this.rowcount()
			this.object.seq[li_int] = li_int
		next

	CASE "delete"
		this.deleterow(row)
END CHOOSE


end event

event dw_1::keydown;long ll_row

ll_row = this.getrow()
if ll_row < 1 or ll_row = this.rowcount() then return

choose case this.getcolumnname() 
	case "part_code" 
   IF keydown(Keyenter!) THEN
		
		this.scrolltorow(ll_row)
		this.setcolumn('bsupp_supp_name')
		this.setfocus()
	END IF
END choose


end event

event dw_1::clicked;call super::clicked;if row < 1 then return
if cbx_2.checked = false then return

if this.isselected(row) then
	this.selectrow(row,false)
else
	this.selectrow(row,true)
end if


end event

type dw_2 from w_inheritance`dw_2 within w_ipbpurin_m
integer x = 1029
integer y = 140
integer width = 110
integer height = 76
integer taborder = 160
string dataobject = "d_ipbpurin_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;//datawindowchild ldwc_pur
//this.accepttext()
//choose case dwo.name
//	case 'pur_no'
//        this.getchild('pur_no',ldwc_pur)
//        this.object.sign_date[1] = ldwc_pur.getitemdatetime(ldwc_pur.getrow(),'sign_date')
//		  dw_1.retrieve(data)
//        idwc_pur.settransobject(sqlca)
//        is_clause1 = " and bpurdet.pur_no = ~~'" + trim(data) + "~~'" &
//                  + " and bpurdet.openclose = ~~'P~~'" &   
//                  + " order by bpurdet.pur_no desc"
//        is_where1 = "DataWindow.Table.Select='" + is_select1 + is_clause1 + "'"
//        wf_retrievechild(idwc_pur,is_where1)
//end choose
end event

type st_title from w_inheritance`st_title within w_ipbpurin_m
integer x = 37
integer y = 28
integer width = 1193
string text = "조업자재 구매일보"
end type

type st_tips from w_inheritance`st_tips within w_ipbpurin_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipbpurin_m
boolean visible = false
integer x = 3008
integer taborder = 200
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipbpurin_m
boolean visible = false
integer taborder = 100
end type

type pb_close from w_inheritance`pb_close within w_ipbpurin_m
integer x = 4398
integer y = 64
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipbpurin_m
integer x = 4023
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_prt
w_repsuper w_print
st_print   l_print
long       ll_count
string     ls_zoom

if dw_1.rowcount() < 1 then
	messagebox("확인","해당 일자에는 자료가 없습니다")
	return
end if
//wf_print(is_date)

if cbx_3.checked    = true then 
	dw_prt = dw_4
	ls_zoom = "80"
	if cbx_cust.checked = true then
		dw_prt = dw_5
		ls_zoom = "100"
	end if
else
	dw_prt = dw_2
	ls_zoom = "99"
end if
	
l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 조업자재 입고일보 보고서를 출력합니다."

gs_print_control = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=" + ls_zoom
opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipbpurin_m
boolean visible = false
integer taborder = 210
end type

type pb_delete from w_inheritance`pb_delete within w_ipbpurin_m
integer x = 3835
integer y = 64
integer taborder = 50
end type

event pb_delete::clicked;dw_1.accepttext()
if dw_1.getrow() < 1 then return

dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_ipbpurin_m
integer x = 3648
integer y = 64
integer taborder = 40
end type

event pb_insert::clicked;long ll_row
string ls_pur

dw_1.accepttext()

//ll_row = dw_1.getrow()
//if ll_row > 0 then
//	dw_1.rowscopy(ll_row, ll_row , Primary!, dw_1, ll_row, Primary!)
//else
	ll_row = dw_1.insertrow(0)
	dw_1.object.in_date[ll_row] = date(em_1.text)
	dw_1.object.area_no[ll_row] = gs_area
	dw_1.object.user_id[ll_row] = gs_userid
	dw_1.object.sys_date[ll_row] = gf_today()
//end if
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('bsupp_supp_name')
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ipbpurin_m
integer x = 3461
integer y = 64
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area, ls_supp, ls_category, ls_date1, ls_date2

//dw_1.retrieve(date(em_1.text), date(em_3.text), gs_area)

ls_area = dw_area.object.area[dw_area.GetRow()]
if isnull(ls_area) or ls_area = "" then ls_area = "%"

dw_3.accepttext()
ls_date1   = em_1.text
ls_date2   = em_3.text
ls_supp    = trim(dw_3.object.bsupp_no[1])
if isnull(ls_supp) or ls_supp = "" then ls_supp = "%"

ls_category = '%'
ll_row = dw_1.retrieve(date(em_1.text), date(em_3.text), ls_area)
ll_row = dw_4.retrieve( ls_date1, ls_date2, ls_supp, ls_category )
ll_row = dw_5.retrieve( ls_date1, ls_date2, ls_supp, ls_category )

end event

type gb_3 from w_inheritance`gb_3 within w_ipbpurin_m
integer x = 37
integer y = 232
integer width = 4585
integer height = 176
integer taborder = 180
end type

type gb_2 from w_inheritance`gb_2 within w_ipbpurin_m
integer x = 37
integer y = 432
integer width = 4585
integer height = 1800
integer taborder = 190
end type

type gb_1 from w_inheritance`gb_1 within w_ipbpurin_m
integer x = 3429
integer y = 16
integer width = 1193
integer height = 212
integer taborder = 130
integer textsize = -10
integer weight = 400
end type

type em_1 from editmask within w_ipbpurin_m
integer x = 1897
integer y = 52
integer width = 407
integer height = 80
integer taborder = 10
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type cb_1 from commandbutton within w_ipbpurin_m
boolean visible = false
integer x = 37
integer y = 140
integer width = 347
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처선택"
end type

event clicked;if dw_1.getrow() < 1 then return
string ls_null
gs_where lstr_where
long ll_row

ll_row  = dw_1.getrow()
if ll_row < 1 then return


dw_1.accepttext()
lstr_where.name = dw_1.object.bsupp_supp_name[ll_row]
openwithparm(w_whbsupp_w,lstr_where)
lstr_where = Message.PowerObjectParm
dw_1.SETREDRAW(FALSE)
if lstr_where.chk = "Y" then
	dw_1.object.supp_no[ll_row] = lstr_where.str1
	dw_1.object.bsupp_supp_name[ll_row] = lstr_where.name
//	dw_1.accepttext()
else
	setnull(ls_null)
	dw_1.object.supp_no[ll_row] = ls_null
	dw_1.object.bsupp_supp_name[ll_row] = ls_null
	dw_1.setcolumn('bsupp_supp_name')
	dw_1.setfocus()
end if
	dw_1.SETREDRAW(TRUE)

end event

type cb_2 from commandbutton within w_ipbpurin_m
boolean visible = false
integer x = 384
integer y = 140
integer width = 283
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "자재선택"
end type

event clicked;if dw_1.getrow() < 1 then return
gs_where lstr_where
string ls_null
int li_null
long ll_row

ll_row  = dw_1.getrow()
if ll_row < 1 then return


dw_1.accepttext()
lstr_where.name = dw_1.object.bitem_item_name[ll_row]
openwithparm(w_whbitem_w,lstr_where)
lstr_where = Message.PowerObjectParm
dw_1.SETREDRAW(FALSE)
if lstr_where.chk = "Y" then
	dw_1.object.item_no[ll_row] = integer(lstr_where.str1)
	dw_1.object.uom[ll_row] = lstr_where.str2
	dw_1.object.bitem_item_name[ll_row] = lstr_where.name
	dec ld_cost
	int li_itemno
	li_itemno = dw_1.object.item_no[ll_row]
	select price into :ld_cost from bitem
	 where item_no = :li_itemno;
	dw_1.object.cost[ll_row] = ld_cost
	dw_1.object.amount[ll_row] = dw_1.object.qty[ll_row] * dw_1.object.cost[ll_row]
//	dw_1.accepttext()
else
	setnull(ls_null)
	setnull(li_null)
	dw_1.object.item_no[ll_row] = li_null
	dw_1.object.uom[ll_row] = ls_null
	dw_1.object.bitem_item_name[ll_row] = ls_null
	dw_1.setcolumn('bitem_item_name')
	dw_1.setfocus()
end if
dw_1.SETREDRAW(TRUE)

end event

type st_1 from statictext within w_ipbpurin_m
integer x = 1541
integer y = 52
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
string text = "일보일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_ipbpurin_m
integer x = 87
integer y = 292
integer width = 375
integer height = 88
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "일자변경"
end type

event clicked;//
dw_1.accepttext()
if wf_modifycount(dw_1) > 0 then
	messagebox("확인", "저장되지 않은 자료가 있읍니다. 저장후 작업을 하십시요")
	return
end if
if dw_1.rowcount() < 1 then
	messagebox("확인", "자료가 없습니다.")
	return
end if
//if em_1.text = em_3.text and cbx_2.checked = true then
if cbx_2.checked = true then
//	tab_1.tabpage_1.st_2.text = em_1.text
	tab_1.tabpage_1.st_2.text = '선택된항목'
	tab_1.tabpage_1.st_2.backcolor = 1087434968
	tab_1.tabpage_1.st_2.visible = true
	tab_1.tabpage_1.cbx_1.visible = false
else
	tab_1.tabpage_1.st_2.text = '----/--/--'
	tab_1.tabpage_1.st_2.backcolor = 78682240
	tab_1.tabpage_1.cbx_1.visible = true
	tab_1.tabpage_1.st_2.visible = false
end if

pb_retrieve.enabled = false
pb_insert.enabled = false
pb_delete.enabled = false
pb_print.enabled = false
pb_save.enabled = false
dw_1.enabled = false
em_1.enabled = false
em_3.enabled = false
cb_1.enabled = false
cb_2.enabled = false
cb_3.enabled = false

tab_1.selecttab(1)
tab_1.tabpage_1.em_2.text = em_1.text
tab_1.tabpage_1.em_2.setfocus()

tab_1.visible = true
end event

type tab_1 from tab within w_ipbpurin_m
integer x = 768
integer y = 300
integer width = 1152
integer height = 420
integer taborder = 170
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean boldselectedtext = true
alignment alignment = center!
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

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 1115
integer height = 292
long backcolor = 79741120
string text = "일보일자변경"
long tabtextcolor = 16777215
long tabbackcolor = 16711680
long picturemaskcolor = 553648127
cbx_1 cbx_1
st_2 st_2
st_3 st_3
em_2 em_2
st_4 st_4
cb_4 cb_4
st_5 st_5
cb_5 cb_5
end type

on tabpage_1.create
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_3=create st_3
this.em_2=create em_2
this.st_4=create st_4
this.cb_4=create cb_4
this.st_5=create st_5
this.cb_5=create cb_5
this.Control[]={this.cbx_1,&
this.st_2,&
this.st_3,&
this.em_2,&
this.st_4,&
this.cb_4,&
this.st_5,&
this.cb_5}
end on

on tabpage_1.destroy
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_2)
destroy(this.st_4)
destroy(this.cb_4)
destroy(this.st_5)
destroy(this.cb_5)
end on

type cbx_1 from checkbox within tabpage_1
boolean visible = false
integer x = 18
integer y = 32
integer width = 549
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "전체 항목선택"
end type

event clicked;if this.visible = true then
	if this.checked = true then
		dw_1.SelectRow(0, true)
		cb_4.enabled = true
	else
		dw_1.SelectRow(0, false)
		cb_4.enabled = false
	end if
else
	cb_4.enabled = true
end if
end event

type st_2 from statictext within tabpage_1
integer x = 41
integer y = 36
integer width = 462
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "YYYY/MM/DD"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_1
integer x = 544
integer y = 52
integer width = 219
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "에서"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within tabpage_1
integer x = 215
integer y = 144
integer width = 443
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_4 from statictext within tabpage_1
integer x = 658
integer y = 160
integer width = 91
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "로"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_1
integer x = 786
integer y = 144
integer width = 311
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "변경"
end type

event clicked;
if st_2.text = em_2.text then
	messagebox("확인","변경하려는 일자가 같습니다. 일자를 확인하십시요")
	return
end if

long ll_row, ll_maxseq
string ls_date, ls_check
ls_check = 'N'
ls_date = em_2.text
select isnull(max(seq),0) + 1 into :ll_maxseq from binitem
where in_date = :ls_date;

for ll_row = 1 to dw_1.rowcount()
	if dw_1.isselected(ll_row) = true then
		dw_1.object.in_date[ll_row] = datetime(date(em_2.text))
		dw_1.object.seq[ll_row] = ll_maxseq
		ll_maxseq++
		ls_check = 'Y'
	end if
next

if	ls_check <> 'Y' then
	messagebox("확인", "선택된 항목이 없습니다. 일자변경할 항목을 선택하세요.")
	pb_retrieve.postevent(clicked!)
else
	dw_1.accepttext()
	if wf_update1(dw_1, "N") then
		messagebox("확인", "자료가 변경되었습니다")
		em_1.text = em_2.text
		em_3.text = em_2.text
		pb_retrieve.postevent(clicked!)
	end if
end if

tab_1.visible = false

pb_retrieve.enabled = true
pb_insert.enabled = true
pb_delete.enabled = true
pb_print.enabled = true
pb_save.enabled = true
dw_1.enabled = true
em_1.enabled = true
em_3.enabled = true
cb_1.enabled = true
cb_2.enabled = true
cb_3.enabled = true


end event

type st_5 from statictext within tabpage_1
integer x = 46
integer y = 156
integer width = 165
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "==>"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_5 from commandbutton within tabpage_1
integer x = 786
integer y = 36
integer width = 311
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;
tab_1.visible = false

pb_retrieve.enabled = true
pb_insert.enabled = true
pb_delete.enabled = true
pb_print.enabled = true
pb_save.enabled = true
dw_1.enabled = true
em_1.enabled = true
em_3.enabled = true
cb_1.enabled = true
cb_2.enabled = true
cb_3.enabled = true
cb_4.enabled = true
end event

type em_3 from editmask within w_ipbpurin_m
integer x = 2395
integer y = 52
integer width = 407
integer height = 80
integer taborder = 20
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_ipbpurin_m
integer x = 1541
integer y = 136
integer width = 1262
integer height = 80
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_ipbsupp_dddw_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = StyleBox!
end type

event itemchanged;this.accepttext()

string ls_bsupp_no, ls_bitem_no

ls_bsupp_no = trim(dw_3.object.bsupp_no[row])
ls_bitem_no = trim(dw_3.object.bitem_no[row])

if ls_bsupp_no = '%' or ls_bitem_no = '0' then
	if ls_bsupp_no = '%' and ls_bitem_no = '0' then
		is_filter = ''
	else
		if ls_bsupp_no = '%' then
			is_filter = " item_no = " + ls_bitem_no
		else
			is_filter = " supp_no = '" + ls_bsupp_no + "'"
		end if
	end if
else
	is_filter = " supp_no = '" + ls_bsupp_no + "' and item_no = " + ls_bitem_no
end if

dw_1.setfilter(is_filter)
dw_1.filter()


end event

type st_6 from statictext within w_ipbpurin_m
integer x = 2318
integer y = 48
integer width = 69
integer height = 80
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "~~"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_ipbpurin_m
integer x = 489
integer y = 308
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "선택"
end type

event clicked;if cbx_2.checked = false then
	dw_1.selectrow(0,false)
end if


end event

type dw_area from datawindow within w_ipbpurin_m
integer x = 2843
integer y = 132
integer width = 526
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_7 from statictext within w_ipbpurin_m
integer x = 2843
integer y = 56
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_ipbpurin_m
integer x = 1157
integer y = 140
integer width = 110
integer height = 76
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipbpurin_r1"
boolean livescroll = true
end type

type cbx_cust from checkbox within w_ipbpurin_m
integer x = 4014
integer y = 308
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "거래처별 집계"
end type

event clicked;//// 거래처별 집계
//if this.checked = true then
//	dw_1.visible = false
//	dw_4.visible = true
//else
//	dw_1.visible = true
//	dw_4.visible = false
//end if
end event

type dw_5 from datawindow within w_ipbpurin_m
integer x = 1285
integer y = 140
integer width = 110
integer height = 76
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipbpurin_r2"
boolean livescroll = true
end type

type cbx_3 from checkbox within w_ipbpurin_m
integer x = 3685
integer y = 308
integer width = 315
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "신양식"
end type

type gb_15 from groupbox within w_ipbpurin_m
integer x = 1490
integer y = 16
integer width = 1915
integer height = 212
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

