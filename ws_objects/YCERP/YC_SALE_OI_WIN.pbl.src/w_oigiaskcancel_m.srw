$PBExportHeader$w_oigiaskcancel_m.srw
$PBExportComments$물품요청 접수취소관리(2001/03/02,이인호)
forward
global type w_oigiaskcancel_m from w_inheritance
end type
type dw_3 from datawindow within w_oigiaskcancel_m
end type
type em_1 from editmask within w_oigiaskcancel_m
end type
type em_2 from editmask within w_oigiaskcancel_m
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
type cbx_1 from checkbox within w_oigiaskcancel_m
end type
type cbx_4 from checkbox within w_oigiaskcancel_m
end type
type st_1 from statictext within w_oigiaskcancel_m
end type
type st_2 from statictext within w_oigiaskcancel_m
end type
type st_3 from statictext within w_oigiaskcancel_m
end type
type st_vertical from u_splitbar_vertical within w_oigiaskcancel_m
end type
type st_horizontal from u_splitbar_horizontal within w_oigiaskcancel_m
end type
type st_6 from statictext within w_oigiaskcancel_m
end type
type ddlb_fld from dropdownlistbox within w_oigiaskcancel_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oigiaskcancel_m
end type
type st_7 from statictext within w_oigiaskcancel_m
end type
type sle_value from singlelineedit within w_oigiaskcancel_m
end type
type cb_1 from commandbutton within w_oigiaskcancel_m
end type
type cb_2 from commandbutton within w_oigiaskcancel_m
end type
type cb_3 from commandbutton within w_oigiaskcancel_m
end type
type cb_5 from commandbutton within w_oigiaskcancel_m
end type
type st_left from statictext within w_oigiaskcancel_m
end type
type em_left from editmask within w_oigiaskcancel_m
end type
type st_9 from statictext within w_oigiaskcancel_m
end type
type em_top from editmask within w_oigiaskcancel_m
end type
type ddlb_op from dropdownlistbox within w_oigiaskcancel_m
end type
type em_3 from editmask within w_oigiaskcancel_m
end type
type st_4 from statictext within w_oigiaskcancel_m
end type
type em_4 from editmask within w_oigiaskcancel_m
end type
type gb_7 from groupbox within w_oigiaskcancel_m
end type
type gb_8 from groupbox within w_oigiaskcancel_m
end type
type gb_6 from groupbox within w_oigiaskcancel_m
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
integer width = 5339
integer height = 2516
string title = "물품요청 취소관리(w_oigiaskcancel_m)"
boolean resizable = false
dw_3 dw_3
em_1 em_1
em_2 em_2
dw_4 dw_4
dw_5 dw_5
dw_area dw_area
cbx_2 cbx_2
cbx_3 cbx_3
cbx_1 cbx_1
cbx_4 cbx_4
st_1 st_1
st_2 st_2
st_3 st_3
st_vertical st_vertical
st_horizontal st_horizontal
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
st_4 st_4
em_4 em_4
gb_7 gb_7
gb_8 gb_8
gb_6 gb_6
end type
global w_oigiaskcancel_m w_oigiaskcancel_m

type variables
st_print i_print
date id_start, id_end
string is_order_no, is_proc_flag
datawindowchild idwc_car
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
   SELECT item_name INTO :ls_item_name FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa;
	ls_issue_qty = string(dw_2.object.issue_qty[ll_count], '###,###,###.00')
	
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
						* dw_2.object.issue_qty[ll_count] / 1000 + 0.00001,2), '###,###,###.00')
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

	if ll_idx = 16 then
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

//
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

dw_1.getchild("driver", idwc_car)
end event

on w_oigiaskcancel_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_area=create dw_area
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_1=create cbx_1
this.cbx_4=create cbx_4
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
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
this.st_4=create st_4
this.em_4=create em_4
this.gb_7=create gb_7
this.gb_8=create gb_8
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.cbx_3
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.cbx_4
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_vertical
this.Control[iCurrent+15]=this.st_horizontal
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.ddlb_fld
this.Control[iCurrent+18]=this.ddlb_dwtitles
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.sle_value
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_2
this.Control[iCurrent+23]=this.cb_3
this.Control[iCurrent+24]=this.cb_5
this.Control[iCurrent+25]=this.st_left
this.Control[iCurrent+26]=this.em_left
this.Control[iCurrent+27]=this.st_9
this.Control[iCurrent+28]=this.em_top
this.Control[iCurrent+29]=this.ddlb_op
this.Control[iCurrent+30]=this.em_3
this.Control[iCurrent+31]=this.st_4
this.Control[iCurrent+32]=this.em_4
this.Control[iCurrent+33]=this.gb_7
this.Control[iCurrent+34]=this.gb_8
this.Control[iCurrent+35]=this.gb_6
end on

