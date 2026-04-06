$PBExportHeader$w_scaning_m1.srw
$PBExportComments$절곡바코드 스캐닝
forward
global type w_scaning_m1 from w_ancestor
end type
type dw_2 from datawindow within w_scaning_m1
end type
type st_scan1 from statictext within w_scaning_m1
end type
type em_barcode from editmask within w_scaning_m1
end type
type em_qty from editmask within w_scaning_m1
end type
type dw_3 from datawindow within w_scaning_m1
end type
type st_scan2 from statictext within w_scaning_m1
end type
type st_scan3 from statictext within w_scaning_m1
end type
type em_time from editmask within w_scaning_m1
end type
type st_info from statictext within w_scaning_m1
end type
type cb_1 from commandbutton within w_scaning_m1
end type
type r_1 from rectangle within w_scaning_m1
end type
end forward

global type w_scaning_m1 from w_ancestor
integer width = 3826
integer height = 2604
string title = "스캐닝(w_scaning_m)"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "Form!"
event ue_dwnkey pbm_dwnkey
dw_2 dw_2
st_scan1 st_scan1
em_barcode em_barcode
em_qty em_qty
dw_3 dw_3
st_scan2 st_scan2
st_scan3 st_scan3
em_time em_time
st_info st_info
cb_1 cb_1
r_1 r_1
end type
global w_scaning_m1 w_scaning_m1

type prototypes
// 한글 키보드
FUNCTION long ImmGetContext(long hWnd) LIBRARY "imm32.dll"
FUNCTION long ImmSetConversionStatus(long hWnd, long a, long b) LIBRARY "imm32.dll"

end prototypes

type variables
//
time    it_scanstart		// 스캔시작
boolean ib_scan
integer ii_wid = 0, ii_dw2retrieve = 0, itime = 0
string  is_build = "N", is_sortcolumn, is_sortorder, is_coltype, is_filter, is_colname, is_op
end variables

forward prototypes
public subroutine wf_f2 ()
public subroutine wf_f4 ()
public subroutine wf_f1 ()
public subroutine wf_spacebar ()
public subroutine wf_f3 ()
public subroutine wf_f10 ()
public subroutine wf_f6 ()
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
public subroutine wf_f5 ()
public subroutine wf_f12 ()
public subroutine wf_f8 ()
public subroutine wf_f11 ()
public subroutine wf_barprint ()
end prototypes

event ue_dwnkey;// Key 이벤트
choose case key
	case KeySpaceBar!	// 행선택
		wf_spacebar()
		
	case KeyF1!			// F1:라인변경
		wf_F1()		
		
	case KeyF2!			// F2:작업자
		wf_F2()		
		
	case KeyF3!			// F3:기본정렬
		wf_F3()		
		
	case KeyF4!			// F4:스캐닝
		wf_F4()		
		
	case KeyF5!			// F5:조회
		wf_F5()		
				
	case KeyF6!			// F6:필터
		wf_F6()
		
	case KeyF8!    	// F8:저장
		wf_F8()		
		
	case KeyF10!		// F10:전체
		wf_F10()		
		
	case KeyF11!		// F11:라벨출력
		wf_F11()

	case KeyF12!		// F12:선택삭제
		wf_F12()

	case KeyF9!			// F9:종료
		close( this )
end choose

end event

public subroutine wf_f2 ();// 작업자
gs_where2 lstr_where
date   ld_sfcdate

string ls_wcno
long   ll_row

dw_r.accepttext()

ls_wcno = dw_r.object.line[1]
if isnull(ls_wcno) OR trim(ls_wcno) = "" then
	MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
	RETURN
end if

ld_sfcdate         = dw_r.object.date[1]					// 작업일자
lstr_where.str1[1] = ls_wcno									// 작업장
lstr_where.str2[1] = string(ld_sfcdate, 'yyyy/mm/dd')	// 작업일자(문자)
lstr_where.name[1] = dw_r.object.wc_nm[1]				   // 작업장명

OpenWithParm(w_sfcdayuser_m, lstr_where)
lstr_where = Message.PowerObjectParm

end subroutine

public subroutine wf_f4 ();// 스캐닝
dw_1.visible = true		// 스캐닝데이터
dw_2.visible = false		// 
dw_r.object.value.visible = true		// 클릭한 값

string ls_wc, ls_message
long   ll_row

dw_r.accepttext()
ls_wc = dw_r.object.line[1]
if isnull(ls_wc) OR trim(ls_wc) = "" then
	MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
	RETURN
end if

// 스캐닝
dw_r.object.b_f04.background.mode  = 0
dw_r.object.b_f04.background.color = rgb(255, 102, 204)

// 조회
dw_r.object.b_f05.background.mode  = 0
dw_r.object.b_f05.background.color = 67108864 // rgb(240, 240, 240)

// 스캐닝
timer( integer(em_time.text) )

ib_scan = true
it_scanstart = time(now())
st_scan3.visible   = false

em_barcode.enabled = true
em_qty.enabled     = true
st_scan3.visible   = false		// 대기상태

// 수량변경
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.updateqty[ll_row] = "N"
next

//ls_message  = "바코드 스캐닝은 영문키보드 상태에서 작업하시기 바랍니다.~r~r"
//ls_message += "스캐닝 종료는 0000 입력하시면 됩니다."
//MessageBox("확인", ls_message, Exclamation!)

em_qty.text     = "1"
em_barcode.text = ""
em_barcode.setfocus()

end subroutine

public subroutine wf_f1 ();// 생산라인 선택
gs_where lst_code
OpenWithParm(w_wc, lst_code)
lst_code = message.powerobjectparm
if lst_code.chk = "N" then return

dw_1.Reset() ; dw_2.Reset()

gs_workno    = lst_code.str1		// 작업장
gs_workname  = lst_code.name		// 작업장명
gs_username  = lst_code.str2		// 기장명

//////////////////////////
// 초기화
//////////////////////////
dw_r.Reset()

dw_r.InsertRow(0)		// 생산라인, 작업일자
dw_r.object.date[1]    = gd_date			// 시스템일자
dw_r.object.line[1]    = lst_code.str1
dw_r.object.wc_nm[1]   = lst_code.name
dw_r.object.user_nm[1] = lst_code.str2

// F05: 조회
dw_r.object.b_f05.visible = true		

TriggerEvent('ue_retrieve')

end subroutine

public subroutine wf_spacebar ();// 행선택
long   ll_dw1row, ll_cnt, ll_cnt2, ll_prtmax
string ls_wcno

if dw_1.rowcount() < 1 then RETURN

ll_dw1row = dw_1.getrow()	
if ll_dw1row < 1 then RETURN

// 선택
dw_1.SelectRow(ll_dw1row, NOT dw_1.IsSelected(ll_dw1row))
if dw_1.IsSelected(ll_dw1row) then
	dw_1.object.chk[ll_dw1row] = "Y"
else
	dw_1.object.chk[ll_dw1row] = "N"
end if

end subroutine

public subroutine wf_f3 ();// 정렬
string ls_wcno

ls_wcno = dw_r.object.line[1]

dw_1.SetSort( "seq A" )
dw_1.Sort()

dw_r.object.b_f03.background.mode  = 0
dw_r.object.b_f03.background.color = 67108864 // rgb(240, 240, 240)

