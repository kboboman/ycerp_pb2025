$PBExportHeader$w_whitemselectmulti_w2.srw
$PBExportComments$재고현황 다중물품검색윈도우(2009/06/19)
forward
global type w_whitemselectmulti_w2 from window
end type
type dw_4 from datawindow within w_whitemselectmulti_w2
end type
type rb_code from radiobutton within w_whitemselectmulti_w2
end type
type rb_name from radiobutton within w_whitemselectmulti_w2
end type
type cb_9 from commandbutton within w_whitemselectmulti_w2
end type
type cb_8 from commandbutton within w_whitemselectmulti_w2
end type
type cb_7 from commandbutton within w_whitemselectmulti_w2
end type
type cb_6 from commandbutton within w_whitemselectmulti_w2
end type
type cb_5 from commandbutton within w_whitemselectmulti_w2
end type
type cb_4 from commandbutton within w_whitemselectmulti_w2
end type
type cb_3 from commandbutton within w_whitemselectmulti_w2
end type
type cb_2 from commandbutton within w_whitemselectmulti_w2
end type
type cb_19 from commandbutton within w_whitemselectmulti_w2
end type
type cb_14 from commandbutton within w_whitemselectmulti_w2
end type
type cb_13 from commandbutton within w_whitemselectmulti_w2
end type
type cb_12 from commandbutton within w_whitemselectmulti_w2
end type
type cb_11 from commandbutton within w_whitemselectmulti_w2
end type
type cb_10 from commandbutton within w_whitemselectmulti_w2
end type
type cb_1 from commandbutton within w_whitemselectmulti_w2
end type
type st_3 from statictext within w_whitemselectmulti_w2
end type
type cb_reset from commandbutton within w_whitemselectmulti_w2
end type
type cb_ret from commandbutton within w_whitemselectmulti_w2
end type
type cb_cancel from commandbutton within w_whitemselectmulti_w2
end type
type cb_ok from commandbutton within w_whitemselectmulti_w2
end type
type gb_1 from groupbox within w_whitemselectmulti_w2
end type
type dw_1 from datawindow within w_whitemselectmulti_w2
end type
end forward

global type w_whitemselectmulti_w2 from window
integer x = 832
integer y = 360
integer width = 2080
integer height = 1660
boolean titlebar = true
string title = "물품다중선택(w_whitemselectmulti_w2)"
windowtype windowtype = response!
long backcolor = 79741120
dw_4 dw_4
rb_code rb_code
rb_name rb_name
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_19 cb_19
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_1 cb_1
st_3 st_3
cb_reset cb_reset
cb_ret cb_ret
cb_cancel cb_cancel
cb_ok cb_ok
gb_1 gb_1
dw_1 dw_1
end type
global w_whitemselectmulti_w2 w_whitemselectmulti_w2

type variables
gs_where2 istr_select
int ii_sw = 1

end variables

forward prototypes
public subroutine wf_filter (string as_word, string as_first, string as_second)
end prototypes

public subroutine wf_filter (string as_word, string as_first, string as_second);string  ls_result
dw_1.setredraw(false)

ls_result = "mid(item_name,1,2) = '" + as_word + "'or (mid(item_name,1,2) >= '" + as_first + "' and mid(item_name,1,2) < '" + as_second + "')"

dw_1.setfilter(ls_result)
dw_1.filter()
dw_1.setredraw(true)
dw_1.sort()
end subroutine

event open;istr_select =  message.powerobjectparm
if isnull(istr_select.chk) then
	istr_select.chk = "S" 
end if
dw_4.SetTransObject(SQLCA)
dw_4.insertrow(1)
dw_1.SetTransObject(SQLCA)
gs_ds_ITEMall.sharedata(dw_1)

dw_1.setsort('item_name')
end event

