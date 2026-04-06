$PBExportHeader$w_osaroiup_m.srw
$PBExportComments$판매매출수정 및 취소(1998/04/15, 정재수)
forward
global type w_osaroiup_m from w_inheritance
end type
type dw_3 from datawindow within w_osaroiup_m
end type
type dw_4 from datawindow within w_osaroiup_m
end type
type em_1 from editmask within w_osaroiup_m
end type
type em_2 from editmask within w_osaroiup_m
end type
type cbx_1 from checkbox within w_osaroiup_m
end type
type pb_1 from picturebutton within w_osaroiup_m
end type
type dw_5 from datawindow within w_osaroiup_m
end type
type cbx_source from checkbox within w_osaroiup_m
end type
type dw_source from datawindow within w_osaroiup_m
end type
type cbx_vat from checkbox within w_osaroiup_m
end type
type dw_7 from datawindow within w_osaroiup_m
end type
type dw_8 from datawindow within w_osaroiup_m
end type
type dw_9 from datawindow within w_osaroiup_m
end type
type cbx_all from checkbox within w_osaroiup_m
end type
type st_4 from statictext within w_osaroiup_m
end type
type st_5 from statictext within w_osaroiup_m
end type
type st_vertical1 from u_splitbar_vertical within w_osaroiup_m
end type
type st_horizontal from u_splitbar_horizontal within w_osaroiup_m
end type
type st_vertical2 from u_splitbar_vertical within w_osaroiup_m
end type
end forward

global type w_osaroiup_m from w_inheritance
integer x = 37
integer y = 136
integer width = 4617
integer height = 2300
string title = "세금계산서 수정 및 취소(w_osaroiup_m)"
boolean resizable = false
long backcolor = 79219928
dw_3 dw_3
dw_4 dw_4
em_1 em_1
em_2 em_2
cbx_1 cbx_1
pb_1 pb_1
dw_5 dw_5
cbx_source cbx_source
dw_source dw_source
cbx_vat cbx_vat
dw_7 dw_7
dw_8 dw_8
dw_9 dw_9
cbx_all cbx_all
st_4 st_4
st_5 st_5
st_vertical1 st_vertical1
st_horizontal st_horizontal
st_vertical2 st_vertical2
end type
global w_osaroiup_m w_osaroiup_m

type variables
st_print i_print
datawindowchild idwc_cust
string  is_update_flag
st_aroiup_amt ist_amt
string is_sno, is_sh, is_nm, is_js, is_type, is_code
end variables

forward prototypes
public subroutine wf_calc ()
public subroutine wf_ret ()
public subroutine wf_calc2 ()
end prototypes

public subroutine wf_calc ();long  ll_row
decimal lr_amount, lr_vat, lr_amt, lr_dc

dw_4.accepttext()
for ll_row = 1 to dw_4.rowcount()
	lr_amount = lr_amount + dw_4.object.ori_amount[ll_row] //- truncate((dw_4.object.ori_amount[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
//	lr_vat = lr_vat + dw_4.object.rate_cash[ll_row] //- truncate((dw_4.object.rate_cash[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
	lr_amt = lr_amt + dw_4.object.ori_amount[ll_row]
//	lr_dc = lr_dc + dw_4.object.rate_cash[ll_row]
next

IF dw_2.object.curr_code[1] = 'WON' then
	dw_2.object.aroiinv_cash[1] = round(lr_amount + 0.4999 ,0)
//	dw_2.object.aroiinv_rate[1] = round(lr_vat + 0.4999, 0)
	if round(lr_amount + 0.4999 ,0) > 0 then
		lr_vat =  truncate((round(lr_amount + 0.4999 ,0) / 10) + 0.0000001, 0)
		lr_dc  =  truncate((round(lr_amount + 0.4999 ,0) / 10) + 0.0000001, 0)
	else
		lr_vat =  truncate((round(lr_amount + 0.4999 ,0) / 10) - 0.0000001, 0) 
		lr_dc  =  truncate((round(lr_amount + 0.4999 ,0) / 10) - 0.0000001, 0) 
	end if
	dw_2.object.aroiinv_rate[1] =  lr_vat 

	dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
	dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
else
	dw_2.object.aroiinv_cash[1] = lr_amount
//	dw_2.object.aroiinv_rate[1] = lr_vat 
	if round(lr_amount + 0.4999 ,0) > 0 then
		lr_vat =  truncate((lr_amount / 10) + 0.0000001, 0)
		lr_dc  =  truncate((lr_amount / 10) + 0.0000001, 0)
	else
		lr_vat =  truncate((lr_amount / 10) - 0.0000001, 0) 
		lr_dc  =  truncate((lr_amount / 10) - 0.0000001, 0) 
	end if
	dw_2.object.aroiinv_rate[1] =  lr_vat 

	dw_2.object.dc[1] = lr_amt - lr_amount
	dw_2.object.dc_rate[1] = lr_dc - lr_vat
end if

// 2007-12-05 부가세 계산 방식 변경.
//long  ll_row
//decimal lr_amount, lr_vat, lr_amt, lr_dc
//
//dw_4.accepttext()
//for ll_row = 1 to dw_4.rowcount()
//	lr_amount = lr_amount + dw_4.object.ori_amount[ll_row] //- truncate((dw_4.object.ori_amount[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
//	lr_vat = lr_vat + dw_4.object.rate_cash[ll_row] //- truncate((dw_4.object.rate_cash[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
//	lr_amt = lr_amt + dw_4.object.ori_amount[ll_row]
//	lr_dc = lr_dc + dw_4.object.rate_cash[ll_row]
//next
//IF dw_2.object.curr_code[1] = 'WON' then
//	dw_2.object.aroiinv_cash[1] = round(lr_amount + 0.4999 ,0)
//	dw_2.object.aroiinv_rate[1] = round(lr_vat + 0.4999, 0)
//	dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
//	dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
//else
//	dw_2.object.aroiinv_cash[1] = lr_amount
//	dw_2.object.aroiinv_rate[1] = lr_vat 
//	dw_2.object.dc[1] = lr_amt - lr_amount
//	dw_2.object.dc_rate[1] = lr_dc - lr_vat
//end if
//
end subroutine

