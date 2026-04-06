$PBExportHeader$w_orsalecon_m.srw
$PBExportComments$판매수주확정(1998/04/06, 정재수)
forward
global type w_orsalecon_m from w_inheritance
end type
type gb_15 from groupbox within w_orsalecon_m
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
type st_3 from statictext within w_orsalecon_m
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
type dw_area from datawindow within w_orsalecon_m
end type
type rb_1 from radiobutton within w_orsalecon_m
end type
type rb_2 from radiobutton within w_orsalecon_m
end type
type rb_3 from radiobutton within w_orsalecon_m
end type
type st_8 from statictext within w_orsalecon_m
end type
type ddlb_col from dropdownlistbox within w_orsalecon_m
end type
type st_9 from statictext within w_orsalecon_m
end type
type ddlb_2 from dropdownlistbox within w_orsalecon_m
end type
type sle_value from singlelineedit within w_orsalecon_m
end type
type cb_filteron from commandbutton within w_orsalecon_m
end type
type cb_filteroff from commandbutton within w_orsalecon_m
end type
type cb_7 from commandbutton within w_orsalecon_m
end type
type cb_4 from commandbutton within w_orsalecon_m
end type
type st_5 from statictext within w_orsalecon_m
end type
type pb_4 from picturebutton within w_orsalecon_m
end type
end forward

global type w_orsalecon_m from w_inheritance
integer x = 5
integer y = 136
integer width = 4549
integer height = 2812
string title = "판매수주확정(w_orsalecon_m)"
gb_15 gb_15
dw_3 dw_3
dw_4 dw_4
st_1 st_1
st_2 st_2
em_1 em_1
em_2 em_2
st_3 st_3
cbx_1 cbx_1
dw_5 dw_5
dw_6 dw_6
rb_all rb_all
rb_part rb_part
dw_7 dw_7
em_3 em_3
dw_8 dw_8
dw_area dw_area
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_7 cb_7
cb_4 cb_4
st_5 st_5
pb_4 pb_4
end type
global w_orsalecon_m w_orsalecon_m

type variables
datawindowchild idwc_qa, idwc_item, idwc_cust
st_sale_ysp ist_ysp

decimal ir_price
string  is_yn_flag, is_confirm_flag, is_price_update
string  is_flag, is_won = "WON", is_view_chk = 'Y'

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

dw_3.accepttext()
dw_2.accepttext()

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
this.gb_15=create gb_15
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_1=create st_1
this.st_2=create st_2
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.rb_all=create rb_all
this.rb_part=create rb_part
this.dw_7=create dw_7
this.em_3=create em_3
this.dw_8=create dw_8
this.dw_area=create dw_area
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_7=create cb_7
this.cb_4=create cb_4
this.st_5=create st_5
this.pb_4=create pb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_15
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.dw_5
this.Control[iCurrent+11]=this.dw_6
this.Control[iCurrent+12]=this.rb_all
this.Control[iCurrent+13]=this.rb_part
this.Control[iCurrent+14]=this.dw_7
this.Control[iCurrent+15]=this.em_3
this.Control[iCurrent+16]=this.dw_8
this.Control[iCurrent+17]=this.dw_area
this.Control[iCurrent+18]=this.rb_1
this.Control[iCurrent+19]=this.rb_2
this.Control[iCurrent+20]=this.rb_3
this.Control[iCurrent+21]=this.st_8
this.Control[iCurrent+22]=this.ddlb_col
this.Control[iCurrent+23]=this.st_9
this.Control[iCurrent+24]=this.ddlb_2
this.Control[iCurrent+25]=this.sle_value
this.Control[iCurrent+26]=this.cb_filteron
this.Control[iCurrent+27]=this.cb_filteroff
this.Control[iCurrent+28]=this.cb_7
this.Control[iCurrent+29]=this.cb_4
this.Control[iCurrent+30]=this.st_5
this.Control[iCurrent+31]=this.pb_4
end on

on w_orsalecon_m.destroy
call super::destroy
destroy(this.gb_15)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.rb_all)
destroy(this.rb_part)
destroy(this.dw_7)
destroy(this.em_3)
destroy(this.dw_8)
destroy(this.dw_area)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.st_5)
destroy(this.pb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
//dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
//idwc_cust_no.SetTransObject(sqlca)
gs_ds_whcustret.sharedata(idwc_cust)

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)
//idwc_item.SetTransObject(sqlca)

dw_3.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)
//idwc_qa.SetTransObject(sqlca)

dw_1.insertrow(0)
dw_1.object.cust_no.background.color = 78682240

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
em_3.text = "HD" + string(today(), "yyyy")
ddlb_col.text = "거래처명"
ddlb_2.text   = "LIKE"

if gs_area = "B0001" THEN   // YSP사업장
	rb_1.checked = true
	rb_1.triggerevent(clicked!)
else			//"S0001" //: 시화
	rb_2.checked = true
	rb_2.triggerevent(clicked!)
