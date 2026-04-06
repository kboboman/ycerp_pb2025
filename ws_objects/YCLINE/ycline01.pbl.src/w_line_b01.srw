$PBExportHeader$w_line_b01.srw
$PBExportComments$생산라인 라벨출력(절곡)
forward
global type w_line_b01 from window
end type
type cbx_3 from checkbox within w_line_b01
end type
type cbx_2 from checkbox within w_line_b01
end type
type em_copy from editmask within w_line_b01
end type
type st_7 from statictext within w_line_b01
end type
type em_prt from editmask within w_line_b01
end type
type st_4 from statictext within w_line_b01
end type
type cbx_1 from checkbox within w_line_b01
end type
type cbx_unit from checkbox within w_line_b01
end type
type cbx_next from checkbox within w_line_b01
end type
type em_top from editmask within w_line_b01
end type
type em_left from editmask within w_line_b01
end type
type st_6 from statictext within w_line_b01
end type
type st_5 from statictext within w_line_b01
end type
type st_key from statictext within w_line_b01
end type
type cb_3 from commandbutton within w_line_b01
end type
type cb_2 from commandbutton within w_line_b01
end type
type cb_1 from commandbutton within w_line_b01
end type
type st_2 from statictext within w_line_b01
end type
type dw_2 from datawindow within w_line_b01
end type
type st_1 from statictext within w_line_b01
end type
type dw_1 from datawindow within w_line_b01
end type
type st_3 from statictext within w_line_b01
end type
end forward

global type w_line_b01 from window
integer width = 4430
integer height = 2528
boolean titlebar = true
string title = "라벨출력(w_line_b01)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
event ue_dwnkey pbm_dwnkey
cbx_3 cbx_3
cbx_2 cbx_2
em_copy em_copy
st_7 st_7
em_prt em_prt
st_4 st_4
cbx_1 cbx_1
cbx_unit cbx_unit
cbx_next cbx_next
em_top em_top
em_left em_left
st_6 st_6
st_5 st_5
st_key st_key
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
dw_2 dw_2
st_1 st_1
dw_1 dw_1
st_3 st_3
end type
global w_line_b01 w_line_b01

type variables
long   il_rowposition = 1
string is_packno
end variables

forward prototypes
public subroutine wf_f8 ()
public function boolean wf_sfcday (long al_row)
public function boolean wf_barcode_print ()
public function string wf_ks_create (string as_item_no, string as_flag)
end prototypes

public subroutine wf_f8 ();// 저장
long     ll_row, ll_found, ll_dw1row
string   ls_chk, ls_routnext
datetime ldt_sfcdate

dw_1.AcceptText()

ll_dw1row = dw_1.RowCount()

// 다음공정 CHECK
if cbx_next.checked = true then
	ls_routnext = dw_1.object.rout_next[1]
	ll_found = dw_1.find( "rout_next <> '" + ls_routnext + "' ", 1, ll_dw1row )
	if ll_found > 0 then
		MessageBox("저장실패", "다음공정이 다른 품목이 존재합니다. 확인 바랍니다.")
		RETURN
	end if
end if

if dw_1.Enabled = false then
	MessageBox("저장실패", "이미 저장 되었습니다.")
	RETURN
end if

for ll_row = 1 to ll_dw1row
	if dw_1.object.work_qty[ll_row] = 0 then
		MessageBox("저장실패", "작업수량을 입력하세요.")
		RETURN
	end if
next

debugbreak()

ls_chk = "N"
if MessageBox("확인", "재고에 반영합니다. 작업수량이 정확합니까?", Question!, YesNo!, 1) = 1 then
	for ll_row = 1 to ll_dw1row
		//////////////////////////////////
		// 저장(재고생성)
		//////////////////////////////////
		if wf_sfcday( ll_row ) = false then		
			MessageBox("저장실패", "1 행부터 " + string(ll_row - 1) + " 행까지 저장되었습니다.")
			ls_chk = "Y"
			RETURN
		end if
		//////////////////////////////////
	next

	if ls_chk = "N" then
		wf_barcode_print()   // 전체 저장완료 했을때, 벤딩용 라벨 출력 + 패킹번호
		
		dw_1.enabled = false
		st_2.visible = true
	end if
end if

end subroutine

public function boolean wf_sfcday (long al_row);/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 재고반영                                                          //
// 성형반에서 생산된 제품을 포장라벨로 출력할 경우 즉시 재고 반영함. //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 1) 현재공정
//    자동생산계획(가생산계획)의 현재공정 상태변경 (Y:생산계획 작성가능)
// 2) 다음공정
//    자동생산계획(가생산계획)의 다음공정 상태변경 (Y:생산계획 작성가능)
// 3) 작업일보 등록
// 4) 입출고 히스토리 추가(INSERT inaudit)
// 5) 생산계획상세 변경(UPDATE mpsdet SET rcpt_qty = rcpt_qty + :ldb_work_qty WHERE plan_no = :ls_plan_no)
// 6) 수주상세 변경('E' : 완료, 'Y' : 가능)
// 7) 물품코드 마스터의 수주 예약량 변경  --- 사용안함
// 8) 전 공정이 완료되지 않아도 마지막공정 완료시 출고가능으로 수주상세 FLAG를 변경함.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
datetime ldt_sfc_dt
date   ldt_date
time   lt_Time
int    li_cnt, li_seq, li_division, li_operation, li_work_per, li_mpsseq

string ls_plan_no, ls_order_no, ls_wc_no, ls_sale_no
string ls_item_no, ls_uom, ls_qa, ls_cust_no, ls_scene_code, ls_itemno_color, ls_colordraw
string ls_assy_item, ls_assy_qa, ls_area_no, ls_cust_name
string ls_type, ls_mpsorder, ls_sqlerrtext, ls_rem, ls_qa1

double ldb_rcpt_qty, ldb_hebe, ldb_plan_qty
double ldb_order_qty, ldb_solqty, ldb_rlseqty, ldb_work_qty

// 메인 상단에서 날짜 가져오기. 확인.
w_line.dw_r.accepttext()
ldt_date = w_line.dw_r.object.date[1]