public subroutine wf_ret ();//
date   ld_sdate, ld_edate
string ls_custno

debugbreak()
ld_sdate  = date(em_1.text)
ld_edate  = date(em_2.text)	

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

dw_1.accepttext()
ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	messagebox("확인","거래처 잘못입력하셨습니다!",information!)
	dw_1.setfocus()
	return
end if

dw_3.setredraw(false)
dw_2.setredraw(false)
dw_4.setredraw(false)
dw_3.reset()
dw_2.reset()
dw_4.reset()

dw_3.retrieve( ls_custno, ld_sdate, ld_edate)

dw_3.setredraw(true)
dw_2.setredraw(true)
dw_4.setredraw(true)
dw_3.setfocus()

end subroutine

public subroutine wf_calc2 ();// 2007-12-06 부가세 계산방식 기존대로.
long  ll_row
decimal lr_amount, lr_vat, lr_amt, lr_dc

dw_4.accepttext()
for ll_row = 1 to dw_4.rowcount()
	if dw_4.object.ori_amount[ll_row] < 0 then
		lr_amount = lr_amount + truncate(dw_4.object.ori_amount[ll_row] - 0.0000001,0) //- truncate((dw_4.object.ori_amount[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
		lr_vat = lr_vat + truncate(dw_4.object.rate_cash[ll_row] - 0.0000001,0) //- truncate((dw_4.object.rate_cash[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
		lr_amt = lr_amt + truncate(dw_4.object.ori_amount[ll_row] - 0.0000001,0)
		lr_dc = lr_dc + truncate(dw_4.object.rate_cash[ll_row] - 0.0000001,0)
	elseif dw_4.object.ori_amount[ll_row] > 0 then
		lr_amount = lr_amount + truncate(dw_4.object.ori_amount[ll_row] + 0.0000001,0) //- truncate((dw_4.object.ori_amount[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
		lr_vat = lr_vat + truncate(dw_4.object.rate_cash[ll_row] + 0.0000001,0)  //- truncate((dw_4.object.rate_cash[ll_row] * dw_4.object.c_dc[ll_row] / 100), 0 )
		lr_amt = lr_amt + truncate(dw_4.object.ori_amount[ll_row] + 0.0000001,0) 
		lr_dc = lr_dc + truncate(dw_4.object.rate_cash[ll_row] + 0.0000001,0) 
	end if
next
IF dw_2.object.curr_code[1] = 'WON' then
//	dw_2.object.aroiinv_cash[1] = round(lr_amount + 0.4999 ,0)
//	dw_2.object.aroiinv_rate[1] = round(lr_vat + 0.4999, 0)
	if lr_amount < 0 then
		dw_2.object.aroiinv_cash[1] = lr_amount //round(lr_amount - 0.4999 ,0)
	else
		dw_2.object.aroiinv_cash[1] = lr_amount //round(lr_amount + 0.4999 ,0)
	end if
	if lr_vat < 0 then
		dw_2.object.aroiinv_rate[1] = lr_vat //round(lr_vat - 0.4999, 0)
	else
		dw_2.object.aroiinv_rate[1] = lr_vat //round(lr_vat + 0.4999, 0)
	end if
	dw_2.object.dc[1] = lr_amt - lr_amount //truncate(lr_amt - lr_amount, 0)
	dw_2.object.dc_rate[1] = lr_dc - lr_vat //truncate(lr_dc - lr_vat, 0)
else
	dw_2.object.aroiinv_cash[1] = lr_amount
	dw_2.object.aroiinv_rate[1] = lr_vat 
	dw_2.object.dc[1] = lr_amt - lr_amount
	dw_2.object.dc_rate[1] = lr_dc - lr_vat
end if

end subroutine

on w_osaroiup_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.cbx_1=create cbx_1
this.pb_1=create pb_1
this.dw_5=create dw_5
this.cbx_source=create cbx_source
this.dw_source=create dw_source
this.cbx_vat=create cbx_vat
this.dw_7=create dw_7
this.dw_8=create dw_8
this.dw_9=create dw_9
this.cbx_all=create cbx_all
this.st_4=create st_4
this.st_5=create st_5
this.st_vertical1=create st_vertical1
this.st_horizontal=create st_horizontal
this.st_vertical2=create st_vertical2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.cbx_source
this.Control[iCurrent+9]=this.dw_source
this.Control[iCurrent+10]=this.cbx_vat
this.Control[iCurrent+11]=this.dw_7
this.Control[iCurrent+12]=this.dw_8
this.Control[iCurrent+13]=this.dw_9
this.Control[iCurrent+14]=this.cbx_all
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_vertical1
this.Control[iCurrent+18]=this.st_horizontal
this.Control[iCurrent+19]=this.st_vertical2
end on

on w_osaroiup_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.cbx_1)
destroy(this.pb_1)
destroy(this.dw_5)
destroy(this.cbx_source)
destroy(this.dw_source)
destroy(this.cbx_vat)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.dw_9)
destroy(this.cbx_all)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_vertical1)
destroy(this.st_horizontal)
destroy(this.st_vertical2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical1.of_set_leftobject(dw_3)
st_vertical1.of_set_rightobject(dw_2)
st_vertical1.of_set_rightobject(dw_4)
st_vertical1.of_set_minsize(250, 250)

st_vertical2.of_set_leftobject(dw_2)
st_vertical2.of_set_rightobject(dw_source)
st_vertical2.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_topobject(dw_source)
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

dw_5.visible = false
dw_7.visible = false
dw_8.visible = false
dw_9.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)

