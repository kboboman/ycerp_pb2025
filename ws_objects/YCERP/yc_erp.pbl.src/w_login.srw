$PBExportHeader$w_login.srw
$PBExportComments$유창로그인화면(작성일: 98/02/06, 작성자:곽용덕)
forward
global type w_login from window
end type
type cbx_id from checkbox within w_login
end type
type lb_list from listbox within w_login
end type
type st_db from statictext within w_login
end type
type ddlb_db from dropdownlistbox within w_login
end type
type st_pwdday from statictext within w_login
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
type cb_update from commandbutton within w_login
end type
type st_db_ip from statictext within w_login
end type
type pb_3 from picturebutton within w_login
end type
type pb_2 from picturebutton within w_login
end type
type r_1 from rectangle within w_login
end type
end forward

global type w_login from window
integer x = 1061
integer y = 716
integer width = 1646
integer height = 1112
boolean titlebar = true
string title = "로그인(w_login)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
boolean center = true
event we_postopen ( )
cbx_id cbx_id
lb_list lb_list
st_db st_db
ddlb_db ddlb_db
st_pwdday st_pwdday
st_day st_day
phl_1 phl_1
cbx_total cbx_total
sle_2 sle_2
st_3 st_3
sle_1 sle_1
st_1 st_1
cb_update cb_update
st_db_ip st_db_ip
pb_3 pb_3
pb_2 pb_2
r_1 r_1
end type
global w_login w_login

type prototypes
//실행 환경 구분
FUNCTION STRING GetCommandLineA()  LIBRARY "kernel32.DLL" alias for "GetCommandLineA;Ansi"
FUNCTION ulong GetModuleFileName(ulong hModule, ref string lpFilename, ulong nSize) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetModuleFileNameA;Ansi"
FUNCTION long IsWow64Process(long hwnd, ref boolean Wow64Process) LIBRARY "KERNEL32.DLL"
FUNCTION long GetCurrentProcess()  LIBRARY "KERNEL32.DLL"
end prototypes

type variables
string is_build
end variables

forward prototypes
public function integer wf_dbconnect ()
public function integer wf_filedelete ()
public subroutine wf_registry ()
public subroutine wf_popbill_alarm (string as_gubun)
end prototypes

event we_postopen();//////////////////////////
//CODEMST 관리작업(codemst)도 같이 수정해야함(ERP_VERSION)
GS_VER = "V20.2000"
//////////////////////////
string	ls_db, ls_server, ls_allmenu, ls_dbgubun
string 	ls_getgwid, ls_getpw, ls_team_code
integer	li_cnt, li_i

IsWow64Process(GetCurrentProcess(), GB_WOW64)

//실행 환경 구분▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//Live/Test DB 구분
ls_dbgubun	= ProfileString("YCERP.INI","Database","DBGUBUN",	" ")
if isnull(ls_dbgubun) or ls_dbgubun = '' then
	ls_dbgubun	= 'Live'
	SetProfileString("YCERP.INI", "DATABASE", "DBGUBUN", '"' + ls_dbgubun + '"')
end if
ddlb_db.text	= ls_dbgubun

IF Handle(GetApplication()) = 0 THEN	//개발환경(파워빌더)
	st_db.visible			= true		
	ddlb_db.visible		= true		
	is_build 				= 'Y'
ELSE												//실행환경(RunTime)
	st_db.visible			= false			
	ddlb_db.visible		= false		
	is_build	 				= 'N'	
END IF 
//실행 환경 구분▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

// 작업윈도우로 설정하기
SetForeGroundWindow ( handle(this) )

this.title = this.title + "-[" + GS_VER + "]"

ls_db      = ProfileString("YCERP.INI", "Database", "DataBase", " ")
ls_server  = ProfileString("YCERP.INI", "Database", "ServerName", " ") 
ls_allmenu = ProfileString("YCERP.INI", "DATABASE", "ALLMENU",  " ")
if ls_allmenu = "Y" then cbx_total.checked = true

st_db_ip.text = ls_server + " " + upper(trim(ls_db) + "ERP")
if upper(trim(ls_db)) <> "YC" then st_db_ip.TextColor = rgb(255,0,0)
st_day.text = string(Today(), "yyyy/mm/dd")	//PC적용시간

