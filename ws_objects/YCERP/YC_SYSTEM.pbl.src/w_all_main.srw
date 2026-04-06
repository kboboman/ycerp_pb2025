$PBExportHeader$w_all_main.srw
$PBExportComments$통합메뉴
forward
global type w_all_main from window
end type
type mdi_1 from mdiclient within w_all_main
end type
type mditbb_1 from tabbedbar within w_all_main
end type
type mdirbb_1 from ribbonbar within w_all_main
end type
end forward

global type w_all_main from window
string tag = "m_frame"
integer x = 5
integer y = 4
integer width = 5083
integer height = 4784
boolean titlebar = true
string title = "MAINMENU"
string menuname = "m_all_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "D:\WORK\YooChang.ico"
event ue_menu_call ( string as_text )
event ue_1 pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
end type
global w_all_main w_all_main

type prototypes
//
SubRoutine LHT_SetBmp( long mdiclient, ref string abmp, boolean originalsize) library 'mdibmp.dll' alias for "LHT_SetBmp;Ansi"
SubRoutine LHT_DelBmp( long mdiclient ) library 'mdibmp.dll'

end prototypes

type variables
int     ii_run = 0, il_sw, ii_sel = 1
long    il_first_rid = 2147483647, il_last_rid = 0 , il_curr_page = 0, il_totcnt
string  is_first_level = ' ', is_last_level = FillA('Z', 255),  is_title = '%', is_user = '%'
string  is_uptmsg = "N", is_msgchk = "N"

boolean ib_ref = false
statictext ist_st[10]


// WinSock
ULong  iul_listen
ULong  iul_receive
datawindow dw_test


end variables

forward prototypes
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
public function boolean wf_menu_const ()
public subroutine wf_menu_create ()
public function menu wf_menu_set (string as_menu_cd, string as_menu_nm, menu am_main_menu, menu am_add_menu)
end prototypes

event ue_menu_call(string as_text);//
MessageBox('확인', 'w_all_main.ue_menu_call 메뉴정보^^~r~n' + as_text)
end event

event ue_1;//int    li_cnt
//string ls_msgchk
//gs_custper_str lstr_where
//
//ls_msgchk = ProfileString("YCERP.INI", "MessageBox", "Check", " ")
//if ls_msgchk = "N" or IsNull(ls_msgchk) then return
//
//SELECT count(*) INTO :li_cnt FROM sysmsg 
// WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND del = "N";
//if li_cnt > 0 then
//	if MessageBox("메시지","확인 되지 않은 메시지가 " + string(li_cnt) + " 개 있습니다 ~r~n" + &
//					  "메지시를 확인하시겠읍니까", Exclamation!, OKCancel!, 2) = 1 then
//		lstr_where.str_ok = true
//		OpenWithParm(w_sysmsg_m, lstr_where)
//		w_sysmsg_m.WindowState = Normal!
//	end if
//end if
//
end event

public subroutine wf_menucase1 (string arg_str1, string arg_str2);
end subroutine

public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3);
end subroutine

public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4);
end subroutine

public function boolean wf_menu_const ();m_all_main.mo.mo01.enabled = false	// 영업관리.견적관리
m_all_main.mo.mo02.enabled = true	// 영업관리.수주관리
	m_all_main.mo.mo02.mo02_01.enabled = false	// 영업관리.수주관리.수주접수확인(eSale)
	m_all_main.mo.mo02.mo02_02.enabled = true	   // 영업관리.수주관리.판매수주관리
	m_all_main.mo.mo02.mo02_03.enabled = false	// 영업관리.수주관리.판매수주확정
	m_all_main.mo.mo02.mo02_04.enabled = false	// 영업관리.수주관리.샘플관리
	//m_all_main.mo.mo02.mo02_05.enabled = false	// 영업관리.수주관리.판매수주마감
	m_all_main.mo.mo02.mo02_07.enabled = false	// 영업관리.수주관리.수주조회
	m_all_main.mo.mo02.mo02_08.enabled = false	// 영업관리.수주관리.수주조회(YSP)

m_all_main.mo.mo03.enabled = true	// 영업관리.출고관리
	m_all_main.mo.mo03.mo03_01.enabled = true	   // 영업관리.출고관리.출고의뢰서 작성
	m_all_main.mo.mo03.mo03_02.enabled = false	// 영업관리.출고관리.거래명세서 작성
	m_all_main.mo.mo03.mo03_03.enabled = false	// 영업관리.출고관리.거래명세서 수정 및 삭제
	m_all_main.mo.mo03.mo03_04.enabled = false	// 영업관리.출고관리.자동 수주계산
	m_all_main.mo.mo03.mo03_05.enabled = false	// 영업관리.출고관리.수주 예약관리
	m_all_main.mo.mo03.mo03_06.enabled = true	   // 영업관리.출고관리.출고조회
		m_all_main.mo.mo03.mo03_06.mo03_0601.enabled = true	   // 영업관리.출고관리.출고조회.출고의뢰서 조회
		m_all_main.mo.mo03.mo03_06.mo03_0602.enabled = false	   // 영업관리.출고관리.출고조회.거래명세서 조회/출력
		m_all_main.mo.mo03.mo03_06.mo03_0603.enabled = false	   // 영업관리.출고관리.출고조회.일자별 물품출고 조회
		m_all_main.mo.mo03.mo03_06.mo03_0604.enabled = false	   // 영업관리.출고관리.출고조회.거래처별 출고(E급) 현황
		m_all_main.mo.mo03.mo03_06.mo03_0605.enabled = false	   // 영업관리.출고관리.출고조회.물품별 출고현황(단가=0)
		m_all_main.mo.mo03.mo03_06.mo03_0606.enabled = false	   // 영업관리.출고관리.출고조회.물품별 출고현황
		m_all_main.mo.mo03.mo03_06.mo03_0607.enabled = false	   // 영업관리.출고관리.출고조회.물품별 출고, 미출고 현황
		m_all_main.mo.mo03.mo03_06.mo03_0608.enabled = false	   // 영업관리.출고관리.출고조회.물품별 출고현황(집계)
		m_all_main.mo.mo03.mo03_06.mo03_0609.enabled = false	   // 영업관리.출고관리.출고조회.물품별 출고현황(손익)
		m_all_main.mo.mo03.mo03_06.mo03_0610.enabled = false	   // 영업관리.출고관리.출고조회.물품그룹별 출고내역
		m_all_main.mo.mo03.mo03_06.mo03_0611.enabled = false	   // 영업관리.출고관리.출고조회.거래처별 물품 출고현황
		m_all_main.mo.mo03.mo03_06.mo03_0612.enabled = false	   // 영업관리.출고관리.출고조회.거래처별 출고, 미출고 현황
		m_all_main.mo.mo03.mo03_06.mo03_0613.enabled = false	   // 영업관리.출고관리.출고조회.거래처별 운송비 현황
		m_all_main.mo.mo03.mo03_06.mo03_0614.enabled = false	   // 영업관리.출고관리.출고조회.거래처별 출고물품 집계현황
		m_all_main.mo.mo03.mo03_06.mo03_0615.enabled = true	   // 영업관리.출고관리.출고조회.현장별 자재투입현황
		m_all_main.mo.mo03.mo03_06.mo03_0617.enabled = false	   // 영업관리.출고관리.출고조회.현장별 출고 및 미출고 현황
		m_all_main.mo.mo03.mo03_06.mo03_0618.enabled = false	   // 영업관리.출고관리.출고조회.영업사원별 출고현황
		m_all_main.mo.mo03.mo03_06.mo03_0619.enabled = false	   // 영업관리.출고관리.출고조회.영업사원별 출고현황(출고번호)
		m_all_main.mo.mo03.mo03_06.mo03_0620.enabled = false	   // 영업관리.출고관리.출고조회.영업사원별 출고, 미출고 현황
		m_all_main.mo.mo03.mo03_06.mo03_0621.enabled = false	   // 영업관리.출고관리.출고조회.출고변경현황

	m_all_main.mo.mo03.mo03_07.enabled = false	// 영업관리.출고관리.출고조회(YSP)

