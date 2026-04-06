$PBExportHeader$w_oiretreq_m.srw
$PBExportComments$반품요청관리(2000/04/27,이인호)
forward
global type w_oiretreq_m from w_inheritance
end type
type dw_4 from datawindow within w_oiretreq_m
end type
type em_1 from editmask within w_oiretreq_m
end type
type em_2 from editmask within w_oiretreq_m
end type
type dw_5 from datawindow within w_oiretreq_m
end type
type cbx_1 from checkbox within w_oiretreq_m
end type
type rb_1 from radiobutton within w_oiretreq_m
end type
type rb_2 from radiobutton within w_oiretreq_m
end type
type pb_2 from picturebutton within w_oiretreq_m
end type
type rb_3 from radiobutton within w_oiretreq_m
end type
type rb_4 from radiobutton within w_oiretreq_m
end type
type dw_7 from datawindow within w_oiretreq_m
end type
type dw_3 from datawindow within w_oiretreq_m
end type
type rb_5 from radiobutton within w_oiretreq_m
end type
type dw_6 from datawindow within w_oiretreq_m
end type
type dw_8 from datawindow within w_oiretreq_m
end type
type st_7 from statictext within w_oiretreq_m
end type
type dw_area from datawindow within w_oiretreq_m
end type
type st_3 from statictext within w_oiretreq_m
end type
type ddlb_fld from dropdownlistbox within w_oiretreq_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oiretreq_m
end type
type st_2 from statictext within w_oiretreq_m
end type
type sle_value from singlelineedit within w_oiretreq_m
end type
type cb_1 from commandbutton within w_oiretreq_m
end type
type cb_2 from commandbutton within w_oiretreq_m
end type
type cb_3 from commandbutton within w_oiretreq_m
end type
type cb_4 from commandbutton within w_oiretreq_m
end type
type st_vertical from u_splitbar_vertical within w_oiretreq_m
end type
type st_horizontal from u_splitbar_horizontal within w_oiretreq_m
end type
type st_1 from statictext within w_oiretreq_m
end type
type st_4 from statictext within w_oiretreq_m
end type
type ddlb_op from dropdownlistbox within w_oiretreq_m
end type
type cb_continue from commandbutton within w_oiretreq_m
end type
type dw_31 from datawindow within w_oiretreq_m
end type
type gb_4 from groupbox within w_oiretreq_m
end type
type gb_5 from groupbox within w_oiretreq_m
end type
end forward

global type w_oiretreq_m from w_inheritance
integer width = 4923
integer height = 2588
string title = "반품요청 관리(w_oiretreq_m)"
dw_4 dw_4
em_1 em_1
em_2 em_2
dw_5 dw_5
cbx_1 cbx_1
rb_1 rb_1
rb_2 rb_2
pb_2 pb_2
rb_3 rb_3
rb_4 rb_4
dw_7 dw_7
dw_3 dw_3
rb_5 rb_5
dw_6 dw_6
dw_8 dw_8
st_7 st_7
dw_area dw_area
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
st_vertical st_vertical
st_horizontal st_horizontal
st_1 st_1
st_4 st_4
ddlb_op ddlb_op
cb_continue cb_continue
dw_31 dw_31
gb_4 gb_4
gb_5 gb_5
end type
global w_oiretreq_m w_oiretreq_m

type variables
st_print i_print
datawindowchild idwc_area, idwc_cust

string is_order_no, is_scenesql, is_window
string is_mode = "I", is_ins = "S"

//
boolean  ib_continue = false
string   is_yesno
string   is_rcpt_area, is_create_login, is_ret_reason1, is_ret_reason2, is_ret_reason3, is_sale_flag
string   is_ship_case, is_ship_flag, is_ret_agree, is_agree_desc, is_custname, is_scenedesc, is_saleno
datetime idt_preret_date, idt_ret_date


end variables

