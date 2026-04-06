$PBExportHeader$w_orsaleclose_m.srw
$PBExportComments$판매수주마감(1998/04/08, 정재수)
forward
global type w_orsaleclose_m from w_inheritance
end type
type dw_3 from datawindow within w_orsaleclose_m
end type
type dw_4 from datawindow within w_orsaleclose_m
end type
type st_2 from statictext within w_orsaleclose_m
end type
type em_1 from editmask within w_orsaleclose_m
end type
type em_2 from editmask within w_orsaleclose_m
end type
type rb_1 from radiobutton within w_orsaleclose_m
end type
type rb_2 from radiobutton within w_orsaleclose_m
end type
type rb_3 from radiobutton within w_orsaleclose_m
end type
type dw_7 from datawindow within w_orsaleclose_m
end type
type dw_8 from datawindow within w_orsaleclose_m
end type
type cbx_1 from checkbox within w_orsaleclose_m
end type
type st_4 from statictext within w_orsaleclose_m
end type
type st_5 from statictext within w_orsaleclose_m
end type
type cbx_2 from checkbox within w_orsaleclose_m
end type
type cbx_3 from checkbox within w_orsaleclose_m
end type
type cbx_4 from checkbox within w_orsaleclose_m
end type
type em_3 from editmask within w_orsaleclose_m
end type
type st_33 from statictext within w_orsaleclose_m
end type
type rb_4 from radiobutton within w_orsaleclose_m
end type
type dw_5 from datawindow within w_orsaleclose_m
end type
type dw_9 from datawindow within w_orsaleclose_m
end type
type st_8 from statictext within w_orsaleclose_m
end type
type ddlb_col from dropdownlistbox within w_orsaleclose_m
end type
type st_9 from statictext within w_orsaleclose_m
end type
type ddlb_2 from dropdownlistbox within w_orsaleclose_m
end type
type sle_value from singlelineedit within w_orsaleclose_m
end type
type cb_4 from commandbutton within w_orsaleclose_m
end type
type cb_7 from commandbutton within w_orsaleclose_m
end type
type cb_filteroff from commandbutton within w_orsaleclose_m
end type
type cb_filteron from commandbutton within w_orsaleclose_m
end type
type st_1 from statictext within w_orsaleclose_m
end type
type st_vertical from u_splitbar_vertical within w_orsaleclose_m
end type
type st_horizontal from u_splitbar_horizontal within w_orsaleclose_m
end type
type gb_5 from groupbox within w_orsaleclose_m
end type
end forward

global type w_orsaleclose_m from w_inheritance
integer x = 37
integer y = 148
integer width = 4549
integer height = 2444
string title = "판매수주마감(w_orsaleclose_m)"
boolean resizable = false
long backcolor = 79219928
dw_3 dw_3
dw_4 dw_4
st_2 st_2
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_7 dw_7
dw_8 dw_8
cbx_1 cbx_1
st_4 st_4
st_5 st_5
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
em_3 em_3
st_33 st_33
rb_4 rb_4
dw_5 dw_5
dw_9 dw_9
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_4 cb_4
cb_7 cb_7
cb_filteroff cb_filteroff
cb_filteron cb_filteron
st_1 st_1
st_vertical st_vertical
st_horizontal st_horizontal
gb_5 gb_5
end type
global w_orsaleclose_m w_orsaleclose_m

type variables
st_print i_print
datawindowchild idwc_cust_no, idwc_scene, idwc_qa, idwc_cust
string is_scenesql, is_qasql, is_close_flag, is_mousemove
decimal ir_subt
st_sale_ysp ist_ysp

end variables

forward prototypes
public subroutine wf_saleclose (string as_orderno, string as_openclose)
end prototypes

public subroutine wf_saleclose (string as_orderno, string as_openclose);//
string   ls_null, ls_errtext, ls_make_name
datetime ldt_getdate

setnull( ls_null ) ; setnull( ldt_getdate )

ls_make_name = dw_2.object.make_name[1]

if isnull(as_orderno)   OR as_orderno   = "" then RETURN
if isnull(as_openclose) OR as_openclose = "" then RETURN

if as_openclose = "C" then
	
//	if messagebox("알림","생산계획중입니다. 마감시 생산담당자에게 통보해주시기 바랍니다. 마감하시겠습니까?",question!,okcancel!,1) = 2 then return
	
	// 마감
	UPDATE sale_close 
		SET accept_user = :gs_userid
		      , accept_date = getdate()
	 WHERE order_no    = :as_orderno;
	 
	if SQLCA.SQLCode = 0 then
		COMMIT;
	else		
		ls_errtext = SQLCA.SQLErrText
		ROLLBACK;
		MessageBox("확인", ls_errtext)
	end if
	
