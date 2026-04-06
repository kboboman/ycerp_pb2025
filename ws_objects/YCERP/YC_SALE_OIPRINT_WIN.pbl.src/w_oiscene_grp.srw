$PBExportHeader$w_oiscene_grp.srw
$PBExportComments$프로젝트별 자재투입현황
forward
global type w_oiscene_grp from w_inheritance
end type
type gb_5 from groupbox within w_oiscene_grp
end type
type em_1 from editmask within w_oiscene_grp
end type
type em_2 from editmask within w_oiscene_grp
end type
type dw_3 from datawindow within w_oiscene_grp
end type
type dw_area from datawindow within w_oiscene_grp
end type
type pb_1 from picturebutton within w_oiscene_grp
end type
type cbx_price from checkbox within w_oiscene_grp
end type
type st_3 from statictext within w_oiscene_grp
end type
type ddlb_fld from dropdownlistbox within w_oiscene_grp
end type
type ddlb_dwtitles from dropdownlistbox within w_oiscene_grp
end type
type st_4 from statictext within w_oiscene_grp
end type
type sle_value from singlelineedit within w_oiscene_grp
end type
type cb_1 from commandbutton within w_oiscene_grp
end type
type cb_2 from commandbutton within w_oiscene_grp
end type
type cb_3 from commandbutton within w_oiscene_grp
end type
type cb_5 from commandbutton within w_oiscene_grp
end type
type st_2 from statictext within w_oiscene_grp
end type
type st_1 from statictext within w_oiscene_grp
end type
type st_7 from statictext within w_oiscene_grp
end type
type cbx_team from checkbox within w_oiscene_grp
end type
type dw_sales from datawindow within w_oiscene_grp
end type
type st_5 from statictext within w_oiscene_grp
end type
type cbx_cust from checkbox within w_oiscene_grp
end type
type dw_4 from datawindow within w_oiscene_grp
end type
type dw_5 from datawindow within w_oiscene_grp
end type
type st_shipamt from statictext within w_oiscene_grp
end type
type dw_6 from datawindow within w_oiscene_grp
end type
type rb_1 from radiobutton within w_oiscene_grp
end type
type rb_2 from radiobutton within w_oiscene_grp
end type
type rb_3 from radiobutton within w_oiscene_grp
end type
type rb_4 from radiobutton within w_oiscene_grp
end type
type rb_5 from radiobutton within w_oiscene_grp
end type
type dw_7 from datawindow within w_oiscene_grp
end type
type cbx_hap from checkbox within w_oiscene_grp
end type
type ddlb_op from dropdownlistbox within w_oiscene_grp
end type
end forward

global type w_oiscene_grp from w_inheritance
integer y = 112
integer width = 4850
integer height = 2640
string title = "프로젝트별 자재투입현황(w_oiscene_grp)"
gb_5 gb_5
em_1 em_1
em_2 em_2
dw_3 dw_3
dw_area dw_area
pb_1 pb_1
cbx_price cbx_price
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_2 st_2
st_1 st_1
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_5 st_5
cbx_cust cbx_cust
dw_4 dw_4
dw_5 dw_5
st_shipamt st_shipamt
dw_6 dw_6
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
dw_7 dw_7
cbx_hap cbx_hap
ddlb_op ddlb_op
end type
global w_oiscene_grp w_oiscene_grp

type variables
//
string is_dw
DataWindowChild idwc_area, idwc_project, idwc_user

end variables

on w_oiscene_grp.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.dw_area=create dw_area
this.pb_1=create pb_1
this.cbx_price=create cbx_price
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_2=create st_2
this.st_1=create st_1
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_5=create st_5
this.cbx_cust=create cbx_cust
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_shipamt=create st_shipamt
this.dw_6=create dw_6
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.dw_7=create dw_7
this.cbx_hap=create cbx_hap
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.cbx_price
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.cbx_team
this.Control[iCurrent+21]=this.dw_sales
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.cbx_cust
this.Control[iCurrent+24]=this.dw_4
this.Control[iCurrent+25]=this.dw_5
this.Control[iCurrent+26]=this.st_shipamt
this.Control[iCurrent+27]=this.dw_6
this.Control[iCurrent+28]=this.rb_1
this.Control[iCurrent+29]=this.rb_2
this.Control[iCurrent+30]=this.rb_3
this.Control[iCurrent+31]=this.rb_4
this.Control[iCurrent+32]=this.rb_5
this.Control[iCurrent+33]=this.dw_7
this.Control[iCurrent+34]=this.cbx_hap
this.Control[iCurrent+35]=this.ddlb_op
end on

