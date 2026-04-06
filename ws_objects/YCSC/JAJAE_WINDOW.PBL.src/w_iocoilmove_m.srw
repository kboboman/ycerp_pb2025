$PBExportHeader$w_iocoilmove_m.srw
$PBExportComments$코일이동관리(2001/05/07, 이인호)
forward
global type w_iocoilmove_m from w_inheritance
end type
type dw_3 from datawindow within w_iocoilmove_m
end type
type dw_4 from datawindow within w_iocoilmove_m
end type
type dw_5 from datawindow within w_iocoilmove_m
end type
type em_2 from editmask within w_iocoilmove_m
end type
type em_1 from editmask within w_iocoilmove_m
end type
type st_2 from statictext within w_iocoilmove_m
end type
type st_1 from statictext within w_iocoilmove_m
end type
type cbx_1 from checkbox within w_iocoilmove_m
end type
type rb_a4 from radiobutton within w_iocoilmove_m
end type
type rb_a5 from radiobutton within w_iocoilmove_m
end type
type cbx_2 from checkbox within w_iocoilmove_m
end type
type gb_4 from groupbox within w_iocoilmove_m
end type
type gb_5 from groupbox within w_iocoilmove_m
end type
end forward

global type w_iocoilmove_m from w_inheritance
integer width = 4649
integer height = 2816
string title = "코일이동관리(w_iocoilmove_m)"
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
em_2 em_2
em_1 em_1
st_2 st_2
st_1 st_1
cbx_1 cbx_1
rb_a4 rb_a4
rb_a5 rb_a5
cbx_2 cbx_2
gb_4 gb_4
gb_5 gb_5
end type
global w_iocoilmove_m w_iocoilmove_m

type variables
datawindowchild idwc_item,idwc_qa,idwc_coil
string is_select
date id_start, id_end
string is_select1,is_where1,is_clause1, is_select2, is_clause2

end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
public subroutine wf_coildddw (string as_item, string as_qa, string as_loc)
public subroutine wf_sheetdddw (string as_item, string as_loc)
public subroutine wf_cleardddw ()
public function boolean wf_coilchk (string as_coil, long al_row)
end prototypes

public subroutine wf_print (datawindow arg_dw);w_repsuper w_print
st_print   l_print

string ls_orderno, ls_dr, ls_tarea, ls_tname, ls_farea, ls_fname, ls_item_no, ls_real_uom
string ls_uom,   ls_qa,  ls_rem, ls_item_name, ls_move_qty, ls_acc_qty, ls_act_user,ls_ask_user
long   ll_count, ll_idx, ll_int
string ls_chk,   ls_cnt

dw_2.accepttext()
ls_orderno = dw_2.object.move_no[1]	
//ls_dr = trim(dw_2.object.driver[1])
ll_idx = 0
ll_int = 0
arg_dw.reset()

ls_farea = dw_2.object.src_loc[1]
select loc_name into :ls_fname from location
 where loc_no = :ls_farea;
 
ls_tarea = dw_2.object.tar_loc[1]
select loc_name into :ls_tname from location
 where loc_no = :ls_tarea;
 
//ls_farea = dw_2.object.act_user[1]
//select user_name into :ls_act_user from login
// where user_id = :ls_farea;
 
ls_farea = dw_2.object.log_id[1]
select user_name into :ls_ask_user from login
 where user_id = :ls_farea;
		 
ls_chk = "N"
for ll_count = 1 to dw_3.rowcount()
	if  dw_3.object.move_qty[ll_count] <= 0 then continue
	ls_chk = "Y"
	if ll_idx = 0 then
		ll_int = ll_int + 1
	   arg_dw.object.do_date[ll_int] = string(dw_2.object.move_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int] = dw_2.object.move_no[1]
 	   arg_dw.object.addr[ll_int] = trim(ls_fname) + " 에서 " + trim(ls_tname) + " 으로 이동"
		 
      arg_dw.object.ls_user[ll_int] = ls_act_user

//    arg_dw.object.cust[ll_int] = ls_ask_user
//   	arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	
	ll_idx = ll_idx + 1
	ls_item_no = dw_3.object.item_no[ll_count]
	setnull(ls_uom)
	select uom into :ls_uom from groupitem 
	 where item_no = :ls_item_no;
	 
	ls_qa = dw_3.object.qa[ll_count]
	ls_cnt = string(dw_3.object.cnt[ll_count], '###,###')
	ls_rem = dw_3.object.rem[ll_count]
	
	setnull(ls_item_name)
   SELECT item_name INTO :ls_item_name FROM item
	   WHERE item_no = :ls_item_no
		  AND qa = :ls_qa;
	ls_move_qty = string(dw_3.object.move_qty[ll_count], '###,###,###.00')
	
	if LeftA( ls_item_no ,1) = 'P' and MidA(ls_item_no, 3,1) = 'Y' &
		and (MidA(ls_item_no, 7,1) = 'A' 	or MidA(ls_item_no, 7,1) = 'B' &
				or MidA(ls_item_no, 7,1) = 'C' or MidA(ls_item_no, 7,1) = 'D') then
		ls_acc_qty = string(dw_3.object.move_qty[ll_count] * dw_3.object.cnt[ll_count], '###,###,###.00') 
	else
		if ls_uom = 'M2' or ls_uom = "SS" then
			ls_acc_qty = string(truncate( long(MidA( ls_qa ,5,4)) &
					* long(MidA(ls_qa,10,4)) &
						* dw_3.object.move_qty[ll_count] * dw_3.object.cnt[ll_count] &
							/ 1000000 + 0.000000001, 2), '###,###,###.00')
		else
			if ls_uom = 'M' then
				if  dw_3.object.move_qty[ll_count] < 0 then
					ls_acc_qty = string(truncate(long(MidA(  ls_qa , 15,5)) *  &
					dw_3.object.move_qty[ll_count] * dw_3.object.cnt[ll_count] &
									/ 1000 - 0.00001,2), '###,###,###.00')
				else
					ls_acc_qty = string(truncate(long(MidA(  ls_qa , 15,5)) &
						*  dw_3.object.move_qty[ll_count] * dw_3.object.cnt[ll_count] &
						/ 1000 + 0.00001,2) , '###,###,###.00')
				end if
			else
				ls_acc_qty = string(dw_3.object.move_qty[ll_count] * dw_3.object.cnt[ll_count], '###,###,###.00') 
			end if
		end if
	end if

	IF trim(ls_uom) = 'M' OR ls_uom = 'M2' then
   	ls_real_uom ='EA'
	ELSE
		if ls_uom = "SS" then
			ls_real_uom = "SH"
			ls_uom = "M2"
		else
	     	ls_real_uom = ls_uom
		end if
	end if

