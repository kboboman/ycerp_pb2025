$PBExportHeader$w_osaroi_m.srw
$PBExportComments$판매매출관리(1998/04/13, 정재수)
forward
global type w_osaroi_m from w_inheritance
end type
type gb_7 from groupbox within w_osaroi_m
end type
type gb_6 from groupbox within w_osaroi_m
end type
type gb_5 from groupbox within w_osaroi_m
end type
type dw_4 from datawindow within w_osaroi_m
end type
type rb_1 from radiobutton within w_osaroi_m
end type
type rb_2 from radiobutton within w_osaroi_m
end type
type em_1 from editmask within w_osaroi_m
end type
type em_2 from editmask within w_osaroi_m
end type
type st_1 from statictext within w_osaroi_m
end type
type dw_6 from datawindow within w_osaroi_m
end type
type ddlb_1 from dropdownlistbox within w_osaroi_m
end type
type dw_7 from datawindow within w_osaroi_m
end type
type dw_9 from datawindow within w_osaroi_m
end type
type cbx_1 from checkbox within w_osaroi_m
end type
type dw_5 from datawindow within w_osaroi_m
end type
type cbx_2 from checkbox within w_osaroi_m
end type
type pb_1 from picturebutton within w_osaroi_m
end type
type cbx_source from checkbox within w_osaroi_m
end type
type dw_source from datawindow within w_osaroi_m
end type
end forward

global type w_osaroi_m from w_inheritance
integer x = 37
integer y = 136
integer width = 4635
integer height = 2232
string title = "판매매출관리(w_osaroi_m)"
boolean resizable = false
long backcolor = 79219928
gb_7 gb_7
gb_6 gb_6
gb_5 gb_5
dw_4 dw_4
rb_1 rb_1
rb_2 rb_2
em_1 em_1
em_2 em_2
st_1 st_1
dw_6 dw_6
ddlb_1 ddlb_1
dw_7 dw_7
dw_9 dw_9
cbx_1 cbx_1
dw_5 dw_5
cbx_2 cbx_2
pb_1 pb_1
cbx_source cbx_source
dw_source dw_source
end type
global w_osaroi_m w_osaroi_m

type variables
st_print i_print
datawindowchild idwc_cust
string is_sale_flag, is_round = 'N'
int ii_an
string is_sno, is_sh, is_nm, is_js, is_type, is_code
end variables

forward prototypes
public subroutine wf_calc ()
end prototypes

public subroutine wf_calc ();long  ll_row
decimal lr_amount, lr_vat, lr_amt, lr_dc

dw_4.accepttext()
for ll_row = 1 to dw_4.rowcount()
	if dw_4.object.pick[ll_row] = 'Y' then
		if cbx_1.visible = true and cbx_1.checked = true then
			dw_4.object.vat[ll_row] = 0
		else
//				dw_4.object.vat[ll_row] = truncate((dw_4.object.amt[ll_row] / 10), 0 )
			if dw_4.object.amt[ll_row] < 0 then
				dw_4.object.vat[ll_row] = truncate((dw_4.object.amt[ll_row] / 10) - 0.0000001, 0 )
			else
				dw_4.object.vat[ll_row] = truncate((dw_4.object.amt[ll_row] / 10) + 0.0000001, 0 )
			end if
		end if		

		if is_round = 'Y' then
			lr_amount = lr_amount + round(dw_4.object.amt[ll_row], 0) //&
							//- round((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//			lr_vat = lr_vat + round(dw_4.object.vat[ll_row], 0) //&
//							//- round((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
		else
			if dw_4.object.amt[ll_row] < 0 then
				lr_amount = lr_amount + truncate(dw_4.object.amt[ll_row] - 0.0000001, 0) //&
								//- truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
	//			lr_vat = lr_vat + truncate(dw_4.object.vat[ll_row], 0) //&
	//							//- truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
			else
				lr_amount = lr_amount + truncate(dw_4.object.amt[ll_row] + 0.0000001, 0) //&
								//- truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
	//			lr_vat = lr_vat + truncate(dw_4.object.vat[ll_row], 0) //&
	//							//- truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
			end if
		end if
		if dw_4.object.amt[ll_row] < 0 then		
			lr_amt = lr_amt + truncate(dw_4.object.amt[ll_row] - 0.0000001, 0)
	//		lr_dc = lr_dc + truncate(dw_4.object.vat[ll_row], 0)
		else
			lr_amt = lr_amt + truncate(dw_4.object.amt[ll_row] + 0.0000001, 0)
	//		lr_dc = lr_dc + truncate(dw_4.object.vat[ll_row], 0)
		end if
	end if
next
if lr_amount < 0 then
	lr_vat = truncate((lr_amount / 10) - 0.0000001, 0 ) 
	lr_dc  = truncate((lr_amount / 10) - 0.0000001, 0 ) 
else
	lr_vat = truncate((lr_amount / 10) + 0.0000001, 0 ) 
	lr_dc  = truncate((lr_amount / 10) + 0.0000001, 0 ) 
end if

IF dw_2.object.curr_code[1] = 'WON' then
	if lr_amount < 0 then
		dw_2.object.aroiinv_cash[1] = truncate(lr_amount - 0.0000001,0)
	else
		dw_2.object.aroiinv_cash[1] = truncate(lr_amount + 0.0000001,0)
	end if
	if cbx_1.visible = true and cbx_1.checked = true then
		dw_2.object.aroiinv_rate[1] = 0
	else
		if lr_vat < 0 then
			dw_2.object.aroiinv_rate[1] = truncate(lr_vat - 0.0000001, 0)
		else
			dw_2.object.aroiinv_rate[1] = truncate(lr_vat + 0.0000001, 0)
		end if			
	end if		

	if (lr_amt - lr_amount) < 0 then
		dw_2.object.dc[1] = truncate(lr_amt - lr_amount - 0.0000001, 0)
	else
		dw_2.object.dc[1] = truncate(lr_amt - lr_amount + 0.0000001, 0)
	end if
	if (lr_dc - lr_vat) < 0 then
		dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat - 0.0000001, 0)
	else
		dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat + 0.0000001, 0)
	end if
