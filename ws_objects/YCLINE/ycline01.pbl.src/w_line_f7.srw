$PBExportHeader$w_line_f7.srw
$PBExportComments$생산라인 라벨출력
forward
global type w_line_f7 from window
end type
type st_7 from statictext within w_line_f7
end type
type em_prt from editmask within w_line_f7
end type
type em_top from editmask within w_line_f7
end type
type em_left from editmask within w_line_f7
end type
type st_6 from statictext within w_line_f7
end type
type st_5 from statictext within w_line_f7
end type
type st_4 from statictext within w_line_f7
end type
type st_key from statictext within w_line_f7
end type
type cb_3 from commandbutton within w_line_f7
end type
type cb_2 from commandbutton within w_line_f7
end type
type cb_1 from commandbutton within w_line_f7
end type
type st_2 from statictext within w_line_f7
end type
type dw_2 from datawindow within w_line_f7
end type
type st_1 from statictext within w_line_f7
end type
type dw_1 from datawindow within w_line_f7
end type
type st_3 from statictext within w_line_f7
end type
end forward

global type w_line_f7 from window
integer width = 3566
integer height = 2528
boolean titlebar = true
string title = "라벨출력(w_line_f7)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
event ue_dwnkey pbm_dwnkey
st_7 st_7
em_prt em_prt
em_top em_top
em_left em_left
st_6 st_6
st_5 st_5
st_4 st_4
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
global w_line_f7 w_line_f7

type variables
long   il_rowposition = 1
string is_packno
end variables

forward prototypes
public subroutine wf_f8 ()
public function boolean wf_sfcday (long al_row)
public function boolean wf_barcode_print ()
public function string wf_ks_create (string as_item_no, string as_flag)
public subroutine wf_qrcode_print ()
public function boolean wf_qrcode ()
public subroutine wf_print (string arg_label_no, long arg_print_no)
end prototypes

public subroutine wf_f8 ();// 저장
integer li_i, li_rowcnt
string  ls_chk

dw_1.AcceptText()

li_rowcnt = dw_1.RowCount()

if dw_1.Enabled = False then
	MessageBox('저장실패', '이미 저장 되었습니다.')
	return
end if

for li_i = 1 to li_rowcnt
	if dw_1.object.work_qty[li_i] = 0 then
		MessageBox('저장실패', '작업수량을 입력하세요.')
		return
	end if
next

ls_chk = 'N'
if MessageBox('확인', '재고에 반영합니다. 작업수량이 정확합니까?', Question!, YesNo!, 1) = 1 then
	for li_i = 1 to li_rowcnt
		if wf_sfcday( li_i ) = False then		// 저장 
			MessageBox('저장실패', '1 행부터 ' + string(li_i - 1) + ' 행까지 저장되었습니다.')
			ls_chk = 'Y'
			return
		end if
	next

	if ls_chk = 'N' then
		
		/* 2019.02.27 jowonsuk qrcode 라벨 출려 반영 여부 */
		IF gs_label = 'OLD' THEN					
			wf_barcode_print()   // 전체 저장완료 했을때, 벤딩용 라벨 출력 + 패킹번호
		else		
			long li_page_qty, i
			li_page_qty = dw_1.GetItemNumber(1, 'page_qty') /*출력장수만큼 */	
			
			// F9:재출력
			for i = 1 to li_page_qty
					wf_qrcode()  	
			next				
		end if
		
		dw_1.enabled = False
		st_2.visible = True
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
string ls_item_no, ls_uom, ls_qa, ls_cust_no, ls_scene_code, ls_itemno_color
string ls_assy_item, ls_assy_qa, ls_area_no, ls_cust_name
string ls_type, ls_mpsorder, ls_sqlerrtext, ls_rem, ls_qa1

double ldb_rcpt_qty, ldb_hebe, ldb_plan_qty
double ldb_order_qty, ldb_solqty, ldb_rlseqty, ldb_work_qty

// 메인 상단에서 날짜 가져오기. 확인.
w_line.dw_r.accepttext()
ldt_date = w_line.dw_r.object.date[1]