on w_oiscene_grp.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.cbx_price)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_5)
destroy(this.cbx_cust)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_shipamt)
destroy(this.dw_6)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.dw_7)
destroy(this.cbx_hap)
destroy(this.ddlb_op)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

gb_5.visible      = false
cbx_cust.visible  = false
cbx_price.visible = false

dw_2.settransobject( SQLCA )
dw_3.settransobject( SQLCA )
dw_3.visible  = false

dw_4.settransobject( SQLCA )
dw_4.visible  = false

dw_5.settransobject( SQLCA )
dw_5.visible  = false

dw_6.settransobject( SQLCA )
dw_6.visible  = false

dw_7.settransobject( SQLCA )
dw_7.visible  = false

st_shipamt.visible  = false

is_dw = 'dw_2' /*2018.04.04 조원석 */

// 단가 출력안함
cbx_price.enabled = false	

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday

SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

// 사업장 
string ls_area

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 프로젝트
dw_1.SetTransObject(SQLCA)
dw_1.insertrow(0)

dw_1.getchild("project", idwc_project)
idwc_project.SetTransObject(sqlca)
idwc_project.insertrow(1)
idwc_project.setitem(1, "project", "%")
idwc_project.setitem(1, "project_name", "전체")
idwc_project.accepttext()
dw_1.object.project[1] = "%"

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user", idwc_user)
idwc_user.SetTransObject(sqlca)
idwc_user.Retrieve( "%" )

idwc_user.insertrow(1)
idwc_user.setitem(1,"user_id","%")
idwc_user.setitem(1,"user_name","전체")
idwc_user.accepttext()
dw_sales.object.user[1] = "%"

// 팀조회
cbx_team.checked = true		
idwc_user.setfilter( "" )
idwc_user.filter()

dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

dw_4.x      = dw_2.x
dw_4.y      = dw_2.y
dw_4.width  = dw_2.width
dw_4.height = dw_2.height

dw_5.x      = dw_2.x
dw_5.y      = dw_2.y
dw_5.width  = dw_2.width
dw_5.height = dw_2.height

dw_6.x      = dw_2.x
dw_6.y      = dw_2.y
dw_6.width  = dw_2.width
dw_6.height = dw_2.height

dw_7.x      = dw_2.x
dw_7.y      = dw_2.y
dw_7.width  = dw_2.width
dw_7.height = dw_2.height

end event

type pb_save from w_inheritance`pb_save within w_oiscene_grp
boolean visible = false
integer taborder = 40
end type

type dw_1 from w_inheritance`dw_1 within w_oiscene_grp
integer x = 1797
integer y = 124
integer width = 613
integer height = 88
integer taborder = 60
string dataobject = "d_oiscenegrp_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;call super::itemchanged;//
this.accepttext()

end event

type st_title from w_inheritance`st_title within w_oiscene_grp
integer x = 41
integer y = 20
integer width = 1408
string text = "프로젝트별 자재투입현황"
end type

type st_tips from w_inheritance`st_tips within w_oiscene_grp
end type

