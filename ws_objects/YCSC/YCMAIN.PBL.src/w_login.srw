$PBExportHeader$w_login.srw
$PBExportComments$유창로그인화면(작성일: 98/02/06, 작성자:곽용덕)
forward
global type w_login from window
end type
type rb_m from radiobutton within w_login
end type
type rb_o from radiobutton within w_login
end type
type st_day from statictext within w_login
end type
type phl_1 from picturehyperlink within w_login
end type
type cbx_total from checkbox within w_login
end type
type sle_2 from singlelineedit within w_login
end type
type st_3 from statictext within w_login
end type
type sle_1 from singlelineedit within w_login
end type
type st_1 from statictext within w_login
end type
type cb_1 from commandbutton within w_login
end type
type st_4 from statictext within w_login
end type
type pb_3 from picturebutton within w_login
end type
type pb_2 from picturebutton within w_login
end type
type gb_connect from groupbox within w_login
end type
type r_1 from rectangle within w_login
end type
end forward

global type w_login from window
integer x = 1061
integer y = 716
integer width = 1669
integer height = 1188
boolean titlebar = true
string title = "로그인(w_login)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
boolean center = true
rb_m rb_m
rb_o rb_o
st_day st_day
phl_1 phl_1
cbx_total cbx_total
sle_2 sle_2
st_3 st_3
sle_1 sle_1
st_1 st_1
cb_1 cb_1
st_4 st_4
pb_3 pb_3
pb_2 pb_2
gb_connect gb_connect
r_1 r_1
end type
global w_login w_login

type prototypes
//
FUNCTION long IsWow64Process(long hwnd, ref boolean Wow64Process) LIBRARY "KERNEL32.DLL"
FUNCTION long GetCurrentProcess()  LIBRARY "KERNEL32.DLL"
//
FUNCTION STRING GetCommandLineA()  LIBRARY "kernel32.DLL" alias for "GetCommandLineA;Ansi"
// CapsLock 상태
FUNCTION int GetKeyState(int keystatus) LIBRARY "user32.dll"

end prototypes

type variables
string is_build, is_capslock

end variables

forward prototypes
public function integer wf_dbconnect ()
end prototypes

public function integer wf_dbconnect ();string	ls_server_ip, ls_dsn
integer 	Net

//기존 접속 종료
RollBack using sqlca;
Disconnect Using Sqlca;

//DB접속 방법 선택
if rb_m.checked = true then
	gs_connect_gb	= 'MSS'
else
	gs_connect_gb	= 'ODBC'
end if
gs_db_gb			= 'Live'


//접속 구분
choose case gs_connect_gb
	case 'MSS'
		//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼기존 DB설정
		if gs_db_gb = 'Live' then 
			SQLCA.DBMS       =ProfileString("YCSC.INI","Database","DBMS",             " ")
			SQLCA.Database   =ProfileString("YCSC.INI","Database","DataBase",         " ")
			SQLCA.LogID      =ProfileString("YCSC.INI","Database","LogID",            " ")
			SQLCA.LogPass    =ProfileString("YCSC.INI","Database","LogPassword",      " ")
			SQLCA.ServerName =ProfileString("YCSC.INI","Database","ServerName",       " ")
			SQLCA.UserID     =ProfileString("YCSC.INI","Database","UserID",           " ")
			SQLCA.DBPass     =ProfileString("YCSC.INI","Database","DatabasePassword", " ")
			SQLCA.Lock       =ProfileString("YCSC.INI","Database","Lock",             " ")
			SQLCA.DbParm     =ProfileString("YCSC.INI","Database","DbParm",           " ")
		elseif gs_db_gb = 'Test' then // test         
		end if // 				 /*2017.10.24 조원석 추가 */
		SQLCA.Lock       = "RU" // Read Uncommit 은 commit 되지 않을때도 select 가 가능.
		//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲기존 DB설정
	case 'ODBC'
		////▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ODBC 테스트
		Choose Case gs_db_gb
			Case 'Live'
				ls_server_ip	= '192.168.1.5'
				ls_dsn			= 'YCSC_DB'
			Case 'Test'
		End Choose
		
		gnv_odbc.of_MSSQLconnectODBC(ls_server_ip, '1433', ls_dsn, 'db_user', 'YCSC')
		gnv_odbc.of_SetTransObject (sqlca, ls_dsn, 'db_user', '' )
		SQLCA.Lock       = "RU" // Read Uncommit 은 commit 되지 않을때도 select 가 가능.		
		////▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ODBC 테스트
