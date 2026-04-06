$PBExportHeader$w_calendar.srw
$PBExportComments$달력
forward
global type w_calendar from window
end type
type ddlb_2 from dropdownlistbox within w_calendar
end type
type ddlb_1 from dropdownlistbox within w_calendar
end type
type cb_2 from commandbutton within w_calendar
end type
type st_5 from statictext within w_calendar
end type
type st_4 from statictext within w_calendar
end type
type pb_2 from picturebutton within w_calendar
end type
type pb_1 from picturebutton within w_calendar
end type
type st_tips from statictext within w_calendar
end type
type dw_1 from datawindow within w_calendar
end type
type em_date from editmask within w_calendar
end type
type cb_1 from commandbutton within w_calendar
end type
end forward

global type w_calendar from window
integer x = 690
integer y = 364
integer width = 827
integer height = 936
boolean titlebar = true
string title = "     달력(해당일자 더블클릭)"
windowtype windowtype = response!
long backcolor = 79741120
boolean righttoleft = true
ddlb_2 ddlb_2
ddlb_1 ddlb_1
cb_2 cb_2
st_5 st_5
st_4 st_4
pb_2 pb_2
pb_1 pb_1
st_tips st_tips
dw_1 dw_1
em_date em_date
cb_1 cb_1
end type
global w_calendar w_calendar

type variables
date idt_day

end variables

forward prototypes
public subroutine cal_output ()
end prototypes

public subroutine cal_output ();int li_currow = 1, li_count, li_day, li_month
date ld_date

ld_date = idt_day
li_month = month(idt_day)
li_day = day(idt_day)

//달력 초기화 
dw_1.reset()
dw_1.InsertRow(0)

idt_day = date(string(year(idt_day)) + "/" + string(month(idt_day)) + "/" + "01")
ddlb_1.text = string(year(idt_day)) 
ddlb_2.text = string(month(idt_day)) 

do while li_month = month( idt_day )
	if daynumber( idt_day ) = 1 and day(idt_day) > 1 then
		li_currow = dw_1.insertRow(0)
	end if
	
	if day(idt_day) = li_day then dw_1.setitem(li_currow, daynumber(idt_day) + 7, 'Y')
	
	dw_1.setitem(li_currow, daynumber(idt_day), string(Day(idt_day)))
	idt_day = relativedate(idt_day, 1)
loop

idt_day = ld_date
end subroutine

on w_calendar.create
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.st_5=create st_5
this.st_4=create st_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_tips=create st_tips
this.dw_1=create dw_1
this.em_date=create em_date
this.cb_1=create cb_1
this.Control[]={this.ddlb_2,&
this.ddlb_1,&
this.cb_2,&
this.st_5,&
this.st_4,&
this.pb_2,&
this.pb_1,&
this.st_tips,&
this.dw_1,&
this.em_date,&
this.cb_1}
end on

on w_calendar.destroy
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_tips)
destroy(this.dw_1)
destroy(this.em_date)
destroy(this.cb_1)
end on

event open;
Long ll_maxX,ll_maxY,ll_X,ll_Y
Environment le_env

Getenvironment(le_env)

ll_maxX = PixelsToUnits(le_env.ScreenWidth, XPixelsToUnits!)
ll_maxY = PixelsToUnits(le_env.ScreenHeight, YPixelsToUnits!)
ll_X = PointerX()
ll_Y = PointerY()

IF ll_x < 0 THEN ll_x = 0
IF ll_x + Width > ll_maxX THEN ll_x = ll_maxX - Width

IF ll_y < 0 THEN ll_y = 0
IF ll_y + Height > ll_maxY THEN ll_y = ll_maxY - Height

Move(ll_x,ll_y)
int li_int
for li_int = year(today()) - 5 to year(today()) + 5
	ddlb_1.InsertItem(string(li_int), li_int - (year(today()) - 6))
next
for li_int = 1 to 12
	ddlb_2.InsertItem(string(li_int), li_int)
next
//idt_day = date(gf_today())
//em_date.text = string(gf_today())

idt_day = date(string(today(), "yyyy/mm/dd"))
em_date.text = string(today(), "yyyy/mm/dd")

cal_output()

end event

