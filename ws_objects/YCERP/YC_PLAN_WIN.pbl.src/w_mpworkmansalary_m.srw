$PBExportHeader$w_mpworkmansalary_m.srw
$PBExportComments$생산 공정별 인건비 관리
forward
global type w_mpworkmansalary_m from w_inheritance
end type
type pb_excel from picturebutton within w_mpworkmansalary_m
end type
type dw_cond from datawindow within w_mpworkmansalary_m
end type
type tab_1 from tab within w_mpworkmansalary_m
end type
type tabpage_1 from userobject within tab_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type em_meney from editmask within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type dw_t1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_2 st_2
st_1 st_1
em_meney em_meney
cb_2 cb_2
dw_t1 dw_t1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_2
end type
type dw_t2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_1 cb_1
dw_t2 dw_t2
end type
type tab_1 from tab within w_mpworkmansalary_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_mpworkmansalary_m from w_inheritance
integer x = 5
integer y = 72
integer width = 5216
integer height = 2576
string title = "생산 공정별 인건비 관리(w_mpworkmansalary_m)"
boolean resizable = false
string icon = "OleGenReg!"
pb_excel pb_excel
dw_cond dw_cond
tab_1 tab_1
end type
global w_mpworkmansalary_m w_mpworkmansalary_m

type variables
//
st_print i_print
string is_planmgr, is_wcname, is_area, is_saleno, is_dw, is_teamno

string is_wcno, is_itemno, is_duedate, is_purtype		// dw8 새로고침

DataWindowChild idwc_area, idwc_cust, idwc_wc, idwc_team, idwc_work
datawindow  dw3, dw4, dw5, dw6, dw7, dw8, dw9, dw10, dw11, dw12

datawindow	idw_t1, idw_t2
end variables

forward prototypes
public subroutine wf_area (string as_area)
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
public function integer wf_daycnt (string ls_yymm)
public subroutine wf_confirm (string as_check, integer ai_confirm)
public subroutine wf_set_dddw (string as_gubun)
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

public subroutine wf_set_dddw (string as_gubun);datawindowchild	ldwc_dw

Choose Case as_gubun
	case 'area'
		// 사업장
		gf_set_dddw(dw_cond, ldwc_dw, 'area', {''})
		ldwc_dw.insertrow(1)
		ldwc_dw.setitem(1, 'area_name', '전체')
		ldwc_dw.setitem(1, 'area_no', '%')
		if gs_area = "S0001" OR gs_area = "T0001" then
			dw_cond.setitem(1, 'area', gs_area)
		else
			dw_cond.setitem(1, 'area', 'S0001')
		end if		
		
	Case 'work'
		////// 작업장
		gf_set_dddw(dw_cond, ldwc_dw, 'work', {'%'})
		ldwc_dw.insertrow(1)
		ldwc_dw.setitem(1, 'work_name', '전체')
		ldwc_dw.setitem(1, 'work_no', '%')
		dw_cond.setitem(1, 'work', '%')
	Case Else
		if gf_set_dddw(dw_cond, ldwc_dw, 'work', {as_gubun}) > 0 then
			ldwc_dw.insertrow(1)
			ldwc_dw.setitem(1, 'work_name', '전체')
			ldwc_dw.setitem(1, 'work_no', '%')
			dw_cond.setitem(1, 'work', '%')		
		end if
End Choose
end subroutine

on w_mpworkmansalary_m.create
int iCurrent
call super::create
this.pb_excel=create pb_excel
this.dw_cond=create dw_cond
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_excel
this.Control[iCurrent+2]=this.dw_cond
this.Control[iCurrent+3]=this.tab_1
end on

