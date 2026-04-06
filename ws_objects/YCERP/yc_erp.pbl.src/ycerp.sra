$PBExportHeader$ycerp.sra
$PBExportComments$Generated Application Object
forward
global type ycerp from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
Boolean	GB_WOW64 = false
String	gs_userid, gs_username    
String	gs_team, gs_area, gs_ver
String	gs_print_control
String	gs_level
string	GS_Filter, GS_ColName, GS_ColType

n_winsock gn_ws						
u_external_function gu_ext_func
DataStore   gs_ds_itemall, gs_ds_qaall, gs_ds_whcustret
Environment ge_Environment
Transaction SQLCA2

string GS_IPAddress, GS_MacAddress
n_adapter in_adapt

//임원정보추가에의한 추가변수
String    GS_company, GS_personno, GS_divcode, GS_rank_no
DataStore GS_ds_tax,  GS_ds_permst

//sso용 추가변수
String   GS_SSO[]
String   gs_winname, gs_var1, gs_winname2, gs_var2
DateTime gdt_today,  gdt_todaytime
Long     gl_var1 = 0
long     gl_width,  gl_height, gl_resolution 
String   gs_zipcodes1, gs_zipcodes2, gs_zipcode1, gs_zipcode2
long     GL_DW_BackColor = rgb(230, 230, 230), GL_DW_BackColorInit = 67108864

// SORT, FILTER
DataWindow GDW_Client
string     GS_SortFilter, GS_Sort

//DB연동
string 	gs_db_gb	//db(Live,Test)구분

//Registry 설정
string	gs_reg_path	= 'HKEY_LOCAL_MACHINE\Software\MyApp\YooChang'

//메뉴 구분
string	gs_MenuType	= 'ALL'
end variables

global type ycerp from application
string appname = "ycerp"
integer highdpimode = 0
string appruntimeversion = "25.0.0.3711"
end type
global ycerp ycerp

type prototypes
FUNCTION boolean WriteProfileStringA(string s1, string s2, string s3) LIBRARY "KERNEL32.DLL" alias for "WriteProfileStringA;Ansi"
FUNCTION ulong SetCurrentDirectoryA(string path) LIBRARY "Kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"
FUNCTION boolean SetCursorPos(int cx, int cy) LIBRARY  "User32.dll"
FUNCTION long  SetForegroundWindow (long hwnd) LIBRARY "user32.dll"
Function long  SetWindowPos (long hwnd, long hWndInsertAfter, long x, long y, long cx, long cy, long wFlags) LIBRARY "user32.dll"
FUNCTION long ImmGetContext(long hWnd) LIBRARY "imm32.dll"
FUNCTION long ImmSetConversionStatus(long hWnd, long a, long b) LIBRARY "imm32.dll"
Function boolean FlashWindow (long handle, boolean flash) Library "USER32.DLL"
FUNCTION integer sdp_QRCodeCreate2() LIBRARY 'sdpIkhyeon.DLL'
end prototypes

on ycerp.create
appname="ycerp"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ycerp.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event close;RollBack using sqlca;
Disconnect Using Sqlca;
end event

event open;string	ls_cmd, ls_arg[]
integer	i, li_argcnt
long		ll_i, ll_j

// 해상도 체크
GetEnvironment( ge_Environment )

gl_width  = ge_Environment.ScreenWidth 
gl_height = ge_Environment.ScreenHeight

choose case gl_width
	case is <= 1124
		gl_resolution = 100
	case is >= 1125
		gl_resolution = 130
end choose

ls_cmd    = Trim( CommandParm() )
li_argcnt = 1
DO WHILE LenA(ls_cmd) > 0
    i = PosA( ls_cmd, " ")
    if i = 0 then i = LenA(ls_cmd) + 1
	 
    ls_arg[li_argcnt] = LeftA(ls_cmd, i - 1)
    li_argcnt = li_argcnt + 1
    ls_cmd    = ReplaceA(ls_cmd, 1, i, "")
LOOP

ll_i = UpperBound(ls_arg)
for ll_j = 1 to ll_i
	GS_SSO[ll_j] = trim(ls_arg[ll_j])
next
 
Open(w_login)
end event

event systemerror;string ls_errornum, ls_message, ls_where, ls_object, ls_event, ls_line

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

