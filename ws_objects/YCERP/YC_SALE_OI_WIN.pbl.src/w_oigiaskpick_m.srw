$PBExportHeader$w_oigiaskpick_m.srw
$PBExportComments$물품요청 접수관리(1998/10/30,성삼지)
forward
global type w_oigiaskpick_m from w_inheritance
end type
type dw_3 from datawindow within w_oigiaskpick_m
end type
type em_2 from editmask within w_oigiaskpick_m
end type
type dw_4 from datawindow within w_oigiaskpick_m
end type
type dw_5 from datawindow within w_oigiaskpick_m
end type
type st_3 from statictext within w_oigiaskpick_m
end type
type cbx_1 from checkbox within w_oigiaskpick_m
end type
type dw_area from datawindow within w_oigiaskpick_m
end type
type cbx_2 from checkbox within w_oigiaskpick_m
end type
type cbx_3 from checkbox within w_oigiaskpick_m
end type
type cbx_4 from checkbox within w_oigiaskpick_m
end type
type cbx_5 from checkbox within w_oigiaskpick_m
end type
type gb_8 from groupbox within w_oigiaskpick_m
end type
type gb_7 from groupbox within w_oigiaskpick_m
end type
type em_1 from editmask within w_oigiaskpick_m
end type
type st_vertical from u_splitbar_vertical within w_oigiaskpick_m
end type
type st_horizontal from u_splitbar_horizontal within w_oigiaskpick_m
end type
type st_4 from statictext within w_oigiaskpick_m
end type
type st_5 from statictext within w_oigiaskpick_m
end type
type st_6 from statictext within w_oigiaskpick_m
end type
type ddlb_fld from dropdownlistbox within w_oigiaskpick_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oigiaskpick_m
end type
type st_7 from statictext within w_oigiaskpick_m
end type
type sle_value from singlelineedit within w_oigiaskpick_m
end type
type cb_1 from commandbutton within w_oigiaskpick_m
end type
type cb_2 from commandbutton within w_oigiaskpick_m
end type
type cb_3 from commandbutton within w_oigiaskpick_m
end type
type cb_5 from commandbutton within w_oigiaskpick_m
end type
type st_left from statictext within w_oigiaskpick_m
end type
type em_left from editmask within w_oigiaskpick_m
end type
type st_9 from statictext within w_oigiaskpick_m
end type
type em_top from editmask within w_oigiaskpick_m
end type
type ddlb_op from dropdownlistbox within w_oigiaskpick_m
end type
type em_3 from editmask within w_oigiaskpick_m
end type
type st_2 from statictext within w_oigiaskpick_m
end type
type em_4 from editmask within w_oigiaskpick_m
end type
type gb_6 from groupbox within w_oigiaskpick_m
end type
type st_pick from structure within w_oigiaskpick_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oigiaskpick_m from w_inheritance
integer y = 212
integer width = 4910
integer height = 2524
string title = "물품요청 접수관리(w_oigiaskpick_m)"
dw_3 dw_3
em_2 em_2
dw_4 dw_4
dw_5 dw_5
st_3 st_3
cbx_1 cbx_1
dw_area dw_area
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
gb_8 gb_8
gb_7 gb_7
em_1 em_1
st_vertical st_vertical
st_horizontal st_horizontal
st_4 st_4
st_5 st_5
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_left st_left
em_left em_left
st_9 st_9
em_top em_top
ddlb_op ddlb_op
em_3 em_3
st_2 st_2
em_4 em_4
gb_6 gb_6
end type
global w_oigiaskpick_m w_oigiaskpick_m

type variables
//
st_print i_print
datawindowchild idwc_scene, idwc_locno, idwc_car

string is_locnosql, is_order_no
date   id_start, id_end

end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);w_repsuper w_print
st_print   l_print

string ls_orderno, ls_dr, ls_tarea, ls_tname, ls_farea, ls_fname, ls_item_no, ls_real_uom
string ls_uom,   ls_qa, ls_rem, ls_item_name, ls_issue_qty, ls_acc_qty, ls_act_user,ls_ask_user
long   ll_count, ll_idx, ll_int, ll_line_cnt
string ls_chk,   ls_price, ls_saleno, ls_custnm

dw_1.accepttext()

ls_orderno = dw_1.object.ask_no[1]	
ls_dr      = trim(dw_1.object.rem2[1])
ll_idx     = 0
ll_int     = 0
arg_dw.reset()

ls_tarea = dw_1.object.t_area[1]			// 요청지
SELECT area_name INTO :ls_tname    FROM area  WHERE area_no = :ls_tarea;
 
ls_farea = dw_1.object.f_area[1]			// 접수지
SELECT area_name INTO :ls_fname    FROM area  WHERE area_no = :ls_farea;
 
ls_farea = dw_1.object.act_user[1]		// 접수자
SELECT user_name INTO :ls_act_user FROM login WHERE user_id = :ls_farea;

ls_farea = dw_1.object.ask_user[1]		// 요청자
SELECT user_name INTO :ls_ask_user FROM login WHERE user_id = :ls_farea;
		 
ll_line_cnt = 16		// 라인줄수

