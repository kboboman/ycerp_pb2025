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
type st_1 from statictext within w_oiretreq_m
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
type st_4 from statictext within w_oiretreq_m
end type
type sle_custnm from singlelineedit within w_oiretreq_m
end type
type st_8 from statictext within w_oiretreq_m
end type
type ddlb_col from dropdownlistbox within w_oiretreq_m
end type
type st_9 from statictext within w_oiretreq_m
end type
type ddlb_2 from dropdownlistbox within w_oiretreq_m
end type
type sle_value from singlelineedit within w_oiretreq_m
end type
type cb_filteron from commandbutton within w_oiretreq_m
end type
type cb_filteroff from commandbutton within w_oiretreq_m
end type
type cb_5 from commandbutton within w_oiretreq_m
end type
type cb_6 from commandbutton within w_oiretreq_m
end type
type dw_6 from datawindow within w_oiretreq_m
end type
type dw_8 from datawindow within w_oiretreq_m
end type
end forward

global type w_oiretreq_m from w_inheritance
integer width = 4635
integer height = 2708
string title = "반품요청 관리(w_oiretreq_m)"
dw_4 dw_4
em_1 em_1
em_2 em_2
st_1 st_1
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
st_4 st_4
sle_custnm sle_custnm
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_5 cb_5
cb_6 cb_6
dw_6 dw_6
dw_8 dw_8
end type
global w_oiretreq_m w_oiretreq_m

type variables
st_print i_print
datawindowchild idwc_cust
string is_order_no, is_scenesql 
string is_mode = "I", is_ins = "S"
end variables

on w_oiretreq_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
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
this.st_4=create st_4
this.sle_custnm=create sle_custnm
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_5=create cb_5
this.cb_6=create cb_6
this.dw_6=create dw_6
this.dw_8=create dw_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.pb_2
this.Control[iCurrent+10]=this.rb_3
this.Control[iCurrent+11]=this.rb_4
this.Control[iCurrent+12]=this.dw_7
this.Control[iCurrent+13]=this.dw_3
this.Control[iCurrent+14]=this.rb_5
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.sle_custnm
this.Control[iCurrent+17]=this.st_8
this.Control[iCurrent+18]=this.ddlb_col
this.Control[iCurrent+19]=this.st_9
this.Control[iCurrent+20]=this.ddlb_2
this.Control[iCurrent+21]=this.sle_value
this.Control[iCurrent+22]=this.cb_filteron
this.Control[iCurrent+23]=this.cb_filteroff
this.Control[iCurrent+24]=this.cb_5
this.Control[iCurrent+25]=this.cb_6
this.Control[iCurrent+26]=this.dw_6
this.Control[iCurrent+27]=this.dw_8
end on

on w_oiretreq_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
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
destroy(this.st_4)
destroy(this.sle_custnm)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.dw_6)
destroy(this.dw_8)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

Integer li_day

dw_2.SetTransObject(SQLCA)
dw_1.insertrow(0)  //춘 19
dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_7.settransobject(sqlca)

dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false

dw_1.insertrow(0)

