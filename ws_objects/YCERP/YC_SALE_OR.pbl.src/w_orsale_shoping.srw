$PBExportHeader$w_orsale_shoping.srw
$PBExportComments$쇼핑몰 주문관리
forward
global type w_orsale_shoping from w_inheritance
end type
type st_1 from statictext within w_orsale_shoping
end type
type em_1 from editmask within w_orsale_shoping
end type
type em_2 from editmask within w_orsale_shoping
end type
type st_2 from statictext within w_orsale_shoping
end type
type dw_3 from datawindow within w_orsale_shoping
end type
type dw_4 from datawindow within w_orsale_shoping
end type
type st_4 from statictext within w_orsale_shoping
end type
type tab_1 from tab within w_orsale_shoping
end type
type tabpage_1 from userobject within tab_1
end type
type ddlb_op from dropdownlistbox within tabpage_1
end type
type cbx_fix from checkbox within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cbx_all from checkbox within tabpage_1
end type
type rb_5 from radiobutton within tabpage_1
end type
type rb_4 from radiobutton within tabpage_1
end type
type cbx_dual from checkbox within tabpage_1
end type
type cb_11 from commandbutton within tabpage_1
end type
type cb_10 from commandbutton within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type cb_filteroff from commandbutton within tabpage_1
end type
type cb_filteron from commandbutton within tabpage_1
end type
type sle_value from singlelineedit within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type ddlb_fld from dropdownlistbox within tabpage_1
end type
type dw_6 from datawindow within tabpage_1
end type
type ddlb_dwtitles from dropdownlistbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
ddlb_op ddlb_op
cbx_fix cbx_fix
cb_5 cb_5
cbx_all cbx_all
rb_5 rb_5
rb_4 rb_4
cbx_dual cbx_dual
cb_11 cb_11
cb_10 cb_10
st_6 st_6
cb_2 cb_2
cb_1 cb_1
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
st_9 st_9
st_8 st_8
dw_5 dw_5
ddlb_fld ddlb_fld
dw_6 dw_6
ddlb_dwtitles ddlb_dwtitles
end type
type tabpage_2 from userobject within tab_1
end type
type cb_stop from commandbutton within tabpage_2
end type
type cb_refresh from commandbutton within tabpage_2
end type
type cb_home from commandbutton within tabpage_2
end type
type cb_forward from commandbutton within tabpage_2
end type
type cb_back from commandbutton within tabpage_2
end type
type cb_xml from commandbutton within tabpage_2
end type
type cb_import from commandbutton within tabpage_2
end type
type ole_browser from u_web_browser within tabpage_2
end type
type ddlb_url from dropdownlistbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_stop cb_stop
cb_refresh cb_refresh
cb_home cb_home
cb_forward cb_forward
cb_back cb_back
cb_xml cb_xml
cb_import cb_import
ole_browser ole_browser
ddlb_url ddlb_url
end type
type tabpage_3 from userobject within tab_1
end type
type mle_response from multilineedit within tabpage_3
end type
type tabpage_3 from userobject within tab_1
mle_response mle_response
end type
type tabpage_4 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_4
end type
type cbx_chk from checkbox within tabpage_4
end type
type cb_xls2dw from commandbutton within tabpage_4
end type
type cb_4 from commandbutton within tabpage_4
end type
type rb_2 from radiobutton within tabpage_4
end type
type rb_1 from radiobutton within tabpage_4
end type
type cbx_3 from checkbox within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type dw_7 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_3 cb_3
cbx_chk cbx_chk
cb_xls2dw cb_xls2dw
cb_4 cb_4
rb_2 rb_2
rb_1 rb_1
cbx_3 cbx_3
dw_8 dw_8
dw_7 dw_7
end type
type tab_1 from tab within w_orsale_shoping
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type cb_login from commandbutton within w_orsale_shoping
end type
type cb_gettable from commandbutton within w_orsale_shoping
end type
type ln_h from line within w_orsale_shoping
end type
type hpb_1 from hprogressbar within w_orsale_shoping
end type
type pb_4 from picturebutton within w_orsale_shoping
end type
type shl_1 from statichyperlink within w_orsale_shoping
end type
end forward

global type w_orsale_shoping from w_inheritance
integer y = 112
integer width = 4709
integer height = 2360
string title = "쇼핑몰 주문관리(w_orsale_shoping)"
long backcolor = 79416533
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
dw_3 dw_3
dw_4 dw_4
st_4 st_4
tab_1 tab_1
cb_login cb_login
cb_gettable cb_gettable
ln_h ln_h
hpb_1 hpb_1
pb_4 pb_4
shl_1 shl_1
end type
global w_orsale_shoping w_orsale_shoping

type prototypes
//FUNCTION long ImmGetContext(long hWnd) LIBRARY "imm32.dll"
//FUNCTION long ImmSetConversionStatus(long hWnd, long a, long b) LIBRARY "imm32.dll"
//
end prototypes

type variables
//
string  is_dw, is_ret
string  is_FilePathName, is_FileName, ls_continue

int     idw_w, idw_h
date    id_start_date, id_end_date
boolean ib_retrieve
//
DataWindow dw5, dw6, dw7, dw8
DataWindowChild idwc_user, idwc_area
end variables

forward prototypes
public subroutine wf_itemqa_check ()
end prototypes

public subroutine wf_itemqa_check ();// 품목+규격 오류 검사
long	  ll_row,  ll_cnt
decimal ld_orderqty, ld_amt
string  ls_custno, ls_scene, ls_itemno, ls_qa, ls_qa1, ls_uom, ls_rule, ls_errtext
string  ls_qa_split[], ls_nullarray[], ls_chk1, ls_chk2, ls_chk3, ls_chk4, ls_val1, ls_val2, ls_val3, ls_val4

////////////////////////////////////////////////////////////////////////
// 품목+규격 오류 검사 //  CHK1 = Y, QA1 = 080 : QA1 값이 080만 허용
////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw6.rowcount()
	ls_custno   = dw6.object.cust_no[ll_row]		// 거래처
	ls_scene    = dw6.object.scene_code[ll_row]	// 현장
	
	ls_itemno   = dw6.object.item_no[ll_row]		// 수주품목
	ls_qa       = dw6.object.qa[ll_row]				// 수주규격
	ls_uom      = dw6.object.uom[ll_row]			// 수주단위
   ld_orderqty = dw6.object.order_qty[ll_row]	// 주문수량

	if isnull(ld_orderqty) OR ld_orderqty = 0 then
		dw6.scrolltorow( ll_row )
		MessageBox("확인",string(ll_row) + " 행 수량 확인바랍니다.", stopsign!)
		RETURN
	end if
	
	if PosA(ls_qa, "X") > 0 then
		ls_qa_split = ls_nullarray
		GF_SPLIT( ls_qa, "X", ls_qa_split )

		ls_qa1 = ""		// 초기화
		SELECT rtrim(qa), chk1, chk2, chk3, chk4, qa1, qa2, qa3, qa4 
		  INTO :ls_qa1, :ls_chk1, :ls_chk2, :ls_chk3, :ls_chk4, :ls_val1, :ls_val2, :ls_val3, :ls_val4 
		  FROM itemqa_pattern 
		 WHERE item_no = :ls_itemno AND uom = :ls_uom AND use_yn = 'Y';
		 
		if isnull(ls_qa1) OR ls_qa1 = "" then
			// 품목규격 패턴관리 대상아님
			dw6.object.chk[ll_row] = "Y"			
		else
			if ls_chk1 = "Y" then
				if ls_val1 <> ls_qa_split[1] then
					dw6.scrolltorow( ll_row )					
					ls_errtext = string(ll_row) + " 행 품목의 규격1 오류. " + ls_val1 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				end if
			end if
	
			if ls_chk2 = "Y" then
				if ls_val2 <> ls_qa_split[2] then
					dw6.scrolltorow( ll_row )
					ls_errtext = string(ll_row) + " 행 품목의 규격2 오류. " + ls_val2 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				end if
			end if
	
			if ls_chk3 = "Y" then
				if ls_val3 <> ls_qa_split[3] then
					dw6.scrolltorow( ll_row )
					ls_errtext = string(ll_row) + " 행 품목의 규격3 오류. " + ls_val3 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				end if
			end if
	
			if ls_chk4 = "Y" then
				if ls_val4 <> ls_qa_split[4] then
					dw6.scrolltorow( ll_row )
					ls_errtext = string(ll_row) + " 행 품목의 규격4 오류. " + ls_val4 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				end if
			end if

//			SELECT count(*) INTO :ll_cnt FROM scene WHERE cust_no = :ls_custno AND scene_code = :ls_scene;
//			if isnull(ll_cnt) OR ll_cnt = 0 then 
//				dw6.scrolltorow( ll_row )
//				MessageBox("확인",string(ll_row) + " 행 거래처,현장 오류 입니다.", stopsign!)
//				RETURN
//			else
				SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_itemno AND qa = :ls_qa AND uom = :ls_uom;
				if ll_cnt = 1 then 
					// 품목규격패턴 CHECK PASS(주문관리[w_orsale_m] 로직 복사하여 사용함)
					dw6.object.chk[ll_row] = "Y"
				else
					ls_rule   = dw5.object.order_rule[ll_row]
					if PosA(ls_rule,"주문길이") > 0 then
						dw6.scrolltorow( ll_row )
						ls_errtext = string(ll_row) + " 행 품목의 규격4[주문길이] 오류. 미등록 입니다."
						dw6.object.err_text[ll_row] = ls_errtext
					elseif PosA(ls_rule,"선택길이") > 0 then
						dw6.scrolltorow( ll_row )
						ls_errtext = string(ll_row) + " 행 품목의 규격4[선택길이] 오류. 미등록 입니다."
						dw6.object.err_text[ll_row] = ls_errtext
					else
						dw6.scrolltorow( ll_row )
						ls_errtext = string(ll_row) + " 행 품목의 규격, 단위 오류 입니다."
						dw6.object.err_text[ll_row] = ls_errtext
					end if
				end if
//			end if
		end if
	end if		
next

RETURN


end subroutine

on w_orsale_shoping.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_4=create st_4
this.tab_1=create tab_1
this.cb_login=create cb_login
this.cb_gettable=create cb_gettable
this.ln_h=create ln_h
this.hpb_1=create hpb_1
this.pb_4=create pb_4
this.shl_1=create shl_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.tab_1
this.Control[iCurrent+9]=this.cb_login
this.Control[iCurrent+10]=this.cb_gettable
this.Control[iCurrent+11]=this.ln_h
this.Control[iCurrent+12]=this.hpb_1
this.Control[iCurrent+13]=this.pb_4
this.Control[iCurrent+14]=this.shl_1
end on