end subroutine

public subroutine wf_f10 ();// 전체선택하기
string ls_wcno
long   ll_row

ls_wcno = dw_r.object.line[1]

for ll_row = 1 to dw_1.rowcount()
	dw_1.scrolltorow( ll_row )
	wf_spacebar()
next

end subroutine

public subroutine wf_f6 ();// 필터
string ls_wcno, ls_colname, ls_coltype, ls_op, ls_text, ls_filter

ls_wcno    = dw_r.object.line[1]
ls_text    = dw_r.object.value[1]
ls_text    = trim(ls_text)

ls_coltype = is_coltype
ls_colname = is_colname
ls_op      = is_op

choose case LeftA(ls_coltype,4)
	case "char"
		ls_filter = ls_colname + " " + ls_op + " '%" + ls_text + "%'"

	case else
		ls_filter = ls_colname + " " + ls_op + ls_text
end choose

// 절곡, 도장반만 실행함
//choose case ls_wcno
//	case "B01", "P01", "P02"
		if LenA(ls_text) > 0 then
		else
			ls_filter = ""
		end if		
		dw_1.SetFilter( ls_filter )
		dw_1.Filter()
		
		dw_r.object.b_f06.background.mode  = 0
		if ls_filter = "" then
			dw_r.object.b_f06.background.color = 67108864 // rgb(240, 240, 240)
		else
			dw_r.object.b_f06.background.color = rgb(255, 102, 204)
		end if
//end choose


end subroutine

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);// 저장하기
string ls_errtext

if arg_dw1.update() = 1 then
	COMMIT;
	if (arg_str = "Y") OR (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	RETURN true
else
	ROLLBACK;
	MessageBox("오류", "저장 실패!")
	RETURN false
end if

end function

public subroutine wf_f5 ();// 조회
timer(0)
ib_scan = false

em_barcode.enabled = false
em_qty.enabled     = false
st_scan3.visible   = true

dw_r.setfocus()
TriggerEvent('ue_retrieve')

end subroutine

public subroutine wf_f12 ();// 선택삭제
long	ll_row, ll_cnt

dw_1.accepttext()

for ll_row = dw_1.rowcount() to 1 step -1
	if dw_1.object.chk[ll_row] = "Y" then
		ll_cnt = ll_cnt + 1
		dw_1.deleterow( ll_row )
	end if
next

if ll_cnt > 0 then
	if MessageBox("확인","저장 하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 then		
		wf_update1( dw_1, "Y" )		
		wf_f5()		// 조회
	end if
else
	MessageBox("확인","삭제할 대상을 먼저 선택하시기 바랍니다.")
end if

end subroutine

public subroutine wf_f8 ();// 저장
long  ll_row

ll_row  = dw_1.getrow()

timer(0)
ib_scan = false

em_barcode.enabled = false
em_qty.enabled     = false
st_scan3.visible   = true

dw_1.accepttext()

wf_update1( dw_1, "Y" )

wf_f5()		// 조회

dw_1.enabled = true
dw_1.scrolltorow( ll_row )

end subroutine

public subroutine wf_f11 ();// 라벨출력
long   ll_dw1row, ll_cnt, ll_cnt2, ll_prtmax
string ls_wcno

if dw_1.rowcount() < 1 then RETURN

ll_dw1row = dw_1.getrow()	
if ll_dw1row < 1 then RETURN

// 선택
dw_1.SelectRow(ll_dw1row, NOT dw_1.IsSelected(ll_dw1row))
if dw_1.IsSelected(ll_dw1row) then
	dw_1.object.chk[ll_dw1row] = "Y"
else
	dw_1.object.chk[ll_dw1row] = "N"
end if

end subroutine

public subroutine wf_barprint ();// 절곡반 라벨 프린트
string  ls_chk, ls_custnm, ls_scenenm, ls_qa, ls_bigo, ls_oldprinter
long    ll_row, ll_prtcnt
integer li_ret

if dw_1.object.tchk[1] < 1 then
	MessageBox("확인","라벨출력 대상을 선택하시기 바랍니다.")
	RETURN
end if

if MessageBox("확인","절곡반 제품 라벨을 출력 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN

dw_1.accepttext()

debugbreak()
dw_3.SetTransObject(SQLCA)

ls_oldprinter = PrintGetPrinter()

//long   ll_place
//string ls_setprn
//string ls_prntrs = PrintGetPrinters()
//
//ll_place   = pos(ls_prntrs, "~n") 
////mle_1.text = PrintGetPrinters()
//ls_setprn  = Left(ls_prntrs, ll_place - 1)
//PrintSetPrinter( ls_setprn )


PrintSetup()

for ll_row = 1 to dw_1.rowcount()
	ls_chk = dw_1.object.chk[ll_row]
	if isnull(ls_chk) OR ls_chk = "N" then CONTINUE
	
	/////////////////////////////////////////////////////////////////////
	// 절곡반 제품개별라벨
	/////////////////////////////////////////////////////////////////////

	dw_3.object.scene_name[1] = dw_1.object.scene_desc[ll_row]
	dw_3.object.cust_name[1]  = dw_1.object.cust_name[ll_row]
	ls_qa                     = dw_1.object.qa[ll_row]
   dw_3.object.qa[1]         = MidA(ls_qa, 5, 9)
	dw_3.object.qa[1]         = GF_ReplaceAll(dw_3.object.qa[1], 'X', ' * ')
	dw_3.object.order[1]      = dw_1.object.sale_no[ll_row] + "-" + string(dw_1.object.seq_no[ll_row])
	
   ls_bigo    = dw_1.object.salerem[ll_row]
   ll_prtcnt  = dw_1.object.scan_qty[ll_row]			// 출력장수

	dw_3.object.scene_t[1]    = "현장명"
	dw_3.object.qa_t[1]       = "규  격"
	dw_3.object.cust_t[1]     = "거래처"
	dw_3.object.order_t[1]    = "수  주"

	if isnull(ls_bigo) OR ls_bigo = "" then
	else
		dw_3.object.cust_t[1]     = "구  분"
		dw_3.object.cust_name[1]  = ls_bigo
	end if

	dw_3.modify("DataWindow.print.margin.left = 0 ")
	dw_3.modify("DataWindow.print.margin.top  = 0 ")
	dw_3.Modify("DataWindow.Print.Orientation = 2 DataWindow.Print.Copies = " + string(ll_prtcnt) )

	dw_3.print()		// 출력
	/////////////////////////////////////////////////////////////////////
next
PrintSetPrinter( ls_oldprinter )

MessageBox("확인", "출력완료")

end subroutine

on w_scaning_m1.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.st_scan1=create st_scan1
this.em_barcode=create em_barcode
this.em_qty=create em_qty
this.dw_3=create dw_3
this.st_scan2=create st_scan2
this.st_scan3=create st_scan3
this.em_time=create em_time
this.st_info=create st_info
this.cb_1=create cb_1
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.st_scan1
this.Control[iCurrent+3]=this.em_barcode
this.Control[iCurrent+4]=this.em_qty
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_scan2
this.Control[iCurrent+7]=this.st_scan3
this.Control[iCurrent+8]=this.em_time
this.Control[iCurrent+9]=this.st_info
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.r_1
end on

on w_scaning_m1.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.st_scan1)
destroy(this.em_barcode)
destroy(this.em_qty)
destroy(this.dw_3)
destroy(this.st_scan2)
destroy(this.st_scan3)
destroy(this.em_time)
destroy(this.st_info)
destroy(this.cb_1)
destroy(this.r_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, This.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), This.Title )
//================================================================================================
string ls_title, ls_time

//////////////////////////
// 화면확대 취소
//////////////////////////
ib_exec = false		
//////////////////////////

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)		

