$PBExportHeader$w_oidccon_m.srw
$PBExportComments$매출할인 결재관리
forward
global type w_oidccon_m from w_inheritance
end type
type em_1 from editmask within w_oidccon_m
end type
type em_2 from editmask within w_oidccon_m
end type
type dw_3 from datawindow within w_oidccon_m
end type
type rb_topno from radiobutton within w_oidccon_m
end type
type rb_topyes from radiobutton within w_oidccon_m
end type
type st_3 from statictext within w_oidccon_m
end type
type ddlb_fld from dropdownlistbox within w_oidccon_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oidccon_m
end type
type st_4 from statictext within w_oidccon_m
end type
type sle_value from singlelineedit within w_oidccon_m
end type
type cb_1 from commandbutton within w_oidccon_m
end type
type cb_2 from commandbutton within w_oidccon_m
end type
type cb_3 from commandbutton within w_oidccon_m
end type
type cb_5 from commandbutton within w_oidccon_m
end type
type pb_1 from picturebutton within w_oidccon_m
end type
type dw_dodet from datawindow within w_oidccon_m
end type
type dw_do from datawindow within w_oidccon_m
end type
type st_1 from statictext within w_oidccon_m
end type
type rb_all from radiobutton within w_oidccon_m
end type
type st_2 from statictext within w_oidccon_m
end type
type cb_4 from commandbutton within w_oidccon_m
end type
type st_5 from statictext within w_oidccon_m
end type
type st_6 from statictext within w_oidccon_m
end type
type rb_1 from radiobutton within w_oidccon_m
end type
type rb_2 from radiobutton within w_oidccon_m
end type
type cbx_1 from checkbox within w_oidccon_m
end type
type ddlb_op from dropdownlistbox within w_oidccon_m
end type
type gb_4 from groupbox within w_oidccon_m
end type
type gb_5 from groupbox within w_oidccon_m
end type
type gb_6 from groupbox within w_oidccon_m
end type
end forward

global type w_oidccon_m from w_inheritance
integer y = 112
integer width = 5317
integer height = 3212
string title = "매출할인 결재관리(w_oidccon_m)"
em_1 em_1
em_2 em_2
dw_3 dw_3
rb_topno rb_topno
rb_topyes rb_topyes
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
pb_1 pb_1
dw_dodet dw_dodet
dw_do dw_do
st_1 st_1
rb_all rb_all
st_2 st_2
cb_4 cb_4
st_5 st_5
st_6 st_6
rb_1 rb_1
rb_2 rb_2
cbx_1 cbx_1
ddlb_op ddlb_op
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
end type
global w_oidccon_m w_oidccon_m

type variables
st_print i_print
string is_sqlselect, is_apply, is_user3
long   il_dw3row
datawindowchild idwc_type
end variables

on w_oidccon_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.rb_topno=create rb_topno
this.rb_topyes=create rb_topyes
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.pb_1=create pb_1
this.dw_dodet=create dw_dodet
this.dw_do=create dw_do
this.st_1=create st_1
this.rb_all=create rb_all
this.st_2=create st_2
this.cb_4=create cb_4
this.st_5=create st_5
this.st_6=create st_6
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_1=create cbx_1
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.rb_topno
this.Control[iCurrent+5]=this.rb_topyes
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.pb_1
this.Control[iCurrent+16]=this.dw_dodet
this.Control[iCurrent+17]=this.dw_do
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.rb_all
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.cb_4
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.rb_1
this.Control[iCurrent+25]=this.rb_2
this.Control[iCurrent+26]=this.cbx_1
this.Control[iCurrent+27]=this.ddlb_op
this.Control[iCurrent+28]=this.gb_4
this.Control[iCurrent+29]=this.gb_5
this.Control[iCurrent+30]=this.gb_6
end on

on w_oidccon_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.rb_topno)
destroy(this.rb_topyes)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.dw_dodet)
destroy(this.dw_do)
destroy(this.st_1)
destroy(this.rb_all)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_1)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

long   ll_apply
string ls_userid[5]

dw_2.visible     = false	// 프린트
dw_do.visible    = false	// 출고
dw_dodet.visible = false	// 출고상세

dw_3.SetTransObject(SQLCA)
dw_do.SetTransObject(SQLCA)
dw_dodet.SetTransObject(SQLCA)

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )

//if GF_PERMISSION("매출할인_전체보기", gs_userid) = "Y" then
//	cb_1.enabled  = true		// 필터
//	cb_2.enabled  = true		// 해지
//else
//	cb_1.enabled  = false	// 필터
//	cb_2.enabled  = false	// 해지
//end if

dw_1.getchild("dc_type", idwc_type)		// 할인유형

gb_3.visible      = true	// 결재구분	
rb_all.visible    = true 	// 전체
rb_topno.visible  = true	// 미결재
rb_topyes.visible = true	// 결재완료