on w_orsale_shoping.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.tab_1)
destroy(this.cb_login)
destroy(this.cb_gettable)
destroy(this.ln_h)
destroy(this.hpb_1)
destroy(this.pb_4)
destroy(this.shl_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_chk
string ls_area, ls_salesman

cb_login.visible 		= false
cb_gettable.visible 	= false

if gs_userid <> "1999010s" then RETURN

shl_1.visible = true
tab_1.tabpage_2.visible = true
tab_1.tabpage_3.visible = true

gb_3.visible  = false
dw_1.visible  = false
dw_2.visible  = false
dw_1.sharedata(dw_2)


tab_1.tabpage_1.rb_4.enabled  = false			// 가로창
tab_1.tabpage_1.rb_5.enabled  = false			// 세로창
tab_1.tabpage_1.ddlb_dwtitles.visible = false

setnull( ib_retrieve )
tab_1.tabpage_4.cb_xls2dw.enabled = false		// 변환데이터 가져오기

// 틀고정
tab_1.tabpage_1.cbx_fix.checked = true
tab_1.tabpage_1.cbx_fix.triggerevent( clicked! )

hpb_1.visible = false
hpb_1.position = 0

dw5  = tab_1.tabpage_1.dw_5
dw6  = tab_1.tabpage_1.dw_6
dw7  = tab_1.tabpage_4.dw_7
dw8  = tab_1.tabpage_4.dw_8
dw6.visible = false

dw5.settransobject(sqlca)
dw6.settransobject(sqlca)
dw7.settransobject(sqlca)
dw8.settransobject(sqlca)

// 헤더
//dw7.object.estimate_no.width  = 0		// 견적번호
dw7.object.ysp_confirm.width  = 0		// 확정(YSP)
dw7.object.ysp_qty.width      = 0		// 단면
dw7.object.color.width        = 0		// 색상
dw7.object.type.width         = 0		// 타입
dw7.object.class.width        = 0		// THIN
dw7.object.ysp_qty2.width     = 0		// 양면

//dw7.object.sale_flag.width    = 0		// 수주유형
//dw7.object.curr_code.width    = 0		// 통화

dw7.object.cust_po_no.width   = 0		// 발주번호
dw7.object.cust_po_date.width = 0		// 발주일자

dw7.object.confirm_flag.width = 0		// 확정
dw7.object.confirm_user.width = 0		// 확정자
dw7.object.confirm_date.width = 0		// 확정일자

dw7.object.open_close.width   = 0		// 마감
dw7.object.close_type.width   = 0		// 마감유형
dw7.object.close_date.width   = 0		// 마감일자

// 상세
dw8.object.saledet_text.width = 0		// 계획여부
dw8.object.action.width       = 0		// 조치
dw8.object.sol_qty.width      = 0		// 가용량
dw8.object.issue_qty.width    = 0		// 선정수량
dw8.object.rlse_date.width    = 0		// 최종출고일
dw8.object.rlse_qty.width     = 0		// 출고수량
dw8.object.plan_qty.width     = 0		// 생산계획수량
dw8.object.plan_close.width   = 0		// 생산완료시점
dw8.object.price_be.width     = 0		// 기존단가
dw8.object.do_rem.width       = 0		// 송장비고
dw8.object.stock_qty.width    = 0		// 장기재고출고
dw8.object.stock_issue.width  = 0		// 장기출고의뢰
dw8.object.stock_do.width     = 0		// 장기재고송장
dw8.object.price_last.width   = 0		// 최근단가
dw8.object.danjung.width      = 0		// 단중
dw8.object.jungrang.width     = 0		// 중량

// 브라우즈 
tab_1.tabpage_2.ole_browser.event onstatusbar( true )
tab_1.tabpage_3.mle_response.text = ""

// 저장
pb_save.enabled = false

// 주문기간
em_1.text = string(RelativeDate(today(), - 10), "yyyy/mm/dd")
em_2.text = string(RelativeDate(today(), + 10), "yyyy/mm/dd")

// 담당자
dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.object.user[1] = gs_userid

// 사업장
dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.object.area[1] = gs_area

// 저장
pb_save.enabled = false

end event

event resize;call super::resize;//
ln_H.EndX  = newwidth

tab_1.X       = ln_H.BeginX
tab_1.Y       = ln_H.BeginY + 10

tab_1.Width   = ln_H.EndX
tab_1.Height  = newHeight - ln_H.BeginY - 10

tab_1.tabpage_1.dw_5.width  = tab_1.width  - 42
tab_1.tabpage_1.dw_5.height = tab_1.height - 120 - tab_1.tabpage_1.dw_5.Y

idw_w = tab_1.tabpage_1.dw_5.width
idw_h = tab_1.tabpage_1.dw_5.height

tab_1.tabpage_2.ole_browser.width  = tab_1.width  - 42
tab_1.tabpage_2.ole_browser.height = tab_1.height - 120 - tab_1.tabpage_2.ole_browser.Y
tab_1.tabpage_2.ole_browser.of_resize( tab_1.width - 42, tab_1.height - 120 - tab_1.tabpage_2.ole_browser.Y)

tab_1.tabpage_2.cb_xml.X     = tab_1.width - 243
tab_1.tabpage_2.cb_home.X    = tab_1.width - 357
tab_1.tabpage_2.cb_Refresh.X = tab_1.width - 682
tab_1.tabpage_2.cb_stop.X    = tab_1.width - 910

tab_1.tabpage_2.ddlb_url.width    = tab_1.width - 910 - tab_1.tabpage_2.ddlb_url.X

tab_1.tabpage_3.mle_response.width  = tab_1.width  - 42
tab_1.tabpage_3.mle_response.height = tab_1.height - 120 - tab_1.tabpage_3.mle_response.Y


tab_1.tabpage_4.dw_7.width  = idw_w
tab_1.tabpage_4.dw_7.height = idw_h / 2

tab_1.tabpage_4.dw_8.y      = tab_1.tabpage_4.dw_7.y + tab_1.tabpage_4.dw_7.height
tab_1.tabpage_4.dw_8.width  = idw_w
tab_1.tabpage_4.dw_8.height = idw_h / 2


end event

type pb_save from w_inheritance`pb_save within w_orsale_shoping
integer x = 4215
integer y = 64
integer taborder = 90
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

string   ls_saleno, ls_orderno, ls_chk
long     ll_row, ll_dw7row, ll_dw8row
datetime ldt_today
decimal  ld_tot_saletax, ld_tot_saleamount, ld_totcalc_vat, ld_tot_calcamt
boolean  lb_vat, lb_amount

if ib_retrieve = true then
	MessageBox("확인","조회상태에서 데이터를 저장할 수 없습니다.")
	RETURN
end if

ll_row     = dw7.object.tot_chkyn[1]
if isnull(ll_row) OR ll_row < 1 then 
	MessageBox("확인","저장할 대상을 선택하시기 바랍니다.")
	RETURN
end if


/////////////////////////////////////////////////////////////////////
// 접수중복체크(헤더의 수주번호가 존재시 헤더와 상세 삭제함)
// 미선택 항목도 삭제함
/////////////////////////////////////////////////////////////////////
for ll_dw7row = dw7.rowcount() to 1 step - 1
	// 중복체크
	ls_saleno  = dw7.object.sale_no[ll_dw7row]
	ls_orderno = dw7.object.order_no[ll_dw7row]
	if isnull(ls_saleno) OR ls_saleno = "" then
	else
		for ll_dw8row = dw8.rowcount() to 1 step - 1
			if ls_orderno = dw8.object.order_no[ll_dw8row] then
				dw8.deleterow( ll_dw8row )	// 상세삭제
			end if
		next
		dw7.deleterow( ll_dw7row )			// 헤더삭제
	end if	

	// 미선택
	ls_chk     = dw7.object.chk_yn[ll_dw7row]
	if ls_chk = "Y" then
		// 저장
	else
		for ll_dw8row = dw8.rowcount() to 1 step - 1
			if ls_orderno = dw8.object.order_no[ll_dw8row] then
				dw8.deleterow( ll_dw8row )	// 상세삭제
			end if
		next
		dw7.deleterow( ll_dw7row )			// 헤더삭제
	end if	
next
/////////////////////////////////////////////////////////////////////

if dw7.rowcount() > 0 then
	if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

	// 저장하기
	ldt_today = gf_today()
	
	for ll_row = 1 to dw7.rowcount()
		dw7.object.ship_flag[ll_row]     = "D"		// C:착불,D:대여,B:부담
		dw7.object.open_close[ll_row]    = "O"
		dw7.object.revision_no[ll_row]   = 0
		dw7.object.revision_date[ll_row] = ldt_today
		
		dw7.object.input_date[ll_row]    = ldt_today
	next
	
	//
	ld_tot_saletax    = dw7.object.tot_sale_tax[1]
	ld_tot_saleamount = dw7.object.tot_sale_amount[1]
	
	ld_totcalc_vat    = dw8.object.tot_calc_vat[1]
	ld_tot_calcamt    = dw8.object.tot_calc_amt[1]
	
	if ld_tot_saletax <> ld_totcalc_vat then
		MessageBox("확인","쇼핑몰 세액 합계와 ERP변환 세액 합계가 다릅니다.")
		lb_vat	   = false
	else
		lb_vat	   = true
	end if
	
	if ld_tot_saleamount <> ld_tot_calcamt then
		MessageBox("확인","쇼핑몰 공급가액 합계와 ERP변환 공급가액 합계가 다릅니다.")
		lb_amount	= false 
	else
		lb_amount   = true
	end if
	
	if lb_vat = true AND lb_amount = true then
		pb_save.enabled = false
		wf_update2( dw7, dw8, "Y" )
	else
		if MessageBox("확인","쇼핑몰 데이터를 ERP로 변환하지 못했습니다.",exclamation!, OKCancel!, 2) = 1 then
			pb_save.enabled = false
			RETURN	// wf_update2( dw7, dw8, "Y" )
		end if
	end if	
else
	MessageBox("확인","저장할 대상이 존재하지 않습니다.")
end if

tab_1.tabpage_4.cbx_chk.checked   = false		// 전체선택
tab_1.tabpage_4.cb_xls2dw.enabled = true		// 변환데이터 가져오기

ib_retrieve = true	// 조회값

pb_retrieve.triggerevent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_orsale_shoping
integer x = 82
integer y = 12
integer width = 114
integer height = 96
integer taborder = 0
string dataobject = "d_orsale_shop_m"
boolean hsplitscroll = true
end type

event dw_1::doubleclicked;call super::doubleclicked;string ls_saleno

if row < 1 then return

this.scrolltorow( row )
choose case dwo.name
	case 'sale_cust_no', 'customer_cust_name'
		gs_where lstr_where
		lstr_where.str1 = this.object.saletemp_cust_no[row]
		lstr_where.name = this.object.customer_cust_name[row]
		openwithparm(w_whopeom_w, lstr_where)

	case 'jupsu_flag'
		if this.object.jupsu_flag[row] = 'Y' then
			ls_saleno = this.object.sale_no[row]
			
			if IsValid(w_all_main) = true then
				opensheet(w_orsale_m, w_all_main, 5, original!)
			else
				opensheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

event dw_1::clicked;call super::clicked;//
this.scrolltorow( row )

////
//GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
end event

type st_title from w_inheritance`st_title within w_orsale_shoping
integer y = 40
integer width = 1234
string text = "쇼핑몰 주문관리"
end type

type st_tips from w_inheritance`st_tips within w_orsale_shoping
end type

type pb_compute from w_inheritance`pb_compute within w_orsale_shoping
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsale_shoping
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsale_shoping
integer x = 4416
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsale_shoping
integer x = 3826
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print


if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=56'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsale_shoping
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_orsale_shoping
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsale_shoping
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsale_shoping
integer x = 3634
integer y = 64
integer taborder = 40
end type

event pb_retrieve::clicked;//
string ls_saleman, ls_area, ls_orderno, ls_sdate, ls_edate
date   ld_start, ld_end

// 일자
if em_1.text = "" then
	MessageBox("확인","주문일자를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","주문일자를 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","주문일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 사업장
dw_4.AcceptText()
ls_area    = dw_4.object.area[1]

// 담당자
dw_3.AcceptText()
ls_saleman = dw_3.object.user[1]

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

dw_1.reset() ; dw_2.reset()

choose case tab_1.selectedtab
	case 1
		MessageBox("확인","쇼핑몰 엑셀데이터를 복사한 후 '엑셀 붙여넣기'를 클릭하시기 바랍니다.")
		
	case 4		// 주문장
		// 변환작업 진행시에는 조회안됨
		if ib_retrieve = false then
			if MessageBox("확인","변환작업을 취소하고 조회작업을 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
				pb_retrieve.setfocus()
				RETURN
			else
				ib_retrieve = true	// 조회값
			end if
		end if

		if ib_retrieve = true OR isnull(ib_retrieve) then
			ib_retrieve = true	// 조회값

			dw7.reset() ; dw8.reset()	
			dw7.retrieve( ls_sdate, ls_edate )		
			if dw7.rowcount() > 0 then
				MessageBox("확인","조회완료")
			else
				MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
			end if
			dw7.setfocus()
		end if
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_orsale_shoping
integer x = 1819
integer y = 8
integer width = 114
integer height = 96
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsale_shoping
integer x = 1979
integer y = 8
integer width = 1609
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsale_shoping
integer x = 3602
integer y = 8
integer width = 1033
integer height = 224
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsale_shoping
string tag = "d_orsalesalemanrep_r1_2"
integer x = 210
integer y = 12
integer width = 110
integer height = 96
integer taborder = 0
boolean enabled = false
string title = "d_orsale_shopdet_m"
string dataobject = "d_orsale_shopdet_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_orsale_shoping
integer x = 2537
integer y = 48
integer width = 279
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "주문기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsale_shoping
integer x = 2830
integer y = 48
integer width = 357
integer height = 80
integer taborder = 10
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

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_orsale_shoping
integer x = 3195
integer y = 48
integer width = 357
integer height = 80
integer taborder = 20
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

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_orsale_shoping
integer x = 2537
integer y = 136
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsale_shoping
integer x = 2825
integer y = 140
integer width = 681
integer height = 76
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.AcceptText()
end event

type dw_4 from datawindow within w_orsale_shoping
integer x = 2007
integer y = 136
integer width = 526
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()

end event

type st_4 from statictext within w_orsale_shoping
integer x = 2007
integer y = 48
integer width = 526
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tab_1 from tab within w_orsale_shoping
event create ( )
event destroy ( )
integer x = 5
integer y = 256
integer width = 4645
integer height = 1980
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

event selectionchanged;//
string ls_url, ls_args

choose case newindex
	case 1
		
	case 2
		ls_url = trim(tab_1.tabpage_2.ddlb_url.text)
		if ls_url = "" then
			tab_1.tabpage_2.ole_browser.of_goHome()
		end if
	
	case 3
end choose

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4608
integer height = 1864
long backcolor = 67108864
string text = "그리드"
long tabtextcolor = 16711680
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
ddlb_op ddlb_op
cbx_fix cbx_fix
cb_5 cb_5
cbx_all cbx_all
rb_5 rb_5
rb_4 rb_4
cbx_dual cbx_dual
cb_11 cb_11
cb_10 cb_10
st_6 st_6
cb_2 cb_2
cb_1 cb_1
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
st_9 st_9
st_8 st_8
dw_5 dw_5
ddlb_fld ddlb_fld
dw_6 dw_6
ddlb_dwtitles ddlb_dwtitles
end type

on tabpage_1.create
this.ddlb_op=create ddlb_op
this.cbx_fix=create cbx_fix
this.cb_5=create cb_5
this.cbx_all=create cbx_all
this.rb_5=create rb_5
this.rb_4=create rb_4
this.cbx_dual=create cbx_dual
this.cb_11=create cb_11
this.cb_10=create cb_10
this.st_6=create st_6
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.sle_value=create sle_value
this.st_9=create st_9
this.st_8=create st_8
this.dw_5=create dw_5
this.ddlb_fld=create ddlb_fld
this.dw_6=create dw_6
this.ddlb_dwtitles=create ddlb_dwtitles
this.Control[]={this.ddlb_op,&
this.cbx_fix,&
this.cb_5,&
this.cbx_all,&
this.rb_5,&
this.rb_4,&
this.cbx_dual,&
this.cb_11,&
this.cb_10,&
this.st_6,&
this.cb_2,&
this.cb_1,&
this.cb_filteroff,&
this.cb_filteron,&
this.sle_value,&
this.st_9,&
this.st_8,&
this.dw_5,&
this.ddlb_fld,&
this.dw_6,&
this.ddlb_dwtitles}
end on

on tabpage_1.destroy
destroy(this.ddlb_op)
destroy(this.cbx_fix)
destroy(this.cb_5)
destroy(this.cbx_all)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.cbx_dual)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.st_6)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.sle_value)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.dw_5)
destroy(this.ddlb_fld)
destroy(this.dw_6)
destroy(this.ddlb_dwtitles)
end on

