$PBExportHeader$w_ocshipreturn_m.srw
$PBExportComments$인수증 관리
forward
global type w_ocshipreturn_m from w_inheritance
end type
type em_1 from editmask within w_ocshipreturn_m
end type
type em_2 from editmask within w_ocshipreturn_m
end type
type dw_area from datawindow within w_ocshipreturn_m
end type
type st_1 from statictext within w_ocshipreturn_m
end type
type cb_1 from commandbutton within w_ocshipreturn_m
end type
type st_4 from statictext within w_ocshipreturn_m
end type
type pb_1 from picturebutton within w_ocshipreturn_m
end type
type st_2 from statictext within w_ocshipreturn_m
end type
type st_5 from statictext within w_ocshipreturn_m
end type
type st_3 from statictext within w_ocshipreturn_m
end type
type ddlb_fld from dropdownlistbox within w_ocshipreturn_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ocshipreturn_m
end type
type st_6 from statictext within w_ocshipreturn_m
end type
type sle_value from singlelineedit within w_ocshipreturn_m
end type
type cb_2 from commandbutton within w_ocshipreturn_m
end type
type cb_3 from commandbutton within w_ocshipreturn_m
end type
type cb_4 from commandbutton within w_ocshipreturn_m
end type
type cb_5 from commandbutton within w_ocshipreturn_m
end type
type st_7 from statictext within w_ocshipreturn_m
end type
type dw_3 from datawindow within w_ocshipreturn_m
end type
type em_barcode from editmask within w_ocshipreturn_m
end type
type cb_paste from commandbutton within w_ocshipreturn_m
end type
type cb_scan from commandbutton within w_ocshipreturn_m
end type
type cbx_auto from checkbox within w_ocshipreturn_m
end type
type em_rate from editmask within w_ocshipreturn_m
end type
type dw_locno from datawindow within w_ocshipreturn_m
end type
type cb_6 from commandbutton within w_ocshipreturn_m
end type
type cbx_paste from checkbox within w_ocshipreturn_m
end type
type dw_5 from datawindow within w_ocshipreturn_m
end type
type dw_driver from datawindow within w_ocshipreturn_m
end type
type st_8 from statictext within w_ocshipreturn_m
end type
type st_vertical from u_splitbar_vertical within w_ocshipreturn_m
end type
type ddlb_op from dropdownlistbox within w_ocshipreturn_m
end type
end forward

global type w_ocshipreturn_m from w_inheritance
integer width = 4645
integer height = 2364
string title = "인수증 관리(w_ocshipreturn_m)"
em_1 em_1
em_2 em_2
dw_area dw_area
st_1 st_1
cb_1 cb_1
st_4 st_4
pb_1 pb_1
st_2 st_2
st_5 st_5
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
st_7 st_7
dw_3 dw_3
em_barcode em_barcode
cb_paste cb_paste
cb_scan cb_scan
cbx_auto cbx_auto
em_rate em_rate
dw_locno dw_locno
cb_6 cb_6
cbx_paste cbx_paste
dw_5 dw_5
dw_driver dw_driver
st_8 st_8
st_vertical st_vertical
ddlb_op ddlb_op
end type
global w_ocshipreturn_m w_ocshipreturn_m

type variables
st_print i_print
int    ii_sel = 1
string is_con ="O", is_car = "", is_dw

datawindowchild idwc_area, idwc_locno, idwc_car

end variables

