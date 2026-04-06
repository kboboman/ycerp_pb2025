$PBExportHeader$w_mpslitsfc_m.srw
$PBExportComments$스리팅 작업일보 등록(2000/08/03,이인호)
forward
global type w_mpslitsfc_m from w_inheritance
end type
type st_3 from statictext within w_mpslitsfc_m
end type
type tab_1 from tab within w_mpslitsfc_m
end type
type tabpage_1 from userobject within tab_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_1 st_1
dw_3 dw_3
cb_1 cb_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_2
end type
type cb_7 from commandbutton within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_2 cb_2
cb_7 cb_7
st_2 st_2
dw_4 dw_4
end type
type tab_1 from tab within w_mpslitsfc_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_5 from datawindow within w_mpslitsfc_m
end type
end forward

global type w_mpslitsfc_m from w_inheritance
integer width = 3717
integer height = 2176
string title = "스리팅 작업일보등록(w_mpslitsfc_m)"
st_3 st_3
tab_1 tab_1
dw_5 dw_5
end type
global w_mpslitsfc_m w_mpslitsfc_m

type variables
string is_select1,is_where1,is_clause1, is_select2
datawindowchild idwc_coil,  idwc_loc, idwc_wc
int ii_sw = 0, ii_sw2= 0, ii_wid = 0
long il_row
ws_process ist_code
end variables

forward prototypes
public function string wf_coil (long arg_dw1row, long arg_dw2row)
end prototypes

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
string ls_coil, ls_date, ls_loc, ls_item, ls_code1

dw_2.accepttext()
tab_1.tabpage_2.dw_4.accepttext()
ls_loc = dw_2.object.loc_no[1]
ls_item =  trim(dw_1.object.item_no[arg_dw1row])

select count(item_no) into :ll_losscnt from lossitem
where loss_item = :ls_item;

if ll_losscnt > 0 then
	CHOOSE CASE MidA(ls_item ,3,1)
		CASE 'A' // 알미늄
			ls_code1 = 'A'
		CASE 'S' // 스틸
			ls_code1 = 'S'
   END CHOOSE
	ls_date = ls_code1 + 'L' + MidA(string(dw_2.object.work_date[1], 'yyyymmdd'), 3) + "%"
	li_col = 11
else
	ls_date = "YS" + MidA(string(dw_2.object.work_date[1], 'yyyymmdd'), 3) + "%"
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
		and loc_no = :ls_loc
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
for ll_row = 1 to tab_1.tabpage_2.dw_4.rowcount()
	if not isnull(tab_1.tabpage_2.dw_4.object.coil_no[ll_row]) then
		if LeftA(ls_coil, 2) = LeftA(tab_1.tabpage_2.dw_4.object.coil_no[ll_row], 2) &
			and ls_coil < LeftA( tab_1.tabpage_2.dw_4.object.coil_no[ll_row], li_col -1 ) then
			ls_coil = tab_1.tabpage_2.dw_4.object.coil_no[ll_row] 
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

on w_mpslitsfc_m.create
int iCurrent
call super::create
this.st_3=create st_3
this.tab_1=create tab_1
this.dw_5=create dw_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_5
end on

on w_mpslitsfc_m.destroy
call super::destroy
destroy(this.st_3)
destroy(this.tab_1)
destroy(this.dw_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.insertrow(0)
dw_2.object.work_date[1] = wf_today()
dw_2.object.wc_no[1] = 'S01'
dw_2.object.loc_no[1] = 'WW01'

dw_2.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)

tab_1.tabpage_1.dw_3.settransobject(sqlca)
tab_1.tabpage_2.dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_5.visible = false
dw_1.visible = false
//2006.11.09 조용진부장(19910707)추가
if gf_permission('스리팅작업일보등록', gs_userid) = 'Y' then	
else
	pb_delete.enabled = false
	pb_save.enabled = false
	tab_1.tabpage_1.cb_1.enabled = false
end if


//if gs_userid = '1999010s' or gs_userid = 'root' or gs_userid = 'dbjung' &
//	or gs_userid = 'etwas' or gs_userid = 'kunta' or gs_userid = '19910707' or gs_userid = 'yuk7884' &
//   or gs_userid = 'shinjy' or gs_userid = 'sjh4279' or gs_userid = 'leejh' or gs_userid = 'kimsh' then
//else
//	pb_delete.enabled = false
//	pb_save.enabled = false
//	tab_1.tabpage_1.cb_1.enabled = false
////	pb_6.enabled = false
//end if

end event

event resize;call super::resize;//
tab_1.width  = this.width  - 128
tab_1.height = this.height - 524

tab_1.tabpage_1.dw_3.width  = this.width  - 206
tab_1.tabpage_1.dw_3.height = this.height - 784

tab_1.tabpage_2.dw_4.width  = this.width  - 206
tab_1.tabpage_2.dw_4.height = this.height - 784

end event

