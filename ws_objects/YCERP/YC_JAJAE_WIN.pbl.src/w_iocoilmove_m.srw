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
type cbx_1 from checkbox within w_iocoilmove_m
end type
type cbx_2 from checkbox within w_iocoilmove_m
end type
type st_left from statictext within w_iocoilmove_m
end type
type em_left from editmask within w_iocoilmove_m
end type
type st_9 from statictext within w_iocoilmove_m
end type
type em_top from editmask within w_iocoilmove_m
end type
type st_1 from statictext within w_iocoilmove_m
end type
type st_4 from statictext within w_iocoilmove_m
end type
type ddlb_fld from dropdownlistbox within w_iocoilmove_m
end type
type ddlb_dwtitles from dropdownlistbox within w_iocoilmove_m
end type
type st_7 from statictext within w_iocoilmove_m
end type
type ddlb_op from dropdownlistbox within w_iocoilmove_m
end type
type sle_value from singlelineedit within w_iocoilmove_m
end type
type cb_19 from commandbutton within w_iocoilmove_m
end type
type cb_20 from commandbutton within w_iocoilmove_m
end type
type cb_21 from commandbutton within w_iocoilmove_m
end type
type st_vertical from u_splitbar_vertical within w_iocoilmove_m
end type
type st_horizontal from u_splitbar_horizontal within w_iocoilmove_m
end type
type gb_4 from groupbox within w_iocoilmove_m
end type
type gb_5 from groupbox within w_iocoilmove_m
end type
end forward

global type w_iocoilmove_m from w_inheritance
integer width = 4110
integer height = 2452
string title = "코일이동관리(w_iocoilmove_m)"
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
em_2 em_2
em_1 em_1
cbx_1 cbx_1
cbx_2 cbx_2
st_left st_left
em_left em_left
st_9 st_9
em_top em_top
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
st_vertical st_vertical
st_horizontal st_horizontal
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

	if ll_idx = 16 then
		arg_dw.object.dr_man[ll_int] = ls_dr
		ll_idx = 0
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

ls_clause = "DataWindow.Table.Select = '"  + ls_select + ls_where + "'"

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


//messagebox('알림2', ls_clause)
//ldwc_lot.settransobject(sqlca)
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
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_left=create st_left
this.em_left=create em_left
this.st_9=create st_9
this.em_top=create em_top
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.st_left
this.Control[iCurrent+9]=this.em_left
this.Control[iCurrent+10]=this.st_9
this.Control[iCurrent+11]=this.em_top
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_19
this.Control[iCurrent+20]=this.cb_20
this.Control[iCurrent+21]=this.cb_21
this.Control[iCurrent+22]=this.st_vertical
this.Control[iCurrent+23]=this.st_horizontal
this.Control[iCurrent+24]=this.gb_4
this.Control[iCurrent+25]=this.gb_5
end on

on w_iocoilmove_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_left)
destroy(this.em_left)
destroy(this.st_9)
destroy(this.em_top)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_4.visible = false
dw_5.visible = false

dw_3.getchild("item_no", idwc_item)
//gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
//gs_ds_qaall.ShareData(idwc_qa)
idwc_qa.settransobject(sqlca)
idwc_qa.retrieve()

dw_3.getchild('lot_no',idwc_coil)
idwc_coil.insertrow(1)
idwc_coil.settransobject(sqlca)
is_select = idwc_coil.Describe("DataWindow.Table.Select")
dw_3.settransobject(sqlca)

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
id_start  = date(em_1.text)
id_end    = date(em_2.text)

//////////////////////////////////////////////////////////////////////////////
string  ls_left, ls_top