on w_whitemselectmulti_w2.create
this.dw_4=create dw_4
this.rb_code=create rb_code
this.rb_name=create rb_name
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_19=create cb_19
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_1=create cb_1
this.st_3=create st_3
this.cb_reset=create cb_reset
this.cb_ret=create cb_ret
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.dw_4,&
this.rb_code,&
this.rb_name,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_19,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_1,&
this.st_3,&
this.cb_reset,&
this.cb_ret,&
this.cb_cancel,&
this.cb_ok,&
this.gb_1,&
this.dw_1}
end on

on w_whitemselectmulti_w2.destroy
destroy(this.dw_4)
destroy(this.rb_code)
destroy(this.rb_name)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_19)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.cb_reset)
destroy(this.cb_ret)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event close;dw_1.SetSort("item_no, qa")
dw_1.Sort( )
dw_1.SetFilter("")
dw_1.Filter( )

end event

type dw_4 from datawindow within w_whitemselectmulti_w2
integer x = 613
integer y = 164
integer width = 873
integer height = 88
integer taborder = 250
string title = "none"
string dataobject = "d_oecustomer_s"
boolean border = false
boolean livescroll = true
end type

event editchanged;//long ll_found
//string ls_filter
//
//dw_1.setredraw(false)
//if rb_code.checked = true then
////	if len(data) = 1 then
////		dw_1.SetSort("item_no A ")
////		dw_1.Sort( )
////	end if
//	ll_found = dw_1.Find("item_no > '" + data + "'", 1, dw_1.RowCount())
//
//else
////	if len(data) = 1 then
////		dw_1.SetSort("item_no A ")
////		dw_1.Sort( )
////	end if
//
//	ll_found = dw_1.Find("item_name > '" + data + "'", 1, dw_1.RowCount())
//	dw_1.SetSort("item_no")
//	dw_1.Sort()
//end if
//
//dw_1.scrolltorow(ll_found)
//dw_1.setredraw(true)
//
end event

event getfocus;cb_ret.default = true
end event

event losefocus;this.accepttext()
end event

type rb_code from radiobutton within w_whitemselectmulti_w2
integer x = 265
integer y = 180
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "물품코드"
end type

event clicked;string ls_sort

dw_1.setredraw(false)
IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_no A"
else
	ii_sw = 0
	ls_sort = "item_no D"
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
dw_1.scrolltorow(1)
dw_1.SelectRow(0,  false)
dw_1.SelectRow(1,  true)
dw_1.setredraw(true)

end event

type rb_name from radiobutton within w_whitemselectmulti_w2
integer x = 46
integer y = 180
integer width = 219
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품명"
boolean checked = true
end type

event clicked;string ls_sort

dw_1.setredraw(false)
IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_name A "
else
	ii_sw = 0
	ls_sort = "item_name D "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
dw_1.scrolltorow(1)
dw_1.SelectRow(0,  false)
dw_1.SelectRow(1,  true)
dw_1.setredraw(true)

end event

type cb_9 from commandbutton within w_whitemselectmulti_w2
integer x = 1097
integer y = 52
integer width = 119
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅈ"
end type

event clicked;wf_filter('ㅈ','자','차')
end event

type cb_8 from commandbutton within w_whitemselectmulti_w2
integer x = 974
integer y = 52
integer width = 119
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅇ"
end type

event clicked;wf_filter('ㅇ','아','자')
end event

type cb_7 from commandbutton within w_whitemselectmulti_w2
integer x = 850
integer y = 52
integer width = 119
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅅ"
end type

event clicked;wf_filter('ㅅ','사','아')
end event

type cb_6 from commandbutton within w_whitemselectmulti_w2
integer x = 727
integer y = 52
integer width = 119
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅂ"
end type

event clicked;wf_filter('ㅂ','바','사')

end event

type cb_5 from commandbutton within w_whitemselectmulti_w2
integer x = 603
integer y = 52
integer width = 119
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅁ"
end type

