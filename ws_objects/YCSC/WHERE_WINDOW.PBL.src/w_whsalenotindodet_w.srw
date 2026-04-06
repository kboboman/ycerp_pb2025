$PBExportHeader$w_whsalenotindodet_w.srw
$PBExportComments$수주멀티검색(출고안된수주만)(2003/10/02,이인호)
forward
global type w_whsalenotindodet_w from window
end type
type em_1 from editmask within w_whsalenotindodet_w
end type
type st_4 from statictext within w_whsalenotindodet_w
end type
type cb_reset from commandbutton within w_whsalenotindodet_w
end type
type dw_1 from datawindow within w_whsalenotindodet_w
end type
type cb_cancel from commandbutton within w_whsalenotindodet_w
end type
type cb_ok from commandbutton within w_whsalenotindodet_w
end type
type gb_1 from groupbox within w_whsalenotindodet_w
end type
end forward

global type w_whsalenotindodet_w from window
integer x = 320
integer y = 160
integer width = 3369
integer height = 1024
boolean titlebar = true
string title = "수주물품다중선택(w_whsalenotindodet_w)"
windowtype windowtype = response!
long backcolor = 79741120
em_1 em_1
st_4 st_4
cb_reset cb_reset
dw_1 dw_1
cb_cancel cb_cancel
cb_ok cb_ok
gb_1 gb_1
end type
global w_whsalenotindodet_w w_whsalenotindodet_w

type variables
gs_where2 istr_select
string is_where
int ii_sw = 0

end variables

event open;istr_select = Message.PowerObjectParm
dw_1.SetTransObject(SQLCA)
dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve(istr_select.chk)
dw_1.setredraw(true)
em_1.text = LeftA(istr_select.chk, 10) + MidA(istr_select.chk,12)

end event

on w_whsalenotindodet_w.create
this.em_1=create em_1
this.st_4=create st_4
this.cb_reset=create cb_reset
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.Control[]={this.em_1,&
this.st_4,&
this.cb_reset,&
this.dw_1,&
this.cb_cancel,&
this.cb_ok,&
this.gb_1}
end on

on w_whsalenotindodet_w.destroy
destroy(this.em_1)
destroy(this.st_4)
destroy(this.cb_reset)
destroy(this.dw_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

type em_1 from editmask within w_whsalenotindodet_w
integer x = 343
integer y = 60
integer width = 480
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
end type

type st_4 from statictext within w_whsalenotindodet_w
integer x = 37
integer y = 76
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "수주번호:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_reset from commandbutton within w_whsalenotindodet_w
integer x = 864
integer y = 60
integer width = 279
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재조회"
end type

event clicked;dw_1.reset()
dw_1.retrieve(istr_select.chk)



end event

type dw_1 from datawindow within w_whsalenotindodet_w
integer x = 18
integer y = 208
integer width = 3314
integer height = 708
integer taborder = 20
string dataobject = "d_whsalenotindodet_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)
this.SelectRow(row,  NOT this.IsSelected(row))





end event

type cb_cancel from commandbutton within w_whsalenotindodet_w
event clicked pbm_bnclicked
integer x = 3049
integer y = 64
integer width = 251
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

type cb_ok from commandbutton within w_whsalenotindodet_w
event clicked pbm_bnclicked
integer x = 2789
integer y = 64
integer width = 251
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

event clicked;istr_select.chk = "Y"

long ll_row, ll_cnt

for ll_row = 1 to DW_1.ROWCOUNT()
	if dw_1.IsSelected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		istr_select.str1[ll_cnt] = dw_1.object.item_no[ll_row]
		istr_select.str2[ll_cnt] = dw_1.object.qa[ll_row]
		istr_select.str3[ll_cnt] = dw_1.object.order_no[ll_row]
		istr_select.str4[ll_cnt] = dw_1.object.cust_name[ll_row]
		istr_select.str5[ll_cnt] = dw_1.object.scene_scene_desc[ll_row]
		istr_select.str6[ll_cnt] = dw_1.object.uom[ll_row]
		istr_select.str7[ll_cnt] = dw_1.object.sale_tax_sign[ll_row]
		istr_select.str8[ll_cnt] = dw_1.object.do_rem[ll_row]
		istr_select.name[ll_cnt] = dw_1.object.groupitem_item_name[ll_row]
		istr_select.qty1[ll_cnt] = dw_1.object.order_qty[ll_row]
		istr_select.qty2[ll_cnt] = dw_1.object.price[ll_row]
		istr_select.seq1[ll_cnt] = dw_1.object.seq_no[ll_row]
	end if
next

CloseWithReturn(parent, istr_select)
end event

type gb_1 from groupbox within w_whsalenotindodet_w
integer x = 18
integer width = 3314
integer height = 192
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