type pb_compute from w_inheritance`pb_compute within w_oiscene_grp
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiscene_grp
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiscene_grp
integer x = 4142
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;//
close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiscene_grp
integer x = 3762
integer taborder = 90
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print

string ls_area, ls_project, ls_salesman, ls_price, ls_request
date   ld_sdate, ld_edate

// 사업장
dw_area.accepttext()
ls_area   = trim(dw_area.object.area[1])
ls_area   = LeftA(ls_area,1) + "%"

// 프로젝트
dw_1.accepttext()
ls_project = dw_1.object.project[1]
if isnull(ls_project) OR ls_project = "" then
	MessageBox("확인","프로젝트를 선택하세요!",information!)
	dw_1.setfocus()
	RETURN
end if

// 일자
if em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 담당자
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]		// "%"

// 단가 출력안함
if cbx_price.checked = true then	
	ls_price = "Y"
else
	ls_price = "N"
end if

// 거래처 제출용(출력)
if cbx_cust.checked = true then	
	ls_request = "Y"
else
	ls_request = "N"
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then
	l_print.st_datawindow  = dw_2
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 프로젝트별 출고현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2,	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
	OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
elseif rb_2.checked = true then
	dw_3.retrieve( ls_project, ld_sdate, ld_edate, ls_salesman, ls_price, ls_request )
	dw_3.GroupCalc()
	
	l_print.st_datawindow  = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2,	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=85'
	OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
elseif rb_3.checked = true then
	l_print.st_datawindow  = dw_5
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 프로젝트별 품목현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2,	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
	OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
elseif rb_4.checked = true then
	l_print.st_datawindow  = dw_6
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 프로젝트별 현장현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2,	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
	OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
else
	l_print.st_datawindow  = dw_7
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 프로젝트별 집계현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2,	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
	OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
end if


end event

event constructor;//w_repsuper w_print
//st_print l_print
//string ls_cust_no, ls_scene_code, ls_scene, ls_dono
//date ld_start, ld_end
//long ll_row, ll_count, ll_idx
//dec ld_chk
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
//if isnull(ls_cust_no) or ls_cust_no = '' then
//	messagebox("확인","거래처를 선택하세요!",information!)
//	dw_1.setfocus()
//	return
//end if
//
//if em_1.text = '' then
//	messagebox("확인","출고기간을 입력하세요!",information!)
//	em_1.setfocus()
//	return
//elseif em_2.text = '' then
//	messagebox("확인","출고기간을 입력하세요!",information!)
//	em_2.setfocus()
//	return
//elseif em_1.text > em_2.text then
//	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
//	em_1.setfocus()
//	return
//end if
//
//dw_4.SetRedraw(false)
//
//
//
//ld_start = date(em_1.text)
//ld_end = date(em_2.text)
//
//if rb_1.checked = true then
//	dw_4.dataobject = 'd_oiscenerep_r1'
//	dw_4.settransobject(sqlca)
//	dw_4.retrieve(ls_cust_no, ld_start, ld_end)
////   dw_4.object.do_do_rate[1] = dw_4.object.do_cash[1] 
////	dw_4.object.do_do_total[1] = dw_4.object.do_cash[1] 
////	ls_dono = dw_4.object.do_do_no[1] 
////	ls_scene = dw_4.object.do_spot_code[1] 
////	ld_chk = dw_4.object.do_ship_amount[1]
////	for ll_count = 1 to dw_4.rowcount()
////		dw_4.object.scene_scene_code[ll_count] = em_1.text
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text
////		if ls_scene <> dw_4.object.do_spot_code[ll_count] then
////			dw_4.object.do_do_rate[ll_count] = 0
////			ls_scene = dw_4.object.do_spot_code[ll_count] 
////		end if	
////		ll_idx = ll_count - 1
////		if ls_dono <> dw_4.object.do_do_no[ll_count] then
////   		dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] + &
////	   	                                   (dw_4.object.do_cash[ll_count] * 1.1)
////		  	dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] + &
////			                                     (dw_4.object.do_cash[ll_count] * 1.1)
////	   	ls_dono = dw_4.object.do_do_no[ll_count] 
////		ELSE
////			dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] 
////			dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] 
////		end if
////	next	
//else
//	if dw_2.rowcount() < 1 then return
//	
//	ls_scene_code = dw_2.object.spot_code[dw_2.getrow()]
//	dw_4.dataobject = 'd_oiscenerep_r2'
//	dw_4.settransobject(sqlca)
//	dw_4.retrieve(ls_cust_no, ls_scene_code, ld_start, ld_end)
////   dw_4.object.do_do_rate[1] = dw_4.object.do_cash[1] 
////	dw_4.object.do_do_total[1] = dw_4.object.do_cash[1] 
////	ls_dono = dw_4.object.do_do_no[1] 
////	ls_scene = dw_4.object.do_spot_code[1] 
////	ld_chk = dw_4.object.do_ship_amount[1]
////	for ll_count = 1 to dw_4.rowcount()
////		dw_4.object.scene_scene_code[ll_count] = em_1.text
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text
////	   dw_4.object.scene_scene_code[ll_count] =  dw_2.object.spot_code[dw_2.getrow()]
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text 
////		if ls_scene <> dw_4.object.do_spot_code[ll_count] then
////			dw_4.object.do_do_rate[ll_count] = 0
////			ls_scene = dw_4.object.do_spot_code[ll_count] 
////		end if	
////		ll_idx = ll_count - 1
////		if ls_dono <> dw_4.object.do_do_no[ll_count] then
////   		dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] + &
////	   	                                   (dw_4.object.do_cash[ll_count] * 1.1)
////		  	dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] + &
////			                                     (dw_4.object.do_cash[ll_count] * 1.1)
////	   	ls_dono = dw_4.object.do_do_no[ll_count] 
////		ELSE
////			dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] 
////			dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] 
////		end if
////	next		
//end if
//
//if dw_4.rowcount() < 1 then return
//
//
//	dw_4.object.cc_start[1] = string(em_1.text)
//	dw_4.object.cc_end[1] = string(em_2.text)
//
//l_print.st_datawindow = dw_4
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//                   'Datawindow.Zoom=100'
//dw_4.SetRedraw(TRUE)
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_oiscene_grp
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_oiscene_grp
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_oiscene_grp
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiscene_grp
integer x = 3561
integer taborder = 80
end type

event pb_retrieve::clicked;//
string ls_project, ls_area, ls_request, ls_price, ls_salesman
date   ld_sdate,  ld_edate

// 사업장
dw_area.accepttext()
ls_area = trim(LeftA(dw_area.object.area[1],1)) + "%"

// 프로젝트
dw_1.accepttext()
ls_project = dw_1.object.project[1]
if isnull(ls_project) OR ls_project = "" then
	MessageBox("확인","프로젝트를 선택하세요!",information!)
	dw_1.setfocus()
	RETURN
end if

// 일자
if em_1.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 담당자
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]		// "%"

// 단가 출력안함
if cbx_price.checked = true then	
	ls_price = "Y"
else
	ls_price = "N"
end if

// 거래처 제출용(출력)
if cbx_cust.checked = true then	
	ls_request = "Y"
else
	ls_request = "N"
end if

if rb_1.checked = true then
	dw_2.retrieve( ls_project, ld_sdate, ld_edate, ls_salesman )
	if dw_2.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if
elseif rb_2.checked = true then
	dw_4.retrieve( ls_project, ld_sdate, ld_edate, ls_salesman, ls_price )
	if dw_4.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if	
elseif rb_3.checked = true then
	dw_5.retrieve( ls_project, ld_sdate, ld_edate, ls_salesman )
	if dw_5.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if	
elseif rb_4.checked = true then
	dw_6.retrieve( ls_project, ld_sdate, ld_edate, ls_salesman )
	if dw_6.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if
elseif rb_5.checked = true then
	dw_7.retrieve( ls_project, ld_sdate, ld_edate, ls_salesman )
	if dw_7.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type gb_3 from w_inheritance`gb_3 within w_oiscene_grp