elseif as_openclose = "O" then
	
	// 마감취소 
	UPDATE sale_close 
		SET accept_user = :ls_null
		      , accept_date = :ldt_getdate
	WHERE order_no    = :as_orderno;
	 
	if SQLCA.SQLCode = 0 then
		COMMIT;
	else
		ls_errtext = SQLCA.SQLErrText
		ROLLBACK;
		MessageBox("확인", ls_errtext)
	end if
end if

end subroutine

on w_orsaleclose_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_2=create st_2
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_7=create dw_7
this.dw_8=create dw_8
this.cbx_1=create cbx_1
this.st_4=create st_4
this.st_5=create st_5
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.em_3=create em_3
this.st_33=create st_33
this.rb_4=create rb_4
this.dw_5=create dw_5
this.dw_9=create dw_9
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_4=create cb_4
this.cb_7=create cb_7
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.st_1=create st_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
this.Control[iCurrent+9]=this.dw_7
this.Control[iCurrent+10]=this.dw_8
this.Control[iCurrent+11]=this.cbx_1
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.cbx_2
this.Control[iCurrent+15]=this.cbx_3
this.Control[iCurrent+16]=this.cbx_4
this.Control[iCurrent+17]=this.em_3
this.Control[iCurrent+18]=this.st_33
this.Control[iCurrent+19]=this.rb_4
this.Control[iCurrent+20]=this.dw_5
this.Control[iCurrent+21]=this.dw_9
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.ddlb_col
this.Control[iCurrent+24]=this.st_9
this.Control[iCurrent+25]=this.ddlb_2
this.Control[iCurrent+26]=this.sle_value
this.Control[iCurrent+27]=this.cb_4
this.Control[iCurrent+28]=this.cb_7
this.Control[iCurrent+29]=this.cb_filteroff
this.Control[iCurrent+30]=this.cb_filteron
this.Control[iCurrent+31]=this.st_1
this.Control[iCurrent+32]=this.st_vertical
this.Control[iCurrent+33]=this.st_horizontal
this.Control[iCurrent+34]=this.gb_5
end on

on w_orsaleclose_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.cbx_1)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.em_3)
destroy(this.st_33)
destroy(this.rb_4)
destroy(this.dw_5)
destroy(this.dw_9)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_4)
destroy(this.cb_7)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.st_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.gb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_4)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

dw_2.SetTransObject(SQLCA)

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_5.visible = false
dw_7.visible = false
dw_8.visible = false
dw_9.visible = false

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust_no)
//idwc_cust_no.settransobject(sqlca)
gs_ds_whcustret.sharedata(idwc_cust_no)

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
em_3.text = "HD" + string(today(), "yyyymmdd" + "001")
em_3.SelectText( 1, LenA(em_3.text) )
em_3.SelectText( 9, 6)
em_3.SetFocus()

if gf_permission('판매수주마감관리_사용가능자', gs_userid) = 'Y' then
	rb_2.postevent(clicked!)
	pb_compute.enabled = true
else
	pb_compute.enabled = false
end if

ddlb_col.text = "현장명"
ddlb_2.text   = "LIKE"

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.width  = newwidth  - dw_4.x - gb_3.x

st_horizontal.y      = dw_2.y + dw_2.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x



end event

type pb_save from w_inheritance`pb_save within w_orsaleclose_m
boolean visible = false
integer x = 3214
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleclose_m
integer x = 1001
integer y = 92
integer width = 946
integer height = 92
integer taborder = 30
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_orsaleclose_m
integer x = 32
integer y = 20
integer width = 887
integer height = 144
string text = "판매수주마감"
end type

type st_tips from w_inheritance`st_tips within w_orsaleclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleclose_m
integer x = 4096
integer y = 64
integer taborder = 90
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "수동마감"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,is_mousemove,parent, li_x, li_y)

end event

event pb_compute::clicked;// 자동, 수동마감
date    ld_close
datetime ldt_close, ldt_null
long    ll_row, ll_row1, ll_dw4row, ll_cnt, ll_runcmd
string  ls_order_no, ls_seq_no, ls_item_no, ls_qa, ls_loc_no, ls_com_item, ls_com_item1, ls_com_item2
string  ls_chk, ls_ok
integer li_seq_no, li_cnt
decimal lr_plan_qty, lr_sol_qty, lr_issue_qty

