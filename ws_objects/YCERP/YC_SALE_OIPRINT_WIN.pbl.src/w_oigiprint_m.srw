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
type cbx_11 from checkbox within w_oigiprint_m
end type
type cbx_12 from checkbox within w_oigiprint_m
end type
type pb_1 from picturebutton within w_oigiprint_m
end type
type dw_7 from datawindow within w_oigiprint_m
end type
type cbx_2 from checkbox within w_oigiprint_m
end type
type sle_prt from singlelineedit within w_oigiprint_m
end type
type dw_9 from datawindow within w_oigiprint_m
end type
type st_left from statictext within w_oigiprint_m
end type
type em_left from editmask within w_oigiprint_m
end type
type st_9 from statictext within w_oigiprint_m
end type
type em_top from editmask within w_oigiprint_m
end type
type cbx_bigo from checkbox within w_oigiprint_m
end type
type cbx_13 from checkbox within w_oigiprint_m
end type
type cbx_14 from checkbox within w_oigiprint_m
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
integer width = 4590
integer height = 2408
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
cbx_11 cbx_11
cbx_12 cbx_12
pb_1 pb_1
dw_7 dw_7
cbx_2 cbx_2
sle_prt sle_prt
dw_9 dw_9
st_left st_left
em_left em_left
st_9 st_9
em_top em_top
cbx_bigo cbx_bigo
cbx_13 cbx_13
cbx_14 cbx_14
gb_7 gb_7
gb_8 gb_8
end type
global w_oigiprint_m w_oigiprint_m

type variables
st_print i_print
datawindowchild idwc_scene, idwc_cust
string  is_scenesql, is_custscenesql
string is_prtname[]
int ii_row
string is_sno, is_sh, is_nm, is_js
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
public subroutine wf_dw4filter ()
end prototypes

public subroutine wf_print (datawindow arg_dw);//
long   ll_count,     ll_idx, ll_int, ll_cnt, ll_price_cnt,  ll_line_cnt
string ls_orderno,   ls_cust_name, ls_cap_name, ls_cust_no, ls_null,  ls_ratecash, ls_username
string ls_ship_cash, ls_ship_vat,  ls_ship_qty, ls_acc_qty, ls_price, ls_amount
string ls_item_name, ls_item_no,   ls_qa,       ls_cash,    ls_uom,   ls_real_uom, ls_chk, ls_dr
dec    ld_amount
string ls_sale_no,   ls_desc, ls_scene, ls_scenedesc
int    li_seq_no
datetime ld_date

if pb_cancel.enabled = false then return

ls_username = gs_username
ll_line_cnt = 16		// 라인줄수

setnull(ls_null)

ll_price_cnt = 0
ls_orderno   = dw_1.object.do_no[1]	
ls_dr  = trim(dw_1.object.rem[1]) + " " + trim(dw_1.object.dr_hp[1])
ll_idx = 0
ll_int = 0

arg_dw.reset()

string saler_name, saler_cap, saler_addr


// 도로명주소 가져오기
if dw_1.object.do_date[1] < DateTime("2014/01/01") then
else
	is_sno  = "1 4 0 - 8 1  - 4 8 1 9 8"   // dw_source.object.reg_r[ll_row]
	is_sh   = "주식회사 유창"					// dw_source.object.part_name[ll_row]
	is_nm   = "조용선, 조우제"					// dw_source.object.captain_name[ll_row]
	is_js   = "경기도 시흥시 공단1대로321번길 45 (정왕동)"	// dw_source.object.addr[ll_row]
// is_type = "제조, 건설"						// dw_source.object.indust_type[ll_row]
// is_code = "건축자재 外"						// dw_source.object.indust_code[ll_row]
end if

