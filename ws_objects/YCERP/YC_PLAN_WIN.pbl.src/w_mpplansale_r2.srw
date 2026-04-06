$PBExportHeader$w_mpplansale_r2.srw
$PBExportComments$생산계획조회2
forward 
global type w_mpplansale_r2 from w_inheritance
end type
type em_1 from editmask within w_mpplansale_r2
end type
type em_2 from editmask within w_mpplansale_r2
end type
type st_2 from statictext within w_mpplansale_r2
end type
type st_1 from statictext within w_mpplansale_r2
end type
type dw_area from datawindow within w_mpplansale_r2
end type
type pb_excel from picturebutton within w_mpplansale_r2
end type
type tab_1 from tab within w_mpplansale_r2
end type
type tabpage_1 from userobject within tab_1
end type
type cb_9 from commandbutton within tabpage_1
end type
type cb_8 from commandbutton within tabpage_1
end type
type cb_13 from commandbutton within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_9 cb_9
cb_8 cb_8
cb_13 cb_13
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_7 cb_7
dw_4 dw_4
end type
type tabpage_3 from userobject within tab_1
end type
type cbx_form from checkbox within tabpage_3
end type
type rb_7 from radiobutton within tabpage_3
end type
type rb_6 from radiobutton within tabpage_3
end type
type rb_5 from radiobutton within tabpage_3
end type
type dw_9 from datawindow within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type dw_10 from datawindow within tabpage_3
end type
type dw_11 from datawindow within tabpage_3
end type
type dw_12 from datawindow within tabpage_3
end type
type dw_5 from datawindow within tabpage_3
end type
type dw_13 from datawindow within tabpage_3
end type
type dw_14 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cbx_form cbx_form
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
dw_9 dw_9
st_8 st_8
dw_10 dw_10
dw_11 dw_11
dw_12 dw_12
dw_5 dw_5
dw_13 dw_13
dw_14 dw_14
end type
type tabpage_4 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_4
end type
type rb_4 from radiobutton within tabpage_4
end type
type rb_3 from radiobutton within tabpage_4
end type
type rb_2 from radiobutton within tabpage_4
end type
type rb_1 from radiobutton within tabpage_4
end type
type cbx_1 from checkbox within tabpage_4
end type
type st_3 from statictext within tabpage_4
end type
type cbx_view from checkbox within tabpage_4
end type
type dw_6 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_8 dw_8
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
st_3 st_3
cbx_view cbx_view
dw_6 dw_6
end type
type tabpage_5 from userobject within tab_1
end type
type cbx_process from checkbox within tabpage_5
end type
type cbx_work from checkbox within tabpage_5
end type
type rb_10 from radiobutton within tabpage_5
end type
type rb_9 from radiobutton within tabpage_5
end type
type rb_8 from radiobutton within tabpage_5
end type
type cb_11 from commandbutton within tabpage_5
end type
type cb_10 from commandbutton within tabpage_5
end type
type ddlb_time from dropdownlistbox within tabpage_5
end type
type em_day from editmask within tabpage_5
end type
type st_7 from statictext within tabpage_5
end type
type cbx_all from checkbox within tabpage_5
end type
type dw_16 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cbx_process cbx_process
cbx_work cbx_work
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
cb_11 cb_11
cb_10 cb_10
ddlb_time ddlb_time
em_day em_day
st_7 st_7
cbx_all cbx_all
dw_16 dw_16
end type
type tab_1 from tab within w_mpplansale_r2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type cb_1 from commandbutton within w_mpplansale_r2
end type
type st_5 from statictext within w_mpplansale_r2
end type
type st_time from statictext within w_mpplansale_r2
end type
type cb_6 from commandbutton within w_mpplansale_r2
end type
type st_10 from statictext within w_mpplansale_r2
end type
type st_4 from statictext within w_mpplansale_r2
end type
type ddlb_fld from dropdownlistbox within w_mpplansale_r2
end type
type ddlb_dwtitles from dropdownlistbox within w_mpplansale_r2
end type
type st_6 from statictext within w_mpplansale_r2
end type
type ddlb_op from dropdownlistbox within w_mpplansale_r2
end type
type sle_value from singlelineedit within w_mpplansale_r2
end type
type cb_2 from commandbutton within w_mpplansale_r2
end type
type cb_3 from commandbutton within w_mpplansale_r2
end type
type cb_4 from commandbutton within w_mpplansale_r2
end type
type cb_5 from commandbutton within w_mpplansale_r2
end type
type dw_7 from datawindow within w_mpplansale_r2
end type
type dw_15 from datawindow within w_mpplansale_r2
end type
type cbx_op from checkbox within w_mpplansale_r2
end type
type dw_17 from datawindow within w_mpplansale_r2
end type
type gb_4 from groupbox within w_mpplansale_r2
end type
end forward

global type w_mpplansale_r2 from w_inheritance
integer x = 5
integer y = 72
integer width = 4626
integer height = 2576
string title = "생산계획 조회(w_mpplansale_r2)"
boolean resizable = false
string icon = "OleGenReg!"
em_1 em_1
em_2 em_2
st_2 st_2
st_1 st_1
dw_area dw_area
pb_excel pb_excel
tab_1 tab_1
cb_1 cb_1
st_5 st_5
st_time st_time
cb_6 cb_6
st_10 st_10
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
dw_7 dw_7
dw_15 dw_15
cbx_op cbx_op
dw_17 dw_17
gb_4 gb_4
end type
global w_mpplansale_r2 w_mpplansale_r2

type variables
st_print i_print
string is_wcname, is_area, is_saleno, is_dw

string is_wcno, is_itemno, is_duedate, is_purtype		// dw8 새로고침

DataWindowChild idwc_area, idwc_cust, idwc_wc
datawindow  dw3, dw4, dw5, dw6, dw7, dw8, dw9, dw10, dw11, dw12, dw13, dw14, dw15, dw16

end variables

forward prototypes
public subroutine wf_area (string as_area)
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
public function integer wf_daycnt (string ls_yymm)
end prototypes

public subroutine wf_area (string as_area);string ls_name

SELECT REPLACE(area_name,'사업장','') INTO :ls_name 
  FROM area
 WHERE area_no = :as_area;

end subroutine

public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col);// string = wf_crosstab_title( arg_dw )
string ls_col, ls_value, ls_today
long   ll_row, ll_col

ll_row    = al_row
ll_col    = al_col

integer  li_pos,  li_nextpos, li_header1, li_header2, li_colx, li_colcount
long     i, j, ll_bands,   ll_objects
string   ls_objects, ls_object[], ls_detail[], ls_coltext[], ls_objtype[], ls_objx[]
string   ls_objname, ls_band, ls_bands, ls_bandname[]
string   ls_header[], ls_lastheader, ls_title, ls_colname, ls_type, ls_visible

ls_today = string(gf_today(), "mm/dd")

//-----------------------------------------------------------------------------
// 크로스탭 형식일 때에는 StaticMode를 설정해야 필드 접근가능.
//-----------------------------------------------------------------------------
if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = 'Yes'
end if

//-----------------------------------------------------------------------------
// 데이터윈도의 모든 오브젝트를 읽어온다.
//-----------------------------------------------------------------------------
ls_objects = arg_dw.Describe("DataWindow.objects")
	 
//-----------------------------------------------------------------------------
// Crosstab의 Title을 위해 밴드구분 처리
//-----------------------------------------------------------------------------
ls_bands = arg_dw.object.Datawindow.bands
ll_bands = GF_SPLIT(ls_bands, "~t", ls_bandname)

for i = 1 to upperbound(ls_bandname)
   if upper(LeftA(ls_bandname[i], 4)) = 'HEAD' then
      li_pos = PosA(ls_bandname[i], '[')
      if li_pos > 0 then
         li_nextpos = PosA(ls_bandname[i], ']')
         li_header1 = integer(MidA(ls_bandname[i], li_pos + 1, li_nextpos - li_pos - 1))
         if li_header1 > li_header2 then li_header2 = li_header1
      end if
   end if
next
if li_header2 = 0 then
   ls_lastheader = 'HEADER'
else
   ls_lastheader = 'HEADER[' + string(li_header2) + ']'
end if

//-----------------------------------------------------------------------------
// 오브젝트를 분리 저장
//-----------------------------------------------------------------------------
ll_objects = GF_SPLIT(ls_objects, '~t', ls_object)

for i = 1 to upperbound(ls_object)
   ls_objname = trim(ls_object[i])
   ls_type    = upper(arg_dw.describe( ls_objname + ".type" ))
	
   if ls_type = 'COLUMN' OR ls_type = 'COMPUTE' then
      ls_band = upper(arg_dw.describe( ls_objname + ".band" ))
      if ls_band = 'DETAIL' then
         ls_visible = upper(arg_dw.describe( ls_objname + ".visible" ))
         if ls_visible = '1' then
            j++
				
            ls_detail[j]  = ls_objname
            ls_objtype[j] = ls_type
         end if
      end if
	elseif ls_type = "TEXT" then
      ls_band = upper(arg_dw.describe( ls_objname + ".band" ))
      if ls_band = ls_lastheader then
         li_pos = integer(arg_dw.describe( ls_objname + ".x" ))
			if li_pos > 0 then ls_header[li_pos] = ls_objname
      end if
	end if
next

//-----------------------------------------------------------------------------
//   Header title 삽입
//-----------------------------------------------------------------------------
li_colcount = upperbound(ls_detail)
for j = 1 to li_colcount
   ls_colname    = arg_dw.Describe(ls_detail[J] + ".name")
   li_pos        = integer(arg_dw.Describe(ls_detail[j] + ".x"))
	if li_pos > 0 then
		ls_coltext[j] = arg_dw.Describe(ls_header[li_pos] + ".text" )

      if j = al_col then
			ls_title = ls_coltext[j]
		end if
		
		if ls_today = ls_coltext[j] then
			arg_dw.Modify(ls_colname + ".Background.Mode='0'")
			arg_dw.Modify(ls_colname + ".Background.Color='11665407'")	// 연노랑
		end if
	end if
next

arg_dw.object.DataWindow.CrossTab.StaticMode = "No"

RETURN ls_title

end function

public function integer wf_daycnt (string ls_yymm);int li_daycnt, li_year, li_month
boolean lb_leapyear

li_year  = integer(LeftA(ls_yymm,4))
li_month = integer(MidA(ls_yymm,5,2))

CHOOSE CASE li_month
	CASE 1, 3, 5, 7, 8, 10, 12
		li_daycnt = 31
	CASE 4, 6, 9, 11
		li_daycnt = 30
	CASE 2
		IF Mod(li_year,400) = 0 THEN
			lb_leapyear = TRUE
		ELSEIF Mod(li_year,100) = 0 THEN
			lb_leapyear = FALSE
		ELSEIF Mod(li_year, 4) = 0 THEN
			lb_leapyear = TRUE
		ELSE
			lb_leapyear = FALSE
		END IF

		IF lb_leapyear THEN li_daycnt = 29 ELSE li_daycnt = 28
END CHOOSE

RETURN li_daycnt

end function

on w_mpplansale_r2.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_1=create st_1
this.dw_area=create dw_area
this.pb_excel=create pb_excel
this.tab_1=create tab_1
this.cb_1=create cb_1
this.st_5=create st_5
this.st_time=create st_time
this.cb_6=create cb_6
this.st_10=create st_10
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_7=create dw_7
this.dw_15=create dw_15
this.cbx_op=create cbx_op
this.dw_17=create dw_17
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_excel
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_time
this.Control[iCurrent+11]=this.cb_6
this.Control[iCurrent+12]=this.st_10
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_3
this.Control[iCurrent+21]=this.cb_4
this.Control[iCurrent+22]=this.cb_5
this.Control[iCurrent+23]=this.dw_7
this.Control[iCurrent+24]=this.dw_15
this.Control[iCurrent+25]=this.cbx_op
this.Control[iCurrent+26]=this.dw_17
this.Control[iCurrent+27]=this.gb_4
end on

on w_mpplansale_r2.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.pb_excel)
destroy(this.tab_1)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.st_time)
destroy(this.cb_6)
destroy(this.st_10)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_7)
destroy(this.dw_15)
destroy(this.cbx_op)
destroy(this.dw_17)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_clause, ls_where

