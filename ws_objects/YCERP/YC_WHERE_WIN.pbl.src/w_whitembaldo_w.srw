$PBExportHeader$w_whitembaldo_w.srw
$PBExportComments$제품별출고/미출고검색윈도우(1998/05/14,성삼지)
forward 
global type w_whitembaldo_w from window
end type
type st_6 from statictext within w_whitembaldo_w
end type
type st_5 from statictext within w_whitembaldo_w
end type
type rb_4 from radiobutton within w_whitembaldo_w
end type
type rb_3 from radiobutton within w_whitembaldo_w
end type
type em_6 from editmask within w_whitembaldo_w
end type
type st_4 from statictext within w_whitembaldo_w
end type
type em_5 from editmask within w_whitembaldo_w
end type
type rb_7 from radiobutton within w_whitembaldo_w
end type
type rb_6 from radiobutton within w_whitembaldo_w
end type
type st_3 from statictext within w_whitembaldo_w
end type
type st_2 from statictext within w_whitembaldo_w
end type
type em_4 from editmask within w_whitembaldo_w
end type
type em_3 from editmask within w_whitembaldo_w
end type
type pb_2 from picturebutton within w_whitembaldo_w
end type
type pb_1 from picturebutton within w_whitembaldo_w
end type
type st_1 from statictext within w_whitembaldo_w
end type
type em_2 from editmask within w_whitembaldo_w
end type
type em_1 from editmask within w_whitembaldo_w
end type
type rb_2 from radiobutton within w_whitembaldo_w
end type
type rb_1 from radiobutton within w_whitembaldo_w
end type
type gb_3 from groupbox within w_whitembaldo_w
end type
type gb_2 from groupbox within w_whitembaldo_w
end type
type gb_1 from groupbox within w_whitembaldo_w
end type
end forward

global type w_whitembaldo_w from window
integer x = 832
integer y = 360
integer width = 1326
integer height = 1344
boolean titlebar = true
string title = "물품및 거래처선택(w_whitembaldo_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_6 st_6
st_5 st_5
rb_4 rb_4
rb_3 rb_3
em_6 em_6
st_4 st_4
em_5 em_5
rb_7 rb_7
rb_6 rb_6
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
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_whitembaldo_w w_whitembaldo_w

type variables
gs_itembaldo_str  ist_code
end variables

on w_whitembaldo_w.create
this.st_6=create st_6
this.st_5=create st_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.em_6=create em_6
this.st_4=create st_4
this.em_5=create em_5
this.rb_7=create rb_7
this.rb_6=create rb_6
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
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_6,&
this.st_5,&
this.rb_4,&
this.rb_3,&
this.em_6,&
this.st_4,&
this.em_5,&
this.rb_7,&
this.rb_6,&
this.st_3,&
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
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_whitembaldo_w.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.em_6)
destroy(this.st_4)
destroy(this.em_5)
destroy(this.rb_7)
destroy(this.rb_6)
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
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;ist_code = Message.PowerObjectParm
em_3.text = String(Today(),'yyyy/mm/dd')
em_3.text = String(RelativeDate(today(), - 60),'yyyy/mm/dd')
em_4.text = String(RelativeDate(today(), + 30),'yyyy/mm/dd')

end event

type st_6 from statictext within w_whitembaldo_w
integer x = 46
integer y = 1104
integer width = 571
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "조회: 우측마우스"
boolean focusrectangle = false
end type

type st_5 from statictext within w_whitembaldo_w
integer x = 37
integer y = 288
integer width = 1234
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "기본값: -60일 + 30일"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_whitembaldo_w
integer x = 46
integer y = 952
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

event clicked;em_5.enabled = true
em_6.enabled = true
em_5.backcolor = 1087434968
em_6.backcolor = 1087434968
end event

type rb_3 from radiobutton within w_whitembaldo_w
integer x = 46
integer y = 832
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

event clicked;em_5.enabled = false
em_6.enabled = false
em_5.backcolor = 78682240
em_6.backcolor = 78682240
end event

