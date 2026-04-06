$PBExportHeader$w_m_main.srw
$PBExportComments$생산관리메인화면윈도우(작성일:98/01/17, 작성자:곽용덕)
forward
global type w_m_main from window
end type
type mdi_1 from mdiclient within w_m_main
end type
type mditbb_1 from tabbedbar within w_m_main
end type
type mdirbb_1 from ribbonbar within w_m_main
end type
end forward

global type w_m_main from window
integer x = 5
integer y = 4
integer width = 4718
integer height = 2984
boolean titlebar = true
string title = "생산관리(M)"
string menuname = "m_m_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 79741120
event ue_1 pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
end type
global w_m_main w_m_main

type variables
string  is_uptmsg = "N"
int    ii_run = 0
end variables

forward prototypes
public subroutine wf_menu ()
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
end prototypes

public subroutine wf_menu ();//long ll_row,ll_cnt
//string ls_menuitem1,ls_menuitem2,ls_menuitem3,ls_menuitem4
//datastore ds_1,ds_2,ds_3,ds_4
//
//ds_1 = CREATE DataStore
//ds_2 = CREATE DataStore
//ds_3 = CREATE DataStore
//ds_4 = CREATE DataStore
//
//ds_1.dataobject = "d_authority1_login"
//ds_2.dataobject = "d_authority2_login"
//ds_3.dataobject = "d_authority3_login"
//ds_4.dataobject = "d_authority4_login"
//ds_1.settransobject(sqlca)
//ds_2.settransobject(sqlca)
//ds_3.settransobject(sqlca)
//ds_4.settransobject(sqlca)
//
//ds_1.retrieve(gs_userid,"m_main")
//ds_2.retrieve(gs_userid,"m_main")
//ds_3.retrieve(gs_userid,"m_main")
//ds_4.retrieve(gs_userid,"m_main")
//
//ll_row = ds_2.rowcount()
//for ll_cnt = 1 to ll_row
//	 ls_menuitem1 = trim(ds_2.getitemstring(ll_cnt,"menu1"))
//    ls_menuitem2 = trim(ds_2.getitemstring(ll_cnt,"use_type"))
//	 wf_menucase1(ls_menuitem1,ls_menuitem2)
//next
//
//ll_row = ds_3.rowcount()
//for ll_cnt = 1 to ll_row
//	 ls_menuitem1 = trim(ds_3.getitemstring(ll_cnt,"menu1"))
//	 ls_menuitem2 = trim(ds_3.getitemstring(ll_cnt,"menu2"))
//    ls_menuitem3 = trim(ds_3.getitemstring(ll_cnt,"use_type"))
//	 wf_menucase2(ls_menuitem1,ls_menuitem2,ls_menuitem3)
//next
//
//ll_row = ds_4.rowcount()
//for ll_cnt = 1 to ll_row
//	 ls_menuitem1 = trim(ds_4.getitemstring(ll_cnt,"menu1"))
//	 ls_menuitem2 = trim(ds_4.getitemstring(ll_cnt,"menu2"))
//	 ls_menuitem3 = trim(ds_4.getitemstring(ll_cnt,"menu3"))
//    ls_menuitem4 = trim(ds_4.getitemstring(ll_cnt,"use_type"))
//	 wf_menucase3(ls_menuitem1,ls_menuitem2,ls_menuitem3,ls_menuitem4)
//next
end subroutine

public subroutine wf_menucase1 (string arg_str1, string arg_str2);
end subroutine

public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3);
end subroutine

public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4);
end subroutine

on w_m_main.create
if this.MenuName = "m_m_main" then this.MenuID = create m_m_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_m_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

event open;string ls_name
date   ld_date
datetime ldt_date

SELECT REPLACE(area_name,'사업장','') INTO :ls_name 
  FROM area
 WHERE area_no = :gs_area;
THIS.Title = '[' + ls_name + ':생산]' + GS_USERNAME + ' [' + Sqlca.ServerName + '][' + SQLCA.DataBase + '][' + gs_ver + "][" + gs_level + "]"

