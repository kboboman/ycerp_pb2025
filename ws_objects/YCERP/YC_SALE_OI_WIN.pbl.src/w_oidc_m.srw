$PBExportHeader$w_oidc_m.srw
$PBExportComments$매출할인 관리
forward
global type w_oidc_m from w_inheritance
end type
type em_1 from editmask within w_oidc_m
end type
type em_2 from editmask within w_oidc_m
end type
type dw_3 from datawindow within w_oidc_m
end type
type st_3 from statictext within w_oidc_m
end type
type ddlb_fld from dropdownlistbox within w_oidc_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oidc_m
end type
type st_4 from statictext within w_oidc_m
end type
type sle_value from singlelineedit within w_oidc_m
end type
type cb_1 from commandbutton within w_oidc_m
end type
type cb_2 from commandbutton within w_oidc_m
end type
type cb_3 from commandbutton within w_oidc_m
end type
type cb_5 from commandbutton within w_oidc_m
end type
type pb_1 from picturebutton within w_oidc_m
end type
type st_1 from statictext within w_oidc_m
end type
type cb_4 from commandbutton within w_oidc_m
end type
type cbx_1 from checkbox within w_oidc_m
end type
type cb_6 from commandbutton within w_oidc_m
end type
type st_2 from statictext within w_oidc_m
end type
type st_5 from statictext within w_oidc_m
end type
type st_6 from statictext within w_oidc_m
end type
type st_7 from statictext within w_oidc_m
end type
type dw_4 from datawindow within w_oidc_m
end type
type ddlb_op from dropdownlistbox within w_oidc_m
end type
type gb_4 from groupbox within w_oidc_m
end type
end forward

global type w_oidc_m from w_inheritance
integer y = 112
integer width = 5280
integer height = 3108
string title = "매출할인 관리(w_oidc_m)"
em_1 em_1
em_2 em_2
dw_3 dw_3
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
st_1 st_1
cb_4 cb_4
cbx_1 cbx_1
cb_6 cb_6
st_2 st_2
st_5 st_5
st_6 st_6
st_7 st_7
dw_4 dw_4
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_oidc_m w_oidc_m

type variables
st_print i_print
string  is_custsql
datawindowchild idwc_cust, idwc_scene
end variables

forward prototypes
public function string wf_permission (string arg_userid, long arg_sort, string arg_flag)
end prototypes

public function string wf_permission (string arg_userid, long arg_sort, string arg_flag);//////////////////////////////////////////////////////////////
//  arg_flag   : 1 (결재자), 2 [arg_sort : 1(직위), 2(이름)]
//  arg_userid : 
//////////////////////////////////////////////////////////////
string ls_val

if arg_flag = '1' then
	SELECT item_cd INTO :ls_val FROM codemst   
	 WHERE type = '매출할인_결재자' AND use_yn  = 'Y' AND sort = :arg_sort;
	
elseif arg_flag = '2' then
	choose case arg_sort
		case 1
			SELECT rank      INTO :ls_val FROM login WHERE user_id = :arg_userid AND 1 = :arg_sort;
	   case 2 
			SELECT user_name INTO :ls_val FROM login WHERE user_id = :arg_userid AND 2 = :arg_sort;
	end choose	
end if

RETURN ls_val

end function

on w_oidc_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
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
this.st_1=create st_1
this.cb_4=create cb_4
this.cbx_1=create cbx_1
this.cb_6=create cb_6
this.st_2=create st_2
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.dw_4=create dw_4
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.pb_1
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.st_2
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.st_7
this.Control[iCurrent+22]=this.dw_4
this.Control[iCurrent+23]=this.ddlb_op
this.Control[iCurrent+24]=this.gb_4
end on

on w_oidc_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
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
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cbx_1)
destroy(this.cb_6)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_2.visible     = false	// 프린트
dw_4.visible     = false	// 프린트

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )


em_1.text = string(RelativeDate(today(), - 60), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

//	출력
dw_4.getchild("cust_name", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_4.getchild("scene_name", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.retrieve( "%" )

// 양식
dw_1.getchild("cust_name", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_1.getchild("scene_name", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.retrieve( "%" )

if LeftA(gs_team,1) <> "7" then pb_insert.enabled = false

//pb_retrieve.triggerevent( clicked! )

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 87
gb_2.height = newheight - 408

dw_3.height = newheight - 500

dw_1.width  = newwidth  - 1774
dw_1.height = newheight - 500

end event

type pb_save from w_inheritance`pb_save within w_oidc_m
integer x = 4695
integer y = 60
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;// 저장
string	ls_dc_no, ls_item_no, ls_qa, ls_qa_cust, ls_uom
string	ls_sale_no, ls_rem, ls_do_rem, ls_coil_no, ls_loc_no, ls_dc_content, ls_app1
long		ll_oi_no, ll_seq_no, ll_ship_qty, ll_price, ll_rate_cash, ll_cnt, ll_stock_qty
date		ld_date

dw_1.accepttext()
if dw_1.rowcount() < 1 then return

if isnull(dw_1.object.cust_no[1]) then
	MessageBox('확인','거래처가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("cust_name")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.scene_code[1]) then
	MessageBox('확인','현장이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("scene_name")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.dc_title[1]) then
	MessageBox('확인','제목이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_title")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.price[1]) then
	MessageBox('확인','할인금액이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("price")
	dw_1.setfocus()
	return
end if

// 수량
if isnull(dw_1.object.ship_qty[1]) then dw_1.object.ship_qty[1]  = 1

if isnull(dw_1.object.dc_type[1]) then
	MessageBox('확인','매출할인 유형이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_type")
	dw_1.setfocus()
	return
end if

//-- PK 생성(dc_no) --//
ld_date = date(dw_1.object.dc_date[1])
if isnull(ld_date) then
	MessageBox('확인','출고일자가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_date")
	dw_1.setfocus()
	return
end if

dw_2.Reset()
dw_2.Insertrow(0)

//dw_2.Object.dc_no[1] =		dw_1.Object.dc_no[1]
dw_2.Object.dc_content[1] = dw_1.object.dc_content[1]
dw_2.object.oi_no[1]      = 1	// 픽셀
dw_2.object.seq_no[1]     = 1	// 픽셀
dw_2.object.item_no[1]    = 'PZZZPP4ZZZ'				// 픽셀
dw_2.object.qa[1]         = '000X0000X0000X00000'	// 픽셀
dw_2.object.ship_qty[1]   = dw_1.object.ship_qty[1]
dw_2.object.price[1]      = dw_1.object.price[1]

//--불필요하지만 필수항목
dw_2.object.rate_cash[1]  = 0
dw_2.object.sale_no[1]    = ''
dw_2.object.uom[1]        = ''
dw_2.object.aroi_qty[1]   = 0

// 등록과 동시에 본인결재
ls_app1 = dw_1.Object.dc_app1[1]
if isNULL(ls_app1) then ls_app1 = ''
if ls_app1 = '' then
	dw_1.Object.dc_appdt2[1] = Date(gdt_today)
else
	dw_1.Object.dc_appdt1[1] = Date(gdt_today)
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

SELECT isnull(max(dc_no),'') INTO :ls_dc_no FROM dc WHERE dc_Date = :ld_date;
if isNULL(ls_dc_no) then ls_dc_no = ''
if ls_dc_no = '' then
	ls_dc_no = 'DC' + string(ld_date,'YYYYMMDD') + '-001'
else
	ls_dc_no = LeftA(ls_dc_no,11) + string(long(RightA(ls_dc_no,3)) + 1,'000')
end if

dw_1.object.dc_no[1] = ls_dc_no
dw_2.object.dc_no[1] = ls_dc_no

dw_1.AcceptText()
dw_2.AcceptText()

//dw_2.object.qa_cust[1] =	''
//	ll_aroi_qty = dw_1.object.aroi_qty[1]
//	ls_uom = dw_1.object.uom[1]
//	ls_sale_no = dw_1.object.sale_no[1]
//	ll_rate_cash = dw_1.object.rate_cash[1]
//	ls_rem = dw_1.object.rem[1]
//	ls_do_rem = dw_1.object.do_rem[1]
//	ls_coil_no = dw_1.object.coil_no[1]
//	ll_cnt = dw_1.object.cnt[1]
//	ls_loc_no = dw_1.object.loc_no[1]
//	ll_stock_qty = dw_1.object.stock_qty[1]

if wf_update2( dw_1, dw_2, "Y") = true then
	pb_retrieve.triggerevent(clicked!)
else
	MessageBox('확인','매출할인 작성중 오류가 발생 하였습니다.',Stopsign!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oidc_m
integer x = 1701
integer y = 452
integer width = 3365
integer height = 2296
integer taborder = 0
string dataobject = "d_dc_crt_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
this.bringtotop = true
end event

event dw_1::itemchanged;call super::itemchanged;//
string  ls_where, ls_sql, ls_data, ls_null
string  ls_content,  ls_custno, ls_grade, ls_captain, ls_limit, ls_balance, ls_terms, ls_price_level, ls_custmain, ls_license
string  ls_trans_no, ls_dono
long    ll_row,   ll_cnt
datetime ld_dodate

setnull( ls_null )
this.AcceptText()

this.getchild("cust_name", idwc_cust)		// 거래처
idwc_cust.SetTransObject(SQLCA)

this.getchild("scene_name",idwc_scene)		// 현장명
idwc_scene.SetTransObject(SQLCA)

choose case dwo.name
	case "cust_name"
		this.object.cust_no[1] = data
		
      this.getchild("scene_name", idwc_scene)
		idwc_scene.settransobject(sqlca)
		idwc_scene.Retrieve( data )

		ls_custno = this.object.cust_no[1]
      SELECT captain_name  = isnull(a.captain_name,'')
           , level         = isnull(a.level_grade,'') + isnull(a.credit_level,'')
           , credit_limit  = dbo.UF_FORMAT(a.credit_limit,'##,###,###,##0')
           , balance_amt   = dbo.UF_FORMAT(a.balance_amt,'##,###,###,##0')
           , terms         = isnull(a.terms,'')
           , price_level   = isnull(a.price_level,'')
           , custmain      = isnull(b.main_co,'')
           , licensenm     = isnull(b.license_name,'')
        INTO :ls_captain,  :ls_grade, :ls_limit, :ls_balance, :ls_terms, :ls_price_level
		     , :ls_custmain, :ls_license
        FROM customer  a
             LEFT OUTER JOIN custinfo b  ON a.cust_no = b.cust_no
       WHERE a.cust_no  = :ls_custno;
		 
		ls_content = "1. 거래처(코드)       : " + ls_custno      + CharA(13) + CharA(10) + &
						 "2. 거래선 현황          "                  + CharA(13) + CharA(10) + &
						 "   1) 대표자명        : " + ls_captain     + CharA(13) + CharA(10) + &
						 "   2) 거래선등급      : " + ls_grade       + CharA(13) + CharA(10) + &
						 "   3) 면허유무        : " + ls_license     + CharA(13) + CharA(10) + &
						 "   4) 선방거래선      : " + ls_custmain    + CharA(13) + CharA(10) + &
						 "   5) 여신한도금액    : " + ls_limit       + CharA(13) + CharA(10) + &
						 "   6) 전월말 미수잔액 : "                  + CharA(13) + CharA(10) + &
						 "3. 단가적용등급       : " + ls_price_level + CharA(13) + CharA(10) + &
						 "4. 결재(수금)조건     : " + ls_terms       + CharA(13) + CharA(10) + &
						 "5. 운반비 부담조건    : "                  + CharA(13) + CharA(10) + &
						 "6. 발생사유           : "                  + CharA(13) + CharA(10) + &
						 "7. 산출근거(계산방식) : "                  + CharA(13) + CharA(10)
		dw_1.object.dc_content[1] = ls_content		

	case "scene_name"
		this.object.scene_code[1] = data				
end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;//
string ls_date

if dwo.name = "dc_date" then
	OpenWithParm(w_calendar, message.stringparm)
	if Message.StringParm <> 'N' then
		ls_date = string(date(Message.StringParm))
		this.object.dc_date[1] = date(ls_date)
	end if
end if
end event

event dw_1::doubleclicked;call super::doubleclicked;//
choose case dwo.name
	case "user1", "user2", "user3", "user4", "user5"
		MessageBox("확인","결재 작업은 '매출할인 결재관리' 에서 진행하시기 바랍니다.")
		
	case "dc_content"
		MessageBox("확인","본문 수정은 '매출할인 결재관리' 에서 결재취소 후 작업하시기 바랍니다.")
end choose

end event

type st_title from w_inheritance`st_title within w_oidc_m
integer x = 96
integer y = 40
integer width = 1339
string text = "매출할인 관리"
end type

type st_tips from w_inheritance`st_tips within w_oidc_m
end type

type pb_compute from w_inheritance`pb_compute within w_oidc_m
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidc_m
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

type pb_close from w_inheritance`pb_close within w_oidc_m
integer x = 4896
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidc_m
integer x = 4489
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string ls_saleno

l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출할인 결재관리를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_oidc_m
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oidc_m
integer x = 4073
integer y = 60
integer taborder = 110
end type

event pb_delete::clicked;call super::clicked;String	ls_dc_no, ls_flag, ls_msg
long		ll_cnt

if dw_1.RowCount() < 1 then return
if MessageBox("삭제","삭제 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

ls_dc_no = dw_1.Object.dc_no[1]
if isNULL(ls_dc_no) then ls_dc_no = ''
if ls_dc_no = '' then
	MessageBox('확인','등록되지 않은 자료입니다. 다시 진행해 주시기 바랍니다.',StopSign!)
	return
end if

ls_flag = dw_1.Object.cc_flag[1]
if isNULL(ls_flag) then ls_flag = '0'	//신규등록자료로 봄

if ls_flag <> '0' then
	ls_msg = '결재가 진행중인 자료입니다.~n~n'
	ls_msg += '승인취소 후 다시 진행해 주시기 바랍니다.~n'
	MessageBox('확인',ls_msg,StopSign!)
	return
end if


delete from dcdet where dc_no = :ls_dc_no and oi_no = 1 using sqlca;
if sqlca.sqlcode <> 0 then
	rollback using sqlca;
	messagebox('확인','삭제할 수 없는 에러가 발생하였습니다..',stopsign!)
	return
else
	commit using sqlca;	

	delete from dc where dc_no = :ls_dc_no using sqlca;
	if sqlca.sqlcode <> 0 then
		rollback using sqlca;
		messagebox('확인','삭제할 수 없는 에러가 발생하였습니다..',stopsign!)
		return
	else
		commit using sqlca;	
		
		pb_retrieve.triggerevent(clicked!)
	end if
end if


end event

type pb_insert from w_inheritance`pb_insert within w_oidc_m
integer x = 3867
integer y = 60
integer taborder = 120
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_insert::clicked;call super::clicked;string	ls_app1,  ls_app2,  ls_app3,  ls_app4,  ls_app5		// ID
string	ls_rank1, ls_rank2, ls_rank3, ls_rank4, ls_rank5	// 직위
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5	// 이름
string	ls_teamnm, ls_applyid, ls_content	// 팀명

long     ll_apply

dw_1.Reset()
dw_2.Reset()

dw_1.insertrow(0)
dw_1.enabled    = true

pb_save.enabled = true
dw_1.object.cc_flag[1] = '0'	// DW활성화

// 기본값
SELECT team_name INTO :ls_teamnm FROM team WHERE team_code = :gs_team;

dw_1.object.dc_date[1]     = Date(gdt_today)	// 출고일자
dw_1.object.dc_balteam[1]  = "70000"			// 발신(영업본부)
dw_1.object.dc_hyupteam[1] = "10000"			// 협조(관리본부)

dw_1.object.team_code[1]   = gs_team			// 기안부서
dw_1.object.team_name[1]   = ls_teamnm			// 기안부서 명
dw_1.object.user_id[1]     = gs_userid			// 기안자 ID
dw_1.object.user_name[1]   = gs_username		// 기안자 명
dw_1.object.ship_qty[1]    = 1					// 수량

// 결재관련사항
SELECT user1_rank  = (case when a.user1_id = a.user2_id then '' else a.user1_rank end)
     , user1_id    = (case when a.user1_id = a.user2_id then '' else a.user1_id end)
     , user1_name  = (case when a.user1_id = a.user2_id then '' else a.user1_name end)
     , user2_rank  = a.user2_rank
     , user2_id    = a.user2_id
     , user2_name  = a.user2_name
     , user3_rank  = a.user3_rank
     , user3_id    = a.user3_id
     , user3_name  = a.user3_name
  INTO :ls_rank1, :ls_app1, :ls_user1, :ls_rank2, :ls_app2, :ls_user2, :ls_rank3, :ls_app3, :ls_user3
  FROM (
       SELECT user1_rank  = a.rank
            , user1_id    = a.user_id
            , user1_name  = a.user_name
            , user2_rank  = c.rank
            , user2_id    = (case when a.user_id = 'sjh4279' and b.team_manager = 'parkji' then 'sjh4279' 
			                         else b.team_manager 
				                 end)
				
            , user2_name  = (case when a.user_id = 'sjh4279' and b.team_manager = 'parkji' then '신준현'  
			                         else c.user_name    
				                 end)
            , user3_rank  = (case when a.team_code = '71000' then ''
				                      when a.team_code = '72000' then '실장' 
										    else                            '전무' 
								     end)
            , user3_id    = (case when a.team_code = '71000' then ''
				                      when a.team_code = '72000' then 'cwj'
                                  when a.team_code = '74000' then '19840901'
                                  else                            'chahc'
                             end)
            , user3_name  = (case when a.team_code = '71000' then ''
				                      when a.team_code = '72000' then '조우제'
                                  when a.team_code = '74000' then '조용재'
                                  else                            '차희천'
                             end)
         FROM login a
              LEFT OUTER JOIN team  b  on a.team_code    = b.team_code
              LEFT OUTER JOIN login c  on b.team_manager = c.user_id
        WHERE a.user_id   = :gs_userid
          AND a.use_flag  = 'Y'
       ) a;


SELECT a.rank, a.user_id, a.user_name
  INTO :ls_rank4, :ls_app4, :ls_user4
  FROM login a
 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출할인_결재자' AND use_yn  = 'Y' AND bigo = '최종결재자1');

SELECT a.rank, a.user_id, a.user_name
  INTO :ls_rank5, :ls_app5, :ls_user5   
  FROM login a
 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출할인_결재자' AND use_yn  = 'Y' AND bigo = '최종결재자2');

/* 결재4 생략 */
ls_rank4 = ""
ls_app4  = ""
ls_user4 = ""

// 결재자 ID
dw_1.object.dc_app1[1] = ls_app1  ; dw_1.object.dc_app2[1] = ls_app2
dw_1.object.dc_app3[1] = ls_app3  ; dw_1.object.dc_app4[1] = ls_app4
dw_1.object.dc_app5[1] = ls_app5
// 결재자 직위
dw_1.object.rank1[1]   = ls_rank1 ; dw_1.object.rank2[1]   = ls_rank2
dw_1.object.rank3[1]   = ls_rank3 ; dw_1.object.rank4[1]   = ls_rank4
dw_1.object.rank5[1]   = ls_rank5
// 결재자 이름
dw_1.object.user1[1]   = ls_user1 ; dw_1.object.user2[1]   = ls_user2
dw_1.object.user3[1]   = ls_user3 ; dw_1.object.user4[1]   = ls_user4
dw_1.object.user5[1]   = ls_user5

dw_1.object.dc_date.protect     = false	// 출고일자
dw_1.object.dc_balteam.protect  = false	// 발신
dw_1.object.dc_hyupteam.protect = false	// 협조

dw_1.object.cust_name.protect   = false	// 거래처
dw_1.object.scene_name.protect  = false	// 현장
dw_1.object.dc_title.protect    = false	// 제목
dw_1.object.ship_qty.protect    = false	// 수량
dw_1.object.price.protect       = false	// 금액
dw_1.object.dc_type.protect     = false	// 할인유형

dw_1.object.dc_content.protect  = false	// 본문
dw_1.object.dc_rem1.protect     = false	// 결재자1
dw_1.object.dc_rem2.protect     = false	// 결재자2
dw_1.object.dc_rem3.protect     = false	// 결재자3
dw_1.object.dc_rem4.protect     = false	// 결재자4
dw_1.object.dc_rem5.protect     = false	// 결재자5

// 결재난 
for ll_apply = 1 to 5
	ls_applyid = dw_1.GetItemString( 1, "dc_app"+string(ll_apply) )
	if gs_userid = ls_applyid then
		dw_1.Modify("user"   + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("user"   + string(ll_apply) + ".background.color=65535")		// Yellow
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=0")			

		dw_1.Modify("dc_rem" + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("dc_rem" + string(ll_apply) + ".background.color=65535")
		dw_1.Modify("dc_rem" + string(ll_apply) + ".Protect=0")			
	else
		dw_1.Modify("user"   + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("user"   + string(ll_apply) + ".background.color=12632256")	// Light gray
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=1")			

		dw_1.Modify("dc_rem" + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("dc_rem" + string(ll_apply) + ".background.color=12632256")
		dw_1.Modify("dc_rem" + string(ll_apply) + ".Protect=1")			
	end if
next


ls_content = "1. 거래처(코드)       : " + CharA(13) + CharA(10) + &
             "2. 거래선 현황          " + CharA(13) + CharA(10) + &
             "   1) 대표자명        : " + CharA(13) + CharA(10) + &
             "   2) 거래선등급      : " + CharA(13) + CharA(10) + &
             "   3) 면허유무        : " + CharA(13) + CharA(10) + &
             "   4) 선방거래선      : " + CharA(13) + CharA(10) + &
				 "   5) 여신한도금액    : " + CharA(13) + CharA(10) + &
				 "   6) 전월말 미수잔액 : " + CharA(13) + CharA(10) + &
				 "3. 단가적용등급       : " + CharA(13) + CharA(10) + &
             "4. 결재(수금)조건     : " + CharA(13) + CharA(10) + &
             "5. 운반비 부담조건    : " + CharA(13) + CharA(10) + &
             "6. 발생사유           : " + CharA(13) + CharA(10) + &
             "7. 산출근거(계산방식) : " + CharA(13) + CharA(10)
dw_1.object.dc_content[1] = ls_content

// 담당자 거래처만 보여주기
dw_1.getchild("cust_name", idwc_cust)
idwc_cust.settransobject(sqlca)

idwc_cust.setsort( " user_name A, cust_name A")
idwc_cust.sort()
idwc_cust.setfilter( " user_name LIKE '" + gs_username + "%'")
idwc_cust.filter()

//
dw_1.setcolumn("cust_name")
dw_1.setfocus()

MessageBox("확인","본문작성시 줄 바꿈은 엔터키로 작업하시기 바랍니다.")

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidc_m
integer x = 3662
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate, ls_user3, ls_value
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
  INTO :ls_user3
  FROM login a
	    LEFT OUTER JOIN team  b  on a.team_code    = b.team_code
	    LEFT OUTER JOIN login c  on b.team_manager = c.user_id
 WHERE a.user_id   = :gs_userid
   AND a.use_flag  = 'Y';

// 동부직원 -> 조전무 결재
choose case Lower(gs_userid)
	case "wldnjs", "myhan"	// 심지원, 한미연
		ls_user3 = "19840901"
	case "suj0118"          // 박수진
		ls_user3 = "cwj"
end choose

// 그룹별 필터링
if GF_PERMISSION("매출할인_전체보기", gs_userid) = "Y" then
	ls_user3 = ""
end if

dw_1.reset()
dw_3.reset()

ls_sdate = em_1.text
ls_edate = em_2.text
dw_3.SetRedraw(false)
ll_row   = dw_3.retrieve( ls_sdate, ls_edate, ls_user3 )

//// 그룹별 필터링
//if GF_PERMISSION("매출할인_전체보기", gs_userid) = "Y" then
//else
//	ls_value = " dc_app3  = '" + ls_user3 + "' "
//	dw_3.setfilter( ls_value )
//	dw_3.filter()
//end if
dw_3.SetRedraw(True)

if ll_row < 1 then 
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oidc_m
integer x = 2130
integer y = 12
integer width = 782
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oidc_m
integer x = 37
integer y = 392
integer width = 5083
integer height = 2388
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oidc_m
integer x = 2930
integer width = 2190
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidc_m
integer x = 1632
integer y = 116
integer width = 128
integer height = 100
integer taborder = 0
boolean enabled = false
string dataobject = "d_dcdet_m"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_oidc_m
integer x = 2158
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

type em_2 from editmask within w_oidc_m
integer x = 2523
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

type dw_3 from datawindow within w_oidc_m
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

event clicked;//
long    ll_row, ll_cnt, ll_app
string  ls_dcno, ls_flag, ls_userid
date    ld_approval
boolean lb_chk

/////////////////////////////////////////////////////////////////////////////////
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////

ll_row = this.getrow()
if ll_row < 1 then return

if this.object.user_id[row] <> gs_userid then 
	pb_delete.enabled = false
else
	pb_delete.enabled = true
end if

ls_dcno = this.object.dc_no[row]
ll_cnt  = dw_4.retrieve( ls_dcno )	// 프린트
ll_cnt  = dw_1.retrieve( ls_dcno )	// CRT
if ll_cnt > 0 then
	ls_flag = dw_1.object.cc_flag[1]
	if ls_flag = "1" then		// 수정시
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
		dw_1.object.dc_rem1.protect     = true		// 결재자1
		dw_1.object.dc_rem2.protect     = true		// 결재자2
		dw_1.object.dc_rem3.protect     = true		// 결재자3
		dw_1.object.dc_rem4.protect     = true		// 결재자4
		dw_1.object.dc_rem5.protect     = true		// 결재자5
	else								// 등록시
		dw_1.enabled = true
		dw_1.object.dc_date.protect     = false	// 출고일자
		dw_1.object.dc_balteam.protect  = false	// 발신
		dw_1.object.dc_hyupteam.protect = false	// 협조
		
		dw_1.object.cust_name.protect   = false	// 거래처
		dw_1.object.scene_name.protect  = false	// 현장
		dw_1.object.dc_title.protect    = false	// 제목
		dw_1.object.ship_qty.protect    = false	// 수량
		dw_1.object.price.protect       = false	// 금액
		dw_1.object.dc_type.protect     = false	// 할인유형
		
		dw_1.object.dc_content.protect  = false	// 본문
		dw_1.object.dc_rem1.protect     = false	// 결재자1
		dw_1.object.dc_rem2.protect     = false	// 결재자2
		dw_1.object.dc_rem3.protect     = false	// 결재자3
		dw_1.object.dc_rem4.protect     = false	// 결재자4
		dw_1.object.dc_rem5.protect     = false	// 결재자5
	end if

	// 결재난 당사자 포함
	lb_chk = false
	for ll_cnt = 1 to 5
		ls_userid = dw_1.getitemstring( 1, "dc_app" + string(ll_cnt) )			
		if ls_userid = gs_userid then 
			lb_chk = true
			exit
		end if
	next
	
	// 결재난 당사자 포함이고 상급자 결재인 경우 체크
	long ll_upcheck
	date ls_appdt
	if lb_chk = true then
		for ll_upcheck = ll_cnt + 1 to 5
			ls_appdt = Date(dw_1.getitemdatetime( 1, "dc_appdt" + string(ll_upcheck) )	)
			if isnull(ls_appdt) then 
				lb_chk = true
			else
				lb_chk = false
				exit
			end if
		next		
	end if
	// 저장
	pb_save.enabled = lb_chk
else
	dw_1.enabled = true
	dw_1.object.dc_date.protect     = false	// 출고일자
	dw_1.object.dc_balteam.protect  = false	// 발신
	dw_1.object.dc_hyupteam.protect = false	// 협조
	
	dw_1.object.cust_name.protect   = false	// 거래처
	dw_1.object.scene_name.protect  = false	// 현장
	dw_1.object.dc_title.protect    = false	// 제목
	dw_1.object.ship_qty.protect    = false	// 수량
	dw_1.object.price.protect       = false	// 금액
	dw_1.object.dc_type.protect     = false	// 할인유형
	
	dw_1.object.dc_content.protect  = false	// 본문
	dw_1.object.dc_rem1.protect     = false	// 결재자1
	dw_1.object.dc_rem2.protect     = false	// 결재자2
	dw_1.object.dc_rem3.protect     = false	// 결재자3
	dw_1.object.dc_rem4.protect     = false	// 결재자4
	dw_1.object.dc_rem5.protect     = false	// 결재자5
end if

for ll_cnt = 1 to 5
	dw_1.Modify("rank"     + string(ll_cnt) + ".Protect=1")			
	dw_1.Modify("user"     + string(ll_cnt) + ".Protect=1")			
	dw_1.Modify("dc_appdt" + string(ll_cnt) + ".Protect=1")			
next

dw_1.accepttext()

end event

type st_3 from statictext within w_oidc_m
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

type ddlb_fld from dropdownlistbox within w_oidc_m
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

type ddlb_dwtitles from dropdownlistbox within w_oidc_m
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

type st_4 from statictext within w_oidc_m
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

type sle_value from singlelineedit within w_oidc_m
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

type cb_1 from commandbutton within w_oidc_m
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

type cb_2 from commandbutton within w_oidc_m
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

type cb_3 from commandbutton within w_oidc_m
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

type cb_5 from commandbutton within w_oidc_m
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

type pb_1 from picturebutton within w_oidc_m
event mousemove pbm_mousemove
integer x = 4283
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
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long ll_cnt
DataWindow dwxls

dwxls  = dw_1

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

type st_1 from statictext within w_oidc_m
integer x = 2158
integer y = 52
integer width = 718
integer height = 76
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

type cb_4 from commandbutton within w_oidc_m
integer x = 3319
integer y = 60
integer width = 325
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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

type cbx_1 from checkbox within w_oidc_m
integer x = 2537
integer y = 288
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체 거래처"
end type

event clicked;// 전체 거래처
if this.checked = true then
	// 담당자 거래처만 보여주기
	idwc_cust.setsort( " user_name A, cust_name A")
	idwc_cust.sort()
	
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setsort( " user_name A, cust_name A")
	idwc_cust.sort()
	
	idwc_cust.setfilter( " user_name LIKE '" + gs_username + "%'")
	idwc_cust.filter()
end if

end event

type cb_6 from commandbutton within w_oidc_m
integer x = 2958
integer y = 60
integer width = 347
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전자결재"
end type

event clicked;// 전자결재

if IsValid(w_o_main) then 
	OpenSheet(w_oidccon_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_oidccon_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_oidccon_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_oidccon_m,  w_all_main, 5, original!)
end if

end event

type st_2 from statictext within w_oidc_m
integer x = 3040
integer y = 268
integer width = 1499
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "결재취소는 ~'매출할인 결재관리(전자결재)~'"
boolean focusrectangle = false
end type

type st_5 from statictext within w_oidc_m
integer x = 1472
integer y = 36
integer width = 475
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

type st_6 from statictext within w_oidc_m
integer x = 3040
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

type st_7 from statictext within w_oidc_m
integer x = 37
integer y = 192
integer width = 1513
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "본문작성시 줄 바꿈은 엔터키로 작업하시기 바랍니다."
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_oidc_m
integer x = 1774
integer y = 116
integer width = 128
integer height = 100
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_dc_m"
boolean resizable = true
boolean livescroll = true
end type

type ddlb_op from dropdownlistbox within w_oidc_m
integer x = 965
integer y = 276
integer width = 302
integer height = 500
integer taborder = 80
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

type gb_4 from groupbox within w_oidc_m
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

