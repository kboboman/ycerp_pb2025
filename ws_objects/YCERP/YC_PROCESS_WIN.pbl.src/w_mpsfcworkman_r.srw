$PBExportHeader$w_mpsfcworkman_r.srw
$PBExportComments$생산성집계표(실적,투입인원)
forward 
global type w_mpsfcworkman_r from w_inheritance
end type
type em_1 from editmask within w_mpsfcworkman_r
end type
type em_2 from editmask within w_mpsfcworkman_r
end type
type rb_1 from radiobutton within w_mpsfcworkman_r
end type
type rb_2 from radiobutton within w_mpsfcworkman_r
end type
type dw_area from datawindow within w_mpsfcworkman_r
end type
type pb_2 from picturebutton within w_mpsfcworkman_r
end type
type st_2 from statictext within w_mpsfcworkman_r
end type
type st_3 from statictext within w_mpsfcworkman_r
end type
type st_4 from statictext within w_mpsfcworkman_r
end type
type ddlb_fld from dropdownlistbox within w_mpsfcworkman_r
end type
type st_5 from statictext within w_mpsfcworkman_r
end type
type ddlb_op from dropdownlistbox within w_mpsfcworkman_r
end type
type sle_value from singlelineedit within w_mpsfcworkman_r
end type
type cb_1 from commandbutton within w_mpsfcworkman_r
end type
type cb_2 from commandbutton within w_mpsfcworkman_r
end type
type cb_3 from commandbutton within w_mpsfcworkman_r
end type
type cb_5 from commandbutton within w_mpsfcworkman_r
end type
type gb_4 from groupbox within w_mpsfcworkman_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcworkman_r
end type
type tab_1 from tab within w_mpsfcworkman_r
end type
type tabpage_1 from userobject within tab_1
end type
type st_6 from statictext within tabpage_1
end type
type cbx_key from checkbox within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type dw_7 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_6 st_6
cbx_key cbx_key
dw_3 dw_3
dw_7 dw_7
end type
type tabpage_2 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_4 cb_4
dw_4 dw_4
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_4 from userobject within tab_1
end type
type st_9 from statictext within tabpage_4
end type
type st_8 from statictext within tabpage_4
end type
type dw_6 from datawindow within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type cb_9 from commandbutton within tabpage_4
end type
type cb_10 from commandbutton within tabpage_4
end type
type cb_11 from commandbutton within tabpage_4
end type
type cb_8 from commandbutton within tabpage_4
end type
type cb_7 from commandbutton within tabpage_4
end type
type cb_6 from commandbutton within tabpage_4
end type
type tabpage_4 from userobject within tab_1
st_9 st_9
st_8 st_8
dw_6 dw_6
dw_8 dw_8
cb_9 cb_9
cb_10 cb_10
cb_11 cb_11
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
end type
type tab_1 from tab within w_mpsfcworkman_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type st_1 from statictext within w_mpsfcworkman_r
end type
type rb_3 from radiobutton within w_mpsfcworkman_r
end type
type rb_4 from radiobutton within w_mpsfcworkman_r
end type
type rb_5 from radiobutton within w_mpsfcworkman_r
end type
type rb_6 from radiobutton within w_mpsfcworkman_r
end type
type st_7 from statictext within w_mpsfcworkman_r
end type
end forward

global type w_mpsfcworkman_r from w_inheritance
integer width = 4690
integer height = 2612
string title = "생산성 집계분석(w_mpsfcworkman_r)"
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
dw_area dw_area
pb_2 pb_2
st_2 st_2
st_3 st_3
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
tab_1 tab_1
st_1 st_1
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
st_7 st_7
end type
global w_mpsfcworkman_r w_mpsfcworkman_r

type variables
st_print i_print
int    ii_year, ii_month
string is_wcno, is_dw

DataWindow dw3, dw4, dw5, dw6, dw7, dw8, dw9, dw10
datawindowchild idwc_wc, idwc_area, idwc_cat, idwc_cat1, idwc_cat2

end variables

forward prototypes
public subroutine wf_calcrate ()
end prototypes

public subroutine wf_calcrate ();//
string  ls_workname, ls_workname2
long    ll_row,  ll_col, ll_cols, ll_dw10cnt, ll_month, ll_day
decimal ld_calcqty, ld_calctime
decimal ld_comman1, ld_comman2, ld_comtime1, ld_comtime2, ld_rate, ld_calcrate, ld_timerate

// 전일(월)대비 생산량증감율 
setnull( ls_workname2 )

for ll_row = 1 to dw3.rowcount()
	if dw3.object.calc_qty[ll_row] = 0 then CONTINUE
	if dw3.object.calctime[ll_row] = 0 then CONTINUE
	
	if isnull(ls_workname2) then ls_workname2 = dw3.object.work_grp[ll_row]

	ls_workname = dw3.object.work_grp[ll_row]
	if ls_workname2 <> ls_workname then
		ls_workname2 = ls_workname

		ll_day      = 1
		ld_calcrate = 0.0
		ld_timerate = 0.0

		dw3.object.com_manrate[ll_row]  = ld_calcrate
		dw3.object.com_timerate[ll_row] = ld_timerate
	else
		ll_day     = ll_day + 1

		if ll_day  = 1 then		// 작업장의 첫행 데이터인 경우
			ld_calcrate = 0.0
			ld_timerate = 0.0
		else
			ld_comman1  = dw3.object.com_man[ll_row - 1]
			ld_comman2  = dw3.object.com_man[ll_row]

			ld_comtime1 = dw3.object.com_time[ll_row - 1]
			ld_comtime2 = dw3.object.com_time[ll_row]
			
			if ld_comman1 = 0 OR ld_comtime1 = 0 then		// 분모값이 ZERO인 경우
				ld_calcrate = 1.0
				ld_timerate = 1.0
			else
				ld_calcrate = (ld_comman2  - ld_comman1)  / ld_comman1
				ld_timerate = (ld_comtime2 - ld_comtime1) / ld_comtime1
			end if
		end if
		
		dw3.object.com_manrate[ll_row]  = ld_calcrate
		dw3.object.com_timerate[ll_row] = ld_timerate
	end if
