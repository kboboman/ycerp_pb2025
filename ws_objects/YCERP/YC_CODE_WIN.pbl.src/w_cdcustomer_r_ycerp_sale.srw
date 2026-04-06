$PBExportHeader$w_cdcustomer_r_ycerp_sale.srw
$PBExportComments$판매거래처마스터조회(1998/03/13,성삼지)
forward 
global type w_cdcustomer_r_ycerp_sale from w_inheritance
end type
type dw_3 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type tab_1 from tab within w_cdcustomer_r_ycerp_sale
end type
type tabpage_3 from userobject within tab_1
end type
type gb_8 from groupbox within tabpage_3
end type
type gb_7 from groupbox within tabpage_3
end type
type dw_6 from datawindow within tabpage_3
end type
type dw_7 from datawindow within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type st_6 from statictext within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type em_1 from editmask within tabpage_3
end type
type tabpage_3 from userobject within tab_1
gb_8 gb_8
gb_7 gb_7
dw_6 dw_6
dw_7 dw_7
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
em_1 em_1
end type
type tab_1 from tab within w_cdcustomer_r_ycerp_sale
tabpage_3 tabpage_3
end type
type dw_9 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type dw_10 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type dw_11 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type dw_12 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type dw_13 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type cb_1 from commandbutton within w_cdcustomer_r_ycerp_sale
end type
type dw_14 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type dw_15 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type pb_1 from picturebutton within w_cdcustomer_r_ycerp_sale
end type
type dw_16 from datawindow within w_cdcustomer_r_ycerp_sale
end type
type dw_rem from datawindow within w_cdcustomer_r_ycerp_sale
end type
end forward

global type w_cdcustomer_r_ycerp_sale from w_inheritance
integer width = 3712
integer height = 2968
string title = "판매거래처 마스터조회(w_cdcustomer_r)"
boolean hscrollbar = true
boolean vscrollbar = true
long backcolor = 79416533
dw_3 dw_3
tab_1 tab_1
dw_9 dw_9
dw_10 dw_10
dw_11 dw_11
dw_12 dw_12
dw_13 dw_13
cb_1 cb_1
dw_14 dw_14
dw_15 dw_15
pb_1 pb_1
dw_16 dw_16
dw_rem dw_rem
end type
global w_cdcustomer_r_ycerp_sale w_cdcustomer_r_ycerp_sale

type variables
public string is_custno,is_custname
st_print i_print
datawindowchild idwc_cust
datawindowchild idwc_user
datawindowchild idwc_cust_name
string is_select, is_where, is_clause, is_select1, is_dwsql,is_custdorsql
string is_cust_no, is_dovcsql, is_teamsql, is_mansql, is_salesman

end variables

on w_cdcustomer_r_ycerp_sale.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.tab_1=create tab_1
this.dw_9=create dw_9
this.dw_10=create dw_10
this.dw_11=create dw_11
this.dw_12=create dw_12
this.dw_13=create dw_13
this.cb_1=create cb_1
this.dw_14=create dw_14
this.dw_15=create dw_15
this.pb_1=create pb_1
this.dw_16=create dw_16
this.dw_rem=create dw_rem
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_9
this.Control[iCurrent+4]=this.dw_10
this.Control[iCurrent+5]=this.dw_11
this.Control[iCurrent+6]=this.dw_12
this.Control[iCurrent+7]=this.dw_13
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.dw_14
this.Control[iCurrent+10]=this.dw_15
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.dw_16
this.Control[iCurrent+13]=this.dw_rem
end on

on w_cdcustomer_r_ycerp_sale.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.tab_1)
destroy(this.dw_9)
destroy(this.dw_10)
destroy(this.dw_11)
destroy(this.dw_12)
destroy(this.dw_13)
destroy(this.cb_1)
destroy(this.dw_14)
destroy(this.dw_15)
destroy(this.pb_1)
destroy(this.dw_16)
destroy(this.dw_rem)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_zero = "%"

