$PBExportHeader$w_whymd_w.srw
$PBExportComments$해당기간검색윈도우(1998/02/11,곽용덕)
forward
global type w_whymd_w from w_inheritance
end type
type st_1 from statictext within w_whymd_w
end type
type em_1 from editmask within w_whymd_w
end type
type em_2 from editmask within w_whymd_w
end type
type st_2 from statictext within w_whymd_w
end type
end forward

global type w_whymd_w from w_inheritance
integer x = 1097
integer y = 804
integer width = 1477
integer height = 384
string title = "해당기간(w_whymd_w)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
end type
global w_whymd_w w_whymd_w

type variables
gs_where istr_where
end variables

on w_whymd_w.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
end on

on w_whymd_w.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
end on

event open;em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
end event

type pb_save from w_inheritance`pb_save within w_whymd_w
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_whymd_w
boolean visible = false
end type

type dw_2 from w_inheritance`dw_2 within w_whymd_w
boolean visible = false
end type

type st_title from w_inheritance`st_title within w_whymd_w
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whymd_w
end type

type pb_compute from w_inheritance`pb_compute within w_whymd_w
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_whymd_w
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whymd_w
integer x = 1111
integer y = 184
integer width = 334
integer height = 96
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
end type

event pb_close::clicked;call super::clicked;istr_where.chk = 'N'
CloseWithReturn(parent, istr_where)
end event

event pb_close::mousemove;return 1
end event

type pb_print from w_inheritance`pb_print within w_whymd_w
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_whymd_w
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_whymd_w
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_whymd_w
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_whymd_w
integer x = 677
integer y = 184
integer width = 334
integer height = 96
integer taborder = 80
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "C:\bmp\사본 - BTN_OK2.BMP"
end type

event pb_retrieve::clicked;call super::clicked;string ls_data1,ls_data2

em_1.getdata(ls_data1); em_2.getdata(ls_data2)
ls_data1 = trim(ls_data1)
ls_data2 = trim(ls_data2)

if isdate(em_1.text) = false then
	if isnull(ls_data1) or ls_data1 = "" then
		em_1.text = '1990/01/01'
	else
	   return
	end if
end if

if isdate(em_2.text) = false then
	if isnull(ls_data2) or ls_data2 = "" then
		em_2.text = '2050/01/01'
	else
	   return
	end if
end if

if date(em_1.text) > date(em_2.text) then return    
istr_where.str1 = em_1.text
istr_where.str2 = em_2.text
istr_where.chk = 'Y'
CloseWithReturn(Parent, istr_where)
end event

event pb_retrieve::mousemove;return 1
end event

type gb_3 from w_inheritance`gb_3 within w_whymd_w
boolean visible = false
integer taborder = 100
end type

type gb_2 from w_inheritance`gb_2 within w_whymd_w
integer x = 18
integer y = 0
integer width = 1431
integer height = 168
integer taborder = 0
integer textsize = -10
end type

type gb_1 from w_inheritance`gb_1 within w_whymd_w
boolean visible = false
end type

type st_1 from statictext within w_whymd_w
integer x = 46
integer y = 52
integer width = 338
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_whymd_w
integer x = 389
integer y = 52
integer width = 466
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = " "
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_whymd_w
integer x = 946
integer y = 52
integer width = 466
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_whymd_w
integer x = 869
integer y = 28
integer width = 73
integer height = 104
boolean bringtotop = true
integer textsize = -26
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 77897888
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