next

end subroutine

on w_mpsfcworkman_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_area=create dw_area
this.pb_2=create pb_2
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.tab_1=create tab_1
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.st_7=create st_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.gb_4
this.Control[iCurrent+19]=this.ddlb_dwtitles
this.Control[iCurrent+20]=this.tab_1
this.Control[iCurrent+21]=this.st_1
this.Control[iCurrent+22]=this.rb_3
this.Control[iCurrent+23]=this.rb_4
this.Control[iCurrent+24]=this.rb_5
this.Control[iCurrent+25]=this.rb_6
this.Control[iCurrent+26]=this.st_7
end on

on w_mpsfcworkman_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_area)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.st_7)
end on

event open;call super::open;///////////////////////////////////////////////////////////////////////////////////////////////
// 근태사업장 YSP사업장 ==> 시화사업장으로 변경함
///////////////////////////////////////////////////////////////////////////////////////////////

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================
string ls_area

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

tab_1.tabpage_4.cb_6.enabled  = false		// 비가동추가
tab_1.tabpage_4.cb_7.enabled  = false		// 비가동삭제
tab_1.tabpage_4.cb_8.enabled  = false		// 비가동저장

tab_1.tabpage_4.cb_9.enabled  = false		// 준가동추가
tab_1.tabpage_4.cb_10.enabled = false		// 준가동삭제
tab_1.tabpage_4.cb_11.enabled = false		// 준가동저장

dw3  = tab_1.tabpage_1.dw_3
dw4  = tab_1.tabpage_2.dw_4
dw5  = tab_1.tabpage_3.dw_5
dw6  = tab_1.tabpage_4.dw_6
dw7  = tab_1.tabpage_1.dw_7
dw8  = tab_1.tabpage_4.dw_8

dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)
dw8.SetTransObject(SQLCA)

dw_2.visible = false

tab_1.tabpage_2.cb_4.enabled = false		// 생산품목 그룹관리

// 일자
em_1.text = string(gf_today(),"yyyy/mm/01")
em_2.text = string(RelativeDate(date(gf_today()), - 1),"yyyy/mm/dd")
rb_3.triggerevent( clicked! )					// 주

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.getchild("area", idwc_area)

idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

idwc_area.setfilter( "area_no = '%' OR area_no = 'S0001' OR area_no = 'B0001'")
idwc_area.filter()

dw_area.enabled = false 
dw_area.object.area.Background.Color   = rgb(255, 255, 255)
dw_area.object.area.Background.Color   = 67108864

// 시화사업장, 화성사업장
if gs_area = "S0001" OR gs_area = "T0001" then
	dw_area.object.area[1] = gs_area
else
	dw_area.object.area[1] = "S0001" //gs_area
end if

dw_area.accepttext()
ls_area = dw_area.object.area[1]

// 작업장
dw_1.settransobject(sqlca)
dw_1.insertrow(0)  
dw_1.getchild("work_no",idwc_wc)

idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1, "work_no",   " ")
idwc_wc.setitem(1, "work_name", "전체")
idwc_wc.setitem(1, "work_type", "D")
idwc_wc.setitem(1, "area_no",   "S0001")
idwc_wc.accepttext()

idwc_wc.setfilter( "(area_no = 'S0001' OR area_no = 'B0001') AND (work_type = 'D' AND (right(work_no,2) = '00' OR work_no = ' ') ) " )
idwc_wc.filter()

dw_1.object.work_no[1] = " "
dw_1.accepttext()

// 대분류(비가동, 준가동)
//dw6.insertrow(1)
dw6.getchild("cat2",idwc_cat1)
idwc_cat1.settransobject(sqlca)
idwc_cat1.retrieve("비가동시간")

dw6.object.cat1.tabsequence       = 0
dw6.object.cat2.tabsequence       = 0
dw6.object.work_man.tabsequence   = 0
dw6.object.work_etime.tabsequence = 0
dw6.object.bigo.tabsequence       = 0
	
// 중분류(codemst: 비가동, 준가동)
//dw8.insertrow(1)
dw8.getchild("cat2",idwc_cat2)
idwc_cat2.settransobject(sqlca)
idwc_cat2.retrieve("준가동시간")

dw8.object.cat1.tabsequence       = 0
dw8.object.cat2.tabsequence       = 0
dw8.object.work_man.tabsequence   = 0
dw8.object.work_etime.tabsequence = 0
dw8.object.bigo.tabsequence       = 0

end event

event resize;call super::resize;//
gb_4.width   = newwidth  - (32 * 2)

tab_1.width  = newwidth  - (32 * 2)
tab_1.height = newheight - tab_1.y - 32

// 생산성집계(실적,인원 증감율보기)
tab_1.tabpage_1.dw_3.width  = tab_1.width  - 69
tab_1.tabpage_1.dw_3.height = (tab_1.height - 228) / 2

