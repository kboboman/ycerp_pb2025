$PBExportHeader$w_iocoilsubuse_m.srw
$PBExportComments$외주 코일사용관리(2001/07/19, 이인호)
forward
global type w_iocoilsubuse_m from w_inheritance
end type
type em_2 from editmask within w_iocoilsubuse_m
end type
type em_1 from editmask within w_iocoilsubuse_m
end type
type st_2 from statictext within w_iocoilsubuse_m
end type
type tab_1 from tab within w_iocoilsubuse_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
cb_1 cb_1
end type
type tabpage_2 from userobject within tab_1
end type
type rb_2 from radiobutton within tabpage_2
end type
type rb_1 from radiobutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type em_3 from editmask within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
rb_2 rb_2
rb_1 rb_1
cb_2 cb_2
dw_4 dw_4
em_3 em_3
st_3 st_3
end type
type tab_1 from tab within w_iocoilsubuse_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type pb_1 from picturebutton within w_iocoilsubuse_m
end type
type st_22 from statictext within w_iocoilsubuse_m
end type
type dw_area from datawindow within w_iocoilsubuse_m
end type
type gb_4 from groupbox within w_iocoilsubuse_m
end type
end forward

global type w_iocoilsubuse_m from w_inheritance
integer y = 112
integer width = 3671
integer height = 2180
string title = "외주코일 사용관리(w_iocoilsubuse_m)"
em_2 em_2
em_1 em_1
st_2 st_2
tab_1 tab_1
pb_1 pb_1
st_22 st_22
dw_area dw_area
gb_4 gb_4
end type
global w_iocoilsubuse_m w_iocoilsubuse_m

type variables
datawindow dw3, dw4

end variables

forward prototypes
public subroutine wf_coildddw (string as_loc)
public subroutine wf_sheetdddw (string as_loc)
public function boolean wf_dw4insert ()
public function boolean wf_dw4delete ()
public function string wf_coil (long arg_row)
public function boolean wf_oc (string arg_lot, string arg_oc)
public subroutine wf_cleardddw ()
end prototypes

public subroutine wf_coildddw (string as_loc);string  ls_where, ls_clause, ls_select, ls_qa
datawindowchild ldwc_lot

dw4.Modify("coilsubuse_lot_no.dddw.Name='d_cdcoil_os_c'")
dw4.Modify("coilsubuse_lot_no.dddw.allowedit=no")
dw4.Modify("coilsubuse_lot_no.dddw.percentwidth='470'")
dw4.Modify("coilsubuse_lot_no.dddw.displayColumn='coil_no'")
dw4.Modify("coilsubuse_lot_no.dddw.DataColumn='coil_no'")
dw4.Modify("coilsubuse_lot_no.dddw.vscrollbar=yes")

dw4.getchild('coilsubuse_lot_no',ldwc_lot)
ldwc_lot.settransobject(sqlca)

ls_select = ldwc_lot.Describe("DataWindow.Table.Select")

ls_where =  ' and coilmst.loc_no = ~~"' + as_loc + '~~"'

ls_clause = "DataWindow.Table.Select='"  + ls_select + ls_where + "'"
ldwc_lot.modify(ls_clause)
if ldwc_lot.retrieve() > 0 then
	ldwc_lot.SetSort("unit_qty , coil_no")
	ldwc_lot.Sort( )
end if

return
end subroutine

public subroutine wf_sheetdddw (string as_loc);string  ls_where, ls_clause, ls_select, ls_qa
datawindowchild ldwc_lot

dw4.Modify("coilsubuse_lot_no.dddw.Name='d_cdsheet_os_c'")
dw4.Modify("coilsubuse_lot_no.dddw.allowedit=no")
dw4.Modify("coilsubuse_lot_no.dddw.percentwidth='420'")
dw4.Modify("coilsubuse_lot_no.dddw.displayColumn='sheet_no'")
dw4.Modify("coilsubuse_lot_no.dddw.DataColumn='sheet_no'")
dw4.Modify("coilsubuse_lot_no.dddw.vscrollbar=yes")

dw4.getchild('coilsubuse_lot_no',ldwc_lot)
ldwc_lot.settransobject(sqlca)

ls_select = ldwc_lot.Describe("DataWindow.Table.Select")

ls_where =  ' and sheetmst.loc_no = ~~"' + as_loc + '~~"'

ls_clause = "DataWindow.Table.Select='"  + ls_select + ls_where + "'"
ldwc_lot.modify(ls_clause)
if ldwc_lot.retrieve() > 0 then
	ldwc_lot.SetSort("unit_qty , sheet_no")
	ldwc_lot.Sort( )
end if

return

end subroutine

public function boolean wf_dw4insert ();string  ls_old_time, ls_loc, ls_order, ls_item, ls_lot, ls_qa, ls_oc, ls_etc, ls_pcoil_no
real    lr_useqty, lr_unitqty
long    ll_rowcount, ll_row, ll_cnt, ll_oricnt, ll_count
int     li_int
decimal{1} ld_wid
dec{2}  ld_length
datetime ldt_date
dwItemStatus l_status

dw_1.accepttext()
dw4.accepttext()

ls_old_time = string(now(),'hh:mm:ss:fff')

