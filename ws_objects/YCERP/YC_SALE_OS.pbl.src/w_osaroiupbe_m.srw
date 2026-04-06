$PBExportHeader$w_osaroiupbe_m.srw
$PBExportComments$판매선매출수정 및 취소(1998/05/26, 정재수)
forward 
global type w_osaroiupbe_m from w_inheritance
end type
type dw_3 from datawindow within w_osaroiupbe_m
end type
type gb_6 from groupbox within w_osaroiupbe_m
end type
type gb_5 from groupbox within w_osaroiupbe_m
end type
type gb_4 from groupbox within w_osaroiupbe_m
end type
type dw_4 from datawindow within w_osaroiupbe_m
end type
type pb_1 from picturebutton within w_osaroiupbe_m
end type
type dw_5 from datawindow within w_osaroiupbe_m
end type
type dw_6 from datawindow within w_osaroiupbe_m
end type
type dw_7 from datawindow within w_osaroiupbe_m
end type
type dw_8 from datawindow within w_osaroiupbe_m
end type
type st_1 from statictext within w_osaroiupbe_m
end type
end forward

global type w_osaroiupbe_m from w_inheritance
integer x = 37
integer y = 136
integer width = 3598
integer height = 2188
string title = "판매선매출수정 및 취소(w_osaroiupbe_m)"
boolean resizable = false
long backcolor = 79219928
dw_3 dw_3
gb_6 gb_6
gb_5 gb_5
gb_4 gb_4
dw_4 dw_4
pb_1 pb_1
dw_5 dw_5
dw_6 dw_6
dw_7 dw_7
dw_8 dw_8
st_1 st_1
end type
global w_osaroiupbe_m w_osaroiupbe_m

type variables
st_print i_print
datawindowchild idwc_cust
string  is_update_flag
st_aroiup_amt ist_amt

end variables

on w_osaroiupbe_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_4=create gb_4
this.dw_4=create dw_4
this.pb_1=create pb_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_7=create dw_7
this.dw_8=create dw_8
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_6
this.Control[iCurrent+3]=this.gb_5
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.dw_7
this.Control[iCurrent+10]=this.dw_8
this.Control[iCurrent+11]=this.st_1
end on

on w_osaroiupbe_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)

dw_1.insertrow(0)

//dw_2.modify('datawindow.readonly = yes')
//dw_4.modify('datawindow.readonly = yes')
end event