else
	dw_2.object.aroiinv_cash[1] = lr_amount
	if cbx_1.visible = true and cbx_1.checked = true then
		dw_2.object.aroiinv_rate[1] = 0 
	else
		dw_2.object.aroiinv_rate[1] = lr_vat 
	end if		
	dw_2.object.dc[1] = lr_amt - lr_amount
	dw_2.object.dc_rate[1] = lr_dc - lr_vat
end if

// 2007-12-06 부가세 계산식 변경
//long  ll_row
//decimal lr_amount, lr_vat, lr_amt, lr_dc
//
//dw_4.accepttext()
//for ll_row = 1 to dw_4.rowcount()
//	if dw_4.object.pick[ll_row] = 'Y' then
//		if cbx_1.visible = true and cbx_1.checked = true then
//			dw_4.object.vat[ll_row] = 0
//		else
//			dw_4.object.vat[ll_row] = truncate((dw_4.object.amt[ll_row] / 10), 0 )
//		end if		
//
//		if is_round = 'Y' then
//			lr_amount = lr_amount + round(dw_4.object.amt[ll_row], 0) //&
//							//- round((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//			lr_vat = lr_vat + round(dw_4.object.vat[ll_row], 0) //&
//							//- round((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//		else
//			lr_amount = lr_amount + truncate(dw_4.object.amt[ll_row], 0) //&
//							//- truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//			lr_vat = lr_vat + truncate(dw_4.object.vat[ll_row], 0) //&
//							//- truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//		end if
//		lr_amt = lr_amt + truncate(dw_4.object.amt[ll_row], 0)
//		lr_dc = lr_dc + truncate(dw_4.object.vat[ll_row], 0)
//	end if
//next
//
//IF dw_2.object.curr_code[1] = 'WON' then
//	dw_2.object.aroiinv_cash[1] = truncate(lr_amount ,0)
//	if cbx_1.visible = true and cbx_1.checked = true then
//		dw_2.object.aroiinv_rate[1] = 0
//	else
//		dw_2.object.aroiinv_rate[1] = truncate(lr_vat, 0)
//	end if		
//	dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
//	dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
//else
//	dw_2.object.aroiinv_cash[1] = lr_amount
//	if cbx_1.visible = true and cbx_1.checked = true then
//		dw_2.object.aroiinv_rate[1] = 0 
//	else
//		dw_2.object.aroiinv_rate[1] = lr_vat 
//	end if		
//	dw_2.object.dc[1] = lr_amt - lr_amount
//	dw_2.object.dc_rate[1] = lr_dc - lr_vat
//end if
//
end subroutine

on w_osaroi_m.create
int iCurrent
call super::create
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_5=create gb_5
this.dw_4=create dw_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_6=create dw_6
this.ddlb_1=create ddlb_1
this.dw_7=create dw_7
this.dw_9=create dw_9
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.cbx_2=create cbx_2
this.pb_1=create pb_1
this.cbx_source=create cbx_source
this.dw_source=create dw_source
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_7
this.Control[iCurrent+2]=this.gb_6
this.Control[iCurrent+3]=this.gb_5
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.em_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.dw_6
this.Control[iCurrent+11]=this.ddlb_1
this.Control[iCurrent+12]=this.dw_7
this.Control[iCurrent+13]=this.dw_9
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.dw_5
this.Control[iCurrent+16]=this.cbx_2
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.cbx_source
this.Control[iCurrent+19]=this.dw_source
end on

on w_osaroi_m.destroy
call super::destroy
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.dw_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_6)
destroy(this.ddlb_1)
destroy(this.dw_7)
destroy(this.dw_9)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.cbx_2)
destroy(this.pb_1)
destroy(this.cbx_source)
destroy(this.dw_source)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_source.settransobject(sqlca)
dw_source.visible = false
is_sno  = ''
is_sh   = ''
is_nm   = ''
is_js   = ''
is_type = ''
is_code = ''

string ls_loc

if gf_permission('거래명세서_기본공급자', gs_userid) = 'Y' then
	SELECT bigo INTO :ls_loc FROM codemst
	 WHERE type = '거래명세서_기본공급자' AND item_cd = :gs_userid;
	choose case ls_loc
		case "S", "D", "H", "B"
			cbx_source.Checked  =  TRUE
			cbx_source.triggerevent(clicked!)
		case else
			cbx_source.Checked  =  FALSE
	end choose
end if

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

em_1.text = string(today(), 'YYYY/MM/01')
em_2.text = string(today(), 'YYYY/MM/DD')
ddlb_1.text = '내수'
ddlb_1.event selectionchanged(1)
// 2005/11/02 future21 수출시 부가세 0로 처리부분 추가
cbx_1.visible = false
cbx_2.triggerevent(clicked!)



//if gs_userid = '1999010s' then
//	cbx_2.enabled = true
//else
//	cbx_2.enabled = false
//end if
end event

