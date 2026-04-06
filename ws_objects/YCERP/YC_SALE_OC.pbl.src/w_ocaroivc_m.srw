$PBExportHeader$w_ocaroivc_m.srw
$PBExportComments$판매수금관리(1998/04/20, 정재수)
forward
global type w_ocaroivc_m from w_inheritance
end type
type st_3 from statictext within w_ocaroivc_m
end type
type st_phone from statictext within w_ocaroivc_m
end type
type st_4 from statictext within w_ocaroivc_m
end type
type cbx_1 from checkbox within w_ocaroivc_m
end type
type cbx_open from checkbox within w_ocaroivc_m
end type
type st_5 from statictext within w_ocaroivc_m
end type
type dw_4 from datawindow within w_ocaroivc_m
end type
type cb_1 from commandbutton within w_ocaroivc_m
end type
type st_6 from statictext within w_ocaroivc_m
end type
type ddlb_fld from dropdownlistbox within w_ocaroivc_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ocaroivc_m
end type
type st_7 from statictext within w_ocaroivc_m
end type
type sle_value from singlelineedit within w_ocaroivc_m
end type
type cb_2 from commandbutton within w_ocaroivc_m
end type
type cb_3 from commandbutton within w_ocaroivc_m
end type
type cb_4 from commandbutton within w_ocaroivc_m
end type
type cb_5 from commandbutton within w_ocaroivc_m
end type
type st_vertical from u_splitbar_vertical within w_ocaroivc_m
end type
type st_level from statictext within w_ocaroivc_m
end type
type st_salesman from statictext within w_ocaroivc_m
end type
type st_1 from statictext within w_ocaroivc_m
end type
type dw_3 from datawindow within w_ocaroivc_m
end type
type st_horizontal from u_splitbar_horizontal within w_ocaroivc_m
end type
type cb_import from commandbutton within w_ocaroivc_m
end type
type st_2 from statictext within w_ocaroivc_m
end type
type ddlb_1 from dropdownlistbox within w_ocaroivc_m
end type
type pb_import from picturebutton within w_ocaroivc_m
end type
type cbx_all from checkbox within w_ocaroivc_m
end type
type ddlb_op from dropdownlistbox within w_ocaroivc_m
end type
type gb_4 from groupbox within w_ocaroivc_m
end type
end forward

global type w_ocaroivc_m from w_inheritance
integer width = 4261
integer height = 2348
string title = "판매수금관리(w_ocaroivc_m)"
long backcolor = 79219928
st_3 st_3
st_phone st_phone
st_4 st_4
cbx_1 cbx_1
cbx_open cbx_open
st_5 st_5
dw_4 dw_4
cb_1 cb_1
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
st_vertical st_vertical
st_level st_level
st_salesman st_salesman
st_1 st_1
dw_3 dw_3
st_horizontal st_horizontal
cb_import cb_import
st_2 st_2
ddlb_1 ddlb_1
pb_import pb_import
cbx_all cbx_all
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_ocaroivc_m w_ocaroivc_m

type variables
st_print  i_print
st_aroivc ist_aroivc
DataWindowChild idwc_cheque_no, idwc_cust, idwc_cust_name
decimal ir_amount
boolean ib_confinue, ib_message
string  is_dw

end variables

forward prototypes
public subroutine wf_excel_import ()
end prototypes

public subroutine wf_excel_import ();//
String  ls_icubenm, ls_value, ls_amount, ls_bank, ls_branch, ls_acct, ls_billno, ls_billno_save
Integer iRet, iSeq
Long    ll_row, ll_Y, ll_X, ll_amount
Long    iCol, iRow, iRowMAX
Date    ld_cheque_start, ld_cheque_end, ld_cdate

String  ls_filename, named
String  defext = ""
String  Filter = "Microsoft Excel Files (*.xls*),*.xls*"

OLEObject OleExcel, xlSheet

if IsValid(OleExcel) then DESTROY OleExcel
if IsValid(xlSheet) then DESTROY xlSheet

OleExcel = CREATE OleObject
xlSheet  = CREATE OleObject

iRet = GetFileOpenName("Microsoft Excel Files", ls_filename, named, defext, filter)
if iRet = 1 then
	if ls_filename <> "" then
		iRet = OleExcel.ConnectToNewObject("excel.application") 
		if iRet <> 0 then DESTROY OleExcel 

		// Visible = True의 경우 엑셀 프로그램이 띄워지며 
		// False인 경우 아이콘화된다. 
		OleExcel.Application.Visible = false

		// 엑셀을 로드한 후 Empty Sheet를 연다. 
		OleExcel.WorkBooks.Open(ls_filename) 

		xlSheet  = OleExcel.Application.Sheets(1)
		// 최대 MAX값 구하기
		for iRow = 5000 to 1 step -1
			ls_value = string(xlSheet.Cells[iRow, 1].Value)
			if ls_value <> "" then
				iRowMAX = iRow
				EXIT
			end if
		next
		
		for iRow = 1 to iRowMAX step 10
			ll_Y = 2 ; ll_X = 3
			ls_bank         = string(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)   // 은행

			ll_Y = 2 ; ll_X = 5
			ls_acct         = string(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)   // 과목

			ll_Y = 3 ; ll_X = 1
			ld_cdate        = date(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)     // 접수일자

			ll_Y = 3 ; ll_X = 5
			ls_icubenm      = string(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)   // 구매업체

			ll_Y = 4 ; ll_X = 3
			ld_cheque_start = date(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)     // 할인가능일자

			ll_Y = 4 ; ll_X = 5
			ld_cheque_end   = date(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)     // 만기일자

			ll_Y = 6 ; ll_X = 1
			ls_amount       = string(xlSheet.Cells[iRow + ll_Y, 1 + ll_X].Value)   // 할인가능액
			ll_amount       = long( GF_ReplaceAll(ls_amount, "?원", "") )

			// 어음번호
			ls_billno       = "B"+string(ld_cdate,"yyyymmdd")
			// 지점
			setnull( ls_branch )
			SELECT rem INTO :ls_branch FROM bank WHERE bank_acct = :ls_bank;
			
			//	
			ll_row  = dw_3.InsertRow( 0 )

			// 수정가능
			dw_3.object.use_yn[ll_row]       = "Y"		
			
			dw_3.object.bill_no[ll_row]      = ls_billno
			dw_3.object.icube_name[ll_row]   = ls_icubenm
			dw_3.object.bank[ll_row]         = GF_ReplaceAll(GF_ReplaceAll(ls_bank,"（","("), "）", ")")
			dw_3.object.branch[ll_row]       = ls_branch
			dw_3.object.acct[ll_row]         = GF_ReplaceAll(ls_acct, "?", " ")
			dw_3.object.amount[ll_row]       = ll_amount
			dw_3.object.cheque_start[ll_row] = ld_cheque_start
			dw_3.object.cheque_end[ll_row]   = ld_cheque_end
			
			// 순번
			dw_3.object.no[ll_row]           = ll_row
		next

		// 어음번호만들기
		dw_3.SetSort( "bill_no A" )
		dw_3.Sort()
		
		ls_billno_save  = LeftA(dw_3.object.bill_no[1], 9)
		for ll_row = 1 to dw_3.rowcount()
			ls_billno  = LeftA(dw_3.object.bill_no[ll_row], 9)
			
			if ls_billno = ls_billno_save then
				iSeq      = iSeq + 1

				ls_billno = ls_billno + string(iSeq,"00")
				dw_3.object.bill_no[ll_row]  = ls_billno
			else
				ls_billno = ls_billno + "01"
				dw_3.object.bill_no[ll_row]  = ls_billno
				
				ls_billno_save = LeftA(ls_billno, 9)
			end if
		next
		dw_3.SetSort( "no A" )
		dw_3.Sort()

		dw_3.accepttext()
		MessageBox("확인","엑셀 가져오기 완료")		
	end if
end if

