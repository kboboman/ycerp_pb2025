$PBExportHeader$n_mssql_to_odbc.sru
$PBExportComments$MS-SQL 사용을 ODBC 이용을 위한 설정
forward
global type n_mssql_to_odbc from nonvisualobject
end type
end forward

global type n_mssql_to_odbc from nonvisualobject
end type
global n_mssql_to_odbc n_mssql_to_odbc

type prototypes

end prototypes

type variables
Public: // 모두 접근

Protected: // 상속 하위까지 접근

Private: // 현재의 오브젝트만 접근
n_osversion in_OS
end variables

forward prototypes
public function integer of_settransobject (ref transaction atrans, string as_dsn, string as_user, string as_pass)
public function integer of_mssqlconnectodbc (string as_server, string as_port, string as_dsn, string as_user, string as_database)
private function integer gf_mssqlconnectodbc_7_32 (string as_server, string as_port, string as_dsn, string as_user, string as_database)
private function integer gf_mssqlconnectodbc_10_64 (string as_server, string as_port, string as_dsn, string as_user, string as_database)
private function string replaceall (string as_msg, string as_char, string as_chan)
public function integer gf_mssqlconnectodbc_10_64_user (string as_server, string as_port, string as_dsn, string as_user, string as_database)
end prototypes

public function integer of_settransobject (ref transaction atrans, string as_dsn, string as_user, string as_pass);/*
	ODBC 사용을 위한 transaction 설정
*/
//integer of_SetTransObject (ref transaction atrans, string : as_DSN, as_USER, as_PASS )

atrans.DBMS = "ODBC"
atrans.AutoCommit = False
atrans.DBParm = "ConnectString='"+&
                "DSN="+as_DSN +";"+ &
                "UID="+as_USER+";"+ &
                "PWD="+as_PASS+"'"+ &
                ",PBCatalogOwner='dbo',MsgTerse='Yes',DisableBind=1,CursorLock='Opt',CursorScroll='Dynamic',SQLCache=25"					 					 
return 0
end function

public function integer of_mssqlconnectodbc (string as_server, string as_port, string as_dsn, string as_user, string as_database);/*  MS-SQL 접속용 ODBC 정보 만들기  
	Real파빌Shin
	
	본함수는 Windows 7 32 Bit 용으로 사용한다.
	
	string as_Server   = ""
	String as_Port     = "1433"
	String as_DSN      = "" //ODBC에서 사용할 DSN 명
	String as_user     = ""
	String as_password = ""
	String as_database = ""
	
	of_MSSQLconnectODBC(as_Server, as_Port, as_DSN, as_user, as_database)

*/
//integer gf_MSSQLConnectODBC(string as_Server, String as_Port, String as_DSN, String as_user, String as_database)
String ls_Key, ls_Val, ls_dat
String ls_ver, ls_edi, ls_csd
integer rtn, li_Bit

//in_OS.of_getosversion(ls_ver, ls_edi, ls_csd)
//li_Bit = in_OS.of_getosbits()
//
///* OS Version 을 비교하여 분계 합니다.*/
//choose case UPPER(ls_ver)
//	case UPPER("Windows 10")
//		if li_Bit = 64 then
//			rtn = gf_MSSQLConnectODBC_10_64(as_Server, as_Port, as_DSN, as_user, as_database)
//		else
//			rtn = gf_MSSQLConnectODBC_7_32(as_Server, as_Port, as_DSN, as_user, as_database)
//		end if
//	case UPPER("Windows 8")
//	case UPPER("Windows 8.1")
//	case UPPER("Windows 7")
//		if li_Bit = 64 then
//			rtn = gf_MSSQLConnectODBC_10_64(as_Server, as_Port, as_DSN, as_user, as_database)
//		else
//			rtn = gf_MSSQLConnectODBC_7_32(as_Server, as_Port, as_DSN, as_user, as_database)
//		end if
//	case UPPER("Windows XP")
//		if li_Bit = 64 then
//		else
//			rtn = gf_MSSQLConnectODBC_7_32(as_Server, as_Port, as_DSN, as_user, as_database)
//		end if
//		
//end choose
//

rtn = gf_MSSQLConnectODBC_10_64(as_Server, as_Port, as_DSN, as_user, as_database)
return rtn
end function

private function integer gf_mssqlconnectodbc_7_32 (string as_server, string as_port, string as_dsn, string as_user, string as_database);//integer gf_MSSQLConnectODBC_7_32(string as_Server, String as_Port, String as_DSN, String as_user, String as_database)
String ls_Key, ls_Val, ls_dat
integer rtn