End Choose

CONNECT USING SQLCA;

IF SQLCA.SQLCode = -1 THEN
	MessageBox("오류2", "Database와 연결이 되지 않습니다.~r~n" + &
              "에러코드: " + String(SQLCA.SQLDBCode ) + "~r~n" + &
              "에러내용: " + SQLCA.SQLErrText, StopSign!, OK!, 1 )
	return -1				  
END IF

return 0
end function

on w_login.create
this.rb_m=create rb_m
this.rb_o=create rb_o
this.st_day=create st_day
this.phl_1=create phl_1
this.cbx_total=create cbx_total
this.sle_2=create sle_2
this.st_3=create st_3
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_1=create cb_1
this.st_4=create st_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.gb_connect=create gb_connect
this.r_1=create r_1
this.Control[]={this.rb_m,&
this.rb_o,&
this.st_day,&
this.phl_1,&
this.cbx_total,&
this.sle_2,&
this.st_3,&
this.sle_1,&
this.st_1,&
this.cb_1,&
this.st_4,&
this.pb_3,&
this.pb_2,&
this.gb_connect,&
this.r_1}
end on

on w_login.destroy
destroy(this.rb_m)
destroy(this.rb_o)
destroy(this.st_day)
destroy(this.phl_1)
destroy(this.cbx_total)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.gb_connect)
destroy(this.r_1)
end on

event open;//////////////////////////
GS_VER = "V10.2"
//////////////////////////
string ls_db, ls_server, ls_env, ls_allmenu, ls_dbconnect

//실행 환경 구분▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//초기화
ls_dbconnect= ProfileString("YCSC.INI","Database","DBCONNECT",	" ")
if isnull(ls_dbconnect) or ls_dbconnect = '' then
	ls_dbconnect	= 'MSS'
	SetProfileString("YCSC.INI", "DATABASE", "DBCONNECT", '"' + ls_dbconnect + '"')
end if
if ls_dbconnect = 'MSS' then
	rb_m.checked = true
	rb_o.checked = false
else
	rb_m.checked = false
	rb_o.checked = true	
end if

IF Handle(GetApplication()) = 0 THEN	//개발환경(파워빌더)
	is_build	= 'Y'
ELSE												//실행환경(RunTime)
	is_build	= 'N'	
END IF 
//실행 환경 구분▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

this.title = this.title + " [" + GS_VER + "]"
ls_db     = ProfileString("YCSC.INI", "Database", "DataBase", " ")
ls_server = ProfileString("YCSC.INI", "Database", "ServerName", " ") 
ls_allmenu=	ProfileString("YCSC.INI", "DATABASE", "ALLMENU", " ")
if ls_allmenu = "Y" then cbx_total.checked = true
cbx_total.checked = true	// 통합 MAINMENU
st_4.text = ls_server + " " + upper(trim(ls_db) )
if upper(trim(ls_db)) <> "YCSC" then st_4.TextColor = rgb(255,0,0)

// 작업일자
st_day.text = string(Today(), "yyyy/mm/dd")

if is_build = "Y" then
	// 파일서버 강제접속
	Run("net use \\192.168.1.6\D$ /user:administrator !@#gksfktks",Minimized!)
else
	// 파일서버 강제접속
	Run("net use \\192.168.1.6\PB80 /user:userdev userdev",Minimized!)
end if

integer li_cnt 
long    ll_i
string  ls_getgwid, ls_getpw, ls_team_code