// Quits Excel
OleExcel.Application.Quit()

iRet = OleExcel.DisconnectObject()       
if iRet < 0 then
	MessageBox("ERROR","DisconnectObject Failed")
end if

Destroy xlSheet
Destroy OleExcel

end subroutine

on w_ocaroivc_m.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_phone=create st_phone
this.st_4=create st_4
this.cbx_1=create cbx_1
this.cbx_open=create cbx_open
this.st_5=create st_5
this.dw_4=create dw_4
this.cb_1=create cb_1
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_vertical=create st_vertical
this.st_level=create st_level
this.st_salesman=create st_salesman
this.st_1=create st_1
this.dw_3=create dw_3
this.st_horizontal=create st_horizontal
this.cb_import=create cb_import
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.pb_import=create pb_import
this.cbx_all=create cbx_all
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_phone
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cbx_open
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.dw_4
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_4
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.st_vertical
this.Control[iCurrent+19]=this.st_level
this.Control[iCurrent+20]=this.st_salesman
this.Control[iCurrent+21]=this.st_1
this.Control[iCurrent+22]=this.dw_3
this.Control[iCurrent+23]=this.st_horizontal
this.Control[iCurrent+24]=this.cb_import
this.Control[iCurrent+25]=this.st_2
this.Control[iCurrent+26]=this.ddlb_1
this.Control[iCurrent+27]=this.pb_import
this.Control[iCurrent+28]=this.cbx_all
this.Control[iCurrent+29]=this.ddlb_op
this.Control[iCurrent+30]=this.gb_4
end on

on w_ocaroivc_m.destroy
call super::destroy
destroy(this.st_3)
destroy(this.st_phone)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.cbx_open)
destroy(this.st_5)
destroy(this.dw_4)
destroy(this.cb_1)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_vertical)
destroy(this.st_level)
destroy(this.st_salesman)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_horizontal)
destroy(this.cb_import)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.pb_import)
destroy(this.cbx_all)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event open;call super::open;// 2014년 7월 15일 변경 
// dw_2 수금유형 : 대손상각 선택시 "어음발행인" 입력가능토록 변경("외상매출금")
//                 대손예금  --> 대손입금 으로 변경 
//
// 일별 수금현황(w_ocaroivcday_r), d_ocaroivcday_r6
// 판매거래처관리, 

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

st_salesman.visible = false
st_level.visible    = false
pb_import.enabled   = false		// 자동저장

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

long   ll_row
string ls_open, ls_zero, ls_salesman

// 수금유형에 대손상각 G 추가.
dw_4.settransobject(sqlca)
///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
ls_zero  = "%"

// 담당자
ls_salesman = "%"

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort("cust_name, cust_no")
idwc_cust_name.sort()
///////////////////////////////////////////

ddlb_1.text     = "지급명세서(상계)"
dw_3.dataobject = "d_ocaroivc_d1"

if GF_PERMISSION("판매관리_입력", gs_userid) = "Y" or GF_Permission("판매관리_입력(부분)", gs_userid) = "Y" then
	pb_save.enabled = true	
	pb_insert.enabled = true		
else
	pb_save.enabled = false
	pb_insert.enabled = false	
end if

end event

event resize;call super::resize;//
long  ll_height

gb_2.width  = newwidth  - (gb_2.x * 2)

ll_height   = newheight - dw_4.y - gb_2.x

dw_4.height = ll_height * 0.6

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = dw_4.height

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_2.x * 2)

dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = newwidth  - (gb_2.x * 2)
dw_3.height = newheight - dw_3.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_ocaroivc_m
integer x = 3502
integer y = 60
integer taborder = 60
end type

event pb_save::clicked;// 저장
string   ls_vc_no, ls_vc_no1, ls_oi_date, ls_rcpt_type, ls_seq, ls_cust_no, ls_vc_type, ls_month
string   ls_cheque_no, ls_cheque_start, ls_cheque_end, ls_large, ls_bank_code, ls_branch
string   ls_billvc_no, ls_cust_name, ls_bill_type, ls_rem, ls_vc_type2,  ls_a_bill_no
decimal  lr_amount,    lr_balanceamt, lr_billamt, lr_billdetamt
decimal{0} lr_bill
integer  li_seq
datetime ldt_start, ldt_end
long     ll_year,   ll_cnt, ll_cnt2

dwitemstatus l_status

if dw_2.rowcount() < 1 then RETURN

if GF_Permission('판매수금권한자', gs_userid) = 'Y' then
else
	MessageBox("확인", "이 프로그램 사용권한이 없습니다.")
	RETURN
end if

//////////////////////////////////////////////////////////
// 마감통제 체크
//////////////////////////////////////////////////////////
string  ls_yyyymm, ls_magamyn
ls_yyyymm = string(dw_2.object.oi_date[1],"yyyymm")
SELECT magam_yn INTO :ls_magamyn FROM mmagam WHERE yyyymm LIKE :ls_yyyymm AND sys_gb = '00';
if ls_magamyn = "Y" then
	MessageBox("확인","수금년월이 마감되어 작업할 수 없습니다!",information!) 
	RETURN
end if
//////////////////////////////////////////////////////////

if dw_2.accepttext() = -1 then return
dw_2.object.login_id[1] = gs_userid
dw_2.object.sys_date[1] = WF_today()

ls_cust_no   = dw_2.object.cust_no[1]
lr_amount    = dw_2.object.amount[1]
lr_bill      = dw_2.object.amount[1]
ls_rcpt_type = dw_2.object.rcpt_type[1]
ls_rem       = dw_2.object.rem[1]          // 적요

choose case ls_rcpt_type
	case "S", "B"		// 상계, 어음
		if LeftA(ls_rem, 8) = "전자결재" then
		else
			if LenA(trim(dw_2.object.vc_inseq[1])) < 6 then
				MessageBox('확인', '입금전표번호 6자리로 입력하세요.')
				RETURN
			end if
		end if
end choose

if isnull(dw_2.object.vc_type2[1]) OR trim(dw_2.object.vc_type2[1]) = "" then
	MessageBox('확인', '유형선택이 잘못되었습니다. 유형을 선택하세요.')
	RETURN
end if

//////////////////////////////////////////////////////////
// 거래처에 부도대가 전액 회수되었는지 체크
//////////////////////////////////////////////////////////
SELECT 
	sum(glbill.bill_amount) INTO :lr_billamt
FROM 
	glbill	LEFT OUTER JOIN customer c on glbill.cust_no = c.cust_no 
WHERE 
	glbill.cust_no = :ls_cust_no
AND 
	glbill.bill_class = 'D';

if lr_billamt > 0 then
	SELECT 
		sum(glbilldet.amount) INTO :lr_billdetamt
	FROM 
		glbilldet	left outer join glbill     on glbilldet.vc_no = glbill.vc_no
						left outer join customer c on glbill.cust_no = c.cust_no 
	WHERE  
		c.cust_no = :ls_cust_no
	GROUP by 
		c.cust_name;
	
	if lr_billamt > lr_billdetamt then
		if MessageBox("확인","해당하는 거래처는 부도대가 회수되지 않은 업체입니다.~n~n" + &
						  "그래도 수금처리 하시겠습니까?",question!,okcancel!,2) = 2 then
			RETURN
		end if
	end if
end if
//////////////////////////////////////////////////////////

setpointer(hourglass!)

if ib_message = false then
	if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
		RETURN
	elseif wf_nullchk(dw_2) = false then
		RETURN
	end if
end if

