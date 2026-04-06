$PBExportHeader$w_o_main.srw
$PBExportComments$영업관리메인화면(작성일:98/01/17, 작성자:곽용덕)
forward
global type w_o_main from window
end type
type mdi_1 from mdiclient within w_o_main
end type
type mditbb_1 from tabbedbar within w_o_main
end type
type mdirbb_1 from ribbonbar within w_o_main
end type
end forward

global type w_o_main from window
integer x = 5
integer y = 4
integer width = 4754
integer height = 3164
boolean titlebar = true
string title = "판매관리(O)"
string menuname = "m_o_main"
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
global w_o_main w_o_main

type variables
string  is_uptmsg = "N", is_msgchk = "N"
int     ii_run = 0

end variables

forward prototypes
public subroutine wf_menu ()
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
end prototypes

event ue_1;//int    li_cnt
//string ls_msgchk
//gs_custper_str lstr_where
//
//ls_msgchk = ProfileString("YCERP.INI", "MessageBox", "Check", " ")
//if ls_msgchk = "N" or IsNull(ls_msgchk) then return
//
//if ls_msgchk = "Y" then
//	SELECT count(*) INTO :li_cnt FROM sysmsg WHERE tlogin = :gs_userid AND del = "N";
//	if li_cnt > 0 then
//		if MessageBox("메시지","확인 되지 않은 메시지가 " + string(li_cnt) + " 개 있습니다 ~r~n" + &
//						  "메지시를 확인하시겠읍니까", Exclamation!, OKCancel!, 2) = 1 then
//			lstr_where.str_ok = true
//			OpenWithParm(w_sysmsg_m,lstr_where)
//			w_sysmsg_m.WindowState = Normal!
//		end if
//	end if
//else
//	Return
//end if
//
end event

public subroutine wf_menu ();// wf_menu

long ll_row,ll_cnt
string ls_menuitem1,ls_menuitem2,ls_menuitem3,ls_menuitem4
datastore ds_1,ds_2,ds_3,ds_4

ds_1 = CREATE DataStore
ds_2 = CREATE DataStore
ds_3 = CREATE DataStore
ds_4 = CREATE DataStore

ds_1.dataobject = "d_authority1_login"
ds_2.dataobject = "d_authority2_login"
ds_3.dataobject = "d_authority3_login"
ds_4.dataobject = "d_authority4_login"
ds_1.settransobject(sqlca)
ds_2.settransobject(sqlca)
ds_3.settransobject(sqlca)
ds_4.settransobject(sqlca)

ds_1.retrieve(gs_userid,"m_main")
ds_2.retrieve(gs_userid,"m_main")
ds_3.retrieve(gs_userid,"m_main")
ds_4.retrieve(gs_userid,"m_main")

ll_row = ds_2.rowcount()
for ll_cnt = 1 to ll_row
	 ls_menuitem1 = trim(ds_2.getitemstring(ll_cnt,"menu1"))
    ls_menuitem2 = trim(ds_2.getitemstring(ll_cnt,"use_type"))
	 wf_menucase1(ls_menuitem1,ls_menuitem2)
next

ll_row = ds_3.rowcount()
for ll_cnt = 1 to ll_row
	 ls_menuitem1 = trim(ds_3.getitemstring(ll_cnt,"menu1"))
	 ls_menuitem2 = trim(ds_3.getitemstring(ll_cnt,"menu2"))
    ls_menuitem3 = trim(ds_3.getitemstring(ll_cnt,"use_type"))
	 wf_menucase2(ls_menuitem1,ls_menuitem2,ls_menuitem3)
next

ll_row = ds_4.rowcount()
for ll_cnt = 1 to ll_row
	 ls_menuitem1 = trim(ds_4.getitemstring(ll_cnt,"menu1"))
	 ls_menuitem2 = trim(ds_4.getitemstring(ll_cnt,"menu2"))
	 ls_menuitem3 = trim(ds_4.getitemstring(ll_cnt,"menu3"))
    ls_menuitem4 = trim(ds_4.getitemstring(ll_cnt,"use_type"))
	 wf_menucase3(ls_menuitem1,ls_menuitem2,ls_menuitem3,ls_menuitem4)
next
end subroutine

public subroutine wf_menucase1 (string arg_str1, string arg_str2);
end subroutine

public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3);
end subroutine

public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4);
end subroutine