////////////////////////// insert easthero end
	ls_qa = MidA(dw_3.object.qa[ll_count], 1, 3) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 5, 4) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 10, 4) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 15, 5)
			  
	arg_dw.setitem(ll_int, 'item_' + string(ll_idx), ls_item_name)
	arg_dw.setitem(ll_int, 'qa_'   + string(ll_idx), ls_qa)
	arg_dw.setitem(ll_int, 'auom_' + string(ll_idx), ls_uom)
	arg_dw.setitem(ll_int, 'ship_' + string(ll_idx), ls_move_qty)
	arg_dw.setitem(ll_int, 'buom_' + string(ll_idx), ls_cnt)
	arg_dw.setitem(ll_int, 'acc_'  + string(ll_idx), ls_acc_qty)
//	arg_dw.setitem(ll_int, 'cost_' + string(ll_idx), ls_price)
//	arg_dw.setitem(ll_int, 'price_'+ string(ll_idx), ls_amount)
//	arg_dw.setitem(ll_int, 'rate_' + string(ll_idx), ls_rate_cash)
//	arg_dw.setitem(ll_int, 'pdate' + string(ll_idx), DATE(ld_date))
//	arg_dw.setitem(ll_int, 'desc'  + string(ll_idx), ls_desc)

	if rb_a4.checked = true then
		if ll_idx = 25 then
			arg_dw.object.dr_man[ll_int] = ls_dr
			ll_idx = 0
		end if
	else
		if ll_idx = 16 then
			arg_dw.object.dr_man[ll_int] = ls_dr
			ll_idx = 0
		end if
	end if

next
if ls_chk = "N" then return
arg_dw.object.dr_man[ll_int] = ls_dr

end subroutine

public subroutine wf_coildddw (string as_item, string as_qa, string as_loc);string  ls_where, ls_clause, ls_select, ls_qa
datawindowchild ldwc_lot

dw_3.Modify("lot_no.dddw.Name='d_cdcoil_os_c'")
dw_3.Modify("lot_no.dddw.allowedit=no")
dw_3.Modify("lot_no.dddw.displayColumn='coil_no'")
dw_3.Modify("lot_no.dddw.DataColumn='coil_no'")
dw_3.Modify("lot_no.dddw.percentwidth='530'")
dw_3.Modify("lot_no.dddw.vscrollbar=yes")

dw_3.getchild('lot_no',ldwc_lot)
ldwc_lot.settransobject(sqlca)

ls_select = ldwc_lot.Describe("DataWindow.Table.Select")

ls_qa = "%" + MidA(as_qa, 4,7) + "%"
ls_where = " and item_no = ~~'" + as_item + "~~'"   &
			 + " and qa like ~~'" + ls_qa + "~~'" &
			 + " and coilmst.loc_no like ~~'" + as_loc + "~~'"

ls_clause = "DataWindow.Table.Select='"  + ls_select + ls_where + "'"
ldwc_lot.modify(ls_clause)
if ldwc_lot.retrieve() > 0 then
	ldwc_lot.SetSort("unit_qty , coil_no")
	ldwc_lot.Sort( )
end if

return
end subroutine

public subroutine wf_sheetdddw (string as_item, string as_loc);string  ls_where, ls_clause, ls_select
datawindowchild ldwc_lot

dw_3.Modify("lot_no.dddw.Name='d_cdsheet_os_c'")
dw_3.Modify("lot_no.dddw.allowedit=no")

dw_3.Modify("lot_no.dddw.displayColumn='sheet_no'")
dw_3.Modify("lot_no.dddw.DataColumn='sheet_no'")
dw_3.Modify("lot_no.dddw.percentwidth='450'")
dw_3.Modify("lot_no.dddw.vscrollbar=yes")

dw_3.getchild('lot_no',ldwc_lot)
ldwc_lot.settransobject(sqlca)
ls_select = ldwc_lot.Describe("DataWindow.Table.Select")

ls_where = ' and item_no = ~~"' + as_item + '~~" ' &
				+ ' and sheetmst.loc_no = ~~"' + as_loc + '~~" '
ls_clause = "DataWindow.Table.Select='"  + ls_select + ls_where + "'"
ldwc_lot.modify(ls_clause)
if ldwc_lot.retrieve() > 0 then
	ldwc_lot.SetSort("qa , sheet_no")
	ldwc_lot.Sort( )
end if
return

end subroutine

public subroutine wf_cleardddw ();
dw_3.Modify("lot_no.edit.case=any")
dw_3.Modify("lot_no.edit.autoselect=yes")
dw_3.Modify("lot_no.edit.nilisnull=yes")

return
end subroutine

public function boolean wf_coilchk (string as_coil, long al_row);dw_3.accepttext()
long ll_row
for ll_row = 1 to dw_3.rowcount()
	if ll_row <> al_row and as_coil = dw_3.object.lot_no[ll_row] then
		messagebox("확인", "이미 등록된 로트번호입니다")
		return false
	end if
next

return true
end function

on w_iocoilmove_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.em_2=create em_2
this.em_1=create em_1
this.st_2=create st_2
this.st_1=create st_1
this.cbx_1=create cbx_1
this.rb_a4=create rb_a4
this.rb_a5=create rb_a5
this.cbx_2=create cbx_2
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.rb_a4
this.Control[iCurrent+10]=this.rb_a5
this.Control[iCurrent+11]=this.cbx_2
this.Control[iCurrent+12]=this.gb_4
this.Control[iCurrent+13]=this.gb_5
end on

on w_iocoilmove_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.rb_a4)
destroy(this.rb_a5)
destroy(this.cbx_2)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.visible = false
dw_5.visible = false

dw_3.getchild("item_no", idwc_item)
//gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_3.getchild('lot_no',idwc_coil)
idwc_coil.insertrow(1)
idwc_coil.settransobject(sqlca)
is_select = idwc_coil.Describe("DataWindow.Table.Select")
dw_3.settransobject(sqlca)

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
id_start  = date(em_1.text)
id_end    = date(em_2.text)


if gf_permission("코일이동_관리", gs_userid) = "Y" then	
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	pb_print_part.enabled = false		// 행삭제
	pb_compute.enabled    = false		// 행추가
	dw_2.object.flag.tabsequence = 0
end if

end event

event resize;call super::resize;dw_3.width  = this.width  - 110
dw_3.height = this.height - 1276

end event