on w_oigiaskcancel_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_area)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_1)
destroy(this.cbx_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_vertical)
destroy(this.st_horizontal)
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
destroy(this.st_4)
destroy(this.em_4)
destroy(this.gb_7)
destroy(this.gb_8)
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

type pb_save from w_inheritance`pb_save within w_oigiaskcancel_m
integer x = 4827
integer taborder = 100
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;// 저장
string ls_locno, ls_chk, ls_toloc, ls_fromloc, ls_flag, ls_null, ls_item, ls_str, ls_qa
string ls_cnt, ls_order, ls_old_time, ls_all, ls_sqlerrtext
real   lr_newqty
long   ll_row, ll_count
date   ld_date
dwitemstatus l_status

setnull(ls_null)

dw_1.accepttext()
dw_2.accepttext()

if dw_1.rowcount() < 1 then RETURN

ls_order = dw_1.object.ask_no[1]
ls_toloc = dw_1.object.ask_loc[1]
ld_date  = date(dw_1.object.act_date[1])

if isnull(ls_toloc) OR ls_toloc = "" then
	MessageBox("확인","입고저장소는 공난으로 처리할 수 없습니다.",exclamation!)
	RETURN
end if	

ls_all = "N"

for ll_row = 1 to dw_2.rowcount()	
	if dw_2.object.chk[ll_row] <> "Y" then CONTINUE
	
	ls_all     = "Y"
next

if ls_all = "N" then

	/*2019.08.14 jowonsuk 마스터, 운전자, 운반비, 이름차량 변경 가능하게 수정  */
	l_status = dw_1.GetItemStatus(1, 0, Primary!)

	if l_status = DataModified! then
		if wf_update1(dw_1, "Y") = true then	
			pb_retrieve.postevent(clicked!)
		end if
	else
		MessageBox("확인", "선택한 자료가 없습니다.")	
	end if

	return
	
else
end if	


if MessageBox("확인", "선택한 자료를 처리하시겠습니까?",Exclamation!, OKCancel!, 1) = 2 then
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

for ll_row = 1 to dw_2.rowcount()
  l_status = dw_2.getitemstatus(ll_row, 0, primary!)

  if l_status = NotModified! then CONTINUE	
  if dw_2.object.chk[ll_row] <> "Y" then CONTINUE
	
   dw_2.object.rlse_flag[ll_row] = "N"
	
   ls_item    = trim(dw_2.object.item_no[ll_row])
   ls_fromloc = dw_2.getitemstring(ll_row, "loc_no", Primary!, true)
   lr_newqty  = dw_2.getitemnumber(ll_row, "issue_qty", Primary!, true) * -1
   ls_qa      = trim(dw_2.object.qa[ll_row])
   ls_cnt     = string(dw_2.object.seq_no[ll_row])
	
	
   // 물품저장소 출고
   INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, order_no, rcpt_qty, issue_qty, loc_no,
	       inaudit_type, serial_id, cost, destination, rem, user_id)
   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,0,:lr_newqty, :ls_fromloc, 'IK',:ls_cnt, 0, :ls_toloc, "물품요청삭제",:gs_userid);
	
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
      ROLLBACK;
      MessageBox("출고오류","[inaudit] insert중 DB오류가 발생했습니다.~r~n" &
						+ ls_sqlerrtext,exclamation!)
      RETURN 
   end if
	
	ls_old_time = string(now(), "hh:mm:ss:fff")
	for ll_count = 1 to 100000
		if ls_old_time <> string(now(),"hh:mm:ss:fff") then
			ls_old_time  = string(now(),"hh:mm:ss:fff")	
			EXIT
		end if	
	next

   // 물품저장소 입고
   INSERT INTO inaudit (inaudit_time, inaudit_date, inaudit_item, qa, order_no, rcpt_qty, issue_qty, loc_no,
	 	    inaudit_type, serial_id, cost, destination, rem,  user_id)
   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,:lr_newqty,0,:ls_toloc, 'RK',:ls_cnt,0,:ls_fromloc, "물품요청삭제",:gs_userid);
   if sqlca.sqlcode < 0 then
		ls_sqlerrtext = sqlca.sqlerrtext
      ROLLBACK;
      MessageBox("입고오류","[inaudit] insert중 DB오류가 발생했습니다.~r~n" &
						+ ls_sqlerrtext,exclamation!)
      RETURN 
   end if
	
   /*
	  jowonsuk 2018.07.12 추가 반영  기존에 전체취소에서 처리하던 로직, 기존로직이 잘못되어 있음.
	  전체취소에서 값을 선처리해 놓으면  inaudit에 반영이 안됨.
	  
	  jowonsuk 2018.08.20 추가 반영 
	   dw_2.object.issue_qty[ll_row] = 0				/8월 20일전 /
	   dw_2.object.issue_qty[ll_row] =  dw_2.object.rlse_qty[ll_row]  / 8월20일부터 신규 반영 /
   */	
	   dw_2.object.rlse_qty[ll_row]    = dw_2.object.rlse_qty[ll_row] - dw_2.object.issue_qty[ll_row]
	   dw_2.object.issue_qty[ll_row] = dw_2.object.rlse_qty[ll_row]
// dw_2.object.loc_no[ll_row]    = ls_null
// dw_2.object.loc_name[ll_row]  = ls_null
	
next

ls_all = "N"
for ll_row = 1 to dw_2.rowcount()
	
	if dw_2.object.rlse_flag[ll_row] = "Y" THEN
		ls_all = "P"
		EXIT
	end if
	/*jowonsuk 2018.08.20 내용 추가 기출고수량이 남아 있으면 부분으로 해서 취소를 더 진행 할 수 있다. */
	if dw_2.object.rlse_qty[ll_row] > 0 then		
		ls_all = "P"
		EXIT		
	end if
next

dw_1.object.proc_flag[1] = ls_all
if ls_all = "N" then 
	dw_1.object.ship_close[1] = ls_null
end if

dw_1.object.act_user[1] = gs_userid
dw_1.object.act_date[1] = gf_today()

/////////////////////////////////////////////////////////////
// 저장
/////////////////////////////////////////////////////////////
if wf_update2(dw_1, dw_2, "Y") = true then
	pb_retrieve.postevent(clicked!)
end if
/////////////////////////////////////////////////////////////
end event

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"요청저장및취소",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_oigiaskcancel_m
integer x = 2789
integer y = 432
integer width = 1746
integer height = 876
integer taborder = 120
string dataobject = "d_oigiaskcancel_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::itemchanged;call super::itemchanged;string ls_car
   
choose case dwo.name
	case 'driver'
		this.object.rem2[1] = idwc_car.getitemstring(idwc_car.getrow(),'driver') + " " &
								  + idwc_car.getitemstring(idwc_car.getrow(),'name') 
end choose

end event

type st_title from w_inheritance`st_title within w_oigiaskcancel_m
integer x = 37
integer y = 24
integer width = 1184
string text = "물품요청 취소관리"
end type