ls_chk = "N"
for ll_count = 1 to dw_2.rowcount()
	if cbx_1.checked = true and dw_2.object.price[ll_count] = 0 then	// 0 미출력
		CONTINUE
	end if

	ll_price_cnt++
	if ll_idx = 0 then
		ll_int = ll_int + 1
		
		arg_dw.object.register[ll_int]     = is_sno
		arg_dw.object.saler_name[ll_int]   = is_sh
		arg_dw.object.saler_cap[ll_int]    = is_nm
		arg_dw.object.saler_addr[ll_int]   = is_js
	
	   arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "yyyy/mm/dd")
      arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]
		if arg_dw.dataobject = 'd_oigiving_r_22_a5' then		// 인수증
			arg_dw.object.acc_24[1] = "*" + dw_1.object.do_no[1] + "*"
			arg_dw.object.acc_25[1] = "*" + dw_1.object.do_no[1] + "*"
		else
			arg_dw.object.ls_user[ll_int] = ls_username
		end if
 	   arg_dw.object.addr[ll_int]      = dw_1.object.shipto_addr[1]			// 운송처주소
   	arg_dw.object.tel[ll_int]       = dw_1.object.tel_no[1]					// 연락처
	   arg_dw.object.telno_cap[ll_int] = dw_1.object.telno_cap[1]  			// 보조연락처
	   arg_dw.object.desc25[ll_int]    = string(dw_1.object.time_arrival[1])// 도착예정

		if isnull(dw_1.object.spot_code[1]) then
	      arg_dw.object.scene[ll_int] = ls_null
		else
			ls_scene = dw_1.object.spot_code[1]
			SELECT scene_desc INTO :ls_scenedesc FROM scene WHERE scene_code = :ls_scene;
	      arg_dw.object.scene[ll_int] = ls_scenedesc								// 현장명
		end if
		
   	ls_cust_no = dw_1.object.cust_no[1]
	   SELECT cust_name, register_no INTO :ls_cust_name, :ls_cap_name 
		  FROM customer
       WHERE cust_no = :ls_cust_no;
	   arg_dw.object.cust[ll_int]     = ls_cust_name
   	arg_dw.object.cap_name[ll_int] = ls_cap_name
		
		string ls_salesphone
      SELECT s.hp_no INTO :ls_salesphone
        FROM customer c 
             LEFT OUTER JOIN salehp S ON c.salesman = s.user_id 
       WHERE c.cust_no = :ls_cust_no;

		// 송천건업일 경우 매장전화번호 출력 
		if ls_cust_no = "U580" then ls_salesphone = "(02)2690-1999"
		arg_dw.object.salesman[1]     = "유창영업담당: " + ls_salesphone		
	end if
	
	string ls_c_chk
	if cbx_source.checked = true then
		ls_c_chk = 'Y'
	else
		ls_c_chk = 'N'
	end if

	ll_idx = ll_idx + 1
	if ls_chk = "N" and LeftA(ls_orderno,1) = "B" and dw_2.object.price[ll_count] = 0 then
		ls_qa        = '내  역  ***************'
		ls_uom       = ''
		ls_item_name = '***************  세   부   '
		ls_ship_qty  = ''
		ls_acc_qty   = ''
		ls_price     = ''
		ls_amount    = ''
		ls_ratecash  = ''
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
		ls_ship_qty = string(dw_2.object.ship_qty[ll_count],       '###,###,###.00')
		ls_acc_qty  = string(dw_2.object.rlse_acc_qty[ll_count],   '###,###,###.00')
		if ls_chk = "Y" then
			ls_price    = string(dw_2.object.price[ll_count],       '####,###,###')
			ls_amount   = string(dw_2.object.rlse_amount[ll_count], '####,###,###')
			ls_ratecash = string(dw_2.object.rate_cash[ll_count],   '####,###,###')
		else
			ls_price    = string(dw_2.object.price[ll_count],       '####,###,##0')
			ls_amount   = string(dw_2.object.rlse_amount[ll_count], '####,###,##0')
			ls_ratecash = string(dw_2.object.rate_cash[ll_count],   '####,###,##0')
		end if
		
		if trim(ls_uom) = 'M' OR ls_uom = 'M2' then
	   	ls_real_uom ='EA'
		else
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
		
		SELECT max(sfc_date) INTO :ld_date 
		  FROM sfcday
		 WHERE sale_no = :ls_sale_no AND seq_no = :li_seq_no;
		if sqlca.sqlcode = 100 then
			SELECT max(insp_date) INTO :ld_date 
			  FROM insp, inspdet, purdet
			 WHERE insp.insp_no    = inspdet.insp_no
			   AND purdet.order_no = inspdet.pur_no
				AND purdet.seq_no   = inspdet.seq_no
				AND purdet.sale_no  = :ls_sale_no
				AND purdet.sale_seq = :li_seq_no;
		end if
		if DATE(ld_date) > date(dw_1.object.do_date[1]) OR sqlca.sqlcode = 100 OR isnull(ld_date) then
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
	arg_dw.setitem(ll_int, 'rate_'  + string(ll_idx), ls_ratecash)
	arg_dw.setitem(ll_int, 'pdate'  + string(ll_idx), DATE(ld_date))
	if cbx_bigo.checked = true then
		//
	else
		arg_dw.setitem(ll_int, 'desc'   + string(ll_idx), ls_desc)
	end if

	if ll_idx = ll_line_cnt then // A4 : 25, A5 : 16
		arg_dw.object.dr_man[ll_int] = ls_dr
		ll_idx = 0
	end if

   if ll_idx = 0 then
		arg_dw.object.cash[ll_int]       = ls_null
		arg_dw.object.vat[ll_int]        = ls_null
		arg_dw.object.tot_amount[ll_int] = ls_null
	end if		
next