on w_o_main.create
if this.MenuName = "m_o_main" then this.MenuID = create m_o_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_o_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

event open;string ls_name
date   ld_date
datetime ldt_date

/////////////////////////////////////////////////////////////////////////////////
SELECT REPLACE(area_name,'사업장','') INTO :ls_name FROM area WHERE area_no = :gs_area;

THIS.Title = '[' + ls_name + ':판매]' + GS_USERNAME + ' [' + Sqlca.ServerName + '][' + SQLCA.DataBase + '][' + gs_ver + "][" + gs_level + "]"

if GF_PERMISSION("판매관리_입력", gs_userid) = "Y" or GF_PERMISSION("판매관리_입력(부분)", gs_userid) = "Y" then
	if upper(gs_userid) = "TOP" then
		m_o_main.m_manage.enabled   = true			// 판매관리/관리
			m_o_main.m_manage.m_estimate.visible   = false	// 판매관리/관리/견적관리
			m_o_main.m_manage.m_sale.visible   		= false	// 판매관리/관리/수주관리
			m_o_main.m_manage.m_-44.visible   	   = false		
			
			m_o_main.m_manage.m_issue.visible   	= false	// 판매관리/관리/출고관리(명세서)
			m_o_main.m_manage.m_retm.visible   		= false	// 판매관리/관리/요청관리			
			m_o_main.m_manage.m_ret.enabled   		= true	// 판매관리/관리/반품관리(할인)
				m_o_main.m_manage.m_ret.m_saleret.visible   	= false
				m_o_main.m_manage.m_ret.m_retacc.visible   	= false
				m_o_main.m_manage.m_ret.m_-28.visible   		= false
				m_o_main.m_manage.m_ret.m_retcon.visible   	= false
				m_o_main.m_manage.m_ret.m_issueret.visible   = false
				m_o_main.m_manage.m_ret.m_-25.visible   		= false
				m_o_main.m_manage.m_ret.m_oidc.visible   		= false
				m_o_main.m_manage.m_ret.m_oidcdet.visible   	= true
				m_o_main.m_manage.m_ret.m_-50.visible   		= false
				m_o_main.m_manage.m_ret.m_제품폐기.visible   = false
				m_o_main.m_manage.m_ret.m_제품폐기결재.visible = false
			m_o_main.m_manage.m_-45.visible   	= false
			
			m_o_main.m_manage.m_sales.visible   	= false	// 판매관리/관리/매출관리(계산서)
			m_o_main.m_manage.m_14.visible   		= false	// 판매관리/관리/수금관리(현금,어음)
			m_o_main.m_manage.m_shipamt.visible   	= false	// 판매관리/관리/운반비관리
			m_o_main.m_manage.m_-24.visible   	   = false
			
			m_o_main.m_manage.m_itemstock.visible  = false	// 판매관리/관리/장기재고관리
			m_o_main.m_manage.m_-3.visible   	   = false
			
			m_o_main.m_manage.m_diary.visible   	= false	// 판매관리/관리/고객방문일지
			m_o_main.m_manage.m_custper.visible   	= false	// 판매관리/관리/고객정보관리
			m_o_main.m_manage.m_-6.visible   	   = false
			
			m_o_main.m_manage.m_exit.visible   		= true	// 판매관리/관리/판매관리종료
			m_o_main.m_manage.m_exit1.visible   	= true	// 판매관리/관리/종료(Exit)
			
		m_o_main.m_retrieve.visible = true			// 판매관리/조회
		m_o_main.m_code.visible     = false			// 판매관리/기준조회		
		m_o_main.m_utility.visible  = false			// 	
		m_o_main.sasas.visible      = false			// 
	end if