type pb_save from w_inheritance`pb_save within w_osaroiupbe_m
integer x = 3150
integer taborder = 90
boolean enabled = false
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;long ll_count, ll_row, ll_year, ll_find, ll_count1, ll_row1
string ls_month, ls_cust_no, ls_do_no, ls_do_no1, ls_aroiinv_no, ls_null
decimal lr_total, lr_amt, lr_ship_cost, lr_ship, lr_ship_rate
 
if dw_2.rowcount() < 1 then return

if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
dw_2.accepttext()
dw_4.accepttext()
dw_5.accepttext()
dw_6.accepttext()

dw_2.object.sys_date[1] = wf_today()
dw_2.object.login_id[1] = gs_userid
ls_aroiinv_no = dw_2.object.aroiinv_no[1]
ls_cust_no = dw_2.object.cust_no[1]

if dw_2.object.c_dc_amt[1] <> ist_amt.dc then
//	ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
//	ls_month = string(dw_2.object.oi_date[1], 'mm')
//	
//	//opeom table의 해당월의 매출금액 update
//	if wf_opeom_update(ls_cust_no, ll_year, ls_month, lr_total) = false then
//		rollback;
//		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if		
	
//	lr_total = ist_amt.dc - dw_2.object.c_dc_amt[1]
//	//customer table의 미수금액 update
//	UPDATE customer SET balance_amt = balance_amt - :lr_total
//	 WHERE cust_no = :ls_cust_no;
//	
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
end if

if dw_4.rowcount() > 0 then
	for ll_row = 1 to dw_4.rowcount()
		if dw_4.object.pick[ll_row] = 'Y' then
			dw_4.object.dc_rate[ll_row] = dw_4.object.c_dc[ll_row]
			dw_4.object.ori_amount[ll_row] = dw_4.object.amt[ll_row]
			dw_4.object.rate_cash[ll_row] = dw_4.object.vat[ll_row]
			
			ll_count = ll_count + 1
			dw_5.object.aroi_qty[ll_row] = dw_5.object.aroi_qty[ll_row] - dw_4.object.ship_qty[ll_row] + dw_4.object.a_qty[ll_row]	
	
			if dw_4.object.a_qty[ll_row] = 0 then	//세금계산서에서 물품삭제시
				//삭제된 물품이 속한 do의 모든 물품이 어떤 세금계산서에도 속하지 않는지 check
				ls_do_no1 = dw_4.object.do_no[ll_row]
				if ll_count = 1 then
					ls_do_no = dw_4.object.do_no[ll_row]
					ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no <> '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
					if ll_find = 0 then
						ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no = '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
						dw_6.object.invoice_print[ll_find] = 'N'
					end if	
				elseif ls_do_no <> ls_do_no1 then
					ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no <> '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
					if ll_find = 0 then
						ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no = '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
						dw_6.object.invoice_print[ll_find] = 'N'
					end if	
					ls_do_no = ls_do_no1
				end if
								
				//삭제되는 물품의 운송비가 이 세금계산서에 속하는지 check
				lr_ship_cost = dw_2.object.ship_cost[1]
				if lr_ship_cost > 0 then
					for ll_row1 = 1 to dw_4.rowcount()
						if ls_do_no1 = dw_4.object.do_no[ll_row1] then
							ll_count1 = ll_count1 + 1
						end if
					next
					
					if ll_count1 = 1 then
						SELECT ship_amount INTO :lr_ship 
						  FROM do
						 WHERE do_no = :ls_do_no1
						   AND inv_no = :ls_aroiinv_no;
							
						if lr_ship = 0 or isnull(lr_ship) then	
						else
							//1998-09-23 수정부분 (start)
							if dw_2.object.aroiinv_rate[1] <> 0 then
								lr_ship_rate = truncate(lr_ship * 0.1, 0)
								lr_ship = lr_ship - lr_ship_rate
								dw_2.object.ship_cost[1] = dw_2.object.ship_cost[1] - lr_ship
								dw_2.setitem(1, "ship", dw_2.object.ship[1] - lr_ship)
								dw_2.object.aroiinv_cash[1] = dw_2.object.aroiinv_cash[1] + lr_ship
								dw_2.object.aroiinv_rate[1] = dw_2.object.aroiinv_rate[1] + lr_ship_rate
							else
								dw_2.object.ship_cost[1] = dw_2.object.ship_cost[1] - lr_ship
								dw_2.setitem(1, "ship", dw_2.object.ship[1] - lr_ship)
								dw_2.object.aroiinv_cash[1] = dw_2.object.aroiinv_cash[1] + lr_ship
							end if
							//1998-09-23 수정부분 (end)							
							setnull(ls_null)
							UPDATE do SET inv_no = :ls_null
							 WHERE do_no = :ls_do_no1
							   AND inv_no = :ls_aroiinv_no;
							 
							if sqlca.sqlcode <> 0 then
								rollback;
								messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
								return
							end if	 
						end if
					end if
				end if
				dw_4.deleterow(ll_row)
			else
				dw_4.object.ship_qty[ll_row] = dw_4.object.a_qty[ll_row]
//				dw_4.object.price[ll_row] = dw_4.object.a_price[ll_row]
			end if
		end if
	next
	
	if ll_count = 0 then
		messagebox("확인","선정한 물품이 없습니다.",information!)
		return
	end if
	
	dw_2.accepttext()
//	dw_2.object.dc[1] = dw_2.object.dc_amt[1]
	//선매출잔액 갱신
	dw_2.object.rem_amt[1] = dw_2.object.rem_amt[1] + (ist_amt.amt - dw_2.object.amt[1])
	
	dw_2.accepttext()
	dw_4.accepttext()
	dw_5.accepttext()
	dw_6.accepttext()
		
	if wf_update4(dw_2, dw_4, dw_5, dw_6, 'Y') = false then
		return
	end if
else
	dw_2.object.aroiinv_cash[1] = dw_2.object.cash[1]
	dw_2.object.aroiinv_rate[1] = truncate(dw_2.object.cash[1] * 0.1, 0)
	
	dw_2.accepttext()

	if wf_update1(dw_2, 'Y') = false then
		return
	end if
end if

dw_3.postevent(rowfocuschanged!)
end event

type dw_1 from w_inheritance`dw_1 within w_osaroiupbe_m
integer x = 55
integer y = 292
integer width = 859
integer height = 92
integer taborder = 30
string dataobject = "d_oscustomer_s3"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::editchanged;call super::editchanged;datawindowchild ldwc_cust
string ls_data
long ll_found,ll_row
int li_line