type ddlb_op from dropdownlistbox within tabpage_1
integer x = 910
integer y = 12
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

type cbx_fix from checkbox within tabpage_1
integer x = 27
integer y = 108
integer width = 311
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx5, ls_colx6

if this.checked = true then
	ls_colx5 = string(integer(tab_1.tabpage_1.dw_5.object.order_no.x) + integer(tab_1.tabpage_1.dw_5.object.order_no.width))
	ls_colx6 = string(integer(tab_1.tabpage_1.dw_6.object.order_no.x) + integer(tab_1.tabpage_1.dw_6.object.order_no.width))
else
	ls_colx5 = "0"
	ls_colx6 = "0"
end if
tab_1.tabpage_1.dw_5.object.datawindow.horizontalscrollsplit = ls_colx5
tab_1.tabpage_1.dw_6.object.datawindow.horizontalscrollsplit = ls_colx6


end event

type cb_5 from commandbutton within tabpage_1
integer x = 4119
integer y = 12
integer width = 489
integer height = 84
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "초기화"
end type

event clicked;//
string ls_msg
DataWindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw5
		ls_msg = "엑셀데이터를 초기화 하시겠습니까?"
		
	case "dw_6"
		arg_dw  = dw6
		ls_msg = "변환데이터를 초기화 하시겠습니까?"

	case else
		arg_dw  = dw6
		ls_msg = "초기화 하시겠습니까?"
end choose

if MessageBox("확인",ls_msg, Exclamation!, OKCancel!, 2) = 1 then
	if is_dw = "dw_5" OR is_dw = "dw_6" then
		arg_dw.reset()
	else
		dw5.reset()
		dw6.reset()
	end if
end if


end event

type cbx_all from checkbox within tabpage_1
integer x = 3131
integer y = 28
integer width = 448
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결제포함"
end type

type rb_5 from radiobutton within tabpage_1
integer x = 4165
integer y = 108
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "세로창"
end type

event clicked;// 세로창 idw_w, idw_h
if this.checked = true then	
	dw5.width   = idw_w  / 2
	dw5.height  = idw_h

	dw6.visible = true
	dw6.x       = dw5.x + dw5.width
	dw6.y       = dw5.y
	dw6.width   = dw5.width
	dw6.height  = dw5.height
end if

end event

type rb_4 from radiobutton within tabpage_1
integer x = 3867
integer y = 108
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "가로창"
end type

event clicked;// 가로창	idw_w, idw_h
dw5.setredraw( false )
dw6.setredraw( false )

if this.checked = true then	
	dw5.width   = idw_w
	dw5.height  = idw_h / 2

	dw6.visible = true
	dw6.x       = dw5.x
	dw6.y       = dw5.y + dw5.height
	dw6.width   = dw5.width
	dw6.height  = dw5.height
end if

dw5.setredraw( true )
dw6.setredraw( true )

end event

type cbx_dual from checkbox within tabpage_1
integer x = 3538
integer y = 108
integer width = 311
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "듀얼창"
end type

event clicked;// 듀얼창
if this.checked = true then	
	rb_4.enabled = true
	rb_5.enabled = true

	rb_4.checked = true
	rb_4.triggerevent( clicked! )
else
	rb_4.checked = false
	rb_4.enabled = false
	
	rb_5.checked = false	
	rb_5.enabled = false

	dw5.setredraw( false )
	dw5.width   = idw_w
	dw5.height  = idw_h
	dw5.setredraw( true )

	dw6.visible = false	
end if

end event

type cb_11 from commandbutton within tabpage_1
integer x = 3621
integer y = 12
integer width = 489
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "변환하기"
end type

event clicked;// 변환하기
string   ls_qavalue[], ls_qatemp[], ls_qatemp_value[], ls_EmptyArray[], ls_value, ls_apply
string   ls_null, ls_area, ls_userid, ls_orderno, ls_custno, ls_telno, ls_shiptoaddr, ls_vat, ls_fob, ls_locno
string   ls_shipcase, ls_shipamtcase, ls_rem,  ls_rem1,  ls_rem2
string   ls_item, ls_itemnm, ls_erpname, ls_qa, ls_uom, ls_color, ls_colordet, ls_colorsw, ls_remdet

string   ls_pur_no
integer  iRet, li_int, li_Change
long     ll_tchk, ll_found, ll_row, ll_col, ll_status, ll_seq, ll_max, ll_allrow, ll_dw5cnt
long     numcols, numrows, iCol, iRow, iCnt

dec      ld_price, ld_vatamt, ld_totalamt, ld_fobamt[4], ld_orderqty, ld_comqty
dec      ld_orderamount, ld_orderamtvat, ld_orderamountvat

string   ls_saleno, ls_orderno_chk, ls_jupsuflag
datetime ldt_null, ldt_orderdate, ldt_custpodate, ldt_plandate, ldt_jupsudate
boolean  SWExit = True

