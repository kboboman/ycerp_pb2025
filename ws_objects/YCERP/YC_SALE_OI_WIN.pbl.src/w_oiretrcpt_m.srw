$PBExportHeader$w_oiretrcpt_m.srw
$PBExportComments$반품요청 확인관리(2000/05/06,이인호)
forward
global type w_oiretrcpt_m from w_inheritance
end type
type dw_4 from datawindow within w_oiretrcpt_m
end type
type dw_3 from datawindow within w_oiretrcpt_m
end type
type dw_inaudit from datawindow within w_oiretrcpt_m
end type
type dw_6 from datawindow within w_oiretrcpt_m
end type
type rb_3 from radiobutton within w_oiretrcpt_m
end type
type rb_4 from radiobutton within w_oiretrcpt_m
end type
type rb_1 from radiobutton within w_oiretrcpt_m
end type
type rb_2 from radiobutton within w_oiretrcpt_m
end type
type st_7 from statictext within w_oiretrcpt_m
end type
type dw_area from datawindow within w_oiretrcpt_m
end type
type st_1 from statictext within w_oiretrcpt_m
end type
type st_2 from statictext within w_oiretrcpt_m
end type
type st_3 from statictext within w_oiretrcpt_m
end type
type ddlb_fld from dropdownlistbox within w_oiretrcpt_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oiretrcpt_m
end type
type st_4 from statictext within w_oiretrcpt_m
end type
type sle_value from singlelineedit within w_oiretrcpt_m
end type
type cb_1 from commandbutton within w_oiretrcpt_m
end type
type cb_2 from commandbutton within w_oiretrcpt_m
end type
type cb_3 from commandbutton within w_oiretrcpt_m
end type
type cb_4 from commandbutton within w_oiretrcpt_m
end type
type st_vertical from u_splitbar_vertical within w_oiretrcpt_m
end type
type ddlb_op from dropdownlistbox within w_oiretrcpt_m
end type
type gb_4 from groupbox within w_oiretrcpt_m
end type
type gb_5 from groupbox within w_oiretrcpt_m
end type
end forward

global type w_oiretrcpt_m from w_inheritance
integer width = 4695
integer height = 2648
string title = "반품요청 확인관리(w_oiretrcpt_m)"
dw_4 dw_4
dw_3 dw_3
dw_inaudit dw_inaudit
dw_6 dw_6
rb_3 rb_3
rb_4 rb_4
rb_1 rb_1
rb_2 rb_2
st_7 st_7
dw_area dw_area
st_1 st_1
st_2 st_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
st_vertical st_vertical
ddlb_op ddlb_op
gb_4 gb_4
gb_5 gb_5
end type
global w_oiretrcpt_m w_oiretrcpt_m

type variables
DataWindowChild idwc_area, idwc_qa
st_print i_print

string is_window, is_order_no, is_con ="Y", is_loc

end variables

forward prototypes
public subroutine wf_chk ()
public subroutine wf_sel ()
end prototypes

public subroutine wf_chk ();//
string ls_proc, ls_null
date   ld_date
long   ll_row

setnull(ld_date)
setnull(ls_null)

dw_2.accepttext()
dw_3.accepttext()
dw_4.accepttext()

ls_proc = dw_4.getitemstring(dw_4.getrow(), 'process_flag')	// 확인 On : I, Off : Y
if rb_1.checked = true then	// 마감(영업)
	if ls_proc = 'I' then      // On
		dw_2.object.process_flag[dw_2.getrow()] = 'C'
	else
		dw_2.object.process_flag[dw_2.getrow()] = 'Y'
	end if
elseif rb_2.checked = true then // 마감취소(영업)
	if ls_proc = 'I' then		// On
		dw_2.object.process_flag[dw_2.getrow()] = 'Y'
	else
		dw_2.object.process_flag[dw_2.getrow()] = 'C'
	end if
else // 'I : 확인취소','Y : 반품확인' -- 출고 --
	dw_2.object.process_flag[dw_2.getrow()] = ls_proc
end if

CHOOSE CASE ls_proc
	CASE "Y"
		dw_2.object.ret_date[dw_2.getrow()] = ld_date
	CASE ELSE
		dw_2.object.ret_date[dw_2.getrow()] = wf_today()
END CHOOSE

end subroutine