type pb_save from w_inheritance`pb_save within w_mpslitsfc_m
integer x = 3214
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_order, ls_coilorder_order, ls_wc_no, ls_wc_place, ls_supp_no, ls_w_coil_no
string ls_coil, ls_item_no, ls_qa, ls_proc_flag, ls_loc, ls_old_time, ls_chk, ls_flag
string ls_witem_no, ls_wqa, ls_oc, ls_sheet, ls_chk2, ls_wloc, ls_etc
string ls_coilorderdet_order[]
dec{1} ld_w_wid, ld_wid
dec{2} ld_length
dec{3} ld_unit_qty
long   ll_rowcount, ll_row, ll_count, ll_chkcount
int    li_seq, li_order_seq, li_cnt, li_coilorderdetcnt, li_wunit_qty, li_wcnt
datetime ld_sfc_date, ldt_today
datawindow dw4
dwItemStatus l_status

//
dw4 = tab_1.tabpage_2.dw_4
dw_2.accepttext()
dw4.accepttext()

ls_wc_no    = dw_2.object.wc_no[1]
ld_sfc_date = datetime(dw_2.object.work_date[1])
ldt_today   = datetime(today())

ls_chk      = "N"
ls_chk2     = "N"
ls_old_time = string(now(),'hh:mm:ss:fff')

ll_rowcount = dw4.deletedcount()
for ll_row = 1 to ll_rowcount
	l_status = dw4.GetItemStatus(ll_row, 0, Delete!)
	if l_status = new! or l_status = newmodified! then
		continue
	end if
	ls_chk = "Y"
	
	ls_old_time = string(now(),'hh:mm:ss:ff')
	ls_order    = trim(dw4.GetItemString(ll_row,"order_no", Delete!, TRUE))
	
	ls_coilorderdet_order[ll_row] = ls_order
	
	ls_w_coil_no       = trim(dw4.GetItemString(ll_row,"w_coil_no", Delete!, TRUE))
	ls_coilorder_order = dw4.GetItemString(ll_row,"coilorder_order", Delete!, TRUE)
	li_order_seq       = dw4.GetItemnumber(ll_row,"order_seq", Delete!, TRUE)
	ld_w_wid           =	dw4.GetItemnumber(ll_row,"w_wid", Delete!, TRUE)
	ls_coil            =	trim(dw4.GetItemString(ll_row,"coil_no", Delete!, TRUE))
	li_seq             = dw4.GetItemnumber(ll_row,"seq", Delete!, TRUE)
	ls_item_no         = trim(dw4.GetItemString(ll_row,"item_no", Delete!, TRUE))
	ls_qa              = trim(dw4.GetItemString(ll_row,"qa", Delete!, TRUE))
	ld_wid             = dw4.GetItemnumber(ll_row,"wid", Delete!, TRUE)
	ld_unit_qty        = dw4.GetItemnumber(ll_row,"unit_qty", Delete!, TRUE)
	ls_sheet           = dw4.GetItemString(ll_row,"sheet", Delete!, TRUE)
	li_cnt             = dw4.GetItemnumber(ll_row,"cnt", Delete!, TRUE)
	li_wcnt            = dw4.GetItemnumber(ll_row,"coilorderdet_cnt", Delete!, TRUE)
	ls_loc             = dw4.GetItemString(ll_row,"loc_no", Delete!, TRUE)
	ls_wloc            = dw4.GetItemString(ll_row,"wloc_no", Delete!, TRUE)
	
	setnull(ls_oc)
	setnull(ls_witem_no)
	setnull(ls_wqa)
	setnull(li_wunit_qty)
	SELECT item_no,      qa,      open_close, unit_qty
	  INTO :ls_witem_no, :ls_wqa, :ls_oc,     :li_wunit_qty 
	  FROM coilmst
	 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
	if sqlca.sqlcode <> 0 then
		messagebox('오류1',"코일마스터[coilmst]select시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	if ls_oc = "C" then
		// 원코일 update
		UPDATE coilmst 
		   SET qcnt = qcnt + :li_wcnt, open_close = "P" // 작업지시중
		 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
		if sqlca.sqlcode <> 0 then
			messagebox('오류2',"코일마스터[coilmst]update시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		// [IW]작업장출고 삭제로직입니다.
		for ll_count = 1 to 100000
			if ls_old_time <> string(now(),'hh:mm:ss:fff') then
				ls_old_time  = string(now(),'hh:mm:ss:fff')	
				exit
			end if	
		next		
		
		// 저장소 재고(IW)
		INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
			    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
		VALUES (getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order,
			    0, :li_wunit_qty * :li_wcnt * -1, 0, :ls_wc_no, :ls_w_coil_no, "", :li_wunit_qty, :li_seq, :li_wunit_qty, :gs_userid);
		if sqlca.sqlcode < 0 then
			messagebox('오류3',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.'&
										+ "~r~n" + string(sqlca.sqlerrtext),exclamation!)
			rollback;
			return
		end if		
	end if

	UPDATE coilorderdet 
	   SET proc_flag = "M" // 작업지시중(스리팅작업일보작성)
	 WHERE coilorder_order = :ls_coilorder_order	AND order_seq = :li_order_seq;
	if sqlca.sqlcode <> 0 then
		messagebox('오류4',"코일작업오더[coilorderdet]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
		
	ls_flag = "O"// 작업지시중	
	UPDATE coilorder SET open_close = :ls_flag WHERE order_no = :ls_coilorder_order;		
	if sqlca.sqlcode <> 0 then
		messagebox('오류5',"코일작업오더[coilorder]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	//스리팅코일 or sheet 삭제
	if ls_sheet = 'C' or ls_sheet = 'L' then
		DELETE FROM coilmst WHERE coil_no = :ls_coil	AND loc_no = :ls_loc;
		if sqlca.sqldbcode <> 0 then
			messagebox('오류6','[코일마스터] delete중 DB오류발생하였습니다.~r~n' + sqlca.sqlerrtext,exclamation!)
			rollback;
			return 					
		end if
	else
		DELETE FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_loc;
		if sqlca.sqldbcode <> 0 then
			messagebox('오류6-1','[sheet마스터] delete중 DB오류발생하였습니다.~r~n' + sqlca.sqlerrtext,exclamation!)
			rollback;
			return 					
		end if
	end if
	
	// 저장소 재고(RC)
	INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
		    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id)  
	VALUES (getdate(), :ld_sfc_date, :ls_item_no, :ls_qa, :ls_loc, 'RC', :ls_order,
		    :ld_unit_qty * :li_cnt * -1, 0, 0,	:ls_wc_no, :ls_coil,"", :ld_unit_qty, :li_seq, :ld_unit_qty * :li_cnt, :gs_userid);
	if sqlca.sqlcode < 0 then
		messagebox('오류7',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.'&
										+ "~r~n" + string(sqlca.sqlerrtext),exclamation!)
		rollback;
		return
	end if		
next // dw4.deletecount()


if ls_chk = "Y" then
	dw_5.reset()
	dw_5.retrieve(ls_coilorderdet_order)
	for ll_row = 1 to dw_5.rowcount()
		ls_wloc      = dw_5.object.loc_no[ll_row]
		ls_w_coil_no = dw_5.object.coil_no[ll_row]
		ld_w_wid     = dw_5.object.wid[ll_row]
		
		setnull(ls_oc)
		setnull(ls_witem_no)
		setnull(ls_wqa)
		setnull(li_wunit_qty)
		
		SELECT item_no, qa, open_close, unit_qty
		  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty 
		  FROM coilmst
		 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
		if sqlca.sqlcode <> 0 then
			messagebox('오류8',"코일마스터[coilmst]select시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		if ls_oc = "C" then
			//원코일 합체 udpate
			li_cnt   = dw_5.object.cnt[ll_row]
			ls_order = dw_5.object.order_no[ll_row]
			UPDATE coilmst SET qcnt = qcnt + :li_cnt, open_close = "P" // 작업지시중
			 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
			if sqlca.sqlcode <> 0 then
				messagebox('오류9',"코일마스터[coilmst]update시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
			
			// 저장소 재고(IW)
			INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no, rcpt_qty, 
				    issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
			VALUES (getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order, 0, 
				    :li_wunit_qty * :li_cnt * -1, 0, :ls_wc_no, :ls_w_coil_no, "coilsum", :li_wunit_qty, :li_cnt, :li_wunit_qty, :gs_userid);
			if sqlca.sqlcode < 0 then
				messagebox("오류10","[inaudit] insert중 DB오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext),exclamation!)
				rollback;
				return
			end if		
		end if
	next
end if

//
ll_rowcount = dw4.rowcount()
for ll_row = 1 to ll_rowcount
	l_status = dw4.GetItemStatus(ll_row, 0, Primary!)
	if l_status = new! or l_status = newmodified! then
	else
		continue
	end if
	ls_chk2 = "Y"
	
	ls_old_time  = string(now(),'hh:mm:ss:fff')	
	ls_order     = dw4.object.order_no[ll_row]
	
	ls_coilorderdet_order[ll_row] = ls_order
	
	li_seq       = dw4.object.seq[ll_row]  
	ls_coilorder_order = dw4.object.coilorder_order[ll_row]
	li_order_seq = dw4.object.order_seq[ll_row]

	ls_wc_place  = dw4.object.wc_place[ll_row]
	ls_supp_no   = dw4.object.supp_no[ll_row]
	
	ls_w_coil_no = dw4.object.w_coil_no[ll_row]
	ld_w_wid     = dw4.object.w_wid[ll_row]
	ls_coil      = dw4.object.coil_no[ll_row]
	ld_wid       = dw4.object.wid[ll_row]
	ls_item_no   = dw4.object.item_no[ll_row]  
	ls_qa        = dw4.object.qa[ll_row]
	ld_unit_qty  = dw4.object.unit_qty[ll_row]
	li_cnt       = dw4.object.cnt[ll_row]
	ld_length    = dw4.object.length[ll_row]
	ls_proc_flag = dw4.object.proc_flag[ll_row]
	ls_sheet     = dw4.object.sheet[ll_row]
	li_wcnt      = dw4.object.coilorderdet_cnt[ll_row]
	ls_loc       = dw4.object.loc_no[ll_row]
	ls_wloc      = dw4.object.wloc_no[ll_row]
	
	UPDATE coilorderdet SET proc_flag = "C" // 작업완료(스리팅작업일보작성)
	 WHERE coilorder_order = :ls_coilorder_order AND order_seq = :li_order_seq;		
	if sqlca.sqlcode <> 0 then
		messagebox('오류11',"코일작업오더[coilorderdet]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	SELECT count(*) INTO :li_coilorderdetcnt 
	  FROM coilorderdet
	 WHERE coilorder_order = :ls_coilorder_order AND proc_flag = "M";
	if li_coilorderdetcnt > 0 then
		ls_flag = "O"// 작업중(스리팅작업일보작성중)
	else
		ls_flag = "C"// 작업완료(스리팅작업일보작성)
	end if
	
	UPDATE coilorder SET open_close = :ls_flag WHERE order_no = :ls_coilorder_order;		
	if sqlca.sqlcode <> 0 then
		messagebox('update오류12',"코일작업오더[coilorder]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	setnull(ls_oc)
	setnull(ls_witem_no)
	setnull(ls_wqa)
	setnull(li_wunit_qty)
	
	SELECT item_no, qa, open_close, unit_qty, etc_no
	  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty, :ls_etc 
	  FROM coilmst
	 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
	if sqlca.sqlcode <> 0 then
		messagebox('오류13',"코일마스터[coilmst]select시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	if ls_oc = "P" then
		//원코일 update
		UPDATE coilmst SET qcnt = qcnt - :li_wcnt , open_close = "C" // 사용완료(스리팅작업일보작성)
		 WHERE coil_no = :ls_w_coil_no and loc_no = :ls_wloc;
		if sqlca.sqlcode <> 0 then
			messagebox('오류14',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		// 저장소 재고(IW)
		INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
			    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
		VALUES (getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order,
			    0, :li_wunit_qty * :li_wcnt, 0, :ls_wc_no, :ls_w_coil_no, "", :li_wunit_qty, :li_seq, :li_wunit_qty, :gs_userid);
		if sqlca.sqlcode < 0 then
			messagebox('오류15',string(ll_row, '##') + '번째줄 [inaudit] insert중 DB오류가 발생했습니다.'&
										+ "~r~n" + string(sqlca.sqlerrtext),exclamation!)
			rollback;
			return
		end if		
	end if
	
	if ls_sheet = 'C' or ls_sheet = 'L' then
		//스리팅코일추가
		INSERT INTO coilmst (coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
				 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close, rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
		VALUES (:ls_coil, :ld_wid, :ls_item_no, :ls_qa, :ls_loc, :ld_sfc_date, :ld_unit_qty, :ld_length,
				 :li_cnt, :li_cnt,    "",  :ls_supp_no, "S", :ls_order, :li_seq, "O", "", :ld_unit_qty, :ld_length, :ls_etc, :ls_w_coil_no);
		if sqlca.sqldbcode <> 0 then
			rollback;
			messagebox('오류16',string(ll_row, '##') + '번째줄 [코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
			return 					
		end if
	else
		//sheet추가
		INSERT INTO sheetmst (sheet_no,    item_no,   qa,    loc_no,  rcpt_date, unit_qty,   
				 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close, rem, rcpt_qty)
		VALUES (:ls_coil, :ls_item_no, :ls_qa, :ls_loc, :ld_sfc_date, :ld_unit_qty, 
				 :li_cnt, :li_cnt,    "",  :ls_supp_no, "S", :ls_order, :li_seq, "O", "", :ld_unit_qty);
		if sqlca.sqldbcode <> 0 then
			rollback;
			messagebox('오류16-1',string(ll_row, '##') + '번째줄 [sheet마스터] insert중 DB오류발생하였습니다.',exclamation!)
			return 					
		end if
	end if
	
	// 생산입고에 로직입니다.
	for ll_count = 1 to 100000
		IF ls_old_time <> string(now(),'hh:mm:ss:ff') then
			ls_old_time  = string(now(),'hh:mm:ss:ff')	
			exit
		END IF	
	NEXT		
	
	// 저장소 재고(RC)
	INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no,
		    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id)  
	VALUES (getdate(), :ld_sfc_date, :ls_item_no, :ls_qa, :ls_loc, 'RC', :ls_order,
		    :ld_unit_qty * :li_cnt, 0, 0,	:ls_wc_no, :ls_coil,"", :ld_unit_qty, :li_seq, :ld_unit_qty * :li_cnt, :gs_userid);
	if sqlca.sqlcode < 0 then
		messagebox("오류17",string(ll_row, "##") + "번째줄 [inaudit] insert중 DB오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext),exclamation!)
		rollback;
		return
	end if				
next //dw4.rowcount()

if ls_chk2 = "Y" then
	dw_5.reset()
	dw_5.retrieve(ls_coilorderdet_order)
	for ll_row = 1 to dw_5.rowcount()
		ls_w_coil_no = dw_5.object.coil_no[ll_row]
		ld_w_wid     = dw_5.object.wid[ll_row]
		ls_wloc      = dw_5.object.loc_no[ll_row]
		
		setnull(ls_oc)
		setnull(ls_witem_no)
		setnull(ls_wqa)
		setnull(li_wunit_qty)
		
		SELECT item_no, qa, open_close, unit_qty
		  INTO :ls_witem_no, :ls_wqa, :ls_oc, :li_wunit_qty from coilmst
		 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
		if sqlca.sqlcode <> 0 then
			messagebox("오류18","코일마스터[coilmst]select시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		if ls_oc = "P" then
			// 원코일 합체 update
			li_cnt   = dw_5.object.cnt[ll_row]
			ls_order = dw_5.object.order_no[ll_row]
			UPDATE coilmst SET qcnt = qcnt - :li_cnt, open_close = "C" // 사용완료(스리팅작업일보작성)
			 WHERE coil_no = :ls_w_coil_no AND loc_no = :ls_wloc;
			if sqlca.sqlcode <> 0 then
				messagebox("오류19","코일마스터[coilmst]update시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
			
			// [IW]작업장출고 로직입니다.
			for ll_count = 1 to 100000
				if ls_old_time <> string(now(),'hh:mm:ss:fff') then
					ls_old_time  = string(now(),'hh:mm:ss:fff')	
					exit
				end if	
			next		
			
			// 저장소 재고(IW)
			INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no, rcpt_qty, 
				    issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
			VALUES (getdate(), :ld_sfc_date, :ls_witem_no, :ls_wqa, :ls_wloc, 'IW', :ls_order, 0, 
				    :li_wunit_qty * :li_cnt, 0, :ls_wc_no, :ls_w_coil_no, "coilsum", :li_wunit_qty, :li_cnt, :li_wunit_qty, :gs_userid);
			if sqlca.sqlcode < 0 then
				messagebox("오류20","[inaudit] insert중 DB오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext),exclamation!)
				rollback;
				return
			end if		
		end if
	next
end if

if	ls_chk = "N" and ls_chk2 = "N" then
	return
end if

if wf_update1(dw4,"Y") = true then
   tab_1.tabpage_1.dw_3.reset()
// tab_1.tabpage_1.dw_3.retrieve(ls_wc)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_mpslitsfc_m
integer x = 1911
integer y = 64
integer width = 160
integer height = 112
string dataobject = "d_mpslitingsfc_h"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpslitsfc_m
integer x = 69
integer y = 264
integer width = 3045
integer height = 92
integer taborder = 60
string dataobject = "d_mpymwc_s2"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;dwItemStatus l_status
datawindow   dw3, dw4
string ls_loc
long   ll_rowcount, i
int    li_index

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
choose case dwo.name
	case "work_date"		// 작업일자
		dw4.reset()
		  
	case "wc_no"			// 작업장
		this.object.loc_no[row] = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'def_loc'))
		dw3.reset()
		dw4.reset()
		  
	case "loc_no"			// 입고저장소
		li_index = tab_1.SelectedTab
		choose case li_index
			case 2
			  ls_loc      = trim(data)
			  ll_rowcount = dw4.rowcount()
			  for i = 1 to ll_rowcount
	           l_status = dw4.GetItemStatus(i, 0, Primary!) 
				  if l_status = newmodified! or l_status = new! then
					  dw4.object.coilmst_loc_no[i] = ls_loc
				  end if
			  next
		end choose
end choose

end event

event dw_2::rbuttondown;//
choose case dwo.name
	case 'work_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.work_date[row] = datetime(date(message.stringparm))
		end if
end choose

this.accepttext()

end event

type st_title from w_inheritance`st_title within w_mpslitsfc_m
integer x = 64
integer y = 40
integer width = 1618
integer height = 132
string text = "스리팅 작업일보 등록"
end type