m_all_main.mo.mo04.enabled = false	// 영업관리.요청관리
m_all_main.mo.mo05.enabled = false	// 영업관리.반품관리
m_all_main.mo.mo06.enabled = false	// 영업관리.매출관리
m_all_main.mo.mo07.enabled = false	// 영업관리.수금관리
m_all_main.mo.mo08.enabled = false	// 영업관리.운반비관리
m_all_main.mo.mo09.enabled = false	// 영업관리.장기재고관리
//m_all_main.mo.mo10.enabled = false	// 영업관리.고객방문일지
//m_all_main.mo.mo11.enabled = false	// 영업관리.고객정보관리
m_all_main.mo.mo12.enabled = false	// 영업관리.조회작업
m_all_main.mo.mo13.enabled = false	// 영업관리.기준정보
m_all_main.mo.mo14.enabled = true	// 영업관리.현설조회

m_all_main.mi.enabled = false	// 구매관리
m_all_main.mm.enabled = false	// 생산관리

return true

end function

public subroutine wf_menu_create ();String ls_menu_cd, ls_menu_nm, ls_menu_level
Long   i
Menu lml_menu, lmm_menu

// Loop 또는 DB 연동시 Cursor 를 돌리셔도 될 듯..
For i = 1 To 6	
	If i = 1 Then
		ls_menu_level = 'L'
		ls_menu_cd    = '001-0'
		ls_menu_nm    = '대분류1'
	End If
	
	If i = 2 Then
		ls_menu_level = 'M'
		ls_menu_cd    = '001-1'
		ls_menu_nm    = '중분류1'
	End If
	
	If i = 3 Then
		ls_menu_level = 'M'
		ls_menu_cd    = '001-2'
		ls_menu_nm    = '중분류2'
	End If

	If i = 4 Then
		ls_menu_level = 'L'
		ls_menu_cd    = '002-0'
		ls_menu_nm    = '대분류2'
	End If
	
	If i = 5 Then
		ls_menu_level = 'M'
		ls_menu_cd    = '002-1'
		ls_menu_nm    = '중분류2_1'
	End If
	
	If i = 6 Then
		ls_menu_level = 'M'
		ls_menu_cd    = '002-2'
		ls_menu_nm    = '중분류2_2'
	End If
	
	If ls_menu_level = 'L' Then // 대분류메뉴
//	   lml_menu = wf_menu_set(ls_menu_cd, ls_menu_nm, m_frame, m_frame)
	   lml_menu = wf_menu_set(ls_menu_cd, ls_menu_nm, m_all_main, m_all_main)
	ElseIf ls_menu_level = 'M' Then // 중분류메뉴
//		lmm_menu = wf_menu_set(ls_menu_cd, ls_menu_nm, m_frame, lml_menu)
		lmm_menu = wf_menu_set(ls_menu_cd, ls_menu_nm, m_all_main, lml_menu)
	End If
Next

end subroutine

public function menu wf_menu_set (string as_menu_cd, string as_menu_nm, menu am_main_menu, menu am_add_menu);// Return Type menu  wf_menu_set
// string as_menu_cd
// string as_menu_nm
// menu   am_main_menu
// menu   am_add_menu


m_dynamic_all lm_dynamic

lm_dynamic = Create m_dynamic_all

lm_dynamic.mf_setid  (as_menu_cd)
lm_dynamic.mf_settext(as_menu_nm)
lm_dynamic.mf_setobj (This      )

am_add_menu.Item[UpperBound(am_add_menu.item[]) + 1]     = lm_dynamic
am_add_menu.Item[UpperBound(am_add_menu.item[])].Visible = True

am_main_menu.item[1].Hide()
am_main_menu.item[1].Show()

//am_main_menu.item[1].Visible = False

Return lm_dynamic
end function

on w_all_main.create
if this.MenuName = "m_all_main" then this.MenuID = create m_all_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_all_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

event open;datetime ldt_date
date     ld_date
string   ls_itemcd, ls_name, ls_teamnm
long     ll_cnt, ll_dsstate
integer  li_cnt

SELECT REPLACE(area_name,'사업장','') INTO :ls_name  FROM area WHERE area_no = :gs_area;
SELECT rtrim(team_name) INTO :ls_teamnm FROM team WHERE team_code = :gs_team;

ls_name = '[유창물류] ' + '[' + gs_MenuType + '/' + ls_name + "|" + GS_USERNAME + '] [' + gs_ver + "|" + gs_level + ']'
if GB_WOW64 = true then
	THIS.Title = ls_name + ' [' + Sqlca.ServerName + " / " + gs_ipaddress + "] [" + gs_db_gb + "] 64Bit"
else
	THIS.Title = ls_name + ' [' + Sqlca.ServerName + " / " + gs_ipaddress + "] [" + gs_db_gb + "] 32Bit"
end if

IF IsValid(w_login) = true THEN close(w_login)

// 해상도
This.width  = PixelsToUnits(ge_Environment.screenwidth,  xpixelstounits!)
This.height = PixelsToUnits(ge_Environment.screenheight, ypixelstounits!)
This.Show()

ld_date = date(ldt_date)
ld_date = RelativeDate(ld_date, -30)
DELETE FROM loginhis WHERE in_date < :ld_date;
COMMIT;

ld_date = RelativeDate(ld_date, -5)
DELETE FROM sysmsg WHERE msgdate < :ld_date;
COMMIT;

Open(w_load)