dw_1.settransobject(sqlca)
tab_1.tabpage_3.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_7.SetTransObject(SQLCA)
//dw_15.SetTransObject(SQLCA)
//dw_10.settransobject(sqlca)
//is_dwsql = dw_10.describe("datawindow.table.select")
//dw_11.settransobject(sqlca)
//is_dovcsql = dw_11.describe("datawindow.table.select")
//dw_12.settransobject(sqlca)
//is_teamsql = dw_12.describe("datawindow.table.select")
//dw_13.settransobject(sqlca)
//is_mansql = dw_13.describe("datawindow.table.select")
//dw_16.settransobject(sqlca)
//is_custdorsql = dw_16.describe("datawindow.table.select")
dw_9.settransobject(sqlca)
dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.setsort('cust_no, cust_name')
idwc_cust.sort()
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
idwc_cust_name.setsort('cust_name, cust_no')
idwc_cust_name.sort()
//pb_insert.enabled = true

//dw_14.settransobject(sqlca)
//dw_14.retrieve()

tab_1.tabpage_3.dw_7.modify("datawindow.readonly=yes")

end event

type pb_save from w_inheritance`pb_save within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 3163
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_cdcustomer_r_ycerp_sale
integer x = 46
integer y = 256
integer width = 2409
integer height = 92
integer taborder = 50
string title = "d_custddw_c <<old"
string dataobject = "d_cdcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;choose case dwo.name
	case 'cust_no'  
		this.object.cust_name[1] = ''
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
//		tab_1.tabpage_1.dw_5.reset()
//		tab_1.tabpage_2.dw_4.reset()
		tab_1.tabpage_3.dw_6.reset()
		tab_1.tabpage_3.dw_7.reset()
//		tab_1.tabpage_1.dw_5.setfocus()
//		tab_1.tabpage_1.dw_5.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
//		tab_1.tabpage_2.dw_4.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
//   	tab_1.tabpage_4.dw_17.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_7.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_6.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"), &
		                              integer(string(wf_today(),'YYYY')))
	case 'cust_name'
		this.object.cust_no[1] = ''
		this.object.cust_no[1] = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
//		tab_1.tabpage_1.dw_5.reset()
//		tab_1.tabpage_2.dw_4.reset()
		tab_1.tabpage_3.dw_6.reset()
		tab_1.tabpage_3.dw_7.reset()
//		tab_1.tabpage_1.dw_5.setfocus()
//		tab_1.tabpage_1.dw_5.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
//		tab_1.tabpage_2.dw_4.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
//   	tab_1.tabpage_4.dw_17.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_7.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_6.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"), &
		                              integer(string(wf_today(),'YYYY')))
end choose		
//tab_1.tabpage_4.st_2.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
//tab_1.tabpage_4.st_3.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
//--->>>tab_1.tabpage_3.st_5.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
//--->>>tab_1.tabpage_3.st_6.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
//is_salesman = tab_1.tabpage_1.dw_5.object.salesman[getrow()]
tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
//tab_1.tabpage_1.dw_5.object.cust_no.protect = true
dw_15.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text), tab_1.tabpage_3.st_5.text)

end event

event dw_1::clicked;call super::clicked;pb_insert.enabled = true
end event

type st_title from w_inheritance`st_title within w_cdcustomer_r_ycerp_sale
integer y = 56
integer width = 1230
string text = "판매거래처 마스터"
end type

