$PBExportHeader$w_whwcplan_w.srw
$PBExportComments$작업장별 생산계획검색윈도우(1998/05/14,성삼지)
forward
global type w_whwcplan_w from window
end type
type st_1 from statictext within w_whwcplan_w
end type
type rb_3 from radiobutton within w_whwcplan_w
end type
type pb_1 from picturebutton within w_whwcplan_w
end type
type rb_2 from radiobutton within w_whwcplan_w
end type
type rb_1 from radiobutton within w_whwcplan_w
end type
type dw_1 from datawindow within w_whwcplan_w
end type
type pb_2 from picturebutton within w_whwcplan_w
end type
type gb_3 from groupbox within w_whwcplan_w
end type
type gb_2 from groupbox within w_whwcplan_w
end type
type gb_1 from groupbox within w_whwcplan_w
end type
type em_1 from editmask within w_whwcplan_w
end type
type em_2 from editmask within w_whwcplan_w
end type
type st_2 from statictext within w_whwcplan_w
end type
end forward

global type w_whwcplan_w from window
integer x = 832
integer y = 360
integer width = 1961
integer height = 696
boolean titlebar = true
string title = "작업장별생산계획조회(w_whwcplan_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_1 st_1
rb_3 rb_3
pb_1 pb_1
rb_2 rb_2
rb_1 rb_1
dw_1 dw_1
pb_2 pb_2
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
em_1 em_1
em_2 em_2
st_2 st_2
end type
global w_whwcplan_w w_whwcplan_w

type variables
gs_itembaldo_str  ist_code
datawindowchild idwc_wc
string is_wcno
date id_start, id_end
end variables

on w_whwcplan_w.create
this.st_1=create st_1
this.rb_3=create rb_3
this.pb_1=create pb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_1=create dw_1
this.pb_2=create pb_2
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.Control[]={this.st_1,&
this.rb_3,&
this.pb_1,&
this.rb_2,&
this.rb_1,&
this.dw_1,&
this.pb_2,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.em_1,&
this.em_2,&
this.st_2}
end on

on w_whwcplan_w.destroy
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.pb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
end on

event open;
dw_1.SetTransObject(SQLCA)
ist_code = message.powerobjectparm
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
dw_1.insertrow(0)
dw_1.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

end event

type st_1 from statictext within w_whwcplan_w
integer x = 37
integer y = 32
integer width = 1851
integer height = 120
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "작업장별 생산계획 조회"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_whwcplan_w
integer x = 1019
integer y = 460
integer width = 457
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "미생산계획"
end type

type pb_1 from picturebutton within w_whwcplan_w
integer x = 1609
integer y = 220
integer width = 279
integer height = 144
integer taborder = 60
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

ist_code.start_date = em_1.text
ist_code.end_date = em_2.text
ist_code.order_flag = trim(is_wcno) + "%"  //작업장명
if rb_1.checked = true then
	ist_code.sel_flag = "%"   //생산계획여부
else
	if rb_2.checked = true then
		ist_code.sel_flag = "Y%"
	else
		ist_code.sel_flag = "N%"
	end if
end if


closewithreturn(parent, ist_code)
end event

type rb_2 from radiobutton within w_whwcplan_w
integer x = 1019
integer y = 368
integer width = 389
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "생산계획"
end type

type rb_1 from radiobutton within w_whwcplan_w
integer x = 1019
integer y = 276
integer width = 270
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체"
boolean checked = true
end type

type dw_1 from datawindow within w_whwcplan_w
integer x = 78
integer y = 464
integer width = 873
integer height = 88
integer taborder = 40
string dataobject = "d_whwc_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;	if em_1.text = '' then
		messagebox("확인","조회기간을 입력하세요!",information!)
		return 1
	elseif em_2.text = '' then
		messagebox("확인","조회기간을 입력하세요!",information!)
		return 1
	elseif em_1.text > em_2.text then
		messagebox("확인","조회기간을 잘못 입력하였습니다!",information!)
		return 1
	end if
	
	id_start = date(em_1.text)
	id_end = date(em_2.text)
	this.accepttext()
	is_wcno = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
	

end event

event itemerror;this.object.wc_no[1] = ''
is_wcno = ''
if em_1.text = '' then
	em_1.setfocus()
elseif em_2.text = '' then
	em_2.setfocus()
elseif em_1.text > em_2.text then
	em_1.setfocus()
end if

return 2
end event

type pb_2 from picturebutton within w_whwcplan_w
integer x = 1609
integer y = 428
integer width = 279
integer height = 144
integer taborder = 70
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

type gb_3 from groupbox within w_whwcplan_w
integer x = 983
integer y = 192
integer width = 594
integer height = 380
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "생산계획범위"
end type

type gb_2 from groupbox within w_whwcplan_w
integer x = 37
integer y = 192
integer width = 937
integer height = 192
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "생산계획기간"
end type

type gb_1 from groupbox within w_whwcplan_w
integer x = 37
integer y = 392
integer width = 937
integer height = 180
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "작업장"
end type

type em_1 from editmask within w_whwcplan_w
integer x = 78
integer y = 268
integer width = 366
integer height = 76
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

type em_2 from editmask within w_whwcplan_w
integer x = 558
integer y = 268
integer width = 366
integer height = 76
integer taborder = 20
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

type st_2 from statictext within w_whwcplan_w
integer x = 475
integer y = 280
integer width = 55
integer height = 64
boolean bringtotop = true
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