type pb_save from w_inheritance`pb_save within w_osaroi_m
event aroi_print pbm_uonexternal01
integer x = 3186
integer taborder = 90
end type

event pb_save::aroi_print;long ll_count, ll_idx, ll_int, ll_cnt
string ls_cust_name, ls_addr, ls_reg_no, ls_per_no, ls_cap_name, ls_ind_type, ls_ind_item
string ls_inv_date, ls_sp_cnt, ls_cash, ls_vat, ls_item_name, ls_cash1, ls_vat1, ls_total
string ls_cust_no, ls_item_no
dec ld_total, ld_amount, ld_rate
w_repsuper w_print
st_print l_print

dw_2.accepttext()
dw_5.accepttext()
ls_cust_no = dw_2.object.cust_no[1]
SELECT cust_name, register_no, resident_card, captain_name, addr, industry_type, 
       industry_code INTO :ls_cust_name, :ls_reg_no, :ls_per_no, :ls_cap_name, 
		 :ls_addr, :ls_ind_type, :ls_ind_item FROM customer
	WHERE cust_no = :ls_cust_no;
IF isnull(ls_reg_no) THEN
   dw_9.object.reg_no[1] = ls_per_no
ELSE
   dw_9.object.reg_no[1] = ls_reg_no
END IF

if cbx_2.checked = false then
	IF dw_2.object.c_aroi_flag[1] = '1' then
		dw_9.object.y_chk[1] = "***"
	else
		dw_9.object.y_chk[1] = "    ***"
	end if
	dw_9.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYY MM DD")
else
	IF dw_2.object.c_aroi_flag[1] = '1' then
		dw_9.object.y_chk[1] = "        청구"
	else
		dw_9.object.y_chk[1] = "        영수"
	end if
	dw_9.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYYMMDD")
	dw_9.object.rem[1] = dw_2.object.rem[1]

	string ls_c_chk
	if cbx_source.checked = true then
		ls_c_chk = 'Y'
	else
		ls_c_chk = 'N'
	end if
	dw_9.object.c_chk[1] = ls_c_chk
	dw_9.object.c_sno[1] = is_sno
	dw_9.object.c_sh[1] = is_sh
	dw_9.object.c_nm[1] = is_nm
	dw_9.object.c_js[1] = is_js
	dw_9.object.c_type[1] = is_type
	dw_9.object.c_code[1] = is_code
end if

dw_9.object.cust_name[1] = ls_cust_name
dw_9.object.cap_name[1] = ls_cap_name
dw_9.object.addr[1] = ls_addr
dw_9.object.ind_type[1] = ls_ind_type
dw_9.object.ind_item[1] = ls_ind_item
dw_9.object.inv_no[1] = dw_2.object.aroiinv_no[1]
//dw_9.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYY MM DD") // 윗줄
ld_amount = dw_2.object.aroiinv_cash[1] + dw_2.object.ship_cost[1] - dw_2.object.discount[1]

dw_9.object.cash[1] = string(ld_amount, '#########0') 
IF dw_2.object.aroiinv_rate[1] <> 0 then
   ld_rate = dw_2.object.aroiinv_rate[1] + (dw_2.object.ship_cost[1] / 10) - truncate(dw_2.object.discount[1] / 10, 0)
   dw_9.object.vat[1] = string(ld_rate, '########0') 
else
// 2005/10/11 future21 : YSP운송비에 대한 부가세 문제로 수정(아래 주석라인까지.)
	if dw_2.object.aroiinv_cash[1] <> 0 then
	   ld_rate = dw_2.object.aroiinv_rate[1]
	   dw_9.object.vat[1] = string(ld_rate, '########0') 
	else 
	   ld_rate = dw_2.object.aroiinv_rate[1] + (dw_2.object.ship_cost[1] / 10) - truncate(dw_2.object.discount[1] / 10, 0)
	   dw_9.object.vat[1] = string(ld_rate, '########0') 
	end if	
//   ld_rate = dw_2.object.aroiinv_rate[1]
//   dw_9.object.vat[1] = string(ld_rate, '########0') 
end if
//dw_9.object.vat[1] = string(dw_2.object.aroiinv_rate[1], '########0') 

ll_count = LenA(trim(dw_9.object.cash[1]))
if cbx_2.checked = false then
	dw_9.object.mon[1] = integer(MidA(dw_9.object.inv_date[1], 6, 2))
	dw_9.object.day[1] = integer(MidA(dw_9.object.inv_date[1], 9, 2))
	ll_count = 10 - ll_count
else
	dw_9.object.mon[1] = integer(MidA(dw_9.object.inv_date[1], 5, 2))
	dw_9.object.day[1] = integer(MidA(dw_9.object.inv_date[1], 7, 2))
	ll_count = 11 - ll_count
end if

dw_9.object.sp_cnt[1] = string(ll_count) 
IF dw_2.object.inv_type[1] = 'Y' THEN
	ls_item_no = dw_5.object.item_no[1]
	SELECT item_name INTO :ls_item_name FROM groupitem
	   WHERE item_no = :ls_item_no;
	IF dw_5.rowcount() > 1 THEN
//    1999.1.25 ls_item_name을 m-bar외 로 수정		
      dw_9.object.item_name[1] = trim(ls_item_name) + ' 외'
//      dw_9.object.item_name[1] = "자재대 외"
	ELSE
      dw_9.object.item_name[1] = trim(ls_item_name) 
	END IF
ELSE
   dw_9.object.item_name[1] = "물품대 "
END IF
dw_9.object.cash1[1] = string(ld_amount, '#,###,###,##0') 
IF dw_2.object.aroiinv_rate[1] <> 0 then
   dw_9.object.vat1[1] = string(ld_rate, '####,###,##0') 
	ld_total = ld_amount + ld_rate
else
   dw_9.object.vat1[1] = string(ld_rate, '####,###,##0') 
	ld_total = ld_amount + ld_rate
end if
//dw_9.object.vat1[1] = string(dw_2.object.aroiinv_rate[1], '####,###,##0') 
//ld_total = ld_amount + dw_2.object.aroiinv_rate[1]
dw_9.object.total[1] = string(ld_total, '#,###,###,##0') 

l_print.st_datawindow = dw_9
l_print.st_print_sheet = " 프린트용지 : 세금계산서"
l_print.st_print_desc = " 이 프로그램은 세금계산서를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

event pb_save::clicked;long ll_row, ll_row1, ll_find, ll_year
integer li_seq, li_count, li_seq_no
string ls_do_no, ls_do_no1, ls_cust_no, ls_month, ls_aroi_date
string ls_area, ls_aroi_no, ls_aroi_no1, ls_seq
decimal lr_total

if dw_2.getrow() < 1 then
	return
elseif messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
elseif wf_nullchk(dw_2) = false then
	return
elseif rb_1.checked = true then
	for ll_row = 1 to dw_4.rowcount()
		if dw_4.object.pick[ll_row] = 'Y' then
			li_count = li_count + 1
		end if
	next
	if li_count <= 0 then
		messagebox("확인","선정된 물품이 없습니다!",information!)
		return
	end if
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
dw_2.accepttext()
dw_4.accepttext()
dw_7.accepttext()

if ( (truncate(dw_2.object.aroiinv_cash[1] * 0.1 + 0.0000001, 0) - 1) > dw_2.object.aroiinv_rate[1] &
  or (truncate(dw_2.object.aroiinv_cash[1] * 0.1 + 0.0000001, 0) + 1) < dw_2.object.aroiinv_rate[1]) &
  and not( dw_4.object.compute_2[1] = 0 and dw_2.object.aroiinv_rate[1] = 0) then
	messagebox("경고", "부가세가 매출금액의 10%의 (±1원) 범위를 벗어 날수 없습니다.")
	return
end if

//매출코드 자동 부여
ls_area = MidA(dw_2.object.inv_area[1], 1, 1)
ls_aroi_date = string(dw_2.object.oi_date[1], "yyyymm")
ls_aroi_no1 = ls_area + is_sale_flag + ls_aroi_date + '-' + '%'
				
SELECT MAX(aroiinv_no) INTO :ls_aroi_no
  FROM aroiinv
 WHERE aroiinv_no LIKE :ls_aroi_no1;
			
if isnull(ls_aroi_no) or ls_aroi_no = '' then
	ls_aroi_no1 = ls_area + is_sale_flag + ls_aroi_date + '-' + '001'
else
	li_seq_no = integer(MidA(ls_aroi_no, 10, 3))
	li_seq_no = li_seq_no + 1
	ls_seq = '00' + string(li_seq_no)
	ls_aroi_no1 = LeftA(ls_aroi_no1, 9) + RightA(ls_seq, 3)
end if

dw_2.object.aroiinv_no[1] = ls_aroi_no1

if dw_4.rowcount() > 0 then
	
	for ll_row = 1 to dw_4.rowcount() 
		if dw_4.object.pick[ll_row] = 'Y' then
			//선매출수량
			dw_4.object.aroi_qty[ll_row] = dw_4.object.aroi_qty[ll_row] + dw_4.object.a_qty[ll_row]
			
			//판매매출관리 detail 			
			ll_row1 = dw_5.insertrow(0)
			dw_5.object.aroiinv_no[ll_row1] = ls_aroi_no1
			li_seq = li_seq + 1
			dw_5.object.seq_no[ll_row1] = li_seq
			dw_5.object.do_no[ll_row1] = dw_4.object.do_no[ll_row] 
			ls_do_no1 = dw_4.object.do_no[ll_row] 
			dw_5.object.oi_no[ll_row1] = dw_4.object.oi_no[ll_row]
			dw_5.object.item_no[ll_row1] = dw_4.object.item_no[ll_row]
			dw_5.object.qa[ll_row1] = dw_4.object.qa[ll_row]
			dw_5.object.uom[ll_row1] = dw_4.object.uom[ll_row]
			dw_5.object.ship_qty[ll_row1] = dw_4.object.a_qty[ll_row] 
			dw_5.object.price[ll_row1] = dw_4.object.a_price[ll_row]
			dw_5.object.rate_cash[ll_row1] = dw_4.object.vat[ll_row]
			dw_5.object.ori_amount[ll_row1] = dw_4.object.amt[ll_row]
			dw_5.object.sale_no[ll_row1] = dw_4.object.sale_no[ll_row]
			dw_5.object.dc_rate[ll_row1] = dw_4.object.c_an[ll_row]
			
			//do table update
			if li_seq = 1 then
				ls_do_no = dw_4.object.do_no[ll_row]
				ll_find = dw_6.find("do_no = '" + ls_do_no + "'",1, dw_6.rowcount())
				dw_6.object.invoice_print[ll_find] = 'Y'
			elseif ls_do_no <> ls_do_no1 then
				ll_find = dw_6.find("do_no = '" + ls_do_no1 + "'",1, dw_6.rowcount())
				dw_6.object.invoice_print[ll_find] = 'Y'
				ls_do_no = ls_do_no1
			end if
		end if
		

	next
end if

if dw_7.rowcount() > 0 then  //운송비가 적용된 출고번호에 대해 do table update
	for ll_row = 1 to dw_7.rowcount()
		if dw_7.object.pick[ll_row] = 'Y' then
			dw_7.object.do_inv_no[ll_row] = ls_aroi_no1
		end if
	next
end if

lr_total = dw_2.object.c_vat[1]
ls_cust_no = dw_1.object.cust_no[dw_1.getrow()]

//if lr_total <> 0 then
//	//에누리금액만큼 CUSTOMER TABLE의 미수금액 차감
//	UPDATE customer SET balance_amt = balance_amt - :lr_total
//	 WHERE cust_no = :ls_cust_no;
//
//
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if		
//
////	ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
////	ls_month = string(dw_2.object.oi_date[1], 'mm')
////
////	if wf_opeom_update(ls_cust_no, ll_year, ls_month, lr_total) = false then
////		rollback;
////		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
////		return
////	end if		
//end if

if rb_1.checked = true then
	dw_2.accepttext()
	dw_4.accepttext()
	dw_5.accepttext()
	dw_6.accepttext()
	dw_7.accepttext()

	if wf_update5(dw_2,dw_4,dw_5,dw_6,dw_7,'N') = true then
      IF MessageBox("확인", "생성된 매출번호는 " + ls_aroi_no1 + " 입니다." + &
                 "~r~n세금계산서를 출력하시겠습니까?", Question!, OKCancel!, 1) = 1 THEN
         this.triggerevent("aroi_print")
      END IF	
		dw_2.reset()
		dw_4.reset()
		dw_5.reset()
		dw_6.reset()
		dw_7.reset()
	else
		messagebox("저장오류","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
else
	dw_2.accepttext()
	dw_2.object.rem_amt[1] = dw_2.object.aroiinv_cash[1] + dw_2.object.aroiinv_rate[1] //매출금액을 선매출금액에 insert
	dw_2.accepttext()
	if wf_update1(dw_2,'N') = true then
      IF MessageBox("확인", "생성된 매출번호는 " + ls_aroi_no1 + " 입니다." + &
                 "~r~n세금계산서를 출력하시겠습니까?", Question!, OKCancel!, 1) = 1 THEN
         this.triggerevent("aroi_print")
      END IF	
		dw_2.reset()
	else
		messagebox("저장오류","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
end if
			
end event

type dw_1 from w_inheritance`dw_1 within w_osaroi_m
integer x = 59
integer y = 456
integer width = 859
integer height = 92
integer taborder = 30
string dataobject = "d_oscustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;dw_2.reset()
if dw_4.rowcount() > 0 then
	dw_4.reset()