dw_1.visible = true		// 작업지시
dw_2.visible = false		// 사용자재(잔량)
dw_3.visible = false		// 바코드출력

//////////////////////////
// 초기화
//////////////////////////
dw_r.Reset() ; dw_1.Reset()

ib_scan = false
em_barcode.enabled = false
em_qty.enabled     = false
st_scan3.visible   = true

ls_time      = ProfileString("YCLINE.INI","Database","SCANTIME", " ")
if isnull(ls_time) OR ls_time = "" then ls_time = "1"
em_time.text = ls_time

dw_r.InsertRow(0)		// 생산라인, 작업일자

dw_r.object.date[1] 		= gd_date		// 시스템일자
dw_r.object.line[1] 		= gs_workno		// 작업장선택
dw_r.object.wc_nm[1]		= gs_workname	// 작업장명
dw_r.object.user_nm[1]  = gs_username	// 기장명

dw_r.object.b_f01.visible = false		// F01: 라인변경
dw_r.object.b_f02.visible = false		// F02: 작업자
dw_r.object.b_f04.visible = true			// F04: 스캐닝
dw_r.object.b_f04.background.mode  = 0
dw_r.object.b_f04.background.color = rgb(255, 102, 204)

dw_r.object.b_f05.visible = true			// F05: 조회
dw_r.object.b_f05.background.mode  = 0
dw_r.object.b_f05.background.color = 67108864 // rgb(240, 240, 240)

dw_r.object.b_f08.visible = true    	// F08:저장
dw_r.object.b_f08.background.mode  = 0
dw_r.object.b_f08.background.color = rgb(255, 102, 204)

dw_r.object.b_f11.visible = true			// F11:라벨출력
dw_r.object.b_f12.visible = true			// F12:선택삭제

// 스캐닝
em_qty.text     = "0"
em_barcode.text = ""

Postevent( "ue_retrieve" )

end event

event ue_clear;call super::ue_clear;//
dw_r.Reset() ; dw_1.Reset()

dw_r.InsertRow(0)		// 생산라인, 작업일자
dw_r.object.date[1] = gd_date			// 시스템일자
dw_r.object.line[1] = gs_workno		// 작업장선택
dw_r.object.wc_nm[1]= gs_workname	// 작업장명


end event

event ue_retrieve;call super::ue_retrieve;// 조회
string   ls_wcno, ls_jobno, ls_useyn
long     ll_row
date     ld_date1, ld_date3	// 시스템시간 -> 시스템일자 변환
datetime ldt_date2				// 시스템일자
datetime ldt_sdate, ldt_edate

dw_r.accepttext()

ls_wcno  = dw_r.GetItemString(1, "line")	// 작업라인
ls_jobno = LeftA(ls_wcno,1) + '%'				// 근태신청서
ld_date1 = dw_r.object.date[1]				// 작업일자

SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자
ld_date3 = date(ldt_date2)
		
if ld_date1 < ld_date3 then		// 작업일자 < 시스템일자
	MessageBox("조회","시스템일자[" + string(ld_date3,"yyyy/mm/dd") + &
	           "] 보다~n~n작은 작업일자[" + string(ld_date1,"yyyy/mm/dd")+"]는 작업이 불가능 합니다.")
	RETURN
end if

ldt_sdate = datetime(ld_date1, time("00:00:00 000"))
ldt_edate = datetime(ld_date1, time("23:59:59 999"))

// 스캔내용
if dw_1.visible = true then		
	dw_1.Retrieve( ls_wcno, ldt_sdate, ldt_edate )
	if dw_1.rowcount() < 1 then
		MessageBox("확인","해당하는 일자의 스캔내용이 존재하지 않습니다.",Exclamation!)
	else
		for ll_row = 1 to dw_1.rowcount()
			dw_1.object.updateqty[ll_row] = "Y"
		next
	end if
	dw_1.setfocus()
end if

em_barcode.text = ""
em_barcode.setfocus()


end event

event resize;call super::resize;//////////////////////////
// 화면확대 취소
//////////////////////////
ib_exec = false		
//////////////////////////

// 작업장정보
dw_r.width  = newwidth  - 36

// 작업내용
dw_1.width  = newwidth  - 36
dw_1.height = newheight - 684

dw_r.Object.DataWindow.Zoom = gl_resolution

if dw_1.dataobject <> "" then
	dw_1.Object.DataWindow.Zoom = gl_resolution
end if
if dw_2.dataobject <> "" then
//	dw_2.Object.DataWindow.Zoom = gl_resolution
end if

if dw_3.dataobject <> "" then
//	dw_3.Object.DataWindow.Zoom = gl_resolution
end if


end event

event ue_close;call super::ue_close;//
Close(This)
end event

event timer;call super::timer;//
string ls_time
long   ll_seconds
time   lt_time

//if ib_scan = true then
//	itime = itime + 1
//	if itime > 10 then
//		itime = 0
//		st_scan2.visible = true
//	end if
//
//	// 스캔시간 
//	ll_seconds   = SecondsAfter(it_scanstart, now())
//	lt_time      = RelativeTime(00:00:00, ll_seconds)
//	if Second(lt_time) > 1 then
//		st_scan2.visible = false
//	else
//		st_scan2.visible = true
//	end if
//end if
//

st_scan2.visible = NOT st_scan2.visible

end event

