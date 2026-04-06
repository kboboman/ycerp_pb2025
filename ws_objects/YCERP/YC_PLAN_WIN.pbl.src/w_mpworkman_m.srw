$PBExportHeader$w_mpworkman_m.srw
$PBExportComments$근무신청서
forward
global type w_mpworkman_m from w_inheritance
end type
type em_1 from editmask within w_mpworkman_m
end type
type em_2 from editmask within w_mpworkman_m
end type
type st_1 from statictext within w_mpworkman_m
end type
type dw_area from datawindow within w_mpworkman_m
end type
type pb_excel from picturebutton within w_mpworkman_m
end type
type tab_1 from tab within w_mpworkman_m
end type
type tabpage_1 from userobject within tab_1
end type
type cbx_basic from checkbox within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type pb_6 from picturebutton within tabpage_1
end type
type st_dw10 from statictext within tabpage_1
end type
type dw_10 from datawindow within tabpage_1
end type
type em_etime from editmask within tabpage_1
end type
type cbx_2 from checkbox within tabpage_1
end type
type cbx_c3 from checkbox within tabpage_1
end type
type cbx_c2 from checkbox within tabpage_1
end type
type cbx_c1 from checkbox within tabpage_1
end type
type st_dw8 from statictext within tabpage_1
end type
type st_dw4 from statictext within tabpage_1
end type
type st_dw7 from statictext within tabpage_1
end type
type st_dw3 from statictext within tabpage_1
end type
type pb_5 from picturebutton within tabpage_1
end type
type dw_7 from datawindow within tabpage_1
end type
type pb_4 from picturebutton within tabpage_1
end type
type cb_6 from commandbutton within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type em_stime from editmask within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type pb_3 from picturebutton within tabpage_1
end type
type pb_2 from picturebutton within tabpage_1
end type
type pb_1 from picturebutton within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type cbx_all from checkbox within tabpage_1
end type
type dw_8 from datawindow within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type dw_9 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cbx_basic cbx_basic
cb_7 cb_7
pb_6 pb_6
st_dw10 st_dw10
dw_10 dw_10
em_etime em_etime
cbx_2 cbx_2
cbx_c3 cbx_c3
cbx_c2 cbx_c2
cbx_c1 cbx_c1
st_dw8 st_dw8
st_dw4 st_dw4
st_dw7 st_dw7
st_dw3 st_dw3
pb_5 pb_5
dw_7 dw_7
pb_4 pb_4
cb_6 cb_6
st_2 st_2
dw_5 dw_5
em_stime em_stime
cbx_1 cbx_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_4 dw_4
cbx_all cbx_all
dw_8 dw_8
dw_3 dw_3
dw_9 dw_9
end type
type tabpage_2 from userobject within tab_1
end type
type cbx_3 from checkbox within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cbx_3 cbx_3
dw_6 dw_6
end type
type tabpage_3 from userobject within tab_1
end type
type cb_10 from commandbutton within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type cb_9 from commandbutton within tabpage_3
end type
type cb_8 from commandbutton within tabpage_3
end type
type dw_11 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_10 cb_10
st_7 st_7
st_3 st_3
cb_9 cb_9
cb_8 cb_8
dw_11 dw_11
end type
type tab_1 from tab within w_mpworkman_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type st_5 from statictext within w_mpworkman_m
end type
type st_time from statictext within w_mpworkman_m
end type
type st_10 from statictext within w_mpworkman_m
end type
type st_4 from statictext within w_mpworkman_m
end type
type ddlb_fld from dropdownlistbox within w_mpworkman_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpworkman_m
end type
type st_6 from statictext within w_mpworkman_m
end type
type ddlb_op from dropdownlistbox within w_mpworkman_m
end type
type sle_value from singlelineedit within w_mpworkman_m
end type
type cb_2 from commandbutton within w_mpworkman_m
end type
type cb_3 from commandbutton within w_mpworkman_m
end type
type cb_4 from commandbutton within w_mpworkman_m
end type
type cb_5 from commandbutton within w_mpworkman_m
end type
type cbx_op from checkbox within w_mpworkman_m
end type
type cb_1 from commandbutton within w_mpworkman_m
end type
type cbx_4 from checkbox within w_mpworkman_m
end type
type cbx_5 from checkbox within w_mpworkman_m
end type
type dw_12 from datawindow within w_mpworkman_m
end type
type cbx_6 from checkbox within w_mpworkman_m
end type
type gb_4 from groupbox within w_mpworkman_m
end type
type gb_5 from groupbox within w_mpworkman_m
end type
end forward

global type w_mpworkman_m from w_inheritance
integer x = 5
integer y = 72
integer width = 4608
integer height = 2576
string title = "근무신청서(w_mpworkman_m)"
boolean resizable = false
string icon = "OleGenReg!"
em_1 em_1
em_2 em_2
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
cbx_op cbx_op
cb_1 cb_1
cbx_4 cbx_4
cbx_5 cbx_5
dw_12 dw_12
cbx_6 cbx_6
gb_4 gb_4
gb_5 gb_5
end type
global w_mpworkman_m w_mpworkman_m

type variables
//
st_print i_print
string is_planmgr, is_wcname, is_area, is_saleno, is_dw, is_teamno

string is_wcno, is_itemno, is_duedate, is_purtype		// dw8 새로고침

DataWindowChild idwc_area, idwc_cust, idwc_wc, idwc_team, idwc_work
datawindow  dw3, dw4, dw5, dw6, dw7, dw8, dw9, dw10, dw11, dw12


end variables

forward prototypes
public subroutine wf_area (string as_area)
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
public function integer wf_daycnt (string ls_yymm)
public subroutine wf_confirm (string as_check, integer ai_confirm)
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

public subroutine wf_confirm (string as_check, integer ai_confirm);// 차수별 확정
long   ll_row

for ll_row = 1 to dw4.rowcount()
	if dw4.object.chk[ll_row] = "Y" then
		choose case ai_confirm
			case 1
				dw4.object.confirm1[ll_row] = as_check
			case 2
				dw4.object.confirm2[ll_row] = as_check
			case 3
				dw4.object.confirm3[ll_row] = as_check
		end choose
	end if
next

end subroutine

on w_mpworkman_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
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
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.dw_12=create dw_12
this.cbx_6=create cbx_6
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.pb_excel
this.Control[iCurrent+6]=this.tab_1
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.st_time
this.Control[iCurrent+9]=this.st_10
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.sle_value
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.cbx_op
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cbx_4
this.Control[iCurrent+23]=this.cbx_5
this.Control[iCurrent+24]=this.dw_12
this.Control[iCurrent+25]=this.cbx_6
this.Control[iCurrent+26]=this.gb_4
this.Control[iCurrent+27]=this.gb_5
end on

on w_mpworkman_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
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
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.dw_12)
destroy(this.cbx_6)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;///////////////////////////////////////////////////////////////////////////////////////////////
// 근태사업장 YSP사업장 ==> 시화사업장으로 변경함
///////////////////////////////////////////////////////////////////////////////////////////////

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_com, ls_area, ls_teamno, ls_teamname

dw3  = tab_1.tabpage_1.dw_3
dw4  = tab_1.tabpage_1.dw_4
dw5  = tab_1.tabpage_1.dw_5
dw6  = tab_1.tabpage_2.dw_6
dw7  = tab_1.tabpage_1.dw_7
dw8  = tab_1.tabpage_1.dw_8
dw9  = tab_1.tabpage_1.dw_9
dw10 = tab_1.tabpage_1.dw_10
dw11 = tab_1.tabpage_3.dw_11
dw12 = dw_12

dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)
dw8.SetTransObject(SQLCA)
dw9.SetTransObject(SQLCA)
dw10.SetTransObject(SQLCA)
dw11.SetTransObject(SQLCA)
dw12.SetTransObject(SQLCA)

tab_1.tabpage_1.pb_1.enabled  = false
tab_1.tabpage_1.pb_2.enabled  = false
tab_1.tabpage_1.pb_3.enabled  = false
tab_1.tabpage_1.pb_4.enabled  = false
tab_1.tabpage_1.pb_5.enabled  = false
tab_1.tabpage_1.pb_6.enabled  = false

tab_1.tabpage_1.em_stime.enabled = false
tab_1.tabpage_1.em_etime.enabled = false
tab_1.tabpage_1.cb_6.enabled     = false
tab_1.tabpage_1.cbx_c1.enabled   = false
tab_1.tabpage_1.cbx_c2.enabled   = false
tab_1.tabpage_1.cbx_c3.enabled   = false

pb_delete.enabled = false
pb_save.enabled   = false

dw_1.visible = false
dw9.visible  = false		// 일용직전체

dw12.visible = false

// 일자
em_1.text = string(gf_today(),"yyyy/mm/dd")
em_2.text = string(gf_today(),"yyyy/mm/dd")

/////////////////////////////////
// 사업장
/////////////////////////////////
//dw_area.object.area.Background.Color   = 67108864
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
//idwc_area.insertrow(1)
//idwc_area.setitem(1, "area_no", " ")
//idwc_area.setitem(1, "area_name", "전체사업장")
//idwc_area.accepttext()

if gs_area = "S0001" OR gs_area = "T0001" then
	dw_area.object.area[1] = gs_area
else
	dw_area.object.area[1] = "S0001" //gs_area
end if
dw_area.accepttext()

ls_area = dw_area.object.area[1]
choose case ls_area
	case "T0001"
		ls_com = "06"
	case else
		ls_com = "01"
end choose
dw3.retrieve( ls_com )			// 근태명부


// 근태부서
dw_2.getchild("team_no",idwc_team)
idwc_team.settransobject(sqlca)
idwc_team.retrieve( ls_com )

dw_2.insertrow(0)
idwc_team.insertrow(1)
idwc_team.setitem(1,"team_cd"," ")
idwc_team.setitem(1,"team_nm","전체")
idwc_team.accepttext()

// 작업장(파견장)
dw5.enabled  = false		
dw5.getchild("team_no",idwc_work)
idwc_work.settransobject(sqlca)
idwc_work.retrieve( ls_com )

dw5.insertrow(0)
idwc_work.insertrow(1)
idwc_work.setitem(1,"team_cd"," ")
idwc_work.setitem(1,"team_nm","전체")
idwc_work.accepttext()
dw5.object.team_no[1] = " "

dw5.object.team_no.Background.Color   = rgb(255, 255, 255)
dw5.object.team_no.Background.Color   = 67108864


// 근태부서 검색
SELECT insa_team, work_name = replace(replace(work_name,'[',''),']','')
  INTO :ls_teamno, :ls_teamname
  FROM wc 
 WHERE work_manager = :gs_username 
   AND substring(work_name,1,1) = '[' AND area_no <> 'T0001';
if isnull(ls_teamno) OR ls_teamno = "" then ls_teamno = " "
dw_2.object.team_no[1] = ls_teamno

//is_dw = "dw_3"
dw3.setfilter( "team_nm = '" + ls_teamname + "' " )
dw3.filter()

dw3.setfocus()

//pb_delete.enabled = false
//pb_save.enabled   = false
//if GF_PERMISSION("근무신청서_일용직", gs_userid) = "Y" then
//	pb_delete.enabled = true
//	pb_save.enabled   = true
//end if
	
if dw_2.event itemchanged(1, dw_2.object.team_no, ls_teamno) = 1 then
	dw_2.event itemerror( 1, dw_2.object.team_no, ls_teamno )
end if

end event

event resize;call super::resize;//
long ll_width, ll_height, ll_dw3h, ll_dw4h, ll_dw7h, ll_dw8h, ll_dw3y, ll_dw4y, ll_dw7y, ll_dw8y

gb_4.width   = newwidth  - (gb_4.x * 2)

tab_1.width  = newwidth  - (gb_4.x * 2)
tab_1.height = newheight - tab_1.y - gb_4.x

ll_width     = tab_1.width  - tab_1.tabpage_1.width		//  37
ll_height    = tab_1.height - tab_1.tabpage_1.height		// 128
//MessageBox("확인",string(ll_width) + ", " + string(ll_height))

/////////////////////////////////////////
// 좌측
/////////////////////////////////////////
// 좌상: 근태인원 리스트(dw_3)
ll_dw3h      = (tab_1.height - 236) * 0.6		// Tab 높이: 140
tab_1.tabpage_1.dw_3.height  = ll_dw3h