dw_5.settransobject(sqlca)
dw_4.sharedata(dw_5)
dw_source.settransobject(sqlca)
dw_source.visible = false

cbx_source.checked = true
is_sno = '' ; is_sh = '' ; is_nm = '' ; is_js = '' ; is_type = '' ; is_code = ''

// 10일 기준으로 전달 1일 ~ 전달 말일까지
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = string(today(), 'YYYY/MM/DD')
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")
end if

cbx_1.triggerevent(clicked!)	// 신 양식
dw_1.insertrow(0)

String ls_loc
IF GF_PERMISSION('거래명세서_기본공급자', gs_userid) = 'Y' THEN
	SELECT bigo INTO :ls_loc FROM codemst
	 WHERE type = '거래명세서_기본공급자' AND item_cd = :gs_userid;
	IF ls_loc  =  'S' or ls_loc  =  'D' or ls_loc  =  'H' or ls_loc  =  'B' THEN
		cbx_source.Checked  =  TRUE
		cbx_source.triggerevent(clicked!)
	ELSE
		cbx_source.Checked  =  FALSE
	END IF
	
	choose case gs_userid
		case '1999010s'
			cbx_vat.visible = true		// OLD사업장
	end choose
END IF

pb_save.enabled = false
if GF_PERMISSION("세금계산서_수정취소", gs_userid) = "Y" then
	pb_save.enabled = true
end if


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_3.height = newheight - dw_3.y - gb_3.x

st_vertical1.x      = dw_3.x + dw_3.width
st_vertical1.height = dw_3.height

dw_2.x      = st_vertical1.x + st_vertical1.width
 
st_vertical2.x      = dw_2.x + dw_2.width
st_vertical2.height = dw_2.height

dw_source.x         = st_vertical2.x + st_vertical2.width
dw_source.width     = newwidth - dw_source.x - gb_3.x

st_horizontal.y     = dw_2.y + dw_2.height
st_horizontal.width = newwidth - st_horizontal.x - gb_3.x

dw_4.x      = st_vertical1.x + st_vertical1.width
dw_4.width  = newwidth  - dw_4.x - gb_3.x
dw_4.height = newheight - dw_4.y - gb_3.x



end event

type pb_save from w_inheritance`pb_save within w_osaroiup_m
integer x = 4096
integer y = 40
integer taborder = 140
boolean enabled = false
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;// 저장
string  ls_aroi_date
integer li_month

if dw_2.rowcount() < 1 then return
if GF_PERMISSION("세금계산서_수정취소", gs_userid) = "Y" then
else
	MessageBox("권한", "이프로그램의 사용권한(세금계산서_수정취소)이 없습니다")
	return
end if

//	회계 매출이관시 강제 return.
if dw_2.object.open_close[1] = 'T' then
	MessageBox("경고", "이 세금계산서 자료는 회계로 이관된 자료입니다. ~n~n 재 작성시 회계팀 담당과 협의하세요.", stopsign! )
	return
end if

ls_aroi_date = string(dw_2.object.oi_date[1], "yyyymm")
SELECT top 1 datediff(month, :ls_aroi_date, getdate()) INTO :li_month FROM login;
if li_month <> 1 then
	if MessageBox("확인","매출일자가 1 개월 이상입니다. 그래도 계속 하시겠습니까?",question!,YesNo!,2) = 2 then
		return
	end if
end if

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
dw_2.accepttext()
dw_4.accepttext()

if ( (truncate(dw_2.object.aroiinv_cash[1] * 0.1 + 0.0000001, 0) - 1) > dw_2.object.aroiinv_rate[1] &
  or (truncate(dw_2.object.aroiinv_cash[1] * 0.1 + 0.0000001, 0) + 1) < dw_2.object.aroiinv_rate[1]) &
  and not( dw_4.object.compute_4[1] = 0 and dw_2.object.aroiinv_rate[1] = 0) then
   IF GF_PERMISSION("세금계산서 매출금액(10%)", gs_userid) = "Y" THEN
		int iNet
      iNet = MessageBox("경고", "부가세가 매출금액의 10%(±1원) 범위를 벗어 날수 없습니다. 수정 하시겠습니까?", Exclamation!, OKCancel!, 2)
      IF iNet = 1 THEN
      ELSE
      	RETURN
      END IF
	ELSE
		MessageBox("경고", "부가세가 매출금액의 10%의 (±1원) 범위를 벗어 날수 없습니다.")
		RETURN
	END IF
end if

dw_2.object.sys_date[1] = gf_today()
dw_2.object.login_id[1] = gs_userid

if dw_2.object.inv_type[1] = 'Y' then
	dw_2.accepttext()
	dw_4.accepttext()	
		
	if wf_update2(dw_2, dw_4, 'Y') = false then
		return
	end if
else	
	dw_2.accepttext()
	if wf_update1(dw_2, 'Y') = false then
		return
	end if
end if

dw_3.postevent(rowfocuschanged!)

end event

type dw_1 from w_inheritance`dw_1 within w_osaroiup_m
integer x = 1609
integer y = 264
integer width = 855
integer height = 92
integer taborder = 70
string dataobject = "d_oscustomer_s1"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_ret()
end event

type st_title from w_inheritance`st_title within w_osaroiup_m
integer x = 32
integer y = 28
integer width = 1531
integer height = 132
string text = "세금계산서 수정 및 취소"
end type

type st_tips from w_inheritance`st_tips within w_osaroiup_m
end type