// 듀얼창
tab_1.tabpage_1.cbx_dual.checked = true
tab_1.tabpage_1.cbx_dual.triggerevent( clicked! )

// 저장소
SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :gs_area;

// 사업장
ls_area    = trim(dw_4.object.area[1])       
if isnull(ls_area) OR ls_area = "" then
	MessageBox("확인","사업장을 선택 하세요.")
	RETURN
end if 

// 담당자
ls_userid  = trim(dw_3.object.user[1])       
if isnull(ls_userid) OR ls_userid = "" then
	MessageBox("확인","담당자를 선택 하세요.")
	RETURN
end if 

setnull( ls_null ) ; setnull( ldt_null )
this.enabled = false

// 엑셀 총레코드수
ll_dw5cnt = dw5.rowcount()
hpb_1.visible = true

// IMPORT 하기
dw6.setredraw( false )
for iRow = 1 to dw5.rowcount()
	hpb_1.position = (iRow / ll_dw5cnt) * 100

	ls_apply = dw5.GetItemString(iRow, "apply_status")		// 결제상태(결제완료, 미결제)
	if cbx_all.checked = true then ls_apply = "결제완료"	// 임시용
	
	if ls_apply = "미결제" then
		//
	else	
		iCnt  = iCnt + 1
			
		///////////////////////////////////////////////////////////////////////////////////////////////////////////	
		// 쇼핑몰 데이터 //////////////////////////////////////////////////////////////////////////////////////////	
		///////////////////////////////////////////////////////////////////////////////////////////////////////////	
		ls_orderno    = dw5.GetItemString(iRow,   "order_no")			// 주문번호
		ldt_orderdate = dw5.GetItemDateTime(iRow, "order_date")		// 주문일자
		ls_orderno    = "SHOP" + string(ldt_orderdate,"yymmdd") + "-" + RightA("000" + ls_orderno,3)
		
		ls_rem        = dw5.GetItemString(iRow,   "order_title")		// 주문제목
		ls_rem1       = dw5.GetItemString(iRow,   "order_remark")	// 주문 전달사항
		ls_rem2       = dw5.GetItemString(iRow,   "shiping_remark")	// 배송 전달사항
		
		ldt_plandate  = dw5.GetItemDateTime(iRow, "due_date")			// 납기일자
		ldt_custpodate= dw5.GetItemDateTime(iRow, "due_date")			// 확정납기
		
		ll_seq        = dw5.GetItemNumber(iRow,   "order_seq")		// 주문내역번호
		ls_item       = dw5.GetItemString(iRow,   "order_item")		// 주문상품코드
		ls_erpname    = dw5.GetItemString(iRow,   "erp_name")			// 품명(ERP)
		ls_itemnm     = dw5.GetItemString(iRow,   "order_itemname")	// 주문상품명
		
		// 규격|길이|선택길이|주문길이|색상|펀칭개수|펀칭횟수
		ls_value      = dw5.GetItemString(iRow,   "order_rule")		// 주문조건명칭
		ls_value      = GF_REPLACEALL(ls_value,"선택길이","길이")
		ls_value      = GF_REPLACEALL(ls_value,"주문길이","길이")
		ls_value      = GF_REPLACEALL(ls_value,",","")
		GF_SPLIT( ls_value, "|", ls_qatemp )								// COLUMN명칭

		ls_value      = dw5.GetItemString(iRow,   "order_rulevalue")// 주문조건내용
		ls_value      = GF_REPLACEALL(ls_value,"x","X")					// "x" -> "X" 변환		
		ls_qatemp_value = ls_EmptyArray										// 초기화
		ls_qavalue      = ls_EmptyArray										// 초기화
		GF_SPLIT( ls_value, "|", ls_qatemp_value )						// COLUMN값

		// 규격|색상|길이  --> 규격|길이|색상 변경하기
		ls_colorsw = ""
		for ll_col = 1 to UpperBound(ls_qatemp)
			choose case ls_qatemp[ll_col]
				case "규격"
					ls_qavalue[1] = ls_qatemp_value[ll_col]
					
				case "길이"
					ls_qavalue[2] = ls_qatemp_value[ll_col]
					
				case "색상"
					ls_qavalue[3] = ls_qatemp_value[ll_col]
					ls_colordet   = ls_qavalue[3]
					ls_colorsw    = "Y"
					
				case else
					// 펀칭개수, 펀칭횟수
					ls_qavalue[UpperBound(ls_qavalue[]) + 1] = ls_qatemp_value[ll_col]
			end choose
		next

		setnull(ls_colordet)
		
		if PosA(ls_qavalue[1], "X") > 0 then
			if UpperBound(ls_qavalue[]) > 1 then
				ls_qa      = ls_qavalue[1] + "X" + string(long(ls_qavalue[2]),"00000")
			else
				ls_qa      = ls_qavalue[1] + "X00000"
			end if
		else
			ls_qa      = ls_qavalue[1]
		end if
		
		// 품목색상
		if ls_colorsw = "Y" then
			ls_colordet = ls_qavalue[3]
		end if
		
		ls_uom        = dw5.GetItemString(iRow, "order_ruleunit")	// 주문조건단위
		ls_uom        = GF_REPLACEALL(ls_uom,"|","")
		if ls_uom = "mm" then 
			ls_uom = "M"
		else
			ls_uom = "EA"
		end if

		ld_price      = dw5.GetItemDecimal(iRow, "order_samount")	// 판매가
		ld_orderqty   = dw5.GetItemDecimal(iRow, "order_qty")			// 주문수량
		SELECT top 1 dbo.uf_getqty( :ls_item, :ls_qa, :ls_uom, :ld_orderqty ) INTO :ld_comqty FROM login;
		if isnull(ld_comqty) then ld_comqty = 0							// 환산수량
		
		ls_telno      = dw5.GetItemString(iRow, "ship_hp")   			// 배송받는분 핸드폰
		ls_shiptoaddr = dw5.GetItemString(iRow, "ship_addr")   		// 배송받는분 주소
		
		ld_fobamt[1]  = dw5.GetItemDecimal(iRow, "pg_apply")			// 카드(PG)결제
		ld_fobamt[2]  = dw5.GetItemDecimal(iRow, "no_bankbook")		// 무통장입금
		ld_fobamt[3]  = dw5.GetItemDecimal(iRow, "point_apply")		// 포인트결제
		ld_fobamt[4]  = dw5.GetItemDecimal(iRow, "cash_apply")		// 캐시결제
		ls_fob        = "현금"   

		ls_shipcase   = dw5.GetItemString(iRow, "shiping_parttype") // 개별 배송구분
		ls_shipamtcase= "C"													
		///////////////////////////////////////////////////////////////////////////////////////////////////////////	

		// 주문헤더
		dw6.object.chk[iCnt]            = "N"							// 품목+규격 CHK
		dw6.object.order_no[iCnt]       = ls_orderno					// 주문번호
		dw6.object.cust_no[iCnt]        = ""							// 거래처
		dw6.object.scene_code[iCnt]     = ""							// 현장

		dw6.object.order_date[iCnt]     = ldt_orderdate				// 주문일자
		dw6.object.due_date[iCnt]       = ldt_orderdate				// 납기일자
		dw6.object.estimate_no[iCnt]    = ls_null						// 견적번호
		dw6.object.sale_flag[iCnt]      = "D"							// 수주유형(내수:D, 수출:E, LC:L)
		dw6.object.curr_code[iCnt]      = "WON"						// 통화코드
		dw6.object.cust_po_no[iCnt]     = ls_orderno					// 고객주문번호
		dw6.object.cust_po_date[iCnt]   = ldt_custpodate			// 고객주문일자
//		dw6.object.ship_flag[iCnt]      = 								// 운송방법(d_shipflag_c: 부담:B,착불:C,대여:D)
		dw6.object.fob[iCnt]            = ls_fob						// 결재방법
		dw6.object.salesman[iCnt]       = gs_userid					// 영업사원
		dw6.object.confirm_flag[iCnt]   = "N"						   // 확정유무(등록:N, 수주:T, 생산:Y)
		dw6.object.confirm_user[iCnt]   = ls_null						// 확정자
		dw6.object.confirm_date[iCnt]   = ldt_null					// 확정일자

		dw6.object.open_close[iCnt]     = "O"							// 마감구분(마감:C, 오픈:O)
//		dw6.object.close_type[iCnt]     = 								// 마감유형(자동:A, 수동:M)
//		dw6.object.close_date[iCnt]     = 								// 마감일자
		dw6.object.shipto_addr[iCnt]    = ls_shiptoaddr				// 운송처주소
		dw6.object.rem[iCnt]            = ls_rem						// 특기사항
		dw6.object.rem1[iCnt]           = ls_rem1						// 특기사항1
		dw6.object.rem2[iCnt]           = ls_rem2						// 특기사항2
//		dw6.object.revision_no[iCnt]    = 								// 변경횟수
//		dw6.object.revision_date[iCnt]  = 								// 최종변경일자
//		dw6.object.input_date[iCnt]     = 								// 주문입력일자
		dw6.object.login_id[iCnt]       = gs_userid					// 입력자
		dw6.object.tel_no[iCnt]         = ls_telno					// 연락처
		dw6.object.ship_case[iCnt]      = ls_shipcase				// 운송수단
		dw6.object.plan_date[iCnt]      = ldt_plandate				// 조정납기
		dw6.object.shipamt_case[iCnt]   = ls_shipamtcase			// 운반비형태(현금:C, 외상:R)
		dw6.object.area_no[iCnt]        = gs_area						// 지역
//		dw6.object.ysp_confirm[iCnt]    = 								// YSP수주접수유무
		dw6.object.ysp_qty[iCnt]        = 0								// 단면
		dw6.object.color[iCnt]          = ls_color					// 색상
//		dw6.object.type[iCnt]           = 								// 유형
//		dw6.object.class[iCnt]          = 								// THIN
		dw6.object.ysp_qty2[iCnt]       = 0								// 양면
//		dw6.object.jupsu_flag[iCnt]     = 								// 접수유무
//		dw6.object.jupsu_date[iCnt]     = 								// 접수일자
//		dw6.object.sale_no[iCnt]        = 								// ERP주문번호

		// 주문상세
		dw6.object.order_no1[iCnt]      = ls_orderno					// 주문번호
		dw6.object.seq_no[iCnt]         = ll_seq						// 주문순번
		dw6.object.item_no[iCnt]        = ls_item						// 물품번호
		dw6.object.erp_name[iCnt]       = ls_erpname					// 품명(ERP)
		dw6.object.item_nm[iCnt]        = ls_itemnm					// 품명(쇼핑몰)
		dw6.object.qa[iCnt]             = ls_qa						// 규격
