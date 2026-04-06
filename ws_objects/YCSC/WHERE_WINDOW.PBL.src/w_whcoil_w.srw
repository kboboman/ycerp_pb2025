$PBExportHeader$w_whcoil_w.srw
$PBExportComments$코일조회(2003/06/20,이인호)
forward
global type w_whcoil_w from window
end type
type cb_9 from commandbutton within w_whcoil_w
end type
type cb_8 from commandbutton within w_whcoil_w
end type
type cb_7 from commandbutton within w_whcoil_w
end type
type cb_6 from commandbutton within w_whcoil_w
end type
type cb_5 from commandbutton within w_whcoil_w
end type
type cb_4 from commandbutton within w_whcoil_w
end type
type cb_3 from commandbutton within w_whcoil_w
end type
type dw_2 from datawindow within w_whcoil_w
end type
type st_6 from statictext within w_whcoil_w
end type
type st_1 from statictext within w_whcoil_w
end type
type cb_2 from commandbutton within w_whcoil_w
end type
type cb_1 from commandbutton within w_whcoil_w
end type
type dw_1 from datawindow within w_whcoil_w
end type
end forward

global type w_whcoil_w from window
integer width = 3127
integer height = 2040
boolean titlebar = true
string title = "코일선택(w_whcoil_w)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
dw_2 dw_2
st_6 st_6
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_whcoil_w w_whcoil_w

type variables
gs_coil istr_where
boolean ib_f1 = true, ib_f2 = true, ib_f3 = true, ib_f4 = true, ib_f5 = true, ib_f6 = true
end variables

on w_whcoil_w.create
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_2=create dw_2
this.st_6=create st_6
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.dw_2,&
this.st_6,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_whcoil_w.destroy
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.st_6)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.SetTransObject(SQLCA)
dw_2.insertrow(0)
istr_where = Message.PowerObjectParm
dw_2.setfocus()

string ls_loc, ls_name

ls_loc = istr_where.loc_no

select loc_name into :ls_name from location
where loc_no = :ls_loc;
this.title = this.title + '[' + trim(ls_name) + ']'
end event

type cb_9 from commandbutton within w_whcoil_w
integer x = 2331
integer y = 112
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품명"
end type

event clicked;if ib_f6 then
	dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
else
	dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
end if
ib_f6 = not (ib_f6)
dw_1.sort()
end event

type cb_8 from commandbutton within w_whcoil_w
integer x = 1929
integer y = 112
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "갯수"
end type

event clicked;if ib_f5 then
	dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
else
	dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
end if
ib_f5 = not (ib_f5)
dw_1.sort()
end event

type cb_7 from commandbutton within w_whcoil_w
integer x = 1527
integer y = 112
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단중"
end type

event clicked;if ib_f4 then
	dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
else
	dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
end if
ib_f4 = not (ib_f4)
dw_1.sort()
end event

type cb_6 from commandbutton within w_whcoil_w
integer x = 1125
integer y = 112
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "폭"
end type

event clicked;if ib_f3 then
	dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
else
	dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
end if
ib_f3 = not (ib_f3)
dw_1.sort()
end event

type cb_5 from commandbutton within w_whcoil_w
integer x = 722
integer y = 112
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "두께"
end type

event clicked;if ib_f2 then
	dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
else
	dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
end if
ib_f2 = not (ib_f2)
dw_1.sort()
end event

type cb_4 from commandbutton within w_whcoil_w
integer x = 320
integer y = 112
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "코일번호"
end type

event clicked;if ib_f1 then
	dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
else
	dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
end if
ib_f1 = not (ib_f1)
dw_1.sort()
end event

type cb_3 from commandbutton within w_whcoil_w
integer x = 2793
integer y = 16
integer width = 288
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;long ll_row, ll_cnt, ll_unit_qty, ll_pos
dec{1} ld_wid
string ls_string, ls_coil, ls_qa, ls_loc

dw_2.accepttext()
cb_3.default = false
ls_loc = istr_where.loc_no
ls_coil = trim(dw_2.object.coil_no[1])
if isnull(ls_coil) or trim(ls_coil) = '' then
	ls_coil = '%'
else
	ls_coil = '%' + trim(dw_2.object.coil_no[1]) + '%'
end if
ls_qa = trim(dw_2.object.qa[1])
if isnull(ls_qa) or trim(ls_qa) = '' then
	ls_qa = '%'
else
	ll_pos = PosA(ls_qa, '.')
	if ll_pos > 0 then
		ls_qa = ReplaceA(ls_qa, ll_pos, 1, '')
	end if
	ls_qa = ls_qa + '%'
end if
ld_wid = dw_2.object.wid[1]
if isnull(ld_wid) then ld_wid = 0
ll_unit_qty = dw_2.object.unit_qty[1]
if isnull(ll_unit_qty) then ll_unit_qty = 0
if dw_1.retrieve(ls_loc, ls_coil, ls_qa, ld_wid, ll_unit_qty) < 1 then
	dw_2.setcolumn('coil_no')
end if

end event

type dw_2 from datawindow within w_whcoil_w
event ue_enter pbm_dwnprocessenter
integer x = 233
integer y = 16
integer width = 2555
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "d_whcoilserch_s"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemerror;

//choose case dwo.name
//	case 'coil_no'
//	case 'qa'
//	case 'wid'
//			this.object.wid[row] = 0.0
//	case 'unit_qty'
//			this.object.unit_qty[row] = 0
//end choose
//return 2
end event

event itemchanged;
//long ll_row, ll_cnt, ll_unit_qty, ll_pos
//dec{1} ld_wid
//string ls_string, ls_coil, ls_qa
//
//this.accepttext()
//choose case dwo.name
//	case 'coil_no'
//	case 'qa'
//	case 'wid'
//		if isnull(data) then return 1
////			IF isnull(this.object.wid[1]) then this.object.wid[1] = 0
//	case 'unit_qty'
//		if isnull(data) then return 1
////			IF isnull(this.object.unit_qty[1]) then this.object.unit_qty[1] = 0
//end choose
//return 0
////return 0
//
end event

event getfocus;cb_3.default = true
end event

type st_6 from statictext within w_whcoil_w
integer x = 73
integer y = 32
integer width = 187
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "검색:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_whcoil_w
integer x = 73
integer y = 132
integer width = 187
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "정렬:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_whcoil_w
integer x = 2103
integer y = 1836
integer width = 457
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;istr_where.chk = "N"	
closewithreturn(parent, istr_where)

end event

type cb_1 from commandbutton within w_whcoil_w
integer x = 2651
integer y = 1836
integer width = 430
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
	istr_where.coil_no = dw_1.object.coil_no[ll_row]
	istr_where.loc_no = dw_1.object.loc_no[ll_row]
	istr_where.item_no = dw_1.object.item_no[ll_row]
	istr_where.item_name = dw_1.object.groupitem_item_name[ll_row]
	istr_where.qa = dw_1.object.qa[ll_row]
	istr_where.qcnt = dw_1.object.qcnt[ll_row]
	istr_where.length = dw_1.object.length[ll_row]
	istr_where.wid = dw_1.object.wid[ll_row]
	istr_where.unit_qty = dw_1.object.unit_qty[ll_row]
	istr_where.etc_no = dw_1.object.coilmst_etc_no[ll_row]
	istr_where.uom = dw_1.object.uom[ll_row]
	
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whcoil_w
integer x = 18
integer y = 212
integer width = 3067
integer height = 1612
integer taborder = 20
string title = "none"
string dataobject = "d_whcoil_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row < 1 then return

cb_1.postevent(clicked!)
end event

