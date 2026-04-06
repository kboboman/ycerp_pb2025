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
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
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
type st_1 from statictext within w_mpprocess_r
end type
type em_2 from editmask within w_mpprocess_r
end type
type dw_area from datawindow within w_mpprocess_r
end type
type st_2 from statictext within w_mpprocess_r
end type
end forward

global type w_mpprocess_r from w_inheritance
integer width = 4457
integer height = 2452
string title = "작업진척/작업자투입 조회(w_mpprocess_r)"
windowstate windowstate = normal!
tab_1 tab_1
em_1 em_1
st_1 st_1
em_2 em_2
dw_area dw_area
st_2 st_2
end type
global w_mpprocess_r w_mpprocess_r

type variables
DataWindow      dw3, dw4, dw5
DataWindowChild idwc_wc
end variables

on w_mpprocess_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_2
end on

on w_mpprocess_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

date ld_date

tab_1.tabpage_1.dw_3.settransobject(sqlca)
tab_1.tabpage_2.dw_4.settransobject(sqlca)
tab_1.tabpage_3.dw_5.settransobject(sqlca)

//dw_1.insertrow(0)
dw_1.insertrow(1)
dw_1.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no','%')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()
dw_1.object.wc_no[1] = "%"


ld_date   = DATE(wf_today())
em_1.text = string( RelativeDate( ld_date, -3 ), 'yyyy/mm/dd')
em_2.text = string( RelativeDate( ld_date,  3 ), 'yyyy/mm/dd')
tab_1.SelectedTab = 2

// area 추가 2003/02/26
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26

end event

event resize;call super::resize;//

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_3.dw_5

tab_1.width  = this.width  - 100
tab_1.height = this.height - 376

dw3.width  = this.width  - 160
dw3.height = this.height - 528

dw4.width  = dw3.width
dw4.height = dw3.height

dw5.width  = dw3.width
dw5.height = dw3.height
end event

type pb_save from w_inheritance`pb_save within w_mpprocess_r
boolean visible = false
integer x = 3072
end type

type dw_1 from w_inheritance`dw_1 within w_mpprocess_r
integer x = 2043
integer y = 92
integer width = 827
integer height = 84
integer taborder = 70
string dataobject = "d_whwc_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpprocess_r
boolean visible = false
integer x = 1646
integer y = 60
integer width = 105
integer height = 80
integer taborder = 80
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
integer x = 3781
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date   ld_start, ld_end 
string ls_area,  ls_wcno

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

dw_1.accepttext()
ls_area  = dw_area.object.area[1]
ls_wcno  = trim(dw_1.object.wc_no[1])

if ls_wcno = "" or isnull(ls_wcno) then
	ls_wcno = "%"
end if

tab_1.tabpage_1.dw_3.retrieve( ls_wcno, ld_start, ld_end, ls_area )
tab_1.tabpage_2.dw_4.retrieve( ls_area, ls_wcno, em_1.text, em_2.text )
tab_1.tabpage_3.dw_5.retrieve( ls_wcno, ld_start, ld_end, ls_area )


//
//
//string ls_area,  ls_wcno
//
//dw_1.accepttext()
//ls_area  = dw_area.object.area[1]
//
//if cbx_all.checked = true then
//	ls_wcno = "%"
//	tab_1.tabpage_2.dw_4.retrieve( ls_area, ls_wcno, em_1.text, em_2.text )
//else
//	ls_wcno  = trim(dw_1.object.wc_no[1])
//	tab_1.tabpage_2.dw_4.retrieve( ls_area, ls_wcno, em_1.text, em_2.text )
//end if
//
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
integer x = 1312
integer y = 12
integer width = 2423
integer height = 204
integer taborder = 110
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "조회조건"
end type

type gb_1 from w_inheritance`gb_1 within w_mpprocess_r
integer x = 3749
integer width = 645
integer taborder = 40
integer weight = 400
end type

type tab_1 from tab within w_mpprocess_r
integer x = 37
integer y = 236
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

type tabpage_1 from userobject within tab_1
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
integer y = 16
integer width = 4297
integer height = 1916
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpworkcapa_t"
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
dw_4 dw_4
end type

on tabpage_2.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_2.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_2
integer x = 5
integer y = 16
integer width = 4297
integer height = 1916
integer taborder = 40
string title = "none"
string dataobject = "d_mpsfcdayman_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
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

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4320
integer height = 1940
long backcolor = 79741120
string text = "작업장현황"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Table!"
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
integer y = 16
integer width = 4297
integer height = 1916
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpprocess_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_mpprocess_r
integer x = 2889
integer y = 84
integer width = 370
integer height = 84
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_mpprocess_r
integer x = 3269
integer y = 80
integer width = 55
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_2 from editmask within w_mpprocess_r
integer x = 3328
integer y = 84
integer width = 370
integer height = 84
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_mpprocess_r
integer x = 1559
integer y = 92
integer width = 503
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_2 from statictext within w_mpprocess_r
integer x = 1344
integer y = 92
integer width = 210
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

