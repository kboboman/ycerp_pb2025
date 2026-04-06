$PBExportHeader$w_oicustbaldo_r.srw
$PBExportComments$판매거래처별 제품출고및 미출고현황(1998/5/14,성삼지)
forward
global type w_oicustbaldo_r from w_inheritance
end type
type st_2 from statictext within w_oicustbaldo_r
end type
type st_1 from statictext within w_oicustbaldo_r
end type
type pb_2 from picturebutton within w_oicustbaldo_r
end type
end forward

global type w_oicustbaldo_r from w_inheritance
integer y = 112
integer width = 4681
integer height = 2844
string title = "거래처별 출고 및 미출고 현황(w_oicustbaldo_r)"
st_2 st_2
st_1 st_1
pb_2 pb_2
end type
global w_oicustbaldo_r w_oicustbaldo_r

type variables
string is_sale_flag, is_itemdosql, is_itemdorsql, is_ret
gs_itembaldo_str ist_code

end variables

on w_oicustbaldo_r.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_2
end on

on w_oicustbaldo_r.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

is_itemdosql = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")
dw_2.visible = false
end event

event resize;call super::resize;//
dw_1.width  = this.width  - 96
dw_1.height = this.height - 372

end event

type pb_save from w_inheritance`pb_save within w_oicustbaldo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oicustbaldo_r
integer x = 37
integer y = 260
integer width = 4585
integer height = 2472
integer taborder = 0
string dataobject = "d_oicustbaldo_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oicustbaldo_r
integer x = 2267
integer y = 32
integer width = 169
integer height = 120
integer taborder = 0
string dataobject = "d_oicustdobal_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oicustbaldo_r
integer y = 40
integer width = 1984
string text = "거래처별 출고 및 미출고 현황"
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
integer x = 3639
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustbaldo_r
integer x = 3429
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
st_print l_print

if dw_2.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

FOR ll_count = 1 TO dw_2.rowcount()
   dw_2.object.customer_industry_code[ll_count] = st_1.text
	dw_2.object.customer_bus_cord[ll_count] = ist_code.start_date
	dw_2.object.customer_bus_rep[ll_count]  = ist_code.end_date
NEXT

l_print.name = 'd_oicustdobal_r'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 판매거래처별 출고및 미출고 현황을 출력합니다." 

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
integer x = 3008
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

event pb_retrieve::clicked;string ls_sql, ls_where
string ls_custname,ls_custname1
string ls_itemname,ls_itemname1

openwithparm(w_whitembaldo_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security

string ls_userid
string ls_desc
string ls_title

string ls_level_userid
Choose Case gs_level
	Case 'A', 'B'
		is_ret = '%'
	Case 'C'
		is_ret = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	

if ist_code.do_flag = 'Y' then //출고/미출고
	st_1.text = "출고/미출고"
   if ist_code.sel_flag = 'A' then	//물품범위 전체조회
		if ist_code.order_flag = 'A' then	//거래처범위 전체조회
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			ls_desc = '조건:출고/물품범위전체조회/거래처전체조회 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회' 
		else
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"	+ &
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"

			select cust_name into :ls_custname  from customer where cust_no = :ist_code.start_cust;
			select cust_name into :ls_custname1 from customer where cust_no = :ist_code.end_cust;			
			ls_desc = '조건:출고/물품범위전체조회 거래처:' + ls_custname + '-' + ls_custname1 + ' 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회' 
		end if
   else //물품범위 부분조회
		if ist_code.order_flag = 'A' then //거래처범위 전체조회
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
		           ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
		           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			select item_name into :ls_itemname  from groupitem where item_no = :ist_code.start_no;
			select item_name into :ls_itemname1 from groupitem where item_no = :ist_code.end_no;
			ls_desc = '조건:출고/거래처 전체조회 물품범위:' + ls_itemname + '-' + ls_itemname1 + ' 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회'
		else
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
		   	        ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
		    	        ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'" 	+ &
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			select cust_name into :ls_custname  from customer  where cust_no = :ist_code.start_cust;
			select cust_name into :ls_custname1 from customer  where cust_no = :ist_code.end_cust;			
			select item_name into :ls_itemname  from groupitem where item_no = :ist_code.start_no;
			select item_name into :ls_itemname1 from groupitem where item_no = :ist_code.end_no;			
			ls_desc = '조건:출고 물품범위:' + ist_code.start_no + '-' + ist_code.end_no + ' 거래처:' + ist_code.start_cust + '-' + ist_code.end_cust + ' 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회'
		end if
   end if
else
	st_1.text = "미출고"
   if ist_code.sel_flag = 'A' then //물품범위전체
		if ist_code.order_flag = 'A' then	//거래처범위전체
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"		+ &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			ls_desc = '조건:미출고/물품범위전체조회/거래처전체조회 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회' 				  
		else	//거래처 부분조회
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"	+ &	
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'"+ &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			select cust_name into :ls_custname  from customer where cust_no = :ist_code.start_cust;
			select cust_name into :ls_custname1 from customer where cust_no = :ist_code.end_cust;			
			ls_desc = '조건:미출고/물품범위전체조회 거래처:' + ls_custname + '-' + ls_custname1 + ' 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회' 

		end if
   else	//물품범위 부분조회
		if ist_code.order_flag = 'A' then	//거래처 전체조회
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
			           ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
			           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			select item_name into :ls_itemname  from groupitem where item_no = :ist_code.start_no;
			select item_name into :ls_itemname1 from groupitem where item_no = :ist_code.end_no;
			ls_desc = '조건:미출고/거래처전체조회 물품범위:' + ls_itemname + '-' + ls_itemname1 + ' 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회'						  
		else
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
			           ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
			           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"	+ &	
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
			select cust_name into :ls_custname  from customer  where cust_no = :ist_code.start_cust;
			select cust_name into :ls_custname1 from customer  where cust_no = :ist_code.end_cust;			
			select item_name into :ls_itemname  from groupitem where item_no = :ist_code.start_no;
			select item_name into :ls_itemname1 from groupitem where item_no = :ist_code.end_no;			
			ls_desc = '조건:미출고 물품범위:' + ist_code.start_no + '-' + ist_code.end_no + ' 거래처:' + ist_code.start_cust + '-' + ist_code.end_cust + ' 기간:' + ist_code.start_date + '-' + ist_code.end_date + ' 조회'						  
		end if
   end if
end if
ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_2.modify(ls_sql)
dw_1.sharedata(dw_2)
dw_1.retrieve()
//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
		ls_userid = gs_userid
		ls_title = st_title.text
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oicustbaldo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oicustbaldo_r
integer x = 23
integer y = 220
integer width = 4617
integer height = 2528
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oicustbaldo_r
integer x = 2981
integer y = 8
integer width = 882
integer height = 208
integer taborder = 0
end type

type st_2 from statictext within w_oicustbaldo_r
integer x = 2574
integer y = 40
integer width = 375
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "조회범위"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oicustbaldo_r
integer x = 2574
integer y = 128
integer width = 375
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_oicustbaldo_r
integer x = 3218
integer y = 52
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