// 생산성집계(비가동,준가동 보기)
tab_1.tabpage_1.dw_7.x      = tab_1.tabpage_1.dw_3.x
tab_1.tabpage_1.dw_7.y      = tab_1.tabpage_1.dw_3.y + tab_1.tabpage_1.dw_3.height
tab_1.tabpage_1.dw_7.width  = tab_1.width  - 69
tab_1.tabpage_1.dw_7.height = (tab_1.height - 228) / 2


// 생산실적
tab_1.tabpage_2.dw_4.width  = tab_1.width  - 69
tab_1.tabpage_2.dw_4.height = tab_1.height - 228


// 근태집계
tab_1.tabpage_3.dw_5.width  = tab_1.width  - 69
tab_1.tabpage_3.dw_5.height = tab_1.height - 228


// 시간(비가동/준가동: 비가동 입력)
tab_1.tabpage_4.dw_6.width  = tab_1.width  - 69
tab_1.tabpage_4.dw_6.height = (tab_1.height - 328) / 2

// 시간(비가동/준가동: 준가동 입력)
long ll_dw5_y
ll_dw5_y   = tab_1.tabpage_4.dw_6.y + tab_1.tabpage_4.dw_6.height + 10

tab_1.tabpage_4.st_8.y      = ll_dw5_y - 10   
tab_1.tabpage_4.cb_9.x      = tab_1.tabpage_4.cb_6.x ; tab_1.tabpage_4.cb_9.y      = ll_dw5_y
tab_1.tabpage_4.cb_10.x     = tab_1.tabpage_4.cb_7.x ; tab_1.tabpage_4.cb_10.y     = ll_dw5_y
tab_1.tabpage_4.cb_11.x     = tab_1.tabpage_4.cb_8.x ; tab_1.tabpage_4.cb_11.y     = ll_dw5_y

tab_1.tabpage_4.dw_8.x      = tab_1.tabpage_4.dw_6.x
tab_1.tabpage_4.dw_8.y      = tab_1.tabpage_4.dw_6.y + tab_1.tabpage_4.dw_6.height + 100
tab_1.tabpage_4.dw_8.width  = tab_1.width  - 69
tab_1.tabpage_4.dw_8.height = (tab_1.height - 328) / 2

end event

type pb_save from w_inheritance`pb_save within w_mpsfcworkman_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcworkman_r
integer x = 2880
integer y = 56
integer width = 608
integer height = 80
integer taborder = 30
string dataobject = "d_whwork_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;// 작업장 변경
string ls_data, ls_area, ls_wcno, ls_teamno, ls_workname

// 작업장
this.accepttext()
ls_wcno    = trim(this.object.work_no[1])
if ls_wcno = ""    then ls_wcno = "%"
if ls_wcno = "Y00" then ls_area = "B0001"		// 근태사업장

// 작업장으로 근태부서 검색
ls_workname = "%"

tab_1.tabpage_2.cb_4.enabled = false

// 비가동 작업장별 필터링
dw6.object.cat1.tabsequence       = 0
dw6.object.cat2.tabsequence       = 0
dw6.object.work_man.tabsequence   = 0
dw6.object.work_etime.tabsequence = 0
dw6.object.bigo.tabsequence       = 0

idwc_cat1.setfilter( "" )
idwc_cat1.filter()

// 준가동 작업장별 필터링
dw8.object.cat1.tabsequence       = 0
dw8.object.cat2.tabsequence       = 0
dw8.object.work_man.tabsequence   = 0
dw8.object.work_etime.tabsequence = 0
dw8.object.bigo.tabsequence       = 0

idwc_cat2.setfilter( "" )
idwc_cat2.filter()

if ls_wcno <> "%" then
	SELECT work_name INTO :ls_workname FROM wc WHERE work_no = :ls_wcno;
	if isnull(ls_workname) OR ls_workname = "" then
	else
		tab_1.tabpage_2.cb_4.enabled = true
		
		ls_workname = GF_ReplaceAll(GF_ReplaceAll(ls_workname,"[",""),"]","")	// [YSP] ==> YSP%
		
		// 비가동 작업장별 필터링
		dw6.object.cat1.tabsequence       = 0
		dw6.object.cat2.tabsequence       = 20
		dw6.object.work_man.tabsequence   = 30
		dw6.object.work_etime.tabsequence = 50
		dw6.object.bigo.tabsequence       = 60

		idwc_cat1.setfilter( "bigo = '" + ls_wcno + "' " )
		idwc_cat1.filter()
		
		// 준가동 작업장별 필터링
		dw8.object.cat1.tabsequence       = 0
		dw8.object.cat2.tabsequence       = 20
		dw8.object.work_man.tabsequence   = 30
		dw8.object.work_etime.tabsequence = 50
		dw8.object.bigo.tabsequence       = 60

		idwc_cat2.setfilter( "bigo = '" + ls_wcno + "' " )
		idwc_cat2.filter()
	end if
end if

// 조회
pb_retrieve.triggerevent( clicked! )

end event

type st_title from w_inheritance`st_title within w_mpsfcworkman_r
integer x = 41
integer y = 52
integer width = 1321
integer height = 128
string text = "생산성 집계분석"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcworkman_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcworkman_r
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcworkman_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcworkman_r
integer x = 4384
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcworkman_r
integer x = 4178
integer y = 64
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print

string ls_command

if dw3.getrow() <= 0 then RETURN

