$PBExportHeader$w_coilslit_m.srw
$PBExportComments$스리타반 입력
forward
global type w_coilslit_m from w_ancestor
end type
type dw_4 from datawindow within w_coilslit_m
end type
type dw_5 from datawindow within w_coilslit_m
end type
type dw_2 from datawindow within w_coilslit_m
end type
type dw_3 from datawindow within w_coilslit_m
end type
type dw_6 from datawindow within w_coilslit_m
end type
type dw_7 from datawindow within w_coilslit_m
end type
type dw_8 from datawindow within w_coilslit_m
end type
end forward

global type w_coilslit_m from w_ancestor
integer width = 3872
integer height = 2668
string title = "스리팅(w_coilslit_m)"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "StopSign!"
boolean toolbarvisible = false
boolean ib_exec = true
event ue_dwnkey pbm_dwnkey
dw_4 dw_4
dw_5 dw_5
dw_2 dw_2
dw_3 dw_3
dw_6 dw_6
dw_7 dw_7
dw_8 dw_8
end type
global w_coilslit_m w_coilslit_m

type variables
integer ii_wid = 0
string is_wc_no, is_loc 

end variables

forward prototypes
public subroutine wf_f1 ()
public subroutine wf_f8 ()
public subroutine wf_f4 ()
public subroutine wf_f12 ()
public function boolean wf_move ()
public function string wf_coil (long arg_dw1row, long arg_dw2row)
public subroutine wf_f5 ()
public subroutine wf_multiprint (string as_order_no)
public subroutine wf_f6 (string asa_coilorderdet_order[])
end prototypes

event ue_dwnkey;//
choose case key
	case KeyF1!		// F1: 최신정보
		wf_f1()
		
	case KeyF4!		// F4: 입력선택
		dw_2.taborder = 0
		dw_3.taborder = 10
		dw_3.SetFocus()

	case KeyF5!		// F5: 코일재고현황
		wf_f5()

	case KeyF6!		// F6: 재출력
		open(w_barcode_print_r)

	case KeyF8!		// F8: 저장
		dw_3.setredraw(false)		
		wf_f8()
		dw_3.setredraw(true)
		
	case KeyF9!		// F9: 종료
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( this )
end choose

end event

public subroutine wf_f1 ();This.TriggerEvent('ue_retrieve')

end subroutine

public subroutine wf_f8 ();//
integer li_dw2cnt, li_i, li_dw3row, li_dw3cnt
string  ls_sqlerrtext

dw_2.AcceptText()

li_dw3row = dw_3.GetRow()
li_dw3cnt = dw_3.rowcount()

if  li_dw3cnt < 1 or dw_3.object.save_chk[li_dw3row] = 'C' then
	MessageBox('오류', '이미 저장이 완료 되었습니다.')
	RETURN
end if
if ( isnull(dw_3.object.length[li_dw3row]) ) or ( dw_3.object.length[li_dw3row] < 1 ) then
	MessageBox('오류', '길이가 입력되지 않았습니다.')
	RETURN
end if


decimal {1} ld_swid, ld_cha1, ld_cha2, ld_cha3
integer li_slitcnt

li_dw2cnt = dw_2.Rowcount()
for li_i = 1 to li_dw2cnt - 1
	ld_swid = dw_2.GetItemDecimal(li_i, "swid")
//->	
	if isnull(dw_2.GetItemDecimal(li_i, "qc_chk1")) then
		dw_2.SetFocus()
		dw_2.ScrollToRow(li_i)
		dw_2.SetColumn("qc_chk1")
		MessageBox('오류', '측정 치수가 입력되지 않았습니다. 치수를 입력하세요.')
		RETURN		
	else
		ld_cha1 = ld_swid - dw_2.GetItemDecimal(li_i, "qc_chk1")
	end if

	if ld_cha1 < -0.2 or ld_cha1 > 0.2 then
		dw_2.SetFocus()
		dw_2.ScrollToRow(li_i)
		dw_2.SetColumn("qc_chk1")
		MessageBox('오류', '측정 치수가 입력범위(-0.2 ∼ +0.2)를 벗어 났습니다. ~r~n다시 입력하시기 바랍니다.')
		RETURN		
	end if
//->
	li_slitcnt = dw_2.GetItemDecimal(li_i, "coilsliting_cnt")
	if li_slitcnt > 2 then
		if isnull(dw_2.GetItemDecimal(li_i, "qc_chk2")) then
			dw_2.SetFocus()
			dw_2.ScrollToRow(li_i)
			dw_2.SetColumn("qc_chk2")
			MessageBox('오류', '측정 치수가 입력되지 않았습니다. 치수를 입력하세요.')
			RETURN		
		else
			ld_cha2 = ld_swid - dw_2.GetItemDecimal(li_i, "qc_chk2") 
		end if
	
		if ld_cha2 < -0.2 or ld_cha2 > 0.2 then
			dw_2.SetFocus()
			dw_2.ScrollToRow(li_i)
			dw_2.SetColumn("qc_chk2")
			MessageBox('오류', '측정 치수가 입력범위(-0.2 ∼ +0.2)를 벗어 났습니다. ~r~n다시 입력하시기 바랍니다.')
			RETURN		
		end if
	end if
//->	
	if li_slitcnt > 3 then
		if isnull(dw_2.GetItemDecimal(li_i, "qc_chk3")) then
			dw_2.SetFocus()
			dw_2.ScrollToRow(li_i)
			dw_2.SetColumn("qc_chk3")
			MessageBox('오류', '측정 치수가 입력되지 않았습니다. 치수를 입력하세요.')
			RETURN		
		else
			ld_cha3 = ld_swid - dw_2.GetItemDecimal(li_i, "qc_chk3") 
		end if
		
		if ld_cha3 < -0.2 or ld_cha3 > 0.2 then
			dw_2.SetFocus()
			dw_2.ScrollToRow(li_i)
			dw_2.SetColumn("qc_chk3")
			MessageBox('오류', '측정 치수가 입력범위(-0.2 ∼ +0.2)를 벗어 났습니다. ~r~n다시 입력하시기 바랍니다.')
			RETURN
		end if
	end if
	
next
wf_f4()

string ls_order, ls_coilorder_order, ls_wc_place, ls_supp_no, ls_w_coil_no
string ls_coil, ls_item_no, ls_qa, ls_proc_flag, ls_loc, ls_old_time, ls_flag
string ls_witem_no, ls_wqa, ls_oc, ls_sheet, ls_wloc, ls_etc, ls_order_no, ls_chk2
dec{1} ld_w_wid, ld_wid
dec{2} ld_length
dec{3} ld_unit_qty
long   ll_rowcount, ll_row, ll_count, ll_chkcount, ll_length
int    li_order_seq, li_seq, li_coilorderdetcnt, li_cnt, li_wcnt, li_wunit_qty
datetime ldt_today
date   ld_sfc_date
string lsa_coilorderdet_order[]

if wf_move() = false then
	dw_1.reset()
	dw_4.reset()
	RETURN
end if

dw_4.accepttext()

ld_sfc_date = date(dw_r.object.date[1])
ls_chk2     = "N"
ls_old_time = string(now(),'hh:mm:ss:ff')


