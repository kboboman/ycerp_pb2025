$PBExportHeader$w_oigiprint_m.srw
$PBExportComments$거래명세서 조회/출력(1998/9/25,성삼지)
forward
global type w_oigiprint_m from w_inheritance
end type
type gb_6 from groupbox within w_oigiprint_m
end type
type gb_5 from groupbox within w_oigiprint_m
end type
type dw_3 from datawindow within w_oigiprint_m
end type
type dw_4 from datawindow within w_oigiprint_m
end type
type em_1 from editmask within w_oigiprint_m
end type
type em_2 from editmask within w_oigiprint_m
end type
type st_1 from statictext within w_oigiprint_m
end type
type em_3 from editmask within w_oigiprint_m
end type
type cbx_1 from checkbox within w_oigiprint_m
end type
type cbx_3 from checkbox within w_oigiprint_m
end type
type cbx_4 from checkbox within w_oigiprint_m
end type
type cbx_5 from checkbox within w_oigiprint_m
end type
type cbx_6 from checkbox within w_oigiprint_m
end type
type cbx_7 from checkbox within w_oigiprint_m
end type
type cbx_8 from checkbox within w_oigiprint_m
end type
type dw_source from datawindow within w_oigiprint_m
end type
type cbx_source from checkbox within w_oigiprint_m
end type
type gb_4 from groupbox within w_oigiprint_m
end type
type dw_5 from datawindow within w_oigiprint_m
end type
type dw_8 from datawindow within w_oigiprint_m
end type
type dw_6 from datawindow within w_oigiprint_m
end type
type cbx_9 from checkbox within w_oigiprint_m
end type
type cbx_10 from checkbox within w_oigiprint_m
end type
type rb_a4 from radiobutton within w_oigiprint_m
end type
type rb_a5 from radiobutton within w_oigiprint_m
end type
type cbx_11 from checkbox within w_oigiprint_m
end type
type cbx_12 from checkbox within w_oigiprint_m
end type
type pb_1 from picturebutton within w_oigiprint_m
end type
type st_3 from statictext within w_oigiprint_m
end type
type em_left from editmask within w_oigiprint_m
end type
type st_5 from statictext within w_oigiprint_m
end type
type em_top from editmask within w_oigiprint_m
end type
type gb_7 from groupbox within w_oigiprint_m
end type
type gb_8 from groupbox within w_oigiprint_m
end type
type st_pick from structure within w_oigiprint_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oigiprint_m from w_inheritance
integer y = 160
integer width = 4539
integer height = 2308
string title = "거래명세서 조회/출력(w_oigiprint_m)"
gb_6 gb_6
gb_5 gb_5
dw_3 dw_3
dw_4 dw_4
em_1 em_1
em_2 em_2
st_1 st_1
em_3 em_3
cbx_1 cbx_1
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
cbx_6 cbx_6
cbx_7 cbx_7
cbx_8 cbx_8
dw_source dw_source
cbx_source cbx_source
gb_4 gb_4
dw_5 dw_5
dw_8 dw_8
dw_6 dw_6
cbx_9 cbx_9
cbx_10 cbx_10
rb_a4 rb_a4
rb_a5 rb_a5
cbx_11 cbx_11
cbx_12 cbx_12
pb_1 pb_1
st_3 st_3
em_left em_left
st_5 st_5
em_top em_top
gb_7 gb_7
gb_8 gb_8
end type
global w_oigiprint_m w_oigiprint_m

type variables
st_print i_print
datawindowchild idwc_scene, idwc_cust
string  is_scenesql, is_custscenesql
int ii_row
string is_sno, is_sh, is_nm, is_js
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
public subroutine wf_dw4filter ()
end prototypes

public subroutine wf_print (datawindow arg_dw);long   ll_count,     ll_idx, ll_int, ll_cnt, ll_price_cnt,  ll_line_cnt
string ls_orderno,   ls_cust_name, ls_cap_name, ls_cust_no, ls_null,  ls_rate_cash, ls_username
string ls_ship_cash, ls_ship_vat,  ls_ship_qty, ls_acc_qty, ls_price, ls_amount
string ls_item_name, ls_item_no,   ls_qa,       ls_cash,    ls_uom,   ls_real_uom, ls_chk, ls_dr
dec    ld_amount
string ls_sale_no,   ls_desc, ls_scene, ls_scenedesc
int    li_seq_no
datetime ld_date

if pb_cancel.enabled = false then
	return
end if

ls_username = gs_username
if rb_A5.checked = true then
	ll_line_cnt = 16
else
	ll_line_cnt = 25
end if

setnull(ls_null)
ll_price_cnt = 0
ls_orderno   = dw_1.object.do_no[1]	
ls_dr  = trim(dw_1.object.rem[1]) + " " + trim(dw_1.object.dr_hp[1])
ll_idx = 0
ll_int = 0
arg_dw.reset()

string ls_register, saler_name, saler_cap, saler_addr
ls_register = dw_source.object.reg[1]