//	   dw6.object.qa_cust[iCnt]        = ls_null					   // 송장규격(사용안함)
		dw6.object.uom[iCnt]            = ls_uom						// 단위
		dw6.object.order_qty[iCnt]      = ld_orderqty				// 주문수량
		dw6.object.price[iCnt]          = ld_price					// 가격
		dw6.object.acc_qty[iCnt]        = ld_comqty					// 환산수량

      ld_totalamt   = dw5.GetItemDecimal(iRow, "order_amount")	// 공급가액
		ld_vatamt     = dw5.GetItemDecimal(iRow, "order_amtvat")	// 부가세액
		if ld_vatamt > 0 then ls_vat = "Y"
		
		dw6.object.tax_sign[iCnt]       = ls_vat						// 부가세
		dw6.object.sale_tax[iCnt]       = ld_vatamt				   // 세액
		dw6.object.sale_amount[iCnt]    = ld_totalamt				// 공급가액
		
		if ls_uom = "M" then
			dw6.object.price_m[iCnt]     = ld_totalamt /	ld_comqty// 가격(M)
		else
			dw6.object.price_m[iCnt]     = 0.00
		end if
		
	
//		dw6.object.saledet_text[iCnt]   = 								// 생산계획여부
//		dw6.object.action[iCnt]         = 								// 조치
//		dw6.object.sol_qty[iCnt]        = 								// 가용량
		dw6.object.loc_no[iCnt]         = ls_locno					// 저장소번호
//		dw6.object.issue_qty[iCnt]      = 								// 선정수량
//		dw6.object.rlse_date[iCnt]      = 								// 최종출고일자
//		dw6.object.rlse_qty[iCnt]       = 								// 출고수량
		dw6.object.remdet[iCnt]         = ls_remdet					// 품목비고
//		dw6.object.plan_qty[iCnt]       = 								// 생산계획수량
//		dw6.object.plan_close[iCnt]     = 								// 생산완료시점
		dw6.object.colordet[iCnt]       = ls_colordet				// 품목색상
//		dw6.object.price_be[iCnt]       = 								// 기존단가
//		dw6.object.do_rem[iCnt]         = 								// 거래명세서비고
//		dw6.object.stock_qty[iCnt]      = 								// 장기재고출고
//		dw6.object.stock_issue[iCnt]    = 								// 장기재고출고의뢰
//		dw6.object.stock_do[iCnt]       = 								// 장기재고출고
//		dw6.object.price_last[iCnt]     = 								// 최근단가
//		dw6.object.danjung[iCnt]        = 								// 단중
//		dw6.object.jungrang[iCnt]       = 								// 중량
//		dw6.object.chulgo_qty[iCnt]     = 								// 출고의뢰수량(사용안함)
	end if	
next

hpb_1.position = 100
hpb_1.visible  = false

dw6.setredraw( true )
this.enabled = true

///////////////////////////////////////////////////////////////////////////////////
// 쇼핑몰주문 중복체크
///////////////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw6.rowcount()
	ls_orderno = dw6.object.order_no[ll_row]

	setnull(ls_saleno) ; setnull(ls_orderno_chk) ; setnull(ls_jupsuflag) ; setnull(ldt_jupsudate)

	if isnull(ls_orderno) OR ls_orderno = "" then
	else
		SELECT sale_no, order_no, jupsu_flag, input_date 
		  INTO :ls_saleno, :ls_orderno_chk, :ls_jupsuflag, :ldt_jupsudate
		  FROM saleshop
		 WHERE order_no = :ls_orderno;
		if isnull(ls_saleno) OR ls_saleno = "" then		// 쇼핑몰 미접수상태
			if isnull(ls_orderno_chk) OR ls_orderno_chk = "" then
				// 쇼핑몰 주문관리 저장되지 않은 데이터
			else
				// 쇼핑몰 주문관리 중복되는 데이터(saleshop)
				dw6.object.jupsu_flag[ll_row] = "Y"			
				dw6.object.jupsu_date[ll_row] = ldt_jupsudate
			end if
		else
			dw6.object.jupsu_flag[ll_row] = "Y"
			dw6.object.jupsu_date[ll_row] = ldt_jupsudate
		end if
	end if
next
///////////////////////////////////////////////////////////////////////////////////			

