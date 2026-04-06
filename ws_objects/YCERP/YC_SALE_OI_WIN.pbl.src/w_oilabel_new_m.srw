$PBExportHeader$w_oilabel_new_m.srw
$PBExportComments$물품라벨 발행관리(2018/07/05, 조원석)
forward
global type w_oilabel_new_m from w_inheritance
end type
type dw_3 from datawindow within w_oilabel_new_m
end type
type dw_4 from datawindow within w_oilabel_new_m
end type
type dw_5 from datawindow within w_oilabel_new_m
end type
type dw_area from datawindow within w_oilabel_new_m
end type
type cbx_2 from checkbox within w_oilabel_new_m
end type
type cbx_3 from checkbox within w_oilabel_new_m
end type
type cbx_4 from checkbox within w_oilabel_new_m
end type
type cbx_5 from checkbox within w_oilabel_new_m
end type
type gb_8 from groupbox within w_oilabel_new_m
end type
type gb_7 from groupbox within w_oilabel_new_m
end type
type em_1 from editmask within w_oilabel_new_m
end type
type st_vertical from u_splitbar_vertical within w_oilabel_new_m
end type
type st_horizontal from u_splitbar_horizontal within w_oilabel_new_m
end type
type st_4 from statictext within w_oilabel_new_m
end type
type st_5 from statictext within w_oilabel_new_m
end type
type st_6 from statictext within w_oilabel_new_m
end type
type ddlb_fld from dropdownlistbox within w_oilabel_new_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oilabel_new_m
end type
type st_7 from statictext within w_oilabel_new_m
end type
type sle_value from singlelineedit within w_oilabel_new_m
end type
type cb_1 from commandbutton within w_oilabel_new_m
end type
type cb_2 from commandbutton within w_oilabel_new_m
end type
type cb_3 from commandbutton within w_oilabel_new_m
end type
type cb_5 from commandbutton within w_oilabel_new_m
end type
type st_left from statictext within w_oilabel_new_m
end type
type em_left from editmask within w_oilabel_new_m
end type
type st_9 from statictext within w_oilabel_new_m
end type
type em_top from editmask within w_oilabel_new_m
end type
type ddlb_op from dropdownlistbox within w_oilabel_new_m
end type
type em_3 from editmask within w_oilabel_new_m
end type
type st_2 from statictext within w_oilabel_new_m
end type
type em_4 from editmask within w_oilabel_new_m
end type
type cb_4 from commandbutton within w_oilabel_new_m
end type
type dw_6 from datawindow within w_oilabel_new_m
end type
type cbx_test from checkbox within w_oilabel_new_m
end type
type ddlb_kind from dropdownlistbox within w_oilabel_new_m
end type
type gb_6 from groupbox within w_oilabel_new_m
end type
type st_pick from structure within w_oilabel_new_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oilabel_new_m from w_inheritance
integer y = 212
integer width = 5701
integer height = 2472
string title = "출고품라벨 출력관리(w_oilabel_m1)"
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
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
cb_4 cb_4
dw_6 dw_6
cbx_test cbx_test
ddlb_kind ddlb_kind
gb_6 gb_6
end type
global w_oilabel_new_m w_oilabel_new_m

type variables
//
st_print i_print
datawindowchild idwc_scene, idwc_locno, idwc_car

string is_locnosql, is_order_no, is_label_no, is_number, is_convert_req_date, is_cat, is_issue_schedule
date   id_start, id_end

datetime i_req_date,  i_sys_date
string is_salesman, is_req_flag
int      i_req_seq, i_seq, i_print_group

end variables

forward prototypes
public subroutine wf_print (string arg_label_no, long arg_print_no)
end prototypes

public subroutine wf_print (string arg_label_no, long arg_print_no);//
datetime ld_date
decimal    ld_amount, l_issue_qty
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt, ll_qty
string ls_order_no, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_item_no, ls_item_name, ls_qa, ls_bigo, ls_cnt, ls_label_no
string ls_left, ls_top, ls_prt
int    li_seq_no

DECLARE label_print_cursor CURSOR FOR  
select   a.order_no,
		  d.cust_name,
		  e.scene_desc,
		  a.label_no,
		  a.item_no, 
		  b.item_name,
		  a.qa, 
		  a.issue_qty	  
from    label_item a with(nolock) 
            inner join groupitem b with(nolock) on a.item_no  = b.item_no
            inner join sale c with(nolock) on a.order_no = c.order_no
            inner join customer d with(nolock) on c.cust_no = d.cust_no
            inner join scene e with(nolock) on c.scene_code = e.scene_code
  where a.req_date    = :i_req_date
      and a.salesman  = :is_salesman
      and a.req_seq    = :i_req_seq
      and a.req_flag    = :is_req_flag
      and a.seq           = :i_seq
      and a.label_no = :arg_label_no
order by a.print_group, a.print_group_seq;


DEBUGBREAK()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
dw_5.reset()
dw_5.insertrow(0)

OPEN label_print_cursor;

		FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :l_issue_qty;
		
		dw_5.object.order_no[1]   = ls_order_no
		dw_5.object.cust_name[1]  = ls_cust_name
		dw_5.object.scene_name[1] = ls_scene_name
		dw_5.object.label_no[1] 	     = ls_label_no

		Do While sqlca.sqlcode = 0		  	
			ll_line = ll_line + 1
			dw_5.setitem(1, 'item_name' + string(ll_line,"00"), ls_item_name)
			dw_5.setitem(1, 'qa'        + string(ll_line,"00"), ls_qa)
			dw_5.setitem(1, 'qty'       + string(ll_line,"00"), l_issue_qty)
					
			FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :l_issue_qty;
		Loop

CLOSE label_print_cursor;

/* 실제 ACTIVE 상태의 라벨에 YES를 찍는다. */
update label_item
set use_yn  = 'N'				
where ORDER_NO = SUBSTRING(:ls_label_no,1,14)
    and print_no <> :arg_print_no;

update label_item
set use_yn  = 'Y'				
where label_no = :ls_label_no
    and print_no <> :arg_print_no;

//messagebox('확인', '테스트1')
		
// 출력마진 설정
ls_left = em_left.text
ls_top  = em_top.text
//ls_prt  = em_prt.text

//SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
//SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
//SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)


/*

     2018.07.13 jowonsuk 설정
	프린터 설정 
	SATO CL4NX 이며,
	프린터 기본설정에서  media settings Width:   100mm
											     Height: 160mm
												Rotation: 90도
	ls_prt = "CL4NX"	
	ls_left = "0.000"
	ls_top = "0.000"	

*/