choose case gs_MenuType
	case 'ALL'	//기본 메뉴 구성
		if GF_Permission("생산라인_조회", gs_userid) = "Y" then
			this.ChangeMenu( m_all_line )
		else	
			// 관리자만 보이는 메뉴들
			if gs_userid = "1999010s" then
			else
				m_all_main.ma.visible = false	// 시스템 관리
			end if 
			
			///////////////////////////////////////////////////////////////
			// 메뉴권한 체크 2019.04.29 jowonsuk 추가
			///////////////////////////////////////////////////////////////
			SELECT count(item_cd) INTO :ll_cnt
			FROM codemst
			WHERE type   IN ('출고품라벨출력관리')
			AND use_yn  = 'Y'  
			AND item_cd = :gs_userid;
				
			if ll_cnt > 0 then
				m_all_main.mo.mo03.mo_013.enabled   = true
				m_all_main.mm.mm05.mm05_060.enabled = true	   // 기타 관리/SHEET 재고 관리
			end if
			
			///////////////////////////////////////////////////////////////
			// 메뉴권한 체크
			///////////////////////////////////////////////////////////////
			SELECT count(item_cd) INTO :ll_cnt
			FROM codemst
			WHERE type   IN ('판매관리_입력','판매관리_조회', '판매관리_입력(영업담당)')
			AND use_yn  = 'Y'  
			AND item_cd = :gs_userid;
				
			if ll_cnt > 0 then
				m_all_main.mo.enabled = true	// 판매관리
			end if	
		
			SELECT count(item_cd) INTO :ll_cnt 
			FROM codemst
			WHERE type   IN ('구매관리_입력','구매관리_조회','구매관리_창고')
			AND use_yn  = 'Y'
			AND item_cd = :gs_userid; 
			
			if ll_cnt > 0 then 
				m_all_main.mi.enabled = true	// 구매관리
			end if
			
			SELECT count(item_cd) INTO :ll_cnt 
			FROM codemst
			WHERE type   IN ('생산관리_입력','생산관리_조회')
			AND use_yn  = 'Y'  
			AND item_cd = :gs_userid; 
			
			if ll_cnt > 0 then 
				m_all_main.mm.enabled = true	// 생산관리
			end if
			
			if GF_Permission("공무관리담당자", gs_userid) = "Y" then	
				if GF_Permission("판매관리_입력", gs_userid) = "Y" OR GF_Permission("판매관리_조회", gs_userid) = "Y" then
				ELSE
					wf_menu_const()
				end if
			end if
			
			if GF_Permission("판매관리_입력", gs_userid) = "Y" then
			elseif GF_Permission("판매관리_입력(부분)", gs_userid) = "Y" then		// 2021.10.27 jowonsuk 한미란부장 요청
				m_all_main.mo.mo13.m_거래처별외형관리.enabled = false			// 한미란, 박수진외 
				m_all_main.mo.mo13.m_cdcust_eva_m.enabled = false			// 한미란, 박수진외 
				m_all_main.mo.mo13.m_010315.enabled = false					// 한미란, 박수진외 
				m_all_main.mo.mo13.m_010316.enabled = false					// 한미란, 박수진외 
				m_all_main.mo.mo13.m_매출집계거래처순서.enabled = false		// 한미란, 박수진외 
				m_all_main.mo.mo13.m_cdopeom_org_m.enabled = false		// 한미란, 박수진외 
				m_all_main.mo.mo13.m_거래처별기념일.enabled = false			// 한미란, 박수진외 
			elseif GF_Permission("판매관리_입력(아르바이트)", gs_userid) = "Y" then		
					m_all_main.mo.enabled   = true				// 판매관리/관리
						m_all_main.mo.mo01.enabled   = false	// 판매관리/견적관리
							m_all_main.mo.mo01.mo01_01.enabled   = false	// 판매관리/견적관리/견적서관리
							//m_all_main.mo.mo01.mo01_02.enabled   = false	// 판매관리/견적관리/견적서결재관리
							m_all_main.mo.mo01.mo01_03.enabled   = false	// 판매관리/견적관리/일위대가관리
							m_all_main.mo.mo01.mo01_04.enabled   = false	// 판매관리/견적관리/견적조회			
						m_all_main.mo.mo02.enabled   = true		// 판매관리/수주관리
							m_all_main.mo.mo02.mo02_01.enabled   = false	// 판매관리/수주관리/수주접수확인(eSale)
							m_all_main.mo.mo02.mo02_02.enabled   = true		// 판매관리/수주관리/판매수주관리
							m_all_main.mo.mo02.mo02_03.enabled   = false	// 판매관리/수주관리/판매수주확정
							m_all_main.mo.mo02.mo02_04.enabled   = false	// 판매관리/수주관리/샘플관리
							m_all_main.mo.mo02.mo02_07.enabled   = false	// 판매관리/수주관리/수주조회
							m_all_main.mo.mo02.mo02_08.enabled   = false// 판매관리/수주관리/수주조회(YSP)			
							m_all_main.mo.mo02.mo02_09.enabled   = false	// 판매관리/수주관리/판매단가수정			
						m_all_main.mo.mo03.enabled   = true		// 판매관리/출고관리(명세서)
							m_all_main.mo.mo03.mo03_01.enabled   = false	// 판매관리/출고관리(명세서)/출고의뢰서 작성
							
							m_all_main.mo.mo03.mo_011.enabled   = false	//  판매관리/출고관리(명세서)/배차관리
							m_all_main.mo.mo03.mo_015.enabled   = false	//  판매관리/출고관리(명세서)/배차내역리스트															
							m_all_main.mo.mo03.mo_014.enabled   = false	//  판매관리/출고관리(명세서)/부속품라벨출력	
							
							m_all_main.mo.mo03.mo03_02.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 작성
							m_all_main.mo.mo03.m_oido_new_m.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 작성
							m_all_main.mo.mo03.mo03_08.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 이관/이월/변경
							m_all_main.mo.mo03.mo03_03.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 수정 및 삭제
							m_all_main.mo.mo03.m_oidoupdate2.enabled = false	// 판매관리/출고관리(명세서)/거래명세서 수정(주요업무)
							m_all_main.mo.mo03.mo03_04.enabled   = false	// 판매관리/출고관리(명세서)/자동 수주계산
							m_all_main.mo.mo03.mo03_05.enabled   = false	// 판매관리/출고관리(명세서)/수주 예약관리
							m_all_main.mo.mo03.mo03_06.enabled   = true		// 판매관리/출고관리(명세서)/출고조회										
								m_all_main.mo.mo03.mo03_06.mo03_0601.enabled = false			// 판매관리/출고관리(명세서)/출고조회/출고의뢰서 조회
								m_all_main.mo.mo03.mo03_06.mo03_06011.enabled = false		// 판매관리/출고관리(명세서)/출고조회/출고의뢰서(영업담당)
								m_all_main.mo.mo03.mo03_06.mo03_0602.enabled = false 			// 판매관리/출고관리(명세서)/출고조회/	거래명세서 조회/출력				
								m_all_main.mo.mo03.mo03_06.mo03_0622.enabled = false 			// 판매관리/출고관리(명세서)/출고조회/거래명세서 이월내역
								m_all_main.mo.mo03.mo03_06.mo03_06023.enabled = false		 // 판매관리/출고관리(명세서)/출고조회/거래명세서 출고시간
								m_all_main.mo.mo03.mo03_06.mo03_06024.enabled = false		 // 판매관리/출고관리(명세서)/출고조회/거래명세서_리스트(KCC전용)
								m_all_main.mo.mo03.mo03_06.m_oidopricechk.enabled = false	// 판매관리/출고관리(명세서)/출고조회/[거래처별 단가체크]
								m_all_main.mo.mo03.mo03_06.m_oiissuereqchk.enabled = false	 // 판매관리/출고관리(명세서)/출고조회/출고의뢰서 송장체크
								m_all_main.mo.mo03.mo03_06.mo03_0603.enabled = false 			// 판매관리/출고관리(명세서)/출고조회/출고일보(기간별)
								m_all_main.mo.mo03.mo03_06.mo03_06031.enabled = false 		// 판매관리/출고관리(명세서)/출고조회/출고일보(용도별)
							
								m_all_main.mo.mo03.mo03_06.mo03_0605.enabled = false			// 판매관리/출고관리(명세서)/출고조회/
								m_all_main.mo.mo03.mo03_06.mo03_0606.enabled = true
								m_all_main.mo.mo03.mo03_06.mo03_0608.enabled = false
								m_all_main.mo.mo03.mo03_06.mo03_0607.enabled =  false
								m_all_main.mo.mo03.mo03_06.m_oicustscenetot_r.enabled = false 
								m_all_main.mo.mo03.mo03_06.m_oicustsaledo_r.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0611.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0612.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0613.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0614.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_06145.enabled = false 
								
								m_all_main.mo.mo03.mo03_06.mo03_0615.enabled = true 
								m_all_main.mo.mo03.mo03_06.mo03_0617.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0618.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_06181.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0620.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0619.enabled = false 
								m_all_main.mo.mo03.mo03_06.m_mpsfcdo.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0621.enabled = false 
								m_all_main.mo.mo03.mo03_06.mo03_0623.enabled = false 					
		
							m_all_main.mo.mo03.mo03_07.enabled   = false	// 판매관리/출고관리(명세서)/출고조회(YSP)			
							
						m_all_main.mo.mo04.enabled   = false	// 판매관리/요청관리
							m_all_main.mo.mo04.mo04_01.enabled   = false	// 판매관리/요청관리/물품요청 관리
							m_all_main.mo.mo04.mo04_01.enabled   = false	// 판매관리/요청관리/물품요청 접수관리
							m_all_main.mo.mo04.mo04_01.enabled   = false	// 판매관리/요청관리/물품요청 접수취소관리			
						m_all_main.mo.mo05.enabled   = false		// 판매관리/반품관리
							m_all_main.mo.mo05.mo05_01.enabled   = false	// 판매관리/반품관리/반품요청 관리
							m_all_main.mo.mo05.mo05_02.enabled   = false	// 판매관리/반품관리/반품요청 결재관리
							m_all_main.mo.mo05.mo05_03.enabled   = false	// 판매관리/반품관리/반품요청 확인관리
							m_all_main.mo.mo05.mo05_04.enabled   = false	// 판매관리/반품관리/반품매출 정리
							m_all_main.mo.mo05.mo05_05.enabled   = false	// 판매관리/반품관리/제품폐기
							m_all_main.mo.mo05.mo05_06.enabled   = false	// 판매관리/반품관리/제품폐기결재
							m_all_main.mo.mo05.mo05_07.enabled   = true	// 판매관리/반품관리/반품조회
						m_all_main.mo.mo06.enabled   = false	// 판매관리/매출관리(계산서)
							m_all_main.mo.mo06.mo06_01.enabled   = false	// 판매관리/매출관리(계산서)/판매매출 관리
							m_all_main.mo.mo06.mo06_02.enabled   = false	// 판매관리/매출관리(계산서)/세금계산서(현장별)
							m_all_main.mo.mo06.mo06_03.enabled   = false	// 판매관리/매출관리(계산서)/세금계산서 수정 및 취소
							m_all_main.mo.mo06.mo06_04.enabled   = false	// 판매관리/매출관리(계산서)/전자세금계산서(전송용)
							m_all_main.mo.mo06.mo06_09.enabled   = false	// 판매관리/매출관리(계산서)/매출전표 만들기(더존용)
							m_all_main.mo.mo06.mo06_05.enabled   = false	// 판매관리/매출관리(계산서)/판매선매출 수정, 삭제
							m_all_main.mo.mo06.mo06_06.enabled   = false	// 판매관리/매출관리(계산서)/판매선매출 마감
							m_all_main.mo.mo06.mo06_07.enabled   = false	// 판매관리/매출관리(계산서)/매출 마감
							m_all_main.mo.mo06.mo06_08.enabled   = false	// 판매관리/매출관리(계산서)/매출조회			
						m_all_main.mo.mo07.enabled   = false	// 판매관리/수금관리(현금,어음)
						m_all_main.mo.mo08.enabled   = false 	// 판매관리/운반비관리
						m_all_main.mo.mo09.enabled   = false	// 판매관리/장기재고관리
						m_all_main.mo.mo12.enabled   = false		// 판매관리/조회작업
						m_all_main.mo.mo14.enabled   = false		// 판매관리/조회작업				
						m_all_main.mo.mo15.enabled   = false		// 판매관리/조회작업				
						m_all_main.mo.mo16.enabled   = false		// 판매관리/조회작업				
						m_all_main.mo.mo13.enabled   = true			// 판매관리/기준정보				
							m_all_main.mo.mo13.m_010301.enabled = false
							m_all_main.mo.mo13.m_010302.enabled = false
							m_all_main.mo.mo13.m_cditemqapattern.enabled = false
							m_all_main.mo.mo13.m_010319.enabled = false
							m_all_main.mo.mo13.m_cdissueitem.enabled = false
							m_all_main.mo.mo13.m_용도별품목관리.enabled = false
							m_all_main.mo.mo13.m_거래처별단가체크기초.enabled = false
							m_all_main.mo.mo13.m_거래처별단가관리.enabled = false
							m_all_main.mo.mo13.m_010303.enabled = false
							m_all_main.mo.mo13.m_프로젝트관리.enabled = false
							m_all_main.mo.mo13.m_010304.enabled = true
							m_all_main.mo.mo13.m_010305.enabled = false
							m_all_main.mo.mo13.m_010306.enabled = false
							m_all_main.mo.mo13.m_010307.enabled = false
							m_all_main.mo.mo13.m_010308.enabled = false
							m_all_main.mo.mo13.m_010311.enabled = false
							m_all_main.mo.mo13.m_010309.enabled = false
							m_all_main.mo.mo13.m_010310.enabled = false
							m_all_main.mo.mo13.m_010312.enabled = false
							m_all_main.mo.mo13.m_010313.enabled = false
							m_all_main.mo.mo13.m_010314.enabled = false
							m_all_main.mo.mo13.m_거래처별외형관리.enabled = false
							m_all_main.mo.mo13.m_010315.enabled = false
							m_all_main.mo.mo13.m_010316.enabled = false
							m_all_main.mo.mo13.m_매출집계거래처순서.enabled = false
							m_all_main.mo.mo13.m_cdopeom_org_m.enabled = false
							m_all_main.mo.mo13.m_거래처별기념일.enabled = false
							m_all_main.mo.mo13.m_010317.enabled = false
							m_all_main.mo.mo13.m_010210.enabled = true
									m_all_main.mo.mo13.m_010210.m_01021001.enabled = false
									m_all_main.mo.mo13.m_010210.m_01021005.enabled = false
									m_all_main.mo.mo13.m_010210.m_customer_credit.enabled = false
									m_all_main.mo.mo13.m_010210.m_01021002.enabled = true
						
			elseif GF_Permission("판매관리_입력(영업담당)", gs_userid) = "Y" then	
						m_all_main.mo.mo04.enabled   = false 		// 판매관리/요청관리
						m_all_main.mo.mo05.enabled   = true 		// 판매관리/반품/할인/폐기 관리
							m_all_main.mo.mo05.mo05_01.enabled   = false 		// 판매관리/반품/할인/폐기 관리/반품요청 관리
							m_all_main.mo.mo05.mo05_02.enabled   = false 		// 판매관리/반품/할인/폐기 관리/반품요청 결재관리
							m_all_main.mo.mo05.mo05_03.enabled   = false		// 판매관리/반품/할인/폐기 관리/반품요청 확인관리
							m_all_main.mo.mo05.mo05_04.enabled   = false		// 판매관리/반품/할인/폐기 관리/	반품매출 정리					
							m_all_main.mo.mo05.mo05_05.enabled   = false		// 판매관리/반품/할인/폐기 관리/	제품폐기 관리
							m_all_main.mo.mo05.mo05_06.enabled   = false		// 판매관리/반품/할인/폐기 관리/	제품폐기 결재관리
							
						m_all_main.mo.mo08.enabled   = true 		// 판매관리/운반비관리
						m_all_main.mo.mo09.enabled   = false		// 판매관리/장기재고관리
						m_all_main.mo.mo12.enabled   = true			// 판매관리/조회작업
						m_all_main.mo.mo14.enabled   = true			// 판매관리/조회작업				
						m_all_main.mo.mo15.enabled   = false		// 판매관리/기타관리				
						m_all_main.mo.mo16.enabled   = false		// 판매관리/실사관리		
						
						m_all_main.mo.mo13.enabled   = true			// 판매관리/기준정보				
							m_all_main.mo.mo13.m_010301.enabled = false
							m_all_main.mo.mo13.m_010302.enabled = false
							m_all_main.mo.mo13.m_cditemqapattern.enabled = false
							m_all_main.mo.mo13.m_010319.enabled = false
							m_all_main.mo.mo13.m_cdissueitem.enabled = false
							m_all_main.mo.mo13.m_용도별품목관리.enabled = false
							m_all_main.mo.mo13.m_010320.enabled = false					
							m_all_main.mo.mo13.m_거래처별단가체크기초.enabled = false
							m_all_main.mo.mo13.m_거래처별단가관리.enabled = true
							m_all_main.mo.mo13.m_010303.enabled = true
							m_all_main.mo.mo13.m_프로젝트관리.enabled = false
							m_all_main.mo.mo13.m_010304.enabled = true
							m_all_main.mo.mo13.m_010305.enabled = false
							m_all_main.mo.mo13.m_0103051.enabled = true
							m_all_main.mo.mo13.m_010306.enabled = true
							m_all_main.mo.mo13.m_010307.enabled = false
							m_all_main.mo.mo13.m_010308.enabled = true
							m_all_main.mo.mo13.m_010311.enabled = true
							m_all_main.mo.mo13.m_010309.enabled = true
							m_all_main.mo.mo13.m_010310.enabled = true
							m_all_main.mo.mo13.m_010312.enabled = true
							m_all_main.mo.mo13.m_010313.enabled = true
							m_all_main.mo.mo13.m_010314.enabled = true
							m_all_main.mo.mo13.m_거래처별외형관리.enabled = true			// 한미란, 박수진외 
							m_all_main.mo.mo13.m_cdcust_eva_m.enabled = true			// 한미란, 박수진외 
							m_all_main.mo.mo13.m_010315.enabled = false					// 한미란, 박수진외 
							m_all_main.mo.mo13.m_010316.enabled = false					// 한미란, 박수진외 
							m_all_main.mo.mo13.m_매출집계거래처순서.enabled = false		// 한미란, 박수진외 
							m_all_main.mo.mo13.m_cdopeom_org_m.enabled = false		// 한미란, 박수진외 
							m_all_main.mo.mo13.m_거래처별기념일.enabled = true				// 한미란, 박수진외 
							m_all_main.mo.mo13.m_010317.enabled = true
							m_all_main.mo.mo13.m_010210.enabled = true
			else
				if GF_Permission("판매관리_조회", gs_userid) = "Y" then
					m_all_main.mo.enabled   = true				// 판매관리/관리
						m_all_main.mo.mo01.enabled   = false	// 판매관리/견적관리
							m_all_main.mo.mo01.mo01_01.enabled   = false	// 판매관리/견적관리/견적서관리
							//m_all_main.mo.mo01.mo01_02.enabled   = false	// 판매관리/견적관리/견적서결재관리
							m_all_main.mo.mo01.mo01_03.enabled   = false	// 판매관리/견적관리/일위대가관리
							m_all_main.mo.mo01.mo01_04.enabled   = true	// 판매관리/견적관리/견적조회			
						m_all_main.mo.mo02.enabled   = true		// 판매관리/수주관리
							m_all_main.mo.mo02.mo02_01.enabled   = false	// 판매관리/수주관리/수주접수확인(eSale)
							m_all_main.mo.mo02.mo02_02.enabled   = true	// 판매관리/수주관리/판매수주관리
							m_all_main.mo.mo02.mo02_03.enabled   = false	// 판매관리/수주관리/판매수주확정
							m_all_main.mo.mo02.mo02_04.enabled   = false	// 판매관리/수주관리/샘플관리
							m_all_main.mo.mo02.mo02_07.enabled   = true	// 판매관리/수주관리/수주조회
							m_all_main.mo.mo02.mo02_08.enabled   = true	// 판매관리/수주관리/수주조회(YSP)			
							m_all_main.mo.mo02.mo02_09.enabled   = false	// 판매관리/수주관리/판매단가수정			
						m_all_main.mo.mo03.enabled   = true		// 판매관리/출고관리(명세서)
							m_all_main.mo.mo03.mo03_01.enabled   = false	// 판매관리/출고관리(명세서)/출고의뢰서 작성
							m_all_main.mo.mo03.mo03_02.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 작성
							m_all_main.mo.mo03.m_oido_new_m.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 작성					
							m_all_main.mo.mo03.mo03_08.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 이관/이월/변경
							m_all_main.mo.mo03.mo03_03.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 수정 및 삭제
							m_all_main.mo.mo03.m_oidoupdate2.enabled = false	// 판매관리/출고관리(명세서)/거래명세서 수정(주요업무)
							m_all_main.mo.mo03.mo03_04.enabled   = false	// 판매관리/출고관리(명세서)/자동 수주계산
							m_all_main.mo.mo03.mo03_05.enabled   = false	// 판매관리/출고관리(명세서)/수주 예약관리
							m_all_main.mo.mo03.mo03_06.enabled   = true	// 판매관리/출고관리(명세서)/출고조회
							m_all_main.mo.mo03.mo03_07.enabled   = true	// 판매관리/출고관리(명세서)/출고조회(YSP)			
						m_all_main.mo.mo04.enabled   = false	// 판매관리/요청관리
							m_all_main.mo.mo04.mo04_01.enabled   = false	// 판매관리/요청관리/물품요청 관리
							m_all_main.mo.mo04.mo04_01.enabled   = false	// 판매관리/요청관리/물품요청 접수관리
							m_all_main.mo.mo04.mo04_01.enabled   = false	// 판매관리/요청관리/물품요청 접수취소관리			
						m_all_main.mo.mo05.enabled   = true		// 판매관리/반품관리
							m_all_main.mo.mo05.mo05_01.enabled   = false	// 판매관리/반품관리/반품요청 관리
							m_all_main.mo.mo05.mo05_02.enabled   = false	// 판매관리/반품관리/반품요청 결재관리
							m_all_main.mo.mo05.mo05_03.enabled   = false	// 판매관리/반품관리/반품요청 확인관리
							m_all_main.mo.mo05.mo05_04.enabled   = false	// 판매관리/반품관리/반품매출 정리
							m_all_main.mo.mo05.mo05_05.enabled   = false	// 판매관리/반품관리/제품폐기
							m_all_main.mo.mo05.mo05_06.enabled   = false	// 판매관리/반품관리/제품폐기결재
							m_all_main.mo.mo05.mo05_07.enabled   = true	// 판매관리/반품관리/반품조회
						m_all_main.mo.mo06.enabled   = false	// 판매관리/매출관리(계산서)
							m_all_main.mo.mo06.mo06_01.enabled   = false	// 판매관리/매출관리(계산서)/판매매출 관리
							m_all_main.mo.mo06.mo06_02.enabled   = false	// 판매관리/매출관리(계산서)/세금계산서(현장별)
							m_all_main.mo.mo06.mo06_03.enabled   = false	// 판매관리/매출관리(계산서)/세금계산서 수정 및 취소
							m_all_main.mo.mo06.mo06_04.enabled   = false	// 판매관리/매출관리(계산서)/전자세금계산서(전송용)
							m_all_main.mo.mo06.mo06_09.enabled   = false	// 판매관리/매출관리(계산서)/매출전표 만들기(더존용)
							m_all_main.mo.mo06.mo06_05.enabled   = false	// 판매관리/매출관리(계산서)/판매선매출 수정, 삭제
							m_all_main.mo.mo06.mo06_06.enabled   = false	// 판매관리/매출관리(계산서)/판매선매출 마감
							m_all_main.mo.mo06.mo06_07.enabled   = false	// 판매관리/매출관리(계산서)/매출 마감
							m_all_main.mo.mo06.mo06_08.enabled   = false	// 판매관리/매출관리(계산서)/매출조회			
						m_all_main.mo.mo07.enabled   = false	// 판매관리/수금관리(현금,어음)
						m_all_main.mo.mo08.enabled   = false 	// 판매관리/운반비관리
						m_all_main.mo.mo09.enabled   = false	// 판매관리/장기재고관리
						m_all_main.mo.mo12.enabled   = true		// 판매관리/조회작업
						m_all_main.mo.mo13.enabled   = true		// 판매관리/기준정보
				else
					m_all_main.mo.enabled = false	// 판매관리				
				end if
			end if
			
			if GF_Permission("구매관리_입력", gs_userid) = "Y" then
				if GF_Permission("구매관리_발주관리", gs_userid) = "Y" then
					m_all_main.mi.mi03.enabled         = true	   // 발주관리
						m_all_main.mi.mi03.mi03_01.enabled = true		// 발주관리/발주등록 관리
						m_all_main.mi.mi03.mi03_02.enabled = false	// 발주관리/발주확정 관리
						m_all_main.mi.mi03.mi03_03.enabled = true		// 발주관리/확정취소 관리
						m_all_main.mi.mi03.mi03_04.enabled = false	// 발주관리/발주마감 관리
						m_all_main.mi.mi03.mi03_05.enabled = true  	// 발주조회/발주조회
						m_all_main.mi.mi03.mi03_05.mi03_0508.enabled = false   //발주조회/구매일보 현황				
					m_all_main.mi.mi04.enabled         = false	   // 수불관리
					m_all_main.mi.mi05.enabled         = false	   // 매입관리
					m_all_main.mi.mi06.enabled         = false	// 지불관리
					m_all_main.mi.mi07.enabled         = false	// 코일관리
					m_all_main.mi.mi08.enabled         = false	// 조업자재관리
					m_all_main.mi.mi09.enabled         = false	// 장기재고관리
					m_all_main.mi.mi10.enabled         = false	// 실사관리
					m_all_main.mi.mi11.enabled         = false	// 기타관리		
					m_all_main.mi.mi12.enabled         = false 	// 조회작업
					m_all_main.mi.mi13.enabled         = false	// 기준정보
				end if
			else
				if GF_Permission("구매관리_조회", gs_userid) = "Y" then
					m_all_main.mi.enabled         = true	   // 구매관리
					//m_all_main.mi.mi01.enabled         = false	// 자동수주계산
					//m_all_main.mi.mi02.enabled         = false	// 수주예약관리
					m_all_main.mi.mi03.enabled         = true	   // 발주관리
						m_all_main.mi.mi03.mi03_01.enabled = false	// 발주관리/발주등록 관리
						m_all_main.mi.mi03.mi03_02.enabled = false	// 발주관리/발주확정 관리
						m_all_main.mi.mi03.mi03_03.enabled = false	// 발주관리/확정취소 관리
						m_all_main.mi.mi03.mi03_04.enabled = false	// 발주관리/발주마감 관리
						m_all_main.mi.mi03.mi03_05.enabled = true  	// 발주조회/발주조회
					m_all_main.mi.mi04.enabled         = true	   // 수불관리
						m_all_main.mi.mi04.mi04_01.enabled = false 	// 수불관리/발주자재 입고관리
						m_all_main.mi.mi04.mi04_02.enabled = false 	// 수불관리/외주스리팅/SHEET 입고관리
						m_all_main.mi.mi04.mi04_03.enabled = false 	// 수불관리/코일이동 관리
						m_all_main.mi.mi04.mi04_04.enabled = false 	// 수불관리/물품이동 관리
						m_all_main.mi.mi04.mi04_05.enabled = false 	// 수불관리/발주입고 수정 및 삭제
						m_all_main.mi.mi04.mi04_06.enabled = false 	// 수불관리/자재반품 관리
						m_all_main.mi.mi04.mi04_07.enabled = true 	// 수불조회
					m_all_main.mi.mi05.enabled         = true	   // 매입관리
						m_all_main.mi.mi05.mi05_01.enabled = false 	// 매입관리/매입관리
						m_all_main.mi.mi05.mi05_02.enabled = false 	// 매입관리/매입관리 수정 및 삭제
						m_all_main.mi.mi05.mi05_03.enabled = false 	// 매입관리/월 매입확정
						m_all_main.mi.mi05.mi05_04.enabled = false 	// 매입관리/매입 마감
						m_all_main.mi.mi05.mi05_05.enabled = true 	// 매입관리/매입조회
					m_all_main.mi.mi06.enabled         = false	// 지불관리
					m_all_main.mi.mi07.enabled         = true	   // 코일관리
						m_all_main.mi.mi07.mi07_01.enabled = false 	// 코일관리/코일 재고관리
						m_all_main.mi.mi07.mi07_02.enabled = false 	// 코일관리/SHEET 재고관리
						m_all_main.mi.mi07.mi07_03.enabled = false 	// 코일관리/코일 등급|특기 관리
						m_all_main.mi.mi07.mi07_04.enabled = false 	// 코일관리/코일 바코드 출력
						m_all_main.mi.mi07.mi07_05.enabled = false 	// 코일관리/원재료 구매계획
						m_all_main.mi.mi07.mi07_06.enabled = true 	// 코일관리/코일조회			
					m_all_main.mi.mi08.enabled         = true	// 조업자재관리
						m_all_main.mi.mi08.mi08_01.enabled = false 	// 조업자재관리/조업자재 구매일보
						m_all_main.mi.mi08.mi08_04.enabled = false 	// 조업자재관리/조업자재 년마감			
						m_all_main.mi.mi08.mi08_09.enabled = true 	// 조업자재관리/조업자재조회
						
					m_all_main.mi.mi09.enabled         = false	// 장기재고관리
					m_all_main.mi.mi10.enabled         = true	   // 실사관리
						m_all_main.mi.mi10.mi10_01.enabled = false 	// 실사관리/담당자별 실사관리
						m_all_main.mi.mi10.mi10_02.enabled = false 	// 실사관리/실사 마감
						m_all_main.mi.mi10.mi10_03.enabled = true 	// 실사관리/실사조회		
					if GF_PERMISSION("구매관리_창고", gs_userid) = "Y" then
						m_all_main.mi.mi11.enabled         = true		// 기타관리		
					else
						m_all_main.mi.mi11.enabled         = false	// 기타관리		
					end if
				
					m_all_main.mi.mi12.enabled         = true 	// 조회작업
					m_all_main.mi.mi13.enabled         = false	// 기준정보
						m_all_main.mi.mi13.mi13_06.enabled = false	// 기준정보/단가관리
				else
					if GF_Permission("구매관리_창고", gs_userid) = "Y" then
						m_all_main.mi.enabled         = true	   // 구매관리
							//m_all_main.mi.mi01.enabled         = false	// 자동수주계산
							//m_all_main.mi.mi02.enabled         = false	// 수주예약관리
							m_all_main.mi.mi03.enabled         = false	// 발주관리
							m_all_main.mi.mi04.enabled         = false	// 수불관리
							m_all_main.mi.mi05.enabled         = false	// 매입관리
							m_all_main.mi.mi06.enabled         = false	// 지불관리
							m_all_main.mi.mi07.enabled         = false	// 코일관리
							m_all_main.mi.mi08.enabled         = false	// 조업자재관리
							
							m_all_main.mi.mi09.enabled         = true		// 장기재고관리
							m_all_main.mi.mi10.enabled         = true	   // 실사관리
								m_all_main.mi.mi10.mi10_01.enabled = true 	// 실사관리/담당자별 실사관리
								m_all_main.mi.mi10.mi10_02.enabled = true 	// 실사관리/실사 마감
								m_all_main.mi.mi10.mi10_03.enabled = true 	// 실사관리/실사조회
							m_all_main.mi.mi11.enabled         = true		// 기타관리		
							
							m_all_main.mi.mi12.enabled         = false 	// 조회작업
							m_all_main.mi.mi13.enabled         = false	// 기준정보
					else
						m_all_main.mi.enabled         = false	   // 구매관리
					end if		
				end if
			end if
			
			if GF_Permission("생산관리_입력", gs_userid) = "Y" then
			else
				if GF_Permission("생산관리_조회", gs_userid) = "Y" then
					m_all_main.mm.mm01.enabled         = true	   // 생산계획관리
						m_all_main.mm.mm01.mm01_01.enabled = false	// 생산계획관리/판매수주생산확정
						m_all_main.mm.mm01.mm01_12.enabled = false	// 생산계획관리/판매수주생산확정(YSP)
						m_all_main.mm.mm01.mm01_13.enabled = false	// 생산계획관리/판매수주 마감
						m_all_main.mm.mm01.mm01_02.enabled = false	// 생산계획관리/자동생산계획생성(시화)
						m_all_main.mm.mm01.mm01_03.enabled = false	// 생산계획관리/자동생산계획생성(YSP)
						m_all_main.mm.mm01.mm01_04.enabled = false	// 생산계획관리/자동생산계획생성(화성)
						m_all_main.mm.mm01.mm01_05.enabled = false	// 생산계획관리/자동생산계획취소
						m_all_main.mm.mm01.mm01_06.enabled = false	// 생산계획관리/생산계획 조정관리
						m_all_main.mm.mm01.mm01_07.enabled = false	// 생산계획관리/생산계획 확정관리
						m_all_main.mm.mm01.mm01_08.enabled = false	// 생산계획관리/생산계획 확정취소
						m_all_main.mm.mm01.mm01_09.enabled = false	// 생산계획관리/수주별 공정관리
						m_all_main.mm.mm01.mm01_10.enabled = false	// 생산계획관리/수주별 예약관리
						m_all_main.mm.mm01.mm01_11.enabled = true	   // 생산계획관리/생산계획 조회
					m_all_main.mm.mm02.enabled         = true	   // 작업진행관리
						m_all_main.mm.mm02.mm02_01.enabled = false	// 작업진행관리/작업지시서 발행
						m_all_main.mm.mm02.mm02_02.enabled = false	// 작업진행관리/작업일보관리
						m_all_main.mm.mm02.mm02_03.enabled = false	// 작업진행관리/외주청구 등록및취소
						m_all_main.mm.mm02.mm02_04.enabled = false	// 작업진행관리/생산주문마감
						m_all_main.mm.mm02.mm02_05.enabled = false	// 작업진행관리/마감된 생산주문 삭제
						m_all_main.mm.mm02.mm02_06.enabled = true	   // 작업진행관리/생산실적조회
						m_all_main.mm.mm02.mm02_07.enabled = true	   // 작업진행관리/생산실적조회(YSP)
					m_all_main.mm.mm03.enabled         = true	   // 코일 관리
						m_all_main.mm.mm03.mm03_01.enabled = false	// 코일 관리/스리팅 계획관리
						m_all_main.mm.mm03.mm03_02.enabled = false	// 코일 관리/스리팅 작업지시관리
						m_all_main.mm.mm03.mm03_03.enabled = false	// 코일 관리/스리팅 작업일보관리
						m_all_main.mm.mm03.mm03_04.enabled = false	// 코일 관리/외주 코일사용관리
						m_all_main.mm.mm03.mm03_05.enabled = false	// 코일 관리/코일이동 관리
						m_all_main.mm.mm03.mm03_06.enabled = true	   // 코일 관리/코일 바코드 출력
						m_all_main.mm.mm03.mm03_07.enabled = false	// 코일 관리/외주스리팅|SHEET 입고관리
						m_all_main.mm.mm03.mm03_08.enabled = true	   // 코일 관리/코일계획조회
						m_all_main.mm.mm03.mm03_09.enabled = true	   // 코일 관리/코일수불조회
					m_all_main.mm.mm04.enabled         = true	   // 자재발주|입고관리
						m_all_main.mm.mm04.mm04_01.enabled = false	// 자재발주|입고관리/발주등록관리
						m_all_main.mm.mm04.mm04_02.enabled = false	// 자재발주|입고관리/발주자재입고관리
						m_all_main.mm.mm04.mm04_03.enabled = true	   // 자재발주|입고관리/제품수불조회
						m_all_main.mm.mm04.mm04_04.enabled = true	   // 자재발주|입고관리/재고현황조회
					m_all_main.mm.mm05.enabled         = false   // 기타 관리
						m_all_main.mm.mm05.mm05_01.enabled = true	   // 기타 관리/가입고 관리
						m_all_main.mm.mm05.mm05_02.enabled = true	   // 기타 관리/대체물품 관리
						m_all_main.mm.mm05.mm05_03.enabled = true	   // 기타 관리/물품이동 관리
						m_all_main.mm.mm05.mm05_04.enabled = true	   // 기타 관리/코일 등급|특기 관리
						m_all_main.mm.mm05.mm05_05.enabled = true	   // 기타 관리/코일재고관리
						m_all_main.mm.mm05.mm05_06.enabled = true	   // 기타 관리/SHEET 재고 관리
						m_all_main.mm.mm05.mm05_07.enabled = true	   // 기타 관리/공정패턴 관리
					m_all_main.mm.mm06.enabled         = true	   // 실사관리
						m_all_main.mm.mm06.mm06_01.enabled = false   // 실사관리/담당자별 실사관리
						m_all_main.mm.mm06.mm06_04.enabled = false   // 실사관리/담당자 몰딩류 실사
						m_all_main.mm.mm06.mm06_02.enabled = false   // 실사관리/실사 마감
						m_all_main.mm.mm06.mm06_03.enabled = true	   // 실사관리/실사조회
					m_all_main.mm.mm07.enabled         = true	   // 조회작업
					m_all_main.mm.mm08.enabled         = true    // 기준정보
				else
					m_all_main.mm.enabled         = false	   // 생산관리
				end if
			end if	
		end if
		
	case 'RPA'	//rpa용 메뉴 변경
		this.ChangeMenu(m_rpa)		
	case 'ROBOT'//ROBOT용 메뉴 변경
		this.ChangeMenu(m_robot)				