type st_tips from w_inheritance`st_tips within w_cdcustomer_r_ycerp_sale
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2971
integer y = 60
integer width = 197
integer taborder = 150
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;long  ls_YesNo

ls_YesNo = messagebox("확인", "바로 프린터로 인쇄됩니다.~r~n" &
								+ "인쇄하시겠습니까", Exclamation!, OKCancel!, 2)

if ls_YesNo = 2 then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================


dw_15.print()

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2656
integer y = 60
integer width = 306
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = " 여신  리스트"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

event pb_print_part::clicked;//gs_dovc_str lst_code
//w_repsuper w_print
//st_print l_print
//string ls_sql, ls_where
//long ll_year
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//openwithparm(w_whvcdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//ll_year = long(lst_code.dovc_year)
//if lst_code.order_flag = '1' then
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " AND datepart(year,opeom.eom_year) = " + string(ll_year) + ""
//	   ls_sql = "datawindow.table.select = '" + is_dovcsql + ls_where + "'"
//   else
//	   ls_where = " AND datepart(year, opeom.eom_year) = " + string(ll_year) + " and opeom.cust_no between ~~'" + &
//	              lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//	   ls_sql = "datawindow.table.select = '" + is_dovcsql + ls_where + "'"
//   end if
//   dw_11.settransobject(sqlca)
//   dw_11.modify(ls_sql)
//   dw_11.retrieve()
//
//   if dw_11.rowcount() < 1 then
//  	   messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
//	   return
//   end if
//
//   l_print.st_datawindow = dw_11
//   l_print.st_print_sheet = " 프린트용지 : B4"
//   l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 
//
//   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
//                      'Datawindow.Zoom=100'
//   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//elseif lst_code.order_flag = '2' then
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " AND datepart(year,opeom.eom_year) = " + string(ll_year) + ""
//	   ls_sql = "datawindow.table.select = '" + is_teamsql + ls_where + "'"
//   else
//	   ls_where = " AND datepart(year, opeom.eom_year) = " + string(ll_year) + " and opeom.cust_no between ~~'" + &
//	              lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//	   ls_sql = "datawindow.table.select = '" + is_teamsql + ls_where + "'"
//   end if
//   dw_12.settransobject(sqlca)
//   dw_12.modify(ls_sql)
//   dw_12.retrieve()
//
//   if dw_12.rowcount() < 1 then
//  	   messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
//	   return
//   end if
//   l_print.name = 'd_cdteamvc_r'
//   l_print.st_datawindow = dw_12
//   l_print.st_print_sheet = " 프린트용지 : B4"
//   l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 
//
//   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
//                      'Datawindow.Zoom=100'
//   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//else
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " AND datepart(year,opeom.eom_year) = " + string(ll_year)// + ""
//	   ls_sql = "datawindow.table.select = '" + is_mansql + ls_where + "'"
//   else
//	   ls_where = " AND datepart(year, opeom.eom_year) = " + string(ll_year) + " and opeom.cust_no between ~~'" + &
//	              lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//	   ls_sql = "datawindow.table.select = '" + is_mansql + ls_where + "'"
//   end if
//   dw_13.settransobject(sqlca)
//   dw_13.modify(ls_sql)
//   dw_13.retrieve()
//
//   if dw_13.rowcount() < 1 then
//  	   messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
//	   return
//   end if
//   l_print.name = 'd_cdmanvc_r'
//   l_print.st_datawindow = dw_13
//   l_print.st_print_sheet = " 프린트용지 : B4"
//   l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 
//
//   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
//                      'Datawindow.Zoom=100'
//   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//end if
//
//
end event

type pb_close from w_inheritance`pb_close within w_cdcustomer_r_ycerp_sale
integer x = 3310
integer y = 60
integer taborder = 220
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2386
integer y = 60
integer width = 261
integer taborder = 230
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처리스트"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print::clicked;//gs_codere_str lst_code
//w_repsuper w_print
//st_print l_print
//string ls_sql, ls_where
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//openwithparm(w_whcust_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//
//if lst_code.flag = 'A' then
//	ls_sql = "datawindow.table.select = '" + is_dwsql + "'"
//else
//	ls_where = " where customer.cust_no between ~~'" + lst_code.start_no + "~~' and " + &
//				  "~~'" + lst_code.end_no + "~~'"
//	ls_sql = "datawindow.table.select = '" + is_dwsql + ls_where + "'"
//end if
//
//dw_10.settransobject(sqlca)
//dw_10.modify(ls_sql)
//dw_10.retrieve()
//
//if dw_10.rowcount() < 1 then
//  	messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)
//	return
//end if
//l_print.name = 'd_cdcustm_r'
//l_print.st_datawindow = dw_10
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 판매거래처 리스트를 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2427
integer taborder = 240
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1947
integer y = 44
integer taborder = 250
end type