type st_tips from w_inheritance`st_tips within w_oigiaskcancel_m
end type

type pb_compute from w_inheritance`pb_compute within w_oigiaskcancel_m
boolean visible = false
integer x = 3520
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
integer x = 4622
integer y = 668
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
integer x = 5019
integer taborder = 200
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiaskcancel_m
integer x = 4635
integer taborder = 210
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_prt
string old_dwnm
old_dwnm = dw_5.dataobject

if dw_1.rowcount() < 1 then return

// DO_PRT 설정
string  ls_left, ls_top
ls_left = em_left.text ; ls_top  = em_top.text
		  
PrintSetup()
if messagebox("확인1","선택된 물품 요청번호 전체를 프린터로 출력합니다.~r~n" + &
	"1개의 물품요청번호에 출력됩니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	return
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

if cbx_2.checked = true then	// 인수
	dw_5.dataobject = 'd_oigiving_r_22_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')
	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
end if

if cbx_3.checked = true then	// 출고
	dw_5.dataobject = 'd_oigiving_r_23_a5'
	dw_5.Modify('DataWindow.Print.Paper.Size = 11')
	dw_5.Modify('DataWindow.Print.Orientation = 1')
	dw_5.modify("DataWindow.print.margin.left = " + ls_left )
	dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_5.settransobject(sqlca)
	wf_print(dw_5)
	dw_5.print()
end if

if cbx_4.checked = true then	// 납품
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

