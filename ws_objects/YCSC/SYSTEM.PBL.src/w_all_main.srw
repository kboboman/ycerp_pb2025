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
integer x = 5
integer y = 4
integer width = 5047
integer height = 4604
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
string icon = "D:\WORK\nsis3-install-alt.ico"
event ue_menu_call ( string as_text )
event ue_1 pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
end type
global w_all_main w_all_main

type variables
int     ii_run = 0, il_sw, ii_sel = 1
long    il_first_rid = 2147483647, il_last_rid = 0 , il_curr_page = 0, il_totcnt
string  is_first_level = ' ', is_last_level = FillA('Z', 255),  is_title = '%', is_user = '%'
string  is_uptmsg = "N"
boolean ib_ref = false
statictext ist_st[10]
end variables

forward prototypes
public subroutine wf_menu ()
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
public subroutine wf_menu_create ()
public function menu wf_menu_set (string as_menu_cd, string as_menu_nm, menu am_main_menu, menu am_add_menu)
public function boolean wf_menu_const ()
end prototypes

event ue_menu_call(string as_text);//
MessageBox('확인', 'w_all_main.ue_menu_call 메뉴정보^^~r~n' + as_text)
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

public subroutine wf_menu_create ();// wf_menu_create
String ls_menu_cd, ls_menu_nm, ls_menu_level
Long   i
Menu   lml_menu, lmm_menu

// Loop 또는 DB 연동시 Cursor 를 돌리셔도 될 듯..
For i = 1 To 6	
	choose case i
		case 1
			ls_menu_level = 'L'
			ls_menu_cd    = '001-0'
			ls_menu_nm    = '대분류1'
	
		case 2
			ls_menu_level = 'M'
			ls_menu_cd    = '001-1'
			ls_menu_nm    = '중분류1'
	
		case 3
			ls_menu_level = 'M'
			ls_menu_cd    = '001-2'
			ls_menu_nm    = '중분류2'

		case 4
			ls_menu_level = 'L'
			ls_menu_cd    = '002-0'
			ls_menu_nm    = '대분류2'
	
		case 5
			ls_menu_level = 'M'
			ls_menu_cd    = '002-1'
			ls_menu_nm    = '중분류2_1'
	
		case 6
			ls_menu_level = 'M'
			ls_menu_cd    = '002-2'
			ls_menu_nm    = '중분류2_2'
	end choose
	
	CHOOSE CASE ls_menu_level
		CASE 'L' // 대분류메뉴
	   	lml_menu = wf_menu_set(ls_menu_cd, ls_menu_nm, m_frame, m_frame)
	   CASE 'M' // 중분류메뉴
			lmm_menu = wf_menu_set(ls_menu_cd, ls_menu_nm, m_frame, lml_menu)
	END CHOOSE
Next
end subroutine

public function menu wf_menu_set (string as_menu_cd, string as_menu_nm, menu am_main_menu, menu am_add_menu);// wf_menu_set (as_menu_cd, as_menu_nm, am_main_menu, am_add_menu)
// Return type menu

m_dynamic_all lm_dynamic
lm_dynamic = Create m_dynamic_all
//m_all_main lm_dynamic
//lm_dynamic = Create m_all_main

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
		m_all_main.mo.mo03.mo03_06.mo03_0616.enabled = false	   // 영업관리.출고관리.출고조회.현장별 자재투입현황(F8)
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

event open;// m_frame, m_all_main
datetime ldt_date
date     ld_date
string   ls_name, ls_comname, ls_teamnm

SELECT top 1 rtrim(com_name) INTO :ls_comname FROM glcomp;

SELECT REPLACE(area_name,'사업장','') INTO :ls_name  FROM area WHERE area_no = :gs_area;
if sqlca.sqldbcode <> 0 then
end if

SELECT rtrim(team_name) INTO :ls_teamnm FROM team WHERE team_code = :gs_team;

ls_name = ls_comname + "|" + ls_name + "|" + ls_teamnm
THIS.Title = ls_name + '|' + GS_USERNAME + '/[' + SQLCA.ServerName + '][' + SQLCA.DataBase + '][' + gs_ver + "][" + gs_level + "] [" + gs_connect_gb + " / "  + gs_db_gb + "]"

IF IsValid(w_login) = true THEN close(w_login)

This.width  = pixelstounits(ge_Environment.screenwidth,  xpixelstounits!)
This.height = pixelstounits(ge_Environment.screenheight, ypixelstounits!)
This.Show()

ld_date = date(ldt_date)
ld_date = RelativeDate(ld_date, -30)
DELETE FROM loginhis WHERE in_date < :ld_date;
COMMIT;

