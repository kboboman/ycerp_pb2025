$PBExportHeader$w_oigiaskcancel_m.srw
$PBExportComments$물품요청 접수취소관리(2001/03/02,이인호)
forward
global type w_oigiaskcancel_m from w_inheritance
end type
type gb_5 from groupbox within w_oigiaskcancel_m
end type
type dw_3 from datawindow within w_oigiaskcancel_m
end type
type em_1 from editmask within w_oigiaskcancel_m
end type
type em_2 from editmask within w_oigiaskcancel_m
end type
type st_1 from statictext within w_oigiaskcancel_m
end type
type dw_4 from datawindow within w_oigiaskcancel_m
end type
type dw_5 from datawindow within w_oigiaskcancel_m
end type
type dw_area from datawindow within w_oigiaskcancel_m
end type
type cbx_2 from checkbox within w_oigiaskcancel_m
end type
type cbx_3 from checkbox within w_oigiaskcancel_m
end type
type rb_a4 from radiobutton within w_oigiaskcancel_m
end type
type rb_a5 from radiobutton within w_oigiaskcancel_m
end type
type st_margin from statictext within w_oigiaskcancel_m
end type
type cbx_1 from checkbox within w_oigiaskcancel_m
end type
type cbx_4 from checkbox within w_oigiaskcancel_m
end type
type gb_7 from groupbox within w_oigiaskcancel_m
end type
type gb_8 from groupbox within w_oigiaskcancel_m
end type
type gb_4 from groupbox within w_oigiaskcancel_m
end type
type st_pick from structure within w_oigiaskcancel_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oigiaskcancel_m from w_inheritance
integer y = 100
integer width = 4585
integer height = 2820
string title = "물품요청 취소관리(w_oigiaskcancel_m)"
boolean resizable = false
gb_5 gb_5
dw_3 dw_3
em_1 em_1
em_2 em_2
st_1 st_1
dw_4 dw_4
dw_5 dw_5
dw_area dw_area
cbx_2 cbx_2
cbx_3 cbx_3
rb_a4 rb_a4
rb_a5 rb_a5
st_margin st_margin
cbx_1 cbx_1
cbx_4 cbx_4
gb_7 gb_7
gb_8 gb_8
gb_4 gb_4
end type
global w_oigiaskcancel_m w_oigiaskcancel_m

type variables
st_print i_print
date id_start, id_end
string is_order_no

end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);w_repsuper w_print
st_print   l_print

string ls_orderno, ls_dr, ls_tarea, ls_tname, ls_farea, ls_fname, ls_item_no, ls_real_uom
string ls_uom, ls_qa, ls_rem, ls_item_name, ls_issue_qty, ls_acc_qty, ls_act_user,ls_ask_user
long ll_count, ll_idx, ll_int
string ls_chk

dw_1.accepttext()
ls_orderno = dw_1.object.ask_no[1]	
ls_dr      = trim(dw_1.object.driver[1])
ll_idx     = 0
ll_int     = 0
arg_dw.reset()

ls_tarea = dw_1.object.t_area[1]
SELECT area_name INTO :ls_tname    FROM area  WHERE area_no = :ls_tarea;
ls_farea = dw_1.object.f_area[1]
SELECT area_name INTO :ls_fname    FROM area  WHERE area_no = :ls_farea;
 
ls_farea = dw_1.object.act_user[1]
SELECT user_name INTO :ls_act_user FROM login WHERE user_id = :ls_farea;
ls_farea = dw_1.object.ask_user[1]
SELECT user_name INTO :ls_ask_user FROM login WHERE user_id = :ls_farea;
		 
ls_chk = "N"
for ll_count = 1 to dw_2.rowcount()
	if  dw_2.object.issue_qty[ll_count] <= 0 then continue
	
	ls_chk = "Y"
	if ll_idx = 0 then
		ll_int = ll_int + 1
	   arg_dw.object.do_date[ll_int]  = string(dw_1.object.act_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int]    = dw_1.object.ask_no[1]
 	   arg_dw.object.addr[ll_int]     = trim(ls_fname) + " 에서 " + trim(ls_tname) + " 으로 출고"
		 
      arg_dw.object.ls_user[ll_int]  = ls_act_user
      arg_dw.object.cust[ll_int]     = ls_ask_user