type st_tips from w_inheritance`st_tips within w_mpslitsfc_m
integer x = 1893
integer y = 48
integer width = 96
end type

type pb_compute from w_inheritance`pb_compute within w_mpslitsfc_m
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslitsfc_m
boolean visible = false
integer x = 2455
integer y = 120
end type

type pb_close from w_inheritance`pb_close within w_mpslitsfc_m
integer x = 3406
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslitsfc_m
boolean visible = false
integer x = 2967
integer y = 44
integer taborder = 120
end type

event pb_print::clicked;//string ls_sql, ls_where
//
//openwithparm(w_whwcplan_w, ist_code)
//ist_code = message.powerobjectparm
//if ist_code.okcancel = 'N' then
//	return
//end if
//dw_11.retrieve(ist_code.order_flag, date(ist_code.start_date), date(ist_code.end_date), ist_code.sel_flag)
//if dw_11.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
//   return
//end if
//w_repsuper w_print
//st_print l_print
//l_print.st_datawindow = dw_11
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 작업장별 생산계획 대비 실적 현황을 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//	
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"생산실적인쇄",parent, li_x, li_y)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslitsfc_m
integer x = 2830
integer taborder = 130
end type

event pb_cancel::clicked;

tab_1.selecttab(1)
tab_1.tabpage_1.dw_3.reset()
tab_1.tabpage_2.dw_4.reset()


end event

type pb_delete from w_inheritance`pb_delete within w_mpslitsfc_m
integer x = 3022
integer taborder = 140
string text = "      "
end type

