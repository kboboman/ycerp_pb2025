$PBExportHeader$w_whsaledodet_w.srw
$PBExportComments$수주로 출고조회현황(2002/04/27,이인호)
forward
global type w_whsaledodet_w from window
end type
type cb_1 from commandbutton within w_whsaledodet_w
end type
type em_1 from editmask within w_whsaledodet_w
end type
type pb_1 from picturebutton within w_whsaledodet_w
end type
type tab_1 from tab within w_whsaledodet_w
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
type tab_1 from tab within w_whsaledodet_w
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_whsaledodet_w from window
integer x = 23
integer y = 288
integer width = 3785
integer height = 1900
boolean titlebar = true
string title = "출고/수주현황(w_whsaledodet_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_1 cb_1
em_1 em_1
pb_1 pb_1
tab_1 tab_1
end type
global w_whsaledodet_w w_whsaledodet_w

type variables
datawindow dw1, dw2
ws_process st_process

end variables

on w_whsaledodet_w.create
this.cb_1=create cb_1
this.em_1=create em_1
this.pb_1=create pb_1
this.tab_1=create tab_1
this.Control[]={this.cb_1,&
this.em_1,&
this.pb_1,&
this.tab_1}
end on

on w_whsaledodet_w.destroy
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.pb_1)
destroy(this.tab_1)
end on

event open;dw1 = tab_1.tabpage_1.dw_1
dw2 = tab_1.tabpage_2.dw_2
dw1.settransobject(sqlca)
dw2.settransobject(sqlca)
em_1.text = 'HD' + string(today(),'yyyy')


st_process = Message.PowerObjectParm
if isnull(st_process.sale_no) or trim(st_process.sale_no) = '' then
else
	em_1.text = LeftA(st_process.sale_no,10) + MidA(st_process.sale_no,12,3)
	pb_1.postevent(clicked!)
end if

end event

type cb_1 from commandbutton within w_whsaledodet_w
integer x = 3109
integer y = 4
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;CloseWithReturn(parent, st_process)

end event

type em_1 from editmask within w_whsaledodet_w
integer x = 1097
integer y = 8
integer width = 480
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
end type

event modified;pb_1.DEFAULT = true

end event

type pb_1 from picturebutton within w_whsaledodet_w
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

ls_order = trim(em_1.text)
if tab_1.selectedtab = 1 then
	dw1.retrieve(ls_order)
else
	dw2.retrieve(ls_order)
end if
THIS.DEFAULT = false
em_1.setfocus()

end event

type tab_1 from tab within w_whsaledodet_w
event create ( )
event destroy ( )
integer x = 14
integer y = 16
integer width = 3749
integer height = 1796
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
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

event selectionchanged;pb_1.postevent(clicked!)
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3712
integer height = 1668
long backcolor = 79741120
string text = "출고현황"
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
integer width = 3698
integer height = 1644
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_whsaledodet_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
integer width = 3712
integer height = 1668
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
integer width = 3712
integer height = 1648
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

