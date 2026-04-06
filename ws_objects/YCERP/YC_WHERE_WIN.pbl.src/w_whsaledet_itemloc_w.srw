$PBExportHeader$w_whsaledet_itemloc_w.srw
$PBExportComments$수부번호 제품의 저장소별재고검색(2004/10/11, 조원석)
forward
global type w_whsaledet_itemloc_w from window
end type
type st_1 from statictext within w_whsaledet_itemloc_w
end type
type dw_2 from datawindow within w_whsaledet_itemloc_w
end type
type pb_search from picturebutton within w_whsaledet_itemloc_w
end type
type cb_6 from commandbutton within w_whsaledet_itemloc_w
end type
type cb_1 from commandbutton within w_whsaledet_itemloc_w
end type
type order_no2 from editmask within w_whsaledet_itemloc_w
end type
type st_2 from statictext within w_whsaledet_itemloc_w
end type
type order_no1 from editmask within w_whsaledet_itemloc_w
end type
type dw_1 from datawindow within w_whsaledet_itemloc_w
end type
end forward

global type w_whsaledet_itemloc_w from window
integer x = 1938
integer y = 700
integer width = 4709
integer height = 1796
boolean titlebar = true
string title = "수주번호 저장소별 검색(w_whsaledet_itemloc_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_2 dw_2
pb_search pb_search
cb_6 cb_6
cb_1 cb_1
order_no2 order_no2
st_2 st_2
order_no1 order_no1
dw_1 dw_1
end type
global w_whsaledet_itemloc_w w_whsaledet_itemloc_w

type variables
gs_where istr_where

end variables

on w_whsaledet_itemloc_w.create
this.st_1=create st_1
this.dw_2=create dw_2
this.pb_search=create pb_search
this.cb_6=create cb_6
this.cb_1=create cb_1
this.order_no2=create order_no2
this.st_2=create st_2
this.order_no1=create order_no1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_2,&
this.pb_search,&
this.cb_6,&
this.cb_1,&
this.order_no2,&
this.st_2,&
this.order_no1,&
this.dw_1}
end on

on w_whsaledet_itemloc_w.destroy
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.pb_search)
destroy(this.cb_6)
destroy(this.cb_1)
destroy(this.order_no2)
destroy(this.st_2)
destroy(this.order_no1)
destroy(this.dw_1)
end on

event open;istr_where = message.powerobjectparm
long ll_row

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)


if LeftA(gs_area,1) = "S" then
	order_no1.text = "HD" + string(today(), "yyyymmdd")
else
	order_no1.text = LeftA(gs_area, 1) + "D" + string(today(), "yyyymmdd")
end if

order_no1.SelectText(9, 2)
end event

type st_1 from statictext within w_whsaledet_itemloc_w
integer x = 654
integer y = 36
integer width = 288
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주번호"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_whsaledet_itemloc_w
integer x = 3296
integer y = 152
integer width = 1367
integer height = 1524
integer taborder = 70
string title = "none"
string dataobject = "w_whsaledet_itemloc_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;This.SelectRow(0, FALSE)	
This.SelectRow(row, TRUE)

end event

type pb_search from picturebutton within w_whsaledet_itemloc_w
integer x = 1595
integer y = 4
integer width = 137
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_orderno, ls_custno
long   ll_row

ROLLBACK;

dw_1.reset() ;

ls_orderno = trim(order_no1.text) + "-" + RightA ( "000" + trim(order_no2.text), 3)
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

dw_1.retrieve(ls_orderno)

end event

type cb_6 from commandbutton within w_whsaledet_itemloc_w
integer x = 1527
integer y = 60
integer width = 82
integer height = 48
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;order_no2.text = string(integer(order_no2.text) - 1)
if order_no2.text < '1' then 
	order_no2.text = '1'
	return
end if
end event

type cb_1 from commandbutton within w_whsaledet_itemloc_w
integer x = 1527
integer y = 12
integer width = 82
integer height = 48
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;order_no2.text = string(integer(order_no2.text) + 1)

end event

type order_no2 from editmask within w_whsaledet_itemloc_w
integer x = 1381
integer y = 16
integer width = 151
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */
//pb_cancel.default = true
this.SelectText(1, 3)


end event

event losefocus;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */

// 수주장 2번 저장의 경우 발생함
// pb_cancel.default = true

end event

event modified;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */

//pb_cancel.default = true
end event

type st_2 from statictext within w_whsaledet_itemloc_w
integer x = 1339
integer y = 32
integer width = 46
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "-"
boolean focusrectangle = false
end type

type order_no1 from editmask within w_whsaledet_itemloc_w
event keydown pbm_dwnkey
integer x = 960
integer y = 16
integer width = 379
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

event keydown;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */

//IF keydown(KeyEnter! ) THEN
//	IF keyflags = 0 THEN
//		pb_cancel.postevent(clicked!)
//	END IF
//END IF
end event

event modified;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */
//pb_cancel.default = true

end event

type dw_1 from datawindow within w_whsaledet_itemloc_w
integer x = 46
integer y = 152
integer width = 3227
integer height = 1524
integer taborder = 60
string title = "none"
string dataobject = "w_whsaledet_itemloc_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_orderno, ls_item_no, ls_qa

ls_orderno = trim(order_no1.text) + "-" + RightA ( "000" + trim(order_no2.text), 3)

ls_item_no = this.object.item_no[row]

ls_qa  = this.object.qa[row]

This.SelectRow(0, FALSE)	

dw_2.retrieve(ls_item_no, ls_qa)

This.SelectRow(row, TRUE)

end event