this.getchild("cust_no", ldwc_cust)
ldwc_cust.settransobject(sqlca)

choose case dwo.name
	case 'cust_no'
		 ls_data = data + '%'
		 ll_row = ldwc_cust.RowCount( )
		 ll_found = ldwc_cust.Find("cust_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("cust_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_cust.scrolltorow(ll_found)
end choose

RETURN 0
end event

event dw_1::itemchanged;call super::itemchanged;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

this.accepttext()
dw_3.reset()
dw_2.reset()
dw_4.reset()
dw_3.retrieve(this.object.cust_no[this.getrow()])
dw_3.setfocus()
end event

type st_title from w_inheritance`st_title within w_osaroiupbe_m
integer x = 32
integer width = 1467
string text = "선매출수정 및 취소"
end type

type st_tips from w_inheritance`st_tips within w_osaroiupbe_m
end type

type pb_compute from w_inheritance`pb_compute within w_osaroiupbe_m
boolean visible = false
integer x = 1659
integer taborder = 160
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroiupbe_m
integer x = 2766
integer taborder = 130
end type

event pb_print_part::clicked;long ll_count, ll_idx, ll_int, ll_cnt
w_repsuper w_print
st_print l_print
string  ls_cust_name, ls_cap_name, ls_cust_no, ls_null, ls_rate_cash
string  ls_price, ls_amount, ls_addr, ls_tel_no
dec ld_amount, ld_tot
 
if dw_2.rowcount() <= 0 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
dw_8.reset()

setnull(ls_null)
ls_addr = ls_null
ls_cust_name = ls_null
ls_cap_name = ls_null
ls_tel_no = ls_null

ls_cust_no = dw_2.object.cust_no[1]

SELECT cust_name, captain_name, addr, tel_no 
  INTO :ls_cust_name, :ls_cap_name, :ls_addr, :ls_tel_no 
  FROM customer
 WHERE cust_no = :ls_cust_no;
 
dw_8.object.do_date[1] = string(dw_2.object.oi_date[1], "YYYY/MM/DD")
dw_8.object.do_no[1] = dw_2.object.aroiinv_no[1]
dw_8.object.addr[1] = ls_addr
dw_8.object.tel[1] = ls_tel_no
dw_8.object.scene[1] = ls_null
dw_8.object.cust[1] = ls_cust_name
dw_8.object.cap_name[1] = ls_cap_name
dw_8.object.item_1[1] = '      에누리'
ls_amount = string(dw_2.object.dc[1] + dw_2.object.discount[1], '####,###,##0')
ls_rate_cash = string(dw_2.object.dc_rate[1] + (dw_2.object.c_discount[1] - dw_2.object.discount[1]), '####,###,##0')
ld_tot = truncate(dw_2.object.c_dc_amt[1], 0)

dw_8.object.price_1[1] = ls_amount
dw_8.object.rate_1[1] = ls_rate_cash

dw_8.object.cash[1] = ls_amount
dw_8.object.vat[1] = ls_rate_cash
dw_8.object.tot_amount[1] = string(ld_tot, '####,###,###,###')

l_print.st_datawindow = dw_8
l_print.st_print_sheet = " 프린트용지 : 거래명세표"
l_print.st_print_desc = " 이 프로그램은 거래명세표를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"에누리인쇄",parent, li_x, li_y)
end event

type pb_close from w_inheritance`pb_close within w_osaroiupbe_m
integer x = 3342
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroiupbe_m
integer x = 2958
integer taborder = 70
end type

event pb_print::clicked;long ll_count, ll_idx, ll_int, ll_cnt
string ls_cust_name, ls_addr, ls_reg_no, ls_per_no, ls_cap_name, ls_ind_type, ls_ind_item
string ls_inv_date, ls_sp_cnt, ls_cash, ls_vat, ls_item_name, ls_cash1, ls_vat1, ls_total
string ls_cust_no, ls_item_no
dec ld_total, ld_amount, ld_rate
w_repsuper w_print
st_print l_print
 
if dw_2.rowcount() <= 0 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
dw_4.accepttext()
ls_cust_no = dw_2.object.cust_no[1]

SELECT cust_name, register_no, resident_card, captain_name, addr, industry_type, industry_code 
  INTO :ls_cust_name, :ls_reg_no, :ls_per_no, :ls_cap_name, :ls_addr, :ls_ind_type, :ls_ind_item 
  FROM customer
 WHERE cust_no = :ls_cust_no;
 
IF isnull(ls_reg_no) THEN
   dw_7.object.reg_no[1] = ls_per_no
ELSE
   dw_7.object.reg_no[1] = ls_reg_no
END IF
IF dw_2.object.c_aroi_flag[1] = '1' then
	dw_7.object.y_chk[1] = "***"
else
	dw_7.object.y_chk[1] = "    ***"
end if

dw_7.object.cust_name[1] = ls_cust_name
dw_7.object.cap_name[1] = ls_cap_name
dw_7.object.addr[1] = ls_addr
dw_7.object.ind_type[1] = ls_ind_type
dw_7.object.ind_item[1] = ls_ind_item
dw_7.object.inv_no[1] = dw_2.object.aroiinv_no[1]
dw_7.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYY MM DD")

ld_amount = dw_2.object.cash[1] + dw_2.object.ship_cost[1] - dw_2.object.discount[1]
dw_7.object.cash[1] = string(ld_amount, '#########0') 

if dw_2.object.vat[1] <> 0 then
   ld_rate = dw_2.object.vat[1] + (dw_2.object.ship_cost[1] / 10) - truncate(dw_2.object.discount[1] / 10, 0)
   dw_7.object.vat[1] = string(ld_rate, '########0') 
else
   ld_rate = dw_2.object.vat[1] 
   dw_7.object.vat[1] = string(ld_rate, '########0') 
end if

dw_7.object.mon[1] = integer(MidA(dw_7.object.inv_date[1], 6, 2))
dw_7.object.day[1] = integer(MidA(dw_7.object.inv_date[1], 9, 2))
ll_count = LenA(trim(dw_7.object.cash[1]))
ll_count = 10 - ll_count
dw_7.object.sp_cnt[1] = string(ll_count) 

IF dw_2.object.inv_type[1] = 'Y' THEN
	ls_item_no = dw_4.object.item_no[1]
	
	SELECT item_name 
	  INTO :ls_item_name 
	  FROM groupitem
	 WHERE item_no = :ls_item_no;
	 
	IF dw_4.rowcount() > 1 THEN
      dw_7.object.item_name[1] = trim(ls_item_name) + ' 외'
	ELSE
      dw_7.object.item_name[1] = trim(ls_item_name) 
	END IF
ELSE
   dw_7.object.item_name[1] = "물품대 "
END IF

dw_7.object.cash1[1] = string(ld_amount, '#,###,###,##0') 
dw_7.object.vat1[1] = string(ld_rate, '####,###,##0') 
ld_total = ld_amount + ld_rate
dw_7.object.total[1] = string(ld_total, '#,###,###,##0') 

l_print.st_datawindow = dw_7
l_print.st_print_sheet = " 프린트용지 : 세금계산서"
l_print.st_print_desc = " 이 프로그램은 세금계산서를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroiupbe_m
integer x = 2574
integer taborder = 170
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;long ll_row, ll_row1, ll_find, ll_year
string ls_do_no, ls_do_no1, ls_aroiinv_no, ls_month, ls_cust_no, ls_null
integer li_count
decimal lr_total, lr_ship_cost

if dw_2.rowcount() < 1 then return

if messagebox("취소","세금계산서 내역을 취소하시겠습니까?",question!,okcancel!,2) = 2 then
	return
end if

if is_update_flag = 'Y' then
	dw_3.triggerevent(rowfocuschanged!)
	is_update_flag = 'N'
end if

dw_2.accepttext()
dw_4.accepttext()
dw_5.accepttext()
dw_6.accepttext()

setpointer(hourglass!)
ls_aroiinv_no = dw_2.object.aroiinv_no[1]
ls_cust_no = dw_2.object.cust_no[1]
dw_5.retrieve(ls_aroiinv_no)
dw_6.retrieve(ls_cust_no)

dw_2.object.delete_flag[1] = 'Y' //취소 flag

for ll_row = 1 to dw_4.rowcount()
	//dodet table의 출고수량과 선매출수량 update
	dw_5.object.aroi_qty[ll_row] = dw_5.object.aroi_qty[ll_row] - dw_4.object.ship_qty[ll_row]
	
	//do table의 매출여부 update
	ls_do_no1 = dw_4.object.do_no[ll_row]
	if ll_row = 1 then
		ls_do_no = dw_4.object.do_no[ll_row]
		ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no <> '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
		if ll_find = 0 then
			ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no = '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
			dw_6.object.invoice_print[ll_find] = 'N'
		end if	
	elseif ls_do_no <> ls_do_no1 then
		ll_find = dw_6.find("do_no = '" + ls_do_no1 + "' and aroiinv_no <> '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
		if ll_find = 0 then
			ll_find = dw_6.find("do_no = '" + ls_do_no1 + "' and aroiinv_no = '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
			dw_6.object.invoice_print[ll_find] = 'N'
		end if	
		ls_do_no = ls_do_no1
	end if
next

if dw_4.rowcount() > 0 then
//	ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
//	ls_month = string(dw_2.object.oi_date[1], 'mm')
//
//	//opeom table의 해당월의 매출금액 update
//	if wf_opeom_update(ls_cust_no, ll_year, ls_month, lr_total) = false then
//		rollback;
//		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if		
//
//	lr_total = dw_2.object.c_dc_amt[1]
//	//customer table의 미수금액 update
//	UPDATE customer SET balance_amt = balance_amt + :lr_total
//	 WHERE cust_no = :ls_cust_no;
//
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if	
end if

lr_ship_cost = dw_2.object.ship_cost[1]
if lr_ship_cost > 0 then
	setnull(ls_null)
	UPDATE do SET inv_no = :ls_null
	 WHERE inv_no = :ls_aroiinv_no;
	 
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
		return
	end if	 
end if

dw_2.accepttext()
dw_5.accepttext()
dw_6.accepttext()

if wf_update3(dw_2, dw_5, dw_6, 'Y') = false then
	return
end if

dw_1.postevent(itemchanged!)




end event

type pb_delete from w_inheritance`pb_delete within w_osaroiupbe_m
boolean visible = false
integer x = 2738
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_osaroiupbe_m
boolean visible = false
integer x = 2738
integer taborder = 60
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroiupbe_m
boolean visible = false
integer x = 2354
integer taborder = 190
end type

type gb_3 from w_inheritance`gb_3 within w_osaroiupbe_m
integer x = 965
integer y = 224
integer width = 2587
integer height = 616
integer taborder = 0
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_osaroiupbe_m
integer x = 37
integer y = 224
integer width = 896
integer height = 180
integer taborder = 0
long textcolor = 16711680
string text = "판매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_osaroiupbe_m
integer x = 2359
integer width = 1193
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_osaroiupbe_m
integer x = 983
integer y = 260
integer width = 2551
integer height = 572
integer taborder = 40
string dataobject = "d_osaroiupbe_m"
boolean vscrollbar = false
boolean border = false
end type

type dw_3 from datawindow within w_osaroiupbe_m
integer x = 64
integer y = 476
integer width = 837
integer height = 352
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_osaroibeclose_s"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if this.rowcount() > 0 then
	this.accepttext()
	
	dw_2.modify('datawindow.readonly = yes')
	dw_4.modify('datawindow.readonly = yes')

	dw_2.retrieve(this.object.aroiinv_no[this.getrow()])
	dw_2.object.cash.tabsequence = 0
	dw_2.object.cash.background.color = 78682240
	dw_2.object.rem.tabsequence = 0
	dw_2.object.rem.background.color = 78682240
	
	if dw_2.object.curr_code[1] = 'WON' then
		dw_4.dataobject = 'd_osaroiup_m1'
	else
		dw_4.dataobject = 'd_osaroiup_m2'
	end if
	
	dw_4.settransobject(sqlca)
	dw_4.retrieve(this.object.aroiinv_no[this.getrow()])
	dw_4.object.pick.tabsequence = 0
	dw_5.reset()
	dw_6.reset()
else
	dw_2.reset()
	dw_4.reset()
	dw_5.reset()
	dw_6.reset()
end if

is_update_flag = 'N'
pb_save.enabled = false
end event

event retrieveend;if this.getrow() > 0 then
	pb_1.enabled = true
	pb_cancel.enabled = true
else
	pb_1.enabled = false
	pb_cancel.enabled = false
end if
end event

type gb_6 from groupbox within w_osaroiupbe_m
integer x = 37
integer y = 412
integer width = 896
integer height = 428
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "세금계산서번호"
end type

type gb_5 from groupbox within w_osaroiupbe_m
integer x = 965
integer y = 240
integer width = 521
integer height = 124
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type gb_4 from groupbox within w_osaroiupbe_m
integer x = 32
integer y = 832
integer width = 3520
integer height = 1264
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_4 from datawindow within w_osaroiupbe_m
integer x = 41
integer y = 872
integer width = 3497
integer height = 1212
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_osaroiup_m1"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;long ll_price, ll_rate, ll_row
decimal lr_amount, lr_amt, lr_qty, lr_vat, lr_dc

dw_2.accepttext()
choose case dwo.name
	case 'pick'
		if data = 'Y' then
			this.setcolumn("a_qty")
		else
			this.object.c_dc[this.getrow()] = this.object.dc_amt_rate[this.getrow()]
			this.setitem(this.getrow(), "a_qty", this.object.ship_qty[this.getrow()])
			
			this.accepttext()
   		for ll_row = 1 to this.rowcount()
	   		lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
		   	lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
			   lr_amt = lr_amt + this.object.amt[ll_row]
   			lr_dc = lr_dc + this.object.vat[ll_row]
	   	next
			
		   if dw_2.object.curr_code[1] = 'WON' then
		      dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
     		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
	   	   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
		      dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
   		else
	   	   dw_2.object.cash[1] = lr_amount
  		      dw_2.object.vat[1] = lr_vat 
		      dw_2.object.dc[1] = lr_amt - lr_amount
   		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	      end if		
		end if	
		
	case 'a_qty'
		this.accepttext()
		//출고수량과 매출수량 비교
		ll_row = this.getrow()
		lr_qty = dw_5.object.ship_qty[ll_row] - dw_5.object.aroi_qty[ll_row] + this.object.ship_qty[ll_row]
		if this.object.a_qty[ll_row] > lr_qty then
			messagebox("확인","매출수량이 출고할 수량을 초과하였습니다!",exclamation!)
			return 1
		end if
		
		this.accepttext()
		for ll_row = 1 to this.rowcount()
			lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
			lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
			lr_amt = lr_amt + this.object.amt[ll_row]
			lr_dc = lr_dc + this.object.vat[ll_row]
		next
		
		if dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
  		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
	      dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
		else
		   dw_2.object.cash[1] = lr_amount
  		   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	   end if
		
	case 'c_dc'
		this.accepttext()
		for ll_row = 1 to this.rowcount()
			lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
			lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
			lr_amt = lr_amt + this.object.amt[ll_row]
			lr_dc = lr_dc + this.object.vat[ll_row]
		next
		
		if dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
  		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
	      dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
		else
		   dw_2.object.cash[1] = lr_amount
  		   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	   end if
end choose
end event

event retrieveend;long ll_row 
decimal lr_amount, lr_vat, lr_amt

if this.getrow() > 0 then
	this.accepttext()
	for ll_row = 1 to this.rowcount() 
		this.setitem(ll_row, "a_qty", this.object.ship_qty[ll_row])
		this.setitem(ll_row, "a_price", this.object.price[ll_row])
		this.setitem(ll_row, "c_dc", this.object.dc_rate[ll_row])
	next
	
	this.accepttext()
   for ll_row = 1 to this.rowcount()
		lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
	  	lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_dc[ll_row] / 100), 0 )
	   lr_amt = lr_amt + this.object.amt[ll_row]
	next
			
	if dw_2.object.curr_code[1] = 'WON' then
	   dw_2.setitem(1, "cash", round(lr_amount + 0.4999 ,0))
      dw_2.setitem(1, "vat", round(lr_vat + 0.4999, 0))
	else
  	   dw_2.setitem(1, "cash", lr_amount)
      dw_2.setitem(1, "vat", lr_vat)
   end if		
	
	dw_2.accepttext()
	dw_2.setitem(1, "ship", dw_2.object.ship_cost[1])
else
	dw_2.accepttext()
	dw_2.setitem(1, "cash", dw_2.object.aroiinv_cash[1])
	dw_2.setitem(1, "vat", dw_2.object.aroiinv_rate[1])
end if
end event

event itemerror;this.object.a_qty[this.getrow()] = this.object.ship_qty[this.getrow()] 
return 2

end event

type pb_1 from picturebutton within w_osaroiupbe_m
event mousemove pbm_mousemove
integer x = 2382
integer y = 52
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\update.bmp"
string disabledname = "c:\bmp\update.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수정",parent, li_x, li_y)