if MessageBox("확인", "계속해서 거래처,품목,규격,단위를 CHECK 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then 
	wf_itemqa_check()	
end if

if dw6.rowcount() > 0 then
	ll_tchk = dw6.object.tchk[1]
	
	if dw6.rowcount() <> ll_tchk then	
		ll_found = dw6.find( "chk = 'N'", 1, dw6.rowcount() )
		dw6.scrolltorow( ll_found )
		MessageBox("확인",string(dw6.rowcount() - ll_tchk,"#,##0") + " 건의 오류데이터가(거래처,품목,규격,단위) 발생했습니다.")
	else
		MessageBox("확인", string(iCnt,"#,##0") + " 행 변환작업을 완료 하였습니다.")
	end if

	tab_1.tabpage_4.cb_xls2dw.enabled = true		// 변환데이터 가져오기
end if

end event

type cb_10 from commandbutton within tabpage_1
integer x = 2597
integer y = 12
integer width = 521
integer height = 84
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "엑셀 붙여넣기"
end type

event clicked;//
string	ls_itemno, ls_itemnm, ls_pathname
long		ll_row, ll_rc
integer  iRet

ll_rc = dw5.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then
	// Long. Returns the number of rows that were imported if it succeeds and returns the following values if an error occurs:
	//  0  End of file, too many rows
	// -2  Not enough columns
	// -3  Invalid argument
	// -4  Invalid input
	
	ClipBoard("")
	
	for ll_row = 1 to dw5.rowcount()
		ls_itemno = dw5.object.order_item[ll_row]
		
		SELECT rtrim(item_name) INTO :ls_itemnm FROM groupitem WHERE item_no = :ls_itemno;
		dw5.object.erp_name[ll_row] = ls_itemnm;
	next
	
	cb_11.enabled = true	
	MessageBox("확인","쇼핑몰 데이터 가져오기 완료" )
end if

end event

type st_6 from statictext within tabpage_1
integer x = 1179
integer y = 108
integer width = 2286
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "~"접수~" 더블 클릭시 수주화면으로 이동, 수주삭제시 미접수 상태로 롤백."
boolean focusrectangle = false
end type

type cb_2 from commandbutton within tabpage_1
integer x = 2368
integer y = 12
integer width = 183
integer height = 84
integer taborder = 160
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
DataWindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_1 from commandbutton within tabpage_1
integer x = 2181
integer y = 12
integer width = 183
integer height = 84
integer taborder = 150
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
DataWindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_filteroff from commandbutton within tabpage_1
integer x = 1979
integer y = 12
integer width = 197
integer height = 84
integer taborder = 140
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
DataWindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
end choose

ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_filteron from commandbutton within tabpage_1
integer x = 1778
integer y = 12
integer width = 197
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type sle_value from singlelineedit within tabpage_1
integer x = 1184
integer y = 12
integer width = 581
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type st_9 from statictext within tabpage_1
integer x = 736
integer y = 32
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

type st_8 from statictext within tabpage_1
integer x = 37
integer y = 32
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

type dw_5 from datawindow within tabpage_1
string tag = "d_orsale_shoping"
integer y = 176
integer width = 4608
integer height = 1688
integer taborder = 60
string title = "d_orsale_shopimport"
string dataobject = "d_orsale_shopimport"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN
this.scrolltorow( row )

is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_orderno
long   ll_found, ll_seq

if cbx_dual.checked = true then
	ls_orderno = dw5.object.order_no[row] 
	ll_seq     = dw5.object.order_seq[row] 
	ll_found   = dw6.find( "order_no = '" + ls_orderno + "' AND seq_no = " + string(ll_seq), 1, dw6.rowcount() )
	if ll_found > 0 then
		dw6.scrolltorow( ll_found )
	end if
end if

end event

event doubleclicked;string ls_saleno

if row < 1 then return

this.scrolltorow( row )
choose case dwo.name
	case 'sale_cust_no', 'customer_cust_name'
		gs_where lstr_where
		lstr_where.str1 = this.object.saletemp_cust_no[row]
		lstr_where.name = this.object.customer_cust_name[row]
		openwithparm(w_whopeom_w, lstr_where)

	case 'jupsu_flag'
		if this.object.jupsu_flag[row] = 'Y' then
			ls_saleno = this.object.sale_no[row]
			
			if IsValid(w_all_main) = true then
				opensheet(w_orsale_m, w_all_main, 5, original!)
			else
				opensheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

event getfocus;//
if tab_1.tabpage_1.cbx_dual.checked = true then
	this.Object.DataWindow.Color = rgb(215, 228, 188)
end if

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type ddlb_fld from dropdownlistbox within tabpage_1
integer x = 229
integer y = 12
integer width = 498
integer height = 580
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

type dw_6 from datawindow within tabpage_1
integer x = 585
integer y = 440
integer width = 3589
integer height = 1152
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_shoping"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
if tab_1.tabpage_1.cbx_dual.checked = true then
	this.Object.DataWindow.Color = rgb(215, 228, 188)
end if

end event

event clicked;//
if isnull( row ) OR row < 1 then RETURN

this.scrolltorow( row )

is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_orderno
long   ll_found, ll_seq

ls_orderno = dw6.object.order_no[row] 
ll_seq     = dw6.object.seq_no[row] 
ll_found   = dw5.find( "order_no = '" + ls_orderno + "' AND order_seq = " + string(ll_seq), 1, dw5.rowcount() )
if ll_found > 0 then
	dw5.scrolltorow( ll_found )
end if

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type ddlb_dwtitles from dropdownlistbox within tabpage_1
integer x = 261
integer y = 28
integer width = 366
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

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4608
integer height = 1864
long backcolor = 79416533
string text = "브라우즈"
long tabtextcolor = 128
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
cb_stop cb_stop
cb_refresh cb_refresh
cb_home cb_home
cb_forward cb_forward
cb_back cb_back
cb_xml cb_xml
cb_import cb_import
ole_browser ole_browser
ddlb_url ddlb_url
end type

on tabpage_2.create
this.cb_stop=create cb_stop
this.cb_refresh=create cb_refresh
this.cb_home=create cb_home
this.cb_forward=create cb_forward
this.cb_back=create cb_back
this.cb_xml=create cb_xml
this.cb_import=create cb_import
this.ole_browser=create ole_browser
this.ddlb_url=create ddlb_url
this.Control[]={this.cb_stop,&
this.cb_refresh,&
this.cb_home,&
this.cb_forward,&
this.cb_back,&
this.cb_xml,&
this.cb_import,&
this.ole_browser,&
this.ddlb_url}
end on

on tabpage_2.destroy
destroy(this.cb_stop)
destroy(this.cb_refresh)
destroy(this.cb_home)
destroy(this.cb_forward)
destroy(this.cb_back)
destroy(this.cb_xml)
destroy(this.cb_import)
destroy(this.ole_browser)
destroy(this.ddlb_url)
end on

type cb_stop from commandbutton within tabpage_2
integer x = 3735
integer width = 224
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "중지"
end type

event clicked;//
ole_browser.of_Stop()
end event

type cb_refresh from commandbutton within tabpage_2
integer x = 3963
integer width = 320
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "새로고침"
end type

event clicked;//
setpointer(hourglass!)

ole_browser.of_Refresh()

setpointer(arrow!)  


end event

type cb_home from commandbutton within tabpage_2
integer x = 4288
integer width = 114
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "홈"
end type

event clicked;//
setpointer(hourglass!)

//ole_browser.onstatusbar( true )
ole_browser.of_goHome()

setpointer(arrow!)  

end event

type cb_forward from commandbutton within tabpage_2
integer x = 544
integer width = 114
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "앞"
end type

event clicked;//
ole_browser.of_goForward()
end event

type cb_back from commandbutton within tabpage_2
integer x = 320
integer width = 224
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "뒤로"
end type

event clicked;//
ole_browser.of_goBack()
end event

type cb_xml from commandbutton within tabpage_2
integer x = 4402
integer width = 206
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "XML파싱"
end type

event clicked;////// XML 데이터 처리하기 
////IXMLDOMDocument     - XML 문서의 최상위 객체입니다. 다른 XML 객체는 여기에서부터 파생된다고 볼 수 있습니다.
////IXMLDOMNode         - XML의 각각의 Node를 가리키는 객체입니다. DOM의 가장 기본 요소입니다.
////IXMLDOMAttribute    - Node의 속성을 나타내는 객체입니다.
////IXMLDOMElement      - XML의 요소(Element)를 나타내는 객체입니다. 실제로 사용할 때는 Node를 더 많이 쓰는 것 같습니다.
////IXMLDOMNodeList     - 주로 자식 노드의 리스트, XPath를 이용해 검색한 노드들의 리스트를 가리는 겁니다.
////IXMLDOMNamedNodeMap - 주로 속성들의 리스트를 나타낼 때 사용합니다. NodeList와의 구분은 순서가 중요하냐의 여부에 달려있죠..
//
//OLEObject xmlHttp,  xmlDoc,  xmlDomNode
//OLEObject xmlNodes, xmlNode, xmlNodeLists, xmlNodeList
//string  XPath
//
//string  ls_url,   ls_result, ls_status, ls_null
//string  ls_node,  ls_text,   strValue
//long    ll_catalog, ll_row, ll_rowcount
//integer li_return,  li_Type
//boolean lb_return
//
//setnull( ls_null )
//setpointer(hourglass!)
//
////http://maps.googleapis.com/maps/api/geocode/json?address=98052&sensor=false
//ls_url  = "http://maps.googleapis.com/maps/api/geocode/xml?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=true_or_false"
//ls_url  = "http://localhost:88/Order.xml/"
//ls_url  = tab_1.tabpage_2.ddlb_url.text
//
//// 주소정보  
//xmlHttp   = CREATE OleObject
//li_return = xmlHttp.ConnectToNewObject("Microsoft.XMLHTTP")
//if li_return <> 0 then
//   MessageBox ("오류", "OLE object.~r~n~r~nError code = '" + String(li_return) + "'", Exclamation!, OK!)
//   Return
//end if
//
//xmlHttp.open("GET", ls_url, false)
//xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
////xmlHttp.Async           = false
////xmlHttp.ValidateonParse = true
//xmlHttp.send( ls_null )
//
//ls_result = xmlHttp.ResponseText
//
//li_return = xmlHttp.Status
//if li_return >= 300 then
//	MessageBox("GET Request Failed", ls_result)
//	RETURN
//end if
//tab_1.tabpage_3.mle_response.text = ls_result
//tab_1.tabpage_3.mle_response.text = gf_replaceall(tab_1.tabpage_3.mle_response.text, "<", "~r~n<")
//tab_1.tabpage_3.mle_response.text = gf_replaceall(tab_1.tabpage_3.mle_response.text, "~r~n</", "</")
//tab_1.tabpage_3.mle_response.text = gf_replaceall(tab_1.tabpage_3.mle_response.text, " </", "</")
//tab_1.tabpage_3.mle_response.text = tab_1.tabpage_3.mle_response.text + "~r~n==========================================================================~r~n"
//
////cbx_view.checked  = true
////cbx_view.triggerevent( clicked! )	// 결과보여주기
//
//
//// XMLDocument 개체 인스턴스 생성
//xmlDoc = CREATE OleObject
//xmlDoc.ConnectToNewObject("Microsoft.XMLDOM")
//xmldoc.async = False
//xmldoc.validateOnParse = False
//
//lb_return = xmlDoc.loadxml(ls_result)	 
//If xmlDoc.parseError.ErrorCode <> 0  then
//	Messagebox('LoadXML 오류',string( xmlDoc.parseError.reason ))
//	RETURN
//end if
//
//xmlNodes    = xmlDoc.getElementsByTagName("GeocodeResponse")	// Object를 참조
//xmlNode     = xmlNodes.nextNode											// 자식요소를 Object로 저장
//
//// <GeocodeResponse>의 하위노드인 <status>의 값이 OK 이면
//ls_status = xmlNode.childNodes.Item(0).Text
//if ls_status <> "OK" Then RETURN
//
//
//xmlNodeLists  = CREATE OleObject
//xmlNodeLists.ConnectToNewObject("MSXML2.IXMLDOMNodeList")
//
//xmlDomNode    = CREATE OleObject
//xmlDomNode.ConnectToNewObject("MSXML2.IXMLDOMNode")
//
//
//xmlNodeLists = xmldoc.SelectNodes("/ROOT")
//xmlNodeList  = xmlNodeLists.nextNode
//xmlNode      = xmlNodeList.FirstChild
//
//ll_rowcount  = xmlNode.childNodes.Length -1
//for ll_row = 0 to ll_rowcount
//	ls_node       = xmlNode.childNodes.Item(0).nodeName
//	ls_text       = xmlNode.childNodes.Item(0).Text
//	tab_1.tabpage_3.mle_response.text = tab_1.tabpage_3.mle_response.text + "지오코드 결과(XPath):" + ls_node + " | " + ls_text + '~r~n'
//next
//
//if IsValid( xmlNodeList ) = false then
//else
//	xmlNodeList = xmlDoc.getElementsByTagName("address_component")
//	ll_rowcount = xmlNodeList.length - 1
//	
//	For ll_row = 0 To ll_rowcount
//		xmlNode = xmlNodeList.nextNode
//
//		if xmlNode.HasChildNodes = true then
//			strvalue = "O"
//		else
//			strvalue = "X"
//		end if
//		
//		li_type = xmlNode.nodetype
//		ls_node = string(xmlNode.nodeName)
//		ls_text = string(xmlNode.text)
//		tab_1.tabpage_3.mle_response.text = tab_1.tabpage_3.mle_response.text + string(ll_row,"00") + "<" + ls_node + ">" + ls_text + '</' + ls_node + '>' + strvalue	
//		tab_1.tabpage_3.mle_response.text = tab_1.tabpage_3.mle_response.text + "~r~n"
//	Next
//end if
//
end event

type cb_import from commandbutton within tabpage_2
integer width = 320
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "불러오기"
end type

event clicked;//
string  ls_url, ls_args, ls_addr
integer li_rtn

setnull( ls_args )

li_rtn = GetFileOpenName("Select File",       &
       + is_FilePathName, is_FileName, "XML", &
		 + "XML Files (*.xml), *.xml,"          &
		 + "HTML Files (*.htm?), *.htm?")
choose case li_rtn
	case -1
		MessageBox("GetFileOpenName Error!", "해당 파일이 존재하지 않습니다.")
		RETURN
		
	case 1	// Returns 1 if it succeeds,
		ls_url = "file:///" + is_FilePathName	
		tab_1.tabpage_2.ddlb_url.text = ls_url
		
		//ole_browser.of_readfile( "file:///" + is_FilePathName, is_FileName  )
		//ole_browser.of_Navigate(ls_url + ls_args)		

	case else
		// 0 if the user clicks the Cancel 
end choose

end event

type ole_browser from u_web_browser within tabpage_2
integer y = 100
integer width = 4608
integer height = 1768
integer taborder = 30
boolean bringtotop = true
boolean border = true
string binarykey = "w_orsale_shoping.win"
end type

event navigatecomplete2;call super::navigatecomplete2;//
ddlb_url.additem( url )
//tab_1.tabpage_3.mle_response.text = ole_browser.of_getsource()
end event

event documentcomplete;call super::documentcomplete;
ddlb_url.text = url
tab_1.tabpage_3.mle_response.text = ole_browser.of_getsource()

end event

type ddlb_url from dropdownlistbox within tabpage_2
event keydown pbm_dwnkey
integer x = 663
integer width = 3067
integer height = 940
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
end type

event modified;// go to Navigate
string ls_url, ls_args

ls_url = this.text
ole_browser.of_Navigate(ls_url + ls_args)

end event

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 2, 0 )		// 2번째 인수값 1=KOR, 2=ENG

this.SelectText(1, LenA(this.Text))

end event

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4608
integer height = 1864
long backcolor = 79416533
string text = "소스"
long tabtextcolor = 33554432
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
mle_response mle_response
end type

on tabpage_3.create
this.mle_response=create mle_response
this.Control[]={this.mle_response}
end on

on tabpage_3.destroy
destroy(this.mle_response)
end on

type mle_response from multilineedit within tabpage_3
integer y = 176
integer width = 4608
integer height = 1688
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 4608
integer height = 1864
long backcolor = 79416533
string text = "주문장"
long tabtextcolor = 33554432
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
cb_3 cb_3
cbx_chk cbx_chk
cb_xls2dw cb_xls2dw
cb_4 cb_4
rb_2 rb_2
rb_1 rb_1
cbx_3 cbx_3
dw_8 dw_8
dw_7 dw_7
end type

on tabpage_4.create
this.cb_3=create cb_3
this.cbx_chk=create cbx_chk
this.cb_xls2dw=create cb_xls2dw
this.cb_4=create cb_4
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_3=create cbx_3
this.dw_8=create dw_8
this.dw_7=create dw_7
this.Control[]={this.cb_3,&
this.cbx_chk,&
this.cb_xls2dw,&
this.cb_4,&
this.rb_2,&
this.rb_1,&
this.cbx_3,&
this.dw_8,&
this.dw_7}
end on

on tabpage_4.destroy
destroy(this.cb_3)
destroy(this.cbx_chk)
destroy(this.cb_xls2dw)
destroy(this.cb_4)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_3)
destroy(this.dw_8)
destroy(this.dw_7)
end on

type cb_3 from commandbutton within tabpage_4
integer x = 837
integer y = 28
integer width = 297
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "초기화"
end type

