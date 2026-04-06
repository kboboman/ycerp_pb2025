$PBExportHeader$w_whusersilsa_w.srw
$PBExportComments$담당자별실사품목선택(2003/07/16,이인호)
forward
global type w_whusersilsa_w from window
end type
type rb_7 from radiobutton within w_whusersilsa_w
end type
type rb_6 from radiobutton within w_whusersilsa_w
end type
type rb_5 from radiobutton within w_whusersilsa_w
end type
type cb_2 from commandbutton within w_whusersilsa_w
end type
type cbx_2 from checkbox within w_whusersilsa_w
end type
type rb_2 from radiobutton within w_whusersilsa_w
end type
type rb_1 from radiobutton within w_whusersilsa_w
end type
type cbx_1 from checkbox within w_whusersilsa_w
end type
type cb_1 from commandbutton within w_whusersilsa_w
end type
type pb_1 from picturebutton within w_whusersilsa_w
end type
type dw_2 from datawindow within w_whusersilsa_w
end type
type dw_1 from datawindow within w_whusersilsa_w
end type
type em_1 from editmask within w_whusersilsa_w
end type
type pb_2 from picturebutton within w_whusersilsa_w
end type
type gb_4 from groupbox within w_whusersilsa_w
end type
type gb_2 from groupbox within w_whusersilsa_w
end type
type rb_4 from radiobutton within w_whusersilsa_w
end type
type rb_3 from radiobutton within w_whusersilsa_w
end type
type sle_1 from singlelineedit within w_whusersilsa_w
end type
type gb_1 from groupbox within w_whusersilsa_w
end type
end forward

global type w_whusersilsa_w from window
integer x = 183
integer y = 300
integer width = 2048
integer height = 2008
boolean titlebar = true
string title = "실사 참조추가(w_whusersilsa_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
cb_2 cb_2
cbx_2 cbx_2
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
cb_1 cb_1
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
em_1 em_1
pb_2 pb_2
gb_4 gb_4
gb_2 gb_2
rb_4 rb_4
rb_3 rb_3
sle_1 sle_1
gb_1 gb_1
end type
global w_whusersilsa_w w_whusersilsa_w

type variables
gs_where2 istr_where
int ii_sw = 0

end variables

forward prototypes
public subroutine wf_filter ()
end prototypes

public subroutine wf_filter ();string ls_filter, ls_fil2

if trim(sle_1.text) = '' then
	if rb_5.checked = true then
		ls_filter = ''
	else
		ls_filter = 'eom_qoh <> 0'
	end if
	
else
	CHOOSE CASE rb_3.checked
		CASE true
			ls_filter = '(item_no like "' + trim(sle_1.text) + '%")'
		CASE ELSE
			ls_filter = '(groupitem_item_name like "%' + trim(sle_1.text) + '%")'
	END CHOOSE
	if rb_5.checked = true then
		ls_fil2 = ''
	else
		ls_fil2 = ' and eom_qoh <> 0'
	end if
	ls_filter = ls_filter + ls_fil2
end if
dw_2.setfilter(ls_filter)
dw_2.filter()
cb_2.DEFAULT = false
dw_2.setfocus()


//dw_2.setfilter(eom_qoh
end subroutine

on w_whusersilsa_w.create
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.cb_2=create cb_2
this.cbx_2=create cbx_2
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.em_1=create em_1
this.pb_2=create pb_2
this.gb_4=create gb_4
this.gb_2=create gb_2
this.rb_4=create rb_4
this.rb_3=create rb_3
this.sle_1=create sle_1
this.gb_1=create gb_1
this.Control[]={this.rb_7,&
this.rb_6,&
this.rb_5,&
this.cb_2,&
this.cbx_2,&
this.rb_2,&
this.rb_1,&
this.cbx_1,&
this.cb_1,&
this.pb_1,&
this.dw_2,&
this.dw_1,&
this.em_1,&
this.pb_2,&
this.gb_4,&
this.gb_2,&
this.rb_4,&
this.rb_3,&
this.sle_1,&
this.gb_1}
end on

on w_whusersilsa_w.destroy
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.cb_2)
destroy(this.cbx_2)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.sle_1)
destroy(this.gb_1)
end on

event open;dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_1.insertrow(0)
istr_where = message.powerobjectparm

em_1.text = istr_where.str1[1]
dw_1.object.user_id[1] = istr_where.str2[1]
//em_1.text = string(today(),'yyyy/mm')

cbx_2.enabled = true
cbx_2.checked = false
em_1.enabled = true
dw_1.enabled = true
dw_1.object.user_id.background.color =  rgb(255,255,255)





end event

type rb_7 from radiobutton within w_whusersilsa_w
integer x = 1006
integer y = 116
integer width = 576
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "현재고있는 품목"
end type

event clicked;cbx_2.enabled = false
cbx_2.checked = false
em_1.enabled = false
dw_1.enabled = false
dw_1.object.user_id.background.color =  rgb(192,192,192)
dw_2.dataobject = 'd_irusersilsa_s0'
dw_2.SetTransObject(SQLCA)

end event

type rb_6 from radiobutton within w_whusersilsa_w
integer x = 311
integer y = 1800
integer width = 736
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "재고가 0 이 아닌것만"
end type

event clicked;wf_filter()
end event