type dw_1 from w_ancestor`dw_1 within w_scaning_m1
integer x = 14
integer y = 664
integer width = 3758
integer height = 1816
string title = "작업일보"
string dataobject = "d_scaning_m"
boolean hsplitscroll = false
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

// 스캐닝작업중 이동불가
if ib_scan = true then
//	MessageBox("확인","바코드 스캐닝 작업중입니다.")
	em_barcode.setfocus()
	RETURN
end if

this.scrolltorow(row)

// 정렬하기 
string ls_wcno
string ls_sortstr, ls_colname
long   ll_strlen

ls_wcno    = dw_r.object.line[1]

ls_colname = dwo.name

if RightA(ls_colname, 2) = "_t" then // column header 선택		
	ll_strlen  = LenA(ls_colname) - 2
	ls_sortstr = LeftA(ls_colname, ll_strlen)
	
	//
	if	is_sortcolumn = ls_sortstr then
		if is_sortorder = "A" then
			is_sortcolumn= ls_sortstr
			is_sortorder = "D"
		elseif is_sortorder = "D" then
			is_sortcolumn= ls_sortstr
			is_sortorder = "A"
		else
			is_sortcolumn= ls_sortstr
			is_sortorder = "A"
		end if
	else
		is_sortcolumn= ls_sortstr
		is_sortorder = "A"
	end if

	// 절곡, 도장반만 정렬하기
	choose case ls_wcno
		case "B01", "P01", "P02"
			// 정렬표시
			dw_r.object.b_f03.background.mode  = 0
			dw_r.object.b_f03.background.color = rgb(255, 102, 204)
		
			// 기본 Sort:( mpsorder_order A, order_seq A )
			dw_1.SetSort( is_sortcolumn + " " + is_sortorder )		// dw_1.SetSort( "#1 A, #2 D" )
			dw_1.Sort()		
	end choose
else											// column data 선택
	// 필터하기
	string ls_type, ls_op, ls_text

	ls_colname= dwo.name
	if ls_colname = "compute_1" then ls_colname = "qa"
	
	ls_type    = this.Describe(ls_colname + ".coltype")
	ls_op      = "="
	
	choose case LeftA(ls_type,4)
		case "char"
			ls_op   = "LIKE"
			ls_text = string( this.GetItemString( row, ls_colname ) )
		case "deci"
			ls_op   = "="
			ls_text = string( this.GetItemDecimal( row, ls_colname ) )
		case "numb", "long"
			ls_op   = "="
			ls_text = string( this.GetItemNumber( row, ls_colname ) ) 		
		case "time"
			ls_op   = "="
			ls_text = string( this.GetItemTime( row, ls_colname ) )
		case "date"
			ls_op   = ">="
			if ls_type = "datetime" then
				ls_text = string( this.GetItemDateTime( row, ls_colname ) )		
			else
				ls_text = string( this.GetItemDate( row, ls_colname ) )
			end if
	end choose
	
	dw_r.object.value[1] = ls_text
	is_colname = ls_colname
	is_coltype = ls_type
	is_op      = ls_op
	dw_1.setfocus()
end if

end event

event dw_1::ue_key;call super::ue_key;/////////////////////////////////////////////////////////////////////////////////////////
// ReturnType(long) use_key
// argument Type keycode, key
// unsignedlong, keyflags
// EventID : pbm_dwnkey
/////////////////////////////////////////////////////////////////////////////////////////
string   ls_scanno, lsa_scanno[], ls_workno, ls_worknm
string   ls_custno, ls_custnm,  ls_scene, ls_scenenm, ls_saleno, ls_itemno, ls_itemnm, ls_qa
long     ll_seqno,  ll_cnt, ll_row, ll_found
date     ldt_date1
datetime ldt_date2, ldt_scandate

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

if ldt_date1 <> date(ldt_date2) then
	MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
	RETURN
end if
/////////////////////////////////////////////////////////////////////////////////////////

// 작업장
ls_worknm   = dw_r.object.wc_nm[1]

choose case this.GetColumnName()
	case "scan_no", "scan_qty"
		THIS.AcceptText()
end choose

ll_row = this.getrow()
choose case key
	case KeyEnter!
		debugbreak()

		if this.GetColumnName() = "scan_qty" then
			this.SetColumn("scan_no")
			this.SetRow(ll_row)
			RETURN
		elseif this.GetColumnName() = "scan_no" then
			ls_scanno = this.object.scan_no[this.Getrow()]
			// 수주번호,순번
			GF_SPLIT(ls_scanno, "-", lsa_scanno)
			if upperbound(lsa_scanno) > 1 then
				ls_saleno = lsa_scanno[1] + "-" + lsa_scanno[2]
			end if
			if upperbound(lsa_scanno) > 2 then
				ll_seqno  = long(lsa_scanno[3])
			end if

			SELECT count(*) INTO :ll_cnt FROM sale WHERE order_no = :ls_saleno;
			if ll_cnt < 1 then 
				MessageBox("확인","해당하는 수주번호는 존재하지 않습니다.~n~r바코드를 스캐닝하시기 바랍니다.")
				this.object.scan_no[ll_row] = ""
				this.SetColumn("scan_no")
				this.SetRow(ll_row)
				RETURN
			end if	
			
			ll_found = dw_1.find( "scan_no = '"+ls_scanno+"'", 1, dw_1.rowcount() )
			if ll_found > 0 then
//				dw_1.SelectRow(0, false)			// 선택지우기
//				dw_1.SelectRow(ll_found, true)	// 선택표시
			
				// 중복번호 수량증가
				ls_workno    = dw_1.object.work_no[ll_found]
				ls_custno    = dw_1.object.cust_no[ll_found]
				ldt_scandate = dw_1.object.scan_date[ll_found]
				
				if isnull(ls_custno) OR ls_custno = "" OR (ll_found = dw_1.rowcount()) then
					// 
				else
					ll_cnt = dw_1.object.scan_qty[ll_found]
					ll_cnt = ll_cnt + 1
					dw_1.object.scan_qty[ll_found] = ll_cnt
				
					this.object.scan_no[ll_row] = ""
					this.SetColumn("scan_no")
					this.SetRow(ll_row)
					RETURN
				end if
			end if
			
			dw_1.scrolltorow( ll_row )

			dw_1.object.work_no[ll_row]    = gs_workno
			dw_1.object.scan_date[ll_row]  = GF_today()
			dw_1.object.scan_no[ll_row]    = ls_scanno
			dw_1.object.scan_qty[ll_row]   = 1
			dw_1.object.sale_no[ll_row]    = ls_saleno
			dw_1.object.seq_no[ll_row]     = ll_seqno
			
			ls_custnm = "" ; ls_scenenm = "" ; ls_itemnm = "" ; ls_qa = ""
			
			if isnull(ls_saleno) OR ls_saleno = "" then
				//
			else
				if isnull(ll_seqno) OR ll_seqno = 0 then
					SELECT b.cust_no, b.scene_code, a.item_no, a.qa, c.cust_name, d.scene_desc, null
					  INTO :ls_custno, :ls_scene, :ls_itemno, :ls_qa, :ls_custnm, :ls_scenenm, :ls_itemnm
					  FROM saledet A (nolock)
							 LEFT OUTER JOIN sale      B (nolock) ON a.order_no   = b.order_no
							 LEFT OUTER JOIN customer  C (nolock) ON b.cust_no    = c.cust_no
							 LEFT OUTER JOIN scene     D (nolock) ON b.scene_code = d.scene_code
					 WHERE a.order_no = :ls_saleno;
				else
					SELECT b.cust_no, b.scene_code, a.item_no, a.qa, c.cust_name, d.scene_desc, e.item_name
					  INTO :ls_custno, :ls_scene, :ls_itemno, :ls_qa, :ls_custnm, :ls_scenenm, :ls_itemnm
					  FROM saledet A (nolock)
							 LEFT OUTER JOIN sale      B (nolock) ON a.order_no   = b.order_no
							 LEFT OUTER JOIN customer  C (nolock) ON b.cust_no    = c.cust_no
							 LEFT OUTER JOIN scene     D (nolock) ON b.scene_code = d.scene_code
							 LEFT OUTER JOIN groupitem E (nolock) ON a.item_no    = e.item_no
					 WHERE a.order_no = :ls_saleno AND a.seq_no = :ll_seqno;
				end if
			end if
			
			dw_1.object.cust_no[ll_row]    = ls_custno
			dw_1.object.scene_code[ll_row] = ls_scene
			dw_1.object.item_no[ll_row]    = ls_itemno
			dw_1.object.qa[ll_row]         = ls_qa
			dw_1.object.user_id[ll_row]    = gs_userid
			
			dw_1.object.work_name[ll_row]  = ls_worknm
			dw_1.object.cust_name[ll_row]  = ls_custnm
			dw_1.object.scene_desc[ll_row] = ls_scenenm
			dw_1.object.item_name[ll_row]  = ls_itemnm
			dw_1.object.user_name[ll_row]  = gs_username
			dw_1.object.chk[ll_row]        = "N"
			dw_1.object.updateqty[ll_row]  = "Y"
			
			wf_update1( dw_1, "N" )
			cb_1.triggerevent( clicked! )
			dw_1.scrolltorow( dw_1.rowcount() )
		end if
		
	case KeyEscape!				// 작업일자
		dw_r.setcolumn('date')
		dw_r.setfocus()
		
	case KeySpaceBar!				// 행선택
		wf_spacebar()
		
	case KeyF1!, KeyEscape!		// F1:라인변경
		dw_1.SelectRow(0, FALSE)
		wf_F1()			
		
	case KeyF2!						// F2:작업자추가
		wf_F2()
		
	case KeyF3!						// F3:기본정렬
		wf_F3()
		
	case KeyF4!						// F4:스캐닝
		wf_F4()
		
	case KeyF5!						// F5:조회
		wf_F5()
		
	case KeyF6!						// F6:필터
		wf_F6()
		
	case KeyF8!						// F8:저장
		wf_F8()
		
	case KeyF10!					// F10:전체선택
		wf_F10()

	case KeyF11!					// F11:라벨출력
		wf_F11()
	
	case KeyF12!					// F12:선택삭제
		wf_F12()

	case KeyF9!						// F9:종료
		close( parent )
end choose

end event

event dw_1::editchanged;call super::editchanged;//
if ib_scan = true then
	choose case dwo.name
		case "scan_qty"
			em_barcode.setfocus()
	end choose
else
	RETURN 1
end if

end event

event dw_1::getfocus;call super::getfocus;//
if ib_scan = true then
	MessageBox("확인","바코드 스캐닝 작업중입니다.")
	em_barcode.setfocus()
end if

end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;// DataWinodw AutoSelection = true 대체
choose case dwo.name
	case "scan_qty"
		this.SelectText(1, LenA(GetText()) + 3)		// 수량전체 선택
end choose

end event

type dw_r from w_ancestor`dw_r within w_scaning_m1
integer x = 14
integer y = 4
integer width = 3758
integer height = 392
string dataobject = "d_scan_r"
end type

