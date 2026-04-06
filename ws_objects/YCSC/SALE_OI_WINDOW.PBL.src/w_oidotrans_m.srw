$PBExportHeader$w_oidotrans_m.srw
$PBExportComments$거래명세서이관
forward
global type w_oidotrans_m from w_inheritance
end type
type rb_1 from radiobutton within w_oidotrans_m
end type
type rb_2 from radiobutton within w_oidotrans_m
end type
type rb_3 from radiobutton within w_oidotrans_m
end type
type rb_4 from radiobutton within w_oidotrans_m
end type
type em_1 from editmask within w_oidotrans_m
end type
type em_2 from editmask within w_oidotrans_m
end type
type dw_4 from datawindow within w_oidotrans_m
end type
type st_1 from statictext within w_oidotrans_m
end type
type st_2 from statictext within w_oidotrans_m
end type
type dw_3 from datawindow within w_oidotrans_m
end type
type cbx_trans from checkbox within w_oidotrans_m
end type
type cb_1 from commandbutton within w_oidotrans_m
end type
type dw_5 from dw_1 within w_oidotrans_m
end type
type dw_6 from datawindow within w_oidotrans_m
end type
type cbx_2 from checkbox within w_oidotrans_m
end type
type cbx_1 from checkbox within w_oidotrans_m
end type
end forward

global type w_oidotrans_m from w_inheritance
integer x = 5
integer y = 100
integer height = 2460
string title = "거래명세서 출고이관(w_oidotrans_m)"
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
em_1 em_1
em_2 em_2
dw_4 dw_4
st_1 st_1
st_2 st_2
dw_3 dw_3
cbx_trans cbx_trans
cb_1 cb_1
dw_5 dw_5
dw_6 dw_6
cbx_2 cbx_2
cbx_1 cbx_1
end type
global w_oidotrans_m w_oidotrans_m

type variables
string   is_scenesql
st_print i_print
datawindowchild idwc_cust, idwc_scene

end variables

forward prototypes
public function boolean wf_check (string as_esti)
public subroutine wf_calc ()
public subroutine wf_cust ()
public subroutine wf_sceneretrieve (string as_cust)
end prototypes

public function boolean wf_check (string as_esti);return true

end function

public subroutine wf_calc ();//decimal lr_esti_amount, lr_price, lr_amt, lr_acc_qty1, lr_vat
//long ll_row
//string ls_vat
//
//dw_2.accepttext()
//dw_4.accepttext()
//ls_vat = dw_2.getitemstring(1, "vat_flag")
//
//lr_esti_amount = 0
//for ll_row = 1 to dw_4.rowcount()
//	lr_price = dw_4.getitemdecimal(ll_row, "unit_cost")
//	lr_acc_qty1 = dw_4.getitemdecimal(ll_row, "acc_qty")
//	lr_amt = truncate(lr_acc_qty1 * lr_price, 0)
//	dw_4.object.item_amt[ll_row] = lr_amt
//	lr_esti_amount = lr_esti_amount + lr_amt
//next
//dw_2.object.esti_amount[1] = lr_esti_amount
//
////VAT와 총금액
//if ls_vat = 'Y' then
//	lr_vat = truncate(lr_esti_amount / 10, 0)
//	dw_2.object.esti_tax[1] = lr_vat 
//	dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//else
//	dw_2.object.esti_total[1] = lr_esti_amount
//end if
//


decimal lr_esti_amount, lr_price, lr_amt, lr_acc_qty1, lr_vat
long ll_row
string ls_vat

dw_2.accepttext()
dw_4.accepttext()
ls_vat = dw_2.getitemstring(1, "vat_flag")

lr_esti_amount = 0
for ll_row = 1 to dw_4.rowcount()
	lr_price = dw_4.getitemdecimal(ll_row, "unit_cost")
	lr_acc_qty1 = dw_4.getitemdecimal(ll_row, "acc_qty")
	lr_amt = truncate(lr_acc_qty1 * lr_price + 0.0000001, 0)
	dw_4.object.item_amt[ll_row] = lr_amt
	lr_esti_amount = lr_esti_amount + lr_amt
next
dw_2.object.esti_amount[1] = lr_esti_amount

////VAT와 총금액
//if ls_vat = 'Y' then
//	lr_vat = truncate(lr_esti_amount / 10, 0)
//	dw_2.object.esti_tax[1] = lr_vat 
//	dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//else
//	dw_2.object.esti_total[1] = lr_esti_amount
//end if
//

/* 20080123 부가세 계산방식 변경
if ls_vat = 'Y' then
	dw_2.object.esti_tax[1] = 0
	for ll_row = 1 to dw_4.rowcount()
		 dw_2.object.esti_tax[1] = dw_2.object.esti_tax[1] + TRUNCATE((dw_4.object.item_amt[ll_row] / 10) + 0.0000001, 0 )
	next
else
	dw_2.object.esti_tax[1] = 0
end if
dw_2.object.esti_total[1] = dw_2.object.esti_amount[1] + dw_2.object.esti_tax[1]
*/