ll_i = UpperBound(GS_SSO) 
if ll_i = 2 then
	if upper(GS_SSO[2]) = "YCGW" or upper(GS_SSO[2]) = "PASS" then
		IF upper(GS_SSO[1]) = "PASS" AND upper(GS_SSO[2]) = "PASS" then
			GS_SSO[1]  = ProfileString("YCSC.INI","Database","LOGINGW", " ")
			sle_1.text = GS_SSO[1]		
		END IF

		ls_getgwid = GS_SSO[1]
		sle_1.text = ls_getgwid
		gs_userid  = ls_getgwid
		SetProfileString("YCSC.INI", "DATABASE", "LOGINGW", GS_SSO[1])

		IF is_build = 'Y' then	// 개발자 환경
		ELSE	
			if Upper(GS_SSO[2]) = 'YCGW' then
				// 자동 UPDTAE 실행
				//RUN ("C:\Program Files\YCSC_MAIN\YCSC_verup.exe YCGW") 
				RUN(".\YCSC_Verup.exe YCGW") 
				IF IsValid(w_login) = true THEN close(w_login)
			else
				sle_1.text = ls_getgwid
				pb_2.triggerevent(clicked!)	// 로그인
				return
			end if		
		end if
	else
		MessageBox("[확인]", "환경설정이 잘못되었습니다. 확인 후 재 실행하시기 바랍니다.",stopsign!)
		halt close
	end if
else	// C:\Program Files\YCSC_MAIN\YCSC_main.exe
	if is_build = "Y" then
		sle_1.text = '1999010s' 	
		sle_2.text = 'ycc1324'
		sle_2.setfocus()
	else	
		//RUN("C:\Program Files\YCSC_MAIN\VerCopy.bat", Minimized!)
		//MessageBox('확인', '정상적인 접속시도가 아닙니다.~n~n그룹웨어(http://www.yoo-chang.co.kr)에서만 접속하시기 바랍니다.',stopsign!)
		sle_1.text   = ProfileString("YCERP.ini","Database","LOGINGW", " ") 	
		sle_2.setfocus()
	end if
end if