type ddlb_2 from dropdownlistbox within w_calendar
integer x = 434
integer y = 8
integer width = 183
integer height = 800
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
idt_day = date(ddlb_1.text + "/" + ddlb_2.text + "/" + "01")

cal_output()
end event

type ddlb_1 from dropdownlistbox within w_calendar
integer x = 174
integer y = 8
integer width = 256
integer height = 800
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
idt_day = date(ddlb_1.text + "/" + ddlb_2.text + "/" + "01")

cal_output()
end event

type cb_2 from commandbutton within w_calendar
integer x = 631
integer y = 744
integer width = 165
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean cancel = true
end type

event clicked;	closewithreturn(parent, em_date.text)

end event

type st_5 from statictext within w_calendar
boolean visible = false
integer x = 795
integer y = 1460
integer width = 549
integer height = 108
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_calendar
boolean visible = false
integer x = 64
integer y = 1452
integer width = 517
integer height = 108
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_calendar
event mousemove pbm_mousemove
integer x = 631
integer y = 12
integer width = 165
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다음"
vtextalign vtextalign = vcenter!
end type

event mousemove;//f_usetips(st_tips, '월 증가', Parent, This.x, This.y + This.Height + 19)
end event

event clicked;int check_month

check_month = month(idt_day)

IF check_month = 12 then
	idt_day = date(string(year(idt_day) + 1) + "/" + "01" + "/" + "01")
ELSE
   idt_day = date(string(year(idt_day)) + "/" + string(month(idt_day) + 1) + "/" + "01")
END IF

cal_output()
end event

type pb_1 from picturebutton within w_calendar
event mousemove pbm_mousemove
integer x = 5
integer y = 12
integer width = 160
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이전"
vtextalign vtextalign = vcenter!
end type

event mousemove;//f_usetips(st_tips, '월 감소', Parent, This.x, This.y + This.Height + 19)
end event

event clicked;int check_month

check_month = month(idt_day)

IF check_month = 1 then
   idt_day = date(string(year(idt_day) - 1) + "/" + "12" + "/" + "01")
ELSE
	idt_day = date(string(year(idt_day)) + "/" + string(month(idt_day) - 1) + "/" + "01")
END IF

cal_output()
end event

type st_tips from statictext within w_calendar
boolean visible = false
integer x = 1915
integer y = 84
integer width = 302
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_calendar
integer x = 5
integer y = 100
integer width = 791
integer height = 636
integer taborder = 10
string dataobject = "d_calendar_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string ls_date, ls_column

if row = 0 then return

ls_column = dwo.name
if ls_column = 'datawindow' then return
ls_date = this.getitemstring(row, ls_column)

if isnull(ls_date) then
//	messagebox('선택오류','다시 선택하여 주십시요!',exclamation!)
	return
else
	ls_date = em_date.text
	closewithreturn(parent, ls_date)
end if
end event

event clicked;string ls_getdaynumber, ls_getdata, ls_passday
long ll_row

if row = 0 then return
if dwo.name = 'datawindow' then return
this.setredraw(false)
ls_getdata = dwo.name

ls_getdaynumber = dw_1.getitemstring(row, ls_getdata)

if not isnull(ls_getdaynumber) then
	ls_passday = string(string(year(idt_day)) + "/" + string(month(idt_day)) + "/" + ls_getdaynumber)
	idt_day = date(ls_passday)
	
	em_date.text = string(idt_day,'YYYY/MM/DD')

	for ll_row = 1 to this.rowcount()
		dw_1.setitem(ll_row, "flag_sun", "N")
		dw_1.setitem(ll_row, "flag_mon", "N")
		dw_1.setitem(ll_row, "flag_tue", "N")
		dw_1.setitem(ll_row, "flag_wed", "N")
		dw_1.setitem(ll_row, "flag_thu", "N")
		dw_1.setitem(ll_row, "flag_fri", "N")
		dw_1.setitem(ll_row, "flag_sat", "N")
	next

	this.setitem(row, daynumber(idt_day) + 7, 'Y')
end if
this.setredraw(true)


end event

type em_date from editmask within w_calendar
integer x = 219
integer y = 748
integer width = 361
integer height = 68
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 65535
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy/mm/dd"
end type

type cb_1 from commandbutton within w_calendar
integer x = 5
integer y = 744
integer width = 165
integer height = 88
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;closewithreturn(parent, 'N')


end event