dw_1.accepttext()
//dwtarget.object.sfc_date[ll_row]    = datetime(date(dw_2.object.work_date[1]), lt_Time)
lt_Time          = time(MidA(string(today(),'yyyy/mm/dd hh:mm:ss:fff'),11))
ldt_sfc_dt       = datetime(ldt_date, lt_Time)
ls_plan_no       = dw_1.object.plan_no[al_row]
ls_order_no      = dw_1.object.order_no[al_row]
ls_sale_no       = dw_1.object.sale_no[al_row]
li_seq           = dw_1.object.seq_no[al_row]
ls_wc_no         = dw_1.object.wc_no[al_row]
li_division      = dw_1.object.division[al_row]
li_operation     = dw_1.object.operation[al_row]
ls_item_no       = dw_1.object.item_no[al_row]
ls_uom           = dw_1.object.uom[al_row]
ls_qa            = dw_1.object.qa[al_row]
ls_qa1			  = RightA(ls_qa,5)
ls_rem			  = dw_1.object.rem[al_row]

ls_cust_no       = dw_1.object.cust_no[al_row]
ls_cust_name     = dw_1.object.cust_name[al_row]
ls_scene_code    = dw_1.object.scene_code[al_row]
ls_itemno_color  = dw_1.object.item_color[al_row]
ls_assy_item     = dw_1.object.assy_item[al_row]
ls_assy_qa       = dw_1.object.assy_qa[al_row]
ls_area_no       = dw_1.object.area_no[al_row]
ls_mpsorder      = dw_1.object.mpsorder_order[al_row]
li_mpsseq        = dw_1.object.order_seq[al_row]

ldb_order_qty    = dw_1.object.order_qty[al_row]
ldb_rcpt_qty     = dw_1.object.rcpt_qty[al_row]
li_work_per      = dw_1.object.work_per[al_row]
ldb_hebe         = dw_1.object.hebe[al_row]
ldb_work_qty     = dw_1.object.work_qty[al_row]
ldb_plan_qty     = dw_1.object.plan_qty[al_row]
//ldb_make_qty   = dw_1.object.make_qty[al_row]
//ldb_qty        = ldb_plan_qty - ldb_make_qty
ls_colordraw     = dw_1.object.color_draw[al_row]		// 도장반 작업색상명

/////////////////////////////////////////////////////////////////////
// 1) 현재공정
// 자동생산계획(가생산계획)의 현재공정 상태변경 (Y:생산계획 작성가능)
/////////////////////////////////////////////////////////////////////
if ldb_rcpt_qty + ldb_work_qty >= ldb_order_qty then 
	ls_type = 'E'  // 완료
else
	ls_type = 'Y'  // 가능
end if

UPDATE routtempnew 
   SET make_qty  = make_qty + :ldb_work_qty, process_flag = :ls_type
 WHERE division  = :li_division 
   AND wc_no     = :ls_wc_no 
   AND sale_no   = :ls_sale_no
   AND seq_no    = :li_seq 
   AND process_flag <> 'C'
   AND operation = :li_operation;  
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류1','[routtempnew] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false 
end if		

/////////////////////////////////////////////////////////////////////
// 2) 다음공정
// 자동생산계획(가생산계획)의 다음공정 상태변경 (Y:생산계획 작성가능)
/////////////////////////////////////////////////////////////////////
li_operation++   
UPDATE routtempnew 
   SET process_flag = 'Y' 
 WHERE division  = :li_division 
	AND sale_no   = :ls_sale_no 
	AND seq_no    = :li_seq 
	AND operation = :li_operation
	AND process_flag <> 'C'
	AND process_flag <> 'E';	
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류2','[routtempnew] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false
end if

choose case Trim(ls_uom)
	case 'M'
		ldb_hebe = Double(Long(MidA(ls_assy_qa, 15, 5)) / 1000.0) * ldb_hebe * ldb_work_qty
	case else
		ldb_hebe = ldb_hebe * ldb_work_qty
end choose

/////////////////////////////////////////////////////////////////////
// 3) 작업일보 등록
/////////////////////////////////////////////////////////////////////
INSERT INTO sfcday (order_no, wc_no, sale_no, seq_no, item_no, qa,
	    assembly, assembly_qa, uom,  hebe, type,
	    cust_no, cust_name, loc_no, scene_code, color,
	    area_no, per_qty, sfc_date, plan_qty, make_qty, mpsorder_order, order_seq, color_draw)
VALUES (:ls_plan_no, :ls_wc_no, :ls_sale_no, :li_seq, :ls_item_no, :ls_qa,
	    :ls_assy_item, :ls_assy_qa, :ls_uom, :ldb_hebe, 'C',
	    :ls_cust_no, :ls_cust_name, :gs_loc, :ls_scene_code, :ls_itemno_color,
	    :ls_area_no, :li_work_per, :ldt_sfc_dt, :ldb_plan_qty, :ldb_work_qty, :ls_mpsorder, :li_mpsseq, :ls_colordraw);
if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류[작업일보]', '[sfcday] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false
end if

/////////////////////////////////////////////////////////////////////
// 4) 입출고 히스토리 추가 ( inaudit insert )
/////////////////////////////////////////////////////////////////////
INSERT INTO inaudit 
       (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,inaudit_type,cost,destination,rem, user_id)