//배포 관련 네트워크 드라이브 연동
if is_build = "Y" then //개발환경(파워빌더)
	Run("net use \\192.168.1.6\PB80 /user:administrator !@#gksfktks",Minimized!)
else
	Run("net use \\192.168.1.6\PB80 /user:userdev userdev",Minimized!)
end if

li_i = UpperBound(GS_SSO) 
if li_i = 2 then
	if Upper(GS_SSO[2]) = "YCGW" OR Upper(GS_SSO[2]) = "PASS" then
		//////////////////////////////////////////////////////////////////
		// ycerp_verup.exe 프로그램에서 ycerp_main.exe 를 실행한 경우
		// Run(".\ycerp_main.exe PASS PASS")
		//////////////////////////////////////////////////////////////////
		if Upper(GS_SSO[1]) = "PASS" AND Upper(GS_SSO[2]) = "PASS" then
			GS_SSO[1]  = ProfileString("YCERP.INI","Database","LOGINGW", " ")
			sle_1.text = GS_SSO[1]
		end if

		ls_getgwid	= GS_SSO[1] 
		sle_1.text	= ls_getgwid
		gs_userid	= ls_getgwid
		
		SetProfileString("YCERP.INI", "DATABASE", "LOGINGW", GS_SSO[1])

		if is_build = "Y" then	// 개발자 환경
		else	
			if Upper(GS_SSO[2]) = "YCGW" then
				//불필요 File 제거▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
				//wf_filedelete()	2020.07.31 주석처리
				//불필요 File 제거▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
				
				// 자동 UPDTAE 실행
				RUN (".\ycerp_verup.exe YCGW") 
				IF IsValid(w_login) = true THEN close(w_login)
			else
				sle_1.text = ls_getgwid
				pb_2.triggerevent(clicked!)	// 로그인
				return
			end if		
		end if
	else		// NOT ("YCGW", "PASS")
//		RUN (".\VerCopy.bat", Minimized!)
		MessageBox("[확인]", "환경설정이 잘못되었습니다. 확인 후 재 실행하시기 바랍니다.",stopsign!)
		halt close
	end if
else	// .\ycerp_main.exe
	if is_build = "Y" then		// 개발자 환경
		ls_getgwid = ProfileString("YCERP.INI","Database","login2", " ") 	
		sle_1.text = ls_getgwid

		ls_getpw		= 'ycc1324'
		sle_2.text	= ls_getpw
		sle_2.setfocus()
	else	
		sle_1.text   = ProfileString("YCERP.ini","Database","LOGINGW", " ") 	
		sle_2.setfocus()
	end if
end if

//V20.1000		2023/02/22 - 버전체크 로직 변경
//V20.0002		2023/01/26 - NAS DSM 버젼업으로 네트워크 접속 체크	
//V20.0000		2022/12/30 - PBL변경(YC_추가)
end event

public function integer wf_dbconnect ();string	ls_server_ip, ls_dsn
integer 	Net

//기존 접속 종료
RollBack using sqlca;
Disconnect Using Sqlca;

//DB 구분(Live, Test)
if is_build = "Y" then		// 개발자 환경
	gs_db_gb			= ddlb_db.text
	if isnull(gs_db_gb) or gs_db_gb = '' then
		messagebox("오류", "DB 구분 오류")
		return -1
	end if
else
	gs_db_gb	= 'Live'
end if

if gs_db_gb = 'Live' then
	SQLCA.ServerName  = "192.168.1.5"
elseif gs_db_gb = 'Test' then
	messagebox("확인","Test DB입니다.")
	SQLCA.ServerName = "192.168.1.12"			
elseif gs_db_gb = 'Recovery' then
	messagebox("확인","Recovery DB입니다.")
	SQLCA.ServerName = "192.168.1.4"			
end if

SQLCA.DBMS       = ProfileString("YCERP.INI","Database","DBMS",             " ")
SQLCA.Database   = ProfileString("YCERP.INI","Database","DataBase",         " ")
SQLCA.LogID      = ProfileString("YCERP.INI","Database","LogID",            " ")
SQLCA.LogPass    = ProfileString("YCERP.INI","Database","LogPassword",      " ")
SQLCA.UserID     = ProfileString("YCERP.INI","Database","UserID",           " ")
SQLCA.DBPass     = ProfileString("YCERP.INI","Database","DatabasePassword", " ")
SQLCA.Lock       = ProfileString("YCERP.INI","Database","Lock",             " ")
SQLCA.DbParm     = ProfileString("YCERP.INI","Database","DbParm",           " ")
SQLCA.AutoCommit = False
SQLCA.Lock       = "RU" //Read Uncommit 은 commit 되지 않을때도 select 가 가능.

