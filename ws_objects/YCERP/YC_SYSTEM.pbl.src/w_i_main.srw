$PBExportHeader$w_i_main.srw
$PBExportComments$자재관리메인화면(작성일:98/01/17, 작성자:곽용덕)
forward 
global type w_i_main from window
end type
type mdi_1 from mdiclient within w_i_main
end type
type mditbb_1 from tabbedbar within w_i_main
end type
type mdirbb_1 from ribbonbar within w_i_main
end type
end forward

global type w_i_main from window
integer x = 5
integer y = 4
integer width = 4718
integer height = 2984
boolean titlebar = true
string title = "자재관리(I)"
string menuname = "m_i_main"
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
global w_i_main w_i_main

type variables
string  is_uptmsg = "N"
int     ii_run = 0
end variables

forward prototypes
public subroutine wf_menu ()
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
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
//ds_1.retrieve(gs_userid,"m_i_main")
//ds_2.retrieve(gs_userid,"m_i_main")
//ds_3.retrieve(gs_userid,"m_i_main")
//ds_4.retrieve(gs_userid,"m_i_main")
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

public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4);//Choose Case arg_str1
//    Case 'm_code'
//        Choose Case arg_str2 
//            Case 'zzzzzzzzzzzz'
//        End Choose 
//    Case 'm_manage'
//        Choose Case arg_str2 
//            Case 'm_111'
//                Choose Case arg_str3 
//                     Case 'm_close'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_111.m_close.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_111.m_close.visible = False 
//                         END IF 
//                     Case 'm_print'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_111.m_print.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_111.m_print.visible = False 
//                         END IF 
//                     Case 'm_purch'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_111.m_purch.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_111.m_purch.visible = False 
//                         END IF 
//                End Choose 
//            Case 'm_count'
//                Choose Case arg_str3 
//                     Case 'm_silsainput'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_count.m_silsainput.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_count.m_silsainput.visible = False 
//                         END IF 
//                     Case 'm_silsaitem'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_count.m_silsaitem.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_count.m_silsaitem.visible = False 
//                         END IF 
//                End Choose 
//            Case 'm_inout'
//                Choose Case arg_str3 
//                     Case 'm_-2'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_-2.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_-2.visible = False 
//                         END IF 
//                     Case 'm_-3'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_-3.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_-3.visible = False 
//                         END IF 
//                     Case 'm_4'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_4.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_4.visible = False 
//                         END IF 
//                     Case 'm_alter'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_alter.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_alter.visible = False 
//                         END IF 
//                     Case 'm_in'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_in.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_in.visible = False 
//                         END IF 
//                     Case 'm_invoice'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_invoice.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_invoice.visible = False 
//                         END IF 
//                     Case 'm_out'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_out.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_out.visible = False 
//                         END IF 
//                     Case 'm_sliting'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_inout.m_sliting.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_inout.m_sliting.visible = False 
//                         END IF 
//                End Choose 
//            Case 'm_somom1'
//                Choose Case arg_str3 
//                     Case 'm_bin_m'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_somom1.m_bin_m.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_somom1.m_bin_m.visible = False 
//                         END IF 
//                     Case 'm_bsign_m'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_somom1.m_bsign_m.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_somom1.m_bsign_m.visible = False 
//                         END IF 
//                     Case 'm_somom'
//                         IF arg_str4 = 'Y' THEN 
//                            m_i_main.m_manage.m_somom1.m_somom.visible = True 
//                         ELSE 
//                            m_i_main.m_manage.m_somom1.m_somom.visible = False 
//                         END IF 
//                End Choose 
//        End Choose 
//End Choose 
//
end subroutine

public subroutine wf_menucase1 (string arg_str1, string arg_str2);//Choose Case arg_str1
//    Case 'm_code'
//        IF arg_str2 = 'Y' THEN 
//           m_i_main.m_code.visible = True 
//        ELSE 
//           m_i_main.m_code.visible = False 
//        END IF 
//    Case 'm_manage'
//        IF arg_str2 = 'Y' THEN 
//           m_i_main.m_manage.visible = True 
//        ELSE 
//           m_i_main.m_manage.visible = False 
//        END IF 
//    Case 'm_retrieve'
//        IF arg_str2 = 'Y' THEN 
//           m_i_main.m_retrieve.visible = True 
//        ELSE 
//           m_i_main.m_retrieve.visible = False 
//        END IF 
//End Choose 
//
end subroutine