type pb_compute from w_inheritance`pb_compute within w_osaroiup_m
boolean visible = false
integer x = 1659
integer taborder = 200
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroiup_m
integer x = 3675
integer y = 40
integer taborder = 170
boolean enabled = false
string disabledname = "c:\bmp\printer.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"에누리인쇄",parent, li_x, li_y)
end event

event pb_print_part::clicked;// 거래명세서 출력
long   ll_count, ll_idx, ll_int, ll_cnt
string ls_cust_name, ls_cap_name, ls_cust_no, ls_null, ls_rate_cash
string ls_price,  ls_amount, ls_addr, ls_tel_no
dec    ld_amount, ld_tot
w_repsuper w_print
st_print   l_print
 
if dw_2.rowcount() <= 0 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
dw_8.reset()

setnull(ls_null)
ls_addr      = ls_null
ls_cust_name = ls_null
ls_cap_name  = ls_null
ls_tel_no    = ls_null

ls_cust_no = dw_2.object.cust_no[1]
SELECT cust_name, captain_name, addr, tel_no 
  INTO :ls_cust_name, :ls_cap_name, :ls_addr, :ls_tel_no 
  FROM customer
 WHERE cust_no = :ls_cust_no;
 
dw_8.object.do_date[1]  = string(dw_2.object.oi_date[1], "YYYY/MM/DD")
dw_8.object.do_no[1]    = dw_2.object.aroiinv_no[1]
dw_8.object.addr[1]     = ls_addr
dw_8.object.tel[1]      = ls_tel_no
dw_8.object.scene[1]    = ls_null
dw_8.object.cust[1]     = ls_cust_name
dw_8.object.cap_name[1] = ls_cap_name
dw_8.object.item_1[1]   = '      에누리'
ls_amount    = string(dw_2.object.dc[1] + dw_2.object.discount[1], '####,###,##0')
ls_rate_cash = string(dw_2.object.dc_rate[1] + (dw_2.object.t_dis[1] - dw_2.object.discount[1]), '####,###,##0')
ld_tot       = truncate(dw_2.object.c_vat[1], 0)

dw_8.object.price_1[1]    = ls_amount
dw_8.object.rate_1[1]     = ls_rate_cash

dw_8.object.cash[1]       = ls_amount
dw_8.object.vat[1]        = ls_rate_cash
dw_8.object.tot_amount[1] = string(ld_tot, '####,###,###,###')

l_print.st_datawindow  = dw_8
l_print.st_print_sheet = " 프린트용지 : 거래명세표"
l_print.st_print_desc  = " 이 프로그램은 거래명세표를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_close from w_inheritance`pb_close within w_osaroiup_m
integer x = 4288
integer y = 40
integer taborder = 180
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroiup_m
integer x = 3867
integer y = 40
integer taborder = 120
boolean enabled = false
string disabledname = "c:\bmp\print.bmp"
end type

event pb_print::clicked;// 세금계산서 출력
long   ll_count, ll_idx, ll_int, ll_cnt
int    li_i
string ls_cust_name, ls_addr,   ls_reg_no, ls_per_no, ls_cap_name,  ls_ind_type, ls_ind_item
string ls_inv_date,  ls_sp_cnt, ls_cash,   ls_vat,    ls_item_name, ls_cash1,    ls_vat1, ls_total
string ls_cust_no,   ls_item_no
dec    ld_total,     ld_amount, ld_rate

////////////////////////////////////////
// PZZZPB1ZZZ, 선수금
// PZZZPB2ZZZ, 선수금 공제
////////////////////////////////////////
dec    ld_bfamount,  ld_bfrate	// 선수금
long   ll_row, ll_dw7
string ls_itemname

w_repsuper w_print
st_print   l_print
 
if dw_2.rowcount() <= 0 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_7.reset()
dw_2.accepttext() ; dw_4.accepttext()

ls_cust_no = dw_2.object.cust_no[1]
SELECT cust_name, register_no, resident_card, captain_name, addr, industry_type, industry_code 
  INTO :ls_cust_name, :ls_reg_no, :ls_per_no, :ls_cap_name, :ls_addr, :ls_ind_type, :ls_ind_item 
  FROM customer
 WHERE cust_no   = :ls_cust_no;
 
if isnull(ls_reg_no) then
   dw_7.object.reg_no[1] = ls_per_no
else
   dw_7.object.reg_no[1] = ls_reg_no
end if

// 신양식
if cbx_1.checked = false then
	if dw_2.object.c_aroi_flag[1] = '2' then
		dw_7.object.y_chk[1] = "    ***"
	else
		dw_7.object.y_chk[1] = "***"
	end if
	dw_7.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYY MM DD")
else
	if dw_2.object.c_aroi_flag[1] = '2' then
		dw_7.object.y_chk[1] = "  영수"
	else
		dw_7.object.y_chk[1] = "  청구"
	end if
	dw_7.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYYMMDD")
	dw_7.object.rem[1]      = dw_2.object.rem[1]

	string ls_c_chk
	// 공급자 선택변경
	if cbx_source.checked = true then
		ls_c_chk = 'Y'
	else
		ls_c_chk = 'N'
	end if

	// OLD사업장 (법무용)
	if cbx_vat.checked = true then
		for li_i = 1 to dw_source.rowcount()
			if dw_source.object.c_chk[li_i] = "Y" then				
				is_sno  = dw_source.object.reg_r[li_i]
				is_sh   = dw_source.object.part_name[li_i]
				is_nm   = dw_source.object.captain_name[li_i]
				is_js   = dw_source.object.addr[li_i]
				is_type = dw_source.object.indust_type[li_i]
				is_code = dw_source.object.indust_code[li_i]

				choose case dw_source.object.part_no[li_i]
					case "01" // 유장
						is_sno  = "1 3 4 - 8 1  - 0 4 8 9 4"
						is_sh   = "주식회사 유창"
						is_nm   = "조용선"
					case "02" // 서울
						is_sno  = "1 0 9 - 8 5  - 0 5 9 4 9"
						is_sh   = "(주)유창.서울지점"
					case "08" // 대전
						is_sno  = "3 0 5 - 8 5  - 3 1 9 5 3"
						is_sh   = "(주)유창대전지점"
				end choose

				CONTINUE
			end if
		next
	else
		// 도로명주소 가져오기
		if dw_2.object.oi_date[1] < DateTime("2014/01/01") then
		else
			is_sno  = "1 4 0 - 8 1  - 4 8 1 9 8"   // dw_source.object.reg_r[ll_row]
			is_sh   = "주식회사 유창"					// dw_source.object.part_name[ll_row]
			is_nm   = "조용선"							// dw_source.object.captain_name[ll_row]
			is_js   = "경기도 시흥시 공단1대로321번길 45 (정왕동)"	// dw_source.object.addr[ll_row]
			is_type = "제조, 건설"						// dw_source.object.indust_type[ll_row]
			is_code = "건축자재 外"						// dw_source.object.indust_code[ll_row]
		end if		
	end if

	dw_7.object.c_chk[1]  = ls_c_chk
	dw_7.object.c_sno[1]  = is_sno
	dw_7.object.c_sh[1]   = is_sh
	dw_7.object.c_nm[1]   = is_nm
	dw_7.object.c_js[1]   = is_js
	dw_7.object.c_type[1] = is_type
	dw_7.object.c_code[1] = is_code	