type em_6 from editmask within w_whitembaldo_w
integer x = 901
integer y = 956
integer width = 366
integer height = 76
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_6.text = lst_whcustret.cust_no
end if

end event

type st_4 from statictext within w_whitembaldo_w
integer x = 855
integer y = 956
integer width = 69
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_5 from editmask within w_whitembaldo_w
integer x = 489
integer y = 956
integer width = 366
integer height = 76
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_5.text = lst_whcustret.cust_no
end if
if not isnull(em_5.text) or trim(em_5.text) <> "" then
	em_6.text = em_5.text
end if

end event

type rb_7 from radiobutton within w_whitembaldo_w
event clicked pbm_bnclicked
integer x = 791
integer y = 96
integer width = 329
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "미출고"
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type rb_6 from radiobutton within w_whitembaldo_w
event clicked pbm_bnclicked
integer x = 69
integer y = 96
integer width = 558
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "출고/미출고"
boolean checked = true
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type st_3 from statictext within w_whitembaldo_w
integer x = 133
integer y = 200
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
string text = "납기기간"
boolean focusrectangle = false
end type

type st_2 from statictext within w_whitembaldo_w
integer x = 859
integer y = 216
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

type em_4 from editmask within w_whitembaldo_w
integer x = 905
integer y = 196
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

type em_3 from editmask within w_whitembaldo_w
integer x = 498
integer y = 196
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

type pb_2 from picturebutton within w_whitembaldo_w
integer x = 1001
integer y = 1104
integer width = 279
integer height = 144
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whitembaldo_w
integer x = 718
integer y = 1104
integer width = 279
integer height = 144
integer taborder = 90
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

// 물품조회
if rb_1.checked = true then		// 전체조회
	ist_code.sel_flag = 'A'
else
	ist_code.sel_flag = 'P'			// 부분조회
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = trim(em_2.text)
end if

// 거래처조회
if rb_3.checked = true then		// 전체조회
	ist_code.order_flag = 'A'
else
	ist_code.order_flag = 'P'		// 부분조회
	ist_code.start_cust = trim(em_5.text)
	ist_code.end_cust = trim(em_6.text)
end if

//
if rb_6.checked = true then		// 출고/미출고
	ist_code.do_flag = 'Y'
ELSE										// 미출고
	ist_code.do_flag = 'N'
end if

ist_code.start_date = em_3.text
ist_code.end_date = em_4.text
closewithreturn(parent, ist_code)
end event

type st_1 from statictext within w_whitembaldo_w
integer x = 855
integer y = 608
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

type em_2 from editmask within w_whitembaldo_w
integer x = 901
integer y = 596
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
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaaaaaaa"
boolean autoskip = true
end type

event rbuttondown;gs_where2 lst_whitemret

lst_whitemret.chk = "S"
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	em_2.text = lst_whitemret.str1[1]
end if

end event

event getfocus;if not isnull(em_1.text) or trim(em_1.text) <> "" then
	em_2.text = em_1.text
end if
end event

type em_1 from editmask within w_whitembaldo_w
integer x = 489
integer y = 596
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
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaaaaaaa"
boolean autoskip = true
end type

event rbuttondown;gs_where2 lst_whitemret

lst_whitemret.chk = "S"
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	em_1.text = lst_whitemret.str1[1]
end if
em_2.setfocus()
end event

type rb_2 from radiobutton within w_whitembaldo_w
integer x = 55
integer y = 596
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

type rb_1 from radiobutton within w_whitembaldo_w
integer x = 50
integer y = 476
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

type gb_3 from groupbox within w_whitembaldo_w
integer x = 23
integer y = 752
integer width = 1262
integer height = 324
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 79219928
string text = "거래처범위"
end type

type gb_2 from groupbox within w_whitembaldo_w
integer x = 23
integer y = 16
integer width = 1262
integer height = 348
integer taborder = 70
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "선택"
end type

type gb_1 from groupbox within w_whitembaldo_w
integer x = 23
integer y = 372
integer width = 1262
integer height = 364
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "물품범위"
end type

