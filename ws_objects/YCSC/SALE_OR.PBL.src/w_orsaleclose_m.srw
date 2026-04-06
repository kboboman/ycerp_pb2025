$PBExportHeader$w_orsaleclose_m.srw
$PBExportComments$판매수주마감(1998/04/08, 정재수)
forward
global type w_orsaleclose_m from w_inheritance
end type
type dw_3 from datawindow within w_orsaleclose_m
end type
type gb_7 from groupbox within w_orsaleclose_m
end type
type gb_6 from groupbox within w_orsaleclose_m
end type
type gb_4 from groupbox within w_orsaleclose_m
end type
type dw_4 from datawindow within w_orsaleclose_m
end type
type st_2 from statictext within w_orsaleclose_m
end type
type em_1 from editmask within w_orsaleclose_m
end type
type st_3 from statictext within w_orsaleclose_m
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
type gb_5 from groupbox within w_orsaleclose_m
end type
end forward

global type w_orsaleclose_m from w_inheritance
integer x = 37
integer y = 148
integer width = 4439
integer height = 2752
string title = "판매수주마감(w_orsaleclose_m)"
boolean resizable = false
windowstate windowstate = normal!
long backcolor = 79219928
dw_3 dw_3
gb_7 gb_7
gb_6 gb_6
gb_4 gb_4
dw_4 dw_4
st_2 st_2
em_1 em_1
st_3 st_3
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

on w_orsaleclose_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_4=create gb_4
this.dw_4=create dw_4
this.st_2=create st_2
this.em_1=create em_1
this.st_3=create st_3
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
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_7
this.Control[iCurrent+3]=this.gb_6
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.rb_1
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.rb_3
this.Control[iCurrent+13]=this.dw_7
this.Control[iCurrent+14]=this.dw_8
this.Control[iCurrent+15]=this.cbx_1
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.cbx_2
this.Control[iCurrent+19]=this.cbx_3
this.Control[iCurrent+20]=this.cbx_4
this.Control[iCurrent+21]=this.em_3
this.Control[iCurrent+22]=this.st_33
this.Control[iCurrent+23]=this.rb_4
this.Control[iCurrent+24]=this.dw_5
this.Control[iCurrent+25]=this.dw_9
this.Control[iCurrent+26]=this.st_8
this.Control[iCurrent+27]=this.ddlb_col
this.Control[iCurrent+28]=this.st_9
this.Control[iCurrent+29]=this.ddlb_2
this.Control[iCurrent+30]=this.sle_value
this.Control[iCurrent+31]=this.cb_4
this.Control[iCurrent+32]=this.cb_7
this.Control[iCurrent+33]=this.cb_filteroff
this.Control[iCurrent+34]=this.cb_filteron
this.Control[iCurrent+35]=this.gb_5
end on