end if

dw_7.object.cust_name[1] = ls_cust_name
dw_7.object.cap_name[1]  = ls_cap_name
dw_7.object.addr[1]      = ls_addr
dw_7.object.ind_type[1]  = ls_ind_type
dw_7.object.ind_item[1]  = ls_ind_item
dw_7.object.inv_no[1]    = dw_2.object.aroiinv_no[1]
//dw_7.object.inv_date[1] = string(dw_2.object.oi_date[1], "YYYY MM DD") // 윗줄

ld_amount = dw_2.object.aroiinv_cash[1] + dw_2.object.ship_cost[1] - dw_2.object.discount[1]
dw_7.object.cash[1] = string(ld_amount, '#########0') 	// 공급가액

if dw_2.object.aroiinv_rate[1] <> 0 then
   ld_rate = dw_2.object.aroiinv_rate[1] + (dw_2.object.ship_cost[1] / 10) - truncate(dw_2.object.discount[1] / 10, 0)
   dw_7.object.vat[1] = string(ld_rate, '########0') 	// 세액
else
   // 2005/10/11 future21 : YSP운송비에 대한 부가세 문제로 수정(아래 주석라인까지.)
	if dw_2.object.aroiinv_cash[1] <> 0 then
		ld_rate = dw_2.object.aroiinv_rate[1]
		dw_7.object.vat[1] = string(ld_rate, '########0') // 세액
   else 
		ld_rate = dw_2.object.aroiinv_rate[1] + (dw_2.object.ship_cost[1] / 10) - truncate(dw_2.object.discount[1] / 10, 0)
		dw_7.object.vat[1] = string(ld_rate, '########0') // 세액
	end if	
end if

ll_count = LenA(trim(dw_7.object.cash[1]))
if cbx_1.checked = false then		// 신 양식
	dw_7.object.mon1[1] = integer(MidA(dw_7.object.inv_date[1], 6, 2))
	dw_7.object.day1[1] = integer(MidA(dw_7.object.inv_date[1], 9, 2))
	ll_count = 10 - ll_count	
else
	dw_7.object.mon1[1] = integer(MidA(dw_7.object.inv_date[1], 5, 2))
	dw_7.object.day1[1] = integer(MidA(dw_7.object.inv_date[1], 7, 2))
	ll_count = 11 - ll_count
end if

dw_7.object.sp_cnt[1] = string(ll_count) 		// 공란수

debugbreak()
if isnull( dw_2.object.citem[1] ) then			// 계산서품목
	if dw_2.object.inv_type[1] = 'Y' then
		ls_item_no = dw_4.object.item_no[1]
		if ls_item_no = "PZZZPB1ZZZ" or ls_item_no = "PZZZPB2ZZZ" then // 선수금, 선수금공제이면 2번행 품목을 프린트
			ls_item_no = dw_4.object.item_no[2]
		end if
		
		SELECT item_name INTO :ls_item_name FROM groupitem	WHERE item_no = :ls_item_no;
		if dw_4.rowcount() > 1 then
			dw_7.object.item_name1[1] = trim(ls_item_name) + ' 외' 		// 1행 품목 외
		else
			dw_7.object.item_name1[1] = trim(ls_item_name) 
		end if
	else
		dw_7.object.item_name1[1] = dw_4.object.groupitem_item_name[1] // 품목
	end if
else
	dw_7.object.item_name1[1] = dw_2.object.citem[1]
end if

////////////////////////////////////////////
// 선수금 공제 존재유무(PZZZPB2ZZZ) 합산
////////////////////////////////////////////
ld_bfamount = 0 ; ld_bfrate = 0
ll_dw7 = dw_7.rowcount()
for ll_row = 1 to dw_4.rowcount()
	if dw_4.object.item_no[ll_row] = "PZZZPB2ZZZ" then
		ls_itemname = dw_4.object.item_item_name[ll_row]			// 품목
		ld_bfamount = ld_bfamount + dw_4.object.ori_amount[ll_row] 	// 공급가액
		ld_bfrate   = ld_bfrate   + dw_4.object.rate_cash[ll_row] 	// 세액
	end if
next
////////////////////////////////////////////

dw_7.object.cash1[1] = string(ld_amount - ld_bfamount, '#,###,###,##0') 	// 공급가액
dw_7.object.vat1[1]  = string(ld_rate   - ld_bfrate,   '#,###,###,##0') 	// 세액
ld_total             = ld_amount + ld_rate
dw_7.object.total[1] = string(ld_total,  '#,###,###,##0') 						// 합계금액

if ld_bfamount <> 0 then
	dw_7.setitem(1, 'item_name' + string(2), ls_itemname)										// 품목
	dw_7.setitem(1, 'cash'      + string(2), string(ld_bfamount, '#,###,###,##0') )	// 공급가액
	dw_7.setitem(1, 'vat'       + string(2), string(ld_bfrate,   '#,###,###,##0') )	// 세액