// V10.2		,  2020/08/04 = ODBC방식 추가.
// V8.99864 ,  2008/04/21 = 판매거래처 관리의 사용금지일때도 수금에서등록 가능하게 변경.
// V8.99863 ,  2008/04/16 = 매출통제 변경시 담당영업사원에게 변경통보.
// V8.99861 ,  2008/04/16 = 매출통제기능 추가.완전통제(수주,수주확정,출하),부분통제(수주,출하)
// V8.99822 ,  2008/02/13 = 세금계산서 공란계산 등 출력폼 보완.
// V8.99821 ,  2008/01/31 = 판매거래처별 물품출고현황(w_oicust_r), 물품별 출고현황(w_oiitemdo_r) 엑셀 출력 기능 추가.
// V8.99819 ,  2008/01/30 = 매출관리(현장별 세금계산서 발행 프로그램 추가). 
// V8.99818 ,  2008/01/30 = 거래처 관리 권한 변경. 
// V8.99817 ,  2008/01/24
// V8.99816 ,  2008/01/23 = 견적서관리,수주관리,수주확정관리 에서 헤더의 부가세 계산방식 변경(공급가의 10%), 어음관리의 어음구분변경권한(박종인부장) 부여.
// V8.99815 ,  2008/01/09 = 수주관리의 거래처 등급기준 변경으로 등급 제한 변경[F(Z): 내부거래. V,X:관리대상 입력금지. ]
// V8.99814 ,  2008/01/03 = 거래명세표수정및취소, 세금계산서 등록, 수정및취소 상세내역의 부가세 계산식 변경.
// V8.99813 ,  2007/12/12 = 거래명세표, 세금계산서 신규양식 추가(실 가동은 미정).
// V8.99813 ,  2007/12/06 = 12월6일부터 거래명세표,세금계산서 작성시 헤더의 부가세 수정기능 추가.(공급가 10%의 +- 1 차이까지 가능).
// V8.99812 ,  2007/11/08 = 11월8일 이후부터 판매거래처관리(박종인부장,성계숙대리,한미란주임,임재희씨 만사용).
// V8.99811 ,  2007/11/01 = 11월1일부터 미수불 사용자 제한(차희천상무, 삼상철부장, 박종인부장만사용).
// V8.99810 ,  2007/10/26 = 대표이사 지시사항적용 변경(심상철:이달말까지 기존대로), 거래명세 수정시 메세지 박종인에게.
// V8.99809 ,  2007/10/24 = 대표이사 지시사항적용(거래명세서 수정및삭제의 수정/삭제,미수불 권한[차희천,심상철,박종인 만],  임재희<-성계숙, 성계숙<-한미란(9월 27일권한 원상태로 변경)
//                          시화공장 김기준(kimkj)부장 신규 추가, 자재는 이용식(ybs)와 동일(품목기준정보 권한 없음)
// V8.99808 ,  2007/09/27 = 거래명세서수정및삭제 절사처리 변경, 성계숙대리=한미란주임 동일권한(업무로테이션)
// V8.99807 ,  2007/09/13 = sso 제거, 요청자: 조용재상무님
// V8.99805 ,  2007/08/02 = 권봉조 권한추가(성계숙의 권환 전체), 안수환차장 발주확정시 사업장(시화,ysp)선택기능 추가.
// V8.99805 ,  2007/07/23 = sms시작
// V8.99804 ,  2007/07/04 = 그룹웨어에서의 자동 로그인, 일반로그인 안됨.
// V8.99803 ,  2007/06/21 = 물품요청에 대한 접수처리시 운반비일자=접수일자 동일하게 처리함.
// V8.99802 ,  2007/05/   = 자재매입관리에서 저장시 단가이력 저장. 자재거래처 관리에서 관리기능 추가.
// V8.99801 ,  2007/05/10 = 자재매입관리에서 저장시 단가이력 저장. 자재거래처 관리에서 관리기능 추가.
// V8.998   ,  2007/04/09 = 발주입고 수정및삭제 pgm에서 입력된 매입일자는 변경 불가처리.(기입력된 자료는 사용자가 삭제 처리하는방식)
// V8.997   ,  2006/06/19 = 등급별 권한
// V8.996   ,  2006/06/01 = 판매부 성계숙씨 권한추가
// V8.995   ,  2006/05/30 = 물품별코일규격관리에서 최명수대리 수정가능하게처리
// V8.994   ,  2006/03/13 = 견적서관련 업데이트/발주입고내역 조회부분 
// V8.993   ,  2006/02/10 = 거래명세 수정및삭제 부가세 계산부분 보완/최은여->권성열
// V8.992   ,  2006/02/04 = 거래명세작성,판매매출관리 보완
//          
// V8.990   ,  2005/11/03 = 김원규,김선영,조형섭 보안인증추가(w_security추가)
// V8.989   ,  2005/11/02 = 저녁에 이현정대리 권한 김원규,김선영 동일하게 설정
// V8.988   ,  2005/10/11 = 판매매출관리, 판매매출수정및취소 운송비관련 오류수정
// V8.987   ,  2005/06/04 = 입고수정삭제 오류수정 
// V8.986   ,  2005/06/03 = 코일재고권한 수정.
// V8.985   ,  2005/05/24 = 운반비 결재 doshipetc.doship_req추가.
// V8.984   ,  2005/05/07 = 반품요청 확인관리 수정.
// V8.983   ,  2005/01/15 = 거래명세서 및 다수 수정.
// V8.982   ,  2004/10/13 = YSP이전/코일저장소추가에 의한 5차 버전업.
// V8.981   ,  2004/10/12 = YSP이전/코일저장소추가에 의한 4차 버전업.
// V8.980   ,  2004/10/06 = YSP이전에 의한 3차 버전업.
// V8.979   ,  2004/08/17 = 화성공장시설에 의한 2차 버전업.
// V8.978   ,  2004/08/13 = 화성공장시설에 의한 1차 버전업.
// V8.976   ,  2004/08/06 = 운반비 결재관리 수정
// V8.975   ,  2004/07/27 = 현설관리프로그램 추가
// V8.974   ,  2004/05/10 = 코일마스터 원코일 번호 컬럼추가
// V8.973   ,  2004/03/23 = 자재입고수정삭제 변경
// V8.972   ,  2004/03/23 = 판매거래처 사용불가 추
// V8.971   ,  2004/03/11 = 판매 단가 권한 변경.
// V8.970   ,  2004/03/08 = 코일재고에 관한조회 권한 변경.
// V8.969   ,  2004/02/28 = 코일재고변경 요청 권한 변경.
// V8.968   ,  2004/02/27 = 코일이동시 외주 사내 구분 추가
// V8.967   ,  2004/02/20 = 거래명세서 삭제시 itemalter 미처리부분 추가
// V8.966   ,  2004/02/05 = 작업일보 삭제시 일자 변경
// V8.965   ,  2004/02/03 = 사용자재반납(sfcret) 에 area_no 추가
// V8.963   ,  2004/01/14 = 전체사용자 UPDATE
// V8.962   ,  2003/12/01 = 단가관리 권한 설정
// V8.92    ,  2003/10/23 = 수주마감 권한 설정
// V8.91    ,  2003/10/22 = 출고의뢰서 확정 추가
// V8.9     ,  2003/10/21 = 대체물품관리에서 기타품목 제거 및 프로그램 변경
// V8.8     ,  2003/10/14 = 출고의뢰서 추가/거래명세서 통합 및 버전체크 방식 변경
// V8.7     ,  2003/09/30 = 다수프로그램 수정및 강제 최신버전update 추가 적용
// V8.6     ,  2003/09/22 = saledet.rlse_qty = sum(dodet.ship_qty) 트리거 적용
// V8.5     ,  2003/09/08 = 직거래명세서 출고수량오류 변경
// V8.4     ,  2003/09/01 = 가입고/대체입고 등 프로그램 변경
// V8.3     ,  2003/07/28 = 실사 프로그램 보완 프로그램 변경
// V8.2     ,  2003/07/22 = 수불관련 다수 프로그램 변경
// V8.1     ,  2003/07/02 = 수불관련 다수 프로그램 변경
// V8.0     ,  2003/05/12 = 파워빌더 8.0버전으로 마이그레이션
// 버전관리
// V2.8     ,  2000/08/25 = 자동생산계획생성에서 재고유지물품은 선택되지 않고
//                          또한 재고유지물품의 SALEDET.sol_qty[가용량]에 수량을 할당하지 않음.
// V2.9     ,  2000/08/31 = 재고관리 실사프로그램 변경.
// V2.10    ,  2000/09/8  = 스리팅코일 프로그램 추가.
// V2.11    ,  2000/09/20 = 1.기타입출고 권한 제한. 2.출고지시서 저장소권한추가
// V2.12    ,  2000/09/21 = 비거래명세서 출고일자 수정가능하게함.
// V2.13    ,  2000/10/06 = 김종은대리 수주확정 권한제거.
// V2.14    ,  2001/01/02 = 수주관리 프로그램 보완(수주번호로 조회).
// V2.15    ,  2001/02/15 = SHEET및 코일관련 프로그램 보완.
// V2.15    ,  2001/02/19 = userip table추가.
// V2.16    ,  2001/02/22 = 사용자 관리에서www.yoo-chang.co.kr의 yoochang DB에 
//                          login table과의 연동
// V2.17    ,  2001/02/24 = 견적서관리 보완 완료/입고프로그램 입력일자/입력자 추가
// V2.18    ,  2001/03/20 = 기타입출고 막음
// V2.19    ,  2001/03/29 = 거래명세서구분추가(do.do_case A:거래 B:직거래 C:비거래)
// V2.20    ,  2001/04/20 = 수주에 거래명세서(do_rem)추가 거래명세서에 나오게수정
// V2.21    ,  2001/05/11 = 직거래명세서 및 거래명세서 수정 삭제에서 coilmst,sheetmst처리
// V2.22    ,  2001/05/21 = coilmst 의 key loc_no 추가, 이에따른 프로그램및 테이블수정
// V2.23    ,  2001/05/29 = itemmove 의 저장소 이동 관리에 히스토리 추가.
// V2.24    ,  2001/05/31 = coil_no 14 에서 20으로 자리 늘임, 로트번호부여체계 변경.
// V2.25    ,  2001/09/12 = 입고/발주 수정.
// V2.26    ,  2001/10/17 = dodet를 insert하는 (거래/비거래/직거래.명세서)프로그램에 
//                          dodet.loc_no(출고 저장소)를 추가함.
// V2.27    ,  2001/10/18 = 스리팅 작업권하자 지정(박종순,윤용수,진달수)
// V2.28    ,  2001/12/07 = 수주및 다수 프로그램 변경.
// V2.29    ,  2001/12/18 = 출고지시서 및 거래명세서 전체 변경...
// V2.30    ,  2002/01/05 = 반월과 시화의 발주/입고/매입 프로그램 분리..
// V2.31    ,  2002/02/23 = 비.직.거래명를 동시에 같은 수주순번을 출고할때 문제점 수정
// V2.32    ,  2002/03/07 = 다수 프로그램 수정 수정
// V2.4     ,  2002/09/03 = 운반비 변경/운반비 변경결재/운반비 마감 프로그램 추가
// V2.42    ,  2002/12/11 = routtempnew datetiem allow 변경
// V2.43    ,  2002/12/26 = ysp 출고현황 추가및 현장별 자재 투입현황 수정
// V2.44    ,  2002/12/30 = 수주확정자 정리
// V2.45    ,  2003/01/02 = YSP 프로그램추가/수주및 출고내역에 사업장 추가
// V2.46    ,  2003/01/08 = 수주번호 수정 사항 변경
// V2.47    ,  2003/01/02 = YSP 프로그램추가/수주내역에 color,type 추가
// V2.5     ,  2003/03/03 = YSP 생산 가동 에의한 area_no (routtempnew,sfcday,mps,sudodet,sudodet1) 추가
// V2.51    ,  2003/03/03 = FUll Rebuild
// V2.52    ,  2003/03/29 = 다수 프로그램 변경및 버전 check!!
// V2.53    ,  2003/04/03 = VPN에 의한 버전업
// V2.54    ,  2003/04/07 = inheritance convert title size and font size
// V2.55    ,  2003/04/08 = 거래명세서작성 dw update 프로퍼티 변경
// V2.56    ,  2003/04/21 = (주)유창 사업장 변경(133 => 134)


