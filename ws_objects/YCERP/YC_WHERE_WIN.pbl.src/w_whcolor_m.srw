$PBExportHeader$w_whcolor_m.srw
$PBExportComments$수주칼라코일등록(1999/06/03, 이인호)
forward 
global type w_whcolor_m from window
end type
type cb_color from commandbutton within w_whcolor_m
end type
type cbx_all from checkbox within w_whcolor_m
end type
type st_2 from statictext within w_whcolor_m
end type
type cbx_use from checkbox within w_whcolor_m
end type
type cbx_first from checkbox within w_whcolor_m
end type
type cb_4 from commandbutton within w_whcolor_m
end type
type st_6 from statictext within w_whcolor_m
end type
type dw_2 from datawindow within w_whcolor_m
end type
type st_1 from statictext within w_whcolor_m
end type
type pb_save from picturebutton within w_whcolor_m
end type
type pb_delete from picturebutton within w_whcolor_m
end type
type pb_insert from picturebutton within w_whcolor_m
end type
type pb_retrieve from picturebutton within w_whcolor_m
end type
type cb_5 from commandbutton within w_whcolor_m
end type
type cb_3 from commandbutton within w_whcolor_m
end type
type cb_2 from commandbutton within w_whcolor_m
end type
type cb_1 from commandbutton within w_whcolor_m
end type
type sle_value from singlelineedit within w_whcolor_m
end type
type ddlb_op from dropdownlistbox within w_whcolor_m
end type
type st_4 from statictext within w_whcolor_m
end type
type ddlb_fld from dropdownlistbox within w_whcolor_m
end type
type st_3 from statictext within w_whcolor_m
end type
type sle_1 from singlelineedit within w_whcolor_m
end type
type cb_cancel from commandbutton within w_whcolor_m
end type
type cb_ok from commandbutton within w_whcolor_m
end type
type dw_1 from datawindow within w_whcolor_m
end type
type gb_1 from groupbox within w_whcolor_m
end type
type gb_2 from groupbox within w_whcolor_m
end type
type ddlb_dwtitles from dropdownlistbox within w_whcolor_m
end type
type gb_3 from groupbox within w_whcolor_m
end type
type gb_4 from groupbox within w_whcolor_m
end type
end forward

global type w_whcolor_m from window
integer x = 823
integer y = 360
integer width = 4155
integer height = 1996
boolean titlebar = true
string title = "w_whcolor_m"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_color cb_color
cbx_all cbx_all
st_2 st_2
cbx_use cbx_use
cbx_first cbx_first
cb_4 cb_4
st_6 st_6
dw_2 dw_2
st_1 st_1
pb_save pb_save
pb_delete pb_delete
pb_insert pb_insert
pb_retrieve pb_retrieve
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_value sle_value
ddlb_op ddlb_op
st_4 st_4
ddlb_fld ddlb_fld
st_3 st_3
sle_1 sle_1
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
ddlb_dwtitles ddlb_dwtitles
gb_3 gb_3
gb_4 gb_4
end type
global w_whcolor_m w_whcolor_m

type variables
gs_where istr_where
string is_code, is_name
long   il_find = 1
int    ii_sw = 0, ii_sw2 = 0
DataWindowChild idwc_maker, idwc_colortype
end variables

on w_whcolor_m.create
this.cb_color=create cb_color
this.cbx_all=create cbx_all
this.st_2=create st_2
this.cbx_use=create cbx_use
this.cbx_first=create cbx_first
this.cb_4=create cb_4
this.st_6=create st_6
this.dw_2=create dw_2
this.st_1=create st_1
this.pb_save=create pb_save
this.pb_delete=create pb_delete
this.pb_insert=create pb_insert
this.pb_retrieve=create pb_retrieve
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_3=create st_3
this.sle_1=create sle_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.cb_color,&
this.cbx_all,&
this.st_2,&
this.cbx_use,&
this.cbx_first,&
this.cb_4,&
this.st_6,&
this.dw_2,&
this.st_1,&
this.pb_save,&
this.pb_delete,&
this.pb_insert,&
this.pb_retrieve,&
this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_value,&
this.ddlb_op,&
this.st_4,&
this.ddlb_fld,&
this.st_3,&
this.sle_1,&
this.cb_cancel,&
this.cb_ok,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.ddlb_dwtitles,&
this.gb_3,&
this.gb_4}
end on

