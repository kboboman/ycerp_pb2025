$PBExportHeader$w_mpprocess_r.srw
$PBExportComments$작업진척조회(1998/05/21,곽용덕)
forward 
global type w_mpprocess_r from w_inheritance
end type
type tab_1 from tab within w_mpprocess_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type cbx_1 from checkbox within tabpage_2
end type
type cbx_secom from checkbox within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type dw_7 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cbx_1 cbx_1
cbx_secom cbx_secom
dw_4 dw_4
dw_6 dw_6
dw_7 dw_7
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
end type
type tab_1 from tab within w_mpprocess_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type em_1 from editmask within w_mpprocess_r
end type
type em_2 from editmask within w_mpprocess_r
end type
type dw_area from datawindow within w_mpprocess_r
end type
type st_2 from statictext within w_mpprocess_r
end type
type st_3 from statictext within w_mpprocess_r
end type
type pb_excel from picturebutton within w_mpprocess_r
end type
end forward

global type w_mpprocess_r from w_inheritance
integer width = 4462
integer height = 2452
string title = "작업진척/작업자투입 조회(w_mpprocess_r)"
tab_1 tab_1
em_1 em_1
em_2 em_2
dw_area dw_area
st_2 st_2
st_3 st_3
pb_excel pb_excel
end type
global w_mpprocess_r w_mpprocess_r

type variables
DataWindow      dw3, dw4, dw5, dw6, dw7
DataWindowChild idwc_wc
end variables

forward prototypes
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
end prototypes

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

on w_mpprocess_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_2=create st_2
this.st_3=create st_3
this.pb_excel=create pb_excel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.pb_excel
end on

on w_mpprocess_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.pb_excel)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

date ld_date

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
if gs_area = "S0001" OR gs_area = "T0001" then
	dw_area.object.area[1] = gs_area
else
	dw_area.object.area[1] = "S0001" //gs_area
end if
dw_area.accepttext()


dw_1.insertrow(1)
dw_1.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no','%')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()
dw_1.object.wc_no[1] = "%"

tab_1.tabpage_1.dw_3.settransobject(sqlca)
tab_1.tabpage_2.dw_4.settransobject(sqlca)
tab_1.tabpage_3.dw_5.settransobject(sqlca)
tab_1.tabpage_2.dw_6.settransobject(sqlca)
tab_1.tabpage_2.dw_7.settransobject(sqlca)


ld_date   = DATE(wf_today())
em_1.text = string( RelativeDate( ld_date, -3 ), 'yyyy/mm/dd')
em_2.text = string( RelativeDate( ld_date,  3 ), 'yyyy/mm/dd')

//tab_1.SelectedTab = 2


end event

event resize;call super::resize;//

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_3.dw_5
dw6 = tab_1.tabpage_2.dw_6
dw7 = tab_1.tabpage_2.dw_7

tab_1.width  = newwidth  - 64
tab_1.height = newheight - 280

dw3.width  = newwidth  - 124
dw3.height = newheight - 508

dw4.width  = dw3.width
dw4.height = dw3.height

dw5.width  = dw3.width
dw5.height = dw3.height

dw6.x      = dw4.x
dw6.y      = dw4.y
dw6.width  = dw4.width
dw6.height = dw4.height * 0.7
dw6.visible= false

dw7.x      = dw4.x
dw7.y      = dw6.y + dw6.height
dw7.width  = dw4.width
dw7.height = dw4.height * 0.3
dw7.visible= false

end event

type pb_save from w_inheritance`pb_save within w_mpprocess_r
boolean visible = false
integer x = 3072
end type

type dw_1 from w_inheritance`dw_1 within w_mpprocess_r
integer x = 2400
integer y = 128
integer width = 613
integer height = 80
integer taborder = 70
string dataobject = "d_whwc_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_mpprocess_r
integer width = 1257
string text = "작업진척/작업자 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpprocess_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpprocess_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpprocess_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpprocess_r
integer x = 4169
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpprocess_r
integer x = 3973
integer taborder = 140
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

int    li_index

choose case tab_1.SelectedTab
	case 1
		l_print.st_datawindow  = dw3
		gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
		
	case 2
		l_print.st_datawindow  = dw4
		gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
		
	case 3
		l_print.st_datawindow  = dw5
		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=78'
end choose

l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 '작업진척/작업자 조회'을 출력합니다." 
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=82'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 8-A3, 9-A4, 12-B4
// gs_print_control = 'DataWindow.Print.Orientation=2 Datawindow.Zoom=100'

OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_mpprocess_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpprocess_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpprocess_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpprocess_r
integer x = 3579
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date   ld_start, ld_end 
string ls_area,  ls_com, ls_wcno, ls_sdate, ls_edate

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

