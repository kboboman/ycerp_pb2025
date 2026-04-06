$PBExportHeader$w_calendar2.srw
$PBExportComments$달력 [2000/11/30,서재복]
forward 
global type w_calendar2 from window
end type
type em_edate from editmask within w_calendar2
end type
type cb_2 from commandbutton within w_calendar2
end type
type cb_1 from commandbutton within w_calendar2
end type
type dw_2 from datawindow within w_calendar2
end type
type pb_4 from picturebutton within w_calendar2
end type
type pb_3 from picturebutton within w_calendar2
end type
type st_1 from statictext within w_calendar2
end type
type ddlb_2 from dropdownlistbox within w_calendar2
end type
type ddlb_1 from dropdownlistbox within w_calendar2
end type
type st_5 from statictext within w_calendar2
end type
type st_4 from statictext within w_calendar2
end type
type pb_2 from picturebutton within w_calendar2
end type
type pb_1 from picturebutton within w_calendar2
end type
type st_tips from statictext within w_calendar2
end type
type dw_1 from datawindow within w_calendar2
end type
type em_sdate from editmask within w_calendar2
end type
type p_2 from picture within w_calendar2
end type
type p_1 from picture within w_calendar2
end type
type ddlb_3 from dropdownlistbox within w_calendar2
end type
type ddlb_4 from dropdownlistbox within w_calendar2
end type
end forward

global type w_calendar2 from window
integer x = 690
integer y = 364
integer width = 1591
integer height = 964
boolean titlebar = true
string title = "달력(w_calendar)"
windowtype windowtype = response!
long backcolor = 15780518
boolean clientedge = true
em_edate em_edate
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
pb_4 pb_4
pb_3 pb_3
st_1 st_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
st_5 st_5
st_4 st_4
pb_2 pb_2
pb_1 pb_1
st_tips st_tips
dw_1 dw_1
em_sdate em_sdate
p_2 p_2
p_1 p_1
ddlb_3 ddlb_3
ddlb_4 ddlb_4
end type
global w_calendar2 w_calendar2

type variables
date idt_day, idt_sday, idt_eday
gs_calendar istr_calendar

end variables

forward prototypes
public subroutine cal_output ()
public subroutine calc_output1 ()
public subroutine calc_output2 ()
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

public subroutine calc_output1 ();//
int  li_currow = 1, li_count, li_day, li_month
date ld_date

ld_date  = idt_sday
li_month = month(idt_sday)
li_day   = day(idt_sday)

// 달력 초기화 
dw_1.reset()
dw_1.InsertRow(0)

idt_sday = date(string(year(idt_sday)) + "/" + string(month(idt_sday)) + "/" + "01")
ddlb_1.text = string(year(idt_sday)) 
ddlb_2.text = string(month(idt_sday)) 

do while li_month = month( idt_sday )
	if daynumber( idt_sday ) = 1 and day(idt_sday) > 1 then
		li_currow = dw_1.insertRow(0)
	end if
	
	if day(idt_sday) = li_day then dw_1.setitem(li_currow, daynumber(idt_sday) + 7, 'Y')
	
	dw_1.setitem(li_currow, daynumber(idt_sday), string(Day(idt_sday)))
	idt_sday = relativedate(idt_sday, 1)
loop

idt_sday = ld_date

end subroutine

public subroutine calc_output2 ();//
int  li_currow = 1, li_count, li_day, li_month
date ld_date

ld_date  = idt_eday
li_month = month(idt_eday)
li_day   = day(idt_eday)

// 달력 초기화 
dw_2.reset()
dw_2.InsertRow(0)

idt_eday    = date(string(year(idt_eday)) + "/" + string(month(idt_eday)) + "/" + "01")
ddlb_3.text = string(year(idt_eday)) 
ddlb_4.text = string(month(idt_eday)) 

