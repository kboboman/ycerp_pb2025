$PBExportHeader$w_orsalecon_m.srw
$PBExportComments$판매수주확정(1998/04/06, 정재수)
forward
global type w_orsalecon_m from w_inheritance
end type
type dw_3 from datawindow within w_orsalecon_m
end type
type dw_4 from datawindow within w_orsalecon_m
end type
type st_1 from statictext within w_orsalecon_m
end type
type st_2 from statictext within w_orsalecon_m
end type
type em_1 from editmask within w_orsalecon_m
end type
type em_2 from editmask within w_orsalecon_m
end type
type cbx_1 from checkbox within w_orsalecon_m
end type
type dw_5 from datawindow within w_orsalecon_m
end type
type dw_6 from datawindow within w_orsalecon_m
end type
type rb_all from radiobutton within w_orsalecon_m
end type
type rb_part from radiobutton within w_orsalecon_m
end type
type dw_7 from datawindow within w_orsalecon_m
end type
type em_3 from editmask within w_orsalecon_m
end type
type dw_8 from datawindow within w_orsalecon_m
end type
type rb_2 from radiobutton within w_orsalecon_m
end type
type rb_3 from radiobutton within w_orsalecon_m
end type
type st_5 from statictext within w_orsalecon_m
end type
type pb_4 from picturebutton within w_orsalecon_m
end type
type st_4 from statictext within w_orsalecon_m
end type
type ddlb_fld from dropdownlistbox within w_orsalecon_m
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalecon_m
end type
type st_6 from statictext within w_orsalecon_m
end type
type sle_value from singlelineedit within w_orsalecon_m
end type
type cb_1 from commandbutton within w_orsalecon_m
end type
type cb_2 from commandbutton within w_orsalecon_m
end type
type cb_3 from commandbutton within w_orsalecon_m
end type
type cb_5 from commandbutton within w_orsalecon_m
end type
type st_vertical from u_splitbar_vertical within w_orsalecon_m
end type
type st_3 from statictext within w_orsalecon_m
end type
type dw_9 from datawindow within w_orsalecon_m
end type
type cbx_2 from checkbox within w_orsalecon_m
end type
type st_horizontal from u_splitbar_horizontal within w_orsalecon_m
end type
type dw_10 from datawindow within w_orsalecon_m
end type
type cbx_history from checkbox within w_orsalecon_m
end type
type cbx_sms from checkbox within w_orsalecon_m
end type
type gb_4 from groupbox within w_orsalecon_m
end type
type rb_1 from radiobutton within w_orsalecon_m
end type
type ddlb_op from dropdownlistbox within w_orsalecon_m
end type
type cb_confirm from commandbutton within w_orsalecon_m
end type
type cb_cancel from commandbutton within w_orsalecon_m
end type
type rb_total from radiobutton within w_orsalecon_m
end type
type rb_unit from radiobutton within w_orsalecon_m
end type
type gb_5 from groupbox within w_orsalecon_m
end type
end forward

global type w_orsalecon_m from w_inheritance
integer x = 5
integer y = 136
integer width = 5824
integer height = 3088
string title = "판매수주 확정(w_orsalecon_m)"
dw_3 dw_3
dw_4 dw_4
st_1 st_1
st_2 st_2
em_1 em_1
em_2 em_2
cbx_1 cbx_1
dw_5 dw_5
dw_6 dw_6
rb_all rb_all
rb_part rb_part
dw_7 dw_7
em_3 em_3
dw_8 dw_8
rb_2 rb_2
rb_3 rb_3
st_5 st_5
pb_4 pb_4
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_vertical st_vertical
st_3 st_3
dw_9 dw_9
cbx_2 cbx_2
st_horizontal st_horizontal
dw_10 dw_10
cbx_history cbx_history
cbx_sms cbx_sms
gb_4 gb_4
rb_1 rb_1
ddlb_op ddlb_op
cb_confirm cb_confirm
cb_cancel cb_cancel
rb_total rb_total
rb_unit rb_unit
gb_5 gb_5
end type
global w_orsalecon_m w_orsalecon_m

type variables
datawindowchild idwc_qa, idwc_item, idwc_cust
st_sale_ysp ist_ysp

string  	is_yn_flag, is_confirm_flag, is_price_update, is_confirm
string  	is_flag, is_won = "WON", is_view_chk = 'Y'
string	is_salesman	

end variables

forward prototypes
public subroutine wf_multiprint ()
public subroutine wf_calc ()
public subroutine wf_ret (string as_order)
end prototypes

public subroutine wf_multiprint ();////Windows Registry Editor Version 5.00
////[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows]
////"Device"="\\\\내컴\\HP LaserJet 4V,winspool,Ne04:"
////프린터가 여러대라고 하니, 아마도 랜으로 공유한것 같네요.
////위와 같은 레지스트리를 수정하시고 프린터 하시면 되겠네요. 디바이스 명을 수정하시면 기본 프린터가 변경 될것입니다.
////[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Devices] 에 프린터 이름이 나옵니다.
////여기에 올라 와 있는 프린터 이름중에서 기본 프린터로 정하고자 하는 것을 디바이스에 적어 주시면 될 것입니다.
// 
////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
////Microsoft Fax,WPSUNI,FAX
//
//
////LONG msgHWND_BROADCAST = 65535 // HEX FFFF
////LONG msgWM_WININICHANGE = 26   // HEX 1A
////
//////// 첫번째프린터에는 FAX(시화로 출력)
//////WriteProfileStringA("windows", "device", &
//////				"Microsoft Fax,WPSUNI,FAX");
//////WriteProfileStringA("","",""); // flushes cached WIN.INI
//////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
//////dw_7.print()
////// 첫번째프린터에는 HP5000(시화로 출력)
////WriteProfileStringA("windows", "device", &
////				"HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\192.168.1.11");
////WriteProfileStringA("","",""); // flushes cached WIN.INI
////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////dw_7.print()
//
////// 두번째프린터에는 4MV(목동(판매부)으로 출력)
////WriteProfileStringA("windows", "device", &
////				"HP LaserJet 4MV,HPPCL5MS,\\HP_Network_Printers\122.1.1.203");
////WriteProfileStringA("","",""); // flushes cached WIN.INI
////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////dw_7.print()
//
////시화에서 목동프린터(HP NET PRINTER : 4MV) 로 프린팅과
//// 시화 HP NET PRINTER(HP5000) 로 의 동시 프린팅 테스트
//////			dw_7.print()
//// SYSEDIT.EXE "WIN.INI"의 프린터 구성정보의 마직막에 있음
////원래는 HP LaserJet 4MV=HPPCL5MS,4mv_122.1.1.192
////       HP LaserJet 5000 PCL 6=HPBXLB,\\HP_Network_Printers\203.240.212.201
//// 로 "="을 "," 로만 바꾸면 됨
////HP LaserJet 4MV,HPPCL5MS,4mv_122.1.1.192
////HP LaserJet 5000 PCL 6,HPBXLB,\\HP_Network_Printers\203.240.212.201
////Microsoft Fax,WPSUNI,FAX
//
//dw_7.dataobject = 'd_orsale_print2'
//dw_7.settransobject(sqlca)
//
//string ls_dw7sql, ls_sql,ls_where
//
//		ls_dw7sql = dw_7.describe("datawindow.table.select")
//		ls_where = " and sale.order_no between ~~'hd20040317-001~~'" &
//					+ " and ~~'hd20040317-003~~'"  
//		ls_sql = "datawindow.table.select = '" + ls_dw7sql + ls_where + "'"
//			
//		dw_7.modify(ls_sql)
//		dw_7.retrieve()
//
//LONG msgHWND_BROADCAST = 65535 // HEX FFFF
//LONG msgWM_WININICHANGE = 26   // HEX 1A
//WriteProfileStringA("windows", "device", &
//				"HP LaserJet 5100 PCL 6,HPBXLB,\\HP_Network_Printers\192.168.1.11");
//////WriteProfileStringA("","",""); // flushes cached WIN.INI
////Send(msgHWND_BROADCAST, msgWM_WININICHANGE, 0, 0);
////dw_7.Modify('DataWindow.Print.Orientation = 1')
////\\192.168.3.30\tsc-243 xp,winspool,Ne09:
//dw_7.print()
////\\박상준\hp officejet 6100 series,winspool,Ne00:
////"HP officejet 6100 series,HPBXLB,\\
//
end subroutine

public subroutine wf_calc ();long    ll_row
string  ls_tax_sign
decimal lr_amt

dw_2.accepttext( )
dw_3.accepttext( )
if dw_2.rowcount( ) < 1 then return

//공급가액, V.A.T계산
if dw_3.rowcount() > 0 then
	for ll_row = 1 to dw_3.rowcount() step 1
		lr_amt = lr_amt + dw_3.getitemdecimal(ll_row, "amount")
	next
	
	dw_2.object.sale_amount[1] = lr_amt
	ls_tax_sign = dw_2.getitemstring(1, "tax_sign")
	if ls_tax_sign = 'Y' then
		dw_2.object.sale_tax[1] = 0
		// 20080123 부가세 계산방식 변경
		IF dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 0 )
		else
		   dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 2 )
		end if
	else
		dw_2.object.sale_tax[1] = 0
	end if
end if

end subroutine

public subroutine wf_ret (string as_order);string ls_confirm_flag, ls_scene_code, ls_scene_name

dw_2.setredraw(false)
dw_2.retrieve(as_order)
if dw_2.rowcount() < 1 then return

ls_scene_code = dw_2.object.scene_code[1]
setnull(ls_scene_name)
SELECT scene_desc INTO :ls_scene_name 
  FROM scene
 WHERE scene_code = :ls_scene_code;
 