end choose		

// 품목 
gs_ds_itemall = CREATE datastore
gs_ds_itemall.DataObject = "d_item_all"
gs_ds_itemall.SetTransObject(SQLCA)
gs_ds_itemall.Reset()

/*2018.12.3 jowonsuk 주석처리 */
if FileExists(".\ITEMALL.TXT") = true then
	ll_dsstate = gs_ds_itemall.ImportFile(".\ITEMALL.TXT")
	if ll_dsstate = 0 then
		GF_ITEM()
	end if
else
	GF_ITEM()
end if

// 규격
gs_ds_qaall = CREATE datastore
gs_ds_qaall.DataObject = "d_qa_all"
gs_ds_qaall.SetTransObject(SQLCA)
gs_ds_qaall.reset()

/*2018.12.3 jowonsuk 주석처리 */
if FileExists(".\QAAll.TXT") = true then
	if gs_ds_qaall.ImportFile(".\QAAll.TXT") = 0 then
		GF_QA()
	end if
else
	GF_QA()
end if

// 거래처 w_whcustret_w
gs_ds_whcustret = CREATE datastore
gs_ds_whcustret.DataObject = "d_whcustret_s"
gs_ds_whcustret.SetTransObject(SQLCA)
gs_ds_whcustret.reset()

/*2018.12.3 jowonsuk 주석처리 */
if FileExists(".\whCustRet.TXT") = true then
	if gs_ds_whcustret.ImportFile(".\whCustRet.TXT") = 0 then
		GF_WHCUSTRET_ALL()
	end if