ls_chk = "N"
for ll_count = 1 to dw_2.rowcount()
	if cbx_1.checked = true and dw_2.object.price[ll_count] = 0 then	// 0 미출력
		continue
	end if

	ll_price_cnt++
	if ll_idx = 0 then
		ll_int = ll_int + 1
		
		arg_dw.object.register[1]     = is_sno
		arg_dw.object.saler_name[1]   = is_sh
		arg_dw.object.saler_cap[1]    = is_nm
		arg_dw.object.saler_addr[1]   = is_js

	   arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
      arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]
		if arg_dw.dataobject = 'd_oigiving_r_22_a5' then
		else
			arg_dw.object.ls_user[ll_int] = ls_username
		end if
 	   arg_dw.object.addr[ll_int]    = dw_1.object.shipto_addr[1]
   	arg_dw.object.tel[ll_int]     = dw_1.object.tel_no[1]
		IF isnull(dw_1.object.spot_code[1]) then
	      arg_dw.object.scene[ll_int] = ls_null
		else
			ls_scene = dw_1.object.spot_code[1]
			select scene_desc into :ls_scenedesc from scene where scene_code = :ls_scene;
	      arg_dw.object.scene[ll_int] = ls_scenedesc
		end if
		
   	ls_cust_no = dw_1.object.cust_no[1]
	   select cust_name, register_no into :ls_cust_name, :ls_cap_name 
		  from customer
       where cust_no = :ls_cust_no;
	   arg_dw.object.cust[ll_int]     = ls_cust_name
   	arg_dw.object.cap_name[ll_int] = ls_cap_name
	end if
	
	string ls_c_chk
	if cbx_source.checked = true then
		ls_c_chk = 'Y'
	else
		ls_c_chk = 'N'
	end if

	ll_idx = ll_idx + 1
	if ls_chk = "N" and LeftA(ls_orderno,1) = "B" and dw_2.object.price[ll_count] = 0 then
		ls_qa  = '내  역  ***************'
		ls_uom = ''
		ls_item_name = '***************  세   부   '
		ls_ship_qty  = ''
		ls_acc_qty   = ''
		ls_price     = ''
		ls_amount    = ''
		ls_rate_cash = ''
   	ls_real_uom  = ''
		ls_chk       = "Y"
		
		ll_count = ll_count - 1
	else
		ls_item_no = dw_2.object.item_no[ll_count]
		///////////////////////////////////////////////////////////////////
		// 규격(송장) 값이 존재하면 규격으로 출력함
		///////////////////////////////////////////////////////////////////
		ls_qa      = dw_2.object.qa[ll_count]
	   SELECT item_name INTO :ls_item_name  FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa;
		if isnull(dw_2.object.qa_cust[ll_count]) then
		else
			ls_qa   = dw_2.object.qa_cust[ll_count]
		end if
		ls_qa      = MidA(ls_qa,  1, 3) + ' X ' + MidA(ls_qa,  5, 4) + ' X ' + &
			          MidA(ls_qa, 10, 4) + ' X ' + MidA(ls_qa, 15, 5)
		///////////////////////////////////////////////////////////////////
		ls_uom      = dw_2.object.uom[ll_count]
		ls_ship_qty = string(dw_2.object.ship_qty[ll_count], '###,###,###.00')
		ls_acc_qty  = string(dw_2.object.rlse_acc_qty[ll_count], '###,###,###.00')
		if ls_chk = "Y" then
			ls_price  = string(dw_2.object.price[ll_count], '####,###,###')
			ls_amount = string(dw_2.object.rlse_amount[ll_count], '####,###,###')
			ls_rate_cash = string(dw_2.object.rate_cash[ll_count], '####,###,###')
		else
			ls_price  = string(dw_2.object.price[ll_count], '####,###,##0')
			ls_amount = string(dw_2.object.rlse_amount[ll_count], '####,###,##0')
			ls_rate_cash = string(dw_2.object.rate_cash[ll_count], '####,###,##0')
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
	end if
	
// 거래명세서/출고증의 비고에 생산일자또는 입고일자또는 재고일자(출고일자)을 기록
// iso에 의한 시화 진달수 과장의 요청에의하여 추가 2000/06/13, easthero
	setnull(ld_date)
	if ll_count > 0 then
		ls_desc    = dw_2.object.rem[ll_count]
		ls_sale_no = dw_2.object.sale_no[ll_count]
		li_seq_no  = dw_2.object.seq_no[ll_count]
		select max(sfc_date) into :ld_date 
		  from sfcday
		 where sale_no = :ls_sale_no and seq_no = :li_seq_no;
		if sqlca.sqlcode = 100 then
			select max(insp_date) into :ld_date 
			  from insp, inspdet, purdet
			 where insp.insp_no = inspdet.insp_no
			   and purdet.order_no = inspdet.pur_no
				and purdet.seq_no = inspdet.seq_no
				and purdet.sale_no = :ls_sale_no
				and purdet.sale_seq = :li_seq_no;
		end if
		if DATE(ld_date) > date(dw_1.object.do_date[1]) or sqlca.sqlcode = 100 or isnull(ld_date) then
			ld_date = dw_1.object.do_date[1]
		end if
	end if
	