ls_prt = "CL4NX"	
ls_left = "0.000"
ls_top = "0.000"	

if ls_prt = "" OR ls_prt = "기본" then
else
	dw_5.Object.DataWindow.Printer = ls_prt
end if

dw_5.modify("DataWindow.print.margin.left = " + ls_left )
dw_5.modify("DataWindow.print.margin.top  = " + ls_top  )
dw_5.modify("DataWindow.print.Margin.Bottom = 0.000" )
dw_5.modify("DataWindow.print.Margin.Right  = 0.000" )
//messagebox('확인', '테스트2')		
dw_5.print()
//messagebox('확인', '테스트3')		
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
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_minsize(250, 250)

////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//if gs_userid = '1999010s' then
//	cbx_test.visible = true
//end if	

//////////////////////////////////////////////////////////////////////////////
string  ls_left, ls_top

ls_left = ProfileString("YCERP.INI","DO_PRT","LEFT", " ")
ls_top  = ProfileString("YCERP.INI","DO_PRT","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = "0.000"
if isnull(ls_top)  OR ls_top  = "" then ls_top  = "0.000"

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////

long ll_row

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
			
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//if left(gs_area,1) = "S" then
//	em_3.text = "HD" + string(today(), "yyyymmdd")
//else
//	em_3.text = left(gs_area, 1) + "D" + string(today(), "yyyymmdd")
//end if


em_1.text = string(today(), "yyyy/mm/dd")

id_start  = date(em_1.text)
//id_end    = date(em_2.text)
//id_end    = RelativeDate(id_end, 1)

//pb_print.visible = false
dw_5.visible = false

// 요청항목
dw_2.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)

is_locnosql = idwc_locno.describe("datawindow.table.select")

ddlb_kind.text = '출고의뢰 기준(소벤딩,부속,택배)'
is_cat = '출고의뢰'

//dw_1.getchild("driver", idwc_car)


end event

on w_oilabel_new_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
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
this.cb_4=create cb_4
this.dw_6=create dw_6
this.cbx_test=create cbx_test
this.ddlb_kind=create ddlb_kind
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.cbx_3
this.Control[iCurrent+7]=this.cbx_4
this.Control[iCurrent+8]=this.cbx_5
this.Control[iCurrent+9]=this.gb_8
this.Control[iCurrent+10]=this.gb_7
this.Control[iCurrent+11]=this.em_1
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.st_horizontal
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.st_5
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
this.Control[iCurrent+31]=this.st_2
this.Control[iCurrent+32]=this.em_4
this.Control[iCurrent+33]=this.cb_4
this.Control[iCurrent+34]=this.dw_6
this.Control[iCurrent+35]=this.cbx_test
this.Control[iCurrent+36]=this.ddlb_kind
this.Control[iCurrent+37]=this.gb_6
end on

on w_oilabel_new_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
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
destroy(this.cb_4)
destroy(this.dw_6)
destroy(this.cbx_test)
destroy(this.ddlb_kind)
destroy(this.gb_6)
end on

event resize;call super::resize;//
dw_3.height = 2600
dw_1.height = 2600

gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_3.x + dw_3.width

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.y      = dw_3.y + dw_3.height
st_horizontal.width  = dw_3.width/*newwidth  - (gb_3.x * 2)*/

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = dw_3.width /*newwidth  - (gb_3.x * 2)*/
dw_2.height =  newheight - dw_2.y - gb_3.x

st_vertical.height = dw_3.height + dw_2.height


dw_4.height = dw_2.height

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.width  = newwidth  - dw_1.x - gb_3.x
dw_4.y      = st_horizontal.y + st_horizontal.height
end event