event clicked;wf_filter('ㅁ','마','바')
end event

type cb_4 from commandbutton within w_whitemselectmulti_w2
integer x = 480
integer y = 52
integer width = 119
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄹ"
end type

event clicked;wf_filter('ㄹ','라','마')
end event

type cb_3 from commandbutton within w_whitemselectmulti_w2
integer x = 357
integer y = 52
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄷ"
end type

event clicked;wf_filter('ㄷ','다','라')
end event

type cb_2 from commandbutton within w_whitemselectmulti_w2
integer x = 233
integer y = 52
integer width = 119
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄴ"
end type

event clicked;wf_filter('ㄴ','나','다')
end event

type cb_19 from commandbutton within w_whitemselectmulti_w2
integer x = 1838
integer y = 52
integer width = 178
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ABC.."
end type

event clicked;m_dynamic lm_Addmenu
string ls_item
int li_int

lm_Addmenu = CREATE m_dynamic

DECLARE c_item CURSOR FOR  
  select distinct substring(item_no,1,2) from groupitem 
   order by substring(item_no,1,2);
open c_item;
li_int = 0
FETCH c_item INTO :ls_item;
DO WHILE sqlca.sqlcode = 0
	li_int = li_int + 1
	lm_Addmenu.item[li_int].Text = ls_item
	lm_Addmenu.item[li_int].Tag = string(li_int)
	lm_Addmenu.item[li_int].visible = true
	FETCH c_item INTO :ls_item;
LOOP
close c_item;
lm_Addmenu.PopMenu(parent.PointerX(), parent. PointerY())
//lm_Addmenu.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
if lm_Addmenu.tag = "" then return
ls_item = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
rb_code.checked = true
rb_code.triggerevent(clicked!)
dw_4.object.cust_no[1] = ls_item
cb_ret.postevent(clicked!)
//string ls_chk, ls_text, ls_sale
//int li_end, li_find, li_int
//
//ls_chk = 'Y'
//li_find = 1
//li_int = 0
//do while ls_chk = 'Y'
//	li_end = pos(ls_text, ",", li_find)
//	if li_end = 0 or isnull(li_end) then exit
//	ls_sale = mid(ls_text, li_find, 14)
//	if trim(ls_sale) = '' or isnull(ls_sale) then exit
//	li_int = li_int + 1
//	lm_Addmenu.item[li_int].Text = ls_sale
//	lm_Addmenu.item[li_int].Tag = string(li_int)
//	lm_Addmenu.item[li_int].visible = true
//	li_find = li_end + 2
//loop
//
//lm_Addmenu.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
//if lm_Addmenu.tag = "" then return
//ls_sale = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
//opensheet(w_orsale_m,  w_o_main, 5, original!)
//w_orsale_m.setredraw(false)
//w_orsale_m.em_3.text = left(ls_sale,10) 
//w_orsale_m.em_4.text = string(integer(right(ls_sale,3)))
//w_orsale_m.pb_cancel.postevent(clicked!)
//w_orsale_m.setredraw(true)
//
//
//wf_filter('A','A','z')

end event

type cb_14 from commandbutton within w_whitemselectmulti_w2
integer x = 1714
integer y = 52
integer width = 119
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅎ"
end type

event clicked;wf_filter('ㅎ','하','힣')
end event

type cb_13 from commandbutton within w_whitemselectmulti_w2
integer x = 1591
integer y = 52
integer width = 119
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅍ"
end type

event clicked;wf_filter('ㅍ','파','하')
end event

type cb_12 from commandbutton within w_whitemselectmulti_w2
integer x = 1467
integer y = 52
integer width = 119
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅌ"
end type

event clicked;wf_filter('ㅌ','타','파')
end event

type cb_11 from commandbutton within w_whitemselectmulti_w2
integer x = 1344
integer y = 52
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅋ"
end type

event clicked;wf_filter('ㅋ','카', '타')
end event

