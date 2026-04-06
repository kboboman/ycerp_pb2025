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
type cbx_2 from checkbox within w_ipbpurin_m
end type
type dw_area from datawindow within w_ipbpurin_m
end type
type st_7 from statictext within w_ipbpurin_m
end type
type dw_4 from datawindow within w_ipbpurin_m
end type
type dw_5 from datawindow within w_ipbpurin_m
end type
type st_8 from statictext within w_ipbpurin_m
end type
type ddlb_fld from dropdownlistbox within w_ipbpurin_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ipbpurin_m
end type
type st_9 from statictext within w_ipbpurin_m
end type
type ddlb_op from dropdownlistbox within w_ipbpurin_m
end type
type sle_value from singlelineedit within w_ipbpurin_m
end type
type cb_6 from commandbutton within w_ipbpurin_m
end type
type cb_7 from commandbutton within w_ipbpurin_m
end type
type cb_8 from commandbutton within w_ipbpurin_m
end type
type cb_9 from commandbutton within w_ipbpurin_m
end type
type pb_1 from picturebutton within w_ipbpurin_m
end type
type rb_1 from radiobutton within w_ipbpurin_m
end type
type rb_2 from radiobutton within w_ipbpurin_m
end type
type rb_3 from radiobutton within w_ipbpurin_m
end type
type gb_4 from groupbox within w_ipbpurin_m
end type
end forward

global type w_ipbpurin_m from w_inheritance
integer x = 23
integer y = 36
integer width = 4704
integer height = 2284
string title = "조업자재 구매일보(w_ipbpurin_m)"
em_1 em_1
cb_1 cb_1
cb_2 cb_2
st_1 st_1
cb_3 cb_3
tab_1 tab_1
em_3 em_3
dw_3 dw_3
cbx_2 cbx_2
dw_area dw_area
st_7 st_7
dw_4 dw_4
dw_5 dw_5
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
pb_1 pb_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_4 gb_4
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
this.cbx_2=create cbx_2
this.dw_area=create dw_area
this.st_7=create st_7
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.pb_1=create pb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.tab_1
this.Control[iCurrent+7]=this.em_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.dw_area
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.dw_4
this.Control[iCurrent+13]=this.dw_5
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.ddlb_fld
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_9
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_6
this.Control[iCurrent+21]=this.cb_7
this.Control[iCurrent+22]=this.cb_8
this.Control[iCurrent+23]=this.cb_9
this.Control[iCurrent+24]=this.pb_1
this.Control[iCurrent+25]=this.rb_1
this.Control[iCurrent+26]=this.rb_2
this.Control[iCurrent+27]=this.rb_3
this.Control[iCurrent+28]=this.gb_4
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
destroy(this.cbx_2)
destroy(this.dw_area)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.pb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

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

if GF_PERMISSION('조업자재_구매일보', gs_userid) = 'Y' then	
else
	pb_save.enabled = false
end if

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_ipbpurin_m
integer x = 4160
integer y = 64
integer taborder = 70
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

Long   ll_row
String ls_add, ls_bsupp, ls_itemno, ls_part
dwitemstatus l_status

dw_1.accepttext()

for ll_row = 1 to dw_1.rowcount()
	ls_bsupp = dw_1.object.supp_no[ll_row]
	if isnull(ls_bsupp) or ls_bsupp = "" then
		dw_1.scrolltorow( ll_row )
		MessageBox("확인", string(ll_row) + " 행 거래처 공난처리 안됩니다.")
		RETURN
	end if
	
	ls_itemno = dw_1.object.bitem_item_name[ll_row]
	if isnull(ls_itemno) or ls_itemno = "" then
		dw_1.scrolltorow( ll_row )
		MessageBox("확인", string(ll_row) + " 행 품목 공난처리 안됩니다.")
		RETURN
	end if
	
	ls_part   = dw_1.object.part_code[ll_row]
	if isnull(ls_part) or ls_part = "" then
		dw_1.scrolltorow( ll_row )
		MessageBox("확인", string(ll_row) + " 행 부서코드 공난처리 안됩니다.")
		RETURN
	end if