end if

end event

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

type dw_2 from w_inheritance`dw_2 within w_osaroi_m
integer x = 992
integer y = 248
integer width = 2583
integer height = 488
integer taborder = 60
string dataobject = "d_osaroi_m"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;long ll_row, ll_rate, ll_price, ll_dc, ll_row1, ll_data
decimal lr_amount, lr_vat, lr_exp_rate, lr_amt, lr_dc
datetime ldt_oi_date
string ls_curr_code, ls_data

this.accepttext()
choose case dwo.name
	case 'oi_date'
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date = this.object.oi_date[1]
			ls_curr_code = this.object.curr_code[1]
						
			SELECT exp_rate INTO :lr_exp_rate
			  FROM currency
			 WHERE curr_code = :ls_curr_code
			 	AND curr_date = :ldt_oi_date;
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_cur_rate[1] = 1
			else
				this.object.gl_cur_rate[1] = lr_exp_rate
			end if
			dw_2.object.gl_cur_rate.tabsequence = 1
			dw_2.object.gl_cur_rate.background.color = 1087434968
		end if

	case 'c_aroi_chk'
		ls_data = data
		IF ls_data = 'Y' then
         ll_dc = dw_2.object.c_rate[1]
   		if rb_1.checked = true then
			   for ll_row1 = 1 to dw_4.rowcount()
					dw_4.object.pick[ll_row1] = 'Y'
					dw_4.object.a_qty[ll_row1] = dw_4.object.ship_qty[ll_row1] - dw_4.object.aroi_qty[ll_row1]
					dw_4.object.a_price[ll_row1] = dw_4.object.price[ll_row1]
					if is_sale_flag = 'E' then
						dw_4.object.a_price.TabSequence = 30
						dw_4.object.a_price.background.color = 1087434968
						dw_4.object.a_price.protect = 0
					else 
						dw_4.object.a_price.TabSequence = 0
						dw_4.object.a_price.background.color = 78682240
				      dw_4.object.a_price.protect = 1
					end if
				next
		  	end if
		else
         dw_2.object.c_rate[1] = 0
			for ll_row1 = 1 to dw_4.rowcount()
				dw_4.object.pick[ll_row1] = 'N'
				dw_4.object.a_qty[ll_row1] = 0
				dw_4.object.a_price[ll_row1] = 0 
				dw_4.object.c_an[ll_row1] = 0
				dw_4.object.vat[ll_row1] = 0
				dw_4.object.a_price.TabSequence = 0
				dw_4.object.a_price.background.color = 78682240
				dw_4.object.a_price.protect = 1
			next
		end if
		wf_calc()

//   case 'c_rate'
//		ll_data = long(data)
//  		if rb_1.checked = true then
//   	   for ll_row1 = 1 to dw_4.rowcount()
//				dw_4.object.c_an[ll_row1] = ll_data				
//	     		lr_amount = lr_amount + dw_4.object.amt[ll_row1] - truncate((dw_4.object.amt[ll_row1] * dw_4.object.c_an[ll_row1] / 100), 0 )
//	      	lr_vat = lr_vat + dw_4.object.vat[ll_row1] - truncate((dw_4.object.vat[ll_row1] * dw_4.object.c_an[ll_row1] / 100), 0 )
//   		   lr_amt = lr_amt + dw_4.object.amt[ll_row1]
//   		   lr_dc = lr_dc + dw_4.object.vat[ll_row1]
//	      next
//			
//		   IF dw_2.object.curr_code[1] = 'WON' then
//	         dw_2.object.aroiinv_cash[1] = lr_amount
//            dw_2.object.aroiinv_rate[1] = lr_vat
//	         dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
//	         dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
//   	   else
//	         dw_2.object.aroiinv_cash[1] = lr_amount
//    		   dw_2.object.aroiinv_rate[1] = lr_vat 
//		      dw_2.object.dc[1] = lr_amt - lr_amount
//   		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
//	      end if
//	   end if

	case 'aroiinv_cash'
		if is_sale_flag = 'D' and rb_2.checked = true then
			this.object.aroiinv_rate[1] = truncate(this.object.aroiinv_cash[1] * 0.1 ,0)
		end if
		
end choose
		
end event

event dw_2::losefocus;call super::losefocus;this.accepttext()

end event

type st_title from w_inheritance`st_title within w_osaroi_m
integer x = 37
integer y = 44
integer width = 1120
string text = "판매매출관리"
end type