// 좌하: 일용(파견) 신청(dw_7)
tab_1.tabpage_1.st_dw7.y     = tab_1.tabpage_1.dw_3.y + tab_1.tabpage_1.dw_3.height

tab_1.tabpage_1.dw_7.y       = tab_1.tabpage_1.st_dw7.y + tab_1.tabpage_1.st_dw7.height
tab_1.tabpage_1.dw_7.height  = tab_1.tabpage_1.height - tab_1.tabpage_1.dw_7.y

/////////////////////////////////////////
// 우측
/////////////////////////////////////////
// 우상: 근태창(dw_4)
tab_1.tabpage_1.dw_4.y        = tab_1.tabpage_1.dw_3.y
tab_1.tabpage_1.dw_4.width    = tab_1.width  - tab_1.tabpage_1.dw_4.x - 46
tab_1.tabpage_1.dw_4.height   = tab_1.tabpage_1.dw_3.height

tab_1.tabpage_1.st_dw4.width  = tab_1.tabpage_1.dw_4.width

// 우하좌: 일용(파견) 현황(dw_8)
tab_1.tabpage_1.dw_8.y        = tab_1.tabpage_1.dw_7.y
tab_1.tabpage_1.dw_8.width    = tab_1.tabpage_1.dw_4.width / 2
tab_1.tabpage_1.dw_8.height   = tab_1.tabpage_1.dw_7.height

tab_1.tabpage_1.st_dw8.y      = tab_1.tabpage_1.st_dw7.y
tab_1.tabpage_1.st_dw8.width  = tab_1.tabpage_1.dw_4.width / 2

// 우하우: 결근자 현황(dw_10)
tab_1.tabpage_1.dw_10.x       = tab_1.tabpage_1.dw_8.x  + tab_1.tabpage_1.dw_8.width
tab_1.tabpage_1.dw_10.y       = tab_1.tabpage_1.dw_7.y
tab_1.tabpage_1.dw_10.width   = tab_1.tabpage_1.dw_4.width / 2
tab_1.tabpage_1.dw_10.height  = tab_1.tabpage_1.dw_7.height

tab_1.tabpage_1.st_dw10.x     = tab_1.tabpage_1.st_dw8.x + tab_1.tabpage_1.st_dw8.width
tab_1.tabpage_1.st_dw10.y     = tab_1.tabpage_1.st_dw7.y
tab_1.tabpage_1.st_dw10.width = tab_1.tabpage_1.dw_4.width / 2


// 일자별 집계
tab_1.tabpage_2.dw_6.width  = tab_1.width  - tab_1.tabpage_2.dw_6.x - 46
tab_1.tabpage_2.dw_6.height = tab_1.height - 236


// 근태(SECOM)
tab_1.tabpage_3.dw_11.width  = tab_1.width  - tab_1.tabpage_3.dw_11.x - 46
tab_1.tabpage_3.dw_11.height = tab_1.height - 236


// 근태신청서 미작성 작업장
dw_12.width  = tab_1.tabpage_1.dw_8.width    
dw_12.height = tab_1.tabpage_1.dw_8.height   
dw_12.x      = (gb_4.x + gb_4.width) - dw_12.width
dw_12.y      = tab_1.y

end event

type pb_save from w_inheritance`pb_save within w_mpworkman_m
integer x = 3877
integer y = 68
end type

event pb_save::clicked;call super::clicked;// 저장
string   ls_time, ls_daylabor, ls_company, ls_find, ls_teamno
string   ls_userid, ls_namekor, ls_workno, ls_userid1, ls_namekor1, ls_workno1
string   ls_sel, ls_null
long     ll_row, ll_col, ll_Y, ll_found
datetime ldt_time, ldt_stime, ldt_etime, ldt_stime1, ldt_etime1, ldt_workday, ldt_workday1

if GF_PERMISSION("근무신청서_작성", gs_userid) = "Y" then	
else
	MessageBox("확인","근무신청서_작성 권한이 존재하지 않습니다.")
	RETURN
end if

setnull( ls_null )

dw4.accepttext()
if dw4.rowcount() < 1 then RETURN

// 작업시간
ldt_time  = datetime( date(em_2.text), time("00:00:000") )

if MessageBox("확인",em_2.text + " 일 근무신청서 맞습니까?", Exclamation!, OKCancel!, 1) = 2 then RETURN

// 중복체크(USER_ID+작업자+작업장+작업일+시작시간+종료시간) SORT하기
dw4.setsort( "user_id A, name_kor A, work_no A, work_day A, work_stime A" )
dw4.sort()

for ll_row = 1 to dw4.rowcount()
	ls_userid   = dw4.object.user_id[ll_row]
	ls_namekor  = dw4.object.name_kor[ll_row]
	ls_workno   = dw4.object.work_no[ll_row]
	ldt_workday = dw4.object.work_day[ll_row]
	ldt_stime   = dw4.object.work_stime[ll_row]
	ldt_etime   = dw4.object.work_etime[ll_row]
	
	// 중복체크(USER_ID+작업자+작업장+작업일+시작시간+종료시간)
	for ll_Y = ll_row + 1 to dw4.rowcount()
		ls_userid1   = dw4.object.user_id[ll_Y]		// 인사사번
		ls_namekor1  = dw4.object.name_kor[ll_Y]		// 작업자
	   ls_workno1   = dw4.object.work_no[ll_Y]		// 작업장
		ldt_workday1 = dw4.object.work_day[ll_Y]		// 작업일
		ldt_stime1   = dw4.object.work_stime[ll_Y]	//	시작시간
		ldt_etime1   = dw4.object.work_etime[ll_Y]	// 종료시간
		
		if ls_userid = ls_userid1 AND ls_namekor = ls_namekor1 AND ls_workno = ls_workno1 then
			if ldt_workday = ldt_workday1 then
				if ldt_stime = ldt_stime1 OR ldt_etime = ldt_etime1 then
					MessageBox("오류",string(ll_row) + "행과 " + string(ll_Y) + "행 " + ls_namekor + &
					           "~n~n시작, 종료시간 데이터 중복입니다.")
					dw4.scrolltorow( ll_Y )
					RETURN
				end if

				// 작업시간체크(종료시간 > 시작시간: 22:00 > 10:00)
				if ldt_etime > ldt_stime1 then
					MessageBox("오류",string(ll_row) + "행 종료시간 보다~n~n" + string(ll_Y) + "행 " + &
					           "시작시간이 작은경우(중복근무) 입니다.")
					dw4.scrolltorow( ll_Y )
					RETURN
				end if
			end if
		end if
	next

	// 일용직체크
	ls_daylabor = dw4.object.day_labor[ll_row]
	ls_company  = dw4.object.company[ll_row]
	
	if ls_daylabor = "Y" then	// 일용직
		if isnull(ls_company) OR ls_company = "" then
			dw4.scrolltorow( ll_row )
			MessageBox("오류",string(ll_row) + "행~n~n일용직이면 일용직(회사명)을 입력하시기 바랍니다.")
			RETURN
		end if
	end if
	
	for ll_col = 1 to 2
		if ll_col = 1 then
			ldt_time = dw4.object.work_stime[ll_row]
			ls_time  = string(ldt_time)
		else
			ldt_time = dw4.object.work_etime[ll_row]
			ls_time  = string(ldt_time)
		end if
		
		if isnull(ldt_time) then
			dw4.scrolltorow( ll_row )
			MessageBox("오류",string(ll_row) + "행~n~n작업 시작,종료시간을 확인하시기 바랍니다.")
			RETURN
		end if
	next

	// 배정
	if long(dw4.object.sel.width) > 0 then
		ls_sel = dw4.object.sel[ll_row]
		
		if isnull( ls_sel ) OR ls_sel = "" then
			dw4.scrolltorow( ll_row )
			MessageBox("오류",string(ll_row) + "행~n~n지원자를 배정하여 주시기 바랍니다.")
			RETURN
		end if
	end if	
	
	if dw4.object.confirm1[ll_row] = "N" then dw4.object.confirm1[ll_row] = ls_null
	if dw4.object.confirm2[ll_row] = "N" then dw4.object.confirm2[ll_row] = ls_null
	if dw4.object.confirm3[ll_row] = "N" then dw4.object.confirm3[ll_row] = ls_null
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
if tab_1.tabpage_1.cbx_2.checked = true then		// 일용직관리
	wf_update1( dw9, "Y" )
else
	if wf_update1(dw4,"N") = false then
		RETURN
	else
		COMMIT;
	
		for ll_row = dw7.rowcount() to 1 step - 1
			if dw7.object.chk[ll_row] = "Y" then
				dw7.deleterow( ll_row )
			end if
		next	
		wf_update1( dw7, "N" )
		
		// 지원신청자 수와 배정자 수를 일치하기 위함
		pb_delete.enabled = true				// 행삭제
		tab_1.tabpage_1.pb_2.enabled = true	// 지원자제거
			
		pb_retrieve.postevent( clicked! )
		MessageBox("확인","저장완료")
	end if
end if

end event

type dw_1 from w_inheritance`dw_1 within w_mpworkman_m
string tag = "d_mpworkman_r"
integer x = 50
integer y = 176
integer width = 114
integer height = 76
string title = "d_mpworkman_ot_r"
string dataobject = "d_mpworkman_ot_r"
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

type st_title from w_inheritance`st_title within w_mpworkman_m
integer x = 32
integer y = 24
integer width = 928
string text = "근무 신청서"
end type

type st_tips from w_inheritance`st_tips within w_mpworkman_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpworkman_m
boolean visible = false
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpworkman_m
boolean visible = false
integer x = 2295
end type

type pb_close from w_inheritance`pb_close within w_mpworkman_m
integer x = 4078
integer y = 68
integer taborder = 250
end type

event pb_close::clicked;call super::clicked;//
dwItemStatus l_status


dw4.accepttext()

l_status = dw4.GetItemStatus(1, 0, primary!)
if l_status = NotModified!	 then
else
	if MessageBox("확인","현재 작업한 상태를 무시하고 종료하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpworkman_m
integer x = 3680
integer y = 68
integer taborder = 270
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
w_repsuper w_print
st_print   l_print

if tab_1.selectedtab = 1 then
	if cbx_5.checked = true then
		dw_1.dataobject = "d_mpworkman_ot_r"
	else
		dw_1.dataobject = "d_mpworkman_r"
	end if
	dw4.ShareData(dw_1)
	
	l_print.st_datawindow  = dw_1
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 근무신청서를 출력합니다." 
else
	l_print.st_datawindow  = tab_1.tabpage_2.dw_6
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 근무신청서를 출력합니다." 
end if

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpworkman_m
boolean visible = false
integer x = 2107
integer taborder = 280
end type

type pb_delete from w_inheritance`pb_delete within w_mpworkman_m
integer x = 3287
integer y = 68
integer taborder = 290
end type

event pb_delete::clicked;call super::clicked;// 삭제
long     ll_rowsave, ll_row, ll_upt, ll_seqno, ll_cnt, ll_qty, ll_find
string   ls_saleno, ls_seqno, ls_chk
datetime ldt_orderdate

string   ls_custno, ls_scene, ls_sdate, ls_edate, ls_work

string   ls_areano, ls_teamno, ls_userid, ls_uidorg, ls_booking, ls_null
datetime ldt_time, ldt_stime, ldt_etime

datawindow dw_det

setnull( ls_null )

if dw4.rowcount() < 1 then RETURN

for ll_row = 1 to dw4.rowcount()
	ls_chk = dw4.object.chk[ll_row]
	if ls_chk = "Y" then ll_cnt++
next