ls_left = ProfileString("YCERP.INI","DO_PRT","LEFT", " ")
ls_top  = ProfileString("YCERP.INI","DO_PRT","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = "115"
if isnull(ls_top)  OR ls_top  = "" then ls_top  = "110"

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////

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

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x

st_horizontal.y     = dw_1.y + dw_1.height
st_horizontal.width = newwidth  - (gb_3.x * 2)

dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x 


end event

type pb_save from w_inheritance`pb_save within w_iocoilmove_m
integer x = 3543
integer y = 64
end type

event pb_save::clicked;// 저장
long     ll_row, ll_move_cnt, ll_qcnt, ll_count, ll_unit_qty, ll_cnt
string   ls_srcloc, ls_tarloc, ls_qa, ls_oc, ls_sqlerrtext
string   ls_move_no, ls_seq, ls_area, ls_move_date, ls_move_no1, ls_coil, ls_lotno, ls_item
string   ls_old_time
int      li_seq
decimal  lr_move_qty
datetime ldt_date
dwItemStatus l_status
string 	ls_yyyymm, ls_magamyn

dw_2.accepttext()
dw_3.accepttext()

if dw_2.rowcount() < 1 then RETURN
if dw_3.rowcount() < 1 then RETURN

/* 마감관리 로직 반영 2017.10.24 조원석 */
/* sys_gb = '10' 10 구매 마감 로직 	 시작 */
ls_yyyymm = string(dw_2.object.move_date[1], "yyyymm")

SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';

//if ls_magamyn <> "N" then
//	MessageBox('확인','해당년월은 마감되었습니다.~n~n',Stopsign!)
//	return
//end if

/* 마감관리 로직 반영 2017.10.24 조원석  끝 */

ls_srcloc = trim(dw_2.object.src_loc[1])
if ls_srcloc = "" or isnull(ls_srcloc) then
	MessageBox('오류','출고지를 선택하십시오.',exclamation!)
	RETURN
end if

ls_tarloc = trim(dw_2.object.tar_loc[1])
if ls_tarloc = "" or isnull(ls_tarloc) then
	MessageBox('오류','도착지를 선택하십시오.',exclamation!)
	RETURN
end if

if dw_3.rowcount() < 1 then
	MessageBox("저장","등록된 물품이 없습니다!",exclamation!)
	RETURN
end if

ldt_date    = dw_2.object.move_date[1]
ls_old_time = string(now(),'hh:mm:ss:fff')

l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	setpointer(hourglass!)
	for ll_row = 1 to dw_3.rowcount()
		lr_move_qty = dw_3.getitemdecimal(ll_row, "move_qty")
		if lr_move_qty = 0 then
			MessageBox("확인","이동수량을 입력하세요!",exclamation!)
			dw_3.scrolltorow(ll_row)
			dw_3.setcolumn("move_qty")
			dw_3.setfocus()
			RETURN
		end if
		
		ll_move_cnt = dw_3.getitemdecimal(ll_row, "cnt")
		if ll_move_cnt = 0 then
			MessageBox("확인","이동갯수를 입력하세요!",exclamation!)
			dw_3.scrolltorow(ll_row)
			dw_3.setcolumn("cnt")
			dw_3.setfocus()
			RETURN
		end if
		
		if dw_3.object.qa[ll_row] = '' or isnull(dw_3.object.qa[ll_row]) then
			MessageBox("확인","규격을 입력하세요!",exclamation!)
			dw_3.scrolltorow(ll_row)			
			dw_3.setcolumn("qa")
			dw_3.setfocus()
			RETURN
		end if
		
		if dw_3.object.lot_no[ll_row] = '' or isnull(dw_3.object.lot_no[ll_row]) then
			MessageBox("확인","로트번호를 선택하세요!",exclamation!)
			dw_3.scrolltorow(ll_row)			
			dw_3.setcolumn("lot_no")
			dw_3.setfocus()
			RETURN
		end if

		/////////////////////////////////////////////////////////////////
		// 입고저장소에 코일존재 유무 확인
		/////////////////////////////////////////////////////////////////
		ls_lotno  = dw_3.object.lot_no[ll_row]
		
		if MidA(ls_item, 4, 1) = "1" then 	// COIL
			SELECT count(*) INTO :ll_cnt  FROM coilmst 
			 WHERE coil_no = :ls_lotno  AND loc_no = :ls_tarloc and rem = '코일이동';
			if ll_cnt > 0 then
				MessageBox("이동오류","[coilmst]입고저장소에 동일한 코일이 존재합니다.",exclamation!)
				RETURN
			end if
		else											// SHEET
			SELECT count(*) INTO :ll_cnt FROM sheetmst 
			 WHERE sheet_no = :ls_coil AND loc_no = :ls_tarloc and rem = '코일이동';
			if ll_cnt > 0 then
				MessageBox("이동오류","[sheetmst]입고저장소에 동일한 코일이 존재합니다.",exclamation!)
				RETURN
			end if
		end if
		/////////////////////////////////////////////////////////////////
	next
	if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN


	///////////////////////////////////
	// 사내송장 번호 부여
	///////////////////////////////////
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
			MessageBox("저장","이동번호가 이미 존재합니다.", exclamation!)
			RETURN
		end if
	end if
	
	dw_2.object.move_no[1]  = ls_move_no1
	dw_2.object.log_date[1] = gf_today()
		
	if wf_nullchk(dw_2) = false then RETURN
	if wf_nullchk(dw_3) = false then RETURN
	dw_2.accepttext()
	dw_3.accepttext()
		
	// 이동수량 입력 CHECK		
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.move_no[ll_row] = ls_move_no1
		ls_item     = dw_3.object.item_no[ll_row]
		ls_qa       = dw_3.object.qa[ll_row]
		ls_coil     = dw_3.object.lot_no[ll_row]
		ll_move_cnt = dw_3.object.cnt[ll_row]
		ll_qcnt     = dw_3.object.qcnt[ll_row]
		li_seq      = dw_3.object.seq[ll_row]
		ll_unit_qty = dw_3.object.move_qty[ll_row]

		// COIL
		if MidA(ls_item, 4, 1) = "1" then 
			setnull(ls_oc)
			
			SELECT open_close, qcnt INTO :ls_oc, :ll_qcnt FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_srcloc;
			
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('update오류1',"[coilmst]select 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
				RETURN
			end if
			
			/*2021.01.15 jowonsuk */
			if ll_qcnt < ll_move_cnt then
				MessageBox('오류',"[" + ls_coil + "] 코일 재고량을 확인하세요. ~r~n",exclamation!)
				RETURN
			end if 
			
			UPDATE coilmst 
				SET qcnt = qcnt - :ll_move_cnt
				  , unit_qty   = :ll_unit_qty
				  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
			 WHERE coil_no = :ls_coil	AND loc_no = :ls_srcloc AND open_close <> 'C';
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
				RETURN
			end if
			
			//
			SELECT count(*) INTO :ll_cnt FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_tarloc;
			if ll_cnt > 0 then
				UPDATE coilmst 
					SET qcnt = qcnt + :ll_move_cnt
					  , unit_qty   = :ll_unit_qty
					  , open_close = (case when open_close = 'C' then 'O' else open_close end)
				 WHERE coil_no = :ls_coil AND loc_no = :ls_tarloc;
				if sqlca.sqlcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if				
			else
				INSERT INTO coilmst ( coil_no, wid, item_no, qa,   loc_no,   rcpt_date,   unit_qty,   length,
											 cnt,   qcnt,  color_no,   supp_no,   flag,   porder_no,   pseq_no,   
											 open_close,   rem,   rcpt_qty,   rcpt_len, etc_no, pcoil_no )  
				SELECT coil_no,  wid,  item_no,  qa, :ls_tarloc, getdate(), unit_qty,  length,   
						 :ll_move_cnt, :ll_move_cnt, color_no,   supp_no, flag, porder_no, pseq_no,   
						 :ls_oc, '코일이동',   rcpt_qty,   rcpt_len  , etc_no, pcoil_no
				  FROM coilmst 
				 WHERE coil_no = :ls_coil AND loc_no = :ls_srcloc;
				if sqlca.sqlcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('INSERT오류3',"[coilmst]INSERT시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if
			end if
			lr_move_qty = ll_unit_qty * ll_move_cnt
			
		// SHEET
		elseif MidA(ls_item, 4, 1) = "2" then  
			
			SELECT open_close, qcnt INTO :ls_oc, :ll_qcnt FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_srcloc;			
			
			/*2021.01.15 jowonsuk */
			if ll_qcnt < ll_move_cnt then
				MessageBox('오류',"[" + ls_coil + "] 쉬트 재고량을 확인하세요. ~r~n",exclamation!)
				RETURN
			end if 			
			
			UPDATE sheetmst 
				SET qcnt = qcnt - :ll_move_cnt
				  , unit_qty = :ll_unit_qty
				  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
			 WHERE sheet_no = :ls_coil	AND loc_no = :ls_srcloc;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
				RETURN
			end if
			
			SELECT count(*) INTO :ll_cnt FROM sheetmst WHERE sheet_no = :ls_coil AND loc_no = :ls_tarloc;
			if ll_cnt > 0 then
				UPDATE sheetmst 
					SET qcnt = qcnt + :ll_move_cnt
					  , unit_qty = :ll_unit_qty
					  , open_close = 'O'
				 WHERE sheet_no = :ls_coil	AND loc_no = :ls_tarloc;
				if sqlca.sqlcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if
				
			else
				INSERT INTO sheetmst ( sheet_no,   loc_no,   item_no,   qa,   rcpt_date,   unit_qty,   
											  cnt,   qcnt,   color_no,   supp_no,   flag,   porder_no,  
											  pseq_no,   open_close,   rem,   rcpt_qty )  
				SELECT sheet_no,   :ls_tarloc,   item_no,   qa,    getdate(),   unit_qty, 
						 :ll_move_cnt,  :ll_move_cnt,   color_no,   supp_no,   flag,   porder_no,  
						 pseq_no,   'O',   '코일이동',   rcpt_qty  
				  FROM sheetmst 
				 WHERE sheet_no = :ls_coil AND loc_no = :ls_srcloc;
				if sqlca.sqlcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					rollback;
					MessageBox('INSERT오류2',"[sheetmst]INSERT시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
					RETURN
				end if
			end if
			lr_move_qty = ll_move_cnt
		end if
		
		///////////////////////////////////
		// inaudit 이동 처리(출고)
		// [IL]외주출고 로직입니다.
		///////////////////////////////////
//		for ll_count = 1 to 100000
//			if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//				ls_old_time  = string(now(),'hh:mm:ss:fff')	
//				exit
//			end if	
//		next	
		
		INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
									rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
		VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no1,
				  0, :lr_move_qty, 0, :ls_tarloc, :ls_coil, 'COILMOVE', :ll_unit_qty,  :ll_move_cnt, :li_seq, :gs_userid);
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류16','[inaudit] insert중 DB오류가 발생했습니다.~r~n'+ ls_sqlerrtext,exclamation!)
			RETURN
		end if	
		
		///////////////////////////////////
		// inaudit 이동 처리(입고)
		// [RL]외주저장소입고 로직입니다.		
		///////////////////////////////////
//		for ll_count = 1 to 100000
//			if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//				ls_old_time  = string(now(),'hh:mm:ss:fff')	
//				exit
//			end if	
//		next		
		
		INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
									rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
		VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no1,
				  :lr_move_qty, 0, 0, :ls_srcloc, :ls_coil, 'COILMOVE', :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
		if sqlca.sqlcode < 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('오류17','[inaudit] insert중 DB오류가 발생했습니다.~r~n'+ ls_sqlerrtext,exclamation!)
			RETURN
		end if	
	next
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
integer y = 436
integer width = 2528
integer height = 616
integer taborder = 70
string dataobject = "d_iolocmove_s"
boolean hscrollbar = false
end type

event dw_1::rowfocuschanged;string ls_moveno
long   ll_row

ll_row = this.getrow()
if ll_row < 1 then return

//
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

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_title from w_inheritance`st_title within w_iocoilmove_m
integer x = 32
integer y = 20
integer width = 905
integer height = 144
string text = "코일이동 관리"
end type

type st_tips from w_inheritance`st_tips within w_iocoilmove_m
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilmove_m
integer x = 3625
integer y = 288
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

event pb_compute::clicked;// 행추가
long   ll_row
string ls_loc, ls_destination
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
	dw_3.object.qa[ll_row]  = dw_3.object.qa[ll_row - 1]
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
integer x = 3776
integer y = 288
integer width = 142
integer height = 112
string picturename = "c:\bmp\delete.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"상세삭제",parent, li_x, li_y)


end event

event pb_print_part::clicked;// 행삭제
string ls_flag, ls_ask, ls_item, ls_oc, ls_sqlerrtext
string ls_srcloc, ls_tarloc, ls_coil, ls_move_no, ls_qa
long   ll_row, ll_move_cnt, li_seq, ll_chkcount, ll_count, ll_unit_qty, ll_cnt, ll_qcnt
string ls_old_time
datetime ldt_date
dwItemStatus l_status

dw_2.accepttext()
dw_3.accepttext()

ll_row = dw_2.rowcount()
if ll_row < 1 then return

l_status = dw_3.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	dw_3.deleterow(dw_3.getrow())
	RETURN
end if

ls_move_no = trim(dw_1.object.pre_move_no[dw_1.getrow()])
if isnull(ls_move_no) or ls_move_no = '' then
else
	MessageBox("확인","이미 반납처리된 번호입니다 확인바랍니다.")
	return
end if

if MessageBox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


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

// COIL
if MidA(ls_item, 4, 1) = "1" then
	
	  select qcnt 
	  into :ll_qcnt 
	  from coilmst 
	where coil_no = :ls_coil 
	  and loc_no = :ls_tarloc;
		
	/*2021.01.15 jowonsuk 코일재고의 마이너스 재고를 막는다. */
	if ll_qcnt < ll_move_cnt then
		MessageBox('오류', "[" + ls_coil + "] 코일 재고량을 확인해보시기 바랍니다.~r~n", exclamation!)
		return
	end if
	
	UPDATE coilmst 
	   SET qcnt = qcnt - :ll_move_cnt 
	 WHERE coil_no = :ls_coil AND loc_no = :ls_tarloc;
	 
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
		return
	end if
	
	SELECT count(*) INTO :ll_cnt FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_srcloc;
	if ll_cnt > 0 then
		UPDATE coilmst 
		   SET qcnt = qcnt + :ll_move_cnt
			  , open_close = 'O' 
		 WHERE coil_no = :ls_coil AND loc_no = :ls_srcloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
			return
		end if
		
	else
	   INSERT INTO coilmst ( coil_no, wid, item_no, qa,   loc_no,   rcpt_date,   unit_qty,   length,
			                   cnt,   qcnt,  color_no,   supp_no,   flag,   porder_no,   pseq_no,   
			                   open_close,   rem,   rcpt_qty,   rcpt_len, etc_no, pcoil_no )  
		SELECT coil_no,  wid,  item_no,  qa, :ls_srcloc, getdate(), unit_qty,  length,   
			    :ll_move_cnt, :ll_move_cnt, color_no,   supp_no, flag, porder_no, pseq_no,   
			    'O', '코일이동',   rcpt_qty,   rcpt_len  , etc_no, pcoil_no
		  FROM coilmst 
		 WHERE coil_no = :ls_coil AND loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('INSERT오류3',"[coilmst]INSERT시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
			return
		end if
	end if
	
	UPDATE coilmst SET open_close = 'C' WHERE coil_no = :ls_coil AND qcnt = 0;
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
		return
	end if
	
// SHEET
elseif MidA(ls_item, 4, 1) = "2" then
	
	  select qcnt 
	  into :ll_qcnt 
	  from sheetmst 
	where sheet_no = :ls_coil 
	  and loc_no = :ls_tarloc;
	
	/*2021.01.15 jowonsuk 코일재고의 마이너스 재고를 막는다. */
	if ll_qcnt < ll_move_cnt then
		MessageBox('오류', "[" + ls_coil + "] 쉬트 재고량을 확인해보시기 바랍니다.~r~n", exclamation!)
		return
	end if	
	
	
	UPDATE sheetmst 
	   SET qcnt = qcnt - :ll_move_cnt 
	 WHERE sheet_no = :ls_coil AND loc_no = :ls_tarloc;
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
		return
	end if
	
	SELECT count(*) INTO :ll_cnt FROM sheetmst WHERE sheet_no = :ls_coil	AND loc_no = :ls_srcloc;
	if ll_cnt > 0 then
		UPDATE sheetmst 
		   SET qcnt = qcnt + :ll_move_cnt
			  , open_close = 'O' 
		 WHERE sheet_no = :ls_coil AND loc_no = :ls_srcloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
			return
		end if
		
	else
		INSERT INTO sheetmst ( sheet_no,   loc_no,   item_no,   qa,   rcpt_date,   unit_qty,   
			                    cnt,   qcnt,   color_no,   supp_no,   flag,   porder_no,  
			                    pseq_no,   open_close,   rem,   rcpt_qty )  
	   SELECT sheet_no,   :ls_srcloc,   item_no,   qa,    getdate(),   unit_qty, 
		       :ll_move_cnt,  :ll_move_cnt,   color_no,   supp_no,   flag,   porder_no,  
			    pseq_no,   'O',   '코일이동',   rcpt_qty  
		  FROM sheetmst 
		 WHERE sheet_no = :ls_coil AND loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('INSERT오류2',"[sheetmst]INSERT시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
			return
		end if
	end if
	
	UPDATE sheetmst SET open_close = 'C' WHERE sheet_no = :ls_coil	AND qcnt = 0;
	if sqlca.sqlcode <> 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
		return
	end if
end if

//////////////////////////////////////
// inaudit 이동 처리(출고)
// [IL]외주출고 로직입니다.
//////////////////////////////////////
//for ll_count = 1 to 100000
//	if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//		ls_old_time  = string(now(),'hh:mm:ss:fff')	
//		exit
//	end if
//next		

INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
	                  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no,
	     0, (case when substring(:ls_item,4,1) = '1' then :ll_unit_qty * :ll_move_cnt * -1 else :ll_move_cnt * -1  end), 0, :ls_tarloc, :ls_coil, 'COILMOVE', :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
		  
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류16',"[inaudit] insert중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
	return
end if	

//////////////////////////////////////
// inaudit 이동 처리(입고)
// [RL]외주저장소입고 로직입니다.
//////////////////////////////////////
//for ll_count = 1 to 100000
//	if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//		ls_old_time  = string(now(),'hh:mm:ss:fff')	
//		exit
//	end if	
//next

INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
	                  rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no,
	     (case when substring(:ls_item,4,1) = '1' then :ll_unit_qty * :ll_move_cnt * -1 else :ll_move_cnt * -1  end), 0, 0, :ls_srcloc, :ls_coil, 'COILMOVE', :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
		  
if sqlca.sqlcode < 0 then
	ls_sqlerrtext = sqlca.sqlerrtext
	rollback;
	MessageBox('오류17',"[inaudit] insert중 DB오류가 발생했습니다.~r~n" + ls_sqlerrtext,exclamation!)
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
integer x = 3735
integer y = 64
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilmove_m
integer x = 2944
integer y = 64
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

// DO_PRT 설정
string  ls_left, ls_top
ls_left = em_left.text ; ls_top  = em_top.text
		  
PrintSetup()
if MessageBox("확인","선택된 코일 이동번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"1개의 코일번호에 4장의 출력물이 출력됩니다. 실행하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if

if dw_1.rowcount() < 0 then RETURN

if cbx_1.checked = true then	// 1장
	dw_5.dataobject = 'd_oigiving_r_21_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')

	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )

	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
end if

if cbx_2.checked = true then	// 3장
	dw_5.dataobject = 'd_oigiving_r_22_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')

	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )

	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
	
	dw_5.dataobject = 'd_oigiving_r_23_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')

	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )

	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()

	dw_5.dataobject = 'd_oigiving_r_24_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')

	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )

	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
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
integer x = 3351
integer y = 64
integer taborder = 170
end type

event pb_delete::clicked;// 삭제
string ls_flag, ls_ask, ls_item, ls_oc, ls_sqlerrtext
string ls_srcloc, ls_tarloc, ls_coil, ls_move_no, ls_qa
string ls_old_time
long   ll_row, ll_move_cnt, li_seq, ll_chkcount, ll_count, ll_unit_qty, ll_cnt

dwItemStatus l_status
datetime ldt_date

dw_2.accepttext()
dw_3.accepttext()

ll_row = dw_2.rowcount()
if ll_row < 1 then RETURN

l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	if MessageBox("삭제","입력하신 전체내역을 취소 하시겠습니까?",question!,okcancel!,2) = 1 then
		dw_2.reset()
		dw_3.reset()
	end if
	RETURN
end if

ls_move_no = trim(dw_1.object.pre_move_no[dw_1.getrow()])
if isnull(ls_move_no) or ls_move_no = "" then
else
	MessageBox("확인","이미 반납처리된 번호입니다 확인바랍니다.")
	return
end if

if MessageBox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

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
		UPDATE coilmst 
		   SET qcnt = qcnt - :ll_move_cnt
			  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
		 WHERE coil_no = :ls_coil AND loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
			return
		end if
		
		SELECT count(*) INTO :ll_cnt FROM coilmst WHERE coil_no = :ls_coil AND loc_no = :ls_srcloc;
		if ll_cnt > 0 then
			UPDATE coilmst 
			   SET qcnt = qcnt + :ll_move_cnt
				  , open_close = 'O' 
			 WHERE coil_no = :ls_coil AND loc_no = :ls_srcloc;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
				return
			end if			
		else
		   INSERT INTO coilmst ( coil_no, wid, item_no, qa,   loc_no,   rcpt_date,   unit_qty,   length,
				                   cnt,   qcnt,  color_no,   supp_no,   flag,   porder_no,   pseq_no,   
				                   open_close,   rem,   rcpt_qty,   rcpt_len, etc_no, pcoil_no )  
			SELECT coil_no,  wid,  item_no,  qa, :ls_srcloc, getdate(), unit_qty,  length,   
				    :ll_move_cnt, :ll_move_cnt, color_no,   supp_no, flag, porder_no, pseq_no,   
				    'O', '코일이동',   rcpt_qty,   rcpt_len  , etc_no, pcoil_no
			  FROM coilmst 
			 WHERE coil_no = :ls_coil AND loc_no = :ls_tarloc;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('INSERT오류3',"[coilmst]INSERT시 오류가 발생했습니다..~r~n" + ls_sqlerrtext,exclamation!)
				return
			end if
		end if
		
	elseif MidA(ls_item, 4, 1) = "2" then  // sheet
		UPDATE sheetmst 
		   SET qcnt = qcnt - :ll_move_cnt
			  , open_close = (case when qcnt - :ll_move_cnt <= 0 then 'C' else open_close end)
		 WHERE sheet_no = :ls_coil	AND loc_no = :ls_tarloc;
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback;
			MessageBox('update오류1',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
			return
		end if
		
		SELECT count(*) INTO :ll_cnt FROM sheetmst WHERE sheet_no = :ls_coil	AND loc_no = :ls_srcloc;
		if ll_cnt > 0 then
			UPDATE sheetmst 
			   SET qcnt = qcnt + :ll_move_cnt, open_close = 'O'
			 WHERE sheet_no = :ls_coil AND loc_no = :ls_srcloc;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('update오류2',"[coilmst]UPDATE시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				return
			end if			
		else
			INSERT INTO sheetmst ( sheet_no,   loc_no,   item_no,   qa,   rcpt_date,   unit_qty,   
				                    cnt,   qcnt,   color_no,   supp_no,   flag,   porder_no,  
				                    pseq_no,   open_close,   rem,   rcpt_qty )  
		   SELECT sheet_no,   :ls_srcloc,   item_no,   qa,    getdate(),   unit_qty, 
			       :ll_move_cnt,  :ll_move_cnt,   color_no,   supp_no,   flag,   porder_no,  
				    pseq_no,   'O',   '코일이동',   rcpt_qty  
			  FROM sheetmst 
			 WHERE sheet_no = :ls_coil AND loc_no = :ls_tarloc;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback;
				MessageBox('INSERT오류2',"[sheetmst]INSERT시 오류가 발생했습니다..~r~n" + sqlca.sqlerrtext,exclamation!)
				return
			end if
		end if
	end if
	
	//////////////////////////////////////////
	// inaudit 이동 처리(출고)
	// [IL]외주출고 로직입니다.
	//////////////////////////////////////////
//	for ll_count = 1 to 100000
//		if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//			ls_old_time  = string(now(),'hh:mm:ss:fff')	
//			exit
//		end if
//	next	

	INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		                   rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
	VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no,
		     0,  (case when substring(:ls_item,4,1) = '1' then :ll_unit_qty * :ll_move_cnt * -1 else :ll_move_cnt * -1  end), 0, :ls_tarloc, :ls_coil, 'COILMOVE', :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
			  
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('오류16','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
		return
	end if	
	
	//////////////////////////////////////////
	// inaudit 이동 처리(입고)
	// [RL]외주저장소입고 로직입니다.
	//////////////////////////////////////////
//	for ll_count = 1 to 100000
//		if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//			ls_old_time  = string(now(),'hh:mm:ss:fff')	
//			exit
//		end if
//	next		

	INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		                   rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
	VALUES (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no,
		     (case when substring(:ls_item,4,1) = '1' then :ll_unit_qty * :ll_move_cnt * -1 else :ll_move_cnt * -1  end), 0, 0, :ls_srcloc, :ls_coil, 'COILMOVE', :ll_unit_qty, :ll_move_cnt, :li_seq, :gs_userid);
			  
	if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
		rollback;
		MessageBox('오류17','[inaudit] insert중 DB오류가 발생했습니다.',exclamation!)
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
integer x = 3159
integer y = 64
integer taborder = 190
string text = " "
end type

event pb_insert::clicked;// 추가
dw_2.accepttext()

dw_2.reset()
dw_3.reset()

dw_2.insertrow(1)
dw_2.object.move_date[1] = wf_today()
dw_2.object.log_id[1]    = gs_userid

if gf_permission('코일이동_관리', gs_userid) = 'Y' then	
else
	dw_2.object.flag[1] = 'S'
end if

dw_2.object.src_loc[1] = 'WW01'
dw_2.object.class[1]   = 'C'
dw_2.setcolumn('move_date')
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilmove_m
integer x = 2752
integer y = 64
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
integer x = 32
integer y = 240
integer width = 3922
integer height = 184
integer taborder = 100
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilmove_m
integer x = 978
integer y = 16
integer width = 805
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilmove_m
integer x = 2720
integer y = 16
integer width = 1234
integer height = 216
integer taborder = 60
end type

type dw_2 from w_inheritance`dw_2 within w_iocoilmove_m
integer x = 2624
integer y = 436
integer width = 1330
integer height = 616
integer taborder = 80
string dataobject = "d_iolocmove_m"
boolean vscrollbar = false
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

event dw_2::itemchanged;string ls_data, ls_loc, ls_where, ls_sql
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

type dw_3 from datawindow within w_iocoilmove_m
integer x = 23
integer y = 1136
integer width = 3922
integer height = 1204
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_iocoilmovedet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string ls_item, ls_data, ls_qa, ls_uom, ls_item_name, ls_loc, ls_null
long   ll_row, ll_row1, ll_found

dw_2.accepttext()
this.accepttext()
ll_row = this.getrow()

setnull(ls_null)
ls_item = this.getitemstring(ll_row, "item_no")
ls_qa   = this.getitemstring(ll_row, "qa")
ls_loc  = trim(dw_2.object.src_loc[1])

choose case dwo.name
	case 'item_no'
			this.getchild("item_no", idwc_item)
//			gs_ds_itemall.ShareData(idwc_item)
			this.object.groupitem_item_name[ll_row] = ls_null
			this.object.qa[ll_row]       = ls_null
			this.object.lot_no[ll_row]   = ls_null
			this.object.move_qty[ll_row] = 0
			this.object.qcnt[ll_row]     = 0
			this.object.cnt[ll_row]      = 0
			
			ls_data  = data
			ll_row1  = idwc_item.RowCount()
			ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
			
			if ll_found = 0 then
				messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
				return 1
			end if
			
			select item_name into :ls_item_name from groupitem where item_no = :ls_data;
			if sqlca.sqlcode = 100 then 
			   return 1
			end if
			this.object.groupitem_item_name[ll_row] = ls_item_name
			
			if ls_item <> '' then
				this.getchild("qa", idwc_qa)
				//gs_ds_qaall.ShareData(idwc_qa)
				idwc_qa.settransobject(sqlca)
				idwc_qa.retrieve()
				idwc_qa.setfilter("item_no = '" + ls_item + "'")
				idwc_qa.filter()
					
				if idwc_qa.rowcount() > 0 then
					this.object.qa.tabsequence = 1
					this.object.qa.background.color = 1087434968
					this.setcolumn("qa")
					this.setfocus()
				else
					messagebox("확인","규격이 존재하지 않습니다.~r~r품목/거래처 RELOAD! 후 실행 바랍니다.",exclamation!)
					this.object.qa.tabsequence = 0
					this.object.qa.background.color = 78682240
					this.setcolumn("item_no")
					this.setfocus()
				end if
			end if
			
	case 'qa'
		this.getchild("qa", idwc_qa)
		//gs_ds_qaall.ShareData(idwc_qa)
		idwc_qa.settransobject(sqlca)
		idwc_qa.retrieve()
		this.object.lot_no[ll_row]   = ls_null
		this.object.move_qty[ll_row] = 0
		this.object.qcnt[ll_row]     = 0
		this.object.cnt[ll_row]      = 0
		
		ls_data  = data
  	     ll_row1  = idwc_qa.RowCount( )
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
		this.object.qa[row]       = trim(idwc_coil.getitemstring(idwc_coil.getrow(),'qa'))
		this.object.move_qty[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'unit_qty')
		this.object.cnt[row]      = idwc_coil.getitemnumber(idwc_coil.getrow(),'qcnt')
		this.object.qcnt[row]     = idwc_coil.getitemnumber(idwc_coil.getrow(),'qcnt')
		this.object.os[row]       = idwc_coil.getitemstring(idwc_coil.getrow(),'open_close')
		
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
			//gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.settransobject(sqlca)
			idwc_qa.retrieve()
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
integer x = 64
integer y = 144
integer width = 101
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_iocoilmove_m
integer x = 174
integer y = 144
integer width = 101
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r_21_a5"
boolean livescroll = true
end type

type em_2 from editmask within w_iocoilmove_m
integer x = 1362
integer y = 136
integer width = 389
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
id_end = date(this.text)

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if
//
end event

type em_1 from editmask within w_iocoilmove_m
integer x = 1362
integer y = 60
integer width = 389
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
id_start = date(this.text)

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//
//end if

end event

type cbx_1 from checkbox within w_iocoilmove_m
integer x = 1847
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

type cbx_2 from checkbox within w_iocoilmove_m
integer x = 2048
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

type st_left from statictext within w_iocoilmove_m
integer x = 2331
integer y = 76
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "왼쪽"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_left from editmask within w_iocoilmove_m
integer x = 2482
integer y = 64
integer width = 146
integer height = 64
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCERP.INI", "DO_PRT", "LEFT", ls_left)
SetProfileString("YCERP.INI", "DO_PRT", "TOP",  ls_top)

end event

type st_9 from statictext within w_iocoilmove_m
integer x = 2331
integer y = 144
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상단"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_top from editmask within w_iocoilmove_m
integer x = 2482
integer y = 132
integer width = 146
integer height = 64
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCERP.INI", "DO_PRT", "LEFT", ls_left)
SetProfileString("YCERP.INI", "DO_PRT", "TOP",  ls_top)

end event

type st_1 from statictext within w_iocoilmove_m
integer x = 1006
integer y = 60
integer width = 347
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_iocoilmove_m
integer x = 87
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_iocoilmove_m
integer x = 265
integer y = 308
integer width = 430
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
string item[] = {""}
end type

type ddlb_dwtitles from dropdownlistbox within w_iocoilmove_m
integer x = 311
integer y = 316
integer width = 256
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

type st_7 from statictext within w_iocoilmove_m
integer x = 704
integer y = 324
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

type ddlb_op from dropdownlistbox within w_iocoilmove_m
integer x = 887
integer y = 308
integer width = 293
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_iocoilmove_m
integer x = 1189
integer y = 308
integer width = 562
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_19 from commandbutton within w_iocoilmove_m
integer x = 1760
integer y = 308
integer width = 160
integer height = 76
integer taborder = 140
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

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_iocoilmove_m
integer x = 1925
integer y = 308
integer width = 160
integer height = 76
integer taborder = 150
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

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_21 from commandbutton within w_iocoilmove_m
integer x = 2089
integer y = 308
integer width = 160
integer height = 76
integer taborder = 160
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

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_iocoilmove_m
integer x = 2578
integer y = 436
integer height = 616
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_iocoilmove_m
integer x = 32
integer y = 1068
integer width = 3922
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_1.height

end event

type gb_4 from groupbox within w_iocoilmove_m
integer x = 2281
integer y = 16
integer width = 416
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출력여백"
end type

type gb_5 from groupbox within w_iocoilmove_m
integer x = 1806
integer y = 16
integer width = 457
integer height = 216
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출력형태"
end type