else
	if GF_PERMISSION("판매관리_조회", gs_userid) = "Y" then
		m_o_main.m_manage.enabled   = true			// 판매관리/관리
			m_o_main.m_manage.m_estimate.enabled   = false	// 판매관리/관리/견적관리
			m_o_main.m_manage.m_sale.enabled   		= false	// 판매관리/관리/수주관리
			m_o_main.m_manage.m_issue.enabled   	= false	// 판매관리/관리/출고관리(명세서)
			m_o_main.m_manage.m_retm.enabled   		= false	// 판매관리/관리/요청관리
			m_o_main.m_manage.m_ret.enabled   		= false	// 판매관리/관리/반품관리
			m_o_main.m_manage.m_sales.enabled   	= false	// 판매관리/관리/매출관리(계산서)
			m_o_main.m_manage.m_14.enabled   		= false	// 판매관리/관리/수금관리(현금,어음)
			m_o_main.m_manage.m_shipamt.enabled   	= false	// 판매관리/관리/운반비관리
			m_o_main.m_manage.m_itemstock.enabled  = false	// 판매관리/관리/장기재고관리
			m_o_main.m_manage.m_diary.enabled   	= true	// 판매관리/관리/고객방문일지
			m_o_main.m_manage.m_custper.enabled   	= true	// 판매관리/관리/고객정보관리
			m_o_main.m_manage.m_exit.enabled   		= true	// 판매관리/관리/판매관리종료
			m_o_main.m_manage.m_exit1.enabled   	= true	// 판매관리/관리/종료(Exit)
		m_o_main.m_retrieve.enabled = true			// 판매관리/조회
		m_o_main.m_code.enabled     = false			// 판매관리/기준조회
	else
		m_o_main.m_manage.enabled   = true			// 판매관리/관리
			m_o_main.m_manage.m_estimate.enabled   = false	// 판매관리/관리/견적관리
			m_o_main.m_manage.m_sale.enabled   		= false	// 판매관리/관리/수주관리
			m_o_main.m_manage.m_issue.enabled   	= false	// 판매관리/관리/출고관리(명세서)
			m_o_main.m_manage.m_retm.enabled   		= false	// 판매관리/관리/요청관리
			m_o_main.m_manage.m_ret.enabled   		= false	// 판매관리/관리/반품관리
			m_o_main.m_manage.m_sales.enabled   	= false	// 판매관리/관리/매출관리(계산서)
			m_o_main.m_manage.m_14.enabled   		= false	// 판매관리/관리/수금관리(현금,어음)
			m_o_main.m_manage.m_shipamt.enabled   	= false	// 판매관리/관리/운반비관리
			m_o_main.m_manage.m_itemstock.enabled  = false	// 판매관리/관리/장기재고관리
			m_o_main.m_manage.m_diary.enabled   	= true	// 판매관리/관리/고객방문일지
			m_o_main.m_manage.m_custper.enabled   	= true	// 판매관리/관리/고객정보관리
			m_o_main.m_manage.m_exit.enabled   		= true	// 판매관리/관리/판매관리종료
			m_o_main.m_manage.m_exit1.enabled   	= true	// 판매관리/관리/종료(Exit)
		m_o_main.m_retrieve.enabled = false			// 판매관리/조회
		m_o_main.m_code.enabled     = false			// 판매관리/기준조회
	end if
end if

//wf_menu()

// 관리자만 보이는 메뉴들
if gs_userid = '1999010s' then
	Timer(180)
	//PostEvent('ue_1')
else
//	m_o_main.m_manage.m_sales.m_sell_input2.visible = false //현장별 세금계산서 발행
	m_o_main.m_retrieve.m_saleq4.m_13.enabled = false	// 거래처별 판매원장
	m_o_main.m_code.m_country.visible 	= false
	m_o_main.m_code.m_rate.visible    	= false

	Timer(180)
	//PostEvent('ue_1')
end if

if upper(gs_userid) = 'TOP' then
	OpenSheet( w_oidccon_m, this, 5, original! )
end if


end event

event timer;int    li_cnt
long   ll_pos
string ls_message, ls_version, ls_major, ls_minor, ls_major1, ls_minor1
gs_custper_str lstr_where

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
			RUN (".\ycerp_verup.exe YCGW") 
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
						RUN (".\ycerp_verup.exe YCGW") 
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

//// 100분 후 메시지 알림
//if ii_run  > 50 then ii_run = 0
///////////////////////////////////////////////////

///////////////////////////////////////////////////
// 고객센터
///////////////////////////////////////////////////
if GF_PERMISSION("고객센터_메신저_미사용", gs_userid) = "Y" then
else
	SELECT count(*) INTO :li_cnt FROM projectmsgdet 
	 WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND msg IS NULL AND del = 'N';
	if li_cnt > 0 then
		lstr_where.str_ok = true
		OpenWithParm( w_projectmsg, lstr_where )
	end if
end if