dw3.sharedata(dw_2)

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 생산성 집계분석을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=92'
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcworkman_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcworkman_r
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcworkman_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcworkman_r
integer x = 3794
integer y = 64
integer taborder = 60
end type

event pb_retrieve::clicked;///////////////////////////////////////////////////////////////////////////////////////////////
// 근태사업장 YSP사업장 ==> 시화사업장으로 변경함
///////////////////////////////////////////////////////////////////////////////////////////////

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area, ls_wcno, ls_teamno, ls_teamname, ls_sdate, ls_edate, ls_month, ls_keyjob
string ls_userid, ls_workmanager

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 일별,월별 구분
if rb_1.checked = true then
	ls_month = "N"
else
	ls_month = "Y"
end if

// 작업장
dw_1.accepttext()
ls_wcno     = trim(dw_1.object.work_no[1])
if ls_wcno = ""    then ls_wcno = "%"
if ls_wcno = "Y00" then ls_area = "B0001"		// 근태사업장

// 작업장으로 근태부서, 계획관리자, 생산관리자 검색
SELECT insa_team, user_id, work_manager INTO :ls_teamno, :ls_userid, :ls_workmanager 
  FROM wc 
 WHERE work_no = :ls_wcno;
if isnull(ls_teamno) OR ls_teamno = "" then ls_teamno = "%"

// 주요작업장
if tab_1.tabpage_1.cbx_key.checked = true then
	ls_keyjob = ""
else
	ls_keyjob = "%"
end if

choose case tab_1.selectedtab
	case 1		// 생산성집계(실적,인원)
		dw3.reset() ; dw7.reset()
      dw3.retrieve( ls_area, LeftA(ls_wcno,1), ls_teamno, ls_sdate, ls_edate, ls_month, ls_keyjob )
		dw7.retrieve( ls_area, ls_wcno, ls_sdate, ls_edate )
		
		if dw3.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 자료가 없습니다",Exclamation!)
		else
			// 증감율 계산하기
			wf_calcrate()			
			MessageBox("확인","조회완료",Exclamation!)
		end if
		
	case 2		// 생산실적
		dw4.reset()
		dw4.retrieve( ls_area, LeftA(ls_wcno,1), ls_sdate, ls_edate )
		if dw4.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 자료가 없습니다",Exclamation!)
		else
			MessageBox("확인","조회완료",Exclamation!)
		end if

	case 3		// 근태집계
		dw5.reset()
      dw5.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate, ls_month )
		if dw5.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 자료가 없습니다",Exclamation!)
		else
			MessageBox("확인","조회완료",Exclamation!)
		end if
		
	case 4		// 시간(비가동/준가동)
		dw6.reset() ; dw8.reset()
		
		tab_1.tabpage_4.cb_6.enabled  = false		// 비가동추가
		tab_1.tabpage_4.cb_7.enabled  = false		// 비가동삭제
		tab_1.tabpage_4.cb_8.enabled  = false		// 비가동저장
		
		tab_1.tabpage_4.cb_9.enabled  = false		// 준가동추가
		tab_1.tabpage_4.cb_10.enabled = false		// 준가동삭제
		tab_1.tabpage_4.cb_11.enabled = false		// 준가동저장

		// 비가동
		dw6.object.cat1.tabsequence       = 0
		dw6.object.cat2.tabsequence       = 0
		dw6.object.work_man.tabsequence   = 0
		dw6.object.work_etime.tabsequence = 0
		dw6.object.bigo.tabsequence       = 0
		
		// 준가동
		dw8.object.cat1.tabsequence       = 0
		dw8.object.cat2.tabsequence       = 0
		dw8.object.work_man.tabsequence   = 0
		dw8.object.work_etime.tabsequence = 0
		dw8.object.bigo.tabsequence       = 0

		if ls_wcno <> "%" then
			if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" OR &
				gs_userid = ls_userid OR gs_username = ls_workmanager then

				tab_1.tabpage_4.cb_6.enabled  = true	// 비가동추가
				tab_1.tabpage_4.cb_7.enabled  = true	// 비가동삭제
				tab_1.tabpage_4.cb_8.enabled  = true	// 비가동저장
				
				tab_1.tabpage_4.cb_9.enabled  = true	// 준가동추가
				tab_1.tabpage_4.cb_10.enabled = true	// 준가동삭제
				tab_1.tabpage_4.cb_11.enabled = true	// 준가동저장
				
				// 비가동
				dw6.object.cat1.tabsequence       = 0
				dw6.object.cat2.tabsequence       = 20
				dw6.object.work_man.tabsequence   = 30
				dw6.object.work_etime.tabsequence = 50
				dw6.object.bigo.tabsequence       = 60
		
				// 준가동
				dw8.object.cat1.tabsequence       = 0
				dw8.object.cat2.tabsequence       = 20
				dw8.object.work_man.tabsequence   = 30
				dw8.object.work_etime.tabsequence = 50
				dw8.object.bigo.tabsequence       = 60

				if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" then
					// 생산계획공정_관리자 PASS
				else
					// 생산계획공정_담당자
					if gs_userid = ls_userid OR gs_username = ls_workmanager then
						// 작업장의 계획관리자, 생산관리자 는 PASS
					else
						tab_1.tabpage_4.cb_6.enabled  = false		// 비가동추가
						tab_1.tabpage_4.cb_7.enabled  = false		// 비가동삭제
						tab_1.tabpage_4.cb_8.enabled  = false		// 비가동저장
						
						tab_1.tabpage_4.cb_9.enabled  = false		// 준가동추가
						tab_1.tabpage_4.cb_10.enabled = false		// 준가동삭제
						tab_1.tabpage_4.cb_11.enabled = false		// 준가동저장

						// 비가동
						dw6.object.cat1.tabsequence       = 0
						dw6.object.cat2.tabsequence       = 0
						dw6.object.work_man.tabsequence   = 0
						dw6.object.work_etime.tabsequence = 0
						dw6.object.bigo.tabsequence       = 0
						
						// 준가동
						dw8.object.cat1.tabsequence       = 0
						dw8.object.cat2.tabsequence       = 0
						dw8.object.work_man.tabsequence   = 0
						dw8.object.work_etime.tabsequence = 0
						dw8.object.bigo.tabsequence       = 0
					end if
				end if
			end if			
		end if

		dw6.retrieve( ls_area, ls_wcno, "AA", ls_sdate, ls_edate )
		dw6.getchild("cat2",idwc_cat1)
		idwc_cat1.settransobject(sqlca)
		idwc_cat1.retrieve("비가동시간")

		dw8.retrieve( ls_area, ls_wcno, "BB", ls_sdate, ls_edate )
		dw8.getchild("cat2",idwc_cat2)
		idwc_cat2.settransobject(sqlca)
		idwc_cat2.retrieve("준가동시간")
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcworkman_r
boolean visible = false
integer x = 2779
integer y = 40
integer width = 160
integer height = 184
integer taborder = 110
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcworkman_r
integer x = 1861
integer y = 20
integer width = 1883
integer height = 208
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcworkman_r
integer x = 3767
integer y = 20
integer width = 837
integer height = 208
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcworkman_r
integer x = 1019
integer y = 28
integer width = 133
integer height = 92
integer taborder = 40
string dataobject = "d_mpsfcworkman_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpsfcworkman_r
integer x = 2894
integer y = 140
integer width = 407
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