dw3  = tab_1.tabpage_1.dw_3
dw4  = tab_1.tabpage_2.dw_4
dw5  = tab_1.tabpage_3.dw_5
dw6  = tab_1.tabpage_4.dw_6
dw7  = dw_7
dw8  = tab_1.tabpage_4.dw_8
dw9  = tab_1.tabpage_3.dw_9
dw10 = tab_1.tabpage_3.dw_10
dw11 = tab_1.tabpage_3.dw_11
dw12 = tab_1.tabpage_3.dw_12
dw13 = tab_1.tabpage_3.dw_13
dw14 = tab_1.tabpage_3.dw_14
dw15 = dw_15
dw16 = tab_1.tabpage_5.dw_16

dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)
dw8.SetTransObject(SQLCA)
dw9.settransobject(sqlca)
dw10.settransobject(sqlca)
dw11.settransobject(sqlca)
dw12.settransobject(sqlca)
dw13.settransobject(sqlca)
dw14.settransobject(sqlca)
dw15.settransobject(sqlca)
dw16.settransobject(sqlca)
dw_17.settransobject(sqlca)

dw_1.visible  = false
dw7.visible   = false
dw13.visible  = false	// 전월
dw14.visible  = false	// 익월
dw15.visible  = false	// 수주공정진행
dw_17.visible = false

//dw16.object.job1_flag.width = 0
//dw16.object.job2_flag.width = 0
//dw16.object.job3_flag.width = 0

pb_delete.enabled = false
pb_save.enabled   = false

if gs_userid = "1999010s" then
else
tab_1.tabpage_3.enabled = false		// 월계표(조정)
tab_1.tabpage_4.enabled = false		// 생산계획표(납기일)
tab_1.tabpage_5.enabled = false		// 수주별 공정관리
end if

/////////////////////////////////
// 사업장
/////////////////////////////////
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
//idwc_area.insertrow(1)
//idwc_area.setitem(1, 'area_no', ' ')
//idwc_area.setitem(1, 'area_name', '전체사업장')
//idwc_area.accepttext()

if gs_area = "S0001" OR gs_area = "T0001" then
	dw_area.object.area[1] = gs_area
else
	dw_area.object.area[1] = "S0001" //gs_area
end if
dw_area.accepttext()

// 작업장
dw_2.insertrow(0)
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,"work_no"," ")
idwc_wc.setitem(1,"work_name","전체")
idwc_wc.accepttext()

// 거래처
dw9.insertrow(0)  
idwc_cust.setredraw(false)
dw9.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")
dw9.object.cust_no[1] = "%"

dw3.object.pri.width = 0	// 순위

