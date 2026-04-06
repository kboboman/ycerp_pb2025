$PBExportHeader$w_label_prt.srw
$PBExportComments$유압반 메인라벨
forward
global type w_label_prt from window
end type
type em_top from editmask within w_label_prt
end type
type st_6 from statictext within w_label_prt
end type
type em_left from editmask within w_label_prt
end type
type st_2 from statictext within w_label_prt
end type
type st_1 from statictext within w_label_prt
end type
type cb_3 from commandbutton within w_label_prt
end type
type cb_2 from commandbutton within w_label_prt
end type
type st_4 from statictext within w_label_prt
end type
type st_3 from statictext within w_label_prt
end type
type cb_1 from commandbutton within w_label_prt
end type
type dw_1 from datawindow within w_label_prt
end type
type st_5 from statictext within w_label_prt
end type
type dw_2 from datawindow within w_label_prt
end type
type ln_1 from line within w_label_prt
end type
end forward

global type w_label_prt from window
integer width = 3374
integer height = 2528
boolean titlebar = true
string title = "유압반 출력(w_label_prt)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_top em_top
st_6 st_6
em_left em_left
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_2 cb_2
st_4 st_4
st_3 st_3
cb_1 cb_1
dw_1 dw_1
st_5 st_5
dw_2 dw_2
ln_1 ln_1
end type
global w_label_prt w_label_prt

type variables
gs_where istr_where

end variables

forward prototypes
public subroutine wf_f2 ()
public subroutine wf_f12 ()
end prototypes

public subroutine wf_f2 ();//
gs_where lst_code
long   ll_row
string ls_dw1cnm
window lw_win

lst_code.str1 = istr_where.str1
lst_code.str2 = istr_where.str2
ls_dw1cnm = dw_1.getcolumnname()
ll_row = 1

choose case ls_dw1cnm
	case 'item_name'
		openwithparm(w_label_item, lst_code)
		dw_1.setcolumn('color')
	case 'color'
		openwithparm(w_label_color, lst_code)
		dw_1.setcolumn('rem')
	case 'rem'
		openwithparm(w_label_rem, lst_code)
		dw_1.setcolumn('qa')
	case 'qa'
		openwithparm(w_label_qa, lst_code)
		dw_1.setcolumn('box')
	case 'box'
		openwithparm(w_label_box, lst_code)
		dw_1.setcolumn('qty')
	case else
		return
end choose

lst_code = message.powerobjectparm
if lst_code.chk = "N" then return

dw_1.setitem(1, ls_dw1cnm, lst_code.str1)
dw_1.setitem(1, 'sno_' + ls_dw1cnm, lst_code.dec1)

end subroutine

public subroutine wf_f12 ();// 출력
long    ll_qty, ll_sno_item_name, ll_sno_qa, ll_inqty
integer li_page_qty, li_page_qty2, li_i
string  s, ls_left,  ls_right, ls_mgleft,  ls_mgtop
integer li_tab


dw_1.accepttext()
if dw_1.rowcount() < 1 then RETURN

if isnull(dw_1.object.sno_item_name[1]) OR dw_1.object.sno_item_name[1] = 0 then RETURN
if isnull(dw_1.object.sno_qa[1])        OR dw_1.object.sno_qa[1] = 0        then RETURN

ll_sno_item_name = dw_1.object.sno_item_name[1]
ll_sno_qa        = dw_1.object.sno_qa[1]

ll_inqty         = dw_1.object.qty[1]				// 수량
ll_qty           = long(dw_1.Object.box[1])		// BOX

//select isnull(b.qty,0) into :ll_qty
//  from label_itemmst a, label_boxmst b, label_qamst c
// where a.box_type = b.box_type
//   and b.qa  = c.qa
//   and a.sno = :ll_sno_item_name
//   and c.sno = :ll_sno_qa;
if ll_qty > 0 then 
	li_page_qty  = Truncate(ll_inqty / ll_qty  + 0.0000001, 0 )
	li_page_qty2 = mod(ll_inqty, ll_qty)
else
	li_page_qty  = 0
	li_page_qty2 = ll_inqty
end if



// 품명 부분에 2줄로 넣기 위한 스크립트(20090219)
s        = dw_1.Object.item_name[1]
li_tab   = PosA(s, "(", 1)
ls_left  = LeftA(s, li_tab - 1)
ls_right = '(' + MidA(s, li_tab + 1)

dw_2.object.item_name[1]  = ls_left
dw_2.Object.item_name2[1] = ls_right
dw_2.object.color[1]      = dw_1.object.color[1]
dw_2.object.rem[1]        = dw_1.object.rem[1]
dw_2.object.qa[1]         = dw_1.object.qa[1]
dw_2.object.m_date[1]     = dw_1.object.m_date[1]