end if

dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false
dw_8.settransobject(sqlca)

// 단가수정 권한
if gs_userid = "root" or gs_userid = '1999010s' then
	is_price_update = 'Y'
else
	is_price_update = 'N'
end if

// 납기
if gs_userid = 'root' or gs_userid = '1999010s' then 
	pb_cancel.visible = true
else
	pb_cancel.visible = false
end if

// 품목 추가,삭제
pb_insert.enabled = FALSE
pb_delete.enabled = FALSE

//// 수주확정(Y/N) 사용자등록 
//string ls_duty
//SELECT duty_flag2 INTO :ls_duty FROM login
// WHERE user_id = :gs_userid  and use_flag = 'Y';
//if ls_duty = 'Y' then
IF GF_PERMISSION("판매수주확정", gs_userid) = "Y" THEN
	pb_save.enabled   = TRUE
	//pb_insert.enabled = TRUE
	//pb_delete.enabled = TRUE
	pb_print_part.enabled = TRUE	// 재고대체
else
	pb_save.enabled   = FALSE
	pb_insert.enabled = FALSE
	pb_delete.enabled = FALSE
	pb_print_part.enabled = FALSE	// 재고대체
end if

// area 추가 2003/03/06
dw_area.SetTransObject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/03/06

end event

event resize;call super::resize;this.width  = 4549
dw_3.height = this.height - 1626

end event

type pb_save from w_inheritance`pb_save within w_orsalecon_m
integer x = 4050
integer y = 44
integer taborder = 120
boolean enabled = false
end type

event pb_save::clicked;integer  li_revision, li_cnt, li_count
string   ls_order_no, ls_tax_sign, ls_conf, ls_area_no
long     ll_row, ll_row1
datetime ldt_null
dec      lr_amt

if dw_2.rowcount() < 1 then return
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

ls_area_no  = dw_2.getitemstring(1, "sale_area_no")
ls_order_no = dw_2.object.order_no[1]

/////////////////////////
// 확정납기 CHECK
/////////////////////////
DateTime ld_podate, ld_duedate,  ld_gftoday
Int      li_date30, li_today

ld_podate   = dw_2.object.cust_po_date[1]
ld_duedate  = dw_2.object.due_date[1]
if ld_podate > ld_duedate then
	if MessageBox("요구일자","확정납기 일자가 요구납기 일자 이전 입니다. 저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN
end if

if ld_podate = ld_duedate then
	if MessageBox("납기일자","요구납기와 확정납기가 동일합니다. 저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN
end if

ld_gftoday  = GF_TODAY()
li_today    = DaysAfter(date(ld_gftoday), date(ld_duedate))
if li_today < 0 then li_today = li_today * -1
if li_today > 60 then 
	MessageBox("경고", "확정납기 일자는 " + LeftA(String(ld_gftoday),10) + " 부터 +60일 까지(" + String(RelativeDate(date(ld_gftoday), 60),'yyyy/mm/dd') + ") 처리가능 합니다.")  
	dw_2.setcolumn('due_date')
	dw_2.setfocus()
	RETURN
else
	// 확정납기 정상 처리 : 금일부터 60일 이내 
end if


li_revision = dw_2.getitemnumber(1, "revision_no")
dw_2.object.revision_no[1]   = li_revision + 1
dw_2.object.revision_date[1] = wf_today()
dw_2.accepttext()

//1998-09-22 수정부분(start)
if is_confirm_flag = 'T' and dw_2.object.sale_confirm_flag[1] = 'N' then //확정취소시
	dw_5.retrieve(ls_order_no)
	
	//mpsdet table update
	SELECT count(*) INTO :li_count FROM mpsdet WHERE sale_no = :ls_order_no; 
	if li_count > 0 then
		rollback;
		MessageBox("확인","이 주문은 작업지시가 내려진 수주입니다.~r~n생산관리자 협의하시기 바랍니다.")
		return
	end if
	
////routtempnew table update
//	DELETE FROM routtempnew WHERE sale_no = :ls_order_no;	
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장오류","routtempnew저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
	//saledet table update
	setnull(ldt_null)
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.plan_close[ll_row] = ldt_null
	next
	dw_3.accepttext()
	dw_5.accepttext()
	if wf_update3(dw_2,dw_3,dw_5,'Y') = false then return
	
ELSE
	string ls_sale_control, ls_cust_chk
	
	ls_cust_chk = dw_2.object.cust_no[1]
	SELECT isnull(sale_control,'N') INTO :ls_sale_control 
	  FROM customer
	 WHERE cust_no = :ls_cust_chk;
	if ls_sale_control = 'A' then // 매출통제: 완전통제
		MessageBox("저장오류","매출통제 대상 거래처입니다.~r~n~n영업지원팀에 문의 바랍니다.!",stopsign!)
		is_view_chk = 'N'
		dw_4.event rowfocuschanged(dw_4.getrow())								
		return								
	end if

	//가공비 & 타공비 수주확정시 1998-10-12 수정(start)
	dw_3.accepttext()
	for ll_row = 1 to dw_3.rowcount()
		if dw_3.object.item_no[ll_row] > 'PZZZG' THEN
			dw_3.setitem(ll_row, "saledet_text", "X")
			dw_3.setitem(ll_row, "sol_qty", dw_3.object.order_qty[ll_row])
		end if
	next
	dw_3.accepttext()
	// 1998-10-12 수정(end)
	
	if wf_update2(dw_2,dw_3,'Y') = true then
	end if
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_orsalecon_m
integer x = 2281
integer y = 236
integer width = 873
integer height = 88
integer taborder = 30
boolean enabled = false
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
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

type dw_2 from w_inheritance`dw_2 within w_orsalecon_m
integer x = 1687
integer y = 340
integer width = 2770
integer height = 1104
integer taborder = 0
string dataobject = "d_orsalecon_m"
end type