// 작업지시서 발행건
if dw_3.rowcount() > 0 then
	if dw_3.object.sum_runcmd[1] > 0 then
		
		ll_runcmd = dw_3.object.sum_runcmd[1]
		
		MessageBox("확인","작업지시서가 이미 " + string(ll_runcmd) + " 건 발행된 상태 입니다.")
	end if
end if

// sale.open_close = 'O' :사용중 'C' : 마감(정상)   'X' : 수주취소
setnull(ldt_null)
choose case is_mousemove
case '수주취소'
	if dw_2.rowcount() < 1 then RETURN
	if MessageBox("수주취소","수주를 취소 하시겠습니까?",question!,okcancel!,1) = 2 then
		RETURN
	end if

	setpointer(hourglass!)
	setnull( ldt_close )
	ls_order_no = dw_2.object.order_no[1]
	dw_2.object.open_close[1] = 'X'
	dw_2.object.close_type[1] = 'X'
	dw_2.object.close_date[1] = ldt_close
	
	dw_2.accepttext()
	// 대체물품삭제.
	DELETE FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
	
	if sqlca.sqlcode < 0 then
		ROLLBACK;
		MessageBox("삭제1","itemalter 삭제중 오류가 발생 하였습니다.")
		RETURN
	end if	
	if wf_update1(dw_2, 'N') = false then
		RETURN
	else
		// 
	end if
	
	MessageBox("수주취소","수주를 취소 하였습니다.",information!)
	pb_retrieve.postevent(clicked!)
	
case '자동마감'
	if MessageBox("마감","자동마감을 수행 하시겠습니까?",question!,okcancel!,1) = 2 then
		RETURN
	end if

	setpointer(hourglass!)
	ld_close = date(em_1.text)
	dw_5.retrieve(ld_close)
			
	for ll_row = 1 to dw_5.rowcount() 
		ls_order_no = dw_5.getitemstring(ll_row, "order_no")
		
		SELECT count(*) INTO :li_seq_no FROM saledet WHERE order_no = :ls_order_no	AND order_qty > rlse_qty;
		
		if li_seq_no <= 0 or isnull(li_seq_no) then
				dw_5.object.open_close[ll_row] = 'C'
				dw_5.object.close_type[ll_row] = 'A'
				dw_5.object.close_date[ll_row] = gf_today()
				
				// 대체물품삭제.
				SELECT count(*) INTO :ll_cnt FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
				if ll_cnt > 0 then
					DELETE FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
					if sqlca.sqlcode < 0 then
						ROLLBACK;
						MessageBox("삭제2","itemalter 삭제중 오류가 발생 하였습니다.")
						RETURN
					end if	
				end if	
		end if
	next
	
	dw_5.accepttext()
	if wf_update1(dw_5, 'N') = false then
		RETURN
	else
		wf_saleclose( ls_order_no, "C" )
	end if
	MessageBox("마감","자동마감을 마쳤습니다.", information!)
	