event dw_r::ue_enter;call super::ue_enter;//
string   ls_line
gs_where lst_code

this.accepttext()

ls_line = this.object.line[1]
if isnull(ls_line) OR trim(ls_line) = "" then
	OpenWithParm( w_wc, lst_code )
	lst_code = Message.PowerObjectParm
	if lst_code.chk = "N" then RETURN
	
	dw_1.Reset() ; dw_2.Reset()
	
	dw_r.object.line[1]    = lst_code.str1
	dw_r.object.wc_nm[1]   = lst_code.name
	dw_r.object.user_nm[1] = lst_code.str2
end if

Parent.TriggerEvent("ue_retrieve")

end event

event dw_r::ue_key;call super::ue_key;//
string ls_wc, ls_area

dw_r.accepttext()
ls_wc = dw_r.object.line[1]

choose case key
	case KeyF1!, KeyF9!		// 생산라인, 종료
		
	case else
		if isnull(ls_wc) OR trim(ls_wc) = "" then
			MessageBox("확인", 'F1을 선택하여 생산라인을 먼저 선택하십시요')
			RETURN
		end if
end choose

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// F1:생산라인 F2:작업자 F3: 기본정렬 F4:스캐닝  F5:조회 F6: 필터 F8:저장 F11:라벨출력 F12:선택삭제 F9:종료
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
long     ll_row
date     ldt_date1
datetime ldt_date2

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

choose case key
	case KeyF4!, KeyF5!, KeyF8!, KeyF12!	// F4:스캐닝,F5:조회,F8:저장,F12:선택삭제
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if
end choose

choose case key
	case KeyF1!			// F1:라인변경
		wf_F1()

	case KeyF2!			// F2:작업자추가
		wf_F2()
		
	case KeyF3!			// F3:기본정렬
		wf_F3()
		
	case KeyF4!			// F4:스캐닝
		wf_F4()

	case KeyF5!			// F5:조회
		wf_F5()
		
	case KeyF6!			// F6:필터
		wf_F6()
		
	case KeyF8!			// F8:저장
      wf_F8()
		
	case KeyF10!		// F10: 전체선택
		wf_F10()
		
	case KeyF11!		// F11: 라벨출력
		wf_F11()
		
	case KeyF12!		// F12: 선택삭제
		wf_F12()

	case KeyF9!			// F9: 종료
		Close(Parent)
end choose

end event

event dw_r::itemchanged;call super::itemchanged;// 라인, 작업일자
long     ll_row
string   ls_wc_nm
date     ld_date1, ld_date3	// 시스템시간 -> 시스템일자 변환
datetime ldt_date2				// 시스템일자

choose case dwo.name
	case "line"
		SELECT work_name INTO :ls_wc_nm FROM wc WHERE work_no = :data;
		if SQLCA.Sqlcode <> 0 then
			this.SetItem(row, "wc_nm", "미등록 코드")
		else
			this.SetItem(row, "wc_nm", ls_wc_nm)
		end if

		dw_1.reset()
		dw_2.reset()
		this.AcceptText()
		
	case "date"
		ld_date1 = date(data)
		ld_date1 = this.object.date[this.getrow()]

		SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자
		ld_date3 = date(ldt_date2)
		
		if ld_date1 < ld_date3 then		// 작업일자 < 시스템일자
			MessageBox("확인","시스템일자[" + string(ld_date3,"yyyy/mm/dd") + &
			           "] 보자 이전일자의 ~n~n작업일자[" + string(ld_date1,"yyyy/mm/dd")+"]는 작업이 불가능 합니다.")
			RETURN 1
		end if

		dw_1.reset()
		dw_2.reset()
		this.AcceptText()		
end choose

end event

event dw_r::itemerror;call super::itemerror;//
datetime ldt_date2

choose case dwo.name
	case "line"
		
	case "date"
		SELECT top 1 getdate() INTO :ldt_date2 FROM login;
		this.object.date[1] = date(ldt_date2)
end choose

RETURN 2

end event

event dw_r::buttonclicked;call super::buttonclicked;//
string ls_wc

dw_r.accepttext()
ls_wc = dw_r.object.line[1]

choose case dwo.name
	case "b_f01", "b_f09"	// 생산라인, 종료
		
	case else
		if isnull(ls_wc) OR trim(ls_wc) = "" then
			MessageBox("확인", 'F1을 선택하여 라인을 먼저 선택하십시요')
			RETURN
		end if
end choose

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// F1:생산라인 F2:작업자 F3:기본정렬 F4:스캐닝 F5:조회 F8:저장 F11:라벨출력 F12:선택삭제 F9:종료
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
long     ll_row
date     ldt_date1
datetime ldt_date2