if ll_cnt > 0 then
	if MessageBox("확인","선택한 대상을 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN
	
	for ll_row = dw4.rowcount() to 1 step -1
		if dw4.object.chk[ll_row] = "Y" then
			ls_uidorg =	dw4.object.uid_org[ll_row]

			// 일용(파견)
			if dw4.object.work_no[ll_row] <> dw4.object.job_no[ll_row] then
				dw4.deleterow(ll_row)				
//				dw4.object.user_id[ll_row]   = ls_uidorg
//				dw4.object.name_kor[ll_row]  = "일용(파견)"
			else
				// 1차확정 상태
				if dw4.object.confirm1[ll_row] = "Y" then
					MessageBox("확인",string(ll_row) + " 행 데이터~n~n1차 확정취소 후 작업하시기 바랍니다.")
					RETURN
				else
					// 1차예약 원복하기
					ls_areano  = dw4.object.area_no[ll_row]
					ls_teamno  = dw4.object.work_no[ll_row]
					ldt_time   = dw4.object.work_day[ll_row]
					ldt_stime  = dw4.object.work_stime[ll_row]
					ldt_etime  = dw4.object.work_etime[ll_row]
					ls_userid  = dw4.object.user_id[ll_row]
		
					ls_booking = dw4.object.booking[ll_row]
					if ls_booking = "Y" then
						UPDATE sfcworkman 
							SET booking = :ls_null
						 WHERE area_no = :ls_areano AND work_no = :ls_teamno AND work_day = :ldt_time AND user_id = :ls_userid
							AND work_stime = :ldt_stime AND work_etime = :ldt_etime;
						if sqlca.sqlcode <> 0 then
							dw4.scrolltorow( ll_row )
							MessageBox("SQL error", SQLCA.SQLErrText)
						else
							dw4.scrolltorow(ll_row)	
							dw4.deleterow(0)
						end if
					else					
						dw4.deleterow(ll_row)
					end if
				end if
			end if
		end if
	next

	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
	if wf_update1(dw4,"N") = false then
		RETURN
	else
		COMMIT;
//		pb_retrieve.postevent( clicked! )
		MessageBox("확인","저장완료")
	end if
else
	MessageBox("확인","삭제할 대상을 선택하시기 바랍니다.")
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpworkman_m
boolean visible = false
integer x = 1723
integer taborder = 310
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpworkman_m
integer x = 3090
integer y = 68
integer taborder = 300
end type

event pb_retrieve::clicked;///////////////////////////////////////////////////////////////////////////////////////////////
// 근태사업장 YSP사업장 ==> 시화사업장으로 변경함
///////////////////////////////////////////////////////////////////////////////////////////////

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_com, ls_area, ls_sdate, ls_edate, ls_yyyymm, ls_yyyy, ls_mm, ls_today, ls_yday, ls_nday
string ls_custno, ls_scene, ls_teamno, ls_teamnm, ls_flag, ls_Filter, ls_colx, ls_work
string ls_planflag, ls_title, ls_purtype, ls_daylabor
long   ll_row

DateTime ld_time

int      li_loop, li_fpos, li_fday, li_firstday, li_daycnt, li_lastpos
		
GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

SELECT top 1 getdate() INTO :ld_time FROM login;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm")

//SELECT top 1 convert(char(10), getdate(), 111)
//     , convert(char(10), dateadd(day, - day(getdate()), getdate()), 111)
//     , convert(char(10), dateadd(month, 1, getdate()), 111)
//  INTO :ls_today, :ls_yday, :ls_nday
//  FROM login;
//
//ls_yyyymm    = string(date(ls_today),"yyyymm")		
//ls_yyyy      = string(date(ls_today),"yyyy")		
//ls_mm        = string(date(ls_today),"mm")		

dw9.x = dw4.x ; dw9.y = dw4.y ; dw9.width = dw4.width ; dw9.height = dw4.height

ls_sdate = em_2.text
ls_edate = em_2.text

//
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

choose case ls_area
	case "T0001"
		ls_com = "06"
	case else
		ls_com = "01"
end choose

dw_2.accepttext()
ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

if ls_teamno = "%" then
	pb_save.enabled = false		// 저장
else
	pb_save.enabled = true		// 저장
end if
pb_delete.enabled  = false		// 삭제

if GF_PERMISSION("근무신청서_일용직", gs_userid) = "Y" then
	pb_delete.enabled = true
	pb_save.enabled   = true
end if
	

dw_2.getchild("team_no", idwc_team)
ls_teamnm = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")
if ls_teamnm = "전체" then ls_teamnm = ""
ls_teamnm = trim(ls_teamnm) + "%"  //작업장명

//dw_area.enabled = true
//dw_area.object.area.Background.Color = rgb( 255,255,255 )
//dw_2.enabled    = true
//dw_2.object.wc_no.Background.Color = rgb( 255,255,255 )

// 근무신청서 미작성 작업장
dw12.retrieve( ls_edate )
if dw12.rowcount() > 0 then
	dw12.visible = true
else
	dw12.visible = false
end if

choose case tab_1.selectedtab
	case 1		// 근무자
		dw4.object.sel.width  = 0		// 배정

		ls_sdate  = em_1.text
		ls_edate  = em_2.text
		
		cbx_4.checked = false 
		cbx_5.checked = false 
		
		dw4.setfilter( "" )
		dw4.filter()
		
		ls_custno = "%"
		ls_scene  = "%"		
	   dw3.retrieve( ls_com )			// 근태명부

		dw4.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )		// 근무현황
		dw7.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate, "Y" )	// 일용신청
		dw8.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )		// 지원내용
		dw10.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )		// 결근자현황

		// 일용직관리
		if tab_1.tabpage_1.cbx_2.checked = true then
			dw9.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )		// 일용직 현황
		end if		
		
		is_dw = "dw_4"
		dw4.setfocus()

		if isnull(is_teamno) OR is_teamno = "" then
		else
			MessageBox("확인","조회완료")
		end if
		is_teamno   = dw_2.object.team_no[1]
		
	
	case 2		// 일자별 집계
		ls_sdate  = em_1.text
		ls_edate  = em_2.text
		
		dw6.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )	
		MessageBox("확인","조회완료")
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpworkman_m
integer x = 1970
integer y = 16
integer width = 535
integer height = 228
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpworkman_m
integer x = 1015
integer y = 16
integer width = 933
integer height = 228
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpworkman_m
integer x = 3063
integer y = 16
integer width = 1239
integer height = 228
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpworkman_m
integer x = 1321
integer y = 144
integer width = 599
integer height = 80
integer taborder = 60
string dataobject = "d_whworkteam_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//
string ls_teamno, ls_teamname

this.accepttext()
ls_teamno = trim(this.object.team_no[1])

if isnull(ls_teamno) OR ls_teamno = "" then
	tab_1.tabpage_1.cbx_2.enabled = true
	
	tab_1.tabpage_1.pb_1.enabled = false
	tab_1.tabpage_1.pb_2.enabled = false
	tab_1.tabpage_1.pb_3.enabled = false
	tab_1.tabpage_1.pb_4.enabled = false
//	tab_1.tabpage_1.pb_5.enabled = false
	tab_1.tabpage_1.pb_6.enabled = false
else
	tab_1.tabpage_1.cbx_2.enabled = false

	tab_1.tabpage_1.pb_1.enabled = true
	tab_1.tabpage_1.pb_2.enabled = true
	tab_1.tabpage_1.pb_3.enabled = true
	tab_1.tabpage_1.pb_4.enabled = true
//	tab_1.tabpage_1.pb_5.enabled = true
	tab_1.tabpage_1.pb_6.enabled = true
end if

this.getchild("team_no", idwc_team)
ls_teamname = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")

if trim(data) = "" OR ls_teamname = "전체" then
	em_1.enabled = true
	dw3.setfilter( "" )
	dw3.filter()
else	
/*	2019.02.07 jowonsuk 김상범부장 요청 
	em_1.enabled = false
	em_1.text = em_2.text
*/	
	
	dw3.setfilter( "team_nm = '" + ls_teamname + "' " )
	dw3.filter()
end if

pb_retrieve.triggerevent( clicked! )

end event

type em_1 from editmask within w_mpworkman_m
integer x = 1998
integer y = 60
integer width = 411
integer height = 72
integer taborder = 180
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
string displaydata = ""
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpworkman_m
integer x = 2071
integer y = 144
integer width = 411
integer height = 72
integer taborder = 220
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
string displaydata = "~b"
end type

event rbuttondown;//
string ls_teamno

dw_2.accepttext()
ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
	if this.text < em_1.text then em_1.text = this.text
	
	if ls_teamno = "%" then
	else
		em_1.text = this.text
	end if
end if

end event

type st_1 from statictext within w_mpworkman_m
integer x = 1042
integer y = 144
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
string text = "근태부서"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpworkman_m
integer x = 1326
integer y = 60
integer width = 526
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area, ls_com

this.accepttext()

//dw_2.object.team_no[1] = " "
//dw_2.accepttext()

ls_area = data
dw_2.triggerevent( itemchanged! )

if dw5.rowcount() > 0 then
	if ls_area = "" then
		idwc_wc.setfilter( "" )
	else
		idwc_wc.setfilter( "area_no = '" + ls_area + "'" )
	end if
	idwc_wc.filter()
	
	idwc_wc.setsort( "work_type, work_no" )
	idwc_wc.sort()
end if


choose case ls_area
	case "T0001"
		ls_com = "06"
	case else
		ls_com = "01"
end choose

idwc_team.retrieve( ls_com )
dw_2.insertrow(0)
idwc_team.insertrow(1)
idwc_team.setitem(1,"team_cd"," ")
idwc_team.setitem(1,"team_nm","전체")
idwc_team.accepttext()
end event

type pb_excel from picturebutton within w_mpworkman_m
event mousemove pbm_mousemove
integer x = 3483
integer y = 68
integer width = 187
integer height = 144
integer taborder = 260
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

choose case is_dw
	case "dw_3"
		dwxls  = dw3
	case "dw_4"
		dwxls  = dw4
	case "dw_7"
		dwxls  = dw7
	case "dw_8"
		dwxls  = dw8
	case "dw_9"
		dwxls  = dw9
	case "dw_10"
		dwxls  = dw10
end choose

if dwxls.rowcount() < 1 then RETURN

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
	                        "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
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

type tab_1 from tab within w_mpworkman_m
integer x = 32
integer y = 456
integer width = 4517
integer height = 2032
integer taborder = 110
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
string text = "근무자"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ArrangeIcons!"
long picturemaskcolor = 536870912
cbx_basic cbx_basic
cb_7 cb_7
pb_6 pb_6
st_dw10 st_dw10
dw_10 dw_10
em_etime em_etime
cbx_2 cbx_2
cbx_c3 cbx_c3
cbx_c2 cbx_c2
cbx_c1 cbx_c1
st_dw8 st_dw8
st_dw4 st_dw4
st_dw7 st_dw7
st_dw3 st_dw3
pb_5 pb_5
dw_7 dw_7
pb_4 pb_4
cb_6 cb_6
st_2 st_2
dw_5 dw_5
em_stime em_stime
cbx_1 cbx_1
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_4 dw_4
cbx_all cbx_all
dw_8 dw_8
dw_3 dw_3
dw_9 dw_9
end type

on tabpage_1.create
this.cbx_basic=create cbx_basic
this.cb_7=create cb_7
this.pb_6=create pb_6
this.st_dw10=create st_dw10
this.dw_10=create dw_10
this.em_etime=create em_etime
this.cbx_2=create cbx_2
this.cbx_c3=create cbx_c3
this.cbx_c2=create cbx_c2
this.cbx_c1=create cbx_c1
this.st_dw8=create st_dw8
this.st_dw4=create st_dw4
this.st_dw7=create st_dw7
this.st_dw3=create st_dw3
this.pb_5=create pb_5
this.dw_7=create dw_7
this.pb_4=create pb_4
this.cb_6=create cb_6
this.st_2=create st_2
this.dw_5=create dw_5
this.em_stime=create em_stime
this.cbx_1=create cbx_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_4=create dw_4
this.cbx_all=create cbx_all
this.dw_8=create dw_8
this.dw_3=create dw_3
this.dw_9=create dw_9
this.Control[]={this.cbx_basic,&
this.cb_7,&
this.pb_6,&
this.st_dw10,&
this.dw_10,&
this.em_etime,&
this.cbx_2,&
this.cbx_c3,&
this.cbx_c2,&
this.cbx_c1,&
this.st_dw8,&
this.st_dw4,&
this.st_dw7,&
this.st_dw3,&
this.pb_5,&
this.dw_7,&
this.pb_4,&
this.cb_6,&
this.st_2,&
this.dw_5,&
this.em_stime,&
this.cbx_1,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_4,&
this.cbx_all,&
this.dw_8,&
this.dw_3,&
this.dw_9}
end on

