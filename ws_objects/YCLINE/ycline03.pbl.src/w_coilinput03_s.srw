$PBExportHeader$w_coilinput03_s.srw
$PBExportComments$코일투입 현황조회
forward
global type w_coilinput03_s from window
end type
type st_1 from statictext within w_coilinput03_s
end type
type cb_f01 from commandbutton within w_coilinput03_s
end type
type cb_f08 from commandbutton within w_coilinput03_s
end type
type cb_f07 from commandbutton within w_coilinput03_s
end type
type cb_f06 from commandbutton within w_coilinput03_s
end type
type cb_f05 from commandbutton within w_coilinput03_s
end type
type cb_f04 from commandbutton within w_coilinput03_s
end type
type cb_f03 from commandbutton within w_coilinput03_s
end type
type cb_1 from commandbutton within w_coilinput03_s
end type
type st_8 from statictext within w_coilinput03_s
end type
type cb_esc from commandbutton within w_coilinput03_s
end type
type dw_1 from datawindow within w_coilinput03_s
end type
end forward

global type w_coilinput03_s from window
integer width = 4425
integer height = 2104
boolean titlebar = true
string title = "코일재고(w_coilinput03_s)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_f01 cb_f01
cb_f08 cb_f08
cb_f07 cb_f07
cb_f06 cb_f06
cb_f05 cb_f05
cb_f04 cb_f04
cb_f03 cb_f03
cb_1 cb_1
st_8 st_8
cb_esc cb_esc
dw_1 dw_1
end type
global w_coilinput03_s w_coilinput03_s

type variables
gs_coils istr_where
string ls_cur = 'dw2'
boolean ib_f3 = true, ib_f4 = true, ib_f5 = true, ib_f6 = true, ib_f7 = true, ib_f8 = true
end variables

on w_coilinput03_s.create
this.st_1=create st_1
this.cb_f01=create cb_f01
this.cb_f08=create cb_f08
this.cb_f07=create cb_f07
this.cb_f06=create cb_f06
this.cb_f05=create cb_f05
this.cb_f04=create cb_f04
this.cb_f03=create cb_f03
this.cb_1=create cb_1
this.st_8=create st_8
this.cb_esc=create cb_esc
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_f01,&
this.cb_f08,&
this.cb_f07,&
this.cb_f06,&
this.cb_f05,&
this.cb_f04,&
this.cb_f03,&
this.cb_1,&
this.st_8,&
this.cb_esc,&
this.dw_1}
end on

on w_coilinput03_s.destroy
destroy(this.st_1)
destroy(this.cb_f01)
destroy(this.cb_f08)
destroy(this.cb_f07)
destroy(this.cb_f06)
destroy(this.cb_f05)
destroy(this.cb_f04)
destroy(this.cb_f03)
destroy(this.cb_1)
destroy(this.st_8)
destroy(this.cb_esc)
destroy(this.dw_1)
end on

event open;//
dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution


end event

event key;//
long ll_row

if key = KeyF1! then
	gs_where lst_code
	lst_code.str1 = 'X'
	openwithparm(w_loc03, lst_code) 
	lst_code = message.powerobjectparm
	if lst_code.chk = "N" then return

	st_8.text  = lst_code.name
	dw_1.Retrieve(lst_code.str1, 'W')
	dw_1.setfocus()
	return
end if

ll_row = dw_1.getrow()
if ll_row < 1 then return

choose case key
	case KeyF3!
		if ib_f3 then
			dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
		else
			dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
		end if
		ib_f3 = not (ib_f3)
		
	case KeyF4!
		if ib_f4 then
			dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
		else
			dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
		end if
		ib_f4 = not (ib_f4)
		
	case KeyF5!
		if ib_f5 then
			dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
		else
			dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
		end if
		ib_f5 = not (ib_f5)
		
	case KeyF6!
		if ib_f6 then
			dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
		else
			dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
		end if
		ib_f6 = not (ib_f6)
		
	case KeyF7!
		if ib_f7 then
			dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
		else
			dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
		end if
		ib_f7 = not (ib_f7)
		
	case KeyF8!
		if ib_f8 then
			dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
		else
			dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
		end if
		ib_f8 = not (ib_f8)
		
	case else
		return
end choose
dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

event resize;//
dw_1.width  = newwidth  - 91
dw_1.height = newheight - 412

end event

type st_1 from statictext within w_coilinput03_s
integer x = 1083
integer y = 148
integer width = 517
integer height = 128
integer textsize = -22
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_f01 from commandbutton within w_coilinput03_s
integer x = 37
integer y = 20
integer width = 681
integer height = 116
integer taborder = 90
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F1:저장소 검색"
boolean cancel = true
end type