on w_mpworkmansalary_m.destroy
call super::destroy
destroy(this.pb_excel)
destroy(this.dw_cond)
destroy(this.tab_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================
String	ls_date

//tab dw 셋팅
idw_t1	= tab_1.tabpage_1.dw_t1
idw_t2	= tab_1.tabpage_2.dw_t2
//////////////////////
// dw_cond 초기화
/////////////////////
//날짜
dw_cond.insertrow(0)
ls_date = string(gf_today(),"yyyymmdd")
dw_cond.setitem( 1, 'date', ls_date)
// 사업장
wf_set_dddw('area')
// 작업장
wf_set_dddw('work')
///////////////////////////////////

idw_t1.settransobject(sqlca)
idw_t2.settransobject(sqlca)

pb_retrieve.postevent('clicked')



end event

event resize;call super::resize;tab_1.width		= newwidth	- 73
tab_1.height	= newheight	- tab_1.y

idw_t1.width	= tab_1.width	- 73
idw_t1.height	= tab_1.height	- tab_1.y

idw_t2.width	= tab_1.width	- 73
idw_t2.height	= tab_1.height - tab_1.y

end event

type pb_save from w_inheritance`pb_save within w_mpworkmansalary_m
integer x = 4777
end type

event pb_save::clicked;call super::clicked;//// 저장
//string   ls_time, ls_daylabor, ls_company, ls_find, ls_teamno
//string   ls_userid, ls_namekor, ls_workno, ls_userid1, ls_namekor1, ls_workno1
//string   ls_sel, ls_null
//long     ll_row, ll_col, ll_Y, ll_found
//datetime ldt_time, ldt_stime, ldt_etime, ldt_stime1, ldt_etime1, ldt_workday, ldt_workday1
//
//if GF_PERMISSION("근무신청서_작성", gs_userid) = "Y" then	
//else
//	MessageBox("확인","근무신청서_작성 권한이 존재하지 않습니다.")
//	RETURN
//end if
//
//setnull( ls_null )
//
//dw4.accepttext()
//if dw4.rowcount() < 1 then RETURN
//
//// 작업시간
//
//
//
//// 중복체크(USER_ID+작업자+작업장+작업일+시작시간+종료시간) SORT하기
//dw4.setsort( "user_id A, name_kor A, work_no A, work_day A, work_stime A" )
//dw4.sort()
//
//for ll_row = 1 to dw4.rowcount()
//	ls_userid   = dw4.object.user_id[ll_row]
//	ls_namekor  = dw4.object.name_kor[ll_row]
//	ls_workno   = dw4.object.work_no[ll_row]
//	ldt_workday = dw4.object.work_day[ll_row]
//	ldt_stime   = dw4.object.work_stime[ll_row]
//	ldt_etime   = dw4.object.work_etime[ll_row]
//	
//	// 중복체크(USER_ID+작업자+작업장+작업일+시작시간+종료시간)
//	for ll_Y = ll_row + 1 to dw4.rowcount()
//		ls_userid1   = dw4.object.user_id[ll_Y]		// 인사사번
//		ls_namekor1  = dw4.object.name_kor[ll_Y]		// 작업자
//	   ls_workno1   = dw4.object.work_no[ll_Y]		// 작업장
//		ldt_workday1 = dw4.object.work_day[ll_Y]		// 작업일
//		ldt_stime1   = dw4.object.work_stime[ll_Y]	//	시작시간
//		ldt_etime1   = dw4.object.work_etime[ll_Y]	// 종료시간
//		
//		if ls_userid = ls_userid1 AND ls_namekor = ls_namekor1 AND ls_workno = ls_workno1 then
//			if ldt_workday = ldt_workday1 then
//				if ldt_stime = ldt_stime1 OR ldt_etime = ldt_etime1 then
//					MessageBox("오류",string(ll_row) + "행과 " + string(ll_Y) + "행 " + ls_namekor + &
//					           "~n~n시작, 종료시간 데이터 중복입니다.")
//					dw4.scrolltorow( ll_Y )
//					RETURN
//				end if
//
//				// 작업시간체크(종료시간 > 시작시간: 22:00 > 10:00)
//				if ldt_etime > ldt_stime1 then
//					MessageBox("오류",string(ll_row) + "행 종료시간 보다~n~n" + string(ll_Y) + "행 " + &
//					           "시작시간이 작은경우(중복근무) 입니다.")
//					dw4.scrolltorow( ll_Y )
//					RETURN
//				end if
//			end if
//		end if
//	next
//
//	// 일용직체크
//	ls_daylabor = dw4.object.day_labor[ll_row]
//	ls_company  = dw4.object.company[ll_row]
//	
//	if ls_daylabor = "Y" then	// 일용직
//		if isnull(ls_company) OR ls_company = "" then
//			dw4.scrolltorow( ll_row )
//			MessageBox("오류",string(ll_row) + "행~n~n일용직이면 일용직(회사명)을 입력하시기 바랍니다.")
//			RETURN
//		end if
//	end if
//	
//	for ll_col = 1 to 2
//		if ll_col = 1 then
//			ldt_time = dw4.object.work_stime[ll_row]
//			ls_time  = string(ldt_time)
//		else
//			ldt_time = dw4.object.work_etime[ll_row]
//			ls_time  = string(ldt_time)
//		end if
//		
//		if isnull(ldt_time) then
//			dw4.scrolltorow( ll_row )
//			MessageBox("오류",string(ll_row) + "행~n~n작업 시작,종료시간을 확인하시기 바랍니다.")
//			RETURN
//		end if
//	next
//
//	// 배정
//	if long(dw4.object.sel.width) > 0 then
//		ls_sel = dw4.object.sel[ll_row]
//		
//		if isnull( ls_sel ) OR ls_sel = "" then
//			dw4.scrolltorow( ll_row )
//			MessageBox("오류",string(ll_row) + "행~n~n지원자를 배정하여 주시기 바랍니다.")
//			RETURN
//		end if
//	end if	
//	
//	if dw4.object.confirm1[ll_row] = "N" then dw4.object.confirm1[ll_row] = ls_null
//	if dw4.object.confirm2[ll_row] = "N" then dw4.object.confirm2[ll_row] = ls_null
//	if dw4.object.confirm3[ll_row] = "N" then dw4.object.confirm3[ll_row] = ls_null
//next
//
////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
////if tab_1.tabpage_1.cbx_2.checked = true then		// 일용직관리
////	wf_update1( dw9, "Y" )
////else
////	if wf_update1(dw4,"N") = false then
////		RETURN
////	else
////		COMMIT;
////	
////		for ll_row = dw7.rowcount() to 1 step - 1
////			if dw7.object.chk[ll_row] = "Y" then
////				dw7.deleterow( ll_row )
////			end if
////		next	
////		wf_update1( dw7, "N" )
////		
////		// 지원신청자 수와 배정자 수를 일치하기 위함
////		pb_delete.enabled = true				// 행삭제
////		tab_1.tabpage_1.pb_2.enabled = true	// 지원자제거
////			
////		pb_retrieve.postevent( clicked! )
////		MessageBox("확인","저장완료")
////	end if
////end if
////
end event

type dw_1 from w_inheritance`dw_1 within w_mpworkmansalary_m
boolean visible = false
integer x = 4009
integer y = 52
integer width = 101
integer height = 100
end type

type st_title from w_inheritance`st_title within w_mpworkmansalary_m
integer x = 32
integer y = 16
integer width = 1349
integer weight = 400
string text = "생산 공정별 인건비 관리"
end type

type st_tips from w_inheritance`st_tips within w_mpworkmansalary_m
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance`pb_compute within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance`pb_close within w_mpworkmansalary_m
integer x = 4978
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

type pb_print from w_inheritance`pb_print within w_mpworkmansalary_m
integer x = 4581
integer taborder = 270
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
w_repsuper w_print
st_print   l_print

//if tab_1.selectedtab = 1 then
//	if cbx_5.checked = true then
		dw_1.dataobject = "d_mpworkman_ot_r"
//	else
		dw_1.dataobject = "d_mpworkman_r"
//	end if
	dw4.ShareData(dw_1)
	
	l_print.st_datawindow  = dw_1
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 근무신청서를 출력합니다." 
//else
//	l_print.st_datawindow  = tab_1.tabpage_2.dw_6
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 근무신청서를 출력합니다." 
//end if

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 280
end type

type pb_delete from w_inheritance`pb_delete within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 290
end type

type pb_insert from w_inheritance`pb_insert within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 310
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpworkmansalary_m
integer x = 4192
integer taborder = 300
end type

event pb_retrieve::clicked;string	ls_date, ls_area, ls_work

if dw_cond.accepttext( ) = -1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_date	= dw_cond.getitemstring(1, 'date')
ls_area	= dw_cond.getitemstring(1, 'area')
ls_work	= dw_cond.getitemstring(1, 'work')

idw_t1.reset()
if	idw_t1.retrieve(ls_date, ls_area, ls_work) = 0 then
//	messagebox("주위","생성된 자료가 없습니다.")
end if

idw_t2.reset()
if	idw_t2.retrieve(ls_date) = 0 then
//	messagebox("주위","생성된 자료가 없습니다.")
end if
end event

type gb_3 from w_inheritance`gb_3 within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 535
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpworkmansalary_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpworkmansalary_m
integer x = 4187
integer y = 0
integer width = 992
integer height = 228
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpworkmansalary_m
boolean visible = false
integer x = 4069
integer y = 80
integer width = 101
integer height = 100
integer taborder = 60
boolean vscrollbar = false
boolean livescroll = false
end type

type pb_excel from picturebutton within w_mpworkmansalary_m
event mousemove pbm_mousemove
integer x = 4384
integer y = 52
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

type dw_cond from datawindow within w_mpworkmansalary_m
integer x = 1403
integer y = 60
integer width = 2482
integer height = 148
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_mpworkmansalary_m_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//choose case dwo.name
//	case 'area'
//		this.setitem(1, 'work', '')
//		wf_set_dddw(data)
//end choose
end event

type tab_1 from tab within w_mpworkmansalary_m
integer x = 37
integer y = 232
integer width = 5143
integer height = 2232
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 116
integer width = 5106
integer height = 2100
long backcolor = 79741120
string text = "공정별 개별 인건비"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_2 st_2
st_1 st_1
em_meney em_meney
cb_2 cb_2
dw_t1 dw_t1
end type

on tabpage_1.create
this.st_2=create st_2
this.st_1=create st_1
this.em_meney=create em_meney
this.cb_2=create cb_2
this.dw_t1=create dw_t1
this.Control[]={this.st_2,&
this.st_1,&
this.em_meney,&
this.cb_2,&
this.dw_t1}
end on

on tabpage_1.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_meney)
destroy(this.cb_2)
destroy(this.dw_t1)
end on