on tabpage_1.destroy
destroy(this.cbx_basic)
destroy(this.cb_7)
destroy(this.pb_6)
destroy(this.st_dw10)
destroy(this.dw_10)
destroy(this.em_etime)
destroy(this.cbx_2)
destroy(this.cbx_c3)
destroy(this.cbx_c2)
destroy(this.cbx_c1)
destroy(this.st_dw8)
destroy(this.st_dw4)
destroy(this.st_dw7)
destroy(this.st_dw3)
destroy(this.pb_5)
destroy(this.dw_7)
destroy(this.pb_4)
destroy(this.cb_6)
destroy(this.st_2)
destroy(this.dw_5)
destroy(this.em_stime)
destroy(this.cbx_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_4)
destroy(this.cbx_all)
destroy(this.dw_8)
destroy(this.dw_3)
destroy(this.dw_9)
end on

type cbx_basic from checkbox within tabpage_1
integer x = 2423
integer y = 24
integer width = 480
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "기본시간체크"
boolean checked = true
end type

type cb_7 from commandbutton within tabpage_1
integer x = 1216
integer y = 8
integer width = 453
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업장 변경"
end type

event clicked;// 파견장 적용
long   	ll_row, ll_cnt
string 	ls_stime, ls_etime, ls_teamno, ls_teamnm, ls_wcno, ls_wcname
datetime ldt_stime, ldt_etime
DataWindowChild ldwc_team

// 근태부서
dw_2.accepttext()

ls_teamno  = trim(dw_2.object.team_no[1])
if ls_teamno = "" then
	MessageBox("확인","전체 작업장에서는 적용할 수 없습니다.")
	RETURN
end if

dw_2.getchild("team_no", idwc_team)
ls_teamnm = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")

// 작업장
dw5.accepttext()

ls_wcno = trim(dw5.object.team_no[1])
if isnull( ls_wcno ) OR ls_wcno = "" then
	dw5.setfocus()
	MessageBox("확인","작업장을 선택하시기 바랍니다.")
	RETURN
end if

//if ls_teamno = ls_wcno then
//	MessageBox("확인","근태부서와 작업장은 동일할 수 없습니다.")
//	RETURN
//end if

if ls_wcno = "" then
else
	dw5.getchild("team_no", idwc_work)
	ls_wcname = idwc_work.getitemstring(idwc_work.getrow(), "work_name")
	if isnull(ls_wcname) then ls_wcname = ""
end if

// 다중선택
for ll_row = 1 to dw4.rowcount()
	if dw4.object.chk[ll_row] = "Y" then
		ll_cnt = ll_cnt + 1
		
		// 작업장
		if isnull( ls_wcname ) OR ls_wcname = "" then
		else
			dw4.object.work_no[ll_row] = ls_wcno
			dw4.object.work_nm[ll_row] = ls_wcname
		end if
	end if
next

dw5.object.team_no[1] = " "		// 작업장

if ll_cnt > 0 then
	MessageBox("확인","적용완료")
else
	MessageBox("확인","적용할 대상을 먼저 선택하시기 바랍니다.")
end if

end event

type pb_6 from picturebutton within tabpage_1
integer x = 1870
integer y = 428
integer width = 279
integer height = 216
integer taborder = 120
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "파견>>"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// 파견>>
long     ll_row, ll_dw4row, ll_found, ll_basictime
string   ls_areano, ls_wcno, ls_wcname, ls_teamno, ls_teamnm, ls_teamnmorg, ls_jobname, ls_namekor, ls_mantype
string   ls_time, ls_stime, ls_etime, ls_userid, ls_find
DateTime ldt_time, ldt_stime, ldt_etime

setnull( ldt_time )

// 일자
ls_stime  = string(em_stime.text)
ls_etime  = string(em_etime.text)
ldt_stime = datetime( date(em_2.text), time(ls_stime) )
ldt_etime = datetime( date(em_2.text), time(ls_etime) )

// 사업장
dw_area.accepttext()		
ls_areano = dw_area.object.area[1]

// 근태부서
dw_2.accepttext()			
ls_teamno = trim(dw_2.object.team_no[1])

dw_2.getchild("team_no", idwc_team)
ls_teamnm    = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")
ls_teamnmorg = ls_teamnm
if ls_teamnm = "전체" then ls_teamnm = ""
ls_teamnm    = trim(ls_teamnm) + "%"  // 근태부서

// 작업장(파견)
dw5.accepttext()			
ls_wcno   = trim(dw5.object.team_no[1])

dw5.getchild("team_no", idwc_work)
ls_wcname    = idwc_work.getitemstring(idwc_work.getrow(), "team_nm")
// BUG ls_wcname
SELECT top 1 replace(replace(work_name,'[',''),']','') INTO :ls_wcname
  FROM wc
 WHERE insa_team = :ls_wcno
 ORDER BY work_no;
 
if isnull(ls_wcno) OR ls_wcno = "" then
	pb_1.enabled = false		// >>
	pb_4.enabled = false		// 일용>>
	
	dw5.enabled = true
	dw5.object.team_no.Background.Color   = rgb(255, 255, 255)
	dw5.setfocus()
	MessageBox("확인","작업장을 선택한 후 '파견>>' 클릭하시기 바랍니다.")
	RETURN
end if

// 기본시간(8:00) 체크		
SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
if cbx_basic.checked = true then
	if ll_basictime > 9 then
		MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할 등록하시기 바랍니다.")
		RETURN
	end if
end if
		
ldt_time  = datetime( date(em_2.text), time("00:00:000") )

for ll_row = 1 to dw3.rowcount()
	if dw3.object.chk[ll_row] = "Y" then
		dw3.object.chk[ll_row] = "N" 		// 선택해지
		
		ls_userid  = dw3.object.user_id[ll_row]
		ls_namekor = dw3.object.name_kor[ll_row]
		ls_jobname = dw3.object.team_nm[ll_row] + "%"
		
		// 작업장 체크
		if ls_teamnm <> ls_jobname then
			MessageBox("확인",string(ll_row) + "행 " + string(dw3.object.team_nm[ll_row]) + "~n~n작업장이 일치하지 않습니다.")
			dw3.scrolltorow( ll_row )
			RETURN
		end if
		
		ll_dw4row = dw4.insertrow(0)

      dw4.object.chk[ll_dw4row]        = "Y"
      dw4.object.area_no[ll_dw4row]    = ls_areano
      dw4.object.work_no[ll_dw4row]    = ls_wcno
      dw4.object.work_nm[ll_dw4row]    = ls_wcname
      dw4.object.work_day[ll_dw4row]   = ldt_time
      dw4.object.work_stime[ll_dw4row] = ldt_stime
      dw4.object.work_etime[ll_dw4row] = ldt_etime

      dw4.object.user_id[ll_dw4row]    = dw3.object.user_id[ll_row]
      dw4.object.name_kor[ll_dw4row]   = dw3.object.name_kor[ll_row]
      dw4.object.job_no[ll_dw4row]     = ls_teamno
      dw4.object.job_name[ll_dw4row]   = ls_teamnmorg

      dw4.object.booking[ll_dw4row]    = "Y"		// 지원표시

		ls_mantype = dw3.object.foreign_gb[ll_row]
		if ls_mantype = "외국" then
			ls_mantype = "F"
		else
			ls_mantype = "D"
		end if		
      dw4.object.man_type[ll_dw4row]   = ls_mantype
	end if
next

end event

type st_dw10 from statictext within tabpage_1
integer x = 4005
integer y = 1160
integer width = 457
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 268435456
string text = " 결근자 현황"
boolean focusrectangle = false
end type

type dw_10 from datawindow within tabpage_1
integer x = 4005
integer y = 1228
integer width = 457
integer height = 668
integer taborder = 120
string title = "none"
string dataobject = "d_mpworkman_absent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
is_dw = "dw_10"
this.Object.DataWindow.Color = rgb(215, 228, 188)

pb_1.enabled = false		// >>
pb_2.enabled = false		// <<
pb_3.enabled = false		// 초기화
pb_4.enabled = false		// 일용>>
pb_5.enabled = false		// 지원>>
pb_6.enabled = false		// 파견>>

em_stime.enabled = false
em_etime.enabled = false
cb_6.enabled     = false
cb_7.enabled     = false

cbx_c1.enabled   = false
cbx_c2.enabled   = false
cbx_c3.enabled   = false

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_10"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_etime from editmask within tabpage_1
integer x = 3177
integer y = 8
integer width = 251
integer height = 80
integer taborder = 100
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event getfocus;//
this.SelectText(1, LenA(this.text) + 2)		// 시간


end event

type cbx_2 from checkbox within tabpage_1
integer x = 1710
integer y = 24
integer width = 439
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "일용직관리"
end type

event clicked;//
dwItemStatus l_status1, l_status2, l_status3, l_status4, l_status5, l_status6, l_status7
boolean  lb_Modify, lb_ModifyID, lb_ModifyETC
string   ls_area, ls_teamno, ls_sdate, ls_edate, ls_userid
long     ll_row,  ll_cnt

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

dw9.x = dw4.x ; dw9.y = dw4.y ; dw9.width = dw4.width ; dw9.height = dw4.height

is_teamno = dw_2.object.team_no[1]

if this.checked = true then
	dw_2.object.team_no[1] = " "

	em_1.enabled    = false
	em_2.enabled    = false
	dw_area.enabled = false		// 사업장
	dw_2.enabled    = false		// 작업장
	dw3.enabled     = false
	dw7.enabled     = false
	dw8.enabled     = false
	cb_6.enabled    = false		// 적용

	pb_2.enabled 	 = false
	pb_3.enabled 	 = false
	
	dw_area.object.area.background.color = 78682240
	dw_2.object.team_no.background.color = 78682240

	pb_retrieve.enabled = false
	//pb_delete.enabled   = false
	pb_excel.enabled    = false
	pb_print.enabled    = false
	//pb_save.enabled     = false
	
	st_dw4.text = " 일용직(KeyID 부여)"
	dw9.visible = true
	dw9.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )		// 일용직 현황