type pb_save from w_inheritance`pb_save within w_iocoilmove_m
integer x = 4155
end type

event pb_save::clicked;long   ll_row, ll_move_cnt, ll_qcnt, ll_count, ll_unit_qty, ll_cnt
string ls_srcloc, ls_tarloc, ls_qa, ls_oc
string ls_move_no, ls_seq, ls_area, ls_move_date, ls_move_no1, ls_coil, ls_item
string ls_old_time
int    li_seq
decimal  lr_move_qty
datetime ldt_date
dwItemStatus l_status

dw_2.accepttext()
dw_3.accepttext()
if dw_2.rowcount() < 1 then return
if dw_3.rowcount() < 1 then return

ls_srcloc = trim(dw_2.object.src_loc[1])
if ls_srcloc = "" or isnull(ls_srcloc) then
	messagebox('오류','출고지를 선택하십시오.',exclamation!)
	return
end if

ls_tarloc = trim(dw_2.object.tar_loc[1])
if ls_tarloc = "" or isnull(ls_tarloc) then
	messagebox('오류','도착지를 선택하십시오.',exclamation!)
	return
end if

l_status = dw_2.getitemstatus(1, 0, primary!)
if dw_3.rowcount() < 1 then
	messagebox("저장","등록된 물품이 없습니다!",exclamation!)
	return
end if

ldt_date    = dw_2.object.move_date[1]
ls_old_time = string(now(),'hh:mm:ss:fff')

if l_status = New! or l_status = NewModified! then
	if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 1 then
		setpointer(hourglass!)
		for ll_row = 1 to dw_3.rowcount()
			lr_move_qty = dw_3.getitemdecimal(ll_row, "move_qty")
			if lr_move_qty = 0 then
				messagebox("확인","이동수량을 입력하세요!",exclamation!)
				dw_3.scrolltorow(ll_row)
				dw_3.setcolumn("move_qty")
				dw_3.setfocus()
				return
			end if
			ll_move_cnt = dw_3.getitemdecimal(ll_row, "cnt")
			if ll_move_cnt = 0 then
				messagebox("확인","이동갯수를 입력하세요!",exclamation!)
				dw_3.scrolltorow(ll_row)
				dw_3.setcolumn("cnt")
				dw_3.setfocus()
				return
			end if
			if dw_3.object.qa[ll_row] = '' or isnull(dw_3.object.qa[ll_row]) then
				messagebox("확인","규격을 입력하세요!",exclamation!)
				dw_3.scrolltorow(ll_row)			
				dw_3.setcolumn("qa")
				dw_3.setfocus()
				return
			end if
			if dw_3.object.lot_no[ll_row] = '' or isnull(dw_3.object.lot_no[ll_row]) then
				messagebox("확인","로트번호를 선택하세요!",exclamation!)
				dw_3.scrolltorow(ll_row)			
				dw_3.setcolumn("lot_no")
				dw_3.setfocus()
				return
			end if
		next

		//대내송장 번호 부여
		ls_area = LeftA(gs_area, 1)
		IF trim(dw_2.object.move_no[1]) = '' OR isnull(dw_2.object.move_no[1]) then
		   ls_move_date = string(dw_2.object.move_date[1], "yyyymmdd")
	   	ls_move_no1  = ls_area + 'M' + ls_move_date + '-' + '%'			
			
		   SELECT MAX(move_no) INTO :ls_move_no FROM itemmove WHERE move_no LIKE :ls_move_no1;		
		   if isnull(ls_move_no) or ls_move_no = '' then
			   ls_move_no1 = ls_area + 'M' +  ls_move_date + '-' + '01'
	   	else
		   	li_seq      = integer(MidA(ls_move_no, 12, 2))
			   li_seq      = li_seq + 1
	   		ls_seq      = '00' + trim(string(li_seq))
		   	ls_move_no1 = LeftA(ls_move_no1, 11)  + RightA(ls_seq, 2)
	   	end if
		else
			setnull(ls_move_no)
	      ls_move_no1 = dw_2.object.move_no[1]		
		   SELECT move_no INTO :ls_move_no FROM itemmove WHERE move_no = :ls_move_no1;		
	   	IF trim(ls_move_no) = '' OR isnull(ls_move_no) then
	      else
				dw_2.object.move_no[1] = ls_move_no1
				messagebox("저장","이동번호가 이미 존재합니다.", exclamation!)
				return
			end if
		end if
		dw_2.object.move_no[1]  = ls_move_no1
		dw_2.object.log_date[1] = gf_today()
		
		if wf_nullchk(dw_2) = false then return
		if wf_nullchk(dw_3) = false then return
		dw_2.accepttext()
		dw_3.accepttext()
		
		//이동수량 입력 CHECK
		
		for ll_row = 1 to dw_3.rowcount()
			dw_3.object.move_no[ll_row] = ls_move_no1
			ls_item     = dw_3.object.item_no[ll_row]
			ls_qa       = dw_3.object.qa[ll_row]
			ls_coil     = dw_3.object.lot_no[ll_row]
			ll_move_cnt = dw_3.object.cnt[ll_row]
			ll_qcnt     = dw_3.object.qcnt[ll_row]
			li_seq      = dw_3.object.seq[ll_row]
			ll_unit_qty = dw_3.object.move_qty[ll_row]
			if MidA(ls_item, 4, 1) = "1" then // coil
				setnull(ls_oc)
				select open_close into :ls_oc from coilmst where coil_no = :ls_coil and loc_no = :ls_srcloc;
				if sqlca.sqlcode <> 0 then
					messagebox('update오류1',"[coilmst]select 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					rollback;
					return
				end if
				
				update coilmst 
				   set qcnt = qcnt - :ll_move_cnt
					  , unit_qty = :ll_unit_qty
					  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
				 where coil_no = :ls_coil	and loc_no = :ls_srcloc and open_close <> 'C';

				if sqlca.sqlcode <> 0 then
					messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					rollback;
					return
				end if
				
				select count(*) into :ll_cnt from coilmst where coil_no = :ls_coil and loc_no = :ls_tarloc;
				if ll_cnt > 0 then
					update coilmst 
					   set qcnt = qcnt + :ll_move_cnt
						  , unit_qty = :ll_unit_qty
						  , open_close = (case when open_close = 'C' then 'O' else open_close end)
					 where coil_no = :ls_coil and loc_no = :ls_tarloc;
					if sqlca.sqlcode <> 0 then
						messagebox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
						rollback;
						return
					end if
					
				else
				   INSERT INTO coilmst ( coil_no, wid, item_no, qa,   loc_no,   rcpt_date,   unit_qty,   length,
					 	                   cnt,   qcnt,  color_no,   supp_no,   flag,   porder_no,   pseq_no,   
						                   open_close,   rem,   rcpt_qty,   rcpt_len, etc_no, pcoil_no )  
					SELECT coil_no,  wid,  item_no,  qa, :ls_tarloc, getdate(), unit_qty,  length,   
						    :ll_move_cnt, :ll_move_cnt, color_no,   supp_no, flag, porder_no, pseq_no,   
						    :ls_oc, "코일이동",   rcpt_qty,   rcpt_len  , etc_no, pcoil_no
					  FROM coilmst 
					 where coil_no = :ls_coil and loc_no = :ls_srcloc;
					if sqlca.sqlcode <> 0 then
						messagebox('INSERT오류3',"[coilmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
						rollback;
						return
					end if
				end if
				lr_move_qty = ll_unit_qty * ll_move_cnt
				
			elseif MidA(ls_item, 4, 1) = "2" then  // sheet
				update sheetmst 
				   set qcnt = qcnt - :ll_move_cnt
					  , unit_qty = :ll_unit_qty
					  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
				 where sheet_no = :ls_coil	and loc_no = :ls_srcloc;
				if sqlca.sqlcode <> 0 then
					messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
					rollback;
					return
				end if
				
				select count(*) into :ll_cnt from sheetmst where sheet_no = :ls_coil and loc_no = :ls_tarloc;
				if ll_cnt > 0 then
					update sheetmst 
					   set qcnt = qcnt + :ll_move_cnt
						  , unit_qty = :ll_unit_qty
						  , open_close = 'O'
					 where sheet_no = :ls_coil	and loc_no = :ls_tarloc;
					if sqlca.sqlcode <> 0 then
						messagebox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
						rollback;
						return
					end if
					
				else
					INSERT INTO sheetmst ( sheet_no,   loc_no,   item_no,   qa,   rcpt_date,   unit_qty,   
						                    cnt,   qcnt,   color_no,   supp_no,   flag,   porder_no,  
						                    pseq_no,   open_close,   rem,   rcpt_qty )  
				   SELECT sheet_no,   :ls_tarloc,   item_no,   qa,    getdate(),   unit_qty, 
					       :ll_move_cnt,  :ll_move_cnt,   color_no,   supp_no,   flag,   porder_no,  
						    pseq_no,   'O',   "코일이동",   rcpt_qty  
					  FROM sheetmst 
					 where sheet_no = :ls_coil and loc_no = :ls_srcloc;

					if sqlca.sqlcode <> 0 then
						messagebox('INSERT오류2',"[sheetmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
						rollback;
						return
					end if
				end if
				lr_move_qty = ll_move_cnt
			end if
			
			// inaudit 이동 처리(출고)
			// [IL]외주출고 로직입니다.
			for ll_count = 1 to 100000
				IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
					ls_old_time  = string(now(),'hh:mm:ss:fff')	
					exit
				END IF	
			NEXT		
			
			insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
				                  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
			values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no1,
				     0, :lr_move_qty, 0, :ls_tarloc, :ls_coil, "COILMOVE", :ll_unit_qty,  :ll_move_cnt, :li_seq, :gs_userid);
			if sqlca.sqlcode < 0 then
				rollback;
				messagebox('오류16','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
				return
			end if	
			
			// inaudit 이동 처리(입고)
			// [RL]외주저장소입고 로직입니다.		
			for ll_count = 1 to 100000
				IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
					ls_old_time  = string(now(),'hh:mm:ss:fff')	
					exit
				END IF	
			NEXT		
			
			insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
				                  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
			values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no1,
				     :lr_move_qty, 0, 0, :ls_srcloc, :ls_coil, "COILMOVE", :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
			if sqlca.sqlcode < 0 then
				rollback;
				messagebox('오류17','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
				return
			end if	
		next
	else
		return
	end if
end if

if wf_update2(dw_2, dw_3, 'Y') = true then
	em_1.text = string(dw_2.object.move_date[1], "yyyy/mm/dd")
	em_2.text = string(dw_2.object.move_date[1], "yyyy/mm/dd")
	id_start  = date(em_1.text)
	id_end    = date(em_2.text)
	pb_retrieve.triggerevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_iocoilmove_m
integer x = 32
integer y = 236
integer width = 1952
integer height = 872
integer taborder = 70
string dataobject = "d_iolocmove_s"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;string ls_moveno
long   ll_row

ll_row = this.getrow()
if ll_row < 1 then return

ls_moveno = this.object.move_no[ll_row]
if this.object.flag[ll_row] = "M" then			// 사내: M, 외주: S
	if gf_permission("코일이동_관리", gs_userid) = "Y" then	
	else
		pb_delete.enabled = false
		pb_save.enabled   = false
		pb_print_part.enabled = false	// 행삭제
	end if
else
	pb_delete.enabled = true
	pb_save.enabled   = true
	pb_print_part.enabled = true		// 행삭제
end if

dw_2.retrieve(ls_moveno)
dw_3.retrieve(ls_moveno)

end event

type dw_2 from w_inheritance`dw_2 within w_iocoilmove_m
integer x = 2075
integer y = 312
integer width = 1513
integer height = 740
integer taborder = 80
string dataobject = "d_iolocmove_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemerror;string ls_data
long ll_row

