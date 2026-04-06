$PBExportHeader$w_orsale_weborder.srw
$PBExportComments$Web 주문관리
forward
global type w_orsale_weborder from w_inheritance
end type
type st_1 from statictext within w_orsale_weborder
end type
type em_1 from editmask within w_orsale_weborder
end type
type em_2 from editmask within w_orsale_weborder
end type
type st_2 from statictext within w_orsale_weborder
end type
type dw_3 from datawindow within w_orsale_weborder
end type
type dw_4 from datawindow within w_orsale_weborder
end type
type st_4 from statictext within w_orsale_weborder
end type
type tab_1 from tab within w_orsale_weborder
end type
type tabpage_1 from userobject within tab_1
end type
type st_horizontal1 from u_splitbar_horizontal within tabpage_1
end type
type cbx_fix from checkbox within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
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
type ddlb_fld from dropdownlistbox within tabpage_1
end type
type dw_6 from datawindow within tabpage_1
end type
type ddlb_dwtitles from dropdownlistbox within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type st_vertical from u_splitbar_vertical within tabpage_1
end type
type ddlb_op from dropdownlistbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_horizontal1 st_horizontal1
cbx_fix cbx_fix
cb_5 cb_5
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
ddlb_fld ddlb_fld
dw_6 dw_6
ddlb_dwtitles ddlb_dwtitles
dw_5 dw_5
st_vertical st_vertical
ddlb_op ddlb_op
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
type st_7 from statictext within tabpage_4
end type
type st_5 from statictext within tabpage_4
end type
type st_3 from statictext within tabpage_4
end type
type em_cnt from editmask within tabpage_4
end type
type em_saleno from editmask within tabpage_4
end type
type cb_sale from commandbutton within tabpage_4
end type
type st_horizontal2 from u_splitbar_horizontal within tabpage_4
end type
type cb_3 from commandbutton within tabpage_4
end type
type cbx_chk from checkbox within tabpage_4
end type
type cb_xls2dw from commandbutton within tabpage_4
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
st_7 st_7
st_5 st_5
st_3 st_3
em_cnt em_cnt
em_saleno em_saleno
cb_sale cb_sale
st_horizontal2 st_horizontal2
cb_3 cb_3
cbx_chk cbx_chk
cb_xls2dw cb_xls2dw
rb_2 rb_2
rb_1 rb_1
cbx_3 cbx_3
dw_8 dw_8
dw_7 dw_7
end type
type tabpage_5 from userobject within tab_1
end type
type cb_6 from commandbutton within tabpage_5
end type
type dw_9 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_6 cb_6
dw_9 dw_9
end type
type tab_1 from tab within w_orsale_weborder
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type cb_login from commandbutton within w_orsale_weborder
end type
type cb_gettable from commandbutton within w_orsale_weborder
end type
type ln_h from line within w_orsale_weborder
end type
type hpb_1 from hprogressbar within w_orsale_weborder
end type
type pb_4 from picturebutton within w_orsale_weborder
end type
type shl_1 from statichyperlink within w_orsale_weborder
end type
type cb_4 from commandbutton within w_orsale_weborder
end type
end forward

global type w_orsale_weborder from w_inheritance
integer y = 112
integer width = 4745
integer height = 2372
string title = "웹 주문관리(w_orsale_weborder)"
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
cb_4 cb_4
end type
global w_orsale_weborder w_orsale_weborder

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
DataWindow dw5, dw6, dw7, dw8, dw9
DataWindowChild idwc_user, idwc_area
end variables

forward prototypes
public subroutine wf_itemqa_check ()
public subroutine wf_totchkyn ()
end prototypes

public subroutine wf_itemqa_check ();// 품목+규격 오류 검사
string  ls_custno, ls_scene, ls_itemno, ls_qa, ls_qa1, ls_uom, ls_rule, ls_errtext
string  ls_qa_split[], ls_nullarray[]
string  ls_chk1, ls_chk2, ls_chk3, ls_chk4, ls_val1, ls_val2, ls_val3, ls_val4
long	  ll_row,  ll_chk, ll_cnt
decimal ld_orderqty, ld_amt

////////////////////////////////////////////////////////////////////////
// 품목+규격 오류 검사 //  CHK1 = Y, QA1 = 080 : QA1 값이 080만 허용
////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw6.rowcount()
	ll_chk = 0 ; ll_cnt = 0
	
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
				ll_chk  = ll_chk + 1
				if ls_val1 <> ls_qa_split[1] then
					dw6.scrolltorow( ll_row )					
					ls_errtext = string(ll_row) + " 행 품목의 규격1 오류. " + ls_val1 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				else
					ll_cnt = ll_cnt + 1
				end if
			end if
	
			if ls_chk2 = "Y" then
				ll_chk  = ll_chk + 1
				if ls_val2 <> ls_qa_split[2] then
					dw6.scrolltorow( ll_row )
					ls_errtext = string(ll_row) + " 행 품목의 규격2 오류. " + ls_val2 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				else
					ll_cnt = ll_cnt + 1
				end if
			end if
	
			if ls_chk3 = "Y" then
				ll_chk  = ll_chk + 1
				if ls_val3 <> ls_qa_split[3] then
					dw6.scrolltorow( ll_row )
					ls_errtext = string(ll_row) + " 행 품목의 규격3 오류. " + ls_val3 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				else
					ll_cnt = ll_cnt + 1
				end if
			end if
	
			if ls_chk4 = "Y" then
				ll_chk  = ll_chk + 1
				if ls_val4 <> ls_qa_split[4] then
					dw6.scrolltorow( ll_row )
					ls_errtext = string(ll_row) + " 행 품목의 규격4 오류. " + ls_val4 + " 으로 시작해야 합니다."
					dw6.object.err_text[ll_row] = ls_errtext
				else
					ll_cnt = ll_cnt + 1
				end if
			end if

			if ll_chk = ll_cnt then
				dw6.object.chk[ll_row] = "Y"			
			end if

//			SELECT count(*) INTO :ll_cnt FROM scene WHERE cust_no = :ls_custno AND scene_code = :ls_scene;
//			if isnull(ll_cnt) OR ll_cnt = 0 then 
//				dw6.scrolltorow( ll_row )
//				MessageBox("확인",string(ll_row) + " 행 거래처,현장 오류 입니다.", stopsign!)
//				RETURN
//			else
//				SELECT count(*) INTO :ll_cnt 
//				  FROM item 
//				 WHERE item_no = :ls_itemno AND qa = :ls_qa AND uom = :ls_uom;
//				if ll_cnt = 1 then 
//					// 품목규격패턴 CHECK PASS(주문관리[w_orsale_m] 로직 복사하여 사용함)
//					dw6.object.chk[ll_row] = "Y"
//				else
//					ls_rule   = dw5.object.order_rule[ll_row]
//					if Pos(ls_rule,"주문길이") > 0 then
//						dw6.scrolltorow( ll_row )
//						ls_errtext = string(ll_row) + " 행 품목의 규격4[주문길이] 오류. 미등록 입니다."
//						dw6.object.err_text[ll_row] = ls_errtext
//					elseif Pos(ls_rule,"선택길이") > 0 then
//						dw6.scrolltorow( ll_row )
//						ls_errtext = string(ll_row) + " 행 품목의 규격4[선택길이] 오류. 미등록 입니다."
//						dw6.object.err_text[ll_row] = ls_errtext
//					else
//						dw6.scrolltorow( ll_row )
//						ls_errtext = string(ll_row) + " 행 품목의 규격, 단위 오류 입니다."
//						dw6.object.err_text[ll_row] = ls_errtext
//					end if
//				end if
//			end if
		end if
	end if		
next

MessageBox("확인","품목+규격 오류 검사 완료.")


end subroutine

public subroutine wf_totchkyn ();//
long   ll_row, ll_tot_chkyn

dw7.accepttext()

//ll_tot_chkyn = dw7.object.tot_chkyn[1]

for ll_row = 1 to dw7.rowcount()
	if dw7.object.chk_yn[ll_row] = "Y" then
		ll_tot_chkyn = ll_tot_chkyn + 1
	end if
next

if ll_tot_chkyn > 0 then
	pb_save.enabled = true
else
	pb_save.enabled = false
end if

end subroutine

on w_orsale_weborder.create
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
this.cb_4=create cb_4
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
this.Control[iCurrent+15]=this.cb_4
end on