////////////////////////// insert easthero end

	arg_dw.setitem(ll_int, 'item_'  + string(ll_idx), ls_item_name)
	arg_dw.setitem(ll_int, 'qa_'    + string(ll_idx), ls_qa)
	arg_dw.setitem(ll_int, 'auom_'  + string(ll_idx), ls_real_uom)
	arg_dw.setitem(ll_int, 'ship_'  + string(ll_idx), ls_ship_qty)
	arg_dw.setitem(ll_int, 'buom_'  + string(ll_idx), ls_uom)
	arg_dw.setitem(ll_int, 'acc_'   + string(ll_idx), ls_acc_qty)
	arg_dw.setitem(ll_int, 'cost_'  + string(ll_idx), ls_price)
	arg_dw.setitem(ll_int, 'price_' + string(ll_idx), ls_amount)
	arg_dw.setitem(ll_int, 'rate_'  + string(ll_idx), ls_rate_cash)
	arg_dw.setitem(ll_int, 'pdate'  + string(ll_idx), DATE(ld_date))
	arg_dw.setitem(ll_int, 'desc'   + string(ll_idx), ls_desc)
	if ll_idx = ll_line_cnt then // A4 : 25, A5 : 16
		arg_dw.object.dr_man[ll_int] = ls_dr
		ll_idx = 0
	end if

   IF ll_idx = 0 THEN
		arg_dw.object.cash[ll_int]       = ls_null
		arg_dw.object.vat[ll_int]        = ls_null
		arg_dw.object.tot_amount[ll_int] = ls_null
	END IF		
next

//
if dw_1.object.ship_flag[1] = 'D' and dw_1.object.shipamt_case[1] = 'R' then 
	if dw_1.object.ship_amount[1] <> 0 then
		if ll_idx = 0 then
			ll_int = ll_int + 1
		
			arg_dw.object.register[1]     = is_sno
			arg_dw.object.saler_name[1]   = is_sh
			arg_dw.object.saler_cap[1]    = is_nm
			arg_dw.object.saler_addr[1]   = is_js
			
			arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "YYYY/MM/DD")
			arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]
			if arg_dw.dataobject = 'd_oigiving_r_22_a5' then
			else
				arg_dw.object.ls_user[ll_int] = ls_username
			end if
			
			arg_dw.object.addr[ll_int]    = dw_1.object.shipto_addr[1]
			arg_dw.object.tel[ll_int]     = dw_1.object.tel_no[1]
			IF isnull(dw_1.object.spot_code[1]) then
				arg_dw.object.scene[ll_int] = ls_null
			else
				ls_scene = dw_1.object.spot_code[1]
				select scene_desc into :ls_scenedesc 
				  from scene
				 where scene_code = :ls_scene;
				arg_dw.object.scene[ll_int] = ls_scenedesc
			end if
			
			ls_cust_no = dw_1.object.cust_no[1]
			select cust_name, register_no into :ls_cust_name, :ls_cap_name 
			  from customer
			 where cust_no = :ls_cust_no;
			arg_dw.object.cust[ll_int]     = ls_cust_name
			arg_dw.object.cap_name[ll_int] = ls_cap_name 
		end if
		
		ll_idx = ll_idx + 1
		ls_ship_cash = string(dw_1.object.ship_amount[1], '####,###,##0')
		ls_ship_vat  = string(dw_1.object.ship_amount[1] / 10, '####,###,##0')	
		if dw_1.object.do_rate[1] <> 0 then
		ELSE
			ls_ship_vat = '           0'
		END IF
		arg_dw.setitem(ll_int, 'item_'  + string(ll_idx), '운송비')
		arg_dw.setitem(ll_int, 'qa_'    + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'auom_'  + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'ship_'  + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'buom_'  + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'acc_'   + string(ll_idx), ls_null)
		arg_dw.setitem(ll_int, 'cost_'  + string(ll_idx), ls_ship_cash)
		arg_dw.setitem(ll_int, 'price_' + string(ll_idx), ls_ship_cash)
		arg_dw.setitem(ll_int, 'rate_'  + string(ll_idx), ls_ship_vat)
	end if
end if

if cbx_1.checked = true and ll_price_cnt < 1 then 
	Messagebox('확인', '출고 단가가 0가 아닌 항목이 없습니다.', stopsign!)
	return
end if
arg_dw.object.cash[ll_int]       = string(dw_1.object.do_cash[1], '####,###,###,###')
arg_dw.object.vat[ll_int]        = string(dw_1.object.do_rate[1], '####,###,###,###')
arg_dw.object.tot_amount[ll_int] = string(dw_1.object.do_total[1], '####,###,###,###')
arg_dw.object.dr_man[ll_int]     = ls_dr

end subroutine

public subroutine wf_dw4filter ();string ls_fil4, ls_fil5, ls_fil6, ls_fil, ls_a1, ls_a2

ls_a1 = ''
ls_a2 = ''
if cbx_4.checked = true then
	ls_fil4 = "left(do_no,1) = 'S'"
else
	ls_fil4 = ''
end if
if cbx_5.checked = true then
	if ls_fil4 <> '' then
		ls_a1 = " OR "
	end if
	ls_fil5 = "left(do_no,1) = 'H'"
else
	ls_fil5 = ''
end if
if cbx_6.checked = true then
	if ls_fil4 <> '' or ls_fil5 <> '' then
		ls_a2 = " OR "
	end if
	ls_fil6 = "left(do_no,1) = 'B'"
else
	ls_fil6 = ''
end if

ls_fil = trim(ls_fil4 + ls_a1 + ls_fil5 + ls_a2 + ls_fil6)

dw_4.setfilter(ls_fil)
dw_4.filter()

return
end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)

//공급자 선택화면 추가 (09년 2월 4일)
dw_source.settransobject(sqlca)
dw_source.visible = false
is_sno = ''
is_sh  = ''
is_nm  = ''
is_js  = ''

//////////////////////////////////////////////////////////////////////////////
string ls_margin, ls_values[], ls_left, ls_top

SELECT BIGO INTO :ls_margin FROM CODEMST WHERE ITEM_CD = :gs_team AND TYPE = '거래명세_출력여백';
if isnull(ls_margin) OR ls_margin = "" then
	ls_margin = "115,15"