type st_2 from statictext within tabpage_1
integer x = 1234
integer y = 64
integer width = 1184
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
long textcolor = 16711680
long backcolor = 79741120
string text = "(시급이 미 등록된 사람에게 적용되는 금액)"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 475
integer y = 64
integer width = 334
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
long backcolor = 79741120
string text = "기본시급 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_meney from editmask within tabpage_1
integer x = 818
integer y = 32
integer width = 402
integer height = 120
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
long textcolor = 33554432
string text = "8720"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within tabpage_1
integer y = 32
integer width = 402
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
string text = "인건비 생성"
end type

event clicked;string	ls_msg, ls_date, ls_sqlerrtext
string	ls_area_no,ls_area_name,ls_work_no,ls_work_nm,ls_work_no_insa,ls_user_id,ls_name_kor
dec		ldc_day_timewage,ldc_night_timewage, ldc_timewage, ldc_day_worktime, ldc_night_worktime, ldc_money
long		i, ll_cnt
datastore	lds_ds

if dw_cond.accepttext( ) = -1 then return

ls_date	= dw_cond.GetItemString(1, 'date')
ls_msg	= LeftA(ls_date,4) + '.' + MidA(ls_date,5,2) + '.' + RightA(ls_date,2) + "일의 생산 공정별 인건비를 생성하시겠습니까?"
if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return