ll_row = this.getrow()
setnull(ls_data)
CHOOSE CASE dwo.name
	CASE 'tar_loc'
		this.object.tar_loc[ll_row] = ls_data
		this.setcolumn('tar_loc')
		this.setfocus()
END CHOOSE



return 2
end event

event dw_2::itemchanged;string ls_data
long ll_row

this.accepttext()
ll_row = this.getrow()
setnull(ls_data)
CHOOSE CASE dwo.name
	CASE 'tar_loc'
		if data = this.object.src_loc[ll_row] then
			messagebox("확인","출고저장소와 같을수 없습니다.")
			return 1
		end if
END CHOOSE



return 0
end event

type st_title from w_inheritance`st_title within w_iocoilmove_m
integer x = 69
integer y = 32
integer width = 1157
integer height = 136
string text = "코일이동 관리"
end type

type st_tips from w_inheritance`st_tips within w_iocoilmove_m
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilmove_m
integer x = 4274
integer y = 1004
integer width = 142
integer height = 112
integer taborder = 130
string picturename = "c:\bmp\pencil.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"상세추가",parent, li_x, li_y)
end event

event pb_compute::clicked;long ll_row
string ls_loc,ls_destination
dwItemStatus l_status

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

if isnull(dw_2.object.flag[1]) then
	messagebox("확인","이동유형을 선택하십시요.")
	dw_2.setcolumn('flag')
	dw_2.setfocus( )
	return
end if	
l_status = dw_2.getitemstatus(1, 0, primary!)

if l_status = New! or l_status = NewModified! then
else
	messagebox("확인","발행된 송장에는 추가하실수 없습니다.")
	return
end if

if dw_2.object.src_loc[1] = '' or isnull(dw_2.object.src_loc[1]) then
	beep(1)
	dw_2.setcolumn('src_loc')
	dw_2.setfocus()
	return
elseif dw_2.object.tar_loc[1] = '' or isnull(dw_2.object.tar_loc[1]) then
	beep(1)
	dw_2.setcolumn('tar_loc')
	dw_2.setfocus()
	return