end event

event close;// 파일서버 강제접속 해제
Run("net use \\192.168.1.6\ipc$ /delete",Minimized!)


end event

type rb_m from radiobutton within w_login
integer x = 59
integer y = 952
integer width = 434
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "기존방식"
boolean checked = true
end type

event clicked;SetProfileString("YCSC.INI", "DATABASE", "DBCONNECT", "MSS")
end event

type rb_o from radiobutton within w_login
integer x = 485
integer y = 944
integer width = 434
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "신규방식"
end type

event clicked;SetProfileString("YCSC.INI", "DATABASE", "DBCONNECT", "ODBC")
end event

type st_day from statictext within w_login
integer x = 1051
integer y = 100
integer width = 512
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type phl_1 from picturehyperlink within w_login
integer x = 160
integer y = 8
integer width = 686
integer height = 604
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "C:\BMP\YC_150X150.jpg"
boolean focusrectangle = false
end type

type cbx_total from checkbox within w_login
integer x = 1051
integer y = 24
integer width = 512
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "통합 MAINMENU"
end type

type sle_2 from singlelineedit within w_login
integer x = 1051
integer y = 472
integer width = 512
integer height = 96
integer taborder = 20
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
boolean password = true
integer limit = 8
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.SelectText(1, Len(this.text))