//
if dw_1.object.ship_flag[1] = 'D' and dw_1.object.shipamt_case[1] = 'R' then 
	if dw_1.object.ship_amount[1] <> 0 then
		if ll_idx = 0 then
			ll_int = ll_int + 1
		
			arg_dw.object.register[ll_int]     = is_sno
			arg_dw.object.saler_name[ll_int]   = is_sh
			arg_dw.object.saler_cap[ll_int]    = is_nm
			arg_dw.object.saler_addr[ll_int]   = is_js
			
			arg_dw.object.do_date[ll_int] = string(dw_1.object.do_date[1], "yyyy/mm/dd")
			arg_dw.object.do_no[ll_int]   = dw_1.object.do_no[1]

			if arg_dw.dataobject = 'd_oigiving_r_22_a5' then		// 인수증
				arg_dw.object.acc_24[1] = "*" + dw_1.object.do_no[1] + "*"
				arg_dw.object.acc_25[1] = "*" + dw_1.object.do_no[1] + "*"
			else
				arg_dw.object.ls_user[ll_int] = ls_username
			end if
			
			arg_dw.object.addr[ll_int]      = dw_1.object.shipto_addr[1]			// 운송처주소
			arg_dw.object.tel[ll_int]       = dw_1.object.tel_no[1]					// 연락처
		   arg_dw.object.telno_cap[ll_int] = dw_1.object.telno_cap[1]  			// 보조연락처
			arg_dw.object.desc25[ll_int]    = string(dw_1.object.time_arrival[1])// 도착예정

			if isnull(dw_1.object.spot_code[1]) then
				arg_dw.object.scene[ll_int] = ls_null
			else
				ls_scene = dw_1.object.spot_code[1]
				SELECT scene_desc INTO :ls_scenedesc FROM scene WHERE scene_code = :ls_scene;
				arg_dw.object.scene[ll_int] = ls_scenedesc							// 현장명
			end if
			
			ls_cust_no = dw_1.object.cust_no[1]
			SELECT cust_name, register_no INTO :ls_cust_name, :ls_cap_name 
			  FROM customer
			 WHERE cust_no = :ls_cust_no;
			arg_dw.object.cust[ll_int]     = ls_cust_name
			arg_dw.object.cap_name[ll_int] = ls_cap_name 
		end if
		
		ll_idx = ll_idx + 1
		ls_ship_cash = string(dw_1.object.ship_amount[1], '####,###,##0')
		ls_ship_vat  = string(dw_1.object.ship_amount[1] / 10, '####,###,##0')	
		if dw_1.object.do_rate[1] <> 0 then
		else
			ls_ship_vat = '           0'
		end if
		
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
	RETURN
end if
arg_dw.object.cash[ll_int]       = string(dw_1.object.do_cash[1],  '####,###,###,###')
arg_dw.object.vat[ll_int]        = string(dw_1.object.do_rate[1],  '####,###,###,###')
arg_dw.object.tot_amount[ll_int] = string(dw_1.object.do_total[1], '####,###,###,###')
arg_dw.object.dr_man[ll_int]     = ls_dr

end subroutine

public subroutine wf_dw4filter ();string	ls_fil4, ls_fil5, ls_fil6, ls_fil, ls_fil7, ls_a1, ls_a2, ls_a3
string	ls_fil14, ls_a14

ls_a1 = ""
ls_a2 = ""

if cbx_4.checked = true then
	ls_fil4 = "left(do.do_no,1) = 'S'"
else
	ls_fil4 = ''
end if

if cbx_5.checked = true then
	if ls_fil4 <> '' then
		ls_a1 = " OR "
	end if
	ls_fil5 = "left(do.do_no,1) = 'H' and dodet.loc_no <> 'WS00000012'"
else
	ls_fil5 = ''
end if

if cbx_6.checked = true then
	if ls_fil4 <> '' OR ls_fil5 <> '' then
		ls_a2 = " OR "
	end if
	ls_fil6 = "left(do.do_no,1) = 'T'"
else
	ls_fil6 = ''
end if


if cbx_13.checked = true then
	if ls_fil4 <> '' OR ls_fil5 <> '' OR ls_fil6 <> '' then
		ls_a3 = " OR "
	end if
	ls_fil7 = "dodet.loc_no = 'WS00000012'"
else
	ls_fil7 = ''
end if

if cbx_14.checked = true then
	if ls_fil4 <> '' OR ls_fil5 <> '' OR ls_fil6 <> '' or ls_fil7 <> '' then
		ls_a14 = " OR "
	end if
	ls_fil14 = "left(do.do_no,1) = 'Z'"
else
	ls_fil14 = ''
end if

ls_fil = trim(ls_fil4 + ls_a1 + ls_fil5 + ls_a2 + ls_fil6 + ls_a3 + ls_fil7 + ls_a14 + ls_fil14)

dw_4.setfilter(ls_fil)
dw_4.filter()
end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//////////////////////////////////////////////////////////////////////////////
string  ls_left, ls_top

ls_left = ProfileString("YCERP.INI","DO_PRT","LEFT", " ")
ls_top  = ProfileString("YCERP.INI","DO_PRT","TOP",  " ")

if isnull(ls_left) OR ls_left = "" then ls_left = "115"
if isnull(ls_top)  OR ls_top  = "" then ls_top  = "110"

em_left.text = ls_left
em_top.text  = ls_top 
//////////////////////////////////////////////////////////////////////////////
sle_prt.enabled = false


string ls_permission

dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false
dw_9.visible = false

//공급자 선택화면 추가 (09년 2월 4일)
dw_source.settransobject(sqlca)
dw_source.visible = false
is_sno = '' ; is_sh  = '' ; is_nm  = '' ; is_js  = ''

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_8.settransobject(sqlca)

dw_3.settransobject(sqlca)
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

// 
SELECT  RTRIM(BIGO) INTO :ls_permission
  FROM  CODEMST
 WHERE  type     =  '거래명세서_수정/삭제' AND USE_YN = 'Y'	AND item_cd = :gs_userid;
if isnull(ls_permission) OR ls_permission = "" then
	MessageBox("확인", "거래명세서_수정/삭제 권한이 없습니다.")
	pb_close.triggerevent( clicked! )
end if