type rb_5 from radiobutton within w_whusersilsa_w
integer x = 37
integer y = 1800
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;wf_filter()
end event

type cb_2 from commandbutton within w_whusersilsa_w
integer x = 1285
integer y = 220
integer width = 224
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;wf_filter()
end event

type cbx_2 from checkbox within w_whusersilsa_w
integer x = 370
integer y = 16
integer width = 229
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "전체"
end type

event clicked;if this.checked = true then
	dw_1.enabled = false
	dw_1.object.user_id.background.color =  rgb(192,192,192)
else
	dw_1.enabled = true
	dw_1.object.user_id.background.color =  rgb(255,255,255)
end if

end event

type rb_2 from radiobutton within w_whusersilsa_w
integer x = 1006
integer y = 52
integer width = 347
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "이전실사"
boolean checked = true
end type

event clicked;cbx_2.enabled = true
cbx_2.checked = false
em_1.enabled = true
dw_1.enabled = true
dw_1.object.user_id.background.color =  rgb(255,255,255)
dw_2.dataobject = 'd_irusersilsa_s1'
dw_2.SetTransObject(SQLCA)

end event

type rb_1 from radiobutton within w_whusersilsa_w
integer x = 1371
integer y = 52
integer width = 411
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "담당자품목"
end type

event clicked;cbx_2.enabled = false
cbx_2.checked = false
em_1.enabled = false
dw_1.enabled = true
dw_1.object.user_id.background.color =  rgb(255,255,255)
dw_2.dataobject = 'd_irusersilsa_s'
dw_2.SetTransObject(SQLCA)

end event

type cbx_1 from checkbox within w_whusersilsa_w
integer x = 1623
integer y = 232
integer width = 338
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "전체선택"
end type

event clicked;dw_2.selectrow(0, this.checked)

end event

type cb_1 from commandbutton within w_whusersilsa_w
integer x = 1806
integer y = 56
integer width = 210
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_user

dw_1.accepttext()
if cbx_2.checked = true then
	ls_user = '%'
else
	ls_user = dw_1.object.user_id[1]
end if
if rb_7.checked = false then
	dw_2.retrieve(MidA(em_1.text, 1, 4), MidA(em_1.text, 6, 2), ls_user, istr_where.str3[1])
else
	dw_2.retrieve(istr_where.str3[1])
end if

end event

type pb_1 from picturebutton within w_whusersilsa_w
integer x = 1385
integer y = 1748
integer width = 279
integer height = 144
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = " 확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;istr_where.chk = "Y"

long ll_row, ll_cnt

ll_cnt = 0
for ll_row = 1 to dw_2.rowcount()
	if dw_2.IsSelected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		istr_where.str1[ll_cnt] = dw_2.object.item_no[ll_row]
		istr_where.str2[ll_cnt] = dw_2.object.qa[ll_row]
		istr_where.str3[ll_cnt] = dw_2.object.groupitem_uom[ll_row]
		istr_where.str4[ll_cnt] = string(dw_2.object.eom_qoh[ll_row])
		istr_where.name[ll_cnt] = dw_2.object.groupitem_item_name[ll_row]
	end if
next
if ll_cnt = 0 then istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type dw_2 from datawindow within w_whusersilsa_w
integer x = 23
integer y = 316
integer width = 1989
integer height = 1396
integer taborder = 50
string dataobject = "d_irusersilsa_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

this.scrolltorow(row)

this.selectrow(row, not this.isselected(row))

end event

type dw_1 from datawindow within w_whusersilsa_w
integer x = 370
integer y = 80
integer width = 635
integer height = 92
integer taborder = 60
string dataobject = "d_userid_c2"
boolean border = false
boolean livescroll = true
end type

type em_1 from editmask within w_whusersilsa_w
integer x = 32
integer y = 64
integer width = 325
integer height = 92
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type pb_2 from picturebutton within w_whusersilsa_w
integer x = 1701
integer y = 1748
integer width = 279
integer height = 144
integer taborder = 90
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

event clicked;istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type gb_4 from groupbox within w_whusersilsa_w
integer x = 5
integer y = 184
integer width = 2025
integer height = 1544
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
end type

type gb_2 from groupbox within w_whusersilsa_w
integer x = 9
integer y = 12
integer width = 2025
integer height = 172
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
end type

type rb_4 from radiobutton within w_whusersilsa_w
integer x = 256
integer y = 236
integer width = 192
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "명"
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "groupitem_item_name A, item_no A, qa A "
else
	ii_sw = 0
	ls_sort = "groupitem_item_name D, item_no A, qa A "
end if
dw_2.SetSort(ls_sort)
dw_2.Sort( )
	
end event

type rb_3 from radiobutton within w_whusersilsa_w
integer x = 32
integer y = 236
integer width = 210
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코드"
boolean checked = true
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_no A, qa A "
else
	ii_sw = 0
	ls_sort = "item_no D, qa A "
end if
dw_2.SetSort(ls_sort)
dw_2.Sort( )
	
end event

type sle_1 from singlelineedit within w_whusersilsa_w
integer x = 448
integer y = 220
integer width = 814
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;cb_2.DEFAULT = true

end event

type gb_1 from groupbox within w_whusersilsa_w
integer x = 5
integer y = 1736
integer width = 1125
integer height = 160
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "검색"
end type