type st_tips from w_inheritance`st_tips within w_osaroi_m
end type

type pb_compute from w_inheritance`pb_compute within w_osaroi_m
integer x = 2994
integer taborder = 140
end type

event pb_compute::clicked;st_aroi_s lst_aroi
string ls_cust_no
date ld_sdate, ld_edate
decimal lr_del
long ll_row

if dw_4.rowcount() < 1 then return
if rb_2.checked = true then return

ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	

if isnull(is_sale_flag) or is_sale_flag = '' then
	messagebox("확인","매출유형을 선택하세요!",information!)
	ddlb_1.setfocus()
	return
elseif isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","출고기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_7.rowcount() < 1 then	
	dw_7.retrieve(ls_cust_no, ld_sdate, ld_edate, is_sale_flag)

	if dw_7.rowcount() < 1 then
		messagebox("확인","운송비가 이미 모두 세금계산서에 반영되었습니다.",information!)
		return
	end if
end if

lst_aroi.name = 'd_osaroi_s'
lst_aroi.dw_object = dw_7

openwithparm(w_osaroi_m1, lst_aroi)

lst_aroi = message.powerobjectparm

if lst_aroi.flag = 'N' then return

dw_7.accepttext()

for ll_row = 1 to dw_7.rowcount()
	if dw_7.object.pick[ll_row] = 'Y' &
		and ( dw_7.object.do_shipamt_case[ll_row] = 'R' &
				or dw_7.object.do_shipamt_case[ll_row] = '' &
				or isnull(dw_7.object.do_shipamt_case[ll_row])) then
		lr_del = lr_del + dw_7.object.ship_amount[ll_row]
	end if