do while li_month = month( idt_eday )
	if daynumber( idt_eday ) = 1 and day(idt_eday) > 1 then
		li_currow = dw_2.insertRow(0)
	end if
	
	if day(idt_eday) = li_day then dw_2.setitem(li_currow, daynumber(idt_eday) + 7, 'Y')
	
	dw_2.setitem(li_currow, daynumber(idt_eday), string(Day(idt_eday)))
	idt_eday = relativedate(idt_eday, 1)
loop

idt_eday = ld_date

end subroutine

on w_calendar2.create
this.em_edate=create em_edate
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.st_5=create st_5
this.st_4=create st_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_tips=create st_tips
this.dw_1=create dw_1
this.em_sdate=create em_sdate
this.p_2=create p_2
this.p_1=create p_1
this.ddlb_3=create ddlb_3
this.ddlb_4=create ddlb_4
this.Control[]={this.em_edate,&
this.cb_2,&
this.cb_1,&
this.dw_2,&
this.pb_4,&
this.pb_3,&
this.st_1,&
this.ddlb_2,&
this.ddlb_1,&
this.st_5,&
this.st_4,&
this.pb_2,&
this.pb_1,&
this.st_tips,&
this.dw_1,&
this.em_sdate,&
this.p_2,&
this.p_1,&
this.ddlb_3,&
this.ddlb_4}
end on

on w_calendar2.destroy
destroy(this.em_edate)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_tips)
destroy(this.dw_1)
destroy(this.em_sdate)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.ddlb_3)
destroy(this.ddlb_4)
end on

event open;//
Long  ll_maxX,ll_maxY,ll_X,ll_Y
Environment le_env

Getenvironment(le_env)

ll_maxX = PixelsToUnits(le_env.ScreenWidth, XPixelsToUnits!)
ll_maxY = PixelsToUnits(le_env.ScreenHeight, YPixelsToUnits!)

ll_X = PointerX()
ll_Y = PointerY()

if ll_x < 0 then ll_x = 0
if ll_x + Width > ll_maxX then ll_x = ll_maxX - Width

if ll_y < 0 then ll_y = 0
if ll_y + Height > ll_maxY then ll_y = ll_maxY - Height

Move(ll_x,ll_y)

//
istr_calendar = Message.PowerObjectParm
idt_sday = date(istr_calendar.sdate)
idt_eday = date(istr_calendar.edate)

dw_1.Object.DataWindow.Zoom = 110
dw_2.Object.DataWindow.Zoom = 110

int li_int
for li_int = year(idt_sday) - 5 to year(idt_sday) + 5
	ddlb_1.InsertItem(string(li_int), li_int - (year(idt_sday) - 6))
next
for li_int = 1 to 12
	ddlb_2.InsertItem(string(li_int), li_int)
next

em_sdate.text = string(idt_sday, "yyyy/mm/dd")
calc_output1()

//
for li_int = year(idt_eday) - 5 to year(idt_eday) + 5
	ddlb_3.InsertItem(string(li_int), li_int - (year(idt_eday) - 6))
next
for li_int = 1 to 12
	ddlb_4.InsertItem(string(li_int), li_int)
next

em_edate.text = string(idt_eday, "yyyy/mm/dd")
calc_output2()

end event

type em_edate from editmask within w_calendar2
integer x = 805
integer y = 744
integer width = 411
integer height = 80
integer taborder = 40
integer textsize = -11
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

event modified;//
idt_sday = date(em_sdate.text)
idt_eday = date(em_edate.text)
if idt_sday > idt_eday then idt_sday = idt_eday

end event

type cb_2 from commandbutton within w_calendar2
integer x = 1230
integer y = 736
integer width = 123
integer height = 92
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "T"
end type

event clicked;// TODAY
idt_eday = date(now())
if idt_eday < idt_sday then
	idt_sday = idt_eday
	em_sdate.text = string(idt_sday,"yyyy/mm/dd")
	calc_output1()