end event

event clicked;if dw_2.rowcount() < 1 then return

dw_2.modify('datawindow.readonly = no')
dw_4.modify('datawindow.readonly = no')

if dw_2.object.curr_code[1] = 'WON' then
	dw_2.object.gl_cur_rate.tabsequence = 0
	dw_2.object.gl_cur_rate.background.color = 78682240	
else
	dw_2.object.gl_cur_rate.tabsequence = 1
	dw_2.object.gl_cur_rate.background.color = 1087434968
end if

if dw_4.rowcount() < 1 then
	dw_2.object.cash.tabsequence = 1
	dw_2.object.cash.background.color = 1087434968
	dw_4.object.pick.tabsequence = 0
else
	dw_2.object.cash.tabsequence = 0
	dw_2.object.cash.background.color = 78682240
	dw_4.object.pick.tabsequence = 1
end if

dw_2.object.rem.tabsequence = 1
dw_2.object.rem.background.color = 1087434968

dw_2.accepttext()
ist_amt.aroiinv_cash = dw_2.object.cash[1]
ist_amt.aroiinv_rate = dw_2.object.vat[1]
ist_amt.ship_cost = dw_2.object.ship_cost[1]
ist_amt.dc = dw_2.object.c_dc_amt[1]
ist_amt.amt = dw_2.object.amt[1]