// 프린트 마진
ls_mgleft = em_left.text
ls_mgtop  = em_top.text

SetProfileString("YCLINE.INI", "Database", "LEFT", ls_mgleft)
SetProfileString("YCLINE.INI", "Database", "TOP",  ls_mgtop)

dw_2.modify("DataWindow.print.margin.left = " + ls_mgleft )
dw_2.modify("DataWindow.print.margin.top  = " + ls_mgtop  )

for li_i = 1 to li_page_qty
	dw_2.object.qty[1] = ll_qty
	dw_2.Object.DataWindow.Print.Copies = 1
	dw_2.print()
next

if li_page_qty2 > 0 then
	dw_2.object.qty[1] = li_page_qty2
	dw_2.Object.DataWindow.Print.Copies = 1
	dw_2.print()
end if

end subroutine

on w_label_prt.create
this.em_top=create em_top
this.st_6=create st_6
this.em_left=create em_left
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_4=create st_4
this.st_3=create st_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_5=create st_5
this.dw_2=create dw_2
this.ln_1=create ln_1
this.Control[]={this.em_top,&
this.st_6,&
this.em_left,&
this.st_2,&
this.st_1,&
this.cb_3,&
this.cb_2,&
this.st_4,&
this.st_3,&
this.cb_1,&
this.dw_1,&
this.st_5,&
this.dw_2,&
this.ln_1}
end on

on w_label_prt.destroy
destroy(this.em_top)
destroy(this.st_6)
destroy(this.em_left)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_5)
destroy(this.dw_2)
destroy(this.ln_1)
end on

event open;//
dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = 130

dw_2.SetTransObject(SQLCA)
dw_2.visible = false

//istr_where = Message.PowerObjectParm
//st_3.text = istr_where.name

//dw_1.retrieve( gs_area, istr_where.str1, date(istr_where.str2) )

dw_2.Reset()
dw_2.InsertRow(0)

dw_1.insertrow(0)
dw_1.object.m_date[1] = gd_date
dw_1.setcolumn('item_name')
dw_1.setfocus()

end event

event closequery;IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

event key;choose case key
	case KeyF2!
		wf_F2()
	case KeyF12!
		wf_F12()
	case else
		return
end choose

end event

type em_top from editmask within w_label_prt
integer x = 2898
integer y = 432
integer width = 261
integer height = 64
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
boolean border = false
alignment alignment = center!
string mask = "##0"
end type

type st_6 from statictext within w_label_prt
integer x = 2533
integer y = 432
integer width = 370
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "상단여백:"
boolean focusrectangle = false
end type

type em_left from editmask within w_label_prt
integer x = 2231
integer y = 432
integer width = 261
integer height = 64
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
boolean border = false
alignment alignment = center!
string mask = "##0"
end type

type st_2 from statictext within w_label_prt
integer x = 1861
integer y = 432
integer width = 370
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "왼쪽여백:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_label_prt
integer x = 50
integer y = 432
integer width = 1627
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "같은 규격, 현장또는 거래처만 출력합니다."
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_label_prt
integer x = 27
integer y = 220
integer width = 914
integer height = 156
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F2: 각 항목 선택입력"
boolean cancel = true
end type

event clicked;// F2 : 각 항목 선택입력
wf_F2()

end event

type cb_2 from commandbutton within w_label_prt
integer x = 951
integer y = 220
integer width = 553
integer height = 156
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F12: 출력"
boolean cancel = true
end type

event clicked;// F12: 출력
wf_F12()

end event

type st_4 from statictext within w_label_prt
integer x = 32
integer y = 44
integer width = 3282
integer height = 116
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "유압반 출력(박스라벨)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_label_prt
boolean visible = false
integer x = 18
integer y = 36
integer width = 622
integer height = 128
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 16711935
string text = "라인 "
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_label_prt
integer x = 2766
integer y = 220
integer width = 553
integer height = 156
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

event clicked;istr_where.chk = "N"	
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_label_prt
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
string tag = "d_sfcdayuser_m"
integer x = 27
integer y = 524
integer width = 3291
integer height = 1888
integer taborder = 10
string title = "d_label_main"
string dataobject = "d_label_main"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_enter;//
Send(Handle(This), 256, 9, long(0,0))
Return 1
end event

event ue_key;//
choose case key
	case KeyF2!
		wf_F2()
	case KeyF12!
		wf_F12()
	case else
		return
end choose

end event

type st_5 from statictext within w_label_prt
integer x = 32
integer y = 16
integer width = 3291
integer height = 176
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_label_prt
integer x = 608
integer y = 884
integer width = 2254
integer height = 976
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_label_main_prt2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ln_1 from line within w_label_prt
long linecolor = 128
integer linethickness = 8
integer beginx = 27
integer beginy = 408
integer endx = 3319
integer endy = 408
end type

