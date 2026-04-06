$PBExportHeader$w_whscenebaldo_w2.srw
$PBExportComments$현장별 물품출고 집계현황(1999/7/8,이종탁)
forward 
global type w_whscenebaldo_w2 from window
end type
type pb_1 from picturebutton within w_whscenebaldo_w2
end type
type rb_2 from radiobutton within w_whscenebaldo_w2
end type
type rb_1 from radiobutton within w_whscenebaldo_w2
end type
type dw_2 from datawindow within w_whscenebaldo_w2
end type
type dw_1 from datawindow within w_whscenebaldo_w2
end type
type st_2 from statictext within w_whscenebaldo_w2
end type
type em_2 from editmask within w_whscenebaldo_w2
end type
type em_1 from editmask within w_whscenebaldo_w2
end type
type pb_2 from picturebutton within w_whscenebaldo_w2
end type
type gb_4 from groupbox within w_whscenebaldo_w2
end type
type gb_2 from groupbox within w_whscenebaldo_w2
end type
end forward

global type w_whscenebaldo_w2 from window
integer x = 832
integer y = 360
integer width = 1879
integer height = 720
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 79220952
pb_1 pb_1
rb_2 rb_2
rb_1 rb_1
dw_2 dw_2
dw_1 dw_1
st_2 st_2
em_2 em_2
em_1 em_1
pb_2 pb_2
gb_4 gb_4
gb_2 gb_2
end type
global w_whscenebaldo_w2 w_whscenebaldo_w2

type variables
gs_itembaldo_str  ist_code
string is_cust_no, is_scene
date id_start, id_end
end variables

on w_whscenebaldo_w2.create
this.pb_1=create pb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.st_2=create st_2
this.em_2=create em_2
this.em_1=create em_1
this.pb_2=create pb_2
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.pb_1,&
this.rb_2,&
this.rb_1,&
this.dw_2,&
this.dw_1,&
this.st_2,&
this.em_2,&
this.em_1,&
this.pb_2,&
this.gb_4,&
this.gb_2}
end on

on w_whscenebaldo_w2.destroy
destroy(this.pb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.gb_4)
destroy(this.gb_2)
end on

event open;dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
ist_code = message.powerobjectparm
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
dw_2.visible = false
dw_1.insertrow(0)
end event

type pb_1 from picturebutton within w_whscenebaldo_w2
integer x = 1289
integer y = 472
integer width = 279
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = " 확인"
boolean default = true
string picturename = "C:\bmp\확인0.BMP"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'Y'

ist_code.start_date = em_1.text
ist_code.end_date = em_2.text
ist_code.order_flag = is_cust_no   //거래처코드
if rb_1.checked = true then
	ist_code.sel_flag = 'A'   //현장코드
else
	ist_code.sel_flag = is_scene
end if

closewithreturn(parent, ist_code)
end event

type rb_2 from radiobutton within w_whscenebaldo_w2
integer x = 507
integer y = 60
integer width = 270
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "부분"
end type

event clicked;dw_2.visible = true
end event

type rb_1 from radiobutton within w_whscenebaldo_w2
integer x = 55
integer y = 60
integer width = 270
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체"
boolean checked = true
end type

event clicked;dw_2.visible = false
end event

type dw_2 from datawindow within w_whscenebaldo_w2
integer x = 37
integer y = 116
integer width = 864
integer height = 500
integer taborder = 50
string dataobject = "d_oiscene_s"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;long ll_row
	
Accepttext()
ll_row = Getrow()
IF ll_row < 1 then return
	
is_scene = trim(string(this.object.spot_code[ll_row]))

end event

type dw_1 from datawindow within w_whscenebaldo_w2
integer x = 965
integer y = 204
integer width = 873
integer height = 96
integer taborder = 60
string dataobject = "d_oiscenecust_s"
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
	is_cust_no = this.getitemstring(this.getrow(), "cust_no")
	
	dw_2.retrieve(is_cust_no, id_start, id_end,'%')

end event

event itemerror;this.object.cust_no[1] = ''
is_cust_no = ''
if em_1.text = '' then
	em_1.setfocus()
elseif em_2.text = '' then
	em_2.setfocus()
elseif em_1.text > em_2.text then
	em_1.setfocus()
end if

return 2
end event

type st_2 from statictext within w_whscenebaldo_w2
integer x = 1362
integer y = 112
integer width = 55
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_whscenebaldo_w2
integer x = 1445
integer y = 100
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

type em_1 from editmask within w_whscenebaldo_w2
integer x = 965
integer y = 100
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

type pb_2 from picturebutton within w_whscenebaldo_w2
integer x = 1573
integer y = 472
integer width = 279
integer height = 144
integer taborder = 80
integer textsize = -10
integer weight = 400
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

type gb_4 from groupbox within w_whscenebaldo_w2
integer x = 27
integer y = 4
integer width = 891
integer height = 624
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "현장"
end type

type gb_2 from groupbox within w_whscenebaldo_w2
integer x = 923
integer y = 24
integer width = 937
integer height = 292
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79220952
string text = "출고기간"
end type

