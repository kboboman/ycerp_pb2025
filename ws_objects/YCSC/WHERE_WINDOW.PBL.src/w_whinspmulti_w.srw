$PBExportHeader$w_whinspmulti_w.srw
$PBExportComments$입고내역멀티검색(2002/01/14,이인호)
forward
global type w_whinspmulti_w from window
end type
type rb_2 from radiobutton within w_whinspmulti_w
end type
type rb_1 from radiobutton within w_whinspmulti_w
end type
type em_e from editmask within w_whinspmulti_w
end type
type st_2 from statictext within w_whinspmulti_w
end type
type em_s from editmask within w_whinspmulti_w
end type
type dw_3 from datawindow within w_whinspmulti_w
end type
type em_1 from editmask within w_whinspmulti_w
end type
type cb_reset from commandbutton within w_whinspmulti_w
end type
type cb_ret from commandbutton within w_whinspmulti_w
end type
type dw_1 from datawindow within w_whinspmulti_w
end type
type cb_cancel from commandbutton within w_whinspmulti_w
end type
type cb_ok from commandbutton within w_whinspmulti_w
end type
type gb_1 from groupbox within w_whinspmulti_w
end type
end forward

global type w_whinspmulti_w from window
integer x = 320
integer y = 160
integer width = 3365
integer height = 1704
boolean titlebar = true
string title = "입고다중선택(w_whinspmulti_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
rb_2 rb_2
rb_1 rb_1
em_e em_e
st_2 st_2
em_s em_s
dw_3 dw_3
em_1 em_1
cb_reset cb_reset
cb_ret cb_ret
dw_1 dw_1
cb_cancel cb_cancel
cb_ok cb_ok
gb_1 gb_1
end type
global w_whinspmulti_w w_whinspmulti_w

type variables
gs_where2 istr_select
string is_where
int ii_sw = 0

end variables

event open;istr_select = Message.PowerObjectParm
em_s.text = string(today(), "yyyy/mm/dd")
em_e.text = string(today(), "yyyy/mm/dd")
dw_1.SetTransObject(SQLCA)
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.object.supp_no.background.color =  rgb(192,192,192)
istr_select.chk = 'N'
em_1.text = LeftA(gs_area,1) + 'N' + string(today(),'yyyyMM')
em_1.SelectText(9, 0)
em_1.setfocus()

end event

on w_whinspmulti_w.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.em_e=create em_e
this.st_2=create st_2
this.em_s=create em_s
this.dw_3=create dw_3
this.em_1=create em_1
this.cb_reset=create cb_reset
this.cb_ret=create cb_ret
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.Control[]={this.rb_2,&
this.rb_1,&
this.em_e,&
this.st_2,&
this.em_s,&
this.dw_3,&
this.em_1,&
this.cb_reset,&
this.cb_ret,&
this.dw_1,&
this.cb_cancel,&
this.cb_ok,&
this.gb_1}
end on