event dw_2::itemchanged;datetime ldt_null
long     ll_row
int      li_cnt
string   ls_order_no, ls_credit_level, ls_fob, ls_order_no1, ls_conf, ls_area_no
decimal  lr_bill, lr_balance, lr_total, lr_credit_limit

this.accepttext()
ls_order_no = this.getitemstring(1, "order_no")
ls_area_no  = this.getitemstring(1, "sale_area_no")

choose case dwo.name
	case 'sale_confirm_flag'	// N: 등록, T: 수주확정, Y: 생산확정
		if data = 'T' then		// 수주확정
			ls_fob     = trim(this.object.fob[1])
			lr_bill    = this.object.bill_amount[1]
			lr_balance = this.object.balance_amt[1]
			lr_total   = this.object.total[1]
			ls_credit_level = this.object.credit_level[1]
			lr_credit_limit = this.object.credit_limit[1]
			if ls_credit_level = 'A' or ls_fob = '현금' then
				this.object.sale_confirm_user[1] = gs_userid
				this.object.sale_confirm_date[1] = gf_today()
			elseif (lr_bill + lr_balance + lr_total) < lr_credit_limit then
				this.object.sale_confirm_user[1] = gs_userid
				this.object.sale_confirm_date[1] = gf_today()
			else
				if ls_credit_level = 'Z' or ls_credit_level = 'F' then
				else
					if MessageBox("확인","고객의 신용한도액이 초과하였습니다!" + &
									  "~r~n이 수주를 확정하시겠습니까?",question!,okcancel!,2) = 2 then
						is_yn_flag = '1'
						return 1
					end if
				end if
				
				this.object.sale_confirm_user[1] = gs_userid		// 수주확정자
				this.object.sale_confirm_date[1] = gf_today()   // 확정시간
			end if
			
			if LeftA(ls_order_no,1) = 'B' THEN	// YSP 수주
			else
				//가공비 & 타공비 수주확정시
				for ll_row = 1 to dw_3.rowcount()
					if dw_3.object.item_no[ll_row] > 'PZZZG' THEN
						dw_3.setitem(ll_row, "saledet_text", "X")
						dw_3.setitem(ll_row, "sol_qty", dw_3.object.order_qty[ll_row])
					end if
				next
				
				//직출고된 수주인지 확인
				for ll_row = 1 to dw_3.rowcount()
					if dw_3.object.rlse_qty[ll_row] > 0 then
						messagebox("확인","이미 출고된 물품이 있는 수주입니다!",information!)
						is_yn_flag = '1'					
						return 1
					end if
				next
			end if
			
		else 	// 수주확정 취소
			IF LeftA(ls_area_no,1) = 'B' THEN		// YSP 수주
				setnull(ls_conf)
				SELECT ysp_confirm INTO :ls_conf	FROM sale 
					WHERE order_no = :ls_order_no;
				if ls_conf = 'Y' then
					messagebox("확인","이 주문은 YSP수주접수가 완료된 주문입니다. ~r~n" &
											+ "생산관리자 협의하시기바랍니다.")
					is_yn_flag = '2'					
					return 1
				end if
				
				setnull(ldt_null)
				this.object.sale_confirm_user[1] = ''
				this.object.sale_confirm_date[1] = ldt_null
			end if
			
			//생산중인 물품이 존재하는 수주인지 확인
			li_cnt = 0
			SELECT count(*) INTO :li_cnt
			  FROM mps, mpsdet  
			 WHERE mps.order_no   = mpsdet.order_no
			   and mpsdet.sale_no = :ls_order_no 
				and mps.open_close = 'P';
			IF li_cnt > 0 then
				messagebox("확인","이미 생산중인 수주입니다. 생산관리자와 협의하십시요.", exclamation!)
				is_yn_flag = '2'					
				return 1
			else
				li_cnt = 0
				SELECT count(*) INTO :li_cnt
				  FROM routtempnew 
				 WHERE sale_no = :ls_order_no and process_flag <>'c';
				IF li_cnt > 0 then
					messagebox("확인","이미 생산계획조정에 자료가 있습니다. 생산관리자와 협의하십시요.", exclamation!)
					is_yn_flag = '2'					
					return 1
				end if
			end if

			for ll_row = 1 to dw_3.rowcount() 
				if dw_3.object.saledet_plan_qty[ll_row] > 0 then
					messagebox("확인","이미 생산중인 물품이 있는 수주입니다!",information!)
					is_yn_flag = '2'					
					return 1
				end if
				