///////////////////////////////////////////////////
// 사내 메신저
///////////////////////////////////////////////////
if GF_PERMISSION("사내메신저_사용", gs_userid) = "Y" then
else
	setnull(li_cnt)
	// 사내 메신저
	SELECT count(*) INTO :li_cnt FROM sysmsg 
	 WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND del = "N";
	if li_cnt > 0 then
		lstr_where.str_ok = true
		OpenWithParm( w_sysmsg_m, lstr_where )
	end if	
end if

///////////////////////////////////////////////////
// 매출할인 결재
///////////////////////////////////////////////////
if GF_PERMISSION("매출할인결재_알림이", gs_userid) = "Y" then
	setnull(li_cnt)
   SELECT count(*) INTO :li_cnt 
     FROM dc_group  a
    WHERE ( convert(char(10),a.dc_date,111) BETWEEN DATEADD(day, -30, getdate()) AND getdate() )
      AND ( a.totprice  > 50000 and a.dc_appdt3 is null )
      AND ( a.dc_appdt5   is null    )
      AND ( a.dc_app3   = :gs_userid );
	if li_cnt > 0 then
		if IsValid(w_o_main) then 
			OpenSheet( w_oidcgroupcon_m,  w_o_main, 5, original! )
		elseif IsValid(w_all_main) then 
			OpenSheet( w_oidcgroupcon_m,  w_all_main, 5, original! )
		end if
	end if
end if

///////////////////////////////////////////////////
// 매출이관이월 결재
///////////////////////////////////////////////////
if GF_PERMISSION("매출이관이월결재_알림중지", gs_userid) = "Y" then
else
	SELECT count(*) INTO :li_cnt
	  FROM (
			 SELECT a.fcust_no, a.fcust_nm    
					, a.tcust_no, a.trans_no    
					, a.trans_amt   
					, a.apply_end   
					, a.tr_app1, a.tr_appdt1
					, a.tr_app2, a.tr_appdt2
					, a.tr_app3, a.tr_appdt3
					, a.tr_app4, a.tr_appdt4
					, a.tr_app5, a.tr_appdt5
					, a.tr_apph, a.tr_appdth	
				FROM (
					  SELECT fcust_no    = a.fcust_no
							 , fcust_nm    = c.cust_name
							 , tcust_no    = a.tcust_no
							 , trans_no    = a.trans_no
							 , trans_amt   = dbo.UF_FORMAT(a.tr_transamt,'##,###,###,##0')
							 , apply_end   = isnull(a.apply_end,'N')
							 , a.tr_app1, a.tr_appdt1
							 , a.tr_app2, a.tr_appdt2
							 , a.tr_app3, a.tr_appdt3
							 , a.tr_app4, a.tr_appdt4
							 , a.tr_app5, a.tr_appdt5
							 , a.tr_apph, a.tr_appdth
						FROM dotrans  A with (nolock)
							  LEFT OUTER JOIN customer C on a.fcust_no = c.cust_no
					  WHERE ( a.tr_date  BETWEEN DATEADD(day, -30, getdate()) AND getdate() )
						 AND ( a.apply_end  IS NULL )
						 AND ( a.tr_app1 = :gs_userid or a.tr_app2 = :gs_userid or
								 a.tr_app3 = :gs_userid or a.tr_app4 = :gs_userid or
								 a.tr_app5 = :gs_userid or a.tr_apph = :gs_userid
							  )
					  ) A
				WHERE ( a.tr_app1 = :gs_userid AND a.tr_appdt1 IS NULL ) 
					OR ( a.tr_app2 = :gs_userid AND a.tr_appdt2 IS NULL ) 
					OR ( a.tr_app3 = :gs_userid AND a.tr_appdt3 IS NULL ) 
					OR ( a.tr_app4 = :gs_userid AND a.tr_appdt4 IS NULL ) 
					OR ( a.tr_apph = :gs_userid AND a.tr_appdth IS NULL ) 
			 ) A
		WHERE ( a.tr_app2 = :gs_userid AND a.tr_appdt1 IS NOT NULL ) 
			OR ( a.tr_app3 = :gs_userid AND a.tr_appdt2 IS NOT NULL ) 
			OR ( a.tr_app4 = :gs_userid AND a.tr_appdt3 IS NOT NULL ) 
			OR ( a.tr_app5 = :gs_userid AND a.tr_appdt4 IS NOT NULL ) 
			OR ( a.tr_apph = :gs_userid AND a.tr_appdt5 IS NOT NULL );
	if li_cnt > 0 then
		if MessageBox("확인",ls_message + "~n~n" + &
						  "거래명세서 이관/이월 프로그램을 실행 하시겠습니까?", Exclamation!, YesNo!, 1) = 1 then
			is_msgchk = "N"

			if IsValid(w_o_main) then 
				OpenSheet( w_oidotrans_m,  w_o_main, 5, original! )
			elseif IsValid(w_all_main) then 
				OpenSheet( w_oidotrans_m,  w_all_main, 5, original! )
			end if
		else
			MessageBox("확인","'매출이관이월결재_알림이'는 3분 후 재 실행됩니다.")
			is_msgchk = "Y"
		end if
	end if