ls_chk = "N"
for ll_count = 1 to dw_2.rowcount()
	if dw_2.object.sel[ll_count] ='N' then continue		// SKIP
	
	ls_chk = "Y"
	if ll_idx = 0 then
		ll_int = ll_int + 1
	   arg_dw.object.do_date[ll_int]  = string(dw_1.object.act_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int]    = dw_1.object.ask_no[1]
 	   arg_dw.object.addr[ll_int]     = trim(ls_fname) + " 에서 " + trim(ls_tname) + " 으로 출고"
 	   arg_dw.object.register[ll_int] = trim(ls_fname) // 출고사업장
 	   arg_dw.object.cust[ll_int]     = trim(ls_tname)	// 입고사업장

		if arg_dw.dataobject = 'd_oigiving_r_22_a5' then		// 인수증
			arg_dw.object.acc_24[1] = "*" + dw_1.object.ask_no[1] + "*"
			arg_dw.object.acc_25[1] = "*" + dw_1.object.ask_no[1] + "*"
		end if

      arg_dw.object.ls_user[ll_int]  = ls_act_user		// 출력자
	// arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	
	ll_idx     = ll_idx + 1
	ls_item_no = dw_2.object.item_no[ll_count]
	SELECT uom INTO :ls_uom FROM groupitem WHERE item_no = :ls_item_no;
	ls_qa      = dw_2.object.qa[ll_count]
	ls_rem     = dw_2.object.rem[ll_count]
	
   SELECT item_name INTO :ls_item_name FROM item  WHERE item_no = :ls_item_no AND qa = :ls_qa;
	ls_issue_qty = string(dw_2.object.issue_qty[ll_count], '###,###,###.00')
	
	ls_saleno  = dw_2.object.sale_no[ll_count]	// 사내이동시 수주번호를 금액난에 출력함
	ls_custnm  = dw_2.object.cust_name[ll_count]	// 사내이동시 거래처를 비고난에 출력함
	
	if LeftA( ls_item_no ,1) = 'P' and MidA(ls_item_no, 3,1) = 'Y' &
		and (MidA(ls_item_no, 7,1) = 'A' or MidA(ls_item_no, 7,1) = 'B' or &
			  MidA(ls_item_no, 7,1) = 'C' or MidA(ls_item_no, 7,1) = 'D') then
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
						        * dw_2.object.issue_qty[ll_count] / 1000 + 0.00001,2) , '###,###,###.00')
				end if
			else
				ls_acc_qty = ls_issue_qty
			end if
		end if
	end if
	
	if trim(ls_uom) = 'M' OR ls_uom = 'M2' then
   	ls_real_uom ='EA'
	else
		if ls_uom = "SS" then
			ls_real_uom = "SH"
			ls_uom      = "M2"
		else
	     	ls_real_uom = ls_uom
		end if
	end if
////////////////////////// insert easthero end

	ls_qa = dw_2.object.qa[ll_count]
  	ls_qa = MidA(ls_qa,  1, 3) + ' X ' + MidA(ls_qa,  5, 4) + ' X ' + &
		     MidA(ls_qa, 10, 4) + ' X ' + MidA(ls_qa, 15, 5) 			  
			  
	arg_dw.setitem(ll_int, 'item_' + string(ll_idx), ls_item_name)
	arg_dw.setitem(ll_int, 'qa_'   + string(ll_idx), ls_qa)
	arg_dw.setitem(ll_int, 'auom_' + string(ll_idx), ls_uom)        //ls_real_uom)
	arg_dw.setitem(ll_int, 'ship_' + string(ll_idx), ls_issue_qty ) //ls_ship_qty)
	arg_dw.setitem(ll_int, 'buom_' + string(ll_idx), ls_real_uom)   //ls_uom)
	arg_dw.setitem(ll_int, 'acc_'  + string(ll_idx), ls_acc_qty)
	// 사내이동시 출력안함
	//	arg_dw.setitem(ll_int, 'cost_' + string(ll_idx), ls_price)
	// arg_dw.setitem(ll_int, 'price_'+ string(ll_idx), ls_amount)
	//	arg_dw.setitem(ll_int, 'rate_' + string(ll_idx), ls_rate_cash)
	//	arg_dw.setitem(ll_int, 'pdate' + string(ll_idx), DATE(ld_date))
	arg_dw.setitem(ll_int, 'desc'  + string(ll_idx), ls_saleno + "," + ls_custnm)

	if ll_idx = ll_line_cnt then // A4 : 25, A5 : 16
		arg_dw.object.dr_man[ll_int] = ls_dr
		ll_idx = 0
	end if
next

if ls_chk = "N" then return
arg_dw.object.dr_man[ll_int] = ls_dr

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_3)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_3)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//////////////////////////////////////////////////////////////////////////////
string  ls_left, ls_top

ls_left = ProfileString("YCERP.INI","DO_PRT","LEFT", " ")
ls_top  = ProfileString("YCERP.INI","DO_PRT","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = "115"
if isnull(ls_top)  OR ls_top  = "" then ls_top  = "110"

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////

long ll_row

dw_3.settransobject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//if left(gs_area,1) = "S" then
//	em_3.text = "HD" + string(today(), "yyyymmdd")
//else
//	em_3.text = left(gs_area, 1) + "D" + string(today(), "yyyymmdd")
//end if


em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

id_start  = date(em_1.text)
id_end    = date(em_2.text)
id_end    = RelativeDate(id_end, 1)

pb_print.visible = false
dw_4.visible = false
dw_5.visible = false

// 요청항목
dw_2.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)

is_locnosql = idwc_locno.describe("datawindow.table.select")

dw_1.getchild("driver", idwc_car)


end event