//				if dw_3.object.sol_qty[ll_row] > 0 then
//					messagebox("확인","물품에 가용량이 있는 수주입니다!",information!)
//					is_yn_flag = '2'					
//					return 1
//				end if

				if dw_3.object.rlse_qty[ll_row] > 0 then
					messagebox("확인","이미 출고된 물품이 있는 수주입니다!",information!)
					is_yn_flag = '2'					
					return 1
				end if
			next
			
			setnull(ldt_null)
			this.object.sale_confirm_user[1] = ''
			this.object.sale_confirm_date[1] = ldt_null

			//가공비 & 타공비 수주확정시 1998-10-12 수정(start)
			for ll_row = 1 to dw_3.rowcount()
				dw_3.setitem(ll_row, "saledet_text", "N")
				if dw_3.object.item_no[ll_row] > 'PZZZG' THEN
					dw_3.setitem(ll_row, "sol_qty", 0)
				end if
			next
		end if
end choose

end event

event dw_2::itemerror;if is_yn_flag = '1' then
	this.object.sale_confirm_flag[1] = 'N'
else
	this.object.sale_confirm_flag[1] = 'T'
	this.object.sale_confirm_user[1] = this.GetItemString(1,"sale_confirm_user", Primary!, TRUE)
	this.object.sale_confirm_date[1] = this.GetItemdatetime(1,"sale_confirm_date", Primary!, TRUE)
end if
return 2
end event

event dw_2::retrieveend;string ls_sale_control, ls_cust_chk

if this.rowcount() < 1 then return

is_confirm_flag = this.object.sale_confirm_flag[1]
if is_view_chk = 'Y' then
	ls_cust_chk = dw_2.object.cust_no[1]
	SELECT isnull(sale_control,'N') INTO :ls_sale_control 
	  FROM customer
	 WHERE cust_no    = :ls_cust_chk;
	if ls_sale_control = 'A' then // 매출통제: 완전통제
		MessageBox("확인","매출통제 대상 거래처입니다.~r~n~n영업관리팀에 문의 바랍니다.!",stopsign!)
	end if
end if
is_view_chk = 'Y'

end event

type st_title from w_inheritance`st_title within w_orsalecon_m
integer x = 50
integer y = 40
integer width = 901
long textcolor = 255
string text = "판매수주확정"
end type

type st_tips from w_inheritance`st_tips within w_orsalecon_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsalecon_m
integer x = 1550
integer y = 64
integer width = 169
integer height = 120
integer taborder = 20
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::clicked;string ls_orderno
long   ll_row

cb_filteroff.triggerevent(clicked!)
 
ls_orderno = TRIM(em_3.TEXT)
if isnull(ls_orderno) or ls_orderno = '' then return

SELECT count(*) INTO :ll_row 
  FROM sale
 WHERE order_no   = :ls_orderno;
if ll_row < 1 then 
	em_3.setfocus()
	return
end if

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_ret(ls_orderno)
this.default = false
// bonggie : 조봉기
// kjchoi : 최귀주 - 수출건 확정만. dw_2의 retrieveend 에서 처리

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_orsalecon_m
integer x = 4265
integer y = 1960
integer taborder = 160
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고대체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
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
integer x = 4242
integer y = 44
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalecon_m
integer x = 3845
integer y = 44
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
//	ls_where = " and sale.order_no between ~~'" + ist_code.start_no + "~~'" &
//				+ " and ~~'" + ist_code.end_no + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_7.modify(ls_sql)
//	dw_7.retrieve( ls_scenehp )
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
//	dw_7.retrieve( ls_scenehp )
	dw_7.dataobject = 'd_orsale_print4'
	dw_7.settrans( sqlca)

	dw_7.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)

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
integer x = 4265
integer y = 1468
integer taborder = 200
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "납기"
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
integer x = 4265
integer y = 1796
integer taborder = 210
boolean enabled = false
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
integer x = 4265
integer y = 1632
integer taborder = 220
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
integer x = 3616
integer y = 44
integer taborder = 80
end type

event pb_retrieve::clicked;string ls_cust_no, ls_confirm_flag
date   ld_sorder_date, ld_eorder_date

cb_filteroff.triggerevent(clicked!)

dw_1.accepttext()
IF rb_all.checked = TRUE THEN
   ls_cust_no = '%'
