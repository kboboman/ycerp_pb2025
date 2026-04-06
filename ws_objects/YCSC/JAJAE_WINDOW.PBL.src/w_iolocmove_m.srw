$PBExportHeader$w_iolocmove_m.srw
$PBExportComments$물품이동관리(2001/05/07, 이인호)
forward
global type w_iolocmove_m from w_inheritance
end type
type dw_3 from datawindow within w_iolocmove_m
end type
type dw_4 from datawindow within w_iolocmove_m
end type
type dw_5 from datawindow within w_iolocmove_m
end type
type em_2 from editmask within w_iolocmove_m
end type
type em_1 from editmask within w_iolocmove_m
end type
type st_2 from statictext within w_iolocmove_m
end type
type rb_1 from radiobutton within w_iolocmove_m
end type
type rb_2 from radiobutton within w_iolocmove_m
end type
type cb_1 from commandbutton within w_iolocmove_m
end type
type st_1 from statictext within w_iolocmove_m
end type
type cbx_9 from checkbox within w_iolocmove_m
end type
type cbx_1 from checkbox within w_iolocmove_m
end type
type cbx_2 from checkbox within w_iolocmove_m
end type
type rb_a4 from radiobutton within w_iolocmove_m
end type
type rb_a5 from radiobutton within w_iolocmove_m
end type
type st_margin from statictext within w_iolocmove_m
end type
type gb_5 from groupbox within w_iolocmove_m
end type
type gb_4 from groupbox within w_iolocmove_m
end type
end forward

global type w_iolocmove_m from w_inheritance
integer width = 4677
integer height = 2912
string title = "물품이동 관리(w_iolocmove_m)"
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
em_2 em_2
em_1 em_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
cb_1 cb_1
st_1 st_1
cbx_9 cbx_9
cbx_1 cbx_1
cbx_2 cbx_2
rb_a4 rb_a4
rb_a5 rb_a5
st_margin st_margin
gb_5 gb_5
gb_4 gb_4
end type
global w_iolocmove_m w_iolocmove_m

type variables
datawindowchild idwc_item,idwc_qa
string is_select
date id_start, id_end
string is_select1,is_where1,is_clause1, is_select2, is_clause2

end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);w_repsuper w_print
st_print l_print

string ls_orderno, ls_dr, ls_tarea, ls_tname, ls_farea, ls_fname, ls_item_no, ls_real_uom
string ls_uom, ls_qa, ls_rem, ls_item_name, ls_move_qty, ls_acc_qty, ls_act_user,ls_ask_user
long ll_count, ll_idx, ll_int
string ls_chk

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
	   arg_dw.object.do_date[ll_int]  = string(dw_2.object.move_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int]    = dw_2.object.move_no[1]
 	   arg_dw.object.addr[ll_int]     = trim(ls_fname) + " 에서 " + trim(ls_tname) + " 으로 이동"
		 
      arg_dw.object.ls_user[ll_int]  = ls_act_user