type pb_cancel from w_inheritance`pb_cancel within w_oigiaskcancel_m
integer x = 4311
integer width = 325
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

event pb_cancel::clicked;// 전체취소
long   ll_row
string ls_null

if dw_2.rowcount() < 1 then return

setnull(ls_null)
for ll_row = 1 to dw_2.rowcount()
	if isnull(dw_2.object.loc_no[ll_row]) = false then
		dw_2.object.chk[ll_row] = 'Y'		/*jowonsuk 2018.07.12 반영  */
	end if
	/*jowonsuk 2018.07.12 주석처리 기존에 아예 반영을 안하려고 했던 로직, 주석처리 */
/*	
	dw_2.object.rlse_flag[ll_row] = 'N'
	dw_2.object.rlse_qty[ll_row]  = dw_2.object.rlse_qty[ll_row] - dw_2.object.issue_qty[ll_row]
	dw_2.object.issue_qty[ll_row] = 0
	dw_2.object.loc_no[ll_row]    = ls_null
	dw_2.object.loc_name[ll_row]  = ls_null
*/	
next

/*dw_1.object.proc_flag[1] = 'N'*/ 	/*jowonsuk 2018.07.12 주석처리 */

end event

type pb_delete from w_inheritance`pb_delete within w_oigiaskcancel_m
boolean visible = false
integer x = 3483
integer y = 68
integer taborder = 230
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oigiaskcancel_m
boolean visible = false
integer x = 3296
integer y = 72
integer taborder = 240
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiaskcancel_m
integer x = 4114
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area, ls_sdate, ls_edate, ls_sale_no

dw_1.reset() ; dw_2.reset() ; dw_3.reset()

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ls_sdate = em_1.text
ls_edate = em_2.text

ls_sale_no = trim(em_3.text)

if isnull(ls_sale_no) OR ls_sale_no = '' then 	
	ls_sale_no = '%'
else	
	ls_sale_no = trim(em_3.text) + '-' + RightA ( "000" + trim(em_4.text), 3)	
end if

dw_3.retrieve( ls_area, ls_sdate, ls_edate, ls_sale_no )

end event