next

if MessageBox("확인","저장 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if
	
dw_1.SetRedraw(false)
dw_1.setfilter('')
dw_1.filter()

// 입력순번 부여
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
integer x = 32
integer y = 440
integer width = 4585
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
			select count(*) into :ll_cnt from bsupp where supp_name like :ls_suppname;
			if ll_cnt < 1 then
				ls_suppname = trim(data) + "%"
				select count(*) into :ll_cnt from bsupp where supp_name like :ls_suppname;
			end if
			if ll_cnt = 1 then
				select supp_name, supp_no into :ls_suppname, :ls_suppno from bsupp where supp_name like :ls_suppname;
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
		select count(*) into :ll_cnt from bitem where item_name like :ls_itemname;
		if ll_cnt < 1 then
			ls_itemname = trim(data) + "%"
			select count(*) into :ll_cnt from bitem where item_name like :ls_itemname;
		end if
		if ll_cnt = 1 then
			select item_name, item_no, uom into :ls_itemname, :li_itemno, :ls_uom 
			  from bitem
			 where item_name like :ls_itemname;
			 
			 this.object.bitem_item_name[row] = ls_itemname
			 this.object.item_no[row] = li_itemno
			 this.object.uom[row] = ls_uom
			 return 1
		else
			cb_2.postevent(clicked!)
		end if
		
		li_itemno = this.object.item_no[row]
		select cost into :ld_cost from binitem where item_no = :li_itemno order by in_date Desc;
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

event dw_1::keydown;//
long ll_row

ll_row = this.getrow()
if ll_row < 1 or ll_row = this.rowcount() then return

choose case this.getcolumnname() 
	case "part_code" 
		if keydown(Keyenter!) then
			
			this.scrolltorow(ll_row)
			this.setcolumn('bsupp_supp_name')
			this.setfocus()
		end if
end choose


end event

event dw_1::clicked;call super::clicked;//
if row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 선택
if cbx_2.checked = false then RETURN

if this.isselected(row) then
	this.selectrow(row, false)
else
	this.selectrow(row, true)
end if


end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;// DataWinodw AutoSelection = true 대체
choose case dwo.name
	case "qty", "cost", "amount"
		this.SelectText(1, LenA(GetText()) + 3)		// 전체 선택
end choose
end event

type st_title from w_inheritance`st_title within w_ipbpurin_m
integer x = 32
integer y = 20
integer width = 1129
integer height = 140
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
integer x = 4352
integer y = 64
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipbpurin_m
integer x = 3776
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

if dw_1.rowcount() < 1 then RETURN

//wf_print(is_date)

if rb_1.checked = true then		// 구매일보
	dw_prt = dw_2
	ls_zoom = "99"
elseif rb_2.checked = true then		// 입고현황(집계)
	dw_prt = dw_4
	ls_zoom = "80"
elseif rb_3.checked = true then		// 입고현황(집계)_거래처
	dw_prt = dw_5
	ls_zoom = "100"
end if
	
l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 조업자재 입고일보 보고서를 출력합니다."

gs_print_control = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=" + ls_zoom
OpenSheetWithParm(w_print, l_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipbpurin_m
boolean visible = false
integer taborder = 210
end type

type pb_delete from w_inheritance`pb_delete within w_ipbpurin_m
integer x = 3584
integer y = 64
integer taborder = 50
end type

event pb_delete::clicked;dw_1.accepttext()
if dw_1.getrow() < 1 then return

dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_ipbpurin_m
integer x = 3392
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
integer x = 3200
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

ls_date1   = em_1.text
ls_date2   = em_3.text

dw_3.accepttext()
ls_supp    = trim(dw_3.object.bsupp_no[1])
if isnull(ls_supp) or ls_supp = "" then ls_supp = "%"

ls_category = '%'
ll_row = dw_1.retrieve(date(em_1.text), date(em_3.text), ls_area)
ll_row = dw_4.retrieve( ls_date1, ls_date2, ls_supp, ls_category )
ll_row = dw_5.retrieve( ls_date1, ls_date2, ls_supp, ls_category )

end event

type gb_3 from w_inheritance`gb_3 within w_ipbpurin_m
integer x = 32
integer y = 244
integer width = 4585
integer height = 176
integer taborder = 180
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ipbpurin_m
integer x = 1216
integer y = 16
integer width = 1125
integer height = 216
integer taborder = 190
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipbpurin_m
integer x = 3168
integer y = 16
integer width = 1408
integer height = 216
integer taborder = 130
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ipbpurin_m
integer x = 78
integer y = 136
integer width = 110
integer height = 76
integer taborder = 160
string dataobject = "d_ipbpurin_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_ipbpurin_m
integer x = 1559
integer y = 136
integer width = 375
integer height = 80
integer taborder = 10
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
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_3.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_3.text = lstr_calendar.edate
end if

////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	if this.text > em_3.text then
//		em_3.text = this.text
//	end if
//end if
//
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
integer x = 1248
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
string text = "일보일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_ipbpurin_m
integer x = 2496
integer y = 304
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
integer x = 1806
integer y = 732
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
integer x = 1934
integer y = 136
integer width = 375
integer height = 80
integer taborder = 20
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
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_3.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_3.text = lstr_calendar.edate
end if

////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	if this.text < em_1.text then
//		em_1.text = this.text
//	end if
//end if
//
end event

type dw_3 from datawindow within w_ipbpurin_m
integer x = 2391
integer y = 56
integer width = 722
integer height = 156
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_ipbsupp_dddw_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

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

type cbx_2 from checkbox within w_ipbpurin_m
integer x = 69
integer y = 244
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "선택"
end type

event clicked;// 선택
if this.checked = false then
	dw_1.selectrow(0,false)
end if


end event

type dw_area from datawindow within w_ipbpurin_m
integer x = 1559
integer y = 56
integer width = 526
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()
end event

type st_7 from statictext within w_ipbpurin_m
integer x = 1248
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_ipbpurin_m
integer x = 206
integer y = 136
integer width = 110
integer height = 76
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipbpurin_r1"
boolean livescroll = true
end type

type dw_5 from datawindow within w_ipbpurin_m
integer x = 334
integer y = 136
integer width = 110
integer height = 76
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipbpurin_r2"
boolean livescroll = true
end type

type st_8 from statictext within w_ipbpurin_m
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

type ddlb_fld from dropdownlistbox within w_ipbpurin_m
integer x = 279
integer y = 304
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ipbpurin_m
integer x = 311
integer y = 316
integer width = 311
integer height = 88
integer taborder = 120
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

type st_9 from statictext within w_ipbpurin_m
integer x = 750
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

type ddlb_op from dropdownlistbox within w_ipbpurin_m
integer x = 919
integer y = 304
integer width = 297
integer height = 512
integer taborder = 120
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

type sle_value from singlelineedit within w_ipbpurin_m
integer x = 1239
integer y = 312
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_6 from commandbutton within w_ipbpurin_m
integer x = 1810
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_7 from commandbutton within w_ipbpurin_m
integer x = 1975
integer y = 312
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

type cb_8 from commandbutton within w_ipbpurin_m
integer x = 2139
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_9 from commandbutton within w_ipbpurin_m
integer x = 2304
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_ipbpurin_m
event mousemove pbm_mousemove
integer x = 3968
integer y = 64
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
										"엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
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

type rb_1 from radiobutton within w_ipbpurin_m
integer x = 2976
integer y = 284
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "구매일보"
end type

type rb_2 from radiobutton within w_ipbpurin_m
integer x = 2976
integer y = 348
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "입고현황(집계)"
end type

type rb_3 from radiobutton within w_ipbpurin_m
integer x = 3589
integer y = 284
integer width = 837
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "입고현황(거래처집계)"
end type

type gb_4 from groupbox within w_ipbpurin_m
integer x = 2363
integer y = 16
integer width = 782
integer height = 216
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