else
	GF_WHCUSTRET_ALL()
end if

COMMIT;
Close( w_load )

Timer(180)

end event

event timer;int    li_cnt, li_count
long   ll_pos
String ls_message, ls_version, ls_major, ls_minor, ls_major1, ls_minor1


/*
///////////////////////////////////////////////////
// '최신버전 UPDATE' 알림
///////////////////////////////////////////////////
SELECT item_cd INTO :ls_version  FROM codemst WHERE type = 'ERP_VERSION' AND use_yn = 'Y';

if ls_version = "" OR isnull(ls_version) then
else
	// ERP_VERSION( V9.01125 ) : 메이저 버젼이 다른경우 실행불가
	ll_pos    = pos(GS_VER, ".")
	ls_major1 = mid(GS_VER, 2, ll_pos - 1)
	ls_minor1 = mid(GS_VER, ll_pos + 1, len(GS_VER) - ll_pos)
	
	ll_pos    = pos(ls_version, ".")
	ls_major  = mid(ls_version, 2, ll_pos - 1)
	ls_minor  = mid(ls_version, ll_pos + 1, len(ls_version) - ll_pos)
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
			MessageBox("확인","'최신버전 UPDATE'를 메시지는 3분 후 재 실행됩니다.")
		end if
	// 마이너 업그레이드
	else
		if is_uptmsg = "Y" then
			//
		else
			if ls_version > GS_VER then	// 신규버젼
				if ii_run > 0 then	// MessageBox 재 실행 방지
					//
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
						//MessageBox("확인","'최신버전 UPDATE'를 실행하지 않도록 하겠습니다.")
						is_uptmsg = "Y"
					end if
				end if	// ii_run
			end if
		end if	
	end if
end if
*/