public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3);//Choose Case arg_str1
//    Case 'm_code'
//        Choose Case arg_str2 
//            Case 'm_-'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_-.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_-.visible = False 
//                END IF 
//            Case 'm_acount'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_acount.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_acount.visible = False 
//                END IF 
//            Case 'm_bcust'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_bcust.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_bcust.visible = False 
//                END IF 
//            Case 'm_itemgroup'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_itemgroup.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_itemgroup.visible = False 
//                END IF 
//            Case 'm_jajae'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_jajae.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_jajae.visible = False 
//                END IF 
//            Case 'm_location'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_location.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_location.visible = False 
//                END IF 
//            Case 'm_mainsupp'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_mainsupp.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_mainsupp.visible = False 
//                END IF 
//            Case 'm_supp'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_supp.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_supp.visible = False 
//                END IF 
//            Case 'm_unitcost'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_unitcost.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_unitcost.visible = False 
//                END IF 
//            Case 'm_uom'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_code.m_uom.visible = True 
//                ELSE 
//                   m_i_main.m_code.m_uom.visible = False 
//                END IF 
//        End Choose 
//    Case 'm_manage'
//        Choose Case arg_str2 
//            Case 'm_111'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_manage.m_111.visible = True 
//                ELSE 
//                   m_i_main.m_manage.m_111.visible = False 
//                END IF 
//            Case 'm_112'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_manage.m_112.visible = True 
//                ELSE 
//                   m_i_main.m_manage.m_112.visible = False 
//                END IF 
//            Case 'm_count'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_manage.m_count.visible = True 
//                ELSE 
//                   m_i_main.m_manage.m_count.visible = False 
//                END IF 
//            Case 'm_inout'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_manage.m_inout.visible = True 
//                ELSE 
//                   m_i_main.m_manage.m_inout.visible = False 
//                END IF 
//            Case 'm_somom1'
//                IF arg_str3 = 'Y' THEN 
//                   m_i_main.m_manage.m_somom1.visible = True 
//                ELSE 
//                   m_i_main.m_manage.m_somom1.visible = False 
//                END IF 
//        End Choose 
//End Choose 
//
end subroutine

on w_i_main.create
if this.MenuName = "m_i_main" then this.MenuID = create m_i_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_i_main.destroy
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
THIS.Title = '[' + ls_name + ':구매]' + GS_USERNAME + ' [' + Sqlca.ServerName + '][' + SQLCA.DataBase + '][' + gs_ver + "][" + gs_level + "]"