ll_rowcount = dw_4.rowcount()
for ll_row = 1 to ll_rowcount
	ls_chk2     = "Y"
	ls_old_time = string(now(),'hh:mm:ss:ff')
	ls_order    = dw_4.object.order_no[ll_row]
	
	li_seq      = dw_4.object.seq[ll_row]  
	ls_coilorder_order = dw_4.object.coilorder_order[ll_row]
	li_order_seq = dw_4.object.order_seq[ll_row]
	ls_wc_place  = dw_4.object.wc_place[ll_row]
	ls_supp_no   = dw_4.object.supp_no[ll_row]
	ls_w_coil_no = dw_4.object.w_coil_no[ll_row]
	ld_w_wid     = dw_4.object.w_wid[ll_row]
	ls_coil      = dw_4.object.coil_no[ll_row]
	ld_wid       = dw_4.object.wid[ll_row]
	ls_item_no   = dw_4.object.item_no[ll_row]  
	ls_qa        = dw_4.object.qa[ll_row]
	ld_unit_qty  = dw_4.object.unit_qty[ll_row]
	li_cnt       = dw_4.object.cnt[ll_row]
	ld_length    = dw_4.object.length[ll_row]
	ls_proc_flag = dw_4.object.proc_flag[ll_row]
	ls_sheet     = dw_4.object.sheet[ll_row]
	
	if ls_sheet <> 'L' then
		lsa_coilorderdet_order[ll_row] = ls_order
	end if
	
	li_wcnt      = dw_4.object.coilorderdet_cnt[ll_row]
	ls_loc       = dw_4.object.loc_no[ll_row]
	ls_wloc      = dw_4.object.wloc_no[ll_row]
	
	UPDATE coilorderdet 
	   SET proc_flag = "C" // 작업완료(스리팅작업일보작성)
	 WHERE coilorder_order = :ls_coilorder_order AND order_seq = :li_order_seq;		
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('오류11',"코일작업오더[coilorderdet]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
		RETURN
	end if

	SELECT count(*) INTO :li_coilorderdetcnt 
	  FROM coilorderdet
	 WHERE coilorder_order = :ls_coilorder_order	AND proc_flag = 'M';
	if li_coilorderdetcnt > 0 then
		ls_flag = "O"	// 작업중(스리팅작업일보작성중)
	else
		ls_flag = "C"	// 작업완료(스리팅작업일보작성)
	end if
	
	UPDATE coilorder SET open_close = :ls_flag WHERE order_no = :ls_coilorder_order;		
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('UPDATE오류12',"코일작업오더[coilorder]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
		RETURN
	end if
	
	setnull(ls_oc) ; setnull(ls_witem_no) ; setnull(ls_wqa) ; setnull(li_wunit_qty)
	SELECT item_no, qa, open_close, unit_qty, etc_no
	  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty, :ls_etc 
	  FROM coilmst
	 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('오류13',"코일마스터[coilmst]SELECT시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
		RETURN
	end if
	
	if ls_oc = "P" then
		//원코일 UPDATE
		UPDATE coilmst 
		   SET qcnt = 0, open_close = "C" // 사용완료(스리팅작업일보작성)
		 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류14',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
			RETURN
		end if
		
		// [IW]작업장출고 로직입니다.
		for ll_count = 1 to 100000
			if ls_old_time <> string(now(), 'hh:mm:ss:ff') then
				ls_old_time = string(now(),'hh:mm:ss:ff')	
				exit
			end if
		next		
		
		INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
			    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
		VALUES ( getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order,
			    0, :li_wunit_qty * :li_wcnt, 0, :is_wc_no, :ls_w_coil_no, "", :li_wunit_qty, :li_seq, 
				 :li_wunit_qty, :gs_userid);
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류15',string(ll_row, '##') + '번째줄 [inaudit] INSERT중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN
		end if		
	end if
	
	if ls_sheet = 'C' or ls_sheet = 'L' then
		//스리팅코일추가
		INSERT INTO coilmst ( coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
				 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close, rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
		VALUES ( :ls_coil, :ld_wid, :ls_item_no, :ls_qa, :ls_loc, :ld_sfc_date, :ld_unit_qty, :ld_length,
				 :li_cnt, :li_cnt,    "",  :ls_supp_no, "S", :ls_order, :li_seq, "O", "", :ld_unit_qty, :ld_length, :ls_etc, :ls_w_coil_no);
		if sqlca.sqldbcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류16',string(ll_row, '##') + '번째줄 [코일마스터] INSERT중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN 					
		end if
	else
		//sheet추가
		INSERT INTO sheetmst ( sheet_no,    item_no,   qa,    loc_no,  rcpt_date, unit_qty,   
				 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close, rem, rcpt_qty)
		VALUES (:ls_coil, :ls_item_no, :ls_qa, :ls_loc, :ld_sfc_date, :ld_unit_qty, 
				 :li_cnt, :li_cnt,    "",  :ls_supp_no, "S", :ls_order, :li_seq, "O", "", :ld_unit_qty);
		if sqlca.sqldbcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류16-1',string(ll_row, '##') + '번째줄 [sheet마스터] INSERT중 DB오류발생하였습니다.~r~n' + ls_sqlerrtext,exclamation!)
			RETURN 					
		end if
	end if
	
	// 생산입고에 로직입니다.
	for ll_count = 1 to 100000
		if ls_old_time <> string(now(), 'hh:mm:ss:ff') then
			ls_old_time = string(now(),'hh:mm:ss:ff')	
			exit
		end if
	next
	
	INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
		    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id)  
	VALUES ( getdate(), :ld_sfc_date, :ls_item_no, :ls_qa, :ls_loc, 'RC', :ls_order,
		    :ld_unit_qty * :li_cnt, 0, 0,	:is_wc_no, :ls_coil,"", :ld_unit_qty, :li_seq, :ld_unit_qty * :li_cnt, :gs_userid);
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		MessageBox('오류17',string(ll_row, '##') + '번째줄 [inaudit] INSERT중 DB오류가 발생했습니다.r~n' + ls_sqlerrtext,exclamation!)
		rollback;
		RETURN
	end if
//	als_order_no[] = ls_order_no
next //dw_4.rowcount()

if ls_chk2 = "Y" then
	dw_5.reset()
	dw_5.retrieve(lsa_coilorderdet_order)
	
	for ll_row = 1 to dw_5.rowcount()
		ls_w_coil_no = dw_5.object.coil_no[ll_row]
		ld_w_wid     = dw_5.object.wid[ll_row]
		ls_wloc      = dw_5.object.loc_no[ll_row]
		
		setnull(ls_oc) ; setnull(ls_witem_no) ; setnull(ls_wqa) ; setnull(li_wunit_qty)
		SELECT item_no, qa, open_close, unit_qty
		  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty 
		  FROM coilmst
		 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류18',"코일마스터[coilmst]SELECT시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
			RETURN
		end if

		if ls_oc = "P" then
			// 원코일 합체 UPDATE
			li_cnt   = dw_5.object.cnt[ll_row]
			ls_order = dw_5.object.order_no[ll_row]
			UPDATE coilmst 
			   SET qcnt = 0 , open_close = "C" // 사용완료(스리팅작업일보작성)
			 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('오류19',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
				RETURN
			end if

			// [IW]작업장출고 로직입니다.
			for ll_count = 1 to 100000
				if ls_old_time <> string(now(), 'hh:mm:ss:ff') then
					ls_old_time = string(now(),'hh:mm:ss:ff')	
					exit
				end if
			next
			
			INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no, rcpt_qty, 
				    issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
			VALUES ( getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order, 0, 
				    :li_wunit_qty * :li_cnt, 0, :is_wc_no, :ls_w_coil_no, "coilsum", :li_wunit_qty, :li_cnt, :li_wunit_qty, :gs_userid);
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('오류20',"[inaudit] INSERT중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
				RETURN
			end if		
		end if
	next
end if

if dw_4.UPDATE() = 1 then
	COMMIT;
	
	ls_chk2 = 'N'
	dw_3.accepttext()
	for ll_row = 1 to li_dw3cnt
		if dw_3.getitemnumber(ll_row,'length',primary!,true) <> dw_3.getitemnumber(ll_row,'length',primary!,false) then
			ls_order_no = dw_3.object.coilorderdet_order_no[ll_row]
			li_seq      = dw_3.getitemnumber(ll_row,'order_seq',primary!,true)
			ll_length   = dw_3.getitemnumber(ll_row,'length',primary!,false)
			
			SELECT count(*) INTO :ll_chkcount FROM coilsfcday WHERE coilsfcday.order_no = :ls_order_no;				
			if ll_chkcount > 0 then 				
				// 코일마스터 테이블의 스리팅된 품목의 길이변경
				UPDATE coilmst SET coilmst.length = :ll_length 
				  FROM coilsfcday
				 WHERE coilmst.coil_no = coilsfcday.coil_no
				   AND coilmst.loc_no = coilsfcday.loc_no  AND coilsfcday.order_no = :ls_order_no ;	  
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('오류21-2',"[coilmst] UPDATE중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if
	
				// 코일 생산계획 헤더 테이블의 스리팅된 품목의 길이변경
				UPDATE coilorderdet SET length = :ll_length WHERE order_no = :ls_order_no;	  
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('오류21-3',"[coilmst] UPDATE중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if

				// 스리팅 작업일보 테이블 품목의 길이변경
				UPDATE coilsfcday SET length = :ll_length	WHERE order_no = :ls_order_no ;	  
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('오류21-4',"[coilsfcday] UPDATE중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if				
				
				// 스리팅 작업일보 테이블 품목의 길이변경 업데이트시 스리팅계획 길이 업데이트.
				UPDATE coilsliting SET length = :ll_length WHERE order_no = :ls_order_no ;	  
	 			if sqlca.sqlcode < 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('오류21-5',"[coilsliting] UPDATE중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if				
				
				ls_chk2 = 'Y'
			end if
		end if		
	next
	
	if ls_chk2 = 'Y' then
		COMMIT;  // 길이 적용
		MessageBox("확인", "저장되었습니다.")
	end if
	
	wf_f6( lsa_coilorderdet_order[] )  // 라벨출력
	wf_f1()
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if

// 저장시점의 Row 로 이동
dw_3.SetFocus()
dw_3.ScrollToRow(li_dw3row)
dw_3.SetColumn("length")

end subroutine

public subroutine wf_f4 ();//
long ll_dw3row, ll_dw3cnt
long ll_pri, ll_cnt, ll_last_pri
	
dw_3.accepttext()
ll_dw3row = dw_3.getrow()		
ll_dw3cnt = dw_3.rowcount()
if ll_dw3row < 1 then return

if dw_3.object.save_chk[ll_dw3row] <> 'C' then
	dw_3.SelectRow(ll_dw3row, NOT dw_3.IsSelected(ll_dw3row))

	if dw_3.isselected(ll_dw3row) = true then
		ll_pri = 0
		for ll_cnt = 1 to ll_dw3cnt
			if isnull(dw_3.object.pri[ll_cnt]) or dw_3.object.pri[ll_cnt] = 0 then continue

			if ll_pri < dw_3.object.pri[ll_cnt] then
				ll_pri = dw_3.object.pri[ll_cnt]
			end if
		next
		dw_3.object.pri[ll_dw3row] = ll_pri + 1
		ii_wid = ii_wid + 1
	else
		ll_pri      = dw_3.object.pri[ll_dw3row]
		ll_last_pri = ll_pri - 1
		ii_wid      = ii_wid - 1
		dw_3.object.pri[ll_dw3row] = 0
		
		for ll_cnt = 1 to ll_dw3cnt
			if isnull(dw_3.object.pri[ll_cnt]) then continue
			
			if ll_pri < dw_3.object.pri[ll_cnt] then
				dw_3.object.pri[ll_cnt] = dw_3.object.pri[ll_cnt] - 1
				ll_last_pri = dw_3.object.pri[ll_cnt] 
			end if
		next
	end if
end if

end subroutine

public subroutine wf_f12 ();//
string ls_proc
string ls_order, ls_coilorder_order, ls_wc_place, ls_supp_no, ls_w_coil_no
string ls_coil,  ls_item_no, ls_qa, ls_proc_flag, ls_loc, ls_old_time, ls_flag
string ls_witem_no, ls_wqa, ls_oc, ls_sheet, ls_wloc, ls_etc
string ls_coilorderdet_order[]
dec{1} ld_w_wid, ld_wid
dec{3} ld_unit_qty
long ll_rowcount, ll_row, ll_count, ll_chkcount, ll_cnt, ll_dw3row
long ll_pri, ll_last_pri
int  li_seq, li_order_seq, li_cnt, li_coilorderdetcnt, li_wunit_qty, li_wcnt

datetime ldt_today
date     ld_sfc_date

if dw_3.rowcount() < 1 then RETURN
ll_dw3row = dw_3.getrow()		

if dw_3.object.save_chk[ll_dw3row] = 'C' then
	if MessageBox('확인',string(ll_dw3row) + ' 행을 삭제 하시겠습니까?',StopSign!,YesNo!) = 1 then 

		ld_sfc_date = date(dw_r.object.date[1])
		ls_order    = dw_3.object.coilorderdet_order_no[ll_dw3row]
		ll_row      = dw_4.retrieve(ls_order) // dw_3 의 삭제하려는 order_no

		if ll_row < 1 then RETURN
		
		dw_4.setredraw(false)		
		for ll_row = 1 to dw_4.rowcount()		
			ls_coil = dw_4.object.coil_no[ll_row]
			ls_loc  = dw_4.object.loc_no[ll_row]
			ld_wid  = dw_4.object.wid[ll_row]
			
			SELECT open_close INTO :ls_proc FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_loc;
			if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
				SELECT count(*) INTO :ll_cnt FROM coilmst WHERE coil_no = :ls_coil AND loc_no <> :ls_loc;
				if ll_cnt > 0 then
					MessageBox("확인","스리팅코일[" + trim(ls_coil) +"]은 이동되었습니다. 코일이동관리에서 삭제후 작업하십시요")
					RETURN
				else
					MessageBox("확인","코일자료가 없습니다. 전산실로 연락바랍니다")
					RETURN
				end if
			end if
			
			choose case ls_proc
				case "M"
					MessageBox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 지금 생산계획중입니다.")
					RETURN
				case "P"
					MessageBox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 지금 작업지시중입니다.")
					RETURN
				case "C"
					MessageBox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 이미 사용이 완료되었습니다")
					RETURN
				case "S"
					MessageBox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 이미 외주로 이동되어있습니다")
					RETURN
			end choose
			if dw_4.object.proc_flag[ll_row] = "C" then
				MessageBox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 사용된 코일입니다~r~n" + &
										"성형 작업일보내역을 삭제후에 스리팅작업일보내역을 삭제하십시요")
				RETURN
			end if
		next
		
		dw_4.rowsmove(1, dw_4.rowcount(), Primary!, dw_4 , 1, Delete!)
		dw_4.setredraw(true)
				
		ldt_today   = datetime(today())		
		ls_old_time = string(now(),'hh:mm:ss:ff')
		
		ll_rowcount = dw_4.deletedcount()
		for ll_row = 1 to ll_rowcount			
			ls_old_time = string(now(),'hh:mm:ss:ff')
			ls_order    = trim(dw_4.GetItemString(ll_row,"order_no", Delete!, true))
			
			ls_coilorderdet_order[ll_row] = ls_order
			
			ls_w_coil_no       = trim(dw_4.GetItemString(ll_row,"w_coil_no", Delete!, true))
			ls_coilorder_order = dw_4.GetItemString(ll_row,"coilorder_order", Delete!, true)
			li_order_seq       =	dw_4.GetItemnumber(ll_row,"order_seq", Delete!, true)
			ld_w_wid           =	dw_4.GetItemnumber(ll_row,"w_wid", Delete!, true)
			ls_coil            =	trim(dw_4.GetItemString(ll_row,"coil_no", Delete!, true))
			li_seq             = dw_4.GetItemnumber(ll_row,"seq", Delete!, true)
			ls_item_no         = trim(dw_4.GetItemString(ll_row,"item_no", Delete!, true))
			ls_qa              = trim(dw_4.GetItemString(ll_row,"qa", Delete!, true))
			ld_wid             = dw_4.GetItemnumber(ll_row,"wid", Delete!, true)
			ld_unit_qty        = dw_4.GetItemnumber(ll_row,"unit_qty", Delete!, true)
			ls_sheet           = dw_4.GetItemString(ll_row,"sheet", Delete!, true)
			li_cnt             = dw_4.GetItemnumber(ll_row,"cnt", Delete!, true)
			li_wcnt            = dw_4.GetItemnumber(ll_row,"coilorderdet_cnt", Delete!, true)
			ls_loc             = dw_4.GetItemString(ll_row,"loc_no", Delete!, true)
			ls_wloc            = dw_4.GetItemString(ll_row,"wloc_no", Delete!, true)
			
			setnull(ls_oc) ; setnull(ls_witem_no) ; setnull(ls_wqa) ; Setnull(li_wunit_qty)
			SELECT item_no, qa, open_close, unit_qty
			  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty 
			  FROM coilmst
			 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox('오류1',"코일마스터[coilmst]SELECT시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
				RETURN
			end if

			if ls_oc = "C" then
				// 원코일 UPDATE
				UPDATE coilmst 
				   SET qcnt = qcnt + :li_wcnt, open_close = "P" // 작업지시중
				 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
				if sqlca.sqlcode <> 0 then
					rollback;
					MessageBox('오류2',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
					RETURN
				end if

				// [IW]작업장출고 삭제로직입니다.
				for ll_count = 1 to 100000
					IF ls_old_time <> string(now(), 'hh:mm:ss:ff') then
						ls_old_time = string(now(),'hh:mm:ss:ff')	
						exit
					end if
				next
				
				INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
					    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
				VALUES ( getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order,
					    0, :li_wunit_qty * :li_wcnt * -1, 0, :is_wc_no, :ls_w_coil_no, "현장스리팅삭제", :li_wunit_qty, :li_seq, :li_wunit_qty, :gs_userid);
				if sqlca.sqlcode < 0 then
					rollback;
					MessageBox('오류3',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
					RETURN
				end if		
			end if
		
			UPDATE coilorderdet 
			   SET proc_flag = "M", length = 0 // 작업지시중(스리팅작업일보작성)
			 WHERE coilorder_order = :ls_coilorder_order	and order_seq = :li_order_seq;
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox('오류4',"코일작업오더[coilorderdet]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				RETURN
			end if
				
			ls_flag = "O"// 작업지시중			
			UPDATE coilorder SET open_close = :ls_flag WHERE order_no = :ls_coilorder_order;				
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox('오류5',"코일작업오더[coilorder]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				RETURN
			end if

			//스리팅코일 or sheet 삭제
			if ls_sheet = 'C' or ls_sheet = 'L' then
				DELETE FROM coilmst WHERE coil_no = :ls_coil	AND loc_no = :ls_loc;
				if sqlca.sqldbcode <> 0 then
					rollback;
					MessageBox('오류6','[코일마스터] delete중 DB오류발생하였습니다.~r~n' + sqlca.sqlerrtext,exclamation!)
					RETURN 					
				end if
			else
				DELETE FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_loc;
				if sqlca.sqldbcode <> 0 then
					rollback;
					MessageBox('오류6-1','[sheet마스터] delete중 DB오류발생하였습니다.~r~n' + sqlca.sqlerrtext,exclamation!)
					RETURN 					
				end if
			end if

			INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
				    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id)  		
			VALUES (getdate(), :ld_sfc_date, :ls_item_no, :ls_qa, :ls_loc, 'RC', :ls_order,
				    :ld_unit_qty * :li_cnt * -1, 0, 0,	:is_wc_no, :ls_coil,"현장스리팅삭제", :ld_unit_qty, :li_seq, :ld_unit_qty * :li_cnt, :gs_userid);
			if sqlca.sqlcode < 0 then
				rollback;
				MessageBox('오류7',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
				RETURN
			end if		
		next // dw_4.deletecount()
		
		// 코일합체 삭제
		dw_5.reset()
		dw_5.retrieve(ls_coilorderdet_order)
		for ll_row = 1 to dw_5.rowcount()
			ls_wloc      = dw_5.object.loc_no[ll_row]
			ls_w_coil_no = dw_5.object.coil_no[ll_row]
			ld_w_wid     = dw_5.object.wid[ll_row]
			
			setnull(ls_oc) ; setnull(ls_witem_no) ; setnull(ls_wqa) ; setnull(li_wunit_qty)
			SELECT item_no, qa, open_close, unit_qty
			  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty 
			  FROM coilmst
			 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox('오류8',"코일마스터[coilmst]SELECT시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
				RETURN
			end if

			if ls_oc = "C" then
				//원코일 합체 udpate
				li_cnt   = dw_5.object.cnt[ll_row]
				ls_order = dw_5.object.order_no[ll_row]
				UPDATE coilmst 
				   SET qcnt = qcnt + :li_cnt , open_close = "P" // 작업지시중
				 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
				if sqlca.sqlcode <> 0 then
					rollback;
					MessageBox('오류9',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
					RETURN
				end if

				// [IW]작업장출고 로직입니다.
				for ll_count = 1 to 100000
					if ls_old_time <> string(now(), 'hh:mm:ss:ff') then
						ls_old_time = string(now(),'hh:mm:ss:ff')	
						exit
					end if	
				next		

				INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no, rcpt_qty, 
					    issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
				VALUES ( getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order, 0, 
					    :li_wunit_qty * :li_cnt * -1, 0, :is_wc_no, :ls_w_coil_no, "coilsum", :li_wunit_qty, :li_cnt, :li_wunit_qty, :gs_userid);
				if sqlca.sqlcode < 0 then
					rollback;
					MessageBox('오류10','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
					RETURN
				end if		
			end if
		next

		if dw_4.UPDATE() = 1 then
			COMMIT; // 적용
			MessageBox('확인', '스리팅 작업 일보에서 삭제 되었습니다.', information!)
			wf_f1()
		else
			rollback;
			MessageBox('오류', '스리팅 작업 일보에서 삭제 실패.', exclamation!)
		end if
	else
		RETURN		
	end if
end if

// 저장시점의 Row 로 이동
dw_3.SetFocus()
dw_3.ScrollToRow(ll_dw3row)
dw_3.SetColumn("length")

end subroutine

public function boolean wf_move ();//
datawindow dwsource, dwtarget
string ls_plan, ls_qa, ls_null
long   ll_dw1row, ll_row, ll_dwscnt, ll_cnt, ll_dw1cnt
int    li_seq, li_null

dwsource = dw_3
dwtarget = dw_4

dwtarget.accepttext()
dwsource.accepttext()
ll_dwscnt = dwsource.rowcount()

setnull(ls_null)
dwtarget.reset()
dwtarget.setredraw(false)

if ii_wid <> 0 then
	dwsource.SetSort("if (pri = 0 , 999, pri)")
	dwsource.Sort( )
end if

for ll_cnt = 1 to ll_dwscnt
	if dwsource.isselected(ll_cnt) then
			
		ls_plan = trim(dwsource.object.order_no[ll_cnt])
		li_seq  = dwsource.object.order_seq[ll_cnt]
		
		ll_dw1cnt = dw_1.retrieve(ls_plan, li_seq)		
		if ll_dw1cnt < 1 then
			messagebox("확인", "스리팅작업지시자료이상이 발생하였습니다 ~r~n" &
							+ "재조회하여 다시 작업하시거나 전산실로 연락바랍니다.")
			return false
			rollback;
		end if
		
		for ll_dw1row = 1 to ll_dw1cnt			
			ll_row = dwtarget.insertrow(0)
			
			dwtarget.object.coilorderdet_div[ll_row] = dw_1.object.coilorderdet_div[ll_dw1row]
			dwtarget.object.coilmst_qa[ll_row]       = dw_1.object.coilmst_qa[ll_dw1row]
			dwtarget.object.wunit[ll_row]            = dw_1.object.wunit[ll_dw1row]
			dwtarget.object.coilmst_length[ll_row]   = dw_1.object.coilmst_length[ll_dw1row]
			dwtarget.object.witem_name[ll_row]       = dw_1.object.witem_name[ll_dw1row]
			
			dwtarget.object.order_no[ll_row]         = dw_1.object.order_no[ll_dw1row]
			dwtarget.object.seq[ll_row]              = dw_1.object.seq[ll_dw1row]   
			dwtarget.object.coilorder_order[ll_row]  = dw_1.object.coilorder_order[ll_dw1row]
			dwtarget.object.order_seq[ll_row]        = dw_1.object.order_seq[ll_dw1row]   

			dwtarget.object.sfc_date[ll_row]         = datetime(dw_r.object.date[1])
			dwtarget.object.wc_no[ll_row]            = is_wc_no
			dwtarget.object.wc_place[ll_row]         = 'I'
			dwtarget.object.supp_no[ll_row]          = ls_null
			
			dwtarget.object.w_coil_no[ll_row]        = dw_1.object.coil_no[ll_dw1row]   
			dwtarget.object.wloc_no[ll_row]          = dw_1.object.loc_no[ll_dw1row]  
			dwtarget.object.w_wid[ll_row]            = dw_1.object.wid[ll_dw1row]  
			
			ls_qa = dw_1.object.qa[ll_dw1row]
			if dw_1.object.sheet[ll_dw1row] = 'S' then
				dwtarget.object.coil_no[ll_row] = 'SHEET'
				dwtarget.object.wid[ll_row]     = dec(MidA(ls_qa,5,4))
			else
				dwtarget.object.coil_no[ll_row] = ls_null 
				dwtarget.object.wid[ll_row]     = dec(MidA(ls_qa,5,4) + "." + MidA(ls_qa, 10,1))
			end if
			
			//로트번호
			dwtarget.object.coil_no[ll_row]   = wf_coil(ll_dw1row, ll_row) 			
			dwtarget.object.item_no[ll_row]   = dw_1.object.item_no[ll_dw1row]   
			dwtarget.object.qa[ll_row]        = ls_qa  
			dwtarget.object.unit_qty[ll_row]  = dw_1.object.unit_qty[ll_dw1row]   
			dwtarget.object.cnt[ll_row]       = dw_1.object.cnt[ll_dw1row]
			dwtarget.object.length[ll_row]    = dw_1.object.length[ll_dw1row]
			dwtarget.object.rem[ll_row]       = dw_1.object.rem[ll_dw1row]
			dwtarget.object.proc_flag[ll_row] = 'O'
			dwtarget.object.sheet[ll_row]     = dw_1.object.sheet[ll_dw1row]
			dwtarget.object.work_type[ll_row] = dw_1.object.work_type[ll_dw1row]
			dwtarget.object.coilorderdet_cnt[ll_row]    = dw_1.object.coilorderdet_cnt[ll_dw1row]
			
			dwtarget.object.groupitem_item_name[ll_row] = dw_1.object.groupitem_item_name[ll_dw1row]
			dwtarget.object.loc_no[ll_row]    = is_loc
			
			//----------
			dwtarget.object.qc_chk1[ll_row]   = dw_2.object.qc_chk1[ll_dw1row]
			dwtarget.object.qc_chk2[ll_row]   = dw_2.object.qc_chk2[ll_dw1row]
			dwtarget.object.qc_chk3[ll_row]   = dw_2.object.qc_chk3[ll_dw1row]
			//----------			
		next
	end if
next

dwsource.SetSort(" order_no, order_seq ")
dwsource.Sort( )
dwtarget.setredraw(true)
//messagebox('확인','작업일보를 작성하였습니다.',information!)
dwsource.selectrow(0,false)


// dwsource 초기화 selected 초기화
setnull(li_null)
ii_wid = 0 
for ll_cnt = 1 to ll_dwscnt
	dwsource.object.pri[ll_cnt] = li_null
next
return true

end function

public function string wf_coil (long arg_dw1row, long arg_dw2row);// 2001/05/31변경
	//===================================================
	// 로트 번호 부여 규칙.
	//소재   형태
	//A :알미늄 C :원코일
	//S :스틸   H :sheet
	//			   S :외주스리팅
	//Y S : 유창작업장내 스리팅 -- 사내 작업일보시만 적용.
	// 예)SC010531001 :스틸 원코일2001년 5월 31일자 001번째 로트번호
	//===================================================
	// 현 코드규칙
	// mid(item_no, 1,1) = 'M' : 자재
	// 	mid(item_no, 2,1) = '1' : 원코일
	// 	mid(item_no, 2,1) = '3' : 스리팅
	// 		mid(item_no, 3,1) = 'A' : 알미늄
	// 		mid(item_no, 3,1) = 'S' : 스틸
	// 			mid(item_no, 4,1) = '1' : COIL
	// 			mid(item_no, 4,1) = '2' : SHEET
	//===================================================
	// loss 코드규칙(2001/07/16)
	// 		첫번째 = 'A' : 알미늄
	// 		첫번째 = 'S' : 스틸
	//    		두번째 = 'L' : loss
	// 	
	// 예)AL01071701, SL01071701
	//===================================================

long ll_row, ll_losscnt
int li_col
string ls_coil, ls_date, ls_item, ls_code1

dw_4.accepttext()
ls_item =  trim(dw_1.object.item_no[arg_dw1row])

select count(item_no) into :ll_losscnt from lossitem where loss_item = :ls_item;

if ll_losscnt > 0 then
	CHOOSE CASE MidA(ls_item ,3,1)
		CASE 'A' // 알미늄
			ls_code1 = 'A'
		CASE 'S' // 스틸
			ls_code1 = 'S'
   END CHOOSE
	ls_date = ls_code1 + 'L' + MidA(string(dw_r.object.date[1], 'yyyymmdd'), 3) + "%"
	li_col = 11
else
	ls_date = "YS" + MidA(string(dw_r.object.date[1], 'yyyymmdd'), 3) + "%"
	li_col = 12
end if

setnull(ls_coil)
if dw_1.object.sheet[arg_dw1row] = 'S' then
	select max(sheet_no) into :ls_coil from sheetmst
	 where sheet_no like :ls_date
		and (substring(sheet_no, :li_col,1) is null or substring(sheet_no, :li_col,1) = '');

else
	select max(coil_no) into :ls_coil from coilmst
	 where flag = "S"
		and coil_no like :ls_date
		and loc_no = :is_loc
		and ( substring(coil_no, :li_col ,1) is null or substring(coil_no, :li_col ,1) = '');
end if

if isnull(ls_coil) or trim(ls_coil) = '' then
	if ll_losscnt > 0 then
		ls_coil = LeftA(ls_date, 8) + "00"
	else
		ls_coil = LeftA(ls_date, 8) + "000"
	end if
else
end if

for ll_row = 1 to dw_4.rowcount()
	if not isnull(dw_4.object.coil_no[ll_row]) then
		if LeftA(ls_coil, 2) = LeftA(dw_4.object.coil_no[ll_row], 2) &
			and ls_coil < LeftA( dw_4.object.coil_no[ll_row], li_col -1 ) then
			ls_coil = dw_4.object.coil_no[ll_row] 
		end if
	end if
next

if ll_losscnt > 0 then
	ls_coil = LeftA(ls_coil, 8) + string(integer(MidA(ls_coil,9,2)) + 1 ,'00')
else
	ls_coil = LeftA(ls_coil, 8) + string(integer(MidA(ls_coil,9,3)) + 1 ,'000')
end if

return ls_coil

end function

public subroutine wf_f5 ();//
gs_where lst_code

lst_code.str1 = is_loc
lst_code.chk  = "W" // S: 스리팅코일 W;원코일
openwithparm(w_coilinput03_s, lst_code)

end subroutine

public subroutine wf_multiprint (string as_order_no);// 스리팅 작업후에 코일에 직접 붙이는 라벨


//w_repsuper w_print
//st_print l_print
//
//dw_3.dataobject = 'd_ioinsliting_r'
//dw_3.settransobject(sqlca)
//dw_3.retrieve(as_insp_no)
//
//l_print.st_datawindow = dw_3
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 입고명세서를 출력합니다."
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)
//
//
//
//// 멀티 프린트.
////Windows Registry Editor Version 5.00
////[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows]
////"Device"="\\\\내컴\\HP LaserJet 4V,winspool,Ne04:"
////프린터가 여러대라고 하니, 아마도 랜으로 공유한것 같네요.
////위와 같은 레지스트리를 수정하시고 프린터 하시면 되겠네요.
////디바이스 명을 수정하시면 기본 프린터가 변경 될것입니다.
////[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Devices] 에 
////프린터 이름이 나옵니다.
////여기에 올라 와 있는 프린터 이름중에서 기본 프린터로 정하고자 하는 것을 
////디바이스에 적어 주시면 될 것입니다.
// 
////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
////Microsoft Fax,WPSUNI,FAX
//
//
////LONG msgHWND_BROADCAST = 65535 // HEX FFFF
////LONG msgWM_WININICHANGE = 26   // HEX 1A
////
//////// 첫번째프린터에는 FAX(시화로 출력)
//////WriteProfileStringA("windows", "device", &
//////				"Microsoft Fax,WPSUNI,FAX");
//////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////dw_3.print()
////// 첫번째프린터에는 HP5000(시화로 출력)
////WriteProfileStringA("windows", "device", &
////				"HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\192.168.1.11");
////WriteProfileStringA("","",""); // flushes cached WIN.INI
////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////dw_3.print()
//
////// 두번째프린터에는 4MV(목동(판매부)으로 출력)
////WriteProfileStringA("windows", "device", &
////				"HP LaserJet 4MV,HPPCL5MS,\\HP_Network_Printers\122.1.1.203");
////WriteProfileStringA("","",""); // flushes cached WIN.INI
////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////dw_3.print()
//
////시화에서 목동프린터(HP NET PRINTER : 4MV) 로 프린팅과
//// 시화 HP NET PRINTER(HP5000) 로 의 동시 프린팅 테스트
//////			dw_3.print()
//// SYSEDIT.EXE "WIN.INI"의 프린터 구성정보의 마직막에 있음
////원래는 HP LaserJet 4MV=HPPCL5MS,4mv_122.1.1.192
////       HP LaserJet 5000 PCL 6=HPBXLB,\\HP_Network_Printers\203.240.212.201
//// 로 "="을 "," 로만 바꾸면 됨
////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
////Microsoft Fax,WPSUNI,FAX
//
//dw_3.dataobject = 'd_ioinsliting_r'
//dw_3.settransobject(sqlca)
//dw_3.retrieve(as_insp_no)
//
////
////string ls_dw7sql, ls_sql,ls_where
////
////		ls_dw7sql = dw_3.describe("datawindow.table.select")
////		ls_where = " and sale.order_no between ~~'hd20040317-001~~'" &
////					+ " and ~~'hd20040317-003~~'"  
////		ls_sql = "datawindow.table.select = '" + ls_dw7sql + ls_where + "'"
////			
////		dw_3.modify(ls_sql)
////
//LONG msgHWND_BROADCAST = 65535 // HEX FFFF
//LONG msgWM_WININICHANGE = 26   // HEX 1A
//WriteProfileStringA("windows", "device", &
//				"\\\\박상준\\hp officejet 6100 series,winspool,Ne00");
//dw_3.print()
//////WriteProfileStringA("","",""); // flushes cached WIN.INI
////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////dw_3.Modify('DataWindow.Print.Orientation = 1')
////\\192.168.3.30\tsc-243 xp,winspool,Ne09:
////\\박상준\hp officejet 6100 series,winspool,Ne00:
////"HP officejet 6100 series,HPBXLB,\\
//WriteProfileStringA("windows", "device", &
//				"HP LaserJet 5100 PCL 5e,winspool,Ne05:");
//dw_3.print()

end subroutine

public subroutine wf_f6 (string asa_coilorderdet_order[]);// ais_coilorderdet_order[] 의 내용을 select 함.
long    ll_arraycnt, ll_i, ll_sfccnt, ll_j, ll_daycnt, li_cnt2
string  ls_order_no, ls_temp
dec {1} ld_wid, ld_oldwid

ll_arraycnt = upperbound(asa_coilorderdet_order, 1)
if ll_arraycnt < 1 then
	asa_coilorderdet_order[1] = dw_3.object.coilorderdet_order_no[dw_3.getrow()]
	ll_arraycnt = 1
end if

ls_temp = '' //  같은 생산계획번호가 아닐때 
for ll_i = 1 to ll_arraycnt // 배열에 저장된 갯수 
	if ls_temp = asa_coilorderdet_order[ll_i] then
	else
		ls_order_no = asa_coilorderdet_order[ll_i] 
		select count(*) into :ll_sfccnt 
		  from coilsfcday 
		 where order_no = :ls_order_no and sheet <> 'L';
		 
		ld_oldwid = 0
		for ll_j = 1 to ll_sfccnt // loss item 제외 //각 Header 에 Detail 4-1
			select cnt, wid into :ll_daycnt, :ld_wid 
			  from coilsfcday 
			 where order_no = :ls_order_no and seq = :ll_j ;
			if ld_wid <> ld_oldwid then
				if ld_wid < 50.0 then
					dw_8.dataobject = 'd_sfclabel03_2'
				else
					dw_8.dataobject = 'd_sfclabel03_1'
				end if
				dw_8.settransobject(sqlca)
			end if
			
			li_cnt2 = dw_8.retrieve( ls_order_no, ll_j )
			if li_cnt2 < 1 then continue
			
			dw_8.Object.DataWindow.Print.Copies = ll_daycnt
			dw_8.print()
			ld_oldwid = ld_wid
		next
	end if
	ls_temp = asa_coilorderdet_order[ll_i]
next
//dw_8.Reset()
//dw_8.Object.DataWindow.Print.Copies = 1
//dw_8.InsertRow(0)
//dw_8.Print()

end subroutine

on w_coilslit_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_2=create dw_2
this.dw_3=create dw_3
this.dw_6=create dw_6
this.dw_7=create dw_7
this.dw_8=create dw_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_5
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_6
this.Control[iCurrent+6]=this.dw_7
this.Control[iCurrent+7]=this.dw_8
end on

on w_coilslit_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.dw_8)
end on

event open;//////////////////////////
// 화면확대 취소
//////////////////////////
ib_exec = false		
//////////////////////////

// width = 3707
// height = 2376
//SetCursorPos(1024,350)
//SystemParametersInfo( 97, True, B, 0)

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA) // 라벨

dw_4.visible = false
dw_5.visible = false
dw_8.visible = false

//is_loc = 'WS00000000' // 10월12일 코일저장소 분리 WW01 : 성형원재료 저장소
is_loc     = 'WW01'
is_wc_no   = 'S01'
gs_userid  = 'bell'

This.TriggerEvent('ue_clear')
wf_f1()

SetForegroundWindow (handle(this))
//SetWindowPos(handle(this), -2, &
//				UnitsToPixels(this.x, 		XunitsToPixels!), &
//				UnitsToPixels(this.y, 		YunitsToPixels!), &
//				UnitsToPixels(this.width, 	XunitsToPixels!), &
//				UnitsToPixels(this.height, YunitsToPixels!), &
//				64)	


// 당일 저장 확인 (해당 일로 조회)
integer li_week, li_cntday, li_cntweek
string  ls_sdate
date    ldt_getdate
ldt_getdate = date(dw_r.object.date[1])

SELECT count(eos) INTO :li_cntday
  FROM qccoilchk   
 WHERE area_no = :gs_area  AND sfc_Date = :ldt_getdate; //gd_date
 
li_week  = daynumber(ldt_getdate)     //gd_date
ls_sdate = string(RelativeDate(ldt_getdate, 2 - li_week), "yyyy/mm/dd") //gd_date

string ls_month, ls_year, ls_sdate2
ls_month = string(month(ldt_getdate)) //gd_date
ls_year  = string(year(ldt_getdate))  //gd_date

ls_sdate2 = ls_year + "/" +  RightA("00" + ls_month, 2) + "/01"

if ls_sdate < ls_sdate2 then ls_sdate = ls_sdate2


// 주간별 확인(월요일부터 현재일 까지)
SELECT count(br) INTO :li_cntweek
  FROM qccoilchk   
 WHERE area_no = :gs_area AND sfc_Date BETWEEN :ls_sdate AND :ldt_getdate; //gd_date
 
// 당일 자료 없고, 주간점검 사항 없을시 open
if li_cntday < 1 or li_cntweek < 1 then 
	OpenWithParm(w_qccoilchk, li_cntweek)
end if
				

end event

event ue_clear;call super::ue_clear;dw_r.Reset()
dw_3.Reset()
dw_2.Reset()
dw_6.Reset()
dw_7.Reset()
dw_r.InsertRow(0)

//gd_date = date('2004/03/17')
dw_r.object.date[1] = gd_date 

end event

event ue_retrieve;call super::ue_retrieve;long  i

dw_3.setredraw(false)
dw_2.setredraw(false)
dw_6.setredraw(false)
dw_7.setredraw(false)

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()
dw_6.reset()
dw_7.reset()
if dw_3.Retrieve(date(dw_r.object.date[dw_r.getrow()])) > 0 then
	dw_3.setcolumn('length')
	dw_3.setfocus()
end if
/*2019.05.15 jowonsuk 이론길이 계산 반영 실길이 등록 안되어 있으면 이론길이 반영 */

/*단중/비중/두께/폭*1000*/
/*
 select a.coil_no,
              a.wid,
              a.unit_qty,
              a.thin,
              a.bi_qty,
              round(convert(decimal,  a.unit_qty /  a.bi_qty / a.thin / a.wid * 1000 ),0) c_length /*단중/비중/두께/폭*1000*/
from
(
            SELECT coilmst.coil_no,   /*코일번호*/
                  coilmst.loc_no,
                   coilmst.item_no,
                   coilmst.qa,
                   coilmst.qcnt,
                   coilmst.wid,               /*폭*/ 
                   coilmst.unit_qty,        /*단중*/  
                   thin = convert (decimal (3,2) , substring(qa,1,1) + '.' + substring(qa, 2,2)),   /*두께*/   
                  (CASE WHEN groupitem.COIL_GRP = 'A10' THEN 2.72  /*AL*/
                                   WHEN groupitem.COIL_GRP = 'A11' THEN 2.72 /*AL*/
                                   WHEN groupitem.COIL_GRP = 'A50' THEN 8.12 /*GI*/
                                   WHEN groupitem.COIL_GRP = 'A51' THEN 8.12 /*GI*/
                                   WHEN groupitem.COIL_GRP = 'A60' THEN 1 /*GL*/
                                   WHEN groupitem.COIL_GRP = 'A61' THEN 1 /*GL*/
                      END ) bi_qty
              FROM coilmst INNER JOIN groupitem WITH(NOLOCK) ON coilmst.item_no = groupitem.item_no 
) a

*/
//for i = 1 to dw_3.rowcount()
//	if dw_3.object.length[i] = 0 or isnull(dw_3.object.length[i]) then
//		dw_3.object.length[i] =  dw_3.object.coilmst_length[i]
//	end if
//next

dw_3.setredraw(true)
dw_2.setredraw(true)
dw_6.setredraw(true)
dw_7.setredraw(true)
end event

event closequery;call super::closequery;// return 1
 
end event

event resize;call super::resize;//////////////////////////
// 화면확대 취소
//////////////////////////
ib_exec = false		
//////////////////////////

dw_r.width  = newwidth  - 36

dw_3.width  = newwidth  - 36
dw_3.height = newheight - 1604

dw_2.y      = newheight - 1164
dw_2.width  = newwidth  - 36

dw_7.y      = newheight - 596
dw_7.width  = newwidth  - 36

dw_6.y      = newheight - 476
dw_6.width  = newwidth  - 36

dw_r.Object.DataWindow.Zoom = gl_resolution
dw_3.Object.DataWindow.Zoom = gl_resolution
dw_2.Object.DataWindow.Zoom = gl_resolution
//dw_7.Object.DataWindow.Zoom = gl_resolution
dw_6.Object.DataWindow.Zoom = gl_resolution

end event

event ue_close;call super::ue_close;//
close( this )

end event

type dw_1 from w_ancestor`dw_1 within w_coilslit_m
boolean visible = false
integer x = 37
integer y = 660
integer width = 3671
integer height = 964
integer taborder = 0
boolean titlebar = true
string title = "d_mpslitingsfc_h"
string dataobject = "d_mpslitingsfc_h"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
end type

event dw_1::dberror;//
end event

type dw_r from w_ancestor`dw_r within w_coilslit_m
integer x = 14
integer y = 16
integer width = 3758
integer height = 392
integer taborder = 0
string title = "d_line_r"
string dataobject = "d_line03_r"
end type

event dw_r::ue_key;call super::ue_key;//
choose case key
	case KeyF1!		// F1:최신정보
		wf_f1()		

	case KeyF4!		// F4:입력선택
		dw_2.taborder = 0
		dw_3.taborder = 10
		dw_3.SetFocus()

	case KeyF5!		// F5:코일재고현황
		wf_f5()

	case KeyF6!		// F6:재출력
		open(w_barcode_print_r)
		
	case KeyF8!		// F8:저장
		dw_3.setredraw(false)
		wf_f8()
		dw_3.setredraw(true)

	case KeyF9!		// F9:종료
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( Parent )
end choose

end event

event dw_r::rbuttondown;call super::rbuttondown;//
choose case dwo.name
	case 'date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.date[1] = datetime(date(message.stringparm))
		end if
end choose

this.accepttext()
wf_f1()

end event

event dw_r::buttonclicked;call super::buttonclicked;//
choose case dwo.name
	case "b_f01"	// F1: 최신정보
		wf_f1()
		
	case "b_f04"	// F4: 입력선택
		if dw_3.taborder <> 0 then
			dw_2.taborder = 20
			dw_2.SetFocus()
		else
			dw_3.taborder = 10
			dw_3.SetFocus()
		end if
		
	case "b_f05"	// F5: 코일재고현황
		wf_f5()

	case "b_f06"	// F6: 재출력
		open(w_barcode_print_r)

	case "b_f08"	// F8: 저장
		dw_3.setredraw(false)		
		wf_f8()
		dw_3.setredraw(true)
		
	case "b_f09"	// F9: 종료
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( parent )
end choose

end event

type dw_4 from datawindow within w_coilslit_m
integer x = 370
integer y = 772
integer width = 3008
integer height = 964
boolean bringtotop = true
boolean titlebar = true
string title = "d_mpslitingsfc_m"
string dataobject = "d_mpslitingsfc_m"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_coilslit_m
integer x = 567
integer y = 1388
integer width = 2560
integer height = 508
boolean bringtotop = true
boolean titlebar = true
string title = "d_mpslitcon_h"
string dataobject = "d_mpslitcon_h"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_coilslit_m
event ue_key pbm_dwnkey
integer x = 18
integer y = 1380
integer width = 3758
integer height = 556
integer taborder = 20
string title = "d_sliting_d"
string dataobject = "d_sliting_d"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;//
this.accepttext()

choose case key
	case KeyF1!		// 최신정보
		wf_f1()

	case KeyF4!		// 입력선택
		dw_2.taborder = 0
		dw_3.taborder = 10
		dw_3.SetFocus()

	case KeyF5!		// 코일재고 현황
		wf_f5()

	case KeyF8!		// 저장
		dw_3.setredraw(false)
		wf_f8()
		dw_3.setredraw(true)
		
	case KeyF9!		// 종료
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( Parent )

	case KeyF12!	// 한줄삭제
		dw_3.setredraw(false)
		wf_f12()
		dw_3.setredraw(true)
		
	case KeyLeftArrow!
		//keybd_event(16,0,0,0) // SHIFT가 눌렸다.
		//keybd_event(9,0,0,0)  // TAB이 눌렸다.
		//keybd_event(16,0,2,0) // SHIFT가 띄어졌다. (생략 불가능)
		//keybd_event(9,0,2,0)  // TAB이 띄어졌다. (생략가능)

	case KeyRightArrow!
		//keybd_event(9,0,0,0)  // TAB이 눌렸다.
		//keybd_event(9,0,2,0)  // TAB이 띄어졌다. (생략가능)
end choose

end event

event losefocus;//
this.Object.DataWindow.Color = 78682240

end event

event getfocus;//
dw_3.taborder = 0
this.Object.DataWindow.Color = rgb(255,0,255)

end event

event itemerror;choose case dwo.name
	case 'qc_chk1'
		This.SetItem(row, 'qc_chk1', 0)
	case 'qc_chk2'
		This.SetItem(row, 'qc_chk2', 0)
	case 'qc_chk3'
		This.SetItem(row, 'qc_chk3', 0)
end choose

return 1

end event

type dw_3 from datawindow within w_coilslit_m
event ue_key pbm_dwnkey
integer x = 14
integer y = 424
integer width = 3758
integer height = 940
integer taborder = 10
string title = "d_sliting_h"
string dataobject = "d_sliting_h"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;//
this.accepttext()

choose case key
	case KeyF1!		// F1: 최신정보
		wf_f1()

	case KeyF4!		// F4: 입력선택
//		wf_f4() -> Row선택
		dw_3.taborder = 0
		dw_2.taborder = 20
      dw_2.SetFocus()
		
	case KeyF5!		// F5: 코일재고 현황
		wf_f5()

	case KeyF6!		// F6: 재출력
		open(w_barcode_print_r)

	case KeyF8!		// F8: 저장
		dw_3.setredraw(false)
		wf_f8()
		dw_3.setredraw(true)
		
	case KeyF9!		// F9: 종료
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( Parent )

	case KeyF12!	// F12: 한줄삭제
		dw_3.setredraw(false)		
		wf_f12()
		dw_3.setredraw(true)

	case KeyEnter!
		if this.object.save_chk[this.Getrow()] = 'C' then return 1
		dw_2.setfocus()
		return 1
end choose

end event

event itemerror;//
choose case dwo.name
	case 'length'
		This.SetItem(row, 'length', 0)
end choose

return 1

end event

event rowfocuschanged;//
if this.getrow() < 1 then return

dw_2.retrieve( this.object.order_no[currentrow], this.object.order_seq[currentrow] )
dw_6.retrieve( this.object.coilorderdet_order_no[currentrow] )
dw_7.retrieve( this.object.coilorderdet_order_no[currentrow] )

end event

event dberror;//
int    li_rtn = 1
long   ll_error_cd
string ls_error_text, ls_row_text

if SQLCA.SqlCode = 0 and sqldbcode = 0 then
	RETURN 0
elseif SQLCA.SqlCode = 100 then
	ll_error_cd = SQLCA.SqlCode
else
	ll_error_cd = sqldbcode
end if

If row > 0 Then
	ls_row_text = string(row) + '행에 '
End If

choose case ll_error_cd
	case -3
		ls_error_text = '처리중 시스템 오류가 발생했습니다.(ERROR CODE:' + String(ll_error_cd) + ')' + '~r~n' + &
							 '현재 수정한 자료가 수정중 다른사람에 의해 시스템에서 삭제되었거나 ~r~n'+ &
							 '현재 조회된 자료와 시스템에 저장되어 있는 자료가 서로 다를수 있으니 ~r~n' + &
							 '새로 조회를 하여 자료를 확인하십시요.' + '~r~n' + &
							 '의문사항은 담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
		
	case 0
		ls_error_text = ''
		li_rtn = -1
		
	case 1, -193, 2627, 1400
		ls_error_text = ls_row_text + '중복되는 자료를 입력하셨습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 100
		ls_error_text = '해당하는 자료가 존재하지 않습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 903
		ls_error_text = 'SQL문에서 TABLE의 이름이 잘못 기술되었습니다. ~r~n' + &
							 'TABLE의 이름을 확인하여 주시기 바랍니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 904
		ls_error_text = 'TABLE에 있는 COLUMN의 이름이 존재하지 않거나 ~r~n' + &
							 'HOST 변수의 사용방법이 틀렸습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 942
		ls_error_text = 'TABLE(VIEW)가 존재하지 않습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
		
	case 1017
		ls_error_text = '사용자명 또는 암호가 부적절하여 시스템에 연결되지 않았습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
		
	case 1407, -195, 515, 233
		ls_error_text = ls_row_text + '필수입력항목(NOT NULL)이 입력되지 않았습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 1401, 1438
		ls_error_text = 'Column에 저장할수 있는 값보다 더큰 값이 입력되었습니다 .(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 1476
		ls_error_text = '숫자를 0으로 나누어서 이상이 발생하였습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 2112
		ls_error_text = '예상되는 자료값이 1건이여야 하나 ~r~n' + &
							 '여러건이 발생하여 ERROR가 발생하였습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 2291
		ls_error_text = 'PARENT DATA가 없어서 CHILD DATA를 입력(변경)할 수 없습니다. ~r~n' + &
							 '자료의 구조를 확인하여 주십시오.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 2292
		ls_error_text = 'CHILD DATA가 있어서 PARENT DATA를 삭제할 수 없습니다. ~r~n' + &
							 '자료의 구조를 확인하여 주십시오.(' + String(ll_error_cd) + ')'
		li_rtn = -1
		
	case 6564
		ls_error_text = '작업할 서버용 함수를 찾을수 없습니다.' + '~r~n' + &
							 '담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
		
	case 12154
		ls_error_text = '서버(TNS)를 찾을 수 없습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
		
	case 20003
		ls_error_text = 'STORED PROCEDURE나 서버의 함수가 정의되지 않았습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
		
	case ELSE
		ls_error_text = '처리중 시스템 오류가 발생했습니다.(ERROR CODE:' + String(ll_error_cd) + ')' + '~r~n' + &
							 '담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
end choose

If li_rtn < 0 Then MessageBox("알림", ls_error_text, StopSign!)

RETURN li_rtn

end event

event losefocus;//
this.Object.DataWindow.Color = 78682240

end event

event getfocus;//
dw_2.taborder = 0
this.Object.DataWindow.Color = rgb(255,0,255)

end event

type dw_6 from datawindow within w_coilslit_m
integer x = 18
integer y = 2068
integer width = 3758
integer height = 448
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpslitingone_rem_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_7 from datawindow within w_coilslit_m
integer x = 18
integer y = 1948
integer width = 3758
integer height = 108
boolean bringtotop = true
string title = "none"
string dataobject = "d_worktype_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_8 from datawindow within w_coilslit_m
string tag = "d_sfclabel03_1"
integer x = 933
integer y = 656
integer width = 1975
integer height = 652
integer taborder = 30
boolean bringtotop = true
string title = "d_sfclabel03_2"
string dataobject = "d_sfclabel03_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