dw_2.setredraw(true)
if is_won <> dw_2.object.curr_code[1] then
	if dw_2.object.curr_code[1] = 'WON' then
		dw_3.dataobject = 'd_orsalecon_m1'
		dw_3.settransobject(sqlca)
		is_won = "WON"
	else
		dw_3.dataobject = 'd_orsalecon_m2'
		dw_3.settransobject(sqlca)
		is_won = "ANY"
	end if
end if
dw_3.retrieve(as_order)


end subroutine

on w_orsalecon_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_1=create st_1
this.st_2=create st_2
this.em_1=create em_1
this.em_2=create em_2
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.rb_all=create rb_all
this.rb_part=create rb_part
this.dw_7=create dw_7
this.em_3=create em_3
this.dw_8=create dw_8
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_5=create st_5
this.pb_4=create pb_4
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_vertical=create st_vertical
this.st_3=create st_3
this.dw_9=create dw_9
this.cbx_2=create cbx_2
this.st_horizontal=create st_horizontal
this.dw_10=create dw_10
this.cbx_history=create cbx_history
this.cbx_sms=create cbx_sms
this.gb_4=create gb_4
this.rb_1=create rb_1
this.ddlb_op=create ddlb_op
this.cb_confirm=create cb_confirm
this.cb_cancel=create cb_cancel
this.rb_total=create rb_total
this.rb_unit=create rb_unit
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.dw_5
this.Control[iCurrent+9]=this.dw_6
this.Control[iCurrent+10]=this.rb_all
this.Control[iCurrent+11]=this.rb_part
this.Control[iCurrent+12]=this.dw_7
this.Control[iCurrent+13]=this.em_3
this.Control[iCurrent+14]=this.dw_8
this.Control[iCurrent+15]=this.rb_2
this.Control[iCurrent+16]=this.rb_3
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.pb_4
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.ddlb_fld
this.Control[iCurrent+21]=this.ddlb_dwtitles
this.Control[iCurrent+22]=this.st_6
this.Control[iCurrent+23]=this.sle_value
this.Control[iCurrent+24]=this.cb_1
this.Control[iCurrent+25]=this.cb_2
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.st_vertical
this.Control[iCurrent+29]=this.st_3
this.Control[iCurrent+30]=this.dw_9
this.Control[iCurrent+31]=this.cbx_2
this.Control[iCurrent+32]=this.st_horizontal
this.Control[iCurrent+33]=this.dw_10
this.Control[iCurrent+34]=this.cbx_history
this.Control[iCurrent+35]=this.cbx_sms
this.Control[iCurrent+36]=this.gb_4
this.Control[iCurrent+37]=this.rb_1
this.Control[iCurrent+38]=this.ddlb_op
this.Control[iCurrent+39]=this.cb_confirm
this.Control[iCurrent+40]=this.cb_cancel
this.Control[iCurrent+41]=this.rb_total
this.Control[iCurrent+42]=this.rb_unit
this.Control[iCurrent+43]=this.gb_5
end on

on w_orsalecon_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.rb_all)
destroy(this.rb_part)
destroy(this.dw_7)
destroy(this.em_3)
destroy(this.dw_8)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_5)
destroy(this.pb_4)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_vertical)
destroy(this.st_3)
destroy(this.dw_9)
destroy(this.cbx_2)
destroy(this.st_horizontal)
destroy(this.dw_10)
destroy(this.cbx_history)
destroy(this.cbx_sms)
destroy(this.gb_4)
destroy(this.rb_1)
destroy(this.ddlb_op)
destroy(this.cb_confirm)
destroy(this.cb_cancel)
destroy(this.rb_total)
destroy(this.rb_unit)
destroy(this.gb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
st_vertical.of_set_leftobject( dw_4 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_4 )
st_horizontal.of_set_topobject( dw_2 )
st_horizontal.of_set_bottomobject( dw_3 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.SetTransObject(SQLCA)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)

dw_9.visible  = false
dw_10.visible = false
rb_1.visible    = false

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
GS_DS_whcustret.sharedata(idwc_cust)

dw_3.getchild("item_no", idwc_item)
GS_DS_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
GS_DS_qaall.ShareData(idwc_qa)

dw_4.object.confirm_date.visible = false		// 확정일자
dw_4.setsort( "input_date desc, order_no" )
dw_4.sort()

dw_1.insertrow(0)
dw_1.object.cust_no.background.color = 78682240

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')
em_3.text = "HD" + string(today(), "yyyymmdd")

if gs_area = "B0001" THEN  // YSP사업장
	rb_1.checked = true
	rb_1.triggerevent(clicked!)
else								// "S0001" //: 시화
	rb_2.checked = true
	rb_2.triggerevent(clicked!)
end if

dw_5.visible = false
dw_6.visible = false
dw_7.visible = false

// 주문일자
em_1.SelectText(9, 2)
em_1.setfocus()

// 단가수정 권한
if GF_Permission("판매수주확정_단가수정", gs_userid) = "Y" then
	is_price_update = 'Y'
else
	is_price_update = 'N'
end if

// 품목 추가,삭제
pb_insert.visible = false
pb_delete.visible = false

// 수주확정(Y/N) 사용자등록 
if GF_Permission("판매수주확정", gs_userid) = "Y" then
	cb_confirm.enabled		= true
	cb_cancel.enabled   		= false
	pb_print_part.enabled 	= true	// 재고대체
else
	cb_confirm.enabled		= false
	cb_cancel.enabled   		= false
	pb_print_part.enabled	= false	// 재고대체
end if

//계열사 담당 영업사원(길병학)
select 
	rtrim(ltrim(detl_nm)) 
into
	:is_salesman
from 
	yc_codemst 
where 
	mast_cd = 'E001' 
and 
	detl_cd = 'MAN'
using sqlca;

if gf_null_chk(is_salesman) then
	is_salesman = '%'
end if

//계열사 수주 담당자(sort 9인 경우)
long ll_cnt
select 
	count(*)
into
	:ll_cnt
from 
	codemst 
where 
	type = '판매수주확정' 
AND 
	use_yn  = 'Y' 
and 
	sort = 9
and
	item_cd = :gs_userid
using sqlca;	

if ll_cnt > 0 then
	rb_total.enabled	= false
	rb_total.checked	= false
	rb_unit.checked	= true
end if
end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = dw_4.height

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_2.x * 2)

dw_3.width  = newwidth  - (gb_2.x * 2)
dw_3.height = newheight - dw_3.y - gb_2.x

dw_9.width  = 2889
dw_9.x      = ( newwidth  - dw_9.width ) / 2
dw_9.y      = ( newheight - dw_9.height) / 2 - 500


dw_10.x     = dw_2.x
dw_10.y     = dw_3.y
dw_10.width = newwidth  - dw_10.x - gb_2.x - 100
dw_10.height= dw_3.height
end event

type pb_save from w_inheritance`pb_save within w_orsalecon_m
integer x = 4713
integer y = 44
integer taborder = 140
end type

event pb_save::clicked;string	ls_open_close, ls_sale_confirm, ls_order_no, ls_terms, ls_cust_no
Decimal	ld_pricemin
string  	ls_itemcost, ls_qacost, ls_uomcost
long		ll_row

//금액 다시 계산
wf_calc()

if dw_2.accepttext( ) = -1 then return
if dw_3.accepttext( ) = -1 then return
if dw_2.rowcount() < 1 then RETURN

//한도 초과 및 확정여부 확인
ls_order_no	= dw_2.getitemstring(1, 'order_no')
ls_cust_no	= dw_2.getitemstring(1, 'cust_no')

//ls_open_close		= 'O'		//O: 등록, C: 마감, X: 취소, Z: 한도초과
//ls_sale_confirm	= 'N'		//N: 등록, T: 수주확정, Y: 생산확정
//
//select
//	 confirm_flag
//	,open_close
//into
//	 :ls_sale_confirm
//	,:ls_open_close
//from
//	sale
//where
//	order_no = :ls_order_no
//using sqlca;	
//
//if ls_sale_confirm <> 'N' then
//	MessageBox("주의","확정된 수주건은 수정할 수 없습니다.")
//	return
//end if

////한도 초과 수건건 확인
//if ls_open_close = 'Z' then
//	MessageBox("주의","한도 초과 수주건은 수정할 수 없습니다.~r~n수주 취소 후 진행하세요.")
//	RETURN
//end if

// 선입금 업체 체크(선입금, 선입금해지)
select 
	rtrim(terms) 
into 
	:ls_terms 
from 
	customer 
where 
	cust_no = :ls_cust_no;
choose case ls_terms
	case "선입금해지"
		MessageBox("확인","선입금해지 된 업체 입니다. 영업지원팀에 문의 바랍니다.!",stopsign!)
		RETURN
end choose

///////////////////////////////////////////////////////////////////////////////////////////
// 최저단가
///////////////////////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw_3.rowcount()
   ls_itemcost = dw_3.object.item_no[ll_row]
	ls_qacost   = dw_3.object.qa[ll_row]
	ls_uomcost  = dw_3.object.uom[ll_row]
	
	if ls_uomcost = "M" then
		ls_qacost = LeftA(ls_qacost,13)
	else
		ls_qacost = ls_qacost
	end if

	// 최저단가
	SELECT 
		price_min 
	INTO 
		:ld_pricemin 
	FROM 
		itemcost 
	WHERE 
		item_no = :ls_itemcost 
	AND 
		qa = :ls_qacost 
	AND 
		uom = :ls_uomcost
	using sqlca;
	
	if isnull(ld_pricemin) then
	else
		if dw_3.Object.price[ll_row] < ld_pricemin then
			if MessageBox("단가확인","최저단가 이하금액으로 등록할 수 없습니다." + &
							  + "~n~n계속 등록하시겠습니까?",Exclamation!, YesNo!, 2) = 2 then
				dw_3.scrolltorow(ll_row)			
				dw_3.setfocus()
				RETURN
			end if
		end if
	end if
next

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)

if WF_Update2(dw_2, dw_3, 'Y') = false then RETURN

pb_retrieve.PostEvent(Clicked!)	
end event

type dw_1 from w_inheritance`dw_1 within w_orsalecon_m
integer x = 2446
integer y = 116
integer width = 933
integer height = 88
integer taborder = 50
boolean enabled = false
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
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