VALUES (:ldt_sfc_dt,:ldt_date,:ls_assy_item,:ls_assy_qa,:ls_plan_no,:ldb_work_qty,0,:gs_loc,'RP',0,:ls_wc_no,'현장작업일보[절곡]', :gs_userid);
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류23','[inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false
end if

/////////////////////////////////////////////////////////////////////
// 5) 생산계획상세 변경
/////////////////////////////////////////////////////////////////////
UPDATE mpsdet SET rcpt_qty = rcpt_qty + :ldb_work_qty WHERE plan_no = :ls_plan_no;
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류24','[pb_save][mpsdet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false
end if		

if ls_item_no = ls_assy_item and ls_qa = ls_assy_qa then
	/////////////////////////////////////////////////////////////////////
	// 6) 수주상세 변경
	/////////////////////////////////////////////////////////////////////
	if ls_type = 'E' then
		UPDATE saledet 
		   SET plan_qty = plan_qty - :ldb_work_qty, sol_qty = sol_qty + :ldb_work_qty
		 WHERE order_no = :ls_sale_no AND seq_no = :li_seq;
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류25','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN false
		end if
	else
		UPDATE saledet 
		   SET plan_qty = plan_qty - :ldb_work_qty, sol_qty = sol_qty + :ldb_work_qty
		 WHERE order_no = :ls_sale_no AND seq_no = :li_seq;		
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류25','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN false
		end if
	end if
	
/////////////////////////////////////////////////////////////////////
//	7) 물품코드 마스터의 수주 예약량 변경
/////////////////////////////////////////////////////////////////////
//	if ls_type = 'E' then
//		update item set sales_reserved = sales_reserved + :ldb_work_qty
//		where item_no = :ls_item_no and qa = :ls_qa;
//		if sqlca.sqlcode < 0 then
//			ls_sqlerrtext = sqlca.sqlerrtext
//			rollback;
//			MessageBox('오류26','판매예약량 update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
//			RETURN false
//		end if					
//	else
//		update item set sales_reserved = sales_reserved + :ldb_work_qty
//		where item_no = :ls_item_no and qa = :ls_qa;			
//		if sqlca.sqlcode < 0 then
//			ls_sqlerrtext = sqlca.sqlerrtext
//			rollback;
//			MessageBox('오류26','판매예약량 update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
//			RETURN false
//		end if					
//	end if

	ldb_order_qty = 0 
	SELECT order_qty, plan_qty, sol_qty, rlse_qty
	  INTO :ldb_order_qty, :ldb_plan_qty, :ldb_solqty,:ldb_rlseqty
	  FROM saledet
	 WHERE order_no = :ls_sale_no and seq_no = :li_seq;
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('오류27','[pb_save][saledet] 해당자료가 없거나, DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
		RETURN false
	end if

	/////////////////////////////////////////////////////////////////////
	// 8) 전 공정이 완료되지 않아도 마지막공정 완료시 출고가능 Flag 바꿈
	/////////////////////////////////////////////////////////////////////
	if (ldb_solqty + ldb_rlseqty) >= ldb_order_qty then
	  // 출고가능 하게 수주상세 변경
		UPDATE saledet SET saledet_text = 'X' WHERE order_no = :ls_sale_no AND seq_no = :li_seq;	
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류28','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN false
		end if
	end if
end if

COMMIT;
RETURN TRUE

end function

public function boolean wf_barcode_print ();/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 1) 패킹정보 생성
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
datetime ldt_getdate
date     ldt_date
string   ls_saleno, ls_wcno, ls_custscene, ls_custno, ls_custnm, ls_scene, ls_itemno, ls_itemnm, ls_itemnm1, ls_itemnm2, ls_uom
string   ls_qa, ls_qa1, ls_qa23, ls_color, ls_rem, ls_routnext, ls_prt
string   ls_packno, ls_packno1, ls_mpsorder, ls_left, ls_top, ls_value, ls_right
string   ls_ks, ls_ks1, ls_ks2, ls_ks3, ls_ksd, ls_sqlerrtext
integer  li_i, li_tab
long     ll_row, ll_dw1cnt, ll_dw2cnt, ll_unitqty, ll_totqty, ll_addqty, ll_remqty

// 라벨출력
integer li_copy, li_pageqty, li_pageqty2, li_boxqty, li_seq
string  ls_date, ls_stock

// 메인 상단에서 날짜 가져오기. 확인.
w_line.dw_r.accepttext()

ldt_date  = w_line.dw_r.object.date[1]
ll_dw1cnt = dw_1.rowcount()

dw_2.Reset()
dw_2.InsertRow(0)

SELECT top 1 convert(char(10), getdate(), 112), getdate() INTO :ls_date, :ldt_getdate FROM login;


/////////////////////////////////////////////////////////////////////
// 패킹헤더(PACK)
/////////////////////////////////////////////////////////////////////
ls_wcno     = dw_1.object.wc_no[1]
ls_custno   = dw_1.object.cust_no[1]
ls_scene    = dw_1.object.scene_code[1]
ls_color    = dw_1.object.color_name[1]

if dw_1.enabled = false then
	ls_packno1 = st_key.text		// 패킹번호
else
	// 패킹번호(ls_packno1): wc_no 3자리 + yymmdd 4자리 + SEQ 3자리 = 10자리 
	SELECT top 1 max(pack_no) INTO :ls_packno  FROM pack (nolock) 
	 WHERE wc_no = :ls_wcno AND pack_date = :ldt_date;
	if isnull(ls_packno) then ls_packno = ""
	
	if ls_packno = "" then
		ls_packno1 = ls_wcno + string(ldt_date,"yymmdd") + "001"
	else
		ls_packno1 = LeftA(ls_packno,9) + string(long(RightA(ls_packno,3)) + 1,"000")
	end if

	/////////////////////////////////////////////
	ls_itemno = dw_1.object.item_no[1]
     ls_qa     = LeftA(dw_1.object.qa[1],13)		// dw_1.object.qa[1]
	
	ls_ks     = wf_ks_create(ls_itemno, '1')
	ls_ks1    = wf_ks_create(ls_itemno, '2')
	ls_ks2    = wf_ks_create(ls_itemno, '3')
	ls_ks3    = wf_ks_create(ls_itemno, '4')
	ls_ksd    = wf_ks_create(ls_itemno, '5')

	INSERT INTO pack (pack_no, wc_no, cust_no, scene_code, pack_date, item_no, qa, 
							pack_ks, pack_ks1, pack_ks2, pack_ks3, pack_ksd, sys_date)
	VALUES (:ls_packno1, :ls_wcno, :ls_custno, :ls_scene, :ldt_date, :ls_itemno, :ls_qa,
			  :ls_ks, :ls_ks1, :ls_ks2, :ls_ks3, :ls_ksd, getdate() );
			  
	if SQLCA.SqlCode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('오류', ls_packno1 + '[pack]오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
		RETURN false
	else
		for ll_row = 1 to ll_dw1cnt
			ls_itemno   = dw_1.object.item_no[ll_row]
			ls_qa       = dw_1.object.qa[ll_row]
        		ls_mpsorder = dw_1.object.mpsorder_order[ll_row]
         		li_seq      = dw_1.object.order_seq[ll_row]
   		
			ls_ks       = wf_ks_create(ls_itemno, '1')
			ls_ks1      = wf_ks_create(ls_itemno, '2')
			ls_ks2      = wf_ks_create(ls_itemno, '3')
			ls_ks3      = wf_ks_create(ls_itemno, '4')
			ls_ksd      = wf_ks_create(ls_itemno, '5')
		
			ls_qa1      = RightA(dw_1.object.qa[ll_row],5)
			ls_rem      = dw_1.object.rem[ll_row]
			ll_unitqty  = dw_1.object.unit_qty[ll_row]
			
			INSERT INTO packdet (pack_no, seq_no, qa1, rem, pack_qty, mpsorder_order, order_seq)
			VALUES ( :ls_packno1, :ll_row, :ls_qa1, :ls_rem, :ll_unitqty, :ls_mpsorder, :li_seq );
			if SQLCA.SqlCode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('오류', string(ll_row) + '행 [packdet]오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
				RETURN false
			else
				COMMIT;
			end if
		next
	end if
	st_key.text  = ls_packno1
end if

//////////////////////////////////////////
// dw_1 출력하기
//////////////////////////////////////////

// 출력마진 설정
ls_left = em_left.text
ls_top  = em_top.text
ls_prt  = em_prt.text
li_copy = integer(em_copy.text)

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)

if ls_prt = "" OR ls_prt = "기본" then
else
	dw_2.Object.DataWindow.Printer = ls_prt
end if
dw_2.modify("DataWindow.print.margin.left = " + ls_left )
dw_2.modify("DataWindow.print.margin.top  = " + ls_top  )
dw_2.modify("DataWindow.print.Margin.Bottom = 0.000" )
dw_2.modify("DataWindow.print.Margin.Right  = 0.000" )

for ll_row = 1 to ll_dw1cnt
	/////////////////////////////////////////////
   // 수주번호가 있으면 주문품(O), 재고품(S)
	/////////////////////////////////////////////
	ls_stock   = dw_1.object.stock[ll_row]				// 
	ls_saleno  = dw_1.object.sale_no[ll_row]			// 수주번호
	ls_itemno  = dw_1.object.item_no[ll_row]			// 품목

	ls_custno  = dw_1.object.cust_no[ll_row]			// 거래처
	ls_scene   = dw_1.object.scene_code[ll_row]		// 현장명

	// ERP품명, BOX품명 출력구분
	ls_itemnm  = dw_1.Object.item_name[ll_row]		// ERP품명
	
	ls_qa      = dw_1.object.qa_calc[ll_row]			// 규격
	ll_unitqty = dw_1.object.unit_qty[ll_row]			// 수량

	// 비고색상 출력
	if cbx_3.checked = true then
		ls_color   = dw_1.object.rem[ll_row]			// 비고
	else
		ls_color   = dw_1.object.color_name[ll_row]	// 색상명
	end if
	
	ls_rem     = dw_1.object.rem[ll_row]            // 비고
	if cbx_next.checked = true then
		ls_routnext= dw_1.object.rout_next[ll_row]      // 다음공정 
	else
		ls_routnext= ""
	end if

	if ll_row < 7 then
		ll_addqty = ll_addqty + ll_unitqty
		
		dw_2.setitem( 1, "lb_itemnm" + string(ll_row), ls_itemnm)	// 품명
		dw_2.setitem( 1, "lb_qa"     + string(ll_row), ls_qa)			// 규격
		dw_2.setitem( 1, "lb_qty"    + string(ll_row), ll_unitqty )	// 수량
		dw_2.setitem( 1, "lb_color"  + string(ll_row), ls_color )	// 색상
		dw_2.setitem( 1, "lb_rem"    + string(ll_row), "" )	// ls_rem )		// 비고
	end if

	li_pageqty  = dw_1.object.page_qty[ll_row]	// 출력장수
next

// 42 = 12, 8, 8, 3, 3, 
ll_totqty = dw_1.object.twork_qty[1]				// 총수량
ll_remqty = ll_totqty - ll_addqty					// 잔량
ll_remqty = ll_remqty + dw_2.object.lb_qty6[1]	// 6행수량 더하기

if ll_dw1cnt > 6 then
	dw_2.object.lb_itemnm6[1] = "상기 품목 외  " + string(ll_dw1cnt - 5) + " 건"
	dw_2.object.lb_qa6[1]     = ""	// "상기 품목 외  " + string(ll_dw1cnt - 5) + " 건"
	dw_2.object.lb_qty6[1]    = ll_remqty			// 잔량
	dw_2.object.lb_qty7[1]    = ll_totqty			// 총수량
end if

dw_2.object.order_no[1]      = ls_saleno							// 수주번호	
ls_custscene   = dw_1.object.cust_scene[1]						// 거래처현장명
dw_2.object.cust_scene[1]    = ls_custscene						// 거래처현장명	
dw_2.object.lb_totcnt[1]     = ll_dw1cnt							// 건수

dw_2.object.lb_m_date[1]     = ldt_getdate						// 제조일자	
dw_2.object.lb_packno1[1]    = "*" + ls_packno1 + "*"			// 바코드1
dw_2.object.lb_packno2[1]    = "*" + ls_packno1 + "*"			// 바코드2
dw_2.object.lb_packno3[1]    = ls_packno1							// 바코드	
dw_2.object.lb_routnext[1]   = ls_routnext						// 다음공정	

if li_copy = 1 then
	dw_2.Object.DataWindow.Print.Copies = li_pageqty
else
	dw_2.Object.DataWindow.Print.Copies = li_copy
end if
dw_2.print()

RETURN TRUE

end function

public function string wf_ks_create (string as_item_no, string as_flag);//
string ls_str

choose case as_item_no
	case  'PAWSSTDK00','PAWSSTDK10','PAWSRUNK00','PACSMBSK00','PACSMBDK00','PACSCACK00','PACSMCHK00',&
			'PACSOMTK00','PACS0GMK00','PACS0MCB00','PACS0C1K00','PACS0C5K00','PACS0C2K00','PACS0C4K00',&
			'PACS0CTK00','PACS0GCK00','PACSMTBK00','PACSGMTK00','PACSGMTK0Z','PACSMTBK0Z','PACSC1FK00',&
			'PACSC15K00','PACSC2FK00','PACSC4FK00','PACSCTBK00','PACSGCTK00','PACSC1FK0Z','PACSC2FK0Z',&
			'PACSC4FK0Z','PACSGCTK0Z',&			
			'PAWSRU1K00','PAWSRU2K00','PAWSRU3K00','PAWSRU4K00','PAWSRU5K00','PAWSST1K00','PAWSST1K10',&
			'PAWSST2K00','PAWSST2K10','PAWSST3K00','PAWSST3K10','PAWSST4K00','PAWSST4K10','PAWSST5K00',&
			'PAWSST5K10','PACSCR1K0Z','PACSCR2K0Z','PACSCR3K0Z','PACSCR7K0Z','PACSCR8K0Z','PACSCR9K0Z',&
			'PACSCS1K0Z','PACSCS2K0Z','PACSCS3K0Z','PACSCS4K0Z','PACSCS5K0Z','PACSCS6K0Z','PACSCS7K0Z',&
			'PACSCS8K0Z','PACSCS9K0Z','PACSMT1K0Z','PACSMT2K0Z','PACSMT3K0Z','PACSMT4K0Z','PACSMT5K0Z',&
			'PACSMT6K0Z','PACZCR4K0Z','PACZCR5K0Z','PACZCR6K0Z'
			
			if as_flag = '1' then
				ls_str  = '㉿'
			elseif as_flag = '2' then
				ls_str  = '인증번호'
			elseif as_flag = '3' then
				ls_str  = '제5059호'
			elseif as_flag = '4' then
				ls_str  = '인증기관:KSA'
			else
				ls_str  = 'KS D 3609 건축용 강재 받침재'
			end if
			
	case  'PDZS09SZ00','PDZS10SZ00','PDZS14SZ00','PDZS15SZ00','PDZS18SZ00','PDZS10JZ00','PDZS14JZ00',&
			'PDZS15JZ00','PDZS18JZ00','PDZS24JZ00','PDZS30JZ00','PDZS09TZ00','PDZS10TZ00','PDZS14TZ00',&
			'PDZS15TZ00','PDZS18TZ00','PDZS24TZ00','PDZS30TZ00'
			
			if as_flag = '1' then
				ls_str  = '㉿'
			elseif as_flag = '2' then
				ls_str  = '인증번호'
			elseif as_flag = '3' then
				ls_str  = '제99-0524호'
			elseif as_flag = '4' then
				ls_str  = '인증기관:KSA'
			else
				ls_str  = 'KS D 3854 건축구조용 표면처리 경량형강'				
			end if
			
	case  'PBCA55RB20','PBCA55RB2Z','PBCAS20B00','PBCAS20B0G','PBCAS20B0J','PBCAS20B0R',&
			'PBCAS20B0S','PBCAS20B0Z','PBCAS20B10','PBCAS20B1Z','PBCAS25B00','PBCAS25B0Z',&
			'PBCAS25B10','PBCAS25B1Z','PBCAS30B00','PBCAS30B0J','PBCAS30B0Z','PBCAS31B00',&
			'PBCAS31B0Z','PBCAS31B20','PBCAS31B2Z','PBCAS32B20','PBCAS32B2Z','PBCAS33B20',&
			'PBCAS33B2Z','PBCASPBB0Z','PBCASPBB1Z','PBCASPCB00','PBCASPCB0Z','PBCASPCB10',&
			'PBCASPCB1Z','PBCASPJB0Z','PBCASPMB0Z','PBCASPRB00','PBCASPRB0Z','PBCASPRB1Z',&
			'PBCASPRZ10','PBCASPSB00','PBCASPSB0F','PBCASPSB0G','PBCASPSB0J','PBCASPSB0K',&
			'PBCASPSB0R','PBCASPSB0S','PBCASPSB0W','PBCASPSB0Z','PBCASPSB10','PBCASPSB1Z'
			
			if as_flag = '5' then
				ls_str  = '건축용 착색 금속 천정재'
			else
				ls_str  = ''
			end if
						
	case  'PBCARONB00','PBCARONB0Z','PBCARONB20','PBCARONB2Z','PBCASP0K00','PBCASP0K0R','PBCASP0K0Z', &
			'PBCASP0K1Z','PBCASP0K20','PBCASPDK00','PBCASPDK0Z','PBCASPEK00','PBCASPEK0Z'
			
			if as_flag = '5' then
				ls_str  = 'KS-KS D 7081 건축용 착색 금속 천정재'
			else
				ls_str  = ''
			end if
			
	case else 			
			if as_flag = '5' then
				ls_str  = '건축용 강재 받침재'
			else
				ls_str  = ''
			end if			
end choose

return ls_str

end function

on w_line_b01.create
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.em_copy=create em_copy
this.st_7=create st_7
this.em_prt=create em_prt
this.st_4=create st_4
this.cbx_1=create cbx_1
this.cbx_unit=create cbx_unit
this.cbx_next=create cbx_next
this.em_top=create em_top
this.em_left=create em_left
this.st_6=create st_6
this.st_5=create st_5
this.st_key=create st_key
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.dw_2=create dw_2
this.st_1=create st_1
this.dw_1=create dw_1
this.st_3=create st_3
this.Control[]={this.cbx_3,&
this.cbx_2,&
this.em_copy,&
this.st_7,&
this.em_prt,&
this.st_4,&
this.cbx_1,&
this.cbx_unit,&
this.cbx_next,&
this.em_top,&
this.em_left,&
this.st_6,&
this.st_5,&
this.st_key,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.dw_2,&
this.st_1,&
this.dw_1,&
this.st_3}
end on

on w_line_b01.destroy
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.em_copy)
destroy(this.st_7)
destroy(this.em_prt)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.cbx_unit)
destroy(this.cbx_next)
destroy(this.em_top)
destroy(this.em_left)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_key)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.st_3)
end on