event pb_delete::clicked;call super::clicked;//string ls_custno
//
//if dw_2.rowcount() < 1 then return	
//
//if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
//	return
//end if	
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//ls_custno = dw_1.object.cust_no[dw_1.getrow()]
//if ls_custno = dw_2.object.cust_no[dw_2.getrow()] then
//	dw_2.deleterow(0)
//	wf_update1(dw_2,"Y")
//   dw_1.deleterow(dw_1.getrow())
//else
//	dw_2.deleterow(0)
//	dw_2.retrieve(ls_custno)
//end if	
//
end event

type pb_insert from w_inheritance`pb_insert within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2386
integer y = 60
integer taborder = 270
integer weight = 400
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1851
integer taborder = 260
end type

type gb_3 from w_inheritance`gb_3 within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1010
integer y = 232
integer width = 2514
integer height = 1560
integer taborder = 120
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustomer_r_ycerp_sale
integer x = 27
integer y = 224
integer width = 3520
integer height = 136
integer taborder = 140
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustomer_r_ycerp_sale
integer x = 3237
integer y = 24
integer width = 320
integer height = 192
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 338
integer y = 0
integer width = 2405
integer height = 2016
integer taborder = 110
boolean vscrollbar = false
boolean border = false
end type

type dw_3 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1568
integer y = 52
integer width = 64
integer height = 72
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdcustomer_r"
boolean livescroll = true
end type

type tab_1 from tab within w_cdcustomer_r_ycerp_sale
integer x = 23
integer y = 364
integer width = 3534
integer height = 2392
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_3)
end on

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 3497
integer height = 2268
long backcolor = 79220952
string text = "매출/수금내역"
long tabtextcolor = 16711680
long tabbackcolor = 79220952
long picturemaskcolor = 536870912
gb_8 gb_8
gb_7 gb_7
dw_6 dw_6
dw_7 dw_7
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
em_1 em_1
end type

on tabpage_3.create
this.gb_8=create gb_8
this.gb_7=create gb_7
this.dw_6=create dw_6
this.dw_7=create dw_7
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.em_1=create em_1
this.Control[]={this.gb_8,&
this.gb_7,&
this.dw_6,&
this.dw_7,&
this.st_4,&
this.st_5,&
this.st_6,&
this.st_7,&
this.em_1}
end on

on tabpage_3.destroy
destroy(this.gb_8)
destroy(this.gb_7)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_1)
end on

type gb_8 from groupbox within tabpage_3
integer y = 904
integer width = 3474
integer height = 980
integer taborder = 81
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
end type

type gb_7 from groupbox within tabpage_3
integer width = 3474
integer height = 888
integer taborder = 111
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
end type

type dw_6 from datawindow within tabpage_3
event ue_spin pbm_enchange
integer x = 32
integer y = 124
integer width = 3360
integer height = 760
integer taborder = 111
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_cdinvcoll_q"
boolean border = false
boolean livescroll = true
end type

event ue_spin;//this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))
end event

event editchanged;this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))

end event

event itemchanged;this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))
end event

type dw_7 from datawindow within tabpage_3
integer x = 14
integer y = 952
integer width = 3438
integer height = 908
integer taborder = 82
boolean bringtotop = true
string dataobject = "d_cdglbill_q"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;int li_count
string ls_vc_no

this.accepttext()
dw_1.accepttext()
if this.rowcount() < 1 then
	messagebox("확인", "어음내역이 없습니다!",information!)
	return
end if
ls_vc_no = this.getitemstring(this.getrow(), "vc_no")

if ls_vc_no = '' or isnull(ls_vc_no) then
	messagebox("확인", "어음내역이 없습니다!",information!)
	return
else
	dw_9.retrieve(ls_vc_no)	
	li_count = dw_9.rowcount()
	if dw_9.rowcount() > 0 then
     	openwithparm(w_cdbilldet_m, ls_vc_no)
   else
		messagebox("", ls_vc_no + string(li_count))
	end if
