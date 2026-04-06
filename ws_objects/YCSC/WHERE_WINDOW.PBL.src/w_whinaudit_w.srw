$PBExportHeader$w_whinaudit_w.srw
$PBExportComments$재고이력검색(2004/10/19,이인호)
forward
global type w_whinaudit_w from window
end type
type st_name from statictext within w_whinaudit_w
end type
type dw_3 from datawindow within w_whinaudit_w
end type
type pb_1 from picturebutton within w_whinaudit_w
end type
type pb_print from picturebutton within w_whinaudit_w
end type
type pb_retrieve from picturebutton within w_whinaudit_w
end type
type em_2 from editmask within w_whinaudit_w
end type
type st_2 from statictext within w_whinaudit_w
end type
type em_1 from editmask within w_whinaudit_w
end type
type dw_1 from datawindow within w_whinaudit_w
end type
type gb_1 from groupbox within w_whinaudit_w
end type
end forward

global type w_whinaudit_w from window
integer x = 23
integer y = 288
integer width = 4690
integer height = 2068
boolean titlebar = true
string title = "재고이력검색(w_whinaudit_w)    -  SIZE가 조정가능합니다...."
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 79741120
boolean palettewindow = true
boolean center = true
st_name st_name
dw_3 dw_3
pb_1 pb_1
pb_print pb_print
pb_retrieve pb_retrieve
em_2 em_2
st_2 st_2
em_1 em_1
dw_1 dw_1
gb_1 gb_1
end type
global w_whinaudit_w w_whinaudit_w

type variables
Integer	 ii_WindowBorder = 15
st_print i_print
gs_where ist_where
end variables

on w_whinaudit_w.create
this.st_name=create st_name
this.dw_3=create dw_3
this.pb_1=create pb_1
this.pb_print=create pb_print
this.pb_retrieve=create pb_retrieve
this.em_2=create em_2
this.st_2=create st_2
this.em_1=create em_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_name,&
this.dw_3,&
this.pb_1,&
this.pb_print,&
this.pb_retrieve,&
this.em_2,&
this.st_2,&
this.em_1,&
this.dw_1,&
this.gb_1}
end on

on w_whinaudit_w.destroy
destroy(this.st_name)
destroy(this.dw_3)
destroy(this.pb_1)
destroy(this.pb_print)
destroy(this.pb_retrieve)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;long ll_row

dw_1.settransobject(sqlca)
dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)

ist_where = message.powerobjectparm

dw_3.insertrow(0) 
dw_3.object.loc_no[1] = ist_where.str3
st_name.text = '품명 : ' + trim(ist_where.name) + '~n~r규격 : ' + ist_where.str2

em_1.text = string(today(), 'YYYY/MM/01')
em_2.text = string(today(), 'YYYY/MM/DD')
ll_row = dw_1.retrieve(date(em_1.text), date(em_2.text), ist_where.str1, ist_where.str2, ist_where.str3)
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

event resize;////dw_1.Resize (this.WorkSpaceWidth(), this.WorkSpaceHeight() - dw_1.Y)
//
//dw_1.Resize(newwidth - (2 * ii_WindowBorder), newheight - (dw_1.Y + ii_WindowBorder))
//

dw_1.width  = this.width  - 128
dw_1.height = this.height - 352

end event

type st_name from statictext within w_whinaudit_w
integer x = 46
integer y = 24
integer width = 1787
integer height = 176
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whinaudit_w
integer x = 2661
integer y = 68
integer width = 859
integer height = 96
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type pb_1 from picturebutton within w_whinaudit_w
integer x = 3899
integer y = 52
integer width = 160
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_print from picturebutton within w_whinaudit_w
integer x = 3726
integer y = 52
integer width = 160
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = left!
end type

event clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
parent.WindowState = Minimized!
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 재고이력검색 내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
w_print.setfocus()

//w_repsuper w_print
////===============사용자별 프로그램 사용현황=================================
//
//string  ls_window
//ls_window=parent.classname()
//
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//i_print.st_datawindow = dw_1
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 재고이력검색 내역을 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type pb_retrieve from picturebutton within w_whinaudit_w
integer x = 3557
integer y = 52
integer width = 160
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;string ls_loc

dw_3.accepttext()
ls_loc = dw_3.object.loc_no[1]
dw_1.retrieve(date(em_1.text), date(em_2.text), ist_where.str1, ist_where.str2, ls_loc)

end event

type em_2 from editmask within w_whinaudit_w
integer x = 2295
integer y = 72
integer width = 352
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "IBeam!"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_whinaudit_w
integer x = 2226
integer y = 68
integer width = 59
integer height = 80
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whinaudit_w
integer x = 1874
integer y = 72
integer width = 352
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "IBeam!"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_1 from datawindow within w_whinaudit_w
integer x = 46
integer y = 224
integer width = 4562
integer height = 1716
integer taborder = 20
string title = "d_irusersilsa_s2"
string dataobject = "d_irusersilsa_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//w_repsuper w_print
////===============사용자별 프로그램 사용현황=================================
//
//string  ls_window
//ls_window=parent.classname()
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//pb_insert.enabled = true
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type gb_1 from groupbox within w_whinaudit_w
integer x = 1842
integer y = 4
integer width = 2249
integer height = 196
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

