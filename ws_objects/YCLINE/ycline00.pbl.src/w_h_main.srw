$PBExportHeader$w_h_main.srw
$PBExportComments$생산현장 메인메뉴
forward
global type w_h_main from window
end type
type mdi_1 from mdiclient within w_h_main
end type
type mditbb_1 from tabbedbar within w_h_main
end type
type mdirbb_1 from ribbonbar within w_h_main
end type
type uo_button from u_button within w_h_main
end type
end forward

global type w_h_main from window
integer x = 5
integer y = 4
integer width = 3008
integer height = 1308
boolean titlebar = true
string title = "생산현장(w_h_main)"
string menuname = "m_h_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "Window!"
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
uo_button uo_button
end type
global w_h_main w_h_main

type prototypes

end prototypes

type variables
//
string is_title

end variables

forward prototypes
public subroutine wf_menu ()
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
end prototypes

public subroutine wf_menu ();
end subroutine

public subroutine wf_menucase1 (string arg_str1, string arg_str2);
end subroutine

public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3);
end subroutine

public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4);
end subroutine

on w_h_main.create
if this.MenuName = "m_h_main" then this.MenuID = create m_h_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.uo_button=create uo_button
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.uo_button}
end on

on w_h_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.uo_button)
end on

event open;choose case gs_connect_gb
	case 'MSS'
		/////////////////////////////////
		DISCONNECT;
		/////////////////////////////////
		string  ls_DBParm, ls_dbserver, ls_hostname
		
		ls_hostname = LeftA(trim(gs_workname),6)
		
		ls_DBParm = "CursorLock='ReadOnly',AppName='YCLINE',Host= '" + ls_hostname &
					 + "[YCLINE," + RightA(GS_IPAddress,7) + "]" + GS_VER
		//도장02[YCLINE,8.1.203]V10.0002                                                                                                    
		/////////////////////////////////
		
		SQLCA.DBParm = ls_DBParm
		
		CONNECT USING SQLCA;
		if SQLCA.SQLCode = -1 then
			MessageBox("w_h_main OPEN", "Database와 연결이 되지 않습니다.~r~n" + &
						  "에러코드: " + String(SQLCA.SQLDBCode ) + "~r~n" + &
						  "에러내용: " + SQLCA.SQLErrText, StopSign!, OK!, 1 )
		end if
		SetProfileString("YCLINE.INI", "DATABASE", "DBParm",  ls_DBParm)
		ls_dbserver = ProfileString("YCLINE.INI", "Database", "ServerName", "")
end choose

This.Title  = '(주)유창|생산현장|' + GS_IPAddress + "|" + GS_VER + "[ " + gs_db_gb + " | " + gs_connect_gb + ' ]'
is_title    = This.Title
/////////////////////////////////

// 툴바메뉴 셋팅
choose case lower(gs_userid)
	case "1999010s"
		uo_button.pb_retrieve.visible = true	// 조회	
		uo_button.pb_excel.visible    = true	// 엑셀
		uo_button.pb_save.visible     = true	// 저장
		uo_button.pb_print.visible    = true	// 프린트
		uo_button.pb_close.visible    = true	// 종료
	case else
		uo_button.pb_retrieve.visible = true	// 조회	
		uo_button.pb_excel.visible    = true	// 엑셀
		uo_button.pb_save.visible     = False	// 저장
		uo_button.pb_print.visible    = False	// 프린트	
		uo_button.pb_close.visible    = true	// 종료
end choose


/*2019.04.18 JOWONSUK QRCODE라벨 반영 유무 */
SELECT (CASE WHEN ITEM_CD = 'Y' THEN 'NEW' ELSE 'OLD' END )
INTO :gs_label
FROM CODEMST
WHERE TYPE = 'QRCODE_YN'
     AND ITEM_NM = :GS_AREA;
	  
IF gs_label = '' OR ISNULL(gs_label) THEN
	gs_label = 'OLD'
END IF
////////////////////////////////////////////////////////
//m_h_main.m_window.m_leftmenu.TriggerEvent('Clicked')
////////////////////////////////////////////////////////



choose case LeftA(gs_workno,1)
	case "B", "U", "F", "P", "T", "Y"
		// 절곡, 유압, 성형, 도장, 화성, YSP
		OpenSheet( w_line, this, 5, original! )

	case "S"		// 스리팅
		OpenSheet( w_coilslit_m, this, 5, original! )

	case "C"		// 코일이동
		//OpenSheet( w_coilmove_m, this, 5, original! )

	case else	// 스캐닝
		OpenSheet( w_scaning_m, this, 5, original! )
end choose

choose case gs_area
	case "S0001", "B0001", "T0001"		// 시화사업장, YSP사업장, 화성사업장
	case else
		MessageBox("확인","사업장을 확인하시기 바랍니다.")
		RETURN
end choose

//
Timer( 3 * 60 )

end event

event resize;//
mdi_1.Move(WorkSpaceX(), WorkSpaceY() + uo_button.height)
mdi_1.Resize(WorkSpaceWidth(), WorkSpaceHeight() - uo_button.height + 20)

uo_button.uf_init(This)

end event

event timer;// Timer
Window   wSheet
datetime ldt_getdate

wSheet   = This.GetActiveSheet()
if IsValid( wSheet ) then
	if wSheet.classname() = "w_scaning_m" then
		SELECT TOP 1 getdate() INTO : ldt_getdate FROM login;
		
		this.title = is_title + "| " + string(ldt_getdate,"hh:mm:ss")
	end if
end if

end event

type mdi_1 from mdiclient within w_h_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_h_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_h_main
int X=0
int Y=0
int Width=0
int Height=596
end type

type uo_button from u_button within w_h_main
integer height = 180
integer taborder = 10
end type

on uo_button.destroy
call u_button::destroy
end on

