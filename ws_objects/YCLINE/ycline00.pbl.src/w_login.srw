$PBExportHeader$w_login.srw
$PBExportComments$작업장 로긴
forward
global type w_login from window
end type
type st_area from statictext within w_login
end type
type dw_area from datawindow within w_login
end type
type st_1 from statictext within w_login
end type
type st_3 from statictext within w_login
end type
type cb_2 from commandbutton within w_login
end type
type cb_1 from commandbutton within w_login
end type
type dw_1 from datawindow within w_login
end type
end forward

global type w_login from window
string tag = "YCLINE_AREASELECT"
integer width = 2386
integer height = 2008
boolean titlebar = true
string title = "작업장선택(w_login)"
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
st_area st_area
dw_area dw_area
st_1 st_1
st_3 st_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_login w_login

type prototypes

end prototypes

type variables
gs_where istr_where

//개발 환경 체크
string is_build
end variables

forward prototypes
public function integer wf_dbconnect ()
end prototypes

public function integer wf_dbconnect ();string	ls_server_ip, ls_dsn
integer 	Net

//기존 접속 종료
RollBack using sqlca;
Disconnect Using Sqlca;

//DB 구분(Live, Test)
if is_build = "Y" then		// 개발자 환경
	gs_connect_gb	= 'MSS'		//ODBC, MSS
	gs_db_gb			= 'Live'	//Live, Test
else								// 실행 환경
	gs_connect_gb	= 'MSS'	
	gs_db_gb		= 'Live'
end if

//접속 구분
choose case gs_connect_gb
	case 'MSS'
		//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼기존 DB설정
		if gs_db_gb = 'Live' then
//			SQLCA.DBMS       =ProfileString("YCLINE.INI","Database","DBMS",             " ")
//			SQLCA.Database   =ProfileString("YCLINE.INI","Database","DataBase",         " ")
//			SQLCA.LogID      =ProfileString("YCLINE.INI","Database","LogID",            " ")
//			SQLCA.LogPass    =ProfileString("YCLINE.INI","Database","LogPassword",      " ")
//			SQLCA.ServerName =ProfileString("YCLINE.INI","Database","ServerName",       " ")
//			SQLCA.UserID     =ProfileString("YCLINE.INI","Database","UserID",           " ")
//			SQLCA.DBPass     =ProfileString("YCLINE.INI","Database","DatabasePassword", " ")
//			SQLCA.Lock       =ProfileString("YCLINE.INI","Database","Lock",             " ")
//			SQLCA.DbParm     =ProfileString("YCLINE.INI","Database","DbParm",           " ")
//			SQLCA.Lock       = "RU"
// Profile Live_DB
			SQLCA.DBMS = "SNC SQL Native Client(OLE DB)"
			SQLCA.ServerName = "192.168.1.5"
			SQLCA.LogId = "db_user"
			SQLCA.AutoCommit = False
			SQLCA.DBParm = "Provider='SQLNCLI10',Database='YC',Encrypt=0,BindSPInput=1"
		elseif gs_db_gb = 'Test' then // test         
			messagebox(gs_connect_gb, gs_db_gb)
			// Profile YC_Local
			SQLCA.DBMS = "MSS Microsoft SQL Server 6.x"
			SQLCA.Database = "YC"
			SQLCA.LogPass = ''
			SQLCA.ServerName = "192.168.1.18"
			SQLCA.LogId = "db_user"
			SQLCA.AutoCommit = False
			SQLCA.DBParm = "DateTimeAllowed='Yes'"	
		end if // 				 /*2017.10.24 조원석 추가 */
		SQLCA.Lock       = "RU" // Read Uncommit 은 commit 되지 않을때도 select 가 가능.
		//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲기존 DB설정
	case 'ODBC'
		////▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ODBC 테스트
		Choose Case gs_db_gb
			Case 'Live'