public subroutine wf_sel ();string  ls_null, ls_proc
long ll_row

setnull(ls_null)

dw_2.accepttext()
dw_3.accepttext()
dw_4.accepttext()
ls_proc = dw_4.getitemstring(dw_4.getrow(), 'process_flag')
for ll_row = 1 to dw_3.rowcount()
	if ls_proc = 'Y' then
		dw_3.object.acc_chk[ll_row] = 'N'
		dw_3.object.acc_qty[ll_row] = 0
		dw_3.object.free_qty[ll_row] = 0
		dw_3.object.loc_no[ll_row] = ls_null
	else
		dw_3.object.acc_chk[ll_row] = 'Y'
		dw_3.object.acc_qty[ll_row] = dw_3.object.ret_qty[ll_row]
		dw_3.object.loc_no[ll_row] = dw_6.object.loc_no[dw_6.getrow()]
		dw_3.object.free_qty[ll_row] = 0
	end if
next

end subroutine

on w_oiretrcpt_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_inaudit=create dw_inaudit
this.dw_6=create dw_6
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_7=create st_7
this.dw_area=create dw_area
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_inaudit
this.Control[iCurrent+4]=this.dw_6
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.st_7
this.Control[iCurrent+10]=this.dw_area
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_3
this.Control[iCurrent+21]=this.cb_4
this.Control[iCurrent+22]=this.st_vertical
this.Control[iCurrent+23]=this.ddlb_op
this.Control[iCurrent+24]=this.gb_4
this.Control[iCurrent+25]=this.gb_5
end on

on w_oiretrcpt_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_inaudit)
destroy(this.dw_6)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.st_vertical)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_2 )
st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////


ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_6.insertrow(0)
dw_inaudit.settransobject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = "%"

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = "%"	// gs_area	// 기본값을 변경	
dw_area.accepttext()
//dw_area.enabled = false


dw_1.visible = false
dw_inaudit.visible = false

if gf_permission('반품요청 확인관리', gs_userid) = 'Y' then
else
	pb_save.enabled = false
	dw_2.modify("datawindow.readonly=yes")
	dw_3.modify("datawindow.readonly=yes")
	dw_4.modify("datawindow.readonly=yes")
end if

// 사업장 기본 저장소
SELECT def_loc INTO :is_loc FROM area WHERE area_no = :gs_area;
dw_6.object.loc_no[1] = is_loc

dw_6.enabled = false
if GF_PERMISSION('반품입고저장소변경', gs_userid) = 'Y' then
	dw_6.enabled = true
end if

end event

event resize;call super::resize;//
gb_5.width  = newwidth  - (gb_5.x * 2)

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_4.width  = newwidth  - dw_4.x - gb_5.x

dw_3.width  = newwidth  - (dw_3.x * 2)
dw_3.height = newheight - dw_3.y - dw_3.x


end event

