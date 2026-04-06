$PBExportHeader$w_whcustdoname_w.srw
$PBExportComments$기간/판매거래처검색윈도우(1998/08/26,성삼지)
forward
global type w_whcustdoname_w from window
end type
type dw_1 from datawindow within w_whcustdoname_w
end type
type st_3 from statictext within w_whcustdoname_w
end type
type st_2 from statictext within w_whcustdoname_w
end type
type em_4 from editmask within w_whcustdoname_w
end type
type em_3 from editmask within w_whcustdoname_w
end type
type pb_2 from picturebutton within w_whcustdoname_w
end type
type pb_1 from picturebutton within w_whcustdoname_w
end type
type rb_2 from radiobutton within w_whcustdoname_w
end type
type rb_1 from radiobutton within w_whcustdoname_w
end type
type gb_1 from groupbox within w_whcustdoname_w
end type
end forward

global type w_whcustdoname_w from window
integer x = 832
integer y = 360
integer width = 1495
integer height = 752
boolean titlebar = true
string title = "기간조회(w_custdoname_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
dw_1 dw_1
st_3 st_3
st_2 st_2
em_4 em_4
em_3 em_3
pb_2 pb_2
pb_1 pb_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_whcustdoname_w w_whcustdoname_w

type variables
gs_custdo_str  ist_code
end variables

on w_whcustdoname_w.create
this.dw_1=create dw_1
this.st_3=create st_3
this.st_2=create st_2
this.em_4=create em_4
this.em_3=create em_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.st_3,&
this.st_2,&
this.em_4,&
this.em_3,&
this.pb_2,&
this.pb_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_whcustdoname_w.destroy
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;//
dw_1.SetTransObject(SQLCA)
dw_1.insertrow(0)
dw_1.object.cust_no.background.color = 78682240

ist_code = message.powerobjectparm
if isnull(ist_code.start_date) or ist_code.start_date = "" then
	em_3.text = string(today(),'yyyy/mm/01')
else
	em_3.text = ist_code.start_date
end if

if isnull(ist_code.end_date) or ist_code.end_date = "" then
	em_4.text = string(today(),'yyyy/mm/dd')
else
	em_4.text = ist_code.end_date
end if
end event

type dw_1 from datawindow within w_whcustdoname_w
integer x = 530
integer y = 316
integer width = 878
integer height = 104
integer taborder = 50
string dataobject = "d_oiscenecust_s"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_whcustdoname_w
integer x = 160
integer y = 124
integer width = 343
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79219928
boolean enabled = false
string text = "출고기간"
boolean focusrectangle = false
end type

type st_2 from statictext within w_whcustdoname_w
integer x = 965
integer y = 140
integer width = 46
integer height = 64
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

type em_4 from editmask within w_whcustdoname_w
integer x = 1010
integer y = 124
integer width = 366
integer height = 76
integer taborder = 20
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_3 from editmask within w_whcustdoname_w
integer x = 599
integer y = 124
integer width = 366
integer height = 76
integer taborder = 10
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_2 from picturebutton within w_whcustdoname_w
integer x = 1170
integer y = 480
integer width = 279
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whcustdoname_w
integer x = 887
integer y = 480
integer width = 279
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;string ls_cust_no
ist_code.okcancel = 'Y'

if rb_1.checked = true then
	ist_code.sel_flag = 'A'
else
	ist_code.sel_flag = 'P'
   ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
     if isnull(ls_cust_no) or ls_cust_no = '' then
      	messagebox("확인","거래처를 선택하세요!",information!)
      	dw_1.setfocus()  
         return
     end if
	  ist_code.start_no = ls_cust_no
end if

ist_code.start_date = trim(em_3.text)
ist_code.end_date   = trim(em_4.text)
closewithreturn(parent, ist_code)
end event

type rb_2 from radiobutton within w_whcustdoname_w
integer x = 82
integer y = 332
integer width = 439
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "부분조회"
end type

event clicked;dw_1.object.cust_no.background.color = 1087434968
dw_1.enabled = true

end event

type rb_1 from radiobutton within w_whcustdoname_w
integer x = 82
integer y = 224
integer width = 439
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체조회"
boolean checked = true
end type

event clicked;dw_1.enabled = false
dw_1.object.cust_no.background.color = 78682240


end event

type gb_1 from groupbox within w_whcustdoname_w
integer x = 23
integer y = 28
integer width = 1431
integer height = 440
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "조회범위"
end type