else
	dw_2.object.team_no[1] = is_teamno
	em_1.enabled    = true
	em_2.enabled    = true

	// 근무시간변경
	dw9.accepttext()

	lb_Modify = false
	for ll_row = 1 to dw9.rowcount()	
		ls_userid  = dw9.object.user_id[ll_row]
		if isnull(ls_userid) OR ls_userid = "" then ll_cnt = ll_cnt + 1
		
		l_status1  = dw9.GetItemStatus(ll_row, "work_stime", primary!)
		l_status2  = dw9.GetItemStatus(ll_row, "work_etime", primary!)
		l_status3  = dw9.GetItemStatus(ll_row, "user_id",    primary!)
		l_status4  = dw9.GetItemStatus(ll_row, "name_kor",   primary!)
		l_status5  = dw9.GetItemStatus(ll_row, "man_type",   primary!)
		l_status6  = dw9.GetItemStatus(ll_row, "contents",   primary!)
		l_status7  = dw9.GetItemStatus(ll_row, "company",    primary!)
		if l_status1 = NotModified! AND l_status2 = NotModified!	then
		else
			lb_Modify = true
			exit
		end if

		if l_status3 = NotModified! then
		else
			lb_ModifyID = true
			exit
		end if
	
		if l_status4 = NotModified! OR l_status5 = NotModified! OR l_status6 = NotModified! OR l_status7 = NotModified! then
		else
			lb_ModifyETC = true
			exit
		end if
	next

	// KeyID 에러
	if ll_cnt > 0 then
		THIS.checked = true
		MessageBox("확인","일용직 KeyID를 등록 하시기 바랍니다.")		
		RETURN
	end if
	
	// 근무시간 변경
	if	lb_Modify = true then
		if MessageBox("확인","근무시간을 변경 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			lb_ModifyID = false
			lb_ModifyETC = false
			WF_UPDATE1( dw9, "Y" )
		end if
	else
		// KeyID 변경
		if	lb_ModifyID = true then
			if MessageBox("확인","KeyID를 변경 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
				WF_UPDATE1( dw9, "Y" )
			end if
		end if
		
		// ETC 변경
		if	lb_ModifyETC = true then
			if MessageBox("확인","기타사항을(이름,외국,내용,KeyID) 변경 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
				WF_UPDATE1( dw9, "Y" )
			end if
		end if
	end if
		
	dw_area.object.area.background.color = rgb(255, 255, 255)
	dw_2.object.team_no.background.color = rgb(255, 255, 255)
	em_2.enabled    = true
	dw_area.enabled = true		// 사업장
	dw_2.enabled    = true		// 작업장
	dw3.enabled     = true
	dw7.enabled     = true
	dw8.enabled     = true
	cb_6.enabled    = true
	
	pb_2.enabled 	 = true
	pb_3.enabled 	 = true

	pb_retrieve.enabled = true
	pb_delete.enabled   = true
	pb_excel.enabled    = true
	pb_print.enabled    = true
	pb_save.enabled     = true
	
	st_dw4.text = " 근무자+일용직 현황"
	dw9.visible = false
end if

end event

type cbx_c3 from checkbox within tabpage_1
integer x = 4352
integer y = 24
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "3차확정"
end type

event clicked;// 3차 확정
if this.checked = true then
	wf_confirm( "Y", 3 )
else
	wf_confirm( "N", 3 )
end if


end event

type cbx_c2 from checkbox within tabpage_1
integer x = 4014
integer y = 24
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "2차확정"
end type

event clicked;// 2차 확정
if this.checked = true then
	wf_confirm( "Y", 2 )
else
	wf_confirm( "N", 2 )
end if


end event

type cbx_c1 from checkbox within tabpage_1
integer x = 3680
integer y = 24
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "1차확정"
end type

event clicked;// 1차 확정
if this.checked = true then
	wf_confirm( "Y", 1 )
else
	wf_confirm( "N", 1 )
end if


end event

type st_dw8 from statictext within tabpage_1
integer x = 2167
integer y = 1160
integer width = 1838
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 268435456
string text = " 파견자 현황"
boolean focusrectangle = false
end type

type st_dw4 from statictext within tabpage_1
integer x = 2167
integer y = 96
integer width = 2299
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 268435456
string text = " 근무자+일용직 현황"
boolean focusrectangle = false
end type

type st_dw7 from statictext within tabpage_1
integer x = 9
integer y = 1160
integer width = 1838
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 268435456
string text = " 일용직 신청현황"
boolean focusrectangle = false
end type

type st_dw3 from statictext within tabpage_1
integer x = 9
integer y = 96
integer width = 1838
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65280
long backcolor = 268435456
string text = " 직원현황(SECOM)"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within tabpage_1
integer x = 1870
integer y = 1408
integer width = 279
integer height = 332
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "지원>>"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// 지원
long     ll_row, ll_dw4row, ll_dw7row, ll_found, ll_basictime
string   ls_areano, ls_teamno, ls_teamnm, ls_teamnmorg, ls_jobno, ls_jobname, ls_namekor, ls_mantype
string   ls_time, ls_stime, ls_etime, ls_userid, ls_find
DateTime ldt_time, ldt_stime, ldt_etime

setnull( ldt_time )

dw_2.accepttext()
dw_area.accepttext()

// 지원신청자 수와 배정자 수를 일치하기 위함
pb_delete.enabled = false	// 행삭제
pb_2.enabled = false			// 지원자제거 

ls_areano = dw_area.object.area[1]
ls_teamno = dw_2.object.team_no[1]
ls_jobno  = ls_teamno

dw_2.getchild("team_no", idwc_team)
ls_teamnm  = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")
ls_jobname = ls_teamnm

if ls_teamnm = "전체" then ls_teamnm = ""
ls_teamnm = trim(ls_teamnm) + "%"  // 근태부서

ldt_time  = datetime( date(em_2.text), time("00:00:000") )

// 기본시간(8:00) 체크		
SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
if cbx_basic.checked = true then
	if ll_basictime > 9 then
		MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할 등록하시기 바랍니다.")
		RETURN
	end if
end if


// 배정컬럼
dw4.object.sel.TabSequence  = 20
dw4.object.sel.width = 155

// 초기화
dw4.reset()

ll_dw7row = dw7.rowcount()
for ll_row = 1 to ll_dw7row
	if dw7.object.chk[ll_row] = "Y" then
		ls_areano  = dw7.object.area_no[ll_row]
		ls_teamno  = dw7.object.work_no[ll_row]
		ldt_time   = dw7.object.work_day[ll_row]
		ls_userid  = dw7.object.user_id[ll_row]
		ldt_stime  = dw7.object.work_stime[ll_row]
		ldt_etime  = dw7.object.work_etime[ll_row]
		
		ls_namekor = dw7.object.name_kor[ll_row]
		ls_teamnm  = dw7.object.work_nm[ll_row]
		
		ll_dw4row  = dw4.insertrow(0)

      dw4.object.chk[ll_dw4row]        = "Y"
      dw4.object.area_no[ll_dw4row]    = ls_areano
      dw4.object.work_no[ll_dw4row]    = ls_teamno
      dw4.object.work_nm[ll_dw4row]    = ls_teamnm
      dw4.object.work_day[ll_dw4row]   = ldt_time
      dw4.object.user_id[ll_dw4row]    = ls_userid
      dw4.object.name_kor[ll_dw4row]   = dw7.object.name_kor[ll_row]

      dw4.object.man_type[ll_dw4row]   = dw7.object.man_type[ll_row]

      dw4.object.work_stime[ll_dw4row] = dw7.object.work_stime[ll_row]
      dw4.object.work_etime[ll_dw4row] = dw7.object.work_etime[ll_row]

      dw4.object.job_no[ll_dw4row]     = ls_jobno
      dw4.object.job_name[ll_dw4row]   = ls_jobname

      dw4.object.booking[ll_dw4row]    = "Y"		// 지원표시

		// 다른작업장에서 지원할 경우 또 다른작업장에서 조회시 안보이도록 1차 예약함
		UPDATE sfcworkman 
		   SET booking = 'Y'
		 WHERE area_no = :ls_areano AND work_no = :ls_teamno AND work_day = :ldt_time AND user_id = :ls_userid
		   AND work_stime = :ldt_stime AND work_etime = :ldt_etime;
		if sqlca.sqlcode = 0 then
			//dw7.deleterow( ll_row )
			COMMIT;
		end if
	end if
next

dw4.setcolumn( "sel" )
dw4.setfocus()

end event

type dw_7 from datawindow within tabpage_1
integer x = 9
integer y = 1228
integer width = 1838
integer height = 668
integer taborder = 50
string title = "일용(파견) 현황"
string dataobject = "d_mpworkman_support"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_7"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event getfocus;//
is_dw = "dw_7"
this.Object.DataWindow.Color = rgb(215, 228, 188)

string ls_teamno

dw_2.accepttext()
ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

if ls_teamno = "%" then
	pb_1.enabled = false		// >>
	pb_2.enabled = false		// <<
	pb_3.enabled = false		// 초기화
	pb_4.enabled = false		// 일용>>
	pb_5.enabled = false		// 지원>>
	pb_6.enabled = false		// 파견>>
else
	pb_1.enabled = false
	pb_2.enabled = false
	pb_3.enabled = false
	pb_4.enabled = false
	pb_5.enabled = true
	pb_6.enabled = false
end if

em_stime.enabled = false
em_etime.enabled = false
cb_6.enabled     = false
cb_7.enabled     = false

cbx_c1.enabled   = false
cbx_c2.enabled   = false
cbx_c3.enabled   = false

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type pb_4 from picturebutton within tabpage_1
integer x = 1870
integer y = 644
integer width = 279
integer height = 216
integer taborder = 100
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "일용>>"
vtextalign vtextalign = vcenter!
end type

event clicked;// 일용직
long     ll_row, ll_dw4row, ll_find, ll_basictime, ll_max, ll_pos
string   ls_areano, ls_workday, ls_teamno, ls_teamnm, ls_teamnmorg, ls_mantype, ls_namekor
string   ls_userid, ls_userid_save, ls_stime, ls_etime, ls_null, ls_max
DateTime ld_time, ldt_stime, ldt_etime

setnull(ls_null)

dw4.accepttext()
dw_area.accepttext()

ls_areano = dw_area.object.area[1]

ls_teamno   = dw_2.object.team_no[1]
dw_2.getchild("team_no", idwc_team)
ls_teamnm = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")
if ls_teamnm = "전체" then ls_teamnm = ""

ls_teamnmorg = ls_teamnm
ls_teamnm    = trim(ls_teamnm) + "%"  // 근태부서

setnull( ld_time )
ls_workday = em_2.text

ls_stime  = string(em_stime.text)
ls_etime  = string(em_etime.text)
ldt_stime = datetime( date(em_2.text), time(ls_stime) )
ldt_etime = datetime( date(em_2.text), time(ls_etime) )

// 기본시간(8:00) 체크		
SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
if cbx_basic.checked = true then
	if ll_basictime > 9 then
		MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할 등록하시기 바랍니다.")
		RETURN
	end if
end if


// 일용(파견) MAX값 구하기
setnull( ll_max )

// 화면추가 상태
for ll_row = 1 to dw4.rowcount()
	if dw4.object.day_labor[ll_row] = "Y" then		// 일용(파견)
		// 일용(파견)직 Key값 증가
	   ls_userid = dw4.object.user_id[ll_row]
		ll_pos    = PosA(ls_userid,"-")
		if ll_pos > 0 then
			if isnull(ls_userid_save) OR ls_userid_save = "" then
				ls_userid_save = ls_userid
			   ls_max  = RightA(ls_userid_save, LenA(ls_userid_save) - ll_pos)
				ll_max  = long(ls_max)

				ll_max  = ll_max + 1
			end if
			
			if ls_userid > ls_userid_save then
				ls_userid_save = ls_userid
			   ls_max  = RightA(ls_userid_save, LenA(ls_userid_save) - ll_pos)
				ll_max  = long(ls_max)

				ll_max  = ll_max + 1
			end if
		end if
		
		if isnull( ll_max ) then ll_max = 1
	end if
next

ll_dw4row = dw4.insertrow(0)

dw4.object.chk[ll_dw4row]        = "Y"
dw4.object.area_no[ll_dw4row]    = ls_areano
dw4.object.work_no[ll_dw4row]    = ls_teamno
dw4.object.work_nm[ll_dw4row]    = ls_teamnmorg
dw4.object.work_day[ll_dw4row]   = datetime( date(ls_workday), time("00:00:000") )
dw4.object.work_stime[ll_dw4row] = ldt_stime
dw4.object.work_etime[ll_dw4row] = ldt_etime

ls_teamno  = ls_teamno + "-" + string(ll_max,"00")
dw4.object.user_id[ll_dw4row]    = ls_teamno

dw4.object.job_no[ll_dw4row]     = "LABOR"
dw4.object.job_name[ll_dw4row]   = "일용(파견)"

dw4.object.name_kor[ll_dw4row]   = "일용(파견)"	// dw3.object.name_kor[ll_row]
dw4.object.day_labor[ll_dw4row]  = "Y"			

ls_mantype = dw3.object.foreign_gb[1]
if ls_mantype = "외국" then
	ls_mantype = "F"
else
	ls_mantype = "D"
end if		
dw4.object.man_type[ll_dw4row]   = ls_mantype

dw4.object.job_no[ll_dw4row]     = ls_null		
dw4.object.contents[ll_dw4row]   = ls_null		
if dw4.object.day_labor[ll_dw4row]  = "Y" then
	dw4.object.company[ll_dw4row]    = "인력회사"		
end if

dw4.object.name_kor.TabSequence  = 20
dw4.object.man_type.TabSequence  = 30
dw4.object.company.TabSequence   = 40		

end event

type cb_6 from commandbutton within tabpage_1
integer x = 3433
integer y = 8
integer width = 229
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "적용"
end type

event clicked;// 적용
long   	ll_row, ll_cnt, ll_basictime
string 	ls_stime, ls_etime, ls_teamno, ls_jobno, ls_jobname
datetime ldt_stime, ldt_etime
DataWindowChild ldwc_team

debugbreak()

// 근태부서
dw_2.accepttext()

ls_teamno  = trim(dw_2.object.team_no[1])
if ls_teamno = "" then
	MessageBox("확인","전체 작업장에서는 적용할 수 없습니다.")
	RETURN
end if

// 작업장
dw5.accepttext()

ls_jobno = trim(dw5.object.team_no[1])
if isnull( ls_jobno ) then ls_jobno = ""

if ls_teamno = ls_jobno then
	MessageBox("확인","작업장과 작업장은 동일할 수 없습니다.")
	RETURN
end if

if ls_jobno = "" then
else
	dw5.getchild("team_no", idwc_work)
	ls_jobname = idwc_work.getitemstring(idwc_work.getrow(), "team_nm")
	if isnull(ls_jobname) then ls_jobname = ""
end if

debugbreak()

// 근무시간(시작, 종료)
ls_stime  = string(em_stime.text)
ls_etime  = string(em_etime.text)

if RightA(ls_stime,1) <> "0" then
	MessageBox("확인","시작시간 오류입니다.")
	RETURN
end if

if RightA(ls_etime,1) <> "0" then
	if ls_etime = "23:59" then
	else
		MessageBox("확인","종료시간 오류입니다.")
		RETURN
	end if
end if

if ls_stime > ls_etime then
	MessageBox("확인","시간, 종료시간 오류입니다.")
	RETURN
end if

ldt_stime = datetime( date(em_2.text), time(ls_stime) )
ldt_etime = datetime( date(em_2.text), time(ls_etime) )

SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
if cbx_basic.checked = true then
	if ll_basictime > 9 then
		MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할하여 등록하시기 바랍니다.")
		RETURN
	end if
end if

// 다중선택
for ll_row = 1 to dw4.rowcount()
	if dw4.object.chk[ll_row] = "Y" then
		ll_cnt = ll_cnt + 1
		
//		// 소속부서
//		if isnull( ls_jobname ) OR ls_jobname = "" then
//		else
//			dw4.object.job_no[ll_row]   = ls_jobno
//			dw4.object.job_name[ll_row] = ls_jobname
//		end if
		
		// 시작시간, 종료시간
		if ls_stime = "none" OR ls_etime = "00:00" OR ls_etime = "none" then
			if ls_stime = "00:00" then
				dw4.object.work_stime[ll_row] = ldt_stime
				dw4.object.work_etime[ll_row] = ldt_etime
			end if
		else
			dw4.object.work_stime[ll_row] = ldt_stime
			dw4.object.work_etime[ll_row] = ldt_etime
		end if
	end if
next

// 초기화(시작, 종료)
em_stime.text  = "08:00"
em_etime.text  = "17:30"
dw5.object.team_no[1] = " "		// 작업장

if ll_cnt > 0 then
	MessageBox("확인","적용완료")
else
	MessageBox("확인","적용할 대상을 먼저 선택하시기 바랍니다.")
end if

end event

type st_2 from statictext within tabpage_1
integer x = 329
integer y = 16
integer width = 279
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within tabpage_1
string tag = "d_whwc_s"
integer x = 608
integer y = 12
integer width = 599
integer height = 80
integer taborder = 40
string title = "none"
string dataobject = "d_whworkteam_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_teamno

this.accepttext()

ls_teamno = trim(data)
if ls_teamno = "" then		// 전체
	dw5.object.team_no.Background.Color   = 67108864
	dw5.enabled = false

	if is_dw = "dw_3" then
		// 파견모드
		pb_1.enabled = true	// >>
		pb_4.enabled = true	// 일용>>
	end if
else
	dw5.object.team_no.Background.Color   = rgb(255, 255, 255)
	dw5.enabled = true	
end if

end event

type em_stime from editmask within tabpage_1
integer x = 2921
integer y = 8
integer width = 251
integer height = 80
integer taborder = 90
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event getfocus;//
this.SelectText(1, LenA(this.text) + 2)		// 시간


end event

type cbx_1 from checkbox within tabpage_1
integer x = 2176
integer y = 24
integer width = 238
integer height = 56
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
datawindow dw_work

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

choose case is_dw
	case "dw_4"
		dw_work = dw4
	case "dw_8"
		dw_work = dw8
	case "dw_9"
		dw_work = dw9
	case else
		RETURN
end choose

for ll_row = 1 to dw_work.rowcount()
	dw_work.object.chk[ll_row] = ls_chk
next

end event

type pb_3 from picturebutton within tabpage_1
integer x = 1870
integer y = 1192
integer width = 279
integer height = 216
integer taborder = 90
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "초기화"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// 초기화
dw4.reset()

end event

type pb_2 from picturebutton within tabpage_1
integer x = 1870
integer y = 860
integer width = 279
integer height = 332
integer taborder = 80
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<<"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// 제거(<<)
long     ll_row, lY, ll_dw9row, ll_cnt, ll_delcnt
string   ls_sfcdate, ls_wcno, ls_chk1, ls_chk2, ls_chk3, ls_booking, ls_null
string   ls_areano, ls_teamno, ls_userid, ls_uidorg, ls_daylabor
datetime ldt_time, ldt_stime, ldt_etime

setnull( ls_null )
dw4.accepttext()

dw4.setredraw(false)
for lY = dw4.rowcount() to 1 step -1 
	if dw4.object.chk[lY] = "Y" then	
		// 1차확정 CHECK
		if dw4.object.confirm1[lY] = "Y" then
			MessageBox("확인",string(lY) + " 행 데이터~n~n1차 확정취소 후 작업하시기 바랍니다.")
		else
			ls_areano  = dw4.object.area_no[lY]
			ls_teamno  = dw4.object.work_no[lY]
			ldt_time   = dw4.object.work_day[lY]
			ldt_stime  = dw4.object.work_stime[lY]
			ldt_etime  = dw4.object.work_etime[lY]
			ls_userid  = dw4.object.user_id[lY]
			ls_uidorg  = dw4.object.uid_org[lY]

			// 지원 원복하기 => 일용(파견)
			ls_booking = dw4.object.booking[lY]
			if ls_booking = "Y" then
				UPDATE sfcworkman 
					SET booking = :ls_null, day_labor = 'Y', name_kor = '일용(파견)', user_id = :ls_uidorg
				 WHERE area_no = :ls_areano AND work_no = :ls_teamno AND work_day = :ldt_time AND user_id = :ls_uidorg
					AND work_stime = :ldt_stime AND work_etime = :ldt_etime;
				if sqlca.sqlcode <> 0 then
					dw4.scrolltorow( lY )
					MessageBox("확인", "지원 원복하기 오류~n~n" + SQLCA.SQLErrText)
				else
					dw4.scrolltorow(lY)	
					//dw4.deleterow(0)
					// 예약자 상태로 원복하기
				end if
			else
				ll_delcnt = ll_delcnt + 1
				dw4.scrolltorow(lY)	
				dw4.deleterow(0)
			end if
			
//			// 일용(파견) 원복하기
//			ls_daylabor = dw4.object.day_labor[lY]
//			if ls_daylabor = "Y" then
//				UPDATE sfcworkman 
//					SET booking = :ls_null, day_labor = 'Y', name_kor = '일용(파견)'
//				 WHERE area_no = :ls_areano AND work_no = :ls_teamno AND work_day = :ldt_time AND user_id = :ls_userid
//					AND work_stime = :ldt_stime AND work_etime = :ldt_etime;
//				if sqlca.sqlcode <> 0 then
//					dw4.scrolltorow( lY )
//					MessageBox("확인", "일용(파견) 원복하기 오류~n~n" + SQLCA.SQLErrText)
//				else
//					dw4.scrolltorow(lY)	
//					//dw4.deleterow(0)
//					// 예약자 상태로 원복하기
//				end if
//			end if
		end if
	end if
next
dw4.setredraw(true)

if ll_delcnt > 0 then
	wf_update1( dw4, "N" )
end if

//tab_1.tabpage_5.cbx_5.checked = false

end event

type pb_1 from picturebutton within tabpage_1
integer x = 1870
integer y = 96
integer width = 279
integer height = 332
integer taborder = 70
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = ">>"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// 등록(>>)
long     ll_row, ll_dw4row, ll_found, ll_basictime
string   ls_areano, ls_teamno, ls_teamnm, ls_teamnmorg, ls_jobname, ls_namekor, ls_mantype
string   ls_time, ls_stime, ls_etime, ls_userid, ls_find
dateTime ldt_time, ldt_stime, ldt_etime

setnull( ldt_time )

dw_2.accepttext()
dw_area.accepttext()

ls_areano = dw_area.object.area[1]
ls_teamno = dw_2.object.team_no[1]

ls_stime  = string(em_stime.text)
ls_etime  = string(em_etime.text)
ldt_stime = datetime( date(em_2.text), time(ls_stime) )
ldt_etime = datetime( date(em_2.text), time(ls_etime) )

dw_2.getchild("team_no", idwc_team)
ls_teamnm    = idwc_team.getitemstring(idwc_team.getrow(), "team_nm")
ls_teamnmorg = ls_teamnm
if ls_teamnm = "전체" then ls_teamnm = ""
ls_teamnm    = trim(ls_teamnm) + "%"  // 근태부서

ldt_time  = datetime( date(em_2.text), time("00:00:000") )

// 기본시간(8:00) 체크		
SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
if cbx_basic.checked = true then
	if ll_basictime > 9 then
		MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할 등록하시기 바랍니다.")
		RETURN
	end if
end if


for ll_row = 1 to dw3.rowcount()
	if dw3.object.chk[ll_row] = "Y" then
		ls_userid  = dw3.object.user_id[ll_row]
		ls_namekor = dw3.object.name_kor[ll_row]
		ls_jobname = dw3.object.team_nm[ll_row] + "%"
		
		// 근태부서와 작업장 체크
		if ls_teamnm <> ls_jobname then
			MessageBox("확인",string(ll_row) + "행 " + string(dw3.object.team_nm[ll_row]) + "~n~n작업장이 일치하지 않습니다.")
			dw3.scrolltorow( ll_row )
			RETURN
		end if
				
		ll_dw4row = dw4.insertrow(0)

      dw4.object.chk[ll_dw4row]        = "Y"
      dw4.object.area_no[ll_dw4row]    = ls_areano
      dw4.object.work_no[ll_dw4row]    = ls_teamno
      dw4.object.work_nm[ll_dw4row]    = ls_teamnmorg
      dw4.object.work_day[ll_dw4row]   = ldt_time
      dw4.object.work_stime[ll_dw4row] = ldt_stime
      dw4.object.work_etime[ll_dw4row] = ldt_etime
		
      dw4.object.user_id[ll_dw4row]    = dw3.object.user_id[ll_row]
      dw4.object.name_kor[ll_dw4row]   = dw3.object.name_kor[ll_row]
      dw4.object.job_no[ll_dw4row]     = ls_teamno
      dw4.object.job_name[ll_dw4row]   = ls_teamnmorg

		ls_mantype = dw3.object.foreign_gb[ll_row]
		if ls_mantype = "외국" then
			ls_mantype = "F"
		else
			ls_mantype = "D"
		end if		
      dw4.object.man_type[ll_dw4row]   = ls_mantype
	end if
next

end event

type dw_4 from datawindow within tabpage_1
string tag = "d_mpworkman_m, d_mpsfcdayman_list"
integer x = 2167
integer y = 160
integer width = 2299
integer height = 1000
integer taborder = 80
string title = "근무자 현황"
string dataobject = "d_mpworkman_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

choose case dwo.name
	case "work_stime"
		em_stime.text = string(this.object.work_stime[row],"hh:mm")

	case "work_etime"
		em_etime.text = string(this.object.work_etime[row],"hh:mm")

	case "user_id"
		this.SelectText(1, LenA(GetText()))		// 전체선택
end choose

end event

event doubleclicked;////
//gs_where2 lst_str 
//string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_seqno
//long   ll_row, ll_col
//
//ll_row    = this.getrow()
//ll_col    = long( this.GetClickedColumn() )
//is_saleno = this.object.order_no[ll_row]
//ls_seqno  = string(this.object.seq_no[ll_row])
//
//if is_saleno = "" or isnull(is_saleno) or len(is_saleno) <> 14  then RETURN
//lst_str.str1[1] = is_saleno
//lst_str.str2[1] = ls_seqno
//
//OpenWithParm(w_whsaleall_w, lst_str)	
//
end event

event getfocus;//
is_dw = "dw_4"
this.Object.DataWindow.Color = rgb(215, 228, 188)

//
string ls_teamno

dw_2.accepttext()
ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

if ls_teamno = "%" then
	pb_1.enabled = false		// >>
	pb_2.enabled = false		// <<
	pb_3.enabled = false		// 초기화
	pb_4.enabled = false		// 일용>>
	pb_5.enabled = false		// 지원>>	
	pb_6.enabled = false		// 파견>>	
else
	pb_1.enabled = false
	pb_2.enabled = true
	pb_3.enabled = true
	pb_4.enabled = false
	pb_5.enabled = false
	pb_6.enabled = false
end if

em_stime.text    = "08:00"
em_etime.text    = "17:30"
em_stime.enabled = true
em_etime.enabled = true
cb_6.enabled     = true
//cb_7.enabled     = true

cbx_c1.enabled   = false
cbx_c2.enabled   = false
cbx_c3.enabled   = false

dw_4.object.confirm1.TabSequence = 0
dw_4.object.confirm2.TabSequence = 0
dw_4.object.confirm3.TabSequence = 0

if GF_PERMISSION("근무신청서_1차확정", gs_userid) = "Y" then
	cbx_c1.enabled = true
	dw_4.object.confirm1.TabSequence = 20
end if
if GF_PERMISSION("근무신청서_2차확정", gs_userid) = "Y" then 
	cbx_c2.enabled = true
	dw_4.object.confirm2.TabSequence = 30
end if	
if GF_PERMISSION("근무신청서_3차확정", gs_userid) = "Y" then 
	cbx_c3.enabled = true
	dw_4.object.confirm3.TabSequence = 40
end if


end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

event itemfocuschanged;//// DataWinodw AutoSelection = true 대체
//
//choose case dwo.name
//	case "name_kor"
//		this.SelectText(1, len(GetText()))		// 담당자 선택
//end choose
end event

event itemchanged;//
string ls_userid, ls_namekor, ls_jobname
long   ll_row, ll_found
//
datetime ldt_stime, ldt_etime
string   ls_stime,  ls_etime
long     ll_basictime


if isnull(row) OR row < 1 then RETURN

choose case dwo.name
	case "confirm1", "confirm2", "confirm3"
		
	case "sel"
		if IsNumber(trim(data)) = true then
			ll_row = long(data)
			
			ll_found = dw4.find( "sel = '" + trim(data) + "' ", 1, dw4.rowcount() )
			if ll_found = row OR ll_found < 1 then
				// Current Row, Not Found
				ls_userid  = dw3.object.user_id[ll_row]
				ls_namekor = dw3.object.name_kor[ll_row]
				ls_jobname = dw3.object.team_nm[ll_row]
	
				dw4.object.user_id[row]  = ls_userid
				dw4.object.name_kor[row] = ls_namekor
				
				dw4.accepttext()
			else
				dw3.object.sel[ll_row] = ""
				MessageBox("확인", string(ll_found) + " 행과 중복됩니다.")
				RETURN
			end if
		end if
		

	case "work_stime", "work_etime"
		if dwo.name = "" then
			ls_stime = data
		else
			ls_etime = data
		end if
		
		ldt_stime = datetime( date(em_2.text), time(ls_stime) )
		ldt_etime = datetime( date(em_2.text), time(ls_etime) )
		
		SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
		if cbx_basic.checked = true then
			if ll_basictime > 9 then
				MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할하여 등록하시기 바랍니다.")
				RETURN
			end if
		end if
end choose

end event

type cbx_all from checkbox within tabpage_1
integer x = 18
integer y = 28
integer width = 238
integer height = 56
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
datawindow dw_work

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

choose case is_dw
	case "dw_3"
		dw_work  = dw3
		
	case "dw_7"
		dw_work  = dw7
		
	case else
		if dw7.rowcount() < 1 then 
			dw_work  = dw3
		else
			MessageBox("확인","작업장이나, 일용직 신청현황 중 하나를 선택하시기 바랍니다.")
			RETURN
		end if
end choose

for ll_row = 1 to dw_work.rowcount()
	dw_work.object.chk[ll_row] = ls_chk
next

end event

type dw_8 from datawindow within tabpage_1
integer x = 2167
integer y = 1228
integer width = 1838
integer height = 668
integer taborder = 50
boolean bringtotop = true
string title = "지원자 현황"
string dataobject = "d_mpworkman_booking"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
is_dw = "dw_8"
this.Object.DataWindow.Color = rgb(215, 228, 188)

pb_1.enabled = false		// >>
pb_2.enabled = false		// <<
pb_3.enabled = false		// 초기화
pb_4.enabled = false		// 일용>>
pb_5.enabled = false		// 지원>>
pb_6.enabled = false		// 파견>>

em_stime.enabled = false
em_etime.enabled = false
cb_6.enabled     = false
cb_7.enabled     = false

cbx_c1.enabled   = false
cbx_c2.enabled   = false
cbx_c3.enabled   = false

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_8"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_3 from datawindow within tabpage_1
event ue_1 pbm_dwndragleave
string tag = "d_mpworkman_list"
integer x = 9
integer y = 160
integer width = 1838
integer height = 1000
integer taborder = 70
boolean bringtotop = true
string title = "작업장"
string dataobject = "d_mpworkman_l"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event doubleclicked;////
//gs_where2 lst_str 
//string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_seqno
//long   ll_row, ll_col
//
//ll_row    = this.getrow()
//ll_col    = long( this.GetClickedColumn() )
//is_saleno = this.object.order_no[ll_row]
//ls_seqno  = string(this.object.seq_no[ll_row])
//
//if is_saleno = "" or isnull(is_saleno) or len(is_saleno) <> 14  then RETURN
//lst_str.str1[1] = is_saleno
//lst_str.str2[1] = ls_seqno
//
//OpenWithParm(w_whsaleall_w, lst_str)	
//
end event

event itemchanged;//// 수량체크, 공정관리자 체크
//string ls_planmgr, ls_job, ls_premission
//long   ll_row, ll_qty, ll_qty1, ll_qty2, ll_qty3, ll_totqty
//
//if isnull( row ) OR row < 1 then RETURN
//
//ls_premission = GF_PERMISSION("생산계획_조회저장", gs_userid)
//
//// this.accepttext() 로직 마직막에서 처리함
//
//ll_qty  = this.object.jan_qty[row]			// 잔량
//if dw5.rowcount() > 0 then 
//	ll_qty1 = dw5.object.tjobqty[1]		 	// 수량1
//else
//	ll_qty1 = 0
//end if
//
//if dw6.rowcount() > 0 then 
//	ll_qty2 = dw6.object.tjobqty[1]		 	// 수량2
//else
//	ll_qty2 = 0
//end if
//
//if dw8.rowcount() > 0 then 
//	ll_qty3 = dw8.object.tjobqty[1]		 	// 수량3
//else
//	ll_qty3 = 0
//end if
//
//choose case dwo.name
//	case "job1_qty"
//		// 공정관리자 체크
//		ls_job = this.object.job1[row]
//		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
//		if ls_premission = "Y" then	
//		else
//			if gs_userid <> ls_planmgr then
//				this.object.job1_qty[row]  = this.object.job1_qty1[row]
//				MessageBox("확인","해당하는 공정의 공정관리자가 아닙니다.")
//				RETURN 1
//			end if
//		end if
//		
//		if isnull(this.object.job1_inchk[row]) then
//			MessageBox("확인","작업일1 반드시 입력하시기 바랍니다.")
//			RETURN 1
//		end if
//
//		// 마이너스 처리안됨
//		if long(data) < 0 then 
//			this.object.job1_qty[row]  = ll_qty1		
//			RETURN 1
//		end if
//	
//		ll_totqty = ll_qty1 + long(data)
//		if ll_totqty > ll_qty then
//			MessageBox("확인","잔량보다 큰 경우입니다.")
//			this.object.job1_qty[row]  = this.object.job1_qty1[row]
//			RETURN 1
//		end if
//		
//		dw3.object.chk[row] = "Y"
//		dw3.object.uptchk[row] = "Y"
//		this.accepttext()
//
//	case "job2_qty"
//		// 공정관리자 체크
//		ls_job = this.object.job2[row]
//		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
//		if ls_premission = "Y" then	
//		else
//			if gs_userid <> ls_planmgr then
//				this.object.job2_qty[row]  = this.object.job2_qty1[row]
//				MessageBox("확인","해당하는 공정의 공정관리자가 아닙니다.")
//				RETURN 1
//			end if
//		end if
//		
//		if isnull(this.object.job2_inchk[row]) then
//			MessageBox("확인","작업일2 반드시 입력하시기 바랍니다.")
//			RETURN 1
//		end if
//
//		// 마이너스 처리안됨
//		if long(data) < 0 then 
//			this.object.job2_qty[row] = ll_qty2		
//			RETURN 1
//		end if
//		
//		ll_totqty = ll_qty2 + long(data)
//		if ll_totqty > ll_qty1 then
//			MessageBox("확인","1공정 수량보다 큰 경우입니다.")
//			this.object.job2_qty[row]  = this.object.job2_qty1[row]
//			RETURN 1
//		end if
//		
//		dw3.object.chk[row] = "Y"
//		dw3.object.uptchk[row] = "Y"
//		this.accepttext()
//
//	case "job3_qty"
//		// 공정관리자 체크
//		ls_job = this.object.job3[row]
//		SELECT isnull(user_id,'') INTO :ls_planmgr FROM wc WHERE work_no = :ls_job;
//		if ls_premission = "Y" then	
//		else
//			if gs_userid <> ls_planmgr then
//				this.object.job3_qty[row]  = this.object.job3_qty1[row]
//				MessageBox("확인","해당하는 공정의 공정관리자가 아닙니다.")
//				RETURN 1
//			end if
//		end if
//		
//		if isnull(this.object.job3_inchk[row]) then
//			MessageBox("확인","작업일3 반드시 입력하시기 바랍니다.")
//			RETURN 1
//		end if
//
//		// 마이너스 처리안됨
//		if long(data) < 0 then 
//			this.object.job3_qty[row]  = ll_qty3
//			RETURN 1
//		end if
//
//		ll_totqty = ll_qty3 + long(data)
//		if ll_totqty > ll_qty2 then
//			MessageBox("확인","2공정 수량보다 큰 경우입니다.")
//			this.object.job3_qty[row]  = this.object.job3_qty1[row]
//			RETURN 1
//		end if
//
//		dw3.object.chk[row] = "Y"
//		dw3.object.uptchk[row] = "Y"
//		this.accepttext()
//end choose
//
end event

event itemfocuschanged;//// DataWinodw AutoSelection = true 대체
//choose case dwo.name
//	case "job1_qty", "job2_qty", "job3_qty"
//		this.SelectText(1, len(GetText()) + 2)		// 수량전체 선택
//end choose
end event

event getfocus;// 직원현황(SECOM)
string ls_teamno, ls_workno

is_dw = "dw_3"
this.Object.DataWindow.Color = rgb(215, 228, 188)

// 작업장(파견)
dw5.accepttext()
ls_workno   = trim(dw5.object.team_no[1])
if ls_workno = "" then ls_workno = "%"

// 근태부서
dw_2.accepttext()
ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

if ls_teamno = "%" then
	pb_1.enabled = false		// >>
	pb_2.enabled = false		// <<
	pb_3.enabled = false		// 초기화
	pb_4.enabled = false		// 일용>>
	pb_5.enabled = false		// 지원>>
	pb_6.enabled = false		// 파견>>
else
	pb_1.enabled = true		// >>
	pb_2.enabled = false		// <<
	pb_3.enabled = false		// 초기화
	pb_4.enabled = true		// 일용>>
	pb_5.enabled = false		// 지원>>
	pb_6.enabled = true		// 파견>>
	
	// 작업장(파견)
	if ls_workno = "%" then
	else
		pb_1.enabled = false	// >>
		pb_4.enabled = false	// 일용>>
	end if
end if

em_stime.enabled = false
em_etime.enabled = false
cb_6.enabled     = false
cb_7.enabled     = false

cbx_c1.enabled   = false
cbx_c2.enabled   = false
cbx_c3.enabled   = false

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type dw_9 from datawindow within tabpage_1
integer x = 2510
integer y = 344
integer width = 1760
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "일용직(KeyID 부여)"
string dataobject = "d_mpworkman_labor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;// DataWinodw AutoSelection = true 대체

choose case dwo.name
	case "work_stime", "work_etime", "user_id"
		this.SelectText(1, LenA(GetText()))		// 선택
end choose
end event

event getfocus;//
is_dw = "dw_9"
this.Object.DataWindow.Color = rgb(253, 233, 217)

em_stime.enabled = false
em_etime.enabled = false
cb_6.enabled     = false		// 적용
cb_7.enabled     = false

cbx_c1.enabled   = false
cbx_c2.enabled   = false
cbx_c3.enabled   = false

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)

end event

event itemchanged;//
datetime ldt_stime, ldt_etime
string   ls_stime,  ls_etime
long     ll_basictime

choose case dwo.name
	case "work_stime", "work_etime"
		if dwo.name = "" then
			ls_stime = data
		else
			ls_etime = data
		end if
		
		ldt_stime = datetime( date(em_2.text), time(ls_stime) )
		ldt_etime = datetime( date(em_2.text), time(ls_etime) )
		
		SELECT top 1 DateDiff(hour, :ldt_stime, :ldt_etime ) INTO :ll_basictime FROM login;
		if cbx_basic.checked = true then
			if ll_basictime > 9 then
				MessageBox("확인","기본시간 초과근무 입니다.~n~n연장근무는 분할하여 등록하시기 바랍니다.")
				RETURN
			end if
		end if
end choose

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "일자별 집계"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CrossTab!"
long picturemaskcolor = 536870912
cbx_3 cbx_3
dw_6 dw_6
end type

on tabpage_2.create
this.cbx_3=create cbx_3
this.dw_6=create dw_6
this.Control[]={this.cbx_3,&
this.dw_6}
end on

on tabpage_2.destroy
destroy(this.cbx_3)
destroy(this.dw_6)
end on

type cbx_3 from checkbox within tabpage_2
integer x = 9
integer y = 28
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "1주일 전후"
end type

event clicked;//
string ls_area, ls_teamno, ls_workname, ls_sdate, ls_edate

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ls_sdate = string(RelativeDate(date(em_2.text), -7),"yyyy/mm/dd")
ls_edate = string(RelativeDate(date(em_2.text),  7),"yyyy/mm/dd")

dw_2.accepttext()
ls_teamno   = trim(dw_2.object.team_no[1])
if ls_teamno = "" then ls_teamno = "%"

if this.checked = true then
		dw6.reset()
		dw6.retrieve( ls_area, ls_teamno, ls_sdate, ls_edate )	
		if dw6.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 자료가 없습니다",Exclamation!)
		end if
end if

end event

type dw_6 from datawindow within tabpage_2
integer x = 9
integer y = 96
integer width = 4453
integer height = 1796
integer taborder = 60
string title = "none"
string dataobject = "d_mpworkman_ct"
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

end event

event getfocus;//
is_dw = "dw_6"
//this.Object.DataWindow.Color = rgb(253, 233, 217)

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4480
integer height = 1904
long backcolor = 79741120
string text = "근태(SECOM)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_10 cb_10
st_7 st_7
st_3 st_3
cb_9 cb_9
cb_8 cb_8
dw_11 dw_11
end type

on tabpage_3.create
this.cb_10=create cb_10
this.st_7=create st_7
this.st_3=create st_3
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_11=create dw_11
this.Control[]={this.cb_10,&
this.st_7,&
this.st_3,&
this.cb_9,&
this.cb_8,&
this.dw_11}
end on

on tabpage_3.destroy
destroy(this.cb_10)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_11)
end on

type cb_10 from commandbutton within tabpage_3
integer x = 1070
integer width = 270
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "초기화"
end type

event clicked;// 초기화
dw_11.reset()

end event

type st_7 from statictext within tabpage_3
integer x = 2592
integer y = 24
integer width = 1413
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "정상출근: 1,2차 자동확정, 결근: 결근확정"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_3
integer x = 1362
integer y = 24
integer width = 1202
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "SECOM 데이터는 탭으로 분리된 파일."
boolean focusrectangle = false
end type

type cb_9 from commandbutton within tabpage_3
integer x = 544
integer width = 521
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "SECOM 체크"
end type

event clicked;// SECOM 체크
long     ll_row, ll_find, ll_dw4cnt, ll_dw11cnt
string   ls_dueday, ls_userid, ls_confirm1, ls_contents
datetime ldt_workday, ldt_stime, ldt_etime

if dw4.rowcount() < 1 then
	MessageBox("확인","근무자+일용직 현황을 조회한 후 작업하시기 바랍니다.")
	RETURN
end if

debugbreak()

for ll_dw11cnt = 1 to dw11.rowcount()
	ls_dueday   = dw11.object.dueday[ll_dw11cnt]		// 근무일자
	ls_dueday   = GF_ReplaceAll(ls_dueday,"-","/")
	
	ls_userid   = dw11.object.user_id[ll_dw11cnt]	// 사번
	ls_confirm1 = dw11.object.confirm1[ll_dw11cnt]	// 출근판정(정상출근,결근)
	
	if isnull(ls_userid) OR ls_userid = "" then
	else
		choose case ls_confirm1
			case "정상출근", "결근"
				ll_find = dw4.find( "user_id = '" + ls_userid + "' ", 1, dw4.rowcount() )
				if ll_find > 0 then
					ldt_workday = dw4.object.work_day[ll_find]	// 작업일
					
					if ls_dueday = string(ldt_workday,"yyyy/mm/dd") then
						dw11.object.modifyuser[ll_dw11cnt] = string(ll_find)
						dw4.object.timecard[ll_find]   = "Y"		// CHK
						
						ls_contents = dw4.object.contents[ll_find]
						if isnull(ls_contents) then ls_contents = ""
						
						if ls_confirm1 = "결근" then
							dw4.object.absent[ll_find]   = "Y"		// 결근
						else
							dw4.object.confirm1[ll_find] = "Y"		// 1차확정
							dw4.object.confirm2[ll_find] = "Y"		// 2차확정
						end if
					end if
				end if
				
			case "정상퇴근", "연장,야간근무"
				ll_find = dw4.find( "user_id = '" + ls_userid + "' ", 1, dw4.rowcount() )
				if ll_find > 0 then
					ldt_workday = dw4.object.work_day[ll_find]	// 작업일
					ldt_stime   = dw4.object.work_stime[ll_find]	// 시작
					ldt_etime   = dw4.object.work_etime[ll_find]	// 종료
					
					if ls_dueday = string(ldt_workday,"yyyy/mm/dd") then
						dw11.object.modifyuser[ll_dw11cnt] = string(ll_find)
						dw4.object.timecard[ll_find]   = "Y"		// CHK
						
						ls_contents = dw4.object.contents[ll_find]
						if isnull(ls_contents) then ls_contents = ""
						
						if ls_confirm1 = "결근" then
							dw4.object.absent[ll_find]   = "Y"		// 결근
						else
							dw4.object.confirm1[ll_find] = "Y"		// 1차확정
							dw4.object.confirm2[ll_find] = "Y"		// 2차확정
						end if
					end if
				end if
		end choose
	end if
next	

MessageBox("확인","SECOM 체크작업 완료")

end event

type cb_8 from commandbutton within tabpage_3
integer x = 18
integer width = 521
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "엑셀 붙혀넣기"
end type

event clicked;//
string	ls_itemno, ls_itemnm, ls_pathname
long		ll_row, ll_rc
integer  iRet

// Long. Returns the number of rows that were imported if it succeeds and returns the following values if an error occurs:
//  0  End of file, too many rows
// -2  Not enough columns
// -3  Invalid argument
// -4  Invalid input

ll_rc = dw11.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then	
	//ClipBoard("")
	
	for ll_row = 1 to dw11.rowcount()
//		ls_itemno = dw11.object.order_item[ll_row]
//		
//		SELECT rtrim(item_name) INTO :ls_itemnm FROM groupitem WHERE item_no = :ls_itemno;
//		dw11.object.erp_name[ll_row] = ls_itemnm;
	next
	
	MessageBox("확인","근태(SECOM) 데이터 가져오기 완료" )
end if

end event

type dw_11 from datawindow within tabpage_3
integer x = 9
integer y = 96
integer width = 4453
integer height = 1796
integer taborder = 90
string title = "none"
string dataobject = "d_timecard_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_11"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event getfocus;//
is_dw = "dw_11"
this.Object.DataWindow.Color = rgb(253, 233, 217)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)