event dw_1::itemchanged;call super::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

type st_title from w_inheritance`st_title within w_orsalecon_m
integer x = 32
integer y = 40
integer width = 901
long textcolor = 255
string text = "판매수주 확정"
end type

type st_tips from w_inheritance`st_tips within w_orsalecon_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsalecon_m
integer x = 1477
integer y = 56
integer width = 169
integer height = 120
integer taborder = 30
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::clicked;// 수주번호 조회
string ls_orderno, ls_confirm
long   ll_row

ls_orderno = trim(em_3.text)
if isnull(ls_orderno) or ls_orderno = '' then RETURN

SELECT confirm_flag INTO :ls_confirm FROM sale WHERE order_no = :ls_orderno;
if isnull(ls_confirm) or ls_confirm = "" then 
	em_3.setfocus()
	RETURN
end if

if ls_confirm = "Y" then
	dw_2.object.sale_confirm_flag.TabSequence = 0
	MessageBox("확인", "생산계획 확정된 수주입니다.(품목별 비고 수정은 가능합니다.)")
	em_3.SelectText(13, 3)
	em_3.setfocus()
	//RETURN
else
	dw_2.object.sale_confirm_flag.TabSequence = 120	
end if

wf_ret(ls_orderno)
this.default = false
pb_compute.setfocus()
// bonggie : 조봉기
// kjchoi : 최귀주 - 수출건 확정만. dw_2의 retrieveend 에서 처리
end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_orsalecon_m
integer x = 3456
integer y = 268
integer width = 315
integer height = 112
integer taborder = 200
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고대체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::mousemove;//
end event

event pb_print_part::clicked;call super::clicked;long   ll_found
string ls_qa
string ls_olditem, ls_oldqa, ls_oldloc, ls_newitem, ls_newqa, ls_newloc, ls_old_time
real   lr_qty
long   ll_count, ll_row
datetime ldt_date

ll_row = dw_3.getrow()
if ll_row < 1 then return

gs_alter_str istr_where

istr_where.order_no  = dw_2.object.order_no[1]
istr_where.seq       = dw_3.object.seq_no[ll_row]
istr_where.cust_name = trim(dw_2.object.customer_cust_name[1])
istr_where.item_no   = trim(dw_3.object.item_no[ll_row])
istr_where.item_name = trim(dw_3.object.item_item_name[ll_row])
istr_where.qa        = trim(dw_3.object.qa[ll_row])
istr_where.uom       = trim(dw_3.object.uom[ll_row])
istr_where.order_qty = dw_3.object.order_qty[ll_row] - dw_3.object. rlse_qty[ll_row]
istr_where.chk       = "S" // "S": 수주확정시 대체 저장 "D":출고시 대체저장

OpenWithParm(w_whalter_w, istr_where)
istr_where = message.powerobjectparm
if istr_where.chk = "N" then	return

end event

type pb_close from w_inheritance`pb_close within w_orsalecon_m
integer x = 5504
integer y = 44
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalecon_m
integer x = 4507
integer y = 44
integer taborder = 120
end type

event pb_print::clicked;gs_itembaldo_str  ist_code
w_repsuper w_print
st_print   l_print

string ls_where, ls_sql, ls_dw5sql
 
if dw_4.getrow() > 0 then
	ist_code.start_no = dw_4.object.order_no[dw_4.getrow()]
	ist_code.end_no   = dw_4.object.order_no[dw_4.getrow()]
	ist_code.start_date = string(dw_2.object.order_date[dw_2.getrow()],"yyyy/mm/dd")
	ist_code.end_date = string(dw_2.object.order_date[dw_2.getrow()],"yyyy/mm/dd")
end if

string ls_scenehp
if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

openwithparm(w_whsaledet_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if ist_code.sel_flag = 'S' then
	l_print.st_print_desc = " 이 프로그램은 수주상황접수부를 출력합니다." 
	dw_7.dataobject = 'd_orsale_print2'
ELSE
	l_print.st_print_desc = " 이 프로그램은 수주내역 리스트를 출력합니다." 
	dw_7.dataobject = 'd_orsale_print3'
end if
dw_7.settransobject(sqlca)
ls_dw5sql = dw_7.describe("datawindow.table.select")

if ist_code.order_flag = 'O' then
// 2017.12.18 조원석	d_orsale_print4 만들고, 데이터윈도우 분리 
// 분리 이유는 알수 없는 like 오류 발생, 쿼리부분 주석처리. 시작
//	ls_where = " and sale.order_no between ~~'" + ist_code.start_no + "~~'" &
//				+ " and ~~'" + ist_code.end_no + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//	
//	
//	dw_7.modify(ls_sql)
	dw_7.dataobject = 'd_orsale_print2'
	dw_7.settrans( sqlca)
	
	dw_7.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)
else
	
//	ls_where = " and sale.order_date between ~~'" + ist_code.start_date + "~~'" &
//				+ " and ~~'" + ist_code.end_date + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_7.modify(ls_sql)
// 분리 이유는 알수 없는 like 오류 발생, 쿼리부분 주석처리. 끝
	dw_7.dataobject = 'd_orsale_print4'
	dw_7.settrans( sqlca)
	dw_7.retrieve( ls_scenehp, ist_code.start_date,  ist_code.end_date, ist_code.do_flag)
	
end if

l_print.st_datawindow = dw_7
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'
// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_orsalecon_m
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 260
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "납기조정"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;dw_8.reset()
//dw_7.insertrow(0)
dw_8.visible = true
end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_orsalecon_m
integer x = 3291
integer y = 268
integer width = 155
integer height = 112
integer taborder = 280
boolean enabled = false
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;dwitemstatus l_status
dec     ld_qoh, lr_amt
string  ls_vat, ls_confirm_flag, ls_item_no, ls_com_item, ls_qa, ls_tax_sign
string  ls_com_item1, ls_com_item2, ls_order_no, ls_order_no1, ls_area_no, ls_conf
integer li_revision_no, li_flag, li_seq, ll_row, li_cnt

if dw_3.rowcount() < 2 then return

dw_2.accepttext()
dw_3.accepttext()
 
ls_area_no  = dw_2.getitemstring(1, "sale_area_no")
ls_order_no = dw_2.object.order_no[1]
IF LeftA(ls_area_no,1) = 'B' THEN		// YSP 사업장(반월)
	setnull(ls_conf)
	SELECT ysp_confirm INTO :ls_conf	FROM sale 
	 WHERE order_no = :ls_order_no;
	if ls_conf = 'Y' then
		messagebox("확인","이 주문은 생산접수가 완료된 주문입니다.~r~nYSP생산관리자 협의하시기바랍니다.")
		return
	end if
END IF

l_status        = dw_3.getitemstatus(dw_3.getrow(), 0, primary!)
ls_confirm_flag = dw_2.getitemstring(1, "sale_confirm_flag")
li_revision_no  = dw_2.getitemnumber(1, "revision_no")
li_seq          = dw_3.getitemnumber(dw_3.getrow(), "seq_no")

if dw_3.object.rlse_qty[dw_3.getrow()] > 0 then
	messagebox("확인","이미 출고된 수주입니다.~r~n물품을 삭제할 수 없습니다.", exclamation!)
   return
end if
if dw_3.object.saledet_issue_qty[dw_3.getrow()] > 0 then
	messagebox("확인","이미 출고지시된 수주입니다.~r~n물품을 삭제할 수 없습니다.", exclamation!)
   return
end if

//생산계획여부 체크
ls_order_no1 = ''
li_cnt = 0
SELECT  count(*) INTO :li_cnt 
  FROM mps, mpsdet  
 WHERE mps.order_no   = mpsdet.order_no and  
	    mpsdet.sale_no = :ls_order_no and
		 mpsdet.seq_no  = :li_seq and
		 mps.open_close = 'P';
IF li_cnt > 0 then
	messagebox("확인","이미 생산중인 수주입니다.~r~n물품을 삭제할 수 없습니다.", exclamation!)
   return
else
	li_cnt = 0
	SELECT count(*) INTO :li_cnt	
	  FROM routtempnew 
	 WHERE sale_no    = :ls_order_no
		and seq_no     = :li_seq
		and process_flag <>'c';
	IF li_cnt > 0 then
		messagebox("확인","이미 생산계획조정에 자료가 있습니다. 생산관리자와 협의하십시요.", exclamation!)
		return 
	end if
end if

ls_item_no = dw_3.getitemstring(dw_3.getrow(), "item_no")
ls_qa      = dw_3.getitemstring(dw_3.getrow(), "qa")
ld_qoh     = dw_3.getitemnumber(dw_3.getrow(), "sol_qty")
if l_status = newmodified! then
	dw_3.deleterow(dw_3.getrow())
elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	dw_3.deleterow(dw_3.getrow())
	li_revision_no = li_revision_no + 1
	dw_2.object.revision_no[1]   = li_revision_no
	dw_2.object.revision_date[1] = wf_today()
	dw_2.accepttext()
	dw_3.accepttext()
   if dw_3.rowcount() > 0 then
	   for ll_row = 1 to dw_3.rowcount() step 1
		   lr_amt = lr_amt + dw_3.getitemdecimal(ll_row, "amount")
   	next
	
	   dw_2.object.sale_amount[1] = lr_amt
   	ls_tax_sign = dw_2.getitemstring(1, "tax_sign")
	   if ls_tax_sign = 'Y' then
			dw_2.object.sale_tax[1] = 0
			// 20080123 부가세 계산방식 변경
			IF dw_2.object.curr_code[1] = 'WON' then
				dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 0 )
			else
				dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 2 )
			end if
			///*		
			//		IF dw_2.object.curr_code[1] = 'WON' then
			////		   dw_2.object.sale_tax[1] = truncate(lr_amt / 10, 0)
			//			for ll_row = 1 to dw_3.rowcount()
			//			    dw_2.object.sale_tax[1] = dw_2.object.sale_tax[1] + TRUNCATE((dw_3.object.amount[ll_row] / 10) + 0.0000001, 0 )
			//			next
			//		else
			////		   dw_2.object.sale_tax[1] = lr_amt / 10
			//			for ll_row = 1 to dw_3.rowcount()
			//			    dw_2.object.sale_tax[1] = dw_2.object.sale_tax[1] + TRUNCATE((dw_3.object.amount[ll_row] / 10) + 0.0000001, 2 )
			//			next
			//		end if
			//*/			
   	else
	   	dw_2.object.sale_tax[1] = 0
   	end if
   end if	
	
//	//delete mpsdet ,routtempnew, (mps)
//	string ls_mps_order_no // 생산계획번호
//	
//	select order_no into :ls_mps_order_no from mpsdet
//	 WHERE sale_no = :ls_order_no and
//			 seq_no = :li_seq;
	
//	DELETE FROM mpsdet
//    WHERE sale_no = :ls_order_no and
//	 		 seq_no = :li_seq;
//	 		
//	DELETE FROM routtempnew
//    WHERE sale_no = :ls_order_no and
//			 seq_no = :li_seq;
//			
//	int li_mpsdet_cnt  //생산계획상세 갯수
//	
//	li_mpsdet_cnt = 0
//	select count(*) into :li_mpsdet_cnt from mpsdet
//    WHERE sale_no = :ls_order_no;
//	if li_mpsdet_cnt = 0 then  // 생산계획상세 갯수 가 0 이면 생산계획헤더 를 삭제
//		DELETE FROM mps
//   	WHERE order_no = :ls_mps_order_no;
//	end if

	if wf_update2(dw_2,dw_3,'Y') = false then return
//	dw_2.reset()
//	dw_3.reset()
//	dw_4.reset()
//	pb_retrieve.postevent(clicked!)		
end if

end event

type pb_insert from w_inheritance`pb_insert within w_orsalecon_m
integer x = 3127
integer y = 268
integer width = 155
integer height = 112
integer taborder = 290
boolean default = true
end type