type gb_3 from w_inheritance`gb_3 within w_oigiaskcancel_m
integer x = 37
integer y = 240
integer width = 4503
integer height = 180
integer taborder = 170
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oigiaskcancel_m
integer x = 1303
integer y = 8
integer width = 1161
integer height = 220
integer taborder = 180
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiaskcancel_m
integer x = 4078
integer y = 8
integer width = 1152
integer height = 220
integer taborder = 110
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oigiaskcancel_m
integer x = 32
integer y = 1360
integer width = 4503
integer height = 952
integer taborder = 140
string dataobject = "d_oigiaskcadet_m"
end type

event dw_2::itemchanged;//
choose case dwo.name
	case 'chk'
		RETURN  1
end choose

RETURN 0
end event

event dw_2::itemerror;call super::itemerror;//string ls_null
//
//setnull(ls_null)
//
//choose case dwo.name
//	case 'chk'
//		if data = 'N' then
//			dw_2.object.chk[row] = 'N'
//			dw_2.object.issue_qty[row] = dw_2.getitemnumber(row,'issue_qty', Primary!, true)
//			dw_2.object.rlse_qty[row]  = dw_2.getitemnumber(row,'rlse_qty',  Primary!, true)
//			dw_2.object.loc_no[row]    = dw_2.getitemstring(row,'loc_no',    Primary!, true)
//			dw_2.object.loc_name[row]  = dw_2.getitemstring(row,'loc_name',  Primary!, true)
//			dw_2.SetItemStatus(row, 0, Primary!, notModified!)
//		else
//			dw_2.object.chk[row] = 'Y'
//			dw_2.object.rlse_qty[row]  = dw_2.object.rlse_qty[row] - dw_2.object.issue_qty[row]
//			dw_2.object.issue_qty[row] = 0
//			dw_2.object.loc_no[row]    = ls_null
//			dw_2.object.loc_name[row]  = ls_null
//		end if
//end choose
//
//RETURN 2

end event

event dw_2::clicked;call super::clicked;string ls_null , ls_chk

//setnull(ls_null)

choose case dwo.name
	case 'chk'
		
		ls_chk = dw_2.object.chk[row]
		/*부분취소 없음 jowonsuk  그래서 기존 로직은 'N'일때 'N', 'Y'일때 'Y' */
		if ls_chk = 'N' then			
			if isnull(dw_2.object.loc_no[row]) = false then
				dw_2.object.chk[row] = 'Y' /*주석*/
	//			dw_2.object.issue_qty[row] = dw_2.getitemnumber(row,'issue_qty', Primary!, true)
	//			dw_2.object.rlse_qty[row]  = dw_2.getitemnumber(row,'rlse_qty',  Primary!, true)
	//			dw_2.object.loc_no[row]    = dw_2.getitemstring(row,'loc_no',    Primary!, true)
	//			dw_2.object.loc_name[row]  = dw_2.getitemstring(row,'loc_name',  Primary!, true)
	//			dw_2.SetItemStatus(row, 0, Primary!, notModified!)
			end if
		else
			dw_2.object.chk[row] = 'N' /*주석*/
//			dw_2.object.rlse_qty[row]  = dw_2.object.rlse_qty[row] - dw_2.object.issue_qty[row]
//			dw_2.object.issue_qty[row] = 0
//			dw_2.object.loc_no[row]    = ls_null
//			dw_2.object.loc_name[row]  = ls_null
		end if
end choose

RETURN 1
end event

type dw_3 from datawindow within w_oigiaskcancel_m
integer x = 32
integer y = 432
integer width = 2688
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

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_proc_flag = this.object.ask_head_proc_flag[row]
end event

type em_1 from editmask within w_oigiaskcancel_m
integer x = 1719
integer y = 132
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

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if
//
end event

type em_2 from editmask within w_oigiaskcancel_m
integer x = 2080
integer y = 132
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//	id_end = RelativeDate(id_end ,1)
//end if
//
end event

type dw_4 from datawindow within w_oigiaskcancel_m
integer x = 1033
integer y = 168
integer width = 91
integer height = 72
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oigiaskcancel_m
integer x = 1134
integer y = 168
integer width = 91
integer height = 72
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r_21_a5"
boolean livescroll = true
end type

type dw_area from datawindow within w_oigiaskcancel_m
integer x = 1719
integer y = 48
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
integer x = 3424
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
integer x = 3205
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

type cbx_1 from checkbox within w_oigiaskcancel_m
integer x = 3205
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
integer x = 3424
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

type st_1 from statictext within w_oigiaskcancel_m
integer x = 1326
integer y = 48
integer width = 384
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_oigiaskcancel_m
integer x = 1326
integer y = 132
integer width = 384
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oigiaskcancel_m
integer x = 2496
integer y = 320
integer width = 951
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "저장소 공난인 품목 선택금지"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_oigiaskcancel_m
integer x = 2738
integer y = 432
integer height = 876
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oigiaskcancel_m
integer x = 32
integer y = 1324
integer width = 4503
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_3.height

end event

type st_6 from statictext within w_oigiaskcancel_m
integer x = 91
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_oigiaskcancel_m
integer x = 279
integer y = 304
integer width = 480
integer height = 632
integer taborder = 30
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

type ddlb_dwtitles from dropdownlistbox within w_oigiaskcancel_m
integer x = 320
integer y = 316
integer width = 311
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

type st_7 from statictext within w_oigiaskcancel_m
integer x = 777
integer y = 320
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

type sle_value from singlelineedit within w_oigiaskcancel_m
integer x = 1266
integer y = 308
integer width = 517
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oigiaskcancel_m
integer x = 1797
integer y = 308
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oigiaskcancel_m
integer x = 1961
integer y = 308
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

type cb_3 from commandbutton within w_oigiaskcancel_m
integer x = 2126
integer y = 308
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oigiaskcancel_m
integer x = 2290
integer y = 308
integer width = 160
integer height = 76
integer taborder = 130
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

type st_left from statictext within w_oigiaskcancel_m
integer x = 3721
integer y = 84
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

type em_left from editmask within w_oigiaskcancel_m
integer x = 3872
integer y = 72
integer width = 146
integer height = 64
integer taborder = 40
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

type st_9 from statictext within w_oigiaskcancel_m
integer x = 3877
integer y = 152
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

type em_top from editmask within w_oigiaskcancel_m
integer x = 3872
integer y = 140
integer width = 146
integer height = 64
integer taborder = 180
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

type ddlb_op from dropdownlistbox within w_oigiaskcancel_m
integer x = 955
integer y = 300
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

type em_3 from editmask within w_oigiaskcancel_m
event keydown pbm_dwnkey
integer x = 2542
integer y = 100
integer width = 379
integer height = 92
integer taborder = 80
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

type st_4 from statictext within w_oigiaskcancel_m
integer x = 2921
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

type em_4 from editmask within w_oigiaskcancel_m
integer x = 2962
integer y = 100
integer width = 151
integer height = 92
integer taborder = 90
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

type gb_7 from groupbox within w_oigiaskcancel_m
integer x = 3182
integer y = 8
integer width = 480
integer height = 220
integer taborder = 90
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

type gb_8 from groupbox within w_oigiaskcancel_m
integer x = 3675
integer y = 8
integer width = 384
integer height = 220
integer taborder = 30
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

type gb_6 from groupbox within w_oigiaskcancel_m
integer x = 2487
integer y = 40
integer width = 672
integer height = 180
integer taborder = 630
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