if GF_PERMISSION("구매관리_입력", gs_userid) = "Y" then
//	if gs_userid = "1999010s" then
//      m_i_main.m_manage.m_coilm.m_iocoilqoh_m.enabled  = true
//      m_i_main.m_manage.m_coilm.m_iosheetqoh_m.enabled = true
//	else
//      m_i_main.m_manage.m_coilm.m_iocoilqoh_m.enabled  = false
//      m_i_main.m_manage.m_coilm.m_iosheetqoh_m.enabled = false		
//	end if
else
	if GF_PERMISSION("구매관리_조회", gs_userid) = "Y" then
		m_i_main.m_manage.enabled 		= true			// 구매관리/관리
			m_i_main.m_manage.m_autoexe.enabled = false		// 구매관리/관리/자동수주계산
			m_i_main.m_manage.m_13.enabled      = false		// 구매관리/관리/수주예약관리
			m_i_main.m_manage.m_pur.enabled     = false		// 구매관리/관리/발주관리
			m_i_main.m_manage.m_inout.enabled   = false		// 구매관리/관리/수불관리
			m_i_main.m_manage.m_ap.enabled      = false		// 구매관리/관리/매입관리
			m_i_main.m_manage.m_apinv.enabled   = false		// 구매관리/관리/지불관리
			m_i_main.m_manage.m_coilm.enabled   = false		// 구매관리/관리/코일관리
			m_i_main.m_manage.m_somom1.enabled  = false		// 구매관리/관리/조업자재관리
			
			m_i_main.m_manage.m_itemstock.enabled = false	// 구매관리/관리/장기재고관리
			m_i_main.m_manage.m_silsa.enabled     = false	// 구매관리/관리/실사관리
			if GF_PERMISSION("구매관리_창고", gs_userid) = "Y" then
				m_i_main.m_manage.m_etc.enabled    = true		// 기타관리		
			else
				m_i_main.m_manage.m_etc.enabled    = false	// 구매관리/관리/기타관리
			end if				
		
			m_i_main.m_manage.m_modulexit.enabled = true 	// 구매관리/관리/자재관리종료
			m_i_main.m_manage.m_exit.enabled      = true 	// 구매관리/관리/종료(Exit)
			
		m_i_main.m_retrieve.enabled   = true			// 구매관리/조회
		m_i_main.m_code.enabled   		= false			// 구매관리/기준정보
	else			
		if GF_PERMISSION("구매관리_창고", gs_userid) = "Y" then
			m_i_main.m_manage.enabled 		= true			// 구매관리/관리
				m_i_main.m_manage.m_autoexe.enabled = false	// 구매관리/관리/자동수주계산
				m_i_main.m_manage.m_13.enabled      = false	// 구매관리/관리/수주예약관리
				m_i_main.m_manage.m_pur.enabled     = false	// 구매관리/관리/발주관리
				m_i_main.m_manage.m_inout.enabled   = false	// 구매관리/관리/수불관리
				m_i_main.m_manage.m_ap.enabled      = false	// 구매관리/관리/매입관리
				m_i_main.m_manage.m_apinv.enabled   = false	// 구매관리/관리/지불관리
				m_i_main.m_manage.m_coilm.enabled   = false	// 구매관리/관리/코일관리
				m_i_main.m_manage.m_somom1.enabled  = false	// 구매관리/관리/조업자재관리
	
				m_i_main.m_manage.m_itemstock.enabled = true // 구매관리/관리/장기재고관리
				m_i_main.m_manage.m_silsa.enabled     = true	// 구매관리/관리/실사관리
				m_i_main.m_manage.m_etc.enabled       = true	// 기타관리		

			m_i_main.m_manage.m_modulexit.enabled  = true // 구매관리/관리/자재관리종료
			m_i_main.m_manage.m_exit.enabled       = true // 구매관리/관리/종료(Exit)

			m_i_main.m_retrieve.enabled   = true			// 구매관리/조회
				m_i_main.m_retrieve.m_6.enabled   = false		// 구매관리/조회/발주조회
				m_i_main.m_retrieve.m_3.enabled   = false		// 구매관리/조회/수불조회
				m_i_main.m_retrieve.m_insp.enabled   = false	// 구매관리/조회/매입조회
				m_i_main.m_retrieve.m_apoiinv.enabled= false	// 구매관리/조회/지불조회
				m_i_main.m_retrieve.m_coil.enabled   = false	// 구매관리/조회/코일조회
				m_i_main.m_retrieve.m_intempr.enabled= true	// 구매관리/조회/기타조회
				m_i_main.m_retrieve.m_2.enabled  	 = true	// 구매관리/조회/실사조회				
				m_i_main.m_retrieve.m_supp1.enabled  = true	// 구매관리/조회/거래처조회				
				m_i_main.m_retrieve.m_pursale.enabled= true	// 구매관리/조회/수주현황조회				

			m_i_main.m_code.enabled   		= false			// 구매관리/기준정보
		else
			m_i_main.m_manage.enabled 		= true			// 구매관리/관리
				m_i_main.m_manage.m_autoexe.enabled = false	// 구매관리/관리/자동수주계산
				m_i_main.m_manage.m_13.enabled      = false	// 구매관리/관리/수주예약관리
				m_i_main.m_manage.m_pur.enabled     = false	// 구매관리/관리/발주관리
				m_i_main.m_manage.m_inout.enabled   = false	// 구매관리/관리/수불관리
				m_i_main.m_manage.m_ap.enabled      = false	// 구매관리/관리/매입관리
				m_i_main.m_manage.m_apinv.enabled   = false	// 구매관리/관리/지불관리
				m_i_main.m_manage.m_coilm.enabled   = false	// 구매관리/관리/코일관리
				m_i_main.m_manage.m_somom1.enabled  = false	// 구매관리/관리/조업자재관리
	
				m_i_main.m_manage.m_itemstock.enabled = false// 구매관리/관리/장기재고관리
				m_i_main.m_manage.m_silsa.enabled   = false	// 구매관리/관리/실사관리
				m_i_main.m_manage.m_etc.enabled     = false	// 구매관리/관리/기타관리
				
			m_i_main.m_manage.m_modulexit.enabled  = true // 구매관리/관리/자재관리종료
			m_i_main.m_manage.m_exit.enabled       = true // 구매관리/관리/종료(Exit)

			m_i_main.m_retrieve.enabled   = false			// 구매관리/조회
			m_i_main.m_code.enabled   		= false			// 구매관리/기준정보
		end if
	end if