end if
GF_Split(ls_margin, ",", ls_values)

ls_left  = ProfileString("YCSC.INI","Database","LEFT", " ")
ls_top   = ProfileString("YCSC.INI","Database","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = ls_values[1]
if isnull(ls_top)  OR ls_top  = "" then ls_top  = ls_values[2]

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_3.getchild("scene_code", idwc_scene)

idwc_scene.insertrow(0)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

//dw_3.getchild("cust_no", idwc_cust)
//gs_ds_whcustret.sharedata(idwc_cust)
dw_3.insertrow(0)

is_custscenesql = dw_4.describe("datawindow.table.select")
em_1.text = string(today(),"yyyy/mm/dd")
em_2.text = string(today(),"yyyy/mm/dd")
dw_5.visible = false
dw_6.visible = false
dw_8.visible = false

em_3.text = LeftA(gs_area,1) + "D" + string(today(),'yyyymmdd')
em_3.SelectText(9, 2)
em_3.setfocus()

//2009년 05월 21일 작업내용
if gf_permission('거래명세서_연속출력', gs_userid)   = 'Y' or &
   gf_permission('거래명세서_기본공급자', gs_userid) = 'Y' then
	pb_print_part.visible = true
else
	pb_print_part.visible = false
end if

string ls_loc
if gf_permission('거래명세서_기본공급자', gs_userid) = 'Y' then
	SELECT bigo INTO  :ls_loc FROM codemst
	 WHERE type = '거래명세서_기본공급자' AND item_cd  =  :gs_userid;
	if ls_loc = 'S' or ls_loc = 'D' or ls_loc = 'H' or ls_loc = 'B'then
		cbx_source.Checked = TRUE
		cbx_source.triggerevent(clicked!)
	else
		cbx_source.Checked = FALSE
	end if
end if
/////////////////////////////////////////

cbx_9.triggerevent(clicked!)

end event

on w_oigiprint_m.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.gb_5=create gb_5
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.em_3=create em_3
this.cbx_1=create cbx_1
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.cbx_6=create cbx_6
this.cbx_7=create cbx_7
this.cbx_8=create cbx_8
this.dw_source=create dw_source
this.cbx_source=create cbx_source
this.gb_4=create gb_4
this.dw_5=create dw_5
this.dw_8=create dw_8
this.dw_6=create dw_6
this.cbx_9=create cbx_9
this.cbx_10=create cbx_10
this.rb_a4=create rb_a4
this.rb_a5=create rb_a5
this.cbx_11=create cbx_11
this.cbx_12=create cbx_12
this.pb_1=create pb_1
this.st_3=create st_3
this.em_left=create em_left
this.st_5=create st_5
this.em_top=create em_top
this.gb_7=create gb_7
this.gb_8=create gb_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_3
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.cbx_3
this.Control[iCurrent+11]=this.cbx_4
this.Control[iCurrent+12]=this.cbx_5
this.Control[iCurrent+13]=this.cbx_6
this.Control[iCurrent+14]=this.cbx_7
this.Control[iCurrent+15]=this.cbx_8
this.Control[iCurrent+16]=this.dw_source
this.Control[iCurrent+17]=this.cbx_source
this.Control[iCurrent+18]=this.gb_4
this.Control[iCurrent+19]=this.dw_5
this.Control[iCurrent+20]=this.dw_8
this.Control[iCurrent+21]=this.dw_6
this.Control[iCurrent+22]=this.cbx_9
this.Control[iCurrent+23]=this.cbx_10
this.Control[iCurrent+24]=this.rb_a4
this.Control[iCurrent+25]=this.rb_a5
this.Control[iCurrent+26]=this.cbx_11
this.Control[iCurrent+27]=this.cbx_12
this.Control[iCurrent+28]=this.pb_1
this.Control[iCurrent+29]=this.st_3
this.Control[iCurrent+30]=this.em_left
this.Control[iCurrent+31]=this.st_5
this.Control[iCurrent+32]=this.em_top
this.Control[iCurrent+33]=this.gb_7
this.Control[iCurrent+34]=this.gb_8
end on

on w_oigiprint_m.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.em_3)
destroy(this.cbx_1)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.cbx_6)
destroy(this.cbx_7)
destroy(this.cbx_8)
destroy(this.dw_source)
destroy(this.cbx_source)
destroy(this.gb_4)
destroy(this.dw_5)
destroy(this.dw_8)
destroy(this.dw_6)
destroy(this.cbx_9)
destroy(this.cbx_10)
destroy(this.rb_a4)
destroy(this.rb_a5)
destroy(this.cbx_11)
destroy(this.cbx_12)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.em_left)
destroy(this.st_5)
destroy(this.em_top)
destroy(this.gb_7)
destroy(this.gb_8)
end on

event resize;call super::resize;//
dw_source.width = newwidth - dw_source.x - dw_2.x

gb_5.width  = newwidth  - gb_5.x - dw_2.x

dw_2.width  = newwidth  - (dw_2.x * 2)
dw_2.height = newheight - dw_2.y - dw_2.x


end event