//   	arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	
	ll_idx = ll_idx + 1
	ls_item_no = dw_2.object.item_no[ll_count]
	setnull(ls_uom)
	SELECT uom INTO :ls_uom FROM groupitem  WHERE item_no = :ls_item_no;
	ls_qa  = dw_2.object.qa[ll_count]
	ls_rem = dw_2.object.rem[ll_count]
	setnull(ls_item_name)
   SELECT item_name INTO :ls_item_name FROM item
	   WHERE item_no = :ls_item_no
		  AND qa = :ls_qa;
	ls_issue_qty = string(dw_2.object.issue_qty[ll_count], '###,###,###.00')
	
	if LeftA( ls_item_no ,1) = 'P' and MidA(ls_item_no, 3,1) = 'Y' &
		and (MidA(ls_item_no, 7,1) = 'A' 	or MidA(ls_item_no, 7,1) = 'B' &
				or MidA(ls_item_no, 7,1) = 'C' or MidA(ls_item_no, 7,1) = 'D') then
		ls_acc_qty = ls_issue_qty
	else
		if ls_uom = 'M2' or ls_uom = "SS" then
			ls_acc_qty = string(truncate( long(MidA( ls_qa ,5,4)) &
					* long(MidA(ls_qa,10,4)) &
						* dw_2.object.issue_qty[ll_count] / 1000000 + 0.000000001, 2), '###,###,###.00')
		else
			if ls_uom = 'M' then
				if  dw_2.object.issue_qty[ll_count] < 0 then
					ls_acc_qty = string(truncate(long(MidA(  ls_qa , 15,5)) *  &
					dw_2.object.issue_qty[ll_count] / 1000 - 0.00001,2), '###,###,###.00')
				else
					ls_acc_qty = string(truncate(long(MidA(  ls_qa , 15,5)) &
						*  dw_2.object.issue_qty[ll_count] / 1000 + 0.00001,2) , '###,###,###.00')
				end if
			else
				ls_acc_qty = ls_issue_qty
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
	ls_qa = MidA(dw_2.object.qa[ll_count], 1, 3) + ' X ' + &
		     MidA(dw_2.object.qa[ll_count], 5, 4) + ' X ' + &
		     MidA(dw_2.object.qa[ll_count], 10, 4) + ' X ' + &
		     MidA(dw_2.object.qa[ll_count], 15, 5)
			  
	arg_dw.setitem(ll_int, 'item_' + string(ll_idx), ls_item_name)
	arg_dw.setitem(ll_int, 'qa_'   + string(ll_idx), ls_qa)
	arg_dw.setitem(ll_int, 'auom_' + string(ll_idx), ls_uom) //ls_real_uom)
	arg_dw.setitem(ll_int, 'ship_' + string(ll_idx),  ls_issue_qty )//ls_ship_qty)
	arg_dw.setitem(ll_int, 'buom_' + string(ll_idx), ls_real_uom) //ls_uom)
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

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
id_start  = date(em_1.text)
id_end    = date(em_2.text)
id_end    = RelativeDate(id_end ,1)

dw_4.visible = false
dw_5.visible = false
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

on w_oigiaskcancel_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_area=create dw_area
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.rb_a4=create rb_a4
this.rb_a5=create rb_a5
this.st_margin=create st_margin
this.cbx_1=create cbx_1
this.cbx_4=create cbx_4
this.gb_7=create gb_7
this.gb_8=create gb_8
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.dw_area
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.cbx_3
this.Control[iCurrent+11]=this.rb_a4
this.Control[iCurrent+12]=this.rb_a5
this.Control[iCurrent+13]=this.st_margin
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.cbx_4
this.Control[iCurrent+16]=this.gb_7
this.Control[iCurrent+17]=this.gb_8
this.Control[iCurrent+18]=this.gb_4
end on

on w_oigiaskcancel_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_area)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.rb_a4)
destroy(this.rb_a5)
destroy(this.st_margin)
destroy(this.cbx_1)
destroy(this.cbx_4)
destroy(this.gb_7)
destroy(this.gb_8)
destroy(this.gb_4)
end on

event resize;call super::resize;//
dw_2.width  = this.width  - 82
dw_2.height = this.height - 1308