on w_oigiaskpick_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_2=create em_2
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_3=create st_3
this.cbx_1=create cbx_1
this.dw_area=create dw_area
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.gb_8=create gb_8
this.gb_7=create gb_7
this.em_1=create em_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_left=create st_left
this.em_left=create em_left
this.st_9=create st_9
this.em_top=create em_top
this.ddlb_op=create ddlb_op
this.em_3=create em_3
this.st_2=create st_2
this.em_4=create em_4
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.cbx_2
this.Control[iCurrent+9]=this.cbx_3
this.Control[iCurrent+10]=this.cbx_4
this.Control[iCurrent+11]=this.cbx_5
this.Control[iCurrent+12]=this.gb_8
this.Control[iCurrent+13]=this.gb_7
this.Control[iCurrent+14]=this.em_1
this.Control[iCurrent+15]=this.st_vertical
this.Control[iCurrent+16]=this.st_horizontal
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.ddlb_fld
this.Control[iCurrent+21]=this.ddlb_dwtitles
this.Control[iCurrent+22]=this.st_7
this.Control[iCurrent+23]=this.sle_value
this.Control[iCurrent+24]=this.cb_1
this.Control[iCurrent+25]=this.cb_2
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.st_left
this.Control[iCurrent+29]=this.em_left
this.Control[iCurrent+30]=this.st_9
this.Control[iCurrent+31]=this.em_top
this.Control[iCurrent+32]=this.ddlb_op
this.Control[iCurrent+33]=this.em_3
this.Control[iCurrent+34]=this.st_2
this.Control[iCurrent+35]=this.em_4
this.Control[iCurrent+36]=this.gb_6
end on

on w_oigiaskpick_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_2)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.dw_area)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.gb_8)
destroy(this.gb_7)
destroy(this.em_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_left)
destroy(this.em_left)
destroy(this.st_9)
destroy(this.em_top)
destroy(this.ddlb_op)
destroy(this.em_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.gb_6)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = dw_3.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.y      = dw_3.y + dw_3.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_oigiaskpick_m
integer x = 4439
integer y = 64
integer taborder = 60
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
string  ls_area, ls_sdate, ls_edate, ls_sale_no
string  ls_toloc, ls_fromloc, ls_null, ls_item, ls_str, ls_qa
string  ls_cnt,   ls_order,   ls_destination, ls_old_time, ls_all, ls_sqlerrtext
decimal ld_qoh, ld_issue_qty, ld_ask_qty, ld_rlse_qty
real    lr_newqty
long    ll_row, ll_count
date    ld_date

dw_area.accepttext()
ls_area = dw_area.object.area[1]

dw_1.accepttext()
dw_2.accepttext()

setnull(ls_null)

if dw_1.rowcount() < 1 then RETURN

if dw_1.object.proc_flag[1] = "Y" then
	MessageBox("확인","이미 요청처리가 완료 되었습니다.")
	RETURN
end if
if MessageBox("확인", "선택하신 자료를 처리 하시겠습니까?",Exclamation!, OKCancel!, 1) = 2 then
	RETURN
end if

for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.sel[ll_row] = 'N' then continue
	
	if dw_2.object.issue_qty[ll_row] = 0  then
		MessageBox("확인", "수량이 없습니다.")
		dw_2.scrolltorow(ll_row)
		RETURN
	end if

      ld_qoh       	= dw_2.object.qoh[ll_row]	
	ld_issue_qty = dw_2.getitemnumber(ll_row,"issue_qty")
	ld_ask_qty   = dw_2.getitemnumber(ll_row,"ask_qty")
     ld_rlse_qty  = dw_2.object.rlse_qty[ll_row]
	
	if ld_issue_qty > ld_qoh then
		dw_2.object.issue_qty[ll_row] = 0
		dw_2.scrolltorow(ll_row)
		dw_2.setcolumn('issue_qty')
		dw_2.setfocus()

		MessageBox("확인", "출고수량이 " + string(ld_issue_qty, "#,###,###0") + "~r~n" &
						+ "저장소수량 " + string(ld_qoh, "#,###,###0") + " 보다 클수 없습니다.~r~n" )
		RETURN
	end if
	
	if (ld_rlse_qty + ld_issue_qty) > ld_ask_qty then
		dw_2.object.issue_qty[ll_row] = 0		
		dw_2.scrolltorow(ll_row)
		dw_2.setcolumn('issue_qty')
		dw_2.setfocus()

		MessageBox("확인", "출고수량이 요청수량보다 클수 없습니다.")
		RETURN
	end if		
next