next

dw_2.setitem(1, "ship_cost", lr_del)

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"운송비",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_osaroi_m
integer x = 1783
integer y = 44
integer width = 599
integer taborder = 120
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "  수주번호로  거래명세서 조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;//w_whsaledodet_w
end event

event pb_print_part::clicked;ws_process st_process
OpenWithParm(w_whsaledodet_w, st_process)

end event

type pb_close from w_inheritance`pb_close within w_osaroi_m
integer x = 3378
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroi_m
boolean visible = false
integer x = 2930
integer taborder = 80
end type

event pb_print::clicked;call super::clicked;//w_repsuper w_print
//
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroi_m
boolean visible = false
integer x = 2427
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_osaroi_m
boolean visible = false
integer x = 2738
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_osaroi_m
integer x = 2802
integer taborder = 70
end type

event pb_insert::clicked;string ls_cust_no, ls_register_no, ls_curr_code
date ld_sdate, ld_edate

ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")

if isnull(is_sale_flag) or is_sale_flag = '' then
	messagebox("확인","매출유형을 선택하세요!", information!)
	ddlb_1.setfocus()
	return
elseif isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","거래처를 선택하세요!", information!)
	dw_1.setfocus()
	return
end if

ls_register_no = idwc_cust.getitemstring(idwc_cust.getrow(), "register_no")
ls_curr_code = idwc_cust.getitemstring(idwc_cust.getrow(), "curr_code")
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	
select round into :is_round from customer
 where cust_no = :ls_cust_no;
if isnull(is_round) then is_round = 'N'
if rb_1.checked = true then
	if em_1.text = '' then
		messagebox("확인","출고기간을 입력하세요!",information!)
		em_1.setfocus()
		return
	elseif em_2.text = '' then
		messagebox("확인","출고기간을 입력하세요!",information!)
		em_2.setfocus()
		return
	elseif ld_sdate > ld_edate then
		messagebox("확인","출고기간을 잘못입력하셨습니다!",information!)
		em_1.setfocus()
		return
	end if
	
	dw_2.reset()
	dw_4.reset()
	
	dw_2.insertrow(0)
	dw_2.object.cust_no[1] = ls_cust_no
	dw_2.object.sale_flag[1] = is_sale_flag
	dw_2.object.register_no[1] = trim(ls_register_no)
	dw_2.object.curr_code[1] = ls_curr_code
	dw_2.object.inv_type[1] = 'Y'
	dw_2.object.sys_date[1] = gf_today() //wf_today()
	dw_2.object.oi_date[1] = datetime(date(em_2.text))
	dw_2.object.login_id[1] = gs_userid
	dw_2.object.c_vat_flag[1] = is_sale_flag	

	if ls_curr_code = 'WON' then
		dw_4.dataobject = 'd_osaroi_m1'
		dw_4.settransobject(sqlca)
	else
		dw_4.dataobject = 'd_osaroi_m2'
		dw_4.settransobject(sqlca)
	end if
	
//	dw_2.object.c_rate.tabsequence = 1
//	dw_2.object.c_rate.background.color = 1087434968
	dw_2.object.c_aroi_chk.tabsequence = 1
	dw_2.object.c_aroi_chk.background.color = 1087434968
	dw_2.object.aroiinv_cash.tabsequence = 0
	dw_2.object.aroiinv_cash.background.color = 78682240
//	dw_2.object.ship_cost.tabsequence = 0 
//	dw_2.object.ship_cost.background.color = 78682240

	dw_2.object.aroiinv_rate.tabsequence = 100
	dw_2.object.aroiinv_rate.background.color = 1087434968


	dw_4.retrieve(ls_cust_no, ld_sdate, ld_edate, is_sale_flag)
	dw_6.retrieve(ls_cust_no, ld_sdate, ld_edate, is_sale_flag)
else
	dw_2.reset()
	if dw_4.rowcount() > 0 then
		dw_4.reset()
	end if
	dw_2.insertrow(0)
	dw_2.object.cust_no[1] = ls_cust_no
	dw_2.object.sale_flag[1] = is_sale_flag	
	dw_2.object.register_no[1] = trim(ls_register_no)
	dw_2.object.curr_code[1] = ls_curr_code
	dw_2.object.inv_type[1] = 'N'
	dw_2.object.sys_date[1] = gf_today() //wf_today()
	dw_2.object.oi_date[1] = datetime(date(string(today(), 'yyyy/mm/dd')))
	dw_2.object.login_id[1] = gs_userid
	dw_2.object.c_vat_flag[1] = is_sale_flag		

//	dw_2.object.c_rate.tabsequence = 0
//	dw_2.object.c_rate.background.color = 78682240
	dw_2.object.c_aroi_chk.tabsequence = 0
	dw_2.object.c_aroi_chk.background.color = 78682240
	dw_2.object.aroiinv_cash.tabsequence = 1
	dw_2.object.aroiinv_cash.background.color = 1087434968
//	dw_2.object.ship_cost.tabsequence = 1 
//	dw_2.object.ship_cost.background.color = 1087434968
end if

dw_7.reset()
dw_2.setfocus()
dw_2.setcolumn("oi_date")
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroi_m
boolean visible = false
integer x = 1851
integer taborder = 170
end type

type gb_3 from w_inheritance`gb_3 within w_osaroi_m
integer x = 969
integer y = 212
integer width = 2629
integer height = 536
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_osaroi_m
integer x = 27
integer y = 216
integer width = 521
integer height = 152
integer taborder = 0
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_osaroi_m
integer x = 2779
integer width = 809
integer taborder = 0
end type