if dw_2.object.rcpt_type[1] = "B" then // 어음수금시 입력정보check
	ls_vc_type      = dw_2.object.vc_type[1]
	
	ldt_start       = dw_2.object.cheque_start[1]
	ldt_end         = dw_2.object.cheque_end[1]
	ls_cheque_start = string(dw_2.object.cheque_start[1])
	ls_cheque_end   = string(dw_2.object.cheque_end[1])
	ls_large        = trim(dw_2.object.large[1])
	ls_bank_code    = trim(dw_2.object.bank_code[1])
	ls_branch       = trim(dw_2.object.branch[1])
	ls_bill_type    = dw_2.object.bill_type[1]
	ls_rem          = dw_2.object.rem[1]
	ls_vc_type2     = dw_2.object.vc_type2[1]

	ls_cheque_no    = trim(dw_2.object.cheque_no[1])
	ls_a_bill_no    = trim(dw_2.object.a_bill_no[1])
	
	SELECT count(*) INTO :ll_cnt2 
	  FROM aroivc 
	 WHERE cheque_no = :ls_a_bill_no AND delete_key = 'N' AND cheque_no is not null;

	SELECT count(*) INTO :ll_cnt  
	  FROM aroivc 
	 WHERE cheque_no = :ls_cheque_no AND delete_key = 'N' AND cheque_no is not null;
	 
	if (ll_cnt + ll_cnt2) > 0 then
		MessageBox('경고', '어음번호가 중복 됩니다. 다시 확인하고 입력하세요.', stopsign!, ok!)
		RETURN
	end if		

     ls_vc_no        = trim(dw_2.object.vc_no[1])
	  
	if isnull(ls_vc_no) OR ls_vc_no = "" then
		if date(ldt_end) < date(GF_Today()) then
			MessageBox('경고', '어음만기일 다시 확인하고 입력하세요.', stopsign!, ok!)
			RETURN
		end if
	end if
	
	if ls_vc_type = 'S' then
		choose case dw_2.object.rcpt_type[1]
			case 'G', 'R', 'M', 'N'		// 상각, 이익, 예금, 어음 
			case else
				MessageBox("확인","입금형태가 대손인 경우 '수금유형'을 확인하시기 바랍니다.", information!)
				dw_2.setcolumn("rcpt_type")
				dw_2.setfocus()
				RETURN
		end choose
	end if
	
	if ls_vc_type = 'P' and ls_bill_type = 'A' then
		MessageBox("확인","자수 또는 타수를 선택하세요!", information!)
		dw_2.setcolumn("bill_type")
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_cheque_no) OR ls_cheque_no = "" then
		MessageBox("확인","어음번호를 입력하세요!",information!)
		if ls_vc_type = 'P' and dw_2.object.bill_type[1] = 'T' then
			dw_2.setcolumn("cheque_no")
		else
			dw_2.setcolumn("a_bill_no")
		end if
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_cheque_start) OR ls_cheque_start = '' then
		MessageBox("확인","어음발행일을 입력하세요!",information!)
		dw_2.setcolumn("cheque_start")
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_cheque_end) OR ls_cheque_end = '' then
		MessageBox("확인","어음마감일을 입력하세요!",information!)
		dw_2.setcolumn("cheque_end")
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_large) OR ls_large = '' then
		MessageBox("확인","어음발행인을 입력하세요!",information!)
		dw_2.setcolumn("large")
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_bank_code) OR ls_bank_code = '' then
		MessageBox("확인","발행은행을 입력하세요!",information!)
		dw_2.setcolumn("bank_code")
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_branch) OR ls_branch = '' then
		MessageBox("확인","지점명을 입력하세요!",information!)
		dw_2.setcolumn("branch")
		dw_2.setfocus()
		RETURN
	end if

// 예금수금시 입력정보check
elseif dw_2.object.rcpt_type[1] = 'A' then   
	ls_bank_code = trim(dw_2.object.bank_code[1])
	ls_branch = trim(dw_2.object.branch[1])
		
	if isnull(ls_bank_code) or ls_bank_code = '' then
		MessageBox("확인","발행은행을 입력하세요!",information!)
		dw_2.setcolumn("bank_code")
		dw_2.setfocus()
		RETURN
	elseif isnull(ls_branch) or ls_branch = '' then
		MessageBox("확인","지점명을 입력하세요!",information!)
		dw_2.setcolumn("branch")
		dw_2.setfocus()
		RETURN
	end if
end if

if lr_amount = 0 then
	MessageBox("확인","수금액을 입력하세요!",information!)
	dw_2.setcolumn("amount")
	dw_2.setfocus()
	RETURN
end if

if ib_message = false then
else
	if lr_amount > 0 or ls_vc_type = 'R' OR ls_vc_type = 'S' then	// 수금금액 한번더 check
		if MessageBox("확인","수금한 금액이 " + string(lr_amount, '#,##0') + "입니까?", + & 
						  question!,okcancel!,1) = 2 then 
			dw_2.setcolumn("amount")
			dw_2.setfocus()
			RETURN
		end if
	elseif lr_amount > 0 or ls_vc_type = 'P' then
		if MessageBox("확인","지불한 금액이 " + string(lr_amount, '#,##0') + "입니까?", + & 
						  question!,okcancel!,1) = 2 then 
			dw_2.setcolumn("amount")
			dw_2.setfocus()
			RETURN
		end if
	end if
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_status = dw_2.getitemstatus(1, 0, primary!)
ls_vc_no = trim(dw_2.object.vc_no[1])
if l_status = newmodified! then
	// 수금번호 자동생성
	ls_oi_date   = string(dw_2.object.oi_date[1], 'YYYYMMDD')
	ls_rcpt_type = dw_2.object.rcpt_type[1]
	ls_vc_no     = ls_oi_date + ls_rcpt_type + '%'
	
	SELECT max(vc_no) INTO :ls_vc_no1 FROM aroivc WHERE vc_no LIKE :ls_vc_no;	  
	if isnull(ls_vc_no1) or ls_vc_no1 = '' then
		li_seq = 1
	else
		li_seq = integer(RightA(ls_vc_no1, 3)) + 1
	end if
	ls_seq   = '000' + string(li_seq)
	ls_seq   = RightA(ls_seq, 3)
	ls_vc_no = ls_oi_date + ls_rcpt_type + ls_seq //수금번호
	
   if dw_2.object.rcpt_type[1] = 'B' then // 어음일 경우
		if ls_vc_type = 'P' and dw_2.object.bill_type[1] = 'T' then // 타수로 지불할 경우
			// glbilldet table insert
			dw_1.accepttext()
			
			ls_cust_name = dw_1.getitemstring(dw_1.getrow(), "cust_name")
			ls_billvc_no = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(), "vc_no")
			INSERT INTO glbilldet(vc_no, bill_no, billdet_vcno, billdet_no, det_class, 
			                      close_date, start_date, bank_code, bill_area, amount,
										 draft, rem, user_id)
			VALUES (:ls_billvc_no, :ls_cheque_no, :ls_vc_no, :ls_cheque_no, 'B', 
				  			 :ldt_end, :ldt_start, :ls_bank_code, :ls_branch, :lr_bill, 
							 :ls_large, :ls_cust_name, :gs_userid);	

			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				RETURN
			end if		
			
			UPDATE glbill SET bill_class = 'P' WHERE vc_no = :ls_billvc_no;			 
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				RETURN
			end if		 
		else		
			// glbill table insert
			INSERT INTO glbill(vc_no, bill_no, bill_class, cust_no, close_date, start_date,
			                   bank_code, bill_area, bill_amount, set_flag, draft, rem, vc_type2)
		   VALUES(:ls_vc_no, :ls_cheque_no, :ls_vc_type, :ls_cust_no, :ldt_end, :ldt_start,
			   	      :ls_bank_code, :ls_branch, :lr_bill, 'N', :ls_large, :ls_rem, :ls_vc_type2);						
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
				RETURN
			end if
			
			dw_2.object.cheque_no[1] = dw_2.object.a_bill_no[1]
		end if

		//customer table의 어음미결액 update
		UPDATE customer 
		   SET bill_amount = bill_amount + :lr_amount
		 WHERE cust_no = :ls_cust_no;		 
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			RETURN
		end if
	end if
	
	ll_year  = long(string(dw_2.object.oi_date[1], 'yyyy'))
     ls_month = string(dw_2.object.oi_date[1], 'mm')
	if dw_2.object.vc_type[1] = 'R' OR dw_2.object.vc_type[1] = 'S' then   // 수금유형 : 수금, 대손	
	else                                   // 수금유형 : 지불	
	end if
	
	dw_2.object.vc_no[1] = ls_vc_no
	
