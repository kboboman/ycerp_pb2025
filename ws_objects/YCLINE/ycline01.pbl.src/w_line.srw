$PBExportHeader$w_line.srw
$PBExportComments$생산라인 실적입력
forward
global type w_line from w_ancestor
end type
type dw_3 from datawindow within w_line
end type
type dw_2 from datawindow within w_line
end type
type dw_8 from datawindow within w_line
end type
end forward

global type w_line from w_ancestor
integer width = 3877
integer height = 2600
string title = "생산현장(w_line)"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "Form!"
event ue_dwnkey pbm_dwnkey
dw_3 dw_3
dw_2 dw_2
dw_8 dw_8
end type
global w_line w_line

type prototypes

end prototypes

type variables
//
integer ii_wid = 0, ii_dw2retrieve = 0
string  is_build = "N", is_sortcolumn, is_sortorder, is_coltype, is_filter, is_colname, is_op
datawindow dw_test
end variables

forward prototypes
public function string wf_coil (long al_row)
public function boolean wf_oc (string arg_lot, string arg_loc)
public subroutine wf_f2 ()
public subroutine wf_f4 ()
public subroutine wf_f5 ()
public subroutine wf_f1 ()
public function boolean wf_sfcday (long al_row)
public subroutine wf_f7 ()
public subroutine wf_spacebar ()
public function boolean wf_dw2_check (long al_row)
public subroutine wf_barprint (string as_coil, string as_loc)
public subroutine wf_f3 ()
public subroutine wf_f10 ()
public subroutine wf_f6 ()
public function boolean wf_dw2_delete_20190319 ()
public function boolean wf_dw2_insert (long al_row)
public function boolean wf_dw2_delete ()
end prototypes

event ue_dwnkey;// Key 이벤트
long   ll_row

choose case key
	case KeySpaceBar!	// 품목선택
		wf_spacebar()
		
	case KeyF1!			// F1:생산라인 변경
		wf_F1()		
		
	case KeyF2!			// F2:작업자
		wf_F2()		
		
	case KeyF3!			// F3:기본정렬
		wf_F3()		
		
	case KeyF4!			// F4:작업일보
		wf_F4()		
		
	case KeyF5!			// F5:사용자재
		wf_F5()		
				
	case KeyF6!			// F6: 필터
		wf_F6()
		
	case KeyF8!    	// F8:라벨출력(벤딩용으로 다중선택해서 작업수량 입력)
		if dw_1.visible = True and dw_1.rowcount() > 0 then  // 작업일보등록 중
			wf_F7()		// 성형반 라벨
		end if
		
	case KeyF10!		// F10:전체선택
		wf_F10()		
		
	case KeyF11!
		if dw_2.visible = True then		// 사용자재 등록 중
			ll_row = dw_2.insertrow(0)  

//			dw_2.object.order_no[ll_row] = left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
			dw_2.object.area_no[ll_row]  = gs_area 	// 'S0001'  //시화사업장 고정
			
			dw_2.object.use_date[ll_row] = datetime(dw_r.object.date[1])
			dw_2.object.wc_no[ll_row]    = trim(dw_r.object.line[1])
		
			dw_2.scrolltorow(ll_row)	
			dw_2.SetColumn('coil_no')
			dw_2.SetFocus()
		end if

	case KeyF9!			// F9:종료
		close( this )
end choose

end event

public function string wf_coil (long al_row);//
string ls_coil, ls_maxcoil, ls_chkcoil, ls_loc
int    li_pos,  li_len, li_start

ls_coil  = trim(dw_2.object.coil_no[al_row])
ls_loc   = dw_2.object.loc_no[al_row]
li_start = 0

Do 
	li_pos = li_start
	li_start = PosA(ls_coil, "-", li_start + 1)
Loop Until li_start = 0

if li_start = 1 then li_pos = 0
if li_pos > 0 then
	if integer( MidA(ls_coil, li_pos + 1, 2)) > 9 then
		ls_chkcoil = MidA(ls_coil, 1, LenA(trim(ls_coil)) - 2 ) + "%"
		li_len     = LenA(trim(ls_chkcoil)) + 1
	else
		ls_chkcoil = MidA(ls_coil, 1, LenA(trim(ls_coil)) - 1 ) + "%"
		li_len     = LenA(trim(ls_chkcoil))
	end if
	
	select max(coil_no) into :ls_maxcoil from coilmst
	 where datalength(coil_no) = :li_len and coil_no like :ls_chkcoil	and loc_no = :ls_loc;
else
	ls_chkcoil = trim(ls_coil) + "-%"
	li_len     = LenA(trim(ls_chkcoil))
	setnull(ls_maxcoil)
	select max(coil_no) into :ls_maxcoil from coilmst
	 where datalength(coil_no) = :li_len + 1 and coil_no like :ls_chkcoil and loc_no = :ls_loc;
	if isnull(ls_maxcoil) then
		select max(coil_no) into :ls_maxcoil from coilmst
		 where datalength(coil_no) = :li_len and coil_no like :ls_chkcoil	and loc_no = :ls_loc;
	end if
end if

IF isnull(ls_maxcoil) AND LenA(trim(ls_coil) + "-1") > 20 then
	ls_maxcoil = ls_coil
end if

if isnull(ls_maxcoil) then
	ls_chkcoil = trim(ls_coil) + "-1"
else
	li_start = 0
	do
		li_pos = li_start
		li_start = PosA(ls_maxcoil, "-", li_start + 1)
	loop until li_start = 0
	
	if li_start = 1 then li_pos = 0
	if isnumber( MidA(ls_maxcoil, li_pos + 1, 2)) then
		do until sqlca.sqlcode = 100
			ls_chkcoil = LeftA(ls_maxcoil, li_pos) + string(integer(MidA(ls_maxcoil, li_pos + 1, 2)) + 1)
			select coil_no into :ls_maxcoil from coilmst
			 where coil_no = :ls_chkcoil and datalength(coil_no) = :li_len	and loc_no = :ls_loc;
		loop
	else
		do until sqlca.sqlcode = 100
			ls_chkcoil = LeftA(ls_maxcoil, li_pos) + string(integer(MidA(ls_maxcoil, li_pos + 1, 1)) + 1)
			select coil_no into :ls_maxcoil from coilmst
			 where coil_no = :ls_chkcoil and datalength(coil_no) = :li_len	and loc_no = :ls_loc;
		loop
	end if
end if

return ls_chkcoil

end function

public function boolean wf_oc (string arg_lot, string arg_loc);//
string ls_oc

SELECT open_close INTO :ls_oc from coilmst WHERE coil_no = :arg_lot AND loc_no = :arg_loc;

choose case ls_oc
   case "M" 
      MessageBox("확인","이 로트번호[" + trim(arg_lot) + "]은 지금 생산계획중입니다.")
      RETURN false
   case "P"
      MessageBox("확인","이 로트번호[" + trim(arg_lot) + "]은 지금 작업지시중입니다.")
      RETURN false
   case "C"
      MessageBox("확인","이 로트번호[" + trim(arg_lot) + "]은 이미 사용이 완료되었습니다")
      RETURN false
   case "S"
      MessageBox("확인","이 로트번호[" + trim(arg_lot) + "]은 이미 외주로 이동되어있습니다")
      RETURN false
end choose

RETURN true

end function

public subroutine wf_f2 ();//
gs_where2 lstr_where
date   ld_sfcdate

string ls_wcno
long   ll_row

dw_r.accepttext()

ls_wcno = dw_r.object.line[1]
if isnull(ls_wcno) OR trim(ls_wcno) = "" then
	MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
	RETURN
end if

ld_sfcdate         = dw_r.object.date[1]					// 작업일자
lstr_where.str1[1] = ls_wcno									// 작업장
lstr_where.str2[1] = string(ld_sfcdate, 'yyyy/mm/dd')	// 작업일자(문자)
lstr_where.name[1] = dw_r.object.wc_nm[1]				   // 작업장명

OpenWithParm(w_sfcdayuser_m, lstr_where)
lstr_where = Message.PowerObjectParm

dw_3.retrieve( gs_area, ls_wcno, ld_sfcdate )

if dw_3.rowcount() < 1 then dw_3.insertrow(0)


end subroutine

public subroutine wf_f4 ();// 작업일보등록
dw_1.visible = true		// 작업일보
dw_2.visible = false		// 사용자재
dw_r.object.value.visible = true		// 클릭한 값

string ls_wc

dw_r.accepttext()
ls_wc = dw_r.object.line[1]
if isnull(ls_wc) or trim(ls_wc) = '' then
	MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
	return
end if

// 작업일보등록
dw_r.object.b_f04.background.mode  = 0
dw_r.object.b_f04.background.color = rgb(255, 102, 204)

// 사용자재등록
dw_r.object.b_f05.background.mode  = 0
dw_r.object.b_f05.background.color = 67108864 // rgb(240, 240, 240)

if dw_1.rowcount() > 0 then
	dw_1.setfocus()
else
	//dw_r.SetColumn('line')
	dw_1.setfocus()
end if

// F8:라벨출력
choose case gs_workno
	case "Y03","Y04"
		dw_r.object.b_f08.visible = false   // F08:라벨출력
	case else
		dw_r.object.b_f08.visible = true    // F08:라벨출력
end choose

// F11:한줄추가
dw_r.object.b_f11.visible = false
// F12:한줄삭제
dw_r.object.b_f12.visible = false

This.TriggerEvent('ue_retrieve')

end subroutine

public subroutine wf_f5 ();// 사용자재등록
dw_1.visible = false		// 작업일보
dw_2.visible = true		// 사용자재
dw_r.object.value.visible = false	// 클릭한 값

//////////////////////////
// 성형반 잔량프린트 검사
//////////////////////////
string ls_prtnames[], ls_prtnull[]
string ls_printers, ls_bars4, ls_prtfind
long	 ii

SELECT isnull(bar_s4,'') INTO :ls_bars4 FROM globals;		// 성형반 잔량프린트

ls_printers = PrintGetPrinters()
ls_prtnames = ls_prtnull		// 초기화
GF_SPLIT( ls_printers, "~n", ls_prtnames )		// 배열나누기
for ii = 1 to upperbound(ls_prtnames)
	if ls_prtnames[ii] = ls_bars4 then 				// "C.ITOH S4 (NETWORK)"
		ls_prtfind = "Y"
		dw_1.Object.DataWindow.Printer = ls_prtnames[ii]
		exit
	end if
next

if ls_prtfind = "Y" then
else
//	MessageBox("확인", "잔량프린트[C.ITOH S4 (NETWORK)]를 찾을 수 없습니다.")
end if

string ls_wc

dw_r.accepttext()
ls_wc = dw_r.object.line[1]
if isnull(ls_wc) or trim(ls_wc) = "" then
	MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
	return
end if

if dw_2.rowcount() > 0 then
	dw_2.setfocus()
else
	//dw_r.SetColumn('line')
	dw_1.setfocus()
end if

// 작업일보
dw_r.object.b_f04.background.mode  = 0
dw_r.object.b_f04.background.color = 67108864 // rgb(240, 240, 240)

