$PBExportHeader$w_mpsfcrel_m.srw
$PBExportComments$작업지시서 발행(1998/05/08, 이인호)
forward
global type w_mpsfcrel_m from w_inheritance
end type
type dw_4 from datawindow within w_mpsfcrel_m
end type
type tab_1 from tab within w_mpsfcrel_m
end type
type tabpage_1 from userobject within tab_1
end type
type st_3 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type cb_6 from commandbutton within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_3 st_3
st_1 st_1
cb_6 cb_6
cb_5 cb_5
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type st_vertical2 from u_splitbar_vertical within tabpage_2
end type
type dw_7 from datawindow within tabpage_2
end type
type cbx_3 from checkbox within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_vertical2 st_vertical2
dw_7 dw_7
cbx_3 cbx_3
cb_1 cb_1
dw_6 dw_6
end type
type tab_1 from tab within w_mpsfcrel_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_5 from datawindow within w_mpsfcrel_m
end type
type rb_1 from radiobutton within w_mpsfcrel_m
end type
type rb_2 from radiobutton within w_mpsfcrel_m
end type
type cbx_1 from checkbox within w_mpsfcrel_m
end type
type em_1 from editmask within w_mpsfcrel_m
end type
type dw_area from datawindow within w_mpsfcrel_m
end type
type st_2 from statictext within w_mpsfcrel_m
end type
type st_vertical from u_splitbar_vertical within w_mpsfcrel_m
end type
type cbx_2 from checkbox within w_mpsfcrel_m
end type
type gb_4 from groupbox within w_mpsfcrel_m
end type
type gb_5 from groupbox within w_mpsfcrel_m
end type
end forward

global type w_mpsfcrel_m from w_inheritance
integer width = 5303
integer height = 4236
string title = "작업지시서 발행(w_mpsfcrel_m)"
dw_4 dw_4
tab_1 tab_1
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
cbx_1 cbx_1
em_1 em_1
dw_area dw_area
st_2 st_2
st_vertical st_vertical
cbx_2 cbx_2
gb_4 gb_4
gb_5 gb_5
end type
global w_mpsfcrel_m w_mpsfcrel_m

type variables
st_print i_print
string is_wcno, is_mess, is_select, is_itemsql
date   id_date

DataWindowChild idwc_wc, idwc_qa, idwc_item
DataWindow dw3, dw6, dw7

end variables

forward prototypes
public subroutine wf_sfcrel_insert (string as_fact, string as_order_no, string as_work_name)
end prototypes

public subroutine wf_sfcrel_insert (string as_fact, string as_order_no, string as_work_name);long   i, ll_cnt , ll_row , ll_dw1row, l_row
string ls_cust, ls_scene, ls_orderno, ls_overtime, ls_remark, ls_wc 

if dw3.accepttext( ) = -1 then return

// 지시내역
ll_cnt = dw3.rowcount()
if isnull(dw_4.getrow()) OR dw_4.getrow() < 1 then 
	MessageBox("확인","작업지시번호를 선택하시기 바랍니다.")
	dw_4.setfocus()
end if

ls_orderno = as_order_no

SELECT overtime, rem INTO :ls_overtime, :ls_remark FROM mpsorder WHERE order_no = :ls_orderno;
 