type pb_save from w_inheritance`pb_save within w_oilabel_new_m
boolean visible = false
integer x = 4686
integer y = 248
integer taborder = 60
boolean enabled = false
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//dwitemstatus l_status
//string  ls_area, ls_sdate, ls_edate, ls_sale_no
//string  ls_toloc, ls_fromloc, ls_null, ls_item, ls_str, ls_qa
//string  ls_cnt,   ls_order,   ls_destination, ls_old_time, ls_all, ls_sqlerrtext
//decimal ld_qoh, ld_issue_qty, ld_ask_qty, ld_rlse_qty
//real    lr_newqty
//long    ll_row, ll_count
//date    ld_date
//
//dw_area.accepttext()
//ls_area = dw_area.object.area[1]
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//setnull(ls_null)
//
//if dw_1.rowcount() < 1 then RETURN
//
//if dw_1.object.proc_flag[1] = "Y" then
//	MessageBox("확인","이미 요청처리가 완료 되었습니다.")
//	RETURN
//end if
//if MessageBox("확인", "선택하신 자료를 처리 하시겠습니까?",Exclamation!, OKCancel!, 1) = 2 then
//	RETURN
//end if
//
//for ll_row = 1 to dw_2.rowcount()
//	if dw_2.object.sel[ll_row] = 'N' then continue
//	
//	if dw_2.object.issue_qty[ll_row] = 0  then
//		MessageBox("확인", "수량이 없습니다.")
//		dw_2.scrolltorow(ll_row)
//		RETURN
//	end if
//
//      ld_qoh       = dw_2.object.qoh[ll_row]	
//	ld_issue_qty = dw_2.getitemnumber(ll_row,"issue_qty")
//	ld_ask_qty   = dw_2.getitemnumber(ll_row,"ask_qty")
//     ld_rlse_qty  = dw_2.object.rlse_qty[ll_row]
//	
//	if ld_issue_qty > ld_qoh then
//		dw_2.object.issue_qty[ll_row] = 0
//		dw_2.scrolltorow(ll_row)
//		dw_2.setcolumn('issue_qty')
//		dw_2.setfocus()
//
//		MessageBox("확인", "출고수량이 " + string(ld_issue_qty, "#,###,###0") + "~r~n" &
//						+ "저장소수량 " + string(ld_qoh, "#,###,###0") + " 보다 클수 없습니다.~r~n" )
//		RETURN
//	end if
//	
//	if (ld_rlse_qty + ld_issue_qty) > ld_ask_qty then
//		dw_2.object.issue_qty[ll_row] = 0		
//		dw_2.scrolltorow(ll_row)
//		dw_2.setcolumn('issue_qty')
//		dw_2.setfocus()
//
//		MessageBox("확인", "출고수량이 요청수량보다 클수 없습니다.")
//		RETURN
//	end if		
//next
//
//ls_all = "N"
//for ll_row = 1 to dw_2.rowcount()
//	if isnull(dw_2.object.loc_no[ll_row]) OR trim(dw_2.object.loc_no[ll_row]) = "" then
//		CONTINUE
//	end if
//	
//	l_status = dw_2.getitemstatus(ll_row, 0, primary!)
//	if l_status = NotModified! then CONTINUE
//		
//   ls_order   = dw_1.object.ask_no[1]
//   ls_toloc   = dw_1.object.ask_loc[1]
//   ls_item    = trim(dw_2.object.item_no[ll_row])
//   ls_fromloc = trim(dw_2.object.loc_no[ll_row])
//   lr_newqty  = dw_2.object.issue_qty[ll_row]
//   ld_ask_qty = dw_2.object.ask_qty[ll_row]
//   ls_qa      = trim(dw_2.object.qa[ll_row])
//   ls_cnt     = string(dw_2.object.seq_no[ll_row])
//   ls_destination = trim(dw_2.object.rem[ll_row])
//	
//	if ls_all = "N" and lr_newqty <> 0 then
//		ls_all = 'Y'
//	end if
//	if ls_all = 'Y' and dw_2.object.rlse_qty[ll_row] + lr_newqty < ld_ask_qty then
//		ls_all = "P"
//	end if
//	
//	if ls_all = "N" then CONTINUE
//	
//  // 물품저장소 출고
//	ld_date = date(dw_1.object.act_date[1])
//   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
//	 	    inaudit_type,serial_id,cost,destination, user_id )
//   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,0,:lr_newqty,:ls_fromloc,
//	 	    'IK',:ls_cnt,0,:ls_toloc, :gs_userid );
//   if sqlca.sqlcode < 0 then
//		ls_sqlerrtext = sqlca.sqlerrtext
//      ROLLBACK;
//      MessageBox('오류1','[inaudit] insert중 DB오류가 발생했습니다.~r~n ' &
//							+ string(sqlca.sqlerrtext),exclamation!)
//      RETURN 
//   end if
//	
//	ls_old_time  = string(now(), 'hh:mm:ss:fff')
//	for ll_count = 1 to 100000
//		if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//			ls_old_time  = string(now(),'hh:mm:ss:fff')	
//			EXIT
//		end if
//	next
//	
//   // 물품저장소 입고
//	ld_date = date(dw_1.object.act_date[1])
//   INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,
//	 	    inaudit_type,serial_id,cost,destination, user_id)
//   VALUES (getdate(),:ld_date,:ls_item,:ls_qa,:ls_order,:lr_newqty,0,:ls_toloc,
//	 	    'RK',:ls_cnt,0,:ls_fromloc, :gs_userid );
//   if sqlca.sqlcode < 0 then
//		ls_sqlerrtext = sqlca.sqlerrtext
//      ROLLBACK;
//      MessageBox('오류1','[inaudit] insert중 DB오류가 발생했습니다.~r~n ' &
//							+ string(sqlca.sqlerrtext),exclamation!)
//      RETURN 
//   end if
//	
//   dw_2.object.rlse_date[ll_row] = gf_today()
//   dw_2.object.rlse_qty[ll_row]  = dw_2.object.rlse_qty[ll_row] + lr_newqty
//	if dw_2.object.rlse_qty[ll_row] >= ld_ask_qty then
//	   dw_2.object.rlse_flag[ll_row] = 'Y'
//	end if
//next
//
//if ls_all = "N" then
//	MessageBox("확인", "선택한 자료가 없습니다.")
//	RETURN
//end if	
//
//ls_all = "Y"
//for ll_row = 1 to dw_2.rowcount()
//	IF dw_2.object.rlse_flag[ll_row] = 'N' THEN
//		ls_all = "P"
//		exit
//	END IF
//next
//
//dw_1.object.proc_flag[1]   = ls_all
//dw_1.object.act_user[1]    = gs_userid
//dw_1.object.ship_date[1]   = dw_1.object.act_date[1]	// wf_today() : 2007-06-21 운반일자를 접수일자로 같게함.
//dw_1.object.log_date[1]    = gf_today()
//dw_1.object.ship_close[1]  = 'O'
//dw_1.object.f_area[1]      = dw_area.object.area[1]
//
//if WF_Update2( dw_1, dw_2, "Y" ) = true then
//	dw_2.object.loc_no.tabsequence    = 0
//	dw_2.object.issue_qty.tabsequence = 0
//	dw_2.object.rem.tabsequence       = 0
//
//	if MessageBox("확인", "선택한 자료는 처리완료 되었습니다. ~r~n" &
//			+ "사내송장을 출력 하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 then
//		pb_print.triggerevent(clicked!)
//	end if
//
//	ls_sdate  = GF_ReplaceAll(em_1.text,"/","-") + " 00:00:00.000"
////	ls_edate  = GF_ReplaceAll(em_2.text,"/","-") + " 23:59:59.999"
//
//	/*2018.05.09  jowonsuk 내용 보완 */
//	if isnull(ls_sale_no) OR ls_sale_no = '' then 	
//		ls_sale_no = '%'
//	else	
//		ls_sale_no = trim(em_3.text) + '-' + right ( "000" + trim(em_4.text), 3)	
//	end if
//
//	dw_3.retrieve( ls_area, ls_sdate, ls_edate, ls_sale_no ) 	/*2018.05.09  jowonsuk 내용 보완 */
//end if
//
end event

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품이동",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_oilabel_new_m
integer x = 3922
integer y = 436
integer width = 1728
integer height = 756
integer taborder = 80
string dataobject = "d_oilabel_m"
boolean hscrollbar = false
end type

event dw_1::itemchanged;//string ls_car
//   
//choose case dwo.name
//	case 'driver'
//		this.object.rem2[1] = idwc_car.getitemstring(idwc_car.getrow(),'driver') + " " &
//								  + idwc_car.getitemstring(idwc_car.getrow(),'name') 
//end choose
//
decimal ld_qty, ld_order_qty, ld_rlse_qty, ld_issue_qty

ld_order_qty = dw_1.object.order_qty[row]
ld_rlse_qty = dw_1.object.rlse_qty[row]			
ld_issue_qty = dw_1.object.issue_qty[row]						


if isnull(ld_order_qty) then
	ld_order_qty = 0
end if

if isnull(ld_rlse_qty) then
	ld_rlse_qty = 0
end if

if isnull(ld_issue_qty) then
	ld_issue_qty = 0
end if			

if isnull(ld_issue_qty) or ld_issue_qty  =0 then
		ld_qty = ld_order_qty - ld_rlse_qty
else
		ld_qty = ld_issue_qty
end if

choose case dwo.name
	case 'label_check'
		IF data = 'Y' THEN
			this.object.qty[row] = ld_qty
			if ld_qty = 0 then
				dw_1.object.label_check[row]	 = 'N'
			end if			
		ELSE
			setnull(ld_qty)			
			this.object.qty[row] = ld_qty			
		END IF
end choose

end event

event dw_1::retrieveend;call super::retrieveend;////
//if this.rowcount() <1  then return
//
//if isnull(dw_1.object.act_date[1]) then
//	dw_1.object.act_date[1] = datetime(date(string(today(), "yyyy/mm/dd")))
//end if
//
end event

event dw_1::clicked;call super::clicked;
string ls_label_check, ls_part_yn
long	ll_row		
decimal ld_qty, ld_order_qty, ld_rlse_qty, ld_issue_qty			
		
choose case dwo.name
	case 'b_1'
				
	for ll_row = 1 to dw_1.rowcount()
	
			ls_label_check = dw_1.object.label_check[ll_row]	
			ls_part_yn = dw_1.object.part_yn[ll_row]

			ld_order_qty = dw_1.object.order_qty[ll_row]
			ld_rlse_qty = dw_1.object.rlse_qty[ll_row]			
			ld_issue_qty = dw_1.object.issue_qty[ll_row]						
			
			
			if isnull(ld_order_qty) then
				ld_order_qty = 0
			end if
			
			if isnull(ld_rlse_qty) then
				ld_rlse_qty = 0
			end if
			
			if isnull(ld_issue_qty) then
				ld_issue_qty = 0
			end if			
			
			if isnull(ld_issue_qty) or ld_issue_qty  =0 then
					ld_qty = ld_order_qty - ld_rlse_qty
			else
					ld_qty = ld_issue_qty
			end if
			
			if ls_part_yn = '부속' then
				
				if ls_label_check = 'Y' then
					dw_1.object.label_check[ll_row]	 = 'N'
					setnull(ld_qty)
					dw_1.object.qty[ll_row] = ld_qty
					
				else
					dw_1.object.label_check[ll_row]	 = 'Y'			
					dw_1.object.qty[ll_row] = ld_qty	
					
					if ld_qty = 0 then
						dw_1.object.label_check[ll_row]	 = 'N'
					end if
				end if
				
			end if
	next				
		
end choose
		
end event

type st_title from w_inheritance`st_title within w_oilabel_new_m
integer x = 0
integer y = 0
integer width = 1120
integer height = 140
string text = "출고품라벨 출력관리"
end type