CONNECT USING SQLCA;

IF SQLCA.SQLCode = -1 THEN
	MessageBox("오류2", "Database와 연결이 되지 않습니다.~r~n" + &
              "에러코드: " + String(SQLCA.SQLDBCode ) + "~r~n" + &
              "에러내용: " + SQLCA.SQLErrText, StopSign!, OK!, 1 )
	return -1				  
END IF

return 0
end function

public function integer wf_filedelete ();//리스트 박스에 등록된 파일을 삭제한다.
string	ls_file, ls_path 
long		i, ll_total 

ls_path	= GetCurrentDirectory ()
ll_total	= lb_list.totalitems( )
for i = 1 to ll_total 
	ls_file = ls_path + lb_list.text(i)
	If FileExists(ls_file) Then
		FileDelete(ls_file)
	End if	
next

sleep(0.5)
return 0
end function

public subroutine wf_registry ();ulong ul_setnum = 146944	
ulong ul_getnum
string ls_path = 	"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing"

RegistryGet(ls_path, "State", RegULong!, ul_getnum)
if ul_getnum <> ul_setnum then
	RegistrySet(ls_path, "State", ReguLong!, ul_setnum)		
end if					

return
end subroutine

public subroutine wf_popbill_alarm (string as_gubun);pointer oldpointer 
oldpointer = SetPointer(HourGlass!)
choose case as_gubun
	case 'mort'	//담보내역 알람
		string ls_sql, ls_syntax, ls_sqlerr
		long	 i, j, ll_rcnt, ll_rcnt2, ll_dt, ll_date_diff
		string	ls_a, ls_b, ls_c, ls_d, ls_e	
		string	ls_template_cd = '021120000788'
		string	ls_s_hp_no, ls_s_msg, ls_send_dt_max, ls_send_dt, ls_cust_no, ls_user_id
		string	ls_salesman, ls_hp_no, ls_seq
		datastore lds_tb, lds_tb2
		
		//기존 전송 여부 확인
		select 
			 max(send_dt) 
			,convert(char(8), getdate(), 112) 
		into 
			 :ls_send_dt_max 
			,:ls_send_dt			 
		from 
			mortalarm_send 
		using sqlca;
		if gf_null_chk(ls_send_dt_max)  = true then
			ll_dt	= 0
		else
			select top 1 datediff(day,convert(date, :ls_send_dt_max), getdate()) into :ll_dt from mortalarm_send using sqlca;
			choose case ll_dt
				case 0
					return
				case 1
					ll_dt = 0
			end choose
		end if
		
		//전송 거래처 구하기
		lds_tb = create datastore
		lds_tb.dataobject = 'd_mortalarm_send_list'
		lds_tb.settransobject(sqlca)
		ll_rcnt	= lds_tb.retrieve()

		for i = 1 to ll_rcnt
			ls_a	= ''	//거래선명
			ls_b	= ''	//영업담당
			ls_c	= ''	//담보내역
			ls_d	= ''	//담보금액
			ls_e	= ''	//담보만기
			ls_cust_no	= ''
			ls_salesman	= ''
			ls_hp_no		= ''
			ll_date_diff= 0	
			ls_cust_no	= lds_tb.getitemstring(i, 'cust_no')
			ls_salesman	= lds_tb.getitemstring(i, 'salesman')
			ls_hp_no		= lds_tb.getitemstring(i, 'hp_no')		
			ll_date_diff= lds_tb.getitemnumber(i, 'date_diff')			
			ls_a			= lds_tb.getitemstring(i, 'cust_name')
			ls_b			= lds_tb.getitemstring(i, 'user_name') 
			ls_c			= lds_tb.getitemstring(i, 'dambo_rem')
			ls_d			= string(lds_tb.getitemdecimal(i, 'dambo_amt'),'#,##0')
			ls_e			= lds_tb.getitemstring(i, 'dambo_value')
			
			//체크 날짜 구하기
			string	ls_rslt = 'N'
			choose case ll_date_diff
				case 60 - ll_dt  to 60
					ls_rslt = 'Y'
				case 30 - ll_dt  to 30        
					ls_rslt = 'Y'
				case 7 - ll_dt  to 7        
					ls_rslt = 'Y'					
				case -7 - ll_dt  to -7        					
					ls_rslt = 'Y'					
				case else        
					ls_rslt = 'N'
			end choose
			
			choose case ls_rslt
				case 'Y'
					//받는 사람 구하기
					lds_tb2 = create datastore					
					ls_sql = "select b.user_id, b.hp_no from codemst a,salehp b where a.item_cd = b.user_id and a.type = '담보내역 알림톡 전송' and a.use_yn = 'Y'"
					ls_syntax = sqlca.syntaxfromsql(ls_sql, 'style(type=grid)' , ls_sqlerr)
					lds_tb2.create(ls_syntax)
					lds_tb2.settransobject(sqlca)
					ll_rcnt2	= lds_tb2.retrieve(sqlca)
		
					if ll_rcnt2 = 0 then return	//받는 사람이 없으면 exit
					for j = 1 to ll_rcnt2
						ls_seq	= string(i) + string(j)
						//알림톡 전송
						ls_user_id	= lds_tb2.getitemstring(j, 'user_id')	
						ls_s_hp_no	= lds_tb2.getitemstring(j, 'hp_no')	