on w_orsaleclose_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.st_3)
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
destroy(this.gb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
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
em_3.text = "HD" + string(today(), "yyyy")
em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
// 퇴사로 김원규(berrygrl), 김선영(syzang77)
//	2006.04.19
//	김선영퇴사 최나미권한이양 김선영아이디 syzang77을 동일하게 사용처리
//	2006.06.01
//	성계숙씨(cider74) 추가 - 김원규대리 권한승계 gs_userid = 'cider74'
// 2006.10.23 
// 정미림(jml)추가 -> // 2007.05.28  김영란(kyr)추가
// 2006.11.09 조용진부장(19910707)추가

if gf_permission('판매수주마감관리_사용가능자', gs_userid) = 'Y' then
	rb_2.postevent(clicked!)
	pb_compute.enabled = true
else
	pb_compute.enabled = false
end if

ddlb_col.text = "현장명"
ddlb_2.text   = "LIKE"

end event

event resize;call super::resize;gb_3.width  = this.width  - 87
gb_3.height = this.height - 1512
dw_3.width  = this.width  - 142
dw_3.height = this.height - 1584


end event

type pb_save from w_inheritance`pb_save within w_orsaleclose_m
boolean visible = false
integer x = 3141
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleclose_m
integer x = 73
integer y = 308
integer width = 873
integer height = 84
integer taborder = 30
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleclose_m
integer x = 1920
integer y = 456
integer width = 2469
integer height = 952
integer taborder = 0
string dataobject = "d_orsaleclose_m"
end type

type st_title from w_inheritance`st_title within w_orsaleclose_m
integer x = 46
integer y = 40
integer width = 1111
string text = "판매수주마감"
end type

type st_tips from w_inheritance`st_tips within w_orsaleclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleclose_m
integer x = 3982
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

event pb_compute::clicked;date    ld_close
datetime ldt_close, ldt_null
long    ll_row, ll_row1, ll_dw4row, ll_cnt
string  ls_order_no, ls_seq_no, ls_item_no, ls_qa, ls_loc_no, ls_com_item, ls_com_item1, ls_com_item2
string  ls_chk, ls_ok
integer li_seq_no, li_cnt
decimal lr_plan_qty, lr_sol_qty, lr_issue_qty

// sale.open_close = 'O' :사용중 'C' : 마감(정상)   'X' : 수주취소
setnull(ldt_null)
choose case is_mousemove
case '수주취소'
	if dw_2.rowcount() < 1 then return
	if messagebox("수주취소","수주를 취소하시겠습니까?",question!,okcancel!,1) = 2 then
		return
	end if

	setpointer(hourglass!)
	setnull(ldt_close)
	ls_order_no = dw_2.object.order_no[1]
	dw_2.object.open_close[1] = 'X'
	dw_2.object.close_type[1] = 'X'
	dw_2.object.close_date[1] = ldt_close
	dw_2.accepttext()
	// 대체물품삭제.
	delete from itemalter
	 where order_no = :ls_order_no
		and issue_flag = 'N';
	if sqlca.sqlcode < 0 then
		rollback;
		messagebox("삭제1","itemalter삭제도중 오류가 발생하였습니다.")
		return
	end if	
	if wf_update1(dw_2, 'N') = false then
		return
	end if
	messagebox("수주취소","수주를 취소하였습니다.",information!)
	pb_retrieve.postevent(clicked!)
	
case '자동마감'
	if messagebox("마감","자동마감을 수행하시겠습니까?",question!,okcancel!,1) = 2 then
		return
	end if

	setpointer(hourglass!)
	ld_close = date(em_1.text)
	dw_5.retrieve(ld_close)
			
	for ll_row = 1 to dw_5.rowcount() 
		ls_order_no = dw_5.getitemstring(ll_row, "order_no")
		
		SELECT count(*) INTO :li_seq_no
		  FROM saledet
		 WHERE order_no = :ls_order_no
			AND order_qty > rlse_qty;
			
		if li_seq_no <= 0 or isnull(li_seq_no) then
				dw_5.object.open_close[ll_row] = 'C'
				dw_5.object.close_type[ll_row] = 'A'
				dw_5.object.close_date[ll_row] = gf_today()
				// 대체물품삭제.
				select count(*) into :ll_cnt from itemalter
				 where order_no = :ls_order_no
					and issue_flag = 'N';
				if ll_cnt > 0 then
					delete from itemalter
					 where order_no = :ls_order_no
						and issue_flag = 'N';
					if sqlca.sqlcode < 0 then
						rollback;
						messagebox("삭제2","itemalter삭제도중 오류가 발생하였습니다.")
						return
					end if	
				end if	
		end if
	next
	
	dw_5.accepttext()
	if wf_update1(dw_5, 'N') = false then
		return
	end if
	messagebox("마감","자동마감을 마쳤습니다.", information!)
	
case '수동마감'
	if dw_2.rowcount() < 1 then return
	if messagebox("마감","수동마감을 수행하시겠습니까?",question!,okcancel!,1) = 2 then
		return
	end if
	
	ls_ok = 'N'
	for ll_dw4row = 1 to dw_4.rowcount()
		if not dw_4.IsSelected(ll_dw4row) then continue
			dw_4.scrolltorow(ll_dw4row)
		
			setpointer(hourglass!)
			
			//수주물품의 생산계획여부 확인
			if cbx_4.checked = false then
				for ll_row = 1 to dw_3.rowcount()
					li_seq_no = dw_3.object.seq_no[ll_row]
					ls_seq_no = string(dw_3.object.seq_no[ll_row])
					ls_order_no = dw_2.object.order_no[1]
					select isnull(sum(plan_qty),0) into :lr_plan_qty from routtempnew
					 where sale_no = :ls_order_no
					 	and seq_no = :li_seq_no
						and process_flag <> 'E'
						and process_flag <> 'C';
//					lr_plan_qty = dw_3.object.plan_qty[ll_row] 
					ls_chk = "N"
					if lr_plan_qty > 0 then
						messagebox("마감","수주번호= " + ls_order_no + " 의" + ls_seq_no + "번째 수주물품의 생산계획을 취소하십시요!",exclamation!)
						ls_chk = "Y"
						exit
	//					return
					end if
				next
				if ls_chk = "Y" then continue
				
			end if
			
			//수주물품의 가용량과 저장소별 예약량 변경
			for ll_row = 1 to dw_3.rowcount()
				lr_sol_qty = dw_3.object.sol_qty[ll_row]
				lr_issue_qty = dw_3.object.issue_qty[ll_row]
				ls_loc_no = dw_3.object.loc_no[ll_row]
				ls_item_no = dw_3.object.item_no[ll_row]
				ls_qa = dw_3.object.qa[ll_row]
				
				if lr_sol_qty > 0 then
//					UPDATE item SET sales_reserved = sales_reserved - :lr_sol_qty
//					 WHERE item_no = :ls_item_no
//						AND qa = :ls_qa;
//					if sqlca.sqlcode <> 0 then
//						rollback;
//						messagebox("마감4","마감시 오류가 발생하였습니다.",exclamation!)
//						return
//					end if
					
					dw_3.object.sol_qty[ll_row] = 0
				elseif lr_issue_qty > 0 then
					UPDATE itemloc SET reserved = reserved - :lr_issue_qty
					 WHERE loc_no = :ls_loc_no
						AND item_no = :ls_item_no
						AND qa = :ls_qa;
					if sqlca.sqlcode <> 0 then
						rollback;
						messagebox("마감5","마감시 오류가 발생하였습니다.",exclamation!)
						return
					end if
					dw_3.object.issue_qty[ll_row] = 0
					dw_3.object.loc_no[ll_row] = ''
				end if
	
				ls_com_item = LeftA(ls_item_no, 1)
				ls_com_item1 = MidA(ls_item_no, 3, 1)
				ls_com_item2 = MidA(ls_item_no, 7, 1)
				if upper(ls_com_item) = 'P' and upper(ls_com_item1) = 'Y' and &
					(upper(ls_com_item2) = 'A' or upper(ls_com_item2) = 'B' or &
					upper(ls_com_item2) = 'C' or upper(ls_com_item2) = 'D') then
					dw_3.object.saledet_text[ll_row] = 'X'			
				else
					dw_3.object.saledet_text[ll_row] = 'N'
				end if
				dw_3.object.plan_close[ll_row] = ldt_null
			next	
			
			
			//1998-09-22 수정부분(start)
			ls_order_no = dw_2.object.order_no[1]
			dw_7.retrieve(ls_order_no)
			
			//routtempnew table update
			DELETE FROM routtempnew WHERE sale_no = :ls_order_no
				and plan_flag = 'N';
			
			if sqlca.sqlcode <> 0 then
				rollback;
				messagebox("저장오류6","저장도중 오류가 발생하였습니다!",exclamation!)
				return
			end if
			// 대체물품삭제.
			select count(*) into :ll_cnt from itemalter
			 where order_no = :ls_order_no
				and issue_flag = 'N';
			if ll_cnt > 0 then
				delete from itemalter
				 where order_no = :ls_order_no
					and issue_flag = 'N';
				if sqlca.sqlcode < 0 then
					rollback;
					messagebox("삭제7","itemalter삭제도중 오류가 발생하였습니다.")
					return
				end if	
			end if	
			//saledet table update
			for ll_row = 1 to dw_3.rowcount()
				dw_3.object.plan_close[ll_row] = ldt_null
			next
			
			//1998-09-22 수정부분(end)
			
			dw_2.object.open_close[1] = 'C'
			dw_2.object.close_type[1] = 'M'
			dw_2.object.close_date[1] = gf_today()
				
			dw_2.accepttext()
			dw_3.accepttext()
			dw_7.accepttext()
			if	wf_update3(dw_2,dw_3,dw_7,'N') = false then
				return
			end if
			ls_ok = 'Y'
	next
	if ls_ok = 'Y' then
		messagebox("마감","수동마감을 마쳤습니다.",information!)
		pb_retrieve.postevent(clicked!)
	else
		messagebox("확인","마감하시려는 수주를 더블클릭하여 선택하십시요.",information!)
	end if
	
case '마감취소'
	if dw_2.rowcount() < 1 then return
	if messagebox("마감","마감을 취소하시겠습니까?",question!,okcancel!,1) = 2 then
		return
	end if

	setpointer(hourglass!)
	setnull(ldt_close)
	dw_2.object.open_close[1] = 'O'
	dw_2.object.close_type[1] = ''
	dw_2.object.close_date[1] = ldt_close
	
	dw_2.accepttext()
	if wf_update1(dw_2, 'N') = false then
		return
	end if
	messagebox("마감","마감내역을 취소하였습니다.",information!)
	pb_retrieve.postevent(clicked!)
end choose

end event

type pb_print_part from w_inheritance`pb_print_part within w_orsaleclose_m
boolean visible = false
integer x = 2807
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_orsaleclose_m
integer x = 4174
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleclose_m
integer x = 3168
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

if ist_code.order_flag = 'O' then
//	ls_where = " and sale.order_no between ~~'" + ist_code.start_no + "~~'" &
//				+ " and ~~'" + ist_code.end_no + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_9.modify(ls_sql)
//	dw_9.retrieve( ls_scenehp )
	dw_9.dataobject = 'd_orsale_print2'
	dw_9.settrans( sqlca)

	dw_9.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)