is_prtname[1] = ''

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
this.cbx_11=create cbx_11
this.cbx_12=create cbx_12
this.pb_1=create pb_1
this.dw_7=create dw_7
this.cbx_2=create cbx_2
this.sle_prt=create sle_prt
this.dw_9=create dw_9
this.st_left=create st_left
this.em_left=create em_left
this.st_9=create st_9
this.em_top=create em_top
this.cbx_bigo=create cbx_bigo
this.cbx_13=create cbx_13
this.cbx_14=create cbx_14
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
this.Control[iCurrent+24]=this.cbx_11
this.Control[iCurrent+25]=this.cbx_12
this.Control[iCurrent+26]=this.pb_1
this.Control[iCurrent+27]=this.dw_7
this.Control[iCurrent+28]=this.cbx_2
this.Control[iCurrent+29]=this.sle_prt
this.Control[iCurrent+30]=this.dw_9
this.Control[iCurrent+31]=this.st_left
this.Control[iCurrent+32]=this.em_left
this.Control[iCurrent+33]=this.st_9
this.Control[iCurrent+34]=this.em_top
this.Control[iCurrent+35]=this.cbx_bigo
this.Control[iCurrent+36]=this.cbx_13
this.Control[iCurrent+37]=this.cbx_14
this.Control[iCurrent+38]=this.gb_7
this.Control[iCurrent+39]=this.gb_8
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
destroy(this.cbx_11)
destroy(this.cbx_12)
destroy(this.pb_1)
destroy(this.dw_7)
destroy(this.cbx_2)
destroy(this.sle_prt)
destroy(this.dw_9)
destroy(this.st_left)
destroy(this.em_left)
destroy(this.st_9)
destroy(this.em_top)
destroy(this.cbx_bigo)
destroy(this.cbx_13)
destroy(this.cbx_14)
destroy(this.gb_7)
destroy(this.gb_8)
end on

event resize;call super::resize;//
dw_source.width  = newwidth  - dw_source.x - gb_2.x

gb_5.width  = newwidth  - gb_5.x - gb_2.x

dw_1.width  = newwidth  - dw_1.x - gb_2.x - 28

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
integer x = 1143
integer y = 488
integer width = 3310
integer height = 492
integer taborder = 140
boolean enabled = false
string dataobject = "d_oigiprint_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_oigiprint_m
integer x = 37
integer y = 40
integer width = 910
integer height = 132
string text = "거래명세서 조회"
end type

type st_tips from w_inheritance`st_tips within w_oigiprint_m
end type

type pb_compute from w_inheritance`pb_compute within w_oigiprint_m
integer x = 1541
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

event pb_compute::clicked;call super::clicked;//
string ls_cust, ls_scene, ls_dono, ls_name, ls_where, ls_sql
long ll_row, ll_found, ll_cnt
 
ls_dono = TRIM(em_3.TEXT)

if isnull(ls_dono) or ls_dono = '' then return

setnull(ls_cust) ; setnull(ls_scene)

SELECT cust_no, spot_code INTO :ls_cust, :ls_scene FROM do WHERE do_no = :ls_dono;
if sqlca.sqlcode = 100 then 
	em_3.setfocus()
	return
end if

dw_3.object.cust_no[1]    = ls_cust
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
integer x = 3470
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

event pb_print_part::clicked;call super::clicked;// 연속출력
long  ll_row, ll_start
datawindow dw_prt

if dw_4.rowcount() < 1 then RETURN

// 공급자 변경 체크시 필수 선택하도록 수정
if is_sno = '' OR IsNull(is_sno) OR is_sh = '' OR IsNull(is_sh) OR is_nm = '' OR IsNull(is_nm) then
	Messagebox('확인','공급자 변경을 체크하셨으면 변경하고자 하는 사업장을 선택하셔야 합니다.')
	RETURN
end if			

// DO_PRT
string ls_left, ls_top, ls_prt, ls_setprn

ls_left = em_left.text ; ls_top = em_top.text

if cbx_9.checked = true OR cbx_10.checked = true OR cbx_11.checked = true OR cbx_12.checked = true then
	
	if is_prtname[1] = "" or isnull(is_prtname[1]) then
		PrintSetup()
	//PrintSetupPrinter()
	//=============================================//
	//OpenWithParm(w_pop_print, dw_8)
	//IF Message.DoubleParm <> 1 THEN RETURN
	//=============================================//		
		ls_prt = PrintGetPrinter()
		GF_Split( ls_prt, "~t", is_prtname )
	else
		PrintSetPrinter(  is_prtname[1] )
	end if
	
	//is_prts = ls_prtname[1]
	//is_prtw = ls_prtname[1]

end if