li_day    = Day(today()) - 1
em_1.text = string(RelativeDate(today(), - li_day), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
rb_2.postevent(clicked!)

end event

event resize;call super::resize;//
dw_3.width  = this.width  - 96
dw_3.height = this.height - 1386

end event

type pb_save from w_inheritance`pb_save within w_oiretreq_m
event ue_print pbm_custom01
integer x = 4155
integer taborder = 110
end type

event pb_save::clicked;string  ls_area, ls_sale_flag, ls_preret_date, ls_seq, ls_ret_no1, ls_ret_no
long    ll_row,ll_dw7row
int     li_seq
decimal ld_retqty, ld_t_retqty, ld_rlseqty, ld_orderqty
 
if dw_2.rowcount() < 1 then return

dw_2.accepttext()
dw_3.accepttext()
if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)

CHOOSE CASE is_mode
	CASE "R"
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
		wf_update2(dw_2,dw_3,'Y')

   CASE "I"
		for ll_row = 1 to dw_3.rowcount()
			if dw_3.object.chk[ll_row] <> "Y" then continue
	
			if rb_5.checked = true then
				if dw_3.object.acc_qty[ll_row] + dw_3.object.ret_range[ll_row] + dw_3.object.apply_qty[ll_row] &
						> dw_3.object.agree_ret[ll_row] then
						
					MessageBox("오류", string(ll_row) + " 번째 반납할 수량이 반품결재 수량 보다 큽니다")
					dw_3.scrolltorow(ll_row)
					dw_3.setcolumn('ret_range')
					dw_3.setfocus()
					return
				end if
			else
            ld_retqty    = dw_3.object.ret_qty[ll_row]
				ld_t_retqty  = dw_3.object.t_ret_qty[ll_row]
				ld_rlseqty   = dw_3.object.saledet_rlse_qty[ll_row]
				ld_orderqty  = dw_3.object.saledet_order_qty[ll_row]

				if ld_retqty + ld_t_retqty > ld_orderqty then
					MessageBox("오류", string(ll_row) + " 번째 반납할 수량("+string(ld_retqty + ld_t_retqty,"#,##0.00")+&
					           ")이 > 출고수량("+string(ld_orderqty,"#,##0.00")+") 보다 큽니다")
					dw_3.scrolltorow(ll_row)
					dw_3.setcolumn('ret_qty')
					dw_3.setfocus()
					return
				end if
			end if
		next
		
		//출고 번호 부여
		//ls_area = left(gs_area, 1)
		ls_area = LeftA(dw_2.object.rcpt_area[1], 1)
		ls_sale_flag = 'F'
		IF trim(dw_2.object.ret_no[1]) = '' OR isnull(dw_2.object.ret_no[1]) then
			ls_preret_date = string(dw_2.object.preret_date[1], "yyyymmdd")
			ls_ret_no1     = ls_area + ls_sale_flag + ls_preret_date + '-' + '%'			
			SELECT MAX(ret_no) INTO :ls_ret_no
			  FROM ret 
			 WHERE ret_no LIKE :ls_ret_no1;		
			if isnull(ls_ret_no) or ls_ret_no = '' then
				ls_ret_no1 = ls_area + ls_sale_flag + ls_preret_date + '-' + '001'
			else
				li_seq = integer(MidA(ls_ret_no, 12, 3))
				li_seq = li_seq + 1
				ls_seq = '00' + string(li_seq)
				ls_ret_no1 = LeftA(ls_ret_no1, 11) + RightA(ls_seq, 3)
			end if
		else
			setnull(ls_ret_no)
			ls_ret_no1 = dw_2.object.ret_no[1]
			SELECT ret_no INTO :ls_ret_no
			  FROM ret
			 WHERE ret_no = :ls_ret_no;
			IF trim(ls_ret_no) = '' or isnull(ls_ret_no) then
			ELSE
				messagebox("저장", "반품번호가 이미 존재합니다.", exclamation!)
				return
			end if
		end if
		
		dw_2.object.ret_no[1] = ls_ret_no1
		dw_7.reset()
		ll_dw7row = 0
		for ll_row = 1 to dw_3.rowcount()
			if dw_3.object.chk[ll_row] <> "Y" then continue
			
			ll_dw7row = dw_7.insertrow(0)
			
			dw_7.object.ret_no[ll_dw7row]  = ls_ret_no1
			dw_7.object.ret_seq[ll_dw7row] = ll_dw7row
			dw_7.object.sale_no[ll_dw7row] = dw_3.object.sale_no[ll_row]
			dw_7.object.seq_no[ll_dw7row]  = dw_3.object.seq_no[ll_row]
			dw_7.object.item_no[ll_dw7row] = dw_3.object.item_no[ll_row]
			dw_7.object.color[ll_dw7row]   = dw_3.object.color[ll_row]
			dw_7.object.qa[ll_dw7row]      = dw_3.object.qa[ll_row]
			dw_7.object.uom[ll_dw7row]     = dw_3.object.uom[ll_row]
			if rb_5.checked = true then
				dw_7.object.ret_qty[ll_dw7row] = dw_3.object.ret_range[ll_row]
			else
				dw_7.object.ret_qty[ll_dw7row] = dw_3.object.ret_qty[ll_row]
			end if
			dw_7.object.acc_qty[ll_dw7row] = 0
			dw_7.object.acc_degree[ll_dw7row]    = dw_3.object.acc_degree[ll_row]
			dw_7.object.decision_desc[ll_dw7row] = dw_3.object.decision_desc[ll_row]
			dw_7.object.rem[ll_dw7row]     = dw_3.object.rem[ll_row] 
		next
		
		if ll_dw7row < 1 then 
			messagebox("오류","반품할 물품을 선택하십시요")
			return
		end if
		if wf_update2(dw_2,dw_7,'Y') = true then
			dw_2.reset()
			dw_3.reset()
			dw_4.reset()
		end if
END CHOOSE

end event

type dw_1 from w_inheritance`dw_1 within w_oiretreq_m
integer x = 914
integer y = 280
integer width = 873
integer height = 84
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

type dw_2 from w_inheritance`dw_2 within w_oiretreq_m
integer x = 2272
integer y = 244
integer width = 2304
integer height = 912
integer taborder = 60
string dataobject = "d_oiretreq_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
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

type st_title from w_inheritance`st_title within w_oiretreq_m
integer x = 41
integer y = 28
integer width = 1083
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
integer x = 4347
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretreq_m
integer x = 3351
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
integer x = 3579
integer taborder = 160
end type

event pb_cancel::clicked;if MessageBox("취소", "작업내역을 취소 하시겠습니까", Exclamation!, OKCancel!, 2) = 1 then
	dw_2.reset()
	dw_3.reset()
	pb_retrieve.triggerevent(clicked!)
end if

end event

type pb_delete from w_inheritance`pb_delete within w_oiretreq_m
integer x = 3963
integer taborder = 170
end type

event pb_delete::clicked;if dw_2.rowcount() < 1 then return
//
long ll_row
dw_2.accepttext()
dw_3.accepttext()
if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	dw_2.deleterow(0)
	for ll_row = dw_3.rowcount() to 1 step -1
		dw_3.deleterow(ll_row)
	next
//	dw_3.RowsMove(1, dw_3.rowCount(), Primary!, dw_3, 1, Delete!)
	wf_update2(dw_2,dw_3,'Y')
	pb_retrieve.triggerevent(clicked!)
end if
//
//
//		
end event

type pb_insert from w_inheritance`pb_insert within w_oiretreq_m
integer x = 3771
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
integer x = 2066
integer y = 260
integer width = 160
integer height = 120
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string ls_cust_no
date  ld_start_date, ld_end_date
 
dw_4.reset()
dw_1.accepttext()
if cbx_1.checked = true then	// 전체
	ls_cust_no = "%"
else
	ls_cust_no = trim(dw_1.object.cust_no[1])
end if

if ls_cust_no = '' or isnull(ls_cust_no) then
	dw_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
CHOOSE CASE is_mode
	CASE "R"	// 조회
		if dw_4.retrieve(ls_cust_no,ld_start_date,ld_end_date,"O") < 1 then
			dw_1.setfocus()
		else
			dw_4.setfocus()
		end if
	CASE "I"	// 추가
		if dw_4.retrieve(ls_cust_no,ld_start_date,ld_end_date) < 1 then
			dw_1.setfocus()
		else
			dw_4.setfocus()
		end if
END CHOOSE 

end event

type gb_3 from w_inheritance`gb_3 within w_oiretreq_m
integer x = 2235
integer y = 12
integer width = 1042
integer height = 204
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "모드"
end type

type gb_2 from w_inheritance`gb_2 within w_oiretreq_m
integer y = 220
integer width = 2217
integer height = 172
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "판매수주 거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_oiretreq_m
integer x = 3319
integer width = 1257
integer taborder = 120
end type

type dw_4 from datawindow within w_oiretreq_m
string tag = "d_oiretreq_s2"
integer x = 32
integer y = 404
integer width = 2217
integer height = 756
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

event rowfocuschanging;if is_mode = "I" and dw_2.rowcount() > 0 and dw_2.modifiedcount() > 0 then
	if MessageBox("취소", "작업내역을 취소 하시겠습니까", Exclamation!, OKCancel!, 2) = 2 then
		return 1
	end if
	dw_2.reset()
	dw_3.reset()
end if

end event

event clicked;if dw_4.rowcount() < 1 then return


end event

event losefocus;this.width = 2217
end event

event getfocus;this.width = 2871
end event

type em_1 from editmask within w_oiretreq_m
integer x = 73
integer y = 288
integer width = 366
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiretreq_m
integer x = 507
integer y = 288
integer width = 366
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oiretreq_m
integer x = 453
integer y = 292
integer width = 50
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_oiretreq_m
integer x = 1317
integer y = 28
integer width = 128
integer height = 88
boolean bringtotop = true
string title = "d_oiretreq_r"
string dataobject = "d_oiretreq_r2"
boolean livescroll = true
end type

type cbx_1 from checkbox within w_oiretreq_m
integer x = 1787
integer y = 288
integer width = 233
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "전체"
end type

event clicked;if this.checked = true then
	dw_1.object.cust_no.background.color = 78682240
else
	dw_1.object.cust_no.background.color = 1087434968
end if

dw_1.enabled = NOT (this.checked)
end event

type rb_1 from radiobutton within w_oiretreq_m
integer x = 2277
integer y = 96
integer width = 247
integer height = 76
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

event clicked;if this.checked = true then
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

	ddlb_col.Reset()
	ddlb_col.AddItem("예정일자")
	ddlb_col.AddItem("수주번호")
	ddlb_col.AddItem("거래처명")
	ddlb_col.AddItem("현장명")
	ddlb_col.AddItem("반품수량")
	ddlb_col.AddItem("반품입고")
	
	is_mode = "R"
	pb_insert.enabled = false
	rb_3.enabled = false
	rb_4.enabled = false
	
	pb_delete.enabled = true
	pb_print.enabled = true
	pb_2.enabled = true
end if
end event

type rb_2 from radiobutton within w_oiretreq_m
integer x = 2560
integer y = 96
integer width = 247
integer height = 76
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

event clicked;if this.checked = true then
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

	ddlb_col.Reset()
	ddlb_col.AddItem("수주번호")
	ddlb_col.AddItem("거래처명")
	ddlb_col.AddItem("현장명")
	ddlb_col.AddItem("납기일")
	ddlb_col.AddItem("주문일자")
	ddlb_col.AddItem("유형")
	ddlb_col.AddItem("반품번호")
	
	is_mode = "I"
	rb_3.enabled = true
	rb_4.enabled = true
	pb_insert.enabled = true
	
	pb_delete.enabled = false
	pb_print.enabled = false
	pb_2.enabled = false
end if

end event

type pb_2 from picturebutton within w_oiretreq_m
event mousemove pbm_mousemove
integer x = 4430
integer y = 1156
integer width = 137
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

event clicked;//dwitemstatus l_status
//string ls_vat, ls_confirm_flag, ls_item_no, ls_com_item, ls_com_item1, ls_com_item2, ls_order_no
//integer li_revision_no, li_flag
//
if dw_3.rowcount() < 1 then return
//
//dw_2.accepttext()
//dw_3.accepttext()
//l_status = dw_3.getitemstatus(dw_3.getrow(), 0, primary!)
//ls_confirm_flag = dw_2.getitemstring(1, "sale_confirm_flag")
//li_revision_no = dw_2.getitemnumber(1, "revision_no")
//
//if ls_confirm_flag = 'Y' then
//	messagebox("확인","이미 확정된 수주입니다." + &
//              "~r~n물품을 삭제할 수 없습니다.", exclamation!)
//   return
//end if
//if dw_3.object.rlse_qty[dw_3.getrow()] > 0 then
//	messagebox("확인","이미 출고된 수주입니다." + &
//              "~r~n물품을 삭제할 수 없습니다.", exclamation!)
//   return
//end if
//
//if dw_3.rowcount() > 0 then
//	ls_item_no = dw_3.getitemstring(dw_3.getrow(), "item_no")
//	if l_status = newmodified! then
////		ls_com_item = left(ls_item_no, 1)
////		ls_com_item1 = mid(ls_item_no, 3, 1)
////		ls_com_item2 = mid(ls_item_no, 7, 1)
////		if upper(ls_com_item) = 'P' and upper(ls_com_item1) = 'Y' and &
////		  (upper(ls_com_item2) = 'A' or upper(ls_com_item2) = 'B' or &
////		   upper(ls_com_item2) = 'C' or upper(ls_com_item2) = 'D') then 
////			pb_4.visible = false
////		end if
//		
		dw_3.deleterow(dw_3.getrow())
//		pb_3.triggerevent(clicked!)
//		
//	elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
//		ls_com_item = left(ls_item_no, 1)
//		ls_com_item1 = mid(ls_item_no, 3, 1)
//		ls_com_item2 = mid(ls_item_no, 7, 1)
////		if upper(ls_com_item) = 'P' and upper(ls_com_item1) = 'Y' and &
////		  (upper(ls_com_item2) = 'A' or upper(ls_com_item2) = 'B' or &
////		   upper(ls_com_item2) = 'C' or upper(ls_com_item2) = 'D') then 
////			//Y.S.P 삭제
////			ls_order_no = dw_2.getitemstring(1, "order_no")
////			DELETE FROM saleysp
////			      WHERE order_no = :ls_order_no;
////					
////			if sqlca.sqlcode <> 0 then
////				rollback;
////				messagebox("삭제","saleysp삭제도중 오류가 발생하였습니다!",exclamation!)
////				return
////			end if
////			DELETE FROM saleyspdet
////			      WHERE order_no = :ls_order_no;
////					
////			if sqlca.sqlcode <> 0 then
////				rollback;
////				messagebox("삭제","saleyspdet삭제도중 오류가 발생하였습니다!",exclamation!)
////				return
////			end if
//////			pb_4.visible = false
////			li_flag = 1
////		end if
//		
//		dw_3.deleterow(dw_3.getrow())
//		li_revision_no = li_revision_no + 1
//		dw_2.object.revision_no[1] = li_revision_no
//		dw_2.object.revision_date[1] = wf_today()
//		dw_2.accepttext()
//		dw_3.accepttext()
//		
//		pb_3.triggerevent(clicked!)
//				
////		if wf_update2(dw_2,dw_3, 'Y') = false and li_flag = 1 then
////			pb_4.visible = true
////		end if
//	end if
//end if
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
integer x = 1458
integer y = 28
integer width = 128
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oiretreqdet_m1"
end type

type dw_3 from datawindow within w_oiretreq_m
string tag = "d_oiretreqdet_m1"
integer x = 32
integer y = 1272
integer width = 4549
integer height = 1332
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

type rb_5 from radiobutton within w_oiretreq_m
integer x = 2848
integer y = 96
integer width = 411
integer height = 76
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

event clicked;if this.checked = true then
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
	
	ddlb_col.Reset()
	ddlb_col.AddItem("반품번호")
	ddlb_col.AddItem("수주번호")
	ddlb_col.AddItem("거래처명")
	ddlb_col.AddItem("현장명")
	ddlb_col.AddItem("납기일")
	ddlb_col.AddItem("주문일자")
	ddlb_col.AddItem("유형")

	is_mode = "I"
	rb_3.enabled = true
	rb_4.enabled = true
	pb_insert.enabled = true
	
	pb_delete.enabled = false
	pb_print.enabled  = false
	pb_2.enabled      = false
end if

end event

type st_4 from statictext within w_oiretreq_m
integer x = 41
integer y = 1192
integer width = 247
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
string text = "거래처: "
boolean focusrectangle = false
end type

type sle_custnm from singlelineedit within w_oiretreq_m
integer x = 274
integer y = 1176
integer width = 503
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type st_8 from statictext within w_oiretreq_m
integer x = 791
integer y = 1192
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

type ddlb_col from dropdownlistbox within w_oiretreq_m
integer x = 974
integer y = 1172
integer width = 402
integer height = 532
integer taborder = 70
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
string item[] = {"반품번호","예정일자","수주번호","거래처","현장명"}
end type

type st_9 from statictext within w_oiretreq_m
integer x = 1394
integer y = 1192
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_oiretreq_m
integer x = 1577
integer y = 1172
integer width = 279
integer height = 512
integer taborder = 80
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

type sle_value from singlelineedit within w_oiretreq_m
integer x = 1870
integer y = 1176
integer width = 471
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_oiretreq_m
integer x = 2350
integer y = 1172
integer width = 197
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_4.FilteredCount() > 0 THEN
	dw_4.setfilter(ls_temp)
	dw_4.filter()
end if

// 거래처
if trim(sle_custnm.text) = "" then
	ls_custnm = ""
else
	ls_custnm = "cust_name like '%" + trim(sle_custnm.text) + "%" +"'"
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	if rb_1.checked = true then
		choose case trim(ddlb_col.text)
			case "반품번호"
				ls_col = "order_no "
			case "예정일자"
				ls_col = "preret_date "
			case "수주번호"
				ls_col = "sale_no "
			case "거래처"
				ls_col = "cust_name "
			case "현장명"
				ls_col = "scene_desc "
		end choose
	else
		choose case trim(ddlb_col.text)
			case "수주번호"
				ls_col = "order_no "
			case "거래처명"
				ls_col = "customer_cust_name "
			case "현장명"
				ls_col = "scene_scene_desc "
			case "납기일"
				ls_col = "due_date "
			case "주문일자"
				ls_col = "order_date "
			case "유형"
				ls_col = "sale_flag "
			case "반품번호"
				ls_col = "ret_no "
		end choose				
	end if
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
	end if
end if

choose case ls_custnm
	case ""
		ls_temp = ls_custnm
		if ls_column = "" then
			ls_temp = ls_column
		else
			ls_temp = "(" + ls_column + ")"
		end if
		
	case else
		ls_temp = ls_custnm
		if ls_column = "" then
			ls_temp = ls_custnm
		else
			ls_temp = "(" + ls_custnm + ") AND (" + ls_column + ")"
		end if		
end choose

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_4.setfilter(ls_temp)
dw_4.filter()

dw_4.scrolltorow(1)
dw_4.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_oiretreq_m
integer x = 2551
integer y = 1172
integer width = 320
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터해지"
end type

event clicked;//
sle_custnm.text = ""
ddlb_2.text     = " "
ddlb_col.text   = " "
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()
pb_retrieve.default = true
end event

type cb_5 from commandbutton within w_oiretreq_m
integer x = 2880
integer y = 1172
integer width = 178
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
String ls_col
if rb_1.checked = true then
	choose case trim(ddlb_col.text)
		case "반품번호"
			ls_col = "order_no "
		case "예정일자"
			ls_col = "preret_date "
		case "수주번호"
			ls_col = "sale_no "
		case "거래처"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
	end choose	
else
	choose case trim(ddlb_col.text)
		case "수주번호"
			ls_col = "order_no "
		case "거래처명"
			ls_col = "customer_cust_name "
		case "현장명"
			ls_col = "scene_scene_desc "
		case "납기일"
			ls_col = "due_date "
		case "주문일자"
			ls_col = "order_date "
		case "유형"
			ls_col = "sale_flag "
		case "반품번호"
			ls_col = "ret_no "
	end choose		
end if

dw_4.SetSort(ls_col + "A")
dw_4.sort()

end event

type cb_6 from commandbutton within w_oiretreq_m
integer x = 3063
integer y = 1172
integer width = 178
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
String ls_col
if rb_1.checked = true then
	choose case trim(ddlb_col.text)
		case "반품번호"
			ls_col = "order_no "
		case "예정일자"
			ls_col = "preret_date "
		case "수주번호"
			ls_col = "sale_no "
		case "거래처"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
	end choose	
else
	choose case trim(ddlb_col.text)
		case "수주번호"
			ls_col = "order_no "
		case "거래처명"
			ls_col = "customer_cust_name "
		case "현장명"
			ls_col = "scene_scene_desc "
		case "납기일"
			ls_col = "due_date "
		case "주문일자"
			ls_col = "order_date "
		case "유형"
			ls_col = "sale_flag "
		case "반품번호"
			ls_col = "ret_no "
	end choose		
end if

dw_4.SetSort(ls_col + "D")
dw_4.sort()

end event

type dw_6 from datawindow within w_oiretreq_m
integer x = 1605
integer y = 28
integer width = 128
integer height = 88
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiretreq_s1"
boolean livescroll = true
end type

type dw_8 from datawindow within w_oiretreq_m
integer x = 1746
integer y = 28
integer width = 128
integer height = 88
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiretreq_s2_mod"
boolean livescroll = true
end type