ls_all = "N"
for ll_row = 1 to dw_2.rowcount()
	
	if dw_2.object.sel[ll_row] = 'N' then continue /* 2019.06.18 jowonsuk 내용 추가 */
	
	if isnull(dw_2.object.loc_no[ll_row]) OR trim(dw_2.object.loc_no[ll_row]) = "" then
		CONTINUE
	end if
	
	l_status = dw_2.getitemstatus(ll_row, 0, primary!)
	if l_status = NotModified! then CONTINUE
		
	ls_order   = dw_1.object.ask_no[1]
	ls_toloc   = dw_1.object.ask_loc[1]
	ls_item    = trim(dw_2.object.item_no[ll_row])
	ls_fromloc = trim(dw_2.object.loc_no[ll_row])
	lr_newqty  = dw_2.object.issue_qty[ll_row]
	ld_ask_qty = dw_2.object.ask_qty[ll_row]
	ls_qa      = trim(dw_2.object.qa[ll_row])
	ls_cnt     = string(dw_2.object.seq_no[ll_row])
	ls_destination = trim(dw_2.object.rem[ll_row])
	
	if ls_all = "N" and lr_newqty <> 0 then
		ls_all = 'Y'
	end if
	
	if ls_all = 'Y' and dw_2.object.rlse_qty[ll_row] + lr_newqty < ld_ask_qty then
		ls_all = "P"
	end if
	
	if ls_all = "N" then CONTINUE
	
  // 물품저장소 출고
	ld_date = date(dw_1.object.act_date[1])
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
	 	    inaudit_type,serial_id,cost,destination, rem, user_id )
   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,0,:lr_newqty,:ls_fromloc,
	 	    'IK',:ls_cnt,0,:ls_toloc, '물품요청출고', :gs_userid );
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
      ROLLBACK;
      MessageBox('오류1','[inaudit] insert중 DB오류가 발생했습니다.~r~n ' &
							+ string(sqlca.sqlerrtext),exclamation!)
      RETURN 
   end if
	
	ls_old_time  = string(now(), 'hh:mm:ss:fff')
	for ll_count = 1 to 100000
		if ls_old_time <> string(now(),'hh:mm:ss:fff') then
			ls_old_time  = string(now(),'hh:mm:ss:fff')	
			EXIT
		end if
	next
	
   // 물품저장소 입고
	ld_date = date(dw_1.object.act_date[1])
   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
	 	    inaudit_type,serial_id,cost,destination, rem, user_id)
   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,:lr_newqty,0,:ls_toloc,
	 	    'RK',:ls_cnt,0,:ls_fromloc, '물품요청입고', :gs_userid );
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
      ROLLBACK;
      MessageBox('오류1','[inaudit] insert중 DB오류가 발생했습니다.~r~n ' &
							+ string(sqlca.sqlerrtext),exclamation!)
      RETURN 
   end if
	
   dw_2.object.rlse_date[ll_row] = gf_today()
   dw_2.object.rlse_qty[ll_row]  = dw_2.object.rlse_qty[ll_row] + lr_newqty
	if dw_2.object.rlse_qty[ll_row] >= ld_ask_qty then
	   dw_2.object.rlse_flag[ll_row] = 'Y'
	end if
next

if ls_all = "N" then
	MessageBox("확인", "선택한 자료가 없습니다.")
	RETURN
end if	

ls_all = "Y"
for ll_row = 1 to dw_2.rowcount()
	
	IF dw_2.object.rlse_flag[ll_row] = 'N' THEN
		ls_all = "P"
		exit
	END IF
next

dw_1.object.proc_flag[1]   = ls_all
dw_1.object.act_user[1]    = gs_userid
dw_1.object.ship_date[1]   = dw_1.object.act_date[1]	// wf_today() : 2007-06-21 운반일자를 접수일자로 같게함.
dw_1.object.log_date[1]    = gf_today()
dw_1.object.ship_close[1]  = 'O'
dw_1.object.f_area[1]      = dw_area.object.area[1]

if WF_Update2( dw_1, dw_2, "Y" ) = true then
	/*2019-11-21 jowonsuk 담당자 요청사항 */
