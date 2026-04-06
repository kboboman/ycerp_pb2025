$PBExportHeader$w_itemcostupdate.srw
$PBExportComments$ITEMCOST TABLE UPDATE WINDOW
forward
global type w_itemcostupdate from window
end type
type st_4 from statictext within w_itemcostupdate
end type
type cb_6 from commandbutton within w_itemcostupdate
end type
type cb_5 from commandbutton within w_itemcostupdate
end type
type dw_4 from datawindow within w_itemcostupdate
end type
type cb_4 from commandbutton within w_itemcostupdate
end type
type cb_3 from commandbutton within w_itemcostupdate
end type
type cb_2 from commandbutton within w_itemcostupdate
end type
type cb_1 from commandbutton within w_itemcostupdate
end type
type st_3 from statictext within w_itemcostupdate
end type
type st_2 from statictext within w_itemcostupdate
end type
type st_1 from statictext within w_itemcostupdate
end type
type dw_3 from datawindow within w_itemcostupdate
end type
type dw_2 from datawindow within w_itemcostupdate
end type
type dw_1 from datawindow within w_itemcostupdate
end type
type gb_1 from groupbox within w_itemcostupdate
end type
end forward

global type w_itemcostupdate from window
integer x = 183
integer y = 136
integer width = 4709
integer height = 2360
boolean titlebar = true
string title = "품목 VS 품목별단가 비교(w_itemcostupdate)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
st_4 st_4
cb_6 cb_6
cb_5 cb_5
dw_4 dw_4
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
end type
global w_itemcostupdate w_itemcostupdate

on w_itemcostupdate.create
this.st_4=create st_4
this.cb_6=create cb_6
this.cb_5=create cb_5
this.dw_4=create dw_4
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_4,&
this.cb_6,&
this.cb_5,&
this.dw_4,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.gb_1}
end on

on w_itemcostupdate.destroy
destroy(this.st_4)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.dw_4)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)


end event

type st_4 from statictext within w_itemcostupdate
integer x = 82
integer y = 68
integer width = 1495
integer height = 136
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 32768
string text = "품목 VS 품목별단가 검사"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_itemcostupdate
integer x = 3552
integer y = 156
integer width = 649
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ITEM TABLE UPDATE"
end type

event clicked;long ll_row, ll_cnt

ll_cnt = dw_4.rowcount()
if ll_cnt < 1 then return

for ll_row = 1 to ll_cnt
	dw_4.object.item_price_a[ll_row] =dw_4.object.itemcost_price[ll_row] 
next

if dw_4.update() = 1 then
	commit;
	messagebox("저장성공","저장되었습니다.",information!)
else
	rollback;
	messagebox("저장에러","저장도중 오류가 발생하였습니다!",exclamation!)
end if
end event

type cb_5 from commandbutton within w_itemcostupdate
integer x = 3552
integer y = 60
integer width = 649
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ITEM TABLE RETRIEVE"
end type

event clicked;DW_4.RETRIEVE()
end event

type dw_4 from datawindow within w_itemcostupdate
integer x = 2642
integer y = 416
integer width = 1943
integer height = 1764
integer taborder = 30
string dataobject = "item_price_a_update"
boolean hscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_itemcostupdate
integer x = 4210
integer y = 60
integer width = 334
integer height = 192
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "EXIT"
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_itemcostupdate
integer x = 1842
integer y = 60
integer width = 1701
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ITEM, ITEMCOST TABLE RETRIEVE"
end type

event clicked;if dw_1.rowcount() > 0 or dw_2.rowcount() > 0 or dw_3.rowcount() > 0 then
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
end if

dw_1.retrieve()
dw_2.retrieve()
end event

type cb_2 from commandbutton within w_itemcostupdate
integer x = 2697
integer y = 156
integer width = 846
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ITEMCOST TABLE INSERT"
end type

event clicked;dw_3.accepttext()

if dw_3.rowcount() = 0 then return
if messagebox("확인","ITEMTABLE TABLE에 저장하시겠습니까?",question!,okcancel!) = 2 then return

if dw_3.update() = 1 then
	commit;
	messagebox("저장성공","저장되었습니다.",information!)
else
	rollback;
	messagebox("저장에러","저장도중 오류가 발생하였습니다!",exclamation!)
end if
end event

type cb_1 from commandbutton within w_itemcostupdate
integer x = 1842
integer y = 156
integer width = 846
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ITEM VS ITEMCOST COMPARE"
end type

event clicked;long ll_row, ll_find, ll_insert
string ls_item_no, ls_qa, ls_uom, ls_item_no1, ls_qa1

if dw_1.rowcount() < 0 then return
if dw_2.rowcount() < 0 then return
if dw_3.rowcount() > 0 then dw_3.reset()

for ll_row = 1 to dw_1.rowcount()
	ls_item_no = dw_1.object.item_no[ll_row]
	ls_qa = dw_1.object.qa[ll_row]
	ls_uom = dw_1.object.uom[ll_row]
	
	if ls_uom = 'M' then
		ls_qa = LeftA(trim(ls_qa), 13)
	elseif ls_uom = 'M2' then
		ls_qa = LeftA(trim(ls_qa), 3)
	end if

	if ls_item_no = ls_item_no1 and ls_qa = ls_qa1 then
		continue
	else
		ls_item_no1 = ls_item_no
		ls_qa1 = ls_qa
	end if

	ll_find = dw_2.find("item_no = '" + ls_item_no + "' and qa = '" + ls_qa + "'", 1, dw_2.rowcount())

	if ll_find < 1 then
		ll_insert = dw_3.insertrow(0)
		
		dw_3.object.item_no[ll_insert] = ls_item_no
		dw_3.object.qa[ll_insert] = ls_qa
		dw_3.object.uom[ll_insert] = ls_uom
		dw_3.object.tran_date[ll_insert] = datetime(date(string(today(),'yyyy/mm/dd')))
		dw_3.object.user_id[ll_insert] = '0'
	else
		dw_2.deleterow(ll_find)
	end if
next
end event

type st_3 from statictext within w_itemcostupdate
integer x = 50
integer y = 1100
integer width = 818
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "[ ITEMCOST TABLE INSERT ]"
boolean focusrectangle = false
end type

type st_2 from statictext within w_itemcostupdate
integer x = 1344
integer y = 336
integer width = 594
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "[ ITEMCOST ]"
boolean focusrectangle = false
end type

type st_1 from statictext within w_itemcostupdate
integer x = 50
integer y = 336
integer width = 466
integer height = 52
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "[ ITEM ]"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_itemcostupdate
integer x = 50
integer y = 1164
integer width = 2569
integer height = 1020
integer taborder = 40
string dataobject = "d_sysitemcost_c"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_itemcostupdate
integer x = 1344
integer y = 416
integer width = 1275
integer height = 656
integer taborder = 20
string dataobject = "d_sysitemcost_b"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_itemcostupdate
integer x = 50
integer y = 412
integer width = 1285
integer height = 656
integer taborder = 10
string dataobject = "d_sysitemcost_a"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_itemcostupdate
integer x = 1806
integer y = 16
integer width = 2784
integer height = 264
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