on w_orsale_weborder.destroy
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
destroy(this.cb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
tab_1.tabpage_1.st_horizontal1.of_set_topobject( tab_1.tabpage_1.dw_5 )
tab_1.tabpage_1.st_horizontal1.of_set_bottomobject(tab_1.tabpage_1.dw_6 )
tab_1.tabpage_1.st_horizontal1.of_set_minsize(250, 250)

tab_1.tabpage_1.st_vertical.of_set_leftobject( tab_1.tabpage_1.dw_5 )
tab_1.tabpage_1.st_vertical.of_set_rightobject( tab_1.tabpage_1.dw_6 )
tab_1.tabpage_1.st_vertical.of_set_minsize(250, 250)

tab_1.tabpage_4.st_horizontal2.of_set_topobject( tab_1.tabpage_4.dw_7 )
tab_1.tabpage_4.st_horizontal2.of_set_bottomobject(tab_1.tabpage_4.dw_8 )
tab_1.tabpage_4.st_horizontal2.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

string ls_chk
string ls_area, ls_salesman

cb_login.visible 		= false
cb_gettable.visible 	= false

//if gs_userid = "1999010s" then
//else
	shl_1.visible = false
	tab_1.tabpage_2.visible = false
	tab_1.tabpage_3.visible = false
	tab_1.tabpage_5.visible = false
//end if

dw_1.visible  = false
dw_2.visible  = false
dw_1.sharedata(dw_2)


tab_1.tabpage_1.rb_4.enabled  = false			// 가로창
tab_1.tabpage_1.rb_5.enabled  = false			// 세로창
tab_1.tabpage_1.ddlb_dwtitles.visible = false

setnull( ib_retrieve )
tab_1.tabpage_4.cb_xls2dw.enabled = false		// 변환데이터 가져오기

// 틀고정
tab_1.tabpage_1.cbx_fix.checked    = true
tab_1.tabpage_1.cbx_fix.threestate = true
tab_1.tabpage_1.cbx_fix.triggerevent( clicked! )

hpb_1.visible = false
hpb_1.position = 0

dw5  = tab_1.tabpage_1.dw_5
dw6  = tab_1.tabpage_1.dw_6
dw7  = tab_1.tabpage_4.dw_7
dw8  = tab_1.tabpage_4.dw_8
dw9  = tab_1.tabpage_5.dw_9

dw6.visible = false

dw5.settransobject(sqlca)
dw6.settransobject(sqlca)
dw7.settransobject(sqlca)
dw8.settransobject(sqlca)
dw9.settransobject(sqlca)

// 상세
dw6.object.ship_flag.width    = 0		// 운송방법
dw6.object.fob.width          = 0		// 결재
dw6.object.confirm_flag.width = 0		// 확정
dw6.object.confirm_user.width = 0		// 확정자
dw6.object.confirm_date.width = 0		// 확정일자

dw6.object.open_close.width   = 0		// 마감
dw6.object.close_type.width   = 0		// 마감유형
dw6.object.close_date.width   = 0		// 마감일자
dw6.object.revision_no.width  = 0		// 변경횟수
dw6.object.revision_date.width= 0		// 최종변경일
dw6.object.shipamt_case.width = 0		// 운임결재

dw6.object.saledet_text.width = 0		// 계획여부
dw6.object.action.width       = 0		// 조치
dw6.object.sol_qty.width      = 0		// 가용량
dw6.object.issue_qty.width    = 0		// 선정수량
dw6.object.rlse_date.width    = 0		// 최종출고일
dw6.object.rlse_qty.width     = 0		// 출고수량
dw6.object.plan_qty.width     = 0		// 생산계획수량
dw6.object.plan_close.width   = 0		// 생산완료시점
dw6.object.price_be.width     = 0		// 기존단가
//dw6.object.do_rem.width       = 0		// 송장비고
dw6.object.stock_qty.width    = 0		// 장기재고출고
dw6.object.stock_issue.width  = 0		// 장기출고의뢰
dw6.object.stock_do.width     = 0		// 장기재고송장


// 헤더
dw7.object.ship_flag.width    = 0		// 운송방법
dw7.object.fob.width          = 0      // 결재
dw7.object.shipamt_case.width = 0		// 운임결재

dw7.object.confirm_flag.width = 0		// 확정
dw7.object.confirm_user.width = 0		// 확정자
dw7.object.confirm_date.width = 0		// 확정일자

dw7.object.open_close.width   = 0		// 마감
dw7.object.close_type.width   = 0		// 마감유형
dw7.object.close_date.width   = 0		// 마감일자
dw7.object.revision_no.width  = 0		// 변경횟수
dw7.object.revision_date.width= 0		// 최종변경
dw7.object.input_date.width   = 0		//	주문입력일
dw7.object.tel_no.width       = 0		// 연락처
dw7.object.ship_case.width    = 0		// 운송수단

dw7.object.ysp_confirm.width  = 0		// 확정(YSP)
dw7.object.ysp_qty.width      = 0		// 단면
dw7.object.color.width        = 0		// 색상
dw7.object.type.width         = 0		// 타입
dw7.object.class.width        = 0		// THIN
dw7.object.ysp_qty2.width     = 0		// 양면

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
//dw8.object.price_last.width   = 0		// 최근단가
//dw8.object.danjung.width      = 0		// 단중
//dw8.object.jungrang.width     = 0		// 중량

// 브라우즈 
tab_1.tabpage_2.ole_browser.event onstatusbar( true )
tab_1.tabpage_3.mle_response.text = ""

// 수주번호
tab_1.tabpage_4.em_saleno.text  = LeftA(gs_area,1)+"D"+string(GF_Today(),"yyyymmdd")+"001"

// 저장
pb_save.enabled = false

// 주문기간
em_1.text = string(RelativeDate(today(), - 10), "yyyy/mm/dd")
em_2.text = string(RelativeDate(today(), + 10), "yyyy/mm/dd")

// 담당자
dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.getchild("user",idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,"user_id","%")
idwc_user.setitem(1,"user_name","전체")
idwc_user.accepttext()
dw_3.object.user[1] = "%"

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

tab_1.tabpage_1.st_horizontal1.y      = tab_1.tabpage_1.dw_5.y + tab_1.tabpage_1.dw_5.height
tab_1.tabpage_1.st_horizontal1.width  = tab_1.tabpage_1.dw_5.width


idw_w = tab_1.tabpage_1.dw_5.width
idw_h = tab_1.tabpage_1.dw_5.height

if tab_1.tabpage_1.cbx_dual.checked = true then
	tab_1.tabpage_1.dw_5.width   = idw_w
	tab_1.tabpage_1.dw_5.height  = idw_h / 2

	tab_1.tabpage_1.dw_6.visible = true
	tab_1.tabpage_1.dw_6.x       = tab_1.tabpage_1.dw_5.x
	tab_1.tabpage_1.dw_6.y       = tab_1.tabpage_1.dw_5.y + tab_1.tabpage_1.dw_5.height
	tab_1.tabpage_1.dw_6.width   = tab_1.tabpage_1.dw_5.width
	tab_1.tabpage_1.dw_6.height  = tab_1.tabpage_1.dw_5.height
end if

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

tab_1.tabpage_4.st_horizontal2.y      = tab_1.tabpage_4.dw_7.y + tab_1.tabpage_4.dw_7.height
tab_1.tabpage_4.st_horizontal2.width  = tab_1.tabpage_4.dw_7.width

tab_1.tabpage_4.dw_8.y      = tab_1.tabpage_4.st_horizontal2.y + tab_1.tabpage_4.st_horizontal2.height
tab_1.tabpage_4.dw_8.width  = idw_w
tab_1.tabpage_4.dw_8.height = idw_h / 2


tab_1.tabpage_5.dw_9.width  = idw_w
tab_1.tabpage_5.dw_9.height = idw_h

end event

type pb_save from w_inheritance`pb_save within w_orsale_weborder
integer x = 3497
integer y = 60
integer taborder = 90
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

string   ls_saleno, ls_orderno, ls_chk
long     ll_row, ll_dw7row, ll_dw8row
datetime ldt_today, ldt_duedate
decimal  ld_saleamount, ld_tot_saletax, ld_tot_saleamount, ld_totcalc_vat, ld_tot_calcamt
boolean  lb_vat, lb_amount

if ib_retrieve = true then
	if MessageBox("확인","조회상태에서 데이터를 저장할 수 없습니다.~n~r" + &
	              "계속 진행 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
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
	ldt_today = GF_Today()
	
	for ll_row = 1 to dw7.rowcount()
		dw7.object.ship_case[ll_row]     = "E"		// 운송수단(기타)
		dw7.object.shipamt_case[ll_row]  = "R"		// 운송비결재(외상)
		dw7.object.ship_flag[ll_row]     = "D"		// C:착불,D:대여,B:부담
		dw7.object.open_close[ll_row]    = "O"		// 
		dw7.object.order_date[ll_row]    = datetime(date(dw7.object.order_date[ll_row]), time("00:00:00"))
		dw7.object.revision_no[ll_row]   = 0
		dw7.object.revision_date[ll_row] = ldt_today
		
		dw7.object.input_date[ll_row]    = ldt_today
		
		ld_saleamount = dw7.object.sale_amount[ll_row]
		if isnull(ld_saleamount) then
			MessageBox("확인",string(ll_row) + " 행 공급가액을 확인하시기 바랍니다.")
			RETURN
		end if
		
		ldt_duedate   = dw7.object.due_date[ll_row]
		if isnull(ldt_duedate) then
			MessageBox("확인",string(ll_row) + " 행 확정납기를 확인하시기 바랍니다.")
			RETURN
		end if
	next
	
	//
	ld_tot_saletax    = dw7.object.tot_sale_tax[1]
	ld_tot_saleamount = dw7.object.tot_sale_amount[1]
	
	ld_totcalc_vat    = dw8.object.tot_calc_vat[1]
	ld_tot_calcamt    = dw8.object.tot_calc_amt[1]
	
	if ld_tot_saletax <> ld_totcalc_vat then
		MessageBox("확인","웹 세액 합계와 ERP변환 세액 합계가 다릅니다.")
		//lb_vat	   = false
		lb_vat	   = true
	else
		lb_vat	   = true
	end if
	
	if ld_tot_saleamount <> ld_tot_calcamt then
		MessageBox("확인","웹 공급가액 합계와 ERP변환 공급가액 합계가 다릅니다.")
		//lb_amount	= false 
		lb_amount	= true
	else
		lb_amount   = true
	end if

	if lb_vat = true AND lb_amount = true then
		pointer oldpointer // Declares a pointer variable
		oldpointer = SetPointer(HourGlass!)
		
		pb_save.enabled = false
		if WF_Update2( dw7, dw8, "N" ) = true then	
			MessageBox("확인","Web 주문관리 저장완료.~n~nWeb 접수관리에서 수주로 변경하시기 바랍니다.")
		else
			MessageBox("확인","Web 주문관리 저장오류.")
		end if
		SetPointer(oldpointer)
	else
		if MessageBox("확인","웹 데이터를 ERP로 변환하지 못했습니다.",exclamation!, OKCancel!, 2) = 1 then
			pb_save.enabled = false
			RETURN	// WF_Update2( dw7, dw8, "Y" )
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

type dw_1 from w_inheritance`dw_1 within w_orsale_weborder
integer x = 82
integer y = 132
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

type st_title from w_inheritance`st_title within w_orsale_weborder
integer y = 20
integer width = 978
string text = "Web 주문관리"
end type

type st_tips from w_inheritance`st_tips within w_orsale_weborder
end type

type pb_compute from w_inheritance`pb_compute within w_orsale_weborder
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsale_weborder
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsale_weborder
integer x = 3689
integer y = 60
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsale_weborder
integer x = 3113
integer y = 60
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

type pb_cancel from w_inheritance`pb_cancel within w_orsale_weborder
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_orsale_weborder
integer x = 2921
integer y = 60
end type

event pb_delete::clicked;call super::clicked;// 선택행 삭제하기
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

pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

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

SetPointer(oldpointer)
MessageBox("확인", string(ll_delcnt) + " 건 삭제완료")
				

end event

type pb_insert from w_inheritance`pb_insert within w_orsale_weborder
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsale_weborder
integer x = 2729
integer y = 60
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
		MessageBox("확인","웹 엑셀데이터를 복사한 후 '엑셀 붙여넣기'를 클릭하시기 바랍니다.")
		
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
			ib_retrieve = true		// 조회값

			pointer oldpointer // Declares a pointer variable
			oldpointer = SetPointer(HourGlass!)
			
			dw7.reset() ; dw8.reset()	
			dw7.retrieve( ls_saleman, ls_sdate, ls_edate )		
			SetPointer(oldpointer)
			
			if dw7.rowcount() > 0 then
				MessageBox("확인","조회완료")
			else
				MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
			end if
			dw7.setfocus()
		end if
		
	case 5
		//pointer oldpointer // Declares a pointer variable
		oldpointer = SetPointer(HourGlass!)
		
		dw9.retrieve( ls_area, ls_saleman, ls_sdate, ls_edate )
		SetPointer(oldpointer)			
		if dw9.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
		else
			dw9.setcolumn("seq_no")
			dw9.setfocus()
		end if
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_orsale_weborder
integer x = 3941
integer y = 8
integer width = 704
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsale_weborder
integer x = 1065
integer y = 8
integer width = 1609
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsale_weborder
integer x = 2697
integer y = 8
integer width = 1216
integer height = 224
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsale_weborder
string tag = "d_orsalesalemanrep_r1_2"
integer x = 210
integer y = 132
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

type st_1 from statictext within w_orsale_weborder
integer x = 1623
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

type em_1 from editmask within w_orsale_weborder
integer x = 1915
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

type em_2 from editmask within w_orsale_weborder
integer x = 2281
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

type st_2 from statictext within w_orsale_weborder
integer x = 1623
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

type dw_3 from datawindow within w_orsale_weborder
integer x = 1911
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

type dw_4 from datawindow within w_orsale_weborder
integer x = 1093
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

type st_4 from statictext within w_orsale_weborder
integer x = 1093
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

type tab_1 from tab within w_orsale_weborder
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
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
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
st_horizontal1 st_horizontal1
cbx_fix cbx_fix
cb_5 cb_5
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
ddlb_fld ddlb_fld
dw_6 dw_6
ddlb_dwtitles ddlb_dwtitles
dw_5 dw_5
st_vertical st_vertical
ddlb_op ddlb_op
end type

on tabpage_1.create
this.st_horizontal1=create st_horizontal1
this.cbx_fix=create cbx_fix
this.cb_5=create cb_5
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
this.ddlb_fld=create ddlb_fld
this.dw_6=create dw_6
this.ddlb_dwtitles=create ddlb_dwtitles
this.dw_5=create dw_5
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.Control[]={this.st_horizontal1,&
this.cbx_fix,&
this.cb_5,&
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
this.ddlb_fld,&
this.dw_6,&
this.ddlb_dwtitles,&
this.dw_5,&
this.st_vertical,&
this.ddlb_op}
end on

on tabpage_1.destroy
destroy(this.st_horizontal1)
destroy(this.cbx_fix)
destroy(this.cb_5)
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
destroy(this.ddlb_fld)
destroy(this.dw_6)
destroy(this.ddlb_dwtitles)
destroy(this.dw_5)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

type st_horizontal1 from u_splitbar_horizontal within tabpage_1
integer y = 1128
integer width = 4608
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
boolean threestate = true
boolean thirdstate = true
end type

event clicked;// 틀고정
string ls_colx5, ls_colx6

if this.checked = true then
	ls_colx5 = string(integer(tab_1.tabpage_1.dw_5.object.order_no.x) + integer(tab_1.tabpage_1.dw_5.object.order_no.width))
	ls_colx6 = string(integer(tab_1.tabpage_1.dw_6.object.order_no.x) + integer(tab_1.tabpage_1.dw_6.object.order_no.width))
else
	if this.thirdstate = true then
		ls_colx5 = string(integer(tab_1.tabpage_1.dw_5.object.order_no.x) + integer(tab_1.tabpage_1.dw_5.object.order_no.width))
		ls_colx6 = "0"
	else
		ls_colx5 = "0"
		ls_colx6 = "0"
	end if
end if
tab_1.tabpage_1.dw_5.object.datawindow.horizontalscrollsplit = ls_colx5
tab_1.tabpage_1.dw_6.object.datawindow.horizontalscrollsplit = ls_colx6


end event

type cb_5 from commandbutton within tabpage_1
integer x = 3858
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

   st_horizontal1.visible = false 
   
	st_vertical.visible = true
	st_vertical.x       = dw5.x + dw5.width
	st_vertical.y       = dw5.y
	st_vertical.height  = dw5.height
	
	dw6.visible = true
	dw6.x       = st_vertical.x + st_vertical.width
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

   st_horizontal1.y    = dw5.y + dw5.height
	st_vertical.visible = false
	
	dw6.visible = true
	dw6.x       = dw5.x
	dw6.y       = st_horizontal1.y + st_horizontal1.height
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
	st_vertical.visible = false	
end if

end event

type cb_11 from commandbutton within tabpage_1
integer x = 3360
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
string text = "2)변환하기"
end type

event clicked;// 변환하기
string   ls_area, ls_orderno, ls_custno, ls_custname, ls_custpono, ls_custpotime, ls_ordertitle, ls_orderstatus
string   ls_message, ls_usermemo, ls_salesman
string   ls_scenecode, ls_scenename, ls_const, ls_sceneaddr1, ls_sceneaddr2
string   ls_telnocap1, ls_telno1, ls_telnocap2, ls_telno2, ls_estimate_no
string   ls_itemno, ls_itemname, ls_erpname, ls_qa, ls_uom, ls_color, ls_orderetc
datetime ldt_orderdate, ldt_custpodate, ldt_duedate
long     ll_thick, ll_width, ll_height, ll_length
decimal  ld_orderqty, ld_comqty
string   ls_qa1, ls_qa2, ls_qa3, ls_qa4, ls_shiptoaddr

string   ls_null, ls_userid, ls_vat, ls_locno
string   ls_shipcase, ls_shipamtcase
string   ls_colordet, ls_colorsw, ls_remdet

integer  iRet, li_int, li_Change
long     ll_tchk, ll_found, ll_row, ll_col, ll_status, ll_seq, ll_max, ll_allrow, ll_dw5cnt
long     numcols, numrows, iCol, iRow, iCnt

dec      ld_price, ld_vatamt, ld_totalamt, ld_fobamt[4]
dec      ld_orderamount, ld_orderamtvat, ld_orderamountvat

string   ls_saleno, ls_orderno_chk, ls_jupsuflag
datetime ldt_null, ldt_plandate, ldt_jupsudate
boolean  SWExit = True

// 듀얼창
tab_1.tabpage_1.cbx_dual.checked = true
tab_1.tabpage_1.cbx_dual.triggerevent( clicked! )

// 사업장
ls_area    = trim(dw_4.object.area[1])       
if isnull(ls_area) OR ls_area = "" then
	MessageBox("확인","사업장을 선택 하세요.")
	RETURN
end if 

// 저장소
SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :ls_area;

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

	///////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 웹 데이터 //////////////////////////////////////////////////////////////////////////////////////////////	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////	
	ls_orderno    = dw5.GetItemString(iRow,   "order_no")				// 주문번호
	ls_custno     = dw5.GetItemString(iRow,   "cust_no")				// 거래처
	ls_custname   = dw5.GetItemString(iRow,   "cust_name")			// 거래처명
	
	ldt_orderdate = dw5.GetItemDateTime(iRow, "order_date")			// 주문일자
	ls_orderno    = "WEB" + string(ldt_orderdate,"yymmdd") + "-" + RightA("000" + ls_orderno,3)
	ls_estimate_no= ls_orderno 												// 견적번호(Web주문번호)
	
	ls_custpono   = dw5.GetItemString(iRow,   "cust_po_no")     	// 발주서번호
	ls_ordertitle = dw5.GetItemString(iRow,   "order_title")			// 주문제목
	ls_orderstatus= dw5.GetItemString(iRow,   "order_status")		// 주문상태
	
	ls_message    = dw5.GetItemString(iRow,   "order_message")		// 전달사항
	ls_usermemo   = dw5.GetItemString(iRow,   "user_memo")			// 담당자메모
	ls_sceneaddr1 = dw5.GetItemString(iRow,   "scene_addr1")			// 현장주소1
	ls_sceneaddr2 = dw5.GetItemString(iRow,   "scene_addr2")			// 현장주소2
	ls_telnocap1  = dw5.GetItemString(iRow,   "telno_cap1")			// 인수자1
	ls_telno1     = dw5.GetItemString(iRow,   "tel_no1")				// 인수자1(연)
	ls_telnocap2  = dw5.GetItemString(iRow,   "telno_cap2")			// 인수자2
	ls_telno2     = dw5.GetItemString(iRow,   "tel_no2")				// 인수자2(연)
		
	ldt_custpodate= dw5.GetItemDateTime(iRow, "cust_po_date")		// 요구납기
	ls_custpotime = dw5.GetItemString(iRow,   "cust_po_time")		// 도착예정
	ldt_duedate   = dw5.GetItemDateTime(iRow, "due_date")				// 확정납기
	ls_scenecode  = dw5.GetItemString(iRow,   "scene_code")			// 현장번호
	ls_scenename  = dw5.GetItemString(iRow,   "scene_name")			// 현장명
	ls_const      = dw5.GetItemString(iRow,   "const_name")			// 건설사
	
	ll_seq        = dw5.GetItemNumber(iRow,   "seq_no")				// 주문내역번호
	ls_itemno     = dw5.GetItemString(iRow,   "item_no")				// 주문상품코드
	ls_itemname   = dw5.GetItemString(iRow,   "order_item_name")	// 상품명
	ls_erpname    = dw5.GetItemString(iRow,   "erp_name")				// 품명(ERP)
		
   ll_thick      = dw5.GetItemNumber(iRow,   "order_thick")			// 두께     
	ll_width      = dw5.GetItemNumber(iRow,   "order_width")			// 폭
	ll_height     = dw5.GetItemNumber(iRow,   "order_height")		// 높이
	ll_length     = dw5.GetItemNumber(iRow,   "order_length")		// 길이
	ls_colordet   = dw5.GetItemString(iRow,   "order_color")			// 색상
 //ls_uom        = dw5.GetItemString(iRow,   "order_uom")			// 단위

	ls_qa1        = RightA("000"   + string(ll_thick), 3)
	ls_qa2        = RightA("0000"  + string(ll_width), 4)
	ls_qa3        = RightA("0000"  + string(ll_height),4)
	ls_qa4        = RightA("00000" + string(ll_length),5)
	ls_qa         = ls_qa1 + "X" + ls_qa2 + "X" + ls_qa3 + "X" + ls_qa4
	
	ld_orderqty   = dw5.GetItemDecimal(iRow,  "order_qty")			// 주문수량
	ls_orderetc   = ls_custpotime + "|"										// 도착예정
	ls_orderetc  += dw5.GetItemString(iRow,   "order_etc")			// 비고
   ls_remdet     = dw5.GetItemString(iRow,   "order_etc")			// 비고

	// 주문상태
	if ls_orderstatus = "접수" then
		//
	else
		dw5.SetItem(iRow, "chk", "S")
		dw5.SetItem(iRow, "err_text", "10)접수상태가 아님")		// SKIP
		CONTINUE
	end if
	
	if isnull(ldt_custpodate) then
		dw5.SetItem(iRow, "chk", "Y")
		dw5.SetItem(iRow, "err_text", "20)발주번호(NULL)")
		CONTINUE
	end if
	
	if isnull(ls_itemno) OR ls_itemno = "" then 
		dw5.SetItem(iRow, "chk", "Y")
		dw5.SetItem(iRow, "err_text", "30)ERP코드(NULL,'')")
		CONTINUE
	end if
	if isnull(ls_qa)     OR ls_qa = "XXX"  then
		if isnull(ls_qa1) then
			dw5.SetItem(iRow, "chk", "Y")
			dw5.SetItem(iRow, "err_text", "40)규격1(NULL,'XXX')")
			CONTINUE
		elseif isnull(ls_qa2) then
			dw5.SetItem(iRow, "chk", "Y")
			dw5.SetItem(iRow, "err_text", "40)규격2(NULL,'XXXX')")
			CONTINUE
		elseif isnull(ls_qa3) then
			dw5.SetItem(iRow, "chk", "Y")
			dw5.SetItem(iRow, "err_text", "40)규격3(NULL,'XXXX')")
			CONTINUE
		elseif isnull(ls_qa4) then
			dw5.SetItem(iRow, "chk", "Y")
			dw5.SetItem(iRow, "err_text", "40)규격4(NULL,'XXXXX')")
			CONTINUE
		end if			
	end if
	
	SELECT cust_no, salesman INTO :ls_custno, :ls_salesman
	  FROM customer 
	 WHERE cust_name = :ls_custname;
	if isnull(ls_custno) OR ls_custno = "" then 
		dw5.SetItem(iRow, "chk", "Y")
		dw5.SetItem(iRow, "err_text", "50)거래처명 미등록["+ls_custname+"]")
		CONTINUE
	end if
	
	//
	if isnull(ls_scenename) then ls_scenename = ""
	if isnull(ls_const) OR ls_const = "직발주" then ls_const = ""
	
	ls_scenename  = ls_scenename + "/" + ls_const
	
	SELECT scene_code INTO :ls_scenecode 
	  FROM scene 
	 WHERE cust_no = :ls_custno AND scene_desc = :ls_scenename;
	if isnull(ls_scenecode) OR ls_scenecode = "" OR LenA(ls_scenecode) <> 11 then
		dw5.SetItem(iRow, "chk", "Y")
		dw5.SetItem(iRow, "err_text", "60)현장명/건설사 미등록["+ls_scenename+"]")
		CONTINUE
	end if
	
	//
	SELECT uom INTO :ls_uom FROM groupitem WHERE item_no = :ls_itemno;
	
	SELECT top 1 dbo.UF_GetCustPRICE( :ls_custno, :ls_itemno, :ls_qa ) INTO :ld_price FROM login;
	if isnull(ld_price) then
		//dw5.SetItem(iRow, "chk", "Y")
		dw5.SetItem(iRow, "err_text", "70)단가 미등록["+ls_custno+"|"+ls_itemno+"|"+ls_qa+"]")
		//CONTINUE
	end if
	
	SELECT top 1 dbo.UF_GetQTY( :ls_itemno, :ls_qa, :ls_uom, :ld_orderqty ) INTO :ld_comqty FROM login;
	if isnull(ld_comqty) then ld_comqty = 0						// 환산수량
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////	
	iCnt  = iCnt + 1		

	// 주문헤더
	dw6.object.chk[iCnt]            = "N"							// 품목+규격 CHK
	dw6.object.order_no[iCnt]       = ls_orderno					// 주문번호
	dw6.object.cust_no[iCnt]        = ls_custno					// 거래처
	dw6.object.scene_code[iCnt]     = ls_scenecode				// 현장

	dw6.object.order_date[iCnt]     = ldt_orderdate				// 주문일자
	dw6.object.due_date[iCnt]       = ldt_duedate				// 납기일자
	dw6.object.estimate_no[iCnt]    = ls_estimate_no			// 견적번호
	dw6.object.sale_flag[iCnt]      = "D"							// 수주유형(내수:D, 수출:E, LC:L)
	dw6.object.curr_code[iCnt]      = "WON"						// 통화코드
	dw6.object.cust_po_no[iCnt]     = ls_custpono				// 발주서번호
	dw6.object.cust_po_date[iCnt]   = ldt_custpodate			// 요구납기
//	dw6.object.ship_flag[iCnt]      = 								// 운송방법(d_shipflag_c: 부담:B,착불:C,대여:D)
	dw6.object.fob[iCnt]            = "외상"						// 결재방법
	
	dw6.object.salesman[iCnt]       = ls_salesman				// 영업사원
	dw6.object.confirm_flag[iCnt]   = "N"						   // 확정유무(등록:N, 수주:T, 생산:Y)
	dw6.object.confirm_user[iCnt]   = ls_null						// 확정자
	dw6.object.confirm_date[iCnt]   = ldt_null					// 확정일자

	dw6.object.open_close[iCnt]     = "O"							// 마감구분(마감:C, 오픈:O)
//	dw6.object.close_type[iCnt]     = 								// 마감유형(자동:A, 수동:M)
//	dw6.object.close_date[iCnt]     = 								// 마감일자

	if isnull(ls_sceneaddr1) then ls_sceneaddr1 = ""
	if isnull(ls_sceneaddr2) then ls_sceneaddr2 = ""	
	ls_shiptoaddr  = ls_sceneaddr1 + " " + ls_sceneaddr2	
	dw6.object.shipto_addr[iCnt]    = ls_shiptoaddr				// 운송처주소
	
	dw6.object.rem[iCnt]            = ls_message					// 특기사항
	dw6.object.rem1[iCnt]           = ls_usermemo				// 특기사항1
	dw6.object.rem2[iCnt]           = ""							// 특기사항2
//	dw6.object.revision_no[iCnt]    = 								// 변경횟수
//	dw6.object.revision_date[iCnt]  = 								// 최종변경일자
	dw6.object.input_date[iCnt]     = ldt_orderdate				// 주문입력일자
	dw6.object.login_id[iCnt]       = gs_userid					// 입력자
	dw6.object.tel_no[iCnt]         = ls_telno1					// 연락처
	dw6.object.ship_case[iCnt]      = ls_shipcase				// 운송수단
	dw6.object.plan_date[iCnt]      = ldt_plandate				// 조정납기
	dw6.object.shipamt_case[iCnt]   = ls_shipamtcase			// 운반비형태(현금:C, 외상:R)
	dw6.object.area_no[iCnt]        = ls_area						// 지역
//	dw6.object.ysp_confirm[iCnt]    = 								// YSP수주접수유무
	dw6.object.ysp_qty[iCnt]        = 0								// 단면
	dw6.object.color[iCnt]          = ls_color					// 색상
//	dw6.object.type[iCnt]           = 								// 유형
//	dw6.object.class[iCnt]          = 								// THIN
	dw6.object.ysp_qty2[iCnt]       = 0								// 양면
//	dw6.object.jupsu_flag[iCnt]     = 								// 접수유무
//	dw6.object.jupsu_date[iCnt]     = 								// 접수일자
//	dw6.object.sale_no[iCnt]        = 								// ERP주문번호

	// 주문상세
	dw6.object.order_no1[iCnt]      = ls_orderno					// 주문번호
	dw6.object.seq_no[iCnt]         = ll_seq						// 주문순번
	dw6.object.item_no[iCnt]        = ls_itemno					// 물품번호
	dw6.object.item_nm[iCnt]        = ls_itemname				// 주문상품명
	dw6.object.erp_name[iCnt]       = ls_erpname					// 품명(ERP)
	dw6.object.qa[iCnt]             = ls_qa						// 규격
//	dw6.object.qa_cust[iCnt]        = ls_null					   // 송장규격(사용안함)
	dw6.object.uom[iCnt]            = ls_uom						// 단위
	dw6.object.order_qty[iCnt]      = ld_orderqty				// 주문수량
	dw6.object.price[iCnt]          = ld_price					// 가격
	dw6.object.acc_qty[iCnt]        = ld_comqty					// 환산수량

	ld_totalamt   = ld_comqty * ld_price							// 공급가액
	ld_vatamt     = (ld_comqty * ld_price)	/ 10 					// 부가세액
	if ld_vatamt > 0 then ls_vat = "Y"
	
	dw6.object.tax_sign[iCnt]       = ls_vat						// 부가세
	dw6.object.sale_tax[iCnt]       = ld_vatamt				   // 세액
	dw6.object.sale_amount[iCnt]    = ld_totalamt				// 공급가액
	
	if ls_uom = "M" then
		dw6.object.price_m[iCnt]     = ld_totalamt /	ld_comqty// 가격(M)
	else
		dw6.object.price_m[iCnt]     = 0.00
	end if
		

//	dw6.object.saledet_text[iCnt]   = 								// 생산계획여부
//	dw6.object.action[iCnt]         = 								// 조치
//	dw6.object.sol_qty[iCnt]        = 								// 가용량
	dw6.object.loc_no[iCnt]         = ls_locno					// 저장소번호
//	dw6.object.issue_qty[iCnt]      = 								// 선정수량
//	dw6.object.rlse_date[iCnt]      = 								// 최종출고일자
//	dw6.object.rlse_qty[iCnt]       = 								// 출고수량
	dw6.object.remdet[iCnt]         = ls_remdet					// 품목비고
//	dw6.object.plan_qty[iCnt]       = 								// 생산계획수량
//	dw6.object.plan_close[iCnt]     = 								// 생산완료시점
	dw6.object.colordet[iCnt]       = ls_colordet				// 품목색상
//	dw6.object.price_be[iCnt]       = 								// 기존단가
//	dw6.object.do_rem[iCnt]         = 								// 거래명세서비고
//	dw6.object.stock_qty[iCnt]      = 								// 장기재고출고
//	dw6.object.stock_issue[iCnt]    = 								// 장기재고출고의뢰
//	dw6.object.stock_do[iCnt]       = 								// 장기재고출고
//	dw6.object.price_last[iCnt]     = 								// 최근단가
//	dw6.object.danjung[iCnt]        = 								// 단중
//	dw6.object.jungrang[iCnt]       = 								// 중량
//	dw6.object.chulgo_qty[iCnt]     = 								// 출고의뢰수량(사용안함)
next

hpb_1.position = 100
hpb_1.visible  = false

dw6.setredraw( true )
this.enabled = true

///////////////////////////////////////////////////////////////////////////////////
// 웹주문 중복체크
///////////////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw6.rowcount()
	setnull(ls_saleno) ; setnull(ls_orderno_chk) 
	setnull(ls_jupsuflag) ; setnull(ldt_jupsudate)

	ls_orderno = dw6.object.order_no[ll_row]
	if isnull(ls_orderno) OR ls_orderno = "" then
		//
	else
		SELECT sale_no, order_no, jupsu_flag, input_date 
		  INTO :ls_saleno, :ls_orderno_chk, :ls_jupsuflag, :ldt_jupsudate
		  FROM saleshop
		 WHERE order_no = :ls_orderno;
		if isnull(ls_saleno) OR ls_saleno = "" then		// 웹 미접수상태
			if isnull(ls_orderno_chk) OR ls_orderno_chk = "" then
				// 웹 주문관리 저장되지 않은 데이터
			else
				// 웹 주문관리 중복되는 데이터(saleshop)
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

//if MessageBox("확인", "계속해서 거래처,품목,규격,단위를 CHECK 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then 
	WF_ItemQA_Check()	
//end if

if dw6.rowcount() > 0 then
	ll_tchk = dw6.object.tchk[1]
	
	if dw6.rowcount() <> ll_tchk then	
		ll_found = dw6.find( "chk = 'N'", 1, dw6.rowcount() )
		dw6.scrolltorow( ll_found )
		MessageBox("확인",string(dw6.rowcount() - ll_tchk,"#,##0") + " 건의 오류 데이터가(거래처,품목,규격,단위) 발생했습니다.")
	else
		MessageBox("확인", string(iCnt,"#,##0") + " 행 변환작업을 완료 하였습니다.~n~n" + &
		           "주문장 탭에서 '3)변환데이터 가져오기' 를 클릭하시기 바랍니다.")
	end if

	tab_1.tabpage_4.cb_xls2dw.enabled = true		// 변환데이터 가져오기
end if

end event

type cb_10 from commandbutton within tabpage_1
integer x = 2697
integer y = 12
integer width = 654
integer height = 84
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "1)엑셀 붙여넣기"
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
		ls_itemno = dw5.object.item_no[ll_row]
		
		if isnull(ls_itemno) OR ls_itemno = "" then
			//
		else
			SELECT rtrim(item_name) INTO :ls_itemnm FROM groupitem WHERE item_no = :ls_itemno;
			dw5.object.erp_name[ll_row] = ls_itemnm
		end if
	next
	
	cb_11.enabled = true	
	MessageBox("확인","웹 데이터 가져오기 완료" )
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
integer y = 1160
integer width = 4608
integer height = 696
integer taborder = 60
boolean bringtotop = true
string title = "엑셀변환창"
string dataobject = "d_orsale_webing"
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
is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull( row ) OR row < 1 then RETURN

this.scrolltorow( row )

string ls_orderno
long   ll_found, ll_seq

ls_orderno = dw6.object.order_no[row] 
ll_seq     = dw6.object.seq_no[row] 
ll_found   = dw5.find( "order_no = '" + ls_orderno + "' AND seq_no = " + string(ll_seq), 1, dw5.rowcount() )
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

type dw_5 from datawindow within tabpage_1
integer y = 176
integer width = 4608
integer height = 940
integer taborder = 60
boolean bringtotop = true
string title = "엑셀창"
string dataobject = "d_orsale_webimport"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN
this.scrolltorow( row )

//
string ls_orderno
long   ll_found, ll_seq

if cbx_dual.checked = true then
	ls_orderno = dw5.object.order_no[row] 
	ll_seq     = dw5.object.seq_no[row] 
	ll_found   = dw6.find( "order_no = '" + ls_orderno + "' AND seq_no = " + string(ll_seq), 1, dw6.rowcount() )
	if ll_found > 0 then
		dw6.scrolltorow( ll_found )
	end if
end if

//// 멀티라인 선택
//long ll_selrow, ll_rtn
//
//if This.rowcount() > 0 AND row > 0 then
//	if KeyDown(KeyShift!) then
//		ll_selrow = This.GetSelectedRow(0)
//
//		if ll_selrow > 0 then
//			for ll_rtn = Min(ll_selrow,row) TO Max(ll_selrow,row)
//				This.Selectrow(ll_rtn,True)
//			next
//		end if
//
//	elseif KeyDown(KeyControl!) then
//		if This.IsSelected(row) then
//			This.SelectRow(row,False)
//		else
//			This.SelectRow(row,True)
//		end if
//
//	elseif This.IsSelected(row) then        
//
//	elseif Not This.IsSelected(row) then
//		This.SelectRow(0,  False)
//		This.SelectRow(row,True)
//	end if     
//end if

/*
// DataWindow column 곗수

dw_rpt.modify('datawindow.crosstab.staticmode=yes')

long(dw_rpt.describe('datawindow.column.count')) 

이런식으로 쓰면된다고 하고 ...

string colname, colvariable int i, icount 
icount = integer(dw_1.describe('DataWindow.Column.Count')) 

for i = 1 TO icount
   colvariable = '#'+string(i)+'.name'
   colname     = dw_1.describe(colvariable)   // #1.name, #2.name, etc
   Messagebox ('Information', 'Column name of column #' + string (i) + ' is ' + colname)  
next

이런식으로 column의 이름을 가져올수있다고 한다~ 
늘 느끼기는 거지만 이런거보면 c#은 참~~~ 잘만들져있는거 같단말야...
롤을  접어야 코딩을 공부하든 딴걸 보든 할껀데...


// Columns 존재 유무 체크
string ls_test, ls_column, ls_result

ls_column = 'colname'
ls_column = 'report_copies'

//Check the column.id property.
// Describe returns the number of the column if the column exists.
// Describe returns an exclamation point (!) if the column doesn't exist.
ls_test =dw_order.Describe(ls_column+'.id' )

if ls_test = '!' then
	ls_result = ls_column + ' (id='+ ls_test + ') ' + ': Column does not exist.'
else
	ls_result = ls_column + ' (id='+ ls_test + ') ' + ': Column exists.'
end if

MessageBox ('Testing', ls_result )


// 파워빌더의 이벤트중에 dwo가 필요할때...
dwobject lo_dwo

lo_dwo = dw.object.__get_attribute( "필드명", true) ;

*/

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

type st_vertical from u_splitbar_vertical within tabpage_1
integer x = 2386
integer y = 724
end type

type ddlb_op from dropdownlistbox within tabpage_1
integer x = 914
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
string binarykey = "w_orsale_weborder.win"
end type

event navigatecomplete2;call super::navigatecomplete2;//
ddlb_url.additem( url )
//tab_1.tabpage_3.mle_response.text = ole_browser.of_getsource()
end event

event documentcomplete;call super::documentcomplete;//
//ddlb_url.text = url
//tab_1.tabpage_3.mle_response.text = ole_browser.of_getsource()

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
st_7 st_7
st_5 st_5
st_3 st_3
em_cnt em_cnt
em_saleno em_saleno
cb_sale cb_sale
st_horizontal2 st_horizontal2
cb_3 cb_3
cbx_chk cbx_chk
cb_xls2dw cb_xls2dw
rb_2 rb_2
rb_1 rb_1
cbx_3 cbx_3
dw_8 dw_8
dw_7 dw_7
end type

on tabpage_4.create
this.st_7=create st_7
this.st_5=create st_5
this.st_3=create st_3
this.em_cnt=create em_cnt
this.em_saleno=create em_saleno
this.cb_sale=create cb_sale
this.st_horizontal2=create st_horizontal2
this.cb_3=create cb_3
this.cbx_chk=create cbx_chk
this.cb_xls2dw=create cb_xls2dw
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_3=create cbx_3
this.dw_8=create dw_8
this.dw_7=create dw_7
this.Control[]={this.st_7,&
this.st_5,&
this.st_3,&
this.em_cnt,&
this.em_saleno,&
this.cb_sale,&
this.st_horizontal2,&
this.cb_3,&
this.cbx_chk,&
this.cb_xls2dw,&
this.rb_2,&
this.rb_1,&
this.cbx_3,&
this.dw_8,&
this.dw_7}
end on

on tabpage_4.destroy
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.em_cnt)
destroy(this.em_saleno)
destroy(this.cb_sale)
destroy(this.st_horizontal2)
destroy(this.cb_3)
destroy(this.cbx_chk)
destroy(this.cb_xls2dw)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_3)
destroy(this.dw_8)
destroy(this.dw_7)
end on

type st_7 from statictext within tabpage_4
integer x = 2999
integer y = 12
integer width = 233
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수주번호"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_4
integer x = 3639
integer y = 12
integer width = 110
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "장"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_4
integer x = 2551
integer y = 64
integer width = 439
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "수주장 복사"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_cnt from editmask within tabpage_4
integer x = 3621
integer y = 64
integer width = 165
integer height = 92
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
string minmax = "1~~150"
end type

event getfocus;//
this.SelectText(1, LenA(this.text) )

end event

type em_saleno from editmask within tabpage_4
integer x = 2999
integer y = 64
integer width = 613
integer height = 92
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "HD20140420001"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
end type

event getfocus;//
this.SelectText(9,6)

end event

type cb_sale from commandbutton within tabpage_4
integer x = 3799
integer y = 28
integer width = 590
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주장 복사하기"
end type

event clicked;// 수주장 가져오기
string   ls_orderno, ls_sdate, ls_edate, ls_saleno, ls_null
string ls_order
long     ll_row, ll_seq, ll_cnt
datetime ldt_null

if MessageBox("확인","'수주장 가져오기' 계속 진행 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then RETURN

setnull( ls_null) ; setnull(ldt_null)

//
ls_orderno  = em_saleno.text
ll_cnt      = long(em_cnt.text)

if ll_cnt > 150 then 
	MessageBox("확인","150장 이상은 처리 불가능 합니다.")
	RETURN
end if

// 번호생성 WEB170317-108 
// SELECT max(order_no) INTO :ls_saleno FROM saleshop WHERE order_no LIKE 'CO%'; 2017.10.16일까지 사용
// 번호생성 수정 작성일: 2017.10.17일 수정자:조원석

	ls_order = "CO"+LeftA(gs_area,1)+"D"+string(GF_Today(),"yymmdd");
	SELECT max(order_no) INTO :ls_saleno FROM saleshop
	WHERE LEFT(ORDER_NO,10) like :ls_order;

if isnull(ls_saleno) OR ls_saleno = "" OR RightA(ls_saleno,3) = "999" then
	ls_saleno  = "CO"+LeftA(gs_area,1)+"D"+string(GF_Today(),"yymmdd")+"-001"	
else
	ll_seq     = long(RightA(ls_saleno,3))
	ls_saleno  = LeftA(ls_saleno,11) + RightA("000"+string(ll_seq),3)
end if

//
for ll_row = 1 to ll_cnt
	ll_seq     = long(RightA(ls_saleno,3)) + 1
	ls_saleno  = LeftA(ls_saleno,11) + RightA("000"+string(ll_seq),3)
	
	/* 2017.11.07 조원석 telno_cap 추가 */
	INSERT INTO saleshop (order_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code
		  , cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date
		  , tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr,   rem
		  , revision_no, revision_date, input_date, login_id,    tel_no,   ship_case,   rem1,   rem2
		  , plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2, jupsu_flag, telno_cap )
		  
	SELECT :ls_saleno, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code
		  , cust_po_no, cust_po_date, ship_flag, fob, salesman, 'N',        :ls_null,       :ldt_null
		  , tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr,   rem
		  , 0,         getdate(),    getdate(),     :gs_userid,  tel_no,   ship_case,   rem1,   rem2
		  , plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2, 'N', telno_cap
	  FROM sale
	 WHERE order_no = :ls_orderno;
	if sqlca.sqlcode = 0 then
		// SALESHOPDET
		INSERT INTO saleshopdet (order_no, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text
			  , action, sol_qty, loc_no,   issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color
			  , price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang)
			  
		SELECT :ls_saleno, seq_no, item_no, qa, uom, order_qty, price, acc_qty, 'N'
			  , action, 0,       :ls_null, 0,         :ldt_null, 0,        rem, 0,        :ls_null, color
			  , price_be, do_rem, 0,         0,           0,        price_last, danjung, jungrang 
		  FROM saledet
		 WHERE order_no = :ls_orderno;	
		if sqlca.sqlcode = 0 then
			COMMIT;
		else
			ROLLBACK;
			MessageBox("확인", "수주장(상세) 오류가 발생했습니다.~r~n요청번호: " + ls_orderno)
			RETURN
		end if
	else
		ROLLBACK;
		MessageBox("확인", "수주장(헤더) 오류가 발생했습니다.~r~n요청번호: " + ls_orderno)
		RETURN
	end if
next

//
MessageBox("확인","'수주장 복사하기' 저장완료.~n~nWeb 접수관리에서 수주로 변경하시기 바랍니다.")
pb_retrieve.triggerevent( clicked! )

end event

type st_horizontal2 from u_splitbar_horizontal within tabpage_4
integer y = 1004
integer width = 4608
end type

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
string text = "3)변환데이터 가져오기"
end type

event clicked;// 변환데이터 가져오기
// saleshop, saleshopdet 가져오기
string   ls_area, ls_not_orderno[], ls_not_order, ls_orderno, ls_jupsuflag, ls_orderno_chk
string   ls_custno, ls_scenecode, ls_colordet, ls_error		// 거래처, 현장
long     ll_row, ll_dw5cnt, ll_dw7cnt, ll_dw8cnt, ll_seqno
decimal  ld_tax, ld_amount
datetime ldt_today, ldt_jupsudate, ldt_orderdate
boolean  lb_true

ldt_today = GF_Today()

setnull( ls_orderno ) ; setnull( ll_seqno )
ld_tax = 0 ; ld_amount = 0

if dw6.rowcount() < 1 then
	MessageBox("확인","웹 변환데이터가 존재하지 않습니다.")
	RETURN
end if

this.enabled = false				// 가져오기잠금
ib_retrieve  = false				// 데이터가져오기

///////////////////////////////////////////////////////////////////////////////////
// 엑셀변환 데이터(dw6) ==> dw7(saleshop), dw8(saleshopdet) INSERT하기
///////////////////////////////////////////////////////////////////////////////////
dw7.reset() ; dw8.reset()

dw7.SetReDraw( false )		// saleshop		
dw8.SetReDraw( false )		// saleshopdet

dw_4.accepttext()
ls_area  = dw_4.object.area[1]

// SKIP대상 저장
for ll_row = 1 to dw5.rowcount()
	ls_error = LeftA(dw5.object.err_text[ll_row],2)
	
	// "10)주문상태(접수)가 아님"
	// "20)발주번호(NULL)"
	// "30)ERP코드(NULL)"
	// "40)규격1(NULL,'XXX')"
	// "40)규격2(NULL,'XXXX')"
	// "40)규격3(NULL,'XXXX')"
	// "40)규격4(NULL,'XXXXX')"
	// "50)거래처명 미등록"
	// "60)현장명/건설사 미등록"
	// "70)단가 미등록"
	
	choose case ls_error
		case "10" to "60"
			ll_dw5cnt  = ll_dw5cnt + 1
	
			ls_not_order  = dw5.GetItemString(ll_row,   "order_no")				// 주문번호
			ldt_orderdate = dw5.GetItemDateTime(ll_row, "order_date")			// 주문일자
			ls_not_order  = "WEB" + string(ldt_orderdate,"yymmdd") + "-" + RightA("000" + ls_not_order,3)
	
			ls_not_orderno[ll_dw5cnt] = ls_not_order
	end choose
next

for ll_row = 1 to dw6.rowcount()
	// SKIP 대상
	for ll_dw5cnt = 1 to UpperBound(ls_not_orderno)
		ls_not_order = dw6.object.order_no[ll_row]
		
		if ls_not_orderno[ll_dw5cnt] = ls_not_order then
			lb_true = true
			CONTINUE
		end if
	next
	if lb_true = true then
		lb_true = false
		CONTINUE
	end if
	
	// 중복유무
	ls_jupsuflag = dw6.object.jupsu_flag[ll_row]
	
	if ls_jupsuflag = "Y" then	CONTINUE
	
	// 최초한번만 실행
	if isnull(ls_orderno) then		
		ls_orderno = dw6.object.order_no[ll_row]

		ll_dw7cnt = dw7.insertrow( 0 )	
		
		dw7.object.order_no[ll_dw7cnt]     = dw6.object.order_no[ll_row]		// 주문번호
		dw7.object.cust_no[ll_dw7cnt]      = dw6.object.cust_no[ll_row]		// 거래처
		dw7.object.scene_code[ll_dw7cnt]   = dw6.object.scene_code[ll_row]	// 현장
	
		dw7.object.order_date[ll_dw7cnt]   = dw6.object.order_date[ll_row]	// 주문일자
		dw7.object.cust_po_date[ll_dw7cnt] = dw6.object.cust_po_date[ll_row] // 요구납기
		dw7.object.due_date[ll_dw7cnt]     = dw6.object.due_date[ll_row]     // 확정납기
		if isnull(dw7.object.due_date[ll_dw7cnt]) then
			dw7.object.due_date[ll_dw7cnt]  = dw6.object.cust_po_date[ll_row] // 확정납기가 NULL 이면 요구납기 MOVE
		end if
		
		dw7.object.cust_po_no[ll_dw7cnt]   = dw6.object.cust_po_no[ll_row]   // 고객발주번호(SHOPyymmdd-###)
		dw7.object.estimate_no[ll_dw7cnt]  = dw6.object.estimate_no[ll_row]  // 견적번호(Web주문번호)

		dw7.object.sale_flag[ll_dw7cnt]    = dw6.object.sale_flag[ll_row]		// 수주유형
		dw7.object.shipto_addr[ll_dw7cnt]  = dw6.object.shipto_addr[ll_row]	// 운송처주소
		dw7.object.curr_code[ll_dw7cnt]    = "WON"									// 통화코드
		dw7.object.fob[ll_dw7cnt]          = dw6.object.fob[ll_row]				// 결재
		dw7.object.salesman[ll_dw7cnt]     = dw6.object.salesman[ll_row]		// 영업사원
		dw7.object.confirm_flag[ll_dw7cnt] = dw6.object.confirm_flag[ll_row]	// 확정
		dw7.object.rem[ll_dw7cnt]          = dw6.object.rem[ll_row]				// 특기사항
		dw7.object.rem1[ll_dw7cnt]         = dw6.object.rem1[ll_row]			// 특기사항1
		dw7.object.rem2[ll_dw7cnt]         = dw6.object.rem2[ll_row]			// 특기사항2
		dw7.object.area_no[ll_dw7cnt]      = dw6.object.area_no[ll_row]		// 사업장(선택)
      dw7.object.login_id[ll_dw7cnt]     = GS_userid								//	입력자
		dw7.object.tel_no[ll_dw7cnt]       = dw6.object.tel_no[ll_row]			// 연락처
	
		dw7.object.ship_flag[ll_dw7cnt]    = "D"										// 운송방법(C:착불, D:대여, B:부담)
		dw7.object.open_close[ll_dw7cnt]   = "O"										// 마감(C:마감, O:오픈)
		dw7.object.revision_no[ll_dw7cnt]  = 0											// 변경횟수
		dw7.object.revision_date[ll_dw7cnt]= ldt_today								// 최종변경일	
		dw7.object.input_date[ll_dw7cnt]   = ldt_today								// 주문입력일
	
		dw7.object.jupsu_flag[ll_dw7cnt]   = "N"										// 접수,미접수
	end if
	
	// 헤더
	if ls_orderno <> dw6.object.order_no[ll_row] then
		//if ld_tax = 0 then
		//	dw7.object.tax_sign[ll_dw7cnt]     = "N"		   // 부가세
		//else
			dw7.object.tax_sign[ll_dw7cnt]     = "Y"		   // 부가세
		//end if
		dw7.object.sale_tax[ll_dw7cnt]	  = ld_tax			// 세액
		dw7.object.sale_amount[ll_dw7cnt]  = ld_amount		// 공급가액
		ld_tax = 0 ; ld_amount = 0
		
		
		ls_orderno = dw6.object.order_no[ll_row]

		ll_dw7cnt = dw7.insertrow( 0 )				

		dw7.object.order_no[ll_dw7cnt]     = ls_orderno		
		dw7.object.cust_no[ll_dw7cnt]      = dw6.object.cust_no[ll_row]		// 거래처
		dw7.object.scene_code[ll_dw7cnt]   = dw6.object.scene_code[ll_row]	// 현장

		dw7.object.order_date[ll_dw7cnt]   = dw6.object.order_date[ll_row]	// 주문일자
		dw7.object.cust_po_date[ll_dw7cnt] = dw6.object.cust_po_date[ll_row] // 요구납기
	   dw7.object.due_date[ll_dw7cnt]     = dw6.object.due_date[ll_row]     // 확정납기
		if isnull(dw7.object.due_date[ll_dw7cnt]) then
			dw7.object.due_date[ll_dw7cnt]  = dw6.object.cust_po_date[ll_row] // 확정납기가 NULL 이면 요구납기 MOVE
		end if

		dw7.object.cust_po_no[ll_dw7cnt]   = dw6.object.cust_po_no[ll_row]   // 고객발주번호(SHOPyymmdd-###)
		dw7.object.estimate_no[ll_dw7cnt]  = dw6.object.estimate_no[ll_row]  // 견적번호(Web주문번호)

		dw7.object.sale_flag[ll_dw7cnt]    = dw6.object.sale_flag[ll_row]		// 수주유형
		dw7.object.shipto_addr[ll_dw7cnt]  = dw6.object.shipto_addr[ll_row]	// 운송처주소
		dw7.object.curr_code[ll_dw7cnt]    = "WON"									// 통화코드
		dw7.object.fob[ll_dw7cnt]          = dw6.object.fob[ll_row]				// 결재
		dw7.object.salesman[ll_dw7cnt]     = dw6.object.salesman[ll_row]		// 영업사원
		dw7.object.confirm_flag[ll_dw7cnt] = dw6.object.confirm_flag[ll_row]	// 확정
		dw7.object.rem[ll_dw7cnt]          = dw6.object.rem[ll_row]				// 특기사항
		dw7.object.rem1[ll_dw7cnt]         = dw6.object.rem1[ll_row]			// 특기사항1
		dw7.object.rem2[ll_dw7cnt]         = dw6.object.rem2[ll_row]			// 특기사항2
		dw7.object.area_no[ll_dw7cnt]      = dw6.object.area_no[ll_row]		// 사업장(선택)
      dw7.object.login_id[ll_dw7cnt]     = GS_userid								//	입력자
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
	
	dw8.object.order_no[ll_dw8cnt]    = dw6.object.order_no[ll_row]			// 주문번호
	dw8.object.seq_no[ll_dw8cnt]      = dw6.object.seq_no[ll_row]				// 순번
	dw8.object.item_no[ll_dw8cnt]     = dw6.object.item_no[ll_row]				// 품목
	dw8.object.qa[ll_dw8cnt]          = dw6.object.qa[ll_row]					// 규격
	dw8.object.uom[ll_dw8cnt]         = dw6.object.uom[ll_row]					// 단위
	
	ls_colordet = dw6.object.colordet[ll_row]
	SELECT color_code INTO :ls_colordet FROM color WHERE color_name = :ls_colordet;
	dw8.object.color[ll_dw8cnt]       = ls_colordet                         // 색상
	
	dw8.object.order_qty[ll_dw8cnt]   = dw6.object.order_qty[ll_row]			// 주문수량
	if dw6.object.uom[ll_row] = "M" then
		if isnull(dw6.object.price_m[ll_row]) then
			dw8.object.price[ll_dw8cnt] = 0
		else
			dw8.object.price[ll_dw8cnt] = dw6.object.price_m[ll_row]				// 단가(M)
		end if
	else
		if isnull(dw6.object.price[ll_row]) then
			dw8.object.price[ll_dw8cnt] = 0
		else
			dw8.object.price[ll_dw8cnt] = dw6.object.price[ll_row]				// 단가
		end if
	end if
	dw8.object.acc_qty[ll_dw8cnt]     = dw6.object.acc_qty[ll_row]				// 환산수량
	dw8.object.rem[ll_dw8cnt]         = dw6.object.remdet[ll_row]				// 품목비고 

	dw8.object.saledet_text[ll_dw8cnt]  = "N"											// 계획여부
	dw8.object.sol_qty[ll_dw8cnt]       = 0											// 가용량
	dw8.object.issue_qty[ll_dw8cnt]     = 0											// 선정수량
	dw8.object.rlse_qty[ll_dw8cnt]      = 0											// 출고수량

	// 구분, 폭, 비중, 중량, 단중
	string  ls_cat, ls_itemno, ls_qa, ls_uom
	decimal ldc_width, ldc_rate, ldc_heft, ldc_weight
	real    lr_orderqty, lr_dan, lr_jung
	
	ls_itemno   = dw8.object.item_no[ll_dw8cnt]
	ls_qa       = dw8.object.qa[ll_dw8cnt]
	ls_uom      = dw8.object.uom[ll_dw8cnt]
	lr_orderqty = dw8.object.order_qty[ll_dw8cnt]	
	
	if ls_uom = "M" then
		// 생산관리 - 품목별 코일규격관리에서 등록함
		SELECT top 1 gbn = substring(itemcoil.coil_item,3,1), itemcoil.width, itemcoil.weight
		  INTO :ls_cat, :ldc_width, :ldc_weight
		  FROM itemcoil
		 WHERE item_no = :ls_itemno AND qa = left(:ls_qa, 13);

		SELECT top 1 (case when :ls_cat = 'A' then al_rate
								 when :ls_cat = 'S' then st_rate
								 else ''
						  end)
		  INTO :ldc_rate
		  FROM globals;

		if ldc_weight > 0 then
			lr_dan  = ldc_weight * ldc_rate
			lr_jung = ldc_weight * ldc_rate * long(lr_orderqty)
		else
			lr_dan  = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate
			lr_jung = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate * long(lr_orderqty)
		end if
		dw8.object.danjung[ll_dw8cnt]  = truncate(lr_dan  * 0.000001 + 0.0000001, 2)
		dw8.object.jungrang[ll_dw8cnt] = truncate(lr_jung * 0.000001 + 0.0000001, 2)			

	elseif ls_uom = "EA" then
		// 물품코드관리-단위당 중량 설정한 item
		SELECT top 1 heft INTO :ldc_heft
		  FROM item
		 WHERE item_no = :ls_itemno AND qa = :ls_qa AND uom = :ls_uom;

		lr_dan  = ldc_heft
		lr_jung = ldc_heft * long(lr_orderqty)
		dw8.object.danjung[ll_dw8cnt]  = lr_dan
		dw8.object.jungrang[ll_dw8cnt] = lr_jung
	end if      

	// 공급가액, 세액
	if isnull(dw6.object.sale_tax[ll_row]) then 
		ld_tax = 0
	else
		ld_tax    = ld_tax    + dw6.object.sale_tax[ll_row]				// 세액
	end if
	
	if isnull(dw6.object.sale_amount[ll_row]) then
		ld_amount = 0
	else
		ld_amount = ld_amount + dw6.object.sale_amount[ll_row]			// 공급가액	
	end if
next

dw7.SetReDraw( true )
dw8.SetReDraw( true )

// 마지막 헤더금액(세액, 공급가액)
if ll_dw7cnt > 0 then
	//if ld_tax = 0 then
	//	dw7.object.tax_sign[ll_dw7cnt]  = "N"		   // 부가세
	//else
		dw7.object.tax_sign[ll_dw7cnt]  = "Y"		   // 부가세
	//end if
	dw7.object.sale_tax[ll_dw7cnt]	  = ld_tax		// 세액
	dw7.object.sale_amount[ll_dw7cnt]  = ld_amount	// 공급가액

	if dw7.rowcount() < 1 then dw7.insertrow( 0 )
	if dw8.rowcount() < 1 then dw8.insertrow( 0 )
	///////////////////////////////////////////////////////////////////////////////////
	
	if GF_Permission("WEB_주문관리", gs_userid) = "Y" then
		pb_save.enabled = true
	end if
	
	MessageBox("확인","가져오기 완료")
else
	MessageBox("확인","가져오기(중복유무) 완료")
end if

end event

type rb_2 from radiobutton within tabpage_4
integer x = 1586
integer y = 92
integer width = 357
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
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
integer x = 1586
integer y = 28
integer width = 357
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
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
integer x = 1947
integer y = 64
integer width = 421
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
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
integer y = 1036
integer width = 4608
integer height = 828
integer taborder = 50
string title = "none"
string dataobject = "d_orsale_webdet_m"
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
integer height = 812
integer taborder = 110
string title = "none"
string dataobject = "d_orsale_web_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
//GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
//GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull( row ) OR row < 1 then RETURN

//this.SelectRow(0, FALSE)
//this.SelectRow(row, TRUE)
this.ScrollToRow( row )

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

//WF_TotChkYN()

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
				OpenSheet(w_orsale_m, w_all_main, 5, original!)
			else
				OpenSheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 4608
integer height = 1864
long backcolor = 79416533
string text = "접수확인"
long tabtextcolor = 128
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
cb_6 cb_6
dw_9 dw_9
end type

on tabpage_5.create
this.cb_6=create cb_6
this.dw_9=create dw_9
this.Control[]={this.cb_6,&
this.dw_9}
end on

on tabpage_5.destroy
destroy(this.cb_6)
destroy(this.dw_9)
end on

type cb_6 from commandbutton within tabpage_5
integer y = 28
integer width = 457
integer height = 128
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "4)저장하기"
end type

event clicked;//
string  ls_weborder[], ls_nullarray[], ls_saleno, ls_saleno1, ls_saledate, ls_seq, ls_saleflag, ls_area
string  ls_custno, ls_salecontrol, ls_orderno, ls_orguser, ls_chkyn, ls_itemno, ls_qa, ls_message
long    ll_webrow[],   ll_nullarray[], ll_row, ll_row_save, ll_cnt, ll_dw1cnt, ll_shopcnt
int     li_seq 
boolean lb_continue

pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

dw_9.AcceptText()

ls_weborder = ls_nullarray		// 주문초기화
ll_webrow   = ll_nullarray		// 행번호초기화

//////////////////////////////////////////////////////////////////////////
// 선택항목 체크
//////////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw_9.rowcount()
	setnull(ls_chkyn)
	ls_chkyn  = dw_9.object.chk_yn[ll_row]
	
	if ls_chkyn = "Y" then
		ll_dw1cnt = ll_dw1cnt + 1
		
		ls_weborder[ll_dw1cnt] = dw_9.object.order_no[ll_row]		// 웹 주문번호
		ll_webrow[ll_dw1cnt]   = ll_row										// dw1 행번호
	end if
next

if UpperBound(ls_weborder) < 1 then
	MessageBox("확인", "선택된 항목이 없습니다.")
	RETURN
end if
//////////////////////////////////////////////////////////////////////////

//
if MessageBox("저장","저장하시겠습니까?", question!, okcancel!, 1) = 2 then RETURN

for ll_row = 1 to UpperBound(ls_weborder)
	ls_orderno = ls_weborder[ll_row]					// 웹 주문번호	
	ll_dw1cnt  = ll_webrow[ll_row]					// 행번호
	
	ls_custno  = dw_9.object.cust_no[ll_dw1cnt]  // 거래처
	ls_itemno  = dw_9.object.item_no[ll_dw1cnt]	// 품목
	ls_qa      = dw_9.object.qa[ll_dw1cnt]			// 규격

	// 매출통제
	SELECT isnull(sale_control,'N') INTO :ls_salecontrol FROM customer WHERE cust_no = :ls_custno;
	if ls_salecontrol = "A" OR ls_salecontrol = "Y" then 
		ll_row_save = ll_row
		lb_continue = true
		ls_message  = "거래처 코드["+ls_custno+"]는 매출통제 대상 입니다!"
		EXIT
	end if

debugbreak()

	// 규격체크
	SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_itemno AND qa = :ls_qa AND use_flag = 'C';
	if ll_cnt > 0 then
		ll_row_save = ll_row
		lb_continue = true
		ls_message  = "규격["+ls_qa+"]은 사용불가 입니다."
		EXIT
	elseif ll_cnt = 0 then
		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_itemno AND qa = :ls_qa;
		if ll_cnt = 0 then
			if MessageBox("확인","규격이["+ls_itemno+"|"+ls_qa+"] 존재하지 않습니다!~r~r" &
							+ "새로운 코드로 등록 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				if GF_ItemInsert( ls_itemno, ls_qa ) = true then
					// 정상처리
				else
					ll_row_save = ll_row
					lb_continue = true
					ls_message  = "신규규격 등록 오류입니다."
					EXIT
				end if
			else
				ll_row_save = ll_row
				lb_continue = true
				ls_message  = "신규규격 등록 취소입니다."
				EXIT
			end if		
		else
			// 정상처리
		end if
	end if
next
if lb_continue = true then
	dw_9.object.chk_yn[ll_row_save] = "N"
	MessageBox("확인", ls_message)
	RETURN
end if

// SALESHOP => SALE
dw_9.SetRedraw(false)
for ll_row = 1 to UpperBound(ls_weborder)
	ls_orderno = ls_weborder[ll_row]					// 웹 주문번호	
	ll_dw1cnt  = ll_webrow[ll_row]					// 행번호
	
	ls_custno  = dw_9.object.cust_no[ll_dw1cnt]  // 거래처
	ls_itemno  = dw_9.object.cust_no[ll_dw1cnt]	// 품목
	ls_qa      = dw_9.object.cust_no[ll_dw1cnt]	// 규격

   ////////////////////////////////////////////////////////////////////////////////////////////	
   //	일반제품, 상품: 화곡사업장, YSP 품목: YSP사업장 입력하지만 웹에서는 취급안함
   ////////////////////////////////////////////////////////////////////////////////////////////	
	ls_area     = LeftA(dw_9.object.area_no[ll_dw1cnt], 1)
	ls_saleflag = dw_9.object.sale_flag[ll_dw1cnt]
	ls_saledate = string(dw_9.object.order_date[ll_dw1cnt], "yyyymmdd") // GF_TODAY2S()
	ls_saleno1  = ls_area + ls_saleflag + ls_saledate + "-" + "%"
	
	SELECT max(order_no) INTO :ls_saleno FROM sale WHERE order_no LIKE :ls_saleno1;
	if isnull(ls_saleno) OR ls_saleno = "" then
		ls_saleno1 = ls_area + ls_saleflag + ls_saledate + "-" + "001"
	else
		li_seq     = integer(MidA(ls_saleno, 12, 3))
		ls_seq     = "00" + string(li_seq + 1)
		ls_saleno1 = LeftA(ls_saleno1, 11) + RightA(ls_seq, 3)
	end if
				
	// 웹 주문번호와 ERP주문번호 매칭 
	UPDATE saleshop
	   SET sale_no  = :ls_saleno1, jupsu_flag = 'Y', jupsu_date = getdate()
	 WHERE order_no = :ls_orderno;
	if sqlca.sqlcode = 0 then
		COMMIT;
	else
		ROLLBACK;
		MessageBox("확인", "주문관리 테이블에 오류가 발생했습니다.~r~n요청번호: " + ls_orderno + "~r~n다시 조회후 확인하고 처리 하시기 바랍니다.")
		RETURN
	end if

	// SALE
	INSERT INTO sale (order_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code
	     , cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date
		  , tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr, rem
		  , revision_no, revision_date, input_date, login_id,  tel_no, ship_case, rem1, rem2
		  , plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2, org_user )
	SELECT sale_no, cust_no, scene_code, order_date, due_date, estimate_no, sale_flag, curr_code
	     , cust_po_no, cust_po_date, ship_flag, fob, salesman, confirm_flag, confirm_user, confirm_date
		  , tax_sign, sale_tax, sale_amount, open_close, close_type, close_date, shipto_addr, rem
		  , 0,           getdate(),     getdate(), :gs_userid, tel_no, ship_case, rem1, rem2
		  , plan_date, shipamt_case, area_no, ysp_confirm, ysp_qty, color, type, class, ysp_qty2, :gs_userid
	  FROM saleshop
	 WHERE order_no = :ls_orderno;
	if sqlca.sqlcode = 0 then
		// SALEDET
		INSERT INTO saledet(order_no, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text
		     , action, sol_qty, loc_no, issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color
			  , price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang)
		SELECT :ls_saleno1, seq_no, item_no, qa, uom, order_qty, price, acc_qty, saledet_text
		     , action, sol_qty, loc_no, issue_qty, rlse_date, rlse_qty, rem, plan_qty, plan_close, color
			  , price_be, do_rem, stock_qty, stock_issue, stock_do, price_last, danjung, jungrang 
		  FROM saleshopdet
		 WHERE order_no = :ls_orderno;	
		if sqlca.sqlcode = 0 then
			COMMIT;
		else
			ROLLBACK;
			MessageBox("확인", "웹접수(상세) 오류가 발생했습니다.~r~n요청번호: " + ls_orderno)
			RETURN
		end if
	else
		ROLLBACK;
		MessageBox("확인", "웹접수(헤더) 오류가 발생했습니다.~r~n요청번호: " + ls_orderno)
		RETURN
	end if

	dw_9.object.chk_yn[ll_dw1cnt]     = "N"
	dw_9.object.jupsu_flag[ll_dw1cnt] = "Y"			// 상태값 변환
	dw_9.object.sale_no[ll_dw1cnt] 	 = ls_saleno1	// 수주번호 변환	
next

dw_9.ScrollToRow( dw_9.GetRow() )
dw_9.SetRedraw( true )

pb_retrieve.TriggerEvent( clicked! )

//if IsValid( w_orsale_weborder ) = true then
//end if
SetPointer(oldpointer)
MessageBox("확인", "승인 처리완료.")

end event

type dw_9 from datawindow within tabpage_5
integer y = 176
integer width = 4608
integer height = 1684
integer taborder = 70
string title = "none"
string dataobject = "d_orsale_shopcon_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
gs_where lstr_where
string   ls_saleno

if isnull(row) OR row < 1 then RETURN

this.scrolltorow( row )

choose case dwo.name
	case "cust_no", "cust_name"
		lstr_where.str1 = this.object.cust_no[row]
		lstr_where.name = this.object.cust_name[row]
		OpenWithParm( w_whopeom_w, lstr_where )

	case "jupsu_flag"
	
	case else
		if this.object.jupsu_flag[row] = "Y" then
			ls_saleno = this.object.sale_no[row]
			
			if IsValid(w_all_main) = true then
				OpenSheet(w_orsale_m, w_all_main, 6, original!)
			else
				OpenSheet(w_orsale_m, w_o_main, 5, original!)
			end if
			w_orsale_m.em_3.text = LeftA(ls_saleno,10)
			w_orsale_m.em_4.text = string(dec(RightA(ls_saleno,3)))
			w_orsale_m.pb_cancel.postevent(clicked!)
		end if
end choose

end event

event clicked;////
//GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
//GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull( row ) OR row < 1 then RETURN
this.scrolltorow( row )

end event

type cb_login from commandbutton within w_orsale_weborder
integer x = 425
integer y = 164
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

type cb_gettable from commandbutton within w_orsale_weborder
integer x = 667
integer y = 164
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

type ln_h from line within w_orsale_weborder
integer linethickness = 4
integer beginx = 5
integer beginy = 240
integer endx = 3003
integer endy = 240
end type

type hpb_1 from hprogressbar within w_orsale_weborder
integer x = 3109
integer y = 260
integer width = 1527
integer height = 76
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type pb_4 from picturebutton within w_orsale_weborder
event mousemove pbm_mousemove
integer x = 3305
integer y = 60
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

type shl_1 from statichyperlink within w_orsale_weborder
integer x = 2683
integer y = 272
integer width = 398
integer height = 72
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
string text = "웹주문서"
alignment alignment = center!
string url = "http://b2b.yoochang.com/"
end type

event clicked;//// 웹
//string ls_url
//
//ls_url = "http://b2b.yoochang.com/"
//
//tab_1.selectedtab = 2
//tab_1.tabpage_2.ddlb_url.text = ls_url
//tab_1.tabpage_2.ole_browser.of_Navigate( ls_url )
//
//
end event

type cb_4 from commandbutton within w_orsale_weborder
integer x = 4000
integer y = 60
integer width = 590
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처 현장관리"
end type

event clicked;//
gs_where lstr_where
string   ls_custno, ls_custnm, ls_scene_code, ls_scene_name, ls_const_name, ls_areanm, ls_project
string   ls_scene1, ls_scene2, ls_scene_addr, ls_telno_cap1, ls_tel_no1, ls_telno_cap2, ls_tel_no2
long     ll_row

ll_row   = tab_1.tabpage_1.dw_5.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

//
ls_scene_name  = tab_1.tabpage_1.dw_5.object.scene_name[ll_row]
ls_const_name  = tab_1.tabpage_1.dw_5.object.const_name[ll_row]

ls_scene1      = tab_1.tabpage_1.dw_5.object.scene_addr1[ll_row]
if isnull(ls_scene1) then ls_scene1 = ""
ls_scene2      = tab_1.tabpage_1.dw_5.object.scene_addr2[ll_row]
if isnull(ls_scene2) then ls_scene2 = ""
ls_scene_addr  = ls_scene1 + " " + ls_scene2

ls_telno_cap1  = tab_1.tabpage_1.dw_5.object.telno_cap1[ll_row]
ls_tel_no1     = tab_1.tabpage_1.dw_5.object.tel_no1[ll_row]
ls_telno_cap2  = tab_1.tabpage_1.dw_5.object.telno_cap2[ll_row]
ls_tel_no2     = tab_1.tabpage_1.dw_5.object.tel_no2[ll_row]

ls_areanm      = LeftA(ls_scene_name,4)
ls_project     = MidA(ls_scene_name, 5, LenA(ls_scene_name))
ls_custnm      = tab_1.tabpage_1.dw_5.object.cust_name[ll_row]
SELECT cust_no INTO :ls_custno FROM customer WHERE cust_name = :ls_custnm;
 
if IsValid(w_all_main) = true then
	OpenSheet(w_cdscene_m, w_all_main, 6, original!)
else
	OpenSheet(w_cdscene_m, w_o_main, 5, original!)
end if

w_cdscene_m.dw_1.object.cust_no[1]   = ls_custno
w_cdscene_m.dw_1.object.cust_name[1] = ls_custnm

w_cdscene_m.dw_3.retrieve( ls_custno )
w_cdscene_m.dw_5.retrieve( ls_custno )
w_cdscene_m.dw_2.retrieve( ls_custno )

//if w_cdscene_m.dw_1.event itemchanged( w_cdscene_m.dw_1.getrow(), w_cdscene_m.dw_1.object.cust_name, ls_custnm) = 1 then
//	w_cdscene_m.dw_1.event itemchanged( w_cdscene_m.dw_1.getrow(), w_cdscene_m.dw_1.object.cust_name, ls_custnm)
//end if

// 추가하기
if MessageBox("확인","현장등록을 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then RETURN

w_cdscene_m.pb_insert.TriggerEvent(clicked!)
ll_row  = w_cdscene_m.dw_2.rowcount()

w_cdscene_m.dw_2.object.area_nm[ll_row]		= ls_areanm				// 지역명
w_cdscene_m.dw_2.object.project_nm[ll_row]	= trim(ls_project)	// 공사명
w_cdscene_m.dw_2.object.owner[ll_row]			= ls_const_name		// 건설사
w_cdscene_m.dw_2.object.scene_charge[ll_row]	= ls_telno_cap1		// 현장관리자
w_cdscene_m.dw_2.object.scene_tel[ll_row]		= ls_tel_no1			// 전화번호 핸폰
w_cdscene_m.dw_2.object.scene_telcap[ll_row]	= ls_tel_no2			// 보조연락처
w_cdscene_m.dw_2.object.scene_addr[ll_row]   = ls_scene_addr		// 현장주소
w_cdscene_m.dw_2.setcolumn( "rem" )
// 저장하기
//w_cdscene_m.pb_save.TriggerEvent(clicked!)
ls_scene_code  = w_cdscene_m.dw_2.object.scene_code[ll_row]

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_orsale_weborder.bin 
2300000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000010bc0bf001d356f200000003000000c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f0000000010bc0bf001d356f210bc0bf001d356f2000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c000000000000000100000002fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c0000682e00002daf0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c04600000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000200028002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d0062006f005f00650070005d006e006f0000006800740072006500280020007500200073006e006700690065006e006c0064006e006f002000670070007700720061006d00610020002c006f006c0067006e006c002000610070006100720020006d002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d0062006f005f00680074007200650000005d0062007200740075006f00740064006e0077006f0020006e00200028006e007500690073006e006700640065006f006c0067006e006600200061006c007300670020002c006e0069006500740065006700200072007000780073006f0020002c006e0069006500740065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_orsale_weborder.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