elseif lr_amount <> ir_amount then // 수금액에 변동이 있을 경우
	ls_vc_no  = dw_2.object.vc_no[1]
	lr_amount = ir_amount - lr_amount
	
	if dw_2.object.rcpt_type[1] = 'B' then //어음인 경우
		//customer table의 어음미결액 update
		UPDATE customer 
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE cust_no = :ls_cust_no;		 
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			RETURN
		end if

		//glbill table의 어음금액 update  
		UPDATE glbill
		   SET bill_amount = bill_amount - :lr_amount
		 WHERE vc_no = :ls_vc_no;                    		
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			RETURN
		end if
	end if
		
	ll_year  = long(string(dw_2.object.oi_date[1], 'yyyy'))
   ls_month = string(dw_2.object.oi_date[1], 'mm')
	if dw_2.object.vc_type[1] = 'R' OR dw_2.object.vc_type[1] = 'S' then // 수금형태중 수금인 경우	
	else                                 //수금형태중 지불인 경우	
	end if
end if


dw_2.accepttext()
if WF_Update1(dw_2, 'Y') = true then
	// 문자전송
	choose case st_level.text
		case "A","B","C","E","S"
			string ls_message, ls_sender, ls_recipient
		
			string ls_office	/*발신번호*/
			SELECT RTRIM(BIGO) INTO :ls_office FROM CODEMST WHERE TYPE = 'SMSSEND' AND ITEM_CD = :gs_userid;
			if isnull(ls_office) or ls_office = "" then
				ls_sender   = "0226481998"	
			else
				ls_sender   = ls_office
			end if
			
			SELECT B.CUST_NAME + ' \' + 
					 REPLACE(LTRIM(CONVERT(VARCHAR, CONVERT(MONEY, A.AMOUNT), 1)), '.00', '') +
					 '원 [' + (CASE WHEN A.RCPT_TYPE = 'C' THEN '현금'
										 WHEN A.RCPT_TYPE = 'B' THEN '어음'
										 WHEN A.RCPT_TYPE = 'A' THEN '예금'
										 WHEN A.RCPT_TYPE = 'D' THEN 'D/C'
										 WHEN A.RCPT_TYPE = 'S' THEN '상계'
										 WHEN A.RCPT_TYPE = 'E' THEN '잡이익'
										 WHEN A.RCPT_TYPE = 'P' THEN '처리어음'
										 WHEN A.RCPT_TYPE = 'Z' THEN '기타'
										 WHEN A.RCPT_TYPE = 'F' THEN '하자보수'
										 WHEN A.RCPT_TYPE = 'G' THEN '대손상각'
								  END) + '/' +
								 (CASE WHEN A.VC_TYPE2 = '01' THEN '자수'
										 WHEN A.VC_TYPE2 = '02' THEN '타수'
										 WHEN A.VC_TYPE2 = '03' THEN '융통'
										 WHEN A.VC_TYPE2 = '04' THEN '전자결재'
										 WHEN A.VC_TYPE2 = '05' THEN '기타'
								  END) + ']' 
			  INTO :ls_message
			  FROM AROIVC  A
					 LEFT OUTER JOIN CUSTOMER B  ON A.CUST_NO = B.CUST_NO
			 WHERE A.VC_NO    = :ls_vc_no;
 
			ls_message   = GF_HANGLE_TR(ls_message,80)
			ls_recipient = st_phone.text
			
			choose case LeftA(ls_recipient,3)
				case "010", "011", "016", "017", "018", "019"
				case else
					ls_recipient = ""
			end choose
			
			// 수신처
			if ls_recipient = "" OR isnull(ls_recipient) then
			else
				if cbx_1.checked = true then
					GF_MMSSEND( gs_userid, ls_sender, ls_recipient,  st_salesman.text, ls_message )
				end if
			end if
	end choose
	
	dw_2.reset()
	dw_4.reset()
	dw_4.retrieve(ls_cust_no)
end if
	
end event

type dw_1 from w_inheritance`dw_1 within w_ocaroivc_m
integer x = 1367
integer y = 136
integer width = 1230
integer height = 84
integer taborder = 20
string dataobject = "d_occustddw_c"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;DataWindowChild ldwc_cust
string ls_cust_no, ls_cust_name, ls_username, ls_salesman, ls_phone, ls_level, ls_zero = '%'

dw_2.reset()
dw_4.reset()

choose case dwo.name
	case 'cust_no','cust_name'
		choose case dwo.name
			case "cust_no"
				this.getchild("cust_no", ldwc_cust)
				ldwc_cust.settransobject(sqlca)
				
				ls_cust_no   = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
				ls_cust_name = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_name")
				this.object.cust_name[1] = ls_cust_name
				
				ist_aroivc.curr_code     = ldwc_cust.getitemstring(ldwc_cust.getrow(),  "curr_code")
				ist_aroivc.balance_amt   = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "balance_amt")
				ist_aroivc.bill_amount   = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "bill_amount")
				ist_aroivc.saleman       = ldwc_cust.getitemstring(ldwc_cust.getrow(),  "salesman")
			case "cust_name"
				this.getchild("cust_name", ldwc_cust)
				ldwc_cust.settransobject(sqlca)
				
				ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
				this.object.cust_no[1] = ls_cust_no
				
				ist_aroivc.curr_code   = ldwc_cust.getitemstring(ldwc_cust.getrow(),  "curr_code")
				ist_aroivc.balance_amt = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "balance_amt")
				ist_aroivc.bill_amount = ldwc_cust.getitemdecimal(ldwc_cust.getrow(), "bill_amount")
				ist_aroivc.saleman     = ldwc_cust.getitemstring(ldwc_cust.getrow(),  "salesman")		
		end choose
		
		st_salesman.text = ''
		st_level.text    = ''
		st_phone.text    = ''
		
		SELECT 
			B.USER_NAME, ISNULL(REPLACE(C.HP_NO,'-',''),''), A.CREDIT_LEVEL
		INTO 
			:ls_salesman, :ls_phone, :ls_level
		FROM 
			customer A	LEFT OUTER JOIN login   B ON A.SALESMAN = B.USER_ID
							LEFT OUTER JOIN salehp  C ON A.SALESMAN = C.USER_ID
		WHERE 
			cust_no   = :ls_cust_no
		using sqlca;

		st_salesman.text = ls_salesman
		st_level.text    = ls_level
		st_phone.text    = ls_phone
end choose



end event

type st_title from w_inheritance`st_title within w_ocaroivc_m
integer x = 41
integer y = 28
integer width = 974
integer height = 136
string text = "판매수금관리"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivc_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivc_m
boolean visible = false
integer x = 1659
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivc_m
boolean visible = false
integer x = 0
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_ocaroivc_m
integer x = 3694
integer y = 60
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivc_m
boolean visible = false
integer x = 0
integer y = 48
integer taborder = 50
end type

event pb_print::clicked;call super::clicked;//w_repsuper w_print
//
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivc_m
integer x = 3310
integer y = 60
integer taborder = 100
end type

event pb_cancel::clicked;//
if is_dw = "dw_3" then
	dw_3.reset()
	RETURN
end if

if GF_Permission('판매수금권한자', gs_userid) = 'Y' then
else
	messagebox("권한", "이프로그램의 사용권한이 없습니다.")
	RETURN
end if

long    ll_year
string  ls_month, ls_cust_no, ls_vc_no, ls_bevc_no
decimal lr_amount

if dw_2.getrow() < 1 then RETURN