on w_whcolor_m.destroy
destroy(this.cb_color)
destroy(this.cbx_all)
destroy(this.st_2)
destroy(this.cbx_use)
destroy(this.cbx_first)
destroy(this.cb_4)
destroy(this.st_6)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.pb_save)
destroy(this.pb_delete)
destroy(this.pb_insert)
destroy(this.pb_retrieve)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.ddlb_dwtitles)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;// 색상명 찾기
//lst_code.str1 = ls_color
//lst_code.name = ls_color

long   ll_row, ll_found
string ls_colorno, ls_colornm, ls_maker, ls_colortype

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

pb_insert.visible = false
pb_delete.visible = false
pb_save.visible   = false
cb_color.enabled  = false

if GF_Permission("색상관리", gs_userid) = "Y" then
	cb_color.enabled  = true
//	pb_insert.visible = true
//	pb_delete.visible = true
// pb_save.visible   = true
end if

istr_where = Message.PowerObjectParm

ls_colorno   = istr_where.str1
ls_colornm   = istr_where.name
ls_maker     = "%"
ls_colortype = "%"

sle_1.text = trim(istr_where.name)

dw_1.SetTransObject(SQLCA)
dw_1.retrieve( ls_maker, "Y" )

// 제조사
dw_2.settransobject(sqlca)
dw_2.insertrow(0)  

dw_2.getchild("maker", idwc_maker)
idwc_maker.settransobject(sqlca)
idwc_maker.insertrow(1)
idwc_maker.setitem(1, 'maker', '전체')
dw_2.object.maker[1] = "전체"	// 

//// 색상타입
//dw_3.settransobject(sqlca)
//dw_3.insertrow(0)  
//
//dw_3.getchild("color_type", idwc_colortype)
//idwc_colortype.settransobject(sqlca)
//idwc_colortype.insertrow(1)
//idwc_colortype.setitem(1, 'color_type', '전체')
//dw_3.object.color_type[1] = "전체"	// 

ll_found = dw_1.find( "color_code = '" + ls_colornm + "' OR color_name = '" + ls_colornm + "' ", 1, dw_1.rowcount() )
if ll_found > 0 then
	dw_1.scrolltorow( ll_found )
end if
sle_1.setfocus()

end event

type cb_color from commandbutton within w_whcolor_m
integer x = 1358
integer y = 60
integer width = 457
integer height = 140
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "색상관리"
end type

event clicked;// 색상관리
if IsValid(w_o_main) = true then
	OpenSheet(w_cdcolor_m, w_o_main, 5, original!)
else
	OpenSheet(w_cdcolor_m, w_all_main, 5, original!)
end if


end event

type cbx_all from checkbox within w_whcolor_m
integer x = 2281
integer y = 140
integer width = 224
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일괄"
end type

type st_2 from statictext within w_whcolor_m
integer x = 1838
integer y = 52
integer width = 425
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "검색어"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_use from checkbox within w_whcolor_m
integer x = 3538
integer y = 288
integer width = 553
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "사용불가 포함"
end type

event clicked;//
pb_retrieve.triggerevent( clicked! )

end event

type cbx_first from checkbox within w_whcolor_m
integer x = 2281
integer y = 60
integer width = 329
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "1행부터"
end type

type cb_4 from commandbutton within w_whcolor_m
integer x = 2505
integer y = 128
integer width = 197
integer height = 80
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;// 검색
string ls_text, ls_findvalue
long   ll_row, ll_found, ll_find, ll_end

DEBUGBREAK()

// 필터해지
cb_2.triggerevent( clicked! )

ls_text = "%" + sle_1.text + "%"
if isnull(ls_text) OR trim(ls_text) = ""  OR ls_text = "%%" then RETURN

if cbx_first.checked = true then
	il_find = 1
	cbx_first.checked = false
end if
ll_end  = dw_1.RowCount() + 1

ls_findvalue = "(color_name  LIKE '" + ls_text + "') OR " + &
					"(color_lname LIKE '" + ls_text + "') OR " + &
					"(cat1        LIKE '" + ls_text + "') OR " + &
					"(product_no  LIKE '" + ls_text + "') OR " + &
					"(maker       LIKE '" + ls_text + "') OR " + &
					"(color_type  LIKE '" + ls_text + "') OR " + &
					"(sample_no   LIKE '" + ls_text + "') OR " + &
					"(color_bigo  LIKE '" + ls_text + "') "