ll_rowcount = dw4.rowcount()
for ll_row = 1 to ll_rowcount
   l_status = dw4.GetItemStatus(ll_row,0, Primary!)
	if l_status = NotModified! then continue
	
	li_int     = dw4.object.coilsubuse_seq[ll_row]
	ldt_date   = dw4.object.coilsubuse_use_date[ll_row]
	ls_loc     = trim(dw4.object.coilsubuse_loc_no[ll_row])
	ls_order   = trim(dw4.object.coilsubuse_insp_no[ll_row])
	ls_item    = trim(dw4.object.coilsubuse_item_no[ll_row])
	ls_lot     = trim(dw4.object.coilsubuse_lot_no[ll_row])
	ls_qa      = trim(dw4.object.coilsubuse_qa[ll_row])
	lr_useqty  = dw4.object.coilsubuse_unit_qty[ll_row] * dw4.object.coilsubuse_cnt[ll_row]
	ll_cnt     = dw4.object.coilsubuse_cnt[ll_row]
	lr_unitqty = dw4.object.coilsubuse_unit_qty[ll_row]

	if MidA(ls_item, 4, 1) = "1" then
		
		select qcnt into :ll_oricnt from coilmst where coil_no = :ls_lot and loc_no = :ls_loc;
		
		/*2021.01.16 jowonsuk */
		if ll_oricnt < ll_cnt then
			MessageBox('오류',"[" + ls_lot + "] 코일 재고량을 확인하세요. ~r~n",exclamation!)
			RETURN false
		end if 
		
		if ll_oricnt <= ll_cnt then
			ls_oc = "C"
		else
			ls_oc = "O"
		end if
		
		update coilmst 
		   set qcnt = qcnt - :ll_cnt, open_close = :ls_oc // 사용완료(작업일보사용)
		 where coil_no = :ls_lot and loc_no = :ls_loc;
		if sqlca.sqlcode <> 0 then
			messagebox('insert오류1',"코일마스터 UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return false
		end if
		
	elseif MidA(ls_item, 4, 1) = "2" then
		select qcnt into :ll_oricnt from sheetmst where sheet_no = :ls_lot and loc_no = :ls_loc;
		
		/*2021.01.16 jowonsuk */
		if ll_oricnt < ll_cnt then
			MessageBox('오류',"[" + ls_lot + "] 쉬트 재고량을 확인하세요. ~r~n",exclamation!)
			RETURN false
		end if 		
		
		if ll_oricnt <= ll_cnt then
			ls_oc = "C"
		else
			ls_oc = "O"
		end if
		
		update sheetmst 
		   set qcnt = qcnt - :ll_cnt, open_close = :ls_oc // 사용완료(작업일보사용)
		 where sheet_no = :ls_lot and loc_no = :ls_loc;
		if sqlca.sqlcode <> 0 then
			messagebox('insert오류2',"SHEET마스터 UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return false
		end if		
	end if
	
	/////////////////////////////////////////////////
	// inaudit insert
//	for ll_count = 1 to 100000
//		IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
//			ls_old_time  = string(now(),'hh:mm:ss:fff')	
//			exit
//		END IF	
//	NEXT
	
	insert into inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, order_no, rcpt_qty, issue_qty, loc_no,
		                   inaudit_type, destination, serial_id, cost, unit_qty,  cnt, com_qty, user_id)
	values ( getdate(), :ldt_date, :ls_item, :ls_qa, :ls_order, 0, :lr_useqty, :ls_loc,
		      'IL', 			:ls_loc, 	:ls_lot, 	0, :lr_unitqty, :ll_cnt, :li_int, :gs_userid);
	if sqlca.sqlcode < 0 then
		messagebox('insert오류3','inaudit insert중 DB오류가 발생했습니다.',exclamation!)
		rollback;
		return false
	end if
	
	//=================================================================
	// 잔량 등록 ======================================================
	//=================================================================
	if dw4.object.coilsubuse_rem_qty[ll_row] > 0 then
		select distinct pcoil_no into :ls_pcoil_no from coilmst where coil_no = :ls_lot;
		dw4.object.coilsubuse_rem_lot[ll_row] = wf_coil(ll_row)
		ls_lot = trim(dw4.object.coilsubuse_rem_lot[ll_row])
		
		lr_unitqty = dw4.object.coilsubuse_rem_qty[ll_row]
		ls_etc     = dw4.object.etc_no[ll_row]
		lr_useqty  = lr_unitqty
		ld_wid     = dec(MidA(dw4.object.coilsubuse_qa[ll_row], 5,4) &
					  + "." + MidA(dw4.object.coilsubuse_qa[ll_row], 10,1))
		ld_length = dw4.object.coilsubuse_rem_len[ll_row]
		
	 // 스리팅코일추가
    //if mid(ls_item, 4, 1) = "1" then
			insert into coilmst ( coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
					                cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close,
					                rem, rcpt_qty, rcpt_len, etc_no, pcoil_no)
			values (:ls_lot, :ld_wid, :ls_item, :ls_qa, :ls_loc, :ldt_date, :lr_unitqty, :ld_length,
					  1, 1,    :ls_order,  :ls_loc, 'S', :ls_order, :li_int, 'O', 
					  '외주사용잔량입고', :lr_unitqty, :ld_length, :ls_etc, :ls_pcoil_no);
			if sqlca.sqldbcode <> 0 then
				rollback;
				messagebox('오류10','[코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
				return false
			end if
// 외주사용잔량입고 안함
//		elseif mid(ls_item, 4, 1) = "2" then
//			//sheet추가
//			insert into sheetmst ( sheet_no,  item_no,   qa,    loc_no,  rcpt_date, unit_qty,   
//					                 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close,	rem, rcpt_qty)
//			values (:ls_lot, :ls_item, :ls_qa, :ls_loc, :ldt_date, :lr_unitqty, 
//					  1, 1,    :ls_order,  :ls_loc, "S", :ls_order, :li_int, "O", "외주사용잔량입고", :lr_unitqty);
//			if sqlca.sqldbcode <> 0 then
//				rollback;
//				return false
//				messagebox('오류10-1','[sheet마스터] insert중 DB오류발생하였습니다.',exclamation!)
//			end if
//		end if

//		for ll_count = 1 to 100000
//			IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
//				ls_old_time  = string(now(),'hh:mm:ss:fff')	
//				exit
//			END IF	
//		NEXT		

		// 외주가공입고에 로직입니다.
		insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, order_no, rcpt_qty, issue_qty, loc_no,
			                  inaudit_type, destination, serial_id, cost, unit_qty,  cnt, com_qty, user_id)
		values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_order, :lr_useqty,  0, :ls_loc,
			     'RL', 			:ls_loc, 	:ls_lot, 	0, :lr_unitqty, 1, :li_int, :gs_userid);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류','입출고역에 추가중 DB오류발생하였습니다.',exclamation!)
			return false					
		end if
	end if