on w_whinspmulti_w.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.em_e)
destroy(this.st_2)
destroy(this.em_s)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.cb_reset)
destroy(this.cb_ret)
destroy(this.dw_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

type rb_2 from radiobutton within w_whinspmulti_w
integer x = 562
integer y = 32
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처"
end type

event clicked;dw_3.object.supp_no.background.color =  rgb(255,255,255)
dw_3.enabled = true
em_1.enabled = false
em_s.enabled = true
em_e.enabled = true

end event

type rb_1 from radiobutton within w_whinspmulti_w
integer x = 69
integer y = 32
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입고번호"
boolean checked = true
end type

event clicked;dw_3.object.supp_no.background.color =  rgb(192,192,192)
dw_3.enabled = false
em_1.enabled = true
em_s.enabled = false
em_e.enabled = false

end event

type em_e from editmask within w_whinspmulti_w
integer x = 1915
integer y = 76
integer width = 366
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_whinspmulti_w
integer x = 1824
integer y = 64
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -18
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_s from editmask within w_whinspmulti_w
integer x = 1440
integer y = 72
integer width = 366
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_whinspmulti_w
integer x = 558
integer y = 88
integer width = 882
integer height = 88
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_apinspdsupp_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()

end event

type em_1 from editmask within w_whinspmulti_w
integer x = 50
integer y = 92
integer width = 480
integer height = 88
integer taborder = 10
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

event modified;cb_ret.DEFAULT = true

end event

type cb_reset from commandbutton within w_whinspmulti_w
integer x = 2514
integer y = 64
integer width = 210
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RESET"
end type

event clicked;dw_1.reset()
dw_3.reset()
dw_3.insertrow(1)

end event

type cb_ret from commandbutton within w_whinspmulti_w
integer x = 2290
integer y = 64
integer width = 210
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_order
date ld_start, ld_end

ld_start = date(em_s.text)
ld_end = date(em_e.text)
if rb_1.checked = true then
	ls_order = trim(em_1.text)
	dw_1.retrieve('I', ls_order, 'C', ld_start, ld_end)
	em_1.SelectText(9, 2)
	em_1.setfocus()
else
	ls_order = dw_3.object.supp_no[1]
	if dw_1.retrieve('S', 'X', ls_order, ld_start, ld_end) < 1 then
		em_s.setfocus()
	end if
end if
cb_ret.DEFAULT = false

end event

type dw_1 from datawindow within w_whinspmulti_w
integer x = 18
integer y = 208
integer width = 3319
integer height = 1408
integer taborder = 20
string dataobject = "d_whinspmulti_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.SelectRow(row,  NOT this.IsSelected(row))
this.scrolltorow(row)


end event

type cb_cancel from commandbutton within w_whinspmulti_w
event clicked pbm_bnclicked
integer x = 3090
integer y = 64
integer width = 210
integer height = 92
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

event clicked;istr_select.chk = 'N'
ClosewithReturn( parent,istr_select )
end event

type cb_ok from commandbutton within w_whinspmulti_w
event clicked pbm_bnclicked
integer x = 2871
integer y = 64
integer width = 210
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;long ll_row, ll_cnt
string ls_null

setnull(ls_null)
for ll_row = 1 to DW_1.ROWCOUNT()
	if dw_1.IsSelected(ll_row) = true then
		istr_select.chk = "Y"
		ll_cnt = ll_cnt + 1
		istr_select.str1[ll_cnt] = dw_1.object.insp_no[ll_row]
		istr_select.seq1[ll_cnt] = dw_1.object.oi_no[ll_row]
		istr_select.str2[ll_cnt] = dw_1.object.item_no[ll_row]
		istr_select.str3[ll_cnt] = dw_1.object.qa[ll_row]
		istr_select.str4[ll_cnt] = dw_1.object.coil_no[ll_row]
		istr_select.str5[ll_cnt] = dw_1.object.uom[ll_row]
		istr_select.str6[ll_cnt] = dw_1.object.com_uom[ll_row]
		istr_select.str7[ll_cnt] = dw_1.object.loc_no[ll_row]
		istr_select.str8[ll_cnt] = dw_1.object.location_loc_name[ll_row]
		istr_select.qty1[ll_cnt] = dw_1.object.rcpt_qty[ll_row]
		istr_select.qty2[ll_cnt] = dw_1.object.price[ll_row]
		istr_select.qty3[ll_cnt] = dw_1.object.comqty[ll_row]
		istr_select.qty4[ll_cnt] = dw_1.object.unit_qty[ll_row]
		istr_select.qty5[ll_cnt] = dw_1.object.rate_cash[ll_row]
		
		istr_select.seq2[ll_cnt] = dw_1.object.cnt[ll_row]
		istr_select.name[ll_cnt] = dw_1.object.groupitem_item_name[ll_row]
	end if
next
if istr_select.chk = "N" then return
CloseWithReturn(parent, istr_select)
end event

type gb_1 from groupbox within w_whinspmulti_w
integer x = 18
integer width = 3319
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