// 20080123 부가세 계산방식 변경
if ls_vat = 'Y' then
	lr_vat = truncate(lr_esti_amount / 10 + 0.0000001, 0)
	dw_2.object.esti_tax[1] = lr_vat
else
	dw_2.object.esti_tax[1] = 0
end if
dw_2.object.esti_total[1] = lr_vat + lr_esti_amount

end subroutine

public subroutine wf_cust ();//gs_whcustret_str lst_whcustret
//
//openwithparm(w_whcustret_w, lst_whcustret)
//lst_whcustret = message.powerobjectparm
//
//string ls_where, ls_sql, ls_salesman
//
//if lst_whcustret.cust_chk = 'Y' then
//	dw_2.object.cust_no[1] = lst_Whcustret.cust_no
//	dw_2.object.cust_name[1] = lst_Whcustret.cust_name
//	select salesman into :ls_salesman from customer
//	  where cust_no = :lst_Whcustret.cust_no ;
//	dw_2.object.emp_no[1] = ls_salesman
//else
//	return
//end if
//dw_2.object.scene_code[1] = ''
//dw_2.object.scene_desc[1] = ''
//idwc_scene.reset()
//ls_where = "WHERE scene.cust_no = ~~'" + lst_Whcustret.cust_no + "~~'"
//ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
//
//dw_2.getchild("scene_code", idwc_scene)
//idwc_scene.settransobject(sqlca)
//idwc_scene.modify(ls_sql)
//idwc_scene.retrieve()
//if idwc_scene.rowcount() > 0 then
//	dw_2.setcolumn("scene_code")
//else
//	dw_2.setcolumn("system_no")
//end if

end subroutine

public subroutine wf_sceneretrieve (string as_cust);// 선택한 거래처의 현장만 보여주기
string ls_where, ls_sql

ls_where = "WHERE scene.cust_no = ~~'" + as_cust + "~~'"
ls_sql   = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

dw_2.getchild("tspot_code", idwc_scene)
idwc_scene.SetTransObject(sqlca)
idwc_scene.Modify(ls_sql)
idwc_scene.Retrieve()

end subroutine

on w_oidotrans_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.em_1=create em_1
this.em_2=create em_2
this.dw_4=create dw_4
this.st_1=create st_1
this.st_2=create st_2
this.dw_3=create dw_3
this.cbx_trans=create cbx_trans
this.cb_1=create cb_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.dw_4
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.dw_3
this.Control[iCurrent+11]=this.cbx_trans
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.dw_5
this.Control[iCurrent+14]=this.dw_6
this.Control[iCurrent+15]=this.cbx_2
this.Control[iCurrent+16]=this.cbx_1
end on