ldt_date1 = dw_r.object.date[1]								// 작업일자
SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자

choose case dwo.name
	case "b_f04", "b_f05", "b_f08", "b_f12"	// F4:스캐닝,F5:조회,F8:저장,F12:선택삭제
		if ldt_date1 <> date(ldt_date2) then
			MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
			RETURN
		end if
end choose

choose case dwo.name
	case "b_f01"		// F1:라인변경
		wf_F1()

	case "b_f02"		// F2:작업자추가
		wf_F2()
		
	case "b_f03"		// F3:기본정렬
		wf_F3()
		
	case "b_f04"		// F4:스캐닝
		wf_F4()
		
	case "b_f05"		// F5:조회
		wf_F5()

	case "b_f06"		// F6:필터
		wf_F6()
		
	case "b_f08"		// F8:저장
		wf_F8()
		
	case "b_f10"		// F10:전체선택
		wf_F10()		
		
	case "b_f11"		// F11:라벨출력
		wf_F11()
		
	case "b_f12"		// F12:선택삭제
		wf_F12()
		
	case "b_f09"		// F9:종료
		close( parent )
end choose

end event

event dw_r::getfocus;call super::getfocus;//// getfocus()
//this.Object.DataWindow.Color = rgb(255,0,255)
//
end event

event dw_r::rbuttondown;call super::rbuttondown;//
string   ls_date
date     ld_date1, ld_date3
datetime ldt_date2

choose case dwo.name
	case "date"
		OpenWithParm(w_calendar, ls_date)
		ls_date = Message.StringParm
		if ls_date <> 'N' then
			this.object.date[1] = date(ls_date)
		end if

		ld_date1 = date(ls_date)
		ld_date1 = this.object.date[this.getrow()]

		SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자
		ld_date3 = date(ldt_date2)
		
		if ld_date1 < ld_date3 then		// 작업일자 < 시스템일자
			MessageBox("확인","시스템일자[" + string(ld_date3,"yyyy/mm/dd") + &
			           "] 보자 이전일자의 ~n~n작업일자[" + string(ld_date1,"yyyy/mm/dd")+"]는 작업이 불가능 합니다.")
			this.object.date[1] = date(ld_date3)
			RETURN
		end if
		
	case "b_f03"
		// 정렬
		wf_f3()

	case "b_f06"
		// 필터해지
		dw_r.object.value[1] = ""
		wf_f6()
end choose

end event

type dw_2 from datawindow within w_scaning_m1
event ue_dwnkey ( )
event ue_key pbm_dwnkey
event ue_enter pbm_dwnprocessenter
integer x = 1362
integer y = 1432
integer width = 590
integer height = 304
integer taborder = 30
boolean bringtotop = true
string title = "사용자재"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;////
//long ll_row 
//
//dw_r.accepttext()
///////////////////////////////////////////////////////////////////////////////////////////
//date     ldt_date1
//datetime ldt_date2
//
//ldt_date1 = dw_r.object.date[1]								// 작업일자
//SELECT top 1 getdate() INTO :ldt_date2 FROM login;		// 시스템일자
//
//if ldt_date1 <> date(ldt_date2) then
//	MessageBox("확인",string(ldt_date2,"yyyy/mm/dd") + " 이전일자는 작업 불가능 합니다.")
//	RETURN
//end if
///////////////////////////////////////////////////////////////////////////////////////////
//
//this.accepttext()
//
//choose case key
//	case KeyDelete!   // delete 키로 삭제 할것인가?
//		
//	case KeyF12!		// 한줄삭제
//		dwItemStatus l_status
//		
//		ll_row   = this.getrow()
//		l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
//		if l_status = newModified! or l_status = new! then
//			this.deleterow(ll_row)
//		else
//			if MessageBox('확인', '한줄을 삭제합니다. 정확합니까?', Question!, YesNo!, 1) = 1 then
//				this.deleterow(ll_row)
//			end if
//		end if
//		
//	case KeyF11!		// 한줄추가
//		ll_row = dw_2.insertrow(0)  
//
//	//	dw_2.object.order_no[ll_row] = left(gs_area,1) + 'NON' + string(dw_r.object.date[1],'yyyymmdd') + '-01'
//		dw_2.object.area_no[ll_row]  = gs_area
//		
//		dw_2.object.use_date[ll_row] = datetime(dw_r.object.date[1])
//		dw_2.object.wc_no[ll_row]    = trim(dw_r.object.line[1])
//	
//		dw_2.scrolltorow(ll_row)	
//		dw_2.SetColumn('coil_no')
//		dw_2.SetFocus()
//
//	case KeyF1!			// F1:생산라인 변경
//		wf_F1()
//		
//	// F2:작업자추가                                  
//
//	case KeyEscape!
////		dw_r.SetColumn('line')
//		dw_1.SetFocus()
//		
//	case KeyF4!			// F4:작업일보등록
//		wf_F4()
//		
//	case KeyF5!			// F5:사용자재등록
//		wf_F5()
//		
//	case KeyF9!			// F9:종료
//		close( parent )
//end choose
//
end event