type st_tips from w_inheritance`st_tips within w_oilabel_new_m
integer x = 270
integer y = 164
end type

type pb_compute from w_inheritance`pb_compute within w_oilabel_new_m
boolean visible = false
integer x = 4462
integer y = 248
integer taborder = 150
boolean enabled = false
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품이동",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_oilabel_new_m
boolean visible = false
integer x = 2889
integer width = 238
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "이력출력"
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

type pb_close from w_inheritance`pb_close within w_oilabel_new_m
integer x = 4759
integer y = 64
integer taborder = 160
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oilabel_new_m
integer x = 4562
integer y = 64
integer taborder = 170
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   li_find,  li_end, ll_row, ll_cnt, l_seq_no, l_retrieve_cnt
int      l_print_start_group, l_print_group, l_print_group_seq, l_print_group_original
string old_dwnm, ls_label_check, ls_part_yn, ls_label_no, ls_order_no, ls_item_no, ls_qa, ls_qrdata, ls_data, l_base_data, ls_qrcode, ls_origin_lable_no
datawindow dw_prt
dwItemStatus  l_status
decimal l_label_no, l_issue_qty, l_req_qty
datetime l_sys_date

dw_1.accepttext()

if isnull(i_sys_date) = false then		/*dw_2 에서 받아온 . i_sys_date */

	if messagebox("확인", "라벨번호 [" + is_label_no + "] " + is_number + "건을~r~n" + &
	           "이력 내역으로 출력하시겠습니까?",   Exclamation!, OKCancel!, 2) = 1 then
				  
		l_sys_date = i_sys_date
  	     ll_cnt = i_print_group 				/* 동일 수주건의 분할 건수 */	
		l_print_start_group = i_print_group			/* 동일 수주건의 분할 건수 */
		l_print_group = i_print_group
	
	else
		return 0
	end if
		
else
	
	 l_sys_date = gf_today()	 
	 l_print_group = 1
	 l_print_group_seq = 1
	 
	/*2019.02.01 jowonsuk 한라벨 묶음 번호 */ 
	long  l_print_no	 
	 
	select  max(isnull(print_no,0))+1 print_no
	into :l_print_no
	 from label_item
	 where order_no = :is_order_no;
	 
	 if sqlca.sqlcode <> 0 then
		l_print_no = 1
	end if
	
	for ll_row = 1 to dw_1.rowcount()
		
			if dw_1.object.label_check[ll_row]	= 'Y' then

					ls_order_no = dw_1.object.order_no[ll_row]
					l_seq_no = dw_1.object.seq_no[ll_row]					
					ls_item_no = dw_1.object.item_no[ll_row]
					ls_qa = dw_1.object.qa[ll_row]					
					l_issue_qty = dw_1.object.qty[ll_row]											
					l_issue_qty = dw_1.getitemnumber(ll_row, "qty")
					l_issue_qty = dw_1.getitemnumber(ll_row, "qty", Primary!, false)	
					
					string ls_salesman
					int      l_len = 0, i 
					
					ls_salesman  = trim(is_salesman)
					
					l_len = LenA(ls_salesman)
					
					l_len = 10 - l_len
					
					for i = 1 to l_len
						ls_salesman = ls_salesman + ' '
					next					
					
					/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번에서 -> 출고의뢰일자(8자리)+담당자(10자리)+차수(5자리)+출고의뢰순번(5자리)+수주번호*/
/*					ls_origin_lable_no = is_convert_req_date+ls_salesman+trim(string(i_req_seq,'00000'))+trim(string(i_seq,'00000'))+is_order_no*/
					ls_origin_lable_no = is_order_no
																			
					if l_print_group_seq = 1 then				

						/*라벨 번호 따기 */
						select  isnull(max(substring(label_no,15,5)),0) + 1 label_no
						 into :l_label_no
						 from label_item
						 where label_no like :is_order_no+'%'
							and order_no = :is_order_no
							and isnumeric(substring(label_no,15,5)) = 1;

/*
						select  isnull(max(substring(label_no,43,5)),0) + 1 label_no
						     into :l_label_no
						   from label_item
						 where label_no like :ls_origin_lable_no+'%'
						    and order_no = :is_order_no;
*/
					end if	
														
/*					ls_label_no = trim(string(i_req_date))+ trim(string(is_salesman,'0000000000'))+trim(string(i_req_seq,'00000'))+trim(string(i_seq,'00000'))+is_order_no + trim(string(l_label_no, '00000'))  */
					/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번에서 -> 출고의뢰일자(8자리)+담당자(10자리)+차수(5자리)+출고의뢰순번(5자리)+수주번호+라벨순번(5)*/
					ls_label_no = ls_origin_lable_no + trim(string(l_label_no, '00000'))
									
					insert into label_item (req_date,     salesman,       req_seq,     req_flag,      seq,     order_no,       seq_no,     label_no,      item_no,       qa,       issue_qty,    sys_date,		 print_group, print_group_seq, print_no, mpsorder_order, order_seq, use_yn)
											values   (:i_req_date, :is_salesman, :i_req_seq, :is_req_flag, :i_seq, :ls_order_no, :l_seq_no, :ls_label_no, :ls_item_no, :ls_qa, :l_issue_qty, :l_sys_date,		 :l_print_group, :l_print_group_seq, :l_print_no, null, null, 'N' );
											 
					l_print_group_seq = l_print_group_seq  + 1
						
					if l_print_group_seq = 7 then /*6건을 라벨 발행하고 있으므로 7이면 새로 시작. */
						l_print_group_seq = 1					
						l_print_group = l_print_group + 1
					end if
					
			end if		
		
	next				
	
	commit;
	
	dw_2.retrieve(i_req_date, is_salesman, i_req_seq, is_req_flag, i_seq)		
	
	select  max(a.print_group)
		into  :l_print_group
	  from  label_item a
     where a.req_date    = :i_req_date
      and a.salesman  = :is_salesman
      and a.req_seq    = :i_req_seq
      and a.req_flag    = :is_req_flag
      and a.seq           = :i_seq
      and a.sys_date = :l_sys_date;
	
	ll_cnt = l_print_group 				/* 동일 수주건의 분할 건수 */	
	l_print_start_group = 1
	
end if

if cbx_test.checked = true then 
	
		l_base_data = ''		/*수주 거래처, 현장등 정보 */
		/*1. 수주의 기본정보를 받는다. */
		/*select   distinct '\'+substring(a.label_no,1,14)+'\'+substring(a.label_no,15,5)+'\'+convert(nvarchar(50), d.cust_name)+'\'+convert(nvarchar(40),  e.scene_desc )*/
		/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번에서 -> 출고의뢰일자(8자리)+담당자(10자리)+차수(5자리)+출고의뢰순번(5자리)+수주번호+라벨순번(5)*/
		/*select   distinct substring(a.label_no,1,8)+'|'+substring(a.label_no,9,10)+'|'+substring(a.label_no,19,5)+'|'+substring(a.label_no,24,5)+'|'+substring(a.label_no,29,14)+'|'+substring(a.label_no,43,5)*/
		/*2019.01.25 jowonsuk qrcode 원복*/
//		select   distinct a.label_no+'|'+c.cust_no+'|'+c.scene_code
//			into :l_base_data
//		from    label_item a with(nolock) 
//							 inner join groupitem b with(nolock) on a.item_no  = b.item_no
//							 inner join sale c with(nolock) on a.order_no = c.order_no
//							 inner join customer d with(nolock) on c.cust_no = d.cust_no
//							 inner join scene e with(nolock) on c.scene_code = e.scene_code
//		  where a.req_date    = :i_req_date
//				and a.salesman  = :is_salesman
//				and a.req_seq    = :i_req_seq
//				and a.req_flag    = :is_req_flag
//				and a.seq           = :i_seq
//				and a.sys_date  = :l_sys_date;
		
		/*1. 부품의 정보를 받는다.  수주의 기본정보를 받는다. */
		DECLARE label_item_test_cursor CURSOR FOR  
		/*select  a.print_group, a.label_no,  '\'+a.item_no+'\' + convert(nvarchar(60), b.item_name) +'\'+a.qa+'\'+convert(char(18), a.issue_qty )*/
		select  a.label_no+'|'+c.cust_no+'|'+c.scene_code, a.print_group, a.label_no,  '*'+convert(char(3),a.seq_no)+'|'+a.item_no+ '|'+a.qa+'|' , isnull(a.issue_qty,0) issue_qty
		from    label_item a with(nolock) 
							 inner join groupitem b with(nolock) on a.item_no  = b.item_no
							 inner join sale c with(nolock) on a.order_no = c.order_no
							 inner join customer d with(nolock) on c.cust_no = d.cust_no
							 inner join scene e with(nolock) on c.scene_code = e.scene_code
		  where a.req_date    = :i_req_date
				and a.salesman  = :is_salesman
				and a.req_seq    = :i_req_seq
				and a.req_flag    = :is_req_flag
				and a.seq           = :i_seq
				and a.sys_date = :l_sys_date	/* 차후 print_no로 대체 */
			     and a.print_group = :l_print_group
		order by a.print_group, a.print_group_seq	;
		
		
		
		for l_print_group = l_print_start_group to ll_cnt			 
			
				ls_qrdata = ''					/*초기화 */
		
				OPEN label_item_test_cursor;
				
						FETCH label_item_test_cursor INTO :l_base_data, :l_print_group, :ls_label_no, :ls_data, :l_req_qty;
				
						Do While sqlca.sqlcode = 0		  	
							
								ls_qrdata = ls_qrdata + ls_data+trim(string(l_req_qty))
									
								FETCH label_item_test_cursor INTO :l_base_data, :l_print_group, :ls_label_no, :ls_data, :l_req_qty;			
								
						Loop
				
				CLOSE label_item_test_cursor;
				
				ls_qrdata = l_base_data + ls_qrdata	/*2019.02.22 JOWONSUK 끝을 구분하기 위해서 구분자로 $ 다시 뺌 */
		
				gf_qrcode_create1(ls_qrdata, 'qrcode.bmp')		
				
				wf_print(ls_label_no, l_print_no)				

		next
	
else	

		l_base_data = ''		/*수주 거래처, 현장등 정보 */
		/*1. 수주의 기본정보를 받는다. */
		/*select   distinct '\'+substring(a.label_no,1,14)+'\'+substring(a.label_no,15,5)+'\'+convert(nvarchar(50), d.cust_name)+'\'+convert(nvarchar(40),  e.scene_desc )*/
		/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번에서 -> 출고의뢰일자(8자리)+담당자(10자리)+차수(5자리)+출고의뢰순번(5자리)+수주번호+라벨순번(5)*/
		/*select   distinct substring(a.label_no,1,8)+'|'+substring(a.label_no,9,10)+'|'+substring(a.label_no,19,5)+'|'+substring(a.label_no,24,5)+'|'+substring(a.label_no,29,14)+'|'+substring(a.label_no,43,5)*/
		/*2019.01.25 jowonsuk qrcode 원복*/
		select   distinct '|'+substring(a.label_no,1,14)+'|'+substring(a.label_no,15,5)+'|'+convert(nvarchar(50), d.cust_name)+'|'+convert(nvarchar(40),  e.scene_desc )
			into :l_base_data
		from    label_item a with(nolock) 
							 inner join groupitem b with(nolock) on a.item_no  = b.item_no
							 inner join sale c with(nolock) on a.order_no = c.order_no
							 inner join customer d with(nolock) on c.cust_no = d.cust_no
							 inner join scene e with(nolock) on c.scene_code = e.scene_code
		  where a.req_date    = :i_req_date
				and a.salesman  = :is_salesman
				and a.req_seq    = :i_req_seq
				and a.req_flag    = :is_req_flag
				and a.seq           = :i_seq
				and a.sys_date = :l_sys_date;
		
		/*1. 부품의 정보를 받는다.  수주의 기본정보를 받는다. */
		DECLARE label_item_cursor CURSOR FOR  
		/*select  a.print_group, a.label_no,  '\'+a.item_no+'\' + convert(nvarchar(60), b.item_name) +'\'+a.qa+'\'+convert(char(18), a.issue_qty )*/
		select  a.print_group, a.label_no,  '|'+a.item_no+ '|'+a.qa+'|' , isnull(a.issue_qty,0) issue_qty
		from    label_item a with(nolock) 
							 inner join groupitem b with(nolock) on a.item_no  = b.item_no
							 inner join sale c with(nolock) on a.order_no = c.order_no
							 inner join customer d with(nolock) on c.cust_no = d.cust_no
							 inner join scene e with(nolock) on c.scene_code = e.scene_code
		  where a.req_date    = :i_req_date
				and a.salesman  = :is_salesman
				and a.req_seq    = :i_req_seq
				and a.req_flag    = :is_req_flag
				and a.seq           = :i_seq
				and a.sys_date = :l_sys_date
			and a.print_group = :l_print_group
		order by a.print_group, a.print_group_seq	;
		
		
		
		for l_print_group = l_print_start_group to ll_cnt			 
			
				ls_qrdata = ''					/*초기화 */
		
				OPEN label_item_cursor;
				
						FETCH label_item_cursor INTO :l_print_group, :ls_label_no, :ls_data, :l_req_qty;
				
						Do While sqlca.sqlcode = 0		  	
							
								ls_qrdata = ls_qrdata + ls_data+trim(string(l_req_qty,'000000000000000000'))
									
								FETCH label_item_cursor INTO :l_print_group, :ls_label_no, :ls_data, :l_req_qty;			
								
						Loop
				
				CLOSE label_item_cursor;
				
				ls_qrdata = l_base_data + ls_qrdata+'|'				
		
				gf_qrcode_create1(ls_qrdata, 'qrcode.bmp')		
				
				wf_print(ls_label_no, l_print_no)
					
		
		next		

end if
			

//PrintSetup()
//if messagebox("확인1","선택된 물품 요청번호 전체를 선택한 프린터로 출력합니다.~r~n" + &
//	           "1개의 물품요청번호에 출력됩니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
//	RETURN
//end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_oilabel_new_m
integer x = 4370
integer y = 64
integer taborder = 180
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_oilabel_new_m
boolean visible = false
integer x = 4992
integer y = 68
integer taborder = 190
boolean enabled = false
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oilabel_new_m
boolean visible = false
integer x = 3995
integer y = 68
integer taborder = 200
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oilabel_new_m
integer x = 4169
integer y = 64
integer taborder = 30
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area, ls_sdate, ls_edate, ls_sale_no, ls_cat, ls_accept

dw_area.accepttext()
ls_area   = dw_area.object.area[1]

ls_sdate  = LeftA(em_1.text,4) +MidA(em_1.text,6,2)+RightA(em_1.text,2)
ls_sale_no = trim(em_3.text)

if isnull(ls_sale_no) OR ls_sale_no = '' then 	
	ls_sale_no = '%'
else	
	ls_sale_no = trim(em_3.text) + '-' + RightA ( "000" + trim(em_4.text), 3)	
end if

//ls_cat = '출고의뢰'			/*2018.12.27 JOWONSUK 현재는 무조건 출하이다. */
//// 접수자 차후 접수자를 선택할때는 
//ls_accept = dw_9.object.accept_user[1]
//if isnull(ls_accept) OR ls_accept = "" then 
//	MessageBox("확인", "해당하는 출고사업장의 접수자를 선택하시기 바랍니다.")
//	RETURN
//end if

ls_accept = '%' /* 2018.09.07 jowonsuk '%' */


dw_1.reset() ; dw_2.reset() ; dw_3.reset()

dw_3.setredraw( false )

dw_3.Retrieve( ls_area, ls_accept, is_cat, ls_sdate )

dw_3.setredraw( true )

if dw_3.rowcount() > 0 then
	MessageBox("확인","조회완료")
else
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oilabel_new_m
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

type gb_2 from w_inheritance`gb_2 within w_oilabel_new_m
integer x = 1211
integer y = 16
integer width = 923
integer height = 216
integer taborder = 140
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oilabel_new_m
integer x = 4137
integer y = 16
integer width = 846
integer height = 216
integer taborder = 70
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oilabel_new_m
integer x = 32
integer y = 1220
integer width = 3858
integer height = 1140
integer taborder = 110
string dataobject = "d_oilabel_his_r"
end type