on w_ocshipreturn_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_1=create st_1
this.cb_1=create cb_1
this.st_4=create st_4
this.pb_1=create pb_1
this.st_2=create st_2
this.st_5=create st_5
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_7=create st_7
this.dw_3=create dw_3
this.em_barcode=create em_barcode
this.cb_paste=create cb_paste
this.cb_scan=create cb_scan
this.cbx_auto=create cbx_auto
this.em_rate=create em_rate
this.dw_locno=create dw_locno
this.cb_6=create cb_6
this.cbx_paste=create cbx_paste
this.dw_5=create dw_5
this.dw_driver=create dw_driver
this.st_8=create st_8
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_4
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.dw_3
this.Control[iCurrent+21]=this.em_barcode
this.Control[iCurrent+22]=this.cb_paste
this.Control[iCurrent+23]=this.cb_scan
this.Control[iCurrent+24]=this.cbx_auto
this.Control[iCurrent+25]=this.em_rate
this.Control[iCurrent+26]=this.dw_locno
this.Control[iCurrent+27]=this.cb_6
this.Control[iCurrent+28]=this.cbx_paste
this.Control[iCurrent+29]=this.dw_5
this.Control[iCurrent+30]=this.dw_driver
this.Control[iCurrent+31]=this.st_8
this.Control[iCurrent+32]=this.st_vertical
this.Control[iCurrent+33]=this.ddlb_op
end on

on w_ocshipreturn_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_7)
destroy(this.dw_3)
destroy(this.em_barcode)
destroy(this.cb_paste)
destroy(this.cb_scan)
destroy(this.cbx_auto)
destroy(this.em_rate)
destroy(this.dw_locno)
destroy(this.cb_6)
destroy(this.cbx_paste)
destroy(this.dw_5)
destroy(this.dw_driver)
destroy(this.st_8)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_3)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

string ls_area, ls_areachk, ls_locno, ls_locnm, ls_filter
long   ll_cnt

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_5.visible = false
dw_1.visible = false

cb_paste.enabled = false
cb_scan.enabled  = false

if day(today()) > 10 then
	em_1.text = string(wf_today(), "yyyy/mm/01")
	em_2.text = string(wf_today(), "yyyy/mm/dd")
else
	em_1.text = string(RelativeDate(today(), - day(today()) ),"yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - day(today()) ),"yyyy/mm/dd")
end if

em_rate.text    = "0.0%"
em_barcode.text = ""


// 바코드스캐닝
dw_3.settransobject(sqlca)

/////////////////////////////////
// 차량NO
/////////////////////////////////
dw_driver.SetTransObject(SQLCA)
dw_driver.insertrow(0)

dw_driver.getchild("driver",idwc_car)
idwc_car.settransobject(sqlca)
idwc_car.insertrow(1)
idwc_car.setitem(1,"driver","전체")
idwc_car.setitem(1,"name","전체")
idwc_car.accepttext()

dw_driver.object.driver[1] = "전체"
dw_driver.setfocus()

/////////////////////////////////
// 사업장
/////////////////////////////////
ls_area = gs_area

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area",idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,"area_no","%")
idwc_area.setitem(1,"area_name","전체")
idwc_area.accepttext()
dw_area.object.area[1] = ls_area

/////////////////////////////////
// 저장소 (다중저장소)
/////////////////////////////////
dw_locno.SetTransObject(sqlca)		
dw_locno.insertrow(0)  

dw_locno.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)
idwc_locno.insertrow(1)
idwc_locno.setitem(1, "loc_no", "%")
idwc_locno.setitem(1, "loc_name", "전체저장소")
idwc_locno.setitem(1, "area_no", "%")
idwc_locno.accepttext()
/////////////////////////////////

// 다중저장소
SELECT count(loc_no) INTO :ll_cnt
  FROM location
 WHERE loc_manager is not null
   AND tel_no      is not null
   AND use_yn       = 'Y'
   AND area_no      = :ls_area;
if ll_cnt = 1 then
	SELECT def_loc  INTO :ls_locno FROM area WHERE area_no = :ls_area;
	dw_locno.enabled = false
	dw_locno.object.loc_no.background.color = 67108864
else
	ls_locno = "%"
	dw_locno.enabled = true
	dw_locno.object.loc_no.background.color = rgb(255, 255, 255)
end if