em_1.text = string(RelativeDate(today(), - 60), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
if upper(gs_userid) = "TOP" then
	gb_6.visible   = false
	cbx_1.visible  = false
	rb_1.visible   = false	// 팀장전결
	rb_2.visible   = false	// 본부장전결
else
	rb_1.automatic = true	// 팀장전결
	rb_2.automatic = true	// 본부장전결
	rb_1.checked   = false	// 팀장전결
	rb_2.checked   = false	// 본부장전결
end if

if GF_PERMISSION("매출할인_결재자", gs_userid) = "Y" then
else
	pb_save.enabled  = false
	pb_print.enabled = false
	pb_1.enabled     = false
	
	for ll_apply = 1 to 5
		dw_1.Modify("user" + string(ll_apply) + ".Protect=1")			
      dw_1.Modify("user" + string(ll_apply) + ".Background.Mode='1'")
		dw_1.Modify("user" + string(ll_apply) + ".BackColor=RGB(0,0,255)")
	next
end if

pb_retrieve.triggerevent( clicked! )

cbx_1.checked = true 	// 전체
cbx_1.triggerevent( clicked! )

// CEO 기본값 미승인
if lower(gs_userid) = "top" then
	rb_topno.checked = true
	rb_topno.triggerevent( clicked! )
end if

MessageBox("확인","2012년 11월 이전 자료 조회용으로 사용하시기 바랍니다.~r~r" + &
           "2012년 11월 결재는 '매출할인 결재관리(거래처)' 에서 결재하시기 바랍니다.")


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 87
gb_2.height = newheight - 408

dw_3.height = newheight - 500

dw_1.width  = newwidth  - 1774
dw_1.height = newheight - 500

end event

type pb_save from w_inheritance`pb_save within w_oidccon_m
integer x = 4690
integer y = 60
integer taborder = 50
boolean enabled = false
end type

event pb_save::clicked;call super::clicked;// 저장
string  ls_dcno, ls_applyid, ls_bigo, ls_area, ls_dodate, ls_saleflag, ls_dono, ls_dovalue, ls_seq
string  ls_dcrem1, ls_dcrem2, ls_dcrem3, ls_dcrem4, ls_dcrem5
string  ls_custno, ls_round, ls_dberror, ls_dctype, ls_apply, ls_saleno, ls_orderno
integer li_seq
long    ll_row, ll_int
decimal ld_amount, lr_add

if dw_1.rowcount() < 1 then return

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then
	choose case is_apply
		case "user1"
		case "user2"
		case "user3"
		case "user4"
		case "user5"
	end choose
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()

//////////////////////////////////////
// 결재자 내용
//////////////////////////////////////
ls_dcno   = dw_1.object.dc_no[1]		// 할인번호
ls_dcrem1 = dw_1.object.dc_rem1[1]
ls_dcrem2 = dw_1.object.dc_rem2[1]
ls_dcrem3 = dw_1.object.dc_rem3[1]
ls_dcrem4 = dw_1.object.dc_rem4[1]
ls_dcrem5 = dw_1.object.dc_rem5[1]
//////////////////////////////////////

ls_applyid = gs_userid	// 로긴 사용자
SELECT bigo INTO :ls_bigo FROM codemst WHERE TYPE = '매출할인_결재자' AND item_cd = :ls_applyid;

// 중간결재
ls_apply = is_apply
if LeftA(ls_bigo,10) <> "최종결재자" then
   if is_apply = "user5" then		// 이고문인 경우
	else
		UPDATE dcdet 
		   SET dc_rem1 = :ls_dcrem1, dc_rem2 = :ls_dcrem2, dc_rem3 = :ls_dcrem3
			  , dc_rem4 = :ls_dcrem4, dc_rem5 = :ls_dcrem5
		 WHERE dc_no   = :ls_dcno;
		if sqlca.sqlcode = 0 then			
			COMMIT;
			if wf_update1( dw_1, "N") = true then
				MessageBox("확인","저장완료.")
			end if
		else
			ROLLBACK;
			MessageBox("확인","결재자 내용 저장중 오류가 발생 하였습니다.")
			RETURN
		end if
	end if
end if

// 최종결재자
if is_apply = "user5" then
	dw_do.reset()
	dw_dodet.reset()
	
	dw_do.insertrow(1)
	dw_dodet.insertrow(1)
	
   //////////////////////////////////
	// 출고번호 부여(마이너스 출고)
   //////////////////////////////////
	ls_area     = LeftA(gs_area, 1)
	ls_saleflag = dw_do.getitemstring(1, "sale_flag")
	ls_dodate   = string(dw_1.object.dc_date[1], "yyyymmdd")
	ls_dovalue  = ls_area + ls_saleflag + ls_dodate + '-' + '%'			

	SELECT max(do_no) INTO :ls_dono FROM DO WHERE do_no LIKE :ls_dovalue;		
	if isnull(ls_dono) or ls_dono = "" then
		ls_dono = ls_area + ls_saleflag + ls_dodate + "-001"
	else
		li_seq   = integer(MidA(ls_dono, 12, 3))
		li_seq   = li_seq + 1
		ls_seq   = '00' + string(li_seq)
		ls_dono  = LeftA(ls_dono, 11) + RightA(ls_seq, 3)
	end if
   //////////////////////////////////
	
   //////////////////////////////////
	// 출고헤더
   //////////////////////////////////
	dw_1.object.do_no[1]       = ls_dono	// 출고번호
	dw_do.object.do_no[1]      = ls_dono
	dw_do.object.sale_flag[1]  = ls_saleflag
	dw_do.object.issue_date[1] = dw_1.object.dc_date[1]

	dw_do.object.area_no[1]   = gs_area
	dw_do.object.cust_no[1]   = dw_1.object.cust_no[1]		// 거래처
	dw_do.object.spot_code[1] = dw_1.object.scene_code[1]	// 현장
	dw_do.object.user_id[1]   = dw_1.object.user_id[1]		// 기안자
	dw_do.object.do_date[1]   = dw_1.object.dc_date[1]		// 출고일자
	dw_do.object.do_flag[1]   = "3"								// 반납종류(에누리)
	dw_do.object.ship_date[1] = dw_1.object.dc_date[1] 	// 운반비 일자 입력
	
	ls_dctype = idwc_type.getitemstring(idwc_type.getrow(), "item_nm")
	ls_dctype = dw_1.object.dc_type[1]
	SELECT item_nm INTO :ls_dctype FROM codemst WHERE type = '매출할인_유형' AND item_cd = :ls_dctype;
	dw_do.object.rem[1]       = "매출할인_결재: " + ls_dctype	// 할인유형

   //////////////////////////////////
	// 출고상세
   //////////////////////////////////
	dw_dodet.object.do_no[1]     = ls_dono								// 출고번호
	dw_dodet.object.seq_no[1]    = 1										// 출고순번
	dw_dodet.object.oi_no[1]     = 1										// 수주순번
	
	dw_dodet.object.item_no[1]   = "PZZZPP4ZZZ"						// 매출 에누리
	dw_dodet.object.qa[1]        = "000X0000X0000X00000"			// 규격
	dw_dodet.object.uom[1]       = "EA"									// 단위
	dw_dodet.object.loc_no[1]    = dw_1.object.loc_no[1]			// 저장소
	
	dw_dodet.object.ship_qty[1]  = -1									// 출고수량(마이너스)
	dw_dodet.object.price[1]     = dw_1.object.price[1]		   // 단가
	dw_dodet.object.aroi_qty[1]  = 0		                        // 매출수량

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// 출고세(dodet) INSERT 트리거에서 수주번호별 SUM 후 출고상세(saledet)의 출고수량(RLSE_QTY) 수정됨 //
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	// ls_saleno  = left(ls_dono,11) + right("00" + string(integer(mid(ls_dono,12,3)) + 900), 3)
   //=================================================================================================//
	string  ls_dono2, ls_seq2
	integer li_seq2
	ls_dono2 = LeftA(ls_dono,10)
	SELECT max(sale_no) INTO :ls_saleno FROM dodet WHERE sale_no LIKE :ls_dono2 + '%';		
	if isnull(ls_saleno) or ls_saleno = "" then
		ls_saleno = ls_dono2 + "-801"		// 일자별 수주번호 최대값 800 
	else
		li_seq2   = integer(MidA(ls_saleno, 12, 3))
		li_seq2   = li_seq2 + 1
		ls_seq2   = RightA('00' + string(li_seq2), 3)
		ls_saleno = LeftA(ls_saleno, 11) + RightA(ls_seq2, 3)
	end if	
   //=================================================================================================//
	SELECT order_no INTO :ls_orderno FROM sale  WHERE order_no = :ls_saleno;
	if isnull(ls_orderno) or ls_orderno = "" then	// 정상
	else															// 중복
		// 채번 오류
	end if
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	dw_dodet.object.sale_no[1]   = ls_saleno							// 수주번호(임의)
	dw_dodet.object.rem[1]       = "매출할인_결재"					// 비고

	if dw_do.object.tax_chk[1] = "Y" then								// 부가세유무
		ls_custno = dw_1.object.cust_no[1]		// 거래처
		SELECT round INTO :ls_round FROM customer WHERE cust_no = :ls_custno;		

		if dw_dodet.object.price[1] < 0 then
			ld_amount = truncate(dw_dodet.object.price[1] / 10 - 0.0000001, 0)
		else
			ld_amount = truncate(dw_dodet.object.price[1] / 10 + 0.0000001, 0)
		end if
		dw_dodet.object.rate_cash[1] = ld_amount * -1		// DET세액
	else
		dw_dodet.object.rate_cash[1] = 0							// DET세액(영세율)
	end if	
	
	dw_do.object.do_cash[1]   = dw_dodet.object.price[1] * -1							// HD공급가
	dw_do.object.do_rate[1]   = dw_dodet.object.rate_cash[1]								// HD세액
	dw_do.object.do_total[1]  = dw_do.object.do_cash[1] + dw_do.object.do_rate[1] // HD합계금액

	/////////////////////////////////
	dw_do.accepttext()
	dw_dodet.accepttext()
	/////////////////////////////////
	if dw_do.rowcount()    < 1 then return
	if dw_dodet.rowcount() < 1 then return

	/////////////////////////////////
	// 저장
	/////////////////////////////////
	UPDATE dcdet 
		SET dc_rem1 = :ls_dcrem1, dc_rem2 = :ls_dcrem2, dc_rem3 = :ls_dcrem3
		  , dc_rem4 = :ls_dcrem4, dc_rem5 = :ls_dcrem5
	 WHERE dc_no   = :ls_dcno;
	if sqlca.sqlcode = 0 then			
		if wf_update3(dw_1, dw_do, dw_dodet, "N") then
			COMMIT;		// dcdet
		else
			ls_dberror = "출고번호:" + ls_dono + "할인번호: " + ls_dcno + "~n~n" + "매출할인 출고저장 오류발생."
			INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del)
			VALUES (:gs_userid, '1999010s', getdate(), :ls_dberror,'N');	
			COMMIT;
		end if		
	else
		ROLLBACK;

		ls_dberror = "출고번호:" + ls_dono + "할인번호: " + ls_dcno + "~n~n" + "결재 내용저장 오류발생."
		INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del)
		VALUES (:gs_userid, '1999010s', getdate(), :ls_dberror,'N');	
		COMMIT;

		MessageBox("확인","결재자 내용 저장중 오류가 발생 하였습니다.")
		RETURN
	end if
end if

pb_retrieve.triggerevent( clicked! )	// 조회
if dw_3.rowcount() > 0 then
	if il_dw3row > 0 and il_dw3row <= dw_3.rowcount() then
		dw_3.scrolltorow( il_dw3row )
	end if
end if


end event

type dw_1 from w_inheritance`dw_1 within w_oidccon_m
integer x = 1701
integer y = 452
integer width = 3365
integer height = 2296
integer taborder = 0
string dataobject = "d_dcdet1_crt_m"
boolean hsplitscroll = true
end type

event dw_1::doubleclicked;call super::doubleclicked;// 결재
string   ls_applyname, ls_dono, ls_dcno, ls_applyend, ls_title, ls_dberror, ls_null
long     ll_row
decimal  ld_price
datetime ld_null

setnull(ls_null)
setnull(ld_null)
// 매출할인_결재자 -> 매출할인_본부장 -> 매출할인_팀장
SELECT bigo INTO :ls_applyend FROM codemst 
 WHERE TYPE = '매출할인_결재자' AND item_cd = :gs_userid;
if ls_applyend = "" or isnull(ls_applyend) then
	SELECT bigo INTO :ls_applyend FROM codemst 
	 WHERE TYPE = '매출할인_본부장' AND item_cd = :gs_userid;
	if ls_applyend = "" or isnull(ls_applyend) then
		SELECT bigo INTO :ls_applyend FROM codemst 
		 WHERE TYPE = '매출할인_팀장' AND item_cd = :gs_userid;
	end if
end if
SELECT rank INTO :ls_title    FROM login   WHERE user_id = :gs_userid;


ls_dono  = this.object.do_no[row]		// 출고번호
ls_dcno  = this.object.dc_no[row]		// 할인번호
ld_price = this.object.price[row]		// 할인금액

if isnull(dw_1.object.dc_appdt5[row]) then		// 미승인
else															// 승인완료
	if LeftA(ls_applyend,10) = "최종결재자" then
	else
		choose case ls_applyend
			case "매출할인_본부장", "매출할인_팀장"
				if dw_1.object.dc_app5[row] <> gs_userid then
					MessageBox("확인","매출할인_본인 결재가 아닙니다.")
					RETURN
				end if
				
			case else
				MessageBox("확인","최종결재자 결재완료 되었습니다.")
				RETURN
		end choose
	end if
end if

choose case dwo.name
	case "user1"
		is_apply = dwo.name
		if gs_userid = dw_1.object.dc_app1[row] then
			if isnull(dw_1.object.dc_appdt2[row]) then
				if isnull(dw_1.object.dc_appdt1[row]) then
					dw_1.object.dc_appdt1[row] = gf_today()
					ls_applyname  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
					dw_1.object.user1[row]     = ls_applyname
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						return
					else
						dw_1.object.dc_appdt1[row] = ld_null
						dw_1.object.user1[row]     = ""
					end if
				end if			

				pb_save.triggerevent( clicked! )		// 저장
			else
				MessageBox("확인","결재자2 결재완료 되었습니다.")
			end if
		end if
		
	case "user2"
		is_apply = dwo.name
		if gs_userid = dw_1.object.dc_app2[row] then
			if isnull(dw_1.object.dc_appdt3[row]) then
				if isnull(dw_1.object.dc_appdt2[row]) then
					dw_1.object.dc_appdt2[row] = gf_today()
					ls_applyname  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
					dw_1.object.user2[row]     = ls_applyname
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						return
					else
						dw_1.object.dc_appdt2[row] = ld_null
						dw_1.object.user1[row]     = ""
					end if
				end if

				pb_save.triggerevent( clicked! )		// 저장
			else
				MessageBox("확인","결재자3 결재완료 되었습니다.")
			end if
		end if
		
	case "user3"
		is_apply = dwo.name
		if gs_userid = dw_1.object.dc_app3[row] then
			if isnull(dw_1.object.dc_appdt4[row]) then
				if isnull(dw_1.object.dc_appdt3[row]) then
					dw_1.object.dc_appdt3[row] = gf_today()
					ls_applyname  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
					dw_1.object.user3[row]     = ls_applyname
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						return
					else
						dw_1.object.dc_appdt3[row] = ld_null
						dw_1.object.user3[row]     = ""
					end if
				end if

				pb_save.triggerevent( clicked! )		// 저장
			else
				MessageBox("확인","결재자4 결재완료 되었습니다.")
			end if
		end if
		
	case "user4"
		is_apply = dwo.name
		if gs_userid = dw_1.object.dc_app4[row] then
			if isnull(dw_1.object.dc_appdt5[row]) then
				if isnull(dw_1.object.dc_appdt4[row]) then
					dw_1.object.dc_appdt4[row] = gf_today()
					ls_applyname  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
					dw_1.object.user4[row]     = ls_applyname
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						return
					else
						dw_1.object.dc_appdt4[row] = ld_null
						dw_1.object.user4[row]     = ""
					end if
				end if

				pb_save.triggerevent( clicked! )		// 저장
			else
				MessageBox("확인","최종결재자 결재완료 되었습니다.")
			end if
		end if
		
	case "user5", "p_rank5"
		is_apply = dwo.name
		
      //////////////////////////////////////////////////////////////////////////
		// [전결] 본부장 10만원, 팀장 5만원까지 결재가능
      //////////////////////////////////////////////////////////////////////////
		if ls_applyend = "매출할인_본부장" then
			if ld_price <= 100000 then
				ls_applyend = "최종결재자"
			end if
		else
			if ls_applyend = "매출할인_팀장" then
				if ld_price <= 50000 then
					ls_applyend = "최종결재자"
				end if
			end if
		end if
      //////////////////////////////////////////////////////////////////////////		
		if LeftA(ls_applyend,10) = "최종결재자" then
			if isnull(dw_1.object.dc_appdt5[row]) then	// 미결재
				dw_1.object.dc_app5[row]    = gs_userid	
				dw_1.object.dc_appdt5[row]  = gf_today()		
				ls_applyname  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
				dw_1.object.user5[row]      = ls_applyname

				pb_save.triggerevent( clicked! )		// 저장
			else			// 최종결재 취소
				if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
					RETURN
				else
					ll_row  = dw_3.getrow()
					dw_3.object.do_no[ll_row]     = ""		// 할인목록 출고번호
					dw_3.object.dc_appdt5[ll_row] = ""		// 할인문서 최종결재자
					
					dw_1.object.dc_app5[row]      = "TOP"
					dw_1.object.rank5[row]        = "승인"
					dw_1.object.user5[row]        = ""			// 할인문서 결재자인
					dw_1.object.dc_appdt5[row]    = ld_null	// 할인문서 최종결재자
	
					dw_1.object.do_no[row]        = ls_null	// 할인문서 출고번호

					if isnull(ls_dono) or ls_dono = "" then
						MessageBox("확인","출고번호가 존재하지 않습니다.")
					else
						DELETE FROM do WHERE do_no = :ls_dono;		// 할인송장 삭제(출고)
						if sqlca.sqlcode = 0 then
							DELETE FROM dodet WHERE do_no = :ls_dono;		// 출고상세
							if sqlca.sqlcode = 0 then
								if wf_update1(dw_1,"Y") = true then		// 매출할인
									COMMIT;
	
									ls_dberror = "출고번호:" + ls_dono + "할인번호: " + ls_dcno + "~n~n" + "매출할인 결재취소 했습니다."
									INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del)
									VALUES (:gs_userid, '1999010s', getdate(), :ls_dberror,'N');	

									string ls_runid
									SELECT item_cd INTO :ls_runid FROM codemst WHERE type = '매출이관이월결재_실행자' AND use_yn = 'Y';

									INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del)
									VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
									COMMIT;
								else
									ROLLBACK;
									MessageBox("오류1","매출할인 dw_1 오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext), exclamation!)
								end if
							else
								ROLLBACK;
								MessageBox("오류2","매출할인 dodet 오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext), exclamation!)
							end if
						else
							ROLLBACK;
							MessageBox("오류3","매출할인 do 오류가 발생했습니다.~r~n" + string(sqlca.sqlerrtext), exclamation!)
						end if				
					end if
				end if
			end if	// isnull(dw_1.object.dc_appdt5[row]) 
		end if	// left(ls_applyend,10) = "최종결재자"
end choose

end event

type st_title from w_inheritance`st_title within w_oidccon_m
integer x = 96
integer y = 40
integer width = 1339
string text = "매출할인 결재관리"
end type

type st_tips from w_inheritance`st_tips within w_oidccon_m
end type

type pb_compute from w_inheritance`pb_compute within w_oidccon_m
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidccon_m
boolean visible = false
integer x = 3205
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_oidccon_m
integer x = 4896
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidccon_m
integer x = 4494
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string     ls_saleno

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출할인 결재관리를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_oidccon_m
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oidccon_m
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oidccon_m
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidccon_m
integer x = 4105
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate, ls_value, ls_dctype, ls_dcapp3
long   ll_row

// 결재선에서 본부장 ID 조회 
SELECT user3_id  = (case when a.team_code = '72000' then 'cwj'
								 when a.team_code = '74000' then '19840901'
								 when a.team_code = '71000' then 'chahc'
								 when a.team_code = '75000' then 'chahc'
								 when a.team_code = '77000' then 'chahc'
								 when a.team_code = '78000' then 'chahc'
								 else a.user_id
						  end)
  INTO :is_user3
  FROM login a
	    LEFT OUTER JOIN team  b  on a.team_code    = b.team_code
	    LEFT OUTER JOIN login c  on b.team_manager = c.user_id
 WHERE a.user_id   = :gs_userid
   AND a.use_flag  = 'Y';

ls_sdate = em_1.text
ls_edate = em_2.text

// 동부직원 -> 조전무 결재
choose case Lower(gs_userid)
	case "wldnjs", "myhan"	// 심지원, 한미연
		is_user3 = "19840901"
	case "suj0118"          // 박수진
		is_user3 = "cwj"
end choose
ls_dcapp3 = is_user3			// 본부장 데이터

// 그룹별 필터링
if GF_PERMISSION("매출할인_전체보기", gs_userid) = "Y" then
	ls_dcapp3 = ""
end if

dw_1.reset()
dw_3.reset()

dw_3.SetRedraw(false)
ll_row = dw_3.retrieve( ls_sdate, ls_edate, ls_dcapp3 )

dw_3.SetRedraw(True)

if ll_row < 1 then 
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oidccon_m
integer x = 2249
integer y = 12
integer width = 658
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "결재"
end type

type gb_2 from w_inheritance`gb_2 within w_oidccon_m
integer x = 37
integer y = 392
integer width = 5083
integer height = 2388
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oidccon_m
integer x = 3735
integer width = 1385
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidccon_m
integer x = 1097
integer y = 16
integer width = 128
integer height = 100
integer taborder = 0
boolean enabled = false
string dataobject = "d_dcdet1_m"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_oidccon_m
integer x = 2962
integer y = 132
integer width = 352
integer height = 80
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oidccon_m
integer x = 3333
integer y = 132
integer width = 352
integer height = 80
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_oidccon_m
event dwnkey pbm_dwnkey
integer x = 73
integer y = 452
integer width = 1609
integer height = 2296
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_dc_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////

decimal ld_price
long    ll_row,  ll_apply
string  ls_dcno, ls_applyid, ls_orderno, ls_dono, ls_applyend, ls_smallsum

ll_row = this.getrow()
if ll_row < 1 then return
if row    < 1 or row > this.rowcount() then return

////////////////////////////////////////
il_dw3row = row	// 결재후 위치이동값
////////////////////////////////////////
ls_dcno    = this.object.dc_no[row]		// 할인번호
ls_dono    = this.object.do_no[row]		// 출고번호

dw_1.Retrieve( ls_dcno )		// 할인번호
dw_2.Retrieve( ls_dcno )		// 할인번호
dw_do.Retrieve( ls_dono )		// 출고번호
dw_dodet.Retrieve( ls_dono )	// 출고번호

SELECT bigo INTO :ls_applyend FROM codemst WHERE TYPE = '매출할인_결재자' AND item_cd = :gs_userid;

pb_save.enabled  = false	// 저장
pb_print.enabled = true	// 프린트

// 결재난 
for ll_apply = 1 to 5
	ls_applyid = dw_1.GetItemString( 1, "dc_app"+string(ll_apply) )
	if gs_userid = ls_applyid then
		pb_save.enabled  = true		// 저장
		pb_print.enabled = true		// 프린트
		
		dw_1.Modify("user"   + string(ll_apply) + ".Background.Mode='1'")
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=0")			
		dw_1.Modify("user"   + string(ll_apply) + ".BackGround.Color=RGB(255,0,0)")
		dw_1.Modify("dc_rem" + string(ll_apply) + ".Protect=0")			
	else
		dw_1.Modify("user"   + string(ll_apply) + ".Background.Mode='1'")
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=1")			
		dw_1.Modify("user"   + string(ll_apply) + ".BackGround.Color='11665407'")
		dw_1.Modify("dc_rem" + string(ll_apply) + ".Protect=1")			
	end if
next

/////////////////////////////////////////////////////
// [전결] 본부장 10만원, 팀장 5만원까지 결재가능
/////////////////////////////////////////////////////
if GF_PERMISSION("매출할인_본부장", gs_userid) = "Y" then
	ls_smallsum = dw_3.GetItemString( row, "dc_type" )		// 단수정리(소액)
	ld_price    = dw_3.object.price[row]						// 할인금액
	if ld_price <= 100000 then
		pb_save.enabled  = true			// 저장
		pb_print.enabled = true			// 프린트
	
		dw_1.Modify("user5.Background.Mode='1'")
		dw_1.Modify("user5.Protect=0")						// 최종결재 가능
		dw_1.Modify("user5.BackGround.Color=RGB(255,0,0)")
	   dw_1.Modify("dc_rem5.Protect=0")			
	else
		dw_1.Modify("user5.Background.Mode='1'")
		dw_1.Modify("user5.Protect=1")			
		dw_1.Modify("user5.BackGround.Color='11665407'")
	   dw_1.Modify("dc_rem5.Protect=1")			
	end if
else
	if GF_PERMISSION("매출할인_팀장", gs_userid) = "Y" then
		ld_price    = dw_3.object.price[row]						// 할인금액
		if ld_price <= 50000 then
			pb_save.enabled  = true			// 저장
			pb_print.enabled = true			// 프린트
		
			dw_1.Modify("user5.Background.Mode='1'")
			dw_1.Modify("user5.Protect=0")						// 최종결재 가능
			dw_1.Modify("user5.BackGround.Color=RGB(255,0,0)")
			dw_1.Modify("dc_rem5.Protect=0")			
		else
			dw_1.Modify("user5.Background.Mode='1'")
			dw_1.Modify("user5.Protect=1")			
			dw_1.Modify("user5.BackGround.Color='11665407'")
			dw_1.Modify("dc_rem5.Protect=1")			
		end if
	end if
end if

/////////////////////////////////////////////////////
// 최종결재자(대행)
/////////////////////////////////////////////////////
if LeftA(ls_applyend,10) = "최종결재자" then
	pb_save.enabled  = true	// 저장
	pb_print.enabled = true	// 프린트

	dw_1.Modify("user5.Background.Mode='1'")
	dw_1.Modify("user5.Protect=0")								// 최종결재 가능
	dw_1.Modify("user5.BackGround.Color=RGB(255,0,0)")
	dw_1.Modify("dc_rem5.Protect=0")			
end if

dw_1.object.dc_date.protect     = true		// 출고일자
dw_1.object.dc_balteam.protect  = true		// 발신
dw_1.object.dc_hyupteam.protect = true		// 협조

dw_1.object.cust_name.protect   = true		// 거래처
dw_1.object.scene_name.protect  = true		// 현장
dw_1.object.dc_title.protect    = true		// 제목
dw_1.object.ship_qty.protect    = true		// 수량
dw_1.object.price.protect       = true		// 금액
dw_1.object.dc_type.protect     = true		// 할인유형

dw_1.object.dc_content.protect  = true		// 본문

end event

event rowfocuschanged;//

end event

type rb_topno from radiobutton within w_oidccon_m
integer x = 2523
integer y = 76
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "미승인"
end type

event clicked;// 미결재
string ls_value

// 그룹별 필터링
ls_value = " dc_appdt5 = '' "

if this.checked = true then
	dw_3.setfilter( ls_value )
	dw_3.filter()
	
	cbx_1.checked = true
	rb_1.checked  = false
	rb_2.checked  = false
	rb_1.enabled  = false
	rb_2.enabled  = false
end if

end event

type rb_topyes from radiobutton within w_oidccon_m
integer x = 2523
integer y = 148
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "승인완료"
end type

event clicked;// 미결재
string ls_value

// 그룹별 필터링
ls_value = " dc_appdt5 <> '' "

if this.checked = true then
	dw_3.setfilter( ls_value )
	dw_3.filter()
	
	cbx_1.checked = true
	rb_1.checked  = false
	rb_2.checked  = false
	rb_1.enabled  = false
	rb_2.enabled  = false
end if

end event

type st_3 from statictext within w_oidccon_m
integer x = 101
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_oidccon_m
integer x = 288
integer y = 276
integer width = 480
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_oidccon_m
integer x = 352
integer y = 288
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oidccon_m
integer x = 786
integer y = 292
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

type sle_value from singlelineedit within w_oidccon_m
integer x = 1275
integer y = 284
integer width = 567
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

type cb_1 from commandbutton within w_oidccon_m
integer x = 1847
integer y = 284
integer width = 160
integer height = 76
integer taborder = 80
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

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidccon_m
integer x = 2011
integer y = 284
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidccon_m
integer x = 2176
integer y = 284
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidccon_m
integer x = 2341
integer y = 284
integer width = 160
integer height = 76
integer taborder = 80
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

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_oidccon_m
event mousemove pbm_mousemove
integer x = 4302
integer y = 60
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
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_3

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type dw_dodet from datawindow within w_oidccon_m
integer x = 1394
integer y = 16
integer width = 128
integer height = 100
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_oidcdet"
boolean livescroll = true
end type

type dw_do from datawindow within w_oidccon_m
integer x = 1253
integer y = 16
integer width = 128
integer height = 100
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidcdo_m"
boolean livescroll = true
end type

type st_1 from statictext within w_oidccon_m
integer x = 2962
integer y = 52
integer width = 722
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "기안일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_all from radiobutton within w_oidccon_m
integer x = 2299
integer y = 76
integer width = 224
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
string ls_value

// 그룹별 필터링
ls_value = ""

if this.checked = true then
	dw_3.setfilter( ls_value )
	dw_3.filter()
end if

// 전체보기
cbx_1.checked = true
cbx_1.triggerevent( clicked! )



end event

type st_2 from statictext within w_oidccon_m
integer x = 2533
integer y = 268
integer width = 1477
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "결재시에는 결재칸을 더블클릭하시면 됩니다."
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_oidccon_m
integer x = 3776
integer y = 60
integer width = 325
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "여신현황"
end type

event clicked;gs_where        lstr_where
string ls_cust_no, ls_cust_name

ls_cust_no   = dw_1.object.cust_no[1]
ls_cust_name = dw_1.object.cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
openwithparm(w_whopeom_w, lstr_where)

end event

type st_5 from statictext within w_oidccon_m
integer x = 50
integer y = 196
integer width = 558
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "매출할인_전체보기"
boolean focusrectangle = false
end type

type st_6 from statictext within w_oidccon_m
integer x = 2533
integer y = 324
integer width = 1755
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "[전결]본부장 10만원, 팀장 5만원까지 결재가능"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oidccon_m
integer x = 1746
integer y = 76
integer width = 384
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "팀장 전결"
end type

event clicked;// 팀장 전결
string ls_value

// 그룹별 필터링
ls_value = " price <= 50000 "

if this.checked = true then
	dw_3.setfilter( ls_value )
	dw_3.filter()
	
	rb_all.checked = true
end if


end event

type rb_2 from radiobutton within w_oidccon_m
integer x = 1746
integer y = 148
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "본부장 전결"
end type

event clicked;// 본부장 전결
string ls_value

// 그룹별 필터링
ls_value = " price <= 100000 "

if this.checked = true then
	dw_3.setfilter( ls_value )
	dw_3.filter()

	rb_all.checked = true
end if


end event

type cbx_1 from checkbox within w_oidccon_m
integer x = 1746
integer y = 12
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체보기"
end type

event clicked;//
string ls_value

if this.checked = true then
	// 그룹별 필터링
	ls_value = ""
	
	dw_3.setfilter( ls_value )
	dw_3.filter()

	rb_all.checked = true
	
	rb_1.checked = false
	rb_2.checked = false
	
	rb_1.enabled = false
	rb_2.enabled = false
else
	rb_1.enabled = true
	rb_2.enabled = true
end if


end event

type ddlb_op from dropdownlistbox within w_oidccon_m
integer x = 965
integer y = 280
integer width = 302
integer height = 500
integer taborder = 140
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

type gb_4 from groupbox within w_oidccon_m
integer x = 37
integer y = 228
integer width = 5083
integer height = 156
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_5 from groupbox within w_oidccon_m
integer x = 2935
integer y = 12
integer width = 777
integer height = 216
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_6 from groupbox within w_oidccon_m
integer x = 1714
integer y = 12
integer width = 521
integer height = 216
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "금액"
end type

