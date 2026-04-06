$PBExportHeader$w_oisalesmanbaldo_r.srw
$PBExportComments$영업사원별 출고/미출고 현황(2009/05)
forward
global type w_oisalesmanbaldo_r from w_inheritance
end type
type st_2 from statictext within w_oisalesmanbaldo_r
end type
type st_1 from statictext within w_oisalesmanbaldo_r
end type
type pb_1 from picturebutton within w_oisalesmanbaldo_r
end type
type dw_4 from datawindow within w_oisalesmanbaldo_r
end type
type st_info from statictext within w_oisalesmanbaldo_r
end type
type mle_1 from multilineedit within w_oisalesmanbaldo_r
end type
type cbx_1 from checkbox within w_oisalesmanbaldo_r
end type
end forward

global type w_oisalesmanbaldo_r from w_inheritance
integer y = 112
integer width = 4681
integer height = 2868
string title = "영업사원별 출고, 미출고 현황(w_oisalesmanbaldo_r)"
st_2 st_2
st_1 st_1
pb_1 pb_1
dw_4 dw_4
st_info st_info
mle_1 mle_1
cbx_1 cbx_1
end type
global w_oisalesmanbaldo_r w_oisalesmanbaldo_r

type variables
string is_sale_flag, is_itemdosql, is_itemdorsql, is_ret
gs_itembaldo_str ist_code
datawindowchild idwc_user
end variables

on w_oisalesmanbaldo_r.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.pb_1=create pb_1
this.dw_4=create dw_4
this.st_info=create st_info
this.mle_1=create mle_1
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.st_info
this.Control[iCurrent+6]=this.mle_1
this.Control[iCurrent+7]=this.cbx_1
end on