em_1.text = string(gf_today(),'yyyy/mm/dd')
em_2.text = string(gf_today(),'yyyy/mm/dd')
tab_1.tabpage_5.em_day.text = string(gf_today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_4.width   = newwidth  - (gb_4.x * 2)

tab_1.width  = newwidth  - (gb_4.x * 2)
tab_1.height = newheight - tab_1.y - gb_4.x

dw_17.x = tab_1.x ; dw_17.y = tab_1.y
dw_17.width = tab_1.width ; dw_17.height = tab_1.height

tab_1.tabpage_1.dw_3.width  = tab_1.width  - 91
tab_1.tabpage_1.dw_3.height = tab_1.height - 232

tab_1.tabpage_2.dw_4.width  = tab_1.width  - 91
tab_1.tabpage_2.dw_4.height = tab_1.height - 232

// Tabpage_3
// 거래처
tab_1.tabpage_3.dw_10.height = tab_1.height - 232
tab_1.tabpage_3.dw_10.height = 1732			// 1964

// 월계표(전월)
if ge_Environment.screenwidth < 1025 then tab_1.tabpage_3.dw_13.Object.DataWindow.Zoom = 80
tab_1.tabpage_3.dw_13.x      = 1549
tab_1.tabpage_3.dw_13.y      = 92
tab_1.tabpage_3.dw_13.width  = tab_1.width  - 1417
tab_1.tabpage_3.dw_13.height = 1732			// Large: 1964
// 월계표(당월)
if ge_Environment.screenwidth < 1025 then tab_1.tabpage_3.dw_5.Object.DataWindow.Zoom = 80
tab_1.tabpage_3.dw_5.x       = 1549
tab_1.tabpage_3.dw_5.y       = 92
tab_1.tabpage_3.dw_5.width   = tab_1.width  - 1417
tab_1.tabpage_3.dw_5.height  = 1732			// Large: 1964
// 월계표(익월)
if ge_Environment.screenwidth < 1025 then tab_1.tabpage_3.dw_14.Object.DataWindow.Zoom = 80
tab_1.tabpage_3.dw_14.x      = 1549
tab_1.tabpage_3.dw_14.y      = 92
tab_1.tabpage_3.dw_14.width  = tab_1.width  - 1417
tab_1.tabpage_3.dw_14.height = 1732			// Large: 1964

// 일정상세
tab_1.tabpage_3.dw_11.y      = tab_1.tabpage_3.dw_5.y + tab_1.tabpage_3.dw_5.height + 8
tab_1.tabpage_3.dw_11.width  = tab_1.tabpage_3.dw_10.width
tab_1.tabpage_3.dw_11.height = tab_1.height - 232  - tab_1.tabpage_3.dw_5.height - 8

tab_1.tabpage_3.dw_12.y      = tab_1.tabpage_3.dw_5.y + tab_1.tabpage_3.dw_5.height + 8
tab_1.tabpage_3.dw_12.width  = tab_1.width  - 1417
tab_1.tabpage_3.dw_12.height = tab_1.height - 232  - tab_1.tabpage_3.dw_5.height - 8

// Tabpage_4
// 집계
tab_1.tabpage_4.dw_6.width  = tab_1.width  - 91
tab_1.tabpage_4.dw_6.height = tab_1.tabpage_4.height * 0.6

// 상세
tab_1.tabpage_4.dw_8.y      = tab_1.tabpage_4.dw_6.y + tab_1.tabpage_4.dw_6.height + 8
tab_1.tabpage_4.dw_8.width  = tab_1.width  - 91
tab_1.tabpage_4.dw_8.height = tab_1.tabpage_4.height - tab_1.tabpage_4.dw_6.y - tab_1.tabpage_4.dw_6.height - 8

dw_7.width  = tab_1.width  * 0.7
dw_7.height = tab_1.height * 0.6
dw_7.x      = (newwidth  - dw_7.width ) / 2
dw_7.y      = (newheight - dw_7.height) / 2

// 수주공정진행
dw_15.width  = tab_1.width  * 0.7		//	tab_1.width  - 110
dw_15.height = tab_1.height * 0.6		// tab_1.height - 230
dw_15.x      = (newwidth  - dw_15.width ) / 2
dw_15.y      = tab_1.y + 205

// 수주공정진행
tab_1.tabpage_5.dw_16.width  = tab_1.width  - 91
tab_1.tabpage_5.dw_16.height = tab_1.height - 232

end event

type pb_save from w_inheritance`pb_save within w_mpplansale_r2
integer x = 3767
integer y = 64
end type

event pb_save::clicked;call super::clicked;//
string  ls_uptchk, ls_saleno, ls_wcno, ls_itemno, ls_duedate, ls_purtype, ls_search, ls_intime, ls_chktime
long    ll_row, ll_seqno, ll_found, ll_dw15cnt, ll_seq, ll_qty1, ll_qty2, ll_qty3
integer li_cnt1, li_cnt2, li_cnt3

if GF_PERMISSION("생산계획_조회저장", gs_userid) = "Y" then	
else
	MessageBox("확인","생산계획_조회저장 권한이 존재하지 않습니다.")
end if

dw15.accepttext()
dw16.accepttext()
if dw16.rowcount() < 1 then RETURN

// Font.TextColor Change: if ( job1_in <> job1_inchk OR job1_qty <> job1_qty1, rgb(255, 0, 0), rgb(0, 0, 0) )

for ll_row = 1 to dw16.rowcount()
	ls_uptchk = dw16.object.uptchk[ll_row]
//	if dw16.object.w1nm.font.textcolor[ll_row] then
//		
//	end if
next

for ll_row = 1 to dw16.rowcount()
	ls_uptchk = dw16.object.uptchk[ll_row]
	
	if ls_uptchk = "Y" then
		ls_saleno = dw16.object.order_no[ll_row]
		ll_seqno  = dw16.object.seq_no[ll_row]
		
		ls_search = "sale_no = '" + ls_saleno + "' AND seq_no = " + string(ll_seqno)
      ll_found  = dw15.Find( ls_search, 1, dw15.RowCount() )
		// UPDATE
		if ll_found > 0 then 
			li_cnt1 = 0 ; li_cnt2 = 0 ; li_cnt3 = 0
			
			li_cnt1 = dw16.object.job1_cnt[ll_row]		// isnull 처리함
			li_cnt2 = dw16.object.job2_cnt[ll_row]		// isnull 처리함
			li_cnt3 = dw16.object.job3_cnt[ll_row]		// isnull 처리함

			// 화면
			ls_intime  = string(dw16.object.job1_in[ll_row])
			ls_chktime = string(dw16.object.job1_inchk[ll_row])
			if ls_intime <> ls_chktime then li_cnt1++

			ls_intime  = string(dw16.object.job2_in[ll_row])
			ls_chktime = string(dw16.object.job2_inchk[ll_row])
			if ls_intime <> ls_chktime then li_cnt2++

			ls_intime  = string(dw16.object.job3_in[ll_row])
			ls_chktime = string(dw16.object.job3_inchk[ll_row])
			if ls_intime <> ls_chktime then li_cnt3++

			dw16.object.job1_cnt[ll_row] = li_cnt1
			dw16.object.job2_cnt[ll_row] = li_cnt2
			dw16.object.job3_cnt[ll_row] = li_cnt3
			
			// DB			
			dw15.object.job1[ll_found]          = dw16.object.job1[ll_row]
			dw15.object.job1_inchk[ll_found]    = dw16.object.job1_inchk[ll_row]
			dw15.object.job1_qty[ll_found]      = dw16.object.job1_qty[ll_row]
			dw15.object.job1_cnt[ll_found]      = li_cnt1
			
			dw15.object.job2[ll_found]          = dw16.object.job2[ll_row]
			dw15.object.job2_inchk[ll_found]    = dw16.object.job2_inchk[ll_row]
			dw15.object.job2_qty[ll_found]      = dw16.object.job2_qty[ll_row]
			dw15.object.job2_cnt[ll_found]      = li_cnt2
			
			dw15.object.job3[ll_found]          = dw16.object.job3[ll_row]
			dw15.object.job3_inchk[ll_found]    = dw16.object.job3_inchk[ll_row]
			dw15.object.job3_qty[ll_found]      = dw16.object.job3_qty[ll_row]
			dw15.object.job3_cnt[ll_found]      = li_cnt3
		// INSERT
		else
			ll_dw15cnt = dw15.insertrow(0)
			
			dw15.ScrollToRow( ll_dw15cnt )
			
			li_cnt1 = 0 ; li_cnt2 = 0 ; li_cnt3 = 0

			// 화면
			ls_intime  = string(dw16.object.job1_in[ll_row])
			ls_chktime = string(dw16.object.job1_inchk[ll_row])
			if ls_intime <> ls_chktime OR not isnull(ls_chktime) then li_cnt1++
			
			ls_intime  = string(dw16.object.job2_in[ll_row])
			ls_chktime = string(dw16.object.job2_inchk[ll_row])
			if ls_intime <> ls_chktime OR not isnull(ls_chktime) then li_cnt2++
			
			ls_intime  = string(dw16.object.job3_in[ll_row])
			ls_chktime = string(dw16.object.job3_inchk[ll_row])
			if ls_intime <> ls_chktime OR not isnull(ls_chktime) then li_cnt3++

			dw16.object.job1_cnt[ll_row]  = li_cnt1
			dw16.object.job2_cnt[ll_row]  = li_cnt2
			dw16.object.job3_cnt[ll_row]  = li_cnt3
			dw16.object.sp0[ll_row]       = 1
		
			// DB
			dw15.object.sale_no[ll_dw15cnt]     = dw16.object.order_no[ll_row]
			dw15.object.seq_no[ll_dw15cnt]      = dw16.object.seq_no[ll_row]
			dw15.object.order_date[ll_dw15cnt]  = dw16.object.order_date[ll_row]
			
			dw15.object.job1[ll_dw15cnt]        = dw16.object.job1[ll_row]
			dw15.object.job1_inchk[ll_dw15cnt]  = dw16.object.job1_inchk[ll_row]
			dw15.object.job1_qty[ll_dw15cnt]    = dw16.object.job1_qty[ll_row]
			dw15.object.job1_cnt[ll_dw15cnt]    = li_cnt1
			
			dw15.object.job2[ll_dw15cnt]        = dw16.object.job2[ll_row]
			dw15.object.job2_inchk[ll_dw15cnt]  = dw16.object.job2_inchk[ll_row]
			dw15.object.job2_qty[ll_dw15cnt]    = dw16.object.job2_qty[ll_row]
			dw15.object.job2_cnt[ll_dw15cnt]    = li_cnt2
			
			dw15.object.job3[ll_dw15cnt]        = dw16.object.job3[ll_row]
			dw15.object.job3_inchk[ll_dw15cnt]  = dw16.object.job3_inchk[ll_row]
			dw15.object.job3_qty[ll_dw15cnt]    = dw16.object.job3_qty[ll_row]
			dw15.object.job3_cnt[ll_dw15cnt]    = li_cnt3
		end if
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
if wf_update1(dw15,"N") = false then
	RETURN
end if

// 전체
tab_1.tabpage_5.cbx_all.checked = false

// 작업일1, 작업일2, 작업일3 
tab_1.tabpage_5.rb_8.checked  = false
tab_1.tabpage_5.rb_9.checked  = false
tab_1.tabpage_5.rb_10.checked = false

// 수주별 공정관리
string ls_custno, ls_scene, ls_sdate, ls_edate, ls_work
datetime ld_time

SELECT top 1 getdate() INTO :ld_time FROM login;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")

ls_sdate  = em_1.text
ls_edate  = em_2.text

if tab_1.tabpage_5.cbx_work.checked = true then
	ls_work = "Y"
else
	ls_work = "N"
end if

ls_custno = "%"
ls_scene  = "%"
dw15.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )			
dw16.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
MessageBox("확인","저장완료")

end event

type dw_1 from w_inheritance`dw_1 within w_mpplansale_r2
integer x = 187
integer y = 176
integer width = 119
integer height = 84
string dataobject = "d_mpplansale_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::rowfocuschanged;//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then
//	return
//end if
//
//is_wcno = dw_1.object.wc_no[ll_row]
//dw_2.retrieve(is_wcno)
//tab_1.tabpage_1.dw_3.retrieve(is_wcno,id_start,id_end)
//
end event

type st_title from w_inheritance`st_title within w_mpplansale_r2
integer x = 32
integer y = 20
integer width = 901
string text = "생산계획 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpplansale_r2
end type

type pb_compute from w_inheritance`pb_compute within w_mpplansale_r2
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpplansale_r2
boolean visible = false
integer x = 2295
end type

type pb_close from w_inheritance`pb_close within w_mpplansale_r2
integer x = 3968
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;//
dwItemStatus l_status


dw16.accepttext()

l_status = dw16.GetItemStatus(1, 0, primary!)
if l_status = NotModified!	 then
else
	if MessageBox("확인","현재 작업한 상태를 무시하고 종료하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpplansale_r2
integer x = 3570
integer y = 64
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpplansale_r2
boolean visible = false
integer x = 2107
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpplansale_r2
integer x = 3177
integer y = 64
integer taborder = 160
end type

event pb_delete::clicked;call super::clicked;// 삭제
long     ll_row, ll_upt, ll_seqno, ll_cnt
string   ls_saleno, ls_seqno, ls_chk
datetime ldt_orderdate

if dw16.rowcount() < 1 then RETURN

for ll_row = 1 to dw16.rowcount()
	ls_chk = dw16.object.chk[ll_row]
	if ls_chk = "Y" then ll_cnt++
next

if ll_cnt > 0 then
	if MessageBox("확인","선택한 대상을 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN
	
	for ll_row = 1 to dw16.rowcount()
		ls_chk        = dw16.object.chk[ll_row]

		ls_saleno     = dw16.object.order_no[ll_row]
		ll_seqno      = dw16.object.seq_no[ll_row]
		ldt_orderdate = dw16.object.order_date[ll_row]
		
		if ls_chk = "Y" then
			SELECT count(*) INTO :ll_upt FROM routcheck WHERE sale_no = :ls_saleno AND seq_no = :ll_seqno;
			if ll_upt = 0 then
				INSERT INTO routcheck ( sale_no, seq_no, order_date, del_yn )
				VALUES ( :ls_saleno, :ll_seqno, :ldt_orderdate, "Y" );
				if sqlca.sqldbcode <> 0 then
					MessageBox("오류","routcheck INSERT " + string(ll_row) + " 번째줄 오류발생.~r~n" + SQLCA.sqlerrtext,exclamation!)
					rollback;
					exit
				end if					
			else
				UPDATE routcheck SET del_yn = 'Y' WHERE sale_no = :ls_saleno AND seq_no = :ll_seqno;
				if sqlca.sqldbcode <> 0 then
					MessageBox("오류","routcheck UPDATE중 " + string(ll_row) + " 번째줄 오류발생.~r~n" + SQLCA.sqlerrtext,exclamation!)
					rollback;
					exit
				end if	
			end if
		end if
	next
	
	pb_retrieve.triggerevent( clicked! )
else
	MessageBox("확인","공정관리 대상에서 제외할 대상을 선택하시기 바랍니다.")
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpplansale_r2
boolean visible = false
integer x = 1723
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpplansale_r2
integer x = 2981
integer y = 64
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_sdate, ls_edate, ls_yyyymm, ls_yyyy, ls_mm, ls_today, ls_yday, ls_nday
string ls_custno, ls_scene, ls_wcno, ls_wcname, ls_flag, ls_Filter, ls_colx, ls_work
string ls_planflag, ls_title, ls_purtype
long   ll_row

DateTime ld_time

int      li_loop, li_fpos, li_fday, li_firstday, li_daycnt, li_lastpos
		
GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

SELECT top 1 convert(char(10), getdate(), 111)
     , convert(char(10), dateadd(day, - day(getdate()), getdate()), 111)
     , convert(char(10), dateadd(month, 1, getdate()), 111)
  INTO :ls_today, :ls_yday, :ls_nday
  FROM login;

ls_yyyymm    = string(date(ls_today),"yyyymm")		
ls_yyyy      = string(date(ls_today),"yyyy")		
ls_mm        = string(date(ls_today),"mm")		

ls_sdate = em_1.text
ls_edate = em_2.text

SELECT top 1 getdate() INTO :ld_time FROM login;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")

dw_17.retrieve( ls_sdate, ls_edate )

// 성형제외
if tab_1.tabpage_5.cbx_work.checked = true then
	ls_work = "Y"
else
	ls_work = "N"
end if

// 사업장
ls_area   = dw_area.object.area[1]

ls_wcno   = dw_2.object.wc_no[1]
ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname = trim(ls_wcname) + "%"  //작업장명

// 전체(%), 주문발주(O), 재고발주(S), 주문+재고(M)
if tab_1.tabpage_4.rb_1.checked = true then
	ls_purtype = "%"
elseif tab_1.tabpage_4.rb_2.checked = true then
	ls_purtype = "O"
elseif tab_1.tabpage_4.rb_3.checked = true then
	ls_purtype = "S"
elseif tab_1.tabpage_4.rb_4.checked = true then
	ls_purtype = "M"
end if

// 생산계획, 미생산계획
ls_planflag = "%"

st_time.text = ""
ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")

pb_save.enabled   = false		// 저장
pb_delete.enabled = false		// 삭제

//dw_area.enabled = true
//dw_area.object.area.Background.Color = rgb( 255,255,255 )
//dw_2.enabled    = true
//dw_2.object.wc_no.Background.Color = rgb( 255,255,255 )

choose case tab_1.selectedtab
	case 5		// 수주별 공정관리
		if GF_PERMISSION('생산계획_조회저장', gs_userid) = "Y" then
			pb_delete.enabled = true
			pb_save.enabled   = true
		end if
	
		dw_area.enabled = false
		dw_2.enabled    = false

		dw_area.object.area.Background.Color = 67108864
		dw_2.object.wc_no.Background.Color = 67108864
		
		SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111)
		     , convert(char(10),dateadd(month, 1, getdate()),111)  // DBO.UF_GETLASTDAY( convert(char(8),getdate(),112) )
		  INTO :ls_sdate, :ls_edate
		  FROM login;

		em_1.text    = ls_sdate		// -1월
		em_2.text    = ls_edate		// +1월
		em_1.enabled = false
		em_2.enabled = false

		cb_6.enabled = false		// 수주현황
		cb_1.enabled = false		// 물품별 소계

		SELECT top 1 getdate() INTO :ld_time FROM login;
		st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")
		
		ls_sdate  = em_1.text
		ls_edate  = em_2.text
		
		ls_custno = "%"
		ls_scene  = "%"		
	   dw15.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
		
		if dw16.rowcount() > 0 then
			if MessageBox("확인","수주별 공정진행 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				dw16.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
			end if
		else
			dw16.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
			MessageBox("확인","조회완료")
		end if
	
	case 4		// 생산계획표(납기일)
		SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111)
		     , convert(char(10),dateadd(month, 1, getdate()),111)  // DBO.UF_GETLASTDAY( convert(char(8),getdate(),112) )
		  INTO :ls_sdate, :ls_edate
		  FROM login;

		em_1.text    = ls_sdate		// -1월
		em_2.text    = ls_edate		// +1월
		em_1.enabled = false
		em_2.enabled = false

		cb_6.enabled = false		// 수주현황
		cb_1.enabled = false		// 물품별 소계

		SELECT top 1 getdate() INTO :ld_time FROM login;
		st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")
		
		dw8.object.chk.visible = false
		dw8.object.item_name.visible = false
		
	case 3		// 월계표(조정)
		SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111)
		     , convert(char(10),dateadd(month, 1, getdate()),111)  // DBO.UF_GETLASTDAY( convert(char(8),getdate(),112) )
		  INTO :ls_sdate, :ls_edate
		  FROM login;

		em_1.text    = ls_sdate		// -1월
		em_2.text    = ls_edate		// +1월
		em_1.enabled = false
		em_2.enabled = false

		cb_6.enabled = false		// 수주현황
		cb_1.enabled = false		// 물품별 소계

		SELECT top 1 getdate() INTO :ld_time FROM login;
		st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")
		
		///////////////////////////////////////////////////////		
		// 전월
		///////////////////////////////////////////////////////		
		dw13.Reset()
		dw13.InsertRow(0)		
		dw13.AcceptText()
		
		ls_yyyymm    = string(date(ls_sdate),"yyyymm")		
		ls_yyyy      = string(date(ls_sdate),"yyyy")		
		ls_mm        = string(date(ls_sdate),"mm")		
		
		dw13.SetItem(1, "gtyear",  ls_yyyy )		// 년
		dw13.SetItem(1, "gtmonth", ls_mm   )		// 월
		dw13.Object.t_name.Text = ls_wcname			// 작업장
		dw13.Object.titlebar.Background.Color = rgb(184, 204, 228)
		
		li_daycnt   = wf_daycnt(ls_yyyymm)	// 해당년월의 일자 갯수
		li_firstday = DayNumber(Date(ls_yyyy + '.' + ls_mm + '.01')) // 해당년월의 1일자 요일숫자
		
		dw13.SetItem(1, 'gtyear',  ls_yyyy)
		dw13.SetItem(1, 'gtmonth', ls_mm  )
		
		for li_loop = 1 to 37
			if li_loop < li_firstday OR li_loop > (li_firstday + li_daycnt - 1) then
				dw13.SetTabOrder('gt_cd' + string(li_loop), 0) // taborder 0로 설정
				dw13.SetTabOrder('dtime' + string(li_loop), 0) // taborder 0로 설정
				CONTINUE
			else
				li_fpos = li_firstday + (li_loop - li_firstday) // 1 일자 Display 위치
				li_fday = (li_loop + 1) - li_firstday 				// 1 일자 비교
				dw13.SetItem(1, 'd' + string(li_fpos), String(li_fday))
				dw13.SetTabOrder('gt_cd' + string(li_loop), li_loop) 	// taborder setting
				dw13.SetTabOrder('dtime' + string(li_loop), 0) 			// taborder setting (li_loop)
				
				li_lastpos = li_loop
			end if
		next


		///////////////////////////////////////////////////////		
		// 당월
		///////////////////////////////////////////////////////		
		dw5.Reset()
		dw5.InsertRow(0)		
		dw5.AcceptText()
		
		ls_yyyymm    = string(date(ls_today),"yyyymm")		
		ls_yyyy      = string(date(ls_today),"yyyy")		
		ls_mm        = string(date(ls_today),"mm")		
		
		dw5.SetItem(1, "gtyear",  ls_yyyy )
		dw5.SetItem(1, "gtmonth", ls_mm   )
		dw5.Object.t_name.Text = ls_wcname
		dw5.Object.titlebar.Background.Color = rgb(230, 185, 184)

		li_daycnt   = wf_daycnt(ls_yyyymm)	// 해당년월의 일자 갯수
		li_firstday = DayNumber(Date(ls_yyyy + '.' + ls_mm + '.01')) // 해당년월의 1일자 요일숫자
		
		dw5.SetItem(1, 'gtyear', ls_yyyy)
		dw5.SetItem(1, 'gtmonth', ls_mm)
		
		for li_loop = 1 to 37
			if li_loop < li_firstday OR li_loop > (li_firstday + li_daycnt - 1) then
				dw5.SetTabOrder('gt_cd' + string(li_loop), 0) // taborder 0로 설정
				dw5.SetTabOrder('dtime' + string(li_loop), 0) // taborder 0로 설정 
				CONTINUE
			else
				li_fpos = li_firstday + (li_loop - li_firstday) // 1 일자 Display 위치
				li_fday = (li_loop + 1) - li_firstday 				// 1 일자 비교
				dw5.SetItem(1, 'd' + string(li_fpos), String(li_fday))
				dw5.SetTabOrder('gt_cd' + string(li_loop), li_loop) 	// taborder setting
				dw5.SetTabOrder('dtime' + string(li_loop), 0) 			// taborder setting li_loop
				li_lastpos = li_loop
			end if
		next


		///////////////////////////////////////////////////////		
		// 익월
		///////////////////////////////////////////////////////		
		dw14.Reset()
		dw14.InsertRow(0)		
		dw14.AcceptText()
		
		ls_yyyymm    = string(date(ls_edate),"yyyymm")		
		ls_yyyy      = string(date(ls_edate),"yyyy")		
		ls_mm        = string(date(ls_edate),"mm")		
		
		dw14.SetItem(1, "gtyear",  ls_yyyy )
		dw14.SetItem(1, "gtmonth", ls_mm   )
		dw14.Object.t_name.Text = ls_wcname
		dw14.Object.titlebar.Background.Color = rgb(194, 214, 154)

		li_daycnt   = wf_daycnt(ls_yyyymm)	// 해당년월의 일자 갯수
		li_firstday = DayNumber(Date(ls_yyyy + '.' + ls_mm + '.01')) // 해당년월의 1일자 요일숫자
		
		dw14.SetItem(1, 'gtyear', ls_yyyy)
		dw14.SetItem(1, 'gtmonth', ls_mm)
		
		for li_loop = 1 to 37
			if li_loop < li_firstday OR li_loop > (li_firstday + li_daycnt - 1) then
				dw14.SetTabOrder('gt_cd' + string(li_loop), 0) // taborder 0로 설정
				dw14.SetTabOrder('dtime' + string(li_loop), 0) // taborder 0로 설정 
				CONTINUE
			else
				li_fpos = li_firstday + (li_loop - li_firstday) // 1 일자 Display 위치
				li_fday = (li_loop + 1) - li_firstday 				// 1 일자 비교
				dw14.SetItem(1, 'd' + string(li_fpos), String(li_fday))
				dw14.SetTabOrder('gt_cd' + string(li_loop), li_loop) 	// taborder setting
				dw14.SetTabOrder('dtime' + string(li_loop), 0) 			// taborder setting li_loop
				li_lastpos = li_loop
			end if
		next

		if dw10.rowcount() > 0 then
			if MessageBox("확인","월계표(조정) 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				dw10.retrieve( ls_work )	
			end if
		else
			dw10.retrieve( ls_work )	
			MessageBox("확인","조회완료")
		end if

	case 2	// 생산계획
		cb_6.enabled = true		// 수주현황
		cb_1.enabled = true		// 물품별 소계

		if dw4.rowcount() > 0 then
			if MessageBox("확인","생산계획 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN
		end if
		dw4.retrieve( ls_sdate, ls_edate )

		if dw4.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
		end if		

	case 1	// 미생산계획
		SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111) INTO :ls_sdate FROM login;

		em_1.text    = ls_sdate		
		em_1.enabled = true
		em_2.enabled = true		

		cb_6.enabled = true		// 수주현황
		cb_1.enabled = true		// 물품별 소계

		if dw3.rowcount() > 0 then
			if MessageBox("확인","미생산계획 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN
		end if

		dw3.setfilter("")
		dw3.filter()
		dw3.Modify("DataWindow.Trailer.1.Height=0")
		
		dw3.retrieve( ls_area )
		if dw3.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
		else
			if ls_wcname = "전체" then
			else
				if MidA(ls_wcno,2,2) = '00' then
					ls_wcno = MidA(ls_wcno,1,1) + '%'
					ls_Filter = "wc_no like '" + ls_wcno + "'"
				else
					ls_Filter = "wc_no like '" + ls_wcno + "'"
				end if
				dw3.SetFilter(ls_Filter)
				dw3.Filter()
			end if
		
			////////////////////////////////////////////////////////
			// 작업장별 수주품목이 없으면 물품별소계 기능 DISABLE
			////////////////////////////////////////////////////////
			ll_row = dw3.RowCount()
			if ll_row > 0 then
				cb_1.enabled = true
			else
				cb_1.enabled = false
			end if
		end if	
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpplansale_r2
integer x = 1947
integer y = 16
integer width = 983
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpplansale_r2
integer x = 997
integer y = 16
integer width = 933
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpplansale_r2
integer x = 2953
integer y = 16
integer width = 1239
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpplansale_r2
integer x = 1303
integer y = 140
integer width = 599
integer height = 80
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//
string ls_wcno

this.accepttext()
ls_wcno = trim(this.object.wc_no[1])

if ls_wcno = "" then
else
	dw6.dataobject = "d_routestatus_all"
	dw6.SetTransObject(SQLCA)
end if

end event

type em_1 from editmask within w_mpplansale_r2
integer x = 1979
integer y = 56
integer width = 366
integer height = 72
integer taborder = 100
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
string displaydata = ""
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

type em_2 from editmask within w_mpplansale_r2
integer x = 2062
integer y = 140
integer width = 366
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "~b"
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

type st_2 from statictext within w_mpplansale_r2
integer x = 2359
integer y = 64
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_1 from statictext within w_mpplansale_r2
integer x = 1024
integer y = 140
integer width = 279
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
boolean enabled = false
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpplansale_r2
integer x = 1307
integer y = 56
integer width = 526
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area

this.accepttext()

dw_2.object.wc_no[1] = " "
dw_2.accepttext()

ls_area = data
dw_2.triggerevent( itemchanged! )
if dw_2.rowcount() > 0 then
	if ls_area = "" then
		idwc_wc.setfilter( "" )
	else
		idwc_wc.setfilter( "area_no = '" + ls_area + "'" )
	end if
	idwc_wc.filter()
	
	idwc_wc.setsort( "work_type, work_no" )
	idwc_wc.sort()
end if

end event

type pb_excel from picturebutton within w_mpplansale_r2
event mousemove pbm_mousemove
integer x = 3374
integer y = 64
integer width = 187
integer height = 144
integer taborder = 130
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
integer ls_Value,   li_Pos,   li_value
datawindow dwxls

choose case tab_1.selectedtab
	case 1
		dwxls  = dw3
	case 2
		dwxls  = dw4
	case 3
		dwxls  = dw5
	case 4
		dwxls  = dw6
	case 5
		dwxls  = dw16
end choose

if dwxls.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	                        ls_Docname, ls_Named, "XLS", &
	                        "엑셀 (*.XLS), *.XLS," + &
                           "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dwxls.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dwxls.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type tab_1 from tab within w_mpplansale_r2
integer x = 32
integer y = 428
integer width = 4517
integer height = 2032
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event selectionchanged;////
//pb_retrieve.postevent( clicked! )
//
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "계획조정"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "StopSign!"
long picturemaskcolor = 536870912
cb_9 cb_9
cb_8 cb_8
cb_13 cb_13
dw_3 dw_3
end type

on tabpage_1.create
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_13=create cb_13
this.dw_3=create dw_3
this.Control[]={this.cb_9,&
this.cb_8,&
this.cb_13,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_13)
destroy(this.dw_3)
end on

type cb_9 from commandbutton within tabpage_1
integer x = 969
integer y = 8
integer width = 462
integer height = 76
integer taborder = 230
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주관리 검색"
end type

event clicked;// 수주관리 검색
string ls_sale
long   ll_row
int    li_int

gs_print_control = "SALE"

ll_row = dw3.getrow()
if isnull(ll_row) OR ll_row < 1 then return

dw3.scrolltorow( ll_row )
ls_sale = trim(dw3.object.sale_no[ll_row])

Open( w_whsaleproc_w )

w_whsaleproc_w.sle_1.text = ls_sale
w_whsaleproc_w.pb_1.postevent(clicked!)

end event

type cb_8 from commandbutton within tabpage_1
integer x = 498
integer y = 8
integer width = 462
integer height = 76
integer taborder = 220
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "공정진행 검색"
end type

event clicked;// 공정진행 검색
string ls_sale
long   ll_row
int    li_int

gs_print_control = "PROC"

ll_row = dw3.getrow()
if isnull(ll_row) OR ll_row < 1 then return

dw3.scrolltorow( ll_row )
ls_sale = trim(dw3.object.sale_no[ll_row])

Open(w_whsaleproc_w)

w_whsaleproc_w.sle_1.text = ls_sale
w_whsaleproc_w.pb_1.postevent(clicked!)

end event

type cb_13 from commandbutton within tabpage_1
integer x = 27
integer y = 8
integer width = 462
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;// 재고이력검색
gs_where lst_where

int  ls_a
long ll_row

ll_row = dw3.getrow()
if isnull(ll_row) OR ll_row < 1 then return

ls_a = dw3.GetClickedColumn()

lst_where.str1 = trim(dw3.object.item_no[ll_row])
lst_where.str2 = trim(dw3.object.qa[ll_row])
lst_where.str3 = "WS00000000" //trim(dw_2.object.loc_no[1])
lst_where.name = trim(dw3.object.groupitem_item_name[ll_row])

OpenWithParm( w_whinaudit_w, lst_where )

w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type dw_3 from datawindow within tabpage_1
event mousemove pbm_dwnmousemove
integer x = 27
integer y = 92
integer width = 4425
integer height = 1800
integer taborder = 70
string dataobject = "d_mpplansale_list2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int    li_int
string ls_sale

if row < 1 then return

this.scrolltorow(row)
ls_sale = trim(dw3.object.sale_no[row])

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
choose case gs_print_control
	case 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
		
	case 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
end choose


end event

event clicked;//
if isnull(row) OR row < 1 then return

is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "계획확정"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom035!"
long picturemaskcolor = 536870912
cb_7 cb_7
dw_4 dw_4
end type

on tabpage_2.create
this.cb_7=create cb_7
this.dw_4=create dw_4
this.Control[]={this.cb_7,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.cb_7)
destroy(this.dw_4)
end on

type cb_7 from commandbutton within tabpage_2
integer x = 27
integer y = 8
integer width = 462
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;long ll_row

ll_row = dw4.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw4.GetClickedColumn()

lst_where.str1 = trim(dw4.object.assy_item[ll_row])
lst_where.str2 = trim(dw4.object.assy_qa[ll_row])
lst_where.str3 = "WS00000000" //trim(dw_2.object.loc_no[1])
lst_where.name = trim(dw4.object.item_name[ll_row])

openwithparm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type dw_4 from datawindow within tabpage_2
event mousemove pbm_dwnmousemove
integer x = 27
integer y = 92
integer width = 4425
integer height = 1804
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpplansale_list4"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int    li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())

ls_sale = this.object.sale_no[row]
choose case gs_print_control
	case 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
end choose

end event

event clicked;//
if isnull(row) OR row < 1 then return

is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "월계표(조정)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Continue!"
long picturemaskcolor = 536870912
cbx_form cbx_form
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
dw_9 dw_9
st_8 st_8
dw_10 dw_10
dw_11 dw_11
dw_12 dw_12
dw_5 dw_5
dw_13 dw_13
dw_14 dw_14
end type

on tabpage_3.create
this.cbx_form=create cbx_form
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.dw_9=create dw_9
this.st_8=create st_8
this.dw_10=create dw_10
this.dw_11=create dw_11
this.dw_12=create dw_12
this.dw_5=create dw_5
this.dw_13=create dw_13
this.dw_14=create dw_14
this.Control[]={this.cbx_form,&
this.rb_7,&
this.rb_6,&
this.rb_5,&
this.dw_9,&
this.st_8,&
this.dw_10,&
this.dw_11,&
this.dw_12,&
this.dw_5,&
this.dw_13,&
this.dw_14}
end on

on tabpage_3.destroy
destroy(this.cbx_form)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.dw_9)
destroy(this.st_8)
destroy(this.dw_10)
destroy(this.dw_11)
destroy(this.dw_12)
destroy(this.dw_5)
destroy(this.dw_13)
destroy(this.dw_14)
end on

type cbx_form from checkbox within tabpage_3
integer x = 32
integer y = 8
integer width = 370
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "성형제외"
boolean checked = true
end type

type rb_7 from radiobutton within tabpage_3
integer x = 2194
integer y = 16
integer width = 329
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "익월"
end type

event clicked;// 익월
if this.checked = true then
	dw13.visible = false
	dw5.visible  = false
	dw14.visible = true
end if

end event

type rb_6 from radiobutton within tabpage_3
integer x = 1897
integer y = 16
integer width = 329
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "당월"
boolean checked = true
end type

event clicked;// 당월
if this.checked = true then
	dw13.visible = false
	dw5.visible  = true
	dw14.visible = false
end if

end event

type rb_5 from radiobutton within tabpage_3
integer x = 1586
integer y = 16
integer width = 329
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전월"
end type

event clicked;// 전월
if this.checked = true then
	dw13.visible = true
	dw5.visible  = false
	dw14.visible = false
end if

end event

type dw_9 from datawindow within tabpage_3
integer x = 667
integer y = 4
integer width = 873
integer height = 84
integer taborder = 50
string title = "none"
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

type st_8 from statictext within tabpage_3
integer x = 411
integer y = 4
integer width = 256
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_10 from datawindow within tabpage_3
integer x = 32
integer y = 92
integer width = 1509
integer height = 1180
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_routstatus_h"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
string ls_area, ls_custno, ls_scene, ls_sdate, ls_edate, ls_tdate, ls_wcno, ls_wcname
long   ll_row, ll_col, ll_workday, ll_planqty1, ll_planqty2, ll_planqty3
string ls_yyyymm1, ls_day1, ls_gtdt1, ls_wcname_save1		// 당월
string ls_yyyymm2, ls_day2, ls_gtdt2, ls_wcname_save2		// 전월
string ls_yyyymm3, ls_day3, ls_gtdt3, ls_wcname_save3		// 익월
string ls_today, ls_workdate

if isnull(currentrow) OR currentrow < 1 then RETURN

SetPointer(HourGlass!)

ls_sdate = em_1.text
ls_tdate = string(gf_today(),"yyyy/mm/dd")
ls_edate = em_2.text

ls_area   = dw_area.object.area[dw_area.getrow()]
ls_wcno   = dw_2.object.wc_no[1]

ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname = trim(ls_wcname) + "%"  //작업장명

// 필터해지
GF_DW2UnFilter( dw11 )
GF_DW2UnFilter( dw12 )

// 거래처
ll_row    = dw10.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno = dw10.object.cust_no[ll_row]
ls_scene  = dw10.object.scene_code[ll_row]

dw12.reset()		// 거래처+품명+규격 상세보기

dw11.retrieve( ls_area, ls_custno, ls_scene )

SetPointer(HourGlass!)

// 당월(dw5), 전월(dw13), 익월(dw14)
ls_yyyymm1 = LeftA(ls_tdate,7)
ls_yyyymm2 = LeftA(ls_sdate,7)
ls_yyyymm3 = LeftA(ls_edate,7)

for ll_col = 1 to 37
	// 당월 CLEAR
	ls_day1   = dw5.GetItemString(1, "d" + string(ll_col))
	if isnull(ls_day1) OR trim(ls_day1) = "" then
	else
		dw5.SetItem(1, "gt_cd" + string(ll_col), "")
		dw5.SetItem(1, "gtime" + string(ll_col), "")
		dw5.SetItem(1, "dtime" + string(ll_col),  0)
		ls_gtdt1 = ls_yyyymm1 + "/" + string(integer(ls_day1), "00")			
	end if

	// 전월 CLEAR
	ls_day2   = dw13.GetItemString(1, "d" + string(ll_col))
	if isnull(ls_day2) OR trim(ls_day2) = "" then
	else
		dw13.SetItem(1, "gt_cd" + string(ll_col), "")
		dw13.SetItem(1, "gtime" + string(ll_col), "")
		dw13.SetItem(1, "dtime" + string(ll_col),  0)
		ls_gtdt2 = ls_yyyymm2 + "/" + string(integer(ls_day2), "00")			
	end if

	// 익월 CLEAR
	ls_day3   = dw14.GetItemString(1, "d" + string(ll_col))
	if isnull(ls_day3) OR trim(ls_day3) = "" then
	else
		dw14.SetItem(1, "gt_cd" + string(ll_col), "")
		dw14.SetItem(1, "gtime" + string(ll_col), "")
		dw14.SetItem(1, "dtime" + string(ll_col),  0)
		ls_gtdt3 = ls_yyyymm3 + "/" + string(integer(ls_day3), "00")			
	end if

	ls_wcname_save1 = "" ; ls_wcname_save2 = "" ; ls_wcname_save3 = ""
	ll_planqty1 = 0      ; ll_planqty2 = 0      ; ll_planqty3 = 0
	
	for ll_row = 1 to dw11.rowcount()
		ls_workdate = ""; ls_wcname  = ""
	
		ls_workdate = string(dw11.object.work_date[ll_row],"yyyy/mm/dd")
		if isnull(ls_workdate) OR ls_workdate = "" then CONTINUE

		// 당월
		if ls_gtdt1 = ls_workdate then
			ls_wcname_save1 = dw5.GetItemString( 1, 'gtime' + string(ll_col) )
			
			if LenA(ls_wcname_save1) > 0 then
				ls_wcname   = ls_wcname_save1 + "," + dw11.object.work_name[ll_row]
				ll_planqty1 = ll_planqty1 + dw11.object.plan_qty[ll_row]
			else
				ls_wcname   = dw11.object.work_name[ll_row]
				ll_planqty1 = dw11.object.plan_qty[ll_row]
			end if
			
			dw5.SetItem(1, 'gt_cd' + string(ll_col), "")					// 코드
			dw5.SetItem(1, 'dtime' + string(ll_col), ll_planqty1)		// 수량
			dw5.SetItem(1, 'gtime' + string(ll_col), ls_wcname)		// 작업장
		end if
		
		// 전월
		if ls_gtdt2 = ls_workdate then
			ls_wcname_save2 = dw13.GetItemString( 1, 'gtime' + string(ll_col) )
			
			if LenA(ls_wcname_save2) > 0 then
				ls_wcname = ls_wcname_save2 + "," + dw11.object.work_name[ll_row]
				ll_planqty2 = ll_planqty2 + dw11.object.plan_qty[ll_row]
			else
				ls_wcname   = dw11.object.work_name[ll_row]
				ll_planqty2 = dw11.object.plan_qty[ll_row]
			end if
			
			dw13.SetItem(1, 'gt_cd' + string(ll_col), "")				// 코드
			dw13.SetItem(1, 'dtime' + string(ll_col), ll_planqty2)	// 수량
			dw13.SetItem(1, 'gtime' + string(ll_col), ls_wcname)		// 작업장
		end if

		// 익월
		if ls_gtdt3 = ls_workdate then
			ls_wcname_save3 = dw14.GetItemString( 1, 'gtime' + string(ll_col) )
			
			if LenA(ls_wcname_save3) > 0 then
				ls_wcname = ls_wcname_save3 + "," + dw11.object.work_name[ll_row]
				ll_planqty3 = ll_planqty3 + dw11.object.plan_qty[ll_row]
			else
				ls_wcname   = dw11.object.work_name[ll_row]
				ll_planqty3 = dw11.object.plan_qty[ll_row]
			end if
			
			dw14.SetItem(1, 'gt_cd' + string(ll_col), "")				// 코드
			dw14.SetItem(1, 'dtime' + string(ll_col), ll_planqty3)	// 수량
			dw14.SetItem(1, 'gtime' + string(ll_col), ls_wcname)		// 작업장
		end if
	next
next
SetPointer(Arrow!)

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_10"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


string ls_area, ls_custno, ls_wcno, ls_wcname, ls_sdate, ls_edate
long   ll_row

ls_area   = dw_area.object.area[dw_area.getrow()]
ls_wcno   = dw_2.object.wc_no[1]

ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname   = trim(ls_wcname) + "%"  // 작업장명

ll_row      = dw10.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno   = dw10.object.cust_no[ll_row]
ls_sdate    = em_1.text
ls_edate    = em_2.text

dw12.retrieve( ls_area, "%", ls_custno, ls_sdate, ls_edate )

end event

type dw_11 from datawindow within tabpage_3
integer x = 32
integer y = 1280
integer width = 1509
integer height = 616
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_routstatus_dtl"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_11"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_area, ls_custno, ls_wcno, ls_wcname, ls_sdate, ls_edate
long   ll_row

ls_area   = dw_area.object.area[dw_area.getrow()]

ls_wcname = trim(this.object.work_name[row])
SELECT work_no INTO :ls_wcno FROM wc WHERE work_name = :ls_wcname;

if isnull(ls_wcno) OR ls_wcno = "" then RETURN

ls_sdate    = em_1.text
ls_edate    = em_2.text

dw12.retrieve( ls_area, ls_wcno, "%", ls_sdate, ls_edate )

end event

type dw_12 from datawindow within tabpage_3
integer x = 1550
integer y = 1280
integer width = 2898
integer height = 616
integer taborder = 110
string title = "none"
string dataobject = "d_routstatus_dtlqa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_12"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event doubleclicked;//
gs_where2 lst_str 
string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_saleno, ls_seqno
long   ll_row, ll_col

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
ls_saleno = this.object.sale_no[ll_row]
ls_seqno  = string(this.object.seq_no[ll_row])

if ls_saleno = "" OR isnull(ls_saleno) OR LenA(ls_saleno) <> 14  then RETURN
lst_str.str1[1] = ls_saleno
lst_str.str2[1] = ls_seqno

OpenWithParm(w_whsaleall_w, lst_str)	

end event

type dw_5 from datawindow within tabpage_3
string tag = "d_mpplansale_list3"
integer x = 1550
integer y = 92
integer width = 2898
integer height = 1180
integer taborder = 80
string title = "당월"
string dataobject = "d_routmonth"
borderstyle borderstyle = stylelowered!
end type

event clicked;//
string  ls_area, ls_wcno, ls_wcname, ls_custno, ls_workdate
string  ls_year, ls_month, ls_day, ls_value
long    ll_col,  ll_day,  ll_row

if isnull(row) OR row < 1 then RETURN
if dw10.rowcount() < 1 then RETURN

ls_area   = dw_area.object.area[dw_area.getrow()]
ls_wcno   = dw_2.object.wc_no[1]

ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname   = trim(ls_wcname) + "%"  // 작업장명

ll_row      = dw10.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno   = dw10.object.cust_no[ll_row]

ll_col      = long( this.GetClickedColumn() )
choose case ll_col
	case   1 to  37					// dXX     string
		ll_day = ll_col
		
	case  38 to  74					// gt_cdXX string
		ll_day = ll_col - 37
		
	case  75 to 111					// dtimeXX number
		ll_day = ll_col - 74
		
	case 112 to 148					// gtimeXX string
		ll_day = ll_col - 111
		
	case else
		RETURN
end choose
ls_value    = string( this.GetItemString(1, ll_day) )

ls_day      = RightA("00" + ls_value, 2)
ls_month    = this.object.gtmonth[1]
ls_year     = this.object.gtyear[1]
ls_workdate = ls_year + "/" + ls_month + "/" + ls_day

dw12.retrieve( ls_area, "%", ls_custno, ls_workdate, ls_workdate )

end event

event rbuttondown;//
long ll_row, ll_loop

dw3.AcceptText()

ll_row = dw3.GetRow()

for ll_loop = 1 to 37
	choose case This.GetColumnName()
		case 'gt_cd' + string(ll_loop)
			MessageBox("확인","버튼")
//			str.cd = Trim(dw_r.GetItemString(ll_row, 'acc_cd'))
//			str.nm = ''
			
//			if gf_null_chk(str.cd, '사업장') then return
			
//			OpenWithParm(w_ip04101_r, str)
//			str = Message.PowerObjectParm
//			if str.gb <> '0' then
//				This.SetItem(ll_row, 'gt_cd' + string(ll_loop), str.cd)
//				This.SetItem(ll_row, 'gtime' + string(ll_loop), str.nm)
//			end if
	end choose
next

end event

type dw_13 from datawindow within tabpage_3
integer x = 1961
integer y = 296
integer width = 1833
integer height = 740
integer taborder = 190
boolean bringtotop = true
string title = "전월"
string dataobject = "d_routmonth"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// 전월
string  ls_area, ls_wcno, ls_wcname, ls_custno, ls_workdate
string  ls_year, ls_month, ls_day, ls_value
long    ll_col,  ll_day,  ll_row

if isnull(row) OR row < 1 then RETURN
if dw10.rowcount() < 1 then RETURN

ls_area   = dw_area.object.area[dw_area.getrow()]
ls_wcno   = dw_2.object.wc_no[1]

ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname   = trim(ls_wcname) + "%"  // 작업장명

ll_row      = dw10.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno   = dw10.object.cust_no[ll_row]

ll_col      = long( this.GetClickedColumn() )
choose case ll_col
	case   1 to  37					// dXX     string
		ll_day = ll_col
		
	case  38 to  74					// gt_cdXX string
		ll_day = ll_col - 37
		
	case  75 to 111					// dtimeXX number
		ll_day = ll_col - 74
		
	case 112 to 148					// gtimeXX string
		ll_day = ll_col - 111
		
	case else
		RETURN
end choose
ls_value    = string( this.GetItemString(1, ll_day) )

ls_day      = RightA("00" + ls_value, 2)
ls_month    = this.object.gtmonth[1]
ls_year     = this.object.gtyear[1]
ls_workdate = ls_year + "/" + ls_month + "/" + ls_day

dw12.retrieve( ls_area, "%", ls_custno, ls_workdate, ls_workdate )

end event

type dw_14 from datawindow within tabpage_3
integer x = 2400
integer y = 540
integer width = 1833
integer height = 688
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_routmonth"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// 익월
string  ls_area, ls_wcno, ls_wcname, ls_custno, ls_workdate
string  ls_year, ls_month, ls_day, ls_value
long    ll_col,  ll_day,  ll_row

if isnull(row) OR row < 1 then RETURN
if dw10.rowcount() < 1 then RETURN

ls_area   = dw_area.object.area[dw_area.getrow()]
ls_wcno   = dw_2.object.wc_no[1]

ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname   = trim(ls_wcname) + "%"  // 작업장명

ll_row      = dw10.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno   = dw10.object.cust_no[ll_row]

ll_col      = long( this.GetClickedColumn() )
choose case ll_col
	case   1 to  37					// dXX     string
		ll_day = ll_col
		
	case  38 to  74					// gt_cdXX string
		ll_day = ll_col - 37
		
	case  75 to 111					// dtimeXX number
		ll_day = ll_col - 74
		
	case 112 to 148					// gtimeXX string
		ll_day = ll_col - 111
		
	case else
		RETURN
end choose
ls_value    = string( this.GetItemString(1, ll_day) )

ls_day      = RightA("00" + ls_value, 2)
ls_month    = this.object.gtmonth[1]
ls_year     = this.object.gtyear[1]
ls_workdate = ls_year + "/" + ls_month + "/" + ls_day

dw12.retrieve( ls_area, "%", ls_custno, ls_workdate, ls_workdate )

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "생산계획표(납기일)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Asterisk!"
long picturemaskcolor = 536870912
dw_8 dw_8
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
st_3 st_3
cbx_view cbx_view
dw_6 dw_6
end type

on tabpage_4.create
this.dw_8=create dw_8
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_1=create cbx_1
this.st_3=create st_3
this.cbx_view=create cbx_view
this.dw_6=create dw_6
this.Control[]={this.dw_8,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cbx_1,&
this.st_3,&
this.cbx_view,&
this.dw_6}
end on

on tabpage_4.destroy
destroy(this.dw_8)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.cbx_view)
destroy(this.dw_6)
end on

type dw_8 from datawindow within tabpage_4
integer x = 27
integer y = 1264
integer width = 4425
integer height = 616
integer taborder = 80
string title = "none"
string dataobject = "d_routestatus_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
gs_where2 lst_str 
string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_seqno
long   ll_row, ll_col

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
is_saleno = this.object.sale_no[ll_row]
ls_seqno  = string(this.object.seq_no[ll_row])

if is_saleno = "" or isnull(is_saleno) or LenA(is_saleno) <> 14  then RETURN
lst_str.str1[1] = is_saleno
lst_str.str2[1] = ls_seqno

OpenWithParm(w_whsaleall_w, lst_str)	

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

//
is_dw = "dw_8"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)



end event

type rb_4 from radiobutton within tabpage_4
integer x = 3840
integer y = 16
integer width = 421
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "주문+재고"
end type

event clicked;// 조회
pb_retrieve.triggerevent( clicked! )

end event

type rb_3 from radiobutton within tabpage_4
integer x = 3602
integer y = 16
integer width = 247
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "재고"
end type

event clicked;// 조회
pb_retrieve.triggerevent( clicked! )

end event

type rb_2 from radiobutton within tabpage_4
integer x = 3355
integer y = 16
integer width = 247
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "주문"
end type

event clicked;// 조회
pb_retrieve.triggerevent( clicked! )

end event

type rb_1 from radiobutton within tabpage_4
integer x = 2971
integer y = 16
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체발주"
boolean checked = true
end type

event clicked;// 조회
pb_retrieve.triggerevent( clicked! )


end event

type cbx_1 from checkbox within tabpage_4
integer x = 887
integer y = 16
integer width = 315
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx

choose case is_dw
	case "dw_6"
		if this.checked = true then
			ls_colx = string(integer(dw6.object.item_name.width))
		else
			ls_colx = "0"
		end if
		
		dw6.object.datawindow.horizontalscrollsplit = ls_colx
		
	case "dw_8"
		if this.checked = true then
			ls_colx = string(integer(dw8.object.order_qty.x))
		else
			ls_colx = "0"
		end if
		
		dw8.object.datawindow.horizontalscrollsplit = ls_colx		
end choose



end event

type st_3 from statictext within tabpage_4
integer x = 1243
integer y = 16
integer width = 1527
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79741120
string text = "값을 더블클릭하면, 공정입고일 관리가 됩니다."
boolean focusrectangle = false
end type

type cbx_view from checkbox within tabpage_4
integer x = 46
integer y = 16
integer width = 837
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처+품명+규격 보기"
end type

event clicked;//
if this.checked = true then
	dw7.visible = true
else
	dw7.visible = false
end if


end event

type dw_6 from datawindow within tabpage_4
string tag = "d_routestatus_y05"
integer x = 27
integer y = 88
integer width = 4425
integer height = 1168
integer taborder = 60
string title = "납기일자"
string dataobject = "d_routestatus_all"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

//
is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

///////////////////////////////////
// 상세조회
///////////////////////////////////
string  ls_area, ls_wcno, ls_wcname, ls_wcuse, ls_orderno, ls_itemno, ls_duedate
string  ls_purtype, ls_colx, ls_title, ls_itemnm, ls_value
long    ll_seqno, ll_row, ll_col, ll_dw8cnt, ll_found
integer li_year

ls_wcno   = dw_2.object.wc_no[1]
if RightA(ls_wcno,2) = "00" then ls_wcno = LeftA(ls_wcno,1) + "%"

// 전체(%), 주문발주(O), 재고발주(S), 주문+재고(M)
if tab_1.tabpage_4.rb_1.checked = true then
	ls_purtype = "%"
elseif tab_1.tabpage_4.rb_2.checked = true then
	ls_purtype = "O"
elseif tab_1.tabpage_4.rb_3.checked = true then
	ls_purtype = "S"
elseif tab_1.tabpage_4.rb_4.checked = true then
	ls_purtype = "M"
end if

//
ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )

// 납기일자 이전컬럼 클릭시 
if ll_col   < 5 then RETURN		// @due_date

ls_value  = string( this.GetItemNumber( ll_row, ll_col) )
if isnull(ls_value) OR ls_value = "" then RETURN

ls_title  = wf_crosstab_title( this, ll_row, ll_col )

ls_itemnm = dw6.object.item_name[row]
							
SELECT item_no INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;
if isnull(ls_itemno) OR ls_itemno = "" then RETURN
							

li_year   = year(date(gf_today()))

if ls_title <= "12/31" then
	ls_duedate = string(li_year)     + "/" + ls_title
else
	ls_duedate = string(li_year + 1) + "/" + ls_title
end if


SELECT rtrim(work_name), use_yn INTO :ls_wcname, :ls_wcuse FROM wc WHERE work_no = :ls_wcno;
if isnull(ls_wcname) OR ls_wcname = "" then
end if
if ls_wcuse = "Y" then 
else
//	MessageBox("확인", "가상집합 작업장에서는 공정입고일을 관리할 수 없습니다.")
end if


dw_7.reset() ; dw_8.reset() 

dw_8.setredraw(false)
dw_7.retrieve( ls_wcno, ls_itemno, ls_duedate, ls_purtype )
dw_8.retrieve( ls_wcno, ls_itemno, ls_duedate, ls_purtype )

if dw_8.rowcount() < 1 then
	for ll_row = 1 to dw_7.rowcount()
		ls_orderno = dw_7.object.order_no[ll_row]
		ll_seqno   = dw_7.object.seq_no[ll_row]
		
		if isnull(ls_orderno) OR ls_orderno = "" then CONTINUE
		
		ll_found = 0
      ll_found = dw_8.Find("sale_no = '" + ls_orderno + "' AND seq_no = " + string(ll_seqno) + " ", 1, dw_8.RowCount() )				
		if ll_found > 0 then
			// 수량만 UPDATE 함
			dw_8.object.get_date[ll_found]    = dw_7.object.get_date[ll_row] 
			dw_8.object.routchk[ll_found]     = dw_7.object.routchk[ll_row] 
			dw_8.object.order_qty[ll_found]   = dw_7.object.order_qty[ll_row] 
			dw_8.object.rlse_qty[ll_found]    = dw_7.object.rlse_qty[ll_row]  
			dw_8.object.remains_qty[ll_found] = dw_7.object.jan_qty[ll_row]   
			dw_8.object.calc_qty[ll_found]    = dw_7.object.calc_qty[ll_row]   
		else
			ll_dw8cnt = dw_8.insertrow(0)
			
			dw_8.object.work_no[ll_dw8cnt]    = dw_7.object.wc_no[ll_row]     
			dw_8.object.item_no[ll_dw8cnt]    = dw_7.object.item_no[ll_row]          
			dw_8.object.item_name[ll_dw8cnt]  = dw_7.object.item_name[ll_row]          
			dw_8.object.sale_no[ll_dw8cnt]    = dw_7.object.order_no[ll_row]  
			dw_8.object.seq_no[ll_dw8cnt]     = dw_7.object.seq_no[ll_row]    
			dw_8.object.get_date[ll_dw8cnt]   = dw_7.object.get_date[ll_row] 
			dw_8.object.routchk[ll_dw8cnt]    = dw_7.object.routchk[ll_row] 
			dw_8.object.due_date[ll_dw8cnt]   = dw_7.object.due_date[ll_row]  
			dw_8.object.cust_no[ll_dw8cnt]    = dw_7.object.cust_no[ll_row]   
			dw_8.object.cust_name[ll_dw8cnt]  = dw_7.object.cust_name[ll_row]   
			dw_8.object.scene_code[ll_dw8cnt] = dw_7.object.scene_code[ll_row]
			dw_8.object.scene_desc[ll_dw8cnt] = dw_7.object.scene_desc[ll_row]
			dw_8.object.job1[ll_dw8cnt]       = dw_7.object.wc1[ll_row]       
			dw_8.object.job1_nm[ll_dw8cnt]    = dw_7.object.wc1_nm[ll_row]       
			dw_8.object.job2[ll_dw8cnt]       = dw_7.object.wc2[ll_row]       
			dw_8.object.job2_nm[ll_dw8cnt]    = dw_7.object.wc2_nm[ll_row]       
			dw_8.object.job3[ll_dw8cnt]       = dw_7.object.wc3[ll_row]       
			dw_8.object.job3_nm[ll_dw8cnt]    = dw_7.object.wc3_nm[ll_row]       
			dw_8.object.order_qty[ll_dw8cnt]  = dw_7.object.order_qty[ll_row] 
			dw_8.object.rlse_qty[ll_dw8cnt]   = dw_7.object.rlse_qty[ll_row]  
			dw_8.object.remains_qty[ll_dw8cnt]= dw_7.object.jan_qty[ll_row]   
			dw_8.object.calc_qty[ll_dw8cnt]   = dw_7.object.calc_qty[ll_row]   
		end if
	next
end if

dw_8.accepttext()
dw_8.setredraw(true)
dw_8.setfocus()

ls_colx = string(integer(dw_8.object.order_qty.x))
if ls_colx = "0" then
else
	dw_8.object.datawindow.horizontalscrollsplit = ls_colx
end if		



////
//string ls_value, ls_title, ls_Colname, ls_itemno
//long   ll_row, ll_col
//
//ll_row    = this.getrow()
//ll_col    = long( this.GetClickedColumn() )
//ls_Colname= this.GetColumnName()
//
//if dw6.dataobject = "d_routestatus_all" then
////	ls_itemno = this.object.item_no[ll_row]
////	dw7.retrieve( ls_itemno )
//else
//	if ll_col > 7 then
//		ls_value  = string( this.GetItemNumber(ll_row, ll_col) )
//		is_saleno = this.object.order_no[ll_row]
//		
//		ls_title  = wf_crosstab_title( this, ll_row, ll_col )
//			
//		if cbx_view.checked = true then
//			MessageBox("확인", "수주번호: "+is_saleno+ "~n~n납기일자: " + ls_title +"~n~n" + &
//						  "Row: " + string(ll_row) + ", Col: " + string(ll_col) + ", Value: " + ls_value )
//		end if
//	end if
//end if

/*
(5) RowsCopy - 하나의 데이터윈도우 컨트롤로부터 지정한 범위의 로우를 다른 데이터윈도우 컨트롤로 복사하거나
               또는 동일한 데이터 윈도우 컨트롤 내에서 하나의 버퍼에서 또 다른 버퍼로 로우를 복사한다.

dwcontrol.RowCopy(startrow, endrow, copybuffer, targetdw, beforerow, targetbuffer)

startrow   - 복사할 처음 로우의 숫자(범위의 시작)
endrow     - 복사할 마지막 로우의 숫자(범위의 끝)
copybuffer - 로우를 복사해 올 버퍼를 가리키는 나열형 데이터 타입, Primary!, Delete!, Filter! 중의 하나의 값으로 지정한다.

targetrow  - 복사된 로우를 저장할 데이터윈도우 컨트롤의 이름, 이 이름은 로우를 복사해 올 데이터윈도우의
             이름과 동일해도 된다.
beforerow  - 복사된 로우를 삽입할 위치, 복사된 로우는 이 숫자의 로우 바로 앞에 삽입된다.
             복사된 로우를 로우의 끝에 삽입하려면 마지막 로우의 숫자보다 큰 임의의 수를 지정하면 된다. 
targetbuffer - 복사된 로우를 저장할 버퍼를 가리키는 나열형 데이터 타입, Primary!, Delete!, Filter! 중의 하나를 값으로 갖는다.



컬럼의 값을 구하거나 설정하는 데에 이용되는 함수들
(1) GetClickedColumn - 사용자가 클릭하거나 더블 클릭한 컬럼의 번호를 알려준다.
dwcontrol.GetClickedColumn()

(2) GetClickedRow - 사용자가 클릭하거나 더블 클릭한 로우의 번호를 알려준다.
dwcontrol.GetClickedRow()

(3) GetColumn - 현재 컬럼의 번호를 구한다. 현재의 칼럼이란 현재 포커스를 받고 있는 컬럼을 말한다.
dwcontrol.GetColumn()

(4) GetColumnName - 현재 칼럼의 이름을 구한다.
dwcontrol.GetColumnName()

(5) GetRow - 현재 로우의 번호를 구한다.
dwcontrol.GetRow()

(6) GetText - 현재 로우와 컬럼에 있는 값을 구한다. 즉, 현재 포커스를 받고 있는 로우와 컬러의 값이 얻어진다.
dwcontrol.GetText()
(예) IF Integer(GetText()) < 100 then
        처리할 작업....
     END IF


//first the key to getting this to work is the crosstab must
//be in static mode.  After the retrieve code:
dw_1.settransobject(sqlca)
dw_1.retrieve()
dw_1.modify('datawindow.crosstab.staticmode=yes')

//Now get the values in the doubleclick event:
string ls_object, ls_name, ls_value, ls_rowvalue,
ls_colvalue
long ll_pos, ll_row, ll_value, ll_numb
ls_object   = dw_1.GetObjectAtPointer()
ll_pos      = pos(ls_object, '~t',1)
ls_name     = left(ls_object, ll_pos - 1)
ll_row      = long( right(ls_object, len(ls_object) - ll_pos ) )
ll_value    = getitemnumber(ll_row, ls_name)
ls_rowvalue = dw_1.getitemstring(ll_row, 1)
ls_colvalue = dw_1.describe(ls_name+'_t.text')
messagebox('', string(ll_row) + '  '+ ls_name + '   ' +
string(ll_value))
messagebox('', ls_rowvalue + '   ' + ls_colvalue)

*/

end event

event doubleclicked;//
gs_where  lst_str 
string    ls_wcno, ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_purtype, ls_value
integer   li_year
long      ll_row, ll_col

ls_wcno   = dw_2.object.wc_no[1]
if RightA(ls_wcno,2) = "00" then ls_wcno = LeftA(ls_wcno,1) + "%"

// 전체(%), 주문발주(O), 재고발주(S), 주문+재고(M)
if tab_1.tabpage_4.rb_1.checked = true then
	ls_purtype = "%"
elseif tab_1.tabpage_4.rb_2.checked = true then
	ls_purtype = "O"
elseif tab_1.tabpage_4.rb_3.checked = true then
	ls_purtype = "S"
elseif tab_1.tabpage_4.rb_4.checked = true then
	ls_purtype = "M"
end if


ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
ls_value  = string( this.GetItemNumber( ll_row, ll_col) )

// 납기일자 이전컬럼 클릭시 
if ll_col   < 5 then RETURN		// @due_date
if isnull(ls_value) OR ls_value = "" then RETURN

ls_title  = wf_crosstab_title( this, ll_row, ll_col )

ls_itemnm = dw6.object.item_name[row]
							
SELECT item_no INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;
if isnull(ls_itemno) OR ls_itemno = "" then RETURN
							

li_year   = year(date(gf_today()))

if ls_title <= "12/31" then
	ls_duedate = string(li_year)     + "/" + ls_title
else
	ls_duedate = string(li_year + 1) + "/" + ls_title
end if

is_wcno = ls_wcno ; is_itemno = ls_itemno ; is_duedate = ls_duedate ; is_purtype = ls_purtype
dw7.retrieve( ls_wcno, ls_itemno, ls_duedate, ls_purtype )

lst_str.str1 = ls_wcno
lst_str.str2 = ls_itemno
lst_str.str3 = ls_duedate
lst_str.str4 = ls_purtype

OpenWithParm(w_whroutstatus_m, lst_str)	

end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "수주별 공정관리"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ArrangeIcons!"
long picturemaskcolor = 536870912
cbx_process cbx_process
cbx_work cbx_work
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
cb_11 cb_11
cb_10 cb_10
ddlb_time ddlb_time
em_day em_day
st_7 st_7
cbx_all cbx_all
dw_16 dw_16
end type

on tabpage_5.create
this.cbx_process=create cbx_process
this.cbx_work=create cbx_work
this.rb_10=create rb_10
this.rb_9=create rb_9
this.rb_8=create rb_8
this.cb_11=create cb_11
this.cb_10=create cb_10
this.ddlb_time=create ddlb_time
this.em_day=create em_day
this.st_7=create st_7
this.cbx_all=create cbx_all
this.dw_16=create dw_16
this.Control[]={this.cbx_process,&
this.cbx_work,&
this.rb_10,&
this.rb_9,&
this.rb_8,&
this.cb_11,&
this.cb_10,&
this.ddlb_time,&
this.em_day,&
this.st_7,&
this.cbx_all,&
this.dw_16}
end on

on tabpage_5.destroy
destroy(this.cbx_process)
destroy(this.cbx_work)
destroy(this.rb_10)
destroy(this.rb_9)
destroy(this.rb_8)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.ddlb_time)
destroy(this.em_day)
destroy(this.st_7)
destroy(this.cbx_all)
destroy(this.dw_16)
end on

type cbx_process from checkbox within tabpage_5
integer x = 407
integer y = 12
integer width = 384
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "진행숨김"
boolean checked = true
end type

event clicked;//
if this.checked = true then
	dw16.object.job1_flag.width = 0
	dw16.object.job2_flag.width = 0
	dw16.object.job3_flag.width = 0
else
	dw16.object.job1_flag.width = 155
	dw16.object.job2_flag.width = 155
	dw16.object.job3_flag.width = 155
end if

end event

type cbx_work from checkbox within tabpage_5
integer x = 27
integer y = 12
integer width = 366
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "성형제외"
boolean checked = true
end type

event clicked;//
pb_retrieve.triggerevent( clicked! )

end event

type rb_10 from radiobutton within tabpage_5
integer x = 4462
integer width = 891
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 32896
string text = "작업일3"
end type

type rb_9 from radiobutton within tabpage_5
integer x = 3570
integer width = 891
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업일2"
end type

type rb_8 from radiobutton within tabpage_5
integer x = 2679
integer width = 891
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "작업일1"
end type

type cb_11 from commandbutton within tabpage_5
integer x = 2190
integer width = 229
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "초기"
end type

event clicked;// 초기
string   ls_datetime, ls_date, ls_time, ls_wcno, ls_job, ls_column, ls_type, ls_status
long     ll_row, ll_col
datetime ldt_date

//ls_wcno   = ist_where.str1

choose case ddlb_time.text
	case "오전"
		ls_time = "10:00:00"
	case "오후"
		ls_time = "15:00:00"
	case "야간"
		ls_time = "19:00:00"
end choose

if rb_8.checked = true then
	ll_col = 1
elseif rb_9.checked = true then
	ll_col = 2
elseif rb_10.checked = true then
	ll_col = 3
else
   MessageBox("확인","작업일을 선택하시기 바랍니다.")
	RETURN
end if

ls_date   = em_day.text
ldt_date  = datetime(date(ls_date), time(ls_time))
setnull( ldt_date )

//// 입고일자, 확인일자
//if rb_3.checked = true then
//	ls_type = "_in"
//else
	ls_type = "_inchk"
//end if

for ll_row = 1 to dw16.rowcount()
	if dw16.object.chk[ll_row] = "Y" then
		ls_status = dw16.getitemstring( ll_row, "job" + string(ll_col) + "_flag" )
		if ls_status = "마감" then
		else
			ls_job    = dw16.getitemstring( ll_row, "job" + string(ll_col) )			
			ls_column = "job" + string(ll_col) + ls_type
			dw16.setitem( ll_row, ls_column, ldt_date )
	
			dw16.setitem( ll_row, "uptchk", "Y" )		
		end if
	end if
next
end event

type cb_10 from commandbutton within tabpage_5
integer x = 1874
integer width = 311
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "적용"
end type

event clicked;// 적용
string   ls_wcno, ls_itemno, ls_duedate, ls_datetime, ls_date, ls_time, ls_job, ls_column, ls_type, ls_status
long     ll_row, ll_col, ll_cnt, ll_upt, ll_qty
datetime ldt_date


choose case ddlb_time.text
	case "오전(12:00)"
		ls_time = "12:00:00"
	case "오후(17:30)"
		ls_time = "17:30:00"
	case "야간(22:30)"
		ls_time = "22:30:00"
	case else
		MessageBox("확인","시간을 선택하시기 바랍니다.")
		ddlb_time.setfocus()
		RETURN
end choose

if rb_8.checked = true then
	ll_col = 1
elseif rb_9.checked = true then
	ll_col = 2
elseif rb_10.checked = true then
	ll_col = 3
else
   MessageBox("확인","작업일을 선택하시기 바랍니다.")
	RETURN
end if

ls_date   = em_day.text
ldt_date  = datetime(date(ls_date), time(ls_time))

//// 입고일자, 확인일자
//if rb_3.checked = true then
//	ls_type = "_in"
//else
	ls_type = "_inchk"
//end if

dw16.accepttext()
for ll_row = 1 to dw16.rowcount()
	if dw16.object.chk[ll_row] = "Y" then
		ll_cnt = ll_cnt + 1
		
		ls_job = dw16.getitemstring( ll_row, "job" + string(ll_col) )
		if isnull( ls_job ) OR ls_job = "" then
		else
			// 작업일
			ls_column = "job" + string(ll_col) + ls_type
			dw16.setitem( ll_row, ls_column, ldt_date )
			// UPDATE 대상
			dw16.setitem( ll_row, "uptchk", "Y" )
		end if	
	end if
next

if ll_cnt > 0 then
	// 작업일1, 작업일2, 작업일3 
	tab_1.tabpage_5.rb_8.checked  = false
	tab_1.tabpage_5.rb_9.checked  = false
	tab_1.tabpage_5.rb_10.checked = false	
	
	MessageBox("확인","적용완료")
else
	MessageBox("확인","적용할 대상을 먼저 선택하시기 바랍니다.")
end if

end event

type ddlb_time from dropdownlistbox within tabpage_5
integer x = 1403
integer y = 4
integer width = 462
integer height = 408
integer taborder = 111
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
string item[] = {"오전(12:00)","오후(17:30)","야간(22:30)"," "}
borderstyle borderstyle = stylelowered!
end type

type em_day from editmask within tabpage_5
integer x = 978
integer y = 12
integer width = 416
integer height = 72
integer taborder = 30
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
string displaydata = ""
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_7 from statictext within tabpage_5
integer x = 777
integer y = 20
integer width = 206
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "시간:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_all from checkbox within tabpage_5
integer x = 2450
integer y = 8
integer width = 238
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
end type

event clicked;// 전체
long   ll_row
string ls_chk

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw16.rowcount()
	dw16.object.chk[ll_row] = ls_chk
next

end event

type dw_16 from datawindow within tabpage_5
string tag = "d_routsaledet_status"
integer x = 27
integer y = 92
integer width = 4425
integer height = 1800
integer taborder = 60
string title = "none"
string dataobject = "d_routsaledet_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_16"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_ymd, ls_time
choose case dwo.name
	case "job1_inchk", "job2_inchk", "job3_inchk"
		em_day.text = LeftA(sle_value.text,10)
		
		ls_time     = RightA(sle_value.text,8)		
		choose case ls_time
			case "12:00:00"
				ddlb_time.text = "오전(12:00)"
			case "17:30:00"
				ddlb_time.text = "오후(17:30)"
			case "22:30:00"
				ddlb_time.text = "야간(22:30)"
			case else
				em_day.text = string(gf_today(), "yyyy/mm/dd")
            ddlb_time.text = " "
		end choose		
end choose

choose case dwo.name
	case "w1nm", "job1_qty", "job1_flag", "job1_inchk", "job1_cnt"
		rb_8.checked = true

	case "w2nm", "job2_qty", "job2_flag", "job2_inchk", "job2_cnt"
		rb_9.checked = true

	case "w3nm", "job3_qty", "job3_flag", "job3_inchk", "job3_cnt"
		rb_10.checked = true
		
	case else
		rb_8.checked  = false
		rb_9.checked  = false
		rb_10.checked = false
end choose

end event

event doubleclicked;//
gs_where2 lst_str 
string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_seqno
long   ll_row, ll_col

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
is_saleno = this.object.order_no[ll_row]
ls_seqno  = string(this.object.seq_no[ll_row])

if is_saleno = "" or isnull(is_saleno) or LenA(is_saleno) <> 14  then RETURN
lst_str.str1[1] = is_saleno
lst_str.str2[1] = ls_seqno

OpenWithParm(w_whsaleall_w, lst_str)	

end event

event itemchanged;// 수량체크
long  ll_row, ll_qty, ll_qty1, ll_qty2, ll_qty3

if isnull( row ) OR row < 1 then RETURN

// this.accepttext() 로직 마직막에서 처리함

choose case dwo.name
	case "job1_qty"
		if isnull(this.object.job1_inchk[row]) then
			MessageBox("확인","작업일1 반드시 입력하시기 바랍니다.")
			RETURN 1
		end if

		ll_qty  = this.object.jan_qty[row]		// 잔량
		ll_qty1 = this.object.job1_qty[row] 	// 수량1
		ll_qty2 = this.object.job2_qty[row] 	// 수량2
		ll_qty3 = this.object.job3_qty[row] 	// 수량3
		
		// 마이너스 처리안됨
		if long(data) < 0 then 
			this.object.job1_qty[row]  = ll_qty1		
			RETURN 1
		end if
	
		if long(data) > ll_qty then
			MessageBox("확인","1공정 수량이 잔량보다 큰 경우입니다.")
			this.object.job1_qty[row]  = ll_qty1
			RETURN 1
		end if
		
		if long(data) < ll_qty2 then
			MessageBox("확인","2공정 수량보다 작은 경우입니다.")
			this.object.job1_qty[row]  = ll_qty1
			RETURN 1
		end if
		
		dw16.object.uptchk[row] = "Y"
		this.accepttext()

	case "job2_qty"
		if isnull(this.object.job2_inchk[row]) then
			MessageBox("확인","작업일2 반드시 입력하시기 바랍니다.")
			RETURN 1
		end if

		ll_qty  = this.object.jan_qty[row]		// 잔량
		ll_qty1 = this.object.job1_qty[row] 	// 수량1
		ll_qty2 = this.object.job2_qty[row] 	// 수량2
		ll_qty3 = this.object.job3_qty[row] 	// 수량3
		
		// 마이너스 처리안됨
		if long(data) < 0 then 
			this.object.job2_qty[row] = ll_qty2		
			RETURN 1
		end if
		
		if long(data) > ll_qty1 then
			MessageBox("확인","2공정 수량이 1공정 수량보다 큰 경우입니다.")
			this.object.job2_qty[row]  = ll_qty2
			RETURN 1
		end if
		
		if long(data) < ll_qty3 then
			MessageBox("확인","3공정 수량보다 작은 경우입니다.")
			this.object.job2_qty[row]  = ll_qty2
			RETURN 1
		end if
		
		dw16.object.uptchk[row] = "Y"
		this.accepttext()

	case "job3_qty"
		if isnull(this.object.job3_inchk[row]) then
			MessageBox("확인","작업일3 반드시 입력하시기 바랍니다.")
			RETURN 1
		end if

		ll_qty  = this.object.jan_qty[row]		// 잔량
		ll_qty1 = this.object.job1_qty[row] 	// 수량1
		ll_qty2 = this.object.job2_qty[row] 	// 수량2
		ll_qty3 = this.object.job3_qty[row] 	// 수량3

		// 마이너스 처리안됨
		if long(data) < 0 then 
			this.object.job3_qty[row]  = ll_qty3
			RETURN 1
		end if

		if long(data) > ll_qty2 then		// 잔량보다 큰 경우
			MessageBox("확인","3공정 수량이 2공정 수량보다 큰 경우입니다.")
			this.object.job3_qty[row]  = ll_qty3
			RETURN 1
		end if

		dw16.object.uptchk[row] = "Y"
		this.accepttext()
end choose

this.accepttext()

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
choose case dwo.name
	case "job1_qty", "job2_qty", "job3_qty"
		this.SelectText(1, LenA(GetText()) + 2)		// 수량전체 선택
end choose
end event

type cb_1 from commandbutton within w_mpplansale_r2
integer x = 2455
integer y = 132
integer width = 443
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품별 소계"
end type

event clicked;//
string ls_wc, ls_sort, ls_group, ls_column1, ls_column2, ls_err
int    li_rc

ls_wc = dw_2.object.wc_no[1]
if isnull(ls_wc) or trim(ls_wc) = "" then 
	MessageBox("확인", "작업장을 선택한 후 클릭하시기 바랍니다.")
	return
end if

dw3.Modify("DataWindow.Trailer.1.Height=64")
if ls_wc = 'F19' or ls_wc = 'F20' or ls_wc = 'F21' then // AL
	ls_sort = "item_no, qa, wc_no"	
else
	ls_sort = "qa, item_no, wc_no"	
end if

dw3.SetSort(ls_sort)
li_rc = dw3.Sort()
if li_rc = 1 then
	li_rc = dw3.GroupCalc()
	if li_rc = 1 then
	else
		MessageBox("확인", "물품별 소계 계산중 오류가 발생 했습니다.[" + ls_sort + "]")
	end if
else
	MessageBox("확인", "물품별 소계 정렬중 오류가 발생 했습니다.[" + ls_sort + "]")
end if

end event

type st_5 from statictext within w_mpplansale_r2
integer x = 2706
integer y = 304
integer width = 206
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "조회:"
boolean focusrectangle = false
end type

type st_time from statictext within w_mpplansale_r2
integer x = 2917
integer y = 304
integer width = 718
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "2011/12/31 08:30"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_mpplansale_r2
integer x = 2455
integer y = 52
integer width = 443
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주현황"
end type

event clicked;string ls_sale, ls_seqno
long   ll_row
gs_where2 lst_str 
datawindow dwsale

if tab_1.selectedtab = 1 then
	dwsale = dw3
else
	dwsale = dw4
end if

if dwsale.rowcount() < 1 then return

ll_row   = dwsale.getrow()
ls_sale  = dwsale.object.sale_no[ll_row]
ls_seqno = string(dwsale.object.seq_no[ll_row])

if ls_sale = "" or isnull(ls_sale) or LenA(ls_sale) <> 14  then return

lst_str.str1[1] = ls_sale
lst_str.str2[1] = ls_seqno

OpenWithParm(w_whsaleall_w, lst_str)

end event

type st_10 from statictext within w_mpplansale_r2
integer x = 1024
integer y = 60
integer width = 279
integer height = 76
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

type st_4 from statictext within w_mpplansale_r2
integer x = 96
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_mpplansale_r2
integer x = 283
integer y = 296
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

type ddlb_dwtitles from dropdownlistbox within w_mpplansale_r2
integer x = 315
integer y = 308
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

type st_6 from statictext within w_mpplansale_r2
integer x = 754
integer y = 312
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

type ddlb_op from dropdownlistbox within w_mpplansale_r2
integer x = 923
integer y = 296
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpplansale_r2
integer x = 1243
integer y = 296
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

type cb_2 from commandbutton within w_mpplansale_r2
integer x = 2034
integer y = 296
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
	case "dw_6"
		arg_dw  = dw6
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
	case "dw_12"
		arg_dw  = dw12
	case "dw_15"
		arg_dw  = dw15
	case "dw_16"
		arg_dw  = dw16
	case "dw_17"
		arg_dw  = dw_17
end choose

integer    li_ret
string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_3 from commandbutton within w_mpplansale_r2
integer x = 2199
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
	case "dw_12"
		arg_dw  = dw12
	case "dw_15"
		arg_dw  = dw15
	case "dw_16"
		arg_dw  = dw16
	case "dw_17"
		arg_dw  = dw_17
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_mpplansale_r2
integer x = 2363
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
	case "dw_12"
		arg_dw  = dw12
	case "dw_15"
		arg_dw  = dw15
	case "dw_16"
		arg_dw  = dw16
	case "dw_17"
		arg_dw  = dw_17
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpplansale_r2
integer x = 2528
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_5"
		arg_dw  = dw5
	case "dw_6"
		arg_dw  = dw6
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
	case "dw_12"
		arg_dw  = dw12
	case "dw_15"
		arg_dw  = dw15
	case "dw_16"
		arg_dw  = dw16
	case "dw_17"
		arg_dw  = dw_17
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_7 from datawindow within w_mpplansale_r2
integer x = 329
integer y = 176
integer width = 119
integer height = 84
integer taborder = 130
boolean bringtotop = true
string title = "상세보기( 더블클릭시 수주상세 화면 )"
string dataobject = "d_routestatus_list"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "Form!"
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
gs_where2 lst_str 
string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_seqno
long   ll_row, ll_col

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
is_saleno = this.object.order_no[ll_row]
ls_seqno  = string(this.object.seq_no[ll_row])

if is_saleno = "" or isnull(is_saleno) or LenA(is_saleno) <> 14  then RETURN
lst_str.str1[1] = is_saleno
lst_str.str2[1] = ls_seqno

OpenWithParm(w_whsaleall_w, lst_str)	

end event

type dw_15 from datawindow within w_mpplansale_r2
string tag = "d_routsaledet"
integer x = 466
integer y = 176
integer width = 119
integer height = 84
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "수주별 공정진행"
string dataobject = "d_routsaledet_status"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "Information!"
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_15"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type cbx_op from checkbox within w_mpplansale_r2
integer x = 1829
integer y = 304
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type dw_17 from datawindow within w_mpplansale_r2
integer x = 50
integer y = 176
integer width = 119
integer height = 84
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_routbdet_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then return

ScrollToRow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

is_dw = "dw_17"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event rowfocuschanged;//
if isnull( currentrow ) OR currentrow < 1 then RETURN

ScrollToRow( currentrow )

This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)

end event

type gb_4 from groupbox within w_mpplansale_r2
integer x = 32
integer y = 244
integer width = 4521
integer height = 156
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