//    arg_dw.object.cust[ll_int]     = ls_ask_user
//   	arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	
	ll_idx = ll_idx + 1
	ls_item_no = dw_3.object.item_no[ll_count]
	setnull(ls_uom)
	select uom into :ls_uom from groupitem where item_no = :ls_item_no;
	 
	ls_qa  = dw_3.object.qa[ll_count]
	ls_rem = dw_3.object.rem[ll_count]
	
	setnull(ls_item_name)
   SELECT item_name INTO :ls_item_name FROM item
	   WHERE item_no = :ls_item_no AND qa = :ls_qa;
	ls_move_qty = string(dw_3.object.move_qty[ll_count], '###,###,###.00')
	
	if LeftA( ls_item_no ,1) = 'P' and MidA(ls_item_no, 3,1) = 'Y' &
		and (MidA(ls_item_no, 7,1) = 'A' 	or MidA(ls_item_no, 7,1) = 'B' &
				or MidA(ls_item_no, 7,1) = 'C' or MidA(ls_item_no, 7,1) = 'D') then
		ls_acc_qty = string(dw_3.object.move_qty[ll_count], '###,###,###.00') 
	else
		if ls_uom = 'M2' or ls_uom = "SS" then
			ls_acc_qty = string(truncate( long(MidA( ls_qa ,5,4)) &
					* long(MidA(ls_qa,10,4)) &
						* dw_3.object.move_qty[ll_count] &
							/ 1000000 + 0.000000001, 2), '###,###,###.00')
		else
			if ls_uom = 'M' then
				if  dw_3.object.move_qty[ll_count] < 0 then
					ls_acc_qty = string(truncate(long(MidA(  ls_qa , 15,5)) *  &
					dw_3.object.move_qty[ll_count]  &
									/ 1000 - 0.00001,2), '###,###,###.00')
				else
					ls_acc_qty = string(truncate(long(MidA(  ls_qa , 15,5)) &
						*  dw_3.object.move_qty[ll_count] &
						/ 1000 + 0.00001,2) , '###,###,###.00')
				end if
			else
				ls_acc_qty = string(dw_3.object.move_qty[ll_count], '###,###,###.00') 
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
	ls_qa = MidA(dw_3.object.qa[ll_count], 1, 3)  + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 5, 4)  + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 10, 4) + ' X ' + &
		     MidA(dw_3.object.qa[ll_count], 15, 5)
			  
	arg_dw.setitem(ll_int, 'item_' + string(ll_idx), ls_item_name)
	arg_dw.setitem(ll_int, 'qa_'   + string(ll_idx), ls_qa)
	arg_dw.setitem(ll_int, 'auom_' + string(ll_idx), ls_uom) //ls_real_uom)
	arg_dw.setitem(ll_int, 'ship_' + string(ll_idx), ls_move_qty )//ls_ship_qty)
	arg_dw.setitem(ll_int, 'buom_' + string(ll_idx), ls_real_uom) //ls_uom)
	arg_dw.setitem(ll_int, 'acc_'  + string(ll_idx), ls_acc_qty)
//	arg_dw.setitem(ll_int, 'cost_' + string(ll_idx), ls_price)
//	arg_dw.setitem(ll_int, 'price_'+ string(ll_idx), ls_amount)
//	arg_dw.setitem(ll_int, 'rate_' + string(ll_idx), ls_rate_cash)
//	arg_dw.setitem(ll_int, 'pdate' + string(ll_idx), DATE(ld_date))
//	arg_dw.setitem(ll_int, 'desc'  + string(ll_idx), ls_desc)

	if cbx_9.checked = false then
		if ll_idx = 12 then // ll_idx = 12
			arg_dw.object.dr_man[ll_int] = ls_dr
			ll_idx = 0
		end if
	else
		if ll_idx = 25 then // ll_idx = 12
			arg_dw.object.dr_man[ll_int] = ls_dr
			ll_idx = 0
		end if
	end if

