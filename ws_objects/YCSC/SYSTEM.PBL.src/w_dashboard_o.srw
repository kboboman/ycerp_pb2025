$PBExportHeader$w_dashboard_o.srw
$PBExportComments$영업대쉬보드
forward
global type w_dashboard_o from window
end type
type dw_1 from datawindow within w_dashboard_o
end type
end forward

global type w_dashboard_o from window
integer x = 494
integer y = 424
integer width = 5449
integer height = 2692
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "C:\bmp\Book.ico"
boolean center = true
dw_1 dw_1
end type
global w_dashboard_o w_dashboard_o

type variables
gs_custper_str istr_select
int ii_type, ii_sw =0
int ii_cnt = 0
end variables

event open;////==GF_USEPROGRAM(프로그램 사용현황)===========================================================
//GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
////=============================================================================================

//THIS.X = (pixelstounits(ge_Environment.screenwidth,  xpixelstounits!) - this.width)  / 2
//THIS.Y = (pixelstounits(ge_Environment.screenheight, ypixelstounits!) - this.height) / 2 - 250

this.title = "물류업무 프로세스"
dw_1.settransobject(sqlca)
dw_1.x = 0
dw_1.y = 0
dw_1.width  = this.width
dw_1.height = this.height

DragObject do_temp
string ls_objects
long   ll_row, ll_idx
int    li_cnt, li_loop

dw_1.insertrow(0)


//li_cnt = upperbound(parent.control)
MessageBox("확인",string(li_cnt) )
for ll_row = 1 to 9
	ls_objects = "b_" + string(ll_row + 20)
   dw_1.modify( ls_objects + ".Background.Mode='0'" ) 
	dw_1.object.b_21.text = string(ll_row + 20)
 //dw_1.SetItem(dw_1.getrow(), ls_objects, string(ll_row + 20))
next

dw_1.object.b_21.Background.Color = RGB(102, 153, 0)
dw_1.object.b_22.Background.Color = RGB(191, 191, 191)
dw_1.object.b_23.Background.Color = RGB(128, 128, 128)
dw_1.object.b_24.Background.Color = RGB(196, 189, 151)
dw_1.object.b_25.Background.Color = RGB(83, 141, 213)
dw_1.object.b_26.Background.Color = RGB(218, 150, 148)
dw_1.object.b_27.Background.Color = RGB(216, 228, 188)
dw_1.object.b_28.Background.Color = RGB(177, 160, 199)
dw_1.object.b_29.Background.Color = RGB(146, 205, 220)



//DragObject do_temp
//int li_cnt, li_loop
//
//ii_win_width  = this.width
//ii_win_height = this.height
//ii_win_frame_w = this.width - this.WorkSpaceWidth()
//ii_win_frame_h = this.height - this.WorkSpaceHeight()
//
//li_cnt = upperbound(this.control)
//for li_loop = li_cnt to 1 step -1
//	do_temp = this.control[li_loop]
//	
//	size_ctrl[li_loop].x = do_temp.x 
//	size_ctrl[li_loop].width = do_temp.width 
//	size_ctrl[li_loop].y = do_temp.y
//	size_ctrl[li_loop].height = do_temp.height 
//
//	choose case typeof(do_temp)
//		case commandbutton!
//			commandbutton cb
//			cb = do_temp
//			size_ctrl[li_loop].fontsize = cb.textsize 
//		case singlelineedit!
//			singlelineedit sle
//			sle = do_temp
//			size_ctrl[li_loop].fontsize = sle.textsize 
//		case editmask!
//			editmask em
//			em = do_temp
//			size_ctrl[li_loop].fontsize =	em.textsize 
//		case statictext!
//			statictext st
//			st = do_temp
//			size_ctrl[li_loop].fontsize =	st.textsize 
//		case picturebutton!
//			picturebutton pb
//			pb = do_temp
//			size_ctrl[li_loop].fontsize = pb.textsize 
//		case checkbox!
//			checkbox cbx
//			cbx = do_temp
//			size_ctrl[li_loop].fontsize =	cbx.textsize 
//		case dropdownlistbox!
//			dropdownlistbox ddlb
//			ddlb = do_temp
//			size_ctrl[li_loop].fontsize =	ddlb.textsize 
//		case groupbox!
//			groupbox gb
//			gb = do_temp
//			size_ctrl[li_loop].fontsize =	gb.textsize 
//		case listbox!
//			listbox lb
//			lb = do_temp
//			size_ctrl[li_loop].fontsize =	lb.textsize 
//		case multilineedit!
//			multilineedit mle
//			mle = do_temp
//			size_ctrl[li_loop].fontsize =	mle.textsize 
//		case radiobutton!
//			radiobutton rb
//			rb = do_temp
//			size_ctrl[li_loop].fontsize =	rb.textsize 
//	end choose
//next
//
//return 1
//