//// 100분 후 메시지 알림
//if ii_run  > 50 then ii_run = 0
///////////////////////////////////////////////////


///////////////////////////////////////////////////
// 고객센터
///////////////////////////////////////////////////
/*여기서부터 막음 */
if GF_Permission("고객센터_메신저_미사용", gs_userid) = "Y" then
else
	gs_custper_str lstr_where
	SELECT count(*) INTO :li_cnt FROM projectmsgdet with(nolock)
	 WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND msg IS NULL AND del = 'N';
	if li_cnt > 0 then
		lstr_where.str_ok = true
		OpenWithParm( w_projectmsg, lstr_where )
	end if
end if

///////////////////////////////////////////////////
// 사내 메신저
///////////////////////////////////////////////////
if GF_Permission("사내메신저_사용", gs_userid) = "Y" then	//공통 코드 설정
else
	li_cnt = 0
	
	SELECT 
		 count(user_id)
	into
		:li_cnt
	FROM 
		login  
	WHERE 
		isnull(login.sysmsg_yn,'Y') = 'Y'
	and		
		user_id like :gs_userid
	using sqlca;		

	if li_cnt > 0 then	//개인설정
		li_cnt = 0
		SELECT count(*) INTO :li_cnt FROM sysmsg with(nolock)
		WHERE tlogin = :gs_userid AND msgdate > dateadd(month, -1, getdate()) AND del = 'N';
		if li_cnt > 0 then
			lstr_where.str_ok = true
			OpenWithParm( w_sysmsg_m, lstr_where )
		end if	
	end if
