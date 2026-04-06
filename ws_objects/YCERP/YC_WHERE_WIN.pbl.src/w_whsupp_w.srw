$PBExportHeader$w_whsupp_w.srw
$PBExportComments$구매거래처검색윈도우(1998/02/09,곽용덕)
forward 
global type w_whsupp_w from w_inheritance
end type
type rb_1 from radiobutton within w_whsupp_w
end type
type rb_2 from radiobutton within w_whsupp_w
end type
type em_1 from editmask within w_whsupp_w
end type
type st_1 from statictext within w_whsupp_w
end type
type em_2 from editmask within w_whsupp_w
end type
end forward

global type w_whsupp_w from w_inheritance
integer x = 1083
integer y = 436
integer width = 1326
integer height = 640
string title = "구매거래처조회(w_whsupp_w)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
rb_1 rb_1
rb_2 rb_2
em_1 em_1
st_1 st_1
em_2 em_2
end type
global w_whsupp_w w_whsupp_w

type variables
gs_where istr_where
end variables

on w_whsupp_w.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.em_2
end on

on w_whsupp_w.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
end on

event open;//
dw_1.SetTransObject(SQLCA)

istr_where = Message.PowerObjectParm
dw_1.insertrow(0)
dw_1.object.supp_no[1] = istr_where.str1
dw_1.object.supp_no.background.color = 78682240

end event

event close;call super::close;//
CloseWithReturn(this, istr_where)
end event

type pb_save from w_inheritance`pb_save within w_whsupp_w
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_whsupp_w
integer x = 247
integer y = 300
integer width = 1024
integer height = 80
boolean enabled = false
string dataobject = "d_whsupp_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_whsupp_w
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whsupp_w
end type

type pb_compute from w_inheritance`pb_compute within w_whsupp_w
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_whsupp_w
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whsupp_w
integer x = 722
integer y = 392
integer width = 279
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = Right!
end type

event pb_close::clicked;//
if rb_1.checked = true then
	istr_where.str1 = '%'
else
	istr_where.str1 = trim(dw_1.object.supp_no[1])
end if

istr_where.chk = 'Y'
CloseWithReturn(Parent, istr_where)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whsupp_w
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_whsupp_w
integer x = 1006
integer y = 392
integer width = 279
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = Right!
end type

event pb_cancel::clicked;istr_where.chk = 'N'
CloseWithReturn(Parent, istr_where)
end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_whsupp_w
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_whsupp_w
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_whsupp_w
boolean visible = false
integer x = 1550
integer y = 184
end type

type gb_3 from w_inheritance`gb_3 within w_whsupp_w
boolean visible = false
end type

type gb_2 from w_inheritance`gb_2 within w_whsupp_w
integer x = 14
integer y = 20
integer width = 1262
integer height = 364
long textcolor = 16711680
string text = "조회조건"
end type

type gb_1 from w_inheritance`gb_1 within w_whsupp_w
boolean visible = false
integer x = 1522
integer y = 8
integer width = 242
end type

type dw_2 from w_inheritance`dw_2 within w_whsupp_w
boolean visible = false
end type

type rb_1 from radiobutton within w_whsupp_w
integer x = 69
integer y = 116
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체조회"
boolean checked = true
end type

event clicked;dw_1.enabled = false
dw_1.object.supp_no.background.color = 78682240
end event

type rb_2 from radiobutton within w_whsupp_w
integer x = 69
integer y = 228
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부분조회"
end type

event clicked;dw_1.enabled = true
dw_1.object.supp_no.background.color = 1087434968
end event

type em_1 from editmask within w_whsupp_w
event doubleclick pbm_lbuttondblclk
integer x = 475
integer y = 224
integer width = 366
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_1.text = lst_whcustret.cust_no
end if
em_2.setfocus()
end event

type st_1 from statictext within w_whsupp_w
integer x = 841
integer y = 236
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_whsupp_w
integer x = 887
integer y = 224
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
long backcolor = 79219928
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaa"
boolean autoskip = true
end type

event getfocus;if not isnull(em_1.text) or trim(em_1.text) <> "" then
	em_2.text = em_1.text
end if

end event

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_2.text = lst_whcustret.cust_no
end if

end event