//						ls_s_hp_no	= '01027369470'		//주석처리
//						ls_hp_no		= '01027369470'		//주석처리

						if gf_null_chk(ls_s_hp_no) = true then continue
						
						Select 
							content
						into
							:ls_s_msg
						From
							sdk_popbill_template
						Where
							use_yn = 'Y'
						And	
							template_cd = :ls_template_cd
						Using sqlca;		
						ls_s_msg	= gf_replaceall(ls_s_msg, '#A',ls_a)
						ls_s_msg	= gf_replaceall(ls_s_msg, '#B',ls_b)
						ls_s_msg	= gf_replaceall(ls_s_msg, '#C',ls_c)
						ls_s_msg	= gf_replaceall(ls_s_msg, '#D',ls_d)
						ls_s_msg	= gf_replaceall(ls_s_msg, '#E',ls_e)
						
						GF_MMSSEND( ls_template_cd, '', ls_s_hp_no, '담보내역', ls_s_msg )
						insert into mortalarm_send 
							(send_dt, cust_no, user_id, seq, input_id, input_dt) 
						values 
							(:ls_send_dt, :ls_cust_no, :ls_user_id, :ls_seq, :gs_userid, getdate()) 
						using sqlca;
						if sqlca.sqlcode <> 0 then
							rollback using sqlca;
						end if
					next
					//담당자 보내기
					if gf_null_chk(ls_hp_no) = true then continue
					GF_MMSSEND( ls_template_cd, '', ls_hp_no, '담보내역', ls_s_msg )
					insert into mortalarm_send 
						(send_dt, cust_no, user_id, seq, input_id, input_dt) 
					values 
						(:ls_send_dt, :ls_cust_no, :ls_salesman, 'ZZZZZ', :gs_userid, getdate()) 
					using sqlca;	
					if sqlca.sqlcode <> 0 then
						rollback using sqlca;
					end if	
			end choose
			
		next			
end choose

//종료표시
insert into mortalarm_send 
	(send_dt, cust_no, user_id, seq, input_id, input_dt) 
values 
	(:ls_send_dt, 'END', 'END', 'ALARMEND', :gs_userid, getdate())
using sqlca;	
if sqlca.sqlcode <> 0 then
	rollback using sqlca;
	return
end if	

commit using sqlca;
SetPointer(oldpointer)
end subroutine