ld_date = RelativeDate(ld_date, -5)
DELETE FROM sysmsg WHERE msgdate < :ld_date;
COMMIT;


//wf_menu()
//wf_menu_create()

Open(w_load)
// 관리자만 보이는 메뉴들
If gs_userid = "1999010s" then
Else
	m_all_main.ma.visible = false	// 시스템 관리
End If 


///////////////////////////////////////////////////////////////
// 메뉴권한 체크
///////////////////////////////////////////////////////////////
long ll_cnt
SELECT COUNT(*) INTO :ll_cnt FROM CODEMST
 WHERE TYPE   IN ('판매관리_입력','판매관리_조회')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid; 
if ll_cnt > 0 then m_all_main.mo.enabled = true	// 판매관리

SELECT COUNT(*) INTO :ll_cnt FROM CODEMST
 WHERE TYPE   IN ('구매관리_입력','구매관리_조회','구매관리_창고')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid; 
if ll_cnt > 0 then m_all_main.mi.enabled = true	// 구매관리


SELECT COUNT(*) INTO :ll_cnt FROM CODEMST
 WHERE TYPE   IN ('생산관리_입력','생산관리_조회')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid; 
if ll_cnt > 0 then m_all_main.mm.enabled = true	// 생산관리

if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" then	wf_menu_const()
///////////////////////////////////////////////////////////////

//m_all_main.mo.enabled   = false			// 판매관리/관리
if GF_PERMISSION("판매관리_입력", gs_userid) = "Y" then
else
	if GF_PERMISSION("판매관리_조회", gs_userid) = "Y" then
		m_all_main.mo.enabled   = true				// 판매관리/관리
			m_all_main.mo.mo01.enabled   = false	// 판매관리/견적관리
				m_all_main.mo.mo01.mo01_01.enabled   = false	// 판매관리/견적관리/견적서관리
				m_all_main.mo.mo01.mo01_02.enabled   = false	// 판매관리/견적관리/견적서결재관리
				m_all_main.mo.mo01.mo01_03.enabled   = false	// 판매관리/견적관리/일위대가관리
				m_all_main.mo.mo01.mo01_04.enabled   = true	// 판매관리/견적관리/견적조회			
			m_all_main.mo.mo02.enabled   = true		// 판매관리/수주관리
				m_all_main.mo.mo02.mo02_01.enabled   = false	// 판매관리/수주관리/수주접수확인(eSale)
				m_all_main.mo.mo02.mo02_02.enabled   = false	// 판매관리/수주관리/판매수주관리
				m_all_main.mo.mo02.mo02_03.enabled   = false	// 판매관리/수주관리/판매수주확정
				m_all_main.mo.mo02.mo02_04.enabled   = false	// 판매관리/수주관리/샘플관리
				m_all_main.mo.mo02.mo02_07.enabled   = true	// 판매관리/수주관리/수주조회
				m_all_main.mo.mo02.mo02_08.enabled   = true	// 판매관리/수주관리/수주조회(YSP)			
			m_all_main.mo.mo03.enabled   = true		// 판매관리/출고관리(명세서)
				m_all_main.mo.mo03.mo03_01.enabled   = false	// 판매관리/출고관리(명세서)/출고의뢰서 작성
				m_all_main.mo.mo03.mo03_02.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 작성
				m_all_main.mo.mo03.mo03_03.enabled   = false	// 판매관리/출고관리(명세서)/거래명세서 수정 및 삭제
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
//			m_all_main.mo.mo10.enabled   = true		// 판매관리/고객방문일지
//			m_all_main.mo.mo11.enabled   = true		// 판매관리/고객정보관리
			m_all_main.mo.mo12.enabled   = true		// 판매관리/조회작업
			m_all_main.mo.mo13.enabled   = true		// 판매관리/기준정보
	else
		m_all_main.mo.enabled   = false			// 판매관리/관리
	end if
end if