event pb_insert::clicked;long    ll_row, ll_seq, ll_front
string  ls_confirm_flag, ls_area_no, ls_order_no, ls_conf
decimal lr_order_qty

if dw_2.rowcount() < 1 then return
if wf_nullchk(dw_3) = false then	return

dw_2.accepttext()
dw_3.accepttext()

ls_area_no  = dw_2.getitemstring(1, "sale_area_no")
ls_order_no = dw_2.object.order_no[1]
IF LeftA(ls_area_no,1) = 'B' THEN
	setnull(ls_conf)
	SELECT ysp_confirm INTO :ls_conf	FROM sale 
	 WHERE order_no = :ls_order_no;
	if ls_conf = 'Y' then
		messagebox("확인","이 주문은 생산접수가 완료된 주문입니다.~r~nYSP생산관리자 협의하시기바랍니다.")
		return
	end if
END IF

if dw_3.getrow() > 0 then
	lr_order_qty = dw_3.getitemdecimal(dw_3.getrow(), "order_qty")
	if lr_order_qty = 0 then
		messagebox("확인","주문수량을 입력하세요!",exclamation!)
		dw_3.setcolumn("order_qty")
		dw_3.setfocus()
		return
	end if
end if

setpointer(hourglass!)
ll_row = dw_3.insertrow(0)
dw_3.scrolltorow(ll_row)

ll_seq = dw_3.rowcount()
if ll_seq > 1 then
	ll_front = dw_3.object.seq_no[ll_row - 1]
	dw_3.object.seq_no[ll_row] = ll_front + 1
else
	dw_3.object.seq_no[ll_row] = ll_row
end if
dw_3.object.order_no[ll_row] = dw_2.object.order_no[1]

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsalecon_m
integer x = 4302
integer y = 44
integer taborder = 100
boolean default = true
end type

event pb_retrieve::clicked;string ls_cust_no, ls_confirm_flag, ls_salesman
date   ld_sorder_date, ld_eorder_date

if dw_1.accepttext() = -1 then return
//거래처 구분
IF rb_all.checked = TRUE THEN
   ls_cust_no = '%'
ELSEIF rb_part.checked = TRUE THEN
   ls_cust_no = trim(dw_1.getitemstring(dw_1.getrow(), "cust_no")) + '%'
END IF

ld_sorder_date = date(em_1.text)
ld_eorder_date = date(em_2.text)
//수주구분
if rb_total.checked = true then
	ls_salesman = '%'
elseif rb_unit.checked = true then
	ls_salesman = is_salesman
end if

// 수주확정
if cbx_1.checked = true then
	ls_confirm_flag = 'T'
else
	ls_confirm_flag = 'N'
end if

if rb_part.checked = TRUE AND (ls_cust_no = '' or isnull(ls_cust_no)) then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if em_1.text = '' then
	messagebox("확인","주문일자를 입력하세요!",information!)
	em_1.setfocus()
	return
end if

if em_2.text = '' then
	messagebox("확인","주문일자를 입력하세요!",information!)
	em_2.setfocus()
	return
end if	