end if

// 전체출력
if cbx_all.checked = true then
	dw_7.print()
else
	l_print.st_datawindow  = dw_7
	l_print.st_print_sheet = " 프린트용지 : 세금계산서"
	l_print.st_print_desc  = " 이 프로그램은 세금계산서를 출력합니다." 
	
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=0 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroiup_m
integer x = 3479
integer y = 40
integer taborder = 210
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;string ls_aroiinv_no, ls_cust_no, ls_null

setnull(ls_null)

if dw_2.rowcount() < 1 then return

if GF_PERMISSION("세금계산서_삭제", gs_userid) = "Y" then
	if dw_2.object.open_close[1] = 'T' then
		MessageBox("경고", "이 세금계산서 자료는 회계로 이관된 자료입니다. ~n~n 재 작성시 회계팀 담당과 협의하세요.", stopsign! )
		return
	end if
else
	MessageBox("권한", "이프로그램의 사용권한(세금계산서_삭제)이 없습니다")
	return
end if

if MessageBox("취소","세금계산서를 삭제 하시겠습니까?",question!,okcancel!,2) = 2 then
	return
end if

dw_2.accepttext()

setpointer(hourglass!)
ls_aroiinv_no = dw_2.object.aroiinv_no[1]
ls_cust_no    = dw_2.object.cust_no[1]

dw_2.object.delete_flag[1] = 'Y' //취소 flag
dw_2.object.sys_date[1] = gf_today()
dw_2.object.login_id[1] = gs_userid
dw_2.accepttext()

//select * from aroi    where do_no = 'Hd20041001-023';
//select * from aroiinv where aroiinv_no = 'DD200410-243';

//////////////////////////////////////////////////////////////////////
UPDATE dodet SET aroi_qty = 0
 WHERE do_no    in ( SELECT distinct do_no FROM aroi WHERE aroiinv_no = :ls_aroiinv_no);
if sqlca.sqlcode = 0 then
	UPDATE do 
		SET invoice_print = 'N', inv_no = :ls_null
	 WHERE do_no in ( SELECT distinct do_no FROM aroi WHERE aroiinv_no = :ls_aroiinv_no);
	if sqlca.sqlcode = 0 then
		if wf_update2(dw_2, dw_4, 'Y') = false then
			return
		else
			COMMIT;	// dodet, do
		end if
	else
		rollback;
		MessageBox("저장2","do UPDATE도중 오류가 발생하였습니다!",exclamation!)
		return
	end if	 
else
	rollback;
	MessageBox("저장1","dodet UPDATE도중 오류가 발생하였습니다!",exclamation!)
	return
end if	 
dw_1.PostEvent( itemchanged! )
//////////////////////////////////////////////////////////////////////


////=========
//dw_2.object.delete_flag[1] = 'Y' //취소 flag
//
//for ll_row = 1 to dw_4.rowcount()
//	//dodet table의 출고수량과 선매출수량 update
//	dw_5.object.aroi_qty[ll_row] = dw_5.object.aroi_qty[ll_row] - dw_4.object.ship_qty[ll_row]
//	
//	//dodet table의 매출여부 update
//	ls_do_no1 = dw_4.object.do_no[ll_row]
//	if ll_row = 1 then
//		ls_do_no = dw_4.object.do_no[ll_row]
//		ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no <> '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
//		if ll_find = 0 then
//			ll_find = dw_6.find("do_no = '" + ls_do_no + "' and aroiinv_no = '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
//			dw_6.object.invoice_print[ll_find] = 'N'
//		end if	
//	elseif ls_do_no <> ls_do_no1 then
//		ll_find = dw_6.find("do_no = '" + ls_do_no1 + "' and aroiinv_no <> '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
//		if ll_find = 0 then
//			ll_find = dw_6.find("do_no = '" + ls_do_no1 + "' and aroiinv_no = '" + ls_aroiinv_no + "'", 1, dw_6.rowcount())
//			dw_6.object.invoice_print[ll_find] = 'N'
//		end if	
//		ls_do_no = ls_do_no1
//	end if
//next
//
//lr_total = dw_2.object.c_vat[1]
////ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
////ls_month = string(dw_2.object.oi_date[1], 'mm')
//
//////opeom table의 해당월의 매출금액 update
////if wf_opeom_update(ls_cust_no, ll_year, ls_month, lr_total) = false then
////	rollback;
////	messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
////	return
////end if		
//
////customer table의 미수금액 update
////UPDATE customer SET balance_amt = balance_amt + :lr_total
//// WHERE cust_no = :ls_cust_no;
////
////if sqlca.sqlcode <> 0 then
////	rollback;
////	messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
////	return
////end if	
//
////이현정씨와 통화중 현금 일경우 운반비가 없어도 운반비 재선택 가능하게 변경..
//
////lr_ship_cost = dw_2.object.ship_cost[1]
////if lr_ship_cost > 0 then
//	setnull(ls_null)
//	UPDATE do SET inv_no = :ls_null
//	 WHERE inv_no = :ls_aroiinv_no;
//	if sqlca.sqlcode <> 0 then
////		messagebox("오류", sqlca.sqlerrtext)
//		rollback;
//		messagebox("저장2","do UPDATE도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if	 
////end if
//
//dw_2.accepttext()
//dw_5.accepttext()
//dw_6.accepttext()
//
//if wf_update3(dw_2, dw_5, dw_6, 'Y') = false then
//	return
//end if

end event

type pb_delete from w_inheritance`pb_delete within w_osaroiup_m
boolean visible = false
integer x = 2738
integer taborder = 220
end type

type pb_insert from w_inheritance`pb_insert within w_osaroiup_m
integer x = 3291
integer y = 40
integer taborder = 110
string picturename = "c:\bmp\update.bmp"
end type