event dw_2::itemchanged;////
//long    ll_row, ll_found
//string  ls_itemno, ls_itemqa, ls_null, ls_where, ls_sql, ls_locno, ls_area, ls_locarea
//decimal ld_askqty, ld_rlseqty, ld_itemloc_qoh
//
//dw_2.Accepttext()
//
//ll_row     = this.getrow()
//ls_itemno  = this.getitemstring(ll_row, "item_no")
//ls_itemqa  = this.getitemstring(ll_row, "qa")
////ls_locno = this.getitemstring(ll_row, "loc_no")
//ls_area    = dw_1.object.f_area[1]
//
//setnull(ls_null) ; setnull(ls_locno)
//SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :ls_area;
//
//choose case dwo.name
//	case "sel"
//		if data = "Y" then
//			ls_where  = " AND itemloc.item_no = ~~'" + ls_itemno  + "~~'" &
//						 + " AND itemloc.qa = ~~'" + ls_itemqa  + "~~'" &
//						 + " AND location.area_no = ~~'" + dw_area.object.area[1] + "~~'" 
//			ls_sql = "datawindow.table.select = '" + is_locnosql + ls_where + "'"
//			
//			this.getchild("loc_no", idwc_locno)
//			idwc_locno.settransobject(sqlca)
//			idwc_locno.modify(ls_sql)
//			idwc_locno.retrieve()
//			
//			this.object.loc_no[ll_row] = ls_locno
//
//			ll_found = idwc_locno.find("itemloc_loc_no = '" + ls_locno + "'" , 1, idwc_locno.rowcount())
//			if ll_found > 0 then
//				idwc_locno.scrolltorow(ll_found)
//				if idwc_locno.getrow() < 1 then RETURN 0
//			
//				ld_itemloc_qoh = idwc_locno.GetItemDecimal(idwc_locno.getrow(), "qoh")
//				this.object.qoh[ll_row] = ld_itemloc_qoh
//	
//				this.object.loc_name[ll_row] = idwc_locno.getitemstring(idwc_locno.getrow(), "location_loc_name")
//				
//				ld_askqty  = this.object.ask_qty[ll_row]
//				ld_rlseqty = this.object.rlse_qty[ll_row]
//				
//				if ld_itemloc_qoh > ( ld_askqty - ld_rlseqty ) then
//					this.setitem( ll_row, "issue_qty", (ld_askqty - ld_rlseqty) )
//				else
//					if ld_itemloc_qoh <= 0 then
//						this.object.loc_no[ll_row]    = ls_null
//						this.object.issue_qty[ll_row] = 0
//						this.object.loc_name[ll_row]  = ls_null
//						this.object.qoh[ll_row]       = 0
//					else
//						this.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
//					end if
//				end if
//			else
//				this.object.loc_no[ll_row]    = ls_null
//				this.object.loc_name[ll_row]  = ls_null
//				this.object.issue_qty[ll_row] = 0
//				this.object.qoh[ll_row]       = 0
//			end if
//		else
//			this.object.loc_no[ll_row]    = this.getitemstring(ll_row, "loc_no", Primary!, TRUE)
//			this.object.loc_name[ll_row]  = this.getitemstring(ll_row, "loc_name", Primary!, TRUE)
//			this.object.issue_qty[ll_row] = this.getitemdecimal(ll_row, "issue_qty", Primary!, TRUE)
//			this.object.qoh[ll_row]       = 0
//			this.SetItemStatus(ll_row, 0, Primary!, NotModified!)
//		end if
//
//		// GetChild 값 적용
//		this.accepttext()
//		
//	case "loc_no"
//		// 선정수량에 DEFAULT로 선택한 저장소의 출고가능한 수량을 DISPLAY
//		this.getchild("loc_no", idwc_locno)
//		if idwc_locno.getrow() < 1 then RETURN 0
//		
//		// 같은사업장 아니면 오류 체크해야 함
//		ls_locarea     = idwc_locno.getitemstring(idwc_locno.getrow(), "location_area_no")
//		
//		ld_itemloc_qoh = idwc_locno.GetItemDecimal(idwc_locno.getrow(), "qoh")		
//		this.object.qoh[ll_row] = ld_itemloc_qoh
//		
//		this.object.loc_name[ll_row] = idwc_locno.getitemstring(idwc_locno.getrow(), "location_loc_name")
//
//		ld_askqty  = this.object.ask_qty[ll_row]
//		ld_rlseqty = this.object.rlse_qty[ll_row]
//
//		if ld_itemloc_qoh > ( ld_askqty - ld_rlseqty ) then
//			this.setitem( ll_row, "issue_qty", (ld_askqty - ld_rlseqty) )
//		else
//			if ld_itemloc_qoh <= 0 then
//				RETURN 1
//			else
//				this.setitem(ll_row, "issue_qty", ld_itemloc_qoh)	
//			end if
//		end if
//		
//		// GetChild 값 적용
//		this.accepttext()
//
////	case 'issue_qty'
////		wf_calc(ll_row)
//end choose