if ld_sorder_date > ld_eorder_date then
	messagebox("확인","주문일자를 잘못입력하였습니다.",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row
if dw_4.rowcount() > 0 then
	dw_4.reset()
	dw_2.reset()
	dw_3.reset()
end if

ll_row = dw_4.retrieve(ls_cust_no, ld_sorder_date, ld_eorder_date, ls_confirm_flag, ls_salesman)
if ll_row < 1 then MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	
end event

type gb_3 from w_inheritance`gb_3 within w_orsalecon_m
integer x = 960
integer y = 0
integer width = 713
integer height = 228
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsalecon_m
integer y = 224
integer width = 5696
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsalecon_m
integer x = 4274
integer y = 0
integer width = 1445
integer height = 228
integer taborder = 240
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsalecon_m
integer x = 3849
integer y = 416
integer width = 1870
integer height = 1292
integer taborder = 0
string dataobject = "d_orsalecon_m"
end type

event dw_2::itemchanged;////
//datetime ldt_null
//long     ll_row
//int      li_cnt
//string   ls_order_no, ls_credit_level, ls_fob, ls_order_no1, ls_conf, ls_area_no, ls_confirm, ls_itemno, ls_costyn
//decimal  lr_bill, lr_balance, lr_total, lr_credit_limit
//
//this.accepttext()
//ls_order_no = this.getitemstring(1, "order_no")
//ls_area_no  = this.getitemstring(1, "sale_area_no")
//
//if is_confirm_flag = "Y" then
//	MessageBox("확인","이미 생산확정된 수주입니다!",information!)
//	RETURN 2
//end if
//
//choose case dwo.name
//	case 'sale_confirm_flag'	// N: 등록, T: 수주확정, Y: 생산확정
//		if data = 'T' then		// 수주확정
//			ls_fob     = trim(this.object.fob[1])
//			lr_bill    = this.object.bill_amount[1]
//			lr_balance = this.object.balance_amt[1]
//			lr_total   = this.object.total[1]
//			ls_credit_level = this.object.credit_level[1]
//			lr_credit_limit = this.object.credit_limit[1]
//			
//			if ls_credit_level = 'A' or ls_fob = '현금' then
//				this.object.sale_confirm_user[1] = gs_userid
//				this.object.sale_confirm_date[1] = gf_today()
//			elseif (lr_bill + lr_balance + lr_total) < lr_credit_limit then
//				this.object.sale_confirm_user[1] = gs_userid
//				this.object.sale_confirm_date[1] = gf_today()
//			else
//				if ls_credit_level = 'Z' or ls_credit_level = 'F' then
//				else
//					if MessageBox("확인","고객의 신용한도액이 초과하였습니다!" + &
//									  "~r~n이 수주를 확정하시겠습니까?",question!,okcancel!,1) = 2 then
//						is_yn_flag = '1'
//						return 1
//					end if
//				end if
//				
//				this.object.sale_confirm_user[1] = gs_userid		// 수주확정자
//				this.object.sale_confirm_date[1] = gf_today()   // 확정시간
//			end if
//			
//			if Left(ls_order_no,1) = 'B' THEN	// YSP 수주
//			else
//				for ll_row = 1 to dw_3.rowcount()
//					ls_itemno = dw_3.object.item_no[ll_row]
//					SELECT cost_yn INTO :ls_costyn FROM groupitem WHERE item_no = :ls_itemno;
//					
//					choose case ls_costyn
//						case "Y"		// 비용품목일 경우 가용수량 변경함
//							dw_3.setitem(ll_row, "saledet_text", "X")
//							dw_3.setitem(ll_row, "sol_qty", dw_3.object.order_qty[ll_row])
//					end choose
//				next
//				
//				// 직출고된 수주인지 확인
//				if dw_3.object.srlse_qty[1] > 0 then				
//					if MessageBox("확인","출고물품 존재합니다!~n~n그래도 확정 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
//					else
//						//for ll_row = 1 to dw_3.rowcount()
//						//	if dw_3.object.rlse_qty[ll_row] > 0 then
//						//		MessageBox("확인","이미 출고된 물품이 있는 수주입니다!", Exclamation!)
//
//								setnull(ldt_null)
//								this.object.sale_confirm_user[1] = ""
//								this.object.sale_confirm_date[1] = ldt_null
//
//								is_yn_flag = '1'					
//								return 1
//						//	end if
//						//next
//					end if
//				end if
//			end if
//			
//		// 수주확정 취소( T --> N )
//		else 	
//			if LEFT(ls_area_no,1) = 'B' THEN		// YSP 수주
//				setnull(ls_conf)
//				SELECT ysp_confirm INTO :ls_conf	FROM sale WHERE order_no = :ls_order_no;
//				if ls_conf = 'Y' then
//					MessageBox("확인","이 주문은 YSP수주접수가 완료된 주문입니다. ~r~n" &
//											+ "생산관리자 협의하시기바랍니다.")
//					is_yn_flag = '2'					
//					return 1
//				end if
//				
//				setnull(ldt_null)
//				this.object.sale_confirm_user[1] = ''
//				this.object.sale_confirm_date[1] = ldt_null
//			end if
//			
//			//생산중인 물품이 존재하는 수주인지 확인
//			li_cnt = 0
//			SELECT count(*) INTO :li_cnt FROM mps, mpsdet  
//			 WHERE mps.order_no   = mpsdet.order_no
//			   and mpsdet.sale_no = :ls_order_no and mps.open_close = 'P';
//			if li_cnt > 0 then
//				MessageBox("확인","이미 생산중인 수주입니다. 생산관리자와 협의하십시요.", exclamation!)
//				is_yn_flag = '2'					
//				return 1
//			else
//				li_cnt = 0
//				SELECT count(*) INTO :li_cnt
//				  FROM routtempnew 
//				 WHERE sale_no = :ls_order_no and process_flag <>'c';
//				IF li_cnt > 0 then
//					MessageBox("확인","이미 생산계획조정에 자료가 있습니다. 생산관리자와 협의하십시요.", exclamation!)
//					is_yn_flag = '2'					
//					return 1
//				end if
//			end if
//
//////			for ll_row = 1 to dw_3.rowcount() 
//////				if dw_3.object.saledet_plan_qty[ll_row] > 0 then
//				if dw_3.object.sum_plan_qty[1] > 0 then
//					MessageBox("확인","이미 생산중인 물품이 있는 수주입니다!",information!)
//					is_yn_flag = '2'					
//					return 1
//				end if
//				
////				if dw_3.object.sol_qty[ll_row] > 0 then
////					MessageBox("확인","물품에 가용량이 있는 수주입니다!",information!)
////					is_yn_flag = '2'					
////					return 1
////				end if
//
//////				if dw_3.object.rlse_qty[ll_row] > 0 then
//				if dw_3.object.srlse_qty[1] > 0 then
//					MessageBox("확인","이미 출고된 물품이 있는 수주입니다!",information!)
//					is_yn_flag = '2'					
//					return 1
//				end if
//////			next
//			
//			setnull(ldt_null)
//			this.object.sale_confirm_user[1] = ''
//			this.object.sale_confirm_date[1] = ldt_null
//
//			// 가공비 & 타공비 수주확정 취소시
//			for ll_row = 1 to dw_3.rowcount()
//				dw_3.setitem(ll_row, "saledet_text", "N")
//				ls_itemno = dw_3.object.item_no[ll_row]
//				SELECT cost_yn INTO :ls_costyn FROM groupitem WHERE item_no = :ls_itemno;
//
//				choose case ls_costyn
//					case "Y"		// 가공비, 타공비 일 경우 가용수량 CLEAR함
//						dw_3.setitem(ll_row, "sol_qty", 0)
//				end choose
//			next
//		end if
//end choose
//
end event

event dw_2::retrieveend;string	ls_custno, ls_control, ls_cust_chk, ls_order_no
dec		ldc_saleamt

if this.rowcount() < 1 then return

ls_custno      	= this.object.cust_no[1]
is_confirm_flag	= this.object.sale_confirm_flag[1]
ls_order_no			= this.getitemstring(1, 'order_no')

if is_view_chk = "Y" then
	SELECT isnull(sale_control,'N') INTO :ls_control FROM customer WHERE cust_no = :ls_custno;
	if ls_control = "A" then 		// 매출통제: 완전통제
		MessageBox("확인","매출통제 대상 거래처입니다.~r~n~n영업관리팀에 문의 바랍니다.!",stopsign!)
	end if
end if
is_view_chk = "Y"

//미수금 셋팅	
ldc_saleamt		= gf_get_amt_receivable(ls_custno, ls_order_no)
this.setitem(1, 'saleamt', ldc_saleamt)
end event

event dw_2::buttonclicked;call super::buttonclicked;string	ls_order_no, ls_rem, ls_rem1, ls_rem2, ls_msg, ls_sqlerrtext
string	ls_sale_make_rem

if dw_2.accepttext( ) = -1 then return

choose case dwo.name
	case 'b_rem'
		ls_order_no	= this.getitemstring(row, 'order_no')			
		ls_rem		= this.getitemstring(row, 'rem')
		ls_rem1		= this.getitemstring(row, 'rem1')
		ls_rem2		= this.getitemstring(row, 'rem2')
		ls_sale_make_rem	= this.getitemstring(row, 'sale_make_rem')
		
		if gf_null_chk(ls_order_no) = true then
			messagebox("오류","수주번호를 다시 확인하세요!")
			return
		end if
		
		ls_msg	= "수주번호[ " + ls_order_no + "]의~r특기사항을 수정하시겠습니까?"
		if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return
		
		update
			sale
		set
			 rem 	= :ls_rem
			,rem1 = :ls_rem1
			,rem2 = :ls_rem2
			,make_rem = :ls_sale_make_rem
		where
			order_no = :ls_order_no
		using sqlca;
		
		if sqlca.sqlcode <> 0 then 
			ls_sqlerrtext	= sqlca.sqlerrtext
			rollback using sqlca;
			messagebox("sql error", ls_sqlerrtext)
			return
		end if
		
		commit using sqlca;
		messagebox("확인","수정 완료했습니다.")
end choose

end event

event dw_2::updatestart;call super::updatestart;Long		ll_rcnt, ll_row, ll_cnt
dwitemstatus	 ldwstatus
string	ls_temp
long		ll_no
int	li_revision_no

ll_rcnt			= this.rowcount()
Do While ll_row <= ll_rcnt
	ll_row = this.getnextmodified(ll_row, Primary!)
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		Choose Case ldwstatus
			case NewModified!, DataModified!
			choose case ldwstatus
				Case DataModified!
					li_revision_no		= 0
					li_revision_no 	= this.getitemnumber(1, "revision_no")
					li_revision_no		= li_revision_no + 1
					
					this.setItem(ll_row, 'revision_no', li_revision_no)
					this.setItem(ll_row, 'revision_date', GF_Today())			//gf_today()
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

type dw_3 from datawindow within w_orsalecon_m
integer x = 32
integer y = 1784
integer width = 4933
integer height = 884
boolean bringtotop = true
string dataobject = "d_orsalecon_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;choose case dwo.name
	case 'price'
		if is_price_update = 'N' then
			messagebox("확인","단가 수정 권한이 없습니다.",information!)
			return 2
		end if
		wf_calc()
end choose

end event

event rowfocuschanged;datawindowchild ldwc_color
string ls_where, ls_sql, ls_item_no

if this.getrow() > 0 then
	if RightA(this.object.item_no[this.getrow()], 1) = 'Z' then
		this.getchild("color", ldwc_color)
		ldwc_color.settransobject(sqlca)
		
		ldwc_color.setfilter("left(color_code,1) = 'Z' or ((color_code <> '0000') "  & 
																	+ "AND (color_code <> '1000') " &
																	+ "AND (color_code <> '3000') " &
																	+ "AND (color_code <> '4000') " &
																	+ "AND (color_code <> 'B000') " &
																	+ "AND (color_code <> 'F000') " &
																	+ "AND (color_code <> 'G000') " &
																	+ "AND (color_code <> 'I000') " &
																	+ "AND (color_code <> 'K000') " &
																	+ "AND (color_code <> 'L000') " &
																	+ "AND (color_code <> 'R000') " &
																	+ "AND (color_code <> 'S000') " &
																	+ "AND (color_code <> 'W000'))")
		ldwc_color.filter()
	end if
	
	ls_item_no = this.object.item_no[this.getrow()]
	if ls_item_no = '' or isnull(ls_item_no) then
		return
	else
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
	end if
end if

end event

event clicked;if row < 1 then return

This.setfocus()
this.scrolltorow(row)


// 히스토리
string ls_itemno, ls_qa
long   ll_find

if cbx_history.checked = true then
	ls_itemno  = this.object.item_no[row]
	ls_qa      = this.object.qa[row]
	
	ll_find = dw_10.find( "item_no = '" + ls_itemno + "' AND qa = '" + ls_qa + "'", 1, dw_10.rowcount() )
	if ll_find > 0 then
		dw_10.ScrollToRow( ll_find )
		dw_10.SelectRow(0, FALSE)
		dw_10.SelectRow(ll_find, TRUE)
	else
		ll_find = dw_10.find( "item_no = '" + ls_itemno + "'", 1, dw_10.rowcount() )
		if ll_find > 0 then
			dw_10.ScrollToRow( ll_find )
		else
			dw_10.ScrollToRow( 1 )
			dw_10.SelectRow(0, FALSE)
		end if
	end if
end if

end event

type dw_4 from datawindow within w_orsalecon_m
integer x = 32
integer y = 416
integer width = 3767
integer height = 1292
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_orsalecon_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string ls_order_no

if currentrow = 0 then return
dw_2.reset()
dw_3.reset()

ls_order_no	= this.object.order_no[currentrow]
dw_2.retrieve(ls_order_no)
if dw_2.rowcount() > 0 then
	if is_won <> dw_2.object.curr_code[1] then
		if dw_2.object.curr_code[1] = 'WON' then
			dw_3.dataobject = 'd_orsalecon_m1'
			dw_3.settransobject(sqlca)
			is_won = "WON"
		else
			dw_3.dataobject = 'd_orsalecon_m2'
			dw_3.settransobject(sqlca)
			is_won = "ANY"
		end if
	end if
	dw_3.retrieve(ls_order_no)
end if


end event

event clicked;string ls_col, ls_text
datetime ldt_null
long     ll_row
int      li_cnt
string   ls_order_no, ls_credit_level, ls_fob, ls_order_no1, ls_conf, ls_area_no, ls_confirm, ls_itemno, ls_costyn, ls_flag
decimal  lr_bill, lr_balance, lr_total, lr_credit_limit

this.accepttext()

if row < 1 then return
this.scrolltorow(row)

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_custno, ls_scenecode, ls_orderno
date   ld_sdate, ld_edate

ld_sdate     = date(em_1.text)
ld_edate     = date(em_2.text)

ll_row       = dw_4.getrow()

ls_orderno   = dw_4.object.order_no[ll_row] 
ls_custno    = dw_4.object.cust_no[ll_row]
ls_scenecode = dw_4.object.scene_code[ll_row]
ld_sdate     = date(dw_4.object.input_date[ll_row])

if cbx_history.checked = true then
	dw_10.retrieve( ls_custno, ls_scenecode, ld_sdate, ls_orderno )
end if
end event

event itemchanged;string	ls_order_no, ls_cust_no, ls_sale_control
long		ll_qty
string	ls_orexceed
decimal	ldc_amt_order, ldc_credit_limit, ldc_amt_receivable

if row = 0 then return

//한도 거래처 시스템 사용 유무
select 
	use_yn 
into
	:ls_orexceed
from 
	yc_codemst 
where 
	mast_cd = 'E001' 
and 
	detl_cd = 'EXC'
using sqlca;

if gf_null_chk(ls_orexceed) then
	ls_orexceed = 'N'
end if

choose case dwo.name
	case 'chk'
		choose case data
			case 'Y'
				ls_cust_no	= this.getitemstring(row, 'cust_no')
				ls_order_no	= this.getitemstring(row, 'order_no')

				//매출 통제
				select 
					isnull(sale_control,'N') 
				INTO 
					:ls_sale_control 
				FROM 
					customer 
				WHERE 
					cust_no = :ls_cust_no
				using sqlca;
				if ls_sale_control = "A" then 		// 매출통제: 완전통제
					MessageBox("저장오류","매출통제 대상 거래처입니다.",stopsign!)
					return 2								
				end if
				// 거래 명세서 에서 수주 확정 안되면 저장 안되기 때문에 의미없음
//				if Left(ls_order_no,1) <> 'B' THEN	// YSP 수주
//					// 직출고된 수주인지 확인
//					select 
//						sum(rlse_qty) 
//					into
//						:ll_qty
//					from 
//						saledet
//					where 
//						order_no = :ls_order_no
//					using 
//						sqlca;
//									
//					if ll_qty > 0 then				
//						if MessageBox("확인","출고물품 존재합니다!~n~n그래도 확정 하시겠습니까?", Exclamation!, OKCancel!, 1) = 2 then return 2
//					end if
//				end if

				// 확정납기 CHECK
				DateTime ld_podate, ld_duedate,  ld_gftoday
				Int      li_date30, li_today
				
				ld_podate   = this.object.cust_po_date[row]
				ld_duedate  = this.object.due_date[row]
//				if ld_podate > ld_duedate then
//					if MessageBox("요구일자","확정납기 일자가 요구납기 일자 이전 입니다. 저장 하시겠습니까?",question!,okcancel!,1) = 2 then return 2
//				end if
//				
//				if ld_podate = ld_duedate then
//					if MessageBox("납기일자","요구납기와 확정납기가 동일합니다. 저장 하시겠습니까?",question!,okcancel!,1) = 2 then return 2
//				end if
				
				ld_gftoday  = GF_TODAY()
				li_today    = DaysAfter(date(ld_gftoday), date(ld_duedate))
				if li_today < 0 then li_today = li_today * -1
				if li_today > 60 then	// 확정납기 정상 처리 : 금일부터 60일 이내 
					MessageBox("경고", "확정납기 일자는 " + LeftA(String(ld_gftoday),10) + " 부터 +60일 까지(" + String(RelativeDate(date(ld_gftoday), 60),'yyyy/mm/dd') + ") 처리가능 합니다.")  
					return 2
				end if
				
				//한도 금액 체크
				select
					sale_amount	+ sale_tax	 	//주문 금액
				into
					:ldc_amt_order
				from
					sale
				where
					order_no = :ls_order_no
				using sqlca;		
				
				ldc_credit_limit	= 0
				choose case ls_orexceed
					case 'Y'
						select 
							isnull(orexceed.limit_amt,customer.credit_limit)
						into
							:ldc_credit_limit
						from 
							sale	left outer join customer	on sale.cust_no  = customer.cust_no
									left outer join orexceed	on orexceed.cust_no = sale.cust_no 
																		and (convert(varchar(8),sale.order_date,112) between orexceed.start_date and orexceed.end_date)
																		and orexceed.use_yn = 'Y'
						where 
							sale.order_no = :ls_order_no
						using sqlca;				
					case 'N'
						select 
							credit_limit
						into 
							:ldc_credit_limit
						from 
							customer
						where 
							cust_no = :ls_cust_no
						using sqlca;
				end choose

				//미수 금액 가져오기
				ldc_amt_receivable	= gf_get_amt_receivable(ls_cust_no, ls_order_no)

				
				//한도금액과 미수금액 체크
				if ldc_credit_limit < ldc_amt_receivable + ldc_amt_order then 
					if MessageBox("확인","한도 금액보다 미수 금액이 더 많습니다.확정 하시겠습니까?",question!,okcancel!,1) = 2 then return 2
				end if				
				
		end choose
end choose		
end event

type st_1 from statictext within w_orsalecon_m
integer x = 2130
integer y = 128
integer width = 293
integer height = 56
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
string text = "거래처"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_orsalecon_m
integer x = 2130
integer y = 56
integer width = 293
integer height = 56
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
string text = "주문일자"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsalecon_m
integer x = 2450
integer y = 40
integer width = 384
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
end type

event modified;//
dw_2.reset()
dw_3.reset()
dw_4.reset()

pb_retrieve.default = true

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_orsalecon_m
integer x = 2848
integer y = 40
integer width = 384
integer height = 76
integer taborder = 80
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

event modified;dw_2.reset()
dw_3.reset()
dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type cbx_1 from checkbox within w_orsalecon_m
integer x = 2629
integer y = 268
integer width = 434
integer height = 64
integer taborder = 90
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "수주확정"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()

// 수주확정
if this.checked = true then
	cb_confirm.enabled		= false
	cb_cancel.enabled   		= true
else
	cb_confirm.enabled		= true
	cb_cancel.enabled   		= false	
end if

end event

type dw_5 from datawindow within w_orsalecon_m
integer x = 329
integer y = 12
integer width = 110
integer height = 84
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_orsalecon_m3"
boolean livescroll = true
end type

type dw_6 from datawindow within w_orsalecon_m
integer x = 448
integer y = 12
integer width = 110
integer height = 84
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_orsalecon_m4"
boolean livescroll = true
end type

type rb_all from radiobutton within w_orsalecon_m
integer x = 1723
integer y = 52
integer width = 416
integer height = 72
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
boolean checked = true
end type

event clicked;dw_1.enabled = false

dw_1.object.cust_no.background.color = 78682240

if dw_4.rowcount() > 0  then
	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
end if
end event

type rb_part from radiobutton within w_orsalecon_m
integer x = 1723
integer y = 124
integer width = 416
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부분거래처"
end type

event clicked;dw_1.enabled = true

dw_1.object.cust_no.background.color = 1087434968

if dw_4.rowcount() > 0  then
	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
end if
end event

type dw_7 from datawindow within w_orsalecon_m
integer x = 567
integer y = 12
integer width = 110
integer height = 84
integer taborder = 230
boolean bringtotop = true
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type em_3 from editmask within w_orsalecon_m
integer x = 983
integer y = 112
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

event modified;//
pb_compute.default = true

end event

type dw_8 from datawindow within w_orsalecon_m
boolean visible = false
integer x = 946
integer y = 1820
integer width = 2958
integer height = 588
integer taborder = 130
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_or_plan_due_update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type rb_2 from radiobutton within w_orsalecon_m
integer x = 64
integer y = 328
integer width = 215
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
string text = "시화"
end type

event clicked;//if gs_area = "B0001" THEN   // YSP사업장
	IF THIS.CHECKED = true then
//		idwc_item.setfilter("item_no LIKE '%CY%'")
//		idwc_item.filter()
//		idwc_item.setsort("item_no D")
//		idwc_item.SORT()
//	else
		idwc_item.setfilter("item_no not LIKE '%CY%'")
		idwc_item.filter()
		idwc_item.setsort("item_no A")
		idwc_item.SORT()
	end if
//end if

end event

type rb_3 from radiobutton within w_orsalecon_m
integer x = 64
integer y = 264
integer width = 215
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
string text = "전체"
end type

event clicked;//if gs_area = "B0001" THEN   // YSP사업장
	IF THIS.CHECKED = true then
//		idwc_item.setfilter("item_no LIKE '%CY%'")
//		idwc_item.filter()
//		idwc_item.setsort("item_no D")
//		idwc_item.SORT()
//	else
		idwc_item.setfilter("")
		idwc_item.filter()
		idwc_item.setsort("item_no A")
		idwc_item.SORT()
	end if
//end if
end event

type st_5 from statictext within w_orsalecon_m
integer x = 37
integer y = 184
integer width = 489
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "판매수주확정 권한"
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_orsalecon_m
integer x = 3781
integer y = 248
integer width = 325
integer height = 140
integer taborder = 300
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "매출/  수금내역"
boolean originalsize = true
alignment htextalign = right!
vtextalign vtextalign = multiline!
end type

event clicked;// 매출/수금내역
gs_where        lstr_where
string ls_cust_no, ls_cust_name

if dw_2.rowcount() < 1 then RETURN

ls_cust_no   = dw_2.object.cust_no[1]
ls_cust_name = dw_2.object.customer_cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
OpenWithParm( w_whopeom_w, lstr_where )

end event

type st_4 from statictext within w_orsalecon_m
integer x = 311
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_orsalecon_m
integer x = 498
integer y = 280
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_orsalecon_m
integer x = 530
integer y = 292
integer width = 311
integer height = 88
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

type st_6 from statictext within w_orsalecon_m
integer x = 969
integer y = 296
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

type sle_value from singlelineedit within w_orsalecon_m
integer x = 1449
integer y = 288
integer width = 480
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_orsalecon_m
integer x = 1943
integer y = 288
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_4
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_orsalecon_m
integer x = 2107
integer y = 288
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_4

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_orsalecon_m
integer x = 2272
integer y = 288
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_4
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_orsalecon_m
integer x = 2437
integer y = 288
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_4
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_orsalecon_m
integer x = 3813
integer y = 416
integer height = 1144
boolean bringtotop = true
end type

type st_3 from statictext within w_orsalecon_m
integer x = 983
integer y = 36
integer width = 480
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "수주번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_9 from datawindow within w_orsalecon_m
integer x = 933
integer y = 788
integer width = 2894
integer height = 516
integer taborder = 240
boolean bringtotop = true
boolean titlebar = true
string title = "매출요약보기"
string dataobject = "d_orsale_h"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_orsalecon_m
integer x = 2629
integer y = 324
integer width = 498
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
string text = "매출요약보기"
end type

event clicked;//
string   ls_custno
integer  li_year, li_month
datetime ldt_orderdate

ls_custno  = dw_2.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then RETURN

ldt_orderdate = dw_2.object.order_date[1]
if isnull(ldt_orderdate) then RETURN

li_year  = Year( date(ldt_orderdate) )
li_month = Month( date(ldt_orderdate) )

dw_9.retrieve( ls_custno, li_year, li_month )

if this.checked = true then
	dw_9.visible = true
else
	dw_9.visible = false
end if

end event

type st_horizontal from u_splitbar_horizontal within w_orsalecon_m
integer x = 27
integer y = 1740
integer width = 4933
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type dw_10 from datawindow within w_orsalecon_m
integer x = 1253
integer y = 1204
integer width = 2281
integer height = 572
integer taborder = 240
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_his"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_history from checkbox within w_orsalecon_m
integer x = 4471
integer y = 284
integer width = 1248
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "히스토리(동일 품명,규격인 경우 군청색)"
end type

event clicked;// 히스토리
if this.checked = true then
	dw_10.visible = true
else
	dw_10.visible = false
end if


end event

type cbx_sms from checkbox within w_orsalecon_m
integer x = 4119
integer y = 284
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "문자전송"
boolean checked = true
end type

type gb_4 from groupbox within w_orsalecon_m
integer x = 1710
integer width = 1696
integer height = 228
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "검색조건 1"
end type

type rb_1 from radiobutton within w_orsalecon_m
integer x = 320
integer y = 328
integer width = 215
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
boolean enabled = false
string text = "반월"
end type

event clicked;//if gs_area = "B0001" THEN   // YSP사업장
	IF THIS.CHECKED = true then
		idwc_item.setfilter("item_no LIKE '%CY%'")
		idwc_item.filter()
		idwc_item.setsort("item_no D")
		idwc_item.SORT()
//	else
//		idwc_item.setfilter("item_no not LIKE '%CY%'")
//		idwc_item.filter()
//		idwc_item.setsort("item_no A")
//		idwc_item.SORT()
	end if
//end if
end event

type ddlb_op from dropdownlistbox within w_orsalecon_m
integer x = 1166
integer y = 284
integer width = 261
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type cb_confirm from commandbutton within w_orsalecon_m
integer x = 4919
integer y = 44
integer width = 274
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "수주확정"
end type

event clicked;long		i, ll_trow, ll_row, ll_revision, ll_cnt, ll_rslt
string	ls_itemno, ls_costyn, ls_salesman, ls_org_user
string	ls_temp, ls_chk, ls_order_no, ls_cust_no,ls_confirm_flag,ls_cust_name,ls_scene_desc
string	ls_orexceed = 'N', ls_limit_chk, ls_order_date
decimal	ldc_credit_limit, ldc_amt_receivable, ldc_amt_order

if dw_4.accepttext( ) = -1 then return
ll_trow	= dw_4.rowcount()
if ll_trow < 1 then RETURN
if MessageBox("저장","수주 확정을 진행하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//한도 거래처 시스템 사용 유무
select 
	use_yn 
into
	:ls_orexceed
from 
	yc_codemst 
where 
	mast_cd = 'E001' 
and 
	detl_cd = 'EXC'
using sqlca;

if gf_null_chk(ls_orexceed) then
	ls_orexceed = 'N'
end if

ll_rslt	= 0
for i = 1 to ll_trow
	ls_chk				= 'N'
	ls_order_no			= ''
	ls_cust_no			= ''
	ls_confirm_flag	= ''
	ls_cust_name		= ''
	ls_scene_desc		= ''
	ls_org_user			= ''
	ldc_amt_order		= 0
	dw_2.reset()
	dw_3.reset()
	
	ls_chk 			= dw_4.getitemstring(i, 'chk')
	if ls_chk		= 'N' then continue
	ls_order_no		= dw_4.getitemstring(i, 'order_no')
	ls_cust_no		= dw_4.getitemstring(i, 'cust_no')
	ls_cust_name	= dw_4.getitemstring(i, 'cust_name')
	ls_scene_desc	= dw_4.getitemstring(i, 'scene_desc')
	ls_org_user		= dw_4.getitemstring(i, 'org_user')	
	
	//**확정상태, 주문 금액 가져오기
	select
		 confirm_flag
		,sale_amount + sale_tax		 
	into
		 :ls_confirm_flag
		,:ldc_amt_order		 
	from
		sale
	where
		order_no = :ls_order_no
	using sqlca;		
	
	if ls_confirm_flag <> 'N' then	//등록 상태가 아니면 확정을 안한다.
		ll_rslt++
		continue	
	end if
	
	if dw_2.retrieve(ls_order_no) < 1 then 
		ll_rslt++
		continue
	end if
	if dw_3.retrieve(ls_order_no) < 1 then 
		ll_rslt++
		continue 
	end if
	
	if LeftA(ls_order_no,1) <> 'B' THEN	// YSP 수주
		for ll_row = 1 to dw_3.rowcount()
			ls_itemno = ''	
			ls_itemno = dw_3.object.item_no[ll_row]
			SELECT 
				cost_yn 
			INTO 
				:ls_costyn 
			FROM 
				groupitem 
			WHERE 
				item_no = :ls_itemno
			using sqlca;
			
			choose case ls_costyn
				case "Y"		// 비용품목일 경우 가용수량 변경함
					dw_3.setitem(ll_row, "saledet_text", "X")
					dw_3.setitem(ll_row, "sol_qty", dw_3.object.order_qty[ll_row])
			end choose
		next
	end if			

	ls_limit_chk			= 'N'
	ldc_credit_limit		= 0
	ldc_amt_receivable	= 0
	//한도 금액 가져오기
	choose case ls_orexceed
		case 'Y'
			select 
				isnull(orexceed.limit_amt,customer.credit_limit)
			into
				:ldc_credit_limit
			from 
				sale	left outer join customer	on sale.cust_no  = customer.cust_no
						left outer join orexceed	on orexceed.cust_no = sale.cust_no 
															and (convert(varchar(8),sale.order_date,112) between orexceed.start_date and orexceed.end_date)
															and orexceed.use_yn = 'Y'
			where 
				sale.order_no = :ls_order_no
			using sqlca;				
		case 'N'
			select 
				credit_limit
			into 
				:ldc_credit_limit
			from 
				customer
			where 
				cust_no = :ls_cust_no
			using sqlca;
	end choose
	
	//미수 금액 가져오기
	ldc_amt_receivable	= gf_get_amt_receivable(ls_cust_no, ls_order_no)
	
	//한도금액과 미수금액 체크
	if ldc_credit_limit < ldc_amt_receivable + ldc_amt_order then 
		ls_limit_chk = 'Y'
	else
		ls_limit_chk = 'N'
	end if
	
	//기본값 셋팅
	choose case ls_limit_chk		//한도 초과 적용시
		case 'Y'
			if ls_orexceed = 'Y' then	
				dw_2.setitem(1, 'sale_confirm_flag','N')	// N: 등록, T: 수주확정, Y: 생산확정	
				dw_2.setitem(1, 'open_close','Z')			// 한도초과건 반영  O: 정상, C: 마감, X: 취소, Z: 한도초과
				dw_2.setitem(1, 'orexceed_gb','Z')			// 한도초과건 만 보기 위해서 반영  Z: 한도초과
			else
				dw_2.setitem(1, 'sale_confirm_flag','T')
				dw_2.setitem(1, 'open_close', 'O')
				dw_2.setitem(1, 'orexceed_gb', 'O')
			end if
		case 'N'	
				dw_2.setitem(1, 'sale_confirm_flag','T')
				dw_2.setitem(1, 'open_close', 'O')
				dw_2.setitem(1, 'orexceed_gb', 'O')
	end choose			
	dw_2.object.sale_confirm_user[1] = gs_userid		// 수주확정자
	dw_2.object.sale_confirm_date[1] = gf_today()   // 확정시간
	ll_revision = dw_2.getitemnumber(1, "revision_no")
	dw_2.object.revision_no[1]   = ll_revision + 1
	dw_2.object.revision_date[1] = wf_today()	
	
	if dw_2.accepttext( ) = -1 or dw_3.accepttext( ) = -1 then
		rollback using sqlca;
		pb_retrieve.PostEvent(Clicked!)	
		messagebox("오류1","수주 확정시 오류가 발생했습니다.~r~n다시 진행해주세요.")
		exit
	end if	
	
	if WF_Update2( dw_2, dw_3, 'N' ) = false then
		messagebox("오류2","수주 확정 저장시 오류가 발생했습니다.~r~n다시 진행해주세요.")
		exit
	end if
	
	//영업사원에게 문자 보내기
	choose case ls_limit_chk
		case 'Y'
			// SMS 발송	=>누구에게 보낼지 확인
			if cbx_sms.checked = true then
				string ls_template_cd, ls_s_msg, ls_hp_no
				string ls_a, ls_b, ls_c, ls_d, ls_e, ls_f

				//알림톡 템플릿코드
				ls_template_cd	= '022120000225'

				//받는 사람
				ls_salesman	= ''
				ls_salesman	= dw_2.getitemstring(1, 'salesman')	// 영업사원
				SELECT 
					replace(substring(ltrim(rtrim(isnull(a.hp_no,''))),1,13), '-', '') 
				INTO 
					:ls_hp_no
				FROM 
					salehp A
				WHERE 
					a.user_id   = :ls_salesman
				using sqlca;		
				
				//관리자 로그인
				if gs_userid = '1999010s' then 
					ls_hp_no = '01027369470'	
				end if
				
				Select 
					content
				into
					:ls_s_msg
				From
					sdk_popbill_template
				Where
					use_yn = 'Y'
				And	
					template_cd = :ls_template_cd
				Using sqlca;		
				
				ls_a	= ls_cust_name
				ls_b	= ls_scene_desc
				ls_c	= ls_order_no
				ls_d	= string(ldc_amt_order, '#,##0') + '원'
				ls_e	= string(ldc_credit_limit,'#,##0') + '원'
				ls_f	= string((ldc_amt_receivable + ldc_amt_order) - ldc_credit_limit, '#,##0') + '원'
				
				ls_s_msg	= gf_replaceall(ls_s_msg, '#A',ls_a)
				ls_s_msg	= gf_replaceall(ls_s_msg, '#B',ls_b)
				ls_s_msg	= gf_replaceall(ls_s_msg, '#C',ls_c)
				ls_s_msg	= gf_replaceall(ls_s_msg, '#D',ls_d)
				ls_s_msg	= gf_replaceall(ls_s_msg, '#E',ls_e)
				ls_s_msg	= gf_replaceall(ls_s_msg, '#F',ls_f)
				//알림톡
				GF_MMSSEND( ls_template_cd, '', ls_hp_no, '여신초과', ls_s_msg )				
				//알리창
				string	ls_msg
				ls_msg	= "*거래선명: " + ls_cust_name + " " + &
							  "*현장명: " + ls_scene_desc 	+ " " + &
							  "*수주번호: " + ls_order_no 	+ " " + &
							  "※여신이 초과되어 수주가 미확정상태로 수주확정 및 생산 출고 불가하오니 영업사원과 협의해주세요"
				INSERT INTO sysmsg ( flogin,	tlogin, msgdate, msg, del ) 
				VALUES ( :gs_userid, :ls_org_user, getdate(), :ls_msg ,'N') using sqlca;
				if sqlca.sqlcode = 0 then         
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				
			end if			
	end choose			
	ll_cnt ++	
next

if ll_cnt < 1 then
	messagebox("확인","선택한 내역이 없습니다.")
	pb_retrieve.PostEvent(Clicked!)
	return
end if
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
messagebox("확인","수주 확정을 완료했습니다.")
if ll_rslt > 0 then
	messagebox("주의",string(ll_rslt) + "건이 수주 확정을 못했습니다.~r~n내용 확인 후 다시 진행하세요." )
end if
	
pb_retrieve.PostEvent(Clicked!)

end event

type cb_cancel from commandbutton within w_orsalecon_m
integer x = 5211
integer y = 44
integer width = 274
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "확정취소"
end type

event clicked;string	ls_temp, ls_order_no, ls_conf, ls_itemno, ls_costyn, ls_recipient, ls_sender, ls_salesman
long		ll_grow, ll_row
int		li_cnt,  li_revision
datetime ldt_null 

setnull(ldt_null)
ll_grow = dw_2.getrow()
if ll_grow = 0 then return

ls_order_no	= dw_2.getitemstring(ll_grow, 'order_no')
if gf_null_chk(ls_order_no) then
	messagebox("주의","수주 번호를 선택하세요.")
	return
end if
ls_temp		= "수주번호 : " + ls_order_no + "를 판매 수주 취소를 하시겠습니까?"
if MessageBox("확인",ls_temp,question!,okcancel!,1) = 2 then RETURN

//수주 상태 확인
if LeftA(ls_order_no,1) = 'B' THEN		// YSP 수주
	SELECT 
		ysp_confirm 
	INTO 
		:ls_conf	
	FROM 
		sale 
	WHERE 
		order_no = :ls_order_no
	using sqlca;
	
	if ls_conf = 'Y' then
		MessageBox("확인","이 주문은 YSP수주접수가 완료된 주문입니다. ~r~n" &
								+ "생산관리자 협의하시기바랍니다.")
		return
	end if
else
	select 
		confirm_flag 
	into
		:ls_conf
	from 
		sale 	
	WHERE 
		order_no = :ls_order_no
	using sqlca;

	if ls_conf <> 'T' then
		MessageBox("확인","확정 상태가 확정인 수주건만~r~n" &
								+ "취소할 수 있습니다.")
		return
	end if
end if

//생산중인 물품이 존재하는 수주인지 확인
li_cnt = 0
SELECT 
	count(*) 
INTO 
	:li_cnt 
FROM 
	mps, mpsdet  
WHERE 
	mps.order_no   = mpsdet.order_no
and 
	mpsdet.sale_no = :ls_order_no 
and 
	mps.open_close = 'P'
using sqlca;

if li_cnt > 0 then
	MessageBox("확인","이 주문은 작업지시가 내려진 수주입니다.~r~n생산관리자 협의하시기 바랍니다.")
	return
else
	li_cnt = 0
	SELECT 
		count(*) 
	INTO 
		:li_cnt
	FROM 
		routtempnew 
	WHERE 
		sale_no = :ls_order_no 
	and 
		process_flag <>'C'
	using sqlca;
	
	IF li_cnt > 0 then
		MessageBox("확인","이미 생산계획조정에 자료가 있습니다. 생산관리자와 협의하십시요.", exclamation!)
		return
	end if
end if


for ll_row = 1 to dw_3.rowcount() 
	if dw_3.object.saledet_plan_qty[ll_row] > 0 then
		MessageBox("확인","이미 생산중인 물품이 있는 수주입니다!",information!)
		return
	end if

	if dw_3.object.rlse_qty[ll_row] > 0 then
		MessageBox("확인","이미 출고된 물품이 있는 수주입니다!",information!)
		return
	end if
next

// 가공비 & 타공비 수주확정 취소시
for ll_row = 1 to dw_3.rowcount()
	dw_3.object.plan_close[ll_row] = ldt_null		// 수주상황부의 생산완료시점
	dw_3.setitem(ll_row, "saledet_text", "N")
	ls_itemno = dw_3.object.item_no[ll_row]
	SELECT cost_yn INTO :ls_costyn FROM groupitem WHERE item_no = :ls_itemno;

	choose case ls_costyn
		case "Y"		// 가공비, 타공비 일 경우 가용수량 CLEAR함
			dw_3.setitem(ll_row, "sol_qty", 0)
	end choose
next
//초기화
dw_2.object.sale_confirm_flag[1] = 'N'
dw_2.setitem(1, 'open_close', 'O')
dw_2.setitem(1, 'orexceed_gb', 'O')
dw_2.setitem(1, 'orexceed_confirm_user', '')
dw_2.setitem(1, 'orexceed_confirm_date', ldt_null)
dw_2.setitem(1, 'orexceed_confirm_rem', '')
dw_2.object.sale_confirm_user[1] = ''
dw_2.object.sale_confirm_date[1] = ldt_null

//변경 건수, 일시 저장
li_revision = dw_2.getitemnumber(1, "revision_no")
dw_2.object.revision_no[1]   = li_revision + 1
dw_2.object.revision_date[1] = wf_today()

if dw_2.accepttext( ) = -1 or dw_3.accepttext( ) = -1 then
	pb_retrieve.PostEvent(Clicked!)	
	messagebox("오류","수주 취소시 오류가 발생했습니다.~r~n다시 진행해주세요.")
	return
end if

if WF_Update2( dw_2, dw_3, "N" ) = false then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

messagebox("확인","확정 취소를 완료했습니다.")
pb_retrieve.PostEvent(Clicked!)	
end event

type rb_total from radiobutton within w_orsalecon_m
integer x = 3429
integer y = 104
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체 수주"
boolean checked = true
end type

type rb_unit from radiobutton within w_orsalecon_m
integer x = 3808
integer y = 104
integer width = 443
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "계열사 수주"
end type

type gb_5 from groupbox within w_orsalecon_m
integer x = 3419
integer width = 846
integer height = 228
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "검색조건 2"
end type