event pb_delete::clicked;string ls_coil, ls_proc, ls_order, ls_error, ls_loc
long ll_row, ll_cnt
int li_index
dec{1} ld_wid
datawindow dw4
dwItemStatus l_status

dw4 = tab_1.tabpage_2.dw_4

dw4.accepttext()
li_index = tab_1.SelectedTab
choose case li_index
	case 1
		
	case 2
		ls_error = "N"
		ll_row = dw4.getrow()
		if ll_row < 1 then return
		
		ls_order = dw4.object.order_no[ll_row]
		dw4.setredraw(false)
		dw4.setfilter( " order_no = '" + ls_order + "'")
		dw4.filter()
		
		for ll_row = 1 to dw4.rowcount()
			l_status = dw4.GetItemStatus(ll_row, 0, Primary!)
			if l_status = new! or l_status = newmodified! then
				continue
			end if
	
			ls_coil = dw4.object.coil_no[ll_row]
			ls_loc = dw4.object.loc_no[ll_row]
			ld_wid = dw4.object.wid[ll_row]
			select open_close into :ls_proc from coilmst
			 where coil_no = :ls_coil
				and loc_no = :ls_loc;
			if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
				select count(*) into :ll_cnt from coilmst
				 where coil_no = :ls_coil
				   and loc_no <> :ls_loc;
				if ll_cnt > 0 then
					messagebox("확인","스리팅코일[" + trim(ls_coil) +"]은 이동되었습니다. 코일이동관리에서 삭제후 작업하십시요")
					ls_error = "Y"
					exit
				else
					messagebox("확인","코일자료가 없습니다. 전산실로 연락바랍니다")
					ls_error = "Y"
					exit
				end if
			end if
			CHOOSE CASE ls_proc
				CASE "M"
					messagebox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 지금 생산계획중입니다.")
					ls_error = "Y"
					exit
				CASE "P"
					messagebox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 지금 작업지시중입니다.")
					ls_error = "Y"
					exit
				CASE "C"
					messagebox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 이미 사용이 완료되었습니다")
					ls_error = "Y"
					exit
				CASE "S"
					messagebox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 이미 외주로 이동되어있습니다")
					ls_error = "Y"
					exit
			END CHOOSE
			if dw4.object.proc_flag[ll_row] = "C" then
				messagebox("확인","이 스리팅코일[" + trim(ls_coil) + "]은 사용된 코일입니다~r~n" + &
										"성형 작업일보내역을 삭제후에 스리팅작업일보내역을 삭제하십시요")
				ls_error = "Y"
				exit
			end if
		next
		if ls_error = "N" then
			dw4.rowsmove(1, dw4.rowcount(), Primary!, dw4 , 1, Delete!)
		end if
		dw4.setfilter( "")
		dw4.filter()
		dw4.setredraw(true)