integer x = 32
integer y = 232
integer width = 4672
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiscene_grp
integer x = 1477
integer y = 0
integer width = 2011
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiscene_grp
integer x = 3529
integer y = 0
integer width = 832
integer height = 232
integer taborder = 0
integer textsize = -9
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiscene_grp
integer x = 32
integer y = 412
integer width = 4672
integer height = 2100
integer taborder = 70
string dataobject = "d_oiscenerep_grpsum"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type gb_5 from groupbox within w_oiscene_grp
integer x = 4375
integer width = 768
integer height = 232
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "규격->규격(송장) 변경"
end type

type em_1 from editmask within w_oiscene_grp
integer x = 2725
integer y = 44
integer width = 357
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	em_2.text = this.text
//end if
//
end event

type em_2 from editmask within w_oiscene_grp
integer x = 3090
integer y = 44
integer width = 357
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_3 from datawindow within w_oiscene_grp
integer x = 50
integer y = 164
integer width = 101
integer height = 80
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_oiscenerep_grp_r1"
boolean livescroll = true
end type

type dw_area from datawindow within w_oiscene_grp
integer x = 1797
integer y = 44
integer width = 526
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from picturebutton within w_oiscene_grp
event mousemove pbm_mousemove
integer x = 3954
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos, li_value
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
end choose

if arg_dw.rowcount() > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			arg_dw.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cbx_price from checkbox within w_oiscene_grp
integer x = 4407
integer y = 136
integer width = 704
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "단가 출력안함"
end type

type st_3 from statictext within w_oiscene_grp
integer x = 82
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_oiscene_grp
integer x = 270
integer y = 280
integer width = 443
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_oiscene_grp
integer x = 302
integer y = 292
integer width = 311
integer height = 88
integer taborder = 100
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

type st_4 from statictext within w_oiscene_grp
integer x = 741
integer y = 296
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

type sle_value from singlelineedit within w_oiscene_grp
integer x = 1230
integer y = 288
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiscene_grp
integer x = 1801
integer y = 288
integer width = 160
integer height = 76
integer taborder = 80
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
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiscene_grp
integer x = 1966
integer y = 288
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_3 from commandbutton within w_oiscene_grp
integer x = 2130
integer y = 288
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiscene_grp
integer x = 2295
integer y = 288
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_2 from statictext within w_oiscene_grp
integer x = 1504
integer y = 44
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oiscene_grp
integer x = 2427
integer y = 44
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_oiscene_grp
integer x = 2427
integer y = 128
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자팀"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oiscene_grp
integer x = 2725
integer y = 148
integer width = 59
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if ls_userid = "%" then
	// 전체