if (dw_2.object.set_flag[1] = 'Y' AND dw_2.object.rcpt_type[1] <> 'P' ) then
	MessageBox("확인","어음이 이미 결재되어 취소하실수 없습니다!",information!) 
	RETURN
elseif MessageBox("취소","이 수금내역을 취소하시겠습니까?",question!,okcancel!,2) = 2 then
	RETURN
end if

//////////////////////////////////////////////////////////
// 마감통제 체크
//////////////////////////////////////////////////////////
string  ls_yyyymm, ls_magamyn
ls_yyyymm = string(dw_2.object.oi_date[1],"yyyymm")
SELECT magam_yn INTO :ls_magamyn FROM mmagam WHERE yyyymm LIKE :ls_yyyymm AND sys_gb = '00';
if ls_magamyn = "Y" then
	MessageBox("확인","수금년월이 마감되어 작업할 수 없습니다!",information!) 
	RETURN
end if
//////////////////////////////////////////////////////////

dw_4.triggerevent(rowfocuschanged!)

ls_vc_no   = dw_2.object.vc_no[1]
ls_cust_no = dw_2.object.cust_no[1]
lr_amount  = dw_2.object.amount[1]

if dw_2.object.rcpt_type[1] = 'B' then //어음일 경우
	//customer table의 어음미결액 update
	UPDATE customer 
	   SET bill_amount = bill_amount - :lr_amount
	 WHERE cust_no = :ls_cust_no;
	  
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		return
	end if
	
//	DELETE FROM glbill
//	      WHERE vc_no = :ls_vc_no; 
//
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
	if dw_2.object.vc_type[1] = 'P' and dw_2.object.bill_type[1] = 'T' then
		SELECT vc_no INTO :ls_bevc_no
		  FROM glbilldet
		 WHERE billdet_vcno = :ls_vc_no;
		 
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
		
		//타수된 어음을 지급에서 받을어음으로 update
		UPDATE glbill SET bill_class = 'R'
		 WHERE vc_no = :ls_bevc_no;
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
		
		//타수에 대한 어음상세내역 삭제
		DELETE FROM glbilldet
				WHERE billdet_vcno = :ls_vc_no;
		
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if
	else
		select vc_no into :ls_vc_no from glbilldet WHERE vc_no = :ls_vc_no;
		if sqlca.sqlcode <> 100 then
			rollback;
			messagebox("저장","어음처리내역이 존재합니다!",exclamation!)
			return
		end if

   	DELETE FROM glbill
	      WHERE vc_no = :ls_vc_no; 

	   if sqlca.sqlcode <> 0 then
		   rollback;
		   messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
	   	return
		end if		
	end if
end if

ll_year  = long(string(dw_2.object.oi_date[1], 'yyyy'))
ls_month = string(dw_2.object.oi_date[1], 'mm')
if dw_2.object.vc_type[1] = 'R' then //수금형태중 수금인 경우	
	//customer table의 미수금액 update
//	UPDATE customer 
//	   SET balance_amt = balance_amt + :lr_amount
//	 WHERE cust_no = :ls_cust_no;
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
//	//opeom table의 수금액 update
//	if wf_opeom_up2(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
else                                 //수금형태중 지불인 경우	
//	//customer table의 미수금액 update
//	UPDATE customer 
//	   SET balance_amt = balance_amt - :lr_amount 
//	 WHERE cust_no = :ls_cust_no;
//	  
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
	
//	//opeom table의 수금액 update
//	if wf_opeom_up1(ls_cust_no, ll_year, ls_month, lr_amount) = false then
//		rollback;
//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if
end if

dw_2.object.delete_key[1] = 'Y'
dw_2.accepttext()
if wf_update1(dw_2, 'N') = true then
	messagebox("취소","수금내역을 취소하였습니다.",information!)
	dw_2.reset()
	dw_4.reset()
	dw_4.retrieve(ls_cust_no)
end if

end event

