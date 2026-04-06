$PBExportHeader$w_oicustbaldo_r.srw
$PBExportComments$판매거래처별 제품출고및 미출고현황(1998/5/14,성삼지)
forward
global type w_oicustbaldo_r from w_inheritance
end type
type pb_2 from picturebutton within w_oicustbaldo_r
end type
type st_4 from statictext within w_oicustbaldo_r
end type
type ddlb_fld from dropdownlistbox within w_oicustbaldo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oicustbaldo_r
end type
type st_5 from statictext within w_oicustbaldo_r
end type
type sle_value from singlelineedit within w_oicustbaldo_r
end type
type cb_3 from commandbutton within w_oicustbaldo_r
end type
type cb_4 from commandbutton within w_oicustbaldo_r
end type
type cb_5 from commandbutton within w_oicustbaldo_r
end type
type cb_6 from commandbutton within w_oicustbaldo_r
end type
type st_3 from statictext within w_oicustbaldo_r
end type
type em_1 from editmask within w_oicustbaldo_r
end type
type em_2 from editmask within w_oicustbaldo_r
end type
type st_7 from statictext within w_oicustbaldo_r
end type
type cbx_team from checkbox within w_oicustbaldo_r
end type
type dw_sales from datawindow within w_oicustbaldo_r
end type
type st_6 from statictext within w_oicustbaldo_r
end type
type dw_area from datawindow within w_oicustbaldo_r
end type
type st_8 from statictext within w_oicustbaldo_r
end type
type dw_cust from datawindow within w_oicustbaldo_r
end type
type cbx_price from checkbox within w_oicustbaldo_r
end type
type ddlb_op from dropdownlistbox within w_oicustbaldo_r
end type
type rb_7 from radiobutton within w_oicustbaldo_r
end type
type rb_1 from radiobutton within w_oicustbaldo_r
end type
type gb_4 from groupbox within w_oicustbaldo_r
end type
end forward

global type w_oicustbaldo_r from w_inheritance
integer y = 112
integer width = 5102
integer height = 2140
string title = "거래처별 출고 및 미출고 현황(w_oicustbaldo_r)"
pb_2 pb_2
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
st_3 st_3
em_1 em_1
em_2 em_2
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_6 st_6
dw_area dw_area
st_8 st_8
dw_cust dw_cust
cbx_price cbx_price
ddlb_op ddlb_op
rb_7 rb_7
rb_1 rb_1
gb_4 gb_4
end type
global w_oicustbaldo_r w_oicustbaldo_r

type variables
//
gs_itembaldo_str ist_code
string is_sale_flag, is_itemdosql, is_itemdorsql, is_ret

datawindowchild idwc_area, idwc_user, idwc_cust

end variables

on w_oicustbaldo_r.create
int iCurrent
call super::create
this.pb_2=create pb_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.st_3=create st_3
this.em_1=create em_1
this.em_2=create em_2
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_6=create st_6
this.dw_area=create dw_area
this.st_8=create st_8
this.dw_cust=create dw_cust
this.cbx_price=create cbx_price
this.ddlb_op=create ddlb_op
this.rb_7=create rb_7
this.rb_1=create rb_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_2
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_4
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.cb_6
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.em_2
this.Control[iCurrent+14]=this.st_7
this.Control[iCurrent+15]=this.cbx_team
this.Control[iCurrent+16]=this.dw_sales
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.dw_area
this.Control[iCurrent+19]=this.st_8
this.Control[iCurrent+20]=this.dw_cust
this.Control[iCurrent+21]=this.cbx_price
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.rb_7
this.Control[iCurrent+24]=this.rb_1
this.Control[iCurrent+25]=this.gb_4
end on

on w_oicustbaldo_r.destroy
call super::destroy
destroy(this.pb_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_6)
destroy(this.dw_area)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.cbx_price)
destroy(this.ddlb_op)
destroy(this.rb_7)
destroy(this.rb_1)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")
dw_2.visible  = false

// 단가 출력안함
cbx_price.enabled = false	
if GF_Permission("거래처별 미출고현황(단가)", gs_userid) = "Y" then
	cbx_price.enabled = true	// 단가 출력안함
end if

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday

SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), "yyyy/mm/01")
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

// -60일, + 30일
em_1.text = String(RelativeDate(today(), - 60),'yyyy/mm/dd')
em_2.text = String(RelativeDate(today(), + 30),'yyyy/mm/dd')