if GF_PERMISSION("생산관리_입력", gs_userid) = "Y" then
else
	if GF_PERMISSION("생산관리_조회", gs_userid) = "Y" then
		m_m_main.m_manage.enabled 		= true			// 생산관리/관리
			m_m_main.m_manage.m_mpplanm.enabled = false	// 생산관리/관리/생산계획관리
			m_m_main.m_manage.m_procm.enabled   = false	// 생산관리/관리/작업진행관리
			m_m_main.m_manage.m_sliting.enabled = false	// 생산관리/관리/코일 관리
			m_m_main.m_manage.m_ioinout.enabled = false	// 생산관리/관리/자재발주|입고관리
			m_m_main.m_manage.m_etc.enabled     = false	// 생산관리/관리/기타 관리
			m_m_main.m_manage.m_silsa.enabled   = false	// 생산관리/관리/실사관리
			m_m_main.m_manage.m_mpexit.enabled  = true	// 생산관리/관리/생산관리종료
			m_m_main.m_manage.m_exit.enabled    = true	// 생산관리/관리/종료(Exit)
		m_m_main.m_retrieve.enabled   = true	// 생산관리/조회
		m_m_main.m_code.enabled   		= false	// 생산관리/기준정보
	else
		m_m_main.m_manage.enabled 		= true			// 생산관리/관리
			m_m_main.m_manage.m_mpplanm.enabled = false	// 생산관리/관리/생산계획관리
			m_m_main.m_manage.m_procm.enabled   = false	// 생산관리/관리/작업진행관리
			m_m_main.m_manage.m_sliting.enabled = false	// 생산관리/관리/코일 관리
			m_m_main.m_manage.m_ioinout.enabled = false	// 생산관리/관리/자재발주|입고관리
			m_m_main.m_manage.m_etc.enabled     = false	// 생산관리/관리/기타 관리
			m_m_main.m_manage.m_silsa.enabled   = false	// 생산관리/관리/실사관리
			m_m_main.m_manage.m_mpexit.enabled  = true	// 생산관리/관리/생산관리종료
			m_m_main.m_manage.m_exit.enabled    = true	// 생산관리/관리/종료(Exit)
		m_m_main.m_retrieve.enabled   = false	// 생산관리/조회
		m_m_main.m_code.enabled   		= false	// 생산관리/기준정보
	end if
end if


Timer(180)
//PostEvent('ue_1')

end event

event timer;int    li_cnt
long   ll_pos
String ls_msgchk, ls_version, ls_major, ls_minor, ls_major1, ls_minor1

///////////////////////////////////////////////////
// '최신버전 UPDATE' 알림
///////////////////////////////////////////////////
SELECT item_cd INTO :ls_version  FROM CODEMST 
 WHERE TYPE       = 'ERP_VERSION' AND USE_YN  = 'Y';

if ls_version = "" or isnull(ls_version) then
else
	// ERP_VERSION( V9.01125 ) : 메이저 버젼이 다른경우 실행불가
	ll_pos    = PosA(GS_VER, ".")
	ls_major1 = MidA(GS_VER, 2, ll_pos - 1)
	ls_minor1 = MidA(GS_VER, ll_pos + 1, LenA(GS_VER) - ll_pos)
	
	ll_pos    = PosA(ls_version, ".")
	ls_major  = MidA(ls_version, 2, ll_pos - 1)
	ls_minor  = MidA(ls_version, ll_pos + 1, LenA(ls_version) - ll_pos)
	// 메이저 업그레이드
	if ls_major <> ls_major1 then
		if MessageBox("확인","ERP 프로그램 메이저 버젼이 수정되었습니다.(Ver " + GS_VER + " <> " + ls_version + ")~n~n" + &
						  "'최신버전 UPDATE'를 반드시 실행하시기 바랍니다.", Exclamation!, YesNo!, 2) = 1 then
			// 파일서버 강제접속
			Run("net use \\192.168.1.6\ipc$ /user:userdev userdev",Minimized!)
			// 자동 UPDTAE 실행
			RUN ("C:\Program Files\YCSC_MAIN\ycsc_verup.exe YCGW") 
			IF IsValid(w_all_main) = true THEN close(w_all_main)
		else
			MessageBox("확인","'최신버전 UPDATE'를 메시지는 2분 후 재 실행됩니다.")
		end if
	// 마이너 업그레이드
	else
		if is_uptmsg = "Y" then
		else
			if ls_version > GS_VER then
				if ii_run > 0 then	// MessageBox 재 실행 방지
				else
					ii_run = ii_run + 1
					if MessageBox("확인","ERP 프로그램이 수정되었습니다.(Ver " + GS_VER + " <> " + ls_version + ")~n~n" + &
									  "이 ERP 프로그램을 종료하고 '최신버전 UPDATE'를 실행하시겠습니까?", Exclamation!, YesNo!, 2) = 1 then
						is_uptmsg = "N"
		
						// 파일서버 강제접속
						Run("net use \\192.168.1.6\ipc$ /user:userdev userdev",Minimized!)
						// 자동 UPDTAE 실행
						RUN ("C:\Program Files\YCSC_MAIN\ycsc_verup.exe YCGW") 
						IF IsValid(w_all_main) = true THEN close(w_all_main)
					else
						//MessageBox("확인","지금은 '최신버전 UPDATE'를 실행하지 않도록 하겠습니다.")
						is_uptmsg = "Y"
					end if
				end if	// ii_run
			end if
		end if
	end if