on w_oiretreq_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.dw_5=create dw_5
this.cbx_1=create cbx_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.pb_2=create pb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_7=create dw_7
this.dw_3=create dw_3
this.rb_5=create rb_5
this.dw_6=create dw_6
this.dw_8=create dw_8
this.st_7=create st_7
this.dw_area=create dw_area
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.cb_continue=create cb_continue
this.dw_31=create dw_31
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.rb_4
this.Control[iCurrent+11]=this.dw_7
this.Control[iCurrent+12]=this.dw_3
this.Control[iCurrent+13]=this.rb_5
this.Control[iCurrent+14]=this.dw_6
this.Control[iCurrent+15]=this.dw_8
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.dw_area
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.ddlb_fld
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.st_2
this.Control[iCurrent+22]=this.sle_value
this.Control[iCurrent+23]=this.cb_1
this.Control[iCurrent+24]=this.cb_2
this.Control[iCurrent+25]=this.cb_3
this.Control[iCurrent+26]=this.cb_4
this.Control[iCurrent+27]=this.st_vertical
this.Control[iCurrent+28]=this.st_horizontal
this.Control[iCurrent+29]=this.st_1
this.Control[iCurrent+30]=this.st_4
this.Control[iCurrent+31]=this.ddlb_op
this.Control[iCurrent+32]=this.cb_continue
this.Control[iCurrent+33]=this.dw_31
this.Control[iCurrent+34]=this.gb_4
this.Control[iCurrent+35]=this.gb_5
end on