case '수동마감'
	if dw_2.rowcount() < 1 then RETURN
	if MessageBox("마감","수동마감을 수행 하시겠습니까?",question!,okcancel!,1) = 2 then
		RETURN
	end if
	
	ls_ok = 'N'
	for ll_dw4row = 1 to dw_4.rowcount()
		if NOT dw_4.IsSelected(ll_dw4row) then CONTINUE
		
		dw_4.scrolltorow(ll_dw4row)
	
		setpointer(hourglass!)
		
		// 수주물품의 생산계획여부 확인
		if cbx_4.checked = false then
			for ll_row = 1 to dw_3.rowcount()
				li_seq_no   = dw_3.object.seq_no[ll_row]
				ls_seq_no   = string(dw_3.object.seq_no[ll_row])
				ls_order_no = dw_2.object.order_no[1]
				
				SELECT isnull(sum(plan_qty),0) INTO :lr_plan_qty 
				  FROM routtempnew
				 WHERE sale_no = :ls_order_no	AND seq_no = :li_seq_no
					AND process_flag <> 'E'		AND process_flag <> 'C';  // (작업진행구분 가능:Y, 불가:N, 완료:E, 진행:P)
					
			//	lr_plan_qty = dw_3.object.plan_qty[ll_row] 
				ls_chk = "N"
				if lr_plan_qty > 0 then
					MessageBox("마감","수주번호= " + ls_order_no + " 의" + ls_seq_no + "번째 수주물품의 생산계획을 취소 하십시요!",exclamation!)
					ls_chk = "Y"
					exit
				//	RETURN
				end if
			next

			if ls_chk = "Y" then CONTINUE				
		end if
			
		//수주물품의 가용량과 저장소별 예약량 변경
		for ll_row = 1 to dw_3.rowcount()
			lr_sol_qty   = dw_3.object.sol_qty[ll_row]
			lr_issue_qty = dw_3.object.issue_qty[ll_row]
			ls_loc_no    = dw_3.object.loc_no[ll_row]
			ls_item_no   = dw_3.object.item_no[ll_row]
			ls_qa        = dw_3.object.qa[ll_row]
			
			if lr_sol_qty > 0 then
			//	UPDATE item 
			//	   SET sales_reserved = sales_reserved - :lr_sol_qty
			//	 WHERE item_no = :ls_item_no AND qa = :ls_qa;
			//	if sqlca.sqlcode <> 0 then
			//		ROLLBACK;
			//		MessageBox("마감4","마감시 오류가 발생 하였습니다.",exclamation!)
			//		RETURN
			//	end if
					
				dw_3.object.sol_qty[ll_row] = 0
			elseif lr_issue_qty > 0 then
				UPDATE itemloc 
					SET reserved = reserved - :lr_issue_qty
				 WHERE loc_no = :ls_loc_no AND item_no = :ls_item_no AND qa = :ls_qa;
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
					MessageBox("마감5","마감시 오류가 발생 하였습니다.",exclamation!)
					RETURN
				end if
				dw_3.object.issue_qty[ll_row] = 0
				dw_3.object.loc_no[ll_row]    = ''
			end if
	
			ls_com_item  = LeftA(ls_item_no, 1)
			ls_com_item1 = MidA(ls_item_no, 3, 1)
			ls_com_item2 = MidA(ls_item_no, 7, 1)
			if upper(ls_com_item) = 'P' and upper(ls_com_item1) = 'Y' and &
				(upper(ls_com_item2) = 'A' or upper(ls_com_item2) = 'B' or &
				 upper(ls_com_item2) = 'C' or upper(ls_com_item2) = 'D') then
				dw_3.object.saledet_text[ll_row] = 'X'		// 가능:X, 불가:N, if(sol_qty > 0, '부분', '생산')
			else
				dw_3.object.saledet_text[ll_row] = 'N' 	// 가능:X, 불가:N, if(sol_qty > 0, '부분', '생산')
			end if
			dw_3.object.plan_close[ll_row] = ldt_null		// 수주상세 '생산완료시점'
		next	
			
			
		///////////////////////////////////////////////////////////////////////////////
		ls_order_no = dw_2.object.order_no[1]
		dw_7.retrieve( ls_order_no )
		
		// routtempnew (계획유무 유:Y, 무:N)
		DELETE FROM routtempnew WHERE sale_no = :ls_order_no AND plan_flag = 'N';			
		if sqlca.sqlcode <> 0 then
			ROLLBACK;
			MessageBox("저장오류6","저장중 오류가 발생 하였습니다!",exclamation!)
			RETURN
		end if
			
		// 대체물품삭제.
		SELECT count(*) INTO :ll_cnt FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
		if ll_cnt > 0 then
			DELETE FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
			if sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox("삭제7","itemalter 삭제중 오류가 발생 하였습니다.")
				RETURN
			end if	
		end if
		
		// 수주상세 '생산완료시점' 수정(saledet)
		for ll_row = 1 to dw_3.rowcount()
			dw_3.object.plan_close[ll_row] = ldt_null		// 수주상세 '생산완료시점'
		next
		///////////////////////////////////////////////////////////////////////////////
		
		dw_2.object.open_close[1] = 'C'
		dw_2.object.close_type[1] = 'M'
		dw_2.object.close_date[1] = gf_today()
			
		dw_2.accepttext()
		dw_3.accepttext()
		dw_7.accepttext()
		if	wf_update3(dw_2,dw_3,dw_7,'N') = false then
			RETURN
		else
			wf_saleclose( ls_order_no, "C" )
		end if
		ls_ok = 'Y'
	next
	
	if ls_ok = 'Y' then
		MessageBox("마감","수동마감을 마쳤습니다.",information!)
		pb_retrieve.postevent(clicked!)
	else
		MessageBox("확인","마감하시려는 수주를 더블클릭하여 선택 하십시요.",information!)
	end if
	