on w_login.create
this.cbx_id=create cbx_id
this.lb_list=create lb_list
this.st_db=create st_db
this.ddlb_db=create ddlb_db
this.st_pwdday=create st_pwdday
this.st_day=create st_day
this.phl_1=create phl_1
this.cbx_total=create cbx_total
this.sle_2=create sle_2
this.st_3=create st_3
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_update=create cb_update
this.st_db_ip=create st_db_ip
this.pb_3=create pb_3
this.pb_2=create pb_2
this.r_1=create r_1
this.Control[]={this.cbx_id,&
this.lb_list,&
this.st_db,&
this.ddlb_db,&
this.st_pwdday,&
this.st_day,&
this.phl_1,&
this.cbx_total,&
this.sle_2,&
this.st_3,&
this.sle_1,&
this.st_1,&
this.cb_update,&
this.st_db_ip,&
this.pb_3,&
this.pb_2,&
this.r_1}
end on

on w_login.destroy
destroy(this.cbx_id)
destroy(this.lb_list)
destroy(this.st_db)
destroy(this.ddlb_db)
destroy(this.st_pwdday)
destroy(this.st_day)
destroy(this.phl_1)
destroy(this.cbx_total)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_update)
destroy(this.st_db_ip)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.r_1)
end on

event open;//*-----------------------------------------------------------------*/
//*    open:  Post event
//*-----------------------------------------------------------------*/
this.Post Event we_postopen ( )
end event

event close;// 파일서버 강제접속 해제
Run("net use \\192.168.1.6\ipc$ /delete",Minimized!)


end event

type cbx_id from checkbox within w_login
integer x = 1038
integer y = 324
integer width = 512
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "아이디 저장"
end type

type lb_list from listbox within w_login
boolean visible = false
integer width = 101
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string item[] = {"PBDWR80.DLL","PBODB80.DLL","PBODB80.INI","PBRTC80.DLL","PBTRA80.DLL"}
borderstyle borderstyle = stylelowered!
end type

type st_db from statictext within w_login
boolean visible = false
integer x = 37
integer y = 776
integer width = 242
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "DB구분"
boolean focusrectangle = false
end type

type ddlb_db from dropdownlistbox within w_login
boolean visible = false
integer x = 288
integer y = 764
integer width = 462
integer height = 472
integer taborder = 70
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Live","Test","Recovery"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//messagebox('11',this.text(index))
SetProfileString("YCERP.INI", "DATABASE", "DBGUBUN", '"' + this.text(index) + '"')
end event

type st_pwdday from statictext within w_login
integer x = 1440
integer y = 428
integer width = 119
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_day from statictext within w_login
integer x = 1038
integer y = 84
integer width = 512
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type phl_1 from picturehyperlink within w_login
integer x = 160
integer y = 8
integer width = 686
integer height = 600
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "C:\BMP\YC_150X150.jpg"
boolean focusrectangle = false
end type

type cbx_total from checkbox within w_login
integer x = 1038
integer y = 8
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
boolean enabled = false
string text = "통합 MAINMENU"
end type

type sle_2 from singlelineedit within w_login
integer x = 1038
integer y = 512
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

type st_3 from statictext within w_login
integer x = 1038
integer y = 428
integer width = 402
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean enabled = false
string text = "Password:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_login
integer x = 1038
integer y = 224
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
boolean hideselection = false
end type

event getfocus;//
this.SelectText(1, Len(this.text))

end event

event modified;//
string ls_userid

ls_userid = trim(this.text)
if IsArabicAndNumbers(ls_userid) then
else
	SELECT user_id INTO :ls_userid FROM login WHERE user_name = :ls_userid AND use_flag = 'Y';
	if isnull(ls_userid) OR ls_userid = "" then
	else
		this.text = ls_userid
	end if
end if


sle_2.text = ""

end event

type st_1 from statictext within w_login
integer x = 1038
integer y = 148
integer width = 512
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean enabled = false
string text = "로그인 ID"
boolean focusrectangle = false
end type

type cb_update from commandbutton within w_login
event ue_1 pbm_custom01
integer x = 32
integer y = 624
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

event ue_1;//
RUN (".\ycerp_verup.exe") 

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
	
	RUN(".\ycerp_verup.exe YCGW") 
	close(parent)
end if
end event

type st_db_ip from statictext within w_login
integer x = 37
integer y = 880
integer width = 1518
integer height = 116
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8388608
string text = "YC2010 YCERP"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;string	ls_path
ls_path	 = GetCurrentDirectory ()

messagebox('ls_path', ls_path)
end event

type pb_3 from picturebutton within w_login
integer x = 1042
integer y = 752
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
integer x = 1042
integer y = 624
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