type pb_save from w_inheritance`pb_save within w_oiretrcpt_m
event ue_print pbm_custom01
integer x = 3995
integer y = 64
integer taborder = 140
end type

event pb_save::clicked;//
dwitemstatus l_status
long   ll_dw2row, ll_dw3row, ll_dw4row, ll_row, ll_count, ll_tcnt, ll_ycnt
string ls_old_time, ls_chk, ls_chk2, ls_order_no, ls_cust_no, ls_process_flag
datetime l_ret_date
 
dw_2.accepttext()
dw_3.accepttext()
dw_4.accepttext()
dw_inaudit.accepttext()

ll_tcnt = 0
ll_ycnt = 0

if dw_4.rowcount() < 1 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
//preret_date

if rb_1.checked = true or rb_2.checked = true then		// 마감, 마감취소

	ll_tcnt = dw_4.object.tcnt[1]
	if ll_tcnt <> 1 then
		MessageBox("확인","반품번호는 한건만 처리 가능합니다.(필터링 후 처리요망)")
		RETURN
	end if

	if wf_update1( dw_2, 'Y') = true then
		pb_retrieve.triggerevent(clicked!)
	end if
	RETURN
end if

dw_inaudit.reset()
ll_dw4row = dw_4.getrow()

if rb_3.checked = true then	// 반품확인
				
	ll_tcnt = dw_4.object.tcnt[1]
	
	if ll_tcnt <> 1 then
		MessageBox("확인","반품번호는 한건만 처리 가능합니다.(필터링 후 처리요망)")
		RETURN
	end if
			
	l_status = dw_4.getitemstatus(ll_dw4row, 0, primary!)	

	if l_status <> NotModified! then 					
			dw_4.scrolltorow(ll_dw4row)
			ls_order_no = dw_4.object.order_no[ll_dw4row] 
			ls_cust_no = dw_4.object.cust_no[ll_dw4row]		
			ll_dw2row = dw_2.getrow() 
		
			if dw_4.object.process_flag[ll_dw4row] = "I" then // CHK
			
				for ll_dw3row = 1 to dw_3.rowcount()
					
					ls_chk    = dw_3.object.acc_chk[ll_dw3row]							    /*변경된 값 */
		//			ls_chk2   = dw_3.getitemstring(ll_dw3row,'acc_chk', primary!, true) /*db에서 최초로 가져온 값 */
					ls_chk2   = dw_3.object.ori_acc_chk[ll_dw3row] /*db에서 최초로 가져온 값 */
					if ls_chk = ls_chk2 then continue
					if ls_chk = 'N' then continue
					if isnull(dw_3.object.loc_no[ll_dw3row]) then
						messagebox("확인","저장소를 확인하십시요")
						return
					end if
		
					ll_row = dw_inaudit.insertrow(0)
					// [RS]제품반품입고 로직입니다.					
					dw_inaudit.object.inaudit_time[ll_row] = gf_today()
		//			dw_inaudit.object.inaudit_date[ll_row] = dw_2.object.ret_date[ll_dw2row]
					if ll_tcnt = 1 then
						dw_inaudit.object.inaudit_date[ll_row] = dw_2.object.ret_date[ll_dw2row]
					else
						dw_inaudit.object.inaudit_date[ll_row] = wf_today()				
					end if 
					
					dw_inaudit.object.inaudit_item[ll_row] = dw_3.object.item_no[ll_dw3row]
					dw_inaudit.object.qa[ll_row]                = dw_3.object.qa[ll_dw3row]
					dw_inaudit.object.loc_no[ll_row]         = dw_3.object.loc_no[ll_dw3row]
					dw_inaudit.object.inaudit_type[ll_row] = "RS"
					dw_inaudit.object.order_no[ll_row]     =ls_order_no 
		/*
			2006.01.16
			반품확인시 폐기는 재고에 잡으면 안되자나....(폐기품은 반품하지 않음 )
			무상수량은 재고에는 반영하고 매출정리에서는 비 반영하는 것(B급, 하자품 등)
			무상수량 처리건을 '반품확인 취소' 작업을 하면 재고에 반영 안됨(복원)
			
			<-- 소스변경시작 -->						
		*/	
		//			If string(dw_2.Object.ret_agree[ll_dw2row]) <> '3' Then
					dw_inaudit.object.rcpt_qty[ll_row] = dw_3.object.acc_qty[ll_dw3row] + dw_3.object.free_qty[ll_dw3row]
					dw_inaudit.object.rem[ll_row]      = "반품입고"				
		//			Else
		//				dw_inaudit.object.rcpt_qty[ll_row] = 0
		//				dw_inaudit.object.rem[ll_row] = "반품입고(폐기)"
		//			End If
		/*
			<-- 소스변경끝 -->
		*/			
					dw_inaudit.object.issue_qty[ll_row]   = 0
					dw_inaudit.object.cost[ll_row]        = dw_3.object.price[ll_dw3row]
					dw_inaudit.object.destination[ll_row] = ls_cust_no
		
					dw_inaudit.object.serial_id[ll_row] = "X"
					dw_inaudit.object.unit_qty[ll_row]  = dw_3.object.ret_seq[ll_dw3row]
					dw_inaudit.object.cnt[ll_row]         = dw_3.object.seq_no[ll_dw3row]
					dw_inaudit.object.user_id[ll_row]   = gs_userid
				next
				
			end if	
			
	end if
	
elseif rb_4.checked = true then		// 확인취소
	
	/*dw_4를 돌리면서 문제 발생 2018.08.10 jowonsuk 주석 처리 */		
		l_status = dw_4.getitemstatus(ll_dw4row, 0, primary!)
		
		if l_status <> NotModified! then 
			
			ll_dw4row = dw_4.getrow()
			dw_4.scrolltorow(ll_dw4row)
			ls_order_no = dw_4.object.order_no[ll_dw4row] 
			ls_cust_no = dw_4.object.cust_no[ll_dw4row]					
			ls_process_flag = dw_4.object.process_flag[ll_dw4row]
			
			for ll_dw3row = 1 to dw_3.rowcount()
				
				ls_chk    = dw_3.object.acc_chk[ll_dw3row]
	//			ls_chk2   = dw_3.getitemstring(ll_dw3row,'acc_chk', primary!, true)
				ls_chk2   = dw_3.object.ori_acc_chk[ll_dw3row] /*db에서 최초로 가져온 값 */
				if ls_chk = ls_chk2 then continue
				if ls_chk = 'Y' then continue
	
				ll_row = dw_inaudit.insertrow(0)
				// [IW]작업장출고 로직입니다.
				dw_inaudit.object.inaudit_time[ll_row] = gf_today()
				
				if ll_ycnt = 1 then
					dw_inaudit.object.inaudit_date[ll_row] = dw_2.getitemdatetime(ll_dw2row,'ret_date', primary!, true) 
				else
					dw_inaudit.object.inaudit_date[ll_row] = wf_today()				
				end if 
				
				dw_inaudit.object.inaudit_item[ll_row] = dw_3.object.item_no[ll_dw3row]
				dw_inaudit.object.qa[ll_row]                = dw_3.object.qa[ll_dw3row]
				dw_inaudit.object.loc_no[ll_row]         = dw_3.getitemstring(ll_dw3row,'loc_no', primary!, true)
				dw_inaudit.object.inaudit_type[ll_row] = "RS"
				dw_inaudit.object.order_no[ll_row]     = ls_order_no
	
	/*
		2006.01.16
		반품확인시 폐기는 재고에 잡으면 안되자나....
		<-- 원본소스시작 -->						
				dw_inaudit.object.rcpt_qty[ll_row] = ( dw_3.getitemdecimal(ll_dw3row,'acc_qty', primary!, true) &
																	+ dw_3.getitemdecimal(ll_dw3row,'free_qty', primary!, true) ) * -1
				dw_inaudit.object.rem[ll_row] = "반품입고취소"
		<-- 원본소스끝 -->						
	
		<-- 소스변경시작 -->						
	*/	
	
	//			If string(dw_2.Object.ret_agree[ll_dw2row]) <> '3' Then
				dw_inaudit.object.rcpt_qty[ll_row] = ( dw_3.getitemdecimal(ll_dw3row,'acc_qty', primary!, true) + dw_3.getitemdecimal(ll_dw3row,'free_qty', primary!, true) ) * -1
				dw_inaudit.object.rem[ll_row] = "반품입고취소"
	//			Else
	//				dw_inaudit.object.rcpt_qty[ll_row] = 0
	//				dw_inaudit.object.rem[ll_row] = "반품입고취소(폐기)"
	//			End If
	/*
		<-- 소스변경끝 -->
	*/				
				dw_inaudit.object.issue_qty[ll_row]   = 0
				dw_inaudit.object.cost[ll_row]        = dw_3.object.price[ll_dw3row]
	//			dw_inaudit.object.destination[ll_row] = dw_2.object.cust_no[ll_dw2row]
				dw_inaudit.object.destination[ll_row] = ls_cust_no
	
				dw_inaudit.object.serial_id[ll_row] = 'X'
				dw_inaudit.object.unit_qty[ll_row]  = dw_3.object.ret_seq[ll_dw3row]
				dw_inaudit.object.cnt[ll_row]       = dw_3.object.seq_no[ll_dw3row]
				dw_inaudit.object.user_id[ll_row]   = gs_userid
				
			next

		end if
	
end if

if wf_update3( dw_2, dw_3, dw_inaudit, 'Y') = true then
	pb_retrieve.triggerevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oiretrcpt_m
integer x = 165
integer y = 128
integer width = 105
integer height = 76
integer taborder = 10
string dataobject = "d_oiretreq_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
pb_retrieve.setfocus()

end event

type st_title from w_inheritance`st_title within w_oiretrcpt_m
integer x = 46
integer y = 24
integer width = 1175
integer height = 136
string text = "반품요청 확인관리"
end type