type pb_delete from w_inheritance`pb_delete within w_ocaroivc_m
boolean visible = false
integer x = 1856
integer y = 60
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivc_m
integer x = 3118
integer y = 60
integer taborder = 40
end type

event pb_insert::clicked;if gf_permission('판매수금권한자', gs_userid) = 'Y' then
else
	messagebox("권한", "이프로그램의 사용권한이 없습니다.")
	return
end if

string ls_cust_no, ls_salesman, ls_phone, ls_level

if dw_1.accepttext() = -1 then return
ls_cust_no = dw_1.object.cust_no[1] 
if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
else
	st_salesman.text = ''
	st_level.text    = ''
	st_phone.text    = ''
	
	SELECT 
		B.USER_NAME, ISNULL(REPLACE(C.HP_NO,'-',''),''), A.CREDIT_LEVEL
	INTO 
		:ls_salesman, :ls_phone, :ls_level
	FROM 
		customer A	LEFT OUTER JOIN login   B ON A.SALESMAN = B.USER_ID
						LEFT OUTER JOIN salehp  C ON A.SALESMAN = C.USER_ID
	WHERE 
		cust_no   = :ls_cust_no
	using sqlca;

	st_salesman.text = ls_salesman
	st_level.text    = ls_level
	st_phone.text    = ls_phone	
end if 

dw_2.reset()
dw_2.insertrow(0)

dw_2.object.cust_no[1]   = ls_cust_no
dw_2.object.rcpt_type.background.color = 1087434968
dw_2.object.curr_code[1] = ist_aroivc.curr_code

SELECT balance_amt, bill_amount INTO :ist_aroivc.balance_amt, :ist_aroivc.bill_amount 
FROM customer
WHERE cust_no = :ls_cust_no;
dw_2.object.balance_amt[1] = ist_aroivc.balance_amt
dw_2.object.bill_amount[1] = ist_aroivc.bill_amount
dw_2.object.salesman[1]    = ist_aroivc.saleman
dw_2.object.oi_date[1]     = wf_today()

pb_save.enabled   = true
pb_cancel.enabled = false

dw_2.setcolumn("vc_inseq")
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivc_m
integer x = 2926
integer y = 60
integer taborder = 120
end type

event pb_retrieve::clicked;string ls_cust_no
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")

if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
else	
	dw_4.reset()
	dw_2.reset()
   dw_4.retrieve(ls_cust_no)
end if
end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivc_m
integer x = 1061
integer y = 16
integer width = 1801
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivc_m
integer y = 232
integer width = 4146
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivc_m
integer x = 2889
integer y = 16
integer width = 1029
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroivc_m
integer x = 1746
integer y = 416
integer width = 2437
integer height = 1348
integer taborder = 30
string dataobject = "d_ocaroivc_m"
boolean vscrollbar = false
end type

event dw_2::retrieveend;//
if this.getrow() > 0 then
	ir_amount = this.object.amount[1]
	this.object.a_bill_no[1] = this.object.cheque_no[1]
end if

if this.object.open_close[1] = 'C' then
	pb_cancel.enabled = false
	pb_save.enabled   = false
else
	pb_cancel.enabled = true
	pb_save.enabled   = true
end if

end event

event dw_2::itemchanged;call super::itemchanged;//
datetime ldt_oi_date, ldt_null, ldt_chequestart, ldt_chequeend
string   ls_curr_code, ls_rcpt_type, ls_vc_type
decimal  lr_exp_rate
long     ll_cnt 

this.AcceptText()

choose case dwo.name
	case "oi_date"
		if this.object.curr_code[1] <> 'WON' then
			ldt_oi_date  = this.object.oi_date[1]
			ls_curr_code = this.object.curr_code[1]
						
			SELECT exp_rate INTO :lr_exp_rate
			  FROM currency
			 WHERE curr_code = :ls_curr_code	AND curr_date = :ldt_oi_date;
					  
			if isnull(lr_exp_rate) or lr_exp_rate = 0 then
				this.object.gl_curr_rate[1] = 1
			else
				this.object.gl_curr_rate[1] = lr_exp_rate
			end if
		end if

	case "rcpt_type"		// if (isrownew(), 1087434968, 78682240)
		ls_vc_type   = this.object.vc_type[1]
		ls_rcpt_type = this.object.rcpt_type[1]
		
		if ls_vc_type = "R" and ls_rcpt_type = "N" then	// 수금/대손어음
			// 폰트칼러 유심히 볼것
		end if
	
	case "cheque_end"		// 어음만기일
		ls_rcpt_type    = this.object.rcpt_type[1]
		ldt_chequestart = this.object.cheque_start[1]
		
		if Not IsDate(string(Date(ldt_chequestart))) then
			MessageBox("확인","어음 발행일을 입력하시기 바랍니다.",information!)
			RETURN
		end if
		
		if ls_rcpt_type = "B" then
			SELECT TOP 1 DateAdd( month, 6, :ldt_chequestart ) INTO :ldt_chequeend FROM login;
			if data > string(ldt_chequeend) then
				MessageBox("확인","어음 만기일자는 6개월 이내 입니다.",information!)
				RETURN
			end if
		end if
	
	case "a_bill_no"
		this.object.cheque_no[1] = this.object.a_bill_no[1]
		
		SELECT count(*) INTO :ll_cnt 
		  FROM aroivc
		 WHERE cheque_no = :data AND delete_key = 'N' AND cheque_no is not null;
		if ll_cnt > 0 then
			MessageBox('경고', '어음번호가 중복 됩니다. 다시 확인하고 입력하세요.', stopsign!, ok!)
			RETURN 1	
		end if

	case "cheque_no"	// 어음번호
		if this.object.vc_type[1] = "P" and this.object.rcpt_type[1] = "B" and this.object.bill_type[1] = "T" then			
			this.getchild("cheque_no", idwc_cheque_no)
			idwc_cheque_no.settransobject(sqlca)
			
			this.object.amount[1]       = idwc_cheque_no.getitemdecimal(idwc_cheque_no.getrow(),  "bill_amount")
			this.object.cheque_start[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "start_date")
			this.object.cheque_end[1]   = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "close_date")
			this.object.large[1]        = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(),   "draft")
			this.object.bank_code[1]    = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(),   "bank_code")
			this.object.branch[1]       = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(),   "bill_area")
		end if
		
		if this.object.rcpt_type[1] = "P" then		// 처리어음
			this.getchild("cheque_no", idwc_cheque_no)
			idwc_cheque_no.settransobject(sqlca)
			
			this.object.cheque_start[1] = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "start_date")
			this.object.cheque_end[1]   = idwc_cheque_no.getitemdatetime(idwc_cheque_no.getrow(), "close_date")
			this.object.large[1]        = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(),   "draft")
			this.object.bank_code[1]    = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(),   "bank_code")
			this.object.branch[1]       = idwc_cheque_no.getitemstring(idwc_cheque_no.getrow(),   "bill_area")
		end if
		
		SELECT count(*) INTO :ll_cnt 
		  FROM aroivc 
		 WHERE cheque_no = :data AND delete_key = 'N' AND cheque_no is not null;
		if ll_cnt > 0 then
			MessageBox('경고', '어음번호가 중복 됩니다. 다시 확인하고 입력하세요.', stopsign!, ok!)
			RETURN 1	
		end if
		
	case "bill_type"
		setnull(ldt_null)
		this.object.amount[1]       = 0
		this.object.cheque_no[1]    = ''
		this.object.a_bill_no[1]    = ''
		this.object.cheque_start[1] = ldt_null
		this.object.cheque_end[1]   = ldt_null
		this.object.large[1]        = ''
		this.object.bank_code[1]    = ''
		this.object.branch[1]       = ''
end choose

end event

event dw_2::rbuttondown;//
CHOOSE CASE dwo.name
	CASE 'oi_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.oi_date[row] = datetime(date(message.stringparm))
		end if
END CHOOSE

this.accepttext()

end event

event dw_2::itemerror;call super::itemerror;//
choose case dwo.name
	case 'cheque_no'
		this.object.cheque_no[row] = ''
	case 'a_bill_no'
		this.object.a_bill_no[row] = ''
end choose

return 2
end event

event dw_2::itemfocuschanged;call super::itemfocuschanged;// DataWinodw AutoSelection = true 대체

choose case dwo.name
	case "amount"
		this.SelectText(1, LenA(GetText()) + 3)		// 금액전체 선택
end choose
end event

type st_3 from statictext within w_ocaroivc_m
integer x = 3493
integer y = 284
integer width = 251
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "휴대폰"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_phone from statictext within w_ocaroivc_m
integer x = 3749
integer y = 284
integer width = 581
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ocaroivc_m
integer x = 635
integer y = 196
integer width = 393
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "판매수금권한자"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_ocaroivc_m
integer x = 3991
integer y = 76
integer width = 1275
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "저장시 문자전송(신용: A,B,C,E,S )"
boolean checked = true
end type

type cbx_open from checkbox within w_ocaroivc_m
integer x = 2469
integer y = 296
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "사용불가 제외"
end type

event clicked;long   ll_row
string ls_open, ls_salesman

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if this.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

ls_salesman = "%"

dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
///////////////////////////////////////////

end event

type st_5 from statictext within w_ocaroivc_m
integer x = 4078
integer y = 144
integer width = 942
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "영업사원에게 문자 전송됨"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_ocaroivc_m
integer x = 32
integer y = 416
integer width = 1664
integer height = 1348
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_ocaroivc_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
if this.rowcount() > 0 then
	dw_2.retrieve(this.object.vc_no[this.getrow()])
	dw_2.object.rcpt_type.background.color = 78682240
end if
end event

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cb_1 from commandbutton within w_ocaroivc_m
integer x = 3013
integer y = 276
integer width = 457
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
end type

event clicked;// 여신현황
string  ls_custno, ls_custnm, ls_salesman
long    ll_row

ls_custno  = dw_1.object.cust_no[1]

ll_row     = idwc_cust_name.GetRow()
ls_custnm  = idwc_cust_name.GetItemString(ll_row, "cust_name")

if isnull(ls_custno) OR ls_custno = "" then RETURN

SELECT salesman INTO :ls_salesman FROM customer WHERE cust_no = :ls_custno;

if IsValid(w_o_main) then 
	OpenSheet(w_cdcustmaster_r,  w_o_main, 6, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcustmaster_r,  w_all_main, 6, original!)
end if

w_cdcustmaster_r.setredraw( false )
w_cdcustmaster_r.dw_salesman.object.user[1] = ls_salesman
w_cdcustmaster_r.dw_1.object.cust_no[1]     = ls_custno
w_cdcustmaster_r.dw_1.object.cust_name[1]   = ls_custnm
w_cdcustmaster_r.pb_retrieve.PostEvent( clicked! )
w_cdcustmaster_r.setredraw( true )

end event

type st_6 from statictext within w_ocaroivc_m
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_ocaroivc_m
integer x = 274
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

type ddlb_dwtitles from dropdownlistbox within w_ocaroivc_m
integer x = 306
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

type st_7 from statictext within w_ocaroivc_m
integer x = 745
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

type sle_value from singlelineedit within w_ocaroivc_m
integer x = 1234
integer y = 288
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

type cb_2 from commandbutton within w_ocaroivc_m
integer x = 1806
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

choose case is_dw
	case "dw_4"
		arg_dw  = dw_4
	case "dw_3"
		arg_dw  = dw_3
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_ocaroivc_m
integer x = 1970
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

choose case is_dw
	case "dw_4"
		arg_dw  = dw_4
	case "dw_3"
		arg_dw  = dw_3
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_ocaroivc_m
integer x = 2135
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

choose case is_dw
	case "dw_4"
		arg_dw  = dw_4
	case "dw_3"
		arg_dw  = dw_3
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ocaroivc_m
integer x = 2299
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

choose case is_dw
	case "dw_4"
		arg_dw  = dw_4
	case "dw_3"
		arg_dw  = dw_3
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_ocaroivc_m
integer x = 1710
integer y = 416
integer height = 1348
boolean bringtotop = true
end type

type st_level from statictext within w_ocaroivc_m
integer x = 622
integer y = 188
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean focusrectangle = false
end type

type st_salesman from statictext within w_ocaroivc_m
integer x = 622
integer y = 116
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 16777215
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ocaroivc_m
integer x = 1083
integer y = 140
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
long backcolor = 15780518
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_ocaroivc_m
integer x = 32
integer y = 1808
integer width = 4146
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_ocaroivc_d2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string  ls_custno, ls_custnm

if isnull(row) OR row < 1 then RETURN

choose case dwo.name
	case "cust_no"
		ls_custno = data
		
		SELECT cust_name INTO :ls_custnm FROM customer WHERE cust_no = :ls_custno;
		this.object.cust_name[row]  = ls_custnm
end choose

end event

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_horizontal from u_splitbar_horizontal within w_ocaroivc_m
integer x = 32
integer y = 1776
integer width = 4146
boolean bringtotop = true
end type

type cb_import from commandbutton within w_ocaroivc_m
integer x = 1947
integer y = 52
integer width = 293
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "붙여넣기"
end type

event clicked;//
string	ls_ddlb, ls_icubeno, ls_custno, ls_custname
string	ls_cheque_no, ls_large, ls_bank_code, ls_branch
date     ld_cheque_start, ld_cheque_end

long		ll_row, ll_rc
integer  iRet

if this.text = "엑셀" then
	WF_Excel_Import()
	// 열기
	pb_import.enabled = true
	RETURN
end if

//
//dw_3.Modify( "chk.width=0" )
ll_rc = dw_3.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then
	// Long. Returns the number of rows that were imported if it succeeds and returns 
	//       the following values if an error occurs:
	//  0  End of file, too many rows
	// -2  Not enough columns
	// -3  Invalid argument
	// -4  Invalid input
	
	ClipBoard("")
	// 열기
	dw_3.Modify( "chk.width=165" )
	pb_import.enabled = true

	//	
	ls_ddlb   = ddlb_1.text
	choose case ls_ddlb
		case "지급명세서(상계)"
			for ll_row = 1 to dw_3.rowcount()
				ls_icubeno    = dw_3.object.icube_no[ll_row]
				ls_custno     = dw_3.object.cust_no[ll_row]
				ls_custname   = dw_3.object.cust_name[ll_row]
	
				SELECT cust_no, cust_name INTO :ls_custno, :ls_custname FROM customer WHERE cust_no = :ls_custno;
				if isnull(ls_custno) OR ls_custno = "" then
					// 수정가능
					dw_3.object.use_yn[ll_row]    = "Y"		
				else
					dw_3.object.cust_no[ll_row]   = ls_custno
					dw_3.object.cust_name[ll_row] = ls_custname
				end if
			next
			
		case "수취인별어음정보"
			for ll_row = 1 to dw_3.rowcount()
				ls_custno     = dw_3.object.cust_no[ll_row]
				ls_custname   = dw_3.object.cust_name[ll_row]
	
				SELECT cust_no, cust_name INTO :ls_custno, :ls_custname FROM customer WHERE cust_no = :ls_custno;
				if isnull(ls_custno) OR ls_custno = "" then
					// 수정가능
					dw_3.object.use_yn[ll_row]    = "Y"		
				else
					dw_3.object.cust_no[ll_row]   = ls_custno
					dw_3.object.cust_name[ll_row] = ls_custname
				end if
			next
	end choose

	MessageBox("확인","데이터 가져오기 완료" )
end if
	

end event

type st_2 from statictext within w_ocaroivc_m
integer x = 1083
integer y = 56
integer width = 283
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "가져오기"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_ocaroivc_m
integer x = 1376
integer y = 52
integer width = 567
integer height = 324
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"지급명세서(상계)","수취인별어음정보","B2B매출내역명세"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
integer li_idx

choose case index
	case 1 
		cb_import.text  = "붙여넣기"
		dw_3.dataobject = "d_ocaroivc_d1"
	case 2
		cb_import.text  = "붙여넣기"
		dw_3.dataobject = "d_ocaroivc_d2"
	case 3
		cb_import.text  = "엑셀"
		dw_3.dataobject = "d_ocaroivc_d3"
end choose
dw_3.SetTransObject( SQLCA )


////
//string ls_colx
//
//ls_colx = string(integer(dw_3.object.chk.x) + integer(dw_3.object.chk.width))
//dw_3.object.datawindow.horizontalscrollsplit = ls_colx

end event

type pb_import from picturebutton within w_ocaroivc_m
integer x = 2601
integer y = 52
integer width = 242
integer height = 164
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "자동저장"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;// 자동저장
string   ls_ddlb, ls_chk, ls_vcinseq, ls_custno, ls_custname, ls_salesman, ls_rem
string	ls_cheque_no, ls_large, ls_bank, ls_branch, ls_bank_branch, ls_vc_type2, ls_baeseo6, ls_val[]
date     ld_cheque_start, ld_cheque_end
long     ll_row,  ll_amount

if dw_3.rowcount() < 1 then RETURN

if dw_3.object.tchk[1] < 1 then
	MessageBox("확인","작업할 대상을 선택하시기 바랍니다.")
	RETURN
end if

//
ls_ddlb  = ddlb_1.text
choose case ls_ddlb
	case "B2B매출내역명세"
		ib_message = true				
		
		for ll_row = 1 to dw_3.rowcount()
			ls_chk    = dw_3.object.chk[ll_row]
			
			if ls_chk = "Y" then
				ls_cheque_no     = dw_3.object.bill_no[ll_row]				// 어음번호
				ls_custno        = dw_3.object.cust_no[ll_row]				// 거래처
				ls_custname      = dw_3.object.cust_name[ll_row]			// 거래처명
				ls_bank          = dw_3.object.bank[ll_row]					// 은행
				ls_branch        = dw_3.object.branch[ll_row]				// 지점
				ll_amount        = dw_3.object.amount[ll_row]				// 금액
				ls_rem           = "전자결재_"+dw_3.object.acct[ll_row]	// 적요
				
				ld_cheque_start  = dw_3.object.cheque_start[ll_row]		// 발행일자
				ld_cheque_end    = dw_3.object.cheque_end[ll_row]			// 만기일자
				ls_large         = dw_3.object.icube_name[ll_row]			// 발행업체명

				if isnull(ls_custno) OR ls_custno = "" then
					MessageBox("확인","해당하는 판매거래처가 존재하지 않습니다.")
					dw_3.ScrollToRow( ll_row )
					RETURN
				end if
				
				if isnull(ls_custname) OR ls_custname = "" then
					MessageBox("확인","해당하는 거래처명이 존재하지 않습니다.")
					dw_3.ScrollToRow( ll_row )
					RETURN
				end if

				//
				SELECT salesman, cust_name INTO :ls_salesman, :ls_custname 
				  FROM customer 
				 WHERE cust_no = :ls_custno;
				
				// 조회
				dw_1.object.cust_no[1]    = ls_custno
				dw_1.object.cust_name[1]  = ls_custname
				pb_retrieve.TriggerEvent( clicked! )
				
				dw_3.ScrollToRow( ll_row )

				// 추가					
				pb_insert.TriggerEvent( clicked! )				
				
				dw_2.object.cheque_no[1]    = ls_cheque_no		// 어음번호
				dw_2.object.a_bill_no[1]    = ls_cheque_no
				
				dw_2.object.rcpt_type[1]    = "B" 					// 수금유형(어음)
				dw_2.object.salesman[1]     = ls_salesman			// 수금사원
				dw_2.object.amount[1]       = ll_amount			// 수금액
				dw_2.object.rem[1]          = ls_rem				// 적요

//            dw_2.Modify("cheque_no.Protect=0")
				dw_2.object.cheque_no[1]    = ls_cheque_no		// 어음번호
				dw_2.object.cheque_start[1] = ld_cheque_start	// 어음발행일
				dw_2.object.cheque_end[1]   = ld_cheque_end		// 어음만기일
				dw_2.object.large[1]	       = ls_large			   // 어음발행인
				dw_2.object.bank_code[1]	 = ls_bank     		// 은행명
				dw_2.object.branch[1]		 = ls_branch     	   // 지점명

				dw_2.object.curr_code[1]    = "WON"					// 통화코드
				dw_2.object.gl_curr_rate[1] = 1.0000				// 환율
				
				// 저장
				pb_save.TriggerEvent( clicked! )
			end if
		next
		ib_message = false				

	case "수취인별어음정보"
		ib_message = true				
		
		for ll_row = 1 to dw_3.rowcount()
			ls_chk    = dw_3.object.chk[ll_row]
			
			if ls_chk = "Y" then
				ls_custno        = dw_3.object.cust_no[ll_row]			// 거래처
				ls_custname      = dw_3.object.cust_name[ll_row]		// 거래처명
				ls_rem           = "전자결재-전자어음"						// 적요

				ls_cheque_no  	  = dw_3.object.bill_no[ll_row]			// 어음번호
				ls_cheque_no     = "A" + MidA(ls_cheque_no, 6, 6) + RightA(ls_cheque_no, 4)	// 어음번호

				ld_cheque_start  = dw_3.object.cheque_start[ll_row]	// 발행일자
				ld_cheque_end    = dw_3.object.cheque_end[ll_row]		// 만기일자
				ls_large         = dw_3.object.icube_name[ll_row]		// 발행업체명
				
				ls_bank_branch   = dw_3.object.bank_branch[ll_row]		// 지급은행및점포코드
//				GF_Split(ls_bank_branch, " ", ls_val)
//				ls_bank          = right(ls_val[1],4) + "%"				// 은행명
//          SELECT bank_code INTO :ls_bank FROM bank WHERE bank_name LIKE :ls_bank;				
//				ls_branch        = GF_ReplaceAll(ls_val[2], ")", "")  // 지점명
				ls_bank          = dw_3.object.bank[ll_row]				// 은행명
            SELECT bank_code INTO :ls_bank FROM bank WHERE bank_name LIKE :ls_bank;				
				ls_branch        = dw_3.object.branch[ll_row]			// 지점명
				
				ll_amount        = dw_3.object.baeseo4[ll_row]			// 배서금액
				
				// 01:자수, 02:타수, 03:융통, 04:전자결재, 05:기타
				ls_baeseo6       = dw_3.object.baeseo6[ll_row]			// 배서인법인명
				if isnull(ls_baeseo6) OR ls_baeseo6 = "" then 					
					ls_vc_type2   = "01"		// 자수
				else
					ls_vc_type2   = "02"		// 타수
				end if

				//
				SELECT salesman, cust_name INTO :ls_salesman, :ls_custname 
				  FROM customer 
				 WHERE cust_no = :ls_custno;
				if isnull(ls_custno) OR ls_custno = "" then
					MessageBox("확인","해당하는 판매거래처가 존재하지 않습니다.")
					dw_3.ScrollToRow( ll_row )
					RETURN
				end if
				
				if isnull(ls_custname) OR ls_custname = "" then
					MessageBox("확인","해당하는 거래처명이 존재하지 않습니다.")
					dw_3.ScrollToRow( ll_row )
					RETURN
				end if
				
				// 조회
				dw_1.object.cust_no[1]    = ls_custno
				dw_1.object.cust_name[1]  = ls_custname
				pb_retrieve.TriggerEvent( clicked! )
				
				dw_3.ScrollToRow( ll_row )

				// 추가					
				pb_insert.TriggerEvent( clicked! )
				dw_2.object.vc_inseq[1]     = ls_vcinseq			// 입금표
				dw_2.object.rcpt_type[1]    = "B" 					// 수금유형(어음)
				dw_2.object.salesman[1]     = ls_salesman			// 수금사원
				dw_2.object.amount[1]       = ll_amount			// 수금액
				dw_2.object.rem[1]          = ls_rem				// 적요
				
DEBUGBREAK()
				dw_2.object.cheque_no[1]    = ls_cheque_no		// 어음번호
				dw_2.object.a_bill_no[1]    = ls_cheque_no

				dw_2.object.cheque_start[1] = ld_cheque_start	// 어음발행일
				dw_2.object.cheque_end[1]   = ld_cheque_end		// 어음만기일
				dw_2.object.large[1]	       = ls_large			   // 어음발행인
				dw_2.object.bank_code[1]	 = ls_bank     		// 은행명
				dw_2.object.branch[1]		 = ls_branch        	// 지점명

				dw_2.object.vc_type2[1]     = ls_vc_type2			// 유형(기타)
				
				dw_2.object.curr_code[1]    = "WON"					// 통화코드
				dw_2.object.gl_curr_rate[1] = 1.0000				// 환율
				
				// 저장
				pb_save.TriggerEvent( clicked! )
			end if
		next
		ib_message = false				
		
	case "지급명세서(상계)"
		ib_message = true				
		
		for ll_row = 1 to dw_3.rowcount()
			ls_chk    = dw_3.object.chk[ll_row]
			
			if ls_chk = "Y" then
				ls_vcinseq  = dw_3.object.vc_inseq[ll_row]
				ls_custno   = dw_3.object.cust_no[ll_row]
				ls_custname = dw_3.object.cust_name[ll_row]
				ll_amount   = dw_3.object.amount[ll_row]
				ls_rem      = dw_3.object.rem[ll_row]
				ls_vc_type2 = "05"		// 유형(기타)
				
				if isnull(ls_custno) OR ls_custno = "" then
					MessageBox("확인","해당하는 판매거래처가 존재하지 않습니다.")
					dw_3.ScrollToRow( ll_row )
					RETURN
				end if
				
				if isnull(ls_custname) OR ls_custname = "" then
					MessageBox("확인","해당하는 거래처명이 존재하지 않습니다.")
					dw_3.ScrollToRow( ll_row )
					RETURN
				end if

				//
				SELECT salesman, cust_name INTO :ls_salesman, :ls_custname 
				  FROM customer 
				 WHERE cust_no = :ls_custno;
				
				// 조회
				dw_1.object.cust_no[1]    = ls_custno
				dw_1.object.cust_name[1]  = ls_custname
				pb_retrieve.TriggerEvent( clicked! )
				
				dw_3.ScrollToRow( ll_row )

				// 추가					
				pb_insert.TriggerEvent( clicked! )
				dw_2.object.vc_inseq[1]     = ls_vcinseq			// 입금표
				dw_2.object.rcpt_type[1]    = "S" 					// 수금유형(상계)
				dw_2.object.salesman[1]     = ls_salesman			// 수금사원
				dw_2.object.amount[1]       = ll_amount			// 수금액
				dw_2.object.rem[1]          = ls_rem				// 적요
				dw_2.object.vc_type2[1]     = ls_vc_type2			// 유형(자수타수)
				
				dw_2.object.curr_code[1]    = "WON"					// 통화코드
				dw_2.object.gl_curr_rate[1] = 1.0000				// 환율
				
				// 저장
				pb_save.TriggerEvent( clicked! )
			end if
		next
		ib_message = false						
end choose

// 잠금
this.enabled = false

end event

type cbx_all from checkbox within w_ocaroivc_m
integer x = 91
integer y = 224
integer width = 219
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체"
end type

event clicked;// 전체
string  ls_chk
long    ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_3.rowcount()
	dw_3.object.chk[ll_row]  = ls_chk
next

end event

type ddlb_op from dropdownlistbox within w_ocaroivc_m
integer x = 919
integer y = 284
integer width = 306
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type gb_4 from groupbox within w_ocaroivc_m
integer x = 3941
integer y = 16
integer width = 1403
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