event clicked;// F1:저장소 검색
gs_where lst_code

lst_code.str1 = 'X'
openwithparm(w_loc03, lst_code)
lst_code = message.powerobjectparm
if lst_code.chk = "N" then return

st_8.text  = lst_code.name
dw_1.Retrieve(lst_code.str1, 'W')
dw_1.setfocus()

end event

type cb_f08 from commandbutton within w_coilinput03_s
integer x = 3090
integer y = 20
integer width = 361
integer height = 116
integer taborder = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F8:품명"
boolean cancel = true
end type

event clicked;//
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f8 then
	dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
else
	dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
end if
ib_f8 = not (ib_f8)

dw_1.sort()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type cb_f07 from commandbutton within w_coilinput03_s
integer x = 2720
integer y = 20
integer width = 361
integer height = 116
integer taborder = 70
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F7:갯수"
boolean cancel = true
end type

event clicked;//
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f7 then
	dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
else
	dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
end if
ib_f7 = not (ib_f7)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type cb_f06 from commandbutton within w_coilinput03_s
integer x = 2350
integer y = 20
integer width = 361
integer height = 116
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F6:단중"
boolean cancel = true
end type

event clicked;//
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f6 then
	dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
else
	dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
end if
ib_f6 = not (ib_f6)

dw_1.sort()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type cb_f05 from commandbutton within w_coilinput03_s
integer x = 1979
integer y = 20
integer width = 361
integer height = 116
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F5:폭"
boolean cancel = true
end type

event clicked;//
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f5 then
	dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
else
	dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
end if
ib_f5 = not (ib_f5)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type cb_f04 from commandbutton within w_coilinput03_s
integer x = 1609
integer y = 20
integer width = 361
integer height = 116
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F4:두께"
boolean cancel = true
end type

event clicked;//
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f4 then
	dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
else
	dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
end if
ib_f4 = not (ib_f4)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type cb_f03 from commandbutton within w_coilinput03_s
integer x = 1083
integer y = 20
integer width = 517
integer height = 116
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F3:코일번호"
boolean cancel = true
end type

event clicked;//
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f3 then
	dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
else
	dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
end if
ib_f3 = not (ib_f3)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type cb_1 from commandbutton within w_coilinput03_s
integer x = 750
integer y = 20
integer width = 320
integer height = 116
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "정렬:"
boolean cancel = true
end type

event clicked;//
dw_1.setfocus()

end event

type st_8 from statictext within w_coilinput03_s
integer x = 32
integer y = 148
integer width = 1038
integer height = 128
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 16711680
string text = "NONE"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_esc from commandbutton within w_coilinput03_s
integer x = 3470
integer y = 20
integer width = 901
integer height = 116
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_coilinput03_s
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
integer x = 37
integer y = 284
integer width = 4334
integer height = 1692
integer taborder = 10
string title = "none"
string dataobject = "d_coilinput03_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;//
long ll_row

if key = KeyF1! then
	gs_where lst_code
	lst_code.str1 = 'X'
	openwithparm(w_loc03, lst_code)
	lst_code = message.powerobjectparm
	if lst_code.chk = "N" then return

	st_8.text  = lst_code.name
	dw_1.Retrieve(lst_code.str1, 'S')
	dw_1.setfocus()
	return
end if

ll_row = this.getrow()
if ll_row < 1 then return

choose case key
	case KeyF3!
		if ib_f3 then
			dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
		else
			dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
		end if
		ib_f3 = not (ib_f3)
		
	case KeyF4!
		if ib_f4 then
			dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
		else
			dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
		end if
		ib_f4 = not (ib_f4)
		
	case KeyF5!
		if ib_f5 then
			dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
		else
			dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
		end if
		ib_f5 = not (ib_f5)
		
	case KeyF6!
		if ib_f6 then
			dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
		else
			dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
		end if
		ib_f6 = not (ib_f6)
		
	case KeyF7!
		if ib_f7 then
			dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
		else
			dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
		end if
		ib_f7 = not (ib_f7)
		
	case KeyF8!
		if ib_f8 then
			dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
		else
			dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
		end if
		ib_f8 = not (ib_f8)
		
	case else
		return
end choose
dw_1.sort()
this.scrolltorow(ll_row)

end event

event getfocus;this.Object.DataWindow.Color = rgb(255,0,255)

end event

event losefocus;this.Object.DataWindow.Color = 78682240

end event

