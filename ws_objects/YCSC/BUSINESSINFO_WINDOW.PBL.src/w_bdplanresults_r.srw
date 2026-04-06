$PBExportHeader$w_bdplanresults_r.srw
$PBExportComments$계획대비실적현황[2001/01/22,서재복]
forward
global type w_bdplanresults_r from w_inheritance
end type
type cb_3 from commandbutton within w_bdplanresults_r
end type
type tab_1 from tab within w_bdplanresults_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_month from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_month dw_month
end type
type tabpage_2 from userobject within tab_1
end type
type dw_year from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_year dw_year
end type
type tab_1 from tab within w_bdplanresults_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type em_date from editmask within w_bdplanresults_r
end type
type st_1 from statictext within w_bdplanresults_r
end type
type dw_monthp from datawindow within w_bdplanresults_r
end type
type dw_yearp from datawindow within w_bdplanresults_r
end type
end forward

global type w_bdplanresults_r from w_inheritance
integer x = 320
integer y = 552
integer width = 3035
integer height = 2204
string title = "계획대비실적현황(w_bdplanresults_r)"
boolean resizable = false
cb_3 cb_3
tab_1 tab_1
em_date em_date
st_1 st_1
dw_monthp dw_monthp
dw_yearp dw_yearp
end type
global w_bdplanresults_r w_bdplanresults_r

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

event open;call super::open;//dw_1.SetTransObject(SQLCA)
//dw_1.retrieve()
em_date.text = string(today(), "yyyy/mm/dd")
tab_1.tabpage_1.dw_month.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_year.SetTransObject(SQLCA)
dw_monthp.SetTransObject(SQLCA)
dw_yearp.SetTransObject(SQLCA)



end event

on w_bdplanresults_r.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.tab_1=create tab_1
this.em_date=create em_date
this.st_1=create st_1
this.dw_monthp=create dw_monthp
this.dw_yearp=create dw_yearp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.em_date
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_monthp
this.Control[iCurrent+6]=this.dw_yearp
end on

on w_bdplanresults_r.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.tab_1)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_monthp)
destroy(this.dw_yearp)
end on

type pb_save from w_inheritance`pb_save within w_bdplanresults_r
boolean visible = false
integer x = 2107
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_bdplanresults_r
boolean visible = false
integer x = 1829
integer y = 0
integer width = 119
integer height = 100
integer taborder = 50
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long ll_row
//string ls_bank_code
//
//ll_row = wf_rowfocuschange(dw_1,"N")
//if ll_row < 1 then
//	return
//end if
//dw_2.accepttext()
//ls_bank_code = this.object.bank_code[ll_row]
//dw_2.object.bank_code.protect = true
//if isnull(ls_bank_code) or ls_bank_code = "" then
//	dw_1.object.bank_code[ll_row] = is_bank_code
//	dw_1.object.bank_name[ll_row] = is_bank_name
//	dw_1.object.bank_id[ll_row] = is_bank_id
//else
//	dw_2.retrieve(ls_bank_code)
//end if
//

end event

type dw_2 from w_inheritance`dw_2 within w_bdplanresults_r
boolean visible = false
integer x = 1737
integer y = 0
integer width = 123
integer height = 88
integer taborder = 70
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_bdplanresults_r
integer y = 36
integer width = 1463
integer height = 164
integer textsize = -20
string text = "계획대비실적현황"
end type

type st_tips from w_inheritance`st_tips within w_bdplanresults_r
end type

type pb_compute from w_inheritance`pb_compute within w_bdplanresults_r
boolean visible = false
integer x = 1509
integer y = 8
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdplanresults_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_bdplanresults_r
integer x = 2743
integer y = 60
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdplanresults_r
integer x = 2551
integer y = 60
integer taborder = 130
end type

event pb_print::clicked;////출력양식을 정하여 만들어야 한다.
w_repsuper w_print
st_print lst_print
datawindow dw2, dw3, dw4
long ll_row
string ls_printdesc
int li_seqno

//Orientation(1: Landscape, 2: portrait)
//Paper.Size(9: A4, 12: B4)
//Zoom : 출력확대/축소
string ls_month, ls_year
ls_year = LeftA(em_date.text, 4)
ls_month = ls_year + RightA(em_date.text,2)

dw2 = dw_monthp
dw3 = dw_yearp
dw2.retrieve(ls_month)
dw3.retrieve(ls_year)

CHOOSE CASE tab_1.selectedtab
	CASE 1