//// Caps Lock 상태
if GetKeyState(20) = 1 then
	is_capslock = "Y"
	sle_2.backcolor = RGB(255, 125, 125)	// 연빨강	연노랑:RGB(254, 252, 175)
else
	is_capslock = "N"
	sle_2.backcolor = RGB(255, 255, 255)	// 흰색
end if

end event

type st_3 from statictext within w_login
integer x = 1051
integer y = 388
integer width = 512
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean enabled = false
string text = "Password"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_login
integer x = 1051
integer y = 264
integer width = 512
integer height = 96
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
this.SelectText(1, Len(this.text))

end event

type st_1 from statictext within w_login
integer x = 1051
integer y = 176
integer width = 512
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean enabled = false
string text = "로그인 ID"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_login
event ue_1 pbm_custom01
integer x = 32
integer y = 620
integer width = 942
integer height = 116
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "최신버전 UPDATE"
end type

event ue_1;RUN ("C:\Program Files\YCSC_MAIN\YCSC_Verup.exe") 

end event

event clicked;string ls_sysup, ls_msg

// 파일서버 강제접속
RUN("net use \\192.168.1.6\ipc$ /user:userdev userdev",Minimized!)

ls_msg = "최신버전 UDPATE 체크를 하시겠습니까?~r~n~r~n" + &
	      "최신버전으로 UPDATE할때 몇분의 시간이 소요됩니다.~r~n~r~n" + &
	      "아무 동작도 안하면 전산실로 연락바랍니다.(최신버젼 UPDATE안됨)"
			