type st_tips from w_inheritance`st_tips within w_oiretrcpt_m
end type

type pb_compute from w_inheritance`pb_compute within w_oiretrcpt_m
boolean visible = false
integer x = 1659
integer taborder = 170
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiretrcpt_m
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 130
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_oiretrcpt_m
integer x = 4187
integer y = 64
integer taborder = 180
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretrcpt_m
integer x = 3803
integer y = 64
integer taborder = 200
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve(is_order_no)

l_print.st_datawindow = dw_1
l_print.st_print_desc = " 이 프로그램은 반품요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiretrcpt_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 220
end type

type pb_delete from w_inheritance`pb_delete within w_oiretrcpt_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 230
end type

type pb_insert from w_inheritance`pb_insert within w_oiretrcpt_m
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 240
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretrcpt_m
integer x = 3611
integer y = 64
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area
date   ld_start_date, ld_end_date

dw_area.accepttext()
ls_area = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

cb_2.triggerevent( clicked! )

if dw_4.retrieve( is_con, ls_area ) < 1 then
	messagebox("확인","내역이 없습니다.")
else
	dw_2.setredraw(false)
	dw_3.setredraw(false)

	dw_2.retrieve(is_con)
	dw_3.retrieve(is_con)

	dw_2.setredraw(true)
	dw_3.setredraw(true)
	dw_4.setfocus()
	
	
	if dw_4.rowcount() < 1 then return	
	
	/*		2018.08.10 jowonsuk 반영 
			dw_4의 첫행의 내용을 기준으로 dw_3을 조회 
	          시작
	*/
	long ll_row
	
	ll_row = 1			
	
	if ll_row < 1 then return
	
	is_order_no = dw_4.object.order_no[ll_row]
	
	dw_2.setfilter("ret_no = '" + is_order_no + "'")
	dw_2.filter()
	dw_3.setfilter("ret_no = '" + is_order_no + "'")
	dw_3.filter()

	/*		2018.08.10 jowonsuk 반영 
			dw_4의 첫행의 내용을 기준으로 dw_3을 조회 
	          끝
	*/	
