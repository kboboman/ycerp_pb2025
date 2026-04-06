$PBExportHeader$w_whareacar_w.srw
$PBExportComments$권역운반비(2020/03/13,조원석)
forward
global type w_whareacar_w from window
end type
type cb_retrieve from commandbutton within w_whareacar_w
end type
type cb_6 from commandbutton within w_whareacar_w
end type
type cb_1 from commandbutton within w_whareacar_w
end type
type sle_name from singlelineedit within w_whareacar_w
end type
type st_2 from statictext within w_whareacar_w
end type
type dw_3 from datawindow within w_whareacar_w
end type
type dw_2 from datawindow within w_whareacar_w
end type
type gb_4 from groupbox within w_whareacar_w
end type
type gb_6 from groupbox within w_whareacar_w
end type
end forward

global type w_whareacar_w from window
integer x = 183
integer y = 300
integer width = 3323
integer height = 2376
boolean titlebar = true
string title = "권역운반비조회(w_whareacar_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
event ue_retrieve ( )
cb_retrieve cb_retrieve
cb_6 cb_6
cb_1 cb_1
sle_name sle_name
st_2 st_2
dw_3 dw_3
dw_2 dw_2
gb_4 gb_4
gb_6 gb_6
end type
global w_whareacar_w w_whareacar_w

type variables
string is_car_kind
long  ist_code

end variables

event ue_retrieve();string	ls_area_code, ls_country_code, ls_car_kind, ls_name
long		ll_dw2cnt, ll_dw3cnt

ls_name = sle_name.text

if gf_null_chk(ls_name) then
	ls_name = '%'
else
	ls_name = '%' + ls_name + '%'	
end if

ll_dw2cnt		= dw_2.retrieve('%',ls_name)

ls_area_code	= dw_2.object.a_area_code[1]
ls_country_code= dw_2.object.a_country_code[1]
ll_dw3cnt		= dw_3.retrieve(ls_area_code, ls_country_code, is_car_kind)

if ll_dw2cnt = 1 and ll_dw3cnt = 1 then
	ist_code = dw_3.object.a_amt[1]
	closewithreturn(this, string(ist_code))
end if
end event

on w_whareacar_w.create
this.cb_retrieve=create cb_retrieve
this.cb_6=create cb_6
this.cb_1=create cb_1
this.sle_name=create sle_name
this.st_2=create st_2
this.dw_3=create dw_3
this.dw_2=create dw_2
this.gb_4=create gb_4
this.gb_6=create gb_6
this.Control[]={this.cb_retrieve,&
this.cb_6,&
this.cb_1,&
this.sle_name,&
this.st_2,&
this.dw_3,&
this.dw_2,&
this.gb_4,&
this.gb_6}
end on

on w_whareacar_w.destroy
destroy(this.cb_retrieve)
destroy(this.cb_6)
destroy(this.cb_1)
destroy(this.sle_name)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.gb_4)
destroy(this.gb_6)
end on

event open;dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)

is_car_kind = message.stringparm

this.postevent('ue_retrieve')

end event

type cb_retrieve from commandbutton within w_whareacar_w
integer x = 859
integer y = 52
integer width = 357
integer height = 92
integer taborder = 350
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;parent.postevent('ue_retrieve')
end event

type cb_6 from commandbutton within w_whareacar_w
integer x = 2848
integer y = 52
integer width = 357
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;ist_code = 0

closewithreturn(parent, ist_code)
end event

type cb_1 from commandbutton within w_whareacar_w
integer x = 2491
integer y = 52
integer width = 357
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;if dw_3.getrow() < 1 then return

ist_code = dw_3.object.a_amt[dw_3.getrow()]

closewithreturn(parent, string(ist_code))
end event

type sle_name from singlelineedit within w_whareacar_w
event ue_keydown pbm_keydown
integer x = 256
integer y = 64
integer width = 567
integer height = 76
integer taborder = 370
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

event ue_keydown;choose case keyflags
	case 0	
   	choose case key 
			case KeyEnter!
				parent.postevent('ue_retrieve')
		 end choose
end choose
end event

type st_2 from statictext within w_whareacar_w
integer x = 37
integer y = 72
integer width = 206
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
string text = "지역: "
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whareacar_w
integer x = 2057
integer y = 232
integer width = 1147
integer height = 1976
integer taborder = 60
string title = "none"
string dataobject = "d_whareacar2_w"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;ist_code = dw_3.object.a_amt[row]

closewithreturn(parent, string(ist_code))
end event

event clicked;
this.selectrow(0, false)
this.selectrow(row, true)
end event

type dw_2 from datawindow within w_whareacar_w
integer x = 23
integer y = 232
integer width = 2016
integer height = 1976
integer taborder = 50
string dataobject = "d_whareacar1_w"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//long ll_row
//	
//Accepttext()
//ll_row = Getrow()
//IF ll_row < 1 then return
//
//this.selectrow(0, false)
//this.selectrow(ll_row, true)

end event

event clicked;string ls_area_code, ls_country_code

if row < 1 then return

ls_area_code = this.object.a_area_code[row]
ls_country_code = this.object.a_country_code[row]
dw_3.retrieve(ls_area_code, ls_country_code, is_car_kind)

this.scrolltorow(row)
end event

type gb_4 from groupbox within w_whareacar_w
integer x = 5
integer y = 192
integer width = 3241
integer height = 2036
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
end type

type gb_6 from groupbox within w_whareacar_w
integer x = 9
integer y = 8
integer width = 3232
integer height = 168
integer taborder = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