event open;//
string  lsa_order_no[], lsa_item_name[], lsa_qa[]
integer lia_order_seq[]

integer li_cnt
long    ll_dw1row, ll_dw1cnt, ll_selrow, ll_row, ll_boxqty
string  ls_wcno, ls_areano, ls_item_name, ls_itemno, ls_qa, ls_qa13, ls_routnext, ls_boxtype, ls_selitem, ls_selqa, ls_chk, ls_cust, ls_scene
date    ld_date


em_left.text =ProfileString("YCLINE.INI","Database","LEFT", " ")
em_top.text  =ProfileString("YCLINE.INI","Database","TOP",  " ")
em_prt.text  =ProfileString("YCLINE.INI","Database","PRINT"," ")
if em_prt.text = "" then em_prt.text = "기본"

dw_1.SetTransObject(sqlca)
dw_1.Object.DataWindow.Zoom = gl_resolution

dw_2.SetTransObject(sqlca)
dw_2.Visible = False
st_2.Visible = False
st_key.text  = ""

ls_chk 	 = 'N'
li_cnt 	 = 1 		// 배열방번호

ll_dw1row = w_line.dw_1.GetRow()
if isnull(ll_dw1row) or ll_dw1row < 1 then
	// 오류발생함 
end if

ld_date   = date(w_line.dw_1.object.start_date[ll_dw1row])
ls_wcno   = w_line.dw_1.object.wc_no[ll_dw1row]
ls_areano = w_line.dw_1.object.area_no[ll_dw1row]