type cb_10 from commandbutton within w_whitemselectmulti_w2
integer x = 1221
integer y = 52
integer width = 119
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅊ"
end type

event clicked;wf_filter('ㅊ','자', '카')
end event

type cb_1 from commandbutton within w_whitemselectmulti_w2
integer x = 119
integer y = 52
integer width = 110
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄱ"
end type

event clicked;wf_filter('ㄱ','가','나')

end event

type st_3 from statictext within w_whitemselectmulti_w2
integer x = 27
integer y = 40
integer width = 91
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "품명"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_reset from commandbutton within w_whitemselectmulti_w2
integer x = 1765
integer y = 160
integer width = 229
integer height = 92
integer taborder = 250
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RESET"
end type

event clicked;dw_4.object.cust_no[1] = ""
dw_1.SetFilter("")
dw_1.Filter( )

end event

type cb_ret from commandbutton within w_whitemselectmulti_w2
integer x = 1536
integer y = 160
integer width = 178
integer height = 92
integer taborder = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;string ls_filter
string  ls_name

ls_name = trim(UPPER(dw_4.object.cust_no[1]))
cb_ret.default = false
IF ISNULL(ls_name) OR ls_name = "" THEN 
	ls_filter = ""
ELSE
	if rb_code.checked = true then
		ls_filter = "item_no like '" + ls_name + '%' + "'"
	else
		ls_filter = "item_name like '" + '%' + ls_name + '%' + "'"
	end if
END IF
dw_1.SetFilter(ls_filter)
dw_1.Filter( )
if dw_1.rowcount() > 1 then
		dw_1.ScrollToRow(1)
end if

end event

type cb_cancel from commandbutton within w_whitemselectmulti_w2
event clicked pbm_bnclicked
integer x = 1664
integer y = 1472
integer width = 384
integer height = 92
integer taborder = 230
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

type cb_ok from commandbutton within w_whitemselectmulti_w2
event clicked pbm_bnclicked
integer x = 1275
integer y = 1472
integer width = 384
integer height = 92
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;string ls_use
long ll_row, ll_cnt, ll_firstrow

ll_cnt = 0
ll_firstrow = DW_1.GetSelectedRow(0)
for ll_row = ll_firstrow to DW_1.ROWCOUNT()
	if dw_1.IsSelected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		istr_select.str1[ll_cnt] = dw_1.object.item_no[ll_row]
		SETNULL(ls_use)
		select use_flag into :ls_use from groupitem
		 where item_no = :istr_select.str1[ll_cnt];
		if ls_use = 'C' then
			messagebox("확인", "선택하신품목중에 사용불가인 품목이 있습니다 ~r~n" + &
									 "물품RELOAD 를 하신후에 다시 작업하여 주시기바랍니다")
			RETURN
		end if
		istr_select.str2[ll_cnt] = dw_1.object.uom[ll_row]
//		istr_select.str3[ll_cnt] = dw_1.object.source[ll_row]
		istr_select.name[ll_cnt] = dw_1.object.item_name[ll_row]
		if istr_select.chk = "S" then exit
	end if
next
if ll_cnt = 0 then return

istr_select.chk = "Y"
CloseWithReturn(parent, istr_select)
end event

type gb_1 from groupbox within w_whitemselectmulti_w2
integer x = 9
integer width = 2039
integer height = 272
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_1 from datawindow within w_whitemselectmulti_w2
integer x = 14
integer y = 280
integer width = 2039
integer height = 1180
integer taborder = 210
string dataobject = "d_groupitem_all"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)

end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
this.setredraw( false)
if istr_select.chk = "S" then
	this.SelectRow(0,  false)
	this.SelectRow(ll_row,  true)
else
	this.SelectRow(ll_row,  NOT this.IsSelected(ll_row))
end if
this.setredraw( true)

end event

event doubleclicked;cb_ok.postevent(clicked!)
end event