type gb_7 from groupbox within w_osaroi_m
integer x = 549
integer y = 220
integer width = 398
integer height = 152
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "매출유형"
end type

type gb_6 from groupbox within w_osaroi_m
integer x = 27
integer y = 588
integer width = 919
integer height = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "출고기간"
end type

type gb_5 from groupbox within w_osaroi_m
integer x = 27
integer y = 400
integer width = 919
integer height = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "판매거래처"
end type

type dw_4 from datawindow within w_osaroi_m
event ue_1 ( )
integer x = 27
integer y = 764
integer width = 3570
integer height = 1356
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_osaroi_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_1();wf_calc()
end event

event itemchanged;long ll_price, ll_rate, ll_row
decimal lr_amount, lr_vat, lr_amt, lr_dc

dw_2.accepttext()
this.accepttext()


choose case dwo.name
	case 'pick'
		if data = 'Y' then
			dw_4.object.a_qty[dw_4.getrow()] = dw_4.object.ship_qty[dw_4.getrow()] - dw_4.object.aroi_qty[dw_4.getrow()]
			dw_4.object.a_price[dw_4.getrow()] = dw_4.object.price[dw_4.getrow()]
//			dw_4.object.c_an[dw_4.getrow()] = ii_an
			if is_sale_flag = 'E' then
				dw_4.object.a_price.TabSequence = 30
				dw_4.object.a_price.background.color = 1087434968
				dw_4.object.a_price.protect = 0
			else 
				dw_4.object.a_price.TabSequence = 0
				dw_4.object.a_price.background.color = 78682240
				dw_4.object.a_price.protect = 1
			end if
		else
			dw_4.object.a_qty[dw_4.getrow()] = 0
			dw_4.object.a_price[dw_4.getrow()] = 0 
			dw_4.object.c_an[dw_4.getrow()] = 0
			dw_4.object.vat[dw_4.getrow()] = 0
			dw_4.object.a_price.TabSequence = 0
			dw_4.object.a_price.background.color = 78682240
			dw_4.object.a_price.protect = 1
		end if
		this.postevent('ue_1')
//		
//		dw_4.accepttext()
//		for ll_row = 1 to dw_4.rowcount()
//			if dw_4.object.pick[ll_row] = 'Y' then
//				lr_amount = lr_amount + dw_4.object.amt[ll_row] // - truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//				lr_vat = lr_vat + dw_4.object.vat[ll_row] // - truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//				lr_amt = lr_amt + dw_4.object.amt[ll_row]
//				lr_dc = lr_dc + dw_4.object.vat[ll_row]
//			end if
//		next
		
//		ll_row = dw_4.getrow()
//		lr_amount = lr_amount + dw_4.object.amt[ll_row] - truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//		lr_vat = lr_vat + dw_4.object.vat[ll_row] - truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
//		lr_amt = lr_amt + dw_4.object.amt[ll_row]
//		lr_dc = lr_dc + dw_4.object.vat[ll_row]

//		IF dw_2.object.curr_code[1] = 'WON' then
//		   dw_2.object.aroiinv_cash[1] = round(lr_amount + 0.4999 ,0)
//  		   dw_2.object.aroiinv_rate[1] = round(lr_vat + 0.4999, 0)
//		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
//		   dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
//		else
//		   dw_2.object.aroiinv_cash[1] = lr_amount
//  		   dw_2.object.aroiinv_rate[1] = lr_vat 
//		   dw_2.object.dc[1] = lr_amt - lr_amount
//		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
//	   end if
		
	case 'a_qty'
		dw_4.accepttext()
		//출고수량과 매출수량 비교
		ll_row = dw_4.getrow()
		if dw_4.object.a_qty[ll_row] > dw_4.object.ship_qty[ll_row] - dw_4.object.aroi_qty[ll_row] then
			messagebox("확인","매출수량이 출고할 수량을 초과하였습니다!",exclamation!)
			return 1
		end if
		this.postevent('ue_1')
	case 'a_price'
		this.postevent('ue_1')
	case 'c_an'
		this.postevent('ue_1')
//		ii_an = dw_4.object.c_an[dw_4.getrow()]
end choose

end event

event itemerror;long ll_row
decimal lr_amount, lr_vat

ll_row = this.getrow()
this.object.a_qty[ll_row] = this.object.ship_qty[ll_row] - this.object.aroi_qty[ll_row]

for ll_row = 1 to this.rowcount()
	 lr_amount = lr_amount + this.object.amt[ll_row]
	 lr_vat = lr_vat + this.object.vat[ll_row]
next
dw_2.object.aroiinv_cash[1] = lr_amount
dw_2.object.aroiinv_rate[1] = lr_vat

return 2
end event

event losefocus;this.accepttext()

end event

type rb_1 from radiobutton within w_osaroi_m
integer x = 41
integer y = 272
integer width = 215
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "매출"
boolean checked = true
end type

event clicked;em_1.enabled = true
em_2.enabled = true
dw_2.reset()
end event

type rb_2 from radiobutton within w_osaroi_m
integer x = 261
integer y = 272
integer width = 274
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "선매출"
end type