if MessageBox("확인","선택된 출고번호 전체를 선택한 프린터로 출력합니다. ~r~n" + &
	"한번출력을 시키면 시간이 많이걸립니다. 실행하시겠습니까?",   Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if

dw_1.setredraw(false)
dw_2.setredraw(false)
ll_start = dw_4.GetSelectedRow(0)

for ll_row = ll_start to dw_4.rowcount()
	if dw_4.IsSelected(ll_row) = false then CONTINUE
	
	dw_4.scrolltorow(ll_row)
	
	if cbx_9.checked = true then		// 명세
		dw_8.dataobject = 'd_oigiving_r_21_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')		
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
		dw_8.settransobject(sqlca)
		WF_Print(dw_8)
		dw_8.print()
	end if
	
	if cbx_10.checked = true then		// 인수
		dw_8.dataobject = 'd_oigiving_r_22_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
		dw_8.settransobject(sqlca)
		WF_Print(dw_8)
		dw_8.print()
	end if
		
	if cbx_11.checked = true then		// 납품
		dw_8.dataobject = 'd_oigiving_r_23_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
		dw_8.settransobject(sqlca)
		WF_Print(dw_8)
		dw_8.print()
	end if
			
	if cbx_12.checked = true then		// 출고
		dw_8.dataobject = 'd_oigiving_r_24_a5'
		dw_8.Modify('DataWindow.Print.Paper.Size = 11')
		dw_8.modify("DataWindow.print.margin.left = " + ls_left )
		dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
		dw_8.Modify('DataWindow.Print.Orientation = 1')
		dw_8.settransobject(sqlca)
		WF_Print(dw_8)
		dw_8.print()
	end if

	/////////////////////////////////////////////////////////////////////
	// 출고봉투 라벨
	/////////////////////////////////////////////////////////////////////
	if cbx_2.checked = true then
		DataWindowChild ldwc_cargbn
		
		dw_1.getchild("do_car_gbn", ldwc_cargbn)
	
		ls_setprn = trim(sle_prt.text)
		
		if ls_setprn = "" then
			PrintSetup()			
		else
			PrintSetPrinter( ls_setprn )
		end if
		
		dw_7.dataobject = "d_label_main_prt"
		dw_7.settransobject(sqlca)
	
		dw_7.object.car[1]        = ldwc_cargbn.getitemstring(ldwc_cargbn.getrow(),'item_nm')
		dw_7.object.cust_name[1]  = dw_1.object.customer_cust_name[1]
		dw_7.object.scene_name[1] = dw_1.object.scene_scene_desc[1]
		dw_7.object.scene_tel[1]  = dw_1.object.tel_no[1]
		dw_7.object.scene_addr[1] = dw_1.object.shipto_addr[1]
	
		dw_7.print()
	end if
	/////////////////////////////////////////////////////////////////////

next
dw_1.setredraw(true)
dw_2.setredraw(true)

end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_oigiprint_m
integer x = 4251
integer height = 152
integer taborder = 190
end type

event clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiprint_m
integer x = 4059
integer height = 152
integer taborder = 200
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
datawindow dw_prt
w_repsuper w_print
string ls_custno, ls_custnm, ls_scene, ls_scenenm

if dw_1.rowcount() < 1 then RETURN

//-- Print 이전 송장규격 Update 관련사항 --//
dw_2.AcceptText()

if WF_Update1(dw_2, 'N') = true then
else	
	MessageBox('확인', '송장규격 등록에 실패하였습니다.')
	RETURN
end if


//-- Print 부분 --//
string old_dwnm
old_dwnm = dw_8.dataobject

// DO_PRT 설정
string  ls_left, ls_top
ls_left = em_left.text ; ls_top = em_top.text

if cbx_9.checked = true OR cbx_10.checked = true OR cbx_11.checked = true OR cbx_12.checked = true then
	PrintSetup()
end if

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
	           "한번출력을 시키면 시간이 많이걸립니다. 실행하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if

if cbx_9.checked = true then		// 명세
	dw_8.dataobject = 'd_oigiving_r_21_a5'
	dw_8.Modify('DataWindow.Print.Paper.Size = 11')		
	dw_8.modify("DataWindow.print.margin.left = " + ls_left )
	dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_8.Modify('DataWindow.Print.Orientation = 1')
	dw_8.settransobject(sqlca)
	WF_Print(dw_8)
	dw_8.print()
end if

if cbx_10.checked = true then		// 인수
	dw_8.dataobject = 'd_oigiving_r_22_a5'
	dw_8.Modify('DataWindow.Print.Paper.Size = 11')
	dw_8.modify("DataWindow.print.margin.left = " + ls_left )
	dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_8.Modify('DataWindow.Print.Orientation = 1')
	dw_8.settransobject(sqlca)
	WF_Print(dw_8)
	dw_8.print()
end if
	
if cbx_12.checked = true then		// 납품
	dw_8.dataobject = 'd_oigiving_r_24_a5'
	dw_8.Modify('DataWindow.Print.Paper.Size = 11')
	dw_8.modify("DataWindow.print.margin.left = " + ls_left )
	dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_8.Modify('DataWindow.Print.Orientation = 1')
	dw_8.settransobject(sqlca)
	WF_Print(dw_8)
	dw_8.print()
end if

if cbx_11.checked = true then		// 출고
	dw_8.dataobject = 'd_oigiving_r_23_a5'
	dw_8.Modify('DataWindow.Print.Paper.Size = 11')
	dw_8.modify("DataWindow.print.margin.left = " + ls_left )
	dw_8.modify("DataWindow.print.margin.top  = " + ls_top  )
	dw_8.Modify('DataWindow.Print.Orientation = 1')
	dw_8.settransobject(sqlca)
	WF_Print(dw_8)
	dw_8.print()
end if
		
dw_8.dataobject = old_dwnm	