end event

on w_dashboard_o.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_dashboard_o.destroy
destroy(this.dw_1)
end on

event timer;//long hWnd, ll_row
//int  li_cnt
//string   ls_userid
//DateTime ld_time
//
//SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;
//
//ii_cnt = ii_cnt + 1
//st_time.text = string(ii_cnt, "#,##0") + "차: " + string(ld_time,"yyyy/mm/dd hh:mm:ss")
//
//if cbx_1.checked = true then	// 전체	
//	ls_userid = '%'
//else
//	ls_userid = gs_userid
//end if
//
//// 자신이 답변해야 하는 것
//SELECT count(*) INTO :li_cnt FROM ProjectMSGDET
// WHERE tlogin = :gs_userid AND del = "N";
//if li_cnt > 0 then
//	dw_2.reset()
//	dw_3.reset()
//	dw_4.reset()
//	ll_row = dw_2.retrieve( ls_userid )	
//	if ll_row > 0 then
//		dw_3.scrolltorow( ll_row )
//		dw_3.triggerevent(clicked!)
//		dw_3.triggerevent(rowfocuschanged!)
//	end if
//end if
//
//
//if This.WindowState = Minimized! then
//	SELECT count(*) INTO :li_cnt FROM ProjectMSGDET
//	 WHERE tlogin = :gs_userid AND del = "N";
//	if li_cnt > 0 then
//		dw_2.retrieve( ls_userid )
//	end if
//	
//	IF This.WindowState = Minimized! and li_cnt > 0 and cbx_3.checked = true then
//		if MessageBox("확인","고객센터 메시지가 " + string(li_cnt) + " 개 있읍니다. ~r~n" + &
//								"메지시를 확인하시겠읍니까?", Exclamation!, OKCancel!, 2) = 1 THEN
//			This.WindowState = Normal!
//		end if
//	end if
//else
//	Timer(120)
//	gu_ext_func.uf_Flash_Window (hWnd, TRUE)
//end if
//
end event

type dw_1 from datawindow within w_dashboard_o
event mousemove pbm_dwnmousemove
integer width = 5385
integer height = 2560
integer taborder = 10
string title = "none"
string dataobject = "d_dashboard_m"
boolean border = false
boolean livescroll = true
end type

event mousemove;///////////////////////////////////////////
// Event ID   : pbm_dwnmousemove
// Event Name : mousemove
///////////////////////////////////////////
// Background Color : if ( getrow() = currentrow(), rgb(255,228,202), rgb(255,255,255) )

string ls_dwoname

if row <> 1 then return
if isnull(dwo.tag) or dwo.tag = "" then return

//this.scrolltorow(row)

ls_dwoname = dwo.tag
ls_dwoname = "b_" + ls_dwoname + ".Pointer = 'HyperLink!'"
this.Modify( ls_dwoname )

end event

event buttonclicked;//
Window oParentWIN

if IsValid(w_o_main) then 
   oParentWIN = w_o_main
elseif IsValid(w_i_main) then 
   oParentWIN = w_i_main
elseif IsValid(w_m_main) then 
   oParentWIN = w_m_main
elseif IsValid(w_all_main) then 
   oParentWIN = w_all_main
end if

///////////////////////////////////////////////////////////////
// 메뉴권한 체크
///////////////////////////////////////////////////////////////
long   ll_cnt
string ls_mo, ls_mi, ls_mm

SELECT COUNT(*) INTO :ll_cnt FROM CODEMST
 WHERE TYPE   IN ('판매관리_입력','판매관리_조회')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid; 