end event

event dw_2::itemerror;//integer ll_row
//string  ls_null
//
//setnull(ls_null)
//
//ll_row = this.getrow()
//this.object.loc_no[ll_row]    = ls_null
//this.object.loc_name[ll_row]  = ls_null
//this.object.issue_qty[ll_row] = 0
//this.object.qoh[ll_row]       = 0
//this.setcolumn('sel')
//
//return 2
//
end event

event dw_2::rowfocuschanged;//
//string ls_itemno, ls_itemqa, ls_null, ls_where, ls_sql
//long   ll_row
//
//dw_2.accepttext()
//
//ll_row = this.getrow()
//if ll_row < 1 then RETURN
//
//ls_itemno = this.getitemstring(ll_row, "item_no")
//ls_itemqa = this.getitemstring(ll_row, "qa")
//
//setnull(ls_null)
//ls_where  = " AND itemloc.item_no = ~~'" + ls_itemno + "~~' AND itemloc.qa = ~~'" + ls_itemqa + "~~'"
//ls_sql    = "datawindow.table.select = '" + is_locnosql + ls_where + "'"
//this.getchild("loc_no", idwc_locno)
//idwc_locno.settransobject(sqlca)
//idwc_locno.modify(ls_sql)
//idwc_locno.retrieve()
//
end event