//				messagebox(gs_connect_gb, gs_db_gb)
				ls_server_ip	= '192.168.1.5'
				ls_dsn			= 'YC_DB'
			Case 'Test'
				messagebox(gs_connect_gb, gs_db_gb)
				ls_server_ip	= '192.168.1.18'				
				ls_dsn			= 'YC_TEST_DB'
		End Choose
		
		gnv_odbc.of_MSSQLconnectODBC(ls_server_ip, '1433', ls_dsn, 'db_user', 'YC')
		gnv_odbc.of_SetTransObject (sqlca, ls_dsn, 'db_user', '' )
		SQLCA.Lock       = "RU" // Read Uncommit 은 commit 되지 않을때도 select 가 가능.		
		////▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ODBC 테스트
End Choose

CONNECT USING SQLCA;

IF SQLCA.SQLCode = -1 THEN
	MessageBox("YCLINE OPEN", "Database와 연결이 되지 않습니다.~r~n" + &
              "에러코드: " + String(SQLCA.SQLDBCode ) + "~r~n" + &
              "에러내용: " + SQLCA.SQLErrText, StopSign!, OK!, 1 )
	return -1				  
END IF

return 0
end function

on w_login.create
this.st_area=create st_area
this.dw_area=create dw_area
this.st_1=create st_1
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_area,&
this.dw_area,&
this.st_1,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_login.destroy
destroy(this.st_area)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;/////////////////////////////////////////////////////////////
GS_VER   = "V13.4"  
/////////////////////////////////////////////////////////////
/*2020.07.31  BKKIM ODBC연결 추가  */
/*2019.05.15  JOWONSUK 잔량삭제로직 수정, QRCODE 반영  */
// w_coil01 / ue_keydown / 18 Line 오류
// w_coil01 / dw_2       / 18 Line 오류


IF Handle(GetApplication()) = 0 THEN	//개발환경(파워빌더)
	is_build 			= 'Y'
ELSE												//실행환경(RunTime)
	is_build				= 'N'	
END IF 

//DB 접속▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
if wf_dbconnect() < 0 then
	HALT CLOSE
end if
//DB 접속▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

THIS.Title = THIS.Title + "|" + GS_VER + "[ " + gs_db_gb + " | " + gs_connect_gb + ' ]'
SetPointer(HourGlass!)
GS_RunWindow = Trim( CommandParm() ) // 실행시 확인요

/////////////////////////////////////////////////////////////
SELECT top 1 getdate() INTO :gdt_today FROM login;
/////////////////////////////////////////////////////////////
gd_date    = date(gdt_today)
gs_today   = string(gdt_today, "yyyymmdd")
gs_company = "00"          // (주)유창

gs_workno  =ProfileString("YCLINE.INI","Database","WORK", " ")
if isnull(gs_workno) OR trim(gs_workno) = "" then gs_workno = ""

gs_area    =ProfileString("YCLINE.INI","Database","AREA", " ")
if isnull(gs_area) OR gs_area = "" then gs_area = "S0001"

choose case gs_area
	case "S0001", "B0001"			// 시화사업장, YSP사업장
		gs_loc     = "WS00000000"	// 시화저장소

	case "T0001"		// 화성사업장
		gs_loc     = "WS00000008"	// 화성저장소
end choose
SetPointer(Arrow!)

// 해상도 체크
Environment env 

GetEnvironment(env) 
gl_width  = env.ScreenWidth 
gl_height = env.ScreenHeight

choose case gl_width
	case is <= 1124
		gl_resolution = 100
		
	case is >= 1125
		gl_resolution = 130
end choose
//Messagebox('해상도: ', string(gl_resolution) + " " + string(gl_width) + " " + string(gl_height) ) 

cb_1.default = true

dw_area.settransobject(sqlca)
dw_area.insertrow(0)
dw_area.object.area[1] = gs_area

string ls_usearea

SELECT use_yn INTO :ls_usearea FROM codemst WHERE item_cd = 'YCLINE_AREASELECT' AND use_yn = 'Y';

ls_usearea = "Y"		////

if isnull(ls_usearea) or ls_usearea = "" then
	st_area.textcolor = RGB(255, 255, 255)
	dw_area.enabled = false
else
	st_area.textcolor = RGB(255, 0, 0)
	dw_area.enabled = true
end if

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

long   ll_found