end if

///////////////////////////////////////////////////
//// 100분 후 메시지 알림
//if ii_run  > 50 then ii_run = 0
///////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// '컴퓨터분석(WinAuditU)'
//------------------------------------------------------------------------------------------
// CODEMST Table '컴퓨터분석(WinAuditU)' 레코드 설명
// ITEM_NM : 검사시작일, ITEM_CD : 검사옵션, USE_YN : 실행여부 체크, WinAudit : 재 실행방지
////////////////////////////////////////////////////////////////////////////////////////////
string ls_cmdline, ls_useyn, ls_audit, ls_auditucmd, ls_db, ls_server, ls_auditchk, ls_auditymd

SELECT LTRIM(ITEM_NM), LTRIM(ITEM_CD), USE_YN  
  INTO :ls_audit, :ls_cmdline, :ls_useyn
  FROM CODEMST 
 WHERE TYPE  = '컴퓨터분석(WinAuditU)' AND USE_YN = 'Y';

if isnull(ls_audit) or ls_audit = "" then
else
	ls_auditymd     = ProfileString("YCSC.INI", "Database", "WinAuditYMD", " ")	// 검사시작일
	if ls_auditymd  > ls_audit then	// PC 실행일자가 검사시작일 보다 크면 SKIP
	elseif ls_auditymd  < ls_audit then	// PC 실행일자가 검사시작일 이전이면
			SetProfileString("YCSC.INI", "DATABASE", "WinAudit", " ")
			SetProfileString("YCSC.INI", "DATABASE", "WinAuditYMD", ls_audit)
	else	
		ls_auditchk     = ProfileString("YCSC.INI", "Database", "WinAudit", " ")		// 실행유무
		if ls_auditchk  = "Y" then		// 한번 실행한 경우
		else
			ls_server = ProfileString("YCSC.INI", "Database", "ServerName", " ")			
			ls_db     = ProfileString("YCSC.INI", "Database", "DataBase", " ")
			//MessageBox("안내(WinAudit Freeware)", '컴퓨터분석 프로그램을 자동실행 하도록 하겠습니다.~n~n' + &
			//			  '이 분석작업은 한번 실행하면 재 실행되지 않으며, 다음의 작업종료 메시지에서~n' + &
			//			  '(개별적 데이터베이스 삽입에 관한 추가 오류 메시지는 금지됩니다.)~n~n' + &
			//			  '"확인" 버튼만 클릭 하시면 됩니다.~n~n~n' + &
			//			  'ERP 프로그램 작업과는 아무런 상관이 없습니다.  --전산팀--')
			
			ls_auditucmd = "WinAuditU.exe /r=" + ls_cmdline + " /o=ODBC /f=DRIVER=SQL Server;SERVER=" + ls_server + ";UID=db_user;PWD=;DATABASE=" + ls_db + &
								"; /L=ko /m=[송천]컴퓨터분석 작업이 정상 종료될때까지, 이 프로그램을 강제종료(닫기) 하지 마시기 바랍니다."
			RUN (ls_auditucmd, Minimized!) 		
			
			// 정상실행 표시
			SetProfileString("YCSC.INI", "DATABASE", "WinAudit", "Y")
			SetProfileString("YCSC.INI", "DATABASE", "WinAuditYMD", ls_audit)
			
			if IsValid(w_all_main) = true then
				w_all_main.Show()  // 통합 MAINMENU
			else
				w_youchang2.Show() // 게시판
			end if
		end if
	end if
end if
////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////
// 고객센터
///////////////////////////////////////////////////
if GF_PERMISSION("고객센터_메신저_미사용", gs_userid) = "Y" then
else
	gs_custper_str lstr_where
	SELECT count(*) INTO :li_cnt FROM projectmsgdet 
	 WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND msg IS NULL AND del = 'N';
	if li_cnt > 0 then
		lstr_where.str_ok = true
		OpenWithParm(w_projectmsg,lstr_where)
	end if
end if

///////////////////////////////////////////////////
// 메신저
///////////////////////////////////////////////////
setnull(li_cnt)
ls_msgchk  =  ProfileString("YCSC.INI", "MessageBox", "Check", " ")
if ls_msgchk = 'Y' then
	// 메신저
   SELECT count(*) INTO :li_cnt FROM sysmsg 
    WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND del = "N";
	if li_cnt > 0 then
		lstr_where.str_ok = true
		OpenWithParm(w_sysmsg_m,lstr_where)
	end if	
end if

end event

type mdi_1 from mdiclient within w_m_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_m_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_m_main
int X=0
int Y=0
int Width=0
int Height=596
end type