event dw_2::clicked;string ls_label_no, ls_item_no, ls_qa
long   ll_row
decimal l_issue_qty

//is_order_no = this.object.order_no[row]
//i_req_date = this.object.req_date[row]
//is_salesman = this.object.salesman[row]
//i_req_seq = this.object.req_seq[row]
//is_req_flag = this.object.req_flag[row]
//i_seq = this.object.seq[row]
ls_label_no = this.object.original_label_no[row]

setnull(i_sys_date)
i_sys_date  = this.object.sys_date[row]
//is_label_no = mid(this.object.label_no[row], 1,14)+ '-' + mid(this.object.label_no[row],16,5)
is_label_no = this.object.label_no[row]
is_number  = string(this.object.number[row])
i_print_group = this.object.print_group[row]

dw_4.retrieve(i_req_date, is_salesman, i_req_seq, is_req_flag, i_seq, ls_label_no)

for ll_row = 1 to dw_1.rowcount()
	
	setnull(l_issue_qty) 
	
	dw_1.object.label_check[ll_row] = 'N'
	dw_1.object.qty[ll_row] = l_issue_qty

next	


for ll_row = 1 to dw_1.rowcount()

	ls_item_no  = dw_1.object.item_no[ll_row]
	ls_qa           = dw_1.object.qa[ll_row]
	
	setnull(l_issue_qty) 
	
	select label_item.issue_qty
	into     :l_issue_qty
	from label_item 
	where req_date    = :i_req_date
		 and salesman  = :is_salesman
		 and req_seq    = :i_req_seq
		 and req_flag    = :is_req_flag
		 and seq           = :i_seq
		 and label_no   = :ls_label_no
		 and item_no   = :ls_item_no
		 and qa            = :ls_qa;
		
	if isnull(l_issue_qty) = false then
	
			dw_1.object.label_check[ll_row] = 'Y'
			dw_1.object.qty[ll_row] = l_issue_qty
	
	end if