event clicked;// 초기화
dw7.reset() ; dw8.reset()

cb_xls2dw.enabled = true

end event

type cbx_chk from checkbox within tabpage_4
integer x = 1157
integer y = 64
integer width = 421
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;// 전체선택
long   ll_row
string ls_chk, ls_saleno

if this.checked = true then 
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw7.rowcount()
	ls_saleno  = dw7.object.sale_no[ll_row]

	if isnull(ls_saleno) OR ls_saleno = "" then
		dw7.object.chk_yn[ll_row] = ls_chk
	end if
next

end event

type cb_xls2dw from commandbutton within tabpage_4
integer y = 28
integer width = 832
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "변환데이터 가져오기"
end type

event clicked;// 변환데이터 가져오기
// saleshop, saleshopdet 가져오기
string   ls_orderno, ls_saleno, ls_jupsuflag, ls_orderno_chk
string   ls_cust_no, ls_scene_code		// 거래처, 현장
long     ll_row, ll_dw7cnt, ll_dw8cnt, ll_seqno
decimal  ld_tax, ld_amount
datetime ldt_today, ldt_jupsudate

ldt_today = gf_today()

setnull( ls_orderno ) ; setnull( ll_seqno )
ld_tax = 0 ; ld_amount = 0

if dw6.rowcount() < 1 then
	MessageBox("확인","쇼핑몰 변환데이터가 존재하지 않습니다.")
	RETURN
end if

// 유창, 송천분류
if SQLCA.Database = "YCSC" then
	ls_cust_no    = "V487"					// 거래처(송천:V487)
	ls_scene_code = "V487-201501"			// 현장
else
	ls_cust_no    = "U580"					// 거래처(유창:U580)
	ls_scene_code = "U580-2015K6"			// 현장
end if

this.enabled = false				// 가져오기잠금
ib_retrieve  = false				// 데이터가져오기

dw7.reset() ; dw8.reset()

dw7.setredraw( false )		// saleshop		
dw8.setredraw( false )		// saleshopdet

///////////////////////////////////////////////////////////////////////////////////
// 엑셀변환 데이터(dw6) ==> dw7(saleshop), dw8(saleshopdet) INSERT하기
///////////////////////////////////////////////////////////////////////////////////
debugbreak()

for ll_row = 1 to dw6.rowcount()
	// 중복유무
	ls_jupsuflag = dw6.object.jupsu_flag[ll_row]
	
	if ls_jupsuflag = "Y" then	CONTINUE
	
	// 최초한번만 실행
	if isnull(ls_orderno) then		
		ls_orderno = dw6.object.order_no[ll_row]
	
		ll_dw7cnt = dw7.insertrow( 0 )	
		dw7.object.order_no[ll_dw7cnt]     = ls_orderno								// 주문번호
		dw7.object.cust_no[ll_dw7cnt]      = ls_cust_no								// 거래처(송천:V487, 유창:U580)
		dw7.object.scene_code[ll_dw7cnt]   = ls_scene_code							// 현장
	
		dw7.object.order_date[ll_dw7cnt]   = dw6.object.order_date[ll_row]	// 주문일자
		dw7.object.due_date[ll_dw7cnt]     = dw6.object.due_date[ll_row]     // 납기일자
		dw7.object.cust_po_date[ll_dw7cnt] = dw6.object.due_date[ll_row] 		// 확정납기
		
		dw7.object.cust_po_no[ll_dw7cnt]   = dw6.object.order_no[ll_row]     // 고객발주번호(SHOPyymmdd-###)
		dw7.object.sale_flag[ll_dw7cnt]    = dw6.object.sale_flag[ll_row]		// 수주유형
		dw7.object.shipto_addr[ll_dw7cnt]  = dw6.object.shipto_addr[ll_row]	// 운송처주소
		dw7.object.curr_code[ll_dw7cnt]    = "WON"									// 통화코드
		dw7.object.fob[ll_dw7cnt]          = dw6.object.fob[ll_row]				// 결재
		dw7.object.salesman[ll_dw7cnt]     = dw6.object.salesman[ll_row]		// 영업사원
		dw7.object.confirm_flag[ll_dw7cnt] = dw6.object.confirm_flag[ll_row]	// 확정
		dw7.object.rem[ll_dw7cnt]          = dw6.object.rem[ll_row]				// 특기사항
		dw7.object.rem1[ll_dw7cnt]         = dw6.object.rem1[ll_row]			// 특기사항1
		dw7.object.rem2[ll_dw7cnt]         = dw6.object.rem2[ll_row]			// 특기사항2
		dw7.object.area_no[ll_dw7cnt]      = dw6.object.area_no[ll_row]		// 사업장
		dw7.object.tel_no[ll_dw7cnt]       = dw6.object.tel_no[ll_row]			// 연락처
	
		dw7.object.ship_flag[ll_dw7cnt]    = "D"										// 운송방법(C:착불, D:대여, B:부담)
		dw7.object.open_close[ll_dw7cnt]   = "O"										// 마감(C:마감, O:오픈)
		dw7.object.revision_no[ll_dw7cnt]  = 0											// 변경횟수
		dw7.object.revision_date[ll_dw7cnt]= ldt_today								// 최종변경일	
		dw7.object.input_date[ll_dw7cnt]   = ldt_today								// 주문입력일
	
		dw7.object.jupsu_flag[ll_dw7cnt]   = "N"										// 접수,미접수
	end if

	if ls_orderno <> dw6.object.order_no[ll_row] then
		// 헤더
		if ld_tax = 0 then
			dw7.object.tax_sign[ll_dw7cnt]     = "N"		   // 부가세
		else
			dw7.object.tax_sign[ll_dw7cnt]     = "Y"		   // 부가세
		end if
		dw7.object.sale_tax[ll_dw7cnt]	  = ld_tax			// 세액
		dw7.object.sale_amount[ll_dw7cnt]  = ld_amount		// 공급가액
		ld_tax = 0 ; ld_amount = 0
		
		
		ls_orderno = dw6.object.order_no[ll_row]

		ll_dw7cnt = dw7.insertrow( 0 )				
		dw7.object.order_no[ll_dw7cnt]     = ls_orderno
		
		dw7.object.cust_no[ll_dw7cnt]      = ls_cust_no								// 거래처(송천:V487, 유창:U580)
		dw7.object.scene_code[ll_dw7cnt]   = ls_scene_code							// 현장

		dw7.object.order_date[ll_dw7cnt]   = dw6.object.order_date[ll_row]	// 주문일자
	   dw7.object.due_date[ll_dw7cnt]     = dw6.object.due_date[ll_row]     // 납기일자

		dw7.object.cust_po_no[ll_dw7cnt]   = dw6.object.order_no[ll_row]     // 고객발주번호(SHOPyymmdd-###)
		dw7.object.sale_flag[ll_dw7cnt]    = dw6.object.sale_flag[ll_row]		// 수주유형
		dw7.object.shipto_addr[ll_dw7cnt]  = dw6.object.shipto_addr[ll_row]	// 운송처주소
		dw7.object.curr_code[ll_dw7cnt]    = "WON"									// 통화코드
		dw7.object.fob[ll_dw7cnt]          = dw6.object.fob[ll_row]				// 결재
		dw7.object.salesman[ll_dw7cnt]     = dw6.object.salesman[ll_row]		// 영업사원
		dw7.object.confirm_flag[ll_dw7cnt] = dw6.object.confirm_flag[ll_row]	// 확정
		dw7.object.rem[ll_dw7cnt]          = dw6.object.rem[ll_row]				// 특기사항
		dw7.object.rem1[ll_dw7cnt]         = dw6.object.rem1[ll_row]			// 특기사항1
		dw7.object.rem2[ll_dw7cnt]         = dw6.object.rem2[ll_row]			// 특기사항2
		dw7.object.area_no[ll_dw7cnt]      = dw6.object.area_no[ll_row]		// 사업장
		dw7.object.tel_no[ll_dw7cnt]       = dw6.object.tel_no[ll_row]			// 연락처

		dw7.object.ship_flag[ll_dw7cnt]    = "D"										// 운송방법(C:착불, D:대여, B:부담)
		dw7.object.open_close[ll_dw7cnt]   = "O"										// 마감(C:마감, O:오픈)
		dw7.object.revision_no[ll_dw7cnt]  = 0											// 변경횟수
		dw7.object.revision_date[ll_dw7cnt]= ldt_today								// 최종변경일		
		dw7.object.input_date[ll_dw7cnt]   = ldt_today								// 주문입력일

		dw7.object.jupsu_flag[ll_dw7cnt]   = "N"									   // 접수,미접수
	end if
	
	// 상세
	ll_dw8cnt = dw8.insertrow( 0 )
	
	dw8.object.order_no[ll_dw8cnt]    = dw6.object.order_no[ll_row]
	dw8.object.seq_no[ll_dw8cnt]      = dw6.object.seq_no[ll_row]
	dw8.object.item_no[ll_dw8cnt]     = dw6.object.item_no[ll_row]
	dw8.object.qa[ll_dw8cnt]          = dw6.object.qa[ll_row]
	dw8.object.uom[ll_dw8cnt]         = dw6.object.uom[ll_row]
	
	dw8.object.order_qty[ll_dw8cnt]   = dw6.object.order_qty[ll_row]		// 주문수량
	if dw6.object.uom[ll_row] = "M" then
		dw8.object.price[ll_dw8cnt]    = dw6.object.price_m[ll_row]			// 단가(M)
	else
		dw8.object.price[ll_dw8cnt]    = dw6.object.price[ll_row]			// 단가
	end if
	dw8.object.acc_qty[ll_dw8cnt]     = dw6.object.acc_qty[ll_row]			// 환산수량

	dw8.object.saledet_text[ll_dw8cnt]= "N"	// 계획여부
	dw8.object.sol_qty[ll_dw8cnt]     = 0		// 가용량
	dw8.object.issue_qty[ll_dw8cnt]   = 0		// 선정수량
	dw8.object.rlse_qty[ll_dw8cnt]    = 0		// 출고수량

	ld_tax    = ld_tax    + dw6.object.sale_tax[ll_row]						// 세액
	ld_amount = ld_amount + dw6.object.sale_amount[ll_row]					// 공급가액
next

// 마지막 헤더금액(세액, 공급가액)
if ld_tax = 0 then
	dw7.object.tax_sign[ll_dw7cnt]     = "N"		   // 부가세
else
	dw7.object.tax_sign[ll_dw7cnt]     = "Y"		   // 부가세
end if
dw7.object.sale_tax[ll_dw7cnt]	  = ld_tax			// 세액
dw7.object.sale_amount[ll_dw7cnt]  = ld_amount		// 공급가액

if dw7.rowcount() < 1 then dw7.insertrow( 0 )
if dw8.rowcount() < 1 then dw8.insertrow( 0 )

dw7.setredraw( true )
dw8.setredraw( true )
///////////////////////////////////////////////////////////////////////////////////