end if

///////////////////////////////////////////////////
// 매출할인 결재
///////////////////////////////////////////////////
if GF_Permission("매출할인결재_알림이", gs_userid) = "Y" then
	setnull(li_cnt)

  SELECT count(*) INTO :li_cnt 
    FROM (
         SELECT dc_app1 = isnull(a.dc_app1,''), a.dc_appdt1
              , dc_app2 = isnull(a.dc_app2,''), a.dc_appdt2
              , dc_app3 = isnull(a.dc_app3,''), a.dc_appdt3
              , dc_app4 = isnull(a.dc_app4,''), a.dc_appdt4
              , dc_apph = isnull(a.dc_apph,''), a.dc_appdth
           FROM dc_group  a with(nolock)
          WHERE ( convert(char(10),a.dc_date,111) BETWEEN DATEADD(day, -30, getdate()) AND getdate() )
            AND ( a.dc_appdt5   is null    )
            AND ((a.dc_app2 = :gs_userid AND a.dc_appdt2 is null ) OR
                 (a.dc_app3 = :gs_userid AND a.dc_appdt3 is null ) OR
                 (a.dc_app4 = :gs_userid AND a.dc_appdt4 is null ) OR
                 (a.dc_apph = :gs_userid AND a.dc_appdth is null )
					 ) /* 내가 미결재 한것 중에서 */
         ) A
   WHERE ((a.dc_app2 = :gs_userid AND (a.dc_app1 <> '' AND a.dc_appdt1 is not null OR a.dc_app1 = '')) OR
          (a.dc_app3 = :gs_userid AND (a.dc_app2 <> '' AND a.dc_appdt2 is not null OR a.dc_app2 = '')) OR
          (a.dc_apph = :gs_userid AND (a.dc_app3 <> '' AND a.dc_appdt3 is not null OR a.dc_app3 = '')) OR
          (a.dc_app4 = :gs_userid AND (a.dc_apph <> '' AND a.dc_appdth is not null OR a.dc_apph = '')) 
         );  /* 전임자들이 결재한것 들 */
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
if GF_Permission("매출이관이월결재_알림중지", gs_userid) = "Y" then
else
	SELECT count(*) INTO :li_cnt
	  FROM (
			 SELECT a.fcust_no, a.fcust_nm    
					, a.tcust_no, a.trans_no    
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
							 , a.tr_app1, a.tr_appdt1
							 , a.tr_app2, a.tr_appdt2
							 , a.tr_app3, a.tr_appdt3
							 , a.tr_app4, a.tr_appdt4
							 , a.tr_app5, a.tr_appdt5
							 , a.tr_apph, a.tr_appdth
						FROM dotrans  A with (nolock)
							  LEFT OUTER JOIN customer C with(nolock) on a.fcust_no = c.cust_no
					  WHERE ( a.tr_date  BETWEEN DATEADD(day, -30, getdate()) AND getdate() )
						 AND ( a.apply_end  IS NULL )
						 AND ( a.tr_app1 = :gs_userid OR a.tr_app2 = :gs_userid OR
								 a.tr_app3 = :gs_userid OR a.tr_app4 = :gs_userid OR
								 a.tr_app5 = :gs_userid OR a.tr_apph = :gs_userid
							  )
					  ) A
				WHERE ( a.tr_apph = :gs_userid AND a.tr_appdth IS NULL ) 
					OR ( a.tr_app4 = :gs_userid AND a.tr_appdt4 IS NULL ) 
					OR ( a.tr_app3 = :gs_userid AND a.tr_appdt3 IS NULL ) 
					OR ( a.tr_app2 = :gs_userid AND a.tr_appdt2 IS NULL ) 
					OR ( a.tr_app1 = :gs_userid AND a.tr_appdt1 IS NULL ) 
			 ) A
		WHERE ( a.tr_app5 = :gs_userid AND a.tr_appdt4 IS NOT NULL ) 
			OR ( a.tr_app4 = :gs_userid AND a.tr_appdt3 IS NOT NULL ) 
			OR ( a.tr_app3 = :gs_userid AND a.tr_appdt2 IS NOT NULL ) 
			OR ( a.tr_app2 = :gs_userid AND a.tr_appdt1 IS NOT NULL ) 
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
/*여기까지  */