ll_selrow  = w_line.dw_1.GetSelectedRow(0)
Do While ll_selrow <> 0
   lsa_item_name[li_cnt] = w_line.dw_1.object.item_name[ll_selrow]
	lsa_order_no[li_cnt]  = w_line.dw_1.object.order_no[ll_selrow]
	lia_order_seq[li_cnt] = w_line.dw_1.object.order_seq[ll_selrow]

	if li_cnt < 2 then
		ls_qa        = LeftA(trim(w_line.dw_1.object.qa[ll_selrow]), 13)
		ls_item_name = w_line.dw_1.object.item_name[ll_selrow]
		ls_scene     = w_line.dw_1.object.scene_code[ll_selrow]
		ls_cust      = w_line.dw_1.object.cust_no[ll_selrow]
		
		il_rowposition = ll_selrow
	end if
	
	ls_selitem = trim(w_line.dw_1.object.item_name[ll_selrow])	// MAIN창 품목선택한 것
	ls_selqa   = trim(w_line.dw_1.object.qa[ll_selrow])			// MAIN창 품목선택한 것
	
//	if ls_item_name <> w_line.dw_1.object.item_name[ll_selrow] then
//		MessageBox("선택오류", "선택한 항목중에 품명이 다른것이 있습니다.~n~n" &
//					+ "같은 품명만 선택하십시요.") 
//    //Close(w_line_f7) //현재 상테에서 종료하고 메인윈도우로 가지 못하는 문제. 
//	 //윈도우는 종료해도 스크립트 실행은 끝가지 간다.
//		ls_chk = 'Y'
//		goto err
//	elseif ls_qa <> left(ls_selqa,13) then
//		// 유압반은 규격체크하지 않음
//	end if
	
	li_cnt = li_cnt + 1
	ll_selrow = w_line.dw_1.GetSelectedRow(li_cnt - 1) // (수)다음번 선택된 row
