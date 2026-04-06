$PBExportHeader$w_whopeom_beamt_w.srw
$PBExportComments$거래처선수금현황
forward 
global type w_whopeom_beamt_w from window
end type
type cb_3 from commandbutton within w_whopeom_beamt_w
end type
type cb_2 from commandbutton within w_whopeom_beamt_w
end type
type dw_2 from datawindow within w_whopeom_beamt_w
end type
type st_2 from statictext within w_whopeom_beamt_w
end type
type st_telno from statictext within w_whopeom_beamt_w
end type
type em_1 from editmask within w_whopeom_beamt_w
end type
type st_7 from statictext within w_whopeom_beamt_w
end type
type st_5 from statictext within w_whopeom_beamt_w
end type
type st_4 from statictext within w_whopeom_beamt_w
end type
type st_6 from statictext within w_whopeom_beamt_w
end type
type cb_1 from commandbutton within w_whopeom_beamt_w
end type
type dw_1 from datawindow within w_whopeom_beamt_w
end type
type gb_1 from groupbox within w_whopeom_beamt_w
end type
type gb_2 from groupbox within w_whopeom_beamt_w
end type
type gb_3 from groupbox within w_whopeom_beamt_w
end type
end forward

global type w_whopeom_beamt_w from window
integer x = 1938
integer y = 700
integer width = 3410
integer height = 2204
boolean titlebar = true
string title = "거래처 현황(w_whopeom_beamt_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
st_2 st_2
st_telno st_telno
em_1 em_1
st_7 st_7
st_5 st_5
st_4 st_4
st_6 st_6
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_whopeom_beamt_w w_whopeom_beamt_w

type variables
gs_where istr_where

end variables

on w_whopeom_beamt_w.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_2=create dw_2
this.st_2=create st_2
this.st_telno=create st_telno
this.em_1=create em_1
this.st_7=create st_7
this.st_5=create st_5
this.st_4=create st_4
this.st_6=create st_6
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_2,&
this.st_2,&
this.st_telno,&
this.em_1,&
this.st_7,&
this.st_5,&
this.st_4,&
this.st_6,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_whopeom_beamt_w.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.st_2)
destroy(this.st_telno)
destroy(this.em_1)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;//
string ls_custno, ls_telno

istr_where = message.powerobjectparm
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

st_5.text = istr_where.str1
st_6.text = istr_where.name
em_1.text = string(today(),'yyyy')

cb_3.text = string(gf_today(),"yyyy/mm/dd hh:mm")

ls_custno = istr_where.str1
SELECT tel_no INTO :ls_telno FROM customer WHERE cust_no = :ls_custno;
st_telno.text = ls_telno

// 여신현황
dw_1.retrieve(st_5.text, integer(em_1.text))
if dw_1.rowcount() < 1 then dw_1.insertrow(0)

// 선수금현황
dw_2.retrieve(st_5.text, integer(em_1.text))
if dw_2.rowcount() < 1 then dw_2.insertrow(0)

end event

type cb_3 from commandbutton within w_whopeom_beamt_w
integer x = 55
integer y = 1968
integer width = 1001
integer height = 124
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "PrintScreen"
end type

event clicked;long    ll_job
integer ul_x, ul_y, ul_width, ul_height
window  lw_sheet

//if MessageBox('확인', '화면을 출력합니다', Information!, YesNo!, 1) <> 1 then Return

lw_sheet  = this.GetParent() 
ll_job    = PrintOpen()

ul_x      = UnitsToPixels(lw_sheet.X, XUnitsToPixels!)
ul_y      = UnitsToPixels(lw_sheet.Y, XUnitsToPixels!)
ul_width  = UnitsToPixels(lw_sheet.width, XUnitsToPixels!)
ul_height = UnitsToPixels(lw_sheet.height, XUnitsToPixels!)

//
// PrintScreen ( printjobnumber, x, y {, width, height } ) 
// Argument         Description 
// printjobnumber   PrintOpen function이 print job에 할당한 번호
// x                screen image의 왼쪽 상단부터 페이지의 x 좌표를 1인치의 1000분의 1로 표시한 integer.  
// y                screen image의 왼쪽 상단부터 페이지의 y 좌표를 1인치의 1000분의 1로 표시한 integer.  
// width (optional)  
//                  1인치의 1000분의 1로 나타낸 print된 screen의 integer width. width를 생략한다면, 
//                  PowerBuilder는 original width로 screen을 print하고 width를 명시한다면 반드시 height를 명시해야 한다. 
// height (optional) 
//                  1인치의 1000분의 1로 나타낸 print된 screen의 integer height. height를 생략한다면, 
//                  PowerBuilder는 original height로 screen을 print 한다