end choose
end event

type pb_insert from w_inheritance`pb_insert within w_mpslitsfc_m
boolean visible = false
integer x = 2670
integer y = 44
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslitsfc_m
integer x = 2638
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row
date ld_start, ld_end
string ls_wc
dw_2.accepttext()

ld_start = date(dw_2.object.work_date[1])
if isnull(ld_start) then
	messagebox('오류','작업일자를 입력하십시오.',exclamation!)
	return
end if

ls_wc = trim(dw_2.object.wc_no[1])
if ls_wc = "" or isnull(ls_wc) then
	messagebox('오류','작업장을 입력하십시오.',exclamation!)
	return
end if

tab_1.selecttab(1)
tab_1.tabpage_1.dw_3.SetSort("")
tab_1.tabpage_1.dw_3.Sort( )
tab_1.tabpage_1.dw_3.retrieve(ls_wc)
tab_1.tabpage_2.dw_4.reset()

end event

type gb_3 from w_inheritance`gb_3 within w_mpslitsfc_m
integer x = 37
integer y = 220
integer width = 3589
integer height = 152
integer taborder = 70
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_mpslitsfc_m
boolean visible = false
integer x = 1189
integer y = 0
integer width = 87
integer height = 136
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_mpslitsfc_m
integer x = 2615
integer width = 1006
integer textsize = -10
integer weight = 400
end type