event pb_insert::clicked;call super::clicked;long ll_row
if dw_2.rowcount() < 1 then return

if GF_PERMISSION("세금계산서_수정취소", gs_userid) = "Y" then
	if dw_2.object.open_close[1] = 'T' then
		MessageBox("경고", "이 세금계산서 자료는 회계로 이관된 자료입니다. ~n~n 재 작성시 회계팀과 협의하세요.", stopsign! )
		return
	end if
else
	MessageBox("권한", "이프로그램의 사용권한(세금계산서_수정취소)이 없습니다")
	return
end if


dw_4.modify('datawindow.readonly = no')

dw_2.object.rem.tabsequence = 1
dw_2.object.rem.background.color = 1087434968
dw_2.object.aroiinv_rate.tabsequence = 40
dw_2.object.aroiinv_rate.background.color = 1087434968

dw_4.object.rate_cash.background.color = 1087434968
dw_4.object.rate_cash.tabsequence = 10
dw_4.object.rem.background.color = 1087434968
dw_4.object.rem.tabsequence = 20

ist_amt.aroiinv_cash = dw_2.object.aroiinv_cash[1]
ist_amt.aroiinv_rate = dw_2.object.aroiinv_rate[1]
ist_amt.ship_cost    = dw_2.object.ship_cost[1]
ist_amt.dc           = dw_2.object.c_vat[1]

is_update_flag = 'Y' //수정버튼 click check
pb_save.enabled = true
dw_2.setfocus()

end event

event pb_insert::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수정",parent, li_x, li_y)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroiup_m
boolean visible = false
integer x = 2354
integer taborder = 230
end type