for ll_row = 1 to ll_cnt step 10
	ll_dw1row = dw_1.insertrow(0)

	dw_1.object.start_date[ll_dw1row] = datetime(id_date)
	dw_1.object.orderno[ll_dw1row]    = "*" + ls_orderno + "*"
	dw_1.object.orderno1[ll_dw1row]   = "*" + ls_orderno + "*"
	dw_1.object.orderno2[ll_dw1row]   = ls_orderno
	dw_1.object.overtime[ll_dw1row]   = ls_overtime
	dw_1.object.remark[ll_dw1row]     = ls_remark
	dw_1.object.work_name[ll_dw1row]  = as_work_name

	dw_1.object.work_manager[ll_dw1row] = dw3.object.wc_work_manager[ll_row]
	
	for i = 1 to 10
		ls_cust  = trim(dw3.object.customer_cust_name[ll_row + i - 1])
		ls_scene = trim(dw3.object.scene_scene_desc[ll_row + i - 1])
		ls_wc 	= trim(dw3.object.wc_no[ll_row + i - 1])
		if isnull(ls_cust)  then ls_cust  = ''
		if isnull(ls_scene) then ls_scene = ''
	
		dw_1.setitem(ll_dw1row, 'seq'+string(i),dw3.object.order_seq[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'desc'+string(i),dw3.object.mpsdet_rem[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'qa'+string(i),dw3.object.qa[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'name'+string(i),dw3.object.groupitem_item_name[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'uom'+string(i),dw3.object.uom[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'qty'+string(i),dw3.object.order_qty[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'c'+string(i),dw3.object.color_color_name[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'cust'+string(i),ls_cust + ls_scene)
		
		dw_1.setitem(ll_dw1row, 'saleno'+string(i),dw3.object.sale_no[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'muom'+string(i),dw3.object.mpsdet_uom[ll_row + i - 1])
		dw_1.setitem(ll_dw1row, 'utong_yn'+string(i),dw3.object.utong_yn[ll_row + i - 1])
		
		if as_fact = '1' then
			dw_1.setitem(ll_dw1row, 'planq'+string(i),gf_getqty(dw3.object.item_no[ll_row + i - 1], &
																					dw3.object.qa[ll_row + i - 1], &
																					dw3.object.mpsdet_uom[ll_row + i - 1], &
																					dw3.object.order_qty[ll_row + i - 1]))																	
		else
			dw_1.setitem(ll_dw1row, 'planq'+string(i),dw3.object.rcpt_qty[ll_row + i - 1])
		end if
	
		if LeftA(ls_wc,1) = 'U' then
			dw_1.setitem(ll_dw1row, 'paint_name'+string(i),dw3.object.etc01[ll_row + i - 1] + ' ' + dw3.object.etc02[ll_row + i - 1])			
		else
			dw_1.setitem(ll_dw1row, 'paint_name'+string(i),dw3.object.paint_company[ll_row + i - 1] + ' ' + dw3.object.paint_name[ll_row + i - 1])
		end if		
		
		
		dw_1.setitem(ll_dw1row, 'cmplt_dt'+string(i),dw3.object.cmplt_dt[ll_row + i - 1])
		
		if ll_cnt < ll_row + i then return
	next
next

RETURN

end subroutine

on w_mpsfcrel_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.tab_1=create tab_1
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_1=create cbx_1
this.em_1=create em_1
this.dw_area=create dw_area
this.st_2=create st_2
this.st_vertical=create st_vertical
this.cbx_2=create cbx_2
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.dw_area
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_vertical
this.Control[iCurrent+11]=this.cbx_2
this.Control[iCurrent+12]=this.gb_4
this.Control[iCurrent+13]=this.gb_5
end on

on w_mpsfcrel_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.tab_1)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_1)
destroy(this.em_1)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_vertical)
destroy(this.cbx_2)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;string ls_sql, ls_item, ls_where, ls_sqlerrtext
long   l_length

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(tab_1)
st_vertical.of_set_minsize(250, 250)

tab_1.tabpage_2.st_vertical2.of_set_leftobject(tab_1.tabpage_2.dw_7)
tab_1.tabpage_2.st_vertical2.of_set_rightobject(tab_1.tabpage_2.dw_6)
tab_1.tabpage_2.st_vertical2.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

dw3 = tab_1.tabpage_1.dw_3
dw6 = tab_1.tabpage_2.dw_6
dw7 = tab_1.tabpage_2.dw_7
dw3.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)

dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw3.getchild("paint_item", idwc_item)
idwc_item.insertrow(0)
idwc_item.settransobject(sqlca)
is_itemsql = idwc_item.describe("datawindow.table.select")

DECLARE item_paint_cur CURSOR FOR
select distinct item.item_no
from item inner join groupitem on item.item_no = groupitem.item_no
where groupitem.p4 = '0'
AND ITEM.USE_FLAG = 'Y';


	OPEN item_paint_cur;
		
			FETCH item_paint_cur INTO :ls_item;
		
			Do While sqlca.sqlcode = 0
		
				ls_where = ls_where + "~~'"+ ls_item + "~~', "
			
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = string(sqlca.sqlerrtext)
					ROLLBACK;				
					MessageBox('오류32','[item_stock] item_stock중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
					RETURN 0
				end if					 
			
					
				FETCH item_paint_cur INTO :ls_item;
					
			Loop
		
		CLOSE item_paint_cur;

l_length = LenA(ls_where)		
		
if trim( MidA(ls_where, l_length -1, 2) ) = ',' then
	ls_where = MidA(ls_where, 1, l_length - 2 )	
end if 


ls_sql =   "  SELECT distinct groupitem.item_no,   " +&
			"           groupitem.uom,   "		   +&			
			"           groupitem.source,   " 	   +&
			"           groupitem.item_name  "    +&
			"      FROM groupitem  "                +&
			"     WHERE groupitem.use_flag <> ~~'C~~' " 

ls_where = " and groupitem.item_no in ( " + ls_where + " )"

ls_sql =  "datawindow.table.select = '" + ls_sql + ls_where + "'"

idwc_item.modify(ls_sql)
idwc_item.retrieve()

dw3.getchild('paint_qa',idwc_qa)
idwc_qa.insertrow(0)
idwc_qa.SetTransObject(SQLCA)
is_select = idwc_qa.Describe("DataWindow.Table.Select")
//gs_ds_qaall.ShareData(idwc_qa)


dw_1.visible = false
dw_5.visible = false
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)

em_1.text = string(today(), "YYYY/MM/DD")
id_date   = date(string(today(), "YYYY/MM/DD"))
is_mess   = "오늘 일자에는  "

pb_insert.postevent(clicked!)


/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wc1

// 작업 필터링
dw_2.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "area_no = '" + gs_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

dw_2.setitem( 1, "wc_no", "")
dw_2.setfocus()

end event

event resize;call super::resize;//
long  ll_width, ll_height

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_4.height = newheight - dw_4.y - gb_2.x 

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

tab_1.x      = st_vertical.x + st_vertical.width
tab_1.width  = newwidth  - tab_1.x - gb_2.x
tab_1.height = newheight - tab_1.y - gb_2.x

// Tab
ll_width  = tab_1.tabpage_1.width
ll_height = tab_1.tabpage_1.height

// 지시내역
tab_1.tabpage_1.dw_3.width  = ll_width  - tab_1.tabpage_1.dw_3.x
tab_1.tabpage_1.dw_3.height = ll_height - tab_1.tabpage_1.dw_3.y - tab_1.tabpage_1.dw_3.x

// 미지시내역
tab_1.tabpage_2.dw_7.height = ll_height - tab_1.tabpage_2.dw_7.y - tab_1.tabpage_2.dw_7.x

tab_1.tabpage_2.st_vertical2.x      = tab_1.tabpage_2.dw_7.width
tab_1.tabpage_2.st_vertical2.y      = tab_1.tabpage_2.dw_7.y
tab_1.tabpage_2.st_vertical2.height = tab_1.tabpage_2.dw_7.height

tab_1.tabpage_2.dw_6.x      = tab_1.tabpage_2.st_vertical2.x + tab_1.tabpage_2.st_vertical2.width
tab_1.tabpage_2.dw_6.width  = ll_width  - tab_1.tabpage_2.st_vertical2.x + tab_1.tabpage_2.st_vertical2.width
tab_1.tabpage_2.dw_6.height = tab_1.tabpage_2.dw_7.height

end event

type pb_save from w_inheritance`pb_save within w_mpsfcrel_m
integer x = 4219
integer y = 56
integer taborder = 40
end type

event pb_save::clicked;call super::clicked;date    ld_date
long    ll_row
integer li_num
string  ls_date, ls_num, ls_like, ls_order, ls_area, ls_flag, ls_loc, ls_remcolor

dw3.accepttext()
dw_2.accepttext()
if dw3.rowcount()  < 1 then RETURN
if dw_2.rowcount() < 1 then RETURN

ls_order = dw_2.object.order_no[1]		// 지시번호
ls_flag  = trim(dw_2.object.wc_no[1])	// 작업장
if isnull(ls_flag) or ls_flag = '' then
	MessageBox("확인","작업장을 선택하십시요")
	dw_2.setcolumn('wc_no')
	dw_2.setfocus()
	RETURN
end if

if isnull(ls_order) or trim(ls_order) = "" then
	ls_area = LeftA(dw_area.object.area[1],1)
	ls_flag = trim(dw_2.object.wc_no[1])
	ls_date = string(dw_2.object.order_date[1],"yyyymmdd")
	ls_like = ls_area + ls_flag + ls_date + "%"
	SELECT max(order_no) INTO :ls_order FROM mpsorder  WHERE order_no  LIKE :ls_like;
	if sqlca.sqlcode < 0 then
		MessageBox("오류","수행중 오류가 발생했습니다.",exclamation!)
		return
	else
		if isnull(ls_order) then
			ls_order = ls_area + ls_flag + ls_date + "-01"
		else
			ls_order = trim(ls_order)
			li_num   = integer(RightA(ls_order,2))
			li_num++
			ls_num   = RightA("000" + string(li_num),2)
			ls_order = ls_area + ls_flag + ls_date + "-" + ls_num
		end if
	end if
end if

//////////////////////////////////////////////////////////////////////////////////
// mpsdet 중복 작업지시 체크
//////////////////////////////////////////////////////////////////////////////////
// mpsdet 중복 작업지시 방지 해야함(현장과 사무실 동일화면 작업시 발생함) //
// 작업장, 수주번호, 수주순번, 품목, 규격, 지시수량, 주문수량, 색상, 비고 
string ls_dw3_wcno,  ls_dw3_saleno,     ls_dw3_item, ls_dw3_qa, ls_dw3_color
string ls_dw3_bigo,  ls_mpsorder_order, ls_division, ls_openclose,  ls_remsale
long   ll_dw3_seqno, ll_dw3_orderqty,   ll_findcnt,  ll_orderqty,   ll_rlseqty

for ll_row = 1 to dw3.rowcount()                                                                  
	ls_dw3_wcno     = dw_2.object.wc_no[1]
	ls_dw3_saleno   = dw3.object.sale_no[ll_row]
	ll_dw3_seqno    = dw3.object.seq_no[ll_row]
	ls_dw3_item     = dw3.object.item_no[ll_row]
	ls_dw3_qa       = dw3.object.qa[ll_row]
	ll_dw3_orderqty = dw3.object.order_qty[ll_row]
	ls_dw3_color    = dw3.object.item_color[ll_row]
	ls_dw3_bigo     = dw3.object.mpsdet_rem[ll_row] 
	//////////////////////////////////////////////////////
	// 작업지시서 확정시 '수주마감 유무, 출고유무' 체크
	//////////////////////////////////////////////////////
	SELECT 
		b.open_close,  a.order_qty,  a.rlse_qty,  a.rem
	INTO 
		:ls_openclose, :ll_orderqty, :ll_rlseqty, :ls_remsale
	FROM 
		saledet a LEFT OUTER JOIN sale b ON a.order_no = b.order_no
	WHERE 	
		a.order_no = :ls_dw3_saleno AND a.seq_no = :ll_dw3_seqno
	using sqlca;
	
	if ls_openclose = "O" then 				// 마감:C, 오픈:O
		if ll_rlseqty = ll_orderqty then		// 출고됨(출고수량 = 주문수량)
			/* 2018.11.21 JOWONSUK 출고수량과 주문수량이 동일할지라도 작업지시서를 등록할 수 있도록 수정 */
			IF MessageBox("확인", "[" + string(ll_row) + "행 출고된 수량과 주문수량이 동일 합니다." + &
								"작업을 계속 진행 하시겠습니까?", Exclamation!, OKCancel!, 2)	= 2 THEN		
				RETURN
			END IF
			
		else
			// 작업지시서 발행 가능
			if ls_flag = "P01" OR ls_flag = "P02" then  // 도장1,2호기 이면
				if ls_dw3_bigo <> ls_remsale then
					if MessageBox("확인", "[" + string(ll_row) + "행 비고(색상)이 변경 되었습니다." + &
								  "작업을 계속 진행 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
						RETURN
					end if
				end if
			end if
		end if
   else
		if LeftA(ls_dw3_saleno,3) = "SNO" OR LeftA(ls_dw3_saleno,3) = "TNO" OR LeftA(ls_dw3_saleno,3) = "BNO"  then 	// 재고임의생산은 SKIP 
		 																																		// 2018.11.21 JOWONSUK BNO 추가
		else
			MessageBox("확인", "[" + ls_dw3_saleno + " 수주마감 되었습니다.",Exclamation!)
			RETURN
		end if
   end if

	//////////////////////////////////////////////////////
   // mpsdet 중복 작업지시 체크 => bkkim 2024.12.12 김승민 과장 협의 후 주석처리
	//////////////////////////////////////////////////////
//	if ls_flag = "P01" OR ls_flag = "P02" then  // 도장1,2호기 이면
//		SELECT mpsorder_order 
//		INTO :ls_mpsorder_order 
//		  FROM MPSDET
//		 WHERE wc_no      = :ls_dw3_wcno  AND sale_no = :ls_dw3_saleno  AND seq_no    = :ll_dw3_seqno
//			AND item_no    = :ls_dw3_item  AND qa      = :ls_dw3_qa      AND order_qty = :ll_dw3_orderqty
//			AND item_color = :ls_dw3_color AND rem     = :ls_dw3_bigo;
//		if ls_mpsorder_order <> "" then
//			if MessageBox("확인", "[" + STRING(ll_row) + "행 " + ls_mpsorder_order + "] 중복된 작업 지시서 입니다.~n~n" + &
//			              "작업실적 처리시 오류가 발생할 수 도 있습니다.~n~n" + &
//							  "작업을 계속 진행 하시겠습니까?(도장1,2호기만 중복체크)",Exclamation!, OKCancel!, 2) = 2 then
//				RETURN
//			end if
//		end if
//	end if
next                                                                                              
//////////////////////////////////////////////////////////////////////////////////

dw_2.object.order_no[1] = ls_order
for ll_row = 1 to dw3.rowcount()
	dw3.SetItemStatus(ll_row, 0, Primary!, DataModified!)
	dw3.object.order_seq[ll_row]      = ll_row
	dw3.object.mpsorder_order[ll_row] = ls_order
next

dw_2.accepttext()
dw3.accepttext()
if wf_update2(dw_2, dw3, 'Y') = true then
	pb_retrieve.postevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
end event

type dw_1 from w_inheritance`dw_1 within w_mpsfcrel_m
integer x = 823
integer y = 16
integer width = 101
integer height = 76
integer taborder = 60
string title = "생산목표  및  실적"
string dataobject = "d_mpsfcrel_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsfcrel_m
integer x = 37
integer y = 28
integer width = 1111
integer height = 136
string text = "작업지시서 발행"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcrel_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcrel_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcrel_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_mpsfcrel_m
integer x = 4411
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcrel_m
integer x = 2213
integer y = 56
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print
string   ls_area, ls_order, ls_fact, ls_sfcrel, ls_order_no, ls_work_name
long     ll_row, ll_row1, l_row
datetime ldt_date

dw_area.accepttext()
ls_area = dw_area.object.area[1]

dw_2.accepttext()
if dw_2.rowcount() < 1 then RETURN

// MPSFCREL_SORT
SELECT item_cd INTO :ls_sfcrel FROM codemst WHERE type = '작업지시_순서도' AND use_yn = 'Y';

is_wcno = dw_2.object.wc_no[1]

// 작업지시서
if rb_1.checked = True then	
	
	/*2019.06.04 jowonsuk 연속출력 반영 작업 */
	
	
	if cbx_2.checked then		
		
		for ll_row = 1 to dw_4.rowcount()
			
			if dw_4.isselected(ll_row) then
		
				ls_order = dw_4.object.order_no[ll_row]
				dw_2.retrieve(ls_order)				
				dw3.retrieve(ls_order)		
				
				if dw3.rowcount() > 0 then 
			
					if ls_sfcrel = "MPSFCREL_SORT" then
						if is_wcno > "F00" AND is_wcno <= "F99" then
							ldt_date = datetime(date(em_1.text), time("00:00:00.000"))
							
							SELECT count(*) INTO :ll_row FROM mpsorder_sort WHERE order_date = :ldt_date AND wc_no = :is_wcno;
							if ll_row > 0 then
							else
								MessageBox("확인","F01 - F99작업장~n~n'작업지시 순서도'를 작성하시기 바랍니다.")
								RETURN
							end if
						end if
					end if
				
					SELECT fact_wc INTO :ls_fact FROM wc WHERE work_no = :is_wcno;
					
					if ls_area = 'B0001' OR ls_area = 'T0001' then
						ls_fact = 'B'
						dw_1.dataobject = 'd_mpsfcrel_r3' 		// 생산수량 입력 가능(생산계획 번호 있음).
					else
						if ls_fact = '1'  then
							dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
						else
							dw_1.dataobject = 'd_mpsfcrel_r3'  	// 생산수량 입력 가능(생산계획 번호 있음).
						end if
					end if	
					dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
					dw_1.SetTransObject(SQLCA)
				
					// ls_fact( B: 반월, T: 화성 )
					 ls_order_no = dw_4.object.order_no[ll_row]
					 ls_work_name  = dw_4.object.wc_work_name[ll_row]
						WF_SFCREL_Insert(ls_fact, ls_order_no, ls_work_name)				
				
					if gs_userid = "msy01" then
							dw_1.modify("DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95")
					else
							dw_1.modify("DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100")
					end if
					
					dw_1.print()
					
				end if 
				
			end if	
		next
		
	else
		
		if dw3.rowcount() < 1 then RETURN
	
		if ls_sfcrel = "MPSFCREL_SORT" then
			if is_wcno > "F00" AND is_wcno <= "F99" then
				ldt_date = datetime(date(em_1.text), time("00:00:00.000"))
				
				SELECT count(*) INTO :ll_row FROM mpsorder_sort WHERE order_date = :ldt_date AND wc_no = :is_wcno;
				if ll_row > 0 then
				else
					MessageBox("확인","F01 - F99작업장~n~n'작업지시 순서도'를 작성하시기 바랍니다.")
					RETURN
				end if
			end if
		end if
	
		SELECT fact_wc INTO :ls_fact FROM wc WHERE work_no = :is_wcno;
		
		if ls_area = 'B0001' OR ls_area = 'T0001' then
			ls_fact = 'B'
			dw_1.dataobject = 'd_mpsfcrel_r3' 		// 생산수량 입력 가능(생산계획 번호 있음).
		else
			if ls_fact = '1'  then
				dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
			else
				dw_1.dataobject = 'd_mpsfcrel_r3'  	// 생산수량 입력 가능(생산계획 번호 있음).
			end if
		end if	
		dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
		dw_1.SetTransObject(SQLCA)
	
		// ls_fact( B: 반월, T: 화성 )		
		ls_order_no = dw_4.object.order_no[dw_4.getrow()]
		ls_work_name  = dw_4.object.wc_work_name[dw_4.getrow()]		
//		WF_SFCREL_Insert(ls_fact)
		WF_SFCREL_Insert(ls_fact, ls_order_no, ls_work_name)
		
		i_print.st_datawindow  = dw_1
		i_print.st_print_sheet = " 프린트용지 : A4"
		i_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획내역을 출력합니다." 
		
		if gs_userid = "msy01" then
			gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95'
		else
			gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
		end if
		
		OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)	
		
	end if
	
//	if dw3.rowcount() < 1 then RETURN
//
//	if ls_sfcrel = "MPSFCREL_SORT" then
//		if is_wcno > "F00" AND is_wcno <= "F99" then
//			ldt_date = datetime(date(em_1.text), time("00:00:00.000"))
//			
//			SELECT count(*) INTO :ll_row FROM mpsorder_sort WHERE order_date = :ldt_date AND wc_no = :is_wcno;
//			if ll_row > 0 then
//			else
//				MessageBox("확인","F01 - F99작업장~n~n'작업지시 순서도'를 작성하시기 바랍니다.")
//				RETURN
//			end if
//		end if
//	end if
//
//	SELECT fact_wc INTO :ls_fact FROM wc WHERE work_no = :is_wcno;
//	
//	if ls_area = 'B0001' OR ls_area = 'T0001' then
//		ls_fact = 'B'
//		dw_1.dataobject = 'd_mpsfcrel_r3' 		// 생산수량 입력 가능(생산계획 번호 있음).
//	else
//		if ls_fact = '1'  then
//			dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
//		else
//			dw_1.dataobject = 'd_mpsfcrel_r3'  	// 생산수량 입력 가능(생산계획 번호 있음).
//		end if
//	end if	
//	dw_1.dataobject = 'd_mpsfcrel_r'		// 생산수량 입력 불가능.
//	dw_1.SetTransObject(SQLCA)
//
//	// ls_fact( B: 반월, T: 화성 )
//	WF_SFCREL_Insert(ls_fact)
//	
//	i_print.st_datawindow  = dw_1
//	i_print.st_print_sheet = " 프린트용지 : A4"
//	i_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획내역을 출력합니다." 
//	
//	if gs_userid = "msy01" then
//		gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95'
//	else
//		gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//	end if
//	
//	OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)
	
// 공정이동식별표
elseif rb_2.checked = True then		
	ls_order = dw_4.object.order_no[dw_4.getrow()]
	
	dw_5.retrieve( ls_order )
	
	if dw_5.rowcount() < 1 then RETURN
	
	i_print.st_datawindow  = dw_5
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 공정 이동 식별표를 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcrel_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcrel_m
integer x = 4027
integer y = 56
integer taborder = 170
end type

event pb_delete::clicked;call super::clicked;long   ll_row, ll_cnt, l_pop_status
string ls_order

dw3.accepttext()
if messagebox("확인", "작업지시내역을 삭제하시겠습니까", Exclamation!, OKCancel!, 2) = 2 then return
if dw3.rowcount() < 1 then return

setnull(ls_order)
setnull(ll_cnt)

l_pop_status = 0 /* jowonsuk 2019.05.13 for문을 돌고도 0이면 이건 삭제가능, 1이면 전송완료건이 있으므로 삭제 불가*/

for ll_row = 1 to dw3.rowcount()
	/*2019.05.02 jowonsuk pop_status 추가 1:pop전송전, 2:pop전송완료,  3:pop반송 */
	if dw3.object.pop_status[ll_row] <> '2' then						/*2019.05.02 jowonsuk pop_status 추가 1:pop전송전일때만 삭제 가능  */
		dw3.object.order_seq[ll_row]      = ll_cnt
		dw3.object.mpsorder_order[ll_row] = ls_order
	else
		l_pop_status = 1
	end if
next

if l_pop_status = 0 then

	if dw_4.object.sfcday_count[dw_4.getrow()] > 0 then
		messagebox('오류', '작업일보에 등록되어 있습니다..~r~n' &
								+ '작업지시를 삭제할 수 없습니다.',exclamation!)			
	else	
		dw_2.deleterow(1)
		dw_2.accepttext()
		dw3.accepttext()
		if wf_update2(dw_2,dw3, 'Y') = true then
			pb_insert.triggerevent(clicked!)
			pb_retrieve.postevent(clicked!)
		end if		
	end if		
else
	messagebox('오류', 'pop작업지시된상태입니다.~r~n' &
							+ '반송후 작업하십시요',exclamation!)	
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpsfcrel_m
integer x = 3835
integer y = 56
integer taborder = 180
end type

event pb_insert::clicked;call super::clicked;//
dw_2.reset()
dw3.reset()
dw_4.reset()
dw6.reset()
dw7.reset()

cbx_1.checked = false // 추가 지시

// MPSORDER
dw_2.setredraw(false)

dw_2.insertrow(0)

dw_2.object.order_date[1] = datetime(date(em_1.text))
dw_2.object.wc_no[1]      = is_wcno
dw_2.object.planner[1]    = gs_userid
dw_2.object.area_no[1]    = dw_area.object.area[1]
dw_2.accepttext()

dw_2.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcrel_m
integer x = 3643
integer y = 56
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_falg[4]
long   ll_row

if tab_1.SelectedTab = 2 AND cbx_1.checked = true then
else
	dw3.reset()
	dw_4.reset()
	dw6.reset()
	dw7.reset()
end if

dw_2.accepttext()
dw_area.accepttext()

ls_area = dw_area.object.area[1]

id_date = date(em_1.text)
if isnull(id_date) then	RETURN

dw_2.accepttext()

if tab_1.SelectedTab = 1 then
	dw_4.retrieve(id_date, ls_area)
	
	if dw_4.rowcount() < 1 then
		em_1.SelectText(9, 2)
		em_1.SetFocus( )
	end if
	is_mess = "해당일자에 "
else
	is_wcno = dw_2.object.wc_no[1]
	if isnull(is_wcno) or trim(is_wcno) = '' then 
		MessageBox("확인","작업장을 선택하십시요")
		dw_2.setcolumn('wc_no')
		dw_2.setfocus()
		RETURN
	end if

	if cbx_1.checked = false then	
		pb_insert.triggerevent(clicked!)
	end if
	
	dw7.retrieve(is_wcno,id_date, ls_area)
end if

MessageBox("확인","작업완료")

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcrel_m
integer x = 1623
integer y = 4
integer width = 823
integer height = 212
integer taborder = 90
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcrel_m
integer y = 216
integer width = 4622
integer height = 140
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcrel_m
integer x = 3616
integer width = 1010
integer taborder = 50
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcrel_m
integer x = 50
integer y = 256
integer width = 4581
integer height = 92
integer taborder = 80
string dataobject = "d_mpsfcrel_m1"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;long ll_row

this.accepttext()
is_wcno = dw_2.object.wc_no[1]
id_date = date(dw_2.object.order_date[1])

end event

type dw_4 from datawindow within w_mpsfcrel_m
integer x = 32
integer y = 376
integer width = 1390
integer height = 2048
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_mpsfcrel_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;boolean result

if row < 1 then return

/*2019.06.04 jowonsuk 연속출력 기능 추가 */
if cbx_2.checked then 
	This.SelectRow(This.GetClickedRow(), TRUE)
else	
	gf_multi_select(This, row)
end if

end event

event rowfocuschanged;long		ll_row
string	ls_wc, ls_order

ll_row = this.getrow()
if ll_row < 1 then return

ls_order = this.object.order_no[ll_row]
//조회
dw_2.reset()
dw3.reset()
dw_2.retrieve(ls_order)

dw3.setredraw(false)
dw3.retrieve(ls_order)

select
	wc_no
into
	:ls_wc
from
	mpsdet
where
	mpsorder_order	=:ls_order
using sqlca;	

if LeftA(ls_wc, 1) = 'U' then
	dw3.object.paint_item.width 		= 0
	dw3.object.paint_qa.width 			= 0
	dw3.object.paint_company.width 	= 0
	dw3.object.paint_name.width 		= 0
else
	dw3.object.paint_item.width 		= 576
	dw3.object.paint_qa.width 			= 631
	dw3.object.paint_company.width 	= 576
	dw3.object.paint_name.width 		= 736
end if

dw3.setredraw(true)


end event

event doubleclicked;if cbx_2.checked then
	This.SelectRow(This.GetClickedRow(), FALSE)
end if	
end event

type tab_1 from tab within w_mpsfcrel_m
integer x = 1477
integer y = 372
integer width = 3177
integer height = 2056
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 78160032
boolean raggedright = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 2
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

event selectionchanged;choose case newindex
	case 1
		pb_delete.enabled = true
		pb_save.enabled = true
	case 2
		pb_delete.enabled = false
		pb_save.enabled = false
end choose

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3141
integer height = 1928
long backcolor = 78160032
string text = "지시내역"
long tabtextcolor = 16711680
long tabbackcolor = 78160032
string picturename = "Project!"
long picturemaskcolor = 553648127
st_3 st_3
st_1 st_1
cb_6 cb_6
cb_5 cb_5
dw_3 dw_3
end type

on tabpage_1.create
this.st_3=create st_3
this.st_1=create st_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.dw_3=create dw_3
this.Control[]={this.st_3,&
this.st_1,&
this.cb_6,&
this.cb_5,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.st_3)
destroy(this.st_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.dw_3)
end on

type st_3 from statictext within tabpage_1
integer x = 1696
integer y = 20
integer width = 1701
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "작업지시서 저장시 수주마감, 출고수량 체크함"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 389
integer y = 20
integer width = 1257
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "다중선택: 클릭=> [Shift] + 클릭"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within tabpage_1
integer x = 114
integer width = 114
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;long ll_row, ll_curseq, ll_cnt

dw_3.accepttext()

ll_row = dw_3.rowcount()

if ll_row <= 1 then return

ll_curseq = dw_3.GetSelectedRow(0)
if ll_curseq = 0 then return
ll_cnt = 0
for ll_row = dw_3.rowcount() to ll_curseq step -1
	if dw_3.isselected(ll_row) = true then exit
	ll_cnt = ll_cnt + 1
next
if ll_cnt = 0 then return
dw_3.setredraw(false)
ll_cnt = 0
for ll_row = ll_curseq to dw_3.rowcount()
	if dw_3.isselected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		dw_3.object.order_seq[ll_row] = ll_row  + 1
	end if
next
if ll_curseq > 0 then
	dw_3.object.order_seq[ll_curseq + ll_cnt] = ll_curseq  //- ll_cnt +1
end if	
dw_3.sort()
dw_3.setredraw(true)

end event

type cb_5 from commandbutton within tabpage_1
integer width = 114
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;long ll_row, ll_curseq, ll_cnt

dw_3.accepttext()

ll_row = dw_3.rowcount()

if ll_row <= 1 then return

ll_curseq = dw_3.GetSelectedRow(0)
if ll_curseq <= 1 then return
dw_3.setredraw(false)
ll_cnt = 0
for ll_row = ll_curseq to dw_3.rowcount()
	if dw_3.isselected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		dw_3.object.order_seq[ll_row] = ll_row - 1
	end if
next
if ll_curseq > 1 then
	dw_3.object.order_seq[ll_curseq - 1] = ll_curseq + ll_cnt -1 
end if	
dw_3.sort()
dw_3.setredraw(true)

end event

type dw_3 from datawindow within tabpage_1
integer y = 108
integer width = 3127
integer height = 1800
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpsfcrel_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

if KeyDown(KeyShift!) THEN 
	this.setredraw(false)
	long ll_row, ll_selrow
	string ls_sel
	
	ls_sel = 'N'
	ll_selrow = this.GetSelectedRow(row -1)
	for ll_row = 1 to row
		if ls_sel = 'Y' then
			this.selectrow(ll_row,true)
		else
			if isselected(ll_row) then
				ls_sel = 'Y'
			end if
		end if
	next
	this.setredraw(true)
else
	this.SelectRow(0, false)
	this.SelectRow(row, true)
end if

end event

event rowfocuschanged;//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then return
//if KeyDown(KeyShift!) THEN return
//this.SelectRow(0, false)
//this.SelectRow(ll_row, true)
//
end event

event retrieveend;long ll_row 
string ls_enable

ls_enable = 'N'

for ll_row = 1 to dw_3.rowcount()
	if 	dw_3.object.pop_status[ll_row] = '2' OR dw_3.object.pop_status[ll_row] = '3' then
		ls_enable = 'Y'		
	end if
next

if ls_enable = 'Y' then
	cb_5.enabled = false
	cb_6.enabled = false	
	cbx_1.enabled = false
	cbx_1.checked = false
else
	cb_5.enabled = true
	cb_6.enabled= true	
	cbx_1.enabled = true
end if
end event

event itemchanged;string ls_item, ls_sql

choose case dwo.name
	case 'paint_item'
			ls_item = trim(data)
			
			debugbreak()
			
//		  SELECT item.loc_no,   
//					item.uom,   
//					item.source,   
//					item.item_no,   
//					item.qa,   
//					item.item_name  
//			 FROM item,   
//					groupitem  
//			WHERE ( item.item_no = groupitem.item_no )
//			  AND ( groupitem.use_flag <> ~"C~"        )    
//		ORDER BY item.item_no ASC,   
//					item.qa ASC   			
						
						
ls_sql =   "  SELECT item.loc_no,   " +&
			"           item.uom,    "		   +&			
			"           item.source,    " 	   +&
			"           item.item_no,    "    +&
			"           item.qa,       "    +&
			"           item.item_name     "    +&
			"           FROM item, 		  "    +&			
			"      			   groupitem    "                +&
			"      WHERE ( item.item_no = groupitem.item_no )    "                +&								
			"     AND		  ( groupitem.use_flag <> ~~'C~~' ) "                 +&						
			"      and item.item_no = ~~'" + ls_item + "~~'"
//		"           ORDER BY item.item_no ASC,      "    +&
//			"           item.qa ASC							  "  			

ls_sql =  "datawindow.table.select = '" + ls_sql + "'"

idwc_qa.modify(ls_sql)
idwc_qa.retrieve()						
			
end choose

RETURN 0
			
end event

event rbuttondown;gs_where lstr_where
string ls_order_paint_company, ls_paint_company, ls_paint_item, ls_paint_qa, ls_order_paint_name, ls_paint_name
string ls_scene_code, ls_item_gubun
//
//lstr_where.str2 = this.object.paint_item[row]
//lstr_where.str3 = this.object.paint_qa[row]

//if dwo.name = 'paint_item' or dwo.name = 'paint_qa' then
	
	/*jowonsuk 2019.07.25 도장일경우만 도료 선택할 수 있는 우클릭 */
	if this.object.WC_NO[row]  = 'P01' OR this.object.WC_NO[row]  = 'P02' OR this.object.WC_NO[row]  = 'P03' OR this.object.WC_NO[row]  = 'P04' then
	
			lstr_where.str2 = this.object.scene_code[row]
	
			OpenWithParm( w_whitempaint_w, lstr_where )
		
			lstr_where = Message.PowerObjectParm
			
			ls_paint_item = lstr_where.str1
			ls_paint_qa = lstr_where.name	
			ls_scene_code = lstr_where.str2
			ls_item_gubun = lstr_where.str3
			ls_paint_company = lstr_where.str4
			ls_paint_name = lstr_where.str5	
			
			this.object.paint_item[row]   = ls_paint_item
			this.object.paint_qa[row]  	    = ls_paint_qa
			
			this.object.paint_name[row]   = ls_paint_name
			this.object.paint_company[row]    = ls_paint_company
			
	end if
	
//end if	


end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3141
integer height = 1928
long backcolor = 78160032
string text = "미지시내역"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
long picturemaskcolor = 536870912
st_vertical2 st_vertical2
dw_7 dw_7
cbx_3 cbx_3
cb_1 cb_1
dw_6 dw_6
end type

on tabpage_2.create
this.st_vertical2=create st_vertical2
this.dw_7=create dw_7
this.cbx_3=create cbx_3
this.cb_1=create cb_1
this.dw_6=create dw_6
this.Control[]={this.st_vertical2,&
this.dw_7,&
this.cbx_3,&
this.cb_1,&
this.dw_6}
end on

on tabpage_2.destroy
destroy(this.st_vertical2)
destroy(this.dw_7)
destroy(this.cbx_3)
destroy(this.cb_1)
destroy(this.dw_6)
end on

type st_vertical2 from u_splitbar_vertical within tabpage_2
integer x = 974
integer y = 108
integer height = 1816
boolean bringtotop = true
end type

type dw_7 from datawindow within tabpage_2
integer y = 108
integer width = 942
integer height = 1816
integer taborder = 90
string title = "none"
string dataobject = "d_mpsfcrel_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)
//string ls_order
//ls_order = this.object.order_no[row]
//dw6.retrieve(ls_order)

end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
string ls_order
ls_order = this.object.order_no[ll_row]
dw6.retrieve(ls_order)

end event

type cbx_3 from checkbox within tabpage_2
integer x = 517
integer y = 28
integer width = 379
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "전체추가"
end type

event clicked;long ll_row, ll_cnt, ll_cnt2

if dw7.rowcount() = 0 then return 

ll_cnt2 = dw3.rowcount() + 1
for ll_row = 1 to dw7.rowcount()
	if dw3.rowcount() = 0 then 
		ll_cnt = 1
	else
		ll_cnt = dw3.rowcount() + 1
	end if
	dw_7.scrolltorow(ll_row)

	dw6.rowscopy(1, dw6.rowcount(), Primary!, dw3, ll_cnt, Primary!)
next
dw6.reset()
dw7.rowsmove(1, dw7.rowcount(), Primary!, dw7, 1, Filter!)
for ll_row = ll_cnt2 to dw3.rowcount()
	dw3.object.order_seq[ll_row] = ll_row
next
tab_1.selecttab(1)
THIS.CHECKED = FALSE

end event

type cb_1 from commandbutton within tabpage_2
integer x = 9
integer y = 12
integer width = 457
integer height = 92
integer taborder = 41
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<= 내역추가"
end type

event clicked;long ll_row, ll_cnt

debugbreak()

// 생산계획 번호 
if dw7.rowcount() = 0 then return 

if cbx_1.checked = true then
	if dw_4.rowcount() = 0 then 
		messagebox("확인","기존 작업지시번호를 선택후 작업하십시요")
		return 
	end if
	if dw_7.object.wc_no[dw7.getrow()] <> dw_4.object.wc_no[dw_4.getrow()] then
		messagebox("확인","조회된 작업장과 일치하지 않습니다. 확인하시고 작업하십시요")
		return 
	end if
end if

// 지시내역이 존재하는지 확인 
if dw3.rowcount() = 0 then 
	ll_cnt = 1
else
	ll_cnt = dw3.rowcount() + 1
end if
dw6.rowscopy(1, dw6.rowcount(), Primary!, dw3, ll_cnt, Primary!)
dw3.accepttext()

// 지시내역의 작업순서 정렬하기
for ll_row = ll_cnt to dw3.rowcount()
	dw3.object.order_seq[ll_row] = ll_row
next
dw7.rowsmove(dw7.getrow(), dw7.getrow(), Primary!, dw7, 1, Filter!)

// 지시내역 이동
tab_1.selecttab(1)

end event

type dw_6 from datawindow within tabpage_2
integer x = 1015
integer y = 108
integer width = 2112
integer height = 1816
integer taborder = 80
string title = "none"
string dataobject = "d_mpsfcrel_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_mpsfcrel_m
integer x = 933
integer y = 16
integer width = 101
integer height = 76
integer taborder = 100
boolean bringtotop = true
string title = "공정이동 식별표"
string dataobject = "d_mpsfcrel_r4"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_mpsfcrel_m
integer x = 1664
integer y = 56
integer width = 485
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "작업지시서"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpsfcrel_m
integer x = 1664
integer y = 132
integer width = 544
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "공정이동식별표"
end type

type cbx_1 from checkbox within w_mpsfcrel_m
integer x = 3099
integer y = 136
integer width = 471
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "추가 지시"
end type

type em_1 from editmask within w_mpsfcrel_m
integer x = 3099
integer y = 44
integer width = 471
integer height = 88
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_date = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_mpsfcrel_m
integer x = 2501
integer y = 124
integer width = 521
integer height = 84
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wc1
string  ls_area

ls_area = trim(data)

// 작업 필터링
dw_2.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "area_no = '" + ls_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

end event

event losefocus;this.accepttext()
end event

type st_2 from statictext within w_mpsfcrel_m
integer x = 2501
integer y = 44
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_mpsfcrel_m
integer x = 1435
integer y = 376
integer height = 2048
boolean bringtotop = true
end type

type cbx_2 from checkbox within w_mpsfcrel_m
integer x = 1202
integer y = 92
integer width = 361
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "연속출력"
end type

event clicked;dw_4.SelectRow(0, FALSE)
end event

type gb_4 from groupbox within w_mpsfcrel_m
integer x = 2464
integer y = 4
integer width = 599
integer height = 212
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
borderstyle borderstyle = stylebox!
end type

type gb_5 from groupbox within w_mpsfcrel_m
integer x = 3077
integer y = 4
integer width = 521
integer height = 212
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
borderstyle borderstyle = stylebox!
end type