next		
end event

type dw_3 from datawindow within w_oilabel_new_m
integer x = 32
integer y = 436
integer width = 3858
integer height = 756
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oilabel_r1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;////
//long   ll_row
//
//ll_row = this.Getrow()
//if isnull(ll_row) OR ll_row < 1 then RETURN
//
//cbx_1.checked = false		// 전체선택
//
//is_order_no = this.object.ask_no[ll_row]
//if isnull(is_order_no) OR is_order_no = "" then RETURN
//
//dw_1.setredraw( false ) ; dw_2.setredraw( false )
//dw_1.retrieve(is_order_no)
//dw_2.retrieve(is_order_no)
//dw_1.setredraw( true ) ; dw_2.setredraw( true )

end event

event clicked;long ll_row

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

ll_row = this.getrow()
if ll_row < 1 then return
if row    < 1 or row > this.rowcount() then return

is_order_no = this.object.order_no[row]
is_convert_req_date = this.object.convert_req_date[row]		/*2019.01.10 jowonsuk 추가 */
i_req_date = this.object.req_date[row]
is_salesman = this.object.salesman[row]
i_req_seq = this.object.req_seq[row]
is_req_flag = this.object.req_flag[row]
i_seq = this.object.seq[row]
is_issue_schedule = this.object.issue_schedule[row]
setnull(i_sys_date)


if is_issue_schedule = '물품이동' then  /* 출고의뢰에서 가지고 온다. */
	dw_1.dataobject = 'd_oilabel_m1'
else					   /* 물품이동에서 가져 온다. */
	dw_1.dataobject = 'd_oilabel_m'
end if 

dw_1.settransobject(sqlca)

dw_1.retrieve(is_order_no)
dw_2.retrieve(i_req_date, is_salesman, i_req_seq, is_req_flag, i_seq)
		

end event

type dw_4 from datawindow within w_oilabel_new_m
integer x = 3922
integer y = 1220
integer width = 1728
integer height = 1132
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_oilabeldet_his_r"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_oilabel_new_m
boolean visible = false
integer x = 901
integer y = 176
integer width = 242
integer height = 72
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_oilabel_printing"
boolean border = false
end type

type dw_area from datawindow within w_oilabel_new_m
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

type cbx_2 from checkbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "명세"
end type

type cbx_3 from checkbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "인수"
boolean checked = true
end type

type cbx_4 from checkbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "출고"
boolean checked = true
end type

type cbx_5 from checkbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "납품"
boolean checked = true
end type

type gb_8 from groupbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "출력여백"
end type

type gb_7 from groupbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "출력"
end type

type em_1 from editmask within w_oilabel_new_m
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
//lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
//	em_2.text = lstr_calendar.edate
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

type st_vertical from u_splitbar_vertical within w_oilabel_new_m
integer x = 3895
integer y = 432
integer height = 1920
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oilabel_new_m
integer x = 32
integer y = 1192
integer width = 3854
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_3.height

end event

type st_4 from statictext within w_oilabel_new_m
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

type st_5 from statictext within w_oilabel_new_m
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

type st_6 from statictext within w_oilabel_new_m
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

type ddlb_fld from dropdownlistbox within w_oilabel_new_m
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

type ddlb_dwtitles from dropdownlistbox within w_oilabel_new_m
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

type st_7 from statictext within w_oilabel_new_m
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

type sle_value from singlelineedit within w_oilabel_new_m
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

type cb_1 from commandbutton within w_oilabel_new_m
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

type cb_2 from commandbutton within w_oilabel_new_m
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

type cb_3 from commandbutton within w_oilabel_new_m
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

type cb_5 from commandbutton within w_oilabel_new_m
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

type st_left from statictext within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "왼쪽"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_left from editmask within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
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

type st_9 from statictext within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "상단"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_top from editmask within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
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

type ddlb_op from dropdownlistbox within w_oilabel_new_m
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

type em_3 from editmask within w_oilabel_new_m
event keydown pbm_dwnkey
boolean visible = false
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
boolean enabled = false
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

type st_2 from statictext within w_oilabel_new_m
boolean visible = false
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

type em_4 from editmask within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
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

type cb_4 from commandbutton within w_oilabel_new_m
integer x = 2158
integer y = 68
integer width = 658
integer height = 124
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주상황부 출력"
end type

event clicked;w_repsuper w_print
st_print   l_print
string ls_orderno, ls_dw6sql, ls_where, ls_sql, ls_scenehp
long   ll_row

/*
if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if
*/
ls_scenehp = 'Y'

//PrintSetup()

ls_dw6sql  = dw_6.describe("datawindow.table.select")

dw_6.retrieve( ls_scenehp, is_order_no,  is_order_no, '%')		

//dw_6.modify( 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100' )
//dw_6.print()

l_print.st_datawindow  = dw_6
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type dw_6 from datawindow within w_oilabel_new_m
boolean visible = false
integer x = 581
integer y = 168
integer width = 242
integer height = 72
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_orsale_print2"
boolean border = false
end type

type cbx_test from checkbox within w_oilabel_new_m
boolean visible = false
integer x = 5216
integer y = 300
integer width = 347
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
string text = "테스트"
boolean automatic = false
boolean checked = true
end type

type ddlb_kind from dropdownlistbox within w_oilabel_new_m
integer x = 2930
integer y = 76
integer width = 1193
integer height = 324
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
string item[] = {"출고의뢰 기준(소벤딩,부속,택배)","수주 기준(절곡,유압,상품)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if this.text = '출고의뢰 기준(소벤딩,부속,택배)' then
		//dw_3.dataobject = 'd_oilabel_r'
		is_cat = '출고의뢰'
else
		//dw_3.dataobject = 'd_oilabel_r1'
		is_cat = '수주'
end if

dw_3.settransobject( sqlca)
end event

type gb_6 from groupbox within w_oilabel_new_m
boolean visible = false
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
boolean enabled = false
string text = "수주번호"
end type

