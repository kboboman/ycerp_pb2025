$PBExportHeader$w_whitemstock_w.srw
$PBExportComments$장기재고조회(2003/08/26,이인호)
forward
global type w_whitemstock_w from window
end type
type st_6 from statictext within w_whitemstock_w
end type
type cb_2 from commandbutton within w_whitemstock_w
end type
type cb_1 from commandbutton within w_whitemstock_w
end type
type st_5 from statictext within w_whitemstock_w
end type
type em_2 from editmask within w_whitemstock_w
end type
type st_4 from statictext within w_whitemstock_w
end type
type st_3 from statictext within w_whitemstock_w
end type
type dw_3 from datawindow within w_whitemstock_w
end type
type cbx_2 from checkbox within w_whitemstock_w
end type
type st_2 from statictext within w_whitemstock_w
end type
type dw_2 from datawindow within w_whitemstock_w
end type
type cbx_1 from checkbox within w_whitemstock_w
end type
type st_1 from statictext within w_whitemstock_w
end type
type em_1 from editmask within w_whitemstock_w
end type
type pb_1 from picturebutton within w_whitemstock_w
end type
type rb_5 from radiobutton within w_whitemstock_w
end type
type rb_4 from radiobutton within w_whitemstock_w
end type
type rb_3 from radiobutton within w_whitemstock_w
end type
type pb_ret from picturebutton within w_whitemstock_w
end type
type rb_2 from radiobutton within w_whitemstock_w
end type
type rb_1 from radiobutton within w_whitemstock_w
end type
type sle_1 from singlelineedit within w_whitemstock_w
end type
type cb_cancel from commandbutton within w_whitemstock_w
end type
type pb_ok from picturebutton within w_whitemstock_w
end type
type dw_1 from datawindow within w_whitemstock_w
end type
type gb_1 from groupbox within w_whitemstock_w
end type
type gb_2 from groupbox within w_whitemstock_w
end type
end forward

global type w_whitemstock_w from window
integer x = 873
integer y = 476
integer width = 4407
integer height = 2080
boolean titlebar = true
string title = "장기재고조회(w_whitemstock_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_6 st_6
cb_2 cb_2
cb_1 cb_1
st_5 st_5
em_2 em_2
st_4 st_4
st_3 st_3
dw_3 dw_3
cbx_2 cbx_2
st_2 st_2
dw_2 dw_2
cbx_1 cbx_1
st_1 st_1
em_1 em_1
pb_1 pb_1
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
pb_ret pb_ret
rb_2 rb_2
rb_1 rb_1
sle_1 sle_1
cb_cancel cb_cancel
pb_ok pb_ok
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_whitemstock_w w_whitemstock_w

type variables
gs_where2 istr_where
string is_loc
end variables

forward prototypes
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