//PrintScreen(ll_job, ul_x, ul_y, ul_width, ul_height)

// 이 statement는 500, 1000에 original size로 현재 screen image를 print한다. 
PrintScreen(ll_job, 0, 0) 

PrintClose(ll_job)

end event

type cb_2 from commandbutton within w_whopeom_beamt_w
integer x = 1349
integer y = 1968
integer width = 1001
integer height = 124
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "화면출력"
end type

event clicked;//
long    ll_job
window  lw_window

//if MessageBox('확인', '화면을 출력합니다', Information!, YesNo!, 1) <> 1 then Return

lw_window = this.GetParent() 
ll_job    = PrintOpen()

// Window Size  X: 1938, Y: 700, Width: 3401, height: 2124
//lw_window.Print(ll_job, 0, 0, 7700, 5500)   결과 : A5 사이즈에 적합
//PrintPage(ll_job) 
lw_window.Print(ll_job, 0, 0, lw_window.width * 2.3, lw_window.height * 2.3)

PrintClose(ll_job)

/*
이 example은 새로운 page를 정의하는 print job을 열고 Print의 세 번째 syntax를 사용하여 title을 print한다. 
그리고 첫 번째 페이지의 graph와 두 번째 페이지의 window를 print하기 위해 Print의 이 syntax를 사용한다. 

long Job 

Job = PrintOpen( ) 
Print(Job, "Report of Year-to-Date Sales") 
gr_sales1.Print(Job, 1000,PrintY(Job)+500, 6000, 4500) 

PrintPage(Job) 

w_sales.Print(Job, 1000,500, 6000, 4500) 

PrintClose(Job) 
*/

end event

type dw_2 from datawindow within w_whopeom_beamt_w
integer x = 55
integer y = 1180
integer width = 3296
integer height = 752
integer taborder = 20
string title = "none"
string dataobject = "d_cdbeinvcoll_q"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_whopeom_beamt_w
integer x = 59
integer y = 48
integer width = 384
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "판매거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_telno from statictext within w_whopeom_beamt_w
integer x = 2176
integer y = 48
integer width = 558
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_whopeom_beamt_w
event us_modified pbm_enchange
integer x = 3067
integer y = 48
integer width = 265
integer height = 84
integer taborder = 10
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
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = " "
string minmax = "1990~~2100"
end type

event us_modified;//
dw_1.reset()
dw_2.reset()

dw_1.retrieve(st_5.text, integer(em_1.text))
if dw_1.rowcount() < 1 then dw_1.insertrow(0)

dw_2.retrieve(st_5.text, integer(em_1.text))
if dw_2.rowcount() < 1 then dw_2.insertrow(0)

end event

event modified;// 년도
dw_1.reset()
dw_2.reset()

debugbreak()
// 여신현황
dw_1.retrieve(st_5.text, integer(em_1.text))
if dw_1.rowcount() < 1 then dw_1.insertrow(0)

// 선수금현황
dw_2.retrieve(st_5.text, integer(em_1.text))
if dw_2.rowcount() < 1 then dw_2.insertrow(0)

end event

type st_7 from statictext within w_whopeom_beamt_w
integer x = 2752
integer y = 48
integer width = 315
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_whopeom_beamt_w
integer x = 443
integer y = 48
integer width = 247
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_whopeom_beamt_w
integer x = 1970
integer y = 48
integer width = 201
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "전화"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_whopeom_beamt_w
integer x = 690
integer y = 48
integer width = 1275
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whopeom_beamt_w
integer x = 2368
integer y = 1968
integer width = 1001
integer height = 124
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
end type

event clicked;//
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whopeom_beamt_w
integer x = 55
integer y = 252
integer width = 3296
integer height = 752
integer taborder = 10
string dataobject = "d_cdinvcoll_q"
boolean border = false
end type

type gb_1 from groupbox within w_whopeom_beamt_w
integer x = 27
integer width = 3342
integer height = 152
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
end type

type gb_2 from groupbox within w_whopeom_beamt_w
integer x = 27
integer y = 164
integer width = 3342
integer height = 860
integer taborder = 20
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "여신현황"
end type

type gb_3 from groupbox within w_whopeom_beamt_w
integer x = 27
integer y = 1092
integer width = 3342
integer height = 860
integer taborder = 20
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "선수금현황"
end type