// 기본값을 변경	
dw_locno.object.loc_no[1] = ls_locno		

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_3.height = newheight - dw_3.y - gb_2.x

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = dw_3.height

dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x

dw_5.x      = dw_3.x
dw_5.y      = dw_3.y
dw_5.width  = dw_3.width
dw_5.height = dw_3.height


end event

type pb_save from w_inheritance`pb_save within w_ocshipreturn_m
event ue_print pbm_custom01
integer x = 3337
integer y = 64
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;// 저장
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

wf_update1(dw_3,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ocshipreturn_m
integer y = 184
integer width = 91
integer height = 76
integer taborder = 10
string title = "d_ocshipclose_r2"
string dataobject = "d_ocshipclose_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ocshipreturn_m
integer x = 37
integer y = 28
integer width = 969
integer height = 136
string text = "인수증 관리"
end type

type st_tips from w_inheritance`st_tips within w_ocshipreturn_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipreturn_m
boolean visible = false
integer x = 1659
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipreturn_m
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 40
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_ocshipreturn_m
integer x = 3534
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipreturn_m
integer x = 3145
integer y = 64
integer taborder = 140
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
string	  ls_sdate, ls_edate, ls_prtflag

if em_1.text = "" then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	RETURN 1
elseif em_2.text = "" then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	RETURN 1
elseif em_1.text > em_2.text then
	MessageBox("확인","조회기간을 잘못 입력하였습니다!",information!)
	RETURN 1
end if

ls_sdate = em_1.text
ls_edate = em_2.text
is_con   = "%"

if dw_1.retrieve(LeftA(dw_area.object.area[1],1), ls_sdate, ls_edate, is_con, ls_prtflag) < 1 then
	MessageBox("확인","내역이 없습니다.")
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_desc  = " 이 프로그램은 운반비 청구내역서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90"

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipreturn_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipreturn_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipreturn_m
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 180
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipreturn_m
integer x = 2752
integer y = 64
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string  ls_area, ls_locno, ls_sdate, ls_edate, ls_driver
long    ll_row, ll_cnt
decimal ld_rate

GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

if GF_Permission("인수증_관리",gs_userid) = "Y" then
else
	MessageBox("확인","인수증_관리 권한이 존재하지 않습니다.",information!)
	RETURN
end if

if em_1.text = "" then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","조회기간을 잘못 입력하였습니다!",information!)
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

// 저장소
dw_locno.accepttext()
ls_locno = trim(dw_locno.object.loc_no[1])

// 사업장
dw_area.accepttext()
ls_area  = LeftA(trim(dw_area.object.area[1]),1)

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 차량NO
dw_driver.accepttext()
ls_driver = trim(dw_driver.object.driver[1])
if ls_driver = "전체" then ls_driver = "%"

debugbreak()

// 스캐닝
dw_3.reset()		// 스캐닝 초기화

// 출고송장
dw_2.retrieve( ls_area, ls_locno, ls_sdate, ls_edate, ls_driver )
if dw_2.rowcount() < 1 then
	MessageBox("확인","내역이 없습니다.")
else
	if isnull(ls_driver) OR ls_driver = "%" then
		// 전체
	else
		dw_2.setfilter( " driver = '" + ls_driver + "' " )
		dw_2.filter()
	end if
	
	ll_cnt  = dw_2.object.tcnt[1]
	ld_rate = Truncate(ll_cnt / dw_2.rowcount() * 100, 1)
	
	em_rate.text = string( ld_rate,"#,##0.0" ) + "%"	
end if

cb_scan.enabled = true

em_barcode.text = ""
em_barcode.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_ocshipreturn_m
integer x = 1070
integer y = 8
integer width = 1646
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipreturn_m
integer y = 244
integer width = 4535
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipreturn_m
integer x = 2729
integer y = 8
integer width = 1019
integer height = 232
integer taborder = 60
end type