dw_5.retrieve(dw_3.object.aroiinv_no[dw_3.getrow()])
dw_6.retrieve(dw_2.object.cust_no[1])
is_update_flag = 'Y' //수정버튼 click check
pb_save.enabled = true
dw_2.setfocus()
end event

type dw_5 from datawindow within w_osaroiupbe_m
boolean visible = false
integer x = 1696
integer y = 32
integer width = 160
integer height = 88
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_osaroiup_h"
boolean livescroll = true
end type

type dw_6 from datawindow within w_osaroiupbe_m
boolean visible = false
integer x = 1911
integer y = 28
integer width = 389
integer height = 88
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_osaroiup_h1"
boolean livescroll = true
end type

type dw_7 from datawindow within w_osaroiupbe_m
boolean visible = false
integer x = 1897
integer y = 64
integer width = 82
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_osaroi_r"
boolean border = false
boolean livescroll = true
end type

type dw_8 from datawindow within w_osaroiupbe_m
boolean visible = false
integer x = 1993
integer y = 64
integer width = 82
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_osaroiupbe_m
integer x = 247
integer y = 660
integer width = 3013
integer height = 504
boolean bringtotop = true
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "~'w_osaroiup_m~'~'세금계산서 수정 및 취소~' 에서 현재 ~'d_osaroiup_m1~' 사용중(2013-07-03)"
boolean focusrectangle = false
end type