// 사용자재
dw_r.object.b_f05.background.mode  = 0
dw_r.object.b_f05.background.color = rgb(255, 102, 204)

// F08:라벨출력
dw_r.object.b_f08.visible = false
// F11:한줄추가
dw_r.object.b_f11.visible = true
// F12:한줄삭제
dw_r.object.b_f12.visible = true


//open(w_barcode_coil)
This.TriggerEvent('ue_retrieve')

end subroutine

public subroutine wf_f1 ();// 생산라인 선택
gs_where lst_code

lst_code.name = "LINE"
OpenWithParm(w_wc, lst_code)
lst_code = message.powerobjectparm
if lst_code.chk = "N" then return

dw_1.Reset() ; dw_2.Reset()

gs_workno    = lst_code.str1		// 작업장
gs_workname  = lst_code.name		// 작업장명
gs_username  = lst_code.str2		// 기장명

//////////////////////////
// 초기화
//////////////////////////
dw_r.Reset()

dw_r.InsertRow(0)		// 생산라인, 작업일자
dw_r.object.date[1]    = gd_date			// 시스템일자
dw_r.object.line[1]    = lst_code.str1
dw_r.object.wc_nm[1]   = lst_code.name
dw_r.object.user_nm[1] = lst_code.str2

// F05: 사용자재등록
dw_r.object.b_f05.visible = true		

w_line.TriggerEvent('ue_retrieve')

end subroutine

public function boolean wf_sfcday (long al_row);/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 재고반영                                                          //
// 성형반에서 생산된 제품을 포장라벨로 출력할 경우 즉시 재고 반영함. //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 1) 현재공정
//    자동생산계획(가생산계획)의 현재공정 상태변경 (Y:생산계획 작성가능)
// 2) 다음공정
//    자동생산계획(가생산계획)의 다음공정 상태변경 (Y:생산계획 작성가능)
// 3) 작업일보 등록(사용자재)
// 4) 입출고 히스토리 추가(INSERT inaudit)
// 5) 생산계획상세 변경(UPDATE mpsdet SET rcpt_qty = rcpt_qty + :ldb_work_qty WHERE plan_no = :ls_plan_no)
// 6) 수주상세 변경('E' : 완료, 'Y' : 가능)
// 7) 물품코드 마스터의 수주 예약량 변경  --- 사용안함
// 8) 전 공정이 완료되지 않아도 마지막공정 완료시 출고가능으로 수주상세 FLAG를 변경함.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

int    li_cnt, li_seq, li_division, li_operation, li_work_per, li_mpsseq

string ls_plan_no, ls_order_no, ls_wc_no, ls_sale_no
string ls_item_no, ls_uom, ls_qa, ls_cust_no, ls_scene_code, ls_item_no_color
string ls_assy_item, ls_assy_qa, ls_area_no, ls_cust_name
string ls_type, ls_mpsorder, ls_sqlerrtext

double ldb_rcpt_qty,  ldb_hebe,   ldb_plan_qty
double ldb_order_qty, ldb_solqty, ldb_rlseqty, ldb_work_qty

datetime ldt_sfc_dt
date   ldt_date
time   lt_Time

dw_r.AcceptText()
ldt_date = dw_r.object.date[1]

dw_1.AcceptText()
lt_Time       = time(MidA(string(GF_TODAY(),'yyyy/mm/dd hh:mm:ss:fff'),11))
ldt_sfc_dt    = datetime(ldt_date, lt_Time)
ldt_sfc_dt    = GF_TODAY()   // yyyy/mm/dd hh:mm:ss:fff 2012-09-05 16:37:15.513

ls_plan_no    = dw_1.object.plan_no[al_row]
ls_order_no   = dw_1.object.order_no[al_row]
ls_sale_no    = dw_1.object.sale_no[al_row]
li_seq        = dw_1.object.seq_no[al_row]
ls_wc_no      = dw_1.object.wc_no[al_row]
li_division   = dw_1.object.division[al_row]
li_operation  = dw_1.object.operation[al_row]
ls_item_no    = dw_1.object.item_no[al_row]
ls_uom        = dw_1.object.uom[al_row]
ls_qa         = dw_1.object.qa[al_row]
ls_cust_no    = dw_1.object.cust_no[al_row]
ls_cust_name  = dw_1.object.cust_name[al_row]
ls_scene_code    = dw_1.object.scene_code[al_row]
ls_item_no_color = dw_1.object.item_color[al_row]
ls_assy_item  = dw_1.object.assy_item[al_row]
ls_assy_qa    = dw_1.object.assy_qa[al_row]
ls_area_no    = dw_1.object.area_no[al_row]
ls_mpsorder   = dw_1.object.mpsorder_order[al_row]
li_mpsseq     = dw_1.object.order_seq[al_row]