//m_all_main.mi.enabled         = false	   // 구매관리
if GF_PERMISSION("구매관리_입력", gs_userid) = "Y" then
//	if gs_userid = "1999010s" then
//      m_all_main.mi.mi07.mi07_01.enabled = true
//      m_all_main.mi.mi07.mi07_02.enabled = true
//	else
//      m_all_main.mi.mi07.mi07_01.enabled = false
//      m_all_main.mi.mi07.mi07_02.enabled = false		
//	end if
else
	if GF_PERMISSION("구매관리_조회", gs_userid) = "Y" then
		m_all_main.mi.enabled         = true	   // 구매관리
		m_all_main.mi.mi01.enabled         = false	// 자동수주계산
		m_all_main.mi.mi02.enabled         = false	// 수주예약관리
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
			//m_all_main.mi.mi08.mi08_02.enabled = false 	// 조업자재관리/조업자재 구매월보
			//m_all_main.mi.mi08.mi08_03.enabled = false 	// 조업자재관리/조업자재 구매년보
			m_all_main.mi.mi08.mi08_04.enabled = false 	// 조업자재관리/조업자재 년마감			
			m_all_main.mi.mi08.mi08_09.enabled = true 	// 조업자재관리/조업자재조회
			
		m_all_main.mi.mi09.enabled         = false	// 장기재고관리
		m_all_main.mi.mi10.enabled         = true	   // 실사관리
			m_all_main.mi.mi10.mi10_01.enabled = false 	// 실사관리/담당자별 실사관리
			m_all_main.mi.mi10.mi10_02.enabled = false 	// 실사관리/실사 마감
			m_all_main.mi.mi10.mi10_03.enabled = true 	// 실사관리/실사조회		
		m_all_main.mi.mi11.enabled         = false	// 기타관리		
		
		m_all_main.mi.mi12.enabled         = true 	// 조회작업
		m_all_main.mi.mi13.enabled         = false	// 기준정보
			m_all_main.mi.mi13.mi13_06.enabled = false	// 기준정보/단가관리
	else
		if GF_PERMISSION("구매관리_창고", gs_userid) = "Y" then
			m_all_main.mi.enabled         = true	   // 구매관리
				m_all_main.mi.mi01.enabled         = false	// 자동수주계산
				m_all_main.mi.mi02.enabled         = false	// 수주예약관리
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

//m_all_main.mm.enabled         = false	   // 생산관리
if GF_PERMISSION("생산관리_입력", gs_userid) = "Y" then
else
	if GF_PERMISSION("생산관리_조회", gs_userid) = "Y" then
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
		m_all_main.mm.mm08.enabled         = false   // 기준정보
	else
		m_all_main.mm.enabled         = false	   // 생산관리
	end if
end if


// 품목 
gs_ds_itemall = CREATE datastore
gs_ds_itemall.DataObject = 'd_item_all'
gs_ds_itemall.SetTransObject(SQLCA)
gs_ds_itemall.reset()

if FileExists(".\ITEMALL.TXT") = true then
	if gs_ds_itemall.ImportFile(".\ITEMALL.TXT") = 0 then
		GF_ITEM()
	end if
else
	GF_ITEM()
end if

// 규격
gs_ds_qaall = CREATE datastore
gs_ds_qaall.DataObject = 'd_qa_all'
gs_ds_qaall.SetTransObject(SQLCA)
gs_ds_qaall.reset()

if FileExists(".\QAAll.TXT") = true then
	if gs_ds_qaall.ImportFile(".\QAAll.TXT") = 0 then
		GF_QA()
	end if
else
	GF_QA()
end if

// 거래처 w_whcustret_w
gs_ds_whcustret = CREATE datastore
gs_ds_whcustret.DataObject = 'd_whcustret_s'
gs_ds_whcustret.SetTransObject(SQLCA)
gs_ds_whcustret.reset()

if FileExists(".\whCustRet.TXT") = true then
	if gs_ds_whcustret.ImportFile(".\whCustRet.TXT") = 0 then
		GF_WHCUSTRET_ALL()
	end if
else
	GF_WHCUSTRET_ALL()
end if

COMMIT;
close(w_load)

// 물류업무 프로세스
if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" then
else
// OpenSheet(w_o_process, w_all_main, 6, Layered!)	
// OpenSheet(w_dashboard_o, w_all_main, 6, Layered!)	
end if

Timer(180)

end event

event timer;
int    li_cnt
long   ll_pos
String ls_msgchk, ls_version, ls_major, ls_minor, ls_major1, ls_minor1

