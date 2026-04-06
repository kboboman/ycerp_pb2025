$PBExportHeader$w_mpplansale_r.srw
$PBExportComments$생산계획조회
forward 
global type w_mpplansale_r from w_inheritance
end type
type em_1 from editmask within w_mpplansale_r
end type
type em_2 from editmask within w_mpplansale_r
end type
type st_2 from statictext within w_mpplansale_r
end type
type st_1 from statictext within w_mpplansale_r
end type
type dw_area from datawindow within w_mpplansale_r
end type
type pb_excel from picturebutton within w_mpplansale_r
end type
type tab_1 from tab within w_mpplansale_r
end type
type tabpage_1 from userobject within tab_1
end type
type cbx_skip from checkbox within tabpage_1
end type
type dw_8 from datawindow within tabpage_1
end type
type dw_6 from datawindow within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cbx_work from checkbox within tabpage_1
end type
type st_7 from statictext within tabpage_1
end type
type em_day from editmask within tabpage_1
end type
type ddlb_time from dropdownlistbox within tabpage_1
end type
type cb_10 from commandbutton within tabpage_1
end type
type cb_11 from commandbutton within tabpage_1
end type
type cbx_all from checkbox within tabpage_1
end type
type rb_8 from radiobutton within tabpage_1
end type
type rb_9 from radiobutton within tabpage_1
end type
type rb_10 from radiobutton within tabpage_1
end type
type dw_9 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cbx_skip cbx_skip
dw_8 dw_8
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
cbx_work cbx_work
st_7 st_7
em_day em_day
ddlb_time ddlb_time
cb_10 cb_10
cb_11 cb_11
cbx_all cbx_all
rb_8 rb_8
rb_9 rb_9
rb_10 rb_10
dw_9 dw_9
end type
type tabpage_2 from userobject within tab_1
end type
type cbx_2 from checkbox within tabpage_2
end type
type cbx_1 from checkbox within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type dw_10 from datawindow within tabpage_2
end type
type dw_11 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cbx_2 cbx_2
cbx_1 cbx_1
st_3 st_3
dw_10 dw_10
dw_11 dw_11
end type
type tabpage_3 from userobject within tab_1
end type
type cbx_purskip from checkbox within tabpage_3
end type
type rb_3 from radiobutton within tabpage_3
end type
type rb_2 from radiobutton within tabpage_3
end type
type rb_1 from radiobutton within tabpage_3
end type
type dw_12 from datawindow within tabpage_3
end type
type cbx_3 from checkbox within tabpage_3
end type
type dw_13 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cbx_purskip cbx_purskip
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_12 dw_12
cbx_3 cbx_3
dw_13 dw_13
end type
type tab_1 from tab within w_mpplansale_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type st_5 from statictext within w_mpplansale_r
end type
type st_time from statictext within w_mpplansale_r
end type
type st_10 from statictext within w_mpplansale_r
end type
type st_4 from statictext within w_mpplansale_r
end type
type ddlb_fld from dropdownlistbox within w_mpplansale_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpplansale_r
end type
type st_6 from statictext within w_mpplansale_r
end type
type ddlb_op from dropdownlistbox within w_mpplansale_r
end type
type sle_value from singlelineedit within w_mpplansale_r
end type
type cb_2 from commandbutton within w_mpplansale_r
end type
type cb_3 from commandbutton within w_mpplansale_r
end type
type cb_4 from commandbutton within w_mpplansale_r
end type
type cb_5 from commandbutton within w_mpplansale_r
end type
type dw_7 from datawindow within w_mpplansale_r
end type
type dw_15 from datawindow within w_mpplansale_r
end type
type cbx_op from checkbox within w_mpplansale_r
end type
type cb_1 from commandbutton within w_mpplansale_r
end type
type st_idx1 from statictext within w_mpplansale_r
end type
type st_idx2 from statictext within w_mpplansale_r
end type
type st_idx3 from statictext within w_mpplansale_r
end type
type st_idx0 from statictext within w_mpplansale_r
end type
type gb_4 from groupbox within w_mpplansale_r
end type
end forward

global type w_mpplansale_r from w_inheritance
integer x = 5
integer y = 72
integer width = 4603
integer height = 2576
string title = "생산계획 조회(w_mpplansale_r)"
boolean resizable = false
long backcolor = 67108864
string icon = "OleGenReg!"
em_1 em_1
em_2 em_2
st_2 st_2
st_1 st_1
dw_area dw_area
pb_excel pb_excel
tab_1 tab_1
st_5 st_5
st_time st_time
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
cb_1 cb_1
st_idx1 st_idx1
st_idx2 st_idx2
st_idx3 st_idx3
st_idx0 st_idx0
gb_4 gb_4
end type
global w_mpplansale_r w_mpplansale_r

type variables
st_print i_print
string is_planmgr, is_wcname, is_area, is_saleno, is_dw

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

on w_mpplansale_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_1=create st_1
this.dw_area=create dw_area
this.pb_excel=create pb_excel
this.tab_1=create tab_1
this.st_5=create st_5
this.st_time=create st_time
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
this.cb_1=create cb_1
this.st_idx1=create st_idx1
this.st_idx2=create st_idx2
this.st_idx3=create st_idx3
this.st_idx0=create st_idx0
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_excel
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.st_time
this.Control[iCurrent+10]=this.st_10
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.dw_7
this.Control[iCurrent+22]=this.dw_15
this.Control[iCurrent+23]=this.cbx_op
this.Control[iCurrent+24]=this.cb_1
this.Control[iCurrent+25]=this.st_idx1
this.Control[iCurrent+26]=this.st_idx2
this.Control[iCurrent+27]=this.st_idx3
this.Control[iCurrent+28]=this.st_idx0
this.Control[iCurrent+29]=this.gb_4
end on

on w_mpplansale_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.pb_excel)
destroy(this.tab_1)
destroy(this.st_5)
destroy(this.st_time)
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
destroy(this.cb_1)
destroy(this.st_idx1)
destroy(this.st_idx2)
destroy(this.st_idx3)
destroy(this.st_idx0)
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

st_idx0.backcolor = rgb(127, 127, 127)
st_idx1.backcolor = rgb(146, 208, 80)
st_idx2.backcolor = rgb(0, 176, 240)
st_idx3.backcolor = rgb(255, 0, 0)

dw3  = tab_1.tabpage_1.dw_3
dw4  = tab_1.tabpage_1.dw_4
dw5  = tab_1.tabpage_1.dw_5
dw6  = tab_1.tabpage_1.dw_6
dw7  = dw_7
dw8  = tab_1.tabpage_1.dw_8
dw9  = tab_1.tabpage_1.dw_9
dw10 = tab_1.tabpage_2.dw_10
dw11 = tab_1.tabpage_2.dw_11
dw12 = tab_1.tabpage_3.dw_12
dw13 = tab_1.tabpage_3.dw_13
dw15 = dw_15

dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)
dw8.SetTransObject(SQLCA)
dw9.SetTransObject(SQLCA)
dw10.settransobject(sqlca)
dw11.settransobject(sqlca)
dw12.settransobject(sqlca)
dw13.settransobject(sqlca)
dw15.settransobject(sqlca)

dw7.visible  = false
dw9.visible  = false	// 공정관리 SKIP
dw11.visible = false	// 작업일보 실적조회(구분제외)
dw13.visible = false	// 발주관리 SKIP
dw15.visible = false	// 수주공정진행

pb_delete.enabled = false
pb_save.enabled   = false