/////////////////////////////////////////////////////////////////////
// 출고봉투
/////////////////////////////////////////////////////////////////////
if cbx_2.checked = true then
	DataWindowChild ldwc_cargbn
	
	dw_1.getchild("do_car_gbn", ldwc_cargbn)

	// 프린트 선택
	string ls_setprn
	
	ls_setprn = trim(sle_prt.text)
	if ls_setprn = "" then
		MessageBox("확인","출고봉투 프린터 이름을 입력하시기 바랍니다.")
	else
		PrintSetPrinter( ls_setprn )

		dw_7.dataobject = "d_label_main_prt"
		dw_7.settransobject(sqlca)
	
		dw_7.object.car[1] = ldwc_cargbn.getitemstring(ldwc_cargbn.getrow(),'item_nm')
	
		ls_custno  = dw_1.object.cust_no[1]	
		SELECT cust_name INTO :ls_custnm FROM customer WHERE cust_no = :ls_custno;
		
		ls_scene   = dw_1.object.spot_code[1]
		SELECT scene_desc INTO :ls_scenenm FROM scene  WHERE scene_code = :ls_scene;
		
		dw_7.object.cust_name[1]  = ls_custnm
		dw_7.object.scene_name[1] = ls_scenenm
		dw_7.object.scene_tel[1]  = dw_1.object.tel_no[1]
		dw_7.object.scene_addr[1] = dw_1.object.shipto_addr[1]
		
		// 양식지 가로보기
		dw_7.Modify('DataWindow.Print.Orientation = 2')
		dw_7.print()
	end if
end if
/////////////////////////////////////////////////////////////////////


string ls_search_do_no

ls_search_do_no = trim(dw_1.object.do_no[1])
UPDATE DO
   SET prt_date = getdate()
 WHERE do_no = :ls_search_do_no AND prt_date IS NULL;
if sqlca.sqlcode = 0 then
	COMMIT;
else
	ROLLBACK;
	MessageBox('확인', '출력일시가 정상적으로 저장되지 않았습니다.')
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiprint_m
integer x = 3867
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
integer x = 3675
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
				  ls_start + "~~' and " + "~~'" + ls_end + "~~'	order by do.do_no desc"
else
	IF isnull(ls_scene_code) then
		ls_where = " WHERE cust_no = ~~'" &
					  + ls_cust_no + "~~' and do.do_date between ~~'" + &
						  ls_start + "~~' and " + "~~'" + ls_end + "~~'	order by do.do_no desc"
	else
		ls_where = " WHERE cust_no = ~~'" + ls_cust_no  + &
						  "~~' and spot_code = ~~'" +  ls_scene_code + &
					  		"~~' AND do.do_date between ~~'" + &
						  ls_start + "~~' and " + "~~'" + ls_end + "~~' order by do.do_no desc"
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
integer x = 1115
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
integer width = 1079
integer height = 696
integer taborder = 180
integer textsize = -10
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiprint_m
integer x = 3241
integer y = 16
integer width = 1225
integer height = 208
integer taborder = 70
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oigiprint_m
integer x = 32
integer y = 1008
integer width = 4439
integer height = 1160
integer taborder = 150
string dataobject = "d_oidoupdate_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event doubleclicked;//IF dw_4.rowcount() > 0 THEN
//  	open(w_oigiupdateysp_m)
//ELSE
//	messagebox("확인", "출고상세에 Y.S.P내역이 존재하지 않습니다.", information!)
//END IF
end event

type gb_6 from groupbox within w_oigiprint_m
integer x = 1765
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
integer x = 1115
integer y = 448
integer width = 3355
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
integer x = 1147
integer y = 352
integer width = 2898
integer height = 92
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_oigiuodate_ps"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_cust_no, ls_where, ls_sql, ls_null
long   ll_cnt

IF dwo.name <> 'cust_no' THEN	return

dw_3.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)

this.accepttext()

ls_cust_no = this.getitemstring(1, "cust_no")	
setnull(ls_null)
this.object.scene_code[1] = ls_null

select count(*) into :ll_cnt from scene where cust_no = :ls_cust_no;
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
integer width = 1051
integer height = 628
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oiupdateordno_s"
boolean hscrollbar = true
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

integer li_count, li_idx, li_chk
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

type em_1 from editmask within w_oigiprint_m
integer x = 1792
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

end event

type em_2 from editmask within w_oigiprint_m
integer x = 1888
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

type st_1 from statictext within w_oigiprint_m
integer x = 1792
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
integer x = 1033
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
integer x = 2007
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
integer x = 1157
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
integer x = 50
integer y = 236
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
integer x = 270
integer y = 236
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
integer x = 494
integer y = 236
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
string text = "화성"
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
integer x = 4073
integer y = 228
integer width = 393
integer height = 224
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
					continue
				end if
				this.object.c_chk[li_i] = 'N'
			next
		end if
end choose


end event

type cbx_source from checkbox within w_oigiprint_m
integer x = 3442
integer y = 244
integer width = 617
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
integer x = 992
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
integer x = 283
integer y = 8
integer width = 101
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_oigiving_r"
boolean livescroll = true
end type

type dw_8 from datawindow within w_oigiprint_m
integer x = 393
integer y = 8
integer width = 101
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oigiving_r_22_a5"
boolean livescroll = true
end type