if MessageBox("확인", ls_msg, Exclamation!, YesNo!, 1) = 1 THEN
	if trim(sle_1.text) = '' or isnull(sle_1.text) then
		MessageBox("확인","로그인ID를 입력하십시요")
		return
	end if
	
	RUN(".\YCSC_Verup.exe YCGW") 
	close(parent)
end if
end event

type st_4 from statictext within w_login
integer x = 32
integer y = 744
integer width = 942
integer height = 116
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 32768
boolean enabled = false
string text = "YC2010 YCSC"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_login
integer x = 1056
integer y = 744
integer width = 512
integer height = 116
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종  료"
boolean cancel = true
vtextalign vtextalign = vcenter!
end type

event clicked;close(parent)  
end event

type pb_2 from picturebutton within w_login
integer x = 1056
integer y = 620
integer width = 512
integer height = 116
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "로그인"
boolean default = true
vtextalign vtextalign = vcenter!
boolean map3dcolors = true
string powertiptext = "로그인"
end type

event clicked;string ls_userid, ls_passwd,   ls_name, ls_slip, ls_userlevel
string ls_dbuser, ls_dbpasswd, ls_team, ls_area, ls_ver, ls_update
st_security lst_security

//DB 접속▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
if wf_dbconnect() < 0 then
	return
end if
//DB 접속▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

ls_userid = trim(sle_1.text)
ls_passwd = trim(sle_2.text)
if ls_userid = "" then
 	sle_1.SetFocus()
	return
end if
if ls_passwd = "" then
 	sle_2.SetFocus()
	return
end if

// 작업일자, 작업시간
string ls_today, ls_todaytime
date   ld_date
time   lt_time
SELECT TOP 1 CONVERT(varchar(10), getdate(), 111), CONVERT(varchar(19), getdate(), 120)
  INTO :ls_today, :ls_todaytime 
  FROM login;

ld_date       = date(ls_today)
lt_time       = time(RightA(ls_todaytime,8))
gdt_today     = datetime(ld_date, time("00:00:00"))
gdt_todaytime = datetime(ld_date, lt_time)

string ls_day1, ls_day2
ls_day1     = string(gdt_today, "yyyy/mm/dd")
ls_day2     = string(Today(),   "yyyy/mm/dd")
if ls_day1 <> ls_day2 then
	st_day.backcolor = rgb(255, 0, 0)
	if MessageBox("경고", "ERP 시스템일자와 사용자 컴퓨터일자가 일치하지 않습니다." + &
                 "~n~n컴퓨터일자를 변경한 후 작업하시기 바랍니다.", Exclamation!, OKCancel!, 2) = 2 then
		return
	end if
end if