end if

em_edate.text = string(idt_eday,"yyyy/mm/dd")
calc_output2()

end event

type cb_1 from commandbutton within w_calendar2
integer x = 187
integer y = 740
integer width = 123
integer height = 92
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "T"
end type

event clicked;// TODAY
idt_sday = date(now())
if idt_sday > idt_eday then 
	idt_eday = idt_sday
	em_edate.text = string(idt_eday,"yyyy/mm/dd")
	calc_output2()
end if

em_sdate.text = string(idt_sday,"yyyy/mm/dd")
calc_output1()

end event

type dw_2 from datawindow within w_calendar2
integer x = 782
integer y = 100
integer width = 763
integer height = 624
integer taborder = 20
string title = "none"
string dataobject = "d_calendar2_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
string ls_date, ls_day, ls_column
long   ll_row

if isnull(row) OR row < 1 then RETURN
if dwo.name = "datawindow" then RETURN

choose case dwo.name
	case "sun", "mon", "tue", "wed", "thu", "fri", "sat"		
		ls_column = dwo.name
		ls_day = this.getitemstring(row, ls_column)
		
		if isnull(ls_day) OR ls_day = "" then RETURN

		ls_date = ddlb_3.text + "/" + ddlb_4.text + "/" + ls_day
		em_edate.text = ls_date
		idt_eday      = date(ls_date)
	
		for ll_row = 1 to this.rowcount()
			this.setitem(ll_row, "flag_sun", "N")
			this.setitem(ll_row, "flag_mon", "N")
			this.setitem(ll_row, "flag_tue", "N")
			this.setitem(ll_row, "flag_wed", "N")
			this.setitem(ll_row, "flag_thu", "N")
			this.setitem(ll_row, "flag_fri", "N")
			this.setitem(ll_row, "flag_sat", "N")
		next
	
		this.setitem(row, daynumber(idt_eday) + 7, "Y")	
	case else
end choose

end event

event doubleclicked;//
string ls_date, ls_day, ls_column

if row = 0 then RETURN

ls_column = dwo.name
if ls_column = 'datawindow' then RETURN
ls_day = this.getitemstring(row, ls_column)

if isnull(ls_day) then
	RETURN
else
	ls_date = ddlb_3.text + "/" + ddlb_4.text + "/" + ls_day
	em_edate.text = ls_date
	idt_eday      = date(ls_date)

	if idt_sday > idt_eday then
		MessageBox("확인","시작일자와 종료일자를 확인하시기 바랍니다.")
	else
		istr_calendar.sdate = string(idt_sday,"yyyy/mm/dd")
		istr_calendar.edate = string(idt_eday,"yyyy/mm/dd")
		CloseWithReturn(Parent, istr_calendar)
	end if
end if

end event

type pb_4 from picturebutton within w_calendar2
event mousemove pbm_mousemove
integer x = 1422
integer y = 12
integer width = 123
integer height = 76
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = ">>"
vtextalign vtextalign = vcenter!
end type

event mousemove;//f_usetips(st_tips, '월 증가', Parent, This.x, This.y + This.Height + 19)
end event

event clicked;int check_month

check_month = month(idt_eday)

if check_month = 12 then
	idt_eday = date(string(year(idt_eday) + 1) + "/" + "01" + "/" + "01")
else
   idt_eday = date(string(year(idt_eday)) + "/" + string(month(idt_eday) + 1) + "/" + "01")
end if

calc_output2()

end event

type pb_3 from picturebutton within w_calendar2
event mousemove pbm_mousemove
integer x = 782
integer y = 12
integer width = 123
integer height = 76
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<<"
vtextalign vtextalign = vcenter!
end type

event mousemove;//f_usetips(st_tips, '월 감소', Parent, This.x, This.y + This.Height + 19)
end event

event clicked;//
int check_month

check_month = month(idt_eday)