end event

type em_2 from editmask within w_mpsfcworkman_r
integer x = 3305
integer y = 140
integer width = 407
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 65535
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
string ls_wcno

dw_1.accepttext()
ls_wcno   = trim(dw_1.object.work_no[1])
if ls_wcno = "" then ls_wcno = "%"

//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

end event

type rb_1 from radiobutton within w_mpsfcworkman_r
integer x = 1897
integer y = 64
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일별"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpsfcworkman_r
integer x = 1906
integer y = 140
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월별"
end type

type dw_area from datawindow within w_mpsfcworkman_r
integer x = 2126
integer y = 132
integer width = 526
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area, ls_wcno
long   ll_find

this.accepttext()
ls_area = data

if dw_1.rowcount() > 0 then
	if ls_area = "%" then
		idwc_wc.setfilter( "" )
	else
      idwc_wc.setfilter( "(area_no = 'S0001' OR area_no = 'B0001') AND (work_type = 'D' AND (right(work_no,2) = '00' OR work_no = ' ') ) " )
	end if
	idwc_wc.filter()
end if

end event

type pb_2 from picturebutton within w_mpsfcworkman_r
integer x = 3986
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
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

choose case is_dw
	case "dw_3"
		dwxls = dw3

	case "dw_4"
		dwxls = dw4

	case "dw_5"
		dwxls = dw5

	case "dw_6"
		dwxls = dw6

	case "dw_7"
		dwxls = dw7

	case "dw_8"
		dwxls = dw8

	case "dw_9"
		dwxls = dw9
		
	case else
		MessageBox("확인","생성할 데이터를 선택한 후 작업하시기 바랍니다.")
		return
end choose

if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsAscII(ls_DocName)
		end if
	end if
   //===============================================================//
end if
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_2 from statictext within w_mpsfcworkman_r
integer x = 2683
integer y = 140
integer width = 210
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "기간 :"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpsfcworkman_r
integer x = 2126
integer y = 56
integer width = 526
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsfcworkman_r
integer x = 110
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_mpsfcworkman_r
integer x = 297
integer y = 300
integer width = 443
integer height = 632
integer taborder = 10
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

type st_5 from statictext within w_mpsfcworkman_r
integer x = 768
integer y = 316
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

type ddlb_op from dropdownlistbox within w_mpsfcworkman_r
integer x = 937
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpsfcworkman_r
integer x = 1257
integer y = 308
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

type cb_1 from commandbutton within w_mpsfcworkman_r
integer x = 1829
integer y = 308
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
datawindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsfcworkman_r
integer x = 1993
integer y = 308
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
datawindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsfcworkman_r
integer x = 2158
integer y = 308
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
datawindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsfcworkman_r
integer x = 2322
integer y = 308
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
datawindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_mpsfcworkman_r
integer x = 32
integer y = 252
integer width = 4576
integer height = 160
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsfcworkman_r
integer x = 329
integer y = 312
integer width = 311
integer height = 88
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

type tab_1 from tab within w_mpsfcworkman_r
event create ( )
event destroy ( )
integer x = 32
integer y = 440
integer width = 4576
integer height = 2032
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4539
integer height = 1904
long backcolor = 79741120
string text = "생산성집계"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CrossTab!"
long picturemaskcolor = 536870912
st_6 st_6
cbx_key cbx_key
dw_3 dw_3
dw_7 dw_7
end type

on tabpage_1.create
this.st_6=create st_6
this.cbx_key=create cbx_key
this.dw_3=create dw_3
this.dw_7=create dw_7
this.Control[]={this.st_6,&
this.cbx_key,&
this.dw_3,&
this.dw_7}
end on