type st_3 from statictext within w_mpslitsfc_m
integer x = 2057
integer y = 272
integer width = 160
integer height = 64
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
string text = "입고"
alignment alignment = center!
boolean focusrectangle = false
end type

type tab_1 from tab within w_mpslitsfc_m
integer x = 37
integer y = 384
integer width = 3589
integer height = 1652
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
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

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3552
integer height = 1524
long backcolor = 79741120
string text = "작업일보대상항목"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DataWindow!"
long picturemaskcolor = 553648127
st_1 st_1
dw_3 dw_3
cb_1 cb_1
end type

on tabpage_1.create
this.st_1=create st_1
this.dw_3=create dw_3
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.dw_3,&
this.cb_1}
end on

on tabpage_1.destroy
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.cb_1)
end on

type st_1 from statictext within tabpage_1
integer x = 14
integer y = 12
integer width = 1495
integer height = 108
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "작업일보대상항목을 선택한 후 [작업일보작성]버튼을 누르면 데이터가 작업일보등록으로 이동된다."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_1
integer x = 14
integer y = 128
integer width = 3511
integer height = 1392
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_mpslitingsfc_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

long ll_pri, ll_cnt, ll_last_pri

this.SelectRow(row, NOT this.IsSelected(row))
if isselected(row) = true then
	ll_pri = 0
	for ll_cnt = 1 to this.rowcount()
		if isnull(this.object.pri[ll_cnt]) or this.object.pri[ll_cnt] = 0 then continue
		if ll_pri < this.object.pri[ll_cnt] then
			ll_pri = this.object.pri[ll_cnt]
		end if
	next
	this.object.pri[row] = ll_pri + 1
	ii_wid = ii_wid + 1