ldb_order_qty = dw_1.object.order_qty[al_row]
ldb_rcpt_qty  = dw_1.object.rcpt_qty[al_row]
li_work_per   = dw_1.object.work_per[al_row]
ldb_hebe      = dw_1.object.hebe[al_row]
ldb_work_qty  = dw_1.object.work_qty[al_row]		// -수량 작업삭제
ldb_plan_qty  = dw_1.object.plan_qty[al_row]
//ldb_make_qty = dw_1.object.make_qty[al_row]
//ldb_qty      = ldb_plan_qty - ldb_make_qty

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
   SET make_qty = make_qty + :ldb_work_qty, process_flag = :ls_type
 WHERE division = :li_division 
   AND wc_no    = :ls_wc_no 
   AND sale_no  = :ls_sale_no
   AND seq_no   = :li_seq 
   AND process_flag <> 'C'
   AND operation     = :li_operation;  
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
   rollback;
   MessageBox('오류1','[ROUTTEMPNEW] UPDATE중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
   return false 
end if      

li_operation++   

/////////////////////////////////////////////////////////////////////
// 2) 다음공정
// 자동생산계획(가생산계획)의 다음공정 상태변경 (Y:생산계획 작성가능)
/////////////////////////////////////////////////////////////////////
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
	MessageBox('오류2','[ROUTTEMPNEW] UPDATE중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
	return false
end if            

choose case Trim(ls_uom)
   case 'M'
      ldb_hebe = Double(Long(MidA(ls_assy_qa, 15, 5)) / 1000.0) * ldb_hebe * ldb_work_qty
   case else
      ldb_hebe = ldb_hebe * ldb_work_qty
end choose

////////////////////////////////////////////////////////
// 4) 작업일보 등록(사용자재) SFCDAY INSERT
////////////////////////////////////////////////////////
INSERT INTO sfcday (order_no, wc_no, sale_no, seq_no, item_no, qa,
       assembly, assembly_qa, uom,  hebe, type, cust_no, cust_name, loc_no, scene_code, color,
       area_no, per_qty, sfc_date, plan_qty, make_qty, mpsorder_order, order_seq)
VALUES (:ls_plan_no, :ls_wc_no, :ls_sale_no, :li_seq, :ls_item_no, :ls_qa,
        :ls_assy_item, :ls_assy_qa, :ls_uom, :ldb_hebe, 'C',
        :ls_cust_no, :ls_cust_name, :gs_loc, :ls_scene_code, :ls_item_no_color,
        :ls_area_no, :li_work_per, :ldt_sfc_dt, :ldb_plan_qty, :ldb_work_qty, :ls_mpsorder, :li_mpsseq);
if SQLCA.SqlCode <> 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
   rollback;
   MessageBox('오류[INSERT]', '[SFCDAY] INSERT중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
   return false
end if

////////////////////////////////////////////////////////
// 5) 입출고 히스토리 추가(INSERT inaudit)
////////////////////////////////////////////////////////
INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,inaudit_type,cost,destination,rem)
VALUES (:ldt_sfc_dt,:ldt_date,:ls_assy_item,:ls_assy_qa,:ls_plan_no,:ldb_work_qty,0,:gs_loc,'RP',0,:ls_wc_no,'작업일보[성형반]');
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
   rollback;
   MessageBox('오류23','[INAUDIT] INSERT중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
   return false
end if

////////////////////////////////////////////////////////
// 6) 생산계획상세 변경
////////////////////////////////////////////////////////
UPDATE mpsdet SET rcpt_qty = rcpt_qty + :ldb_work_qty WHERE plan_no = :ls_plan_no;
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
   rollback;
   MessageBox('오류24','[pb_save][mpsdet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
   return false
end if      

if ls_item_no = ls_assy_item and ls_qa = ls_assy_qa then
   ////////////////////////////////////////////////////////
   // 7) 수주상세 변경
   ////////////////////////////////////////////////////////
   if ls_type = 'E' then
      UPDATE saledet 
         SET plan_qty = plan_qty - :ldb_work_qty, sol_qty = sol_qty + :ldb_work_qty
       WHERE order_no = :ls_sale_no AND seq_no = :li_seq;
      if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
         rollback;
         MessageBox('오류25','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
         return false
      end if
   else
      UPDATE saledet 
         SET plan_qty = plan_qty - :ldb_work_qty, sol_qty = sol_qty + :ldb_work_qty
       WHERE order_no = :ls_sale_no and seq_no = :li_seq;      
      if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
         rollback;
         MessageBox('오류25','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
         return false
      end if
   end if
   
   ////////////////////////////////////////////////////////
   // 8) 물품코드 마스터의 수주 예약량 변경
   ////////////////////////////////////////////////////////
   // if ls_type = 'E' then
   //    UPDATE item SET sales_reserved = sales_reserved + :ldb_work_qty WHERE item_no = :ls_item_no AND qa = :ls_qa;
   //    if sqlca.sqlcode < 0 then
	//			ls_sqlerrtext = sqlca.sqlerrtext
   //       rollback;
   //       MessageBox('오류26','판매예약량 update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
   //       return false
   //    end if               
   // else
   //    UPDATE item SET sales_reserved = sales_reserved + :ldb_work_qty WHERE item_no = :ls_item_no AND qa = :ls_qa;         
   //    if sqlca.sqlcode < 0 then
	//			ls_sqlerrtext = sqlca.sqlerrtext
   //       rollback;
   //       MessageBox('오류26','판매예약량 update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
   //       return false
   //    end if               
   // end if
   
   ldb_order_qty = 0 
   SELECT order_qty, plan_qty, sol_qty, rlse_qty INTO :ldb_order_qty, :ldb_plan_qty, :ldb_solqty,:ldb_rlseqty
     FROM saledet
    WHERE order_no = :ls_sale_no AND seq_no = :li_seq;
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
      rollback;
      MessageBox('오류27','[pb_save][saledet] 해당자료가 없거나, DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
      return false
   end if
   
   ////////////////////////////////////////////////////////
   // 9) 전공정이 완료가 되지않아도 마지막공정 완료시 출고가능으로 flag를 바꿈
   ////////////////////////////////////////////////////////
   if (ldb_solqty + ldb_rlseqty) >= ldb_order_qty then
      ////////////////////////////////////////////////////////
      // 출고가능 하게 수주상세 변경
      ////////////////////////////////////////////////////////
      UPDATE saledet SET saledet_text = 'X' WHERE order_no = :ls_sale_no AND seq_no = :li_seq;   
      if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
         rollback;
         MessageBox('오류28','[pb_save][saledet] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
         return false
      end if
   end if
end if

COMMIT;

RETURN TRUE

end function

public subroutine wf_f7 ();// 라벨출력
string ls_wcno, ls_jobno, ls_useyn
long   ll_row
date   ld_date

dw_r.accepttext()

ls_wcno  = dw_r.object.line[1]		// 작업장
ls_jobno = LeftA(ls_wcno,1) + "%"		// 작업그룹
ld_date  = dw_r.object.date[1]		// 작업일자

if isnull(ls_wcno) OR trim(ls_wcno) = "" then
	MessageBox("확인", "F1을 선택하여 라인을 먼저 선택하십시요")
	RETURN
end if

/////////////////////////////////////////////////////
// 근무신청서 체크
/////////////////////////////////////////////////////
SELECT use_yn INTO :ls_useyn FROM codemst WHERE item_cd = 'YCLINE_DUECHECK' AND use_yn = 'Y';
if ls_useyn = "Y" then
   SELECT count(*) INTO :ll_row
     FROM sfcworkman
    WHERE ( sfcworkman.work_day = convert(char(10),dateadd(day, 0, :ld_date),111) )
      AND work_no IN (SELECT DISTINCT insa_team FROM wc WHERE work_no LIKE :ls_jobno );
  if isnull(ll_row) OR ll_row < 1 then
     MessageBox("확인","해당하는 작업장의 근무신청서가 존재하지 않습니다.",Exclamation!)
  end if
end if
///////////////////////////////////////////////////


choose case ls_wcno
//	case "U01"
//		if dw_1.rowcount() > 0 then
//			Open( w_line_u01 )	// 유압반 라벨
//		else
//			Open( w_label_prt )	// 유압반 라벨(벌크)
//		end if
	/*2018.05.22 도장을  따로 놓고 도장에선 등록하면 자동으로 자재 사용이 되도록 jowonsuk */		
/*	case "B01", "P01", "P02"
		Open( w_line_b01 )	// 절곡, 도장반 라벨
*/
	case "B01"
		Open( w_line_b01 )	// 절곡
	case "P01", "P02", "P03", "P04", "P06", "P07", "P08", "P09", "P10", "H02"  /*2018.12.04 jowonsuk P06 추가 */
																	  				   /*2020.01.09 jowonsuk */
																				 	   /*2020.04.01 jowonsuk */
		Open( w_line_p01 )	// 도장반 라벨
//	case "Y01", "Y02", "Y03", "Y04", "Y05", "Y07" /*2018.11.26 jowonsuk Y07 추가 */
//	case "Y01", "Y02", "Y03", "Y04", "Y05", "Y07", "Y08" /*2020.09.07 jowonsuk Y08 추가 */
	case "Y01", "Y02", "Y03", "Y04", "Y05", "Y06", "Y07", "Y08", "Y09" /*2021.06.24 jowonsuk Y06, Y09 추가 */		
		Open( w_line_ysp )	// YSP 라벨	
	case else
		
		if LeftA(ls_wcno,1) = 'F' or LeftA(ls_wcno,1) = 'T' then /*2020.3.26 jowonsuk 개선 */
			Open( w_line_f7 )		// 성형반 라벨
		elseif LeftA(ls_wcno,1) = 'U' then
			if dw_1.rowcount() > 0 then
				Open( w_line_u01 )	// 유압반 라벨
			else
				Open( w_label_prt )	// 유압반 라벨(벌크)
			end if			
		else
			messagebox('알림', '작업장을 확인해주세요.')
		end if
end choose

dw_1.setfocus()

end subroutine

public subroutine wf_spacebar ();// 품목선택
long   ll_dw1row, ll_cnt, ll_cnt2, ll_prtmax
string ls_wcno

if dw_1.rowcount() < 1 then RETURN

ll_dw1row = dw_1.getrow()	
if ll_dw1row < 1 then RETURN

ls_wcno = dw_1.object.wc_no[ll_dw1row]
choose case ls_wcno
	//case "B01", "P01", "P02"				// 절곡, 도장반
	  case "B01", "P01", "P02", "P03", "P04", "P06", "P07", "P08" /*2020.01.09 jowonsuk */
		ll_prtmax = dw_1.rowcount()
		
	case "Y03", "Y04", "Y05"	// YSP
		ll_prtmax = 7
		
	case else						// 기타		
		
		if LeftA(ls_wcno,1) = 'F' then  /* 2019.02.27 jowonsuk 성형일때만 qrcode 라벨적용시 5개 제한 품, 기존 ll_prtmax = 5      */
		
			if gs_label = 'OLD' then		
				ll_prtmax = 5              
			else
				ll_prtmax = dw_1.rowcount()  //성형이 현재 5개인데 앞으로는 없앨 예정
			end if
		else
				ll_prtmax = 5
		end if
		
end choose

ll_cnt2   = 0
for ll_cnt = dw_1.GetSelectedRow(0) to dw_1.rowcount()
	if dw_1.IsSelected(ll_cnt) = true then
		ll_cnt2 =  ll_cnt2 + 1
	end if
next

if ll_cnt2 = ll_prtmax AND dw_1.IsSelected(ll_dw1row) = true then
else
	if ll_cnt2 >= ll_prtmax then
		MessageBox("확인",string(ll_prtmax) + "개 이상 선택이 불가능합니다(용지문제)~r~r" &
					+ string(ll_prtmax) + "개 이상 일때는 나누어서 출력하시기 바랍니다.")
		RETURN
	end if
end if

// 선택
dw_1.SelectRow(ll_dw1row, NOT dw_1.IsSelected(ll_dw1row))


end subroutine

public function boolean wf_dw2_check (long al_row);//
long   ll_row
string ls_item,ls_qa, ls_loc
int    li_exist

dwItemStatus l_status
dw_r.accepttext()

dw_2.accepttext()
ll_row = al_row
l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
if l_status = new! or l_status = NewModified! then
	ls_loc  = trim(dw_2.GetItemString(ll_row,"loc_no"))
	if ls_loc = '' or isnull(ls_loc) then
		messagebox('오류1',"사용자재등록의 " + string(ll_row) + ' 번째의 저장소를 입력하십시요',exclamation!)
		return false
	end if
	
	ls_item = trim(dw_2.GetItemString(ll_row, "item_no")) 
	ls_qa   = trim(dw_2.GetItemString(ll_row, "qa"))
	select count(*) into :li_exist from item where item_no = :ls_item	and qa = :ls_qa;
	if sqlca.sqlcode = 100 or li_exist = 0 then
		messagebox('오류2','사용자재등록의 ' + string(ll_row) + ' 번째 물품이 잘못되었습니다',exclamation!)
		return false
	end if
	
	if dw_2.object.sfcuse_cnt[ll_row] > 0 then
		if dw_2.object.sfcuse_cnt[ll_row] > dw_2.object.qcnt[ll_row] then
			dw_2.setcolumn('coil_no')
			dw_2.setfocus()
			dw_2.scrolltorow(ll_row)
			messagebox('오류3','사용자재등록의 ' + string(ll_row) + ' 번째 사용수량이 저장수량보다 큽니다.',exclamation!)
			return false
		end if
	else
		messagebox('오류4','사용자재등록의 ' + string(ll_row) + ' 번째 사용수량이 0 입니다.',exclamation!)
	end if
end if

RETURN TRUE

end function

public subroutine wf_barprint (string as_coil, string as_loc);////////////////////////////////////////////////////////////////////
// 프린터명 변경 필요. 포트만 다르므로 이름변경후 사용.
// wf_barprint( as_coil, as_loc )
////////////////////////////////////////////////////////////////////

Dec {1} ld_wid, ld_oldwid
string ls_barprt

SELECT wid INTO :ld_wid FROM coilmst WHERE coil_no = :as_coil AND loc_no = :as_loc; 
if ld_wid <> ld_oldwid then
	if ld_wid < 50.0 then
		dw_8.DataObject = 'd_sfclabel01_2' // 거의 사용안하지만, 스크립트변경 필요함.
	else
		dw_8.DataObject = 'd_sfclabel01_1'
	end if
	dw_8.SetTransObject(sqlca)
End If

dw_8.Retrieve( as_coil, as_loc )

//dw_8.Object.t_wc.text = '성형'+ right('00' + mid(as_loc,2,2), 2) + '호기'
SELECT rtrim(ltrim(bar_s4)) INTO :ls_barprt FROM globals;
if IsNull(ls_barprt) or ls_barprt <> "C.ITOH S4 (NETWORK)" then
	MessageBox("명칭확인", "[" + ls_barprt + "] 잔량용 바코드프린터가 설정이 되어있지 않습니다.")
else
	// 프린터명 변경 필요. 포트만 다르므로 이름변경후 사용.
   dw_8.Object.DataWindow.Printer = ls_barprt  
   dw_8.Print()
end if

end subroutine

public subroutine wf_f3 ();// 기본정렬하기
string ls_wcno

ls_wcno = dw_r.object.line[1]

// 절곡, 도장반만 실행함
choose case ls_wcno
	//case "B01", "P01", "P02"
	  case "B01", "P01", "P02", "P03", "P04", "P06", "P07", "P08" // 2020.01.10 jowonsuk
		dw_1.SetSort( "mpsorder_order A, order_seq A" )
		dw_1.Sort()
		
		dw_r.object.b_f03.background.mode  = 0
		dw_r.object.b_f03.background.color = 67108864 // rgb(240, 240, 240)
end choose

end subroutine

public subroutine wf_f10 ();// 전체선택하기
string ls_wcno
long   ll_row

ls_wcno = dw_r.object.line[1]

// 절곡, 도장반만 실행함
choose case ls_wcno
	//case "B01", "P01", "P02"
	  case "B01", "P01", "P02", "P03", "P04", "P06", "P07", "P08" // 2020.01.09 jowonsuk
		for ll_row = 1 to dw_1.rowcount()
			dw_1.scrolltorow( ll_row )
			wf_spacebar()
		next
		
end choose

end subroutine

public subroutine wf_f6 ();// 필터
string ls_wcno, ls_colname, ls_coltype, ls_op, ls_text, ls_filter

ls_wcno    = dw_r.object.line[1]
ls_text    = dw_r.object.value[1]
ls_text    = trim(ls_text)

ls_coltype = is_coltype
ls_colname = is_colname
ls_op      = is_op

choose case LeftA(ls_coltype,4)
	case "char"
		ls_filter = ls_colname + " " + ls_op + " '%" + ls_text + "%'"

	case else
		ls_filter = ls_colname + " " + ls_op + ls_text
end choose

// 절곡, 도장반만 실행함
//choose case ls_wcno
//	case "B01", "P01", "P02"
		if LenA(ls_text) > 0 then
		else
			ls_filter = ""
		end if		
		dw_1.SetFilter( ls_filter )
		dw_1.Filter()
		
		dw_r.object.b_f06.background.mode  = 0
		if ls_filter = "" then
			dw_r.object.b_f06.background.color = 67108864 // rgb(240, 240, 240)
		else
			dw_r.object.b_f06.background.color = rgb(255, 102, 204)
		end if
//end choose


end subroutine

public function boolean wf_dw2_delete_20190319 ();//
string ls_plan, ls_old_time, ls_item, ls_coil, ls_qa, ls_loc, ls_oc, ls_rem, ls_wc
string ls_sqlerrtext

datetime ldt_date
dec{1} ld_wid
real   lr_useqty, lr_unitqty,  lr_modlen
long   ll_rowcount, ll_cnt, ll_row, ll_count
int    li_int

dw_r.accepttext()
dw_2.accepttext()
ldt_date = datetime(dw_r.object.date[1])

ll_rowcount = dw_2.deletedcount()
ls_wc       = trim(dw_r.object.line[1])

for ll_row = 1 to ll_rowcount
	
   ls_plan    = trim(dw_2.GetItemString(ll_row,"order_no",   Delete!, TRUE))
   ls_item    = trim(dw_2.GetItemString(ll_row,"item_no",    Delete!, TRUE))
   ls_coil    = trim(dw_2.GetItemString(ll_row,"coil_no",    Delete!, TRUE))
   ls_qa      = trim(dw_2.GetItemString(ll_row,"qa",         Delete!, TRUE))
   ls_loc     = trim(dw_2.GetItemString(ll_row,"loc_no",     Delete!, TRUE))
   ld_wid     = dw_2.GetItemnumber(ll_row,"sfcuse_wid",      Delete!, TRUE)
   ll_cnt     = dw_2.GetItemnumber(ll_row,"sfcuse_cnt",      Delete!, TRUE)
   lr_unitqty = dw_2.GetItemnumber(ll_row,"sfcuse_unit_qty", Delete!, TRUE)
   lr_useqty = dw_2.GetItemnumber(ll_row,"sfcuse_mod_qty", Delete!, TRUE)			/*코일 총단중 2018.08.01 jowonsuk 추가 */

   for ll_count = 1 to 100000
      IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
         ls_old_time  = string(now(),'hh:mm:ss:fff')   
         exit
      END IF   
   next
	
   // inaudit insert
   // inaudit insert
   // inaudit insert
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
          inaudit_type,destination, serial_id,cost,unit_qty,cnt, rem, user_id)
   VALUES (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_plan,0,:lr_useqty * -1,:ls_loc,
          'IW',:ls_wc,:ls_coil,0,:lr_unitqty,:ll_cnt, '현장성형자재삭제', '현장성형입력');
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
      messagebox('오류1','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
      RETURN false
   end if

   if trim(ls_coil) = '' or isnull(ls_coil) then
   else
      if MidA(ls_item, 4, 1) = "1" then
         UPDATE coilmst 
            SET qcnt = qcnt + :ll_cnt, open_close = "O" // 사용가능(미사용)
          WHERE coil_no = :ls_coil AND loc_no = :ls_loc;
         if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('update오류8',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      elseif MidA(ls_item, 4, 1) = "2" then
         UPDATE sheetmst 
            SET qcnt = qcnt + :ll_cnt, open_close = "O"  // 사용가능(미사용)
          WHERE sheet_no = :ls_coil   AND loc_no = :ls_loc;
         if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('update오류9',"SHEET마스터UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      end if
      
      //=================================================================
      // 잔량 삭제 ======================================================
      //=================================================================
      ls_rem = 'N'
      li_int = 1
      if MidA(ls_item, 4, 1) = "1" then
         if dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE) > 0 then
            ls_coil = trim(dw_2.GetItemString(ll_row,"rem_lot", Delete!, TRUE))
            lr_useqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE) /* 2018 08 01 jowonsuk 추가 */
            lr_unitqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE) /* 2018 08 01 jowonsuk 추가 */
            ls_rem  = 'Y'
            //스리팅코일삭제
            DELETE FROM coilmst WHERE coil_no = :ls_coil   AND loc_no = :ls_loc   AND open_close = 'O';
            if sqlca.sqldbcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
               if wf_oc(ls_coil, ls_loc) = false then
                  rollback;
                  RETURN false
               end if
               
               SELECT count(*) INTO :ll_count FROM coilmst WHERE coil_no = :ls_coil;
               if ll_count > 0 then
                  rollback;
                  messagebox("확인","이 로트번호[" + trim(ls_coil) + "]은 이미 외주로 이동되어있습니다")
                  RETURN false
               end if
               
               rollback;
               messagebox('오류3','[코일마스터] delete중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
               RETURN false
            end if
         end if
      elseif MidA(ls_item, 4, 1) = "2" then
         ls_qa = dw_2.GetItemstring(ll_row,"rem_qa", Delete!, TRUE)
         if isnull(ls_qa) or trim(ls_qa) = '' then
         else
            ls_rem = 'Y'
				
		 dw_2.object.rem_cnt[ll_row] = dw_2.object.qcnt[ll_row] - dw_2.object.sfcuse_cnt[ll_row]
		 lr_useqty = dw_2.object.rem_cnt[ll_row]				
         end if
      end if
      
      if ls_rem = 'Y' then
      // 스리팅코일 출고 로직입니다.
         ll_cnt = 1
			
/*    
	    2018.08.01. jowonsuk 주석 			
         lr_useqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE)
         lr_unitqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE)
*/			
         for ll_count = 1 to 100000
            if ls_old_time <> string(now(),'hh:mm:ss:fff') then
               ls_old_time  = string(now(),'hh:mm:ss:fff')   
               exit
            end if   
         next
         
         INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
                inaudit_type,destination, serial_id,cost,unit_qty,cnt, rem, user_id)
         VALUES (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_plan,0,:lr_useqty * -1,:ls_loc,
                'IW',:ls_wc,:ls_coil,0,:lr_unitqty,:ll_cnt, '현장성형잔량삭제', '성형입력');
					 
         if sqlca.sqlcode < 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('오류4','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      end if
   end if
next

//dw_2.deleterow(dw_2.rowcount())
// 삭제행 2, 삭제갯수 1개
// 1번 row 도 삭제된다.

RETURN true

end function

public function boolean wf_dw2_insert (long al_row);//
string ls_qs, ls_old_time, ls_loc, ls_order, ls_wc, ls_item, ls_coil, ls_qa, ls_oc, ls_pcoil_no
string ls_rem, ls_etc, ls_sqlerrtext

real   lr_useqty, lr_unitqty,  lr_modlen
long   ll_rowcount, ll_cnt, ll_count, ll_row, ll_oricnt
int    li_int, li_exist
dec{1} ld_wid
dec{2} ld_length
datetime ldt_date
dwItemStatus l_status

dw_r.accepttext()
dw_2.accepttext()

ls_wc       = trim(dw_r.object.line[1])
ldt_date    = datetime(dw_r.object.date[1])

ls_old_time = string(now(),'hh:mm:ss:fff')

ll_rowcount = dw_2.rowcount()
ll_row      = al_row
l_status    = dw_2.GetItemStatus(ll_row,0, Primary!)

ls_loc      = trim(dw_2.GetItemString(ll_row,"loc_no"))
ls_order    = trim(dw_2.object.order_no[ll_row])
ls_item     = trim(dw_2.object.item_no[ll_row])
ls_coil     = trim(dw_2.object.coil_no[ll_row])
ls_qa       = trim(dw_2.object.qa[ll_row])
lr_useqty   = dw_2.object.sfcuse_mod_qty[ll_row]   // 총사용중량 sfcuse_use_qty
ll_cnt      = dw_2.object.sfcuse_cnt[ll_row]       // 사용갯수
lr_unitqty  = dw_2.object.sfcuse_unit_qty[ll_row]  // 단중
ld_wid      = dw_2.object.sfcuse_wid[ll_row]
if l_status = new! or l_status = NewModified!   then
   li_exist = 1 
   SELECT count(*) into :li_exist 
	  FROM sfcuse
    WHERE order_no = :ls_order   AND wc_no    = :ls_wc
      AND use_date = :ldt_date   AND item_no  = :ls_item
      AND qa       = :ls_qa      AND unit_qty = :lr_unitqty;
		
   Do While li_exist <> 0
      ls_order = LeftA(ls_order,13) + string(integer(MidA(trim(ls_order), 14)) + 1,'00')
      SELECT count(*) into :li_exist 
		  FROM sfcuse
       WHERE order_no = :ls_order   AND wc_no    = :ls_wc
         AND use_date = :ldt_date   AND item_no  = :ls_item
         AND qa       = :ls_qa      AND unit_qty = :lr_unitqty;
//         left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
//         'SNON20030602-01'
   Loop
   
   dw_2.object.order_no[ll_row] = ls_order
//   ls_order = left(ls_order, len(trim(ls_order)) - 3) + string(integer(right(trim(ls_order), 3)) + 1 ,'000')
   if trim(ls_coil) = '' or isnull(ls_coil) then
   else
      if MidA(ls_item, 4, 1) = "1" then
         SELECT qcnt INTO :ll_oricnt FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_loc;
	
	  /*2021.01.15 jowonsuk */
	   if ll_oricnt < ll_cnt then
			
            messagebox('오류',  "["+ ls_coil + "] 코일 재고량을 확인해주시기 바랍니다.~r~n",exclamation!)				
            RETURN false
				
	   end if 
	
         if ll_oricnt <= ll_cnt then
            ls_oc = "C"
         else
            ls_oc = "O"
         end if
         
         UPDATE coilmst 
            SET qcnt = qcnt - :ll_cnt, open_close = :ls_oc // 사용완료(작업일보사용)
          WHERE coil_no = :ls_coil AND loc_no = :ls_loc;
         if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
            messagebox('update오류8',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
         
         lr_useqty = dw_2.object.sfcuse_mod_qty[ll_row]
         lr_modlen = dw_2.object.sfcuse_mod_len[ll_row]
         
      elseif MidA(ls_item, 4, 1) = "2" then
         SELECT qcnt INTO :ll_oricnt FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_loc;
			
	  /*2021.01.15 jowonsuk */
	   if ll_oricnt < ll_cnt then
			
            messagebox('오류',  "["+ ls_coil + "] 쉬트 재고량을 확인해주시기 바랍니다.~r~n",exclamation!)
            RETURN false
				
	   end if 
		
         if ll_oricnt <= ll_cnt then
            ls_oc = "C"
         else
            ls_oc = "O"
         end if
         
         UPDATE sheetmst 
            SET qcnt = qcnt - :ll_cnt, open_close = :ls_oc // 사용완료(작업일보사용)
          WHERE sheet_no = :ls_coil   AND loc_no = :ls_loc;
         if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('update오류9',"SHEET마스터UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      end if      
   end if

//   for ll_count = 1 to 100000
//      if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//         ls_old_time  = string(now(),'hh:mm:ss:fff')   
//         exit
//      end if   
//   next

   /////////////////////////////////
   // 
   /////////////////////////////////
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
          inaudit_type,destination, serial_id,cost,unit_qty,cnt, rem, user_id)
   VALUES (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_order,0,:lr_useqty,:ls_loc,
          'IW',:ls_wc,:ls_coil,0,:lr_unitqty,:ll_cnt, '현장성형자재출고', '성형입력');
			 
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
      rollback;
      messagebox('오류12','[pb_save][INAUDIT] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
      RETURN false
   end if
end if

//=================================================================
// 잔량 등록 ======================================================
//=================================================================
ls_rem = 'N'
if trim(ls_coil) = '' or isnull(ls_coil) then
else
   if MidA(ls_item, 4, 1) = "1" then
      if dw_2.object.rem_qty[ll_row] > 0 then
         SELECT distinct pcoil_no INTO :ls_pcoil_no FROM coilmst WHERE coil_no = :ls_coil;

         ls_rem     = 'Y'
         dw_2.object.rem_lot[ll_row] = wf_coil(ll_row)
         ls_coil    = trim(dw_2.object.rem_lot[ll_row])
         
         lr_useqty  = dw_2.object.rem_qty[ll_row]
         lr_unitqty = dw_2.object.rem_qty[ll_row]
         ld_wid     = dec(MidA(dw_2.object.qa[ll_row], 5,4) + "." + MidA(dw_2.object.qa[ll_row], 10,1))
         ld_length  = dw_2.object.rem_len[ll_row]
         ls_etc     = dw_2.object.etc_no[ll_row]
         li_int     = 1
         
         /////////////////////////////////
         //스리팅코일추가
         /////////////////////////////////
         INSERT INTO coilmst (coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
                cnt, qcnt,   color_no, supp_no, flag, porder_no, pseq_no, open_close,
                rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
         VALUES (:ls_coil, :ld_wid, :ls_item, :ls_qa, :ls_loc, :ldt_date, :lr_unitqty, :ld_length,
                1, 1,    :ls_order,  :ls_loc, 'S', :ls_order, :li_int, 'O', 
                '잔량성형입고', :lr_unitqty, :ld_length, :ls_etc, :ls_pcoil_no);
         if sqlca.sqldbcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('오류10','[코일마스터] insert중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      end if
      
   elseif MidA(ls_item, 4, 1) = "2" then
      ls_qa = dw_2.object.rem_qa[ll_row]
      if isnull(ls_qa) or trim(ls_qa) = '' then
      else
         dw_2.object.rem_cnt[ll_row] = dw_2.object.qcnt[ll_row] - dw_2.object.sfcuse_cnt[ll_row]
         lr_useqty = dw_2.object.rem_cnt[ll_row]
         ls_rem    = 'Y'
         SELECT count(*) INTO :li_int FROM item WHERE item_no = :ls_item AND qa = :ls_qa;
         if li_int = 0 then
      //    if MessageBox("확인","아래와 같은 규격은 존재하지 않습니다!~r~n" &
      //         + "신규규격 " + ls_remqa +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 THEN
               if gf_iteminsert(ls_item, ls_qa) = false then
                  rollback;
                  RETURN false
               end if
      //    end if
         end if
      end if
   end if
   
   if ls_rem = 'Y' then
      li_int = 1
//      for ll_count = 1 to 100000
//         IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
//            ls_old_time  = string(now(),'hh:mm:ss:fff')   
//            exit
//         end if   
//      next      
      
      /////////////////////////////////
      // 잔량입고 로직.
      /////////////////////////////////
      INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, order_no, rcpt_qty, issue_qty, loc_no,
             inaudit_type, destination, serial_id, cost, unit_qty,  cnt, com_qty, rem, user_id)
      VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_order, :lr_useqty,  0, :ls_loc,
             'RW',          :ls_loc,    :ls_coil,    0, :lr_unitqty, 1, :li_int, '현장성형자재잔량입고', '성형입력');
      if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
         rollback;
         messagebox('오류','입출내역에 추가중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
         RETURN false               
      end if
   end if
end if

RETURN true

end function

public function boolean wf_dw2_delete ();/* 2019.03.19 jowonsuk 
  al_row 파라메터 추가 삭제하는 행만 삭제하도록 수정 
 */
string ls_plan, ls_old_time, ls_item, ls_coil, ls_qa, ls_loc, ls_oc, ls_rem, ls_wc
string ls_sqlerrtext

datetime ldt_date
dec{1} ld_wid
real   lr_useqty, lr_unitqty,  lr_modlen
long   ll_rowcount, ll_cnt, ll_row, ll_count
int    li_int

dw_r.accepttext()
dw_2.accepttext()
ldt_date = datetime(dw_r.object.date[1])

ll_rowcount = dw_2.deletedcount()
ls_wc       = trim(dw_r.object.line[1])

for ll_row = 1 to ll_rowcount
	
   ls_plan    = trim(dw_2.GetItemString(ll_row,"order_no",   Delete!, TRUE))
   ls_item    = trim(dw_2.GetItemString(ll_row,"item_no",    Delete!, TRUE))
   ls_coil    = trim(dw_2.GetItemString(ll_row,"coil_no",    Delete!, TRUE))
   ls_qa      = trim(dw_2.GetItemString(ll_row,"qa",         Delete!, TRUE))
   ls_loc     = trim(dw_2.GetItemString(ll_row,"loc_no",     Delete!, TRUE))
   ld_wid     = dw_2.GetItemnumber(ll_row,"sfcuse_wid",      Delete!, TRUE)
   ll_cnt     = dw_2.GetItemnumber(ll_row,"sfcuse_cnt",      Delete!, TRUE)
   lr_unitqty = dw_2.GetItemnumber(ll_row,"sfcuse_unit_qty", Delete!, TRUE)
   lr_useqty = dw_2.GetItemnumber(ll_row,"sfcuse_mod_qty", Delete!, TRUE)			/*코일 총단중 2018.08.01 jowonsuk 추가 */

//   for ll_count = 1 to 100000
//      IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
//         ls_old_time  = string(now(),'hh:mm:ss:fff')   
//         exit
//      END IF   
//   next
	
   // inaudit insert
   // inaudit insert
   // inaudit insert
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
          inaudit_type,destination, serial_id,cost,unit_qty,cnt, rem, user_id)
   VALUES (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_plan,0,:lr_useqty * -1,:ls_loc,
          'IW',:ls_wc,:ls_coil,0,:lr_unitqty,:ll_cnt, '현장성형자재삭제', '현장성형입력');
			 
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
      messagebox('오류1','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
      RETURN false
   end if

   if trim(ls_coil) = '' or isnull(ls_coil) then
   else
      if MidA(ls_item, 4, 1) = "1" then
         UPDATE coilmst 
            SET qcnt = qcnt + :ll_cnt, open_close = 'O' // 사용가능(미사용)
          WHERE coil_no = :ls_coil AND loc_no = :ls_loc;
         if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('update오류8',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      elseif MidA(ls_item, 4, 1) = "2" then
         UPDATE sheetmst 
            SET qcnt = qcnt + :ll_cnt, open_close = 'O'  // 사용가능(미사용)
          WHERE sheet_no = :ls_coil   AND loc_no = :ls_loc;
         if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('update오류9',"SHEET마스터UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      end if
      
      //=================================================================
      // 잔량 삭제 ======================================================
      //=================================================================
      ls_rem = 'N'
      li_int = 1
      if MidA(ls_item, 4, 1) = "1" then
         if dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE) > 0 then
            ls_coil = trim(dw_2.GetItemString(ll_row,"rem_lot", Delete!, TRUE))
            lr_useqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE) /* 2018 08 01 jowonsuk 추가 */
            lr_unitqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE) /* 2018 08 01 jowonsuk 추가 */
            ls_rem  = 'Y'
            //스리팅코일삭제
            DELETE FROM coilmst WHERE coil_no = :ls_coil   AND loc_no = :ls_loc   AND open_close = 'O';
            if sqlca.sqldbcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
               if wf_oc(ls_coil, ls_loc) = false then
                  rollback;
                  RETURN false
               end if
               
               SELECT count(*) INTO :ll_count FROM coilmst WHERE coil_no = :ls_coil;
               if ll_count > 0 then
                  rollback;
                  messagebox("확인","이 로트번호[" + trim(ls_coil) + "]은 이미 외주로 이동되어있습니다")
                  RETURN false
               end if
               
               rollback;
               messagebox('오류3','[코일마스터] delete중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
               RETURN false
            end if
         end if
      elseif MidA(ls_item, 4, 1) = "2" then
         ls_qa = dw_2.GetItemstring(ll_row,"rem_qa", Delete!, TRUE)
         if isnull(ls_qa) or trim(ls_qa) = '' then
         else
            ls_rem = 'Y'
				
		 dw_2.object.rem_cnt[ll_row] = dw_2.object.qcnt[ll_row] - dw_2.object.sfcuse_cnt[ll_row]
		 lr_useqty = dw_2.object.rem_cnt[ll_row]				
         end if
      end if
      
      if ls_rem = 'Y' then
      // 스리팅코일 출고 로직입니다.
         ll_cnt = 1
			
/*    
	    2018.08.01. jowonsuk 주석 			
         lr_useqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE)
         lr_unitqty = dw_2.GetItemnumber(ll_row,"rem_qty", Delete!, TRUE)
*/			
//         for ll_count = 1 to 100000
//            if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//               ls_old_time  = string(now(),'hh:mm:ss:fff')   
//               exit
//            end if   
//         next
         
	   /*2019.03.19 jowonsuk 삭제 로직 수정*/	
//         INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
//                inaudit_type,destination, serial_id,cost,unit_qty,cnt, rem, user_id)
//         VALUES (getdate(),:ldt_date,:ls_item,:ls_qa,:ls_plan,:lr_useqty * -1, 0, :ls_loc,
//                'RW',:ls_wc,:ls_coil,0,:lr_unitqty,:ll_cnt, '현장성형자재잔량삭제', '성형입력');	
					 
			INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, order_no, rcpt_qty, issue_qty, loc_no,
					 inaudit_type, destination, serial_id, cost, unit_qty,  cnt, com_qty, rem, user_id)
			VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_plan, :lr_useqty * -1,  0, :ls_loc,
					 'RW',          :ls_loc,    :ls_coil,    0, :lr_unitqty, 1, :li_int, '현장성형자재잔량삭제', '성형입력');					 
					 
         if sqlca.sqlcode < 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
            rollback;
            messagebox('오류4','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
            RETURN false
         end if
      end if
   end if
next

//dw_2.deleterow(dw_2.rowcount())
// 삭제행 2, 삭제갯수 1개
// 1번 row 도 삭제된다.

RETURN true

end function

on w_line.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_8=create dw_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.dw_8
end on

on w_line.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_8)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, This.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), This.Title )
//================================================================================================
string ls_title

/*2018.11.26 jowonsuk db리커넥트 반영*/
//dw_test = create datawindow
//dw_test.dataobject = 'd_userid'
//dw_test.settransobject(sqlca)

//ls_title = Message.StringParm
//if isNull(ls_title) or Trim(ls_title) = "" then
//	this.title = "성형|유압반"
//else
//	this.title = ls_title
//end if

//////////////////////////
// 화면확대 취소
//////////////////////////
ib_exec = false		
//////////////////////////

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA)

dw_1.visible = true		// 작업지시
dw_2.visible = false		// 사용자재(잔량)
dw_3.visible = true		// 작업자
dw_8.visible = false 	// 3707, 2376(잔량 바코드)

//////////////////////////
// 초기화
//////////////////////////
dw_r.Reset()
dw_1.Reset()

dw_3.InsertRow(0)		// 작업자
dw_r.InsertRow(0)		// 생산라인, 작업일자

dw_r.object.date[1] 		= gd_date		// 시스템일자
dw_r.object.line[1] 		=      trim(gs_workno)		// 작업장선택
dw_r.object.wc_nm[1]		= gs_workname	// 작업장명
dw_r.object.user_nm[1]  = gs_username	// 기장명

dw_r.object.b_f04.visible = true		// F04: 작업일보등록
dw_r.object.b_f04.background.mode  = 0
dw_r.object.b_f04.background.color = rgb(255, 102, 204)

dw_r.object.b_f05.visible = true		// F05: 사용자재등록
dw_r.object.b_f05.background.mode  = 0
dw_r.object.b_f05.background.color = 67108864 // rgb(240, 240, 240)

choose case gs_workno
	case "Y03","Y04"		// YSP01, YSP02
		dw_r.object.b_f08.visible = false   // F08: 라벨출력
	case else
		dw_r.object.b_f08.visible = true    // F08: 라벨출력
end choose
dw_r.object.b_f11.visible = false	// F11: 한줄추가
dw_r.object.b_f12.visible = false	// F12: 한줄삭제

this.PostEvent( "ue_retrieve" )
dw_1.setfocus()


/*2018.11.26 jowonsuk db 리커넥트 */
//Timer(180)

end event

event ue_clear;call super::ue_clear;//
dw_r.Reset()
dw_1.Reset()

//dw_3.InsertRow(0)		// 작업자

dw_r.InsertRow(0)		// 생산라인, 작업일자
dw_r.object.date[1] = gd_date			// 시스템일자
dw_r.object.line[1] = gs_workno		// 작업장선택
dw_r.object.wc_nm[1]= gs_workname	// 작업장명


end event

event ue_retrieve;call super::ue_retrieve;// 조회
string   ls_wcno, ls_jobno, ls_useyn
long     ll_row
date     ld_date1, ld_date3	// 시스템시간 -> 시스템일자 변환
datetime ldt_date2				// 시스템일자

dw_r.accepttext()

ls_wcno  = dw_r.GetItemString(1, "line")	// 작업라인
ls_jobno = LeftA(ls_wcno,1) + '%'				// 근태신청서
ld_date1 = dw_r.object.date[1]				// 작업일자

/* SELECT top 1 getdate() INTO :ldt_date2 FROM login;*/		// 시스템일자
//   SELECT getdate() INTO :ldt_date2 FROM dual;
     SELECT convert(datetime, '20211130') INTO :ldt_date2 FROM dual;
ld_date3 = date(ldt_date2)

/*		
if ld_date1 < ld_date3 then		// 작업일자 < 시스템일자
	MessageBox("조회","시스템일자[" + string(ld_date3,"yyyy/mm/dd") + &
	           "] 보다~n~n작은 작업일자[" + string(ld_date1,"yyyy/mm/dd")+"]는 작업이 불가능 합니다.")
	RETURN
end if
*/

// 작업자
dw_3.retrieve( gs_area, ls_wcno, ld_date1 )		
if dw_3.rowcount() < 1 then dw_3.insertrow(0)

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// 근무신청서 체크
//////////////////////////////////////////////////////////////////////////////////////////////////////////
if gs_area = "S0001" or gs_area = "B0001" then
	SELECT use_yn INTO :ls_useyn FROM codemst WHERE item_cd = 'YCLINE_DUECHECK' AND use_yn = 'Y';
	if ls_useyn = "Y" then
		SELECT count(*) INTO :ll_row
		  FROM sfcworkman
		 WHERE ( sfcworkman.work_day = convert(char(10),dateadd(day, 0, :ld_date1),111) )
			AND work_no IN (SELECT DISTINCT insa_team FROM wc WHERE work_no LIKE :ls_jobno );
	  if isnull(ll_row) OR ll_row < 1 then
		  MessageBox("확인","해당하는 작업장의 근무신청서가 존재하지 않습니다.",Exclamation!)
	  end if
	end if
end if
//////////////////////////////////////////////////////////////////////////////////////////////////////////


// 작업지시 내용
if dw_1.visible = true then		
	if dw_1.Retrieve( ls_wcno, ld_date1, gs_area ) > 0 then
		// 작업장 잉여생산 수량은 작업장 관리에서 설정		
	else
		if isnull(ls_wcno) or ls_wcno = "" then
		else
			MessageBox("확인","해당하는 작업장의 작업지시내용이 존재하지 않습니다.",Exclamation!)
		end if
	end if
	dw_1.setfocus()

// 사용자재
else
	ii_dw2retrieve = dw_2.Retrieve( ls_wcno, ld_date1 )		// 잔량

   /* row 수동추가때문에 주석처리
	ll_row = dw_2.insertrow(0)  
	dw_2.object.order_no[ll_row] = left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
	dw_2.object.area_no[ll_row]  = gs_area		// 'S0001'  //시화 사업장 고정
	
	dw_2.object.use_date[ll_row] = datetime(dw_r.object.date[1])
	dw_2.object.wc_no[ll_row]    = trim(dw_r.object.line[1])
   */
   if ii_dw2retrieve > 0 then
		dw_2.scrolltorow(ii_dw2retrieve)	
		dw_2.SetColumn("coil_no")
		dw_2.SetFocus()
	else
		dw_1.SetFocus()
	end if
end if

end event

event resize;call super::resize;//////////////////////////
// 화면확대 취소
//////////////////////////
ib_exec = false		
//////////////////////////

// 작업장정보
dw_r.width  = newwidth  - 36

// 작업자
dw_3.y      = dw_r.y + dw_r.height
dw_3.width  = newwidth  - 36

// 작업내용
dw_1.y      = dw_3.y + dw_3.height + 20
dw_1.width  = newwidth  - 36
dw_1.height = newheight - 544

// 사용자재
dw_2.x      = dw_1.x
dw_2.y      = dw_3.y + dw_3.height + 20
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

dw_r.Object.DataWindow.Zoom = gl_resolution
dw_1.Object.DataWindow.Zoom = gl_resolution
dw_2.Object.DataWindow.Zoom = gl_resolution


end event

event ue_close;call super::ue_close;//
Close(This)
end event

event ue_append;call super::ue_append;//

end event

event ue_choice;call super::ue_choice;//

end event

event ue_delete;call super::ue_delete;//

end event

event ue_print;call super::ue_print;//

end event

event ue_save;call super::ue_save;//

end event

event timer;call super::timer;/*2018.11.26 jowonsuk 적용 db리커넥트 */
window lw_active
datawindow ldw
long  i

//if dw_test.settransobject(sqlca) <> 1 then
//
//	DISCONNECT USING SQLCA;
//	CONNECT USING SQLCA;
//	
//	lw_active = this.GetActiveSheet()
//	
//	IF IsValid(lw_active) THEN
//		
//	  for i = 1 to upperbound(lw_active.control)
//		if lw_active.control[i].typeof() = Datawindow! then
//			
//			ldw = lw_active.control[i]
//			ldw.SetTransObject(sqlca)				
//			
//		end if
//	  next
//	  
//	end if
//
//end if	
end event

type dw_1 from w_ancestor`dw_1 within w_line
integer x = 14
integer y = 520
integer width = 3758
integer height = 1956
string title = "작업일보"
string dataobject = "d_line01"
boolean hsplitscroll = false
end type

event dw_1::itemchanged;call super::itemchanged;//
long   ll_row
double ldb_order_qty, ldb_work_qty, ldb_rcpt_qty, ldb_rangeqty, ldb_percent
string ls_line

////////////////////////////////
// 생산현장_허용수량
////////////////////////////////
SELECT cast(ltrim(rtrim(item_nm)) as decimal) / 100 INTO :ldb_percent 
  FROM codemst WHERE item_cd = 'YCLINE_PERCENT';
ldb_percent   = this.object.sfc_range[1]	// 잉여생산

this.AcceptText()

ll_row = this.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ldb_order_qty = This.GetItemNumber(ll_row, 'order_qty')	// 계획수량
ldb_work_qty  = This.GetItemNumber(ll_row, 'work_qty')	// 작업수량
ldb_rcpt_qty  = This.GetItemNumber(ll_row, 'rcpt_qty')	// 총생산수량

ldb_rangeqty  = ldb_order_qty * ldb_percent		// 허용수량


// -수량입력안되게 하는로직
if ldb_work_qty = 0 then RETURN 2

ls_line = dw_r.object.line[1]

// 작업수량 + 총생산수량 > 허용수량
if (ldb_work_qty + ldb_rcpt_qty ) > ldb_rangeqty then
	MessageBox("확인", "작업수량 + 총생산수량 > 허용수량(" + string(ldb_rangeqty,"#,##0") + ") 확인하십시요.", StopSign!)
	RETURN 1
end if

// 작업수량(마이너스) > 총생산수량
if ldb_work_qty * -1 > ldb_rcpt_qty then
	MessageBox("확인", "작업수량(마이너스) > 총생산수량 확인하십시요.", StopSign!)
	RETURN 1
end if


////////////////////////////////////////////////////////////////////////////////////////////////////////
// 작업시점마다 재고반영을 해야하나, 현장에서는 오전에 일괄 라벨 출력하고 재고반영을 하고 있음
// wf_sfcday function에서 임시테이블로 저장하고 
// DTS에서 스케쥴 작업으로 재고반영하거나, 별도로 재고반영 프로그램을 만들것을 검토 해야 함. 
////////////////////////////////////////////////////////////////////////////////////////////////////////

if MessageBox("확인", "재고에 반영합니다. 작업수량이 정확합니까?", Question!, YesNo!, 1) = 1 then
	/////////////////////////////////////////////////////////////
	wf_sfcday(ll_row)		// sfcday(작업일보) 테이블에 저장
	/////////////////////////////////////////////////////////////

	This.SetItem(ll_row, 'rcpt_qty', (ldb_work_qty + ldb_rcpt_qty))
	RETURN 1
else
	RETURN 1
end if
////////////////////////////////////////////////////////////////////////////////////////////////////////


//if ldb_work_qty = 0 OR (ldb_work_qty + ldb_rcpt_qty) > (ldb_order_qty * 1.1) or (ldb_work_qty * -1 > ldb_rcpt_qty)  then

//// -수량입력안되게 하는로직
//if ldb_work_qty = 0 then
//	return 2
//end if
////if ldb_work_qty > 0 then
////	MessageBox('확인', '작업취소시에만 (-)수량을 입력할수 있습니다.~r~n' &
////							+ '작업수량을 확인 바랍니다.', StopSign!)//환경설정의 계산식으로 처리
////	return 1
////else
//	if MessageBox('확인', '재고에 반영합니다. 작업수량이 정확합니까?', Question!, YesNo!, 1) = 1 then
//		if wf_sfcday(ll_row) = false then return 1 //sfcday(작업일보)테이블에 반영
////		This.SetItem(ll_row, 'rcpt_qty', (ldb_work_qty + ldb_rcpt_qty))
//		return 1
//	ELSE
//		return 1
//	end if
//////end if
//

end event

event dw_1::itemerror;call super::itemerror;//choose case dwo.name
//	case 'work_qty'
		This.SetItem(row, 'work_qty', 0)
//end choose

return 2

end event

event dw_1::ue_key;call super::ue_key;/////////////////////////////////////////////////////////////////////////////////////////
// ReturnType(long) use_key
// argument Type keycode, key
// unsignedlong, keyflags
// EventID : pbm_dwnkey
/////////////////////////////////////////////////////////////////////////////////////////
date     ldt_date1
datetime ldt_date2

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

if ldt_date1 <> date(ldt_date2) then
	MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
	RETURN
end if
/////////////////////////////////////////////////////////////////////////////////////////

long ll_row

ll_row = this.getrow()
choose case key
	case KeyEnter!
		this.accepttext()
		Parent.TriggerEvent('ue_retrieve')
		this.scrolltorow(ll_row)
		
	case KeyEscape!				// 작업일자
		dw_r.setcolumn('date')
		dw_r.setfocus()
		
	case KeySpaceBar!				// 품목선택
		wf_spacebar()
		
	case KeyF1!, KeyEscape!		// F1: 생산라인변경
		dw_1.SelectRow(0, FALSE)
		wf_F1()			
		
	case KeyF2!						// F2: 작업자추가
		wf_F2()
		
	case KeyF3!						// F3: 기본정렬
		wf_F3()
		
	case KeyF4!						// F4: 작업일보등록
		wf_F4()
		
	case KeyF5!						// F5: 사용자재등록
		wf_F5()
		
	case KeyF6!						// F6: 필터
		wf_F6()
		
	case KeyF8!						// F8: 라벨출력
		if dw_1.visible = True and dw_1.rowcount() >= 1 then
			wf_F7()
		end if
		
	case KeyF10!					// F10: 전체선택
		wf_F10()
		
	case KeyF9!						// F9: 종료
		close( parent )
end choose

end event

event dw_1::getfocus;call super::getfocus;//
if this.rowcount() < 1 then dw_r.setfocus()

end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)

// 정렬하기 
string ls_wcno
string ls_sortstr, ls_colname
long   ll_strlen

ls_wcno    = dw_r.object.line[1]

ls_colname = dwo.name

if RightA(ls_colname, 2) = "_t" then // column header 선택		
	ll_strlen  = LenA(ls_colname) - 2
	ls_sortstr = LeftA(ls_colname, ll_strlen)
	
	//
	if	is_sortcolumn = ls_sortstr then
		if is_sortorder = "A" then
			is_sortcolumn= ls_sortstr
			is_sortorder = "D"
		elseif is_sortorder = "D" then
			is_sortcolumn= ls_sortstr
			is_sortorder = "A"
		else
			is_sortcolumn= ls_sortstr
			is_sortorder = "A"
		end if
	else
		is_sortcolumn= ls_sortstr
		is_sortorder = "A"
	end if

	// 절곡, 도장반만 정렬하기
	choose case ls_wcno
		//case "B01", "P01", "P02"
		  case "B01", "P01", "P02", "P03", "P04", "P06", "P07", "P08"  // 2020.01.09 jowonsuk
			// 정렬표시
			dw_r.object.b_f03.background.mode  = 0
			dw_r.object.b_f03.background.color = rgb(255, 102, 204)
		
			// 기본 Sort:( mpsorder_order A, order_seq A )
			dw_1.SetSort( is_sortcolumn + " " + is_sortorder )		// dw_1.SetSort( "#1 A, #2 D" )
			dw_1.Sort()		
	end choose
else											// column data 선택
	// 필터하기
	string ls_type, ls_op, ls_text

	ls_colname= dwo.name
	if ls_colname = "compute_1" then ls_colname = "qa"
	
	ls_type    = this.Describe(ls_colname + ".coltype")
	ls_op      = "="
	
	choose case LeftA(ls_type,4)
		case "char"
			ls_op   = "LIKE"
			ls_text = string( this.GetItemString( row, ls_colname ) )
		case "deci"
			ls_op   = "="
			ls_text = string( this.GetItemDecimal( row, ls_colname ) )
		case "numb", "long"
			ls_op   = "="
			ls_text = string( this.GetItemNumber( row, ls_colname ) ) 		
		case "time"
			ls_op   = "="
			ls_text = string( this.GetItemTime( row, ls_colname ) )
		case "date"
			ls_op   = ">="
			if ls_type = "datetime" then
				ls_text = string( this.GetItemDateTime( row, ls_colname ) )		
			else
				ls_text = string( this.GetItemDate( row, ls_colname ) )
			end if
	end choose
	
	dw_r.object.value[1] = ls_text
	is_colname = ls_colname
	is_coltype = ls_type
	is_op      = ls_op
	dw_1.setfocus()
end if

end event

type dw_r from w_ancestor`dw_r within w_line
integer x = 14
integer y = 4
integer width = 3758
integer height = 392
string dataobject = "d_line01_r"
end type

event dw_r::ue_enter;call super::ue_enter;//
string   ls_line
gs_where lst_code

this.accepttext()

ls_line = this.object.line[1]
if isnull(ls_line) OR trim(ls_line) = "" then
	OpenWithParm( w_wc, lst_code )
	lst_code = Message.PowerObjectParm
	if lst_code.chk = "N" then RETURN
	
	dw_1.Reset() ; dw_2.Reset()
	
	dw_r.object.line[1]    = lst_code.str1
	dw_r.object.wc_nm[1]   = lst_code.name
	dw_r.object.user_nm[1] = lst_code.str2
end if

Parent.TriggerEvent("ue_retrieve")

end event

event dw_r::ue_key;call super::ue_key;//
string ls_wc, ls_area

dw_r.accepttext()
ls_wc = dw_r.object.line[1]

choose case key
	case KeyF1!, KeyF9!		// 생산라인, 종료
		
	case else
		if isnull(ls_wc) OR trim(ls_wc) = "" then
			MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
			RETURN
		end if
end choose

//////////////////////////////////////////////////////////////////////////////////////////////
// F1:생산라인 F2:작업자 F3: 기본정렬 F4:작업일보  F5:사용자재 F6: 필터 F8:라벨출력 F9:종료
//////////////////////////////////////////////////////////////////////////////////////////////
long     ll_row
date     ldt_date1
datetime ldt_date2

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

choose case key
	case KeyF1!			// F1: 생산라인변경
		wf_F1()

	case KeyF2!			// F2: 작업자추가
		wf_F2()
		
	case KeyF3!			// F3: 기본정렬
		wf_F3()
		
	case KeyF4!			// F4: 작업일보등록
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if
		wf_F4()

	case KeyF5!			// F5: 사용자재등록
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if
		wf_F7()        // 성형반, 유압반 라벨

	case KeyF6!			// F6: 필터
		wf_F6()
		
	case KeyF8!			// F8: 라벨출력
		if dw_1.visible = true AND dw_1.rowcount() >= 1 then	// 작업일보등록 중
			if ldt_date1 <> date(ldt_date2) then
				MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
				RETURN
			end if
			wf_F7()		// 성형반, 유압반 라벨
		end if
		
	case KeyF10!		// F10: 전체선택
		wf_F10()
		
	case KeyF11!		// F11: 한줄추가
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if

		if dw_2.visible = True  then
			ll_row = dw_2.insertrow(0)  
			
		//	dw_2.object.order_no[ll_row] = left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
			dw_2.object.area_no[ll_row]  = gs_area
			
			dw_2.object.use_date[ll_row] = datetime(dw_r.object.date[1])
			dw_2.object.wc_no[ll_row]    = trim(dw_r.object.line[1])
		
			dw_2.scrolltorow(ll_row)	
			dw_2.SetFocus()
			dw_2.SetColumn('coil_no')
		end if
		
	case KeyF9!			// F9: 종료
		Close(Parent)
end choose

end event

event dw_r::itemchanged;call super::itemchanged;// 라인, 작업일자
long     ll_row
string   ls_wc_nm
date     ld_date1, ld_date3	// 시스템시간 -> 시스템일자 변환
datetime ldt_date2				// 시스템일자

choose case dwo.name
	case "line"
		SELECT work_name INTO :ls_wc_nm FROM wc WHERE work_no = :data;
		if SQLCA.Sqlcode <> 0 then
			this.SetItem(row, "wc_nm", "미등록 코드")
		else
			this.SetItem(row, "wc_nm", ls_wc_nm)
		end if

		dw_1.reset()
		dw_2.reset()
		this.AcceptText()
		
	case "date"
		ld_date1 = date(data)
		ld_date1 = this.object.date[this.getrow()]

		SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자
		ld_date3 = date(ldt_date2)
		
		if ld_date1 < ld_date3 then		// 작업일자 < 시스템일자
			MessageBox("확인","시스템일자[" + string(ld_date3,"yyyy/mm/dd") + &
			           "] 보자 이전일자의 ~n~n작업일자[" + string(ld_date1,"yyyy/mm/dd")+"]는 작업이 불가능 합니다.")
			RETURN 1
		end if

		dw_1.reset()
		dw_2.reset()
		this.AcceptText()		
end choose

end event

event dw_r::itemerror;call super::itemerror;//
datetime ldt_date2

choose case dwo.name
	case "line"
		
	case "date"
		SELECT top 1 getdate() INTO :ldt_date2 FROM login;
		this.object.date[1] = date(ldt_date2)
end choose

RETURN 2

end event

event dw_r::buttonclicked;call super::buttonclicked;//
string ls_wc

dw_r.accepttext()
ls_wc = dw_r.object.line[1]

choose case dwo.name
	case "b_f01", "b_f09"	// 생산라인, 종료
		
	case else
		if isnull(ls_wc) OR trim(ls_wc) = "" then
			MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
			RETURN
		end if
end choose

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// F1:생산라인 F2:작업자 F3:기본정렬 F4:작업일보  F5:사용자재(성형반, 유압반 라벨) F8:라벨출력 F9:종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
long     ll_row
date     ldt_date1
datetime ldt_date2

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

choose case dwo.name
	case "b_f01"		// F1: 생산라인변경
		wf_F1()
		wf_F4()			// 기본화면 변경함

	case "b_f02"		// F2: 작업자추가
		wf_F2()
		
	case "b_f03"		// F3: 기본정렬
		wf_F3()
		
	case "b_f04"		// F4: 작업일보등록
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if
		wf_F4()
		
	case "b_f05"		// F5: 사용자재등록
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if
		wf_F5()        
	
	case "b_f06"		// F6: 필터
		wf_F6()
		
	case "b_f08"		// F8: 라벨출력
		if dw_1.visible = true and dw_1.rowcount() >= 1 then	// 작업일보등록 중
			if ldt_date1 <> date(ldt_date2) then
				MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
				RETURN
			end if
			wf_F7()		// 라벨출력
		end if

	case "b_f10"		// F10: 전체선택
		wf_F10()		
		
	case "b_f11"		// F11: 한줄추가
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if

		if dw_2.visible = True  then
			ll_row = dw_2.insertrow(0)  
			
		//	dw_2.object.order_no[ll_row] = left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
			dw_2.object.area_no[ll_row]  = gs_area		// 'S0001'  // 사업장
			
			dw_2.object.use_date[ll_row] = datetime(dw_r.object.date[1])
			dw_2.object.wc_no[ll_row]    = trim(dw_r.object.line[1])
		
			dw_2.scrolltorow(ll_row)	
			dw_2.SetFocus()
			dw_2.SetColumn('coil_no')
		end if
		
	case "b_f09"		// F9: 종료
		close( parent )
end choose

end event

event dw_r::getfocus;call super::getfocus;//// getfocus()
//this.Object.DataWindow.Color = rgb(255,0,255)
//
end event

event dw_r::rbuttondown;call super::rbuttondown;//
string   ls_date
date     ld_date1, ld_date3
datetime ldt_date2

choose case dwo.name
	case "date"
		OpenWithParm(w_calendar, ls_date)
		ls_date = Message.StringParm
		if ls_date <> 'N' then
			this.object.date[1] = date(ls_date)
		end if

		ld_date1 = date(ls_date)
		ld_date1 = this.object.date[this.getrow()]

		SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자
		ld_date3 = date(ldt_date2)
		
//		if ld_date1 < ld_date3 then		// 작업일자 < 시스템일자
//			MessageBox("확인","시스템일자[" + string(ld_date3,"yyyy/mm/dd") + &
//			           "] 보자 이전일자의 ~n~n작업일자[" + string(ld_date1,"yyyy/mm/dd")+"]는 작업이 불가능 합니다.")
//			this.object.date[1] = date(ld_date3)
//			RETURN
//		end if
		
	case "b_f03"
		// 정렬
		wf_f3()

	case "b_f06"
		// 필터해지
		dw_r.object.value[1] = ""
		wf_f6()
end choose

end event

type dw_3 from datawindow within w_line
integer x = 14
integer y = 412
integer width = 3758
integer height = 96
boolean bringtotop = true
string title = "none"
string dataobject = "d_sfcdayuser_s"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_line
event ue_dwnkey ( )
event ue_key pbm_dwnkey
event ue_enter pbm_dwnprocessenter
integer x = 165
integer y = 916
integer width = 3515
integer height = 1100
integer taborder = 30
boolean bringtotop = true
string title = "사용자재"
string dataobject = "d_sfcuse"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;//
long ll_row 

dw_r.accepttext()
/////////////////////////////////////////////////////////////////////////////////////////
date     ldt_date1
datetime ldt_date2

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

if ldt_date1 <> date(ldt_date2) then
	MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
	RETURN
end if
/////////////////////////////////////////////////////////////////////////////////////////

this.accepttext()

choose case key
	case KeyDelete!   // delete 키로 삭제 할것인가?
		
	case KeyF12!		// 한줄삭제
		dwItemStatus l_status
		
		ll_row   = this.getrow()
		l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
		if l_status = newModified! or l_status = new! then
			this.deleterow(ll_row)
		else
			if MessageBox('확인', '한줄을 삭제합니다. 정확합니까?', Question!, YesNo!, 1) = 1 then
				this.deleterow(ll_row)
				if wf_dw2_delete() = true then
					gf_update1(dw_2,"N")
					Parent.TriggerEvent('ue_retrieve')
				else
					rollback;
					return
				end if
			end if
		end if
		
	case KeyF11!		// 한줄추가
		ll_row = dw_2.insertrow(0)  

	//	dw_2.object.order_no[ll_row] = left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
		dw_2.object.area_no[ll_row]  = gs_area
		
		dw_2.object.use_date[ll_row] = datetime(dw_r.object.date[1])
		dw_2.object.wc_no[ll_row]    = trim(dw_r.object.line[1])
	
		dw_2.scrolltorow(ll_row)	
		dw_2.SetColumn('coil_no')
		dw_2.SetFocus()

	case KeyF1!			// F1:생산라인 변경
		wf_F1()
		
	// F2:작업자추가                                  

	case KeyEscape!
//		dw_r.SetColumn('line')
		dw_1.SetFocus()
		
	case KeyF4!			// F4:작업일보등록
		wf_F4()
		
	case KeyF5!			// F5:사용자재등록
		wf_F5()
		
	case KeyF9!			// F9:종료
		close( parent )
end choose

end event

event ue_enter;//
dwItemStatus l_status
gs_coil lst_code
long    ll_row,  ll_cnt
string  ls_coil, ls_loc, ls_remqty_chk = 'N', ls_order

dw_r.accepttext()
this.accepttext()

ll_row = this.getrow()
IF ll_row < 1 then RETURN 

ls_coil = trim(this.object.coil_no[ll_row])
ll_cnt  = this.object.sfcuse_cnt[ll_row]

choose case This.GetColumnName()
	case 'coil_no'
		l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
		if l_status = newModified! or l_status = new! then
			lst_code.loc_no = dw_r.GetItemString(1, 'line')		// 작업장
			OpenWithParm( w_coil01, lst_code )
			lst_code = Message.PowerObjectParm

			if lst_code.chk = "N" then 
				if isnull(ls_coil) or trim(ls_coil) = '' then
					this.setcolumn('coil_no')
				else
					this.setcolumn('sfcuse_cnt')
				end if
				
				RETURN 1
			else
				this.object.coil_no[ll_row]         = lst_code.coil_no
				this.object.loc_no[ll_row]          = lst_code.loc_no
				this.object.sfcuse_cnt[ll_row]      = 0
				this.object.item_no[ll_row]         = lst_code.item_no
				this.object.item_item_name[ll_row]  = lst_code.item_name
				this.object.qa[ll_row]              = lst_code.qa
				this.object.qcnt[ll_row]            = lst_code.qcnt
				this.object.sfcuse_mod_len[ll_row]  = lst_code.length
				this.object.sfcuse_wid[ll_row]      = lst_code.wid
				this.object.sfcuse_unit_qty[ll_row] = lst_code.unit_qty
				this.object.sfcuse_mod_qty[ll_row]  = 0
				this.object.use_qty[ll_row]         = 0
				this.object.etc_no[ll_row]          = lst_code.etc_no
				this.object.uom[ll_row]             = lst_code.uom
			end if
		end if
		
	case 'sfcuse_cnt'
		if ll_cnt = 0 then RETURN 1
			this.object.sfcuse_mod_qty[ll_row] = this.object.sfcuse_unit_qty[ll_row] * this.object.sfcuse_cnt[ll_row]
			this.object.use_qty[ll_row] = this.object.sfcuse_mod_qty[ll_row]
			
	case 'rem_len'
		if this.object.rem_qty[ll_row] > 0 then
			ls_remqty_chk = "잔량을"
		else
			ls_remqty_chk = "사용 자재를"
		end if
	
		l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
		if l_status = newModified! or l_status = new! then
			if MessageBox('확인', ls_remqty_chk + ' 등록 하시겠습니까?', Question!, YesNo!, 1) = 1 then
				l_status = dw_2.GetItemStatus(this.rowcount(),0, Primary!)

				if wf_dw2_check(ll_row) = true then
					// 생산주문번호 자동 증가 
					if ii_dw2retrieve < 1 then
						dw_2.object.order_no[ll_row]  = LeftA(gs_area,1) + 'NON' &
																+ string(dw_r.object.date[1],'yyyymmdd') + '-01'
					else
						ls_order = dw_2.object.order_no[ll_row - 1]
						ls_order = LeftA(ls_order,13) + string(integer(MidA(trim(ls_order), 14)) + 1,'00')
						dw_2.object.order_no[ll_row] = ls_order
					end if

					// 		
					if wf_dw2_insert(ll_row) = true then
						if gf_update1(dw_2, 'N') = true then
							ls_coil = trim(dw_2.object.rem_lot[ll_row]) ///rem_lot
							ls_loc  = trim(dw_2.GetItemString(ll_row,"loc_no"))
							if ls_remqty_chk = "잔량을" then 	// 잔량중량이 입력 되었을대만 잔량 바코드 출력
								wf_barprint( ls_coil, ls_loc )	// 잔량코일 출력
							end if
						end if
					end if	// sfcday(작업일보)테이블에 저장
				end if
			else
				this.setcolumn('rem_qty')
				RETURN 1
			end if

		elseif l_status = DataModified! and (l_status <> newModified! or l_status <> new!) then
			if MessageBox('확인', ls_remqty_chk + ' 등록 하시겠습니까?', Question!, YesNo!, 1) = 1 then
				l_status = dw_2.GetItemStatus(this.rowcount(),0, Primary!)
			
				if wf_dw2_check(ll_row) = true then
					if wf_dw2_insert(ll_row) = true then
						if gf_update1(dw_2, 'N') = true then
							ls_coil = trim(dw_2.object.rem_lot[ll_row]) ///rem_lot
							ls_loc  = trim(dw_2.GetItemString(ll_row,"loc_no"))
							if ls_remqty_chk = '잔량을' then  	// 잔량중량이 입력 되었을대만 잔량 바코드 출력
								wf_barprint( ls_coil, ls_loc )	// 잔량코일 출력
							end if
						end if
					end if	// sfcday(작업일보)테이블에 저장
				end if
			else
				this.setcolumn('rem_qty')
				RETURN 1
			end if
		end if		
end choose

this.accepttext()
Send( Handle(this), 256, 9, 0 )
RETURN 1

end event

event itemchanged;//
long   ll_row
int    li_qcnt, li_sfcuse_cnt
double ldb_rem_qty, ldb_use_qty

This.AcceptText()

li_qcnt       = dw_2.GetItemNumber(row, 'qcnt', Primary!, True)
li_sfcuse_cnt = dw_2.GetItemNumber(row, 'sfcuse_cnt', Primary!, False)

ll_row      = this.getrow()
ldb_rem_qty = this.GetItemNumber(ll_row, 'rem_qty')  //잔량 중량
//ldb_use_qty = this.GetItemNumber(ll_row, 'use_qty')
ldb_use_qty = this.GetItemNumber(ll_row, 'sfcuse_unit_qty')  //단중

choose case dwo.name
	case 'sfcuse_cnt'
		if li_qcnt < li_sfcuse_cnt then
			MessageBox('확인', '사용갯수가 등록된 갯수보다 큽니다. 확인 바랍니다.', StopSign!)
			return 1
		end if
		
	case 'rem_qty'
		if ldb_rem_qty > ldb_use_qty then
			MessageBox('확인', '잔량중량이 단중보다 큽니다. 확인 바랍니다.', StopSign!)
			return 1
		end if
end choose

return 0

end event

event itemerror;//
choose case dwo.name
	case 'sfcuse_cnt'
		This.SetItem(row, 'sfcuse_cnt', 0)
		this.setcolumn('sfcuse_cnt')
		this.setfocus()
		
	case 'rem_qty'
		This.SetItem(row, 'rem_qty', 0)
		this.setcolumn('rem_qty')
		this.setfocus()
end choose

return 2

end event

event clicked;//
this.scrolltorow(row)

end event

event doubleclicked;//
this.triggerevent( "ue_enter" )

end event

type dw_8 from datawindow within w_line
integer x = 809
integer y = 1020
integer width = 1915
integer height = 836
integer taborder = 20
boolean bringtotop = true
string title = "d_sfclabel01_2"
string dataobject = "d_sfclabel01_1"
boolean border = false
boolean livescroll = true
end type