end if


//////////////////////////////////////////////////////////////////////////////////////////////
//// '컴퓨터분석(WinAuditU)'
////------------------------------------------------------------------------------------------
//// CODEMST Table '컴퓨터분석(WinAuditU)' 레코드 설명
//// ITEM_NM : 검사시작일, ITEM_CD : 검사옵션, USE_YN : 실행여부 체크, WinAudit : 재 실행방지
//////////////////////////////////////////////////////////////////////////////////////////////
//string ls_cmdline, ls_useyn, ls_audit, ls_auditucmd, ls_db, ls_server, ls_auditchk, ls_auditymd
//
//SELECT LTRIM(ITEM_NM), LTRIM(ITEM_CD), USE_YN  
//  INTO :ls_audit, :ls_cmdline, :ls_useyn
//  FROM CODEMST 
// WHERE TYPE  = '컴퓨터분석(WinAuditU)' AND USE_YN = 'Y';
//
//if isnull(ls_audit) or ls_audit = "" then
//else
//	ls_auditymd     = ProfileString("YCERP.INI", "Database", "WinAuditYMD", " ")	// 검사시작일
//	if ls_auditymd  > ls_audit then	// PC 실행일자가 검사시작일 보다 크면 SKIP
//	elseif ls_auditymd  < ls_audit then	// PC 실행일자가 검사시작일 이전이면
//			SetProfileString("YCERP.INI", "DATABASE", "WinAudit", " ")
//			SetProfileString("YCERP.INI", "DATABASE", "WinAuditYMD", ls_audit)
//	else	
//		ls_auditchk     = ProfileString("YCERP.INI", "Database", "WinAudit", " ")		// 실행유무
//		if ls_auditchk  = "Y" then		// 한번 실행한 경우
//		else
//			ls_server = ProfileString("YCERP.INI", "Database", "ServerName", " ")			
//			ls_db     = ProfileString("YCERP.INI", "Database", "DataBase", " ")
//			//MessageBox("안내(WinAudit Freeware)", '컴퓨터분석 프로그램을 자동실행 하도록 하겠습니다.~n~n' + &
//			//			  '이 분석작업은 한번 실행하면 재 실행되지 않으며, 다음의 작업종료 메시지에서~n' + &
//			//			  '(개별적 데이터베이스 삽입에 관한 추가 오류 메시지는 금지됩니다.)~n~n' + &
//			//			  '"확인" 버튼만 클릭 하시면 됩니다.~n~n~n' + &
//			//			  '유창ERP 프로그램 작업과는 아무런 상관이 없습니다.  --전산팀--')
//			
//			ls_auditucmd = "WinAuditU.exe /r=" + ls_cmdline + " /o=ODBC /f=DRIVER=SQL Server;SERVER=" + ls_server + ";UID=db_user;PWD=;DATABASE=" + ls_db + &
//								"; /L=ko /m=[유창]컴퓨터분석 작업이 정상 종료될때까지, 이 프로그램을 강제종료(닫기) 하지 마시기 바랍니다."
//			RUN (ls_auditucmd, Minimized!) 		
//			
//			// 정상실행 표시
//			SetProfileString("YCERP.INI", "DATABASE", "WinAudit", "Y")
//			SetProfileString("YCERP.INI", "DATABASE", "WinAuditYMD", ls_audit)
//			
//			if IsValid(w_all_main) = true then
//				w_all_main.Show()  // 통합 MAINMENU
//			else
//				w_o_main.Show() // 유창게시판
//			end if
//		end if
//	end if
//end if
//////////////////////////////////////////////////////////////////////////////////


end event

type mdi_1 from mdiclient within w_o_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_o_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_o_main
int X=0
int Y=0
int Width=0
int Height=596
end type