next

return true


end function

public function boolean wf_dw4delete ();string ls_loc, ls_order, ls_item, ls_lot, ls_qa, ls_oc
real lr_useqty, lr_unitqty
long ll_rowcount, ll_row, ll_cnt, ll_oricnt, ll_count, ll_chkcount
int li_int
dec{2} ld_length
datetime ldt_date,ldt_olddate
dwItemStatus l_status

dw_2.accepttext()
dw4.accepttext()

ll_rowcount = dw4.deletedcount()
for ll_row = 1 to ll_rowcount
   l_status = dw4.GetItemStatus(ll_row,0, Delete!)
   if l_status = New! or l_status = NewModified! then continue

	li_int = int(dw4.GetItemnumber(ll_row,"coilsubuse_seq", Delete!, TRUE))
	ldt_date = dw4.GetItemdatetime(ll_row,"coilsubuse_use_date", Delete!, TRUE)
	ls_loc  = trim(dw4.GetItemString(ll_row,"coilsubuse_loc_no", Delete!, TRUE))
	ls_order = trim(dw4.GetItemString(ll_row,"coilsubuse_insp_no", Delete!, TRUE))
	ls_item = trim(dw4.GetItemString(ll_row,"coilsubuse_item_no", Delete!, TRUE))
	ls_lot = trim(dw4.GetItemString(ll_row,"coilsubuse_lot_no", Delete!, TRUE))
	ls_qa   = trim(dw4.GetItemString(ll_row,"coilsubuse_qa", Delete!, TRUE))
	ll_cnt  = dw4.GetItemnumber(ll_row,"coilsubuse_cnt", Delete!, TRUE)
	INSERT INTO inaudit
		( inaudit_time,inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, 
		  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
	SELECT getdate(), :ldt_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		  rcpt_qty * -1, issue_qty * -1, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, :gs_userid  
	 FROM inaudit
	where inaudit_date = :ldt_date
		and order_no = :ls_order
		and serial_id = :ls_lot
		and inaudit_item = :ls_item
		and loc_no = :ls_loc
		and qa = :ls_qa 
		and com_qty = :li_int 
		and inaudit_type = 'IL' 
		and rcpt_qty >= 0
		and issue_qty >= 0;
   if sqlca.sqlcode < 0 then
     	messagebox('오류1', sqlca.sqlerrtext + '~r~n [inaudit] INSERT중 DB오류가 발생했습니다.',exclamation!)
      rollback;
      return false
   end if

	if MidA(ls_item, 4, 1) = "1" then
		update coilmst set qcnt = qcnt + :ll_cnt,
								 open_close = 'O' // 사용가능(미사용)
		 where coil_no = :ls_lot
			and loc_no = :ls_loc;
		if sqlca.sqlcode <> 0 then
			messagebox('update오류1',"코일마스터[coilmst]UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return false
		end if
	elseif MidA(ls_item, 4, 1) = "2" then
		update sheetmst set  qcnt = qcnt + :ll_cnt,
								 open_close = 'O'  // 사용가능(미사용)
		 where sheet_no = :ls_lot
			and loc_no = :ls_loc;
		if sqlca.sqlcode <> 0 then
			messagebox('update오류2',"SHEET마스터UPDATE시 오류가 발생했습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return false
		end if
	end if
	//=================================================================
	// 잔량 삭제 ======================================================
	//=================================================================
	if dw4.GetItemnumber(ll_row,"coilsubuse_rem_qty", Delete!, TRUE) > 0 then
		ls_lot = trim(dw4.GetItemString(ll_row,"coilsubuse_rem_lot", Delete!, TRUE))
		//스리팅코일삭제
//		if mid(ls_item, 4, 1) = "1" then
			delete from coilmst 
			 where coil_no = :ls_lot
			   and loc_no = :ls_loc
				and open_close = 'O';
			if sqlca.sqldbcode <> 0 then
				select open_close into :ls_oc from coilmst 
				 where coil_no = :ls_lot
			      and loc_no = :ls_loc;
				if wf_oc(ls_lot, ls_oc) = false then
					rollback;
					return false
				end if
				select count(*) into :ll_count from coilmst 
				 where coil_no = :ls_lot;
				if ll_count > 0 then
			      rollback;
					messagebox("확인","이 로트번호[" + trim(ls_lot) + "]은 이미 외주로 이동되어있습니다")
					return false
				end if
		      rollback;
				messagebox('오류3','[코일마스터] delete중 DB오류발생하였습니다.',exclamation!)
				return false
			end if
//		elseif mid(ls_item, 4, 1) = "2" then
//			//sheet삭제
//			delete from sheetmst 
//			 where sheet_no = :ls_lot
//			   and loc_no = :ls_loc
//				and open_close = 'O';
//			if sqlca.sqldbcode <> 0 then
//				select open_close into :ls_oc from sheetmst 
//				 where sheet_no = :ls_lot
//			      and loc_no = :ls_loc;
//				if wf_oc(ls_lot, ls_oc) = false then
//					rollback;
//					return false
//				end if
//				select count(*) into :ll_count from sheetmst 
//				 where sheet_no = :ls_lot;
//				if ll_count > 0 then
//			      rollback;
//					messagebox("확인4","이 로트번호[" + trim(ls_lot) + "]은 이미 외주로 이동되어있습니다")
//					return false
//				end if
//				rollback;
//				messagebox('오류5','[sheet마스터] delete중 DB오류발생하였습니다.',exclamation!)
//				return false
//			end if
//		end if
		INSERT INTO inaudit
			( inaudit_time,inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, 
			  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
		SELECT getdate(), :ldt_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
			  rcpt_qty * -1, issue_qty * -1, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, :gs_userid  
		 FROM inaudit
		 where inaudit_date = :ldt_date 
			and order_no = :ls_order
			and serial_id = :ls_lot
			and loc_no = :ls_loc
			and inaudit_item = :ls_item 
			and qa = :ls_qa 
			and com_qty = :li_int 
			and inaudit_type = 'RL' 
			and rcpt_qty >= 0
			and issue_qty >= 0;
		if sqlca.sqlcode < 0 then
			messagebox('오류8', '[inaudit] INSERT중 DB오류가 발생했습니다.',exclamation!)
			rollback;
			return false
		end if
	end if
next
return true
end function

public function string wf_coil (long arg_row);string ls_coil, ls_loc, ls_maxcoil, ls_chk, ls_chkcoil
int li_pos, li_len, li_start

dw4.accepttext()
ls_coil = dw4.object.coilsubuse_lot_no[arg_row] 
ls_loc = dw4.object.coilsubuse_loc_no[arg_row] 
li_start = 0
do 
	li_pos = li_start
	li_start = PosA(ls_coil, "-", li_start + 1)
loop until li_start = 0
if li_start = 1 then li_pos = 0
if li_pos > 0 then
	if integer( MidA(ls_coil, li_pos + 1, 2)) > 9 then
		ls_chkcoil = MidA(ls_coil, 1, LenA(trim(ls_coil)) - 2 ) + "%"
		li_len = LenA(trim(ls_chkcoil)) + 1
	else
		ls_chkcoil = MidA(ls_coil, 1, LenA(trim(ls_coil)) - 1 ) + "%"
		li_len = LenA(trim(ls_chkcoil))
	end if
	select max(coil_no) into :ls_maxcoil from coilmst
	 where datalength(coil_no) = :li_len
		and coil_no like :ls_chkcoil;
else
	ls_chkcoil = trim(ls_coil) + "-%"
	li_len = LenA(trim(ls_chkcoil))
	setnull(ls_maxcoil)
	select max(coil_no) into :ls_maxcoil from coilmst
	 where datalength(coil_no) = :li_len + 1 
		and coil_no like :ls_chkcoil;
	if isnull(ls_maxcoil) then
		select max(coil_no) into :ls_maxcoil from coilmst
		 where datalength(coil_no) = :li_len
			and coil_no like :ls_chkcoil;
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
			ls_chkcoil = LeftA(ls_maxcoil, li_pos) &
						+ string(integer(MidA(ls_maxcoil, li_pos + 1, 2)) + 1)
			select coil_no into :ls_maxcoil from coilmst
			 where coil_no = :ls_chkcoil
				and datalength(coil_no) = datalength(:ls_chkcoil);
		loop
	else
		do until sqlca.sqlcode = 100
			ls_chkcoil = LeftA(ls_maxcoil, li_pos) &
						+ string(integer(MidA(ls_maxcoil, li_pos + 1, 1)) + 1)
			select coil_no into :ls_maxcoil from coilmst
			 where coil_no = :ls_chkcoil
				and datalength(coil_no) = datalength(:ls_chkcoil);
		loop
	end if
end if

return ls_chkcoil
//
//li_start = 0
//do 
//	li_pos = li_start
//	li_start = Pos(ls_coil, "-", li_start + 1)
//loop until li_start = 0
//if li_start = 1 then li_pos = 0
//if li_pos > 0 then
//	if integer( mid(ls_coil, li_pos + 1, 2)) > 9 then
//		ls_chkcoil = mid(ls_coil, 1, len(trim(ls_coil)) - 2 ) + "%"
//		li_len = len(trim(ls_chkcoil)) + 1
//	else
//		ls_chkcoil = mid(ls_coil, 1, len(trim(ls_coil)) - 1 ) + "%"
//		li_len = len(trim(ls_chkcoil))
//	end if
//	if mid(ls_item, 4, 1) = "1" then
//		select max(coil_no) into :ls_maxcoil from coilmst
//		 where datalength(coil_no) = :li_len
//			and coil_no like :ls_chkcoil;
//	else
//		select max(sheet_no) into :ls_maxcoil from sheetmst
//		 where datalength(sheet_no) = :li_len
//			and sheet_no like :ls_coil;
//	end if
//
//else
//	ls_chkcoil = trim(ls_coil) + "-%"
//	li_len = len(trim(ls_chkcoil))
//	setnull(ls_maxcoil)
//	if mid(ls_item, 4, 1) = "1" then
//		select max(coil_no) into :ls_maxcoil from coilmst
//		 where datalength(coil_no) = :li_len + 1 
//			and coil_no like :ls_chkcoil;
//	else
//		select max(sheet_no) into :ls_maxcoil from sheetmst
//		 where datalength(sheet_no) = :li_len + 1 
//			and sheet_no like :ls_chkcoil;
//	end if
//	if isnull(ls_maxcoil) then
//		if mid(ls_item, 4, 1) = "1" then
//			select max(coil_no) into :ls_maxcoil from coilmst
//			 where datalength(coil_no) = :li_len
//				and coil_no like :ls_chkcoil;
//		else
//			select max(sheet_no) into :ls_maxcoil from sheetmst
//			 where datalength(sheet_no) = :li_len
//				and sheet_no like :ls_chkcoil;
//		end if
//	end if
//end if
//IF isnull(ls_maxcoil) AND len(trim(ls_coil) + "-1") > 20 then
//	ls_maxcoil = ls_coil
//end if
//if isnull(ls_maxcoil) then
//	ls_chkcoil = trim(ls_coil) + "-1"
//else
//	li_start = 0
//	do
//		li_pos = li_start
//		li_start = Pos(ls_maxcoil, "-", li_start + 1)
//	loop until li_start = 0
//	if li_start = 1 then li_pos = 0
//	if isnumber( mid(ls_maxcoil, li_pos + 1, 2)) then
//		do until sqlca.sqlcode = 100
//			ls_chkcoil = left(ls_maxcoil, li_pos) &
//						+ string(integer(mid(ls_maxcoil, li_pos + 1, 2)) + 1)
//			if mid(ls_item, 4, 1) = "1" then
//				select coil_no into :ls_maxcoil from coilmst
//				 where coil_no = :ls_chkcoil
//					and datalength(coil_no) = datalength(:ls_chkcoil);
//			else
//				select sheet_no into :ls_maxcoil from sheetmst
//				 where sheet_no = :ls_chkcoil
//					and datalength(sheet_no) = datalength(:ls_chkcoil);
//			end if
//		loop
//	else
//		do until sqlca.sqlcode = 100
//			ls_chkcoil = left(ls_maxcoil, li_pos) &
//						+ string(integer(mid(ls_maxcoil, li_pos + 1, 1)) + 1)
//			if mid(ls_item, 4, 1) = "1" then
//				select coil_no into :ls_maxcoil from coilmst
//				 where coil_no = :ls_chkcoil
//					and datalength(coil_no) = datalength(:ls_chkcoil);
//			else
//				select sheet_no into :ls_maxcoil from sheetmst
//				 where sheet_no = :ls_chkcoil
//					and datalength(sheet_no) = datalength(:ls_chkcoil);
//			end if
//		loop
//	end if
//end if
//
//return ls_coil
//
end function

public function boolean wf_oc (string arg_lot, string arg_oc);CHOOSE CASE arg_oc
	CASE "M"
		messagebox("확인","이 로트번호[" + trim(arg_lot) + "]은 지금 생산계획중입니다.")
		return false
	CASE "P"
		messagebox("확인","이 로트번호[" + trim(arg_lot) + "]은 지금 작업지시중입니다.")
		return false
	CASE "C"
		messagebox("확인","이 로트번호[" + trim(arg_lot) + "]은 이미 사용이 완료되었습니다")
		return false
	CASE "S"
		messagebox("확인","이 로트번호[" + trim(arg_lot) + "]은 이미 외주로 이동되어있습니다")
		return false
END CHOOSE
return true
end function

public subroutine wf_cleardddw ();tab_1.tabpage_2.dw_4.Modify("coilsubuse_lot_no.edit.case=any")
tab_1.tabpage_2.dw_4.Modify("coilsubuse_lot_no.edit.displayonly=yes")
tab_1.tabpage_2.dw_4.Modify("coilsubuse_lot_no.edit.autoselect=yes")
tab_1.tabpage_2.dw_4.Modify("coilsubuse_lot_no.edit.nilisnull=yes")
return
end subroutine

on w_iocoilsubuse_m.create
int iCurrent
call super::create
this.em_2=create em_2
this.em_1=create em_1
this.st_2=create st_2
this.tab_1=create tab_1
this.pb_1=create pb_1
this.st_22=create st_22
this.dw_area=create dw_area
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_2
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.st_22
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.gb_4
end on

on w_iocoilsubuse_m.destroy
call super::destroy
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.st_22)
destroy(this.dw_area)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

datawindowchild ldwc_supp
string ls_select, ls_where

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.insertrow(1)

dw_1.getchild("supp_no", ldwc_supp)
ldwc_supp.settransobject(sqlca)
ls_select = ldwc_supp.describe("datawindow.table.select")
// 2007/09/14 이명미요청(신준현승인)으로 전체거래처로 변경.
//ls_where = ' where type = "B"'
ls_where  = '' 
ls_select = "datawindow.table.select = '" +ls_select + ls_where + "'"
ldwc_supp.modify(ls_select)
ldwc_supp.retrieve()

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)

dw_2.visible = false
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
tab_1.tabpage_2.em_3.text = string(today(),'yyyy/mm/dd')

end event

event resize;call super::resize;//
gb_2.width   = newwidth  - (32 * 2)

tab_1.width  = newwidth  - (32 * 2)
tab_1.height = newheight - tab_1.y - 32

tab_1.tabpage_1.dw_3.width  = this.width  - 151
tab_1.tabpage_1.dw_3.height = this.height - 744

tab_1.tabpage_2.dw_4.width  = this.width  - 151
tab_1.tabpage_2.dw_4.height = this.height - 744

end event

type pb_save from w_inheritance`pb_save within w_iocoilsubuse_m
integer x = 3191
integer y = 48
end type

event pb_save::clicked;long ll_row, ll_count
string ls_lot

dwItemStatus l_status
dw_1.accepttext()

dw4.accepttext()
for ll_row = 1 to dw4.rowcount()
   l_status = dw4.GetItemStatus(ll_row,0, Primary!)
   if l_status <> NotModified! then
		ls_lot = dw4.object.coilsubuse_lot_no[ll_row]
		if trim(ls_lot) = '' or isnull(ls_lot) then
			messagebox('오류1','코일사용현황의 ' + string(ll_row) + ' 번째 로트번호 오류입니다.',exclamation!)
			return
		end if
		if dw4.object.coilsubuse_cnt[ll_row] > 0 then
			if dw4.getitemnumber(ll_row, 'coilsubuse_cnt', primary!, false)  & 
				> dw4.getitemnumber(ll_row, 'coilsubuse_cnt', primary!, true) then
				messagebox('오류2','코일사용현황의 ' + string(ll_row) + ' 번째 사용수량이 저장수량보다 큽니다.',exclamation!)
				return
			end if
		else
			messagebox('오류3','코일사용현황의 ' + string(ll_row) + ' 번째 사용수량을 입력하십시요.',exclamation!)
			return
		end if
	end if
next

ll_row = dw4.deletedcount()
if ll_row > 0 then
	if wf_dw4delete() = false then
		rollback;
		return
	end if
end if

ll_row = dw4.rowcount()
if ll_row > 0 then
	date ldt_date
	string ls_supp
	int li_seq
	
	ldt_date = date(tab_1.tabpage_2.em_3.text)
	ls_supp = trim(dw_1.object.supp_no[1])
	li_seq = 0
	select max(seq) into :li_seq from coilsubuse
	 where area_no = :gs_area
		and use_date = :ldt_date
		and supp_no = :ls_supp;
	if li_seq > 0 then
		for ll_row = 1 to dw4.rowcount()
		   l_status = dw4.GetItemStatus(ll_row,0, Primary!)
			if l_status = NotModified! then continue
			li_seq = li_seq + 1
			dw4.object.coilsubuse_seq[ll_row] = li_seq
		next
	end if
	if wf_dw4insert() = false then
		rollback;
		return
	end if
end if
wf_update1(dw4,"Y")

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_iocoilsubuse_m
integer x = 55
integer y = 248
integer width = 1440
integer height = 92
string dataobject = "d_iopurrcpt_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_iocoilsubuse_m
integer x = 46
integer y = 48
integer width = 1330
string text = "외주코일 사용관리"
end type

type st_tips from w_inheritance`st_tips within w_iocoilsubuse_m
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilsubuse_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocoilsubuse_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iocoilsubuse_m
integer x = 3383
integer y = 48
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilsubuse_m
boolean visible = false
integer x = 2981
integer y = 48
end type

type pb_cancel from w_inheritance`pb_cancel within w_iocoilsubuse_m
integer x = 2802
integer y = 48
end type

event pb_cancel::clicked;tab_1.selecttab(1)
dw3.reset()
dw4.reset()


end event

type pb_delete from w_inheritance`pb_delete within w_iocoilsubuse_m
integer x = 2610
integer y = 48
integer taborder = 150
end type

event pb_delete::clicked;long ll_row


dw4.accepttext()
choose case tab_1.SelectedTab
	case 1
		
	case 2
		ll_row = dw4.getrow()
		if ll_row < 1 then return
		
		dw4.rowsmove(ll_row, ll_row, Primary!, dw4 , 1, Delete!)
end choose
end event

type pb_insert from w_inheritance`pb_insert within w_iocoilsubuse_m
boolean visible = false
integer x = 2405
integer y = 48
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilsubuse_m
integer x = 2418
integer y = 48
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp, ls_area
datawindow ret_dw

if tab_1.selectedtab = 1 then
	ret_dw = dw3
else
	ret_dw = dw4
end if

dw_1.accepttext()
ls_supp = dw_1.object.supp_no[1]

dw_area.accepttext()
ls_area = dw_area.object.area[1]

if ret_dw.retrieve( ls_area, ls_supp, date(em_1.text), date(em_2.text) ) < 1 then
	messagebox('확인','해당기간에는 자료가 없읍니다.',information!)
end if


end event

type gb_3 from w_inheritance`gb_3 within w_iocoilsubuse_m
boolean visible = false
integer x = 1906
integer y = 0
integer width = 69
integer height = 92
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilsubuse_m
integer y = 216
integer width = 3566
integer height = 132
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilsubuse_m
integer x = 2386
integer y = 8
integer width = 1211
end type

type dw_2 from w_inheritance`dw_2 within w_iocoilsubuse_m
integer x = 1211
integer y = 0
integer width = 146
integer height = 100
boolean vscrollbar = false
boolean livescroll = false
end type

type em_2 from editmask within w_iocoilsubuse_m
integer x = 2382
integer y = 256
integer width = 384
integer height = 72
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
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

end event

type em_1 from editmask within w_iocoilsubuse_m
integer x = 1989
integer y = 256
integer width = 384
integer height = 72
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
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

end event

type st_2 from statictext within w_iocoilsubuse_m
integer x = 1678
integer y = 268
integer width = 306
integer height = 52
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
string text = "조회일자:"
alignment alignment = center!
boolean focusrectangle = false
end type

type tab_1 from tab within w_iocoilsubuse_m
integer x = 32
integer y = 364
integer width = 3561
integer height = 1680
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean raggedright = true
alignment alignment = right!
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
integer width = 3525
integer height = 1552
long backcolor = 79741120
string text = "입고현황조회"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Search!"
long picturemaskcolor = 553648127
dw_3 dw_3
cb_1 cb_1
end type

on tabpage_1.create
this.dw_3=create dw_3
this.cb_1=create cb_1
this.Control[]={this.dw_3,&
this.cb_1}
end on

on tabpage_1.destroy
destroy(this.dw_3)
destroy(this.cb_1)
end on

type dw_3 from datawindow within tabpage_1
integer y = 120
integer width = 3520
integer height = 1436
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_iocoilsubuse_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long ll_row, ll_cnt

if this.rowcount() < 1 then return
//ll_row = this.getrow()
ll_row = row
if ll_row = 0 then
	For ll_cnt = 1 to ll_row
		this.SelectRow(ll_row, NOT this.IsSelected(ll_cnt))
	next
else
	this.SelectRow(ll_row, NOT this.IsSelected(ll_row))
end if

end event

type cb_1 from commandbutton within tabpage_1
integer x = 1733
integer y = 16
integer width = 576
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "사용현황으로 ==>"
end type

event clicked;long ll_rowcount, ll_rowcount1, ll_cnt, ll_count, ll_row, ll_dw1rowcount
string ls_loc, ls_qa, ls_null


dw3.accepttext()
dw4.accepttext()
dw3.accepttext()
ll_rowcount = dw3.rowcount()
ll_rowcount1 = dw4.rowcount()

if ll_rowcount < 1 then return

ls_loc = trim(dw_1.object.supp_no[1])

ll_count = 0
for ll_cnt = 1 to ll_rowcount
	if dw3.isselected(ll_cnt) then
      ll_count ++
	end if
next
if ll_count = 0 then
	messagebox('오류','작성할 항목을 선택하십시요.',exclamation!)
	return
end if
setnull(ls_null)
dw4.reset()
dw4.setredraw(false)
for ll_cnt = 1 to ll_rowcount
	if dw3.isselected(ll_cnt) then
		ll_row = dw4.insertrow(0)
		
		dw4.object.coilsubuse_area_no[ll_row]  = gs_area
		dw4.object.coilsubuse_insp_no[ll_row]  = dw3.object.inspdet_insp_no[ll_cnt]
		dw4.object.coilsubuse_supp_no[ll_row] = ls_loc
		dw4.object.coilsubuse_use_date[ll_row] = date(tab_1.tabpage_2.em_3.text)
		dw4.object.coilsubuse_seq[ll_row] = ll_row
		dw4.object.coilsubuse_item_no[ll_row]  = dw3.object.inspdet_item_no[ll_cnt]
		dw4.object.coilsubuse_qa[ll_row]  = dw3.object.inspdet_qa[ll_cnt]
		dw4.object.coilsubuse_uom[ll_row]  = dw3.object.inspdet_uom[ll_cnt]   
		dw4.object.coilsubuse_loc_no[ll_row] = ls_loc
		dw4.object.coilsubuse_lot_no[ll_row] = ls_null
		dw4.object.coilsubuse_unit_qty[ll_row] = 0
		dw4.object.coilsubuse_cnt[ll_row] = 1
		dw4.object.coilsubuse_rem_qty[ll_row] = 0
		dw4.object.coilsubuse_rem_len[ll_row] = 0
		dw4.object.coilsubuse_rem_lot[ll_row] = ls_null
		dw4.object.coilsubuse_coil_type[ll_row] = 'C'
		dw4.object.coilsubuse_insp_seq[ll_row]  = dw3.object.inspdet_oi_no[ll_cnt]
		dw4.object.groupitem_item_name[ll_row]  = dw3.object.groupitem_item_name[ll_cnt]
	end if
next
dw4.setredraw(true)

messagebox('확인','사용내역을 작성하였습니다.',information!)
dw3.selectrow(0,false)
wf_cleardddw()
tab_1.selecttab(2)

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 1552
long backcolor = 79741120
string text = "코일사용현황"
long tabtextcolor = 8388608
long tabbackcolor = 79741120
string picturename = "DataPipeline!"
long picturemaskcolor = 553648127
rb_2 rb_2
rb_1 rb_1
cb_2 cb_2
dw_4 dw_4
em_3 em_3
st_3 st_3
end type

on tabpage_2.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_2=create cb_2
this.dw_4=create dw_4
this.em_3=create em_3
this.st_3=create st_3
this.Control[]={this.rb_2,&
this.rb_1,&
this.cb_2,&
this.dw_4,&
this.em_3,&
this.st_3}
end on

on tabpage_2.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_2)
destroy(this.dw_4)
destroy(this.em_3)
destroy(this.st_3)
end on

type rb_2 from radiobutton within tabpage_2
integer x = 1504
integer y = 32
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "SHEET"
end type

event clicked;string ls_loc

dw_1.accepttext()
ls_loc = trim(dw_1.object.supp_no[1])
dw_4.object.coilsubuse_rem_len.protect = 1
dw_4.object.coilsubuse_rem_qty.protect = 1

wf_sheetdddw(ls_loc )

end event

type rb_1 from radiobutton within tabpage_2
integer x = 1175
integer y = 32
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "COIL"
boolean checked = true
end type

event clicked;string ls_loc

dw_1.accepttext()
ls_loc = trim(dw_1.object.supp_no[1])
dw_4.object.coilsubuse_rem_len.protect = 0
dw_4.object.coilsubuse_rem_qty.protect = 0

wf_coildddw(ls_loc )

end event

type cb_2 from commandbutton within tabpage_2
integer x = 2665
integer y = 12
integer width = 457
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;dw_4.accepttext()
IF DW_4.ROWCOUNT() < 1 THEN RETURN

long ll_row

ll_row = dw_4.getrow()

dw_4.rowscopy(ll_row, ll_row, Primary!, dw_4, dw_4.rowcount(), Primary!)
dw_4.object.coilsubuse_seq[dw_4.rowcount()] = dw_4.rowcount() + 1

end event

type dw_4 from datawindow within tabpage_2
integer y = 120
integer width = 3520
integer height = 1436
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_iocoilsubuse_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string ls_item, ls_uom, ls_name
long   ll_row
datawindowchild ldwc_lot

this.accepttext()

ll_row = this.getrow()
choose case dwo.name
	case 'coilsubuse_lot_no'
		this.getchild('coilsubuse_lot_no',ldwc_lot)
		if ldwc_lot.rowcount() > 0 then
			this.object.coilsubuse_item_no[ll_row] = trim(ldwc_lot.getitemstring(ldwc_lot.getrow(),'item_no'))
			this.object.coilsubuse_qa[ll_row] = trim(ldwc_lot.getitemstring(ldwc_lot.getrow(),'qa'))
			this.object.coilsubuse_unit_qty[ll_row] = ldwc_lot.getitemnumber(ldwc_lot.getrow(),'unit_qty')
			this.object.coilsubuse_cnt[ll_row] = 0
			this.object.qcnt[ll_row] = ldwc_lot.getitemnumber(ldwc_lot.getrow(),'qcnt')
			ls_item = trim(ldwc_lot.getitemstring(ldwc_lot.getrow(),'item_no'))
			if rb_1.checked = true then
				this.object.etc_no[ll_row] = ldwc_lot.getitemstring(ldwc_lot.getrow(),'coilmst_etc_no')
			else
			end if
			
			select item_name, uom into :ls_name, :ls_uom from groupitem
			 where item_no = :ls_item;
			this.object.groupitem_item_name[ll_row] = ls_name
			this.object.coilsubuse_uom[ll_row] = ls_uom
//			this.object.coilsubuse_rem_lot[ll_row] = wf_coil(ll_row)
		end if
end choose

return 0

end event

event losefocus;this.accepttext()
end event

type em_3 from editmask within tabpage_2
integer x = 411
integer y = 16
integer width = 457
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
dwItemStatus l_status
long ll_row

dw4.accepttext()

for ll_row = 1 to dw4.rowcount()
	l_status = dw4.GetItemStatus(ll_row, 0, Primary! )
	if l_status = new! or l_status = newmodified! then
		dw4.object.coilsubuse_use_date[ll_row] = date(this.text)
	end if
next

end event

event modified;dwItemStatus l_status
long ll_row

dw4.accepttext()

for ll_row = 1 to dw4.rowcount()
	l_status = dw4.GetItemStatus(ll_row, 0, Primary! )
	if l_status = new! or l_status = newmodified! then
		dw4.object.coilsubuse_use_date[ll_row] = date(this.text)
	end if
next
dw4.accepttext()
end event

type st_3 from statictext within tabpage_2
integer x = 23
integer y = 24
integer width = 384
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "사용일자 :"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_iocoilsubuse_m
event mousemove pbm_mousemove
integer x = 2994
integer y = 48
integer width = 187
integer height = 144
integer taborder = 120
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

if tab_1.selectedtab = 1 then
	dwxls  = tab_1.tabpage_1.dw_3
else
	dwxls  = tab_1.tabpage_2.dw_4
end if	

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_22 from statictext within w_iocoilsubuse_m
integer x = 1806
integer y = 40
integer width = 521
integer height = 72
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_iocoilsubuse_m
integer x = 1806
integer y = 116
integer width = 526
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type gb_4 from groupbox within w_iocoilsubuse_m
integer x = 1778
integer y = 8
integer width = 581
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