//		ll_row = dw2.Retrieve(is_saleno)
		ll_row = dw2.rowcount()
		if ll_row > 0 then
	
			gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

			dw2.Modify(gs_print_control)

			lst_print.st_datawindow = dw2
			lst_print.st_print_sheet = " 프린트용지 : A4"
			ls_printdesc = " 이 프로그램은 월간계획대비실적현황을 프린트합니다." 
			lst_print.st_print_desc = ls_printdesc
			//lst_print.name = 'd_hcmplan_p1'	//dw2.DataObject
			
			opensheetwithparm(w_print, lst_print, parentwindow(), 5, Original!)
		else
			beep(1)
			messagebox("실행오류", "출력할 내용이 없습니다", stopsign!)
		end if
	case 2
//		ll_row = dw3.Retrieve(is_saleno)
		ll_row = dw3.rowcount()
		if ll_row > 0 then
	
			gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

			dw3.Modify(gs_print_control)

			lst_print.st_datawindow = dw3
			lst_print.st_print_sheet = " 프린트용지 : A4"
			ls_printdesc = " 이 프로그램은 년간계획대비실적현황을 프린트합니다."
			lst_print.st_print_desc =  ls_printdesc
			//lst_print.name = 'd_hcmplan_p2'	//dw2.DataObject

			opensheetwithparm(w_print, lst_print, parentwindow(), 5, Original!)
		else
			beep(1)
			messagebox("실행오류", "출력할 내용이 없습니다", stopsign!)
		end if

END CHOOSE

end event

type pb_cancel from w_inheritance`pb_cancel within w_bdplanresults_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_bdplanresults_r
boolean visible = false
integer x = 2034
integer y = 64
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_bdplanresults_r
boolean visible = false
integer y = 40
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_bdplanresults_r
integer x = 2359
integer y = 60
integer taborder = 160
end type

event pb_retrieve::clicked;string ls_month, ls_year
ls_year = LeftA(em_date.text, 4)
ls_month = ls_year + RightA(em_date.text,2)

tab_1.tabpage_1.dw_month.retrieve(ls_month)
tab_1.tabpage_2.dw_year.retrieve(ls_year)

//tab_1.tabpage_1.dw_month.sharedata(dw_monthp)
//tab_1.tabpage_2.dw_year.sharedata(dw_yearp)
end event

type gb_3 from w_inheritance`gb_3 within w_bdplanresults_r
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_bdplanresults_r
integer x = 27
integer width = 2875
integer height = 1384
integer taborder = 100
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_bdplanresults_r
integer x = 2322
integer y = 20
integer width = 635
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_bdplanresults_r
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type tab_1 from tab within w_bdplanresults_r
integer x = 27
integer y = 252
integer width = 2930
integer height = 1824
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean raggedright = true
boolean boldselectedtext = true
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
integer y = 112
integer width = 2894
integer height = 1696
long backcolor = 79741120
string text = "월간영업실적"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CrossTab!"
long picturemaskcolor = 553648127
dw_month dw_month
end type

on tabpage_1.create
this.dw_month=create dw_month
this.Control[]={this.dw_month}
end on

on tabpage_1.destroy
destroy(this.dw_month)
end on

type dw_month from datawindow within tabpage_1
integer x = 27
integer y = 36
integer width = 2839
integer height = 1636
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_bdplanresults_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2894
integer height = 1696
long backcolor = 79741120
string text = "년간영업실적"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Preferences!"
long picturemaskcolor = 553648127
dw_year dw_year
end type

on tabpage_2.create
this.dw_year=create dw_year
this.Control[]={this.dw_year}
end on

on tabpage_2.destroy
destroy(this.dw_year)
end on

type dw_year from datawindow within tabpage_2
integer x = 27
integer y = 36
integer width = 2839
integer height = 1636
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_bdplanresults_r2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_date from editmask within w_bdplanresults_r
integer x = 1920
integer y = 252
integer width = 311
integer height = 88
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

event rbuttondown;string ls_date

openWithParm(w_calendar, ls_date)
ls_date = message.stringparm
if ls_date <> 'N' then
	em_date.text = string(date(ls_date))
end if

end event

type st_1 from statictext within w_bdplanresults_r
integer x = 1614
integer y = 268
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "조회년월:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_monthp from datawindow within w_bdplanresults_r
boolean visible = false
integer x = 1664
integer y = 56
integer width = 142
integer height = 96
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_bdplanresults_p"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_yearp from datawindow within w_bdplanresults_r
boolean visible = false
integer x = 1678
integer y = 160
integer width = 137
integer height = 92
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_bdplanresults_p2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