type dw_6 from datawindow within w_oigiprint_m
string tag = "d_oigiving_r3_2"
integer x = 649
integer y = 8
integer width = 101
integer height = 80
integer taborder = 120
boolean bringtotop = true
string title = "d_oigiving_r2"
string dataobject = "d_oigiving_r2"
boolean livescroll = true
end type

type cbx_9 from checkbox within w_oigiprint_m
integer x = 2318
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
integer x = 2537
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

type cbx_11 from checkbox within w_oigiprint_m
integer x = 2318
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
integer x = 2537
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
integer x = 3273
integer y = 52
integer width = 187
integer height = 152
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "CrossTab!"
vtextalign vtextalign = multiline!
end type

event clicked;// Excel출력
string   ls_chk
datetime ldt_aa
datawindow dw_xls

if dw_2.rowcount() < 1 then RETURN

//MessageBox("확인","파일선택 창 표시가 지연될 수도 있습니다.")
//
pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

//SELECT item_cd INTO :ls_chk FROM codemst WHERE item_cd = 'DO_WEBPRINT' AND use_yn ='Y';
//if isnull(ls_chk) OR ls_chk = "" then
//	if cbx_10.checked = true then		// 인수
//		WF_Print(dw_8)
//	end if
//	
//	//
//	OLEObject OleExcel, xlSheet
//	
//	String  ls_Sheet
//	Integer iRet, ii_Sheet, iSheetCount
//	Long    ll_row, ll_Y, ll_X, ll_int
//	
//	String  ls_dodate, ls_register, ls_saler_name, ls_saler_cap, ls_saler_addr
//	string  ls_cust,   ls_cap_name, ls_scene,  ls_tel, ls_addr, ls_telno_cap
//	string  ls_item, ls_qa, ls_auom, ls_ship, ls_buom, ls_value, ls_comqty
//		
//	String ls_filename, named
//	String defext = ""
//	String Filter = "Microsoft Excel Files (*.xls*),*.xls*"
//	
//	if IsValid(OleExcel) then DESTROY OleExcel
//	if IsValid(xlSheet)  then DESTROY xlSheet
//	
//	OleExcel = CREATE OleObject
//	xlSheet  = CREATE OleObject
//	
//	iRet = GetFileOpenName("Microsoft Excel Files", ls_filename, named, defext, filter)
//	if iRet = 1 then
//		if ls_filename <> "" then
//			iRet = OleExcel.ConnectToNewObject("excel.application") 
//			if iRet <> 0 then DESTROY OleExcel 
//	
//			// Visible = True의 경우 엑셀 프로그램이 띄워지며, False인 경우 아이콘화된다. 
//			OleExcel.Application.Visible = true
//	
//			// 엑셀을 로드한 후 Empty Sheet를 연다. 
//			OleExcel.WorkBooks.Open(ls_filename) 
//			
//			iSheetCount = OleExcel.Application.Sheets.Count
//			ls_Sheet    = OleExcel.Application.Sheets(1).Name
//		else
//			RETURN
//		end if
//	else
//		RETURN
//	end if
//	
//	//
//	if IsValid(xlSheet) then DESTROY xlSheet
//	xlSheet = OleExcel.Application.Sheets(1)
//	
//	for ll_row = 1 To dw_8.rowcount()	
//		xlSheet.Cells[2, 4].Value = dw_8.GetItemString(1, "do_date")		// 발행일자
//		xlSheet.Cells[2, 6].Value = dw_8.GetItemString(1, "salesman")		// 유창영업담당
//		
//		xlSheet.Cells[2,16].Value = dw_8.GetItemString(1, "do_no")			// 출고번호
//		xlSheet.Cells[3, 4].Value = dw_8.GetItemString(1, "register")		// 등록번호
//		xlSheet.Cells[4, 4].Value = dw_8.GetItemString(1, "saler_name")	// 상호
//		xlSheet.Cells[4, 7].Value = dw_8.GetItemString(1, "saler_cap")		// 성명
//		xlSheet.Cells[5, 4].Value = dw_8.GetItemString(1, "saler_addr")	// 주소
//		
//		xlSheet.Cells[3,12].Value = dw_8.GetItemString(1, "cust")			// 거래처
//		xlSheet.Cells[3,16].Value = dw_8.GetItemString(1, "cap_name")		// 성명
//		xlSheet.Cells[4,12].Value = dw_8.GetItemString(1, "scene")			// 현장명
//		xlSheet.Cells[4,16].Value = dw_8.GetItemString(1, "tel")				// 인수자
//		xlSheet.Cells[5,12].Value = dw_8.GetItemString(1, "addr_1")			// 현장주소
//		xlSheet.Cells[5,16].Value = dw_8.GetItemString(1, "telno_cap")		// 인수자2
//		
//		ll_Y = 7
//		for ll_X = 1 to 16
//			ls_item   = dw_8.GetItemString(ll_row, "item_"+string(ll_X))	// 품목	
//			ls_qa     = dw_8.GetItemString(ll_row, "qa_"  +string(ll_X))	// 규격       
//			ls_auom   = dw_8.GetItemString(ll_row, "auom_"+string(ll_X))   // 단위
//			ls_ship   = dw_8.GetItemString(ll_row, "ship_"+string(ll_X))   // 수량
//			ls_buom   = dw_8.GetItemString(ll_row, "buom_"+string(ll_X))   // 단위
//			ls_comqty = dw_8.GetItemString(ll_row, "acc_" +string(ll_X))   // 환산수량
//			
//			if isnull(ls_item) OR ls_item = "" then
//				CONTINUE
//			end if
//			
//			xlSheet.Cells[ll_Y, 2].Value   = ls_item 		// 품명
//			xlSheet.Cells[ll_Y, 5].Value   = ls_qa 		// 규격
//			xlSheet.Cells[ll_Y, 8].Value   = ls_auom 		// 단위
//			xlSheet.Cells[ll_Y, 9].Value   = ls_ship 		// 수량
//			xlSheet.Cells[ll_Y,11].Value   = ls_buom 		// 단위
//			xlSheet.Cells[ll_Y,12].Value   = ls_comqty 	// 환산수량
//		
//			ll_Y      = ll_Y + 1
//		next
//		
//		xlSheet.Cells[23, 2].Value = dw_8.GetItemString(1, "dr_man")			// 
//		xlSheet.Cells[24,12].Value = ""			// 인수자,
//		
//		ll_int = ll_int + 1
//		if dw_8.rowcount() > 1 then
//			if ll_int < dw_8.rowcount() then
//				xlSheet.Rows("1:25").Copy
//				xlSheet.Rows("26:26").Insert( -4121 )		// Shift:=xlDown
//				
//				xlSheet.Range("A1").Select
//				OleExcel.Application.CutCopyMode = False	// Copy하기
//				
//				xlSheet.Rows("7:25").ClearContents			// Contents 삭제하기
//				xlSheet.Range("A1").Select			
//			end if
//		end if
//	next
//	
//	// Quits Excel
//	OleExcel.Application.Quit()
//	
//	iRet = OleExcel.DisconnectObject()       
//	If iRet < 0 then
//		MessageBox("ERROR","DisconnectObject Failed")
//	End If
//	
//	Destroy xlSheet
//	Destroy OleExcel
//	
//	SetPointer(oldpointer)
////	
//else
	cbx_10.checked = true
	
	if cbx_10.checked = true then		// 인수
		WF_Print(dw_9)
	end if
	
	dw_xls = dw_9
	
	string  ls_Docname, ls_Named, ls_ExpandName, ls_dono
	integer li_Value,   li_Pos
	
	ls_dono = dw_1.object.do_no[1]
	
	if dw_xls.rowcount() > 0 then
		ls_DocName  = GetCurrentDirectory() + "\" + ls_dono + ".csv"
	
		li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "CSV(쉽표로 분리), *.CSV,")
		li_Pos   = PosA(ls_Named, ".")
		ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
		if li_value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_xls.SaveAsASCII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
				dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
			MessageBox("확인","작업완료")
		end if
	end if	
	
	SetPointer(oldpointer)