end if
end event

type st_4 from statictext within tabpage_3
integer x = 32
integer y = 44
integer width = 384
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
string text = "판매거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_3
integer x = 416
integer y = 44
integer width = 242
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_3
integer x = 658
integer y = 44
integer width = 1275
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_3
integer x = 2121
integer y = 44
integer width = 315
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
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within tabpage_3
event us_modified pbm_enchange
integer x = 2437
integer y = 44
integer width = 261
integer height = 76
integer taborder = 141
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
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = " "
string minmax = "1990~~2100"
end type

event us_modified;tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
end event

event modified;tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
//tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
dw_15.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text), tab_1.tabpage_3.st_5.text)


end event

type dw_9 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1518
integer y = 24
integer width = 489
integer height = 360
integer taborder = 210
boolean bringtotop = true
string dataobject = "d_cdglbilldet_m"
boolean livescroll = true
end type

type dw_10 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1531
integer y = 56
integer width = 165
integer height = 128
integer taborder = 190
boolean bringtotop = true
string dataobject = "d_cdcustm_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_11 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1463
integer y = 32
integer width = 87
integer height = 100
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_cdaroivc_r"
boolean livescroll = true
end type

type dw_12 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1573
integer y = 44
integer width = 78
integer height = 92
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_cdteamvc_r"
boolean livescroll = true
end type

type dw_13 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1673
integer y = 52
integer width = 82
integer height = 92
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_cdmanvc_r"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1609
integer y = 48
integer width = 187
integer height = 144
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출력"
end type

event clicked;w_repsuper w_print
st_print l_print

   l_print.st_datawindow = dw_14
   l_print.st_print_sheet = " 프린트용지 : A4"
   l_print.st_print_desc = " 이 프로그램은 판매거래처의 리스트를 출력합니다." 

   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
                      'Datawindow.Zoom=100'
   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


end event

type dw_14 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2423
integer y = 232
integer width = 261
integer height = 176
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_cdcustomer_pr1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_15 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2377
integer y = 244
integer width = 174
integer height = 92
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_cdglbill_r1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 1874
integer y = 60
integer width = 503
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "공사예상현장"
vtextalign vtextalign = vcenter!
end type

event clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//long ll_count
//w_repsuper w_print
//st_print l_print
//
//
//openwithparm(w_whcustdor_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//
////messagebox('',string (lst_code.start_date))
////ld_start = date(string(lst_code.start_date,"yyyy/mm/dd"))
////ld_end = date(lst_code.end_date)
// 
//if lst_code.sel_flag = 'A' then
//   ls_where = " and exscene.ex_year between ~~'" + &
//	           string(lst_code.start_date) + "~~' and " + "~~'" + string(lst_code.end_date) + "~~'"		
//else
//   ls_where = " and exscene.ex_year between ~~'" + string(lst_code.start_date) + "~~' and ~~'" + &
//	           string(lst_code.end_date) + "~~' and exscene.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
//
//ls_sql = "datawindow.table.select = '" + is_custdorsql + ls_where + "'"
//dw_16.settransobject(sqlca)
//dw_16.modify(ls_sql)
//dw_16.retrieve()
////dw_2.object.bus_tel[1] = date(ld_start)
////dw_2.object.tel_no[1] = date(ld_end)
////
//if dw_16.rowcount() < 1 then
//   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//l_print.name = 'd_cdcustexscene_r'
//l_print.st_datawindow = dw_16
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 판매거래처별 공사예상현황을 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type dw_16 from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 2469
integer y = 308
integer width = 494
integer height = 360
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_cdcustexscene_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_rem from datawindow within w_cdcustomer_r_ycerp_sale
boolean visible = false
integer x = 503
integer y = 340
integer width = 2642
integer height = 1328
integer taborder = 130
boolean bringtotop = true
boolean titlebar = true
string title = "거래처 비고 History"
string dataobject = "d_cdcustomer_det_s"
boolean controlmenu = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

