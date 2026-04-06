$PBExportHeader$w_oisalesmanbaldo_r.srw
$PBExportComments$영업사원별 출고/미출고 현황(2009/05)
forward
global type w_oisalesmanbaldo_r from w_inheritance
end type
type pb_1 from picturebutton within w_oisalesmanbaldo_r
end type
type st_5 from statictext within w_oisalesmanbaldo_r
end type
type ddlb_fld from dropdownlistbox within w_oisalesmanbaldo_r
end type
type st_6 from statictext within w_oisalesmanbaldo_r
end type
type sle_value from singlelineedit within w_oisalesmanbaldo_r
end type
type cb_1 from commandbutton within w_oisalesmanbaldo_r
end type
type cb_2 from commandbutton within w_oisalesmanbaldo_r
end type
type cb_3 from commandbutton within w_oisalesmanbaldo_r
end type
type cb_5 from commandbutton within w_oisalesmanbaldo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oisalesmanbaldo_r
end type
type st_3 from statictext within w_oisalesmanbaldo_r
end type
type dw_area from datawindow within w_oisalesmanbaldo_r
end type
type st_7 from statictext within w_oisalesmanbaldo_r
end type
type cbx_team from checkbox within w_oisalesmanbaldo_r
end type
type dw_sales from datawindow within w_oisalesmanbaldo_r
end type
type st_4 from statictext within w_oisalesmanbaldo_r
end type
type em_1 from editmask within w_oisalesmanbaldo_r
end type
type em_2 from editmask within w_oisalesmanbaldo_r
end type
type st_8 from statictext within w_oisalesmanbaldo_r
end type
type dw_cust from datawindow within w_oisalesmanbaldo_r
end type
type ddlb_op from dropdownlistbox within w_oisalesmanbaldo_r
end type
type pb_openclose from picturebutton within w_oisalesmanbaldo_r
end type
type st_1 from statictext within w_oisalesmanbaldo_r
end type
type gb_4 from groupbox within w_oisalesmanbaldo_r
end type
end forward

global type w_oisalesmanbaldo_r from w_inheritance
integer y = 112
integer width = 5550
integer height = 2576
string title = "영업사원별 미출고 현황(w_oisalesmanbaldo_r)"
pb_1 pb_1
st_5 st_5
ddlb_fld ddlb_fld
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
st_3 st_3
dw_area dw_area
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_4 st_4
em_1 em_1
em_2 em_2
st_8 st_8
dw_cust dw_cust
ddlb_op ddlb_op
pb_openclose pb_openclose
st_1 st_1
gb_4 gb_4
end type
global w_oisalesmanbaldo_r w_oisalesmanbaldo_r

type variables
string is_dw, is_sale_flag, is_itemdosql, is_itemdorsql, is_ret
gs_itembaldo_str ist_code

datawindowchild idwc_area, idwc_user, idwc_cust

end variables

on w_oisalesmanbaldo_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_3=create st_3
this.dw_area=create dw_area
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_4=create st_4
this.em_1=create em_1
this.em_2=create em_2
this.st_8=create st_8
this.dw_cust=create dw_cust
this.ddlb_op=create ddlb_op
this.pb_openclose=create pb_openclose
this.st_1=create st_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.dw_area
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.cbx_team
this.Control[iCurrent+15]=this.dw_sales
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.em_1
this.Control[iCurrent+18]=this.em_2
this.Control[iCurrent+19]=this.st_8
this.Control[iCurrent+20]=this.dw_cust
this.Control[iCurrent+21]=this.ddlb_op
this.Control[iCurrent+22]=this.pb_openclose
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.gb_4
end on

on w_oisalesmanbaldo_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.st_3)
destroy(this.dw_area)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.ddlb_op)
destroy(this.pb_openclose)
destroy(this.st_1)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")

dw_2.visible  = false


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
dw_cust.insertrow(0)  

dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
if GF_Permission("영업사원별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("영업사원별 미출고현황(ALL)", gs_userid) = "Y" then
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

if GF_Permission("영업사원별 미출고현황(수주마감)", gs_userid) = "Y" then
	pb_openclose.visible = true
	pb_close.x =  4635
	gb_1.width = 1019		
else
	pb_openclose.visible = false
     dw_1.object.open_close.visible = false
	pb_close.x =  4443
	gb_1.width = 830	
end if

dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_oisalesmanbaldo_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_oisalesmanbaldo_r
integer x = 27
integer y = 420
integer width = 4649
integer height = 2016
integer taborder = 50
string dataobject = "d_oisalemanbaldo_r"
end type

event dw_1::clicked;call super::clicked;//
is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type st_title from w_inheritance`st_title within w_oisalesmanbaldo_r
integer x = 0
integer y = 0
integer width = 1682
integer height = 140
string text = "영업사원별 미출고현황(NEW)"
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
integer x = 4635
integer y = 56
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oisalesmanbaldo_r
integer x = 4059
integer y = 56
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

event pb_print::clicked;long       ll_count
w_repsuper w_print
st_print   l_print

if dw_2.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.name = 'd_oisalemanbaldo_r2'
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 판매거래처별 출고및 미출고 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=75'
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
integer x = 3867
integer y = 56
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
string ls_area, ls_custno, ls_sdate, ls_edate, ls_salesman, ls_team

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

// 거래처
dw_cust.accepttext()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if

// 담당자
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]

// 사업장
dw_area.accepttext()
ls_area  = trim(dw_area.object.area[1])
ls_area  = LeftA(ls_area,1) + "%"

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 팀
if cbx_team.checked = true then
	ls_team = "%"
else
	ls_team = "N"
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

debugbreak()

dw_1.SetRedraw(FALSE)
dw_1.sharedata(dw_2)
dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_salesman, ls_team )
dw_1.SetRedraw(TRUE)

if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   RETURN
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oisalesmanbaldo_r
integer x = 1746
integer y = 0
integer width = 960
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oisalesmanbaldo_r
integer x = 27
integer y = 244
integer width = 4649
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oisalesmanbaldo_r
integer x = 3840
integer y = 0
integer width = 1019
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oisalesmanbaldo_r
integer x = 41
integer y = 172
integer width = 101
integer height = 72
integer taborder = 0
string dataobject = "d_oisalemanbaldo_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type pb_1 from picturebutton within w_oisalesmanbaldo_r
event mousemove pbm_mousemove
integer x = 4251
integer y = 56
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_cnt = dw_1.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		end if
	end if
end if	

end event

type st_5 from statictext within w_oisalesmanbaldo_r
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_oisalesmanbaldo_r
integer x = 270
integer y = 296
integer width = 448
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

type st_6 from statictext within w_oisalesmanbaldo_r
integer x = 741
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

type sle_value from singlelineedit within w_oisalesmanbaldo_r
integer x = 1230
integer y = 304
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

type cb_1 from commandbutton within w_oisalesmanbaldo_r
integer x = 1801
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
end if	

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oisalesmanbaldo_r
integer x = 1966
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
end if	

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oisalesmanbaldo_r
integer x = 2130
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
end if	

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oisalesmanbaldo_r
integer x = 2295
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
end if	

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_oisalesmanbaldo_r
integer x = 311
integer y = 308
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

type st_3 from statictext within w_oisalesmanbaldo_r
integer x = 1774
integer y = 44
integer width = 283
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

type dw_area from datawindow within w_oisalesmanbaldo_r
integer x = 2062
integer y = 44
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

type st_7 from statictext within w_oisalesmanbaldo_r
integer x = 2752
integer y = 132
integer width = 297
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
string text = "담당자팀"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oisalesmanbaldo_r
integer x = 3058
integer y = 148
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

type dw_sales from datawindow within w_oisalesmanbaldo_r
integer x = 3131
integer y = 128
integer width = 329
integer height = 84
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

event itemchanged;// 담당자
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

if GF_Permission("영업사원별 미출고현황(ALL)", gs_userid) = "Y" then
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

type st_4 from statictext within w_oisalesmanbaldo_r
integer x = 2752
integer y = 44
integer width = 297
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
string text = "납기기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oisalesmanbaldo_r
integer x = 3054
integer y = 44
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

type em_2 from editmask within w_oisalesmanbaldo_r
integer x = 3419
integer y = 44
integer width = 357
integer height = 80
integer taborder = 30
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

type st_8 from statictext within w_oisalesmanbaldo_r
integer x = 1774
integer y = 132
integer width = 283
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_oisalesmanbaldo_r
integer x = 2062
integer y = 132
integer width = 617
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type ddlb_op from dropdownlistbox within w_oisalesmanbaldo_r
integer x = 919
integer y = 296
integer width = 302
integer height = 500
integer taborder = 190
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

type pb_openclose from picturebutton within w_oisalesmanbaldo_r
integer x = 4443
integer y = 56
integer width = 187
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주마감"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;long   i, l_rowcount, l_row
string ls_origin_open_close, ls_open_close, ls_order_no

dw_1.accepttext()

l_rowcount = dw_1.rowcount()

l_row = 0

for i = 1 to l_rowcount
	
	ls_open_close = dw_1.object.open_close[i]
	ls_origin_open_close = dw_1.object.origin_open_close[i]
	ls_order_no = dw_1.object.sale_order_no[i]	
	
	if ls_open_close = 'C' and ls_origin_open_close <> 'C' then	
		
		update sale
				set open_close = 'C'
		where order_no = :ls_order_no;
		
		l_row++

	end if

next

pb_retrieve.triggerevent(clicked!)

//pb_retrieve.PostEvent(Clicked!)

messagebox('알림',  string(l_row) + '건 수주를 마감했습니다.' )
end event

type st_1 from statictext within w_oisalesmanbaldo_r
integer x = 2661
integer y = 308
integer width = 2789
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 255
long backcolor = 67108864
string text = "※생산계획진행이 ~"생산계획중~"인건의 마감은 생산담당자와 꼭 협의하시기 바랍니다."
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_oisalesmanbaldo_r
integer x = 2725
integer width = 1088
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