dw_1.accepttext()
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
   SET make_qty  = make_qty + :ldb_work_qty, 
	      process_flag = :ls_type
 WHERE division  = :li_division 
   AND wc_no     = :ls_wc_no 
   AND sale_no   = :ls_sale_no
   AND seq_no    = :li_seq 
   AND process_flag <> 'C'
   AND operation = :li_operation;
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	messagebox('오류1','[routtempnew] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
	messagebox('오류2','[routtempnew] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
	    area_no, per_qty, sfc_date, plan_qty, make_qty, mpsorder_order, order_seq)
VALUES (:ls_plan_no, :ls_wc_no, :ls_sale_no, :li_seq, :ls_item_no, :ls_qa,
	    :ls_assy_item, :ls_assy_qa, :ls_uom, :ldb_hebe, 'C',
	    :ls_cust_no, :ls_cust_name, :gs_loc, :ls_scene_code, :ls_itemno_color,
	    :ls_area_no, :li_work_per, :ldt_sfc_dt, :ldb_plan_qty, :ldb_work_qty, :ls_mpsorder, :li_mpsseq);	 
if sqlca.sqlcode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류[Insert]', '[sfcday] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false
end if

/////////////////////////////////////////////////////////////////////
// 4) 입출고 히스토리 추가 ( inaudit insert )
/////////////////////////////////////////////////////////////////////
INSERT INTO inaudit 
       (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,inaudit_type,cost,destination,rem, user_id)
VALUES (:ldt_sfc_dt,:ldt_date,:ls_assy_item,:ls_assy_qa,:ls_plan_no,:ldb_work_qty,0,:gs_loc,'RP',0,:ls_wc_no,'현장작업일보[성형반]', :gs_userid);
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	messagebox('오류23','[inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	RETURN false
end if

/////////////////////////////////////////////////////////////////////
// 5) 생산계획상세 변경
/////////////////////////////////////////////////////////////////////
UPDATE mpsdet SET rcpt_qty = rcpt_qty + :ldb_work_qty WHERE plan_no = :ls_plan_no;
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	messagebox('오류24','[pb_save][mpsdet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
			messagebox('오류25','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN false
		end if
	else
		UPDATE saledet 
		   SET plan_qty = plan_qty - :ldb_work_qty, sol_qty = sol_qty + :ldb_work_qty
		 WHERE order_no = :ls_sale_no AND seq_no = :li_seq;		
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			messagebox('오류25','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
//			messagebox('오류26','판매예약량 update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
//			RETURN false
//		end if					
//	else
//		update item set sales_reserved = sales_reserved + :ldb_work_qty
//		where item_no = :ls_item_no and qa = :ls_qa;			
//		if sqlca.sqlcode < 0 then
//			ls_sqlerrtext = sqlca.sqlerrtext
//			rollback;
//			messagebox('오류26','판매예약량 update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
		messagebox('오류27','[pb_save][saledet] 해당자료가 없거나, DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
			messagebox('오류28','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
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
date   ldt_date
string ls_wcno, ls_itemno, ls_uom, ls_qa, ls_custno, ls_scene, ls_rem, ls_qa1, ls_saleno
string ls_packno, ls_packno1, ls_mpsorder, ls_sqlerrtext, ls_left, ls_top
string ls_ks, ls_ks1, ls_ks2, ls_ks3, ls_ksd
double ld_qty

// 라벨출력
integer li_int, li_rowcnt, li_page_qty, li_seq, li_dw1cnt
string  ls_date

// 메인 상단에서 날짜 가져오기. 확인.
w_line.dw_r.accepttext()

ldt_date  = w_line.dw_r.object.date[1]
li_rowcnt = dw_1.rowcount()

dw_2.Reset()
dw_2.InsertRow(0)

SELECT top 1 convert(char(10), getdate(), 112) INTO :ls_date FROM dual;

/////////////////////////////////////////////////////////////////////
// 패킹헤더(PACK)
/////////////////////////////////////////////////////////////////////
ls_wcno     = dw_1.object.wc_no[1]
ls_custno   = dw_1.object.cust_no[1]
ls_scene    = dw_1.object.scene_code[1]

if dw_1.enabled = false then
	ls_packno1 = st_key.text		// 패킹번호
else
	// 패킹번호(ls_packno1): wc_no 3자리 + yymmdd 4자리 + SEQ 3자리 = 10자리 
	SELECT top 1 max(pack_no) INTO :ls_packno  FROM pack (nolock) 
	 WHERE wc_no = :ls_wcno AND pack_date = :ldt_date;
	if isnull(ls_packno) then ls_packno = ''
	
	if ls_packno = '' then
		ls_packno1 = ls_wcno + string(ldt_date,'yymmdd') + '001'
	else
		ls_packno1 = LeftA(ls_packno,9) + string(long(RightA(ls_packno,3)) + 1,'000')
	end if

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
		for li_int = 1 to li_rowcnt
			ls_itemno   = dw_1.object.item_no[li_int]
			ls_qa       = dw_1.object.qa[li_int]
               ls_mpsorder = dw_1.object.mpsorder_order[li_int]
               li_seq      = dw_1.object.order_seq[li_int]
   		
			ls_ks     = wf_ks_create(ls_itemno, '1')
			ls_ks1    = wf_ks_create(ls_itemno, '2')
			ls_ks2    = wf_ks_create(ls_itemno, '3')
			ls_ks3    = wf_ks_create(ls_itemno, '4')
			ls_ksd    = wf_ks_create(ls_itemno, '5')
		
			ls_qa1    = RightA(dw_1.object.qa[li_int],5)
			ls_rem    = dw_1.object.rem[li_int]
			ld_qty    = dw_1.object.unit_qty[li_int]
			
			INSERT INTO packdet (pack_no, seq_no, qa1, rem, pack_qty, mpsorder_order, order_seq)
			VALUES ( :ls_packno1, :li_int, :ls_qa1, :ls_rem, :ld_qty, :ls_mpsorder, :li_seq );
			if SQLCA.SqlCode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('오류', string(li_int) + '행 [packdet]오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
				RETURN false
			else
				COMMIT;
			end if
		next
	end if
	st_key.text  = ls_packno1
end if

// 출력용으로 이동(벤딩이 7개 이상일때 처리 해야 됨)
ls_itemno = dw_1.object.item_no[1]
dw_2.object.ks[1]   = wf_ks_create(ls_itemno, '1')
dw_2.object.ks1[1]  = wf_ks_create(ls_itemno, '2')
dw_2.object.ks2[1]  = wf_ks_create(ls_itemno, '3')
dw_2.object.ks3[1]  = wf_ks_create(ls_itemno, '4')
dw_2.object.ksd1[1] = wf_ks_create(ls_itemno, '5')

dw_2.object.lb_item_no[1]    = dw_1.object.item_no[1]
dw_2.object.lb_item_name[1]  = dw_1.object.item_name[1]
dw_2.object.lb_qa[1]         = LeftA(dw_1.object.qa[1],13)
dw_2.object.lb_cust_name[1]  = dw_1.object.cust_name[1]
dw_2.object.lb_scene_name[1] = dw_1.object.scene_desc[1]
dw_2.object.lb_makedate[1]   = LeftA(ls_date,10)

ls_saleno  = dw_1.object.sale_no[1]
dw_2.object.lb_saleno[1]     = LeftA(ls_saleno,1) + RightA(ls_saleno,8)
dw_2.object.lb_packno1[1]    = "*" + ls_packno1 + "*"
dw_2.object.lb_packno2[1]    = "*" + ls_packno1 + "*"
dw_2.object.lb_packno3[1]    = ls_packno1


// 패킹상세(Looping)
for li_int = 1 to li_rowcnt
	ls_qa1 = RightA(dw_1.object.qa[li_int],5)
	ls_rem = dw_1.object.rem[li_int]
	ld_qty = dw_1.object.unit_qty[li_int]

	dw_2.setitem( 1, 'lb_length' + string(li_int), integer(ls_qa1) )
	dw_2.setitem( 1, 'lb_rem'    + string(li_int), ls_rem )
	dw_2.setitem( 1, 'lb_qty'    + string(li_int), ld_qty )
next

li_page_qty = dw_1.GetItemNumber(1, 'page_qty')

ls_left = em_left.text
ls_top  = em_top.text

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)

dw_2.modify("DataWindow.print.margin.left = " + ls_left )
dw_2.modify("DataWindow.print.margin.top  = " + ls_top  )
dw_2.Object.DataWindow.Print.Copies = li_page_qty
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
			'PACSMT6K0Z','PACZCR4K0Z','PACZCR5K0Z','PACZCR6K0Z', 'PACSMBEK00', 'PACSMBGK00'
			
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

public subroutine wf_qrcode_print ();long   li_find,  li_end, ll_row, ll_cnt, l_seq_no, l_retrieve_cnt
int      l_print_start_group, l_print_group, l_print_group_seq, l_print_group_original
string old_dwnm, ls_label_check, ls_part_yn, ls_label_no, ls_order_no, ls_item_no, ls_qa, ls_qrdata, ls_data, l_base_data, ls_qrcode, ls_origin_lable_no
datawindow dw_prt
dwItemStatus  l_status
decimal l_label_no, l_issue_qty, l_req_qty
datetime l_sys_date
		
		
//	l_base_data = ''		/*수주 거래처, 현장등 정보 */
//
//	/*1. 수주의 기본정보를 받는다. */
//	/*select   distinct '\'+substring(a.label_no,1,14)+'\'+substring(a.label_no,15,5)+'\'+convert(nvarchar(50), d.cust_name)+'\'+convert(nvarchar(40),  e.scene_desc )*/
//	/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번에서 -> 출고의뢰일자(8자리)+담당자(10자리)+차수(5자리)+출고의뢰순번(5자리)+수주번호+라벨순번(5)*/
//	/*select   distinct substring(a.label_no,1,8)+'|'+substring(a.label_no,9,10)+'|'+substring(a.label_no,19,5)+'|'+substring(a.label_no,24,5)+'|'+substring(a.label_no,29,14)+'|'+substring(a.label_no,43,5)*/
//	/*2019.01.25 jowonsuk qrcode 원복*/
//	select   distinct a.label_no+'|'+c.cust_no+'|'+c.scene_code
//	 	 into :l_base_data
//	from    label_item a with(nolock) 
//						 inner join groupitem b with(nolock) on a.item_no  = b.item_no
//						 inner join sale c with(nolock) on a.order_no = c.order_no
//						 inner join customer d with(nolock) on c.cust_no = d.cust_no
//						 inner join scene e with(nolock) on c.scene_code = e.scene_code
//	  where a.req_date    = :i_req_date
//			and a.salesman  = :is_salesman
//			and a.req_seq    = :i_req_seq
//			and a.req_flag    = :is_req_flag
//			and a.seq           = :i_seq
//			and a.sys_date = :l_sys_date;
//				
//	
//	dw_2.retrieve(i_req_date, is_salesman, i_req_seq, is_req_flag, i_seq)		
//	
//	select  max(a.print_group)
//		into  :l_print_group
//	  from  label_item a
//     where a.req_date    = :i_req_date
//      and a.salesman  = :is_salesman
//      and a.req_seq    = :i_req_seq
//      and a.req_flag    = :is_req_flag
//      and a.seq           = :i_seq
//      and a.sys_date = :l_sys_date;
//	
//	ll_cnt = l_print_group 				/* 동일 수주건의 분할 건수 */	
//	l_print_start_group = 1	
//
//		
//		/*1. 부품의 정보를 받는다.  수주의 기본정보를 받는다. */
//		DECLARE label_item_test_cursor CURSOR FOR  
//		/*select  a.print_group, a.label_no,  '\'+a.item_no+'\' + convert(nvarchar(60), b.item_name) +'\'+a.qa+'\'+convert(char(18), a.issue_qty )*/
//		select  a.print_group, a.label_no,  '*'+convert(char(3),a.seq_no)+'|'+a.item_no+ '|'+a.qa+'|' , isnull(a.issue_qty,0) issue_qty
//		from    label_item a with(nolock) 
//							 inner join groupitem b with(nolock) on a.item_no  = b.item_no
//							 inner join sale c with(nolock) on a.order_no = c.order_no
//							 inner join customer d with(nolock) on c.cust_no = d.cust_no
//							 inner join scene e with(nolock) on c.scene_code = e.scene_code
//		  where a.req_date    = :i_req_date
//				and a.salesman  = :is_salesman
//				and a.req_seq    = :i_req_seq
//				and a.req_flag    = :is_req_flag
//				and a.seq           = :i_seq
//				and a.sys_date = :l_sys_date	/* 차후 print_no로 대체 */
//			and a.print_group = :l_print_group
//		order by a.print_group, a.print_group_seq	;
//		
//		for l_print_group = l_print_start_group to ll_cnt			 
//			
//				ls_qrdata = ''					/*초기화 */
//		
//				OPEN label_item_test_cursor;
//				
//						FETCH label_item_test_cursor INTO :l_print_group, :ls_label_no, :ls_data, :l_req_qty;
//				
//						Do While sqlca.sqlcode = 0		  	
//							
//								ls_qrdata = ls_qrdata + ls_data+trim(string(l_req_qty))
//									
//								FETCH label_item_test_cursor INTO :l_print_group, :ls_label_no, :ls_data, :l_req_qty;			
//								
//						Loop
//				
//				CLOSE label_item_test_cursor;
//				
//				ls_qrdata = l_base_data + ls_qrdata+'$'	/*2019.02.01 JOWONSUK 끝을 구분하기 위해서 구분자로 $*/
//		
//				gf_qrcode_create1(ls_qrdata, 'qrcode.bmp')
//				
//				wf_print(ls_label_no)				
//
//		next
end subroutine

public function boolean wf_qrcode ();                                                                                                                                                                                                                                                                                                                                                                 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// QRCODE 작성 
// 2019.02.27
// jowonsuk  
// QRCODE 형태
// 수주번호|5자리순번|거래처코드|현장코드       (기본마스터)
// *|수주번호순번|품목코드|규격|생산량
// *|수주번호순번|품목코드|규격|생산량  N개
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
date   ldt_date
string ls_wcno, ls_itemno, ls_uom, ls_qa, ls_custno, ls_scene, ls_rem, ls_qa1, ls_saleno, ls_pre_order_no
string ls_packno, ls_packno1, ls_mpsorder, ls_sqlerrtext, ls_left, ls_top
string ls_ks, ls_ks1, ls_ks2, ls_ks3, ls_ksd
double ld_qty

// 라벨출력
integer li_int, li_rowcnt, li_page_qty, li_seq, li_dw1cnt

/*qrcode jowonsuk 2019.02.20*/
string ls_label_no, ls_order_no, ls_qrdata, ls_data, l_base_data, ls_qrcode, ls_origin_lable_no
decimal l_label_no, l_issue_qty, l_req_qty
int      l_print_start_group, l_print_group, l_print_group_seq, l_print_group_original, l_print_no
datetime l_sys_date
long       l_seq_no, ll_cnt

// 메인 상단에서 날짜 가져오기. 확인.
w_line.dw_r.accepttext()

ldt_date  = w_line.dw_r.object.date[1]
li_rowcnt = dw_1.rowcount()

dw_2.Reset()
dw_2.InsertRow(0)

if dw_1.enabled = false then
	ls_order_no = st_key.text		// 패킹번호
else
	 
		/* qrcode jowonsuk 2019.02.20 */		
		 l_sys_date = gf_today()	 
		 l_print_group = 1
		 l_print_group_seq = 1	
		 ls_pre_order_no = ''

		 /*해당 라벨 발행건인지  */	 
		select  isnull(max(print_no),0) +  1
		into :l_print_no		
		 from label_item
		where convert(CHAR(8), sys_date, 112)  = convert(char(8), getdate(),112);		 
	 
		if sqlca.sqlcode <> 0 then 
			l_print_no = 1
		end if

		for li_int = 1 to li_rowcnt
			
			ls_itemno   = dw_1.object.item_no[li_int]
			ls_qa       = dw_1.object.qa[li_int]
     		     ls_mpsorder = dw_1.object.mpsorder_order[li_int]
     		     li_seq      = dw_1.object.order_seq[li_int]   					
			ls_origin_lable_no = dw_1.object.sale_no[li_int]  /*수주번호*/
			ls_order_no = dw_1.object.sale_no[li_int]
			l_seq_no = dw_1.object.seq_no[li_int]					
//			l_issue_qty = dw_1.object.work_qty[li_int]
			l_issue_qty = dw_1.object.unit_qty[li_int]

			if l_print_group_seq = 1 then
				
				
			    if LeftA(ls_origin_lable_no, 3) = 'SNO' then
					
					/*라벨 번호 따기 */
					select  isnull(max(substring(label_no,12,5)),0) + 1 label_no
					 into :l_label_no
					 from label_item
					 where label_no like :ls_origin_lable_no+'%'
						and order_no = :ls_origin_lable_no
						and isnumeric(substring(label_no,12,5)) = 1;					
					
			    else
					
					/*라벨 번호 따기 */
					select  isnull(max(substring(label_no,15,5)),0) + 1 label_no
					 into :l_label_no
					 from label_item
					 where label_no like :ls_origin_lable_no+'%'
						and order_no = :ls_origin_lable_no
						and isnumeric(substring(label_no,15,5)) = 1;					
						
			    end if
				
					
				ls_pre_order_no = ls_order_no
				
			else
			
				select  order_no
				 into :ls_pre_order_no
				 from label_item
				 where sys_date = :l_sys_date
					and print_no = :l_print_no
					and print_group_seq = (:l_print_group_seq - 1);										
					
			end if
								
			if l_print_group_seq = 4 then /*3건을 라벨 발행하고 있으므로 4이면 새로 시작. */
				l_print_group_seq = 1					
				l_print_group = l_print_group + 1
			else
				if ls_pre_order_no <> ls_order_no then
					l_print_group_seq = 1					
					l_print_group = l_print_group + 1					
				end if												
			end if		
			
			if l_print_group_seq = 1 then
				
				 if LeftA(ls_origin_lable_no, 3) = 'SNO' then
						
						/*라벨 번호 따기 */
						select  isnull(max(substring(label_no,12,5)),0) + 1 label_no
						 into :l_label_no
						 from label_item
						 where label_no like :ls_origin_lable_no+'%'
							and order_no = :ls_origin_lable_no
							and isnumeric(substring(label_no,12,5)) = 1;					
						
					 else
						
						/*라벨 번호 따기 */
						select  isnull(max(substring(label_no,15,5)),0) + 1 label_no
						 into :l_label_no
						 from label_item
						 where label_no like :ls_origin_lable_no+'%'
							and order_no = :ls_origin_lable_no
						     and isnumeric(substring(label_no,15,5)) = 1;					
							
					 end if
					
			end if

			/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번*/
			ls_label_no = ls_origin_lable_no + trim(string(l_label_no, '00000'))
							
			insert into label_item   (     req_date,        salesman,       req_seq,      req_flag,      seq,                    order_no,          seq_no,             label_no,          item_no,          qa,       issue_qty,        sys_date,		 print_group,        print_group_seq,         print_no,      use_yn,   mpsorder_order,    order_seq, color )
						 	  values   ( :l_sys_date,       :gs_userid,                  1,                 '',          1,              :ls_order_no,      :l_seq_no,       :ls_label_no,       :ls_itemno,    :ls_qa,    :l_issue_qty,    :l_sys_date,	   :l_print_group,    :l_print_group_seq,     :l_print_no,              'N',        :ls_mpsorder,          :li_seq,  '' );
								
								
			if SQLCA.SqlCode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('오류', string(li_int) + '행 [label_item]오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
				RETURN false
			else
				COMMIT;
			end if								
			
//			if l_print_group_seq = 1 then				
//				ls_pre_order_no = ls_order_no
//			else
//			
//				select  order_no
//				 into :ls_pre_order_no
//				 from label_item
//				 where sys_date = :l_sys_date
//					and print_no = :l_print_no
//					and print_group_seq = (:l_print_group_seq - 1);										
//					
//			end if
//				
			l_print_group_seq = l_print_group_seq  + 1				
//				
//			if l_print_group_seq = 4 then /*3건을 라벨 발행하고 있으므로 4이면 새로 시작. */
//				l_print_group_seq = 1					
//				l_print_group = l_print_group + 1
//			else
//				if ls_pre_order_no <> ls_order_no then
//					l_print_group_seq = 1					
//					l_print_group = l_print_group + 1					
//				end if												
//			end if
											
		next
		
		select  max(a.print_group)
			into  :l_print_group
		  from  label_item a
		  where a.sys_date    = :l_sys_date
			and a.print_no      = :l_print_no;
		
		ll_cnt = l_print_group 				/* 동일 수주건의 분할 건수 */	
		l_print_start_group = 1		
		
		st_key.text  = ls_order_no
end if


/*수주 거래처, 현장등 정보 */
/*1. 부품의 정보를 받는다.  수주의 기본정보를 받는다. */
DECLARE label_item_test_cursor CURSOR FOR  
select  a.label_no+'|'+c.cust_no+'|'+c.scene_code, a.print_group, a.label_no,  '*'+convert(char(3),a.seq_no)+'|'+a.item_no+ '|'+a.qa+'|' , isnull(a.issue_qty,0) issue_qty
from    label_item a with(nolock) 
					 inner join groupitem b with(nolock) on a.item_no  = b.item_no
					 left outer join sale c with(nolock) on a.order_no = c.order_no
					 left outer join customer d with(nolock) on c.cust_no = d.cust_no
					 left outer join scene e with(nolock) on c.scene_code = e.scene_code
  where a.req_date    = :l_sys_date      
      and a.sys_date = :l_sys_date
      and a.print_no   = :l_print_no
	and a.print_group = :l_print_group
order by a.print_group, a.print_group_seq	;


for l_print_group = l_print_start_group to ll_cnt			 
	
		ls_qrdata = ''					/*초기화 */
		l_base_data = ''	

		OPEN label_item_test_cursor;
		
				FETCH label_item_test_cursor INTO :l_base_data, :l_print_group, :ls_label_no, :ls_data, :l_req_qty;
		
				Do While sqlca.sqlcode = 0		  	
					
						ls_qrdata = ls_qrdata + ls_data+trim(string(l_req_qty))
							
						FETCH label_item_test_cursor INTO  :l_base_data, :l_print_group, :ls_label_no, :ls_data, :l_req_qty;			
						
				Loop
		
		CLOSE label_item_test_cursor;
		
		ls_qrdata = l_base_data + ls_qrdata	/*2019.02.22 JOWONSUK 끝을 구분하기 위해서 구분자로 $ 다시 뺌 */

		gf_qrcode_create1(ls_qrdata, 'qrcode.bmp')		
		
		wf_print(ls_label_no, l_print_no)				

next
			

				
RETURN TRUE


end function

public subroutine wf_print (string arg_label_no, long arg_print_no);/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// QRCODE 라벨 출력
// 2019.02.27
// jowonsuk  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
datetime ld_date
decimal    ld_amount, l_issue_qty, ld_qty
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt, ll_qty, li_page_qty
string ls_order_no, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_item_no, ls_item_name, ls_qa, ls_bigo, ls_cnt, ls_label_no,  ls_rem, ls_qa1, LS_RIGHT
string ls_left, ls_top, ls_prt, ls_date
int    li_seq_no

DECLARE label_print_cursor CURSOR FOR  
select   a.order_no,
		  d.cust_name,
		  e.scene_desc,
		  a.label_no,
		  a.item_no, 
		  b.item_name,
		  a.qa, 
		  a.issue_qty,
		  f.rem,
		   substring(a.qa,15,5) qa1,
		  convert(char(8), a.sys_date, 112) sys_date
from    label_item a with(nolock) 
            inner join groupitem b with(nolock) on a.item_no  = b.item_no
            left outer join sale c with(nolock) on a.order_no = c.order_no
		  left outer join  saledet f with(nolock) on a.order_no = f.order_no and a.seq_no = f.seq_no
/*		  left outer join  mpsdet f with(nolock) on a.mpsorder_order = f.mpsorder_order and a.order_seq = f.order_seq*/
            left outer join customer d with(nolock) on c.cust_no = d.cust_no
            left outer join scene e with(nolock) on c.scene_code = e.scene_code
  where a.label_no = :arg_label_no
order by a.print_group, a.print_group_seq;



//DEBUGBREAK()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username

dw_2.reset()
dw_2.insertrow(0)

OPEN label_print_cursor;

		FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :ld_qty, :ls_rem, :ls_qa1, :ls_date;
		
//		dw_2.object.order_no[1]   = ls_order_no
		dw_2.object.lb_cust_name[1]  = ls_cust_name
		dw_2.object.lb_scene_name[1] = ls_scene_name
//		dw_2.object.label_no[1] 	     = ls_label_no

		/*2019-11-12 jowonsuk 개선*/
		dw_2.object.lb_item_no[1]    = dw_1.object.item_no[1]
		dw_2.object.lb_item_name[1]  = dw_1.object.item_name[1]
		dw_2.object.lb_qa[1]         = LeftA(dw_1.object.qa[1],13)
		dw_2.object.lb_makedate[1]   = ls_date
		
		IF gs_label = 'OLD' THEN
			dw_2.object.lb_saleno[1]     = LeftA(ls_order_no,1) + RightA(ls_order_no,8)
		else	
			dw_2.object.lb_saleno[1]     = ls_order_no
			//ls_left = '50'
			//ls_top  = '50'	
		END IF

		Do While sqlca.sqlcode = 0		  	
			ll_line = ll_line + 1
			
//			ls_qa1 = right(dw_1.object.qa[ll_line],5)
//			ls_rem = dw_1.object.rem[ll_line]
//			ld_qty = dw_1.object.unit_qty[ll_line]
		
			dw_2.setitem( 1, 'lb_length' + string(ll_line), integer(ls_qa1) )
			dw_2.setitem( 1, 'lb_rem'    + string(ll_line), ls_rem )
			dw_2.setitem( 1, 'lb_qty'    + string(ll_line), ld_qty )
			
					
			FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :ld_qty, :ls_rem, :ls_qa1, :ls_date;
		Loop

CLOSE label_print_cursor;

///* 실제 ACTIVE 상태의 라벨에 YES를 찍는다. */
//update label_item
//set use_yn  = 'N'				
//where ORDER_NO = SUBSTRING(:ls_label_no,1,14)
//    and print_no <> :arg_print_no;

//update label_item
//set use_yn  = 'Y'				
//where label_no = :ls_label_no
//    and print_no <> :arg_print_no;
	 
	 
//select convert( char(8), sys_date, 112)
//   into :ls_date
//from label_item
//where label_no = :ls_label_no
//    and print_no = :arg_print_no;

		
// 출력용으로 이동(벤딩이 7개 이상일때 처리 해야 됨)
//ls_itemno = dw_1.object.item_no[1]

/*
dw_2.object.ks[1]   =  wf_ks_create(ls_item_no, '1')
dw_2.object.ks1[1]  = wf_ks_create(ls_item_no, '2')
dw_2.object.ks2[1]  = wf_ks_create(ls_item_no, '3')
dw_2.object.ks3[1]  = wf_ks_create(ls_item_no, '4')
dw_2.object.ksd1[1] = wf_ks_create(ls_item_no, '5')
*/

/*2019.04.04 jowonsuk ks자료 불러오는거 db로 변경 */
string ls_value1,  ls_value2,  ls_value3, ls_value4,  ls_value5

SELECT B.VALUE1, B.VALUE2, B.VALUE3, B.VALUE4,  B.VALUE5
INTO       :ls_value1,  :ls_value2,  :ls_value3, :ls_value4,    :ls_value5
FROM GROUPITEM A LEFT OUTER JOIN V_GROUP_PRINT B ON A.GROUP_PRINT = B.GUBUN
WHERE A.ITEM_NO = :ls_item_no;

dw_2.object.ks[1]   = ls_value1
dw_2.object.ks1[1]  = ls_value2
dw_2.object.ks2[1]  = ls_value3
dw_2.object.ks3[1]  = ls_value4
dw_2.object.ksd1[1] = ls_value5

//dw_2.object.lb_item_no[1]    = dw_1.object.item_no[1]
//dw_2.object.lb_item_name[1]  = dw_1.object.item_name[1]
//dw_2.object.lb_qa[1]         = left(dw_1.object.qa[1],13)
//dw_2.object.lb_cust_name[1]  = dw_1.object.cust_name[1]
//dw_2.object.lb_scene_name[1] = dw_1.object.scene_desc[1]
//dw_2.object.lb_makedate[1]   = ls_date
//
///*2019.04.03 jownsuk 수주번호 full */
IF gs_label = 'OLD' THEN
//	dw_2.object.lb_saleno[1]     = left(ls_order_no,1) + right(ls_order_no,8)
	ls_left = em_left.text
	ls_top  = em_top.text	
else	
//	dw_2.object.lb_saleno[1]     = ls_order_no
//	//ls_left = '50'
//	//ls_top  = '50'	
//	ls_prt = em_prt.text
END IF
//li_page_qty = dw_1.GetItemNumber(1, 'page_qty')

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)

if ls_prt = "" OR ls_prt = "기본" then
else
	dw_2.Object.DataWindow.Printer = ls_prt
end if

//
LS_RIGHT  = ProfileString("YCLINE.INI","Database","right",  " ")
ls_left = '0'
ls_top = '0'
LS_RIGHT = '0'

dw_2.modify("DataWindow.print.margin.left = " + ls_left )
dw_2.modify("DataWindow.print.margin.top  = " + ls_top  )
dw_2.modify("DataWindow.print.margin.right  = " + LS_RIGHT  )
dw_2.Object.DataWindow.Print.Copies = 1
dw_2.print()



///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// QRCODE 라벨 출력
//// 2019.02.27
//// jowonsuk  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//datetime ld_date
//decimal    ld_amount, l_issue_qty, ld_qty
//long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt, ll_qty, li_page_qty
//string ls_order_no, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username, ls_color
//string ls_item_no, ls_item_name, ls_qa, ls_bigo, ls_cnt, ls_label_no,  ls_rem, ls_qa1
//string ls_left, ls_top, ls_prt, ls_date
//int    li_seq_no
//
//DECLARE label_print_cursor CURSOR FOR  
//select   a.order_no,
//		  d.cust_name,
//		  e.scene_desc,
//		  a.label_no,
//		  a.item_no, 
//		  b.item_name,
//		  a.qa, 
//		  a.issue_qty,
//		  f.rem,
//		   substring(a.qa,15,5) qa1,
//		  a.color
//from    label_item a with(nolock) 
//            inner join groupitem b with(nolock) on a.item_no  = b.item_no
//            left outer join sale c with(nolock) on a.order_no = c.order_no
//		  left outer join  saledet f with(nolock) on a.order_no = f.order_no and a.seq_no = f.seq_no
///*		  left outer join  mpsdet f with(nolock) on a.mpsorder_order = f.mpsorder_order and a.order_seq = f.order_seq*/
//            left outer join customer d with(nolock) on c.cust_no = d.cust_no
//            left outer join scene e with(nolock) on c.scene_code = e.scene_code
//  where a.label_no = :arg_label_no
//order by a.print_group, a.print_group_seq;
//
//
//DEBUGBREAK()
//
//ll_line    = 0
//ll_pagecnt = 0
//
//ls_username = gs_username
//dw_2.reset()
//dw_2.insertrow(0)
//
//OPEN label_print_cursor;
//
//		FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :ld_qty, :ls_rem, :ls_qa1, :ls_color;
//		
////		dw_2.object.order_no[1]   = ls_order_no
//		dw_2.object.cust_name[1]  = ls_cust_name
//		dw_2.object.scene_name[1] = ls_scene_name
////		dw_2.object.label_no[1] 	     = ls_label_no
//
//		Do While sqlca.sqlcode = 0		  	
//			ll_line = ll_line + 1
//			
////			ls_qa1 = right(dw_1.object.qa[ll_line],5)
////			ls_rem = dw_1.object.rem[ll_line]
////			ld_qty = dw_1.object.unit_qty[ll_line]
//		
//			dw_2.setitem( 1, "item_name" + string(ll_line,"00"), ls_item_name)	// 품명
//			dw_2.setitem( 1, "qa"     + string(ll_line,"00"), ls_qa)			// 규격
//			dw_2.setitem( 1, "qty"    + string(ll_line,"00"), ld_qty )	// 수량
//			dw_2.setitem( 1, "color"  + string(ll_line,"00"), ls_color )	// 색상
//						
//			FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :ld_qty, :ls_rem, :ls_qa1, :ls_color;
//		Loop
//
//CLOSE label_print_cursor;
//
/////* 실제 ACTIVE 상태의 라벨에 YES를 찍는다. */
////update label_item
////set use_yn  = 'N'				
////where ORDER_NO = SUBSTRING(:ls_label_no,1,14)
////    and print_no <> :arg_print_no;
//
////update label_item
////set use_yn  = 'Y'				
////where label_no = :ls_label_no
////    and print_no <> :arg_print_no;
//	 
//	 
//select convert( char(10), sys_date, 121)
//   into :ls_date
//from label_item
//where label_no = :ls_label_no
//    and print_no = :arg_print_no;
//
//		
////dw_2.object.cust_name[1]  = dw_1.object.cust_name[1]
////dw_2.object.scene_name[1] = dw_1.object.scene_desc[1]
//dw_2.object.makedate[1]   = ls_date
//dw_2.object.label_no[1] = ls_label_no
//
//// 출력마진 설정
//ls_left = em_left.text
//ls_top  = em_top.text
////ls_prt  = em_prt.text
////li_copy = integer(em_copy.text)
//
//SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
//SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
//SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)
//
//if isnull(ls_prt) or ls_prt = "" OR ls_prt = "기본" then
//else
//	dw_2.Object.DataWindow.Printer = ls_prt
//end if
//
//dw_2.modify("DataWindow.print.margin.left = " + ls_left )
//dw_2.modify("DataWindow.print.margin.top  = " + ls_top  )
//dw_2.modify("DataWindow.print.Margin.Bottom = 0.000" )
//dw_2.modify("DataWindow.print.Margin.Right  = 0.000" )
//
//
////ls_left = em_left.text
////ls_top  = em_top.text
////
////SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
////SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
////
////dw_2.modify("DataWindow.print.margin.left = " + ls_left )
////dw_2.modify("DataWindow.print.margin.top  = " + ls_top  )
//dw_2.Object.DataWindow.Print.Copies = 1
//dw_2.print()
end subroutine

on w_line_f7.create
this.st_7=create st_7
this.em_prt=create em_prt
this.em_top=create em_top
this.em_left=create em_left
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_key=create st_key
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.dw_2=create dw_2
this.st_1=create st_1
this.dw_1=create dw_1
this.st_3=create st_3
this.Control[]={this.st_7,&
this.em_prt,&
this.em_top,&
this.em_left,&
this.st_6,&
this.st_5,&
this.st_4,&
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

on w_line_f7.destroy
destroy(this.st_7)
destroy(this.em_prt)
destroy(this.em_top)
destroy(this.em_left)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
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
string  lsa_order_no[]
integer lia_order_seq[]

integer li_cnt
long    ll_dw1row, ll_dw1cnt, ll_selrow
string  ls_wcno, ls_areano, ls_qa, ls_selqa, ls_chk, ls_cust, ls_scene
date    ld_date


em_left.text =ProfileString("YCLINE.INI","Database","LEFT", " ")
em_top.text  =ProfileString("YCLINE.INI","Database","TOP",  " ")
em_prt.text  =ProfileString("YCLINE.INI","Database","PRINT"," ")
if em_prt.text = "" then em_prt.text = "기본"

dw_1.SetTransObject(sqlca)
dw_1.Object.DataWindow.Zoom = gl_resolution

if gs_label = 'OLD'  then
	dw_2.DataObject = 'd_label_17x10_gab'
else
	dw_2.DataObject = 'd_label_17x10_gab_new'
end if

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
	lsa_order_no[li_cnt]  = w_line.dw_1.object.order_no[ll_selrow]
	lia_order_seq[li_cnt] = w_line.dw_1.object.order_seq[ll_selrow]

	if li_cnt < 2 then
		ls_qa    = LeftA(trim(w_line.dw_1.object.qa[ll_selrow]), 13)
		ls_cust  = w_line.dw_1.object.cust_no[ll_selrow]
		ls_scene = w_line.dw_1.object.scene_code[ll_selrow]
		
		il_rowposition = ll_selrow
	end if
	
	if gs_label = 'OLD'  then
	
		ls_selqa = trim(w_line.dw_1.object.qa[ll_selrow])
		
		if ls_qa <> LeftA(ls_selqa,13) then
			MessageBox("선택오류", "선택한 항목중에 규격이 다른것이 있습니다.~r~n" &
						+ "같은 규격만 선택하십시요.") 
		 //Close(w_line_f7) //현재 상태에서 종료하고 메인윈도우로 가지 못하는 문제. 윈도우는 종료해도 스크립트 실행은 끝가지 간다.
			ls_chk = 'Y'
			goto err
		elseif ls_cust  <> w_line.dw_1.object.cust_no[ll_selrow] &
			 or ls_scene <> w_line.dw_1.object.scene_code[ll_selrow] then
			MessageBox("선택오류", "선택한 항목중에 현장또는 거래처가 다른것이 있습니다.~r~n" &
						+ "같은 현장또는 거래처만 선택하십시요.") 
		 //Close(w_line_f7) //현재 상테에서 종료하고 메인윈도우로 가지 못하는 문제. 윈도우는 종료해도 스크립트 실행은 끝가지 간다.
			ls_chk = 'Y'
			goto err
		end if
	else		
	end if
	
	li_cnt = li_cnt + 1
	ll_selrow =  w_line.dw_1.GetSelectedRow(li_cnt - 1) // (수)다음번 선택된 row
	
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
	lsa_order_no[1]  = w_line.dw_1.object.order_no[ll_dw1row] 
	lia_order_seq[1] = w_line.dw_1.object.order_seq[ll_dw1row]
	il_rowposition   = ll_dw1row
end if

// 조회
ll_dw1cnt = dw_1.Retrieve( ls_wcno, ld_date, ls_areano, lsa_order_no, lia_order_seq )


if gs_label = 'OLD' then

	if ll_dw1cnt > 1 then
		dw_1.object.page_qty.protect = 1
	//	dw_1.object.page_cnt.tab_order = 0
	else
		dw_1.object.page_qty.protect = 0
	//	dw_1.object.page_cnt.tab_order = 20
	end if
	
else	
	
	if ll_dw1cnt > 1 then
		dw_1.object.page_qty.protect = 1
	//	dw_1.object.page_cnt.tab_order = 0
	else
		dw_1.object.page_qty.protect = 0
	//	dw_1.object.page_cnt.tab_order = 20
	end if
	
end if

dw_1.setfocus()


err:
if ls_chk = 'Y' then
	Close( this )
end if



end event

event key;dw_1.accepttext( )
						
choose case key
	case KeyEscape! // 작업취소, 화면종료
		close(w_Line_F7)

	case KeyF8!     // 저장, 대기
		// 작업수량이 하나라도 입력되지 않으면 저장불가.
		// 저장후 자동출력, 재출력도 동일 펑션키 사용.
		// 출력후 대기.(저장후는 dw_1 잠김.)
		wf_f8()

	case KeyF9!     // 재출력
			
			if dw_1.Enabled = False  then			
				
					if gs_label = 'OLD' then
						
						wf_barcode_print()  
						
					else			
					
						long li_page_qty, i
						li_page_qty = dw_1.GetItemNumber(1, 'page_qty') /*출력장수만큼 */	

						// F9:재출력
						for i = 1 to li_page_qty
								wf_qrcode()  	
						next			
							
					end if
				
			end if
			
end choose

end event

event close;//
w_line.TriggerEvent('ue_retrieve')      // 재조회
w_line.dw_1.ScrollToRow(il_rowposition) // 시작위치 
w_line.dw_1.setfocus()

end event

type st_7 from statictext within w_line_f7
boolean visible = false
integer x = 2898
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
boolean enabled = false
string text = "프린터:"
boolean focusrectangle = false
end type

type em_prt from editmask within w_line_f7
boolean visible = false
integer x = 3177
integer y = 2164
integer width = 366
integer height = 72
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
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

type em_top from editmask within w_line_f7
integer x = 2816
integer y = 2164
integer width = 261
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
string mask = "###"
end type

type em_left from editmask within w_line_f7
integer x = 2158
integer y = 2164
integer width = 261
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
string mask = "###"
end type

type st_6 from statictext within w_line_f7
integer x = 2450
integer y = 2164
integer width = 370
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

type st_5 from statictext within w_line_f7
integer x = 1792
integer y = 2164
integer width = 370
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

type st_4 from statictext within w_line_f7
integer x = 32
integer y = 2164
integer width = 1545
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "같은규격,현장또는 거래처만 출력합니다."
boolean focusrectangle = false
end type

type st_key from statictext within w_line_f7
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

type cb_3 from commandbutton within w_line_f7
integer x = 32
integer y = 2252
integer width = 1125
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

type cb_2 from commandbutton within w_line_f7
integer x = 1175
integer y = 2252
integer width = 1125
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

event clicked;//long li_page_qty, i
//li_page_qty = dw_1.GetItemNumber(1, 'page_qty') /*출력장수만큼 */

//li_page_qty = 1

// F9:재출력

dw_1.accepttext()
	
/* 2019.02.27 jowonsuk qrcode 라벨 출려 반영 여부 */
if gs_label = 'OLD' then
	
	if dw_1.Enabled = False  then
	
		wf_barcode_print()  
		
	end if				
	
else			

	long li_page_qty, i
	li_page_qty = dw_1.GetItemNumber(1, 'page_qty') /*출력장수만큼 */	
	
	// F9:재출력
	for i = 1 to li_page_qty
			wf_qrcode()  	
	next			
		
end if
	


end event

type cb_1 from commandbutton within w_line_f7
integer x = 2322
integer y = 2252
integer width = 1125
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

type st_2 from statictext within w_line_f7
integer x = 192
integer y = 940
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

type dw_2 from datawindow within w_line_f7
integer x = 270
integer y = 980
integer width = 2894
integer height = 976
string title = "none"
string dataobject = "d_label_17x10_gab"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_line_f7
integer x = 32
integer y = 48
integer width = 3406
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

type dw_1 from datawindow within w_line_f7
event ue_dwnkey pbm_dwnkey
integer x = 32
integer y = 192
integer width = 3415
integer height = 1960
integer taborder = 10
string title = "none"
string dataobject = "d_line_f7"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_dwnkey;//
choose case key
	case KeyEscape!
		close(w_Line_F7)

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
long   ll_row
double ldb_order_qty, ldb_work_qty, ldb_rcpt_qty, ldb_unit_qty, ldb_page_qty

This.AcceptText()
ll_row = this.getrow()

ldb_order_qty = This.GetItemNumber(ll_row, 'order_qty')
ldb_rcpt_qty  = This.GetItemNumber(ll_row, 'rcpt_qty')

ldb_unit_qty  = This.GetItemNumber(ll_row, 'unit_qty')
ldb_page_qty  = This.GetItemNumber(ll_row, 'page_qty')

ldb_work_qty  =  ldb_unit_qty * ldb_page_qty

This.SetItem(ll_row, 'work_qty', ldb_work_qty)
 
if ldb_work_qty = 0 or (ldb_work_qty + ldb_rcpt_qty) > (ldb_order_qty * 1.1) or (ldb_work_qty * -1 > ldb_rcpt_qty) then
	MessageBox('확인', '작업수량을 확인 바랍니다.', StopSign!)	// 환경설정의 계산식으로 처리
	RETURN 1
end if

end event

event itemerror;//choose case dwo.name
//	case 'work_qty'
			This.SetItem(row, 'work_qty', 0)
//end choose

return 2

end event

event clicked;//
this.scrolltorow(row)
end event

type st_3 from statictext within w_line_f7
integer x = 32
integer y = 20
integer width = 3415
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