end event

type pb_save from w_inheritance`pb_save within w_oigiaskcancel_m
integer x = 4142
integer y = 60
integer taborder = 100
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;string ls_toloc, ls_fromloc, ls_flag, ls_null, ls_item, ls_str, ls_qa
string ls_cnt, ls_order, ls_destination, ls_old_time, ls_all
real   lr_newqty
long   ll_row, ll_count
date   ld_date
dwitemstatus l_status

dw_1.accepttext()
dw_2.accepttext()

setnull(ls_null)
if dw_1.rowcount() < 1 then return

if MessageBox("확인", "선택하신자료를 처리하시겠습니까 ",Exclamation!, OKCancel!, 1) = 2 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_date = date(dw_1.object.act_date[1])
ls_all  = "N"
for ll_row = 1 to dw_2.rowcount()
	l_status = dw_2.getitemstatus(ll_row, 0, primary!)

	if l_status = NotModified! then continue
	if dw_2.object.chk[ll_row] <> 'Y' then continue
	
	ls_all     = "Y"
//	dw_2.object.rlse_flag[row] = 'Y'
	dw_2.object.rlse_flag[ll_row] = 'N'
   ls_order   = dw_1.object.ask_no[1]
	ls_toloc   = dw_1.object.ask_loc[1]
   ls_item    = trim(dw_2.object.item_no[ll_row])
   ls_fromloc = dw_2.getitemstring(ll_row, 'loc_no', Primary!, true)
   lr_newqty  = dw_2.getitemnumber(ll_row, 'issue_qty', Primary!, true) * -1
   ls_qa      = trim(dw_2.object.qa[ll_row])
   ls_cnt     = string(dw_2.object.seq_no[ll_row])
   ls_destination = trim(dw_2.object.rem[ll_row])
	
   // 물품저장소 출고
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
	       inaudit_type,serial_id,cost,destination, user_id)
   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,0,:lr_newqty,:ls_fromloc, 'IK',:ls_cnt,0,:ls_toloc, :gs_userid);
   if sqlca.sqlcode < 0 then
      MessageBox('오류1','[inaudit] insert중 DB오류가 발생했습니다.~r~n ' &
							+ string(sqlca.sqlerrtext),exclamation!)
      rollback;
      return 
   end if
	
	ls_old_time = string(now(), 'hh:mm:ss:fff')
	for ll_count = 1 to 100000
		if ls_old_time <> string(now(),'hh:mm:ss:fff') then
			ls_old_time  = string(now(),'hh:mm:ss:fff')	
			exit
		end if	
	next

   // 물품저장소 입고
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
	 	    inaudit_type,serial_id,cost,destination, user_id)
   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,:lr_newqty,0,:ls_toloc, 'RK',:ls_cnt,0,:ls_fromloc, :gs_userid);
   if sqlca.sqlcode < 0 then
      MessageBox('오류1','[inaudit] insert중 DB오류가 발생했습니다.~r~n ' &
							+ string(sqlca.sqlerrtext),exclamation!)
      rollback;
      return 
   end if
next

if ls_all = "N" then
	MessageBox("확인", "선택하신자료가 없습니다.")
	return
end if	

ls_all = "N"
for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.rlse_flag[ll_row] = 'Y' THEN
		ls_all = "P"
		exit
	end if
next

dw_1.object.proc_flag[1] = ls_all
if ls_all = 'N' then dw_1.object.ship_close[1] = ls_null

dw_1.object.act_user[1] = gs_userid
dw_1.object.act_date[1] = gf_today()
if wf_update2(dw_1, dw_2, 'Y') = true then
	pb_retrieve.postevent(clicked!)
end if

end event

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"요청취소",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_oigiaskcancel_m
integer x = 2217
integer y = 280
integer width = 1943
integer height = 572
integer taborder = 120
string dataobject = "d_oigiaskcancel_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_oigiaskcancel_m
integer x = 37
integer y = 1196
integer width = 4503
integer height = 1512
integer taborder = 140
string dataobject = "d_oigiaskcadet_m"
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;
choose case dwo.name
	case 'chk'
		return  1
end choose
return 0
end event

event dw_2::itemerror;call super::itemerror;string ls_null

setnull(ls_null)

choose case dwo.name
	case 'chk'
		if data = 'N' then
			dw_2.object.chk[row] = 'N'
			dw_2.object.issue_qty[row] = dw_2.getitemnumber(row,'issue_qty', Primary!, true)
			dw_2.object.rlse_qty[row] = dw_2.getitemnumber(row,'rlse_qty', Primary!, true)
			dw_2.object.loc_no[row] = dw_2.getitemstring(row,'loc_no', Primary!, true)
			dw_2.object.loc_name[row] = dw_2.getitemstring(row,'loc_name', Primary!, true)
			dw_2.SetItemStatus(row, 0, Primary!, notModified!)
		else
			dw_2.object.chk[row] = 'Y'
			dw_2.object.rlse_qty[row] = dw_2.object.rlse_qty[row] - dw_2.object.issue_qty[row]
			dw_2.object.issue_qty[row] = 0
			dw_2.object.loc_no[row] = ls_null
			dw_2.object.loc_name[row] = ls_null
		end if
end choose
return 2
end event

type st_title from w_inheritance`st_title within w_oigiaskcancel_m
integer x = 46
integer width = 1088
string text = "물품요청 취소관리"
end type