dw_1.visible = false

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

// 일자
em_1.text = string(gf_today(),"yyyy/mm/dd")
em_2.text = string(gf_today(),"yyyy/mm/dd")
tab_1.tabpage_1.em_day.text = string(gf_today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_4.width   = newwidth  - (gb_4.x * 2)

tab_1.width  = newwidth  - (gb_4.x * 2)
tab_1.height = newheight - tab_1.y - gb_4.x

tab_1.tabpage_1.dw_3.width  = tab_1.width  - 64
tab_1.tabpage_1.dw_3.height = (tab_1.height - 132) * 0.7

tab_1.tabpage_1.dw_4.y      = tab_1.tabpage_1.dw_3.y + tab_1.tabpage_1.dw_3.height
tab_1.tabpage_1.dw_4.width  = tab_1.tabpage_1.dw_3.width * 0.4
tab_1.tabpage_1.dw_4.height = (tab_1.height - 132) * 0.3 - 100

tab_1.tabpage_1.dw_4.object.item_name.width  = 0
tab_1.tabpage_1.dw_4.object.qa.width         = 0
tab_1.tabpage_1.dw_4.object.order_qty.width  = 0
tab_1.tabpage_1.dw_4.object.jan_qty.width    = 0
tab_1.tabpage_1.dw_4.object.order_date.width = 0
tab_1.tabpage_1.dw_4.object.napgi_date.width = 0
tab_1.tabpage_1.dw_4.object.napgi_chk.width  = 0
tab_1.tabpage_1.dw_4.object.chk.width        = 0

tab_1.tabpage_1.dw_4.object.sp0.width        = 0
tab_1.tabpage_1.dw_4.object.job1_cnt.width   = 0
tab_1.tabpage_1.dw_4.object.w1nm.width       = 0
tab_1.tabpage_1.dw_4.object.job1_qty.width   = 0
tab_1.tabpage_1.dw_4.object.job1_inchk.width = 0

tab_1.tabpage_1.dw_4.object.job2_cnt.width   = 0
tab_1.tabpage_1.dw_4.object.w2nm.width       = 0
tab_1.tabpage_1.dw_4.object.job2_qty.width   = 0
tab_1.tabpage_1.dw_4.object.job2_inchk.width = 0

tab_1.tabpage_1.dw_4.object.job3_cnt.width   = 0
tab_1.tabpage_1.dw_4.object.w3nm.width       = 0
tab_1.tabpage_1.dw_4.object.job3_qty.width   = 0
tab_1.tabpage_1.dw_4.object.job3_inchk.width = 0

tab_1.tabpage_1.dw_5.x 		  = tab_1.tabpage_1.dw_4.x + tab_1.tabpage_1.dw_4.width
tab_1.tabpage_1.dw_5.y 		  = tab_1.tabpage_1.dw_4.y
tab_1.tabpage_1.dw_5.width   = (tab_1.tabpage_1.dw_3.width * 0.6) / 3
tab_1.tabpage_1.dw_5.height  = (tab_1.height - 132) * 0.3 - 100

tab_1.tabpage_1.dw_6.x 		  = tab_1.tabpage_1.dw_5.x + tab_1.tabpage_1.dw_5.width
tab_1.tabpage_1.dw_6.y 		  = tab_1.tabpage_1.dw_4.y
tab_1.tabpage_1.dw_6.width   = (tab_1.tabpage_1.dw_3.width * 0.6) / 3
tab_1.tabpage_1.dw_6.height  = (tab_1.height - 132) * 0.3 - 100

tab_1.tabpage_1.dw_8.x 		  = tab_1.tabpage_1.dw_6.x + tab_1.tabpage_1.dw_6.width
tab_1.tabpage_1.dw_8.y 		  = tab_1.tabpage_1.dw_4.y
tab_1.tabpage_1.dw_8.width   = (tab_1.tabpage_1.dw_3.width * 0.6) / 3
tab_1.tabpage_1.dw_8.height  = (tab_1.height - 132) * 0.3 - 100

tab_1.tabpage_1.dw_9.x 		  = (tab_1.tabpage_1.dw_3.width - (tab_1.tabpage_1.dw_3.width * 0.7)) / 2
tab_1.tabpage_1.dw_9.y 		  = tab_1.tabpage_1.dw_3.y + 300
tab_1.tabpage_1.dw_9.width   = tab_1.tabpage_1.dw_3.width * 0.7
tab_1.tabpage_1.dw_9.height  = tab_1.tabpage_1.dw_3.height

tab_1.tabpage_2.dw_10.width  = tab_1.width  - 64
tab_1.tabpage_2.dw_10.height = tab_1.height - 132 - 100

tab_1.tabpage_2.dw_11.x      = tab_1.tabpage_2.dw_10.x
tab_1.tabpage_2.dw_11.y      = tab_1.tabpage_2.dw_10.y
tab_1.tabpage_2.dw_11.width  = tab_1.tabpage_2.dw_10.width
tab_1.tabpage_2.dw_11.height = tab_1.tabpage_2.dw_10.height

tab_1.tabpage_3.dw_12.width  = tab_1.width  - 64
tab_1.tabpage_3.dw_12.height = tab_1.height - 132 - 100

tab_1.tabpage_3.dw_13.x 	  = (tab_1.tabpage_3.dw_12.width - (tab_1.tabpage_3.dw_12.width * 0.7)) / 2
tab_1.tabpage_3.dw_13.y 	  = tab_1.tabpage_3.dw_12.y + 300
tab_1.tabpage_3.dw_13.width  = tab_1.tabpage_3.dw_12.width  * 0.7
tab_1.tabpage_3.dw_13.height = tab_1.tabpage_3.dw_12.height * 0.7


end event

type pb_save from w_inheritance`pb_save within w_mpplansale_r
integer x = 3438
integer y = 64
end type

event pb_save::clicked;call super::clicked;//
string   ls_uptchk, ls_saleno, ls_wcno, ls_itemno, ls_duedate, ls_purtype, ls_search, ls_intime, ls_chktime
long     ll_row, ll_col, ll_seqno, ll_seq, ll_found, ll_dw15cnt, ll_qty, ll_qty1, ll_qty2, ll_qty3, ll_uptcnt
integer  li_cnt1, li_cnt2, li_cnt3
datetime ldt_inchk

if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" OR &
	GF_PERMISSION('생산계획공정_담당자', gs_userid) = "Y" then
else
	MessageBox("확인","생산계획공정_관리자,담당자 권한이 존재하지 않습니다.")
	RETURN
end if

debugbreak()

dw15.accepttext()
dw3.accepttext()
if dw3.rowcount() < 1 then RETURN

for ll_row = 1 to dw3.rowcount()
	ls_uptchk = dw3.object.uptchk[ll_row]
	
	if ls_uptchk = "Y" then
		for ll_col = 1 to 3 
			ldt_inchk = dw3.GetItemDateTime( ll_row, "job" + string(ll_col) + "_inchk")
			ll_qty    = dw3.getitemnumber( ll_row, "job" + string(ll_col) + "_qty" )
			if NOT isnull(ldt_inchk) then
				if isnull(ll_qty) OR ll_qty = 0 then
					MessageBox("확인",string(ll_col) + "공정 수량을 등록하시기 바랍니다.")
					RETURN
				end if
			end if
		next
		
		ls_saleno = dw3.object.order_no[ll_row]
		ll_seqno  = dw3.object.seq_no[ll_row]
		ls_search = "sale_no = '" + ls_saleno + "' AND seq_no = " + string(ll_seqno)
      ll_found  = dw15.Find( ls_search, 1, dw15.RowCount() )
		// UPDATE
		if ll_found > 0 then 
			li_cnt1 = 0 ; li_cnt2 = 0 ; li_cnt3 = 0
			
			li_cnt1 = dw3.object.job1_cnt[ll_row]		// isnull 처리함
			li_cnt2 = dw3.object.job2_cnt[ll_row]		// isnull 처리함
			li_cnt3 = dw3.object.job3_cnt[ll_row]		// isnull 처리함

			// 화면
			ls_intime  = string(dw3.object.job1_in[ll_row])
			ls_chktime = string(dw3.object.job1_inchk[ll_row])
			if ls_intime <> ls_chktime then li_cnt1++

			ls_intime  = string(dw3.object.job2_in[ll_row])
			ls_chktime = string(dw3.object.job2_inchk[ll_row])
			if ls_intime <> ls_chktime then li_cnt2++

			ls_intime  = string(dw3.object.job3_in[ll_row])
			ls_chktime = string(dw3.object.job3_inchk[ll_row])
			if ls_intime <> ls_chktime then li_cnt3++

			dw3.object.job1_cnt[ll_row] = li_cnt1
			dw3.object.job2_cnt[ll_row] = li_cnt2
			dw3.object.job3_cnt[ll_row] = li_cnt3
			
			// DB			
			dw15.object.job1[ll_found]          = dw3.object.job1[ll_row]
			dw15.object.job2[ll_found]          = dw3.object.job2[ll_row]
			dw15.object.job3[ll_found]          = dw3.object.job3[ll_row]
		// INSERT
		else
			ll_dw15cnt = dw15.insertrow(0)
			
			dw15.ScrollToRow( ll_dw15cnt )
			
			li_cnt1 = 0 ; li_cnt2 = 0 ; li_cnt3 = 0

			// 화면
			ls_intime  = string(dw3.object.job1_in[ll_row])
			ls_chktime = string(dw3.object.job1_inchk[ll_row])
			if ls_intime <> ls_chktime OR not isnull(ls_chktime) then li_cnt1++
			
			ls_intime  = string(dw3.object.job2_in[ll_row])
			ls_chktime = string(dw3.object.job2_inchk[ll_row])
			if ls_intime <> ls_chktime OR not isnull(ls_chktime) then li_cnt2++
			
			ls_intime  = string(dw3.object.job3_in[ll_row])
			ls_chktime = string(dw3.object.job3_inchk[ll_row])
			if ls_intime <> ls_chktime OR not isnull(ls_chktime) then li_cnt3++

			dw3.object.job1_cnt[ll_row]  = li_cnt1
			dw3.object.job2_cnt[ll_row]  = li_cnt2
			dw3.object.job3_cnt[ll_row]  = li_cnt3
			dw3.object.sp0[ll_row]       = 1
		
			// DB
			dw15.object.sale_no[ll_dw15cnt]     = dw3.object.order_no[ll_row]
			dw15.object.seq_no[ll_dw15cnt]      = dw3.object.seq_no[ll_row]
			dw15.object.order_date[ll_dw15cnt]  = dw3.object.order_date[ll_row]
			
			dw15.object.job1[ll_dw15cnt]        = dw3.object.job1[ll_row]			
			dw15.object.job2[ll_dw15cnt]        = dw3.object.job2[ll_row]			
			dw15.object.job3[ll_dw15cnt]        = dw3.object.job3[ll_row]
		end if
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
if wf_update1(dw15,"N") = false then
	RETURN
else
	for ll_row = 1 to dw3.rowcount()
		ls_uptchk = dw3.object.uptchk[ll_row]
		
		if ls_uptchk = "Y" then
			ls_saleno = dw3.object.order_no[ll_row]
			ll_seqno  = dw3.object.seq_no[ll_row]
			
			for ll_col = 1 to 3
				ls_wcno    = dw3.getitemstring( ll_row, "job" + string(ll_col))
				ls_chktime = string(dw3.GetItemDateTime( ll_row, "job" + string(ll_col) + "_inchk"))
				ldt_inchk  = dw3.GetItemDateTime( ll_row, "job" + string(ll_col) + "_inchk")
				ll_qty     = dw3.getitemnumber( ll_row, "job" + string(ll_col) + "_qty" )
				
				if isnull(ls_wcno) OR ls_wcno = "" OR isnull(ls_chktime) OR ls_chktime = "" OR isnull(ll_qty) OR ll_qty = 0 then
				else
					SELECT count(*) INTO :ll_found FROM routcheckdet 
					 WHERE sale_no = :ls_saleno AND seq_no = :ll_seqno AND job = :ls_wcno 
					   AND job_inchk = :ldt_inchk AND job_qty = :ll_qty;
					if ll_found = 1 then
						// 중복데이터는 수정안된것임
					else					
						SELECT max(seq) INTO :ll_seq FROM routcheckdet 
						 WHERE sale_no = :ls_saleno AND seq_no = :ll_seqno AND job = :ls_wcno;
						if isnull(ll_seq) then 
							ll_seq = 1
						else
							ll_seq = ll_seq + 1
						end if
						
						// 공정상세 데이터 생성
						INSERT INTO routcheckdet ( sale_no, seq_no, job, seq, job_in, job_inchk, job_qty, sys_date )
						VALUES ( :ls_saleno, :ll_seqno, :ls_wcno, :ll_seq, null, :ls_chktime, :ll_qty, getdate() );
						if sqlca.sqlcode <> 0 then
							ROLLBACK;
							MessageBox("저장오류","routcheckdet 저장중 오류 발생하였습니다!",exclamation!)
							RETURN
						else
							ll_uptcnt = ll_uptcnt + 1
						end if
					end if
				end if
			next
		end if
	next
	
	// 공정상세 데이터 생성
	if ll_uptcnt > 0 then
		COMMIT;
	end if
end if

// 전체
tab_1.tabpage_1.cbx_all.checked = false

// 작업일1, 작업일2, 작업일3 
tab_1.tabpage_1.rb_8.checked  = false
tab_1.tabpage_1.rb_9.checked  = false
tab_1.tabpage_1.rb_10.checked = false

// 수주별 공정관리
string ls_custno, ls_scene, ls_sdate, ls_edate, ls_work
datetime ld_time

SELECT top 1 getdate() INTO :ld_time FROM login;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")

ls_sdate  = em_1.text
ls_edate  = em_2.text

if tab_1.tabpage_1.cbx_work.checked = true then
	ls_work = "Y"
else
	ls_work = "N"
end if

ls_custno = "%" ; ls_scene  = "%"

dw15.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )			
dw3.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
MessageBox("확인","저장완료")

end event

type dw_1 from w_inheritance`dw_1 within w_mpplansale_r
integer x = 389
integer y = 8
integer width = 119
integer height = 76
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

type st_title from w_inheritance`st_title within w_mpplansale_r
integer x = 41
integer y = 24
integer width = 1019
integer height = 140
string text = "생산계획 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpplansale_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpplansale_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpplansale_r
boolean visible = false
integer x = 2295
end type

type pb_close from w_inheritance`pb_close within w_mpplansale_r
integer x = 3639
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;//
dwItemStatus l_status


dw3.accepttext()

l_status = dw3.GetItemStatus(1, 0, primary!)
if l_status = NotModified!	 then
else
	if MessageBox("확인","현재 작업한 상태를 무시하고 종료하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpplansale_r
integer x = 3241
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

type pb_cancel from w_inheritance`pb_cancel within w_mpplansale_r
boolean visible = false
integer x = 2107
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpplansale_r
integer x = 2848
integer y = 64
integer taborder = 160
end type

event pb_delete::clicked;call super::clicked;// 삭제
long     ll_rowsave, ll_row, ll_upt, ll_seqno, ll_cnt, ll_qty, ll_find
string   ls_saleno, ls_seqno, ls_chk, ls_msg
datetime ldt_orderdate

// 수주별 공정관리
string   ls_custno, ls_scene, ls_sdate, ls_edate, ls_work
datetime ld_time

datawindow dw_det		// 공정체크, 발주체크

// 헤더삭제시에는 공정관리 대상에서 제외함
if is_dw = "dw_3" then 
	dw_det = dw3
	ll_row = dw3.getrow()

	ll_qty = 0
end if

// 헤더삭제시에는 발주관리 대상에서 제외함
if is_dw = "dw_12" then 
	dw_det = dw12
	ll_row = dw12.getrow()

	ll_qty = 0
end if

//////////////////////////////////////////////////
// 상세삭제시 마지막행 검사(dw_5, dw_6, dw_8)
//////////////////////////////////////////////////
// 1차공정
if is_dw = "dw_5" then
	dw_det = dw5		
	ll_row = dw5.getrow()

	if dw6.rowcount() > 0 then
		ll_qty = dw6.object.tjobqty[1]
	else
		ll_qty = 0
	end if
end if

// 2차공정
if is_dw = "dw_6" then 
	dw_det = dw6		
	ll_row = dw6.getrow()

	if dw8.rowcount() > 0 then
		ll_qty = dw8.object.tjobqty[1]
	else
		ll_qty = 0
	end if
end if

// 3차공정
if is_dw = "dw_8" then 
	dw_det = dw8
	ll_row = dw8.getrow()

	ll_qty = 0
end if

// 수주공정관리
if is_dw = "dw_5" OR is_dw = "dw_6" OR is_dw = "dw_8" then
	if dw_det.object.tjobqty[1] - dw_det.object.job_qty[1] >= ll_qty then
		if MessageBox("확인","선택한 대상을 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN

		dw_det.deleterow( ll_row )
		wf_update1( dw_det, "Y" )		
		
		SELECT top 1 getdate() INTO :ld_time FROM login;
		st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")
		
		ls_sdate  = em_1.text
		ls_edate  = em_2.text
		
		if tab_1.tabpage_1.cbx_work.checked = true then
			ls_work = "Y"
		else
			ls_work = "N"
		end if
		
		ls_custno = "%" ; ls_scene  = "%"
		
		dw15.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )			
		dw3.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
	else
		MessageBox("확인","후 공정 수량보다 작을 수는 없습니다.")
		RETURN
	end if
end if

if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" then
	choose case is_dw
		case "dw_3"		
			if dw3.rowcount() < 1 then RETURN
			
			if dw5.rowcount() > 0 OR dw6.rowcount() > 0 OR dw8.rowcount() > 0 then
				if dw5.rowcount() > 0 then	
					ls_msg = "작업장1 의"
					dw5.setcolumn("work_name")
					dw5.setfocus()
				end if

				if dw6.rowcount() > 0 then
					ls_msg = "작업장2 의"
					dw6.setcolumn("work_name")
					dw6.setfocus()
				end if

				if dw8.rowcount() > 0 then
					ls_msg = "작업장3 의"
					dw8.setcolumn("work_name")
					dw8.setfocus()
				end if

				MessageBox("확인",ls_msg + " 작업내역 삭제한 후 작업하시기 바랍니다.")
				RETURN
			end if
			
			for ll_row = 1 to dw3.rowcount()
				ls_chk = dw3.object.chk[ll_row]
				if ls_chk = "Y" then ll_cnt++
			next
			
			if ll_cnt > 0 then
				if MessageBox("확인","선택한 대상을 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN
				
				for ll_row = 1 to dw3.rowcount()
					ls_chk        = dw3.object.chk[ll_row]
			
					ls_saleno     = dw3.object.order_no[ll_row]
					ll_seqno      = dw3.object.seq_no[ll_row]
					ldt_orderdate = dw3.object.order_date[ll_row]
					
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
			
		case "dw_12"		
			if dw12.rowcount() < 1 then RETURN
			
			for ll_row = 1 to dw12.rowcount()
				ls_chk = dw12.object.chk[ll_row]
				if ls_chk = "Y" then ll_cnt++
			next
			
			if ll_cnt > 0 then
				if MessageBox("확인","선택한 대상을 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN
				
				for ll_row = 1 to dw12.rowcount()
					ls_chk        = dw12.object.chk[ll_row]
			
					ls_saleno     = dw12.object.order_no[ll_row]
					ll_seqno      = dw12.object.seq_no[ll_row]
					ldt_orderdate = dw12.object.order_date[ll_row]
					
					if ls_chk = "Y" then
						SELECT count(*) INTO :ll_upt FROM routcheck WHERE sale_no = :ls_saleno AND seq_no = :ll_seqno;
						if ll_upt = 0 then
							INSERT INTO purcheck ( sale_no, seq_no, order_date, del_yn )
							VALUES ( :ls_saleno, :ll_seqno, :ldt_orderdate, "Y" );
							if sqlca.sqldbcode <> 0 then
								MessageBox("오류","purcheck INSERT " + string(ll_row) + " 번째줄 오류발생.~r~n" + SQLCA.sqlerrtext,exclamation!)
								rollback;
								exit
							end if					
						else
							UPDATE purcheck SET del_yn = 'Y' WHERE sale_no = :ls_saleno AND seq_no = :ll_seqno;
							if sqlca.sqldbcode <> 0 then
								MessageBox("오류","purcheck UPDATE중 " + string(ll_row) + " 번째줄 오류발생.~r~n" + SQLCA.sqlerrtext,exclamation!)
								rollback;
								exit
							end if	
						end if
					end if
				next
				
				pb_retrieve.triggerevent( clicked! )
			else
				MessageBox("확인","발주관리 대상에서 제외할 대상을 선택하시기 바랍니다.")
			end if			
	end choose
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpplansale_r
boolean visible = false
integer x = 1723
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpplansale_r
integer x = 2651
integer y = 64
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_locno, ls_sdate, ls_edate, ls_yyyymm, ls_yyyy, ls_mm, ls_today, ls_yday, ls_nday
string ls_custno, ls_scene, ls_wcno, ls_wcname, ls_flag, ls_Filter, ls_colx, ls_work
string ls_planflag, ls_title, ls_purtype, ls_confirm, ls_rlseyn
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


SELECT top 1 getdate() INTO :ld_time FROM login;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")

ls_sdate = em_1.text
ls_edate = em_2.text

// 성형제외
if tab_1.tabpage_1.cbx_work.checked = true then
	ls_work = "Y"
else
	ls_work = "N"
end if

// 사업장
dw_area.accepttext()
ls_area   = dw_area.object.area[1]

SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :ls_area;
if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("확인","사업장 기본저장소가 설정되지 않았습니다.") 
end if

// 작업장
dw_2.accepttext()
ls_wcno   = dw_2.object.wc_no[1]

dw_2.getchild("wc_no", idwc_wc)
ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = "%"	// 작업장명

pb_save.enabled   = false		// 저장
pb_delete.enabled = false		// 삭제

//dw_area.enabled = true
//dw_area.object.area.Background.Color = rgb( 255,255,255 )
//dw_2.enabled    = true
//dw_2.object.wc_no.Background.Color = rgb( 255,255,255 )

choose case tab_1.selectedtab
	// 수주별 공정관리
	case 1		
		if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" OR &
		   GF_PERMISSION('생산계획공정_담당자', gs_userid) = "Y" then
			pb_delete.enabled = true
			pb_save.enabled   = true
		end if
	
		dw_area.enabled = false
//		dw_2.enabled    = false

		dw_area.object.area.Background.Color = 67108864
		dw_2.object.wc_no.Background.Color   = 67108864
		
		SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111)
		     , convert(char(10),dateadd(month, 1, getdate()),111)  // DBO.UF_GETLASTDAY( convert(char(8),getdate(),112) )
		  INTO :ls_sdate, :ls_edate
		  FROM login;

		em_1.text    = ls_sdate		// -1월
		em_2.text    = ls_edate		// +1월
		em_1.enabled = false
		em_2.enabled = false

		SELECT top 1 getdate() INTO :ld_time FROM login;
		st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")
		
		ls_sdate  = em_1.text
		ls_edate  = em_2.text
		
		ls_custno = "%"
		ls_scene  = "%"		
	   dw15.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
		
		if dw3.rowcount() > 0 then
			if MessageBox("확인","수주별 공정진행 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				dw3.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
				dw3.sharedata( dw4 )
			end if
		else
			dw3.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	
			dw3.sharedata( dw4 )
			MessageBox("확인","조회완료")
		end if
		
		string ls_saleno, ls_wcno1, ls_wcno2, ls_wcno3
		long   ll_seqno

		dw5.reset() ; dw6.reset() ; dw8.reset()
		if dw3.rowcount() > 0 then
			ls_saleno = dw3.object.order_no[1]
			ll_seqno  = dw3.object.seq_no[1]
			ls_wcno1  = dw3.object.job1[1]
			ls_wcno2  = dw3.object.job2[1]
			ls_wcno3  = dw3.object.job3[1]

			dw5.retrieve( ls_saleno, ll_seqno, ls_wcno1 )
			dw6.retrieve( ls_saleno, ll_seqno, ls_wcno2 )
			dw8.retrieve( ls_saleno, ll_seqno, ls_wcno3 )		
		end if
		
		dw9.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, ls_work )	

	// 작업일보 실적조회
	case 2		
		dw_area.enabled = true
		dw_2.enabled    = true

		dw_area.object.area.Background.Color = rgb(255, 255, 255)
		dw_2.object.wc_no.Background.Color   = rgb(255, 255, 255)
		
		em_1.enabled = true
		em_2.enabled = true
		
		ls_sdate  = em_1.text
		ls_edate  = em_2.text

		dw10.reset()
		if dw10.rowcount() > 0 then
			if MessageBox("확인","작업일보 실적조회 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				dw10.retrieve( ls_locno, ls_wcname, ls_sdate, ls_edate )	
			end if
		else
			dw10.retrieve( ls_locno, ls_wcname, ls_sdate, ls_edate )	
			MessageBox("확인","조회완료")
		end if
		dw10.sharedata( dw11 )
	
	// 수주품목_발주조회
	case 3
		if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" OR &
		   GF_PERMISSION('생산계획공정_담당자', gs_userid) = "Y" then
			pb_delete.enabled = true
			pb_save.enabled   = true
		end if
	
		dw_area.enabled = false
		dw_2.enabled    = false

		dw_area.object.area.Background.Color = 67108864
		dw_2.object.wc_no.Background.Color   = 67108864
		
		ls_confirm  = "Y"		// 전체:%, 확정:Y, 미확정:N
		ls_rlseyn   = "2"		// 전체:%, 출고:1, 미출고:2

		if dw12.rowcount() > 0 then
			if MessageBox("확인","수주품목_발주조회 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				dw12.setredraw( false )		
				dw12.retrieve( ls_locno, ls_sdate, ls_edate, ls_confirm, ls_rlseyn )
				dw12.groupcalc()
				// 소계숨김
				if tab_1.tabpage_3.rb_1.checked = true then
					dw12.Modify("DataWindow.Detail.Height=88")		// Detail
					dw12.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
				end if				
				dw12.setredraw( true )		
			end if
		else
			dw12.setredraw( false )	
			dw12.retrieve( ls_locno, ls_sdate, ls_edate, ls_confirm, ls_rlseyn )
			dw12.groupcalc()
			// 소계숨김
			if tab_1.tabpage_3.rb_1.checked = true then
				dw12.Modify("DataWindow.Detail.Height=88")		// Detail
				dw12.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
			end if			
			dw12.setredraw( true )		
			
			MessageBox("확인","조회완료")
		end if
		
		dw13.setredraw( false )	
		dw13.retrieve( ls_locno, ls_sdate, ls_edate, ls_confirm, ls_rlseyn )
		dw13.groupcalc()
		// 소계숨김
		if tab_1.tabpage_3.rb_1.checked = true then
			dw13.Modify("DataWindow.Detail.Height=88")		// Detail
			dw13.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
		end if				
		dw13.setredraw( true )		
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpplansale_r
integer x = 2089
integer y = 16
integer width = 512
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpplansale_r
integer x = 1138
integer y = 16
integer width = 933
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpplansale_r
integer x = 2624
integer y = 16
integer width = 1239
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpplansale_r
integer x = 1445
integer y = 140
integer width = 599
integer height = 80
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpplansale_r
integer x = 2121
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

type em_2 from editmask within w_mpplansale_r
integer x = 2203
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
long backcolor = 16777215
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
//	if this.text < em_1.text then em_1.text = this.text
//end if
//
end event

type st_2 from statictext within w_mpplansale_r
integer x = 2501
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

type st_1 from statictext within w_mpplansale_r
integer x = 1166
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

type dw_area from datawindow within w_mpplansale_r
integer x = 1449
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

type pb_excel from picturebutton within w_mpplansale_r
event mousemove pbm_mousemove
integer x = 3045
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
		if tab_1.tabpage_2.cbx_2.checked = true then
			dwxls  = dw11
		else
			dwxls  = dw10
		end if
	
	case 3
		if tab_1.tabpage_3.cbx_purskip.checked = true then
			dwxls  = dw13
		else
			dwxls  = dw12
		end if
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

type tab_1 from tab within w_mpplansale_r
integer x = 37
integer y = 444
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;//
datetime ld_time

choose case newindex
	case 2, 3
		SELECT top 1 getdate() INTO :ld_time FROM login;
		em_1.text = string(ld_time,"yyyy/mm/dd")
		em_2.text = string(ld_time,"yyyy/mm/dd")
end choose		
		
pb_retrieve.postevent( clicked! )

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
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
cbx_skip cbx_skip
dw_8 dw_8
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
cbx_work cbx_work
st_7 st_7
em_day em_day
ddlb_time ddlb_time
cb_10 cb_10
cb_11 cb_11
cbx_all cbx_all
rb_8 rb_8
rb_9 rb_9
rb_10 rb_10
dw_9 dw_9
end type

on tabpage_1.create
this.cbx_skip=create cbx_skip
this.dw_8=create dw_8
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.cbx_work=create cbx_work
this.st_7=create st_7
this.em_day=create em_day
this.ddlb_time=create ddlb_time
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cbx_all=create cbx_all
this.rb_8=create rb_8
this.rb_9=create rb_9
this.rb_10=create rb_10
this.dw_9=create dw_9
this.Control[]={this.cbx_skip,&
this.dw_8,&
this.dw_6,&
this.dw_5,&
this.dw_4,&
this.dw_3,&
this.cbx_work,&
this.st_7,&
this.em_day,&
this.ddlb_time,&
this.cb_10,&
this.cb_11,&
this.cbx_all,&
this.rb_8,&
this.rb_9,&
this.rb_10,&
this.dw_9}
end on

on tabpage_1.destroy
destroy(this.cbx_skip)
destroy(this.dw_8)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.cbx_work)
destroy(this.st_7)
destroy(this.em_day)
destroy(this.ddlb_time)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cbx_all)
destroy(this.rb_8)
destroy(this.rb_9)
destroy(this.rb_10)
destroy(this.dw_9)
end on

type cbx_skip from checkbox within tabpage_1
integer x = 4096
integer y = 16
integer width = 366
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "공정제외"
end type

event clicked;//
if this.checked = true then
	dw9.visible  = true	// 공정관리 SKIP
else
	dw9.visible  = false	// 공정관리 SKIP
end if

end event

type dw_8 from datawindow within tabpage_1
integer x = 3497
integer y = 1272
integer width = 965
integer height = 620
integer taborder = 110
string title = "none"
string dataobject = "d_routcheckdet_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )
dw3.scrolltorow( row )

//
is_dw = "dw_8"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_6 from datawindow within tabpage_1
integer x = 2533
integer y = 1272
integer width = 965
integer height = 620
integer taborder = 100
string title = "none"
string dataobject = "d_routcheckdet_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )
dw3.scrolltorow( row )

//
is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_5 from datawindow within tabpage_1
integer x = 1568
integer y = 1272
integer width = 965
integer height = 620
integer taborder = 90
string title = "none"
string dataobject = "d_routcheckdet_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )
dw3.scrolltorow( row )

//
is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_4 from datawindow within tabpage_1
integer x = 9
integer y = 1272
integer width = 1554
integer height = 620
integer taborder = 80
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
dw3.scrolltorow( row )

//
is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_saleno, ls_wcno1, ls_wcno2, ls_wcno3
long   ll_seqno

ls_saleno = this.object.order_no[row]
ll_seqno  = this.object.seq_no[row]
ls_wcno1  = this.object.job1[row]
ls_wcno2  = this.object.job2[row]
ls_wcno3  = this.object.job3[row]

dw5.retrieve( ls_saleno, ll_seqno, ls_wcno1 )
dw6.retrieve( ls_saleno, ll_seqno, ls_wcno2 )
dw8.retrieve( ls_saleno, ll_seqno, ls_wcno3 )

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

type dw_3 from datawindow within tabpage_1
string tag = "d_routsaledet_status"
integer x = 9
integer y = 96
integer width = 4453
integer height = 1164
integer taborder = 70
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
dw4.scrolltorow( row )

//
is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_saleno, ls_wcno1, ls_wcno2, ls_wcno3
long   ll_seqno

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

//
ls_saleno = this.object.order_no[row]
ll_seqno  = this.object.seq_no[row]
ls_wcno1  = this.object.job1[row]
ls_wcno2  = this.object.job2[row]
ls_wcno3  = this.object.job3[row]

dw5.retrieve( ls_saleno, ll_seqno, ls_wcno1 )
dw6.retrieve( ls_saleno, ll_seqno, ls_wcno2 )
dw8.retrieve( ls_saleno, ll_seqno, ls_wcno3 )

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

event itemchanged;// 수량체크, 공정관리자 체크
string ls_planmgr, ls_job, ls_premission
long   ll_row, ll_qty, ll_qty1, ll_qty2, ll_qty3, ll_totqty

if isnull( row ) OR row < 1 then RETURN

debugbreak()

//		if GF_PERMISSION("생산계획공정_관리자", gs_userid) = "Y" OR &
//		   GF_PERMISSION('생산계획공정_담당자', gs_userid) = "Y" then

ls_premission = GF_PERMISSION("생산계획공정_관리자", gs_userid)

// this.accepttext() 로직 마직막에서 처리함

ll_qty  = this.object.jan_qty[row]			// 잔량
if dw5.rowcount() > 0 then 
	ll_qty1 = dw5.object.tjobqty[1]		 	// 수량1
else
	ll_qty1 = 0
end if

if dw6.rowcount() > 0 then 
	ll_qty2 = dw6.object.tjobqty[1]		 	// 수량2
else
	ll_qty2 = 0
end if

if dw8.rowcount() > 0 then 
	ll_qty3 = dw8.object.tjobqty[1]		 	// 수량3
else
	ll_qty3 = 0
end if

choose case dwo.name
	case "job1_qty"
		// 공정관리자 체크
		ls_job = this.object.job1[row]
		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
		if ls_premission = "Y" then	// 생산계획공정_관리자
		else
			if gs_userid <> ls_planmgr then
				this.object.job1_qty[row]  = this.object.job1_qty1[row]
				MessageBox("확인","해당하는 공정의 공정관리자가 아닙니다.")
				RETURN 1
			end if
		end if
		
		if isnull(this.object.job1_inchk[row]) then
			MessageBox("확인","작업일1 반드시 입력하시기 바랍니다.")
			RETURN 1
		end if

		// 마이너스 처리안됨
		if long(data) < 0 then 
			this.object.job1_qty[row]  = ll_qty1		
			RETURN 1
		end if
	
		ll_totqty = ll_qty1 + long(data)
		if ll_totqty > ll_qty then
			MessageBox("확인","잔량보다 큰 경우입니다.")
			this.object.job1_qty[row]  = this.object.job1_qty1[row]
			RETURN 1
		end if
		
		dw3.object.chk[row] = "Y"
		dw3.object.uptchk[row] = "Y"
		this.accepttext()

	case "job2_qty"
		// 공정관리자 체크
		ls_job = this.object.job2[row]
		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
		if ls_premission = "Y" then	// 생산계획공정_관리자
		else
			if gs_userid <> ls_planmgr then
				this.object.job2_qty[row]  = this.object.job2_qty1[row]
				MessageBox("확인","해당하는 공정의 공정관리자가 아닙니다.")
				RETURN 1
			end if
		end if
		
		if isnull(this.object.job2_inchk[row]) then
			MessageBox("확인","작업일2 반드시 입력하시기 바랍니다.")
			RETURN 1
		end if

		// 마이너스 처리안됨
		if long(data) < 0 then 
			this.object.job2_qty[row] = ll_qty2		
			RETURN 1
		end if
		
		ll_totqty = ll_qty2 + long(data)
		if ll_totqty > ll_qty1 then
			MessageBox("확인","1공정 수량보다 큰 경우입니다.")
			this.object.job2_qty[row]  = this.object.job2_qty1[row]
			RETURN 1
		end if
		
		dw3.object.chk[row] = "Y"
		dw3.object.uptchk[row] = "Y"
		this.accepttext()

	case "job3_qty"
		// 공정관리자 체크
		ls_job = this.object.job3[row]
		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
		if ls_premission = "Y" then	// 생산계획공정_관리자
		else
			if gs_userid <> ls_planmgr then
				this.object.job3_qty[row]  = this.object.job3_qty1[row]
				MessageBox("확인","해당하는 공정의 공정관리자가 아닙니다.")
				RETURN 1
			end if
		end if
		
		if isnull(this.object.job3_inchk[row]) then
			MessageBox("확인","작업일3 반드시 입력하시기 바랍니다.")
			RETURN 1
		end if

		// 마이너스 처리안됨
		if long(data) < 0 then 
			this.object.job3_qty[row]  = ll_qty3
			RETURN 1
		end if

		ll_totqty = ll_qty3 + long(data)
		if ll_totqty > ll_qty2 then
			MessageBox("확인","2공정 수량보다 큰 경우입니다.")
			this.object.job3_qty[row]  = this.object.job3_qty1[row]
			RETURN 1
		end if

		dw3.object.chk[row] = "Y"
		dw3.object.uptchk[row] = "Y"
		this.accepttext()
end choose

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
choose case dwo.name
	case "job1_qty", "job2_qty", "job3_qty"
		this.SelectText(1, LenA(GetText()) + 2)		// 수량전체 선택
end choose
end event

type cbx_work from checkbox within tabpage_1
integer x = 9
integer y = 16
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

type st_7 from statictext within tabpage_1
integer x = 759
integer y = 24
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

type em_day from editmask within tabpage_1
integer x = 960
integer y = 16
integer width = 416
integer height = 72
integer taborder = 40
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

type ddlb_time from dropdownlistbox within tabpage_1
integer x = 1385
integer y = 8
integer width = 462
integer height = 408
integer taborder = 121
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

type cb_10 from commandbutton within tabpage_1
integer x = 1856
integer y = 4
integer width = 311
integer height = 88
integer taborder = 60
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
string   ls_premission, ls_planmgr
long     ll_row, ll_col, ll_cnt, ll_upt, ll_qty
datetime ldt_date

ls_premission = GF_PERMISSION("생산계획공정_관리자", gs_userid)

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

dw3.accepttext()
// 다중선택
for ll_row = 1 to dw3.rowcount()
	if dw3.object.chk[ll_row] = "Y" then
		ls_job = dw3.getitemstring( ll_row, "job" + string(ll_col) )

		// 생산계획공정_담당자
		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
		
		if ls_premission = "Y" then	// 생산계획공정_관리자
			ll_cnt = ll_cnt + 1

			// 작업일
			ls_column = "job" + string(ll_col) + ls_type
			dw3.setitem( ll_row, ls_column, ldt_date )
			
			// UPDATE 대상
			dw3.setitem( ll_row, "uptchk", "Y" )
		else
			// 생산계획공정_담당자
			if gs_userid <> ls_planmgr OR isnull( ls_job ) OR ls_job = "" then
				MessageBox("확인", string(ll_row) + " 행 생산계획공정_담당자가 아닙니다.")
			else
				ll_cnt = ll_cnt + 1

				// 작업일
				ls_column = "job" + string(ll_col) + ls_type
				dw3.setitem( ll_row, ls_column, ldt_date )
				
				// UPDATE 대상
				dw3.setitem( ll_row, "uptchk", "Y" )
			end if	
		end if	
	end if
next

// 선택항목 없는경우
if ll_cnt = 0 then
	ll_row = dw3.getrow()
	if ll_row > 0 then
		ls_job = dw3.getitemstring( ll_row, "job" + string(ll_col) )

		// 생산계획공정_담당자
		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
		if ls_premission = "Y" then	// 생산계획공정_관리자
			if isnull( ls_job ) OR ls_job = "" then
			else
				dw3.object.chk[ll_row] = "Y"
				
				// 작업일
				ls_column = "job" + string(ll_col) + ls_type
				dw3.setitem( ll_row, ls_column, ldt_date )
				
				// UPDATE 대상
				dw3.setitem( ll_row, "uptchk", "Y" )
				
				ll_cnt = 1
			end if	
		else									// 생산계획공정_담당자
			if gs_userid <> ls_planmgr OR isnull( ls_job ) OR ls_job = "" then
			else
				dw3.object.chk[ll_row] = "Y"
				
				// 작업일
				ls_column = "job" + string(ll_col) + ls_type
				dw3.setitem( ll_row, ls_column, ldt_date )
				
				// UPDATE 대상
				dw3.setitem( ll_row, "uptchk", "Y" )
				
				ll_cnt = 1
			end if	
		end if	
	end if
end if

if ll_cnt > 0 then
	// 작업일1, 작업일2, 작업일3 
	tab_1.tabpage_1.rb_8.checked  = false
	tab_1.tabpage_1.rb_9.checked  = false
	tab_1.tabpage_1.rb_10.checked = false	
	
	MessageBox("확인",string(ll_cnt,"#,##0") + " 건 적용완료")
else
	MessageBox("확인","적용할 대상없거나, 공정담당자가 아닙니다.")
end if

end event

type cb_11 from commandbutton within tabpage_1
integer x = 2171
integer y = 4
integer width = 229
integer height = 88
integer taborder = 70
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
string   ls_premission, ls_planmgr
long     ll_row, ll_col
datetime ldt_date

ls_premission = GF_PERMISSION("생산계획공정_관리자", gs_userid)

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

for ll_row = 1 to dw3.rowcount()
	if dw3.object.chk[ll_row] = "Y" then
		ls_job    = dw3.getitemstring( ll_row, "job" + string(ll_col) )			

		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
		if ls_premission = "Y" then	// 생산계획공정_관리자
			ls_column = "job" + string(ll_col) + ls_type
			dw3.setitem( ll_row, ls_column, ldt_date )
	
			dw3.setitem( ll_row, "uptchk", "Y" )		
		else									// 생산계획공정_담당자
			if gs_userid <> ls_planmgr then
			else
				ls_column = "job" + string(ll_col) + ls_type
				dw3.setitem( ll_row, ls_column, ldt_date )
		
				dw3.setitem( ll_row, "uptchk", "Y" )		
			end if
		end if
	end if
next

end event

type cbx_all from checkbox within tabpage_1
integer x = 2432
integer y = 12
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

for ll_row = 1 to dw3.rowcount()
	dw3.object.chk[ll_row] = ls_chk
next

end event

type rb_8 from radiobutton within tabpage_1
integer x = 2661
integer y = 4
integer width = 425
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

type rb_9 from radiobutton within tabpage_1
integer x = 3095
integer y = 4
integer width = 425
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

type rb_10 from radiobutton within tabpage_1
integer x = 3529
integer y = 4
integer width = 425
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

type dw_9 from datawindow within tabpage_1
integer x = 878
integer y = 412
integer width = 2958
integer height = 776
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "공정관리 제외내역"
string dataobject = "d_routsaledet_skip"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "작업일보 실적조회"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cbx_2 cbx_2
cbx_1 cbx_1
st_3 st_3
dw_10 dw_10
dw_11 dw_11
end type

on tabpage_2.create
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_3=create st_3
this.dw_10=create dw_10
this.dw_11=create dw_11
this.Control[]={this.cbx_2,&
this.cbx_1,&
this.st_3,&
this.dw_10,&
this.dw_11}
end on

on tabpage_2.destroy
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.dw_10)
destroy(this.dw_11)
end on

type cbx_2 from checkbox within tabpage_2
integer x = 1829
integer y = 20
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
string text = "구분제외"
end type

event clicked;// 구분제외
if this.checked = true then
	dw11.groupcalc()
	dw11.visible = true
	dw10.visible = false
else
	dw10.groupcalc()
	dw10.visible = true
	dw11.visible = false
end if

end event

type cbx_1 from checkbox within tabpage_2
integer x = 1417
integer y = 20
integer width = 379
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "소계보기"
end type

event clicked;// 소계보기
dw10.setredraw( false )
if this.checked = true then
	dw10.groupcalc()
	dw10.Modify("DataWindow.Detail.Height=0")			// Detail
	dw10.Modify("DataWindow.Trailer.1.Height=80")	// 소계
else
	dw10.groupcalc()
	dw10.Modify("DataWindow.Detail.Height=88")		// Detail
	dw10.Modify("DataWindow.Trailer.1.Height=80")		// 소계
end if
dw10.setredraw( true )

end event

type st_3 from statictext within tabpage_2
integer x = 14
integer y = 28
integer width = 1344
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "오전: 12:00, 오후: 17:30, 야간: 23:59"
boolean focusrectangle = false
end type

type dw_10 from datawindow within tabpage_2
integer x = 9
integer y = 96
integer width = 4453
integer height = 1796
integer taborder = 60
string title = "none"
string dataobject = "d_mpplansale_audit"
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
is_dw = "dw_10"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_11 from datawindow within tabpage_2
integer x = 1047
integer y = 472
integer width = 2469
integer height = 1008
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpplansale_audit2"
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
is_dw = "dw_11"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "수주품목 발주조회"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cbx_purskip cbx_purskip
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_12 dw_12
cbx_3 cbx_3
dw_13 dw_13
end type

on tabpage_3.create
this.cbx_purskip=create cbx_purskip
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_12=create dw_12
this.cbx_3=create cbx_3
this.dw_13=create dw_13
this.Control[]={this.cbx_purskip,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.dw_12,&
this.cbx_3,&
this.dw_13}
end on

on tabpage_3.destroy
destroy(this.cbx_purskip)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_12)
destroy(this.cbx_3)
destroy(this.dw_13)
end on

type cbx_purskip from checkbox within tabpage_3
integer x = 1330
integer y = 20
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "발주제외"
end type

event clicked;//
if this.checked = true then
	dw13.visible  = true	// 공정관리 SKIP
else
	dw13.visible  = false	// 공정관리 SKIP
end if

end event

type rb_3 from radiobutton within tabpage_3
integer x = 846
integer y = 24
integer width = 357
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체보기"
end type

event clicked;// 전체보기
dw12.setredraw( false )
if this.checked = true then
	dw12.Modify("DataWindow.Detail.Height=88")		// Detail
	dw12.Modify("DataWindow.Trailer.1.Height=76")	// 소계
end if
dw12.setredraw( true )

dw13.setredraw( false )
if this.checked = true then
	dw13.Modify("DataWindow.Detail.Height=88")		// Detail
	dw13.Modify("DataWindow.Trailer.1.Height=76")	// 소계
end if
dw13.setredraw( true )

end event

type rb_2 from radiobutton within tabpage_3
integer x = 462
integer y = 24
integer width = 357
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "소계보기"
end type

event clicked;// 소계보기
dw12.setredraw( false )
if this.checked = true then
	dw12.Modify("DataWindow.Detail.Height=0")			// Detail
	dw12.Modify("DataWindow.Trailer.1.Height=76")	// 소계
end if
dw12.setredraw( true  )

dw13.setredraw( false )
if this.checked = true then
	dw13.Modify("DataWindow.Detail.Height=0")			// Detail
	dw13.Modify("DataWindow.Trailer.1.Height=76")	// 소계
end if
dw13.setredraw( true  )

end event

type rb_1 from radiobutton within tabpage_3
integer x = 78
integer y = 24
integer width = 357
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "소계숨김"
boolean checked = true
end type

event clicked;// 소계숨김
dw12.setredraw( false )
if this.checked = true then
	dw12.Modify("DataWindow.Detail.Height=88")		// Detail
	dw12.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
end if
dw12.setredraw( true  )

dw13.setredraw( false )
if this.checked = true then
	dw13.Modify("DataWindow.Detail.Height=88")		// Detail
	dw13.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
end if
dw13.setredraw( true  )

end event

type dw_12 from datawindow within tabpage_3
integer x = 9
integer y = 96
integer width = 4453
integer height = 1796
integer taborder = 60
string title = "none"
string dataobject = "d_routestatus_purdet"
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
is_dw = "dw_12"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type cbx_3 from checkbox within tabpage_3
integer x = 251
integer y = 164
integer width = 64
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;//
//
long ll_row

dw12.setredraw( false )
if this.checked = true then
	for ll_row = 1 to dw12.rowcount()
		dw12.object.chk[ll_row] = "Y"
	next
else
	for ll_row = 1 to dw12.rowcount()
		dw12.object.chk[ll_row] = ""
	next
end if
dw12.setredraw( true )

end event

type dw_13 from datawindow within tabpage_3
integer x = 599
integer y = 448
integer width = 3323
integer height = 1040
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_routestatus_purdetskip"
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
is_dw = "dw_13"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_5 from statictext within w_mpplansale_r
integer x = 2697
integer y = 312
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

type st_time from statictext within w_mpplansale_r
integer x = 2907
integer y = 312
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

type st_10 from statictext within w_mpplansale_r
integer x = 1166
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

type st_4 from statictext within w_mpplansale_r
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_mpplansale_r
integer x = 274
integer y = 300
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

type ddlb_dwtitles from dropdownlistbox within w_mpplansale_r
integer x = 306
integer y = 312
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

type st_6 from statictext within w_mpplansale_r
integer x = 745
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

type ddlb_op from dropdownlistbox within w_mpplansale_r
integer x = 914
integer y = 300
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

type sle_value from singlelineedit within w_mpplansale_r
integer x = 1234
integer y = 304
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

type cb_2 from commandbutton within w_mpplansale_r
integer x = 2025
integer y = 304
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
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
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

type cb_3 from commandbutton within w_mpplansale_r
integer x = 2190
integer y = 304
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
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_mpplansale_r
integer x = 2354
integer y = 304
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
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpplansale_r
integer x = 2519
integer y = 304
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
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_7 from datawindow within w_mpplansale_r
integer x = 530
integer y = 8
integer width = 119
integer height = 76
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

type dw_15 from datawindow within w_mpplansale_r
string tag = "d_routsaledet"
integer x = 55
integer width = 293
integer height = 92
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

type cbx_op from checkbox within w_mpplansale_r
integer x = 1819
integer y = 312
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

type cb_1 from commandbutton within w_mpplansale_r
integer x = 3717
integer y = 296
integer width = 800
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업진척/작업자투입조회"
end type

event clicked;// 작업진척/작업자투입조회
if IsValid(w_o_main) then 
	OpenSheet(w_mpprocess_r,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_mpprocess_r,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_mpprocess_r,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_mpprocess_r,  w_all_main, 5, original!)
end if

end event

type st_idx1 from statictext within w_mpplansale_r
integer x = 686
integer y = 200
integer width = 142
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 255
string text = "1 >="
alignment alignment = center!
boolean focusrectangle = false
end type

type st_idx2 from statictext within w_mpplansale_r
integer x = 823
integer y = 200
integer width = 142
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "2 >="
alignment alignment = center!
boolean focusrectangle = false
end type

type st_idx3 from statictext within w_mpplansale_r
integer x = 928
integer y = 200
integer width = 142
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "3 >="
alignment alignment = center!
boolean focusrectangle = false
end type

type st_idx0 from statictext within w_mpplansale_r
integer x = 544
integer y = 200
integer width = 142
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 8421504
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_mpplansale_r
integer x = 37
integer y = 244
integer width = 4521
integer height = 184
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