if GF_PERMISSION("쇼핑몰_주문관리", gs_userid) = "Y" then
	pb_save.enabled = true
end if

MessageBox("확인","가져오기 완료")

end event

type cb_4 from commandbutton within tabpage_4
integer x = 3634
integer y = 28
integer width = 946
integer height = 128
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택행 삭제하기"
end type

event clicked;// 선택행 삭제하기
long   ll_row, ll_dw7row, ll_delcnt
string ls_orderno, ls_chk

ll_dw7row = dw7.getrow()
if isnull( ll_dw7row ) OR ll_dw7row < 1 then RETURN

ll_row     = dw7.object.tot_chkyn[1]
if isnull(ll_row) OR ll_row < 1 then 
	MessageBox("확인","삭제할 대상을 선택하시기 바랍니다.")
	RETURN
end if

if MessageBox("확인","선택한 주문을 삭제 하시겠습니까?",question!,okcancel!,2) = 2 then RETURN

for ll_row = dw7.rowcount() to 1 step -1
	ls_chk     = dw7.object.chk_yn[ll_row]
	ls_orderno = dw7.object.order_no[ll_row]

	if ls_chk = "N" then CONTINUE
	
	if isnull(ls_orderno) OR ls_orderno = "" then
	else
		DELETE saleshopdet WHERE order_no = :ls_orderno;
		if sqlca.sqlcode = 0 then
			DELETE saleshop WHERE order_no = :ls_orderno;
			if sqlca.sqlcode = 0 then
				COMMIT;
				ll_delcnt = ll_delcnt + 1
			else
				ROLLBACK;
			end if
		else
			ROLLBACK;
		end if
	end if
next

pb_retrieve.triggerevent( clicked! )
MessageBox("확인", string(ll_delcnt) + "건 삭제완료")
				

end event

type rb_2 from radiobutton within tabpage_4
integer x = 2139
integer y = 68
integer width = 357
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "세로창"
end type

event clicked;// 세로창 idw_w, idw_h
if this.checked = true then	
	dw7.width   = idw_w  / 2
	dw7.height  = idw_h

	dw8.visible = true
	dw8.x       = dw7.x + dw7.width
	dw8.y       = dw7.y
	dw8.width   = dw7.width
	dw8.height  = dw7.height
end if

end event

type rb_1 from radiobutton within tabpage_4
integer x = 1760
integer y = 68
integer width = 357
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "가로창"
end type

event clicked;// 가로창	idw_w, idw_h
if this.checked = true then	
	dw7.width   = idw_w
	dw7.height  = idw_h / 2

	dw8.visible = true
	dw8.x       = dw7.x
	dw8.y       = dw7.y + dw7.height
	dw8.width   = dw7.width
	dw8.height  = dw7.height
end if

end event

type cbx_3 from checkbox within tabpage_4
integer x = 3063
integer y = 64
integer width = 357
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "집계보기"
end type

event clicked;//
if this.checked = true then
	dw8.Modify("DataWindow.Detail.Height=0")			// Detail
	dw8.Modify("DataWindow.Trailer.1.Height=88")	// 주문번호 소계
else
	dw8.Modify("DataWindow.Detail.Height=88")		// Detail
	dw8.Modify("DataWindow.Trailer.1.Height=88")	// 주문번호 소계
end if

end event

type dw_8 from datawindow within tabpage_4
integer y = 1020
integer width = 4608
integer height = 844
integer taborder = 50
string title = "none"
string dataobject = "d_orsale_shopdet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull( row ) OR row < 1 then RETURN

this.scrolltorow( row )

is_dw = "dw_8"
//GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
//GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
//string ls_orderno
//long   ll_found, ll_seq
//
//ls_orderno = dw6.object.order_no[row] 
//ll_seq     = dw6.object.seq_no[row] 
//ll_found   = dw5.find( "order_no = '" + ls_orderno + "' AND order_seq = " + string(ll_seq), 1, dw5.rowcount() )
//if ll_found > 0 then
//	dw5.scrolltorow( ll_found )
//end if
//
end event

type dw_7 from datawindow within tabpage_4
integer y = 176
integer width = 4608
integer height = 844
integer taborder = 110
string title = "none"
string dataobject = "d_orsale_shop_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
debugbreak()

if isnull( row ) OR row < 1 then RETURN

//this.SelectRow(0, FALSE)
//this.SelectRow(row, TRUE)
this.ScrollToRow( row )

is_dw = "dw_7"
//GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
//GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_area, ls_saleno, ls_orderno, ls_sdate, ls_edate

if ib_retrieve = false then RETURN

ls_saleno  = this.object.sale_no[row]
if isnull( ls_saleno ) OR ls_saleno = "" then
	this.SelectRow(0, FALSE)
else
	this.SelectRow(0, FALSE)
	this.SelectRow(row, TRUE)
end if

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

ls_orderno = this.object.order_no[row]
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

dw8.retrieve( ls_orderno, ls_sdate, ls_edate )
if dw8.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if


end event

event doubleclicked;// 수주번호 조회
string ls_saleno

if isnull( row ) OR row < 1 then RETURN

this.scrolltorow( row )

choose case dwo.name
	case "sale_no"
		if this.object.jupsu_flag[row] = "Y" then
			ls_saleno = this.object.sale_no[row]
			if isnull( ls_saleno ) OR ls_saleno = "" then RETURN
			
			if IsValid(w_all_main) = true then
				opensheet(w_orsale_m, w_all_main, 5, original!)
			else
				opensheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

type cb_login from commandbutton within w_orsale_shoping
integer x = 1289
integer y = 16
integer width = 238
integer height = 68
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "LOGIN"
end type

event clicked;//// 로긴
//// Microsoft HTML Object Library(mshtml.tlb),Microsoft Internet Controls(iframe.dll)
////
////OLEObject	my_ole
////my_ole = Create OLEObject
////my_ole.ConnectToNewObject("internet explorer.application")
////my_ole.open( "d:\temp\test.html" ) or
////my_ole.documents.open( "d:\temp\test.html" )
////
//
//string  ls_uid = "uid", ls_pwd = "pwd", ls_password, ls_search
//integer li_return
//
//u_web_browser IE
//OLEObject     HTMLDoc, HTMLElement
//
//// go to Navigate
//string ls_url, ls_args
//
//ls_url = tab_1.tabpage_2.ddlb_url.text
//
//IE     = tab_1.tabpage_2.ole_browser
//IE.event onstatusbar( true )
//IE.of_Navigate(ls_url + ls_args)
//
//// READYSTATE_UNINITIALIZED = 0, READYSTATE_LOADING  = 1, READYSTATE_LOADED = 2
//// READYSTATE_INTERACTIVE   = 3, READYSTATE_COMPLETE = 4
//Do While IE.Object.Busy Or IE.Object.readyState <> 4
//	Yield()
//Loop
//
//HTMLDoc = IE.Object.Document
//tab_1.tabpage_3.mle_response.text = string(HTMLDoc.body.innertext) // TEXT document
//tab_1.tabpage_3.mle_response.text = string(HTMLDoc.body.innerhtml) // HTML document 
//
//SELECT password INTO :ls_password FROM login WHERE user_id = :gs_userid;
//
//HTMLElement = HTMLDoc.getElementById( ls_uid )		// Type: IHTMLElement
//HTMLElement.Value = gs_userid 
//HTMLElement = HTMLDoc.getElementById( ls_pwd )		// Type: IHTMLElement
//HTMLElement.Value = ls_password 
//HTMLElement.focus()
//
//HTMLDoc.Forms(0).submit
//
end event

type cb_gettable from commandbutton within w_orsale_shoping
integer x = 1531
integer y = 16
integer width = 311
integer height = 68
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "GetTable"
end type

event clicked;////
//MultiLineEdit MEdit 
//u_web_browser IE
//OLEObject     HTMLDoc, HTMLElement, eleTable, eleColTR, eleColTD, eleCol
//long    ll_row, ll_col, i, j
//integer li_return
//string  ls_value
//
////eleCol   = CREATE OleObject
////li_return = eleCol.ConnectToNewObject("MSHTML.IHTMLElement")
////if li_return <> 0 then
////   MessageBox ("오류", "MSHTML.IHTMLElement~r~n~r~nError code = '" + String(li_return) + "'", Exclamation!, OK!)
////   Return
////end if
//
//MEdit    = tab_1.tabpage_3.mle_response
//IE       = tab_1.tabpage_2.ole_browser
//HTMLDoc  = IE.Object.Document
//
//eleTable = htmldoc.getElementsByTagName("table")
//if isnull(eleTable) then
//	MessageBox("확인","현재 페이지에는 Table TAG가 존재하지 않습니다.")
//	RETURN
//end if
//
//eleColTR = htmldoc.getElementsByTagName("tr") // Find all tr tags
//
//ll_row = eleColTR.length - 1
//if ll_row > 0 then
//	For i = 0 To ll_row
//		eleColTD = eleColTR.item[i].getElementsByTagName("td") 
//	
//		ll_col = eleColTD.length - 1
//		For j = 0 To ll_col
//			eleCol = eleColTD.item[j]
//			ls_value = ls_value + eleCol.innerText + " | " 
//		Next
//		ls_value = ls_value  + "~r~n"
//	Next
//	
//	MEdit.text = ls_value
//end if
//MessageBox("확인", string(ll_row + 1) + " 건 작업완료")
//
end event

type ln_h from line within w_orsale_shoping
integer linethickness = 4
integer beginx = 5
integer beginy = 240
integer endx = 3003
integer endy = 240
end type

type hpb_1 from hprogressbar within w_orsale_shoping
integer x = 3109
integer y = 260
integer width = 1527
integer height = 76
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type pb_4 from picturebutton within w_orsale_shoping
event mousemove pbm_mousemove
integer x = 4018
integer y = 64
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
//
DataWindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw5

	case "dw_6"
		arg_dw  = dw6

	case "dw_7"
		arg_dw  = dw7

	case "dw_8"
		arg_dw  = dw8
		
	case else
		RETURN
end choose

if arg_dw.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				arg_dw.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				arg_dw.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	


end event

type shl_1 from statichyperlink within w_orsale_shoping
integer x = 1385
integer y = 136
integer width = 457
integer height = 84
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "쇼핑몰"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
string url = "http://shop.yoochang.com/"
end type

event clicked;// 쇼핑몰
string ls_url

tab_1.selectedtab = 2

ls_url = "http://shop.yoochang.com/"

tab_1.tabpage_2.ddlb_url.text = ls_url
tab_1.tabpage_2.ole_browser.of_Navigate( ls_url )


end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_orsale_shoping.bin 
2600000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000fa1fceb001d2eae300000003000000c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000fa1fceb001d2eae3fa1fceb001d2eae3000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c000000000000000100000002fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c0000682e00002daf0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_orsale_shoping.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