event clicked;em_1.enabled = false
em_2.enabled = false
dw_2.reset()
if dw_4.rowcount() > 0 then
	dw_4.reset()
end if
end event

type em_1 from editmask within w_osaroi_m
integer x = 46
integer y = 644
integer width = 411
integer height = 84
integer taborder = 40
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_osaroi_m
integer x = 503
integer y = 644
integer width = 411
integer height = 84
integer taborder = 50
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_osaroi_m
integer x = 462
integer y = 660
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

type dw_6 from datawindow within w_osaroi_m
boolean visible = false
integer x = 1993
integer y = 48
integer width = 187
integer height = 144
boolean bringtotop = true
string dataobject = "d_osaroi_h1"
boolean livescroll = true
end type

type ddlb_1 from dropdownlistbox within w_osaroi_m
integer x = 581
integer y = 272
integer width = 334
integer height = 288
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"내수","수출","L/C"}
end type

event selectionchanged;choose case index
	case 1
		is_sale_flag = 'D'
		cbx_1.visible = false
		cbx_1.checked = false
	case 2
		is_sale_flag = 'E'
		cbx_1.visible = true
	case 3
		is_sale_flag = 'L'
		cbx_1.visible = false
		cbx_1.checked = false
end choose

if dw_2.rowcount() > 0 then
	dw_2.reset()
	dw_4.reset()
end if
end event

type dw_7 from datawindow within w_osaroi_m
boolean visible = false
integer x = 2341
integer y = 36
integer width = 187
integer height = 144
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_osaroi_s"
boolean livescroll = true
end type

type dw_9 from datawindow within w_osaroi_m
string tag = "d_osaroi_r1_2"
boolean visible = false
integer x = 2181
integer y = 64
integer width = 169
integer height = 124
integer taborder = 110
boolean bringtotop = true
string title = "d_osaroi_r"
string dataobject = "d_osaroi_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_osaroi_m
integer x = 1193
integer y = 132
integer width = 558
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "부가세 0 으로"
end type

event clicked;integer li_row, li_rowcnt

li_rowcnt = dw_4.RowCount()

if cbx_1.checked = false or li_rowcnt < 1 then 
	return
end if


for li_row = 1 to li_rowcnt
	if dw_4.object.pick[li_row] = 'Y' then
		dw_4.object.vat[li_row] = 0
	end if
next

dw_4.accepttext()
wf_calc()


end event

type dw_5 from datawindow within w_osaroi_m
boolean visible = false
integer x = 891
integer y = 556
integer width = 2642
integer height = 616
boolean bringtotop = true
string dataobject = "d_osaroi_h"
boolean livescroll = true
end type

type cbx_2 from checkbox within w_osaroi_m
integer x = 1193
integer y = 48
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "신 양식"
boolean checked = true
end type

event clicked;if cbx_2.checked = false then
	dw_9.dataobject = 'd_osaroi_r'
else
	dw_9.dataobject = 'd_osaroi_r1_2'
end if
dw_9.settransobject(sqlca)

end event

type pb_1 from picturebutton within w_osaroi_m
event mousemove pbm_mousemove
integer x = 2578
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
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
if dw_4.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw_4.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_4.SaveAs(ls_DocName, CSV!, TRUE)
      end if
end if



end event

type cbx_source from checkbox within w_osaroi_m
integer x = 3616
integer y = 236
integer width = 736
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "공급자 선택변경"
end type

event clicked;string ls_loc
long   ll_row

if this.checked = true then
	dw_source.retrieve()
	dw_source.visible = true
	
	if gf_permission('거래명세서_기본공급자', gs_userid) = 'Y' then
		SELECT bigo INTO :ls_loc FROM codemst
		 WHERE type = '거래명세서_기본공급자' AND item_cd = :gs_userid;
		choose case ls_loc
			case "S", "B"
				ll_row = 1
			case "D"
				ll_row = 8
			case "H"
				ll_row = 2
		end choose
		dw_source.Object.c_chk[ll_row] = 'Y'
		dw_source.ScrollToRow(ll_row)			
		is_sno  = dw_source.object.reg_r[ll_row]
		is_sh   = dw_source.object.part_name[ll_row]
		is_nm   = dw_source.object.captain_name[ll_row]
		is_js   = dw_source.object.addr[ll_row]
		is_type = dw_source.object.indust_type[ll_row]
		is_code = dw_source.object.indust_code[ll_row]
		
		// 도로명주소 가져오기
		if dw_2.object.oi_date[1] < "2014/01/01" then
		else
			is_sno  = "1 0 9 - 8 6  - 3 7 9 1 0"   // dw_source.object.reg_r[ll_row]
			is_sh   = "(주)송천건업"					// dw_source.object.part_name[ll_row]
			is_nm   = "이명섭"							// dw_source.object.captain_name[ll_row]
			is_js   = "서울특별시 강서구 강서로41길 12 (화곡동)"	// dw_source.object.addr[ll_row]
		   is_type = "부동산외"						   // dw_source.object.indust_type[ll_row]
		   is_code = "임대외"						   // dw_source.object.indust_code[ll_row]
		end if		
	end if	
else
	dw_source.visible = false
	is_sno = ''
	is_sh  = ''
	is_nm  = ''
	is_js  = ''
end if

end event

type dw_source from datawindow within w_osaroi_m
integer x = 3616
integer y = 300
integer width = 937
integer height = 444
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiglpart_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;integer li_i
choose case dwo.name
	case 'c_chk'
		if data = 'Y' then
			for li_i = 1 to this.rowcount()
				if li_i = row then
					is_sno = this.object.reg_r[li_i]
					is_sh = this.object.part_name[li_i]
					is_nm = this.object.captain_name[li_i]
					is_js = this.object.addr[li_i]
					is_type = this.object.indust_type[li_i]
					is_code = this.object.indust_code[li_i]
					continue
				end if
				this.object.c_chk[li_i] = 'N'
			next
		end if
end choose


end event