//	CHOOSE CASE ll_idx
//	CASE 1
//   	arg_dw.object.item_1[ll_int] = ls_item_name
//   	arg_dw.object.qa_1[ll_int] = ls_qa
//  	   arg_dw.object.auom_1[ll_int] = ls_uom
//   	arg_dw.object.ship_1[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_1[ll_int] = ls_real_uom
//   	arg_dw.object.acc_1[ll_int] = ls_acc_qty 
//	CASE 2
//   	arg_dw.object.item_2[ll_int] = ls_item_name
//   	arg_dw.object.qa_2[ll_int] = ls_qa
//  	   arg_dw.object.auom_2[ll_int] = ls_uom
//   	arg_dw.object.ship_2[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_2[ll_int] = ls_real_uom
//   	arg_dw.object.acc_2[ll_int] = ls_acc_qty 
//	CASE 3
//   	arg_dw.object.item_3[ll_int] = ls_item_name
//   	arg_dw.object.qa_3[ll_int] = ls_qa
//  	   arg_dw.object.auom_3[ll_int] = ls_uom
//   	arg_dw.object.ship_3[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_3[ll_int] = ls_real_uom
//   	arg_dw.object.acc_3[ll_int] = ls_acc_qty 
//	CASE 4
//   	arg_dw.object.item_4[ll_int] = ls_item_name
//   	arg_dw.object.qa_4[ll_int] = ls_qa
//  	   arg_dw.object.auom_4[ll_int] = ls_uom
//   	arg_dw.object.ship_4[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_4[ll_int] = ls_real_uom
//   	arg_dw.object.acc_4[ll_int] = ls_acc_qty 
//	CASE 5
//   	arg_dw.object.item_5[ll_int] = ls_item_name
//   	arg_dw.object.qa_5[ll_int] = ls_qa
//  	   arg_dw.object.auom_5[ll_int] = ls_uom
//   	arg_dw.object.ship_5[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_5[ll_int] = ls_real_uom
//   	arg_dw.object.acc_5[ll_int] = ls_acc_qty 
//	CASE 6
//   	arg_dw.object.item_6[ll_int] = ls_item_name
//   	arg_dw.object.qa_6[ll_int] = ls_qa
//  	   arg_dw.object.auom_6[ll_int] = ls_uom
//   	arg_dw.object.ship_6[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_6[ll_int] = ls_real_uom
//   	arg_dw.object.acc_6[ll_int] = ls_acc_qty 
//	CASE 7
//   	arg_dw.object.item_7[ll_int] = ls_item_name
//   	arg_dw.object.qa_7[ll_int] = ls_qa
//  	   arg_dw.object.auom_7[ll_int] = ls_uom
//   	arg_dw.object.ship_7[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_7[ll_int] = ls_real_uom
//   	arg_dw.object.acc_7[ll_int] = ls_acc_qty 
//	CASE 8
//   	arg_dw.object.item_8[ll_int] = ls_item_name
//   	arg_dw.object.qa_8[ll_int] = ls_qa
//  	   arg_dw.object.auom_8[ll_int] = ls_uom
//   	arg_dw.object.ship_8[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_8[ll_int] = ls_real_uom
//   	arg_dw.object.acc_8[ll_int] = ls_acc_qty 
//	CASE 9
//   	arg_dw.object.item_9[ll_int] = ls_item_name
//   	arg_dw.object.qa_9[ll_int] = ls_qa
//  	   arg_dw.object.auom_9[ll_int] = ls_uom
//   	arg_dw.object.ship_9[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_9[ll_int] = ls_real_uom
//   	arg_dw.object.acc_9[ll_int] = ls_acc_qty 
//	CASE 10
//   	arg_dw.object.item_10[ll_int] = ls_item_name
//   	arg_dw.object.qa_10[ll_int] = ls_qa
//  	   arg_dw.object.auom_10[ll_int] = ls_uom
//   	arg_dw.object.ship_10[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_10[ll_int] = ls_real_uom
//   	arg_dw.object.acc_10[ll_int] = ls_acc_qty 
//	CASE 11
//   	arg_dw.object.item_11[ll_int] = ls_item_name
//   	arg_dw.object.qa_11[ll_int] = ls_qa
//  	   arg_dw.object.auom_11[ll_int] = ls_uom
//   	arg_dw.object.ship_11[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_11[ll_int] = ls_real_uom
//   	arg_dw.object.acc_11[ll_int] = ls_acc_qty 
//	CASE 12
//   	arg_dw.object.item_12[ll_int] = ls_item_name
//   	arg_dw.object.qa_12[ll_int] = ls_qa
//  	   arg_dw.object.auom_12[ll_int] = ls_uom
//   	arg_dw.object.ship_12[ll_int] = ls_move_qty 
//   	arg_dw.object.buom_12[ll_int] = ls_real_uom
//   	arg_dw.object.acc_12[ll_int] = ls_acc_qty 
//	   ll_idx = 0
//   END CHOOSE
next
if ls_chk = "N" then return

//arg_dw.object.dr_man[ll_int] = ls_dr
//
//l_print.st_datawindow = arg_dw
//l_print.st_print_sheet = " 프린트용지 : 거래명세표"
//l_print.st_print_desc = " 이 프로그램은 거래명세표를 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//