//end if

end event

type dw_7 from datawindow within w_oigiprint_m
integer x = 763
integer y = 8
integer width = 101
integer height = 80
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_label_main_prt"
boolean livescroll = true
end type

type cbx_2 from checkbox within w_oigiprint_m
integer x = 2286
integer y = 244
integer width = 379
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
string text = "출고봉투"
end type

event clicked;//
string ls_prt

if this.checked = true then
	sle_prt.enabled = true

	ls_prt  = ProfileString("YCERP.INI","Database","DO_PRT", " ")	
	if isnull(ls_prt) OR ls_prt = "" then ls_prt = PrintGetPrinter()
	sle_prt.text = ls_prt
else
	sle_prt.enabled = false
end if

end event

type sle_prt from singlelineedit within w_oigiprint_m
integer x = 2670
integer y = 232
integer width = 741
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//
string ls_prt

ls_prt = sle_prt.text
SetProfileString("YCERP.INI", "Database", "DO_PRT", ls_prt)

end event

type dw_9 from datawindow within w_oigiprint_m
integer x = 503
integer y = 8
integer width = 101
integer height = 80
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_oigiving_r_21_xls"
boolean livescroll = true
end type

type st_left from statictext within w_oigiprint_m
integer x = 2834
integer y = 76
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
string text = "왼쪽"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_left from editmask within w_oigiprint_m
integer x = 2985
integer y = 64
integer width = 146
integer height = 64
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
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

type st_9 from statictext within w_oigiprint_m
integer x = 2834
integer y = 144
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
string text = "상단"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_top from editmask within w_oigiprint_m
integer x = 2985
integer y = 132
integer width = 146
integer height = 64
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
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

type cbx_bigo from checkbox within w_oigiprint_m
integer x = 1879
integer y = 244
integer width = 384
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
string text = "비고생략"
end type

type cbx_13 from checkbox within w_oigiprint_m
integer x = 722
integer y = 236
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
string text = "동부"
boolean checked = true
end type

event clicked;wf_dw4filter()
end event

type cbx_14 from checkbox within w_oigiprint_m
integer x = 933
integer y = 236
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
string text = "대전"
boolean checked = true
end type

event clicked;wf_dw4filter()
end event

type gb_7 from groupbox within w_oigiprint_m
integer x = 2286
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
integer x = 2789
integer y = 8
integer width = 402
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
string text = "출력여백"
end type