Loop 

/* Datawindow 규격 스크립트
case( lb_item_no + left(lb_qa,13) 
	when 'PAWSSTDK00080X0050X0045' then '50형(WS-50)'   
	when 'PAWSSTDK00080X0065X0045' then '65형(WS-65)'   
	when 'PAWSSTDK00080X0075X0045' then '75형(WS-75)'   
	when 'PAWSSTDK00080X0090X0045' then '90형(WS-90)'  
	when 'PAWSSTDK00080X0100X0045' then '100형(WS-100)' 
	when 'PAWSSTDK10080X0050X0045' then '50형(WS-50)'   
	when 'PAWSSTDK10080X0065X0045' then '65형(WS-65)'   
	when 'PAWSSTDK10080X0075X0045' then '75형(WS-75)'   
	when 'PAWSSTDK10080X0090X0045' then '90형(WS-90)'  
	when 'PAWSSTDK10080X0100X0045' then '100형(WS-100)' 
	when 'PAWSRUNK00080X0052X0040' then '50형(WR-50)'   
	when 'PAWSRUNK00080X0067X0040' then '65형(WR-65)'   
	when 'PAWSRUNK00080X0077X0040' then '75형(WR-75)'   
	when 'PAWSRUNK00080X0092X0040' then '90형(WR-90)'   
	when 'PAWSRUNK00080X0102X0040' then '100형(WR-100)' 
	when 'PACSMBSK00050X0025X0019' then '19형(CS-19)'   
	when 'PACSMBSK00050X0025X0025' then '25형(CS-25)'   
	when 'PACSMBDK00050X0050X0019' then '19형(CW-19)'   
	when 'PACSMBDK00050X0050X0025' then '25형(CW-25)'   
	when 'PACSCACK00120X0038X0012' then '19형(CC-19)'   
	when 'PACSCACK00160X0038X0012' then '25형(CC-25)'   
	when 'PACSMCHK00120X0019X0010' then '19형(CB-19)'   
	when 'PACSMCHK00120X0025X0010' then '25형(CB-25)'   
  else left(lb_qa,1) + "." + mid(lb_qa, 2, 2) + " X " + string(integer(MID(lb_qa, 5, 4))) + " X " + string(integer(MID(lb_qa, 10, 4))))
*/

if UpperBound(lsa_order_no, 1) < 1 then  // 선택된것이 없을경우 현재 Row의 값
   lsa_item_name[1] = w_line.dw_1.object.item_name[ll_dw1row]
	lsa_order_no[1]  = w_line.dw_1.object.order_no[ll_dw1row] 
	lia_order_seq[1] = w_line.dw_1.object.order_seq[ll_dw1row]
	il_rowposition   = ll_dw1row
end if

/////////////////////////////////////////////////////////////////
// 작업지시서 내역
/////////////////////////////////////////////////////////////////
ll_dw1cnt = dw_1.Retrieve( ls_wcno, ld_date, ls_areano, lsa_order_no, lia_order_seq )
/////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
// 다음공정 찾기
/////////////////////////////////////////////////////////////////
for ll_row = 1 to ll_dw1cnt
	ls_itemno   = dw_1.object.item_no[ll_row]
	ls_qa13     = LeftA(dw_1.object.qa[ll_row], 13) + "X00000"
	
	ls_routnext = GF_RoutNext(ls_wcno, ls_itemno, ls_qa13)
	dw_1.object.rout_next[ll_row] = ls_routnext
next
/////////////////////////////////////////////////////////////////

if ll_dw1cnt > 1 then
	dw_1.object.page_qty.protect = 1