///*2018.11.26 jowonsuk 적용 db리커넥트 */
window lw_active
datawindow ldw
//long  i
//
//if dw_test.settransobject(sqlca) <> 1 then
//
//	messagebox('알림', '재접속')
//	DISCONNECT USING SQLCA;
//	CONNECT USING SQLCA;
//	
//	lw_active = this.GetActiveSheet()
//	
//	IF IsValid(lw_active) THEN
//		
//	  for i = 1 to upperbound(lw_active.control)
//		if lw_active.control[i].typeof() = Datawindow! then
//			
//			ldw = lw_active.control[i]
//			ldw.SetTransObject(sqlca)				
//			
//		end if
//	  next
//	  
//	end if
//
//end if	

///////////////////////////////////////////////////
// 암호변경기준일
///////////////////////////////////////////////////
/* 락을 일으키고 있음.
   2017.11.01 조원석 주석처리
string  ls_userid
integer li_pwdday, li_pwddayfix

ls_userid = gs_userid

SELECT sort INTO :li_pwddayfix FROM codemst WHERE type = '암호변경기준일' AND use_yn = 'Y';
if isnull(li_pwddayfix) OR li_pwddayfix < 1 then
	// 사용안하는 경우
else
	SELECT datediff(day, pwdchanged, getdate()) INTO :li_pwdday
	  FROM login 
	 WHERE user_id = :ls_userid;
	
	if isnull(li_pwdday) OR li_pwdday > li_pwddayfix then
		OpenSheet(w_passwd, w_all_main, 6, original!)
	end if
end if
*/
end event

type mdi_1 from mdiclient within w_all_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_all_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_all_main
int X=0
int Y=0
int Width=0
int Height=596
end type

