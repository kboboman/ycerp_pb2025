$PBExportHeader$w_whcustdo_w.srw
$PBExportComments$판매거래처별출고검색윈도우(1998/08/26,성삼지)
forward 
global type w_whcustdo_w from window
end type
type st_3 from statictext within w_whcustdo_w
end type
type st_2 from statictext within w_whcustdo_w
end type
type em_4 from editmask within w_whcustdo_w
end type
type em_3 from editmask within w_whcustdo_w
end type
type pb_2 from picturebutton within w_whcustdo_w
end type
type pb_1 from picturebutton within w_whcustdo_w
end type
type st_1 from statictext within w_whcustdo_w
end type
type em_2 from editmask within w_whcustdo_w
end type
type em_1 from editmask within w_whcustdo_w
end type
type rb_2 from radiobutton within w_whcustdo_w
end type
type rb_1 from radiobutton within w_whcustdo_w
end type
type gb_1 from groupbox within w_whcustdo_w
end type
end forward

global type w_whcustdo_w from window
integer x = 832
integer y = 360
integer width = 1321
integer height = 732
boolean titlebar = true
string title = "기간조회(w_whcustdo_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_3 st_3
st_2 st_2
em_4 em_4
em_3 em_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
em_2 em_2
em_1 em_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_whcustdo_w w_whcustdo_w

type variables
gs_custdo_str  ist_code
end variables

on w_whcustdo_w.create
this.st_3=create st_3
this.st_2=create st_2
this.em_4=create em_4
this.em_3=create em_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.st_2,&
this.em_4,&
this.em_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.em_2,&
this.em_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_whcustdo_w.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;//
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

type st_3 from statictext within w_whcustdo_w
integer x = 128
integer y = 124
integer width = 343
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 79219928
boolean enabled = false
string text = "출고기간"
boolean focusrectangle = false
end type

type st_2 from statictext within w_whcustdo_w
integer x = 855
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

type em_4 from editmask within w_whcustdo_w
integer x = 901
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

type em_3 from editmask within w_whcustdo_w
integer x = 489
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

type pb_2 from picturebutton within w_whcustdo_w
integer x = 1006
integer y = 480
integer width = 279
integer height = 144
integer taborder = 60
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

type pb_1 from picturebutton within w_whcustdo_w
integer x = 722
integer y = 480
integer width = 279
integer height = 144
integer taborder = 50
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

event clicked;ist_code.okcancel = 'Y'

if rb_1.checked = true then
	ist_code.sel_flag = 'A'
else
	ist_code.sel_flag = 'P'
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = trim(em_2.text)
end if

ist_code.start_date = trim(em_3.text)
ist_code.end_date = trim(em_4.text)
closewithreturn(parent, ist_code)
end event

type st_1 from statictext within w_whcustdo_w
integer x = 855
integer y = 356
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

type em_2 from editmask within w_whcustdo_w
integer x = 901
integer y = 344
integer width = 366
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_2.text = lst_whcustret.cust_no
end if
end event

event getfocus;if not isnull(em_1.text) or trim(em_1.text) <> "" then
	this.text = em_1.text
	this.SelectText( 1, LenA(this.text) )
end if

end event

type em_1 from editmask within w_whcustdo_w
event doubleclick pbm_lbuttondblclk
integer x = 489
integer y = 344
integer width = 366
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event rbuttondown;//open(w_whcustret_w)
gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_whcustret.cust_chk = 'Y' then
	em_1.text = lst_whcustret.cust_no
end if
em_2.setfocus()

end event

event getfocus;//
if this.text = "" then
	gs_whcustret_str lst_whcustret
	
	openwithparm(w_whcustret_w, lst_whcustret)
	lst_whcustret =  message.powerobjectparm	
	if lst_whcustret.cust_chk = 'Y' then
		em_1.text = lst_whcustret.cust_no
	end if
	em_2.setfocus()
end if
end event

type rb_2 from radiobutton within w_whcustdo_w
integer x = 50
integer y = 340
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

event clicked;em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968
end event

type rb_1 from radiobutton within w_whcustdo_w
integer x = 50
integer y = 220
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

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type gb_1 from groupbox within w_whcustdo_w
integer x = 23
integer y = 28
integer width = 1262
integer height = 424
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