else
//	ls_where = " and sale.order_date between ~~'" + ist_code.start_date + "~~'" &
//				+ " and ~~'" + ist_code.end_date + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_9.modify(ls_sql)
//	dw_9.retrieve( ls_scenehp )

	dw_9.dataobject = 'd_orsale_print4'
	dw_9.settrans( sqlca)

	dw_9.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)
	
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
integer x = 2427
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleclose_m
boolean visible = false
integer x = 2757
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleclose_m
integer x = 1801
integer y = 300
integer width = 133
integer height = 96
integer taborder = 20
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_insert::clicked;string ls_orderno
datetime ld_date
long ll_row
 
ls_orderno = TRIM(em_3.TEXT)

if isnull(ls_orderno) or ls_orderno = '' then return

select order_date into :ld_date from sale
 where order_no = :ls_orderno;
if sqlca.sqlcode = 100 then 
	beep(2)
	dw_2.reset()
	dw_3.reset()
	em_3.setfocus()
	return
end if

dw_4.setredraw(false)
ll_row = dw_4.insertrow(0)
dw_4.object.order_no[ll_row] = ls_orderno
dw_4.object.order_date[ll_row] = ld_date
dw_4.scrolltorow(ll_row)
dw_4.triggerevent(rowfocuschanged!)
dw_4.setredraw(true)
this.default = false
rb_2.checked = true
rb_1.checked = false
rb_2.triggerevent(clicked!)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleclose_m
integer x = 3790
integer y = 64
integer taborder = 80
end type

