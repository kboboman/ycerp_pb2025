$PBExportHeader$ycline.sra
$PBExportComments$YCLINE 실행
forward
global type ycline from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string GS_VER,    gs_title,  gs_company, gs_userid,    gs_username, gs_workno, gs_workname
string gs_today,  gs_area,   gs_loc,     GS_IPAddress, GS_MacAddress, GS_RunWindow, gs_dbzoom
string gs_label = 'OLD'  /* jowonsuk 2019.04.18 성형 qrcode 라밸 출력 반영은 NEW, 기존로직은 OLD*/

long   gl_width,  gl_height, gl_resolution 

date     gd_date
datetime gdt_today, gdt_todaytime

n_adapter in_adapt


//cross platform information
//ge_environment maintains the operating environment
environment ge_environment

//gu_ext_func is a user object capable of handling
//generic operating system level calls and mapping
//them to the appropriate external functions.
u_external_function gu_ext_func

//The base registry entry key used
string sREGKEY
string sPBKEY

// the Major Version 
string sVERSION, sVersionSimple

// the Examples Version 
string sVERSIONEX

// the Fix Version
string sVERSIONNAME

// the name of the PB Executable
string sPBEXE

// the directory the Code Examples are installed in
string gs_ExampleDir

//ODBC DB연동
n_mssql_to_odbc gnv_odbc
string	gs_connect_gb	//ODBC, MSS
string	gs_db_gb			//Live, Test

end variables

global type ycline from application
string appname = "ycline"
integer highdpimode = 0
string appruntimeversion = "25.0.0.3711"
end type
global ycline ycline

type prototypes
//시스템 두번이상 실행하지 않기위해 필요
FUNCTION ulong  CreateMutexA(ulong lpsa, int fInitialOwner, string lpszMutexName ) Library "kernel32.dll" alias for "CreateMutexA;Ansi"
FUNCTION long   GetLastError() Library "kernel32.dll"
FUNCTION STRING GetCommandLineA() library "kernel32.DLL" alias for "GetCommandLineA;Ansi"
FUNCTION long SetForegroundWindow (long hwnd) LIBRARY "user32.dll"
FUNCTION long SetWindowPos (long hwnd, long hWndInsertAfter, long x, long y, long cx, long cy, long wFlags) LIBRARY "user32.dll"
FUNCTION integer sdp_QRCodeCreate2() LIBRARY 'sdpIkhyeon.DLL' /*2019.02.25 jowonsuk*/

//FUNCTION ulong ReleaseMutex(ulong hMutex ) Library "kernel32.dll"
//FUNCTION uLong ExitWindowsEx(ulong dwOptions, ulong dwReserved) Library "user32.dll"
//FUNCTION BOOLEAN SystemParametersInfo( UINT uiAction, BOOLEAN uiParam, REF LONG pvParam, UINT fWinIni ) Library "USER32.DLL" Alias for SystemParametersInfoA
//FUNCTION boolean SetCursorPos(int cx, int cy) LIBRARY  "User32.dll"


///* 브라우저 실행시 */
//FUNCTION long ShellExecuteA( long hWnd, REF String ls_Operation, REF String ls_File, REF String ls_Parameters, REF String  ls_Directory, INT nShowCmd ) library 'shell32'

///* tray부분에서 필요 */
//Public Function Integer Shell_NotifyIcon (Long dwMessage, Any lpData) Library "shell32" Alias For "Shell_NotifyIconA"
//Public Function Long LoadImage (Long hInst, String lpsz, Long un1, Long n1, Long n2, Long un2) Library "user32" Alias  For "LoadImageA" 
//Public Function Long DestroyIcon (Long hIcon) Library "user32" Alias For "DestroyIcon"
//Public Function Long OpenIcon  (Long hwnd) Library "user32" Alias For "OpenIcon"

end prototypes

type variables
string is_build

end variables

on ycline.create
appname="ycline"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ycline.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//odbc 접속 환경
gnv_odbc = create n_mssql_to_odbc

/////////////////////////////////////////////////////////
// 생산현장 통합시스템(라인, 코일이동, 스리팅, 상차내역)
/////////////////////////////////////////////////////////////
ulong  ll_mutex,  ll_err
string ls_mutex_name

if Handle(GetApplication(), False) <> 0 then
	ls_mutex_name = This.AppName + CharA(0)
	ll_mutex      = CreateMutexA(0, 0, ls_mutex_name)
	ll_err        = GetLastError()
	if ll_err = 183 then  // Is running
		MessageBox("알림", "이미 프로그램이 실행중입니다.", StopSign!)
		Halt Close
	end if
end if

// Create the global user object gu_ext_func. 
// The user object will handle cross platform operating system external calls
if not f_create_external_func_uo(gu_ext_func) then
	Messagebox ("External Functions User Object","An error occurred while initializing the "+&
					"external function user object.  External calls will not be available "+&
					"for this session.")
end if

/////////////////////////////////////////////////////////////
Open( w_login )
/////////////////////////////////////////////////////////////

end event

event systemerror;// Open(w_system_error)
string ls_errornum, ls_message, ls_where, ls_object, ls_event, ls_line

ls_errornum = string(error.number)
ls_message  = error.text
ls_where    = error.windowmenu
ls_object   = error.object
ls_event    = error.objectevent
ls_line     = string(error.line)

INSERT INTO system_error(user_id, errornum, message, swhere, object, sevent, line, version) 
VALUES (:gs_workname, :ls_errornum, :ls_message, :ls_where, :ls_object, :ls_event, :ls_line, :gs_ver);
if sqlca.sqlcode <> 0 then
	rollback;
else
	commit;
end if

end event

event close;ROLLBACK   USING SQLCA;
DISCONNECT USING SQLCA;

//ODBC설정 해제
destroy gnv_odbc
end event

event idle;//
//if IsValid( w_barcode_coil ) = true then
//	if w_barcode_coil.is_status <> "STAY" then
//		BEEP(5)
//		w_barcode_coil.sle_1.text = ""
//		w_barcode_coil.is_status  = "STAY"
//		w_barcode_coil.st_1.text  = "출고저장소"
//		w_barcode_coil.st_3.text  = "STAY"
//	end if
//else
//	Open( w_barcode_coil )
//end if

end event