else
	ll_pri = this.object.pri[row]
	ll_last_pri = ll_pri - 1
	ii_wid = ii_wid - 1
	this.object.pri[row] = 0
	for ll_cnt = 1 to this.rowcount()
		if isnull(this.object.pri[ll_cnt]) then continue
		if ll_pri < this.object.pri[ll_cnt] then
			this.object.pri[ll_cnt] = this.object.pri[ll_cnt] - 1
			ll_last_pri = this.object.pri[ll_cnt] 
		end if
	next
end if
end event

type cb_1 from commandbutton within tabpage_1
integer x = 2574
integer y = 12
integer width = 562
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업일보작성=>"
end type

event clicked;datawindow dwsource, dwtarget
long   ll_rowcount, ll_rowcount1, ll_cnt, ll_count, ll_row, ll_dw1rowcount, ll_dw1cnt
string ls_loc, ls_plan, ls_null, ls_qa
int    li_seq, li_null

dwsource = tab_1.tabpage_1.dw_3
dwtarget = tab_1.tabpage_2.dw_4

dw_2.accepttext()
dwtarget.accepttext()
dwsource.accepttext()
ll_rowcount  = dwsource.rowcount()
ll_rowcount1 = dwtarget.rowcount()
//
if dw_2.rowcount() > 0 then
	ls_loc = trim(dw_2.object.loc_no[1])
else
	ls_loc = ""
end if

ll_count = 0
for ll_cnt = 1 to ll_rowcount
	if dwsource.isselected(ll_cnt) then
      ll_count ++
	end if
next
if ll_count = 0 then
	messagebox('오류','작업일보를 작성할 항목을 선택하십시요.',exclamation!)
	return
end if

setnull(ls_null)
dwtarget.reset()
dwtarget.setredraw(false)

if ii_wid <> 0 then
	dwsource.SetSort("if (pri = 0 , 999, pri)")
	dwsource.Sort( )
end if