case '마감취소'
	if dw_2.rowcount() < 1 then RETURN

	if MessageBox("마감","마감을 취소 하시겠습니까?",question!,okcancel!,1) = 2 then
		RETURN
	end if

	setpointer(hourglass!)
	setnull(ldt_close)
	dw_2.object.open_close[1] = 'O'
	dw_2.object.close_type[1] = ''
	dw_2.object.close_date[1] = ldt_close
	
	dw_2.accepttext()
	
	if wf_update1(dw_2, 'N') = false then
		RETURN
	else
		wf_saleclose( ls_order_no, "O" )
	end if
	
	MessageBox("마감","마감내역을 취소 하였습니다.",information!)
	pb_retrieve.postevent(clicked!)
end choose

end event

type pb_print_part from w_inheritance`pb_print_part within w_orsaleclose_m
boolean visible = false
integer x = 2885
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_orsaleclose_m
integer x = 4288
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleclose_m
integer x = 3904
integer y = 64
integer taborder = 150
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
string ls_where, ls_sql, ls_dw5sql
gs_itembaldo_str  ist_code
 
ist_code.start_date = em_1.text
ist_code.end_date = em_2.text
if dw_4.getrow() > 0 then
	ist_code.start_no = dw_4.object.order_no[dw_4.getrow()]
	ist_code.end_no = dw_4.object.order_no[dw_4.getrow()]
end if

string ls_scenehp
if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

openwithparm(w_whsaledet_w, ist_code)

ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then
	return
end if				

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if ist_code.sel_flag = 'S' then
	l_print.st_print_desc = " 이 프로그램은 수주상황접수부를 출력합니다." 
	dw_9.dataobject = 'd_orsale_print2'
ELSE
	l_print.st_print_desc = " 이 프로그램은 수주내역 리스트를 출력합니다." 
	dw_9.dataobject = 'd_orsale_print3'
end if
dw_9.settransobject(sqlca)
ls_dw5sql = dw_9.describe("datawindow.table.select")

//if ist_code.order_flag = 'O' then
//	ls_where = " and sale.order_no between ~~'" + ist_code.start_no + "~~'" &
//				+ " and ~~'" + ist_code.end_no + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_9.modify(ls_sql)
//	dw_9.retrieve( ls_scenehp )
//else
//	ls_where = " and sale.order_date between ~~'" + ist_code.start_date + "~~'" &
//				+ " and ~~'" + ist_code.end_date + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_9.modify(ls_sql)
//	dw_9.retrieve( ls_scenehp )
//end if

if ist_code.order_flag = 'O' then
// 2017.12.18 조원석	d_orsale_print4 만들고, 데이터윈도우 분리 
// 분리 이유는 알수 없는 like 오류 발생, 쿼리부분 주석처리. 시작

	dw_9.dataobject = 'd_orsale_print2'
	dw_9.settrans( sqlca)
	
	dw_9.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)
else

// 분리 이유는 알수 없는 like 오류 발생, 쿼리부분 주석처리. 끝
	dw_9.dataobject = 'd_orsale_print4'
	dw_9.settrans( sqlca)
	dw_9.retrieve( ls_scenehp, ist_code.start_date,  ist_code.end_date, ist_code.do_flag)
	
end if

l_print.st_datawindow = dw_9
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleclose_m
boolean visible = false
integer x = 2501
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleclose_m
boolean visible = false
integer x = 2830
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleclose_m
integer x = 2830
integer width = 123
integer height = 88
integer taborder = 20
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_insert::clicked;//
string   ls_orderno, ls_custnm, ls_scenenm
datetime ld_date
long     ll_row
 
ls_orderno = trim(em_3.text)
if isnull(ls_orderno) or ls_orderno = "" then return


dw_2.reset()
dw_3.reset()
dw_4.reset()

SELECT sale.order_date 
     , customer.cust_name
     , scene.scene_desc
  INTO :ld_date, :ls_custnm, :ls_scenenm
  FROM sale 
       LEFT OUTER JOIN customer   ON sale.cust_no = customer.cust_no
       LEFT OUTER JOIN scene      ON sale.cust_no = scene.cust_no  AND sale.scene_code = scene.scene_code
 WHERE sale.order_no = :ls_orderno;

dw_4.setredraw(false)
ll_row = dw_4.insertrow(0)
dw_4.object.order_no[ll_row]   = ls_orderno
dw_4.object.order_date[ll_row] = ld_date
dw_4.object.cust_name[ll_row]  = ls_custnm
dw_4.object.scene_desc[ll_row] = ls_scenenm

dw_4.scrolltorow(ll_row)
dw_4.triggerevent( rowfocuschanged! )
dw_4.setredraw(true)

this.default = false
rb_2.checked = true
rb_1.checked = false
rb_2.triggerevent( clicked! )		// 수동


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleclose_m
integer x = 3712
integer y = 64
integer taborder = 80
end type

event pb_retrieve::clicked;//
string ls_cust_no,  ls_confirm_flag
date   ld_sorder_date, ld_eorder_date

dw_4.reset()
dw_1.accepttext()
if cbx_3.checked = false then
	ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인","판매거래처를 선택하세요!",information!)
		dw_1.setfocus()
		return
	end if
else
	ls_cust_no = "%"
end if

ld_sorder_date = date(em_1.text)
ld_eorder_date = date(em_2.text)
if em_1.text = '' then
	messagebox("확인","주문일자를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","주문일자를 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sorder_date > ld_eorder_date then
	messagebox("확인","주문일자를 잘못입력하였습니다.",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if cbx_1.checked = true then		// 확정
	ls_confirm_flag = "T"
else
	ls_confirm_flag = "N"
end if

dw_2.reset()
dw_3.reset()
dw_4.retrieve(ls_cust_no, ld_sorder_date, ld_eorder_date, is_close_flag, ls_confirm_flag)

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleclose_m
integer x = 32
integer y = 256
integer width = 4475
integer height = 180
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleclose_m
integer x = 974
integer y = 16
integer width = 1010
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79219928
string text = "거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleclose_m
integer x = 3113
integer y = 16
integer width = 1399
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleclose_m
integer x = 32
integer y = 456
integer width = 2414
integer height = 952
integer taborder = 0
string dataobject = "d_orsaleclose_m"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_orsaleclose_m
integer x = 32
integer y = 1452
integer width = 4471
integer height = 880
boolean bringtotop = true
string dataobject = "d_orsaleclose_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;//
string ls_item_no, ls_com_item, ls_com_item1, ls_com_item2, ls_orderno, ls_runcmd
long   ll_row, ll_count, ll_seqno

if this.getrow() > 0 then
	//Y.S.P인 경우
	if dw_2.object.curr_code[1] = 'WON' then
		dw_3.object.price.format = '#,##0'
	else
		dw_3.object.price.format = '#,###.000'
	end if
end if


dw_3.setredraw(false)
debugbreak()

ll_count = 0

for ll_row = 1 to dw_3.rowcount()
	// 작업지시 확인
	ls_orderno = dw_3.object.order_no[ll_row]
	ll_seqno   = dw_3.object.seq_no[ll_row]
	
	ls_runcmd= ""
	
	/* 작업지시에서 생산계획만 2020.03.18 jowonsuk
	SELECT mpsdet.mpsorder_order INTO :ls_runcmd
     FROM mpsdet with(nolock) LEFT OUTER JOIN mpsorder with(nolock) ON mpsdet.order_no = mpsorder.order_no
     WHERE mpsdet.sale_no = :ls_orderno AND mpsdet.seq_no = :ll_seqno;
	*/  
	
//	SELECT a.mpsorder_order 
//	     INTO :ls_runcmd
//     FROM mpsdet a with(nolock)
//     WHERE a.sale_no = :ls_orderno AND a.seq_no = :ll_seqno
//		 and not exists (                  
//								 select * 
//								 from sfcday b with(nolock)
//								   where b.sale_no = :ls_orderno
//									  and b.seq_no = :ll_seqno
//									  and b.sale_no = a.sale_no 
//									  and b.mpsorder_order  = a.mpsorder_order  
//									  and b.order_seq = a.order_seq
//						  );

	/*2020-08-06 jowonsuk 수정 */
     select dbo.uf_mpsdet(:ls_orderno, :ll_seqno)
	  into :ls_runcmd
	  from dual;
	 
	if isnull(ls_runcmd) or ls_runcmd = "" then
		dw_3.object.runcmd[ll_row] = ""
	else
		dw_3.object.runcmd[ll_row] = "Y"
	end if	
	
next


dw_3.setredraw(true)

end event

event rbuttondown;//These statements in the RButtonDown script 
//for the window display a popup menu at the cursor position. 
//Menu4 was created in the Menu painter and includes a menu called m_language. 
//Menu4 is not the menu for the active window and therefore needs to be created. 
//NewMenu is an instance of Menu4 (data type Menu4):
////
int li_int, li_seq
string ls_order, ls_login
long ll_found
string ls_item,ls_itemname,ls_qa

if row < 1 then return

this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_mpmodify.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
CHOOSE CASE gs_print_control
	CASE 'rout'
		long ll_row,ll_division,ll_seq,ll_operation
		string ls_sale
		ws_process st_process

		ll_row = this.getrow()
		st_process.division = 1
		st_process.sale_no     = trim(this.object.order_no[ll_row])
		st_process.seq_no      = this.object.seq_no[ll_row]
		st_process.operation = 0

		OpenWithParm(w_mpgong_m, st_process)
//	CASE 'item'
//
//		open(w_mpjaegoc_r)
//
//		row = this.getrow()
//		if row < 1 then return
//		ls_item = trim(this.object.assy_item[row])
//		ls_itemname = trim(this.object.groupitem_item_name[row])
//		ls_qa   = trim(this.object.assy_qa[row])
//		w_mpjaegoc_r.dw_1.object.item_no[1] = ls_item
//		w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
//		w_mpjaegoc_r.dw_2.retrieve(ls_item)
//		ll_found = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
//		if ll_found > 0 then
//			w_mpjaegoc_r.dw_2.scrolltorow(ll_found)
//		end if
END CHOOSE

//w_frame.PointerX(), w_frame.PointerY())

end event

type dw_4 from datawindow within w_orsaleclose_m
integer x = 2510
integer y = 456
integer width = 1993
integer height = 952
boolean bringtotop = true
string dataobject = "d_orsaleclose_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
long   ll_row
string ls_order

ll_row = this.getrow()
if ll_row < 1 then return

ls_order = this.object.order_no[ll_row]
dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

end event

event doubleclicked;//
long ll_row

if row < 1 then return

this.accepttext()

ll_row = row
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))

end event

type st_2 from statictext within w_orsaleclose_m
integer x = 2025
integer y = 152
integer width = 279
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "수주일자"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsaleclose_m
integer x = 2318
integer y = 140
integer width = 375
integer height = 76
integer taborder = 60
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_orsaleclose_m
integer x = 2693
integer y = 140
integer width = 375
integer height = 76
integer taborder = 70
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type rb_1 from radiobutton within w_orsaleclose_m
integer x = 3049
integer y = 328
integer width = 265
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "자동"
end type

event clicked;
cbx_3.enabled = false
dw_1.enabled = false
em_2.enabled = false
//st_3.enabled = false
pb_retrieve.enabled = false

is_close_flag = 'O'
is_mousemove = '자동마감'
pb_compute.text = is_mousemove
dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type rb_2 from radiobutton within w_orsaleclose_m
integer x = 3319
integer y = 328
integer width = 265
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "수동"
boolean checked = true
end type

event clicked;// 수동
cbx_3.enabled = true
dw_1.enabled  = true
em_2.enabled  = true
//st_3.enabled  = true
pb_retrieve.enabled = true

is_close_flag = 'O'
is_mousemove  = '수동마감'
pb_compute.text = is_mousemove

end event

type rb_3 from radiobutton within w_orsaleclose_m
integer x = 4009
integer y = 328
integer width = 416
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "마감취소"
end type

event clicked;
cbx_3.enabled = true
dw_1.enabled = true
em_2.enabled = true
//st_3.enabled = true
pb_retrieve.enabled = true

is_close_flag = 'C'
is_mousemove = '마감취소'
pb_compute.text = is_mousemove

dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type dw_7 from datawindow within w_orsaleclose_m
integer x = 110
integer y = 112
integer width = 91
integer height = 72
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_orsalecon_m3"
boolean livescroll = true
end type

type dw_8 from datawindow within w_orsaleclose_m
integer x = 210
integer y = 112
integer width = 91
integer height = 72
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_orsalecon_m4"
boolean livescroll = true
end type

type cbx_1 from checkbox within w_orsaleclose_m
integer x = 3150
integer y = 140
integer width = 347
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "확정"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type st_4 from statictext within w_orsaleclose_m
integer x = 1925
integer y = 252
integer width = 2034
integer height = 52
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
string text = "생산중인 수주의 마감은 주의해서 수주번호를  재확인해 주십시요."
boolean focusrectangle = false
end type

type st_5 from statictext within w_orsaleclose_m
integer x = 3328
integer y = 252
integer width = 197
integer height = 56
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
string text = "재확인"
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_orsaleclose_m
integer x = 73
integer y = 256
integer width = 357
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체수주"
end type

event clicked;long ll_row

if dw_4.rowcount() < 1 then return

if this.checked = true then
	dw_4.SelectRow(0, true)
else 
	dw_4.SelectRow(0, false)
end if

end event

type cbx_3 from checkbox within w_orsaleclose_m
integer x = 1010
integer y = 8
integer width = 416
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체거래처"
end type

event clicked;if this.checked = false then
	dw_1.object.cust_no.protect = 0
	dw_1.object.cust_no.background.color = 1087434968
else
	dw_1.object.cust_no.protect = 1 
	dw_1.object.cust_no.background.color = 78682240
end if

end event

type cbx_4 from checkbox within w_orsaleclose_m
integer x = 3150
integer y = 52
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "강제마감"
end type

type em_3 from editmask within w_orsaleclose_m
integer x = 2318
integer y = 52
integer width = 480
integer height = 80
integer taborder = 10
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
string mask = "!!########-###"
boolean autoskip = true
end type

event getfocus;pb_compute.default = true

end event

event modified;pb_cancel.triggerevent(clicked!)

end event

type st_33 from statictext within w_orsaleclose_m
integer x = 2025
integer y = 72
integer width = 279
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "수주번호"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_orsaleclose_m
integer x = 3589
integer y = 328
integer width = 416
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "수주취소"
end type

event clicked;
cbx_3.enabled = true
dw_1.enabled = true
em_2.enabled = true
//st_3.enabled = true
pb_retrieve.enabled = true

is_close_flag = 'O'
is_mousemove = '수주취소'
pb_compute.text = is_mousemove
dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type dw_5 from datawindow within w_orsaleclose_m
integer x = 315
integer y = 112
integer width = 91
integer height = 72
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_orsaleclose_h"
boolean livescroll = true
end type

type dw_9 from datawindow within w_orsaleclose_m
integer x = 421
integer y = 112
integer width = 91
integer height = 72
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type st_8 from statictext within w_orsaleclose_m
integer x = 69
integer y = 340
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

type ddlb_col from dropdownlistbox within w_orsaleclose_m
integer x = 251
integer y = 320
integer width = 402
integer height = 532
integer taborder = 160
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
string item[] = {"건설사","현장명","현설일자","입찰예정일시"}
end type

type st_9 from statictext within w_orsaleclose_m
integer x = 667
integer y = 340
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

type ddlb_2 from dropdownlistbox within w_orsaleclose_m
integer x = 837
integer y = 320
integer width = 279
integer height = 512
integer taborder = 170
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

type sle_value from singlelineedit within w_orsaleclose_m
integer x = 1129
integer y = 324
integer width = 475
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_4 from commandbutton within w_orsaleclose_m
integer x = 2199
integer y = 320
integer width = 192
integer height = 84
integer taborder = 170
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

choose case trim(ddlb_col.text)
	case "수주번호"
		ls_col = "order_no "
	case "주문일자"
		ls_col = "order_date "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
end choose		

dw_4.SetSort(ls_col + "D")
dw_4.sort()

end event

type cb_7 from commandbutton within w_orsaleclose_m
integer x = 2007
integer y = 320
integer width = 192
integer height = 84
integer taborder = 180
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

choose case trim(ddlb_col.text)
	case "수주번호"
		ls_col = "order_no "
	case "주문일자"
		ls_col = "order_date "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
end choose		

dw_4.SetSort(ls_col + "A")
dw_4.sort()

end event

type cb_filteroff from commandbutton within w_orsaleclose_m
integer x = 1815
integer y = 320
integer width = 192
integer height = 84
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()

end event

type cb_filteron from commandbutton within w_orsaleclose_m
integer x = 1618
integer y = 320
integer width = 192
integer height = 84
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
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

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "수주번호"
			ls_col = "order_no "
		case "주문일자"
			ls_col = "order_date "
		case "거래처명"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "order_date "
				ls_column = ls_col + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
			case else
				ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
		end choose
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

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

type st_1 from statictext within w_orsaleclose_m
integer x = 32
integer y = 192
integer width = 759
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "판매수주마감관리_사용가능자"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_orsaleclose_m
integer x = 2469
integer y = 456
integer height = 952
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_orsaleclose_m
integer x = 32
integer y = 1420
integer width = 4475
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_2.height

end event

type gb_5 from groupbox within w_orsaleclose_m
integer x = 1993
integer y = 16
integer width = 1102
integer height = 216
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
end type