on w_whitemstock_w.create
this.st_6=create st_6
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_5=create st_5
this.em_2=create em_2
this.st_4=create st_4
this.st_3=create st_3
this.dw_3=create dw_3
this.cbx_2=create cbx_2
this.st_2=create st_2
this.dw_2=create dw_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.em_1=create em_1
this.pb_1=create pb_1
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.pb_ret=create pb_ret
this.rb_2=create rb_2
this.rb_1=create rb_1
this.sle_1=create sle_1
this.cb_cancel=create cb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_6,&
this.cb_2,&
this.cb_1,&
this.st_5,&
this.em_2,&
this.st_4,&
this.st_3,&
this.dw_3,&
this.cbx_2,&
this.st_2,&
this.dw_2,&
this.cbx_1,&
this.st_1,&
this.em_1,&
this.pb_1,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.pb_ret,&
this.rb_2,&
this.rb_1,&
this.sle_1,&
this.cb_cancel,&
this.pb_ok,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_whitemstock_w.destroy
destroy(this.st_6)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.em_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.cbx_2)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.pb_1)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.pb_ret)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.sle_1)
destroy(this.cb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//
istr_where = Message.PowerObjectParm

is_loc = istr_where.chk
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
em_2.text = string(RelativeDate ( today() , -180), 'yyyy/mm/dd')

end event

type st_6 from statictext within w_whitemstock_w
integer x = 41
integer y = 60
integer width = 951
integer height = 152
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "저장소재고조회"
alignment alignment = Center!
boolean border = true
borderstyle borderstyle = StyleShadowBox!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_whitemstock_w
integer x = 2555
integer y = 244
integer width = 238
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_item, ls_qa
date ld_date
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_item = dw_1.object.item_no[ll_row]
ls_qa = dw_1.object.qa[ll_row]
ld_date = date(em_2.text)
dw_2.retrieve(ld_date, is_loc, ls_item, ls_qa)

end event

type cb_1 from commandbutton within w_whitemstock_w
integer x = 3136
integer y = 860
integer width = 238
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;long ll_day, ll_row
string ls_item, ls_qa, ls_loc

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_item = dw_1.object.item_no[ll_row]
ls_qa = dw_1.object.qa[ll_row]
dw_3.retrieve(date(em_2.text), RelativeDate (today(), 1) , ls_item, ls_qa, is_loc)

end event

type st_5 from statictext within w_whitemstock_w
integer x = 2967
integer y = 872
integer width = 160
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "이후"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_whitemstock_w
integer x = 2560
integer y = 856
integer width = 407
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_4 from statictext within w_whitemstock_w
integer x = 2226
integer y = 872
integer width = 302
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 16711680
long backcolor = 67108864
string text = "전체내역"
boolean focusrectangle = false
end type

type st_3 from statictext within w_whitemstock_w
integer x = 2231
integer y = 156
integer width = 526
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "<=선택하시고클릭"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whitemstock_w
integer x = 2208
integer y = 944
integer width = 2158
integer height = 1032
integer taborder = 50
string title = "none"
string dataobject = "d_irusersilsa_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_whitemstock_w
integer x = 50
integer y = 256
integer width = 457
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

type st_2 from statictext within w_whitemstock_w
integer x = 2226
integer y = 260
integer width = 302
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 16711680
long backcolor = 67108864
string text = "입고내역"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_whitemstock_w
integer x = 2208
integer y = 324
integer width = 2158
integer height = 524
integer taborder = 40
string title = "none"
string dataobject = "d_whitemstock_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_whitemstock_w
integer x = 2011
integer y = 152
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
string text = "선택"
end type

event clicked;//dw_1.selectrow(0,this.checked)

end event

type st_1 from statictext within w_whitemstock_w
integer x = 3040
integer y = 116
integer width = 549
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일이전 재고발생분"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whitemstock_w
integer x = 2848
integer y = 88
integer width = 183
integer height = 108
integer taborder = 30
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "7"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type pb_1 from picturebutton within w_whitemstock_w
integer x = 3602
integer y = 84
integer width = 233
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
vtextalign vtextalign = vcenter!
end type

event clicked;datetime ldt_date 
date     ld_date 
int      li_int
string   ls_flag

if rb_3.checked = true then
	ls_flag = 'P%'
elseif rb_4.checked = true then
	ls_flag = 'G%'
elseif rb_5.checked = true then
	ls_flag = '%'
end if

select top 1 getdate() into :ldt_date from login;
ld_date = date(ldt_date)
ld_date = date(string(ld_date, 'yyyy/mm/dd'))
li_int  = integer(em_1.text) * -1
ld_date = RelativeDate(ld_date, li_int)

dw_1.retrieve(is_loc, ld_date, ls_flag)

end event

type rb_5 from radiobutton within w_whitemstock_w
integer x = 2546
integer y = 68
integer width = 224
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
end type

type rb_4 from radiobutton within w_whitemstock_w
integer x = 2281
integer y = 68
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상품"
end type

type rb_3 from radiobutton within w_whitemstock_w
integer x = 2007
integer y = 68
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "제품"
boolean checked = true
end type

type pb_ret from picturebutton within w_whitemstock_w
integer x = 1678
integer y = 124
integer width = 210
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
vtextalign vtextalign = vcenter!
end type

event clicked;string ls_fil

pb_ret.default = false
if trim(sle_1.text) = '' then
	ls_fil = ''
else
	if rb_1.checked = true then //코드
		ls_fil = " item_no like '" + trim(sle_1.text) + '%' + "'" 
	else
		ls_fil = " groupitem_item_name like '" + '%' + trim(sle_1.text) + '%' + "'" 
	end if
end if
dw_1.setfilter(ls_fil)
dw_1.filter()
end event

type rb_2 from radiobutton within w_whitemstock_w
integer x = 1079
integer y = 68
integer width = 251
integer height = 52
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

event clicked;dw_1.setfilter('groupitem_item_name, qa')
dw_1.sort()

end event

type rb_1 from radiobutton within w_whitemstock_w
integer x = 1358
integer y = 68
integer width = 251
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코드"
end type

event clicked;dw_1.setfilter('item_no, qa')
dw_1.sort()

end event

type sle_1 from singlelineedit within w_whitemstock_w
integer x = 1074
integer y = 136
integer width = 590
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 10
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event getfocus;pb_ret.default = true
end event

type cb_cancel from commandbutton within w_whitemstock_w
integer x = 4087
integer y = 84
integer width = 233
integer height = 120
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;//
istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type pb_ok from picturebutton within w_whitemstock_w
integer x = 3845
integer y = 84
integer width = 233
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
vtextalign vtextalign = vcenter!
end type

event clicked;//
long ll_row, ll_cnt

istr_where.chk = "Y"
ll_cnt = 0
for ll_row = 1 to dw_1.rowcount()
	if dw_1.IsSelected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		istr_where.str1[ll_cnt] = dw_1.object.item_no[ll_row]
		istr_where.str2[ll_cnt] = dw_1.object.qa[ll_row]
		istr_where.str3[ll_cnt] = string(dw_1.object.qoh[ll_row])
//		istr_where.str4[ll_cnt] = dw_1.object.source[ll_row]
//		istr_where.str5[ll_cnt] = dw_1.object.loc_no[ll_row]
		istr_where.name[ll_cnt] = dw_1.object.groupitem_item_name[ll_row]
	end if
next
if ll_cnt = 0 then istr_where.chk = "N"
CloseWithReturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whitemstock_w
integer x = 23
integer y = 324
integer width = 2167
integer height = 1648
integer taborder = 30
string dataobject = "d_whitemstock_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.scrolltorow(row)
if cbx_1.checked = true then
	dw_1.selectrow(row, not dw_1.isselected(row))
end if

end event

type gb_1 from groupbox within w_whitemstock_w
integer x = 1042
integer y = 16
integer width = 878
integer height = 220
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_whitemstock_w
integer x = 1938
integer y = 16
integer width = 2423
integer height = 220
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

