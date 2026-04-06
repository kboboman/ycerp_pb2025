$PBExportHeader$w_whsale_w.srw
$PBExportComments$수주현황(2002/01/14,이인호)
forward 
global type w_whsale_w from window
end type
type cb_2 from commandbutton within w_whsale_w
end type
type st_item from statictext within w_whsale_w
end type
type st_qa from statictext within w_whsale_w
end type
type st_name from statictext within w_whsale_w
end type
type cb_1 from commandbutton within w_whsale_w
end type
type em_2 from editmask within w_whsale_w
end type
type st_2 from statictext within w_whsale_w
end type
type em_1 from editmask within w_whsale_w
end type
type dw_1 from datawindow within w_whsale_w
end type
end forward

global type w_whsale_w from window
integer x = 23
integer y = 288
integer width = 3890
integer height = 1100
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
boolean center = true
cb_2 cb_2
st_item st_item
st_qa st_qa
st_name st_name
cb_1 cb_1
em_2 em_2
st_2 st_2
em_1 em_1
dw_1 dw_1
end type
global w_whsale_w w_whsale_w

type variables
Integer	 ii_WindowBorder = 15
string is_loc, is_FLAG, is_area
end variables

forward prototypes
public subroutine wf_ret (string as_flag)
end prototypes

public subroutine wf_ret (string as_flag);date   ld_start, ld_end
long   ll_row
string ls_item, ls_qa

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
ls_item  = st_item.text
ls_qa    = st_qa.text

if as_flag = 'ISSUE' THEN
	ll_row = dw_1.retrieve(ld_start, ld_end, ls_item, ls_qa, is_loc)
else
	ll_row = dw_1.retrieve('S0001', ld_start, ld_end, ls_item, ls_qa)
	dw_1.setfilter('corder <> 0')
	dw_1.filter()
end if

if ll_row = 0 then
	MessageBox("확인", "해당하는 데이터가 존재하지 않습니다.")
end if
end subroutine

on w_whsale_w.create
this.cb_2=create cb_2
this.st_item=create st_item
this.st_qa=create st_qa
this.st_name=create st_name
this.cb_1=create cb_1
this.em_2=create em_2
this.st_2=create st_2
this.em_1=create em_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.st_item,&
this.st_qa,&
this.st_name,&
this.cb_1,&
this.em_2,&
this.st_2,&
this.em_1,&
this.dw_1}
end on

on w_whsale_w.destroy
destroy(this.cb_2)
destroy(this.st_item)
destroy(this.st_qa)
destroy(this.st_name)
destroy(this.cb_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.dw_1)
end on

event open;
CHOOSE CASE UPPER(trim(gs_print_control))
	CASE 'SALE'
		this.title = '수주현황(w_whsale_w)    -  SIZE가 조정가능합니다....'
		dw_1.dataobject = 'd_whsale_w'
		
	CASE 'ISSUE'
		this.title = '출고현황(w_whsale_w)    -  SIZE가 조정가능합니다....'
		dw_1.dataobject = 'd_whissue_w'
	CASE else
		dw_1.dataobject = 'd_whsale_w'
END CHOOSE
dw_1.settransobject(sqlca)

end event

event resize;//dw_1.Resize (this.WorkSpaceWidth(), this.WorkSpaceHeight() - dw_1.Y)

dw_1.Resize(newwidth - (2 * ii_WindowBorder), newheight - (dw_1.Y + ii_WindowBorder))

end event

type cb_2 from commandbutton within w_whsale_w
boolean visible = false
integer x = 1033
integer y = 28
integer width = 192
integer height = 68
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종료"
boolean cancel = true
end type

event clicked;close(parent)
end event

type st_item from statictext within w_whsale_w
integer x = 3429
integer y = 28
integer width = 375
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "st_item"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_qa from statictext within w_whsale_w
integer x = 2761
integer y = 28
integer width = 654
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "st_qa"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_name from statictext within w_whsale_w
integer x = 1120
integer y = 28
integer width = 1632
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "st_name"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whsale_w
integer x = 827
integer y = 20
integer width = 283
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;wf_ret(is_FLAG)
end event

type em_2 from editmask within w_whsale_w
integer x = 466
integer y = 24
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

type st_2 from statictext within w_whsale_w
integer x = 398
integer y = 16
integer width = 50
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

type em_1 from editmask within w_whsale_w
integer x = 46
integer y = 24
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

type dw_1 from datawindow within w_whsale_w
integer x = 41
integer y = 120
integer width = 3762
integer height = 824
integer taborder = 30
string dataobject = "d_whsale_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