type dw_2 from w_inheritance`dw_2 within w_ocshipreturn_m
integer x = 1531
integer y = 544
integer width = 3031
integer height = 1680
integer taborder = 30
string dataobject = "d_ocshipreturn_s"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::rbuttondown;call super::rbuttondown;////
//if row < 1 then return
//
//this.scrolltorow(row)
//m_dynamic lm_Addmenu
//string ls_chk, ls_text, ls_value
//int    li_end, li_find, li_int
//
//DESTROY m_dynamic
//
//choose case dwo.name
//	case "do_no"
//		lm_Addmenu = CREATE m_dynamic
//		ls_text    = trim(this.object.do_do_no[row])
//		if ls_text = '' or isnull(ls_text) then return
//		
//		ls_chk  = 'Y'
//		li_find = 1
//		li_int  = 0
////		Do While ls_chk = 'Y'
////			li_end = pos(ls_text, ",", li_find)
////			if li_end = 0 or isnull(li_end) then exit
////			
//			ls_value = ls_text
//			if trim(ls_value) = '' or isnull(ls_value) or (len(trim(ls_value)) <> 14) then
//			else			
//				li_int = li_int + 1
//				lm_Addmenu.item[li_int].Text = ls_value
//				lm_Addmenu.item[li_int].Tag = string(li_int)
//				lm_Addmenu.item[li_int].visible = true
//			end if
////		Loop
//		
//		lm_Addmenu.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())
//		if lm_Addmenu.tag = "" then return
//		
//		ls_value = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
//		OpenSheet(w_oidoupdate_m,  w_o_main, 5, original!)	//	Normal!
//		w_oidoupdate_m.setredraw(false)
//		w_oidoupdate_m.em_3.text = left(ls_value,10) + right(ls_value,3)	// 출고번호 
//		w_oidoupdate_m.cb_1.postevent(clicked!)				// 조회
//		w_oidoupdate_m.setredraw(true)
//
//	case else
//		lm_Addmenu = CREATE m_dynamic
//		ls_text    = trim(this.object.sale_no[row])
//		if ls_text = '' or isnull(ls_text) then return
//		
//		ls_chk  = 'Y'
//		li_find = 1
//		li_int  = 0
//		Do While ls_chk = 'Y'	// 다중 수주번호 메뉴에 등록하기
//			li_end = pos(ls_text, ",", li_find)
//			if li_end = 0 or isnull(li_end) then exit
//			
//			ls_value = mid(ls_text, li_find, 14)
//			if trim(ls_value) = '' or isnull(ls_value) then exit
//			
//			li_int = li_int + 1
//			lm_Addmenu.item[li_int].Text = ls_value
//			lm_Addmenu.item[li_int].Tag = string(li_int)
//			lm_Addmenu.item[li_int].visible = true
//			li_find = li_end + 2
//		Loop
//		
//		lm_Addmenu.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())
//		if lm_Addmenu.tag = "" then return
//		
//		ls_value = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
//		OpenSheet(w_orsale_m,  w_o_main, 5, original!)
//		w_orsale_m.setredraw(false)
//		w_orsale_m.em_3.text = left(ls_value,10) 
//		w_orsale_m.em_4.text = string(integer(right(ls_value,3)))
//		w_orsale_m.pb_cancel.postevent(clicked!)
//		w_orsale_m.setredraw(true)
//end choose
//
end event

event dw_2::doubleclicked;call super::doubleclicked;//
gs_where2 lst_str 
string ls_text, ls_chk, ls_sale
int    li_find, li_int, li_end

if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)

ls_text = trim(this.object.sale_no[row])
if ls_text = "" or isnull(ls_text) then RETURN

ls_chk = "Y" ; li_find = 1 ; li_int = 0

do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 OR isnull(li_end) then EXIT
	
	ls_sale = MidA(ls_text, li_find, 14)
	if trim(ls_sale) = "" OR isnull(ls_sale) then EXIT
	
	li_int = li_int + 1
	
	lst_str.str1[li_int] = ls_sale
	lst_str.str2[li_int] = "1"
	li_find = li_end + 2
loop

OpenWithParm(w_whsaleall_w, lst_str)

end event

event dw_2::clicked;call super::clicked;//
is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_2::itemchanged;call super::itemchanged;//long    ll_cnt
//decimal ld_rate
//
//debugbreak()
//
//this.accepttext()
//
//ll_cnt  = dw_2.object.tcnt[1]
//ld_rate = Truncate(ll_cnt / dw_2.rowcount() * 100, 1)
//
//em_rate.text = string( ld_rate ) + "%"
//
end event

type em_1 from editmask within w_ocshipreturn_m
integer x = 1943
integer y = 132
integer width = 366
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;////
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	if this.text > em_2.text then em_2.text = this.text
end if

end event

event modified;//
if this.text > em_2.text then em_2.text = this.text

end event

type em_2 from editmask within w_ocshipreturn_m
integer x = 2322
integer y = 132
integer width = 366
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_ocshipreturn_m
integer x = 1312
integer y = 52
integer width = 521
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 사업장
long  ll_row, ll_cnt

////////////////////////////////////////////////////////////
//// 기본사업장에 다수의 저장소 존재시(기본저장소)			
////////////////////////////////////////////////////////////
string ls_area, ls_areachk, ls_locno, ls_locnm, ls_filter

dw_2.reset()
dw_area.accepttext()

ls_area = trim(data)
if ls_area = "H0001" OR ls_area = "%" then
	dw_locno.enabled = true
	dw_locno.object.loc_no.background.color = rgb(255, 255, 255)
else
	dw_locno.enabled = false
	dw_locno.object.loc_no.background.color = 67108864
end if

// 사업장 저장소
if ls_area = "%" then
	ls_filter = ""
else
	ls_filter = "area_no = '" + ls_area + "' OR area_no = '%'"
end if

dw_locno.getchild("loc_no", idwc_locno)
idwc_locno.setfilter( ls_filter )
idwc_locno.filter()
////////////////////////////////////////////////////////////

// 사업장 다중저장소
SELECT count(loc_no) INTO :ll_cnt
  FROM location
 WHERE loc_manager is not null
   AND tel_no      is not null
   AND use_yn       = 'Y'
   AND area_no      = :ls_area;
if ll_cnt = 1 then
	SELECT def_loc  INTO :ls_locno FROM area WHERE area_no = :ls_area;
else
	ls_locno = "%"
end if

// 저장소명
if ls_locno = "%" then
	ls_locnm = "전체저장소"
else
	SELECT loc_name  INTO :ls_locnm FROM location WHERE loc_no = :ls_locno;
end if

dw_locno.object.loc_no[1] = ls_locno		// 기본값을 변경	
////////////////////////////////////////////////////////////	

end event

type st_1 from statictext within w_ocshipreturn_m
integer x = 3543
integer y = 428
integer width = 1024
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "*더블클릭=>수주조회"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type cb_1 from commandbutton within w_ocshipreturn_m
integer x = 3808
integer y = 284
integer width = 736
integer height = 100
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 수정/삭제"
end type

event clicked;string   ls_value
datetime ldt_shipdate
long     ll_row

if dw_2.rowcount() < 1 then RETURN

ll_row   = dw_2.getrow()
ls_value = dw_2.object.do_no[ll_row]
ldt_shipdate = dw_2.object.ship_date[ll_row]

if GF_PERMISSION("거래명세서_수정/삭제", gs_userid) = "Y" then	
	if IsValid(w_o_main) then
		OpenSheet(w_oidoupdate_m, w_o_main, 6, original!)
	else
		OpenSheet(w_oidoupdate_m, w_all_main, 6, original!)
	end if
	
	if LenA(ls_value) = 14 then		// 거래명세서 작성
		w_oidoupdate_m.setredraw(false)
		w_oidoupdate_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oidoupdate_m.cb_1.postevent(clicked!)				// 조회
		w_oidoupdate_m.setredraw(true)
	else									// 물품이동
		w_oigiaskcancel_m.setredraw(false)
		w_oigiaskcancel_m.em_1.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiaskcancel_m.pb_retrieve.postevent(clicked!)				// 조회
		w_oigiaskcancel_m.setredraw(true)
	end if
else
	if IsValid(w_o_main) then
		OpenSheet(w_oigiprint_m, w_o_main, 6, original!)
	else
		OpenSheet(w_oigiprint_m, w_all_main, 6, original!)
	end if
	
	if LenA(ls_value) = 14 then		// 거래명세서 작성
		w_oigiprint_m.setredraw(false)
		w_oigiprint_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiprint_m.pb_compute.postevent(clicked!)				// 조회
		w_oigiprint_m.setredraw(true)
	else									// 물품이동
		w_oigiaskcancel_m.setredraw(false)
		w_oigiaskcancel_m.em_1.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiaskcancel_m.pb_retrieve.postevent(clicked!)				// 조회
		w_oigiaskcancel_m.setredraw(true)
	end if
end if

end event

type st_4 from statictext within w_ocshipreturn_m
integer x = 3543
integer y = 492
integer width = 1024
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "출고번호 컬럼 =>거래명세서 수정/삭제"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocshipreturn_m
integer x = 2953
integer y = 64
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
datawindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw = dw_2
	case "dw_3"
		arg_dw = dw_3
end choose

if arg_dw.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
		                        "엑셀 (*.XLS), *.XLS,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		end if
	end if
end if	

end event

type st_2 from statictext within w_ocshipreturn_m
integer x = 1102
integer y = 52
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ocshipreturn_m
integer x = 1943
integer y = 56
integer width = 745
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "운송일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ocshipreturn_m
integer x = 896
integer y = 304
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_ocshipreturn_m
integer x = 1083
integer y = 288
integer width = 448
integer height = 632
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_ocshipreturn_m
integer x = 1125
integer y = 300
integer width = 311
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_6 from statictext within w_ocshipreturn_m
integer x = 1554
integer y = 304
integer width = 165
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_ocshipreturn_m
integer x = 2039
integer y = 296
integer width = 466
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_ocshipreturn_m
integer x = 2519
integer y = 296
integer width = 160
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_ocshipreturn_m
integer x = 2683
integer y = 296
integer width = 160
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_ocshipreturn_m
integer x = 2848
integer y = 296
integer width = 160
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ocshipreturn_m
integer x = 3013
integer y = 296
integer width = 160
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_7 from statictext within w_ocshipreturn_m
integer x = 32
integer y = 428
integer width = 878
integer height = 108
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = " 스캐닝"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_ocshipreturn_m
integer x = 32
integer y = 544
integer width = 1445
integer height = 1680
integer taborder = 40
boolean bringtotop = true
string title = "d_dobarcode_paste"
string dataobject = "d_dobarcode"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_barcode from editmask within w_ocshipreturn_m
integer x = 914
integer y = 428
integer width = 1056
integer height = 108
integer taborder = 130
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 65535
string text = "SD20150319-001"
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

event modified;// 스캐닝
string  ls_area, ls_dono
long    ll_row, ll_dw2cnt, ll_cnt
decimal ld_rate

ls_dono = trim(this.text)
if isnull(ls_dono) OR ls_dono = "" then
	this.setfocus()
	RETURN
end if

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ll_row = dw_3.insertrow(0)

dw_3.object.area_no[ll_row]  = ls_area
dw_3.object.do_no[ll_row]    = ls_dono
dw_3.object.user_id[ll_row]  = gs_userid
dw_3.object.sys_date[ll_row] = GF_TODAY()
dw_3.object.scan_yn[ll_row]  = "N"

// 자동검사
if cbx_auto.checked = true then
	if dw_2.rowcount() > 0 then
		ll_dw2cnt = dw_2.find( "do_no = '" + ls_dono + "' ", 1, dw_2.rowcount() )
		if ll_dw2cnt > 0 then
			dw_3.object.scan_yn[ll_row] = "Y"
			dw_2.object.chk[ll_dw2cnt]  = "Y"
		end if
		
		ll_cnt  = dw_2.object.tcnt[1]
      ld_rate = Truncate(ll_cnt / dw_2.rowcount() * 100, 1)
		
      em_rate.text = string( ld_rate,"#,##0.0" ) + "%"
	end if
end if

this.text = ""
this.setfocus()

/*
long   ll_find, ll_end
string ll_list

// The end value is one greater than the row count
ll_end  = dw_2.RowCount() + 1
ll_find = 1
ll_find = dw_2.Find("Pos(last_name,'a') > 0", ll_find, ll_end)

DO WHILE ll_find > 0
	//collect names
	ll_list = ll_list + '~r' + dw_2.GetItemString(ll_find, 'last_name')
	
	// Search again
	ll_find++
	ll_find = dw_2.Find("Pos(last_name,'a') > 0", ll_find, ll_end )
LOOP
*/

end event

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 2, 0 )		// 2번째 인수값 1=KOR, 2=ENG

//this.SelectText(1, Len(this.Text))

end event

type cb_paste from commandbutton within w_ocshipreturn_m
integer x = 2418
integer y = 428
integer width = 539
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "가져오기"
end type

event clicked;// 가져오기
string	ls_itemno, ls_itemnm, ls_pathname
long		ll_row, ll_rc
integer  iRet

ll_rc = dw_5.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then
	// Long. Returns the number of rows that were imported 
	//       if it succeeds and returns the following values if an error occurs:
	//  0  End of file, too many rows
	// -2  Not enough columns
	// -3  Invalid argument
	// -4  Invalid input
	
	ClipBoard("")
	
	if MessageBox("확인","가져오기 완료~n~n스캐닝 검사를 실행하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 then
		cb_scan.triggerevent( clicked! )
	end if
end if
cbx_paste.checked = false
cbx_paste.triggerevent( clicked! )

end event

type cb_scan from commandbutton within w_ocshipreturn_m
integer x = 2967
integer y = 428
integer width = 539
integer height = 108
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "스캐닝 검사"
end type

event clicked;// 스캐닝 검사
string  ls_dono
long    ll_row, ll_dw2cnt, ll_dw3cnt, ll_cnt
decimal ld_rate

for ll_row = 1 to dw_3.rowcount()
	ls_dono = dw_3.object.do_no[ll_row]
	
	ll_dw2cnt = dw_2.find( "do_no = '" + ls_dono + "' ", 1, dw_2.rowcount() )
	if ll_dw2cnt > 0 then
		dw_3.object.scan_yn[ll_row] = "Y"
		dw_2.object.chk[ll_dw2cnt]  = "Y"
	end if
next

ll_cnt  = dw_2.object.tcnt[1]
ld_rate = Truncate(ll_cnt / dw_2.rowcount() * 100, 1)

em_rate.text = string( ld_rate,"#,##0.0" ) + "%"

MessageBox("확인","스캐닝검사 완료")
end event

type cbx_auto from checkbox within w_ocshipreturn_m
integer x = 489
integer y = 448
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 15780518
string text = "자동검사"
boolean checked = true
end type

event clicked;// 자동검사
if this.checked = true then
	if dw_2.rowcount() > 0 then
	else
		this.checked = false
		MessageBox("확인","출고데이터를 먼저 조회하시기 바랍니다.")
		RETURN
	end if
end if

em_barcode.text = ""
em_barcode.setfocus()


end event

type em_rate from editmask within w_ocshipreturn_m
integer x = 1979
integer y = 428
integer width = 425
integer height = 108
integer taborder = 120
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 0
string text = "0.0%"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type dw_locno from datawindow within w_ocshipreturn_m
integer x = 1102
integer y = 128
integer width = 841
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_ocshipreturn_m
integer x = 3209
integer y = 284
integer width = 590
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 조회"
end type

event clicked;// 거래명세서 조회
string   ls_value
datetime ldt_shipdate
long     ll_row

if dw_2.rowcount() < 1 then RETURN

ll_row   = dw_2.getrow()
ls_value = dw_2.object.do_no[ll_row]
ldt_shipdate = dw_2.object.ship_date[ll_row]

if IsValid(w_o_main) then
	OpenSheet(w_oigiprint_m, w_o_main, 6, original!)
else
	OpenSheet(w_oigiprint_m, w_all_main, 6, original!)
end if

if LenA(ls_value) = 14 then		// 거래명세서 조회
	w_oigiprint_m.setredraw(false)
	w_oigiprint_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
	w_oigiprint_m.pb_compute.postevent(clicked!)				// 조회
	w_oigiprint_m.setredraw(true)
else									// 물품이동
	w_oigiaskcancel_m.setredraw(false)
	w_oigiaskcancel_m.em_1.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
	w_oigiaskcancel_m.pb_retrieve.postevent(clicked!)				// 조회
	w_oigiaskcancel_m.setredraw(true)
end if

end event

type cbx_paste from checkbox within w_ocshipreturn_m
integer x = 2455
integer y = 448
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;// 일괄가져오기
string ls_area, ls_dono
long   ll_row, ll_dw5cnt

dw_area.accepttext()
ls_area = dw_area.object.area[1]

if this.checked = true then
	dw_5.reset()
	dw_5.visible = true
	cb_paste.enabled = true
else
	for ll_dw5cnt = 1 to dw_5.rowcount()
		ls_dono = trim(dw_5.object.do_no[ll_dw5cnt])

		if isnull(ls_dono) OR ls_dono = "" then
		else
			ll_row = dw_3.insertrow(0)
			
			dw_3.object.area_no[ll_row]  = ls_area
			dw_3.object.do_no[ll_row]    = ls_dono
			dw_3.object.user_id[ll_row]  = gs_userid
			dw_3.object.sys_date[ll_row] = GF_TODAY()
			dw_3.object.scan_yn[ll_row]  = "N"
		end if
	next
	
	dw_5.visible = false
	cb_paste.enabled = false
end if

end event

type dw_5 from datawindow within w_ocshipreturn_m
integer x = 165
integer y = 184
integer width = 91
integer height = 76
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_dobarcode_paste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_driver from datawindow within w_ocshipreturn_m
integer x = 315
integer y = 292
integer width = 535
integer height = 88
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whdocar_s"
boolean border = false
end type

event itemchanged;//
string  ls_driver
long    ll_cnt
decimal ld_rate

this.accepttext()

ls_driver = trim(this.object.driver[1])
if isnull(ls_driver) OR ls_driver = "전체" then
	dw_2.setfilter( "" )
else
	dw_2.setfilter( " driver = '" + ls_driver + "' " )
end if
dw_2.filter()

if dw_2.rowcount() > 0 then
	ll_cnt  = dw_2.object.tcnt[1]
	ld_rate = Truncate(ll_cnt / dw_2.rowcount() * 100, 1)
else
	ld_rate = 0.0
end if
em_rate.text = string( ld_rate ) + "%"	

end event

event getfocus;// DataWinodw AutoSelection = true 대체
this.SelectText(1, LenA(GetText()))		// 선택

end event

type st_8 from statictext within w_ocshipreturn_m
integer x = 73
integer y = 308
integer width = 238
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "차량NO:"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_ocshipreturn_m
integer x = 1495
integer y = 544
integer height = 1680
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_ocshipreturn_m
integer x = 1728
integer y = 292
integer width = 302
integer height = 500
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