event ue_enter;////
//dwItemStatus l_status
//gs_coil lst_code
//long    ll_row,  ll_cnt
//string  ls_coil, ls_loc, ls_remqty_chk = 'N', ls_order
//
//dw_r.accepttext()
//this.accepttext()
//
//ll_row = this.getrow()
//IF ll_row < 1 then RETURN 
//
//ls_coil = trim(this.object.coil_no[ll_row])
//ll_cnt  = this.object.sfcuse_cnt[ll_row]
//
//choose case This.GetColumnName()
//	case 'coil_no'
//		l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
//		if l_status = newModified! or l_status = new! then
//			lst_code.loc_no = dw_r.GetItemString(1, 'line')		// 작업장
//			OpenWithParm( w_coil01, lst_code )
//			lst_code = Message.PowerObjectParm
//
//			if lst_code.chk = "N" then 
//				if isnull(ls_coil) or trim(ls_coil) = '' then
//					this.setcolumn('coil_no')
//				else
//					this.setcolumn('sfcuse_cnt')
//				end if
//				
//				RETURN 1
//			else
//				this.object.coil_no[ll_row]         = lst_code.coil_no
//				this.object.loc_no[ll_row]          = lst_code.loc_no
//				this.object.sfcuse_cnt[ll_row]      = 0
//				this.object.item_no[ll_row]         = lst_code.item_no
//				this.object.item_item_name[ll_row]  = lst_code.item_name
//				this.object.qa[ll_row]              = lst_code.qa
//				this.object.qcnt[ll_row]            = lst_code.qcnt
//				this.object.sfcuse_mod_len[ll_row]  = lst_code.length
//				this.object.sfcuse_wid[ll_row]      = lst_code.wid
//				this.object.sfcuse_unit_qty[ll_row] = lst_code.unit_qty
//				this.object.sfcuse_mod_qty[ll_row]  = 0
//				this.object.use_qty[ll_row]         = 0
//				this.object.etc_no[ll_row]          = lst_code.etc_no
//				this.object.uom[ll_row]             = lst_code.uom
//			end if
//		end if
//		
//	case 'sfcuse_cnt'
//		if ll_cnt = 0 then RETURN 1
//			this.object.sfcuse_mod_qty[ll_row] = this.object.sfcuse_unit_qty[ll_row] * this.object.sfcuse_cnt[ll_row]
//			this.object.use_qty[ll_row] = this.object.sfcuse_mod_qty[ll_row]
//			
//	case 'rem_len'
//		if this.object.rem_qty[ll_row] > 0 then
//			ls_remqty_chk = "잔량을"
//		else
//			ls_remqty_chk = "사용 자재를"
//		end if
//	
//		l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
//		if l_status = newModified! or l_status = new! then
//			if MessageBox('확인', ls_remqty_chk + ' 등록 하시겠습니까?', Question!, YesNo!, 1) = 1 then
//				l_status = dw_2.GetItemStatus(this.rowcount(),0, Primary!)
//
//				if wf_dw2_check(ll_row) = true then
//					// 생산주문번호 자동 증가 
//					if ii_dw2retrieve < 1 then
//						dw_2.object.order_no[ll_row]  = left(gs_area,1) + 'NON' &
//																+ string(dw_r.object.date[1],'yyyymmdd') + '-01'
//					else
//						ls_order = dw_2.object.order_no[ll_row - 1]
//						ls_order = left(ls_order,13) + string(integer(mid(trim(ls_order), 14)) + 1,'00')
//						dw_2.object.order_no[ll_row] = ls_order
//					end if
//
//					// 		
//					if wf_dw2_insert(ll_row) = true then
//						if gf_update1(dw_2, 'N') = true then
//							ls_coil = trim(dw_2.object.rem_lot[ll_row]) ///rem_lot
//							ls_loc  = trim(dw_2.GetItemString(ll_row,"loc_no"))
//							if ls_remqty_chk = "잔량을" then 	// 잔량중량이 입력 되었을대만 잔량 바코드 출력
//								wf_barprint( ls_coil, ls_loc )	// 잔량코일 출력
//							end if
//						end if
//					end if	// sfcday(작업일보)테이블에 저장
//				end if
//			else
//				this.setcolumn('rem_qty')
//				RETURN 1
//			end if
//
//		elseif l_status = DataModified! and (l_status <> newModified! or l_status <> new!) then
//			if MessageBox('확인', ls_remqty_chk + ' 등록 하시겠습니까?', Question!, YesNo!, 1) = 1 then
//				l_status = dw_2.GetItemStatus(this.rowcount(),0, Primary!)
//			
//				if wf_dw2_check(ll_row) = true then
//					if wf_dw2_insert(ll_row) = true then
//						if gf_update1(dw_2, 'N') = true then
//							ls_coil = trim(dw_2.object.rem_lot[ll_row]) ///rem_lot
//							ls_loc  = trim(dw_2.GetItemString(ll_row,"loc_no"))
//							if ls_remqty_chk = '잔량을' then  	// 잔량중량이 입력 되었을대만 잔량 바코드 출력
//								wf_barprint( ls_coil, ls_loc )	// 잔량코일 출력
//							end if
//						end if
//					end if	// sfcday(작업일보)테이블에 저장
//				end if
//			else
//				this.setcolumn('rem_qty')
//				RETURN 1
//			end if
//		end if		
//end choose
//
//this.accepttext()
//Send( Handle(this), 256, 9, 0 )
//RETURN 1
//
end event

event itemchanged;//
long   ll_row
int    li_qcnt, li_sfcuse_cnt
double ldb_rem_qty, ldb_use_qty

This.AcceptText()

li_qcnt       = dw_2.GetItemNumber(row, 'qcnt', Primary!, True)
li_sfcuse_cnt = dw_2.GetItemNumber(row, 'sfcuse_cnt', Primary!, False)

ll_row      = this.getrow()
ldb_rem_qty = this.GetItemNumber(ll_row, 'rem_qty')  //잔량 중량
//ldb_use_qty = this.GetItemNumber(ll_row, 'use_qty')
ldb_use_qty = this.GetItemNumber(ll_row, 'sfcuse_unit_qty')  //단중

choose case dwo.name
	case 'sfcuse_cnt'
		if li_qcnt < li_sfcuse_cnt then
			MessageBox('확인', '사용갯수가 등록된 갯수보다 큽니다. 확인 바랍니다.', StopSign!)
			return 1
		end if
		
	case 'rem_qty'
		if ldb_rem_qty > ldb_use_qty then
			MessageBox('확인', '잔량중량이 단중보다 큽니다. 확인 바랍니다.', StopSign!)
			return 1
		end if
end choose

return 0

end event

event itemerror;//
choose case dwo.name
	case 'sfcuse_cnt'
		This.SetItem(row, 'sfcuse_cnt', 0)
		this.setcolumn('sfcuse_cnt')
		this.setfocus()
		
	case 'rem_qty'
		This.SetItem(row, 'rem_qty', 0)
		this.setcolumn('rem_qty')
		this.setfocus()
end choose

return 2

end event

event clicked;//
this.scrolltorow(row)

end event

event doubleclicked;//
this.triggerevent( "ue_enter" )

end event

type st_scan1 from statictext within w_scaning_m1
integer x = 288
integer y = 480
integer width = 946
integer height = 156
boolean bringtotop = true
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 0
string text = "스캔작업중"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_barcode from editmask within w_scaning_m1
event keydown pbm_dwnkey
integer x = 1266
integer y = 464
integer width = 1915
integer height = 184
integer taborder = 30
boolean bringtotop = true
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 65535
string text = "HD20151211-001-125"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

event modified;// 스캐닝
string  ls_area, ls_workno, ls_barcode, ls_saleno, lsa_scanno[]
string  ls_custno, ls_scene, ls_itemno, ls_qa, ls_worknm, ls_custnm, ls_scenenm, ls_itemnm
long    ll_row, ll_qty, ll_seqno, ll_cnt, ll_found
datetime ldt_scandate
decimal ld_rate

// 바코드
ls_barcode = upper(trim(this.text))
if isnull(ls_barcode) OR ls_barcode = "" then
	this.setfocus()
	RETURN
end if

// 스캐닝 종료
if ib_scan = true AND ls_barcode = "0000" then	// 스캐닝 중일때
	dw_1.SelectRow(0, false)	// 선택표시
	this.text = ""					// 스캔값지우기
	
	// 저장
	timer(0)
	ib_scan = false
	
	em_barcode.enabled = false
	em_qty.enabled     = false
	st_scan3.visible   = true
	
	dw_1.accepttext()
	wf_update1( dw_1, "N" )

	// 수량변경하기
	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.updateqty[ll_row] = "Y"
	next

	dw_1.enabled = true
	dw_1.setfocus()
	RETURN
end if

ls_saleno = LeftA(ls_barcode,14)
SELECT count(*) INTO :ll_cnt FROM sale WHERE order_no = :ls_saleno;
if ll_cnt < 1 then 
	MessageBox("확인","해당하는 수주번호는 존재하지 않습니다.~n~r바코드를 스캐닝하시기 바랍니다.")
	this.text = ""
	this.setfocus()
	RETURN
end if	