select 
	count(*)
into
	:ll_cnt
from
	sfcworkman_timewage
where
	work_day = :ls_date
using sqlca;

if ll_cnt > 0 then
	ls_msg	= LeftA(ls_date,4) + '.' + MidA(ls_date,5,2) + '.' + RightA(ls_date,2) + "일의 생산 공정별 인건비가 존재합니다.~r~n삭제 후 재 생성하시겠습니까?"
	if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return
	delete from sfcworkman_timewage 
	where 
		work_day = :ls_date 
	using sqlca;
	
	if sqlca.sqlcode = -1 then 
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("Delete(sfcworkman_timewage)", ls_sqlerrtext)
		return
	end if
end if

pointer oldpointer 
oldpointer = SetPointer(HourGlass!)
post SetPointer(oldpointer)

lds_ds = create datastore
lds_ds.dataobject = 'd_mpworkmansalary_m_temp'
lds_ds.settransobject(sqlca)
ll_cnt = lds_ds.retrieve(ls_date)
if ll_cnt = 0 then
	messagebox("확인","생성 할 기초 자료가 없습니다.")
	rollback using sqlca;
	return 
end if

//기본 시급 확인
ldc_money	= dec(em_meney.text)

for i = 1 to ll_cnt
	ldc_timewage			= 0
	ldc_day_timewage		= 0
	ldc_night_timewage	= 0
	ls_area_no				= lds_ds.getitemstring(i, 'area_no')
	ls_area_name    		= lds_ds.getitemstring(i, 'area_name')
	ls_work_no        	= lds_ds.getitemstring(i, 'work_no')	
	ls_work_nm       		= lds_ds.getitemstring(i, 'work_nm')
	ls_work_no_insa		= lds_ds.getitemstring(i, 'work_no_insa')
	ls_user_id        	= lds_ds.getitemstring(i, 'user_id')  	
	ls_name_kor	     		= lds_ds.getitemstring(i, 'name_kor')
	ldc_timewage			= lds_ds.getitemdecimal(i, 'timewage')
	ldc_day_timewage   	= lds_ds.getitemdecimal(i, 'day_timewage')
	ldc_day_worktime   	= lds_ds.getitemdecimal(i, 'day_worktime')	
	ldc_night_timewage	= lds_ds.getitemdecimal(i, 'night_timewage')
	ldc_night_worktime	= lds_ds.getitemdecimal(i, 'night_worktime')	
	
	if ldc_timewage >= 1000000000 then
		rollback using sqlca;
		messagebox("","1,000,000,000원 이상인 금액이 존재합니다.")
		return
	end if
	
	//기준 시급이 0원이면 기본 시급을 적용
	if ldc_timewage = 0 then
		if ldc_day_worktime > 0 then
			ldc_day_timewage	= ldc_money
		end if
		if ldc_night_worktime > 0 then
			ldc_night_timewage	= ldc_money
		end if
		ldc_timewage = ldc_money
	end if
	
	//공정별 투입 근무자 시급 계산▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	insert into sfcworkman_timewage
		(
		 work_day
		,area_no
		,area_name
		,work_no
		,work_nm
		,work_no_insa		
		,user_id
		,user_nm
		,timewage
		,day_timewage
		,day_worktime
		,night_timewage
		,night_worktime
		,input_date
		,input_user
		,update_date
		,update_user)
	values
		(
		 :ls_date
		,:ls_area_no	     
		,:ls_area_name
		,:ls_work_no        
		,:ls_work_nm       
		,:ls_work_no_insa		
		,:ls_user_id          
		,:ls_name_kor	     
		,:ldc_timewage
		,:ldc_day_timewage   
		,:ldc_day_worktime
		,:ldc_night_timewage 
		,:ldc_night_worktime
		,getdate()
		,:gs_userid
		,getdate()
		,:gs_userid
		)	
	using sqlca;

	if sqlca.sqlcode = -1 then 
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("Insert(sfcworkman_timewage)", ls_sqlerrtext)
		return
	end if
	//공정별 투입 근무자 시급 계산▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
