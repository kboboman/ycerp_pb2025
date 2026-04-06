$PBExportHeader$w_whshipreq_w.srw
$PBExportComments$운반비변경요청관리선택(2002/08/28,이인호)
forward 
global type w_whshipreq_w from window
end type
type rb_3 from radiobutton within w_whshipreq_w
end type
type rb_2 from radiobutton within w_whshipreq_w
end type
type rb_1 from radiobutton within w_whshipreq_w
end type
type cbx_1 from checkbox within w_whshipreq_w
end type
type cb_1 from commandbutton within w_whshipreq_w
end type
type pb_1 from picturebutton within w_whshipreq_w
end type
type dw_2 from datawindow within w_whshipreq_w
end type
type dw_1 from datawindow within w_whshipreq_w
end type
type st_2 from statictext within w_whshipreq_w
end type
type em_2 from editmask within w_whshipreq_w
end type
type em_1 from editmask within w_whshipreq_w
end type
type pb_2 from picturebutton within w_whshipreq_w
end type
type gb_4 from groupbox within w_whshipreq_w
end type
type gb_2 from groupbox within w_whshipreq_w
end type
type gb_1 from groupbox within w_whshipreq_w
end type
type gb_3 from groupbox within w_whshipreq_w
end type
end forward

global type w_whshipreq_w from window
integer x = 183
integer y = 300
integer width = 3296
integer height = 1196
boolean titlebar = true
string title = "운반비변경요청관리선택(w_shsipreq_w)"
windowtype windowtype = response!
long backcolor = 79741120
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
cb_1 cb_1
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
st_2 st_2
em_2 em_2
em_1 em_1
pb_2 pb_2
gb_4 gb_4
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
end type
global w_whshipreq_w w_whshipreq_w

type variables
gs_itembaldo_str  ist_code

end variables

on w_whshipreq_w.create
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.st_2=create st_2
this.em_2=create em_2
this.em_1=create em_1
this.pb_2=create pb_2
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.Control[]={this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cbx_1,&
this.cb_1,&
this.pb_1,&
this.dw_2,&
this.dw_1,&
this.st_2,&
this.em_2,&
this.em_1,&
this.pb_2,&
this.gb_4,&
this.gb_2,&
this.gb_1,&
this.gb_3}
end on

on w_whshipreq_w.destroy
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;datawindowchild idwc_cust
dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

//dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
ist_code = message.powerobjectparm

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

dw_1.insertrow(0)


end event

type rb_3 from radiobutton within w_whshipreq_w
integer x = 2665
integer y = 80
integer width = 229
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

event clicked;dw_2.setfilter('')
dw_2.filter()
end event

type rb_2 from radiobutton within w_whshipreq_w
integer x = 2935
integer y = 112
integer width = 233
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "대여"
end type

event clicked;dw_2.setfilter('do_ship_flag = "D"')
dw_2.filter()
end event

type rb_1 from radiobutton within w_whshipreq_w
integer x = 2935
integer y = 52
integer width = 233
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부담"
end type

event clicked;dw_2.setfilter('do_ship_flag = "B"')
dw_2.filter()
end event

type cbx_1 from checkbox within w_whshipreq_w
integer x = 1943
integer y = 76
integer width = 224
integer height = 76
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

event clicked;if this.checked = true then
	dw_1.object.cust_no.background.color = 78682240
	dw_1.enabled = false
else
	dw_1.object.cust_no.background.color = 1087434968
	dw_1.enabled = true
end if


end event

type cb_1 from commandbutton within w_whshipreq_w
integer x = 2203
integer y = 52
integer width = 247
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

event clicked;date ld_start, ld_end
string ls_cust

if em_1.text = '' then
	messagebox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_2.text = '' then
	messagebox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_1.text > em_2.text then
	messagebox("확인","조회기간을 잘못 입력하였습니다!",information!)
	return 1
end if

ld_start = date(em_1.text)
ld_end = date(em_2.text)
dw_1.accepttext()
if cbx_1.checked = true then
	ls_cust = '%'
else
	ls_cust = dw_1.object.cust_no[1]
end if

dw_2.retrieve(ld_start, ld_end, ls_cust)

end event

type pb_1 from picturebutton within w_whshipreq_w
integer x = 2638
integer y = 960
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

event clicked;ist_code.okcancel = 'Y'

//ist_code.start_date = em_1.text
//ist_code.end_date = em_2.text
if dw_2.getrow() < 1 then return
ist_code.order_flag = trim(string(dw_2.object.do_do_no[dw_2.getrow()]))
//if rb_1.checked = true then
//	ist_code.sel_flag = 'A'   //현장코드
//else
//	ist_code.sel_flag = is_scene
//end if

closewithreturn(parent, ist_code)
end event

type dw_2 from datawindow within w_whshipreq_w
integer x = 23
integer y = 248
integer width = 3205
integer height = 676
integer taborder = 50
string dataobject = "d_whshipreq_w"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row
	
Accepttext()
ll_row = Getrow()
IF ll_row < 1 then return

this.selectrow(0, false)
this.selectrow(ll_row, true)

end event

event clicked;if row < 1 then return

this.scrolltorow(row)
end event

event doubleclicked;if row < 1 then return

pb_1.postevent(clicked!)
end event

type dw_1 from datawindow within w_whshipreq_w
integer x = 1061
integer y = 68
integer width = 873
integer height = 96
integer taborder = 60
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event constructor;	dw_1.enabled = false
	dw_1.object.cust_no.background.color = 78682240

end event

type st_2 from statictext within w_whshipreq_w
integer x = 453
integer y = 88
integer width = 55
integer height = 64
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

type em_2 from editmask within w_whshipreq_w
integer x = 535
integer y = 76
integer width = 366
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_1 from editmask within w_whshipreq_w
integer x = 55
integer y = 76
integer width = 366
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_2 from picturebutton within w_whshipreq_w
integer x = 2953
integer y = 960
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
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type gb_4 from groupbox within w_whshipreq_w
integer x = 5
integer y = 192
integer width = 3250
integer height = 756
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "출고내역"
end type

type gb_2 from groupbox within w_whshipreq_w
integer x = 18
integer y = 16
integer width = 937
integer height = 168
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "출고기간"
end type

type gb_1 from groupbox within w_whshipreq_w
integer x = 1038
integer y = 16
integer width = 1143
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "판매거래처"
end type

type gb_3 from groupbox within w_whshipreq_w
integer x = 2624
integer y = 16
integer width = 626
integer height = 168
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
end type