if IsNumber(as_Port) then
	if Trim(as_Port) = '' or IsNull(as_Port) then as_Port = '1433'
else
	as_Port = '1433'
end if

ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources"
ls_Val = as_DSN	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "SQL Server" then
	ls_dat = "SQL Server"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if

ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\"+as_DSN
ls_Val = "Driver"		; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "C:\\Windows\\system32\\SQLSRV32.dll" then
	ls_dat = "C:\\Windows\\system32\\SQLSRV32.dll"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Language"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "한국어" then
	ls_dat = "한국어"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Database"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_Database then
	ls_dat = as_Database
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "LastUser"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_user then
	ls_dat = as_user
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Server"		; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_Server+','+as_Port then
	ls_dat = as_Server+','+as_Port
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
return rtn
end function

private function integer gf_mssqlconnectodbc_10_64 (string as_server, string as_port, string as_dsn, string as_user, string as_database);//integer gf_MSSQLConnectODBC_10_64(string as_Server, String as_Port, String as_DSN, String as_user, String as_database)
String ls_Key, ls_Val, ls_dat
integer rtn
if IsNumber(as_Port) then
	if Trim(as_Port) = '' or IsNull(as_Port) then as_Port = '1433'
else
	as_Port = '1433'
end if

ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\ODBC Data Sources"
ls_Val = as_DSN	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "SQL Server" then
	ls_dat = "SQL Server"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if

ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ODBC\ODBC.INI\"+as_DSN
ls_Val = "Driver"		; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
ls_dat = upper(replaceAll(ls_dat,'\\','\'))
if ls_dat <> upper("C:\Windows\system32\SQLSRV32.dll") then
	ls_dat = upper("C:\Windows\system32\SQLSRV32.dll")
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Language"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "한국어" then
	ls_dat = "한국어"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Database"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_Database then
	ls_dat = as_Database
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "LastUser"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_user then
	ls_dat = as_user
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Server"		; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_Server+','+as_Port then
	ls_dat = as_Server+','+as_Port
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if

return rtn


end function

private function string replaceall (string as_msg, string as_char, string as_chan);/* string replaceAll(string : as_msg, as_char, as_chan )*/
Long li_pos, ll_cnt = 1
String ls_temp, ls_Return
if Trim(as_msg) = '' or IsNull(as_msg) then ll_cnt = -1
if ll_cnt >= 0 then
	do while true
		li_pos = PosA(as_msg, as_char)
		IF li_pos = 0 THEN 
			ls_temp += as_msg
			exit
		END IF
		ll_cnt++
		as_msg = ReplaceA( as_msg, li_pos, LenA(as_char), as_chan)
		ls_temp += LeftA(as_msg, li_pos + LenA(as_chan) - 1)
		as_msg = MidA(as_msg, li_pos + LenA(as_chan) )
	loop
	as_msg = ls_temp
end if
ls_Return = as_msg
return ls_Return
end function

public function integer gf_mssqlconnectodbc_10_64_user (string as_server, string as_port, string as_dsn, string as_user, string as_database);//integer gf_MSSQLConnectODBC_10_64_USER(string as_Server, String as_Port, String as_DSN, String as_user, String as_database)
String ls_Key, ls_Val, ls_dat
integer rtn
if IsNumber(as_Port) then
	if Trim(as_Port) = '' or IsNull(as_Port) then as_Port = '1433'
else
	as_Port = '1433'
end if

ls_Key = "HKEY_CURRENT_USER\Software\ODBC\ODBC.INI\ODBC Data Sources"
ls_Val = as_DSN	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "SQL Server" then
	ls_dat = "SQL Server"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if

ls_Key = "HKEY_CURRENT_USER\Software\ODBC\ODBC.INI\"+as_DSN
ls_Val = "Driver"		; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
ls_dat = upper(replaceAll(ls_dat,'\\','\'))
if ls_dat <> upper("C:\Windows\system32\SQLSRV32.dll") then
	ls_dat = upper("C:\Windows\system32\SQLSRV32.dll")
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Language"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> "한국어" then
	ls_dat = "한국어"
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Database"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_Database then
	ls_dat = as_Database
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "LastUser"	; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_user then
	ls_dat = as_user
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if
ls_Val = "Server"		; ls_dat = ""
rtn = RegistryGet( ls_Key, ls_Val, RegString!, ls_dat )
if ls_dat <> as_Server+','+as_Port then
	ls_dat = as_Server+','+as_Port
	rtn = RegistrySet( ls_Key, ls_Val, RegString!, ls_dat )
end if

return rtn


end function

on n_mssql_to_odbc.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_mssql_to_odbc.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