next

commit using sqlca;
MessageBox("완료","자료 생성을 완료했습니다.")
pb_retrieve.postevent('clicked')
end event

type dw_t1 from datawindow within tabpage_1
integer y = 176
integer width = 5102
integer height = 1916
integer taborder = 60
string title = "none"
string dataobject = "d_mpworkmansalary_m_01"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 116
integer width = 5106
integer height = 2100
long backcolor = 79741120
string text = "공정별 생산 내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_1 cb_1
dw_t2 dw_t2
end type

on tabpage_2.create
this.cb_1=create cb_1
this.dw_t2=create dw_t2
this.Control[]={this.cb_1,&
this.dw_t2}
end on

on tabpage_2.destroy
destroy(this.cb_1)
destroy(this.dw_t2)
end on

type cb_1 from commandbutton within tabpage_2
integer y = 32
integer width = 457
integer height = 120
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
string text = "생산 내역 생성"
end type

event clicked;string	ls_msg, ls_date, ls_sqlerrtext
long		i, ll_cnt

if dw_cond.accepttext( ) = -1 then return

ls_date	= dw_cond.GetItemString(1, 'date')
ls_msg	= LeftA(ls_date,4) + '.' + MidA(ls_date,5,2) + '.' + RightA(ls_date,2) + "일의 생산 내역을 생성하시겠습니까?"
if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return