on tabpage_1.destroy
destroy(this.st_6)
destroy(this.cbx_key)
destroy(this.dw_3)
destroy(this.dw_7)
end on

type st_6 from statictext within tabpage_1
integer x = 539
integer y = 24
integer width = 1294
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "(스리타,프레스,공무,출고,일반관리 제외)"
boolean focusrectangle = false
end type

type cbx_key from checkbox within tabpage_1
integer x = 82
integer y = 12
integer width = 453
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "주요작업장"
boolean checked = true
end type

event clicked;// 주요작업장
pb_retrieve.triggerevent( clicked! )

end event

type dw_3 from datawindow within tabpage_1
string tag = "d_mpsfcworkman_ct10"
integer x = 9
integer y = 96
integer width = 4507
integer height = 1804
integer taborder = 60
string title = "d_mpsfcworkman_t11"
string dataobject = "d_mpsfcworkman_t10"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event rowfocuschanged;//
string ls_area, ls_wcno, ls_workgrp, ls_sdate, ls_edate
long   ll_row


if isnull(currentrow) OR currentrow < 1 then RETURN

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

// 작업장
dw_1.accepttext()
ls_wcno     = trim(dw_1.object.work_no[1])
if ls_wcno = "" then ls_wcno = "%"

// 선택한 행
ls_workgrp = this.object.work_grp[currentrow]
ls_workgrp = "[" + ls_workgrp + "]"

SELECT work_no INTO :ls_wcno FROM wc WHERE work_name = :ls_workgrp;

ls_sdate   = this.object.sfc_date[currentrow]
ls_edate   = ls_sdate

debugbreak()

dw7.retrieve( ls_area, ls_wcno, ls_sdate, ls_edate )

end event

type dw_7 from datawindow within tabpage_1
integer x = 837
integer y = 540
integer width = 3072
integer height = 804
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcworkmachine_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4539
integer height = 1904
long backcolor = 79741120
string text = "생산실적"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PlaceColumn5!"
long picturemaskcolor = 536870912
cb_4 cb_4
dw_4 dw_4
end type

on tabpage_2.create
this.cb_4=create cb_4
this.dw_4=create dw_4
this.Control[]={this.cb_4,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.cb_4)
destroy(this.dw_4)
end on

type cb_4 from commandbutton within tabpage_2
integer x = 14
integer y = 8
integer width = 658
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "생산품목 그룹관리"
end type

event clicked;// 생산품목 그룹관리
string ls_wcno, ls_itemno, ls_itemnm
long   ll_row, ll_cnt

ll_row = dw_4.getrow()
if ll_row < 1 then RETURN

dw_1.accepttext()

ls_wcno = dw_1.object.work_no[1]
if RightA(ls_wcno,2) <> "00" then ls_wcno = LeftA(ls_wcno,1) + "00"

ls_itemno = dw_4.object.item_no[ll_row]
ls_itemnm = dw_4.object.item_name[ll_row]
if ls_itemno = "" OR isnull(ls_itemno) then RETURN

SELECT count(*) INTO :ll_cnt FROM maketop10 WHERE work_no = :ls_wcno AND item_no = :ls_itemno;
if ll_cnt > 0 then
	// SKIP
else
	if IsValid(w_o_main) then 
		OpenSheet(w_cdmaketop10_m,  w_o_main, 6, original!)
	elseif IsValid(w_i_main) then 
		OpenSheet(w_cdmaketop10_m,  w_i_main, 6, original!)
	elseif IsValid(w_m_main) then 
		OpenSheet(w_cdmaketop10_m,  w_m_main, 6, original!)
	elseif IsValid(w_all_main) then 
		OpenSheet(w_cdmaketop10_m,  w_all_main, 6, original!)
	end if
		
	w_cdmaketop10_m.sle_no.text = ls_itemno
	w_cdmaketop10_m.sle_nm.text = ls_itemnm
	
	w_cdmaketop10_m.dw_3.object.wc_no[1] = ls_wcno
	w_cdmaketop10_m.pb_retrieve.triggerevent( clicked! )
end if

end event

type dw_4 from datawindow within tabpage_2
integer x = 9
integer y = 96
integer width = 4507
integer height = 1804
integer taborder = 60
string title = "none"
string dataobject = "d_mpsfcworkman_t20"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4539
integer height = 1904
long backcolor = 79741120
string text = "근태집계"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Cursor!"
long picturemaskcolor = 536870912
dw_5 dw_5
end type

on tabpage_3.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_3.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_3
integer x = 9
integer y = 96
integer width = 4507
integer height = 1804
integer taborder = 60
string title = "none"
string dataobject = "d_mpsfcworkman_t30"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4539
integer height = 1904
long backcolor = 79741120
string text = "시간(비가동/준가동)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "RetrieveCancel!"
long picturemaskcolor = 536870912
st_9 st_9
st_8 st_8
dw_6 dw_6
dw_8 dw_8
cb_9 cb_9
cb_10 cb_10
cb_11 cb_11
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
end type

on tabpage_4.create
this.st_9=create st_9
this.st_8=create st_8
this.dw_6=create dw_6
this.dw_8=create dw_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.Control[]={this.st_9,&
this.st_8,&
this.dw_6,&
this.dw_8,&
this.cb_9,&
this.cb_10,&
this.cb_11,&
this.cb_8,&
this.cb_7,&
this.cb_6}
end on

