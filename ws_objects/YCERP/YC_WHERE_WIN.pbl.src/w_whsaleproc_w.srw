$PBExportHeader$w_whsaleproc_w.srw
$PBExportComments$진행/수주현황(2002/04/27,이인호)
forward 
global type w_whsaleproc_w from window
end type
type pb_1 from picturebutton within w_whsaleproc_w
end type
type sle_1 from singlelineedit within w_whsaleproc_w
end type
type tab_1 from tab within w_whsaleproc_w
end type
type tabpage_1 from userobject within tab_1
end type
type st_33 from statictext within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_33 st_33
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tab_1 from tab within w_whsaleproc_w
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_whsaleproc_w from window
integer x = 23
integer y = 288
integer width = 3808
integer height = 1340
boolean titlebar = true
string title = "진행/수주현황(w_whsaleproc_w)"
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 79741120
boolean center = true
pb_1 pb_1
sle_1 sle_1
tab_1 tab_1
end type
global w_whsaleproc_w w_whsaleproc_w

type variables
datawindow dw1, dw2
end variables

on w_whsaleproc_w.create
this.pb_1=create pb_1
this.sle_1=create sle_1
this.tab_1=create tab_1
this.Control[]={this.pb_1,&
this.sle_1,&
this.tab_1}
end on

on w_whsaleproc_w.destroy
destroy(this.pb_1)
destroy(this.sle_1)
destroy(this.tab_1)
end on

event open;//
dw1 = tab_1.tabpage_1.dw_1
dw2 = tab_1.tabpage_2.dw_2

dw1.settransobject(sqlca)
dw2.settransobject(sqlca)

end event

type pb_1 from picturebutton within w_whsaleproc_w
event type long mousemove ( unsignedlong flags,  integer xpos,  integer ypos )
integer x = 1595
integer width = 187
integer height = 116
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;string ls_order

ls_order = trim(SLE_1.text)
if tab_1.selectedtab = 0 then
	if gs_print_control = 'PROC' then
		tab_1.selecttab(1)
		dw1.setredraw(false)
		dw1.retrieve(ls_order)
		dw1.setredraw(true)
	else
		tab_1.selecttab(2)
		dw2.retrieve(ls_order)
	end if
else
	if tab_1.selectedtab = 1 then
		dw1.setredraw(false)
		dw1.retrieve(ls_order)
		dw1.setredraw(true)
	else
		dw2.retrieve(ls_order)
	end if
end if
THIS.DEFAULT = false
SLE_1.setfocus()

end event

type sle_1 from singlelineedit within w_whsaleproc_w
integer x = 969
integer y = 12
integer width = 613
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

event modified;pb_1.DEFAULT = true

end event

type tab_1 from tab within w_whsaleproc_w
event create ( )
event destroy ( )
integer x = 18
integer y = 20
integer width = 3753
integer height = 1208
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3717
integer height = 1080
long backcolor = 79741120
string text = "진행현황"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Library!"
long picturemaskcolor = 553648127
st_33 st_33
dw_1 dw_1
end type

on tabpage_1.create
this.st_33=create st_33
this.dw_1=create dw_1
this.Control[]={this.st_33,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.st_33)
destroy(this.dw_1)
end on

type st_33 from statictext within tabpage_1
integer x = 562
integer y = 128
integer width = 2094
integer height = 220
boolean bringtotop = true
integer textsize = -20
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "생산계획 자료가 없습니다"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within tabpage_1
integer y = 16
integer width = 3703
integer height = 1056
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_mpproc1106_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_row,ll_found
string ls_item,ls_itemname,ls_qa


CHOOSE CASE dwo.name
	CASE 'groupitem_item_name', 'routtempnew_assy_qa'

	open(w_mpjaegoc_r)

	ll_row = this.getrow()
	if ll_row < 1 then return
	ls_item = trim(this.object.routtempnew_assy_item[ll_row])
	ls_itemname = trim(this.object.groupitem_item_name[ll_row])
	ls_qa   = trim(this.object.routtempnew_assy_qa[ll_row])
	//dw_2.reset()
	//dw_3.reset()
	w_mpjaegoc_r.dw_1.object.item_no[1] = ls_item
	w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
	w_mpjaegoc_r.dw_2.retrieve(ls_item)
	ll_found = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
	if ll_found > 0 then
		w_mpjaegoc_r.dw_2.scrolltorow(ll_found)
	end if
END CHOOSE


end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3717
integer height = 1080
long backcolor = 79741120
string text = "수주현황"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
integer y = 16
integer width = 3703
integer height = 1056
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_mpproc1106_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_row,ll_found
string ls_item,ls_itemname,ls_qa


CHOOSE CASE dwo.name
	CASE 'item_no', 'qa', 'groupitem_item_name'

	open(w_mpjaegoc_r)

	ll_row = this.getrow()
	if ll_row < 1 then return
	ls_item = trim(this.object.item_no[ll_row])
	ls_itemname = trim(this.object.groupitem_item_name[ll_row])
	ls_qa   = trim(this.object.qa[ll_row])
	//dw_2.reset()
	//dw_3.reset()
	w_mpjaegoc_r.dw_1.object.item_no[1] = ls_item
	w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
	w_mpjaegoc_r.dw_2.retrieve(ls_item)
	ll_found = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
	if ll_found > 0 then
		w_mpjaegoc_r.dw_2.scrolltorow(ll_found)
	end if
END CHOOSE


end event