end event

type st_5 from statictext within w_mpworkman_m
integer x = 2697
integer y = 328
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

type st_time from statictext within w_mpworkman_m
integer x = 2907
integer y = 328
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

type st_10 from statictext within w_mpworkman_m
integer x = 1042
integer y = 64
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

type st_4 from statictext within w_mpworkman_m
integer x = 87
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_mpworkman_m
integer x = 274
integer y = 312
integer width = 443
integer height = 632
integer taborder = 160
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

type ddlb_dwtitles from dropdownlistbox within w_mpworkman_m
integer x = 306
integer y = 324
integer width = 311
integer height = 88
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
end type

type st_6 from statictext within w_mpworkman_m
integer x = 745
integer y = 328
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

type ddlb_op from dropdownlistbox within w_mpworkman_m
integer x = 914
integer y = 312
integer width = 297
integer height = 512
integer taborder = 200
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

type sle_value from singlelineedit within w_mpworkman_m
integer x = 1234
integer y = 320
integer width = 567
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_mpworkman_m
integer x = 2025
integer y = 320
integer width = 160
integer height = 76
integer taborder = 140
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
	case "dw_7"
		arg_dw  = dw7
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
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

type cb_3 from commandbutton within w_mpworkman_m
integer x = 2190
integer y = 320
integer width = 160
integer height = 76
integer taborder = 170
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
	case "dw_7"
		arg_dw  = dw7
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_mpworkman_m
integer x = 2354
integer y = 320
integer width = 160
integer height = 76
integer taborder = 210
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
	case "dw_7"
		arg_dw  = dw7
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpworkman_m
integer x = 2519
integer y = 320
integer width = 160
integer height = 76
integer taborder = 230
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
	case "dw_7"
		arg_dw  = dw7
	case "dw_8"
		arg_dw  = dw8
	case "dw_10"
		arg_dw  = dw10
	case "dw_11"
		arg_dw  = dw11
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_op from checkbox within w_mpworkman_m
integer x = 1819
integer y = 328
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