if check_month = 1 then
   idt_eday = date(string(year(idt_eday) - 1) + "/" + "12" + "/" + "01")
else
	idt_eday = date(string(year(idt_eday)) + "/" + string(month(idt_eday) - 1) + "/" + "01")
end if

calc_output2()

end event

type st_1 from statictext within w_calendar2
integer x = 763
integer width = 18
integer height = 856
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_calendar2
integer x = 430
integer y = 8
integer width = 210
integer height = 800
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
idt_sday = date(ddlb_1.text + "/" + ddlb_2.text + "/" + "01")

calc_output1()

end event

type ddlb_1 from dropdownlistbox within w_calendar2
integer x = 133
integer y = 8
integer width = 302
integer height = 800
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
idt_sday = date(ddlb_1.text + "/" + ddlb_2.text + "/" + "01")

calc_output1()

end event

type st_5 from statictext within w_calendar2
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

type st_4 from statictext within w_calendar2
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

type pb_2 from picturebutton within w_calendar2
event mousemove pbm_mousemove
integer x = 645
integer y = 12
integer width = 123
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = ">>"
vtextalign vtextalign = vcenter!
end type

event mousemove;//f_usetips(st_tips, '월 증가', Parent, This.x, This.y + This.Height + 19)
end event

event clicked;int check_month

check_month = month(idt_sday)

if check_month = 12 then
	idt_sday = date(string(year(idt_sday) + 1) + "/" + "01" + "/" + "01")
else
   idt_sday = date(string(year(idt_sday)) + "/" + string(month(idt_sday) + 1) + "/" + "01")
end if

calc_output1()

end event

type pb_1 from picturebutton within w_calendar2
event mousemove pbm_mousemove
integer x = 5
integer y = 12
integer width = 123
integer height = 76
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<<"
vtextalign vtextalign = vcenter!
end type

event mousemove;//f_usetips(st_tips, '월 감소', Parent, This.x, This.y + This.Height + 19)
end event

event clicked;int check_month

check_month = month(idt_sday)

if check_month = 1 then
   idt_sday = date(string(year(idt_sday) - 1) + "/" + "12" + "/" + "01")
else
	idt_sday = date(string(year(idt_sday)) + "/" + string(month(idt_sday) - 1) + "/" + "01")
end if

calc_output1()

end event

type st_tips from statictext within w_calendar2
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

type dw_1 from datawindow within w_calendar2
event mousemove pbm_dwnmousemove
integer x = 5
integer y = 100
integer width = 763
integer height = 624
integer taborder = 10
string dataobject = "d_calendar2_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;//if row < 1 then return
//this.scrolltorow(row)
//string ls_getdaynumber, ls_getdata, ls_passday
//long ll_row
//
//if row = 0 then return
//if dwo.name = 'datawindow' then return
//this.setredraw(false)
//ls_getdata = dwo.name
//
//ls_getdaynumber = dw_1.getitemstring(row, ls_getdata)
//
//if not isnull(ls_getdaynumber) then
//	ls_passday = string(string(year(idt_day)) + "/" + string(month(idt_day)) + "/" + ls_getdaynumber)
//	idt_day = date(ls_passday)
//	
//	em_date.text = string(idt_day,'YYYY/MM/DD')
//
//	for ll_row = 1 to this.rowcount()
//		dw_1.setitem(ll_row, "flag_sun", "N")
//		dw_1.setitem(ll_row, "flag_mon", "N")
//		dw_1.setitem(ll_row, "flag_tue", "N")
//		dw_1.setitem(ll_row, "flag_wed", "N")
//		dw_1.setitem(ll_row, "flag_thu", "N")
//		dw_1.setitem(ll_row, "flag_fri", "N")
//		dw_1.setitem(ll_row, "flag_sat", "N")
//	next
//
//	this.setitem(row, daynumber(idt_day) + 7, 'Y')
//end if
//this.setredraw(true)
//
//
end event