end if
dw_3.accepttext()
dw_3.setredraw(false)
ll_row = dw_3.insertrow(0)
if ll_row > 1 then
	dw_3.object.seq[ll_row] = dw_3.object.seq[ll_row - 1] + 1
	dw_3.object.item_no[ll_row] = dw_3.object.item_no[ll_row - 1]
	dw_3.object.groupitem_item_name[ll_row] = dw_3.object.groupitem_item_name[ll_row - 1]
	dw_3.object.qa[ll_row] = dw_3.object.qa[ll_row - 1]
	dw_3.object.uom[ll_row] = dw_3.object.uom[ll_row - 1]
	dw_3.setcolumn('qa')
else
	dw_3.object.seq[ll_row] = 1
	dw_3.setcolumn('item_no')
end if
dw_3.scrolltorow(ll_row)
dw_3.setredraw(true)
dw_3.setfocus()


end event

type pb_print_part from w_inheritance`pb_print_part within w_iocoilmove_m
integer x = 4425
integer y = 1004
integer width = 142
integer height = 112
string picturename = "c:\bmp\delete.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"상세삭제",parent, li_x, li_y)


end event

event pb_print_part::clicked;string ls_flag, ls_ask, ls_item, ls_oc
string ls_srcloc, ls_tarloc, ls_coil, ls_move_no, ls_qa
long ll_row, ll_move_cnt, li_seq, ll_chkcount, ll_count, ll_unit_qty, ll_cnt
dwItemStatus l_status
string ls_old_time
datetime ldt_date

dw_2.accepttext()
dw_3.accepttext()

ll_row = dw_2.rowcount()
if ll_row < 1 then return

l_status = dw_3.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	dw_3.deleterow(dw_3.getrow())
	RETURN
END IF

if trim(dw_1.object.pre_move_no[dw_1.getrow()]) = '' &
	or isnull(dw_1.object.pre_move_no[dw_1.getrow()]) then
else
	messagebox("확인","이미 반납처리된 번호입니다 확인바랍니다.")
	return
end if
if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

ls_srcloc = trim(dw_2.object.src_loc[1])
ls_tarloc = trim(dw_2.object.tar_loc[1])

ls_old_time = string(now(),'hh:mm:ss:fff')
ll_row      = dw_3.getrow()
ldt_date    = dw_2.object.move_date[1]
ls_move_no  = dw_2.object.move_no[1]

li_seq      = dw_3.object.seq[ll_row]
ls_coil     = dw_3.getitemstring(ll_row,'lot_no', primary!, TRUE)
ls_item     = dw_3.getitemstring(ll_row,'item_no', primary!, TRUE)
ls_qa       = dw_3.getitemstring(ll_row,'qa', primary!, TRUE)
ll_move_cnt = dw_3.getitemNUMBER(ll_row,'cnt', primary!, TRUE)
ll_unit_qty = dw_3.getitemdecimal(ll_row,'move_qty', primary!, TRUE)
if MidA(ls_item, 4, 1) = "1" then // coil
	update coilmst set qcnt = qcnt - :ll_move_cnt where coil_no = :ls_coil and loc_no = :ls_tarloc;
	if sqlca.sqlcode <> 0 then
		messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	select count(*) into :ll_cnt from coilmst where coil_no = :ls_coil and loc_no = :ls_srcloc;
	if ll_cnt > 0 then
		update coilmst set qcnt = qcnt + :ll_move_cnt, open_close = 'O' where coil_no = :ls_coil and loc_no = :ls_srcloc;
		if sqlca.sqlcode <> 0 then
			messagebox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
	else
	   INSERT INTO coilmst ( coil_no, wid, item_no, qa,   loc_no,   rcpt_date,   unit_qty,   length,
			                   cnt,   qcnt,  color_no,   supp_no,   flag,   porder_no,   pseq_no,   
			                   open_close,   rem,   rcpt_qty,   rcpt_len, etc_no, pcoil_no )  
		SELECT coil_no,  wid,  item_no,  qa, :ls_srcloc, getdate(), unit_qty,  length,   
			    :ll_move_cnt, :ll_move_cnt, color_no,   supp_no, flag, porder_no, pseq_no,   
			    'O', "코일이동",   rcpt_qty,   rcpt_len  , etc_no, pcoil_no
		  FROM coilmst 
		 where coil_no = :ls_coil and loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			messagebox('INSERT오류3',"[coilmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
	end if
	
	update coilmst set open_close = 'C' where coil_no = :ls_coil and qcnt = 0;
	if sqlca.sqlcode <> 0 then
		messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
elseif MidA(ls_item, 4, 1) = "2" then  // sheet
	update sheetmst set qcnt = qcnt - :ll_move_cnt where sheet_no = :ls_coil and loc_no = :ls_tarloc;
	if sqlca.sqlcode <> 0 then
		messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	
	select count(*) into :ll_cnt from sheetmst where sheet_no = :ls_coil	and loc_no = :ls_srcloc;
	if ll_cnt > 0 then
		update sheetmst set qcnt = qcnt + :ll_move_cnt, open_close = 'O' where sheet_no = :ls_coil and loc_no = :ls_srcloc;
		if sqlca.sqlcode <> 0 then
			messagebox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
	else
		INSERT INTO sheetmst ( sheet_no,   loc_no,   item_no,   qa,   rcpt_date,   unit_qty,   
			                    cnt,   qcnt,   color_no,   supp_no,   flag,   porder_no,  
			                    pseq_no,   open_close,   rem,   rcpt_qty )  
	   SELECT sheet_no,   :ls_srcloc,   item_no,   qa,    getdate(),   unit_qty, 
		       :ll_move_cnt,  :ll_move_cnt,   color_no,   supp_no,   flag,   porder_no,  
			    pseq_no,   'O',   "코일이동",   rcpt_qty  
		  FROM sheetmst 
		 where sheet_no = :ls_coil and loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			messagebox('INSERT오류2',"[sheetmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
	end if
	
	update sheetmst set open_close = 'C' where sheet_no = :ls_coil	and qcnt = 0;
	if sqlca.sqlcode <> 0 then
		messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
end if

// inaudit 이동 처리(출고)
// [IL]외주출고 로직입니다.
for ll_count = 1 to 100000
	IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
		ls_old_time  = string(now(),'hh:mm:ss:fff')	
		exit
	END IF	
NEXT		

insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
	                  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no,
	     0, :ll_unit_qty * :ll_move_cnt * -1, 0, :ls_tarloc, :ls_coil, "COILMOVE", :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
if sqlca.sqlcode < 0 then
	rollback;
	messagebox('오류16','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
	return
end if	

// inaudit 이동 처리(입고)
// [RL]외주저장소입고 로직입니다.
for ll_count = 1 to 100000
	IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
		ls_old_time  = string(now(),'hh:mm:ss:fff')	
		exit
	END IF	
NEXT

insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
	                  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no,
	     :ll_unit_qty * :ll_move_cnt * -1, 0, 0, :ls_srcloc, :ls_coil, "COILMOVE", :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
if sqlca.sqlcode < 0 then
	rollback;
	messagebox('오류17','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
	return
end if	

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_3.deleterow(ll_row)
if dw_3.rowcount() = 0 then
	dw_2.deleterow(1)
end if

if wf_update2(dw_2, dw_3, 'Y') = true then
	dw_2.setredraw(true)
	dw_3.setredraw(true)
end if
dw_2.setredraw(true)
dw_3.setredraw(true)


end event

type pb_close from w_inheritance`pb_close within w_iocoilmove_m
integer x = 4347
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilmove_m
integer x = 3557
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
datawindow dw_prt
string 	  old_dwnm