ELSE
   ls_cust_no = trim(dw_1.getitemstring(dw_1.getrow(), "cust_no")) + '%'
END IF
ld_sorder_date = date(em_1.text)
ld_eorder_date = date(em_2.text)
if cbx_1.checked = true then
	ls_confirm_flag = 'T'
else
	ls_confirm_flag = 'N'
end if

if rb_part.checked = TRUE AND (ls_cust_no = '' or isnull(ls_cust_no)) then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
elseif em_1.text = '' then
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

long ll_row
if dw_4.rowcount() > 0 then
	dw_4.reset()
	dw_2.reset()
	dw_3.reset()
end if

ll_row = dw_4.retrieve(ls_cust_no, ld_sorder_date, ld_eorder_date, ls_confirm_flag, dw_area.object.area[1])
if ll_row < 1 then MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	
end event

type gb_3 from w_inheritance`gb_3 within w_orsalecon_m
integer x = 1001
integer y = 20
integer width = 754
integer height = 180
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "수주번호"
end type

type gb_2 from w_inheritance`gb_2 within w_orsalecon_m
integer y = 204
integer width = 4425
integer height = 132
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
borderstyle borderstyle = styleraised!
end type

type gb_1 from w_inheritance`gb_1 within w_orsalecon_m
integer x = 3570
integer y = 0
integer width = 887
integer taborder = 180
integer textsize = -9
integer weight = 400
end type

type gb_15 from groupbox within w_orsalecon_m
integer x = 1778
integer y = 20
integer width = 567
integer height = 180
integer taborder = 190
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type dw_3 from datawindow within w_orsalecon_m
integer x = 32
integer y = 1468
integer width = 4215
integer height = 1184
boolean bringtotop = true
string dataobject = "d_orsalecon_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event retrieveend;//string ls_item_no, ls_com_item, ls_com_item1, ls_com_item2
//long ll_row, ll_count
//
//if this.getrow() > 0 then
//	//Y.S.P인 경우
//	for ll_row = 1 to this.rowcount()
//		ls_item_no = this.object.item_no[ll_row]
//		ls_com_item = left(ls_item_no, 1)
//		ls_com_item1 = mid(ls_item_no, 3, 1)
//		ls_com_item2 = mid(ls_item_no, 7, 1)
//		if upper(ls_com_item) = 'P' and upper(ls_com_item1) = 'Y' and &
//		  (upper(ls_com_item2) = 'A' or upper(ls_com_item2) = 'B' or &
//		   upper(ls_com_item2) = 'C' or upper(ls_com_item2) = 'D') then 
//			pb_4.visible = true
//			ll_count = ll_count + 1
//		end if
//	next
//	
//	if ll_count = 0 then	pb_4.visible = false
//end if
//
//
end event

event itemchanged;string  ls_where, ls_sql,      ls_item_no, ls_qa, ls_com_qa, ls_item_name, ls_data
string  ls_uom,   ls_com_item, ls_com_item1, ls_com_item2, ls_cust_no, ls_scene_no, ls_color
long    ll_row,   ll_lenth, ll_x, ll_y, ll_row1, ll_found 
decimal lr_order_qty, lr_acc_qty, lr_price, lr_price_a 
datawindowchild ldwc_color

this.accepttext()
dw_2.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa      = this.getitemstring(ll_row, "qa")

choose case dwo.name
	case 'color'
		ls_color = trim(data)
		select count(*) into :ll_found from color
		 where color_code = :ls_color;
		if ll_found < 1 or sqlca.sqlcode = 100  then
			gs_where lst_code
			lst_code.str1 = ls_color
			openwithparm(w_whcolor_m, lst_code)
			lst_code = message.powerobjectparm
			if lst_code.chk = "N" then return
			this.object.color[ll_row] = lst_code.str1
			this.getchild("color", ldwc_color)
			ldwc_color.retrieve()
		end if
		return 1
		
	case 'item_no'
		this.object.qa[ll_row]  = ''
		this.object.uom[ll_row] = ''
		this.object.order_qty[ll_row] = 0
		this.object.acc_qty[ll_row]   = 0
		this.object.price[ll_row]     = 0 
		this.object.item_price_a[ll_row] = 0
		this.object.rem[ll_row] = ''
//		this.object.qa.tabsequence = 0
//		this.object.qa.background.color = 78682240
		
		this.getchild("item_no", idwc_item)
//		idwc_item.settransobject(sqlca)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data  = data
  	   ll_row1  = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			is_flag = '1'
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_item_name = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		this.object.item_item_name[this.getrow()] = ls_item_name
		
		if ls_item_no <> '' then
//			this.getchild("qa", idwc_qa)
//			idwc_qa.settransobject(sqlca)
//			ls_where = "WHERE item.item_no = ~~'" + ls_item_no + "~~'"
//			ls_sql = "datawindow.table.select = '" + is_qasql + ls_where + "'"
//			idwc_qa.modify(ls_sql)
//			idwc_qa.retrieve()
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
			
			if idwc_qa.rowcount() > 0 then
//				this.object.qa.tabsequence = 1
//				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
			else
//				this.object.qa.tabsequence = 0
//				this.object.qa.background.color = 78682240
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		
		//색상선택
		if RightA(this.object.item_no[ll_row], 1) = '0' then
			this.object.color[ll_row] = '0000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'R' then
			this.object.color[ll_row] = 'R000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'I' then
			this.object.color[ll_row] = 'I000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'K' then
			this.object.color[ll_row] = 'K000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'S' then
			this.object.color[ll_row] = 'S000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'F' then
			this.object.color[ll_row] = 'F000'	
		elseif RightA(this.object.item_no[ll_row], 1) = 'G' then
			this.object.color[ll_row] = 'G000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'W' then
			this.object.color[ll_row] = 'W000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'L' then
			this.object.color[ll_row] = 'L000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'B' then
			this.object.color[ll_row] = 'B000'	
		elseif RightA(this.object.item_no[ll_row], 1) = '1' then
			this.object.color[ll_row] = '1000'
		elseif RightA(this.object.item_no[ll_row], 1) = '3' then
			this.object.color[ll_row] = '3000'
		elseif RightA(this.object.item_no[ll_row], 1) = '4' then
			this.object.color[ll_row] = '4000'
		elseif RightA(this.object.item_no[ll_row], 1) = 'Z' then
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
			this.object.color[ll_row] = 'Z000'
		end if		

	case 'qa'
		this.getchild("qa", idwc_qa)
		gs_ds_qaall.ShareData(idwc_qa)
		
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			is_flag = '2'
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1

				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if

/////////////////
		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[ll_row] = ls_uom
		this.setcolumn("order_qty")
		this.setfocus()
		//표준단가
		SELECT price_a INTO :lr_price_a
		  FROM item
		 WHERE item_no = :ls_item_no
		   AND qa = :ls_qa;
			
		this.object.item_price_a[ll_row] = lr_price_a	
		lr_order_qty = this.getitemdecimal(ll_row, "order_qty")	
		// update 1999/08/06, uom = "SS" <= 단위는 SHeet이나 계산을 평방미터로 환산하는 단위
		if ls_uom = 'M2' OR ls_uom = "SS" then //단위가 평방미터인 제품의 환산수량
		   ll_x = long(MidA(ls_qa, 5, 4))
			ll_y = long(MidA(ls_qa, 10, 4))
			lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001 , 2)	
   		ls_com_qa  = LeftA(ls_qa, 3)
			this.object.acc_qty[ll_row] = lr_acc_qty
		elseif ls_uom = 'M' then //단위가 미터인 제품의 환산수량
			ll_lenth   = long(MidA(ls_qa, 15, 5))
			lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
			this.object.acc_qty[ll_row] = lr_acc_qty
   		ls_com_qa  = LeftA(ls_qa, 13)
		else
			lr_acc_qty = lr_order_qty
			this.object.acc_qty[ll_row] = lr_acc_qty //길이가 없는 제품의 환산수량
   		ls_com_qa  = ls_qa
		end if
				
		// 단가
		ls_scene_no = dw_2.getitemstring(1, "scene_code")
		ls_cust_no  = dw_2.getitemstring(1, "cust_no")
//		ls_com_qa   = left(ls_qa, 13)
		lr_price    = gf_custprice(ls_scene_no, ls_cust_no, ls_com_qa, ls_item_no, ls_qa)
		this.object.price[ll_row] = lr_price
		this.object.price_be[ll_row] = lr_price
		
	case 'uom'
		ls_uom = data
		lr_order_qty = this.getitemdecimal(ll_row, "order_qty")	
		// update 1999/08/06, uom = "SS" <= 단위는 SHeet이나 계산을 평방미터로 환산하는 단위
		if ls_uom = 'M2' OR ls_uom = "SS" then //단위가 평방미터인 제품의 환산수량
		   ll_x = long(MidA(ls_qa, 5, 4))
			ll_y = long(MidA(ls_qa, 10, 4))
			lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001, 2)	
			this.object.acc_qty[ll_row] = lr_acc_qty
		elseif ls_uom = 'M' then //단위가 미터인 제품의 환산수량
			ll_lenth   = long(MidA(ls_qa, 15, 5))
			lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
			this.object.acc_qty[ll_row] = lr_acc_qty
		else
			lr_acc_qty = lr_order_qty
			this.object.acc_qty[ll_row] = lr_acc_qty //길이가 없는 제품의 환산수량
		end if
		
	case 'order_qty'
		lr_order_qty = this.getitemdecimal(ll_row, "order_qty")	
		ls_uom       = trim(this.getitemstring(ll_row, "uom"))
				
		if ls_uom = 'M2' OR ls_uom = "SS" then
		   ll_x = long(MidA(ls_qa, 5, 4))
			ll_y = long(MidA(ls_qa, 10, 4))
			lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001, 2)	
			this.object.acc_qty[ll_row] = lr_acc_qty
		elseif ls_uom = 'M' then
			ll_lenth   = long(MidA(ls_qa, 15, 5))
			lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
			this.object.acc_qty[ll_row] = lr_acc_qty
		else
			lr_acc_qty = lr_order_qty
			this.object.acc_qty[ll_row] = lr_acc_qty //길이가 없는 제품의 환산수량
		end if
		
		//Y.S.P인 경우 환산수량
		ls_com_item  = LeftA(ls_item_no, 1)
		ls_com_item1 = MidA(ls_item_no, 3, 1)
		ls_com_item2 = MidA(ls_item_no, 7, 1)
		if upper(ls_com_item) = 'P' and upper(ls_com_item1) = 'Y' and &
		  (upper(ls_com_item2) = 'A' or upper(ls_com_item2) = 'B' or &
		   upper(ls_com_item2) = 'C' or upper(ls_com_item2) = 'D') then 
			this.object.acc_qty[ll_row] = lr_order_qty
//			this.object.sol_qty[ll_row] = lr_order_qty
		end if		
	   wf_calc()
	
	case 'price'
		dwitemstatus l_status
		l_status = this.getitemstatus(row, 0, primary!)
		if l_status = newmodified! or l_status = new! then
		else
			if is_price_update = 'N' then
				messagebox("확인","단가 수정 권한이 없습니다.",information!)
	 		   return 1
			end if
		end if
//		if this.object.rlse_qty[this.getrow()] > 0 then
//			messagebox("확인","출고된 수량이 있습니다." + &
//						  "~r~n단가를 수정하실 수 없습니다!",information!)
// 		   return 1
//		else
		   wf_calc()
//		end if
end choose

end event

event rowfocuschanged;datawindowchild ldwc_color
string ls_where, ls_sql, ls_item_no

this.accepttext()

if this.rowcount() > 0 then
	ir_price = this.object.price[this.getrow()]
end if

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
//		this.object.color[this.getrow()] = 'Z000'
	end if
	
	ls_item_no = this.object.item_no[this.getrow()]
	if ls_item_no = '' or isnull(ls_item_no) then
		return
	else
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
//		this.getchild("qa", idwc_qa)
//		idwc_qa.settransobject(sqlca)
//			
//		ls_where = "WHERE item.item_no = ~~'" + ls_item_no + "~~'"
//		ls_sql = "datawindow.table.select = '" + is_qasql + ls_where + "'"
//					
//		idwc_qa.modify(ls_sql)
//		idwc_qa.retrieve()
	end if
end if

end event

event itemerror;choose case dwo.name
	case 'color'
		this.object.color[row] = upper(data)
		
	case else
		if is_flag = '1' then
			this.object.item_no[this.getrow()] = ''
		elseif is_flag = '1' then
			this.object.qa[this.getrow()] = ''	
		else
		   this.object.price[this.getrow()] = ir_price
		end if
end choose

return 2

end event

event editchanged;string ls_data,  ls_item
long   ll_found, ll_row
int    li_line

choose case dwo.name
	case 'item_no'
		 ls_data = data + '%'
		 ll_row   = idwc_item.RowCount( )
		 ll_found = idwc_item.Find("item_no like '" + ls_data + "'", 1, ll_row)
		 li_line  = integer(this.Describe("qa.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_item.scrolltorow(ll_found)
		 
	case 'qa'
		 ls_data = data + '%'
		 ll_row   = idwc_qa.RowCount( )
		 ll_found = idwc_qa.Find("qa like '" + ls_data + "'", 1, ll_row)
		 li_line  = integer(this.Describe("qa.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_qa.scrolltorow(ll_found)
		 
	case 'order_qty', 'price'
		 this.accepttext()
end choose

RETURN 0
end event

event clicked;if row < 1 then return
this.scrolltorow(row)
end event

type dw_4 from datawindow within w_orsalecon_m
integer x = 32
integer y = 460
integer width = 1637
integer height = 988
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_orconfirm_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.rowcount() > 0 then
	dw_2.retrieve(this.object.order_no[this.getrow()])
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
	
	dw_3.retrieve(this.object.order_no[this.getrow()])
	dw_2.setcolumn('due_date')
//	dw_2.setfocus()	
end if

end event

event retrieveend;if dw_2.getrow() <= 0  then
	dw_2.reset()
	dw_3.reset()
//	pb_4.visible = false
end if

end event

event clicked;string ls_col, ls_text

if row < 1 then return
this.scrolltorow(row)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

choose case dwo.name
	case "order_no"
		ls_col = "수주번호"
		ls_text = this.object.order_no[row]
	case "due_date"
		ls_col = "납기일자"
		ls_text = string(this.object.due_date[row])
	case "cust_name"
		ls_col = "거래처명"
		ls_text = this.object.cust_name[row]
	case "scene_desc"
		ls_col = "현장명"
		ls_text = this.object.scene_desc[row]
end choose		

choose case ls_col
	case "번호", "처리자"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type st_1 from statictext within w_orsalecon_m
integer x = 1888
integer y = 244
integer width = 393
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
boolean enabled = false
string text = "판매거래처"
boolean focusrectangle = false
end type

type st_2 from statictext within w_orsalecon_m
integer x = 727
integer y = 244
integer width = 320
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
boolean enabled = false
string text = "주문일자"
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsalecon_m
integer x = 1061
integer y = 244
integer width = 347
integer height = 76
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

type em_2 from editmask within w_orsalecon_m
integer x = 1467
integer y = 244
integer width = 347
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

type st_3 from statictext within w_orsalecon_m
integer x = 1413
integer y = 252
integer width = 50
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

type cbx_1 from checkbox within w_orsalecon_m
integer x = 3973
integer y = 244
integer width = 434
integer height = 76
integer taborder = 70
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
end event

type dw_5 from datawindow within w_orsalecon_m
integer x = 2363
integer y = 32
integer width = 110
integer height = 84
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_orsalecon_m3"
boolean livescroll = true
end type

type dw_6 from datawindow within w_orsalecon_m
integer x = 2482
integer y = 32
integer width = 110
integer height = 84
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_orsalecon_m4"
boolean livescroll = true
end type

type rb_all from radiobutton within w_orsalecon_m
integer x = 82
integer y = 244
integer width = 283
integer height = 76
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
integer x = 379
integer y = 244
integer width = 283
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부분"
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
integer x = 2601
integer y = 32
integer width = 110
integer height = 84
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type em_3 from editmask within w_orsalecon_m
integer x = 1047
integer y = 88
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

event modified;pb_compute.default = false

end event

type dw_8 from datawindow within w_orsalecon_m
integer x = 942
integer y = 1788
integer width = 2958
integer height = 680
integer taborder = 110
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

type dw_area from datawindow within w_orsalecon_m
integer x = 1815
integer y = 88
integer width = 503
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type rb_1 from radiobutton within w_orsalecon_m
integer x = 4270
integer y = 2124
integer width = 178
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
boolean enabled = false
string text = "반월"
boolean righttoleft = true
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

type rb_2 from radiobutton within w_orsalecon_m
integer x = 4270
integer y = 2188
integer width = 178
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
string text = "시화"
boolean righttoleft = true
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
integer x = 4270
integer y = 2252
integer width = 178
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
string text = "전체"
boolean righttoleft = true
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

type st_8 from statictext within w_orsalecon_m
integer x = 32
integer y = 376
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

type ddlb_col from dropdownlistbox within w_orsalecon_m
integer x = 215
integer y = 356
integer width = 329
integer height = 532
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"수주번호","납기일자","거래처명","현장명"}
end type

type st_9 from statictext within w_orsalecon_m
integer x = 558
integer y = 376
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

type ddlb_2 from dropdownlistbox within w_orsalecon_m
integer x = 741
integer y = 356
integer width = 279
integer height = 512
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsalecon_m
integer x = 1033
integer y = 360
integer width = 347
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_orsalecon_m
integer x = 1385
integer y = 336
integer width = 142
integer height = 64
integer taborder = 10
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
		case "납기일자"
			ls_col = "due_date "
		case "거래처명"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "due_date " then
			ls_column = ls_col + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
		end if
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

event getfocus;//

end event

type cb_filteroff from commandbutton within w_orsalecon_m
integer x = 1527
integer y = 336
integer width = 142
integer height = 64
integer taborder = 20
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
ddlb_col.text   = "거래처명"
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()

end event

type cb_7 from commandbutton within w_orsalecon_m
integer x = 1385
integer y = 400
integer width = 142
integer height = 64
integer taborder = 150
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
	case "납기일자"
		ls_col = "due_date "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
end choose		

dw_4.SetSort(ls_col + "A")
dw_4.sort()

end event

type cb_4 from commandbutton within w_orsalecon_m
integer x = 1527
integer y = 400
integer width = 142
integer height = 64
integer taborder = 160
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
	case "납기일자"
		ls_col = "due_date "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
end choose		

dw_4.SetSort(ls_col + "D")
dw_4.sort()

end event

type st_5 from statictext within w_orsalecon_m
integer x = 2359
integer y = 152
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
integer x = 3218
integer y = 44
integer width = 329
integer height = 144
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
alignment htextalign = left!
vtextalign vtextalign = multiline!
end type

event clicked;gs_where        lstr_where
string ls_cust_no, ls_cust_name

ls_cust_no   = dw_2.object.cust_no[1]
ls_cust_name = dw_2.object.customer_cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
openwithparm(w_whopeom_w, lstr_where)

end event