//	dw_1.object.page_cnt.tab_order = 0
else
	dw_1.object.page_qty.protect = 0
//	dw_1.object.page_cnt.tab_order = 20
end if

dw_1.setfocus()

//
//err:
//if ls_chk = 'Y' then
//	Close( this )
//end if


end event

event key;//
choose case key
	case KeyEscape! // 작업취소, 화면종료
		close( this )

	case KeyF8!     // 저장, 대기
		// 작업수량이 하나라도 입력되지 않으면 저장불가.
		// 저장후 자동출력, 재출력도 동일 펑션키 사용.
		// 출력후 대기.(저장후는 dw_1 잠김.)
		wf_f8()

	case KeyF9!     // 재출력
		if dw_1.Enabled = False  then
			wf_barcode_print()  
		end if
end choose

end event

event close;//
w_line.TriggerEvent('ue_retrieve')      // 재조회
w_line.dw_1.ScrollToRow(il_rowposition) // 시작위치 
w_line.dw_1.setfocus()

end event

type cbx_3 from checkbox within w_line_b01
integer x = 3666
integer y = 20
integer width = 631
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 8421376
string text = "비고색상 출력"
end type

type cbx_2 from checkbox within w_line_b01
integer x = 3666
integer y = 92
integer width = 631
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "작업색상 채움"
end type

event clicked;// 작업색상 채움
string ls_colordraw
long   ll_row, ll_Y

dw_1.accepttext()

ll_row  = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN


if this.checked = true then
	ls_colordraw = dw_1.object.color_draw[ll_row]	
	if MessageBox("확인","현재 색상[" + ls_colordraw + "] 으로~n~n" + &
 	              "나머지 품목의 작업색상명으로 채우기 합니까?",Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
else
	setnull(ls_colordraw)
end if

for ll_Y = 1 to dw_1.rowcount()
	dw_1.object.color_draw[ll_Y] = ls_colordraw
next
MessageBox("확인","작업색상명 채우기 완료")

end event

type em_copy from editmask within w_line_b01
integer x = 3328
integer y = 2168
integer width = 169
integer height = 64
integer taborder = 70
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 65535
string text = "1"
boolean border = false
alignment alignment = center!
string mask = "##0"
end type

type st_7 from statictext within w_line_b01
integer x = 3127
integer y = 2168
integer width = 197
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "복사:"
boolean focusrectangle = false
end type

type em_prt from editmask within w_line_b01
integer x = 2747
integer y = 2164
integer width = 366
integer height = 72
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "기본"
boolean border = false
maskdatatype maskdatatype = stringmask!
end type

event modified;// 출력마진 설정
string ls_left, ls_top, ls_prt

ls_left = em_left.text
ls_top  = em_top.text
ls_prt  = em_prt.text

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)
end event

type st_4 from statictext within w_line_b01
integer x = 2469
integer y = 2168
integer width = 274
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "프린터:"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_line_b01
integer x = 2043
integer y = 2168
integer width = 407
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "100x165"
boolean checked = true
end type

event clicked;////
//
//if this.checked = true then
//	dw_2.dataobject = "d_label_165x100_b01"
//	dw_2.SetTransObject(sqlca)
//else
//	dw_2.dataobject = "d_label_13x10_b01"
//	dw_2.SetTransObject(sqlca)
//end if
//
end event

type cbx_unit from checkbox within w_line_b01
integer x = 37
integer y = 2164
integer width = 809
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "계획수량=>작업수량 "
end type

event clicked;// 작업수량 완료
long    ll_row, ll_unitqty, ll_boxqty
double  ldb_order_qty, ldb_rcpt_qty, ldb_order_qty2, ldb_rcpt_qty2
double  ldb_work_qty,  ldb_unit_qty, ldb_rem_qty,    ldb_page_qty

dw_1.AcceptText()

for ll_row = 1 to dw_1.rowcount()
	ldb_order_qty = dw_1.GetItemNumber(ll_row, "order_qty")		// 계획수량
	if isnull(ldb_order_qty) then ldb_order_qty = 0

	ldb_rcpt_qty  = dw_1.GetItemNumber(ll_row, "rcpt_qty")		// 입고수량
	if isnull(ldb_rcpt_qty)  then ldb_rcpt_qty = 0
	
	ldb_order_qty2 = dw_1.GetItemNumber(ll_row, "order_qty2")		// 계획수량2
	if isnull(ldb_order_qty2) then ldb_order_qty2 = 0

	ldb_rcpt_qty2  = dw_1.GetItemNumber(ll_row, "rcpt_qty2")		// 입고수량2
	if isnull(ldb_rcpt_qty2)  then ldb_rcpt_qty2 = 0
	

	ldb_unit_qty  = dw_1.GetItemNumber(ll_row, "unit_qty")		// 단위출력수량
	if isnull(ldb_unit_qty)  then ldb_unit_qty = 0
	
	ldb_page_qty  = dw_1.GetItemNumber(ll_row, "page_qty")		// 출력장수
	if isnull(ldb_page_qty)  then ldb_page_qty = 0

	// 계획수량=>작업수량 
	if this.checked = true then
		ldb_work_qty = ldb_order_qty		// 계획수량

		dw_1.SetItem(ll_row, "work_qty", ldb_work_qty)
		dw_1.SetItem(ll_row, "unit_qty", ldb_work_qty)		
	else
		//  rcpt_qty - order_qty + work_qty
		ldb_work_qty = ldb_order_qty2		// 계획수량
		ldb_rcpt_qty = ldb_rcpt_qty2		// 
		ldb_work_qty = 0						// 계획수량
		
		dw_1.SetItem(ll_row, "work_qty", ldb_work_qty)
		dw_1.SetItem(ll_row, "rcpt_qty", ldb_rcpt_qty)
		dw_1.SetItem(ll_row, "unit_qty", ldb_work_qty)		
	end if
	
	if (ldb_work_qty + ldb_rcpt_qty) > (ldb_order_qty * 1.1) OR (ldb_work_qty * -1 > ldb_rcpt_qty) then
		if this.checked = true then
			MessageBox("확인", string(ll_row) + " 행의 작업수량을 확인 바랍니다.", StopSign!)	// 환경설정의 계산식으로 처리
			ll_row = dw_1.rowcount()		// EXIT
			//RETURN 1
		end if

		cb_3.enabled = false
	else
		cb_3.enabled = true
	end if
	