if cbx_all.checked = false then
	// 개별선택 방식
	il_find = dw_1.find( ls_findvalue, il_find, ll_end )
	if il_find > 0 then
		dw_1.object.chk[il_find] = "Y"

		dw_1.scrolltorow( il_find )
		dw_1.SelectRow(0, false)
		dw_1.SelectRow(il_find, TRUE)

		il_find++	// Search Again
	end if
else
	// 일괄선택 방식
	dw_1.SelectRow(0, false)
	
	cbx_first.checked = false
	il_find = 1
	il_find = dw_1.find( ls_findvalue, il_find, ll_end )
	
	dw_1.setredraw( false )
	Do While il_find > 0
		dw_1.scrolltorow( il_find )
	
		////dw_1.SelectRow(0, false)
		//dw_1.SelectRow(il_find, TRUE)
		dw_1.object.chk[il_find] = "Y"
	
		ll_found = ll_found + 1
		
		il_find++	// Search Again
		il_find = dw_1.find( ls_findvalue, il_find, ll_end )
	Loop
	dw_1.setredraw( true )
	
	if ll_found > 0 then
		if MessageBox("확인","검색 대상을 필터링 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			dw_1.setfilter( " chk = 'Y' ")
			dw_1.filter()
		end if
	end if
end if

end event

type st_6 from statictext within w_whcolor_m
integer x = 2775
integer y = 52
integer width = 425
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "제조사"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_whcolor_m
integer x = 2775
integer y = 132
integer width = 425
integer height = 80
integer taborder = 100
string title = "none"
string dataobject = "d_whmaker_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_whcolor_m
integer x = 46
integer y = 52
integer width = 1179
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "도장색 선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_whcolor_m
integer x = 791
integer y = 8
integer width = 187
integer height = 144
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = left!
end type

event clicked;// 저장
long   ll_row
string ls_code
dwitemstatus l_status

dw_1.accepttext()

//setnull(ls_code)
//select max(supp_no)  into :ls_code from bsupp;
//if isnull(ls_code) or sqlca.SQLCode = 100 then
//	ls_code = "001"
//else 
//	ls_code = string(integer(ls_code) + 1, "000")
//end if
//for ll_row = 1 to dw_1.rowcount()
//	if isnull(dw_1.object.supp_name[ll_row]) or trim(dw_1.object.supp_name[ll_row]) = '' then 
//		beep(1)
//		dw_1.scrolltorow(ll_row)
//		return
//	end if
//	l_status = dw_1.getitemstatus(ll_row, 0,Primary!)
//	if l_status = new! or l_status = newmodified! then
//		dw_1.object.supp_no[ll_row] = ls_code
//		ls_code = string(integer(ls_code) + 1, "000")
//	end if
//next

if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if

//////////

end event

type pb_delete from picturebutton within w_whcolor_m
integer x = 594
integer y = 8
integer width = 187
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = left!
end type

event clicked;//
long   ll_row, ll_cnt, ll_cnt2
string ls_code

dw_1.accepttext()
if dw_1.getrow() < 1 then RETURN

ll_row = dw_1.getrow() 
ls_code = trim(dw_1.object.color_code[ll_row])

SELECT count(*) INTO :ll_cnt  FROM saledet WHERE color = :ls_code;
SELECT count(*) INTO :ll_cnt2 FROM sale    WHERE color = :ls_code;

if ll_cnt + ll_cnt2 > 0 then
	MessageBox("확인", "이코드는 이미 사용중입니다. 삭제할 수 없습니다!")
	RETURN
end if

dw_1.deleterow(ll_row)

dw_1.accepttext()
if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type pb_insert from picturebutton within w_whcolor_m
integer x = 398
integer y = 8
integer width = 187
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = left!
end type

event clicked;//
long ll_row

dw_1.accepttext()
ll_row = dw_1.insertrow(dw_1.getrow() + 1)

dw_1.ScrollToRow(ll_row)
dw_1.setcolumn('color_code')
dw_1.setfocus()


end event

type pb_retrieve from picturebutton within w_whcolor_m
integer x = 3291
integer y = 60
integer width = 187
integer height = 144
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;//
string ls_maker, ls_colortype, ls_useyn, ls_where, ls_filter, ls_text

ls_maker     = dw_2.object.maker[1]
if ls_maker = "전체" then ls_maker = "%"

// 사용불가 포함
if cbx_use.checked = true then
	ls_useyn = "%"
else
	ls_useyn = "Y"
end if

ls_colortype = "%"	// dw_3.object.color_type[1]
ls_text      = sle_1.text

dw_1.reset()
dw_1.retrieve( ls_maker, ls_useyn )

if dw_1.rowcount() > 1 then
	dw_1.ScrollToRow(1)
	istr_where.str1 = dw_1.object.color_code[1]
	istr_where.name = dw_1.object.color_name[1]
end if

end event

type cb_5 from commandbutton within w_whcolor_m
integer x = 2299
integer y = 284
integer width = 160
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_3 from commandbutton within w_whcolor_m
integer x = 2135
integer y = 284
integer width = 160
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_whcolor_m
integer x = 1970
integer y = 284
integer width = 160
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_1 from commandbutton within w_whcolor_m
integer x = 1806
integer y = 284
integer width = 160
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type sle_value from singlelineedit within w_whcolor_m
integer x = 1225
integer y = 284
integer width = 567
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_whcolor_m
integer x = 914
integer y = 276
integer width = 297
integer height = 512
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_4 from statictext within w_whcolor_m
integer x = 745
integer y = 292
integer width = 165
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
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_whcolor_m
integer x = 265
integer y = 276
integer width = 443
integer height = 632
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_3 from statictext within w_whcolor_m
integer x = 87
integer y = 292
integer width = 174
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
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_whcolor_m
integer x = 1838
integer y = 132
integer width = 425
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;//
long ll_row

il_find = 1
dw_1.SelectRow(0, false)

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = "N"
next
end event

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 2, 0 )		// 2번째 인수값 1=KOR, 2=ENG