type cb_1 from commandbutton within w_mpworkman_m
integer x = 3648
integer y = 312
integer width = 800
integer height = 92
integer taborder = 240
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

type cbx_4 from checkbox within w_mpworkman_m
integer x = 2574
integer y = 64
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "잔업자(All)"
end type

event clicked;// 잔업자(All)
cbx_5.checked = false
cbx_6.checked = false
if dw4.rowcount() < 1 then RETURN

if this.checked = true then
	dw4.setfilter( "string(work_stime,'hh:mm') >= '17:30'" )
	dw4.filter()
	
	MessageBox("확인","시작시간이 17:30 이상~n~n근무자는 "+string(dw4.rowcount(),"#,##0")+" 명 입니다.")
else
	dw4.setfilter( "" )
	dw4.filter()
end if

end event

type cbx_5 from checkbox within w_mpworkman_m
integer x = 2574
integer y = 120
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "잔업자(1차)"
end type

event clicked;// 잔업자(1차)
cbx_4.checked = false
cbx_6.checked = false
if dw4.rowcount() < 1 then RETURN

if this.checked = true then
	dw4.setfilter( "string(work_stime,'hh:mm') >= '17:30' AND string(work_etime,'hh:mm') >= '22:00' " )
	dw4.filter()

	MessageBox("확인","종료시간이 22:00 이상~n~n근무자는 "+string(dw4.rowcount(),"#,##0")+" 명 입니다.")