on tabpage_4.destroy
destroy(this.st_9)
destroy(this.st_8)
destroy(this.dw_6)
destroy(this.dw_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
end on

type st_9 from statictext within tabpage_4
integer x = 14
integer width = 1541
integer height = 104
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16711935
boolean border = true
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_4
integer x = 14
integer y = 948
integer width = 1541
integer height = 104
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 65280
boolean border = true
boolean focusrectangle = false
end type

type dw_6 from datawindow within tabpage_4
string tag = "d_mpsfcdaytime_r"
integer x = 9
integer y = 96
integer width = 4507
integer height = 852
integer taborder = 60
string title = "d_mpsfcworkmachine_t"
string dataobject = "d_mpsfcworkmachine_t"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 시간계산
datetime ldt_stime,  ldt_etime, ldt_calctime
decimal  ld_workman, ld_calctime

this.accepttext()

ld_workman = this.object.work_man[row]
ldt_stime  = this.object.work_stime[row]
ldt_etime  = this.object.work_etime[row]
ldt_stime  = datetime( date(this.object.work_etime[row]), time("00:00:000") )

SELECT top 1 (datediff(mi, :ldt_stime, :ldt_etime) / 60.0) * :ld_workman INTO :ld_calctime FROM login;
this.object.calc_time[row] = ld_calctime

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

choose case dwo.name
	case "work_man", "work_stime", "work_etime", "bigo"
		this.SelectText(1, LenA(GetText()))		// 전체선택
end choose

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
this.SelectText(1, LenA(GetText()))		// 선택

end event

event getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type dw_8 from datawindow within tabpage_4
integer x = 9
integer y = 1048
integer width = 4507
integer height = 852
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcworkmachine_t"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_8"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

choose case dwo.name
	case "work_man", "work_stime", "work_etime", "bigo"
		this.SelectText(1, LenA(GetText()))		// 전체선택
end choose

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
this.SelectText(1, LenA(GetText()))		// 선택

end event

event itemchanged;// 시간계산
datetime ldt_stime,  ldt_etime, ldt_calctime
decimal  ld_workman, ld_calctime

this.accepttext()

ld_workman = this.object.work_man[row]
ldt_stime  = this.object.work_stime[row]
ldt_etime  = this.object.work_etime[row]
ldt_stime  = datetime( date(this.object.work_etime[row]), time("00:00:000") )

SELECT top 1 (datediff(mi, :ldt_stime, :ldt_etime) / 60.0) * :ld_workman INTO :ld_calctime FROM login;
this.object.calc_time[row] = ld_calctime

end event

event getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type cb_9 from commandbutton within tabpage_4
integer x = 32
integer y = 960
integer width = 416
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;// 준가동추가
long     ll_row
datetime ldt_date
string   ls_area, ls_wcno, ls_workname

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ls_wcno  = trim(dw_1.object.work_no[1])
if isnull(ls_wcno) OR ls_wcno = "" then RETURN

SELECT work_name INTO :ls_workname FROM wc WHERE work_no = :ls_wcno;
ldt_date = datetime(date(em_2.text), time("00:00:000"))

dw8.object.cat1.tabsequence       = 0
dw8.object.cat2.tabsequence       = 20
dw8.object.work_man.tabsequence   = 30
//dw8.object.work_stime.tabsequence = 40
dw8.object.work_etime.tabsequence = 50
dw8.object.bigo.tabsequence       = 60


ll_row   = dw8.insertrow( 0 )

dw8.object.cat1[ll_row]      = "BB"
dw8.object.wc_no[ll_row]     = ls_wcno
dw8.object.work_name[ll_row] = ls_workname
dw8.object.work_day[ll_row]  = ldt_date
dw8.object.area_no[ll_row]   = ls_area
dw8.object.user_id[ll_row]   = gs_userid
dw8.object.user_name[ll_row] = gs_username
dw8.object.sys_date[ll_row]  = gf_today()

end event

type cb_10 from commandbutton within tabpage_4
integer x = 457
integer y = 960
integer width = 416
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;// 준가동삭제
long  ll_row

ll_row  = dw8.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

dw8.deleterow( ll_row )

end event

type cb_11 from commandbutton within tabpage_4
integer x = 878
integer y = 960
integer width = 649
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "준가동시간 저장"
end type

event clicked;// 준가동시간 저장
long     ll_row
datetime ldt_workday, ldt_stime, ldt_etime
decimal  ld_calctime

for ll_row = 1 to dw8.rowcount()
	ldt_workday = dw8.object.work_day[ll_row]

	ldt_stime   = dw8.object.work_stime[ll_row]
	ldt_etime   = dw8.object.work_etime[ll_row]

	ldt_stime = datetime( date(ldt_workday), time(ldt_stime) )
	ldt_etime = datetime( date(ldt_workday), time(ldt_etime) )

	ld_calctime = dw8.object.calc_time[ll_row]
	
	if ld_calctime = 0.0 OR ldt_stime >= ldt_etime OR isnull(ld_calctime) OR isnull(ldt_etime) then
		MessageBox("확인","시작시간과 종료시간을 확인 하시기 바랍니다.")
		RETURN
	end if
next

wf_update1( dw8, "Y" )

dw8.object.cat1.tabsequence       = 0
dw8.object.cat2.tabsequence       = 0
dw8.object.work_man.tabsequence   = 0
//dw8.object.work_stime.tabsequence = 0
dw8.object.work_etime.tabsequence = 0
dw8.object.bigo.tabsequence       = 0

end event

type cb_8 from commandbutton within tabpage_4
integer x = 878
integer y = 12
integer width = 649
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "비가동시간 저장"
end type

event clicked;// 비가동시간 저장
long     ll_row
datetime ldt_workday, ldt_stime, ldt_etime
decimal  ld_calctime

debugbreak()

for ll_row = 1 to dw6.rowcount()
	ldt_workday = dw6.object.work_day[ll_row]

	ldt_stime   = dw6.object.work_stime[ll_row]
	ldt_etime   = dw6.object.work_etime[ll_row]

	ldt_stime   = datetime( date(ldt_workday), time(ldt_stime) )
	ldt_etime   = datetime( date(ldt_workday), time(ldt_etime) )

	ld_calctime = dw6.object.calc_time[ll_row]

	if ldt_stime >= ldt_etime OR isnull(ldt_etime) then
		MessageBox("확인","시작시간과 종료시간을 확인 하시기 바랍니다.")
		RETURN
	end if
next

wf_update1( dw6, "Y" )

dw6.object.cat1.tabsequence       = 0
dw6.object.cat2.tabsequence       = 0
dw6.object.work_man.tabsequence   = 0
//dw6.object.work_stime.tabsequence = 0
dw6.object.work_etime.tabsequence = 0
dw6.object.bigo.tabsequence       = 0

end event

type cb_7 from commandbutton within tabpage_4
integer x = 457
integer y = 12
integer width = 416
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;// 비가동삭제
long  ll_row

ll_row  = dw6.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

dw6.deleterow( ll_row )

end event

type cb_6 from commandbutton within tabpage_4
integer x = 32
integer y = 12
integer width = 416
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;// 비가동추가
long     ll_row
datetime ldt_date
string   ls_area, ls_wcno, ls_workname

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ls_wcno  = trim(dw_1.object.work_no[1])
if isnull(ls_wcno) OR ls_wcno = "" then RETURN

SELECT work_name INTO :ls_workname FROM wc WHERE work_no = :ls_wcno;
ldt_date = datetime(date(em_2.text), time("00:00:000"))

dw6.object.cat1.tabsequence       = 0
dw6.object.cat2.tabsequence       = 20
dw6.object.work_man.tabsequence   = 30
//dw6.object.work_stime.tabsequence = 40
dw6.object.work_etime.tabsequence = 50
dw6.object.bigo.tabsequence       = 60


ll_row   = dw6.insertrow( 0 )

dw6.object.cat1[ll_row]      = "AA"
dw6.object.wc_no[ll_row]     = ls_wcno
dw6.object.work_name[ll_row] = ls_workname
dw6.object.work_day[ll_row]  = ldt_date
dw6.object.area_no[ll_row]   = ls_area
dw6.object.user_id[ll_row]   = gs_userid
dw6.object.user_name[ll_row] = gs_username
dw6.object.sys_date[ll_row]  = gf_today()

end event

type st_1 from statictext within w_mpsfcworkman_r
integer x = 41
integer y = 212
integer width = 1335
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
string text = "YSP사업장 ==> 시화사업장으로 처리함"
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_mpsfcworkman_r
integer x = 2706
integer y = 312
integer width = 174
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
string text = "주"
boolean checked = true
end type

event clicked;// 1주일
string   ls_area, ls_workname, ls_sdate, ls_edate
datetime ldt_date

ls_edate = em_2.text

SELECT top 1 dateadd(Week, -1, :ls_edate) INTO :ldt_date FROM login;

if this.checked = true then
	em_1.text = string(ldt_date, "yyyy/mm/dd")
else
	em_1.text = string(gf_today(),"yyyy/mm/01")
end if

end event

type rb_4 from radiobutton within w_mpsfcworkman_r
integer x = 2880
integer y = 312
integer width = 174
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
string text = "월"
end type

event clicked;// 1달
string   ls_area, ls_workname, ls_sdate, ls_edate
datetime ldt_date

ls_edate = em_2.text

SELECT top 1 dateadd(month, -1, :ls_edate) INTO :ldt_date FROM login;

if this.checked = true then
	em_1.text = string(ldt_date, "yyyy/mm/dd")
else
	em_1.text = string(gf_today(),"yyyy/mm/01")
end if

end event

type rb_5 from radiobutton within w_mpsfcworkman_r
integer x = 3054
integer y = 312
integer width = 242
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
string text = "3월"
end type

event clicked;// 분기
string   ls_area, ls_workname, ls_sdate, ls_edate
datetime ldt_date

ls_edate = em_2.text

SELECT top 1 dateadd(quarter, -1, :ls_edate) INTO :ldt_date FROM login;

if this.checked = true then
	em_1.text = string(ldt_date, "yyyy/mm/dd")
else
	em_1.text = string(gf_today(),"yyyy/mm/01")
end if

end event

type rb_6 from radiobutton within w_mpsfcworkman_r
integer x = 3296
integer y = 312
integer width = 174
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
string text = "년"
end type

event clicked;// 년
string   ls_area, ls_workname, ls_sdate, ls_edate
datetime ldt_date

ls_edate = em_2.text

SELECT top 1 dateadd(year, -1, :ls_edate) INTO :ldt_date FROM login;

if this.checked = true then
	em_1.text = string(ldt_date, "yyyy/mm/dd")
else
	em_1.text = string(gf_today(),"yyyy/mm/01")
end if

end event

type st_7 from statictext within w_mpsfcworkman_r
integer x = 2674
integer y = 60
integer width = 210
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "작업장"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