on w_oidotrans_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.cbx_trans)
destroy(this.cb_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.cbx_2)
destroy(this.cbx_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_4.visible = false
dw_6.visible = false

em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')

dw_2.getchild("tcust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)
idwc_cust.settransobject(sqlca)

dw_2.getchild("tspot_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.insertrow(0)  
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_5.insertrow(0)  //춘 19
dw_5.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

dw_5.insertrow(0)  //춘 19

cbx_trans.checked = true	// 출고이관 데이터
pb_insert.visible = false  // 추가

pb_retrieve.triggerevent( clicked! )

end event

event resize;call super::resize;// 출고이관 목록
gb_2.height = this.height - 376
//dw_1.height = this.height - 468

dw_1.height = this.height - 620
dw_1.y = 440

// 이관내용
dw_2.width  = this.width  - 1404
//dw_2.height = this.height - 1648
// 이관품목
dw_3.width  = this.width  - 1404
dw_3.height = this.height - 1303

end event

type pb_save from w_inheritance`pb_save within w_oidotrans_m
integer x = 4219
integer y = 56
integer taborder = 80
end type

event pb_save::clicked;call super::clicked;//
dwitemstatus l_status
String	ls_trans_no, ls_area, ls_str, ls_seq
int     li_seq
long   ll_row, ll_save

dw_2.accepttext()
dw_3.accepttext()

if dw_3.rowcount() < 1 then
	MessageBox("확인","이관할 출고자료를 선택하여 주십시요.",Exclamation!)
	return
end if

if wf_nullchk(dw_2) = false then return
if wf_nullchk(dw_3) = false then return

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,2) = 2 then return

ls_area = 'TR'
ls_str = dw_2.Object.trans_no[1]
if ls_str = 'NEW' then
	ls_str = ls_area + string(date(gdt_today),'yyyymmdd') + '%'

	SELECT MAX(trans_no)
	into :ls_trans_no
	FROM DoTrans
	WHERE trans_no like :ls_str
	;
	if isnull(ls_trans_no) or ls_trans_no = '' then
		ls_trans_no = ls_area + string(date(gdt_today),'yyyymmdd') + '-' + '001'
	else
		li_seq = integer(MidA(ls_trans_no, 12, 3))
		li_seq = li_seq + 1
		ls_seq = '00' + string(li_seq)
		ls_trans_no = LeftA(ls_trans_no, 11) + RightA(ls_seq, 3)
	end if
	
	dw_2.Object.trans_no[1] = ls_trans_no
	for ll_row = 1 to dw_3.RowCount()
		dw_3.Object.trans_no[ll_row] = ls_trans_no
		dw_3.Object.seq_no[ll_row] = ll_row
	next
	
else
	setnull(ls_trans_no)
	ls_str = dw_2.object.trans_no[1]		
	SELECT trans_no
	into :ls_trans_no
	FROM DoTrans
	WHERE trans_no = :ls_str
	;
	
	if trim(ls_trans_no) = '' OR isnull(ls_trans_no) then
	else
		MessageBox("저장","요청 번호가 이미 존재합니다.", exclamation!)
		return
	end if
end if

if	wf_update2(dw_2, dw_3, 'Y') = FALSE THEN RETURN

ll_save = dw_1.getrow()
pb_retrieve.triggerevent( clicked! )

if ll_save > 0 and dw_1.rowcount() >= ll_save then
	dw_1.scrolltorow( ll_save )	// 저장위치 까지 scroll
end if
end event

type dw_1 from w_inheritance`dw_1 within w_oidotrans_m
integer x = 46
integer y = 440
integer width = 1225
integer height = 1832
integer taborder = 160
string dataobject = "d_oidotrans_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string  ls_trans_no, ls_dono, ls_null
decimal ld_do_total, ld_balance_amt
string  ls_cust_no,  ls_spot_code, ls_register_no, ls_level_grade, ls_captain_name, ls_collect_day
string  ls_Check, ls_scene_code, ls_spot_desc
long    ll_row, ll_max, ll_find, ll_row2

setnull( ls_null )
dw_1.accepttext()

if currentrow < 1 or currentrow > dw_1.rowcount() then return
dw_1.SetRow(currentrow)

//dw_2.reset()
//dw_3.reset()
ls_trans_no = dw_1.object.trans_no[currentrow]		// 이관번호
ls_dono		= dw_1.object.do_no[currentrow]			// 송장번호
if ls_trans_no = "NEW" then	// 신규입력시
	if dw_2.RowCount() < 1 then	// 출고이관 데이터가 존재하지 않으면
		ll_row = dw_2.InsertRow(0)
		
		SELECT do_total     = a.do_total
			  , cust_no      = a.cust_no
			  , spot_code    = a.spot_code
			  , register_no  = b.register_no
			  , level_grade  = b.level_grade 
			  , captain_name = b.captain_name
			  , balance_amt  = b.balance_amt
			  , collect_day  = CONVERT(char(10),DATEADD(day, CAST(isnull(b.credit_day,0) AS INT), a.do_date),111)
			  , spot_desc	  = ( select scene_desc from scene C where c.scene_code = a.spot_code )
		  INTO :ld_do_total, :ls_cust_no
			  , :ls_spot_code, :ls_register_no, :ls_level_grade, :ls_captain_name, :ld_balance_amt, :ls_collect_day, :ls_spot_desc
		  FROM do A
				 LEFT OUTER JOIN CUSTOMER B  ON A.CUST_NO = B.CUST_NO
		 WHERE a.do_no      = :ls_dono;

		// 송장출고번호 선택시는 이관업체, 이관현장은 공난처리
		dw_2.object.trans_no[1]      = ls_trans_no
		dw_2.object.trans_amt[1]     = ld_do_total
		dw_2.object.fcust_no[1]      = ls_cust_no
		dw_2.object.fspot_code[1]    = ls_spot_code
		dw_2.object.fregister_no[1]  = ls_register_no
		dw_2.object.flevel_grade[1]  = ls_level_grade
		dw_2.object.fcaptain_name[1] = ls_captain_name
		dw_2.object.funpaid_amt[1]   = ld_balance_amt
		dw_2.object.fcollect_day[1]  = ls_collect_day
		dw_2.object.fspot_desc[1]	  = ls_spot_desc

      dw_2.object.tspot_code[1]    = ls_null

//		dw_2.object.bigo.protect = 1
//		dw_2.object.bigo.background.color = rgb(192,192,192)
//		dw_2.object.tcust_no.protect = 1
//		dw_2.object.tcust_no.background.color = rgb(192,192,192)
//		dw_2.object.tspot_code.protect = 1
//		dw_2.object.tspot_code.background.color = rgb(192,192,192)
//		dw_2.object.tcollect_day.protect = 1
//		dw_2.object.tcollect_day.background.color = rgb(192,192,192)
	end if
	
else
	ll_row = dw_2.retrieve( ls_trans_no )
	ls_cust_no   = dw_2.object.tcust_no[1]
	ls_spot_code = dw_2.object.tspot_code[1]

	dw_2.object.bigo.protect = 0
	dw_2.object.bigo.background.color = rgb(255, 255, 255)
	dw_2.object.tcust_no.protect = 0
	dw_2.object.tcust_no.background.color = rgb(255, 255, 255)
	dw_2.object.tspot_code.protect = 0
	dw_2.object.tspot_code.background.color = rgb(255, 255, 255)
	dw_2.object.tcollect_day.protect = 0
	dw_2.object.tcollect_day.background.color = rgb(255, 255, 255)
	
	dw_2.getchild("tspot_code", idwc_scene)
	idwc_scene.settransobject(sqlca)
	idwc_scene.Retrieve( ls_cust_no )	
	if idwc_scene.rowcount() > 0 then
		/////////////////////////////////////////
		// 현장명 코드로 표시부분 방지(트릭)
		dw_2.setcolumn("tspot_code")
		dw_2.setfocus()		

		dw_1.setcolumn("trans_no")
		this.setfocus()		
		/////////////////////////////////////////			
	else
		dw_2.object.tspot_code.protect = 1
		dw_2.object.tspot_code.background.color = rgb(192,192,192)
	end if		
	
	dw_3.Retrieve( ls_trans_no )
	
end if

	

end event

event dw_1::itemchanged;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
//pb_retrieve.setfocus()
//
end event

event dw_1::doubleclicked;call super::doubleclicked;String	ls_Check, ls_trans_no, ls_cust_no, ls_scene_code, ls_dono, ls_str
decimal	ld_do_total, ld_balance_amt
long		ll_find, ll_row

dw_3.AcceptText()

ls_trans_no = dw_1.object.trans_no[row]		// 이관번호
ls_dono		= dw_1.object.do_no[row]			// 송장번호

ls_Check = this.Object.cc_check[row]
if ls_Check = 'N' then
	this.Object.cc_check[row] = 'Y'
else
	this.Object.cc_check[row] = 'N'
end if

ll_find = dw_3.Find("do_no = '" + ls_dono + "'", 1, dw_3.RowCount())
if ll_find > 0 then
	dw_3.DeleteRow( ll_find )		
else
	
	SELECT do_total, cust_no, spot_code
	INTO :ld_do_total, :ls_cust_no, :ls_scene_code
	FROM DO
	WHERE DO_NO = :ls_dono
	using sqlca;
	
	ll_row = dw_3.InsertRow( dw_3.RowCount() + 1 )
	
	dw_3.Object.do_no[ll_row]			= ls_dono
	dw_3.Object.trans_amt[ll_row]		= ld_do_total
	dw_3.Object.cust_no[ll_row]		= ls_cust_no
	dw_3.Object.scene_code[ll_row]	= ls_scene_code
				
end if

dw_3.GroupCalc()
dw_3.AcceptText()

ls_str = dw_3.Describe("Evaluate('LookUpDisplay(scene_code)', 1)")

if dw_3.RowCount() > 1 then ls_str = ls_str + ' 외 ' + string(dw_3.RowCount() - 1) + '건'

dw_2.Object.fspot_desc[1] = ls_str
dw_2.Object.trans_amt[1] = dw_3.Object.cf_trans_amt_a[1]

end event

type dw_2 from w_inheritance`dw_2 within w_oidotrans_m
integer x = 1326
integer y = 244
integer width = 3314
integer height = 864
integer taborder = 180
string dataobject = "d_oidotrans_m"
boolean vscrollbar = false
boolean hsplitscroll = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemfocuschanged;call super::itemfocuschanged;////
//string  ls_where, ls_sql, ls_data, ls_null, ls_tcust_no, ls_tspot_code
//string  ls_trans_no,  ls_close, ls_grade, ls_regno, ls_captain, ls_collect
//long    ll_row,   ll_cnt
//decimal ld_amt,   ld_balance
//datetime ld_dodate
//
//this.AcceptText()
//setnull( ls_null )
//
//ls_trans_no = this.object.trans_no[row]				// 요청번호 
//if isnull(ls_trans_no) or ls_trans_no = "" then return
//
//ls_tcust_no   = this.object.tcust_no[row]
//ls_tspot_code = this.object.tspot_code[row]
//
//choose case dwo.name
//	case "tcust_no"
//		this.getchild("tcust_no", idwc_cust)		// 거래처
//		idwc_cust.SetTransObject(SQLCA)
//		
//		this.getchild("tspot_code",idwc_scene)		// 현장명
//		idwc_scene.SetTransObject(SQLCA)
//				
////		ls_data  = data
//      ls_data  = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no")
//		
//  	   ll_row   = idwc_cust.RowCount()
//		ll_cnt   = idwc_cust.Find("cust_no = '" + ls_data + "'", 1, ll_row)		
//		if ll_cnt = 0 then
//			MessageBox("확인","Changed " + ls_data + "위와 같은고객이 존재하지 않습니다!",exclamation!)
//			return 1
//		end if
//
//		SELECT count(*) INTO :ll_cnt FROM customer WHERE cust_no = :ls_data AND open_close = 'C';
//		if ll_cnt = 1 then
//			MessageBox("확인","Changed 사용불가 거래처입니다." + ls_data + " 거래처 RELOAD 후 사용 바랍니다.!",exclamation!)
//			return 1
//		end if
//
//		SELECT do_date INTO :ld_dodate  FROM do  WHERE do_no  = :ls_trans_no;		// 출고일자
//		
//		SELECT isnull(sale_control,'N'), level_grade, register_no, captain_name, balance_amt
//		     , credit_day = CONVERT(char(10),DATEADD(day, CAST(isnull(credit_day,0) AS INT), :ld_dodate),111)
//		  INTO :ls_close, :ls_grade, :ls_regno, :ls_captain, :ld_balance, :ls_collect 
//		  FROM customer 
//		 WHERE cust_no = :ls_data;
//		if SQLCA.SQLCode = 0 then
//		else
//			if cbx_trans.checked = true then
//			else
//				//MessageBox("확인","Changed 이관업체 데이터 오류 입니다. 재 조회하시기 바랍니다.")
//			end if
//			return 1
//		end if
//
//		if ls_close = 'A' or ls_close = 'Y' then // 매출통제
//			MessageBox("확인","Changed 매출통제 대상 거래처입니다.!",stopsign!)
//		   return 1
//		end if
//		
//		this.object.tlevel_grade[1]  = ls_grade		// 신용등급
//		this.object.tregister_no[1]  = ls_regno		// 사업자번호
//		this.object.tcaptain_name[1] = ls_captain		// 대표자명
//		this.object.tunpaid_amt[1]   = ld_balance		// 채권잔액
//		this.object.tcollect_day[1]  = ls_collect		// 수금예정일
//		
//		this.object.tspot_code[1]    = ls_null       // NULL
//		idwc_scene.reset()
//		if idwc_scene.Retrieve(ls_data) > 0 then
//			dw_2.object.tspot_code.protect = 0		// 해지
//			dw_2.object.tspot_code.background.color = rgb(255,255,255)
//		else			
//	      idwc_scene.insertrow(0)  
//			dw_2.object.tspot_code.protect = 1
//			dw_2.object.tspot_code.background.color = rgb(192,192,192)
//			MessageBox("확인", "Changed 해당하는 거래처(" + ls_data + ")의 현장이 존재하지 않습니다.")
//			return 1
//		end if
//		
//	case "tspot_code"
//		this.getchild("tcust_no", idwc_cust)		// 거래처
//		idwc_cust.SetTransObject(SQLCA)
//		
//		this.getchild("tspot_code",idwc_scene)		// 현장명
//		idwc_scene.SetTransObject(SQLCA)
//				
//		ls_data = this.object.tcust_no[row]				// 이관업체		
////		this.object.tspot_code[1]    = ls_null       // NULL
//		idwc_scene.reset()
//		if idwc_scene.Retrieve( ls_data ) > 0 then
//			dw_2.object.tspot_code.protect = 0			// 해지
//			dw_2.object.tspot_code.background.color = rgb(255,255,255)
//		else			
//	      idwc_scene.insertrow(0)  
//			dw_2.object.tspot_code.protect = 1
//			dw_2.object.tspot_code.background.color = rgb(192,192,192)
//			MessageBox("확인", "Changed 해당하는 거래처(" + ls_data + ")의 현장이 존재하지 않습니다.")
//			return 1
//		end if
//end choose
//
end event

event dw_2::itemchanged;call super::itemchanged;//
string  ls_where, ls_sql, ls_data, ls_null
string  ls_trans_no,  ls_custno, ls_close, ls_grade, ls_regno, ls_captain, ls_collect, ls_dono
long    ll_row,   ll_cnt
decimal ld_amt,   ld_balance
datetime ld_dodate

setnull( ls_null )
this.AcceptText()

ls_trans_no   = this.object.trans_no[row]			// 요청번호 
ls_custno = this.object.tcust_no[row]				// 변경거래처 
if isnull(ls_trans_no) or ls_trans_no = "" then return

this.getchild("tcust_no", idwc_cust)		// 거래처
idwc_cust.SetTransObject(SQLCA)

this.getchild("tspot_code",idwc_scene)		// 현장명
idwc_scene.SetTransObject(SQLCA)
		
choose case dwo.name
	case "tcust_no"
      ls_data  = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no")
  	   ll_row   = idwc_cust.RowCount()
		ll_cnt   = idwc_cust.Find("cust_no = '" + ls_data + "'", 1, ll_row)		
		if ll_cnt = 0 then
			MessageBox("확인","Edit " + ls_data + "위와 같은고객이 존재하지 않습니다!",exclamation!)
			return 1
		end if

		SELECT count(*) INTO :ll_cnt FROM customer WHERE cust_no = :ls_data AND open_close = 'C';
		if ll_cnt = 1 then
			MessageBox("확인","Edit 사용불가 거래처입니다." + ls_data + " 거래처 RELOAD 후 사용 바랍니다.!",exclamation!)
			return 1
		end if
		
		if dw_3.RowCount() < 1 then
			MessageBox("확인","출고자료를 먼저 선택하여 주시기 바랍니다.",Exclamation!)
			return
		end if

		ls_dono = dw_3.Object.do_no[1] //1번째 자료의 출고번호를 읽어온다.
		SELECT do_date INTO :ld_dodate  FROM do  WHERE do_no  = :ls_dono;		// 출고일자
				
		SELECT isnull(sale_control,'N'), level_grade, register_no, captain_name, balance_amt
		     , credit_day = CONVERT(char(10),DATEADD(day, CAST(isnull(credit_day,0) AS INT), :ld_dodate),111)
		  INTO :ls_close, :ls_grade, :ls_regno, :ls_captain, :ld_balance, :ls_collect 
		  FROM customer 
		 WHERE cust_no = :ls_data;
		if SQLCA.SQLCode = 0 then
		else
			MessageBox("확인","Edit 이관업체 데이터 오류 입니다. 재 조회하시기 바랍니다.")
			return 1
		end if

		if ls_close = 'A' or ls_close = 'Y' then 		// 매출통제
			MessageBox("확인","Edit 매출통제 대상 거래처입니다.!",stopsign!)
		   return 1
		end if
		
		this.object.tlevel_grade[1]  = ls_grade		// 신용등급
		this.object.tregister_no[1]  = ls_regno		// 사업자번호
		this.object.tcaptain_name[1] = ls_captain		// 대표자명
		this.object.tunpaid_amt[1]   = ld_balance		// 채권잔액
		this.object.tcollect_day[1]  = ls_collect		// 수금예정일
		
		this.object.tspot_code[1]    = ls_null       // NULL
		idwc_scene.reset()
		if idwc_scene.Retrieve(ls_data) > 0 then
			dw_2.object.tspot_code.protect = 0			// 해지
			dw_2.object.tspot_code.background.color = rgb(255,255,255)
		else			
	      idwc_scene.insertrow(0)  
			dw_2.object.tspot_code.protect = 1
			dw_2.object.tspot_code.background.color = rgb(192,192,192)
			MessageBox("확인", "Edit 해당하는 거래처(" + ls_data + ")의 현장이 존재하지 않습니다.")
			return 1
		end if
		
	case "tspot_code"
		ls_data = this.object.tcust_no[row]				// 이관업체		
		this.object.tspot_code[1]    = ls_null       // NULL
		idwc_scene.reset()
		if idwc_scene.Retrieve( ls_data ) > 0 then
			dw_2.object.tspot_code.protect = 0			// 해지
			dw_2.object.tspot_code.background.color = rgb(255,255,255)
		else			
	      idwc_scene.insertrow(0)  
			dw_2.object.tspot_code.protect = 1
			dw_2.object.tspot_code.background.color = rgb(192,192,192)
			MessageBox("확인", "Edit 해당하는 거래처(" + ls_data + ")의 현장이 존재하지 않습니다.")
			return 1
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_oidotrans_m
integer y = 48
integer width = 1294
string text = "거래명세서 출고이관"
end type

type st_tips from w_inheritance`st_tips within w_oidotrans_m
end type

type pb_compute from w_inheritance`pb_compute within w_oidotrans_m
boolean visible = false
integer x = 2706
integer y = 44
integer width = 224
integer taborder = 200
string text = "NOTE"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidotrans_m
boolean visible = false
integer x = 3666
integer y = 44
integer taborder = 70
string picturename = "c:\bmp\mrpin.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수주전환",parent, li_x, li_y)

end event

event pb_print_part::clicked;call super::clicked;dwitemstatus l_status
gs_where lst_where
string   ls_esti_no

dw_2.accepttext()
dw_4.accepttext()

l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = newmodified! or l_status = new! or l_status = DataModified! then
	messagebox('확인','견적서의 내용을 저장하셔야 됩니다.')
	return
end if
if dw_2.rowcount() < 1 then return

ls_esti_no     = dw_2.object.estimate_no[1]
lst_where.str1 = LeftA(ls_esti_no, 10) + RightA(ls_esti_no, 3)
lst_where.str2 = 'E'
lst_where.dw1  = dw_4
OpenWithParm ( w_oeesti_w, lst_where )

end event

type pb_close from w_inheritance`pb_close within w_oidotrans_m
integer x = 4421
integer y = 56
integer taborder = 210
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidotrans_m
integer x = 4027
integer y = 56
integer taborder = 220
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
long   ll_row, ll_row2
string ls_trans_no

ll_row =  dw_2.rowcount()
if ll_row < 1 then return

ls_trans_no = dw_2.object.trans_no[1]

if ls_trans_no = 'NEW' then
	MessageBox("확인","등록 후 인쇄 작업을 진행해 주시기 바랍니다.",Exclamation!)
	return
end if

if cbx_1.checked = true and cbx_2.checked = false then	//이관요청서
	if dw_3.RowCount() < 1 then return
		
	dw_6.reset()
	ll_row   = dw_6.retrieve( ls_trans_no )
	if ll_row < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
		return
	end if
	
	dw_6.Object.dw_1.Width = 3397	//DW수정시 길이 변경 문제로 고정시킴
	dw_6.Object.dw_2.Width = 3397
	
	l_print.name = 'd_oidotrans_m_prt_3'
	l_print.class = ls_trans_no

	l_print.st_datawindow  = dw_6
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 이관요청서를 출력합니다." 
	
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
elseif cbx_1.checked = false and cbx_2.checked = true then	//자재납품 확인서

	dw_4.reset()
	ll_row   = dw_4.retrieve( ls_trans_no )
	if ll_row < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
		return
	end if

	l_print.st_datawindow  = dw_4
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 자재납품 확인서을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
elseif cbx_1.checked = true and cbx_2.checked = true then
	
	dw_4.reset() ; dw_6.reset()
	ll_row = dw_4.retrieve( ls_trans_no )
	ll_row2 = dw_6.retrieve( ls_trans_no )
	
	dw_6.Object.dw_1.Width = 3397	//DW수정시 길이 변경 문제로 고정시킴
	dw_6.Object.dw_2.Width = 3397
	
	if ll_row > 0 then dw_4.print()
	if ll_row2 > 0 then dw_6.print()
	
end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_oidotrans_m
boolean visible = false
integer x = 1157
integer y = 48
integer taborder = 230
boolean bringtotop = true
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = " 시스템  가져 오기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_delete from w_inheritance`pb_delete within w_oidotrans_m
integer x = 3840
integer y = 56
integer taborder = 240
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;call super::clicked;dwitemstatus l_status
long   ll_row, ll_count, ll_cnt, ll_save
string ls_trans_no, ls_order_no, ls_esti_no, ls_reqno, ls_chk

if dw_2.rowcount() < 1 then return

dw_2.accepttext()

l_status    = dw_2.getitemstatus(1, 0, primary!)
ls_trans_no = dw_2.object.trans_no[1] 
ls_chk      = 'N'

if MessageBox("삭제","삭제 하시겠습니까?",question!,okcancel!,2) = 2 then return

if l_status = newmodified! or l_status = new! then
else
	// 거래명세서 출고이관
	dw_2.deleterow(1)
	
	for ll_row = 1 to dw_3.RowCount()	//세부내역 삭제
		dw_3.DeleteRow(ll_row)
	next
	
	// 삭제저장
	if wf_update2(dw_2, dw_3,'Y') = false then return
end if

ll_save = dw_1.getrow()
pb_retrieve.triggerevent( clicked! )

if ll_save > 0 and dw_1.rowcount() >= ll_save then
	dw_1.scrolltorow( ll_save )	// 저장위치 까지 scroll
end if
end event

type pb_insert from w_inheritance`pb_insert within w_oidotrans_m
integer x = 3648
integer y = 56
integer taborder = 250
end type

event pb_insert::clicked;//
string  ls_dono
decimal ld_do_total, ld_balance_amt
string  ls_cust_no,  ls_spot_code, ls_register_no, ls_level_grade, ls_captain_name, ls_collect_day
long    ll_row

ll_row  = dw_1.getrow()
if ll_row < 1 or ll_row > dw_1.rowcount() then return

dw_2.reset()
dw_2.insertrow(0)

ls_dono = dw_1.object.do_no[ll_row]
SELECT do_total     = a.do_total
     , cust_no      = a.cust_no
     , spot_code    = a.spot_code
     , register_no  = b.register_no 
     , level_grade  = b.level_grade 
     , captain_name = b.captain_name
     , balance_amt  = b.balance_amt
     , collect_day  = CONVERT(char(10),DATEADD(day, cast(isnull(b.credit_day,0) AS INT), a.do_date),111)
  INTO :ld_do_total, :ls_cust_no
     , :ls_spot_code, :ls_register_no, :ls_level_grade, :ls_captain_name, :ld_balance_amt, :ls_collect_day
  FROM do A
       LEFT OUTER JOIN CUSTOMER B  ON A.CUST_NO = B.CUST_NO
 WHERE a.do_no      = :ls_dono;
if SQLCA.SQLCode = 0 then
else
	MessageBox("확인","출고번호 데이터 조회 오류 입니다. 재 조회하시기 바랍니다.")
	return -1
end if

dw_2.object.do_no[1]         = ls_dono
dw_2.object.trans_amt[1]     = ld_do_total
dw_2.object.fcust_no[1]      = ls_cust_no
dw_2.object.fspot_code[1]    = ls_spot_code
dw_2.object.fregister_no[1]  = ls_register_no
dw_2.object.flevel_grade[1]  = ls_level_grade
dw_2.object.fcaptain_name[1] = ls_captain_name
dw_2.object.funpaid_amt[1]   = ld_balance_amt
dw_2.object.fcollect_day[1]  = ls_collect_day

// 거래처 선택후 현장불러오기 진행함
dw_2.getchild("tspot_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.insertrow(0)
idwc_scene.Retrieve( "" )		

dw_2.object.bigo.protect = 0
dw_2.object.bigo.background.color = rgb(255, 255, 255)
dw_2.object.tcust_no.protect = 0
dw_2.object.tcust_no.background.color = rgb(255, 255, 255)
dw_2.object.tspot_code.protect = 0
dw_2.object.tspot_code.background.color = rgb(255, 255, 255)
dw_2.object.tcollect_day.protect = 0
dw_2.object.tcollect_day.background.color = rgb(255, 255, 255)

if cbx_trans.checked = true then
else
	dw_2.setcolumn("bigo")
	dw_2.setfocus()		
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidotrans_m
integer x = 3442
integer y = 56
integer taborder = 40
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_cust_no, ls_sdate, ls_edate, ls_trans, ls_trans_no
long   ll_row

dw_5.AcceptText()
ls_cust_no = trim(dw_5.object.cust_no[1])

if ls_cust_no = '' or isnull(ls_cust_no) then
	dw_5.setfocus()
	return
end if

ls_sdate = string(date(em_1.text),"yyyymmdd")
ls_edate = string(date(em_2.text),"yyyymmdd")
if cbx_trans.checked = true then
	ls_trans = "Y"
else
	ls_trans = "N"
end if

dw_1.reset()
dw_2.reset()
dw_3.reset()
ll_row   = dw_1.retrieve( ls_cust_no, ls_sdate, ls_edate, ls_trans )
if ll_row < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

if dw_1.RowCount() > 0 then
	ls_trans_no = dw_1.Object.trans_no[1]
	if isNULL(ls_trans_no) then ls_trans_no = ''
	
	if ls_trans_no <> '' then dw_3.Retrieve( ls_trans_no )
else
	dw_2.insertrow(0)
end if


end event

type gb_3 from w_inheritance`gb_3 within w_oidotrans_m
integer x = 1522
integer y = 8
integer width = 1874
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oidotrans_m
integer x = 23
integer y = 220
integer width = 1280
integer height = 2060
integer taborder = 190
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "출고이관"
end type

type gb_1 from w_inheritance`gb_1 within w_oidotrans_m
integer x = 3410
integer y = 8
integer width = 1230
integer height = 212
integer taborder = 150
integer weight = 400
end type

type rb_1 from radiobutton within w_oidotrans_m
integer x = 2089
integer y = 60
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_oidotrans_m
integer x = 2327
integer y = 60
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "결재"
end type

type rb_3 from radiobutton within w_oidotrans_m
integer x = 2089
integer y = 128
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "보류"
end type

type rb_4 from radiobutton within w_oidotrans_m
integer x = 2327
integer y = 128
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "미결"
end type

type em_1 from editmask within w_oidotrans_m
integer x = 2569
integer y = 128
integer width = 347
integer height = 76
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oidotrans_m
integer x = 3013
integer y = 128
integer width = 352
integer height = 76
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_4 from datawindow within w_oidotrans_m
integer x = 928
integer y = 4
integer width = 101
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oidotrans_r"
boolean livescroll = true
end type

type st_1 from statictext within w_oidotrans_m
integer x = 2930
integer y = 100
integer width = 73
integer height = 84
boolean bringtotop = true
integer textsize = -24
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oidotrans_m
integer x = 2569
integer y = 52
integer width = 795
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "출고기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oidotrans_m
event ue_1 pbm_custom01
integer x = 1326
integer y = 1124
integer width = 3314
integer height = 1156
integer taborder = 170
string dataobject = "d_oidoupdate_m2"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_trans from checkbox within w_oidotrans_m
integer x = 64
integer y = 216
integer width = 617
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "출고이관 데이터"
end type

event clicked;//
if this.checked = true then
	pb_insert.visible = false
	pb_delete.visible = true
else
	pb_insert.visible = true
	pb_delete.visible = false
end if

pb_retrieve.triggerevent( clicked! )

end event

type cb_1 from commandbutton within w_oidotrans_m
integer x = 997
integer y = 292
integer width = 274
integer height = 116
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "거래처"
end type

event clicked;pb_Retrieve.PostEvent(Clicked!)
end event

type dw_5 from dw_1 within w_oidotrans_m
integer x = 82
integer y = 308
integer width = 864
integer height = 88
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

type dw_6 from datawindow within w_oidotrans_m
integer x = 1047
integer y = 4
integer width = 101
integer height = 76
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidotrans_m_prt_3"
boolean livescroll = true
end type

type cbx_2 from checkbox within w_oidotrans_m
integer x = 1568
integer y = 136
integer width = 498
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "자재납품확인서"
end type

type cbx_1 from checkbox within w_oidotrans_m
integer x = 1568
integer y = 60
integer width = 498
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "이관요청서"
boolean checked = true
end type