else
	if this.checked = true then
		idwc_user.setfilter( "" )
		idwc_user.filter()
	else
		idwc_user.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_user.filter()
	end if
end if

end event

type dw_sales from datawindow within w_oiscene_grp
integer x = 2802
integer y = 128
integer width = 329
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()
this.accepttext()

end event

type st_5 from statictext within w_oiscene_grp
integer x = 1504
integer y = 128
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "프로젝트"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_cust from checkbox within w_oiscene_grp
integer x = 4407
integer y = 72
integer width = 704
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "거래처 제출용(출력)"
end type

type dw_4 from datawindow within w_oiscene_grp
integer x = 197
integer y = 632
integer width = 1417
integer height = 532
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_oiscenerep_grp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_5 from datawindow within w_oiscene_grp
integer x = 1664
integer y = 632
integer width = 1417
integer height = 532
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_grpitem"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_shipamt from statictext within w_oiscene_grp
integer x = 3598
integer y = 300
integer width = 727
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "운반비 차액이 발생함."
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_oiscene_grp
integer x = 3141
integer y = 632
integer width = 1417
integer height = 532
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_grpcalc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_1 from radiobutton within w_oiscene_grp
integer x = 2469
integer y = 268
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "출고"
boolean checked = true
end type

event clicked;// 출고
if this.checked = true then
	dw_2.visible = true
	dw_4.visible = false
	dw_5.visible = false
	dw_6.visible = false
	dw_7.visible = false
	
	st_shipamt.visible = false
	
	is_dw = 'dw_2'	/*2018.04.04 조원석 추가 */
end if

end event

type rb_2 from radiobutton within w_oiscene_grp
integer x = 2469
integer y = 320
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "상세"
end type

event clicked;// 상세
if this.checked = true then
	dw_2.visible = false
	dw_4.visible = true
	dw_5.visible = false
	dw_6.visible = false
	dw_7.visible = false
	
	st_shipamt.visible = false
	
	is_dw = 'dw_4'	/*2018.04.04 조원석 추가 */
	
end if

end event

type rb_3 from radiobutton within w_oiscene_grp
integer x = 2743
integer y = 268
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "품목"
end type

event clicked;// 품목
if this.checked = true then
	dw_2.visible = false
	dw_4.visible = false
	dw_5.visible = true
	dw_6.visible = false
	dw_7.visible = false
	
	st_shipamt.visible = true
	
	is_dw = 'dw_5'	/*2018.04.04 조원석 추가 */	
end if



end event

type rb_4 from radiobutton within w_oiscene_grp
integer x = 2743
integer y = 320
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "담당"
end type

event clicked;// 담당
if this.checked = true then
	dw_2.visible = false
	dw_4.visible = false
	dw_5.visible = false
	dw_6.visible = true
	dw_7.visible = false
	
	st_shipamt.visible = false
	
	is_dw = 'dw_6'	/*2018.04.04 조원석 추가 */		
end if

end event

type rb_5 from radiobutton within w_oiscene_grp
integer x = 3017
integer y = 268
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "프로젝트 집계"
end type

event clicked;// 프로젝트 집계
if this.checked = true then
	dw_2.visible = false
	dw_4.visible = false
	dw_5.visible = false
	dw_6.visible = false
	dw_7.visible = true
	
	st_shipamt.visible = false
	
	is_dw = 'dw_7'	/*2018.04.04 조원석 추가 */		
end if

end event

type dw_7 from datawindow within w_oiscene_grp
integer x = 197
integer y = 1220
integer width = 1417
integer height = 532
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_grpsum_all"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cbx_hap from checkbox within w_oiscene_grp
integer x = 3017
integer y = 328
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

if dw_2.visible = true then
	arg_dw = dw_2
elseif dw_4.visible = true then
	arg_dw = dw_4
elseif dw_5.visible = true then
	arg_dw = dw_5
elseif dw_6.visible = true then
	arg_dw = dw_6
elseif dw_7.visible = true then
	arg_dw = dw_7
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
	RETURN
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type ddlb_op from dropdownlistbox within w_oiscene_grp
integer x = 919
integer y = 284
integer width = 302
integer height = 500
integer taborder = 190
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