dw_area.accepttext()
dw_1.accepttext()

ls_area  = dw_area.object.area[1]
ls_wcno  = trim(dw_1.object.wc_no[1])

if isnull(ls_wcno) OR ls_wcno = "" then ls_wcno = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

choose case tab_1.selectedtab
	case 1	// 작업장 현황
		tab_1.tabpage_1.dw_3.retrieve( ls_wcno, ld_start, ld_end, ls_area )
		if tab_1.tabpage_1.dw_3.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
		else			
			MessageBox("확인","조회완료")
		end if
		
	case 2	// 작업자투입현황
		if tab_1.tabpage_2.cbx_secom.checked = true then
			tab_1.tabpage_2.cbx_secom.TriggerEvent( clicked! )
		else
			tab_1.tabpage_2.dw_4.retrieve( ls_area, ls_wcno, ls_sdate, ls_edate )
			if tab_1.tabpage_2.dw_4.rowcount() < 1 then
				MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
			else			
				MessageBox("확인","조회완료")
			end if
		end if

	case 3	// 작업장 CAPA
		tab_1.tabpage_3.dw_5.retrieve( ls_wcno, ld_start, ld_end, ls_area )
		if tab_1.tabpage_3.dw_5.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
		else			
			MessageBox("확인","조회완료")
		end if
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpprocess_r
boolean visible = false
integer x = 1641
integer y = 20
integer width = 110
integer height = 124
integer taborder = 100
end type

