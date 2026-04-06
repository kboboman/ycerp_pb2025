$PBExportHeader$ycmain.sra
$PBExportComments$Open(w_login), ycerp.ini
forward
global type ycmain from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
String gs_userid, gs_username    //사용자변수
String gs_team,   gs_area,    gs_ver
String gs_print_control 			//프린터용지변수 
String gs_level 						//사용자등급

string GS_Filter, GS_ColName, GS_ColType		// DataWindow 필터링 사용

u_external_function gu_ext_func
DataStore   gs_ds_itemall, gs_ds_qaall, gs_ds_whcustret
Environment ge_Environment
Transaction SQLCA2

//임원정보추가에의한 추가변수
String    gs_company, gs_personno, gs_divcode
DataStore gs_ds_tax,  gs_ds_permst

//sso용 추가변수
String   GS_SSO[]

//
String   gs_winname, gs_var1, gs_winname2, gs_var2
DateTime gdt_today,  gdt_todaytime
Long     gl_var1 = 0 
String   gs_zipcodes1, gs_zipcodes2, gs_zipcode1, gs_zipcode2

// SORT, FILTER
DataWindow GDW_Client
string     GS_SortFilter, GS_Sort

//ODBC DB연동
n_mssql_to_odbc gnv_odbc
string 	gs_db_gb, gs_connect_gb	//db(Live,Test)구분, 접속(MSS,ODBC)구분
end variables

global type ycmain from application
string appname = "ycmain"
integer highdpimode = 0
string appruntimeversion = "25.0.0.3711"
end type
global ycmain ycmain

type prototypes
FUNCTION boolean WriteProfileStringA(string s1, string s2, string s3) LIBRARY "KERNEL32.DLL" alias for "WriteProfileStringA;Ansi"
FUNCTION ulong SetCurrentDirectoryA(string path) LIBRARY "Kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"
//Function long GetIPAddress( ref string as_ip, long len ) library "GetMACIP.dll"
//Function long GetMACAddress( ref string as_mac, long len ) library "GetMACIP.dll"
// 한글
FUNCTION long ImmGetContext(long hWnd) LIBRARY "imm32.dll"
FUNCTION long ImmSetConversionStatus(long hWnd, long a, long b) LIBRARY "imm32.dll"

end prototypes

type variables

end variables

on ycmain.create
appname="ycmain"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ycmain.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//odbc 접속 환경
gnv_odbc = create n_mssql_to_odbc

GetEnvironment(ge_Environment)
if Not f_create_external_func_uo(gu_ext_func) then
	MessageBox("오류1", "Not caeated external functions!")
end if

//SQLCA.DBMS       =ProfileString("YCSC.INI","Database","DBMS",             " ")
//SQLCA.Database   =ProfileString("YCSC.INI","Database","DataBase",         " ")
//SQLCA.LogID      =ProfileString("YCSC.INI","Database","LogID",            " ")
//SQLCA.LogPass    =ProfileString("YCSC.INI","Database","LogPassword",      " ")
//SQLCA.ServerName =ProfileString("YCSC.INI","Database","ServerName",       " ")
//SQLCA.UserID     =ProfileString("YCSC.INI","Database","UserID",           " ")
//SQLCA.DBPass     =ProfileString("YCSC.INI","Database","DatabasePassword", " ")
//SQLCA.Lock       =ProfileString("YCSC.INI","Database","Lock",             " ")
//SQLCA.DbParm     =ProfileString("YCSC.INI","Database","DbParm",           " ")
//
////SQLCA.Lock = "ReadOnly"
//SQLCA.Lock = "RU"
//CONNECT using sqlca;
//
//IF SQLCA.SQLCode = -1 THEN
//	MessageBox("오류2", "Database와 연결이 되지 않습니다.~r~n" + &
//              "에러코드: " + String(SQLCA.SQLDBCode ) + "~r~n" + &
//              "에러내용: " + SQLCA.SQLErrText, StopSign!, OK!, 1 )
//END IF
	
string  ls_cmd, ls_arg[]
integer i, li_argcnt

ls_cmd = Trim(CommandParm())
li_argcnt = 1
DO WHILE LenA(ls_cmd) > 0
    i = PosA( ls_cmd, " ")
    if i = 0 then i = LenA(ls_cmd) + 1
	 
    ls_arg[li_argcnt] = LeftA(ls_cmd, i - 1)
    li_argcnt = li_argcnt + 1
    ls_cmd    = ReplaceA(ls_cmd, 1, i, "")
LOOP
//MessageBox("확인", ls_cmd)

long ll_i, ll_j
ll_i = UpperBound(ls_arg)
for ll_j = 1 to ll_i
	GS_SSO[ll_j] = trim(ls_arg[ll_j])
next
 
Open(w_login)


end event

event close;RollBack;
Disconnect Using Sqlca;
 
destroy gnv_odbc
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
	VALUES (:gs_UserID, :ls_errornum, :ls_message, :ls_where, :ls_object, :ls_event, :ls_line, :gs_ver);
if sqlca.sqlcode <> 0 then
	rollback;
else
	commit;
end if

end event