/////////////////////////////////////////////////////
//// '최신버전 UPDATE' 알림
/////////////////////////////////////////////////////
//SELECT item_cd INTO :ls_version  FROM CODEMST 
// WHERE TYPE       = 'ERP_VERSION' AND USE_YN  = 'Y';
//
//if ls_version = "" or isnull(ls_version) then
//else
//	// ERP_VERSION( V9.01125 ) : 메이저 버젼이 다른경우 실행불가
//	ll_pos    = pos(GS_VER, ".")
//	ls_major1 = mid(GS_VER, 2, ll_pos - 1)
//	ls_minor1 = mid(GS_VER, ll_pos + 1, len(GS_VER) - ll_pos)
//	
//	ll_pos    = pos(ls_version, ".")
//	ls_major  = mid(ls_version, 2, ll_pos - 1)
//	ls_minor  = mid(ls_version, ll_pos + 1, len(ls_version) - ll_pos)
//	// 메이저 업그레이드
//	if ls_major <> ls_major1 then
//		if MessageBox("확인","ERP 프로그램 메이저 버젼이 수정되었습니다.(Ver " + GS_VER + " <> " + ls_version + ")~n~n" + &
//						  "'최신버전 UPDATE'를 반드시 실행하시기 바랍니다.", Exclamation!, YesNo!, 2) = 1 then
//			// 파일서버 강제접속
//			Run("net use \\192.168.1.6\ipc$ /user:userdev userdev",Minimized!)
//			// 자동 UPDTAE 실행
//			RUN ("C:\Program Files\YCSC_MAIN\ycsc_verup.exe YCGW") 
//			IF IsValid(w_all_main) = true THEN close(w_all_main)
//		else
//			MessageBox("확인","'최신버전 UPDATE'를 메시지는 2분 후 재 실행됩니다.")
//		end if
//	// 마이너 업그레이드
//	else
//		if is_uptmsg = "Y" then
//		else
//			if ls_version > GS_VER then	// 신규버젼
//				if ii_run > 0 then	// MessageBox 재 실행 방지
//				else
//					ii_run = ii_run + 1
//					if MessageBox("확인","ERP 프로그램이 수정되었습니다.(Ver " + GS_VER + " <> " + ls_version + ")~n~n" + &
//									  "이 ERP 프로그램을 종료하고 '최신버전 UPDATE'를 실행하시겠습니까?", Exclamation!, YesNo!, 2) = 1 then
//						is_uptmsg = "N"
//		
//						// 파일서버 강제접속
//						Run("net use \\192.168.1.6\ipc$ /user:userdev userdev",Minimized!)
//						// 자동 UPDTAE 실행
//						RUN ("C:\Program Files\YCSC_MAIN\ycsc_verup.exe YCGW") 
//						IF IsValid(w_all_main) = true THEN close(w_all_main)
//					else
//						//MessageBox("확인","지금은 '최신버전 UPDATE'를 실행하지 않도록 하겠습니다.")
//						is_uptmsg = "Y"
//					end if
//				end if	// ii_run
//			end if
//		end if	
//	end if
//end if
//
////// 100분 후 메시지 알림
////if ii_run  > 50 then ii_run = 0
/////////////////////////////////////////////////////
//
//
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
//	ls_auditymd     = ProfileString("YCSC.INI", "Database", "WinAuditYMD", " ")	// 검사시작일
//	if ls_auditymd  > ls_audit then	// PC 실행일자가 검사시작일 보다 크면 SKIP
//	elseif ls_auditymd  < ls_audit then	// PC 실행일자가 검사시작일 이전이면
//			SetProfileString("YCSC.INI", "DATABASE", "WinAudit", " ")
//			SetProfileString("YCSC.INI", "DATABASE", "WinAuditYMD", ls_audit)
//	else	
//		ls_auditchk     = ProfileString("YCSC.INI", "Database", "WinAudit", " ")		// 실행유무
//		if ls_auditchk  = "Y" then		// 한번 실행한 경우
//		else
//			ls_server = ProfileString("YCSC.INI", "Database", "ServerName", " ")			
//			ls_db     = ProfileString("YCSC.INI", "Database", "DataBase", " ")
//			//MessageBox("안내(WinAudit Freeware)", '컴퓨터분석 프로그램을 자동실행 하도록 하겠습니다.~n~n' + &
//			//			  '이 분석작업은 한번 실행하면 재 실행되지 않으며, 다음의 작업종료 메시지에서~n' + &
//			//			  '(개별적 데이터베이스 삽입에 관한 추가 오류 메시지는 금지됩니다.)~n~n' + &
//			//			  '"확인" 버튼만 클릭 하시면 됩니다.~n~n~n' + &
//			//			  'ERP 프로그램 작업과는 아무런 상관이 없습니다.  --전산팀--')
//			
//			ls_auditucmd = "WinAuditU.exe /r=" + ls_cmdline + " /o=ODBC /f=DRIVER=SQL Server;SERVER=" + ls_server + ";UID=db_user;PWD=;DATABASE=" + ls_db + &
//								"; /L=ko /m=[송천]컴퓨터분석 작업이 정상 종료될때까지, 이 프로그램을 강제종료(닫기) 하지 마시기 바랍니다."
//			RUN (ls_auditucmd, Minimized!) 		
//			
//			// 정상실행 표시
//			SetProfileString("YCSC.INI", "DATABASE", "WinAudit", "Y")
//			SetProfileString("YCSC.INI", "DATABASE", "WinAuditYMD", ls_audit)
//			
//			if IsValid(w_all_main) = true then
//				w_all_main.Show()  // 통합 MAINMENU
//			else
//				w_youchang2.Show() // 게시판
//			end if
//		end if
//	end if
//end if
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