type st_tips from w_inheritance`st_tips within w_oigiaskcancel_m
end type

type pb_compute from w_inheritance`pb_compute within w_oigiaskcancel_m
boolean visible = false
integer x = 2816
integer taborder = 190
boolean enabled = false
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품이동",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oigiaskcancel_m
boolean visible = false
integer x = 3753
integer y = 60
integer taborder = 60
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "목동"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;//if dw_1.rowcount() > 0 then
//	wf_print(dw_4)
//end if
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"목동인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oigiaskcancel_m
integer x = 4329
integer y = 60
integer taborder = 200
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiaskcancel_m
integer x = 3941
integer y = 60
integer taborder = 210
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_prt
string old_dwnm
old_dwnm = dw_5.dataobject

if dw_1.rowcount() < 1 then return

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

PrintSetup()
if messagebox("확인1","선택된 물품 요청번호 전체를 프린터로 출력합니다.~r~n" + &
	"1개의 물품요청번호에 출력됩니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	return
end if

if cbx_2.checked = true then	// 명세
	if rb_A4.checked = true then	// A4 양식
		dw_5.dataobject = 'd_oigiving_r_21'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else
		dw_5.dataobject = 'd_oigiving_r_21_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if

if cbx_2.checked = true then	// 인수
	if rb_A4.checked = true then	// A4 양식
		dw_5.dataobject = 'd_oigiving_r_22'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else									// A5 양식
		dw_5.dataobject = 'd_oigiving_r_22_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if

if cbx_3.checked = true then	// 출고
	if rb_A4.checked = true then	// A4 양식
		dw_5.dataobject = 'd_oigiving_r_23'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else
		dw_5.dataobject = 'd_oigiving_r_23_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if

if cbx_4.checked = true then	// 납품
	if rb_A4.checked = true then	// A4 양식
		dw_5.dataobject = 'd_oigiving_r_24'
		dw_5.Modify('DataWindow.Print.Paper.Size = 9')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	else
		dw_5.dataobject = 'd_oigiving_r_24_a5'
		dw_5.Modify('DataWindow.Print.Paper.Size = 11')
		dw_5.Modify('DataWindow.Print.Orientation = 1')
		dw_5.modify("DataWindow.print.margin.left = " + ls_left )
		dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_5.settransobject(sqlca)
		wf_print(dw_5)
		dw_5.print()
	end if
end if
dw_5.dataobject = old_dwnm

end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiaskcancel_m
integer x = 4151
integer y = 1044
integer width = 361
integer height = 112
integer taborder = 220
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;long   ll_row
string ls_null

if dw_2.rowcount() < 1 then return

setnull(ls_null)
for ll_row = 1 to dw_2.rowcount()
	dw_2.object.rlse_flag[ll_row] = 'N'
	dw_2.object.rlse_qty[ll_row]  = dw_2.object.rlse_qty[ll_row] - dw_2.object.issue_qty[ll_row]
	dw_2.object.issue_qty[ll_row] = 0
	dw_2.object.loc_no[ll_row]    = ls_null
	dw_2.object.loc_name[ll_row]  = ls_null
next
dw_1.object.proc_flag[1] = 'N'

end event

type pb_delete from w_inheritance`pb_delete within w_oigiaskcancel_m
boolean visible = false
integer x = 2779
integer y = 68
integer taborder = 230
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oigiaskcancel_m
boolean visible = false
integer x = 2592
integer y = 72
integer taborder = 240
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiaskcancel_m
integer x = 3744
integer y = 60
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_3.retrieve(id_start, id_end, dw_area.object.area[1])

end event

type gb_3 from w_inheritance`gb_3 within w_oigiaskcancel_m
integer x = 2194
integer y = 240
integer width = 2345
integer height = 936
integer taborder = 170
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oigiaskcancel_m
integer x = 37
integer y = 240
integer width = 2144
integer height = 936
integer taborder = 180
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiaskcancel_m
integer x = 3717
integer y = 8
integer width = 823
integer height = 216
integer taborder = 110
long backcolor = 79220952
end type

type gb_5 from groupbox within w_oigiaskcancel_m
integer x = 1952
integer y = 8
integer width = 850
integer height = 216
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "요청일자"
end type

type dw_3 from datawindow within w_oigiaskcancel_m
integer x = 55
integer y = 280
integer width = 2103
integer height = 876
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oigiaskcancel_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.Getrow()

if ll_row < 1 then return

is_order_no = this.object.ask_no[ll_row]

dw_1.retrieve(is_order_no)
dw_2.retrieve(is_order_no)
dw_2.object.loc_no.tabsequence = 0
dw_2.object.issue_qty.tabsequence = 0
dw_2.object.rem.tabsequence = 0

end event

event retrieveend;long ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row > 0 and this.rowcount() = 1 then
	dw_1.retrieve(this.object.ask_no[ll_row])
	dw_2.retrieve(this.object.ask_no[ll_row])
end if

end event

type em_1 from editmask within w_oigiaskcancel_m
integer x = 1984
integer y = 88
integer width = 357
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_start = date(this.text)
end if

end event

type em_2 from editmask within w_oigiaskcancel_m
integer x = 2409
integer y = 92
integer width = 357
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)
id_end = RelativeDate(id_end ,1)
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_end = date(this.text)
	id_end = RelativeDate(id_end ,1)