on w_oiretreq_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_5)
destroy(this.cbx_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.pb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_7)
destroy(this.dw_3)
destroy(this.rb_5)
destroy(this.dw_6)
destroy(this.dw_8)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.cb_continue)
destroy(this.dw_31)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_2 )
st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_2 )
st_horizontal.of_set_topobject( dw_4 )
st_horizontal.of_set_bottomobject( dw_3 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

Integer li_day

dw_2.SetTransObject(SQLCA)
dw_1.insertrow(0)  //춘 19
dw_1.getchild("cust_no", idwc_cust)
//gs_ds_whcustret.sharedata(idwc_cust)
idwc_cust.SetTransObject(sqlca)
idwc_cust.Retrieve()

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_7.settransobject(sqlca)

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

dw_area.object.area[1] = "%" //gs_area	// 기본값을 변경	
dw_area.accepttext()
//dw_area.enabled = false

dw_5.visible  = false
dw_6.visible  = false
dw_7.visible  = false
dw_31.visible = false
dw_8.visible  = false
cb_continue.enabled = false

dw_1.insertrow(0)

li_day    = Day(today()) - 1
em_1.text = string(RelativeDate(today(), - li_day), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

rb_2.postevent(clicked!)

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.width  = newwidth  - dw_4.x - gb_2.x

st_horizontal.y     = dw_2.y + dw_2.height
st_horizontal.width = newwidth  - (gb_2.x * 2)

dw_3.width  = newwidth  - (dw_3.x * 2)
dw_3.height = newheight - dw_3.y - dw_3.x

end event

type pb_save from w_inheritance`pb_save within w_oiretreq_m
event ue_print pbm_custom01
integer x = 4224
integer y = 80
integer taborder = 110
end type

event pb_save::clicked;//
string  ls_area, ls_saleflag, ls_preret_date, ls_seq, ls_ret_no1, ls_ret_no
long    ll_row, ll_dw3row, ll_dw31row, ll_dw7row
int     li_seq
decimal ld_retqty, ld_t_retqty, ld_rlseqty, ld_orderqty

setnull(ls_ret_no)

if dw_2.rowcount() < 1 then RETURN

dw_2.accepttext()
dw_3.accepttext()

if ib_continue = false then
	if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
end if

setpointer(hourglass!)

choose case is_mode
	case "R"		// 조회
		if dw_2.rowcount() < 1 then
			dw_2.deleterow(1)
		else
			ls_ret_no1 = dw_2.object.ret_no[1]

			if ls_ret_no1 <> dw_2.getitemstring(1, "ret_no", Primary!, TRUE) then
				for ll_row = 1 to dw_3.rowcount()
					dw_7.object.ret_no[ll_row] = ls_ret_no1
				next
			end if
		end if
		WF_Update2(dw_2, dw_3, "Y")

   case "I"		// 추가, 잔량추가
		for ll_row = 1 to dw_3.rowcount()
			if dw_3.object.chk[ll_row] <> "Y" then CONTINUE
	
			// 잔량추가
			if rb_5.checked = true then
				if dw_3.object.acc_qty[ll_row] + dw_3.object.ret_range[ll_row] + dw_3.object.apply_qty[ll_row] &
						> dw_3.object.agree_ret[ll_row] then
						
					MessageBox("오류", string(ll_row) + " 번째 반납할 수량이 반품결재 수량 보다 큽니다")
					dw_3.scrolltorow(ll_row)
					dw_3.setcolumn('ret_range')
					dw_3.setfocus()
					RETURN
				end if
			else
      		     ld_retqty    = dw_3.object.ret_qty[ll_row]				// 반품수량
				ld_t_retqty  = dw_3.object.t_ret_qty[ll_row]				// 기반품수량
				ld_rlseqty   = dw_3.object.saledet_rlse_qty[ll_row]	// 출고수량
				ld_orderqty  = dw_3.object.saledet_order_qty[ll_row]	// 주문수량
				
				/*임시 마감*/
				if ld_retqty + ld_t_retqty > ld_orderqty then
					MessageBox("오류", string(ll_row) + " 번째 반납할 수량("+string(ld_retqty + ld_t_retqty,"#,##0.00")+&
					           ")이 > 출고수량("+string(ld_orderqty,"#,##0.00")+") 보다 큽니다")
					dw_3.scrolltorow(ll_row)
					dw_3.setcolumn('ret_qty')
					dw_3.setfocus()
					RETURN
				end if
			end if
		next
		
		// 출고번호 부여
		ls_area      = LeftA(dw_2.object.rcpt_area[1], 1)
		ls_saleflag = "F"
		
		if trim(dw_2.object.ret_no[1]) = "" OR isnull(dw_2.object.ret_no[1]) then
			ls_preret_date = string(dw_2.object.preret_date[1], "yyyymmdd")
			ls_ret_no1     = ls_area + ls_saleflag + ls_preret_date + '-' + '%'			
			
			SELECT max(ret_no) INTO :ls_ret_no
			  FROM ret 
			 WHERE ret_no LIKE :ls_ret_no1;		
			if isnull(ls_ret_no) OR ls_ret_no = "" then
				ls_ret_no1 = ls_area + ls_saleflag + ls_preret_date + '-' + '001'
			else
				li_seq   = integer(MidA(ls_ret_no, 12, 3))
				li_seq   = li_seq + 1
				ls_seq   = '00' + string(li_seq)
				ls_ret_no1 = LeftA(ls_ret_no1, 11) + RightA(ls_seq, 3)
			end if
		else
			ls_ret_no1  = dw_2.object.ret_no[1]

			SELECT ret_no INTO :ls_ret_no
			  FROM ret
			 WHERE ret_no = :ls_ret_no;
			if trim(ls_ret_no) = "" OR isnull(ls_ret_no) then
			else
				MessageBox("저장", "반품번호가 이미 존재합니다.", exclamation!)
				RETURN
			end if
		end if
		
		dw_2.object.ret_no[1] = ls_ret_no1

		//
		dw_7.reset()
		ll_dw7row = 0
		
		for ll_row = 1 to dw_3.rowcount()
			if dw_3.object.chk[ll_row] <> "Y" then CONTINUE
			
			ll_dw7row = dw_7.insertrow(0)
			
			dw_7.object.ret_no[ll_dw7row]  = ls_ret_no1
			dw_7.object.ret_seq[ll_dw7row] = ll_dw7row
			dw_7.object.sale_no[ll_dw7row] = dw_3.object.sale_no[ll_row]
			dw_7.object.seq_no[ll_dw7row]  = dw_3.object.seq_no[ll_row]
			dw_7.object.item_no[ll_dw7row] = dw_3.object.item_no[ll_row]
			dw_7.object.color[ll_dw7row]   = dw_3.object.color[ll_row]
			dw_7.object.qa[ll_dw7row]      = dw_3.object.qa[ll_row]
			dw_7.object.uom[ll_dw7row]     = dw_3.object.uom[ll_row]
			
			// 잔량추가
			if rb_5.checked = true then
				dw_7.object.ret_qty[ll_dw7row] = dw_3.object.ret_range[ll_row]
			else
				dw_7.object.ret_qty[ll_dw7row] = dw_3.object.ret_qty[ll_row]
			end if
			dw_7.object.acc_qty[ll_dw7row]       = 0
			dw_7.object.acc_degree[ll_dw7row]    = dw_3.object.acc_degree[ll_row]
			dw_7.object.decision_desc[ll_dw7row] = dw_3.object.decision_desc[ll_row]
			dw_7.object.rem[ll_dw7row]           = dw_3.object.rem[ll_row] 
		next
		
		if ll_dw7row < 1 then 
			MessageBox("오류","반품할 물품을 선택하십시요")
			RETURN
		end if
		
		// 질의
		if ib_continue = false then
			is_yesno = "Y"
		else
			is_yesno = "N"
		end if
		
		if WF_Update2(dw_2, dw_7, is_yesno) = true then
			if dw_4.object.tchk[1] > 1 then
				if ib_continue = false then
					ib_continue = true
					cb_continue.enabled = true
					
					// 반복저장
					is_rcpt_area     = dw_2.object.rcpt_area[1]				// 입고처
					is_create_login  = dw_2.object.create_login[1]			// 작성자
					idt_preret_date  = dw_2.object.preret_date[1]			// 반품예정일
					is_sale_flag     = dw_2.object.sale_flag[1]				// 반납유형
					idt_ret_date     = dw_2.object.ret_date[1]				// 반품입고일
		
					is_ret_reason1   = dw_2.object.ret_reason1[1]			// 반품사유1
					is_ret_reason2   = dw_2.object.ret_reason2[1]			// 반품사유2
					is_ret_reason3   = dw_2.object.ret_reason3[1]			// 반품사유3
		
					is_ship_case     = dw_2.object.ship_case[1]				// 운반수단
					is_ship_flag     = dw_2.object.ship_flag[1]				// 운반비
					is_ret_agree     = dw_2.object.ret_agree[1]				// 활용의견
					is_agree_desc    = dw_2.object.agree_desc[1]				// 기타의견
					
					is_custname      = dw_2.object.customer_cust_name[1]	// 업체명
					is_scenedesc     = dw_2.object.scene_scene_desc[1]		// 현장명
					is_saleno        = dw_2.object.sale_no[1]					// 수주번호				
					
					//
					dw_31.reset()
					
					for ll_row = 1 to dw_3.rowcount()
						if dw_3.object.chk[ll_row] <> "Y" then CONTINUE

						ll_dw31row = dw_31.insertrow(0)
		
						dw_31.object.sale_no[ll_dw31row] = dw_3.object.sale_no[ll_row]
						dw_31.object.seq_no[ll_dw31row]  = dw_3.object.seq_no[ll_row]
						dw_31.object.item_no[ll_dw31row] = dw_3.object.item_no[ll_row]
						dw_31.object.qa[ll_dw31row]      = dw_3.object.qa[ll_row]
						dw_31.object.uom[ll_dw31row]     = dw_3.object.uom[ll_row]
						dw_31.object.color[ll_dw31row]   = dw_3.object.color[ll_row]
						
						// 잔량추가
						if rb_5.checked = true then
							dw_31.object.ret_qty[ll_dw31row] = dw_3.object.ret_range[ll_row]
						else
							dw_31.object.ret_qty[ll_dw31row] = dw_3.object.ret_qty[ll_row]
						end if
						dw_31.object.acc_qty[ll_dw31row]       = 0
						dw_31.object.acc_degree[ll_dw31row]    = dw_3.object.acc_degree[ll_row]
						dw_31.object.decision_desc[ll_dw31row] = dw_3.object.decision_desc[ll_row]
						dw_31.object.rem[ll_dw31row]           = dw_3.object.rem[ll_row] 
					next
				end if				
			end if

			// 반복저장
			if ib_continue = true then
				dw_2.reset() ; dw_3.reset() 
			else
				dw_2.reset() ; dw_3.reset() ; dw_4.reset()
			end if
		end if
end choose


end event

type dw_1 from w_inheritance`dw_1 within w_oiretreq_m
integer x = 1307
integer y = 136
integer width = 919
integer height = 92
integer taborder = 30
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
pb_retrieve.setfocus()

end event

type st_title from w_inheritance`st_title within w_oiretreq_m
integer x = 0
integer y = 0
integer width = 983
integer height = 140
string text = "반품요청 관리"
end type

type st_tips from w_inheritance`st_tips within w_oiretreq_m
end type

type pb_compute from w_inheritance`pb_compute within w_oiretreq_m
boolean visible = false
integer x = 1659
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiretreq_m
boolean visible = false
integer x = 1947
integer y = 40
integer height = 152
integer taborder = 90
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_oiretreq_m
integer x = 4608
integer y = 80
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretreq_m
integer x = 4416
integer y = 80
integer taborder = 150
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_4.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_5.retrieve(is_order_no)

l_print.st_datawindow = dw_5
l_print.st_print_desc = " 이 프로그램은 반품요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiretreq_m
integer x = 3648
integer y = 80
integer taborder = 160
end type

event pb_cancel::clicked;if MessageBox("취소", "작업내역을 취소 하시겠습니까", Exclamation!, OKCancel!, 2) = 1 then
	dw_2.reset()
	dw_3.reset()
	pb_retrieve.triggerevent(clicked!)
end if

end event

type pb_delete from w_inheritance`pb_delete within w_oiretreq_m
integer x = 4032
integer y = 80
integer taborder = 170
end type

event pb_delete::clicked;//
long ll_row

if dw_2.rowcount() < 1 then RETURN

dw_2.accepttext() ; dw_3.accepttext()

if MessageBox("삭제","삭제 하시겠습니까?",question!,okcancel!,2) = 1 then
	dw_2.deleterow(0)

	for ll_row = dw_3.rowcount() to 1 step -1
		dw_3.deleterow(ll_row)
	next

	WF_Update2( dw_2, dw_3, "Y" )
	
	pb_retrieve.triggerevent(clicked!)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_oiretreq_m
integer x = 3840
integer y = 80
integer taborder = 180
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long ll_row, ll_dw4row

ll_dw4row = dw_4.getrow()
if ll_dw4row < 1 then
	messagebox("확인","수주또는 출고내역을 조회/선택후에 추가하십시요")
	return
end if

dw_2.enabled = true
dw_2.reset()

ll_row = dw_2.insertrow(0)
dw_2.object.preret_date[1] = wf_today()

//CHOOSE CASE is_ins
//	CASE "S" //수주내역
dw_2.object.preret_date[1] = wf_today()
dw_2.object.rcpt_area[1]   = gs_area
dw_2.object.cust_no[1]     = dw_4.object.cust_no[ll_dw4row]
dw_2.object.spot_code[1]   = dw_4.object.scene_code[ll_dw4row]
dw_2.object.customer_cust_name[1] = dw_4.object.customer_cust_name[ll_dw4row]
dw_2.object.scene_scene_desc[1]   = dw_4.object.scene_scene_desc[ll_dw4row]
dw_2.object.preret_date[1]        = wf_today()
dw_2.object.sale_no[1]            = dw_4.object.order_no[ll_dw4row]
dw_2.object.create_login[1]       = gs_userid

// process_flag = 'O':작성, 'Y':결재, 'I':입고완료, 'S':매출처리완료,  'C':마감 , 'D':매출에누리
dw_2.object.process_flag[1] = "O"
dw_2.object.sale_flag[1]    = dw_4.object.sale_flag[ll_dw4row]

if rb_5.checked = true then
	dw_2.object.agree_desc[1] = dw_4.object.ret_no[ll_dw4row] + "[잔량추가]"
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretreq_m
integer x = 3456
integer y = 80
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_custno
date   ld_sdate, ld_edate
 
string ls_area

//
dw_area.accepttext()
ls_area = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

dw_4.reset()
dw_1.accepttext()

if cbx_1.checked = true then	// 전체
	ls_custno = "%"
else
	ls_custno = trim(dw_1.object.cust_no[1])
end if

if ls_custno = '' or isnull(ls_custno) then
	dw_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

choose case is_mode
	case "R"	// 조회
		if dw_4.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, "O" ) < 1 then
			dw_1.setfocus()
		else
			dw_4.setfocus()
		end if
		
	case "I"	// 추가
		if dw_4.retrieve( ls_area, ls_custno, ld_sdate, ld_edate ) < 1 then
			dw_1.setfocus()
		else
			dw_4.setfocus()
		end if
end choose 

dw_2.insertrow(0)
dw_2.enabled = false

end event

type gb_3 from w_inheritance`gb_3 within w_oiretreq_m
integer x = 2953
integer y = 16
integer width = 448
integer height = 240
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiretreq_m
integer y = 260
integer width = 4814
integer height = 180
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oiretreq_m
integer x = 3419
integer y = 16
integer width = 1426
integer height = 240
integer taborder = 120
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiretreq_m
integer x = 32
integer y = 456
integer width = 2345
integer height = 904
integer taborder = 60
string dataobject = "d_oiretreq_m"
boolean vscrollbar = false
end type

event dw_2::itemchanged;
this.accepttext()

choose case dwo.name
	case 'ret_date'
		if not isdate(data) then
			RETURN 1
		end if
	case 'ret_agree'
		if data <> "4" then
			if rb_5.checked = true then
				dw_2.object.agree_desc[1] = dw_4.object.ret_no[dw_4.getrow()] + "[잔량추가]"
			else
				this.object.agree_desc[row] = ''
			end if
		else
			if rb_5.checked = true then
				dw_2.object.agree_desc[1] = dw_4.object.ret_no[dw_4.getrow()] + "[잔량추가]"
				MessageBox("확인", "잔량추가 작업시에는 사용할 수 없습니다.")
				RETURN 1
			end if
		end if
end choose
end event

event dw_2::itemerror;date ld_null

setnull(ld_null)
this.object.ret_date[row] = ld_null
RETURN 2
end event

type dw_4 from datawindow within w_oiretreq_m
string tag = "d_oiretreq_s2"
integer x = 2423
integer y = 456
integer width = 2423
integer height = 904
integer taborder = 50
boolean bringtotop = true
string title = "d_oiretreq_s1"
string dataobject = "d_oiretreq_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string ls_cust_no, ls_scene_code, ls_sale_no, ls_ret_no
long   ll_row, ll_row2

ll_row2 = this.Getrow()
if ll_row2 < 1 then return

is_order_no = this.object.order_no[ll_row2]

if is_mode = "R" then
	dw_2.retrieve(is_order_no)
   dw_2.enabled = true
end if

// 품목조회
if rb_5.checked = true then
	ls_ret_no   = this.object.ret_no[ll_row2]
	ls_sale_no  = this.object.order_no[ll_row2]
	dw_3.retrieve(ls_ret_no, ls_sale_no)
else
	dw_3.retrieve(is_order_no)
end if

end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
end if
end event

event rowfocuschanging;//
if is_mode = "I" and dw_2.rowcount() > 0 and dw_2.modifiedcount() > 0 then
	if MessageBox("취소", "작업내역을 취소 하시겠습니까", Exclamation!, OKCancel!, 2) = 2 then
		return 1
	end if
	dw_2.reset()
	dw_3.reset()
end if

end event

event clicked;//
is_window  = this.classname()
if dw_4.rowcount() < 1 then RETURN
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type em_1 from editmask within w_oiretreq_m
integer x = 2487
integer y = 52
integer width = 407
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
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

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
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

////
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_oiretreq_m
integer x = 2487
integer y = 136
integer width = 407
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
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

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
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

////
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_5 from datawindow within w_oiretreq_m
integer x = 50
integer y = 172
integer width = 128
integer height = 88
boolean bringtotop = true
string title = "d_oiretreq_r"
string dataobject = "d_oiretreq_r2"
boolean livescroll = true
end type

type cbx_1 from checkbox within w_oiretreq_m
integer x = 1856
integer y = 76
integer width = 361
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "전체거래처"
end type

event clicked;// 전체거래처
if this.checked = true then
	dw_1.object.cust_no.background.color = 78682240
else
	dw_1.object.cust_no.background.color = 1087434968
end if

dw_1.enabled = NOT (this.checked)
end event

type rb_1 from radiobutton within w_oiretreq_m
integer x = 2990
integer y = 52
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "조회"
end type

event clicked;// 조회
if this.checked = true then
	this.textcolor = rgb(0,0,255)
	rb_2.textcolor = rgb(0,0,0)
	rb_5.textcolor = rgb(0,0,0)

	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
	
	dw_4.dataobject = 'd_oiretreq_s1'
	dw_3.dataobject = 'd_oiretreqdet_m1'
	dw_4.settransobject(sqlca)
	dw_3.settransobject(sqlca)

	is_mode = "R"
	rb_3.enabled = false
	rb_4.enabled = false
	
	pb_insert.enabled = false
	pb_delete.enabled = true
	pb_print.enabled  = true
	pb_2.enabled      = true
end if

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )


end event

type rb_2 from radiobutton within w_oiretreq_m
integer x = 2990
integer y = 116
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "추가"
boolean checked = true
end type

event clicked;// 추가
if this.checked = true then
	this.textcolor = rgb(0,0,255)
	rb_1.textcolor = rgb(0,0,0)
	rb_5.textcolor = rgb(0,0,0)
	
	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
	
	dw_4.dataobject = 'd_oiretreq_s2'
	dw_3.dataobject = 'd_oiretreqdet_m2'
	dw_4.settransobject(sqlca)
	dw_3.settransobject(sqlca)

	is_mode = "I"
	rb_3.enabled = true
	rb_4.enabled = true
	
	pb_insert.enabled = true	
	pb_delete.enabled = false
	pb_print.enabled  = false
	pb_2.enabled      = false
end if

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )

end event

type pb_2 from picturebutton within w_oiretreq_m
event mousemove pbm_mousemove
integer x = 4256
integer y = 312
integer width = 146
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)
end event

event clicked;//
if dw_3.rowcount() < 1 then RETURN

dw_3.deleterow( dw_3.getrow() )

end event

type rb_3 from radiobutton within w_oiretreq_m
boolean visible = false
integer x = 27
integer y = 500
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수주내역"
boolean checked = true
end type

event clicked;dw_4.dataobject = 'd_oiretreq_s2'
dw_4.settransobject(sqlca)
dw_3.settransobject(sqlca)
is_ins = "S"
end event

type rb_4 from radiobutton within w_oiretreq_m
boolean visible = false
integer x = 384
integer y = 500
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고내역"
end type

event clicked;dw_4.dataobject = 'd_oiretreq_s3'
dw_4.settransobject(sqlca)
dw_3.settransobject(sqlca)
is_ins = "D"

end event

type dw_7 from datawindow within w_oiretreq_m
integer x = 192
integer y = 172
integer width = 128
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oiretreqdet_m1"
end type

type dw_3 from datawindow within w_oiretreq_m
string tag = "d_oiretreqdet_m1"
integer x = 32
integer y = 1392
integer width = 4814
integer height = 1056
integer taborder = 70
string title = "d_oiretreqdet_m2"
string dataobject = "d_oiretreqdet_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//ret_qty, saledet_rlse_qty
dec ld_ret, ld_rlse
 
this.accepttext()
if rb_5.checked = true then	// 잔량추가 
	choose case dwo.name
		case 'ret_range'
			if dw_3.object.acc_qty[row] + dw_3.object.ret_range[row] + dw_3.object.apply_qty[row] &
					> dw_3.object.agree_ret[row] then
				
				if messagebox("확인","출고수량보다 반품수량이 많습니다 계속 진행 하시겠습니까?", &
					Exclamation!, OKCancel!, 2) = 2 then
					 return 1
				end if
			end if
	end choose
else
	ld_ret  = this.object.ret_qty[row]
	ld_rlse = this.object.saledet_rlse_qty[row]
	choose case dwo.name
		case 'ret_qty'
			if ld_ret > ld_rlse then
				if messagebox("확인","출고수량보다 반품수량이 많습니다 계속 진행 하시겠습니까?", &
					Exclamation!, OKCancel!, 2) = 2 then
					 return 1
				end if
			end if
	end choose
end if
end event

event itemerror;
this.object.ret_qty[row] = this.getitemdecimal(row,"ret_qty", Primary!, true)
RETURN 2
end event

event losefocus;this.accepttext()
end event

event clicked;//
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_window = "dw_3"

end event

type rb_5 from radiobutton within w_oiretreq_m
integer x = 2990
integer y = 180
integer width = 379
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "잔량추가"
end type

event clicked;// 잔량추가
if this.checked = true then
	this.textcolor = rgb(255,0,0)
	rb_1.textcolor = rgb(0,0,0)
	rb_2.textcolor = rgb(0,0,0)

	dw_2.reset()
	dw_3.reset()
	dw_4.reset()

	dw_4.dataobject = 'd_oiretreq_s2_mod'
	dw_3.dataobject = 'd_oiretreqdet_m2_mod'
	dw_4.settransobject(sqlca)
	dw_3.settransobject(sqlca)
	
	is_mode = "I"
	rb_3.enabled = true
	rb_4.enabled = true

	pb_insert.enabled = true	
	pb_delete.enabled = false
	pb_print.enabled  = false
	pb_2.enabled      = false
end if

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )

end event

type dw_6 from datawindow within w_oiretreq_m
integer x = 462
integer y = 172
integer width = 128
integer height = 88
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiretreq_s1"
boolean livescroll = true
end type

type dw_8 from datawindow within w_oiretreq_m
integer x = 603
integer y = 172
integer width = 128
integer height = 88
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiretreq_s2_mod"
boolean livescroll = true
end type

type st_7 from statictext within w_oiretreq_m
integer x = 1061
integer y = 60
integer width = 247
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
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiretreq_m
integer x = 1312
integer y = 60
integer width = 535
integer height = 80
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type st_3 from statictext within w_oiretreq_m
integer x = 73
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_oiretreq_m
integer x = 261
integer y = 324
integer width = 443
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_oiretreq_m
integer x = 293
integer y = 332
integer width = 311
integer height = 88
integer taborder = 100
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

type st_2 from statictext within w_oiretreq_m
integer x = 731
integer y = 336
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

type sle_value from singlelineedit within w_oiretreq_m
integer x = 1221
integer y = 328
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiretreq_m
integer x = 1797
integer y = 328
integer width = 160
integer height = 76
integer taborder = 80
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

type cb_2 from commandbutton within w_oiretreq_m
integer x = 1961
integer y = 328
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiretreq_m
integer x = 2126
integer y = 328
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

type cb_4 from commandbutton within w_oiretreq_m
integer x = 2290
integer y = 328
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

type st_vertical from u_splitbar_vertical within w_oiretreq_m
integer x = 2386
integer y = 456
integer height = 904
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oiretreq_m
integer x = 32
integer y = 1364
integer width = 4814
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_2.height

end event

type st_1 from statictext within w_oiretreq_m
integer x = 1061
integer y = 144
integer width = 247
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
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_oiretreq_m
integer x = 2295
integer y = 52
integer width = 183
integer height = 160
boolean bringtotop = true
integer textsize = -11
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

type ddlb_op from dropdownlistbox within w_oiretreq_m
integer x = 910
integer y = 324
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

type cb_continue from commandbutton within w_oiretreq_m
integer x = 4416
integer y = 312
integer width = 402
integer height = 108
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "반복저장"
end type

event clicked;//
string ls_cust_no, ls_scene_code, ls_sale_no, ls_ret_no, ls_chk
long   ll_seq_no, ll_dw3row, ll_dw4cnt, ll_find

//
if dw_31.rowcount() < 1 then RETURN
if MessageBox("확인","하나 이상의 반품서를 자동작성 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then RETURN

//
for ll_dw4cnt = 1 to dw_4.rowcount()
	ls_chk  = dw_4.object.chk[ll_dw4cnt]
	if ls_chk = "N" then CONTINUE

	// 헤더조회
	is_order_no = dw_4.object.order_no[ll_dw4cnt]
	if is_saleno = is_order_no then CONTINUE
	
	if is_mode = "R" then
		dw_2.retrieve( is_order_no )
		dw_2.enabled = true
	end if
	
	// 품목조회
	if rb_5.checked = true then
		ls_ret_no   = dw_4.object.ret_no[ll_dw4cnt]
		ls_sale_no  = dw_4.object.order_no[ll_dw4cnt]
		
		dw_3.retrieve( ls_ret_no, ls_sale_no )
	else
		dw_3.retrieve( is_order_no) 
	end if

	// 추가
	pb_insert.TriggerEvent( clicked! )
	
	// 반복저장 MOVE
   dw_2.object.rcpt_area[1]          = is_rcpt_area     // 입고처
   dw_2.object.create_login[1]       = is_create_login  // 작성자
   dw_2.object.preret_date[1]        = idt_preret_date  // 반품예정일
   dw_2.object.sale_flag[1]          = is_sale_flag     // 반납유형
   dw_2.object.ret_date[1]           = idt_ret_date     // 반품입고일
                                                        
   dw_2.object.ret_reason1[1]        = is_ret_reason1   // 반품사유1
   dw_2.object.ret_reason2[1]        = is_ret_reason2   // 반품사유2
   dw_2.object.ret_reason3[1]        = is_ret_reason3   // 반품사유3
                                                        
   dw_2.object.ship_case[1]          = is_ship_case     // 운반수단
   dw_2.object.ship_flag[1]          = is_ship_flag     // 운반비
   dw_2.object.ret_agree[1]          = is_ret_agree     // 활용의견
   dw_2.object.agree_desc[1]         = is_agree_desc    // 기타의견
                                                         
   dw_2.object.customer_cust_name[1] = is_custname      // 업체명
   dw_2.object.scene_scene_desc[1]   = is_scenedesc     // 현장명
   dw_2.object.sale_no[1]            = is_order_no      // 수주번호            
				
	//
	for ll_dw3row = 1 to dw_31.rowcount()
		ls_sale_no = dw_31.object.sale_no[ll_dw3row]
		ll_seq_no  = dw_31.object.seq_no[ll_dw3row]
		
		if dw_3.rowcount() > 0 then
			ll_find = dw_3.find( "sale_no = '"+is_order_no+"' AND seq_no = " + string(ll_seq_no) + "", 1, dw_3.rowcount() )
			if ll_find > 0 then
				dw_3.object.chk[ll_find]  = "Y"
				if dw_3.event itemchanged(ll_find, dw_3.object.chk, "Y") = 1 then
					dw_3.event itemerror( ll_find, dw_3.object.chk, "Y" )
				end if			
			end if
		end if
	next
	
	// 저장하기
	pb_save.Triggerevent( clicked! )
next

// 초기화
ib_continue = false
cb_continue.enabled = false
pb_retrieve.TriggerEvent( clicked! )
MessageBox("확인","반품서 자동작성 완료")



end event

type dw_31 from datawindow within w_oiretreq_m
integer x = 325
integer y = 172
integer width = 128
integer height = 88
integer taborder = 110
boolean bringtotop = true
string title = "반복저장용"
string dataobject = "d_oiretreqdet_m2"
end type

type gb_4 from groupbox within w_oiretreq_m
integer x = 1038
integer y = 16
integer width = 1202
integer height = 240
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_oiretreq_m
integer x = 2258
integer y = 16
integer width = 677
integer height = 240
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