if ll_cnt > 0 then ls_mo = "Y"   // 판매관리

SELECT COUNT(*) INTO :ll_cnt FROM CODEMST
 WHERE TYPE   IN ('구매관리_입력','구매관리_조회','구매관리_창고')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid; 
if ll_cnt > 0 then ls_mi= "Y"      // 구매관리

SELECT COUNT(*) INTO :ll_cnt FROM CODEMST
 WHERE TYPE   IN ('생산관리_입력','생산관리_조회')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid; 
if ll_cnt > 0 then ls_mm = "Y"   // 생산관리
///////////////////////////////////////////////////////////////

// MENU 버튼 배열 7행 * 9열
choose case dwo.tag
   case "11"   // 강건주문관리
   case "12"   // 강건주문확정
      if ls_mo = "Y" then OpenSheet(w_orsalesaleman_r_2,oParentWIN, 5, original!)

   case "21"   // 견적관리
      if ls_mo = "Y" then OpenSheet(w_oeesti_m,         oParentWIN, 5, original!)
   case "22"   // 수주관리
      if ls_mo = "Y" then OpenSheet(w_orsale_m,         oParentWIN, 5, original!)
   case "23"   // 수주확정                  
      if ls_mo = "Y" then OpenSheet(w_orsalecon_m,      oParentWIN, 5, original!)
   case "24"   // 생산확정                                                      
      if ls_mm = "Y" then OpenSheet(w_mpsalecon_m,      oParentWIN, 5, original!)
   case "25"   // 자동생산계획 
      if ls_mm = "Y" then OpenSheet(w_mpautosale1_m,    oParentWIN, 5, original!)
   case "26"   // 생산계획 조정,확정(주문)
      if ls_mm = "Y" then OpenSheet(w_mpplan_m,         oParentWIN, 5, original!)
   case "27"   // 작업지시 
      if ls_mm = "Y" then OpenSheet(w_mpsfcrel_m,       oParentWIN, 5, original!)
   case "28"   // 작업장 처리
		MessageBox("확인","성형반 현장에서 실적 자동처리, 유압/절곡/도장반 수작업 처리", Exclamation!)
      if ls_mm = "Y" then OpenSheet(w_mpsfcday_r,       oParentWIN, 5, original!)
   case "29"   // 제품, 상품입고 
      OpenSheet(w_whitemret_w,      oParentWIN, 5, original!)

   case "31"   // 발주관리
      if ls_mi = "Y" then OpenSheet(w_ippurchasenew_m,  oParentWIN, 5, original!)
   case "32"   // 입고관리
      if ls_mi = "Y" then OpenSheet(w_ioin_m,           oParentWIN, 5, original!)
   case "33"   // 스리팅계획
      if ls_mm = "Y" then OpenSheet(w_mpsliting_m,      oParentWIN, 5, original!)
   case "34"   // 스리팅작업지시
      if ls_mm = "Y" then OpenSheet(w_mpslitcon_m,      oParentWIN, 5, original!)
   case "35"   // 사내, 외주
   case "36"   // 스리팅작업
		MessageBox("확인","스리타반 현장에서 실적 자동처리", Exclamation!)
   case "37"   // 코일이동
		MessageBox("확인","코일이동 현장에서 실적 자동처리", Exclamation!)
   case "38"   // 
   case "39"   // 매입 년마감
      if ls_mm = "Y" then OpenSheet(w_apclose_m,        oParentWIN, 5, original!)
   
   case "41"   // 지불관리
   case "42"   // 외주가공입고
      if ls_mi = "Y" then OpenSheet(w_ioinslting_m,     oParentWIN, 5, original!)
   case "43"   // 발주입고 수정및삭제
      if ls_mi = "Y" then OpenSheet(w_apinspupdate_m,   oParentWIN, 5, original!)
   case "44"   // 매입관리
      if ls_mi = "Y" then OpenSheet(w_apoi_m,           oParentWIN, 5, original!)
   case "45"   // 매입계산서 미발행CHECK
      if ls_mi = "Y" then OpenSheet(w_apoiinvcheck_r,   oParentWIN, 5, original!)
   case "46"   // 매입마감
      if ls_mi = "Y" then OpenSheet(w_apoiclose_m,      oParentWIN, 5, original!)
   case "47"   // 지불현황
		MessageBox("확인","협의 후 처리 예정", Exclamation!)	// w_apoiinv_r
   case "48"   // 매입전표 작성
		MessageBox("확인","협의 후 처리 예정", Exclamation!)
                                    
   case "51"   // 출고요청
      if ls_mo = "Y" then OpenSheet(w_oiissuereq_m,     oParentWIN, 5, original!)
   case "52"   // 출고관리
      if ls_mo = "Y" then OpenSheet(w_oido_m,           oParentWIN, 5, original!)
   case "53"   // 운반비마감
      if ls_mo = "Y" then OpenSheet(w_ocshipclose_m,    oParentWIN, 5, original!)
   case "54"   // 매출이관 신청
      if ls_mo = "Y" then OpenSheet(w_oidotrans_m,      oParentWIN, 5, original!)
   case "55"   // 매출이월
      if ls_mo = "Y" then OpenSheet(w_oidoupdate_m,     oParentWIN, 5, original!)
   
   case "56"   // 매출계산서 미발행CHECK
      if ls_mo = "Y" then OpenSheet(w_osaroicheck_r,    oParentWIN, 5, original!)
   case "57"   // 매출마감
      if ls_mo = "Y" then OpenSheet(w_osaroiclose_m,    oParentWIN, 5, original!)
   case "58"   // 매출 년마감
      if ls_mo = "Y" then OpenSheet(w_occlose_m,        oParentWIN, 5, original!)

   case "61"   // 수금관리
      if ls_mo = "Y" then OpenSheet(w_ocaroivc_m,       oParentWIN, 5, original!)
   case "62"   // 수금마감
      if ls_mo = "Y" then OpenSheet(w_ocaroivcclose_m,  oParentWIN, 5, original!)
   case "63"   // 세금계산서 발행
      if ls_mo = "Y" then OpenSheet(w_osaroi_new_m,     oParentWIN, 5, original!)
   case "64"   // 세금계산서 전송
      if ls_mo = "Y" then OpenSheet(w_osaroi_esero_m,   oParentWIN, 5, original!)
   case "65"   // 매출전표 작성
      if ls_mo = "Y" then OpenSheet(w_osaroi_duzon_r,   oParentWIN, 5, original!)
   case "66"   // 여신현황
      if ls_mo = "Y" then OpenSheet(w_ocsaleageing_r,   oParentWIN, 5, original!)
   case "67"   // 실적보고
      if ls_mo = "Y" then OpenSheet(w_osteamaroi_r,     oParentWIN, 5, original!)
   case "69"   // 매월10일 자동마감
      if GF_PERMISSION("시스템_자동마감(월)", gs_userid) = "Y" then
         OpenSheet(w_magam_m,          oParentWIN, 5, original!)
      else
         MessageBox("확인", "시스템_자동마감(월) 권한이 존재하지 않습니다.",StopSign!)
      end if
      
   case "71"   // 요청관리, 반품관리
      if ls_mo = "Y" then OpenSheet(w_oigiask_m,        oParentWIN, 5, original!)
      if ls_mo = "Y" then OpenSheet(w_oiretreq_m,       oParentWIN, 5, original!)
   case "72"   // 가입고삭제
      if ls_mi = "Y" then OpenSheet(w_iointemp_m,       oParentWIN, 5, original!)
   case "73"   // 담당자별실사관리
      if ls_mi = "Y" then OpenSheet(w_irusersilsa_m,    oParentWIN, 5, original!)
   case "74"   // 실사차이보고서
      if ls_mi = "Y" then OpenSheet(w_iractio_r,        oParentWIN, 5, original!)
   case "75"   // 물품대체관리
      if ls_mi = "Y" then OpenSheet(w_ioalter_m,        oParentWIN, 5, original!)
   case "76"   // 
   case "77"   // 실사마감(재고조정)
      if ls_mi = "Y" then OpenSheet(w_iractio_m,        oParentWIN, 5, original!)
end choose


end event