type pb_save from w_inheritance`pb_save within w_oigiprint_m
boolean visible = false
integer x = 4023
integer height = 152
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

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"인쇄",parent, li_x, li_y)


end event

type dw_1 from w_inheritance`dw_1 within w_oigiprint_m
integer x = 667
integer y = 488
integer width = 3753
integer height = 492
integer taborder = 140
boolean enabled = false
string dataobject = "d_oigiprint_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_oigiprint_m
integer x = 32
integer y = 1008
integer width = 4421
integer height = 1172
integer taborder = 150
string dataobject = "d_oidoupdate_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//IF dw_4.rowcount() > 0 THEN
//  	open(w_oigiupdateysp_m)
//ELSE
//	messagebox("확인", "출고상세에 Y.S.P내역이 존재하지 않습니다.", information!)
//END IF
end event

type st_title from w_inheritance`st_title within w_oigiprint_m
integer x = 18
integer y = 24
integer width = 910
string text = "거래명세서 조회"
end type

type st_tips from w_inheritance`st_tips within w_oigiprint_m
end type

type pb_compute from w_inheritance`pb_compute within w_oigiprint_m
integer x = 1504
integer y = 84
integer width = 151
integer height = 104
integer taborder = 20
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_compute::losefocus;call super::losefocus;pb_compute.default = true

end event

event pb_compute::clicked;call super::clicked;string ls_cust, ls_scene, ls_dono, ls_name, ls_where, ls_sql
long ll_row, ll_found, ll_cnt
 
ls_dono = TRIM(em_3.TEXT)

if isnull(ls_dono) or ls_dono = '' then return

setnull(ls_cust)
setnull(ls_scene)
select cust_no, spot_code into :ls_cust, :ls_scene from do
 where do_no = :ls_dono;
if sqlca.sqlcode = 100 then 
	beep(2)
	em_3.setfocus()
	return
end if
dw_3.object.cust_no[1] = ls_cust
dw_3.object.scene_code[1] = ls_scene
if isnull(ls_scene) or trim(ls_scene) = '' then
	dw_3.object.scene_code.protect = 1 
	dw_3.object.scene_code.background.color = 78682240
else
	dw_3.getchild("scene_code", idwc_scene)
	setnull(ls_name)
	ls_where = " AND do.cust_no = ~~'" + ls_cust + "~~'"
	ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
	
	idwc_scene.modify(ls_sql)
	idwc_scene.retrieve()
	dw_3.object.scene_code.protect = 0
	dw_3.object.scene_code.background.color = RGB(255,255,255)
end if
this.default = false
em_1.text = MidA(em_3.TEXT, 3,4) + "/" + MidA(em_3.TEXT, 7,2) + "/" + MidA(em_3.TEXT, 9,2)
em_2.text = MidA(em_3.TEXT, 3,4) + "/" + MidA(em_3.TEXT, 7,2) + "/" + MidA(em_3.TEXT, 9,2)

pb_retrieve.triggerevent(clicked!)

ll_found = dw_4.Find( "do_no = '"+ ls_dono +"'", 1, dw_4.rowcount())
if ll_found = 0 then
	if dw_4.rowcount() > 0 then
		messagebox("확인", "검색한 송장번호가 없습니다.")
	end if
	em_3.setfocus()
else
	dw_4.scrolltorow(ll_found)
end if 



end event

type pb_print_part from w_inheritance`pb_print_part within w_oigiprint_m
integer x = 3433
integer height = 152
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "연속출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;call super::clicked;long ll_row, ll_start
datawindow dw_prt

if dw_4.rowcount() < 1 then return

// 공급자 변경 체크시 필수 선택하도록 수정
IF is_sno = '' or IsNull(is_sno) or is_sh = '' or IsNull(is_sh) or is_nm = '' or IsNull(is_nm) THEN
	Messagebox('확인','공급자 변경을 체크하셨으면 변경하고자 하는 사업장을 선택하셔야 합니다.')
	Return
END IF				

string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)