end if


end event

type gb_3 from w_inheritance`gb_3 within w_oiretrcpt_m
boolean visible = false
integer x = 1472
integer y = 4
integer width = 133
integer height = 148
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiretrcpt_m
integer x = 2130
integer y = 16
integer width = 1431
integer height = 212
integer taborder = 0
integer textsize = -10
long textcolor = 0
string text = "조회(출고/영업)"
end type

type gb_1 from w_inheritance`gb_1 within w_oiretrcpt_m
integer x = 3584
integer y = 16
integer width = 818
integer height = 212
integer taborder = 150
integer textsize = -10
end type

type dw_2 from w_inheritance`dw_2 within w_oiretrcpt_m
integer x = 32
integer y = 316
integer width = 2505
integer height = 896
integer taborder = 100
string dataobject = "d_oiretrcpt_s2"
boolean vscrollbar = false
end type

type dw_4 from datawindow within w_oiretrcpt_m
event ue_1 pbm_custom01
integer x = 2587
integer y = 316
integer width = 2034
integer height = 896
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oiretrcpt_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_1;dw_3.setredraw(false)
this.accepttext()
wf_chk()
if rb_3.checked = true or rb_4.checked = true then wf_sel()
dw_3.setredraw(true)

end event

event rowfocuschanged;	/*		2018.08.10 jowonsuk 반영 
			주석처리 
	*/	

/*
long ll_row

ll_row = this.Getrow()

if ll_row < 1 then return

is_order_no = this.object.order_no[ll_row]

dw_2.setfilter("ret_no = '" + is_order_no + "'")
dw_2.filter()
dw_3.setfilter("ret_no = '" + is_order_no + "'")
dw_3.filter()

*/
end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
else
	is_order_no = this.object.order_no[this.getrow()]
end if
end event

event itemchanged;this.accepttext()
this.postevent('ue_1')

end event

event losefocus;//this.width = 2491 // 2953
end event

event clicked;//
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
is_window = "dw_4"

//dw_3.setsort( "" )
//dw_3.sort()
//
//dw_3.setfilter( "" )
//dw_3.filter()

if dw_4.rowcount() < 1 then return

/*		2018.08.10 jowonsuk 반영 
		dw_4의 첫행의 내용을 기준으로 dw_3을 조회 
			 시작 
*/	
long ll_row

ll_row = this.Getrow()

if ll_row < 1 then return

is_order_no = this.object.order_no[ll_row]

dw_2.setfilter("ret_no = '" + is_order_no + "'")
dw_2.filter()
dw_3.setfilter("ret_no = '" + is_order_no + "'")
dw_3.filter()

/*		2018.08.10 jowonsuk 반영 
		dw_4의 첫행의 내용을 기준으로 dw_3을 조회 
	     끝
*/	
end event

type dw_3 from datawindow within w_oiretrcpt_m
integer x = 32
integer y = 1412
integer width = 4594
integer height = 1104
integer taborder = 120
string dataobject = "d_oiretrcptdet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long   ll_row, ll_cnt
string ls_chk, ls_null
date   ld_date

setnull(ls_null)
setnull(ld_date)
this.accepttext()
dw_4.accepttext()

ll_row = this.getrow()
CHOOSE CASE dwo.name
	CASE 'acc_qty'
//			this.object.free_qty[ll_row] = this.object.ret_qty[ll_row] - this.object.acc_qty[ll_row]
	CASE 'acc_chk'
		if data = "Y" then
			this.object.acc_qty[ll_row]  = this.object.ret_qty[ll_row]
			this.object.loc_no[ll_row]   = dw_6.object.loc_no[dw_6.getrow()]
			this.object.free_qty[ll_row] = 0
//			ls_chk = "Y"
//			for ll_cnt = 1 to this.rowcount()
//				if ll_cnt = ll_row then continue
//				if isnull(this.object.acc_chk[ll_cnt]) then 
//					ls_chk = "N"
//					exit
//				end if 
//				if this.object.acc_chk[ll_cnt] = "N" then
//					ls_chk = "N"
//					exit
//				end if
//			next
			if dw_4.object.process_flag[dw_4.getrow()] <> "I" then
				dw_4.object.process_flag[dw_4.getrow()] = "I"
				dw_2.object.ret_date[dw_2.getrow()]     = wf_today()
				wf_chk()
			end if
		else
			this.object.acc_qty[ll_row]  = 0
			this.object.free_qty[ll_row] = 0
			this.object.loc_no[ll_row] = ls_null
			ls_chk = "Y"
			for ll_cnt = 1 to this.rowcount()
				if ll_cnt = ll_row then continue
				if this.object.acc_chk[ll_cnt] = "Y" then
					ls_chk = "N"
					exit
				end if
			next
			if ls_chk = 'Y' then
				dw_4.object.process_flag[dw_4.getrow()] = "Y"
			end if
			wf_chk()
//			dw_2.object.ret_date[dw_2.getrow()] = ld_date
		end if
END CHOOSE

this.accepttext()

end event

event losefocus;this.accepttext()
end event

event clicked;//
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//is_window = "dw_3"

end event

type dw_inaudit from datawindow within w_oiretrcpt_m
integer x = 55
integer y = 128
integer width = 105
integer height = 76
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oiinaudit"
boolean livescroll = true
end type

type dw_6 from datawindow within w_oiretrcpt_m
integer x = 2583
integer y = 1280
integer width = 1074
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_iopur_loc_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_loc
long ll_rowcount, ll_cnt

this.accepttext()
dw_3.accepttext()

if dw_3.rowcount() < 1 then return

ls_loc = trim(this.object.loc_no[this.getrow()])
ll_rowcount = dw_3.rowcount()
for ll_cnt = 1 to ll_rowcount
    if trim(dw_3.object.acc_chk[ll_cnt]) = 'Y' then
		  dw_3.object.loc_no[ll_cnt] = ls_loc
    end if
next

end event

type rb_3 from radiobutton within w_oiretrcpt_m
integer x = 2194
integer y = 104
integer width = 325
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "반품확인"
boolean checked = true
end type

event clicked;//
dw_2.reset()
dw_3.reset()
dw_4.reset()

is_con = "Y"
dw_4.object.tt.text = "확인"

rb_3.textcolor = rgb(0,0,255)
rb_4.textcolor = rgb(0,0,0)
rb_1.textcolor = rgb(0,0,0)
rb_2.textcolor = rgb(0,0,0)

dw_3.object.acc_chk.tabsequence = 10
dw_3.object.acc_qty.tabsequence = 20
dw_3.object.loc_no.tabsequence  = 30
// 사용안함
dw_3.object.free_qty.tabsequence = 0

end event

type rb_4 from radiobutton within w_oiretrcpt_m
integer x = 2555
integer y = 104
integer width = 352
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
string text = "확인취소"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()

is_con = "I"
dw_4.object.tt.text = "취소"

rb_3.textcolor = rgb(0,0,0)
rb_4.textcolor = rgb(0,0,255)
rb_1.textcolor = rgb(0,0,0)
rb_2.textcolor = rgb(0,0,0)

dw_3.object.acc_chk.tabsequence  = 0
dw_3.object.acc_qty.tabsequence  = 0
dw_3.object.loc_no.tabsequence   = 0
dw_3.object.free_qty.tabsequence = 0

end event

type rb_1 from radiobutton within w_oiretrcpt_m
integer x = 2921
integer y = 104
integer width = 224
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
string text = "마감"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()

is_con = "Y"
dw_4.object.tt.text = "마감"

rb_3.textcolor = rgb(0,0,0)
rb_4.textcolor = rgb(0,0,0)
rb_1.textcolor = rgb(255,0,0)
rb_2.textcolor = rgb(0,0,0)

dw_3.object.acc_chk.tabsequence = 0
dw_3.object.acc_qty.tabsequence = 0
dw_3.object.loc_no.tabsequence  = 0
dw_3.object.free_qty.tabsequence = 0

end event

type rb_2 from radiobutton within w_oiretrcpt_m
integer x = 3163
integer y = 104
integer width = 325
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
string text = "마감취소"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()

is_con = "C"
dw_4.object.tt.text = "취소"

rb_3.textcolor = rgb(0,0,0)
rb_4.textcolor = rgb(0,0,0)
rb_1.textcolor = rgb(0,0,0)
rb_2.textcolor = rgb(255,0,0)

dw_3.object.acc_chk.tabsequence = 0
dw_3.object.acc_qty.tabsequence = 0
dw_3.object.loc_no.tabsequence  = 0
dw_3.object.free_qty.tabsequence = 0

end event

type st_7 from statictext within w_oiretrcpt_m
integer x = 1289
integer y = 112
integer width = 233
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
string text = "사업장"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiretrcpt_m
integer x = 1522
integer y = 96
integer width = 549
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_oiretrcpt_m
integer x = 32
integer y = 252
integer width = 2217
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "무상수량은 재고에는 반영하고 매출정리에서는 반영하지 않음(B급, 하자품 등)"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oiretrcpt_m
integer x = 2267
integer y = 252
integer width = 1915
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "무상수량 처리건을 ~'반품확인 취소~' 작업시 재고에 반영 안됨(복원)"
boolean focusrectangle = false
end type

type st_3 from statictext within w_oiretrcpt_m
integer x = 87
integer y = 1292
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

type ddlb_fld from dropdownlistbox within w_oiretrcpt_m
integer x = 274
integer y = 1276
integer width = 443
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
end type

type ddlb_dwtitles from dropdownlistbox within w_oiretrcpt_m
integer x = 306
integer y = 1288
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

type st_4 from statictext within w_oiretrcpt_m
integer x = 745
integer y = 1292
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

type sle_value from singlelineedit within w_oiretrcpt_m
integer x = 1234
integer y = 1284
integer width = 567
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

type cb_1 from commandbutton within w_oiretrcpt_m
integer x = 1810
integer y = 1284
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiretrcpt_m
integer x = 1975
integer y = 1284
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	RETURN
	//arg_dw  = dw_3
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiretrcpt_m
integer x = 2139
integer y = 1284
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_oiretrcpt_m
integer x = 2304
integer y = 1284
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_oiretrcpt_m
integer x = 2555
integer y = 316
integer height = 896
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_oiretrcpt_m
integer x = 919
integer y = 1276
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

type gb_4 from groupbox within w_oiretrcpt_m
integer x = 1275
integer y = 16
integer width = 818
integer height = 212
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

type gb_5 from groupbox within w_oiretrcpt_m
integer x = 32
integer y = 1212
integer width = 4594
integer height = 184
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