// 사업장 
string ls_area

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
//dw_cust.object.cust_no.Background.Color = 67108864
dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
//if GF_Permission("거래처별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
//else
//	idwc_cust.retrieve( gs_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "ALL")
//	idwc_cust.setitem(1, "cust_name", "1.담당전체")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "ALL"
//end if
if idwc_cust.rowcount() = 0 then	idwc_cust.insertrow(0)
dw_cust.insertrow(0)  

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("거래처별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	long ll_find
	
	idwc_user.retrieve( gs_userid )
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
		cbx_team.checked = false
	   idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

		cbx_team.checked = true
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	end if
	dw_sales.object.user[1] = gs_userid
end if

dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_oicustbaldo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oicustbaldo_r
integer x = 32
integer y = 464
integer width = 4274
integer height = 1560
integer taborder = 0
string dataobject = "d_oicustbaldo_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oicustbaldo_r
integer x = 32
integer y = 20
integer width = 1303
integer height = 140
string text = "거래처별 미출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_oicustbaldo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oicustbaldo_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicustbaldo_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oicustbaldo_r
integer x = 4567
integer y = 76
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustbaldo_r
integer x = 4375
integer y = 76
integer taborder = 20
end type

event pb_print::destructor;//gs_itembaldo_str lst_code
//string ls_sql, ls_where
//long ll_count
//w_repsuper w_print
//st_print l_print
//
//openwithparm(w_whcustbaldor_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//
//if lst_code.do_flag = 'Y' then
//	st_1.text = "출고/미출고"
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + &
//		           lst_code.start_date + "~~' and " + "~~'" + lst_code.end_date + "~~'"		
//   else
//	   ls_where = " and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + lst_code.start_date + "~~' and ~~'" + &
//		           lst_code.end_date + "~~' and sale.cust_no between ~~'" + &				
//		           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//   end if
//else
//	st_1.text = "미출고"
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + &
//		           lst_code.start_date + "~~' and " + "~~'" + lst_code.end_date + "~~'"		
//   else
//	   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + lst_code.start_date + "~~' and ~~'" + &
//		           lst_code.end_date + "~~' and sale.cust_no between ~~'" + &				
//		           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//   end if
//end if
//ls_sql = "datawindow.table.select = '" + is_itemdorsql + ls_where + "'"
//dw_2.settransobject(sqlca)
//dw_2.modify(ls_sql)
//dw_2.retrieve()
//if dw_2.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
//   return
//end if
//
//FOR ll_count = 1 TO dw_2.rowcount()
//   dw_2.object.customer_industry_code[ll_count] = st_1.text
//	dw_2.object.customer_bus_cord[ll_count] = lst_code.start_date
//	dw_2.object.customer_bus_rep[ll_count] = lst_code.end_date
//NEXT
//
//l_print.name = 'd_oicustdobal_r'
//l_print.st_datawindow = dw_2
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 판매거래처별 물품출고및 미출고 현황을 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
end event

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_count
w_repsuper w_print
st_print   l_print

if dw_2.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

for ll_count = 1 to dw_2.rowcount()
	dw_2.object.customer_bus_cord[ll_count] = em_1.text
	dw_2.object.customer_bus_rep[ll_count]  = em_2.text
next

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처별 출고 및 미출고 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oicustbaldo_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oicustbaldo_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oicustbaldo_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oicustbaldo_r
integer x = 3991
integer y = 76
integer taborder = 10
end type

event pb_retrieve::destructor;//gs_itembaldo_str lst_code
//string ls_sql, ls_where
//
//openwithparm(w_whcustbaldo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//
//if lst_code.do_flag = 'Y' then
//	st_1.text = "출고/미출고"
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + &
//		           lst_code.start_date + "~~' and " + "~~'" + lst_code.end_date + "~~'"		
//   else
//	   ls_where = " and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + lst_code.start_date + "~~' and ~~'" + &
//		           lst_code.end_date + "~~' and sale.cust_no between ~~'" + &				
//		           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//   end if
//else
//	st_1.text = "미출고"
//   if lst_code.sel_flag = 'A' then
//	   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + &
//		           lst_code.start_date + "~~' and " + "~~'" + lst_code.end_date + "~~'"		
//   else
//	   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close <> ~~'C~~' and sale.due_date between ~~'" + lst_code.start_date + "~~' and ~~'" + &
//		           lst_code.end_date + "~~' and sale.cust_no between ~~'" + &				
//		           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//   end if
//end if
//ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"
//
//dw_1.settransobject(sqlca)
//dw_1.modify(ls_sql)
//dw_1.retrieve()
//if dw_1.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
//   return
//end if
//	
end event

event pb_retrieve::clicked;//
string ls_area, ls_custno, ls_sdate, ls_edate, ls_salesman, ls_team, ls_price

if em_1.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if


// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.accepttext()
ls_area  = trim(dw_area.object.area[1])
ls_area  = LeftA(ls_area,1) + "%"

// 담당자
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]

// 거래처
dw_cust.accepttext()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if

// 팀
if cbx_team.checked = true then
	ls_team = "%"