event clicked;string	ls_userid, ls_passwd,   ls_name, ls_slip, ls_userlevel, ls_rank_no 
string	ls_dbuser, ls_dbpasswd, ls_team, ls_area, ls_ver, ls_update
string	ls_today, ls_todaytime, ls_sqlerrtext, ls_day1, ls_day2, ls_rem
date		ld_date
time		lt_time
long		ll_cnt

//Registry 셋팅▼▼▼
wf_registry()
//▲▲▲▲▲▲▲▲▲

//DB 접속▼▼▼
if wf_dbconnect() < 0 then
	return
end if
//▲▲▲▲▲▲▲

// 배포소스 버전 확인▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
// we_postopen의 gs_ver 값 확인
select 
	isnull(item_cd,'V00.0000')  
into 
	:ls_update
from 
	codemst 
where 
	type = 'ERP_VERSION'
and 
	use_yn  = 'Y'
using sqlca;

if sqlca.sqlcode <> 0 then         
	ls_sqlerrtext	= "로그인 버튼을 다시 누르세요!"
	messagebox("확인", ls_sqlerrtext)
	return
end if

if ls_update <> gs_ver then
	MessageBox("주의","새로 배포된 소스가 있습니다.~r~n바탕화면 아이콘으로~r~n재 실행 후 사용하세요.")
	return
end if
// 배포소스 버전 확인▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

// 작업일자, 작업시간▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
SELECT 
	CONVERT(varchar(10), getdate(), 111), CONVERT(varchar(19), getdate(), 120)
INTO 
	:ls_today, :ls_todaytime 
FROM 
	dual
using sqlca;

ld_date       = date(ls_today)
lt_time       = time(RightA(ls_todaytime,8))
gdt_today     = datetime(ld_date, time("00:00:00"))
gdt_todaytime = datetime(ld_date, lt_time)

ls_day1     = string(gdt_today, "yyyy/mm/dd")
ls_day2     = string(Today(),   "yyyy/mm/dd")
if ls_day1 <> ls_day2 then
	st_day.backcolor = rgb(255, 0, 0)
	if MessageBox("경고", "ERP 시스템일자와 사용자 컴퓨터일자가 일치하지 않습니다." + &
                 "~n~n컴퓨터일자를 변경한 후 작업하시기 바랍니다.", Exclamation!, OKCancel!, 2) = 2 then
		return
	end if
end if
// 작업일자, 작업시간▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

ls_userid = trim(sle_1.text)
ls_passwd = trim(sle_2.text)
if gf_null_chk(ls_userid) then
	messagebox("확인","ID를 입력하세요.")
 	sle_1.SetFocus()
	return
end if
if gf_null_chk(ls_passwd) then
	messagebox("확인","Password를 입력하세요.")
 	sle_2.SetFocus()
	return
end if

SELECT 
	count(*)
INTO 
	:ll_cnt
FROM 
	login 
WHERE
	use_flag = 'Y' 
and 
	user_id	= :ls_userid 
and	
	password	= :ls_passwd
using sqlca; 

if ll_cnt = 0 then
	messagebox("확인","ID/Password를~r~n다시 확인하세요.")
	sle_2.Text = ''
	sle_2.SetFocus()
	return
end if

//RPA 사용자 로직 추가▼▼▼
//string	gs_MenuType	= 'ALL'(기본) / 'RPA(RPA)'
string ls_gw_id, ls_cfmtn_id
select
	gw_id
into
	:ls_gw_id
from 
	login 
where 
	team_code	= 'X1000'
and		
	rem			= 'rpa'
and		
	user_id 		= :ls_userid
using sqlca;

if gf_null_chk(ls_gw_id) then
	gs_MenuType = 'ALL'
	ls_cfmtn_id	= ls_userid
else
	gs_MenuType = 'RPA'
	ls_cfmtn_id	= ls_userid
	ls_userid	= ls_gw_id
end if
//▲▲▲▲▲▲▲▲▲▲▲▲▲

SELECT 
	user_name,	user_id,		password,		team_code,	area_no,		user_level,		rank_no		, rem
INTO 
	:ls_name,	:ls_dbuser,	:ls_dbpasswd,	:ls_team,	:ls_area,	:ls_userlevel,	:ls_rank_no	, :ls_rem