old_dwnm = dw_5.dataobject

PrintSetup()
if MessageBox("확인","선택된 코일 이동번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"1개의 코일번호에 4장의 출력물이 출력됩니다. 실행하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
	return
end if

if dw_1.rowcount() < 0 then return

if cbx_1.checked = true then	// 1장
	if rb_a4.checked = true then	// A4 양식
		dw_5.dataobject = 'd_oigiving_r_21'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else									// A5 양식
		dw_5.dataobject = 'd_oigiving_r_21_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if

if cbx_2.checked = true then	// 3장
	if rb_a4.checked = true then	// A4 양식
		dw_5.dataobject = 'd_oigiving_r_22'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
		
		dw_5.dataobject = 'd_oigiving_r_23'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()

		dw_5.dataobject = 'd_oigiving_r_24'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else									// A5 양식
		dw_5.dataobject = 'd_oigiving_r_22_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
		
		dw_5.dataobject = 'd_oigiving_r_23_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	
		dw_5.dataobject = 'd_oigiving_r_24_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		if LeftA(gs_team,1) = '9'then
			dw_5.modify("DataWindow.print.margin.left = 114 DataWindow.print.margin.top = 15")
		end if
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if
dw_5.dataobject = old_dwnm

//	if rb_1.checked = false then	// 신 양식
//		l_print.st_datawindow = dw_prt
//		l_print.st_print_sheet = " 프린트용지 : 거래명세표"
//		l_print.st_print_desc = "이 프로그램은 거래명세표를 출력합니다." 
//		
//		gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 ' + &
//								 'Datawindow.Zoom=100'
//		opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//	end if	

end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilmove_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilmove_m
integer x = 3963
integer taborder = 170
end type

event pb_delete::clicked;string ls_flag, ls_ask, ls_item, ls_oc
string ls_srcloc, ls_tarloc, ls_coil, ls_move_no, ls_qa
string ls_old_time
long   ll_row, ll_move_cnt, li_seq, ll_chkcount, ll_count, ll_unit_qty, ll_cnt
dwItemStatus l_status
datetime ldt_date

dw_2.accepttext()
dw_3.accepttext()

ll_row = dw_2.rowcount()
if ll_row < 1 then return
l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	if messagebox("삭제","입력하신 전체내역을 취소 하시겠습니까?",question!,okcancel!,2) = 1 then
		dw_2.RESET()
		dw_3.RESET()
	end if
	RETURN
END IF

if trim(dw_1.object.pre_move_no[dw_1.getrow()]) = '' &
	or isnull(dw_1.object.pre_move_no[dw_1.getrow()]) then
else
	messagebox("확인","이미 반납처리된 번호입니다 확인바랍니다.")
	return
end if

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

ls_old_time = string(now(),'hh:mm:ss:fff')
ls_srcloc   = trim(dw_2.object.src_loc[1])
ls_tarloc   = trim(dw_2.object.tar_loc[1])
ls_move_no  = dw_2.object.move_no[1]
ldt_date    = dw_2.object.move_date[1]
for ll_row = 1 to dw_3.rowcount()
	ls_item     = dw_3.object.item_no[ll_row]
	ls_qa       = dw_3.object.qa[ll_row]
	ls_coil     = dw_3.object.lot_no[ll_row]
	ll_move_cnt = dw_3.object.cnt[ll_row]
	li_seq      = dw_3.object.seq[ll_row]
	ll_unit_qty = dw_3.object.move_qty[ll_row]
	
	if MidA(ls_item, 4, 1) = "1" then // coil
		update coilmst 
		   set qcnt = qcnt - :ll_move_cnt
			  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
		 where coil_no = :ls_coil and loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		select count(*) into :ll_cnt from coilmst where coil_no = :ls_coil and loc_no = :ls_srcloc;
		if ll_cnt > 0 then
			update coilmst set qcnt = qcnt + :ll_move_cnt, open_close = 'O' where coil_no = :ls_coil and loc_no = :ls_srcloc;
			if sqlca.sqlcode <> 0 then
				messagebox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if			
		else
		   INSERT INTO coilmst ( coil_no, wid, item_no, qa,   loc_no,   rcpt_date,   unit_qty,   length,
				                   cnt,   qcnt,  color_no,   supp_no,   flag,   porder_no,   pseq_no,   
				                   open_close,   rem,   rcpt_qty,   rcpt_len, etc_no, pcoil_no )  
			SELECT coil_no,  wid,  item_no,  qa, :ls_srcloc, getdate(), unit_qty,  length,   
				    :ll_move_cnt, :ll_move_cnt, color_no,   supp_no, flag, porder_no, pseq_no,   
				    'O', "코일이동",   rcpt_qty,   rcpt_len  , etc_no, pcoil_no
			  FROM coilmst 
			 where coil_no = :ls_coil and loc_no = :ls_tarloc;
			if sqlca.sqlcode <> 0 then
				messagebox('INSERT오류3',"[coilmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
		end if
		
	elseif MidA(ls_item, 4, 1) = "2" then  // sheet
		update sheetmst 
		   set qcnt = qcnt - :ll_move_cnt
			  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
		 where sheet_no = :ls_coil	and loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			messagebox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		select count(*) into :ll_cnt from sheetmst where sheet_no = :ls_coil	and loc_no = :ls_srcloc;
		if ll_cnt > 0 then
			update sheetmst 
			   set qcnt = qcnt + :ll_move_cnt, open_close = 'O'
			 where sheet_no = :ls_coil and loc_no = :ls_srcloc;
			if sqlca.sqlcode <> 0 then
				messagebox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if			
		else
			INSERT INTO sheetmst ( sheet_no,   loc_no,   item_no,   qa,   rcpt_date,   unit_qty,   
				                    cnt,   qcnt,   color_no,   supp_no,   flag,   porder_no,  
				                    pseq_no,   open_close,   rem,   rcpt_qty )  
		   SELECT sheet_no,   :ls_srcloc,   item_no,   qa,    getdate(),   unit_qty, 
			       :ll_move_cnt,  :ll_move_cnt,   color_no,   supp_no,   flag,   porder_no,  
				    pseq_no,   'O',   "코일이동",   rcpt_qty  
			  FROM sheetmst 
			 where sheet_no = :ls_coil and loc_no = :ls_tarloc;
			if sqlca.sqlcode <> 0 then
				messagebox('INSERT오류2',"[sheetmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
		end if
	end if
	
	// inaudit 이동 처리(출고)
	// [IL]외주출고 로직입니다.
	for ll_count = 1 to 100000
		IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
			ls_old_time  = string(now(),'hh:mm:ss:fff')	
			exit
		END IF	
	NEXT		
	
	insert into inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		                   rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
	values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no,
		     0, :ll_unit_qty * :ll_move_cnt * -1, 0, :ls_tarloc, :ls_coil, "COILMOVE", :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
	if sqlca.sqlcode < 0 then
		rollback;
		messagebox('오류16','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
		return
	end if	
	
	// inaudit 이동 처리(입고)
	// [RL]외주저장소입고 로직입니다.
	for ll_count = 1 to 100000
		IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
			ls_old_time  = string(now(),'hh:mm:ss:fff')	
			exit
		END IF	
	NEXT		
	
	insert into inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		                   rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
	values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no,
		     :ll_unit_qty * :ll_move_cnt * -1, 0, 0, :ls_srcloc, :ls_coil, "COILMOVE", :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
	if sqlca.sqlcode < 0 then
		rollback;
		messagebox('오류17','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
		return
	end if	
next

dw_2.setredraw(false)
dw_3.setredraw(false)

dw_2.deleterow(1)
dw_3.rowsmove(1, dw_3.rowcount(), Primary!, dw_3, 1, Delete!)
if wf_update2(dw_2, dw_3, 'Y') = true then
	dw_2.setredraw(true)
	dw_3.setredraw(true)
	pb_retrieve.triggerevent(clicked!)
end if
dw_2.setredraw(true)
dw_3.setredraw(true)



end event

type pb_insert from w_inheritance`pb_insert within w_iocoilmove_m
integer x = 3771
integer taborder = 190
string text = " "
end type

event pb_insert::clicked;dw_2.accepttext()

dw_2.reset()
dw_3.reset()
dw_2.insertrow(1)
dw_2.object.move_date[1] = wf_today()
dw_2.object.log_id[1] = gs_userid
//2006.11.09 조용진부장(19910707)추가
if gf_permission('코일이동_관리', gs_userid) = 'Y' then	
else
	dw_2.object.flag[1] = 'S'
end if

//if gs_userid = '1999010s' or gs_userid = '19910707' or gs_userid = 'root' or gs_userid = 'etwas' &
//   or gs_userid = 'shinjy' or gs_userid = 'yuk7884' or gs_userid = 'sjh4279' &
//	or gs_userid = 'leejh' or gs_userid = 'kimsh' or gs_userid = 'dbjung' then
//else
//	dw_2.object.flag[1] = 'S'
//end if
	
dw_2.object.src_loc[1] = 'WW01'
dw_2.object.class[1] = 'C'
dw_2.setcolumn('move_date')
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilmove_m
integer x = 3365
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.reset()
dw_3.reset()

if dw_1.retrieve(id_start, id_end, 'C') < 1 then
	messagebox('확인','해당일자에는 자료가 없읍니다.',information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilmove_m
boolean visible = false
integer x = 3671
integer y = 68
integer width = 238
integer height = 80
integer taborder = 100
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilmove_m
integer x = 1486
integer y = 12
integer width = 905
integer height = 204
integer taborder = 120
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회기간"
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilmove_m
integer x = 3333
integer width = 1230
integer taborder = 60
end type

type dw_3 from datawindow within w_iocoilmove_m
integer x = 32
integer y = 1128
integer width = 4539
integer height = 1540
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_iocoilmovedet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_item, ls_data, ls_qa, ls_uom, ls_item_name, ls_loc, ls_null
long ll_row, ll_row1, ll_found

dw_2.accepttext()
this.accepttext()
ll_row = this.getrow()

setnull(ls_null)
ls_item = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")
ls_loc = trim(dw_2.object.src_loc[1])
choose case dwo.name
	case 'item_no'
			this.getchild("item_no", idwc_item)
//			gs_ds_itemall.ShareData(idwc_item)
			this.object.groupitem_item_name[ll_row] = ls_null
			this.object.qa[ll_row] = ls_null
			this.object.lot_no[ll_row] = ls_null
			this.object.move_qty[ll_row] = 0
			this.object.qcnt[ll_row] = 0
			this.object.cnt[ll_row] = 0
			
			ls_data = data
			ll_row1 = idwc_item.RowCount( )
			ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
			
			if ll_found = 0 then
				messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
				return 1
			end if
			 select item_name into :ls_item_name from groupitem 
			  where item_no = :ls_data;
			 if sqlca.sqlcode = 100 then 
				 return 1
			 end if
			this.object.groupitem_item_name[ll_row] = ls_item_name
			
			if ls_item <> '' then
				this.getchild("qa", idwc_qa)
				gs_ds_qaall.ShareData(idwc_qa)
				idwc_qa.setfilter("item_no = '" + ls_item + "'")
				idwc_qa.filter()
	
				
				if idwc_qa.rowcount() > 0 then
					this.object.qa.tabsequence = 1
					this.object.qa.background.color = 1087434968
					this.setcolumn("qa")
					this.setfocus()
				else
					this.object.qa.tabsequence = 0
					this.object.qa.background.color = 78682240
					this.setcolumn("item_no")
					this.setfocus()
				end if
			end if
	case 'qa'
		this.getchild("qa", idwc_qa)
		gs_ds_qaall.ShareData(idwc_qa)
		this.object.lot_no[ll_row] = ls_null
		this.object.move_qty[ll_row] = 0
		this.object.qcnt[ll_row] = 0
		this.object.cnt[ll_row] = 0
		
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
				return 1
		end if
		
		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[ll_row] = ls_uom
		  
		if MidA(ls_item, 4, 1) = "1" then
			wf_coildddw(ls_item, ls_qa, ls_loc )
		elseif MidA(ls_item, 4, 1) = "2" then
			wf_sheetdddw(ls_item, ls_loc)
		else
		   this.object.move_qty[row] = 0
		   this.object.cnt[row] = 1
			wf_cleardddw()
		end if
	case 'lot_no'
		if wf_coilchk(data,row) = false then
			return 1
		end if
		this.getchild('lot_no',idwc_coil)
		this.object.qa[row] = trim(idwc_coil.getitemstring(idwc_coil.getrow(),'qa'))
		this.object.move_qty[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'unit_qty')
		this.object.cnt[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'qcnt')
		this.object.qcnt[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'qcnt')
		this.object.os[row] = idwc_coil.getitemstring(idwc_coil.getrow(),'open_close')
	case 'cnt'
		if integer(data) > this.object.qcnt[row] then
			messagebox("확인", "로트 재고 갯수보다 클수 없습니다.")
			return 1
		end if
end choose

end event

event itemerror;string ls_data
long ll_row

ll_row = this.getrow()
setnull(ls_data)
CHOOSE CASE dwo.name
	CASE 'item_no'
		this.object.item_no[ll_row] = ls_data
		this.setcolumn('item_no')
	CASE 'qa'
		this.object.qa[ll_row] = ls_data
		this.setcolumn('qa')
	CASE 'move_qty'
		this.object.move_qty[ll_row] = 0
		this.setcolumn('move_qty')
	CASE 'cnt'
		this.object.cnt[ll_row] = 0
		this.setcolumn('cnt')
	CASE 'lot_no'
		this.object.lot_no[ll_row] = ls_data
		this.setcolumn('lot_no')
END CHOOSE
this.setfocus()



return 2
end event

event rowfocuschanged;string ls_item,ls_qa,ls_loc
long ll_row
dwItemStatus l_status

this.accepttext()

ll_row = this.getrow()
if ll_row < 1 then return

l_status = this.GetItemStatus(ll_row,0, Primary!)

if l_status = New! or l_status = NewModified!  then
	ls_item = trim(this.object.item_no[ll_row])
	if ls_item = '' or isnull(ls_item) then
		return
	else
		idwc_qa.setfilter("item_no = '" + ls_item + "'")
		idwc_qa.filter()
	end if
	dw_2.accepttext()
	ls_loc = trim(dw_2.object.src_loc[1])
	
	ls_qa = trim(this.object.qa[ll_row])

	ls_item = this.object.item_no[ll_row]
	ls_qa = this.object.qa[ll_row]
	ls_loc = dw_2.object.src_loc[1]
	
	if MidA(ls_item, 4, 1) = "1" then
		wf_coildddw(ls_item, ls_qa, ls_loc)
	elseif MidA(ls_item, 4, 1) = "2" then
		wf_sheetdddw( ls_item, ls_loc)
	else
		wf_cleardddw()
	end if
	
end if



end event

event clicked;this.accepttext()
end event

event losefocus;this.accepttext()
end event

event doubleclicked;gs_coil lst_code

CHOOSE CASE dwo.name
	CASE 'lot_no'
		string ls_coil
		
		lst_code.loc_no = dw_2.object.src_loc[1]
		ls_coil = this.object.lot_no[row]
		openwithparm(w_whcoil_w, lst_code)
		lst_code = message.powerobjectparm
		if lst_code.chk = "N" then 
			if isnull(ls_coil) or trim(ls_coil) = '' then
				this.setcolumn('lot_no')
			else
				this.setcolumn('cnt')
			end if
			return 1
		else
			if wf_coilchk(lst_code.coil_no,row) = false then
				return 1
			end if

			this.SETREDRAW(false)
//			this.object.sfcuse_mod_len[row] = lst_code.length
//			this.object.sfcuse_wid[row] = lst_code.wid
//			this.object.sfcuse_unit_qty[row] = lst_code.unit_qty
//			this.object.sfcuse_mod_qty[row] = 0
//			this.object.use_qty[row] = 0
//			this.object.etc_no[row] = lst_code.etc_no
//			this.object.item_item_name[row] = lst_code.item_name
//			this.object.item_no[row] = lst_code.item_no
//			this.object.qa[row] = lst_code.qa
//			this.object.uom[row] = lst_code.uom
//			this.object.coil_no[row] = lst_code.coil_no
//			this.object.loc_no[row] = lst_code.loc_no
//			this.object.sfcuse_cnt[row] = 0
//			this.object.qcnt[row] = lst_code.qcnt
			
			this.object.groupitem_item_name[row] = lst_code.item_name
			this.object.item_no[row] = lst_code.item_no
			this.object.qa[row] = lst_code.qa
			this.object.lot_no[row] = lst_code.coil_no
			this.object.uom[row] = lst_code.uom
			this.object.move_qty[row] = lst_code.unit_qty
			this.object.cnt[row] = lst_code.qcnt
			this.object.qcnt[row] = lst_code.qcnt
			this.object.os[row] = 'O'
//			is_clause = " and item_no = ~~'" + lst_code.item_no + "~~'"  &
//						 + " and qa = ~~'" + lst_code.qa + "~~'"
//			is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"		
//			wf_retrievechild(idwc_loc,is_where)
		
			if MidA(lst_code.item_no, 4, 1) = "1" then
				wf_coildddw(lst_code.item_no, lst_code.qa,lst_code.loc_no )
			elseif MidA(lst_code.item_no, 4, 1) = "2" then
				wf_sheetdddw(lst_code.item_no, lst_code.loc_no)
			else
				wf_cleardddw()
			end if


			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + lst_code.item_no + "'")
			idwc_qa.filter()
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.object.qa.background.color = 78682240
				this.setcolumn("item_no")
				this.setfocus()
			end if
			this.SETREDRAW(TRUE)
			this.setcolumn('cnt')
		end if
END CHOOSE

end event

type dw_4 from datawindow within w_iocoilmove_m
integer x = 1266
integer y = 28
integer width = 101
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_iocoilmove_m
integer x = 1376
integer y = 28
integer width = 101
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r_21_a5"
boolean livescroll = true
end type

type em_2 from editmask within w_iocoilmove_m
integer x = 1989
integer y = 92
integer width = 366
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "~b"
end type

event modified;	id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_end = date(this.text)
end if

end event

type em_1 from editmask within w_iocoilmove_m
integer x = 1522
integer y = 92
integer width = 366
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = ""
end type

event modified;	id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_start = date(this.text)

end if

end event

type st_2 from statictext within w_iocoilmove_m
integer x = 1911
integer y = 92
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_iocoilmove_m
integer x = 1998
integer y = 236
integer width = 1687
integer height = 872
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_iocoilmove_m
integer x = 2464
integer y = 108
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "1장"
end type

type rb_a4 from radiobutton within w_iocoilmove_m
integer x = 2962
integer y = 80
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "A4 양식"
end type

type rb_a5 from radiobutton within w_iocoilmove_m
integer x = 2962
integer y = 144
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "A5 양식"
boolean checked = true
end type

type cbx_2 from checkbox within w_iocoilmove_m
integer x = 2665
integer y = 108
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "3장"
boolean checked = true
end type

type gb_4 from groupbox within w_iocoilmove_m
integer x = 2898
integer y = 12
integer width = 416
integer height = 204
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출력용지"
end type

type gb_5 from groupbox within w_iocoilmove_m
integer x = 2423
integer y = 12
integer width = 457
integer height = 204
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출력형태"
end type