ls_dbuser   = ""
ls_dbpasswd = ""
SELECT user_name, user_id, password, team_code, area_no, force_update, user_level
  INTO :ls_name, :ls_dbuser, :ls_dbpasswd, :ls_team, :ls_area, :ls_update, :ls_userlevel 
  FROM login 
 WHERE user_id = :ls_userid AND use_flag = 'Y';
 
if sqlca.sqldbcode <> 0 then
	sle_1.selectText(1, LenA(sle_1.Text))
 	sle_1.SetFocus()
	return
end if

if ls_dbuser = "" or ls_dbpasswd = "" or isnull(ls_dbpasswd) then
	sle_1.Text = ''
 	sle_1.SetFocus()
	MessageBox("확인","ID와 암호를 확인하시기 바랍니다. 공난 암호는 설정할 수 없습니다.")
	return
end if

if ls_passwd = trim(ls_dbpasswd) then	
	gs_company= "00"
	gs_userid = trim(ls_dbuser)
	gs_level  = trim(ls_userlevel)
	gs_username = trim(ls_name)
	gs_team   = trim(ls_team)
	gs_area   = trim(ls_area)

	string  ls_ipaddress = space(50), ls_macname = space(50), ls_gateway, ls_ipmask
	string  dir, dir1, ls_ip, ls_err, ls_module
	integer i

	if cbx_total.checked = true then
		ls_module = "물류통합"
	else
		ls_module = "물류개별"
	end if
		
	setnull(ls_ip)
	ls_ver = "YCSC " + gs_ver
	
	SELECT ip INTO :ls_ip FROM userip  WHERE user_id = :gs_userid AND mask= :ls_macname;
	if sqlca.sqlcode = 100 then
		INSERT INTO userip (user_id, user_name, ip, mask, gateway, pb_ver, moudule, sys_date) 
		VALUES (:gs_userid, :ls_name, :ls_ipaddress, :ls_macname, :ls_gateway, :ls_ver, :ls_module, :gdt_todaytime);
	elseif sqlca.sqlcode = 0 then
		UPDATE userip 
		   SET user_name= :ls_name, ip= :ls_ipaddress, gateway= :ls_gateway
			  , pb_ver= :ls_ver, moudule= :ls_module, sys_date= :gdt_todaytime
		 WHERE user_id  = :gs_userid AND mask= :ls_macname;
	end if
	
	COMMIT;	
//	DISCONNECT;
//
//	
//	SQLCA.DBParm = "CursorLock='ReadOnly',AppName='YCSC',Host= '" + left(trim(ls_name),6) &
//					 + "[YCSC," + left(trim(gs_userid) + space(8),8) + "]" + gs_ver + "'"
//	CONNECT USING sqlca;
	
	ls_slip = "CursorLock='ReadOnly',AppName='YCSC',Host= '" + trim(ls_name) + "YCSC LOGIN'"
	SetProfileString("YCSC.INI", "DATABASE", "DBParm",  ls_slip)
	SetProfileString("YCSC.INI", "DATABASE", "LOGIN2",  gs_userid)
	SetProfileString("YCSC.INI", "DATABASE", "LoginGW", gs_userid)

	if cbx_total.checked = true then
		SetProfileString("YCSC.INI", "DATABASE", "ALLMENU", 'Y')
		Open(w_all_main)  // 통합 MAINMENU
	else
		if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" then
			SetProfileString("YCSC.INI", "DATABASE", "ALLMENU", 'Y')
			Open(w_all_main)  // 통합 MAINMENU
		else
			SetProfileString("YCSC.INI", "DATABASE", "ALLMENU", 'N')
			Open(w_youchang2) // 게시판
		end if
	end if	
else
	sle_2.Text = ''
 	sle_2.SetFocus()
end if

end event

type gb_connect from groupbox within w_login
integer x = 32
integer y = 876
integer width = 942
integer height = 176
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "접속방법"
end type

type r_1 from rectangle within w_login
integer linethickness = 4
long fillcolor = 16777215
integer x = 32
integer y = 4
integer width = 942
integer height = 612
end type