end if


//wf_menu()
/*
자재관리/관리/발주관리/발주등록관리 m_manage.m_pur.m_purm
             /수불관리              m_manage.m_inout
             /매입관리              m_manage.m_ap
        /조회/발주조회              m_retrieve.m_6
             /수불조회              m_retrieve.m_3
             /매입조회              m_retrieve.m_insp
        /기준정보/구매처별단가관리  m_code.m_unitcost
*/

//if gf_permission('자재메뉴통제', gs_userid) = 'Y' then
//	m_i_main.m_manage.m_pur.m_purm.enabled = true	// 자재관리/관리/발주관리/발주등록관리
//	m_i_main.m_manage.m_inout.enabled  = true			// 자재관리/관리/수불관리
//	m_i_main.m_manage.m_ap.enabled     = true			// 자재관리/관리/매입관리
//	m_i_main.m_retrieve.m_6.enabled    = true			// 자재관리/조회/발주조회
//	m_i_main.m_retrieve.m_3.enabled    = true			// 자재관리/조회/수불조회
//	m_i_main.m_retrieve.m_insp.enabled = true       // 자재관리/조회/매입조회 
//	m_i_main.m_code.m_unitcost.enabled = true       // 자재관리/기준정보/구매처별단가관리
//else
//	m_i_main.m_manage.m_pur.m_purm.enabled = false
//	m_i_main.m_manage.m_inout.enabled  = false
//	m_i_main.m_manage.m_ap.enabled     = false
//	m_i_main.m_retrieve.m_6.enabled    = false
//	m_i_main.m_retrieve.m_3.enabled    = false
//	m_i_main.m_retrieve.m_insp.enabled = false
//	m_i_main.m_code.m_unitcost.enabled = false
//end if


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
	ls_auditymd     = ProfileString("YCERP.INI", "Database", "WinAuditYMD", " ")	// 검사시작일
	if ls_auditymd  > ls_audit then	// PC 실행일자가 검사시작일 보다 크면 SKIP
	elseif ls_auditymd  < ls_audit then	// PC 실행일자가 검사시작일 이전이면
			SetProfileString("YCERP.INI", "DATABASE", "WinAudit", " ")
			SetProfileString("YCERP.INI", "DATABASE", "WinAuditYMD", ls_audit)
	else	
		ls_auditchk     = ProfileString("YCERP.INI", "Database", "WinAudit", " ")		// 실행유무
		if ls_auditchk  = "Y" then		// 한번 실행한 경우
		else
			ls_server = ProfileString("YCERP.INI", "Database", "ServerName", " ")			
			ls_db     = ProfileString("YCERP.INI", "Database", "DataBase", " ")
			//MessageBox("안내(WinAudit Freeware)", '컴퓨터분석 프로그램을 자동실행 하도록 하겠습니다.~n~n' + &
			//			  '이 분석작업은 한번 실행하면 재 실행되지 않으며, 다음의 작업종료 메시지에서~n' + &
			//			  '(개별적 데이터베이스 삽입에 관한 추가 오류 메시지는 금지됩니다.)~n~n' + &
			//			  '"확인" 버튼만 클릭 하시면 됩니다.~n~n~n' + &
			//			  '유창ERP 프로그램 작업과는 아무런 상관이 없습니다.  --전산팀--')
			
			ls_auditucmd = "WinAuditU.exe /r=" + ls_cmdline + " /o=ODBC /f=DRIVER=SQL Server;SERVER=" + ls_server + ";UID=db_user;PWD=;DATABASE=" + ls_db + &
								"; /L=ko /m=[유창]컴퓨터분석 작업이 정상 종료될때까지, 이 프로그램을 강제종료(닫기) 하지 마시기 바랍니다."
			RUN (ls_auditucmd, Minimized!) 		
			
			// 정상실행 표시
			SetProfileString("YCERP.INI", "DATABASE", "WinAudit", "Y")
			SetProfileString("YCERP.INI", "DATABASE", "WinAuditYMD", ls_audit)
			
			if IsValid(w_all_main) = true then
				w_all_main.Show()  // 통합 MAINMENU
			else
				w_youchang2.Show() // 유창게시판
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
ls_msgchk  =  ProfileString("YCERP.INI", "MessageBox", "Check", " ")
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

type mdi_1 from mdiclient within w_i_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_i_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_i_main
int X=0
int Y=0
int Width=0
int Height=596
end type