FROM 
	login 
WHERE 
	user_id = :ls_userid AND use_flag = 'Y'
using sqlca; 

if sqlca.sqldbcode <> 0 then
	messagebox("확인","사용자 기본 자료를~r~n조회하지 못했습니다.")
	sle_1.selectText(1, LenA(sle_1.Text))
 	sle_1.SetFocus()
	return
end if

//권한별 메뉴 재구성
choose case ls_rem
	case 'ROBOT'
		gs_MenuType	= 'ROBOT'
end choose

gs_userid	= trim(ls_dbuser)
gs_level  	= trim(ls_userlevel)
gs_username = trim(ls_name)
gs_team   	= trim(ls_team)
gs_area   	= trim(ls_area)
gs_rank_no 	= trim(ls_rank_no)

string ls_hostname
ls_hostname  = gn_ws.of_GetHostName()
gs_ipaddress = gn_ws.of_GetIPAddress( ls_hostname )

string  ls_ipaddress = space(50), ls_macname = space(50), ls_gateway, ls_ipmask
string  dir, dir1, ls_ip, ls_err, ls_module
integer i

if cbx_total.checked = true then
	ls_module = "물류통합"
else
	ls_module = "물류개별"
end if

setnull(ls_ip)
ls_ver = "YCERP " + gs_ver

SELECT 
	ip 
INTO 
	:ls_ip 
FROM 
	userip  
WHERE 
	user_id	= :ls_cfmtn_id 
AND 
	mask		= :ls_macname
and
	pb_ver	= :ls_ver
using sqlca;

if sqlca.sqlcode = 100 then
	INSERT INTO userip 
		(user_id, user_name, ip, mask, gateway, pb_ver, moudule, sys_date) 
	VALUES 
		(:ls_cfmtn_id, :ls_name, :ls_ipaddress, :ls_macname, :ls_gateway, :ls_ver, :ls_module, :gdt_todaytime)
	using sqlca;
	
	if sqlca.sqlcode = -1 then         
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("sql error", ls_sqlerrtext)
		return
	end if
elseif sqlca.sqlcode = 0 then
	UPDATE 
		userip 
	SET 
		 user_name= :ls_name, ip= :ls_ipaddress, gateway= :ls_gateway
		,pb_ver= :ls_ver, moudule= :ls_module, sys_date= :gdt_todaytime
	WHERE 
		user_id  = :ls_cfmtn_id 
	AND 
		mask		= :ls_macname
	and
		pb_ver	= :ls_ver
	using sqlca;
	
	if sqlca.sqlcode = -1 then         
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("sql error", ls_sqlerrtext)
		return
	end if
end if

ls_slip = "CursorLock='ReadOnly',AppName='YCERP',Host= '" + trim(ls_name) + "YCERP LOGIN'"
SetProfileString("YCERP.INI", "DATABASE", "DBParm",  ls_slip)
SetProfileString("YCERP.INI", "DATABASE", "LOGIN2",  ls_cfmtn_id)
SetProfileString("YCERP.INI", "DATABASE", "LoginGW", ls_cfmtn_id)

UPDATE 
	login 
SET 
	 logdt			= getdate()
	,force_update	= :gs_ver 
WHERE 
	user_id = :ls_cfmtn_id
using sqlca;

if sqlca.sqlcode = -1 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return
end if

COMMIT using sqlca;

//팝빌 알림 로직 추가▼▼▼
if gs_db_gb = 'Live' then
	wf_popbill_alarm('mort')
end if
//▲▲▲▲▲▲▲▲▲▲▲▲▲

if cbx_total.checked = true then
	SetProfileString("YCERP.INI", "DATABASE", "ALLMENU", 'Y')
	Open(w_all_main)  // 통합 MAINMENU
else
	if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" then
		SetProfileString("YCERP.INI", "DATABASE", "ALLMENU", 'Y')
		Open(w_all_main)  // 통합 MAINMENU
	else
		SetProfileString("YCERP.INI", "DATABASE", "ALLMENU", 'N')
		Open(w_youchang2) // 유창게시판
	end if
end if	


end event

type r_1 from rectangle within w_login
integer linethickness = 4
long fillcolor = 16777215
integer x = 32
integer y = 4
integer width = 942
integer height = 612
end type