on w_oisalesmanbaldo_r.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.dw_4)
destroy(this.st_info)
destroy(this.mle_1)
destroy(this.cbx_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")

dw_2.visible  = false
mle_1.visible = false

if gs_userid = "1999010s" then
	cbx_1.visible = true
else
	cbx_1.visible = false
end if

dw_4.SetTransObject(SQLCA)
dw_4.InsertRow(0)

dw_4.getchild('user',idwc_user)

if LeftA(gs_team,1) = "7" then
	dw_4.object.team[1] = gs_team
	dw_4.object.user[1] = gs_username
end if

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 100
gb_2.height = this.height - 388

dw_1.width  = this.width  - 160
dw_1.height = this.height - 468

end event

type pb_save from w_inheritance`pb_save within w_oisalesmanbaldo_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_oisalesmanbaldo_r
integer x = 59
integer y = 312
integer width = 4521
integer height = 2400
integer taborder = 50
string dataobject = "d_oisalemanbaldo_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
end event

type dw_2 from w_inheritance`dw_2 within w_oisalesmanbaldo_r
integer x = 3447
integer y = 48
integer width = 123
integer height = 88
integer taborder = 0
string dataobject = "d_oisalemanbaldo_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oisalesmanbaldo_r
integer x = 69
integer y = 40
integer width = 1833
string text = "영업사원별 출고, 미출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_oisalesmanbaldo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oisalesmanbaldo_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_oisalesmanbaldo_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_oisalesmanbaldo_r
integer x = 4402
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oisalesmanbaldo_r
integer x = 4018
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

event pb_print::clicked;long ll_count
w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

FOR ll_count = 1 TO dw_2.rowcount()
   dw_2.object.customer_industry_code[ll_count] = st_1.text
	dw_2.object.customer_bus_cord[ll_count] = ist_code.start_date
	dw_2.object.customer_bus_rep[ll_count] = ist_code.end_date
NEXT

l_print.name = 'd_oisalemanbaldo_r2'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 판매거래처별 출고및 미출고 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=75'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oisalesmanbaldo_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_oisalesmanbaldo_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_oisalesmanbaldo_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oisalesmanbaldo_r
integer x = 3826
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
string ls_sdate, ls_edate
string ls_scust, ls_ecust
string ls_sitem, ls_eitem

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
string ls_team, ls_user

debugbreak()

dw_4.AcceptText()

ls_team = dw_4.object.team[1]

//
ls_user = dw_4.Object.user[1]
SELECT user_id INTO :ls_user FROM login WHERE user_name = :ls_user;

ls_sdate = ist_code.start_date
ls_edate = ist_code.end_date

ls_scust = ist_code.start_cust
ls_ecust = ist_code.end_cust

ls_sitem = ist_code.start_no
ls_eitem = ist_code.end_no

IF ls_team = '' or IsNull(ls_team) THEN
	ls_team = '%'
END IF

IF ls_user = '' or IsNull(ls_user) THEN
	ls_user = '%'
END IF

if ist_code.do_flag = 'Y' then // 출고/미출고
	st_1.text = "출고/미출고"
   if ist_code.sel_flag = 'A' then	// 물품범위 전체조회
		if ist_code.order_flag = 'A' then	// 거래처범위 전체조회
		   ls_where = " and sale.open_close       = ~~'O~~'" + &
			           " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			ls_desc = '조건:출고/물품범위전체조회/거래처전체조회 기간:' + ls_sdate+ '-' + ls_edate + ' 조회' 
		else
		   ls_where = " and sale.open_close       = ~~'O~~'" + &
			           " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'"+ &
						  " and sale.cust_no    between ~~'" + ls_scust + "~~' and ~~'" + ls_ecust + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			select cust_name into :ls_custname  from customer where cust_no = :ls_scust;
			select cust_name into :ls_custname1 from customer where cust_no = :ls_ecust;			
			ls_desc = '조건:출고/물품범위전체조회 거래처:' + ls_custname + '-' + ls_custname1 + ' 기간:' + ls_sdate+ '-' + ls_edate + ' 조회' 
		end if
   else // 물품범위 부분조회
		if ist_code.order_flag = 'A' then // 거래처범위 전체조회
		   ls_where = " and sale.open_close       = ~~'O~~'" + &
			           " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'" + &
			           " and saledet.item_no between ~~'" + ls_sitem + "~~' and ~~'" + ls_eitem + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			select item_name into :ls_itemname  from groupitem where item_no = :ls_sitem;
			select item_name into :ls_itemname1 from groupitem where item_no = :ls_eitem;
			ls_desc = '조건:출고/거래처 전체조회 물품범위:' + ls_itemname + '-' + ls_itemname1 + ' 기간:' + ls_sdate+ '-' + ls_edate + ' 조회'
		else
		   ls_where = " and sale.open_close       = ~~'O~~'" + &
			           " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'" + &
			           " and saledet.item_no between ~~'" + ls_sitem + "~~' and ~~'" + ls_eitem + "~~'" + &
						  " and sale.cust_no    between ~~'" + ls_scust + "~~' and ~~'" + ls_ecust + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			select cust_name into :ls_custname  from customer  where cust_no = :ls_scust;
			select cust_name into :ls_custname1 from customer  where cust_no = :ls_ecust;			
			select item_name into :ls_itemname  from groupitem where item_no = :ls_sitem;
			select item_name into :ls_itemname1 from groupitem where item_no = :ls_eitem;			
			ls_desc = '조건:출고 물품범위:' + ls_sitem + '-' + ls_eitem + ' 거래처:' + ls_scust + '-' + ls_ecust + ' 기간:' + ls_sdate+ '-' + ls_edate + ' 조회'
		end if
   end if
	
// 미출고	
else
	st_1.text = "미출고"
   if ist_code.sel_flag = 'A' then // 물품범위전체
		if ist_code.order_flag = 'A' then	// 거래처범위전체
		   ls_where = " and saledet.order_qty     > saledet.rlse_qty " + &
			           " and sale.open_close       = ~~'O~~'" + &
						  " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			ls_desc = '조건:미출고/물품범위전체조회/거래처전체조회 기간:' + ls_sdate+ '-' + ls_edate + ' 조회' 				  
		else	// 거래처 부분조회
		   ls_where = " and saledet.order_qty     > saledet.rlse_qty " + &
			           " and sale.open_close       = ~~'O~~'" + &
						  " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'"	+ &	
						  " and sale.cust_no    between ~~'" + ls_scust + "~~' and ~~'" + ls_ecust + "~~'"+ &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			select cust_name into :ls_custname  from customer where cust_no = :ls_scust;
			select cust_name into :ls_custname1 from customer where cust_no = :ls_ecust;			
			ls_desc = '조건:미출고/물품범위전체조회 거래처:' + ls_custname + '-' + ls_custname1 + ' 기간:' + ls_sdate+ '-' + ls_edate + ' 조회' 
		end if
   else	// 물품범위 부분조회
		if ist_code.order_flag = 'A' then	// 거래처 전체조회
		   ls_where = " and saledet.order_qty     > saledet.rlse_qty " + &
			           " and sale.open_close       = ~~'O~~'" + &
						  " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'" + &
						  " and saledet.item_no between ~~'" + ls_sitem + "~~' and ~~'" + ls_eitem + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			select item_name into :ls_itemname  from groupitem where item_no = :ls_sitem;
			select item_name into :ls_itemname1 from groupitem where item_no = :ls_eitem;
			ls_desc = '조건:미출고/거래처전체조회 물품범위:' + ls_itemname + '-' + ls_itemname1 + ' 기간:' + ls_sdate+ '-' + ls_edate + ' 조회'						  
		else
		   ls_where = " and saledet.order_qty     > saledet.rlse_qty " + &
			           " and sale.open_close       = ~~'O~~'" + &
						  " and convert(char(10),sale.due_date,111) between ~~'" + ls_sdate+ "~~' and ~~'" + ls_edate + "~~'" + &
						  " and saledet.item_no between ~~'" + ls_sitem + "~~' and ~~'" + ls_eitem + "~~'"	+ &	
						  " and sale.cust_no    between ~~'" + ls_scust + "~~' and ~~'" + ls_ecust + "~~'" + &
						  " and login.team_code    like ~~'" + ls_team + "~~'" + &
						  " and customer.salesman  like ~~'" + ls_user + "~~'" 
			select cust_name into :ls_custname  from customer  where cust_no = :ls_scust;
			select cust_name into :ls_custname1 from customer  where cust_no = :ls_ecust;			
			select item_name into :ls_itemname  from groupitem where item_no = :ls_sitem;
			select item_name into :ls_itemname1 from groupitem where item_no = :ls_eitem;			
			ls_desc = '조건:미출고 물품범위:' + ls_sitem + '-' + ls_eitem + ' 거래처:' + ls_scust + '-' + ls_ecust + ' 기간:' + ls_sdate+ '-' + ls_edate + ' 조회'						  
		end if
   end if
end if

ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"
mle_1.text = ls_sql
st_info.text = ls_desc

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_2.modify(ls_sql)
dw_1.sharedata(dw_2)
dw_1.retrieve()
//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	ls_userid = gs_userid
	ls_title  = st_title.text
	gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oisalesmanbaldo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oisalesmanbaldo_r
integer y = 260
integer width = 4581
integer height = 2480
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oisalesmanbaldo_r
integer x = 3799
integer y = 8
integer width = 814
integer height = 208
integer taborder = 0
end type

type st_2 from statictext within w_oisalesmanbaldo_r
integer x = 1943
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

type st_1 from statictext within w_oisalesmanbaldo_r
integer x = 1943
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

type pb_1 from picturebutton within w_oisalesmanbaldo_r
event mousemove pbm_mousemove
integer x = 4210
integer y = 52
integer width = 187
integer height = 144
integer taborder = 30
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

event clicked;string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long ll_cnt

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

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

type dw_4 from datawindow within w_oisalesmanbaldo_r
integer x = 2318
integer y = 24
integer width = 1115
integer height = 196
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oisalemanbaldo_h"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String ls_team, ls_user

dw_4.AcceptText()

choose case dwo.name
	case 'team'
		ls_team  =  this.Object.team[1]

		IF ls_team <> '' THEN
			dw_4.Object.user[1] = ''
		END IF
	case 'user'
		ls_user  =  this.Object.user[1]

		IF ls_user <> '' THEN
			dw_4.Object.team[1] = ''
		END IF
	
end choose

end event

type st_info from statictext within w_oisalesmanbaldo_r
integer x = 59
integer y = 228
integer width = 4521
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "none"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_oisalesmanbaldo_r
integer x = 837
integer y = 688
integer width = 3319
integer height = 1640
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_oisalesmanbaldo_r
integer x = 3451
integer y = 144
integer width = 306
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "SQL"
end type

event clicked;if this.checked = true then
	mle_1.visible = true
else
	mle_1.visible = false
end if
end event