end if

end event

type st_1 from statictext within w_oigiaskcancel_m
integer x = 2345
integer y = 88
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_oigiaskcancel_m
integer x = 910
integer y = 20
integer width = 91
integer height = 72
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oigiaskcancel_m
integer x = 1010
integer y = 20
integer width = 91
integer height = 72
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r_21_a5"
boolean livescroll = true
end type

type dw_area from datawindow within w_oigiaskcancel_m
integer x = 1394
integer y = 88
integer width = 517
integer height = 84
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type cbx_2 from checkbox within w_oigiaskcancel_m
integer x = 3058
integer y = 76
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "인수"
boolean checked = true
end type

type cbx_3 from checkbox within w_oigiaskcancel_m
integer x = 2839
integer y = 140
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고"
boolean checked = true
end type

type rb_a4 from radiobutton within w_oigiaskcancel_m
integer x = 3351
integer y = 76
integer width = 311
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "A4 양식"
end type

type rb_a5 from radiobutton within w_oigiaskcancel_m
integer x = 3351
integer y = 144
integer width = 311
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "A5 양식"
boolean checked = true
end type

type st_margin from statictext within w_oigiaskcancel_m
integer x = 2217
integer y = 1084
integer width = 1143
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "여백"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_oigiaskcancel_m
integer x = 2839
integer y = 76
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "명세"
end type

type cbx_4 from checkbox within w_oigiaskcancel_m
integer x = 3058
integer y = 140
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "납품"
boolean checked = true
end type

type gb_7 from groupbox within w_oigiaskcancel_m
integer x = 2816
integer y = 8
integer width = 480
integer height = 216
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력"
end type

type gb_8 from groupbox within w_oigiaskcancel_m
integer x = 3310
integer y = 8
integer width = 384
integer height = 216
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력용지"
end type

type gb_4 from groupbox within w_oigiaskcancel_m
integer x = 1367
integer y = 8
integer width = 571
integer height = 216
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사업장"
end type