else
	dw4.setfilter( "" )
	dw4.filter()
end if


end event

type dw_12 from datawindow within w_mpworkman_m
integer x = 178
integer y = 176
integer width = 114
integer height = 76
integer taborder = 70
boolean bringtotop = true
boolean titlebar = true
string title = "미작성 작업장"
string dataobject = "d_mpworkman_nowrite"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_6 from checkbox within w_mpworkman_m
integer x = 2574
integer y = 176
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "마감후 작성"
end type

event clicked;// 마감후 작성
cbx_4.checked = false
cbx_5.checked = false
if dw4.rowcount() < 1 then RETURN

if this.checked = true then
	dw4.setfilter( "string(work_day,'mm/dd') < string(sys_date,'mm/dd') " )
	dw4.filter()

	MessageBox("확인","마감후 작성된~n~n데이터는 "+string(dw4.rowcount(),"#,##0")+" 건 입니다.")
else
	dw4.setfilter( "" )
	dw4.filter()
end if

// work_day(yy/mm/dd), sys_date(mm/dd hh:dd)
end event

type gb_4 from groupbox within w_mpworkman_m
integer x = 32
integer y = 256
integer width = 4521
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_5 from groupbox within w_mpworkman_m
integer x = 2528
integer y = 16
integer width = 512
integer height = 228
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