for ll_cnt = 1 to ll_rowcount
	if dwsource.isselected(ll_cnt) then			
		ls_plan = trim(dwsource.object.order_no[ll_cnt])
		li_seq  = dwsource.object.order_seq[ll_cnt]
		
		ll_dw1rowcount = dw_1.retrieve(ls_plan, li_seq)			
		if ll_dw1rowcount < 1 then
			messagebox("확인", "스리팅작업지시 자료이상이 발생하였습니다~r~n재조회 후 작업 하시기 바랍니다.")
			return
			rollback;
		end if
			
		for ll_dw1cnt = 1 to ll_dw1rowcount				
			ll_row = dwtarget.insertrow(0)
			
			dwtarget.object.coilorderdet_div[ll_row]  = dw_1.object.coilorderdet_div[ll_dw1cnt]
			dwtarget.object.coilmst_qa[ll_row]        = dw_1.object.coilmst_qa[ll_dw1cnt]
			dwtarget.object.wunit[ll_row]             = dw_1.object.wunit[ll_dw1cnt]
			dwtarget.object.coilmst_length[ll_row]    = dw_1.object.coilmst_length[ll_dw1cnt]
			dwtarget.object.witem_name[ll_row]        = dw_1.object.witem_name[ll_dw1cnt]
			
			dwtarget.object.order_no[ll_row]          = dw_1.object.order_no[ll_dw1cnt]
			dwtarget.object.seq[ll_row]               = dw_1.object.seq[ll_dw1cnt]   
			dwtarget.object.coilorder_order[ll_row]   = dw_1.object.coilorder_order[ll_dw1cnt]
			dwtarget.object.order_seq[ll_row]         = dw_1.object.order_seq[ll_dw1cnt]   

			dwtarget.object.sfc_date[ll_row]          = datetime(dw_2.object.work_date[1])
			dwtarget.object.wc_no[ll_row]             = dw_2.object.wc_no[1]
			dwtarget.object.wc_place[ll_row]          = "I"
			dwtarget.object.supp_no[ll_row]           = ls_null
			
			dwtarget.object.w_coil_no[ll_row]         = dw_1.object.coil_no[ll_dw1cnt]   
			dwtarget.object.wloc_no[ll_row]           = dw_1.object.loc_no[ll_dw1cnt]  
			dwtarget.object.w_wid[ll_row]             = dw_1.object.wid[ll_dw1cnt]  
			ls_qa = dw_1.object.qa[ll_dw1cnt]
			if dw_1.object.sheet[ll_dw1cnt] = "S" then
				dwtarget.object.coil_no[ll_row] = "SHEET"
				dwtarget.object.wid[ll_row]     = dec(MidA(ls_qa,5,4))
			else
				dwtarget.object.coil_no[ll_row] = ls_null 
				dwtarget.object.wid[ll_row]     = dec(MidA(ls_qa,5,4) + "." + MidA(ls_qa, 10,1))
			end if
						
			dwtarget.object.coil_no[ll_row]   = wf_coil(ll_dw1cnt, ll_row) 	//로트번호
			
			dwtarget.object.item_no[ll_row]   = dw_1.object.item_no[ll_dw1cnt]   
			dwtarget.object.qa[ll_row]        = ls_qa  
			dwtarget.object.unit_qty[ll_row]  = dw_1.object.unit_qty[ll_dw1cnt]   
			dwtarget.object.cnt[ll_row]       = dw_1.object.cnt[ll_dw1cnt]
			dwtarget.object.length[ll_row]    = dw_1.object.length[ll_dw1cnt]
			dwtarget.object.rem[ll_row]       = dw_1.object.rem[ll_dw1cnt]
			dwtarget.object.proc_flag[ll_row] = "O"
			dwtarget.object.sheet[ll_row]     = dw_1.object.sheet[ll_dw1cnt]
			dwtarget.object.work_type[ll_row] = dw_1.object.work_type[ll_dw1cnt]
			dwtarget.object.coilorderdet_cnt[ll_row]  = dw_1.object.coilorderdet_cnt[ll_dw1cnt]
			
			dwtarget.object.groupitem_item_name[ll_row] = dw_1.object.groupitem_item_name[ll_dw1cnt]
			dwtarget.object.loc_no[ll_row]    = ls_loc
		next
	end if
next
dwtarget.setredraw(true)
messagebox('확인','작업일보를 작성하였습니다.',information!)
dwsource.selectrow(0,false)
tab_1.selecttab(2)

// dwsource 초기화 selected 초기화
setnull(li_null)
ii_wid = 0 
for ll_cnt = 1 to dwsource.rowcount()
	dwsource.object.pri[ll_cnt] = li_null
next

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3552
integer height = 1524
long backcolor = 79741120
string text = "작업일보등록"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Table!"
long picturemaskcolor = 553648127
cb_2 cb_2
cb_7 cb_7
st_2 st_2
dw_4 dw_4
end type

on tabpage_2.create
this.cb_2=create cb_2
this.cb_7=create cb_7
this.st_2=create st_2
this.dw_4=create dw_4
this.Control[]={this.cb_2,&
this.cb_7,&
this.st_2,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.cb_2)
destroy(this.cb_7)
destroy(this.st_2)
destroy(this.dw_4)
end on

type cb_2 from commandbutton within tabpage_2
integer x = 1179
integer y = 8
integer width = 581
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "바코드출력"
end type

event clicked;long ll_row

dw_4.accepttext()
ll_row = dw_4.getrow()
if ll_row < 1 then return

ist_code.sale_no = dw_4.object.coilorder_order[ll_row]
ist_code.seq_no  = dw_4.object.order_seq[ll_row]
openwithparm(w_barcode_print_r, ist_code)

end event

type cb_7 from commandbutton within tabpage_2
integer x = 14
integer y = 12
integer width = 581
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업일보조회"
end type

event clicked;long   ll_row
date   ld_workdate
string ls_wc

dw_2.accepttext()
ld_workdate = date(dw_2.object.work_date[1])
if isnull(ld_workdate) then
	messagebox('오류','작업일자를 입력하십시오.',exclamation!)
	return
end if

ls_wc = trim(dw_2.object.wc_no[1])
if ls_wc = "" or isnull(ls_wc) then
	messagebox('오류','작업장을 입력하십시오.',exclamation!)
	return
end if

tab_1.tabpage_2.dw_4.reset()
tab_1.tabpage_2.dw_4.retrieve(ld_workdate,ls_wc)
tab_1.tabpage_2.dw_4.setfocus()

end event

type st_2 from statictext within tabpage_2
integer x = 2043
integer y = 40
integer width = 1463
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
boolean enabled = false
string text = "삭제시에는 원코일작업오더 전체가 삭제됩니다."
boolean focusrectangle = false
end type

type dw_4 from datawindow within tabpage_2
integer x = 14
integer y = 128
integer width = 3511
integer height = 1392
integer taborder = 60
string dataobject = "d_mpslitingsfc_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_mpslitsfc_m
integer x = 1728
integer y = 64
integer width = 160
integer height = 112
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_mpslitcon_h"
end type