select 
	count(*)
into
	:ll_cnt
from
	sfcworkman_prod_performance
where
	work_day = :ls_date
using sqlca;

if ll_cnt > 0 then
	ls_msg	= LeftA(ls_date,4) + '.' + MidA(ls_date,5,2) + '.' + RightA(ls_date,2) + "일의 생산 내역이가 존재합니다.~r~n삭제 후 재 생성하시겠습니까?"
	if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return
	delete from sfcworkman_prod_performance 
	where 
		work_day = :ls_date 
	using sqlca;
	
	if sqlca.sqlcode = -1 then 
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("Delete(sfcworkman_prod_performance)", ls_sqlerrtext)
		return
	end if
end if

pointer oldpointer 
oldpointer = SetPointer(HourGlass!)
post SetPointer(oldpointer)


insert into sfcworkman_prod_performance
	(
	 work_day		
	,seq			
	,order_no		
	,area_no			
	,area_name		
	,work_no		
	,work_nm		
	,item_no			
	,qa				
	,assembly		
	,assembly_qa 		
	,uom 			
	,overtime
	,plan_qty 		
	,make_qty		
	,plan_qty_convert	
	,make_qty_convert	
	,input_user 		
	,input_date 		
	,update_user 		
	,update_date 		
	)
select
	 convert(varchar(8), c.sfc_date, 112)		work_day
	,row_number() over (order by c.sfc_date)	seq
	,a.order_no		order_no
	,a.area_no 		area_no 
	,d.area_name 	area_name
	,a.wc_no  		work_no
	,b.work_name   work_nm
	,c.item_no		item_no
	,c.qa				qa
	,c.assembly		assembly
	,c.assembly_qa assembly_qa
	,c.uom			uom
	,(case when a.overtime = 'Y' then a.overtime else 'N' end) overtime
	,c.plan_qty		plan_qty
	,c.make_qty		make_qty
	,floor(DBO.UF_GETQTY(c.assembly, c.assembly_qa, c.uom, c.plan_qty)) plan_qty_convert
	,floor(DBO.UF_GETQTY(c.assembly, c.assembly_qa, c.uom, c.make_qty)) make_qty_convert
	,:gs_userid
	,getdate()
	,:gs_userid
	,getdate()	
from 
	mpsorder a	inner join wc b  	on a.wc_no      = b.work_no
				inner join sfcday c	on a.order_no	= c.mpsorder_order
				inner join area d 	on a.area_no 	= d.area_no 
where 
	convert(varchar(8), c.sfc_date, 112)	= :ls_date
using sqlca;


if sqlca.sqlcode = -1 then 
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("Insert(sfcworkman_prod_performance)", ls_sqlerrtext)
	return
end if

commit using sqlca;
MessageBox("완료","자료 생성을 완료했습니다.")
pb_retrieve.postevent('clicked')
end event

type dw_t2 from datawindow within tabpage_2
integer y = 176
integer width = 5102
integer height = 1916
integer taborder = 70
string title = "none"
string dataobject = "d_mpworkmansalary_m_02"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