type gb_2 from w_inheritance`gb_2 within w_mpprocess_r
integer x = 2153
integer y = 12
integer width = 1376
integer height = 208
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpprocess_r
integer x = 3547
integer width = 846
integer height = 208
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpprocess_r
boolean visible = false
integer x = 1646
integer y = 60
integer width = 105
integer height = 80
integer taborder = 80
end type

type tab_1 from tab within w_mpprocess_r
integer x = 37
integer y = 248
integer width = 4357
integer height = 2068
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
alignment alignment = right!
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
pb_retrieve.postevent( clicked! )

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4320
integer height = 1940
long backcolor = 79741120
string text = "작업장 현황"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Table!"
long picturemaskcolor = 553648127
dw_3 dw_3
end type

on tabpage_1.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_1.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_1
integer x = 5
integer y = 92
integer width = 4297
integer height = 1840
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpprocess_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4320
integer height = 1940
long backcolor = 79741120
string text = "작업자투입현황"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Custom026!"
long picturemaskcolor = 536870912
cbx_1 cbx_1
cbx_secom cbx_secom
dw_4 dw_4
dw_6 dw_6
dw_7 dw_7
end type

on tabpage_2.create
this.cbx_1=create cbx_1
this.cbx_secom=create cbx_secom
this.dw_4=create dw_4
this.dw_6=create dw_6
this.dw_7=create dw_7
this.Control[]={this.cbx_1,&
this.cbx_secom,&
this.dw_4,&
this.dw_6,&
this.dw_7}
end on

on tabpage_2.destroy
destroy(this.cbx_1)
destroy(this.cbx_secom)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.dw_7)
end on

type cbx_1 from checkbox within tabpage_2
integer x = 809
integer y = 20
integer width = 571
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전월 1일~~말일"
end type

event clicked;// 전월 1일~말일
string ls_lastday, ls_sdate, ls_today, ls_edate		// 전월말일, 시작일, 현재일, 마지막일

SELECT top 1 convert(char(10), dateadd(day, - datepart(dd, getdate()), getdate() ), 111)
     , convert(char(10), dateadd(dd, -1 * day(getdate())+1, getdate()),111)
     , convert(char(10), getdate(), 111)
     , convert(char(10), dateadd(mm, 1, getdate()) - day(getdate()) ,111)
  INTO :ls_lastday, :ls_sdate, :ls_today, :ls_edate
  FROM LOGIN;

if this.checked = true then
	em_1.text = LeftA(ls_lastday,8) + "01"	// 시작일
	em_2.text = ls_lastday	// 전월말일
else
	em_1.text = ls_sdate		// 시작일
	em_2.text = ls_edate  	// 마지막일
end if

end event

type cbx_secom from checkbox within tabpage_2
integer x = 32
integer y = 20
integer width = 594
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "근태현황(세콤)"
end type

event clicked;//
string ls_area, ls_com, ls_sdate, ls_edate

dw_area.accepttext()

ls_area  = dw_area.object.area[1]
choose case ls_area
	case "T0001"
		ls_com = "06"
	case else
		ls_com = "01"
end choose

ls_sdate = gf_replaceall(em_1.text,"/","")
ls_edate = gf_replaceall(em_2.text,"/","")

if this.checked = true then
	dw_6.reset() ; dw_7.reset()
	
	dw_6.visible = true
	dw_7.visible = true
	dw_6.retrieve( ls_com, ls_sdate, ls_edate )
	if dw_6.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	else
		MessageBox("확인","조회완료")
	end if
else
	dw_6.visible = false
	dw_7.visible = false
end if

end event

type dw_4 from datawindow within tabpage_2
integer x = 5
integer y = 92
integer width = 4297
integer height = 1840
integer taborder = 40
string title = "none"
string dataobject = "d_mpsfcdayman_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_col, ls_text

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

choose case dwo.name
	case "wc_no"
		ls_text = string(this.object.wc_name[row])
end choose

dw_1.object.wc_no[1] = ls_text



end event

type dw_6 from datawindow within tabpage_2
integer x = 558
integer y = 348
integer width = 3223
integer height = 1316
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpprocess_ct"
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

///////////////////////////////////
// 상세조회
///////////////////////////////////
string  ls_area, ls_colx, ls_team, ls_com, ls_sdate, ls_edate, ls_gtcd, ls_gtdt, ls_gtnm, ls_value
long    ll_seqno, ll_row, ll_col, ll_dw8cnt, ll_found
integer li_year

debugbreak()

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )

// gt_dt 일자
// dt_nm 요일
// gt_nm 근태명
// gtime 근무시간
//
// gt_day

dw_7.reset()

if ll_col < 5 then
	ls_value  = string( this.GetItemString( ll_row, ll_col) )
else
	ls_value  = string( this.GetItemNumber( ll_row, ll_col) )
end if
if isnull(ls_value) OR ls_value = "" then RETURN

// 작업장 이전컬럼 클릭시 
if ll_col   < 5 then 		// @team_nm
	ls_team  = "%"			// 전체
else
	ls_team  = wf_crosstab_title( this, ll_row, ll_col )
	choose case ls_team
		case "1 성형"
			ls_team = "성형"
		case "2 유압"
			ls_team = "유압"  
		case "3 절곡"
			ls_team = "절곡"   
		case "4 도장"
			ls_team = "도장"  
		case "5 YSP"
			ls_team = "YSP"   
		case "6 출고"
			ls_team = "출고"   
	end choose
end if
ls_gtdt   = dw6.object.gt_dt[row]
ls_gtnm   = dw6.object.gt_nm[row]

// 사업장(회사)
dw_area.accepttext()

ls_area  = dw_area.object.area[1]
choose case ls_area
	case "T0001"
		ls_com = "06"		// 화성
	case else
		ls_com = "01"		
end choose

ls_sdate = LeftA(gf_replaceall(em_1.text,"/",""),6) + ls_gtdt
ls_edate = LeftA(gf_replaceall(em_2.text,"/",""),6) + ls_gtdt

SELECT gt_cd INTO :ls_gtcd FROM ycerp.dbo.gt_item WHERE acc_cd = :ls_com AND gt_nm = :ls_gtnm;
if isnull(ls_gtcd) OR ls_gtcd = "" then RETURN
							
dw_7.retrieve( ls_com, ls_team, ls_gtcd, ls_sdate, ls_edate )




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

type dw_7 from datawindow within tabpage_2
integer x = 987
integer y = 624
integer width = 2459
integer height = 680
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpprocess_ctman"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4320
integer height = 1940
long backcolor = 79741120
string text = "작업장 CAPA"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Graph!"
long picturemaskcolor = 553648127
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
integer x = 5
integer y = 92
integer width = 4297
integer height = 1840
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpworkcapa_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_mpprocess_r
integer x = 3058
integer y = 48
integer width = 370
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
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

type em_2 from editmask within w_mpprocess_r
integer x = 3122
integer y = 128
integer width = 370
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
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

type dw_area from datawindow within w_mpprocess_r
integer x = 2405
integer y = 48
integer width = 526
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_2 from statictext within w_mpprocess_r
integer x = 2190
integer y = 48
integer width = 210
integer height = 72
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

type st_3 from statictext within w_mpprocess_r
integer x = 2190
integer y = 132
integer width = 210
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_excel from picturebutton within w_mpprocess_r
event mousemove pbm_mousemove
integer x = 3771
integer y = 52
integer width = 187
integer height = 144
integer taborder = 10
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
		if tab_1.tabpage_2.cbx_secom.checked = true then
			dwxls  = dw4
		else			
			dwxls  = dw6
		end if
	case 3
		MessageBox("확인","지원하지 않습니다.")
		RETURN
end choose

if dwxls.rowcount() < 1 then return

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, &
	                        "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
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