this.SelectText(1, LenA(this.Text))

end event

type cb_cancel from commandbutton within w_whcolor_m
integer x = 3776
integer y = 60
integer width = 293
integer height = 144
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;// 취소
istr_where.chk = "N"
closewithreturn(parent, istr_where)

end event

type cb_ok from commandbutton within w_whcolor_m
integer x = 3483
integer y = 60
integer width = 293
integer height = 144
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;// 확인
long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
	istr_where.str1 = dw_1.object.color_code[ll_row]
	istr_where.name = dw_1.object.color_name[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if

CloseWithReturn( Parent, istr_where )

end event

type dw_1 from datawindow within w_whcolor_m
integer x = 37
integer y = 408
integer width = 4064
integer height = 1472
integer taborder = 100
string dataobject = "d_whcolor_m"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//THIS.ACCEPTTEXT()
//
//IF dwo.name = 'color_code' then
//	is_code = this.object.color_code[this.getrow()]
//	if THIS.retrieve(is_code) < 1 then
//		THIS.INSERTROW(0)
//		THIS.object.color_code[1] = is_code
//	end if
//	dw_1.setcolumn('color_name')
//	dw_1.setfocus()
//end if
//
end event

event doubleclicked;//
if isnull(row) OR row < 1 then RETURN

istr_where.chk = "Y"
istr_where.str1 = this.object.color_code[row]
istr_where.name = this.object.color_name[row]
CloseWithReturn(Parent, istr_where)
end event

event getfocus;//
Parent.cb_ok.default = true


end event

event losefocus;//
this.accepttext()

Parent.cb_ok.default = false


end event

event rowfocuschanged;//
if this.getrow() < 1 then RETURN

//this.SelectRow(0, false)
//this.SelectRow(currentrow, TRUE)

istr_where.chk = "Y"
istr_where.str1 = this.object.color_code[currentrow]
istr_where.name = this.object.color_name[currentrow]


end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type gb_1 from groupbox within w_whcolor_m
integer x = 3259
integer y = 12
integer width = 841
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_whcolor_m
integer x = 37
integer y = 232
integer width = 4064
integer height = 152
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type ddlb_dwtitles from dropdownlistbox within w_whcolor_m
integer x = 297
integer y = 288
integer width = 311
integer height = 88
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type gb_3 from groupbox within w_whcolor_m
integer x = 2738
integer y = 12
integer width = 503
integer height = 216
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_whcolor_m
integer x = 1330
integer y = 12
integer width = 1399
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