//	dw_1.object.unit_qty[ll_row] = ldb_order_qty
//	
//	if dw_1.event itemchanged(ll_row, dw_1.object.unit_qty, string(ldb_order_qty)) = 1 then
//		dw_1.event itemerror( ll_row, dw_1.object.unit_qty, string(ldb_order_qty) )
//		ll_row = dw_1.rowcount()		// EXIT
//	end if	
next

end event

type cbx_next from checkbox within w_line_b01
integer x = 3547
integer y = 2168
integer width = 613
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "다음공정 출력"
boolean checked = true
end type

type em_top from editmask within w_line_b01
integer x = 1833
integer y = 2164
integer width = 192
integer height = 64
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
boolean border = false
alignment alignment = center!
string mask = "##0"
end type

event modified;// 출력마진 설정
string ls_left, ls_top, ls_prt

ls_left = em_left.text
ls_top  = em_top.text
ls_prt  = em_prt.text

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)
end event

type em_left from editmask within w_line_b01
integer x = 1253
integer y = 2164
integer width = 192
integer height = 64
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
boolean border = false
alignment alignment = center!
string mask = "##0"
end type

event modified;// 출력마진 설정
string ls_left, ls_top, ls_prt

ls_left = em_left.text
ls_top  = em_top.text
ls_prt  = em_prt.text

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)
end event

type st_6 from statictext within w_line_b01
integer x = 1463
integer y = 2164
integer width = 352
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "상단여백:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_line_b01
integer x = 882
integer y = 2164
integer width = 352
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "왼쪽여백:"
boolean focusrectangle = false
end type

type st_key from statictext within w_line_b01
integer x = 50
integer y = 72
integer width = 617
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 8421376
string text = "F01yymmdd##0"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_line_b01
integer x = 32
integer y = 2252
integer width = 1358
integer height = 156
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F8:저장"
end type

event clicked;// F8:저장, 대기

// 작업수량이 하나라도 입력되지 않으면 저장불가.
// 저장후 자동 출력, 재출력도 동일 펑션키 사용.
// 출력후 대기.(저장후는 dw_1 잠김.)
wf_f8()

end event

type cb_2 from commandbutton within w_line_b01
integer x = 1394
integer y = 2252
integer width = 1358
integer height = 156
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F9:재출력"
end type

event clicked;// F9:재출력
if dw_1.enabled = false then
	wf_barcode_print()  
end if

end event

type cb_1 from commandbutton within w_line_b01
integer x = 2770
integer y = 2252
integer width = 1609
integer height = 156
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ESC:취소"
end type

event clicked;//
close( Parent )

end event

type st_2 from statictext within w_line_b01
integer x = 745
integer y = 872
integer width = 2999
integer height = 312
integer textsize = -22
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 12639424
string text = "재출력은 F9 키를 누르세요.              다음 작업을 위해선 ESC 키를 누르세요."
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_line_b01
string tag = "d_label_13x10_b01"
integer x = 782
integer y = 820
integer width = 2711
integer height = 976
string title = "d_label_165x100_b01"
string dataobject = "d_label_165x100_b01"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_line_b01
integer x = 32
integer y = 48
integer width = 4334
integer height = 116
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "F8:저장  F9:재출력 ESC:취소"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_line_b01
event ue_dwnkey pbm_dwnkey
integer x = 32
integer y = 192
integer width = 4347
integer height = 1960
integer taborder = 10
string title = "none"
string dataobject = "d_line_b01"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_dwnkey;//
choose case key
	case KeyEscape!
		close( Parent )

	case KeyF8!       // 저장, 대기
		// 작업수량이 하나라도 입력되지 않으면 저장불가.
		// 저장후 자동 출력, 재출력도 동일 펑션키 사용.
		// 출력후 대기.(저장후는 dw_1 잠김.)
		wf_f8()

	case KeyF9!       // 재출력
		if dw_1.Enabled = False  then
			wf_barcode_print()  
		end if
end choose

end event

event itemchanged;//
string  ls_colordraw
long    ll_row, ll_num, ll_unitqty, ll_boxqty
integer li_page_qty, li_page_qty2
double  ldb_order_qty, ldb_work_qty, ldb_rcpt_qty, ldb_unit_qty, ldb_page_qty

if isnull( row ) OR row < 1 then RETURN

This.AcceptText()
ll_row = this.getrow()

choose case dwo.name
	case "color_draw"
		// MessageBox SKIP 하기
		
	case else
		ldb_order_qty = This.GetItemNumber(ll_row, "order_qty")		// 계획수량
		ldb_rcpt_qty  = This.GetItemNumber(ll_row, "rcpt_qty")		//
		
		ldb_unit_qty  = This.GetItemNumber(ll_row, "unit_qty")		// 단위출력수량
		ldb_page_qty  = This.GetItemNumber(ll_row, "page_qty")		// 출력장수
		
		ldb_work_qty  = ldb_unit_qty * ldb_page_qty
		
		This.SetItem(ll_row, "work_qty", ldb_work_qty)
		 
		if ldb_work_qty = 0 OR (ldb_work_qty + ldb_rcpt_qty) > (ldb_order_qty * 1.1) OR (ldb_work_qty * -1 > ldb_rcpt_qty) then
			MessageBox("확인", "작업수량을 확인 바랍니다.", StopSign!)	// 환경설정의 계산식으로 처리
			RETURN 1
		end if
end choose

end event

event itemerror;//choose case dwo.name
//	case 'work_qty'
			This.SetItem(row, 'work_qty', 0)
//end choose

RETURN 2

end event

event clicked;//
this.scrolltorow(row)

end event

event editchanged;string ls_colordraw
long   ll_row

if isnull(row) OR row < 1 then RETURN

// 작업색상 복사하기
choose case dwo.name
	case "color_draw"
		if isnumber(data) then 
			ll_row = long(data)
		
			if ll_row > 0 AND ll_row <= this.rowcount() then
				ls_colordraw = this.object.color_draw[ll_row]
				this.object.color_draw[row] = ls_colordraw
			end if
		end if
end choose

end event

type st_3 from statictext within w_line_b01
integer x = 32
integer y = 20
integer width = 4347
integer height = 164
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