dw_1.retrieve( gs_area )
if dw_1.rowcount() > 0 then
	ll_found = 0
	ll_found = dw_1.find( "work_no = '" + gs_workno + "' ", 1, dw_1.rowcount() )
	if isnull(ll_found) OR ll_found = 0 then ll_found = 1
	
	dw_1.scrolltorow( ll_found )
end if
dw_1.setfocus()

end event

event close;// 파일서버 강제접속 해제
Run("net use \\192.168.1.6\ipc$ /delete",Minimized!)

end event

type st_area from statictext within w_login
integer x = 293
integer y = 220
integer width = 553
integer height = 128
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "사업장:"
boolean focusrectangle = false
end type

type dw_area from datawindow within w_login
integer x = 850
integer y = 208
integer width = 1138
integer height = 156
integer taborder = 10
string title = "사업장"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

event itemchanged;// 사업장
string ls_area

this.accepttext()

ls_area = data
dw_1.retrieve( ls_area )

if	dw_1.rowcount() > 0 then
	dw_1.setfocus()
else
	dw_area.setfocus()
end if

SetProfileString("YCLINE.INI", "Database", "AREA",  ls_area)

end event

type st_1 from statictext within w_login
string tag = "YCLINE_AREASELECT"
integer x = 46
integer y = 48
integer width = 2272
integer height = 140
integer textsize = -26
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "작업장을 선택 하십시요."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_login
integer x = 46
integer y = 36
integer width = 2281
integer height = 348
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_login
integer x = 1189
integer y = 1760
integer width = 1138
integer height = 128
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;// 종료
close(parent)  

end event

type cb_1 from commandbutton within w_login
integer x = 46
integer y = 1760
integer width = 1138
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인[ENT]"
boolean default = true
end type

event clicked;////////////////////////////////////////////////////////////////////
// IP를 통해서 현장장비 구분하기 위한 IP Check 부분)
////////////////////////////////////////////////////////////////////
string  ls_adaptername[], ls_ipaddress[], ls_macaddress[], ls_description[], ls_IP, ls_MAC
integer li_cnt, li_max, li_row

in_adapt.of_GetAdapterInfo(ls_macaddress, ls_description, ls_adaptername, ls_ipaddress)
for li_cnt = 1 to UpperBound(ls_ipaddress)
	if LeftA(ls_ipaddress[li_cnt],3) = "192" then
		ls_IP  = ls_ipaddress[li_cnt]
		ls_MAC = ls_macaddress[li_cnt]
	end if
next

if isnull(ls_ip) or ls_ip = "" then
	MessageBox("확인", "네트워크 정보가 올바르지 않습니다.")
	RETURN
else
	GS_IPAddress  = ls_IP
	GS_MacAddress = ls_MAC
end if

////////////////////////////////////////////////////////////////////
long   ll_row
string ls_area, ls_loc

dw_1.accepttext()
dw_area.accepttext()

ll_row = dw_1.getrow()
if ll_row < 1 then RETURN


////////////////////////////////////////////////////////////////////
gs_area     = dw_area.object.area[1]  										// 사업장
SELECT def_loc INTO :gs_loc FROM area WHERE area_no = :gs_area; 	// 저장소
gs_workno   = dw_1.object.work_no[ll_row]									// 작업장
gs_workname = dw_1.object.work_name[ll_row]								// 작업장명
gs_username = dw_1.object.work_manager[ll_row]							// 기장명
if isnull(gs_userid) OR gs_userid = "" then
	SELECT user_id INTO :gs_userid FROM login WHERE user_name = :gs_username AND area_no = :gs_area;
end if
////////////////////////////////////////////////////////////////////
if isnull(gs_area) OR gs_area = "" OR isnull(gs_loc) OR gs_loc = "" then 
	MessageBox("확인", "작업장의 기본저장소가 선택되지 않았습니다.")
	RETURN
end if

SetProfileString("YCLINE.INI", "Database", "AREA",  gs_area)
SetProfileString("YCLINE.INI", "Database", "WORK",  gs_workno)

Open( w_h_main )
Close( parent )

end event

type dw_1 from datawindow within w_login
integer x = 46
integer y = 400
integer width = 2281
integer height = 1344
integer taborder = 10
string title = "none"
string dataobject = "d_login_wc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