else
	ls_team = "N"
end if

// 단가 출력안함
if cbx_price.checked = true then	
	ls_price = "Y"
else
	ls_price = "N"
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.sharedata(dw_2)
dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_salesman, ls_team, ls_price )

if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oicustbaldo_r
integer x = 2327
integer y = 16
integer width = 1623
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oicustbaldo_r
integer y = 260
integer width = 4274
integer height = 188
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oicustbaldo_r
integer x = 3959
integer y = 16
integer width = 837
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oicustbaldo_r
integer x = 32
integer y = 172
integer width = 87
integer height = 68
integer taborder = 0
string dataobject = "d_oicustdobal_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type pb_2 from picturebutton within w_oicustbaldo_r
integer x = 4183
integer y = 76
integer width = 187
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long ll_cnt

ll_cnt = dw_1.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV," + &
		"Html(웹문서), *.HTML,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" OR ls_ExpandName = "html" OR ls_ExpandName = "HTML" then
						dw_1.SaveAs(ls_DocName, HTMLTable!	, TRUE)
			end if
	end if
end if	

end event

type st_4 from statictext within w_oicustbaldo_r
integer x = 73
integer y = 340
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

type ddlb_fld from dropdownlistbox within w_oicustbaldo_r
integer x = 261
integer y = 324
integer width = 480
integer height = 632
integer taborder = 170
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

type ddlb_dwtitles from dropdownlistbox within w_oicustbaldo_r
integer x = 315
integer y = 340
integer width = 311
integer height = 88
integer taborder = 200
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

type st_5 from statictext within w_oicustbaldo_r
integer x = 777
integer y = 340
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

type sle_value from singlelineedit within w_oicustbaldo_r
integer x = 1266
integer y = 328
integer width = 567
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_oicustbaldo_r
integer x = 1847
integer y = 328
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_oicustbaldo_r
integer x = 2011
integer y = 328
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_oicustbaldo_r
integer x = 2176
integer y = 328
integer width = 160
integer height = 76
integer taborder = 160
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

type cb_6 from commandbutton within w_oicustbaldo_r
integer x = 2341
integer y = 328
integer width = 160
integer height = 76
integer taborder = 170
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

type st_3 from statictext within w_oicustbaldo_r
integer x = 2373
integer y = 72
integer width = 274
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "주문일자"
boolean focusrectangle = false
end type

type em_1 from editmask within w_oicustbaldo_r
integer x = 2656
integer y = 56
integer width = 357
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
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
//	em_2.text = this.text
//end if
//
end event

type em_2 from editmask within w_oicustbaldo_r
integer x = 3022
integer y = 56
integer width = 357
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
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

type st_7 from statictext within w_oicustbaldo_r
integer x = 2373
integer y = 164
integer width = 270
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "담당자팀"
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oicustbaldo_r
integer x = 2656
integer y = 164
integer width = 59
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if this.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type dw_sales from datawindow within w_oicustbaldo_r
integer x = 2734
integer y = 144
integer width = 329
integer height = 88
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()
this.accepttext()

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_cust.enabled = true
dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("물품별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

// 팀
if cbx_team.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type st_6 from statictext within w_oicustbaldo_r
integer x = 1408
integer y = 60
integer width = 242
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
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oicustbaldo_r
integer x = 1655
integer y = 60
integer width = 526
integer height = 80
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type st_8 from statictext within w_oicustbaldo_r
integer x = 1408
integer y = 144
integer width = 242
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
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_oicustbaldo_r
integer x = 1655
integer y = 140
integer width = 617
integer height = 88
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type cbx_price from checkbox within w_oicustbaldo_r
integer x = 2528
integer y = 344
integer width = 558
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "단가 출력안함"
boolean checked = true
end type

type ddlb_op from dropdownlistbox within w_oicustbaldo_r
integer x = 955
integer y = 320
integer width = 302
integer height = 500
integer taborder = 160
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

type rb_7 from radiobutton within w_oicustbaldo_r
integer x = 3429
integer y = 144
integer width = 466
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현장집계(월간)"
end type

event clicked;// 현장집계(월간)
if this.checked = true then
	dw_1.dataobject = "d_oicustbaldo_r2"
	dw_1.SetTransObject(SQLCA)
end if

end event

type rb_1 from radiobutton within w_oicustbaldo_r
integer x = 3429
integer y = 72
integer width = 466
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처별"
boolean checked = true
end type

event clicked;// 현장집계(월간)
if this.checked = true then
	dw_1.dataobject = "d_oicustbaldo_r"
	dw_1.SetTransObject(SQLCA)
end if

end event

type gb_4 from groupbox within w_oicustbaldo_r
integer x = 1381
integer y = 16
integer width = 919
integer height = 232
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