DEBUGBREAK()
ll_found = dw_1.find( "scan_no = '"+ls_barcode+"'", 1, dw_1.rowcount() )
if ll_found > 0 then
	dw_1.SelectRow(0, false)			// 선택지우기
	dw_1.SelectRow(ll_found, true)	// 선택표시

	// 중복번호 수량증가
	ls_workno    = dw_1.object.work_no[ll_found]
	ldt_scandate = dw_1.object.scan_date[ll_found]
	
	ll_cnt = dw_1.object.scan_qty[ll_found]
	ll_cnt = ll_cnt + 1
	dw_1.object.scan_qty[ll_found] = ll_cnt

//	// 작업장, 일자, 스캔번호 
//	UPDATE routscan SET scan_qty = :ll_cnt WHERE work_no = :ls_workno AND scan_date = :ldt_scandate;
	
	this.text = ""			// 스캔값지우기
	RETURN
end if

this.text = ""			// 스캔값지우기
dw_1.scrolltorow( 1 )

// 수량
ll_qty    = long(trim(em_qty.text))
if ll_qty = 0 then ll_qty = 1

// 수주번호,순번
GF_SPLIT(ls_barcode, "-", lsa_scanno)
if upperbound(lsa_scanno) > 1 then
	ls_saleno = lsa_scanno[1] + "-" + lsa_scanno[2]
end if
if upperbound(lsa_scanno) > 2 then
	ll_seqno  = long(lsa_scanno[3])
end if

// 작업장
ls_worknm   = dw_r.object.wc_nm[1]

// 행추가
ll_row = dw_1.insertrow(dw_1.getrow())

dw_1.scrolltorow( ll_row )
dw_1.SelectRow(0, false)	// 선택지우기
dw_1.SelectRow(1, true)		// 선택표시

dw_1.object.work_no[ll_row]    = gs_workno
dw_1.object.scan_date[ll_row]  = GF_today()
dw_1.object.scan_no[ll_row]    = ls_barcode
dw_1.object.scan_qty[ll_row]   = ll_qty
dw_1.object.sale_no[ll_row]    = ls_saleno
dw_1.object.seq_no[ll_row]     = ll_seqno

ls_custnm = "" ; ls_scenenm = "" ; ls_itemnm = "" ; ls_qa = ""

if isnull(ls_saleno) OR ls_saleno = "" then
else
	if isnull(ll_seqno) OR ll_seqno = 0 then
		SELECT b.cust_no, b.scene_code, a.item_no, a.qa, c.cust_name, d.scene_desc, null
		  INTO :ls_custno, :ls_scene, :ls_itemno, :ls_qa, :ls_custnm, :ls_scenenm, :ls_itemnm
		  FROM saledet A (nolock)
				 LEFT OUTER JOIN sale      B (nolock) ON a.order_no   = b.order_no
				 LEFT OUTER JOIN customer  C (nolock) ON b.cust_no    = c.cust_no
				 LEFT OUTER JOIN scene     D (nolock) ON b.scene_code = d.scene_code
		 WHERE a.order_no = :ls_saleno;
	else
		SELECT b.cust_no, b.scene_code, a.item_no, a.qa, c.cust_name, d.scene_desc, e.item_name
		  INTO :ls_custno, :ls_scene, :ls_itemno, :ls_qa, :ls_custnm, :ls_scenenm, :ls_itemnm
		  FROM saledet A (nolock)
				 LEFT OUTER JOIN sale      B (nolock) ON a.order_no   = b.order_no
				 LEFT OUTER JOIN customer  C (nolock) ON b.cust_no    = c.cust_no
				 LEFT OUTER JOIN scene     D (nolock) ON b.scene_code = d.scene_code
				 LEFT OUTER JOIN groupitem E (nolock) ON a.item_no    = e.item_no
		 WHERE a.order_no = :ls_saleno AND a.seq_no = :ll_seqno;
	end if
end if

dw_1.object.cust_no[ll_row]    = ls_custno
dw_1.object.scene_code[ll_row] = ls_scene
dw_1.object.item_no[ll_row]    = ls_itemno
dw_1.object.qa[ll_row]         = ls_qa
dw_1.object.user_id[ll_row]    = gs_userid

dw_1.object.work_name[ll_row]  = ls_worknm
dw_1.object.cust_name[ll_row]  = ls_custnm
dw_1.object.scene_desc[ll_row] = ls_scenenm
dw_1.object.item_name[ll_row]  = ls_itemnm
dw_1.object.user_name[ll_row]  = gs_username
dw_1.object.chk[ll_row]        = "N"
dw_1.object.updateqty[ll_row]  = "N"

wf_update1( dw_1, "N" )

em_qty.text = "1"
this.text   = ""
this.setfocus()

end event

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 2, 0 )		// 2번째 인수값 1=KOR, 2=ENG

this.SelectText(1, LenA(this.Text))

end event

type em_qty from editmask within w_scaning_m1
integer x = 3195
integer y = 464
integer width = 521
integer height = 184
integer taborder = 40
boolean bringtotop = true
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 0
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#,###,##0"
end type

event modified;// 스캐닝작업중 이동불가
if ib_scan = true then
	em_barcode.setfocus()
end if

end event

event getfocus;//
this.SelectText(1, LenA(this.Text) + 3)

end event

type dw_3 from datawindow within w_scaning_m1
integer x = 1975
integer y = 1432
integer width = 590
integer height = 304
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_label_bendingbarcode"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_scan2 from statictext within w_scaning_m1
integer x = 288
integer y = 480
integer width = 946
integer height = 156
boolean bringtotop = true
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 0
string text = "스캔작업중"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_scan3 from statictext within w_scaning_m1
event keydown pbm_dwnkey
integer x = 288
integer y = 480
integer width = 946
integer height = 156
boolean bringtotop = true
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 0
string text = "대기상태"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_time from editmask within w_scaning_m1
integer x = 37
integer y = 484
integer width = 242
integer height = 152
integer taborder = 40
boolean bringtotop = true
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "0~~60"
end type

event losefocus;//
integer li_time

timer( 0 )
li_time = integer(this.text)
timer( li_time )

SetProfileString("YCLINE.INI", "Database", "SCANTIME", string(li_time))

end event

type st_info from statictext within w_scaning_m1
integer x = 1266
integer y = 400
integer width = 1915
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "스캐닝 종료는 ~"0000~" 입력하시면 됩니다."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_scaning_m1
integer x = 704
integer y = 404
integer width = 457
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;// 행추가
long  ll_row

ll_row = dw_1.insertrow(0)

dw_1.scrolltorow( ll_row )
//dw_1.SelectRow(0, false)	// 선택지우기
//dw_1.SelectRow(1, true)		// 선택표시

dw_1.object.work_no[ll_row]    = gs_workno
dw_1.object.scan_date[ll_row]  = GF_today()
dw_1.object.scan_no[ll_row]    = ""
dw_1.object.scan_qty[ll_row]   = 0
//dw_1.object.sale_no[ll_row]    = ls_saleno
//dw_1.object.seq_no[ll_row]     = ll_seqno

dw_1.SetColumn("scan_no")
dw_1.setfocus()
//dw_1.SetRow(ll_row)

end event

type r_1 from rectangle within w_scaning_m1
long linecolor = 32768
integer linethickness = 8
long fillcolor = 15780518
integer x = 14
integer y = 464
integer width = 1239
integer height = 188
end type