PrintSetup()
//PrintSetupPrinter()
//=============================================//
//OpenWithParm(w_pop_print, dw_8)
//IF Message.DoubleParm <> 1 THEN RETURN
//=============================================//
if MessageBox("확인","선택된 출고번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"한번출력을 시키면 시간이 많이걸립니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	return
end if

dw_1.setredraw(false)
dw_2.setredraw(false)
ll_start = dw_4.GetSelectedRow(0)

for ll_row = ll_start to dw_4.rowcount()
	if dw_4.IsSelected(ll_row) = false then continue
	dw_4.scrolltorow(ll_row)
	
	if cbx_9.checked = true then		// 명세
		if rb_A4.checked = true then
			dw_8.dataobject = 'd_oigiving_r_21'
			dw_8.Modify('DataWindow.Print.Paper.Size = 9')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		else		// A5 양식
			dw_8.dataobject = 'd_oigiving_r_21_a5'
			dw_8.Modify('DataWindow.Print.Paper.Size = 11')		
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		end if
		dw_8.settransobject(sqlca)
		wf_print(dw_8)
		dw_8.print()
	end if
	
	if cbx_10.checked = true then		// 인수
		if rb_A4.checked = true then
			dw_8.dataobject = 'd_oigiving_r_22'
			dw_8.Modify('DataWindow.Print.Paper.Size = 9')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		else
			dw_8.dataobject = 'd_oigiving_r_22_a5'
			dw_8.Modify('DataWindow.Print.Paper.Size = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		end if
		dw_8.settransobject(sqlca)
		wf_print(dw_8)
		dw_8.print()
	end if
		
	if cbx_11.checked = true then		// 납품
		if rb_A4.checked = true then
			dw_8.dataobject = 'd_oigiving_r_23'
			dw_8.Modify('DataWindow.Print.Paper.Size = 9')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		else
			dw_8.dataobject = 'd_oigiving_r_23_a5'
			dw_8.Modify('DataWindow.Print.Paper.Size = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		end if
		dw_8.settransobject(sqlca)
		wf_print(dw_8)
		dw_8.print()
	end if
			
	if cbx_12.checked = true then		// 출고
		if rb_A4.checked = true then
			dw_8.dataobject = 'd_oigiving_r_24'
			dw_8.Modify('DataWindow.Print.Paper.Size = 9')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		else
			dw_8.dataobject = 'd_oigiving_r_24_a5'
			dw_8.Modify('DataWindow.Print.Paper.Size = 11')
			dw_8.modify("DataWindow.print.margin.left = " + ls_left )
			dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
			dw_8.Modify('DataWindow.Print.Orientation = 1')
		end if
		dw_8.settransobject(sqlca)
		wf_print(dw_8)
		dw_8.print()
	end if
next
dw_1.setredraw(true)
dw_2.setredraw(true)

end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_oigiprint_m
integer x = 4215
integer height = 152
integer taborder = 190
end type

event clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiprint_m
integer x = 4023
integer height = 152
integer taborder = 200
end type

event pb_print::clicked;if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_prt
w_repsuper w_print

string old_dwnm
old_dwnm = dw_8.dataobject

string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)

PrintSetup()
//PrintSetupPrinter()
//=============================================//
//OpenWithParm(w_pop_print, dw_8)
//IF Message.DoubleParm <> 1 THEN RETURN
//=============================================//
//i_print.st_datawindow = dw_8
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 여신현황을 출력합니다." 
//OpenWithParm(w_printsetup, i_print) 

if MessageBox("확인","선택된 출고번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"한번출력을 시키면 시간이 많이걸립니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	return
end if

if cbx_9.checked = true then		// 명세
	if rb_A4.checked = true then	
		dw_8.dataobject = 'd_oigiving_r_21'
		dw_8.Modify('DataWindow.Print.Paper.Size = 9')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	else		
		dw_8.dataobject = 'd_oigiving_r_21_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')		
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	end if
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
end if

if cbx_10.checked = true then		// 인수
	if rb_A4.checked = true then
		dw_8.dataobject = 'd_oigiving_r_22'
		dw_8.Modify('DataWindow.Print.Paper.Size = 9')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	else
		dw_8.dataobject = 'd_oigiving_r_22_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	end if
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
end if
	
if cbx_11.checked = true then		// 납품
	if rb_A4.checked = true then
		dw_8.dataobject = 'd_oigiving_r_23'
		dw_8.Modify('DataWindow.Print.Paper.Size = 9')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	else
		dw_8.dataobject = 'd_oigiving_r_23_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	end if
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
end if
		
if cbx_12.checked = true then		// 출고
	if rb_A4.checked = true then
		dw_8.dataobject = 'd_oigiving_r_24'
		dw_8.Modify('DataWindow.Print.Paper.Size = 9')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	else
		dw_8.dataobject = 'd_oigiving_r_24_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
	end if
	dw_8.settransobject(sqlca)
	wf_print(dw_8)
	dw_8.print()
end if

dw_8.dataobject = old_dwnm	


string ls_search_do_no
ls_search_do_no = trim(dw_1.object.do_no[1])
UPDATE DO
   SET prt_date = getdate()
 WHERE do_no = :ls_search_do_no AND prt_date IS NULL;
if sqlca.sqlcode = 0 then
	commit;
else
	rollback;
	MessageBox('확인', '출력일시가 정상적으로 저장되지 않았습니다.~r~n전산실에 문의 하세요.')
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiprint_m
integer x = 3831
integer height = 152
integer taborder = 210
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;dw_1.reset()
dw_2.reset()
dw_4.reset()

end event

type pb_delete from w_inheritance`pb_delete within w_oigiprint_m
boolean visible = false
integer x = 2729
integer y = 60
integer taborder = 220
boolean enabled = false
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oigiprint_m
boolean visible = false
integer x = 2309
integer y = 60
integer taborder = 240
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiprint_m
integer x = 3639
integer height = 152
integer taborder = 230
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string   ls_cust_no, ls_scene_code, ls_where, ls_sql, ls_curr_code, ls_start, ls_end
dec      ld_curr_rate
datetime ldt_dodate

dw_3.accepttext()
ls_cust_no    = dw_3.object.cust_no[1]	
ls_scene_code = dw_3.object.scene_code[1]		
ls_start      = em_1.text
ls_end        = em_2.text

if cbx_3.checked = true then
	ls_where = " WHERE  do.do_date between ~~'" + &
				  ls_start + "~~' and " + "~~'" + ls_end + "~~'	order by do_no desc"
else
	IF isnull(ls_scene_code) then
		ls_where = " WHERE cust_no = ~~'" &
					  + ls_cust_no + "~~' and do.do_date between ~~'" + &
						  ls_start + "~~' and " + "~~'" + ls_end + "~~'	order by do_no desc"
	else
		ls_where = " WHERE cust_no = ~~'" + ls_cust_no  + &
						  "~~' and spot_code = ~~'" +  ls_scene_code + &
					  		"~~' AND do.do_date between ~~'" + &
						  ls_start + "~~' and " + "~~'" + ls_end + "~~' order by do_no desc"
	end if
end if
ls_sql = "datawindow.table.select = '" + is_custscenesql + ls_where + "'"

dw_4.setredraw(FALSE)
dw_4.reset()
dw_4.modify(ls_sql)
dw_4.retrieve()
dw_4.setredraw(TRUE)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_oigiprint_m
integer x = 635
integer y = 296
integer width = 2953
integer height = 156
integer taborder = 160
integer textsize = -10
integer weight = 400
long backcolor = 79220952
boolean enabled = false
string text = "전체"
end type

type gb_2 from w_inheritance`gb_2 within w_oigiprint_m
integer y = 296
integer width = 590
integer height = 696
integer taborder = 180
integer textsize = -10
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiprint_m
integer x = 3163
integer y = 8
integer width = 1262
integer height = 216
integer taborder = 70
integer weight = 400
long backcolor = 79220952
end type

type gb_6 from groupbox within w_oigiprint_m
integer x = 1728
integer y = 8
integer width = 503
integer height = 216
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고일자"
end type

type gb_5 from groupbox within w_oigiprint_m
integer x = 640
integer y = 448
integer width = 3813
integer height = 544
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
end type

type dw_3 from datawindow within w_oigiprint_m
integer x = 667
integer y = 352
integer width = 2898
integer height = 92
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_oigiuodate_ps"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_cust_no, ls_where, ls_sql, ls_null
long ll_cnt

IF dwo.name <> 'cust_no' THEN	return

dw_3.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)

this.accepttext()
ls_cust_no = this.getitemstring(1, "cust_no")	
setnull(ls_null)
this.object.scene_code[1] = ls_null

select count(*) into :ll_cnt from scene
 where cust_no = :ls_cust_no;
if ll_cnt < 0 then return

ls_where = " AND do.cust_no = ~~'" + ls_cust_no + "~~'"
ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

idwc_scene.modify(ls_sql)
idwc_scene.retrieve()
	
if idwc_scene.rowcount() > 0 then
	this.object.scene_code.protect = 0
	this.object.scene_code.background.color = RGB(255,255,255)
else
	this.object.scene_code.protect = 1 
	this.object.scene_code.background.color = 78682240
end if
this.setfocus()

end event

type dw_4 from datawindow within w_oigiprint_m
integer x = 41
integer y = 352
integer width = 571
integer height = 628
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oiupdateordno_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;integer li_count, li_idx, li_chk
string  ls_locno, ls_orderno, ls_itemno, ls_itemqa, ls_where, ls_sql, ls_chk
decimal ld_issue_qty

dw_1.Accepttext()

if this.rowcount() > 0  then
	ii_row = this.getrow()
   ls_orderno = this.object.do_no[this.getrow()]
	
   dw_1.retrieve(ls_orderno)
   dw_2.retrieve(ls_orderno)
	if LeftA(ls_orderno,1) = "B" then
		dw_2.setsort('sort_qty, oi_no')
		dw_2.sort()
	else
		dw_2.setsort('oi_no')
		dw_2.sort()
	end if
else
	IF dw_1.enabled = TRUE THEN
  	   messagebox("확인", "만족하는 출고내역이 없습니다.")
   END IF
end if
end event

event clicked;if row < 1 then return

this.scrolltorow(row)
if cbx_7.checked = true then
	this.SelectRow(row,  NOT this.IsSelected(row))
end if

end event

type em_1 from editmask within w_oigiprint_m
integer x = 1755
integer y = 56
integer width = 357
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

type em_2 from editmask within w_oigiprint_m
integer x = 1851
integer y = 132
integer width = 357
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
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

type st_1 from statictext within w_oigiprint_m
integer x = 1755
integer y = 132
integer width = 73
integer height = 72
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_3 from editmask within w_oigiprint_m
integer x = 997
integer y = 92
integer width = 489
integer height = 88
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "HD2000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event losefocus;pb_compute.default = true

end event

type cbx_1 from checkbox within w_oigiprint_m
integer x = 1531
integer y = 496
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "0 미출력"
end type

type cbx_3 from checkbox within w_oigiprint_m
integer x = 681
integer y = 280
integer width = 233
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체"
end type

event clicked;if this.checked = true then
	dw_3.object.cust_no.protect = 1 
	dw_3.object.cust_no.background.color = 78682240
	dw_3.object.scene_code.protect = 1 
	dw_3.object.scene_code.background.color = 78682240
else
	dw_3.object.cust_no.protect = 0
	dw_3.object.cust_no.background.color = RGB(255,255,255)
	dw_3.object.scene_code.protect = 0
	dw_3.object.scene_code.background.color = RGB(255,255,255)
end if
end event

type cbx_4 from checkbox within w_oigiprint_m
integer x = 41
integer y = 180
integer width = 215
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "시화"
boolean checked = true
end type

event clicked;wf_dw4filter()
end event

type cbx_5 from checkbox within w_oigiprint_m
integer x = 261
integer y = 180
integer width = 215
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "화곡"
boolean checked = true
end type

event clicked;wf_dw4filter()
end event

type cbx_6 from checkbox within w_oigiprint_m
integer x = 485
integer y = 180
integer width = 215
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "반월"
boolean checked = true
end type

event clicked;wf_dw4filter()
end event

type cbx_7 from checkbox within w_oigiprint_m
integer x = 50
integer y = 296
integer width = 215
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "선택"
end type

event clicked;if this.checked = false then dw_4.SelectRow(0, this.checked)
end event

type cbx_8 from checkbox within w_oigiprint_m
integer x = 279
integer y = 296
integer width = 302
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;dw_4.SelectRow(0, this.checked)
end event

type dw_source from datawindow within w_oigiprint_m
integer x = 3598
integer y = 228
integer width = 846
integer height = 224
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiglpart_r"
boolean hscrollbar = true
boolean vscrollbar = true
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
					continue
				end if
				this.object.c_chk[li_i] = 'N'
			next
		end if
end choose


end event

type cbx_source from checkbox within w_oigiprint_m
integer x = 2926
integer y = 240
integer width = 635
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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
		is_sno = dw_source.object.reg_r[ll_row]
		is_sh  = dw_source.object.part_name[ll_row]
		is_nm  = dw_source.object.captain_name[ll_row]
		is_js  = dw_source.object.addr[ll_row]
		dw_source.ScrollToRow(ll_row)			

		// 도로명주소 가져오기
		//if dw_1.object.do_date[1] < "2014/01/01" then
		//else
		//	is_sno  = "1 0 9 - 8 6  - 3 7 9 1 0"   // dw_source.object.reg_r[ll_row]
		//	is_sh   = "(주)송천건업"					// dw_source.object.part_name[ll_row]
		//	is_nm   = "이명섭"							// dw_source.object.captain_name[ll_row]
		//	is_js   = "서울특별시 강서구 강서로41길 12 (화곡동)"	// dw_source.object.addr[ll_row]
		//// is_type = "부동산외"						   // dw_source.object.indust_type[ll_row]
		//// is_code = "임대외"						   // dw_source.object.indust_code[ll_row]
		//end if
	end if
else
	dw_source.visible = false
	is_sno = ''
	is_sh = ''
	is_nm = ''
	is_js = ''
end if
end event

type gb_4 from groupbox within w_oigiprint_m
integer x = 955
integer y = 8
integer width = 745
integer height = 216
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고번호"
end type

type dw_5 from datawindow within w_oigiprint_m
integer x = 2537
integer y = 236
integer width = 101
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_8 from datawindow within w_oigiprint_m
integer x = 2647
integer y = 236
integer width = 101
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r_21_a5"
boolean livescroll = true
end type

type dw_6 from datawindow within w_oigiprint_m
string tag = "d_oigiving_r3_2"
integer x = 2757
integer y = 236
integer width = 101
integer height = 80
integer taborder = 120
boolean bringtotop = true
string title = "d_oigiving_r2"
string dataobject = "d_oigiving_r2"
boolean livescroll = true
end type

type cbx_9 from checkbox within w_oigiprint_m
integer x = 2281
integer y = 72
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

type cbx_10 from checkbox within w_oigiprint_m
integer x = 2501
integer y = 72
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

type rb_a4 from radiobutton within w_oigiprint_m
integer x = 2784
integer y = 76
integer width = 311
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
string text = "A4 양식"
end type

type rb_a5 from radiobutton within w_oigiprint_m
integer x = 2784
integer y = 144
integer width = 311
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
string text = "A5 양식"
boolean checked = true
end type

type cbx_11 from checkbox within w_oigiprint_m
integer x = 2281
integer y = 148
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

type cbx_12 from checkbox within w_oigiprint_m
integer x = 2501
integer y = 148
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

type pb_1 from picturebutton within w_oigiprint_m
integer x = 3186
integer y = 52
integer width = 242
integer height = 152
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출고이관"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;// 출고이관 
string  ls_dono
decimal ld_amt
long    ll_row, ll_cnt

if dw_1.rowcount() < 1 then return

if IsValid(w_o_main) then 
	OpenSheet(w_oidotrans_m,  w_o_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_oidotrans_m,  w_all_main, 5, original!)
end if

w_oidotrans_m.em_1.text = em_1.text
w_oidotrans_m.em_2.text = em_2.text
w_oidotrans_m.cbx_trans.checked = false
w_oidotrans_m.cbx_trans.triggerevent( clicked! )
w_oidotrans_m.pb_retrieve.triggerevent( clicked! )

ls_dono= dw_1.object.do_no[1]		// 송장 조회번호
ll_row = w_oidotrans_m.dw_1.RowCount()
ll_cnt = w_oidotrans_m.dw_1.Find("do_no = '" + ls_dono + "'", 1, ll_row)		
if ll_cnt = 0 then
	MessageBox("확인","송장 조회번호 존재하지 않습니다!",exclamation!)
else
	w_oidotrans_m.dw_1.scrolltorow(ll_cnt)
end if

end event

type st_3 from statictext within w_oigiprint_m
integer x = 960
integer y = 240
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "왼쪽"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_left from editmask within w_oigiprint_m
integer x = 1097
integer y = 228
integer width = 160
integer height = 68
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "115"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)

end event

type st_5 from statictext within w_oigiprint_m
integer x = 1266
integer y = 240
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "상단"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_top from editmask within w_oigiprint_m
integer x = 1399
integer y = 228
integer width = 160
integer height = 68
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "110"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

event modified;//
string ls_left, ls_top

ls_left = em_left.text
ls_top  = em_top.text
SetProfileString("YCSC.INI", "Database", "LEFT", ls_left)
SetProfileString("YCSC.INI", "Database", "TOP",  ls_top)

end event

type gb_7 from groupbox within w_oigiprint_m
integer x = 2249
integer y = 8
integer width = 480
integer height = 216
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력형태"
end type

type gb_8 from groupbox within w_oigiprint_m
integer x = 2734
integer y = 8
integer width = 416
integer height = 216
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력용지"
end type