event pb_retrieve::clicked;string ls_cust_no, ls_confirm_flag
date ld_sorder_date, ld_eorder_date

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

if cbx_1.checked = true then
	ls_confirm_flag = 'Y'
else
	ls_confirm_flag = 'N'
end if
dw_2.reset()
dw_3.reset()
dw_4.retrieve(ls_cust_no, ld_sorder_date, ld_eorder_date, is_close_flag, ls_confirm_flag)
	
end event

type gb_3 from w_inheritance`gb_3 within w_orsaleclose_m
integer x = 37
integer y = 1408
integer width = 4352
integer height = 1240
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleclose_m
integer x = 41
integer y = 260
integer width = 928
integer height = 152
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79219928
string text = "거래처"
borderstyle borderstyle = styleraised!
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleclose_m
integer x = 3145
integer y = 24
integer width = 1239
integer taborder = 0
end type

type dw_3 from datawindow within w_orsaleclose_m
integer x = 59
integer y = 1452
integer width = 4297
integer height = 1168
boolean bringtotop = true
string dataobject = "d_orsaleclose_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;string ls_item_no, ls_com_item, ls_com_item1, ls_com_item2
long ll_row, ll_count

if this.getrow() > 0 then
	//Y.S.P인 경우
	if dw_2.object.curr_code[1] = 'WON' then
		dw_3.object.price.format = '#,##0'
	else
		dw_3.object.price.format = '#,###.000'
	end if

end if


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

type gb_7 from groupbox within w_orsaleclose_m
integer x = 1993
integer y = 260
integer width = 1102
integer height = 152
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
borderstyle borderstyle = styleraised!
end type

type gb_6 from groupbox within w_orsaleclose_m
integer x = 3113
integer y = 260
integer width = 1129
integer height = 152
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

type gb_4 from groupbox within w_orsaleclose_m
integer x = 37
integer y = 436
integer width = 1870
integer height = 972
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type dw_4 from datawindow within w_orsaleclose_m
integer x = 59
integer y = 620
integer width = 1819
integer height = 768
boolean bringtotop = true
string dataobject = "d_orsaleclose_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then 	return

string ls_order
ls_order = this.object.order_no[ll_row]
dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

end event

event doubleclicked;long ll_row

if row < 1 then return

this.accepttext()

ll_row = row
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))

end event

type st_2 from statictext within w_orsaleclose_m
integer x = 2016
integer y = 320
integer width = 293
integer height = 76
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
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsaleclose_m
integer x = 2309
integer y = 308
integer width = 352
integer height = 84
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_orsaleclose_m
integer x = 2665
integer y = 324
integer width = 46
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_orsaleclose_m
integer x = 2706
integer y = 308
integer width = 352
integer height = 84
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_orsaleclose_m
integer x = 3141
integer y = 312
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
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
st_3.enabled = false
pb_retrieve.enabled = false

is_close_flag = 'O'
is_mousemove = '자동마감'
pb_compute.text = is_mousemove
dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type rb_2 from radiobutton within w_orsaleclose_m
integer x = 3351
integer y = 312
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "수동"
boolean checked = true
end type

event clicked;
cbx_3.enabled = true
dw_1.enabled = true
em_2.enabled = true
st_3.enabled = true
pb_retrieve.enabled = true
is_close_flag = 'O'
is_mousemove = '수동마감'
pb_compute.text = is_mousemove

end event

type rb_3 from radiobutton within w_orsaleclose_m
integer x = 3895
integer y = 312
integer width = 320
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
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
st_3.enabled = true
pb_retrieve.enabled = true

is_close_flag = 'C'
is_mousemove = '마감취소'
pb_compute.text = is_mousemove
dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type dw_7 from datawindow within w_orsaleclose_m
integer x = 1207
integer y = 72
integer width = 91
integer height = 72
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_orsalecon_m3"
boolean livescroll = true
end type

type dw_8 from datawindow within w_orsaleclose_m
integer x = 1307
integer y = 72
integer width = 91
integer height = 72
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_orsalecon_m4"
boolean livescroll = true
end type

type cbx_1 from checkbox within w_orsaleclose_m
integer x = 3479
integer y = 104
integer width = 256
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
string text = "확정"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type st_4 from statictext within w_orsaleclose_m
integer x = 1751
integer y = 68
integer width = 704
integer height = 168
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
integer x = 1751
integer y = 172
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
integer y = 436
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
integer x = 78
integer y = 248
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
integer x = 2743
integer y = 156
integer width = 389
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
string text = "강제마감"
end type

type em_3 from editmask within w_orsaleclose_m
integer x = 1312
integer y = 312
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
integer x = 1006
integer y = 324
integer width = 288
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "수주번호:"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_orsaleclose_m
integer x = 3570
integer y = 312
integer width = 320
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
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
st_3.enabled = true
pb_retrieve.enabled = true

is_close_flag = 'O'
is_mousemove = '수주취소'
pb_compute.text = is_mousemove
dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type dw_5 from datawindow within w_orsaleclose_m
integer x = 1413
integer y = 72
integer width = 91
integer height = 72
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_orsaleclose_h"
boolean livescroll = true
end type

type dw_9 from datawindow within w_orsaleclose_m
integer x = 1518
integer y = 72
integer width = 91
integer height = 72
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type st_8 from statictext within w_orsaleclose_m
integer x = 69
integer y = 520
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
integer y = 500
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
integer y = 520
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
integer y = 500
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
integer y = 504
integer width = 489
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
integer x = 1755
integer y = 544
integer width = 123
integer height = 64
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
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
integer x = 1627
integer y = 544
integer width = 123
integer height = 64
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
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
integer x = 1755
integer y = 480
integer width = 123
integer height = 64
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
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
integer x = 1627
integer y = 480
integer width = 123
integer height = 64
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
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

type gb_5 from groupbox within w_orsaleclose_m
integer x = 974
integer y = 260
integer width = 997
integer height = 152
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
borderstyle borderstyle = styleraised!
end type