//	dw_2.object.loc_no.tabsequence    = 0
//	dw_2.object.issue_qty.tabsequence = 0
//	dw_2.object.rem.tabsequence       = 0

	if MessageBox("확인", "선택한 자료는 처리완료 되었습니다. ~r~n" &
			+ "사내송장을 출력 하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 then
		pb_print.triggerevent(clicked!)
	end if

	ls_sdate  = GF_ReplaceAll(em_1.text,"/","-") + " 00:00:00.000"
	ls_edate  = GF_ReplaceAll(em_2.text,"/","-") + " 23:59:59.999"

	/*2018.05.09  jowonsuk 내용 보완 */
	if isnull(ls_sale_no) OR ls_sale_no = '' then 	
		ls_sale_no = '%'
	else	
		ls_sale_no = trim(em_3.text) + '-' + RightA ( "000" + trim(em_4.text), 3)	
	end if

	dw_3.retrieve( ls_area, ls_sdate, ls_edate, ls_sale_no ) 	/*2018.05.09  jowonsuk 내용 보완 */
end if

end event

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품이동",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_oigiaskpick_m
integer x = 2779
integer y = 436
integer width = 1371
integer height = 756
integer taborder = 80
string dataobject = "d_oigiaskpick_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::itemchanged;string ls_car
   
choose case dwo.name
	case 'driver'
		this.object.rem2[1] = idwc_car.getitemstring(idwc_car.getrow(),'driver') + " " &
								  + idwc_car.getitemstring(idwc_car.getrow(),'name') 
end choose

end event

event dw_1::retrieveend;call super::retrieveend;//
if this.rowcount() <1  then return

if isnull(dw_1.object.act_date[1]) then
	dw_1.object.act_date[1] = datetime(date(string(today(), "yyyy/mm/dd")))
end if

end event

type st_title from w_inheritance`st_title within w_oigiaskpick_m
integer x = 0
integer y = 0
integer width = 1102
integer height = 140
string text = "물품요청 접수관리"
end type

type st_tips from w_inheritance`st_tips within w_oigiaskpick_m
end type

type pb_compute from w_inheritance`pb_compute within w_oigiaskpick_m
boolean visible = false
integer x = 3529
integer taborder = 150
boolean enabled = false
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품이동",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oigiaskpick_m
boolean visible = false
integer x = 4475
integer y = 64
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "목동출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;//
//if dw_1.rowcount() > 0 then
//	wf_print(dw_4)
//end if
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"목동인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oigiaskpick_m
integer x = 4631
integer y = 64
integer taborder = 160
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiaskpick_m
boolean visible = false
integer x = 27
integer y = 0
integer taborder = 170
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   li_find,  li_end, ll_row, ll_cnt
string old_dwnm
datawindow dw_prt

old_dwnm = dw_5.dataobject
if dw_1.rowcount() < 1 then RETURN

// DO_PRT 설정
string  ls_left, ls_top
ls_left = em_left.text ; ls_top  = em_top.text
		  
for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.sel[ll_row] = "N" then
	else
		ll_cnt = ll_cnt + 1
	end if
next
if ll_cnt < 1 then
	MessageBox("확인","선택된 품목이 존재하지 않습니다.")
	RETURN
end if

PrintSetup()
if messagebox("확인1","선택된 물품 요청번호 전체를 선택한 프린터로 출력합니다.~r~n" + &
	           "1개의 물품요청번호에 출력됩니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if

if cbx_2.checked = true then	// 명세
	dw_5.dataobject = 'd_oigiving_r_21_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')		
	dw_5.Modify('DataWindow.Print.Orientation = 1')
	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
end if

if cbx_3.checked = true then	// 인수
	dw_5.dataobject = 'd_oigiving_r_22_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')
	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
end if

if cbx_4.checked = true then	// 출고
	dw_5.dataobject = 'd_oigiving_r_23_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')
	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
end if

if cbx_5.checked = true then	// 납품
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

end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiaskpick_m
integer x = 4242
integer y = 64
integer taborder = 180
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_oigiaskpick_m
boolean visible = false
integer x = 3026
integer y = 60
integer taborder = 190
boolean enabled = false
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oigiaskpick_m
boolean visible = false
integer x = 3867
integer y = 68
integer taborder = 200
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiaskpick_m
integer x = 4041
integer y = 64
integer taborder = 30
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area, ls_sdate, ls_edate, ls_sale_no

dw_area.accepttext()
ls_area   = dw_area.object.area[1]

ls_sdate  = em_1.text
ls_edate  = em_2.text
ls_sale_no = trim(em_3.text)

if isnull(ls_sale_no) OR ls_sale_no = '' then 	
	ls_sale_no = '%'
else	
	ls_sale_no = trim(em_3.text) + '-' + RightA ( "000" + trim(em_4.text), 3)	
end if

dw_1.reset() ; dw_2.reset() ; dw_3.reset()

dw_3.setredraw( false )
dw_3.retrieve( ls_area, ls_sdate, ls_edate, ls_sale_no )
dw_3.setredraw( true )

if dw_3.rowcount() > 0 then
	MessageBox("확인","조회완료")
else
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oigiaskpick_m
integer x = 32
integer y = 240
integer width = 4119
integer height = 180
integer taborder = 130
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oigiaskpick_m
integer x = 1211
integer y = 16
integer width = 1115
integer height = 216
integer taborder = 140
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiaskpick_m
integer x = 4009
integer y = 16
integer width = 846
integer height = 216
integer taborder = 70
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oigiaskpick_m
integer x = 32
integer y = 1244
integer width = 4119
integer height = 1148
integer taborder = 110
string dataobject = "d_oigiaskpidet_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::itemchanged;//
long    ll_row, ll_found
string  ls_itemno, ls_itemqa, ls_null, ls_where, ls_sql, ls_locno, ls_area, ls_locarea
decimal ld_askqty, ld_rlseqty, ld_itemloc_qoh

dw_2.Accepttext()

ll_row     = this.getrow()
ls_itemno  = this.getitemstring(ll_row, "item_no")
ls_itemqa  = this.getitemstring(ll_row, "qa")
//ls_locno = this.getitemstring(ll_row, "loc_no")
ls_area    = dw_1.object.f_area[1]

setnull(ls_null) ; setnull(ls_locno)
SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :ls_area;

choose case dwo.name
	case "sel"
		if data = "Y" then
			ls_where  = " AND itemloc.item_no = ~~'" + ls_itemno  + "~~'" &
						 + " AND itemloc.qa = ~~'" + ls_itemqa  + "~~'" &
						 + " AND location.area_no = ~~'" + dw_area.object.area[1] + "~~'" 
			ls_sql = "datawindow.table.select = '" + is_locnosql + ls_where + "'"
			
			this.getchild("loc_no", idwc_locno)
			idwc_locno.settransobject(sqlca)
			idwc_locno.modify(ls_sql)
			idwc_locno.retrieve()
			
			this.object.loc_no[ll_row] = ls_locno

			ll_found = idwc_locno.find("itemloc_loc_no = '" + ls_locno + "'" , 1, idwc_locno.rowcount())
			if ll_found > 0 then
				idwc_locno.scrolltorow(ll_found)
				if idwc_locno.getrow() < 1 then RETURN 0
			
				ld_itemloc_qoh = idwc_locno.GetItemDecimal(idwc_locno.getrow(), "qoh")
				this.object.qoh[ll_row] = ld_itemloc_qoh
	
				this.object.loc_name[ll_row] = idwc_locno.getitemstring(idwc_locno.getrow(), "location_loc_name")
				
				ld_askqty  = this.object.ask_qty[ll_row]
				ld_rlseqty = this.object.rlse_qty[ll_row]
				
				if ld_itemloc_qoh > ( ld_askqty - ld_rlseqty ) then
					this.setitem( ll_row, "issue_qty", (ld_askqty - ld_rlseqty) )
				else
					if ld_itemloc_qoh <= 0 then
						this.object.loc_no[ll_row]    = ls_null
						this.object.issue_qty[ll_row] = 0
						this.object.loc_name[ll_row]  = ls_null
						this.object.qoh[ll_row]       = 0
					else
						this.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
					end if
				end if
			else
				this.object.loc_no[ll_row]    = ls_null
				this.object.loc_name[ll_row]  = ls_null
				this.object.issue_qty[ll_row] = 0
				this.object.qoh[ll_row]       = 0
			end if
		else
			this.object.loc_no[ll_row]    = this.getitemstring(ll_row, "loc_no", Primary!, TRUE)
			this.object.loc_name[ll_row]  = this.getitemstring(ll_row, "loc_name", Primary!, TRUE)
			this.object.issue_qty[ll_row] = this.getitemdecimal(ll_row, "issue_qty", Primary!, TRUE)
			this.object.qoh[ll_row]       = 0
			this.SetItemStatus(ll_row, 0, Primary!, NotModified!)
		end if

		// GetChild 값 적용
		this.accepttext()
		
	case "loc_no"
		// 선정수량에 DEFAULT로 선택한 저장소의 출고가능한 수량을 DISPLAY
		this.getchild("loc_no", idwc_locno)
		if idwc_locno.getrow() < 1 then RETURN 0
		
		// 같은사업장 아니면 오류 체크해야 함
		ls_locarea     = idwc_locno.getitemstring(idwc_locno.getrow(), "location_area_no")
		
		ld_itemloc_qoh = idwc_locno.GetItemDecimal(idwc_locno.getrow(), "qoh")		
		this.object.qoh[ll_row] = ld_itemloc_qoh
		
		this.object.loc_name[ll_row] = idwc_locno.getitemstring(idwc_locno.getrow(), "location_loc_name")

		ld_askqty  = this.object.ask_qty[ll_row]
		ld_rlseqty = this.object.rlse_qty[ll_row]

		if ld_itemloc_qoh > ( ld_askqty - ld_rlseqty ) then
			this.setitem( ll_row, "issue_qty", (ld_askqty - ld_rlseqty) )
		else
			if ld_itemloc_qoh <= 0 then
				RETURN 1
			else
				this.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
			end if
		end if
		
		// GetChild 값 적용
		this.accepttext()

//	case 'issue_qty'
//		wf_calc(ll_row)
end choose

end event

event dw_2::itemerror;integer ll_row
string  ls_null

setnull(ls_null)

ll_row = this.getrow()
this.object.loc_no[ll_row]    = ls_null
this.object.loc_name[ll_row]  = ls_null
this.object.issue_qty[ll_row] = 0
this.object.qoh[ll_row]       = 0
this.setcolumn('sel')

return 2

end event

event dw_2::rowfocuschanged;//
string ls_itemno, ls_itemqa, ls_null, ls_where, ls_sql
long   ll_row

dw_2.accepttext()

ll_row = this.getrow()
if ll_row < 1 then RETURN

ls_itemno = this.getitemstring(ll_row, "item_no")
ls_itemqa = this.getitemstring(ll_row, "qa")

setnull(ls_null)
ls_where  = " AND itemloc.item_no = ~~'" + ls_itemno + "~~' AND itemloc.qa = ~~'" + ls_itemqa + "~~'"
ls_sql    = "datawindow.table.select = '" + is_locnosql + ls_where + "'"
this.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)
idwc_locno.modify(ls_sql)
idwc_locno.retrieve()

end event

event dw_2::clicked;//
string   ls_item, ls_qa,  ls_loc, ls_null, ls_where, ls_sql, ls_area
int      li_int
datetime ld_date
gs_alter_str lstr_where

dw_1.accepttext()
dw_2.accepttext()

if row < 1 then return

this.scrolltorow(row)
if dw_1.object.proc_flag[1] = "Y" then return
		
setnull(ls_null)
ls_item = this.object.item_no[row]
ls_qa   = this.object.qa[row]
ls_loc  = this.object.loc_no[row]

choose case dwo.name
	case 'loc_no'	
		ls_where = " AND itemloc.item_no = ~~'" + ls_item + "~~' AND itemloc.qa = ~~'" &
					+ ls_qa + "~~'"
		ls_sql   = "datawindow.table.select = '" + is_locnosql + ls_where + "'"
		this.getchild("loc_no", idwc_locno)
		idwc_locno.settransobject(sqlca)
		idwc_locno.modify(ls_sql)
		idwc_locno.retrieve()
		
	case 'flag'
		m_manager NewMenu

		NewMenu = CREATE m_manager
		gs_print_control = ""
		m_manager.m_oigiving.m_alter.visible = false
		li_int = m_manager.m_oigiving.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())


		lstr_where.item_no   = trim(dw_2.object.item_no[row])
		lstr_where.qa        = trim(dw_2.object.qa[row])
		lstr_where.uom       = trim(dw_2.object.uom[row])
		lstr_where.order_no  = dw_2.object.ask_no[row]
		lstr_where.seq       = dw_2.object.seq_no[row]
		lstr_where.order_qty = dw_2.object.ask_qty[row] - dw_2.object.rlse_qty[row]
		
		SELECT DATEADD(month, -2, convert(smalldatetime, :ld_date, 111)) INTO :ld_date 
		  FROM login 
		 WHERE user_id = :gs_userid;
		 
		CHOOSE CASE gs_print_control
			CASE 'intemp'
				SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;
				lstr_where.item_name = ls_loc
				lstr_where.chk       = "ASK"
				openwithparm(w_whintemp_m, lstr_where)
				lstr_where = message.powerobjectparm
				if lstr_where.chk = "N" then return
				
				if lstr_where.chk = "D" then
					this.object.flag[row]      = "N"
					this.object.loc_no[row]    = ls_null
					this.object.issue_qty[row] = 0
				else
					this.object.flag[row]      = "가입"
				end if

//			CASE 'alter'
//				lstr_where.cust_name = trim(dw_1.object.customer_cust_name[1])
//				lstr_where.item_name = trim(dw_2.object.item_name[row])
//				
//				lstr_where.chk = "D" // "S": 수주확정시 대체 저장 "D":출고시 대체저장
//				openwithparm(w_whalter_w, lstr_where)
//				lstr_where = message.powerobjectparm
//				if lstr_where.chk = "N" then	return
//				if lstr_where.chk = "X" then
//					this.object.flag[row] = 'N'
//				elseif lstr_where.chk = "Y" then
//					this.object.flag[row] = '대체'
//				end if
		END CHOOSE
end choose

this.accepttext()

end event

type dw_3 from datawindow within w_oigiaskpick_m
integer x = 32
integer y = 436
integer width = 2688
integer height = 756
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oigiaskpick_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
long   ll_row

ll_row = this.Getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

cbx_1.checked = false		// 전체선택

is_order_no = this.object.ask_no[ll_row]
if isnull(is_order_no) OR is_order_no = "" then RETURN

dw_1.setredraw( false ) ; dw_2.setredraw( false )
dw_1.retrieve(is_order_no)
dw_2.retrieve(is_order_no)
dw_1.setredraw( true ) ; dw_2.setredraw( true )

end event

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_2 from editmask within w_oigiaskpick_m
integer x = 1925
integer y = 136
integer width = 370
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)
id_end = RelativeDate(id_end ,1)
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
id_end = RelativeDate(id_end ,1)

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//	id_end = RelativeDate(id_end ,1)
//end if
//
end event

type dw_4 from datawindow within w_oigiaskpick_m
integer x = 914
integer y = 176
integer width = 110
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oigiaskpick_m
string tag = "d_oigiving_r_21_a5"
integer x = 1033
integer y = 176
integer width = 110
integer height = 72
integer taborder = 30
boolean bringtotop = true
string title = "d_oigiving_r1"
string dataobject = "d_oigiving_r_24_a5"
boolean livescroll = true
end type

type st_3 from statictext within w_oigiaskpick_m
integer x = 530
integer y = 300
integer width = 384
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_oigiaskpick_m
integer x = 123
integer y = 320
integer width = 347
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "전체선택"
end type

event clicked;// 전체선택
long   ll_row, ll_cnt, ll_found
string ls_null, ls_locno, ls_where, ls_itemno, ls_itemqa, ls_sql, ls_area
dec    ld_itemloc_qoh

if dw_1.rowcount() < 1 then return
if dw_2.rowcount() < 1 then return

setnull(ls_null)
ls_area = dw_1.object.f_area[1]

setnull(ls_locno)
SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :ls_area;
if sqlca.sqlcode = 100 then
	messagebox("확인","접수지역의 저장소는 지정이 되어있지 않아 전체선택을 할 수 없습니다.")
	return
end if
ll_cnt = dw_2.rowcount()

if cbx_1.checked = true then
	for ll_row = 1 to ll_cnt
		if dw_2.object.rlse_flag[ll_row] = "Y" then continue
		
		dw_2.scrolltorow(ll_row)
		dw_2.object.sel[ll_row] = 'Y'
		dw_2.setredraw(false)
		ls_itemno = dw_2.getitemstring(ll_row, "item_no")
		ls_itemqa = dw_2.getitemstring(ll_row, "qa")
		
		//추가 조용진:19910707
		// 2007-10-04 조용진 퇴사로 정대범 권한 추가
		if gs_userid = "1999010s" or gs_userid = "1999010h" or gs_userid = 'kimkj' or gs_userid = 'killby' then
			ls_where = " AND itemloc.item_no = ~~'" + ls_itemno + "~~' AND itemloc.qa = ~~'" &
						+ ls_itemqa  + "~~'" 
		else
			ls_where = " AND itemloc.item_no = ~~'" + ls_itemno  + "~~'" &
						+ " AND itemloc.qa = ~~'" + ls_itemqa  + "~~'" &
						+ " AND itemloc.loc_no = ~~'" + ls_locno + "~~'" 
		end if
		ls_sql = "datawindow.table.select = '" + is_locnosql + ls_where + "'"
		
		dw_2.getchild("loc_no", idwc_locno)
		idwc_locno.settransobject(sqlca)
		idwc_locno.modify(ls_sql)
		idwc_locno.retrieve()
		
//		if dw_2.object.issue_qty[ll_row] <> 0 then
			dw_2.object.loc_no[ll_row] = ls_locno
			ll_found = idwc_locno.find("itemloc_loc_no = '" + ls_locno + "'" , 1, idwc_locno.rowcount())
			if ll_found > 0 then
				idwc_locno.scrolltorow(ll_found)
			
				ld_itemloc_qoh               = idwc_locno.getitemnumber(idwc_locno.getrow(), "qoh")
				dw_2.object.qoh[ll_row]      = ld_itemloc_qoh
				dw_2.object.loc_name[ll_row] = idwc_locno.getitemstring(idwc_locno.getrow(), "location_loc_name")
	
				if ld_itemloc_qoh > ( dw_2.object.ask_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ) then
					dw_2.setitem(ll_row, "issue_qty", ( dw_2.object.ask_qty[ll_row] - dw_2.object.rlse_qty[ll_row] ))
				else
					if ld_itemloc_qoh <= 0 then
						dw_2.object.loc_no[ll_row]    = ls_null
						dw_2.object.loc_name[ll_row]  = ls_null
						dw_2.object.issue_qty[ll_row] = 0
						dw_2.object.qoh[ll_row]       = 0
					else
						dw_2.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
					end if
				end if
			else
				dw_2.object.loc_no[ll_row]    = ls_null
				dw_2.object.loc_name[ll_row]  = ls_null
				dw_2.object.issue_qty[ll_row] = 0
				dw_2.object.qoh[ll_row]       = 0
			end if
//		end if
		dw_2.accepttext()
		dw_2.setredraw(true)
	next
else
	for ll_row = 1 to ll_cnt
		if dw_2.object.rlse_flag[ll_row] = "Y" then continue
		
		dw_2.object.sel[ll_row]       = 'N'
		dw_2.object.loc_no[ll_row]    = dw_2.getitemstring(ll_row,  "loc_no",    Primary!, TRUE)
		dw_2.object.loc_name[ll_row]  = dw_2.getitemstring(ll_row,  "loc_name",  Primary!, TRUE)
		dw_2.object.issue_qty[ll_row] = dw_2.getitemdecimal(ll_row, "issue_qty", Primary!, TRUE)
		dw_2.object.qoh[ll_row]       = 0
		dw_2.SetItemStatus(ll_row, 0, Primary!, NotModified!)
	next
end if

end event

type dw_area from datawindow within w_oigiaskpick_m
integer x = 1545
integer y = 52
integer width = 521
integer height = 84
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.AcceptText()
 
end event

type cbx_2 from checkbox within w_oigiaskpick_m
integer x = 3099
integer y = 84
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

type cbx_3 from checkbox within w_oigiaskpick_m
integer x = 3314
integer y = 84
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

type cbx_4 from checkbox within w_oigiaskpick_m
integer x = 3099
integer y = 152
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

type cbx_5 from checkbox within w_oigiaskpick_m
integer x = 3314
integer y = 152
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

type gb_8 from groupbox within w_oigiaskpick_m
integer x = 3598
integer y = 16
integer width = 384
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력여백"
end type

type gb_7 from groupbox within w_oigiaskpick_m
integer x = 3063
integer y = 16
integer width = 507
integer height = 216
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력"
end type

type em_1 from editmask within w_oigiaskpick_m
integer x = 1545
integer y = 136
integer width = 370
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;id_start = date(this.text)

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
//end if
//
end event

type st_vertical from u_splitbar_vertical within w_oigiaskpick_m
integer x = 2738
integer y = 436
integer height = 756
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oigiaskpick_m
integer x = 32
integer y = 1208
integer width = 4119
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_3.height

end event

type st_4 from statictext within w_oigiaskpick_m
integer x = 1239
integer y = 52
integer width = 306
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_oigiaskpick_m
integer x = 1239
integer y = 136
integer width = 306
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "요청일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oigiaskpick_m
integer x = 983
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_oigiaskpick_m
integer x = 1170
integer y = 300
integer width = 480
integer height = 632
integer taborder = 20
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

type ddlb_dwtitles from dropdownlistbox within w_oigiaskpick_m
integer x = 1211
integer y = 312
integer width = 311
integer height = 88
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
end type

type st_7 from statictext within w_oigiaskpick_m
integer x = 1669
integer y = 316
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

type sle_value from singlelineedit within w_oigiaskpick_m
integer x = 2158
integer y = 304
integer width = 517
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oigiaskpick_m
integer x = 2688
integer y = 304
integer width = 160
integer height = 76
integer taborder = 90
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

arg_dw = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oigiaskpick_m
integer x = 2853
integer y = 304
integer width = 160
integer height = 76
integer taborder = 100
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

arg_dw = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oigiaskpick_m
integer x = 3017
integer y = 304
integer width = 160
integer height = 76
integer taborder = 110
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

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oigiaskpick_m
integer x = 3182
integer y = 304
integer width = 160
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_left from statictext within w_oigiaskpick_m
integer x = 3625
integer y = 88
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

type em_left from editmask within w_oigiaskpick_m
integer x = 3776
integer y = 76
integer width = 146
integer height = 64
integer taborder = 60
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

type st_9 from statictext within w_oigiaskpick_m
integer x = 3625
integer y = 156
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

type em_top from editmask within w_oigiaskpick_m
integer x = 3776
integer y = 144
integer width = 146
integer height = 64
integer taborder = 200
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

type ddlb_op from dropdownlistbox within w_oigiaskpick_m
integer x = 1842
integer y = 296
integer width = 302
integer height = 500
integer taborder = 150
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type em_3 from editmask within w_oigiaskpick_m
event keydown pbm_dwnkey
integer x = 2391
integer y = 100
integer width = 379
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

event keydown;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */

//IF keydown(KeyEnter! ) THEN
//	IF keyflags = 0 THEN
//		pb_cancel.postevent(clicked!)
//	END IF
//END IF
end event

event modified;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */
//pb_cancel.default = true

end event

type st_2 from statictext within w_oigiaskpick_m
integer x = 2770
integer y = 116
integer width = 46
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "-"
boolean focusrectangle = false
end type

type em_4 from editmask within w_oigiaskpick_m
integer x = 2811
integer y = 100
integer width = 151
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */
//pb_cancel.default = true
this.SelectText(1, 3)


end event

event losefocus;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */

// 수주장 2번 저장의 경우 발생함
// pb_cancel.default = true

end event

event modified;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */

//pb_cancel.default = true
end event

type gb_6 from groupbox within w_oigiaskpick_m
integer x = 2336
integer y = 40
integer width = 672
integer height = 180
integer taborder = 620
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수주번호"
end type