event doubleclicked;//
string ls_date, ls_day, ls_column

if isnull(row) OR row < 1 then RETURN
if ls_column = "datawindow" then RETURN

ls_column = dwo.name
ls_day = this.getitemstring(row, ls_column)

if isnull(ls_day) then
	RETURN
else
	ls_date = ddlb_1.text + "/" + ddlb_2.text + "/" + ls_day
	em_sdate.text = ls_date
	idt_sday      = date(ls_date)
	
	if idt_sday > idt_eday then
		MessageBox("확인","시작일자와 종료일자를 확인하시기 바랍니다.")
	else
		istr_calendar.sdate = string(idt_sday,"yyyy/mm/dd")
		istr_calendar.edate = string(idt_eday,"yyyy/mm/dd")
		CloseWithReturn(Parent, istr_calendar)
	end if
end if

end event

event clicked;//
string ls_date, ls_day, ls_column
long   ll_row

if isnull(row) OR row < 1 then RETURN
if dwo.name = "datawindow" then RETURN

choose case dwo.name
	case "sun", "mon", "tue", "wed", "thu", "fri", "sat"		
		ls_column = dwo.name
		ls_day = this.getitemstring(row, ls_column)
		
		if isnull(ls_day) OR ls_day = "" then RETURN

		ls_date = ddlb_1.text + "/" + ddlb_2.text + "/" + ls_day
		em_sdate.text = ls_date
		idt_sday      = date(ls_date)
	
		for ll_row = 1 to this.rowcount()
			this.setitem(ll_row, "flag_sun", "N")
			this.setitem(ll_row, "flag_mon", "N")
			this.setitem(ll_row, "flag_tue", "N")
			this.setitem(ll_row, "flag_wed", "N")
			this.setitem(ll_row, "flag_thu", "N")
			this.setitem(ll_row, "flag_fri", "N")
			this.setitem(ll_row, "flag_sat", "N")
		next	
		this.setitem(row, daynumber(idt_sday) + 7, "Y")	
		
	case else
end choose

end event

type em_sdate from editmask within w_calendar2
integer x = 325
integer y = 744
integer width = 411
integer height = 80
integer taborder = 30
integer textsize = -11
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

event modified;//
idt_sday = date(em_sdate.text)
idt_eday = date(em_edate.text)
if idt_sday > idt_eday then idt_eday = idt_sday

end event

type p_2 from picture within w_calendar2
integer x = 32
integer y = 720
integer width = 142
integer height = 116
string pointer = "HyperLink!"
string picturename = "C:\bmp\취소_O.bmp"
boolean focusrectangle = false
end type

event clicked;//
istr_calendar.chk = "N"
CloseWithReturn(Parent, istr_calendar)

end event

type p_1 from picture within w_calendar2
integer x = 1362
integer y = 720
integer width = 142
integer height = 116
string pointer = "HyperLink!"
string picturename = "C:\bmp\확인_O.bmp"
boolean focusrectangle = false
end type

event clicked;//
istr_calendar.sdate = string(idt_sday,"yyyy/mm/dd")
istr_calendar.edate = string(idt_eday,"yyyy/mm/dd")

if idt_sday > idt_eday then
	MessageBox("확인","시작일자와 종료일자를 확인하시기 바랍니다.")
	RETURN
else
	CloseWithReturn(Parent, istr_calendar)
end if

end event

type ddlb_3 from dropdownlistbox within w_calendar2
integer x = 914
integer y = 12
integer width = 302
integer height = 800
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
idt_eday = date(ddlb_3.text + "/" + ddlb_4.text + "/" + "01")

calc_output2()

end event

type ddlb_4 from dropdownlistbox within w_calendar2
integer x = 1211
integer y = 12
integer width = 210
integer height = 800
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
idt_eday = date(ddlb_3.text + "/" + ddlb_4.text + "/" + "01")

calc_output2()

end event