type gb_3 from w_inheritance`gb_3 within w_osaroiup_m
integer x = 32
integer y = 212
integer width = 4526
integer height = 164
integer taborder = 0
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_osaroiup_m
integer x = 2112
integer y = 0
integer width = 891
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_osaroiup_m
integer x = 3035
integer y = 0
integer width = 1477
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroiup_m
integer x = 1385
integer y = 392
integer width = 2560
integer height = 576
integer taborder = 80
string dataobject = "d_osaroiup_m"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_osaroiup_m
integer x = 32
integer y = 392
integer width = 1317
integer height = 1800
integer taborder = 190
boolean bringtotop = true
string dataobject = "d_osaroiup_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
string ls_item_no, ls_item_name, ls_aroiinvno

debugbreak()
if this.rowcount() > 0 then
	this.accepttext()
	
//	dw_2.modify('datawindow.readonly = yes')
	dw_4.modify('datawindow.readonly = yes')
	
	ls_aroiinvno = this.object.aroiinv_no[this.getrow()]
	dw_2.retrieve( ls_aroiinvno )
	
	dw_2.object.gl_cur_rate.background.color = 78682240
	dw_2.object.gl_cur_rate.tabsequence = 0
	dw_2.object.ship_cost.background.color = 78682240
	dw_2.object.ship_cost.tabsequence = 0
	dw_2.object.rem.background.color = 78682240
	dw_2.object.rem.tabsequence = 0
	dw_2.object.aroiinv_rate.tabsequence = 0
	dw_2.object.aroiinv_rate.background.color = 78682240
	dw_2.object.c_aroi_flag[1] = '1'
	
	if dw_2.object.curr_code[1] = 'WON' then
		dw_4.dataobject = 'd_osaroiup_m1'
	else
		dw_4.dataobject = 'd_osaroiup_m2'
	end if
	
	dw_4.settransobject(sqlca)
	dw_4.retrieve(this.object.aroiinv_no[this.getrow()])
	dw_5.retrieve(this.object.aroiinv_no[this.getrow()])
	
	dw_4.object.rate_cash.background.color = 78682240
	dw_4.object.rate_cash.tabsequence = 0
	dw_4.object.rem.background.color = 78682240
	dw_4.object.rem.tabsequence = 0
	
	if dw_2.object.inv_type[1] = 'Y' then
		if dw_4.rowcount() > 1 then
			ls_item_no = dw_4.object.item_no[1]
			if ls_item_no = "PZZZPB1ZZZ" or ls_item_no = "PZZZPB2ZZZ" then // 선수금, 선수금공제이면 2번행 품목을 프린트
				ls_item_no = dw_4.object.item_no[2]
			end if

			SELECT item_name INTO :ls_item_name FROM groupitem	WHERE item_no = :ls_item_no;
			dw_2.object.citem[1] = trim(ls_item_name) + ' 외'	
		else
			if dw_4.rowcount() < 1 then
				dw_2.object.citem[1] = "물품대 외"
			else
				dw_2.object.citem[1] = dw_4.object.item_item_name[1] // 1행 품목
			end if
		end if
	else
		dw_2.object.citem[1] = "물품대 "
	end if	
else
	dw_2.reset()
	dw_4.reset()
end if

is_update_flag = 'N'
pb_save.enabled = false

end event

event retrieveend;//
if this.getrow() > 0 then
	pb_insert.enabled = true
	pb_print.enabled = true	
	pb_print_part.enabled = true	
	pb_cancel.enabled = true
else
	pb_insert.enabled = false
	pb_print_part.enabled = false	
	pb_print.enabled = false
	pb_cancel.enabled = false
end if
end event

type dw_4 from datawindow within w_osaroiup_m
event ue_1 pbm_custom01
integer x = 1385
integer y = 1020
integer width = 3177
integer height = 1172
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_osaroiup_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_1;wf_calc2()
end event

event itemchanged;//long ll_price, ll_rate, ll_row
//decimal lr_amount, lr_amt, lr_qty, lr_vat, lr_dc
//
dw_2.accepttext()
this.accepttext()
//choose case dwo.name
//	case 'pick'
//		if data = 'Y' then
//			this.setcolumn("rate_cash")
//		else
//			this.object.c_dc[this.getrow()] = this.object.dc_rate[this.getrow()]
//			this.setitem(this.getrow(), "a_qty", this.object.ship_qty[this.getrow()])
//			
//		end if
//		
////	case 'a_qty'
////		//출고수량과 매출수량 비교
////		ll_row = this.getrow()
////		lr_qty = dw_5.object.ship_qty[ll_row] - dw_5.object.aroi_qty[ll_row] + this.object.ship_qty[ll_row]
////		if this.object.a_qty[ll_row] > lr_qty then
////			messagebox("확인","매출수량이 출고할 수량을 초과하였습니다!",exclamation!)
////			return 1
////		end if
//		
//end choose
this.postevent('ue_1')

end event

event losefocus;this.accepttext()
end event

type em_1 from editmask within w_osaroiup_m
integer x = 407
integer y = 268
integer width = 421
integer height = 84
integer taborder = 50
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
wf_ret()
end event

event modified;wf_ret()
end event

type em_2 from editmask within w_osaroiup_m
integer x = 841
integer y = 268
integer width = 421
integer height = 84
integer taborder = 60
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
wf_ret()
end event

event modified;wf_ret()
end event

type cbx_1 from checkbox within w_osaroiup_m
integer x = 2153
integer y = 116
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

event clicked;// 신 양식
if this.checked = false then
	dw_7.dataobject = 'd_osaroi_r'		// 구양식
else
	dw_7.dataobject = "d_osaroi_r1_view" // 'd_osaroi_r1_2' 출력용
end if
dw_7.settransobject(sqlca)

end event

type pb_1 from picturebutton within w_osaroiup_m
event mousemove pbm_mousemove
integer x = 3067
integer y = 40
integer width = 187
integer height = 144
integer taborder = 110
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
	end if
end if



end event

type dw_5 from datawindow within w_osaroiup_m
integer x = 1605
integer y = 8
integer width = 128
integer height = 88
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_osaroiup_m1_prt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_source from checkbox within w_osaroiup_m
integer x = 3954
integer y = 280
integer width = 585
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
string text = "공급자 선택변경"
end type

event clicked;string ls_loc
long   ll_row

if this.checked = true then
	dw_source.retrieve()
	dw_source.visible = true
	
	IF gf_permission('거래명세서_기본공급자', gs_userid) = 'Y' THEN
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
	END IF	
else
	dw_source.visible = false
	is_sno = ''
	is_sh  = ''
	is_nm  = ''
	is_js  = ''
end if

end event

type dw_source from datawindow within w_osaroiup_m
integer x = 3995
integer y = 392
integer width = 562
integer height = 576
integer taborder = 110
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
					is_sno  = this.object.reg_r[li_i]
					is_sh   = this.object.part_name[li_i]
					is_nm   = this.object.captain_name[li_i]
					is_js   = this.object.addr[li_i]
					is_type = this.object.indust_type[li_i]
					is_code = this.object.indust_code[li_i]
					// OLD 사업장번호 (법무용)
					if cbx_vat.checked = true then
						choose case this.object.part_no[li_i]
							case "01" // 유장
								is_sno  = "1 3 4 - 8 1  - 0 4 8 9 4"
								is_sh   = "주식회사 유창"
							case "02" // 서울
								is_sno  = "1 0 9 - 8 5  - 0 5 9 4 9"
								is_sh   = "(주)유창.서울지점"
							case "08" // 대전
								is_sno  = "3 0 5 - 8 5  - 3 1 9 5 3"
								is_sh   = "(주)유창대전지점"
						end choose
					end if
					continue
				end if
				this.object.c_chk[li_i] = 'N'
			next
		end if
end choose


end event

type cbx_vat from checkbox within w_osaroiup_m
integer x = 2153
integer y = 48
integer width = 384
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
string text = "OLD사업장"
end type

event clicked;MessageBox("확인","공급자 선택변경에서 다시한번 선택하기 바람.")
end event

type dw_7 from datawindow within w_osaroiup_m
string tag = "d_osaroi_r1_2"
integer x = 1029
integer y = 8
integer width = 128
integer height = 88
integer taborder = 150
boolean bringtotop = true
string title = "d_osaroi_r"
string dataobject = "d_osaroi_r1_view"
boolean livescroll = true
end type

type dw_8 from datawindow within w_osaroiup_m
integer x = 1170
integer y = 8
integer width = 128
integer height = 88
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_9 from datawindow within w_osaroiup_m
integer x = 1312
integer y = 8
integer width = 128
integer height = 88
integer taborder = 30
boolean bringtotop = true
string title = "d_osaroi_r1"
string dataobject = "d_osaroi_r1"
boolean livescroll = true
end type

type cbx_all from checkbox within w_osaroiup_m
integer x = 2606
integer y = 48
integer width = 370
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체출력"
end type

event clicked;// 전체출력
long  ll_row

if MessageBox("확인","전체출력 작업을 진행 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then RETURN

for ll_row = 1 to dw_3.rowcount()
	dw_3.scrolltorow( ll_row )	
	pb_print.triggerevent( clicked! )
next

cbx_all.checked = false
MessageBox( "확인", "전체출력 완료" )

end event

type st_4 from statictext within w_osaroiup_m
integer x = 1275
integer y = 280
integer width = 325
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_osaroiup_m
integer x = 73
integer y = 284
integer width = 325
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "발행일자"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_vertical1 from u_splitbar_vertical within w_osaroiup_m
integer x = 1358
integer y = 392
integer height = 1800
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = dw_4.x
st_horizontal.width = dw_4.width

end event

type st_horizontal from u_splitbar_horizontal within w_osaroiup_m
integer x = 1385
integer y = 984
integer width = 3177
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical2.height = dw_2.height

end event

type st_vertical2 from u_splitbar_vertical within w_osaroiup_m
integer x = 3959
integer y = 392
integer height = 576
boolean bringtotop = true
end type