end subroutine

on w_iolocmove_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.em_2=create em_2
this.em_1=create em_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cbx_9=create cbx_9
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.rb_a4=create rb_a4
this.rb_a5=create rb_a5
this.st_margin=create st_margin
this.gb_5=create gb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.cbx_9
this.Control[iCurrent+12]=this.cbx_1
this.Control[iCurrent+13]=this.cbx_2
this.Control[iCurrent+14]=this.rb_a4
this.Control[iCurrent+15]=this.rb_a5
this.Control[iCurrent+16]=this.st_margin
this.Control[iCurrent+17]=this.gb_5
this.Control[iCurrent+18]=this.gb_4
end on

on w_iolocmove_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cbx_9)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.rb_a4)
destroy(this.rb_a5)
destroy(this.st_margin)
destroy(this.gb_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.object.pre_move_no.visible = false
dw_2.object.flag.visible = false
dw_2.object.t_1.visible  = false
dw_2.object.t_2.visible  = false

dw_4.visible = false
dw_5.visible = false

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_3.settransobject(sqlca)

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
id_start  = date(em_1.text)
id_end    = date(em_2.text)

if gf_permission("물품이동_관리", gs_userid) = "Y" then	
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	pb_print_part.enabled = false
	pb_compute.enabled    = false
end if

end event

event resize;call super::resize;//
dw_3.width  = this.width  - 124
dw_3.height = this.height - 1388

end event

type pb_save from w_inheritance`pb_save within w_iolocmove_m
integer x = 4187
integer y = 56
end type

event pb_save::clicked;long   ll_row, ll_count
string ls_srcloc,  ls_tarloc, ls_qa, ls_oc
string ls_move_no, ls_seq, ls_area, ls_move_date, ls_move_no1,  ls_item
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
			if lr_move_qty = 0 or isnull(lr_move_qty) then
				messagebox("확인","이동수량을 입력하세요!",exclamation!)
				dw_3.scrolltorow(ll_row)
				dw_3.setcolumn("move_qty")
				dw_3.setfocus()
				return
			end if
			if dw_3.object.item_no[ll_row] = '' or isnull(dw_3.object.item_no[ll_row]) then
				messagebox("확인","품목을 입력하세요!",exclamation!)
				dw_3.scrolltorow(ll_row)			
				dw_3.setcolumn("item_no")
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
		next

		// 사내송장 번호 부여
		ls_area = LeftA(gs_area, 1)
		IF trim(dw_2.object.move_no[1]) = '' OR isnull(dw_2.object.move_no[1]) then
		   ls_move_date = string(dw_2.object.move_date[1], "yyyymmdd")
	   	ls_move_no1  = ls_area + 'C' + ls_move_date + '-' + '%'			
		   SELECT MAX(move_no) INTO :ls_move_no FROM itemmove WHERE move_no LIKE :ls_move_no1;		
		   if isnull(ls_move_no) or ls_move_no = '' then
			   ls_move_no1 = ls_area + 'C' +  ls_move_date + '-' + '01'
	   	else
		   	li_seq = integer(MidA(ls_move_no, 12, 2))
			   li_seq = li_seq + 1
	   		ls_seq = '00' + trim(string(li_seq))
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
			li_seq      = dw_3.object.seq[ll_row]
			lr_move_qty = dw_3.getitemdecimal(ll_row, "move_qty")
			
			// inaudit 이동 처리(출고)
			// [IL]외주출고 로직입니다.
			for ll_count = 1 to 100000
				IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
					ls_old_time  = string(now(),'hh:mm:ss:fff')	
					exit
				END IF	
			NEXT		
			
			// cnt, com_qty에 저장되는 변수 위치 변경. 2005.5.4 future21
			insert into inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
				    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
			values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no1,
				     0, :lr_move_qty, 0, :ls_tarloc, NULL, "ITEMMOVE", :lr_move_qty, :li_seq, :lr_move_qty, :gs_userid);
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
			
			// cnt, com_qty에 저장되는 변수 위치 변경. 2005.5.4 future21
			insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
				    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
			values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no1,
				     :lr_move_qty, 0, 0, :ls_srcloc, NULL, "ITEMMOVE", :lr_move_qty, :li_seq, :lr_move_qty, :gs_userid);
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

type dw_1 from w_inheritance`dw_1 within w_iolocmove_m
string tag = "물품이동과 코일이동이 동시에 씀"
integer x = 41
integer y = 236
integer width = 2839
integer height = 1000
integer taborder = 70
string dataobject = "d_iolocmove_s"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;string ls_moveno
long   ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_moveno = dw_1.object.move_no[ll_row]
dw_2.retrieve(ls_moveno)
dw_3.retrieve(ls_moveno)

end event

event dw_1::clicked;call super::clicked;//
if row < 1 then return
This.SelectRow(0,  false)
This.SelectRow(row, true)
end event

type dw_2 from w_inheritance`dw_2 within w_iolocmove_m
string tag = "물품이동과 코일이동이 동시에 씀"
integer x = 2976
integer y = 360
integer width = 1550
integer height = 704
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

type st_title from w_inheritance`st_title within w_iolocmove_m
integer x = 78
integer y = 40
integer width = 1193
string text = "물품이동 관리"
end type

type st_tips from w_inheritance`st_tips within w_iolocmove_m
end type

type pb_compute from w_inheritance`pb_compute within w_iolocmove_m
integer x = 4306
integer y = 1124
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
dw_3.object.move_qty[ll_row] = 0
dw_3.scrolltorow(ll_row)
dw_3.setredraw(true)
dw_3.setfocus()


end event

type pb_print_part from w_inheritance`pb_print_part within w_iolocmove_m
integer x = 4453
integer y = 1124
integer width = 142
integer height = 112
string picturename = "c:\bmp\delete.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"상세삭제",parent, li_x, li_y)


end event

event pb_print_part::clicked;string  ls_flag, ls_ask, ls_item, ls_oc
string  ls_srcloc, ls_tarloc,  ls_move_no, ls_qa
long    ll_row, li_seq, ll_chkcount, ll_count
decimal lr_move_qty
dwItemStatus l_status
string  ls_old_time
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

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

ls_srcloc   = trim(dw_2.object.src_loc[1])
ls_tarloc   = trim(dw_2.object.tar_loc[1])

ls_old_time = string(now(),'hh:mm:ss:fff')
ll_row      = dw_3.getrow()
ldt_date    = dw_2.object.move_date[1]
ls_move_no  = dw_2.object.move_no[1]

li_seq      = dw_3.object.seq[ll_row]
ls_item     = dw_3.getitemstring(ll_row,'item_no', primary!, TRUE)
ls_qa       = dw_3.getitemstring(ll_row,'qa', primary!, TRUE)
lr_move_qty = dw_3.getitemdecimal(ll_row,'move_qty', primary!, TRUE)

// inaudit 이동 처리(출고)
// [IL]외주출고 로직입니다.
for ll_count = 1 to 100000
	IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
		ls_old_time  = string(now(),'hh:mm:ss:fff')	
		exit
	END IF	
NEXT		

// cnt, com_qty에 저장되는 변수 위치 변경. 2005.5.4 future21
insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
	         rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no,
	     0, :lr_move_qty * -1, 0, :ls_tarloc, NULL, "ITEMMOVE", :lr_move_qty, :li_seq, :lr_move_qty, :gs_userid);
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

// cnt, com_qty에 저장되는 변수 위치 변경. 2005.5.4 future21
insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
	    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no,
	    :lr_move_qty * -1, 0, 0, :ls_srcloc, NULL, "ITEMMOVE", :lr_move_qty, :li_seq, :lr_move_qty, :gs_userid);
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

type pb_close from w_inheritance`pb_close within w_iolocmove_m
integer x = 4379
integer y = 56
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iolocmove_m
integer x = 3611
integer y = 56
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string old_dwnm
datawindow dw_prt
w_repsuper w_print
st_print   l_print

long   li_find,  li_end
string ls_margin, ls_left, ls_top
SELECT BIGO INTO :ls_margin FROM CODEMST 
 WHERE ITEM_CD = :gs_team AND TYPE = '거래명세_출력여백';
if isnull(ls_margin) or ls_margin = "" then
	ls_margin = "115,15,"
end if
 
li_find = 1
li_end  = PosA(ls_margin, ",", li_find)
ls_left = MidA(ls_margin, li_find, li_end - 1)
li_find = li_end + 1
li_end  = PosA(ls_margin, ",", li_find)
ls_top  = MidA(ls_margin, li_find, li_end - 1)

if ls_left = "" or ls_top = "" then
	ls_left = "115"
	ls_top  = "15"
end if
st_margin.text = "여백 Left: " + ls_left + ", Top: " + ls_top

old_dwnm = dw_5.dataobject

if dw_1.rowcount() < 0 then return
if messagebox("확인1","선택된 물품 이동번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"1개의 이동번호에 4장의 출력물이 출력됩니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	return
end if

PrintSetup()
//if cbx_9.checked = false then		// 구 양식(거래명세서)
//	dw_prt = dw_5
//	CHOOSE CASE gs_area
//		CASE "S0001"
//			wf_print(dw_5)
//			dw_prt = dw_5						
//		CASE ELSE
//			wf_print(dw_4)
//			dw_prt = dw_4
//	END CHOOSE			
//end if

if cbx_1.checked = true then	// 1장
	if rb_a4.checked = true then	// A4양식
		dw_5.dataobject = 'd_oigiving_r_21'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
	else
		dw_5.dataobject = 'd_oigiving_r_21_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')		
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
	end if
end if
dw_5.settransobject(sqlca)

if cbx_2.checked = true then	// 3장
	if rb_A4.checked = true then
		dw_5.dataobject = 'd_oigiving_r_22'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
		
		dw_5.dataobject = 'd_oigiving_r_23'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
		
		dw_5.dataobject = 'd_oigiving_r_24'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else
		dw_5.dataobject = 'd_oigiving_r_22_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
		
		dw_5.dataobject = 'd_oigiving_r_23_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
		
		dw_5.dataobject = 'd_oigiving_r_24_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if
dw_5.dataobject = old_dwnm

//if cbx_9.checked = false then		// 구 양식(거래명세서)
//	l_print.st_datawindow = dw_prt
//	l_print.st_print_sheet = " 프린트용지 : 거래명세표"
//	l_print.st_print_desc  = "이 프로그램은 거래명세표를 출력합니다." 
//	
//	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 Datawindow.Zoom=100'
//	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//end if	
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_iolocmove_m
boolean visible = false
integer x = 2853
integer y = 872
integer width = 151
integer height = 112
integer taborder = 160
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_delete from w_inheritance`pb_delete within w_iolocmove_m
integer x = 3995
integer y = 56
integer taborder = 170
end type

event pb_delete::clicked;string ls_flag, ls_item
string ls_srcloc, ls_tarloc, ls_move_no, ls_qa
string ls_old_time
long   ll_row,  li_seq, ll_chkcount, ll_count
dwItemStatus l_status
decimal  lr_move_qty
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

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

ls_old_time = string(now(),'hh:mm:ss:fff')
ls_srcloc   = trim(dw_2.object.src_loc[1])
ls_tarloc   = trim(dw_2.object.tar_loc[1])
ls_move_no  = dw_2.object.move_no[1]
ldt_date    = dw_2.object.move_date[1]

for ll_row = 1 to dw_3.rowcount()
	ls_item     = dw_3.object.item_no[ll_row]
	ls_qa       = dw_3.object.qa[ll_row]
	lr_move_qty = dw_3.object.move_qty[ll_row]
	li_seq      = dw_3.object.seq[ll_row]
	
	// inaudit 이동 처리(출고)
	// [IL]외주출고 로직입니다.
	for ll_count = 1 to 100000
		IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
			ls_old_time  = string(now(),'hh:mm:ss:fff')	
			exit
		END IF	
	NEXT		
	// cnt, com_qty에 저장되는 변수 위치 변경. 2005.5.4 future21
	insert into inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id )  
	values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_srcloc, 'IL', :ls_move_no,
		    0, :lr_move_qty * -1, 0, :ls_tarloc, NULL, "ITEMMOVE", :lr_move_qty, :li_seq, :lr_move_qty, :gs_userid);
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
	
	// cnt, com_qty에 저장되는 변수 위치 변경. 2005.5.4 future21
	insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
		    rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id  )  
	values (getdate(), :ldt_date, :ls_item, :ls_qa, :ls_tarloc, 'RL', :ls_move_no,
		    :lr_move_qty * -1, 0, 0, :ls_srcloc, NULL, "ITEMMOVE", :lr_move_qty, :li_seq, :lr_move_qty, :gs_userid);
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

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type pb_insert from w_inheritance`pb_insert within w_iolocmove_m
integer x = 3803
integer y = 56
integer taborder = 190
string text = " "
end type

event pb_insert::clicked;//
dw_2.accepttext()

dw_2.reset()
dw_3.reset()
dw_2.insertrow(1)
dw_2.object.move_date[1] = wf_today()
dw_2.object.log_id[1]    = gs_userid

//if gs_userid = '1999010s' or gs_userid = 'root' or gs_userid = 'etwas' then
//else
dw_2.object.flag[1] = "O"  // 의미 없음
//end if

// 2005/11/08 future21 출고지 시화 고정에서 로그인한 사업장의 기본 저장소로 변경
//dw_2.object.src_loc[1] = 'WS00000000'
string ls_def_loc

SELECT def_loc INTO :ls_def_loc FROM area WHERE area_no = :gs_area;
if sqlca.sqlcode <> 0 then
	messagebox('확인','DB연결 오류가 발생했습니다.',exclamation!)
	return
end if	
	
dw_2.modify(' src_loc.tabsequence=0  src_loc.background.color="67108864" ')
dw_2.object.src_loc[1] = ls_def_loc
dw_2.object.class[1]   = 'M'
dw_2.setcolumn('move_date')
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iolocmove_m
integer x = 3419
integer y = 56
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.reset()
dw_3.reset()

if dw_1.retrieve(id_start, id_end, 'M') < 1 then
	messagebox('확인','해당일자에는 자료가 없읍니다.',information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iolocmove_m
integer x = 1317
integer y = 16
integer width = 338
integer height = 204
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "구분"
end type

type gb_2 from w_inheritance`gb_2 within w_iolocmove_m
integer x = 2455
integer y = 16
integer width = 910
integer height = 204
integer taborder = 120
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회기간"
end type

type gb_1 from w_inheritance`gb_1 within w_iolocmove_m
integer x = 3378
integer y = 16
integer width = 1216
integer taborder = 60
end type

type dw_3 from datawindow within w_iolocmove_m
integer x = 41
integer y = 1252
integer width = 4553
integer height = 1508
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_iolocmovedet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_item, ls_data, ls_qa, ls_uom, ls_item_name, ls_loc, ls_null
long ll_row, ll_row1, ll_found
dec ld_qoh, ld_move_qty

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
			this.object.groupitem_item_name[ll_row] = ls_null
			this.object.qa[ll_row] = ls_null
			this.object.lot_no[ll_row] = ls_null
			this.object.move_qty[ll_row] = 0
			
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
		
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
				return 1
		end if
		
		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[ll_row] = ls_uom
		ld_qoh = 0
		select qoh into :ld_qoh from itemloc
		 where loc_no = :ls_loc
		   and item_no = :ls_item
			and qa = :ls_data;
		if isnull(ld_qoh) then ld_qoh = 0
		dw_3.object.qcnt[ll_row] = ld_qoh

	case 'move_qty'
		ld_qoh = this.object.qcnt[ll_row]	
		ld_move_qty = this.getitemnumber(ll_row,"move_qty")
		if ld_move_qty > ld_qoh then
			messagebox("확인", "이동수량이 " + string(ld_move_qty, "#,###,###0") + "~r~n" &
							+ "저장소수량 " + string(ld_qoh, "#,###,###0") + " 보다 클수 없습니다.~r~n" )
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
END CHOOSE
this.setfocus()
return 2
end event

event rowfocuschanged;string ls_item
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
end if



end event

event clicked;this.accepttext()
end event

event losefocus;this.accepttext()
end event

type dw_4 from datawindow within w_iolocmove_m
integer x = 1083
integer y = 4
integer width = 82
integer height = 72
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_iolocmove_m
integer x = 1175
integer y = 4
integer width = 82
integer height = 72
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r1"
boolean livescroll = true
end type

type em_2 from editmask within w_iolocmove_m
integer x = 2958
integer y = 96
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

type em_1 from editmask within w_iolocmove_m
integer x = 2491
integer y = 96
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

type st_2 from statictext within w_iolocmove_m
integer x = 2880
integer y = 96
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

type rb_1 from radiobutton within w_iolocmove_m
integer x = 1344
integer y = 72
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;dw_1.setfilter('')
dw_1.filter()
dw_2.reset()
dw_3.reset()

string ls_moveno
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_moveno = dw_1.object.move_no[ll_row]
dw_2.retrieve(ls_moveno)
dw_3.retrieve(ls_moveno)

end event

type rb_2 from radiobutton within w_iolocmove_m
integer x = 1344
integer y = 140
integer width = 297
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "내자료"
end type

event clicked;dw_1.setfilter('log_id = "' + gs_userid + '"')
dw_1.filter()
dw_2.reset()
dw_3.reset()

string ls_moveno
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_moveno = dw_1.object.move_no[ll_row]
dw_2.retrieve(ls_moveno)
dw_3.retrieve(ls_moveno)

end event

type cb_1 from commandbutton within w_iolocmove_m
integer x = 2907
integer y = 1124
integer width = 1390
integer height = 112
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목다중추가"
end type

event clicked;long ll_row, ll_cnt
gs_where2 lstr_where

dw_3.accepttext()
dw_2.accepttext()
if dw_2.rowcount() < 1 then return

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = dw_2.object.src_loc[1]
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_3.SetReDraw(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_3.insertrow(0)
	if ll_cnt = 1 then 
		dw_3.object.seq[ll_cnt] = 1
	else
		dw_3.object.seq[ll_cnt] = dw_3.object.seq[ll_cnt - 1] + 1
	end if
	
	dw_3.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_3.object.qa[ll_cnt]      = trim(lstr_where.str2[ll_row])
	dw_3.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
	dw_3.object.uom[ll_row]     = trim(lstr_where.str3[ll_row])
	dw_3.object.qcnt[ll_cnt]    = lstr_where.qty1[ll_row]
	dw_3.object.move_qty[ll_cnt] = 0
next
dw_3.SetReDraw(TRUE)

dw_3.scrolltorow(1)
dw_3.setcolumn('move_qty')
dw_3.setfocus()


end event

type st_1 from statictext within w_iolocmove_m
integer x = 2907
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

type cbx_9 from checkbox within w_iolocmove_m
integer x = 2981
integer y = 272
integer width = 704
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
boolean enabled = false
string text = "신 양식(거래명세서)"
end type

type cbx_1 from checkbox within w_iolocmove_m
integer x = 1714
integer y = 80
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

type cbx_2 from checkbox within w_iolocmove_m
integer x = 1714
integer y = 140
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

type rb_a4 from radiobutton within w_iolocmove_m
integer x = 2094
integer y = 84
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

type rb_a5 from radiobutton within w_iolocmove_m
integer x = 2094
integer y = 148
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

type st_margin from statictext within w_iolocmove_m
integer x = 41
integer y = 180
integer width = 1271
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "none"
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_iolocmove_m
integer x = 1673
integer y = 16
integer width = 338
integer height = 204
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출력형태"
end type

type gb_4 from groupbox within w_iolocmove_m
integer x = 2030
integer y = 16
integer width = 416
integer height = 204
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출력용지"
end type

