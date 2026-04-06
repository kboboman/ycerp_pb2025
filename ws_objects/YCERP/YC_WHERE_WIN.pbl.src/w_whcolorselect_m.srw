$PBExportHeader$w_whcolorselect_m.srw
$PBExportComments$수주칼라코일등록(1999/06/03, 이인호)
forward 
global type w_whcolorselect_m from window
end type
type cb_13 from commandbutton within w_whcolorselect_m
end type
type cb_12 from commandbutton within w_whcolorselect_m
end type
type cb_11 from commandbutton within w_whcolorselect_m
end type
type cb_10 from commandbutton within w_whcolorselect_m
end type
type sle_value from singlelineedit within w_whcolorselect_m
end type
type ddlb_op from dropdownlistbox within w_whcolorselect_m
end type
type st_4 from statictext within w_whcolorselect_m
end type
type ddlb_dwtitles from dropdownlistbox within w_whcolorselect_m
end type
type ddlb_fld from dropdownlistbox within w_whcolorselect_m
end type
type st_3 from statictext within w_whcolorselect_m
end type
type st_1 from statictext within w_whcolorselect_m
end type
type cb_8 from commandbutton within w_whcolorselect_m
end type
type cb_6 from commandbutton within w_whcolorselect_m
end type
type cb_7 from commandbutton within w_whcolorselect_m
end type
type st_2 from statictext within w_whcolorselect_m
end type
type cb_4 from commandbutton within w_whcolorselect_m
end type
type cb_3 from commandbutton within w_whcolorselect_m
end type
type sle_1 from singlelineedit within w_whcolorselect_m
end type
type cb_2 from commandbutton within w_whcolorselect_m
end type
type cb_1 from commandbutton within w_whcolorselect_m
end type
type dw_1 from datawindow within w_whcolorselect_m
end type
type gb_1 from groupbox within w_whcolorselect_m
end type
type gb_2 from groupbox within w_whcolorselect_m
end type
end forward

global type w_whcolorselect_m from window
integer x = 823
integer y = 360
integer width = 3762
integer height = 1912
boolean titlebar = true
string title = "w_whcolorselect_m"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
sle_value sle_value
ddlb_op ddlb_op
st_4 st_4
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_3 st_3
st_1 st_1
cb_8 cb_8
cb_6 cb_6
cb_7 cb_7
st_2 st_2
cb_4 cb_4
cb_3 cb_3
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_whcolorselect_m w_whcolorselect_m

type variables
gs_where istr_where
string is_code, is_name
int ii_sw = 0, ii_sw2 = 0
end variables

on w_whcolorselect_m.create
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_4=create st_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_fld=create ddlb_fld
this.st_3=create st_3
this.st_1=create st_1
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cb_7=create cb_7
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.sle_value,&
this.ddlb_op,&
this.st_4,&
this.ddlb_dwtitles,&
this.ddlb_fld,&
this.st_3,&
this.st_1,&
this.cb_8,&
this.cb_6,&
this.cb_7,&
this.st_2,&
this.cb_4,&
this.cb_3,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_whcolorselect_m.destroy
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_4)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_fld)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_1.SetTransObject(SQLCA)
dw_1.retrieve()
long ll_row

ll_row = 1
istr_where = Message.PowerObjectParm

////setfilter
//cb_5.triggerevent(clicked!)
//ll_row = dw_1.Find( "color_name = '" + istr_where.name + "'", ll_row, dw_1.RowCount())
//IF ll_row > 0 THEN
//	dw_1.ScrollToRow(ll_row)
//else
//	sle_1.text = trim(istr_where.name)
//	cb_4.triggerevent(clicked!)
//	if dw_1.rowcount() < 1 then
//		cb_3.triggerevent(clicked!)
//		sle_1.text = trim(istr_where.name)
//	end if
//end if
//
end event

type cb_13 from commandbutton within w_whcolorselect_m
integer x = 2327
integer y = 284
integer width = 160
integer height = 76
integer taborder = 160
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

type cb_12 from commandbutton within w_whcolorselect_m
integer x = 2162
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_11 from commandbutton within w_whcolorselect_m
integer x = 1998
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

type cb_10 from commandbutton within w_whcolorselect_m
integer x = 1833
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type sle_value from singlelineedit within w_whcolorselect_m
integer x = 1253
integer y = 284
integer width = 567
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_whcolorselect_m
integer x = 942
integer y = 276
integer width = 297
integer height = 512
integer taborder = 110
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

type st_4 from statictext within w_whcolorselect_m
integer x = 773
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

type ddlb_dwtitles from dropdownlistbox within w_whcolorselect_m
integer x = 334
integer y = 288
integer width = 311
integer height = 88
integer taborder = 110
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

type ddlb_fld from dropdownlistbox within w_whcolorselect_m
integer x = 302
integer y = 276
integer width = 443
integer height = 632
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

type st_3 from statictext within w_whcolorselect_m
integer x = 114
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

type st_1 from statictext within w_whcolorselect_m
integer x = 50
integer y = 60
integer width = 1065
integer height = 140
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "색상선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_8 from commandbutton within w_whcolorselect_m
integer x = 2688
integer y = 76
integer width = 215
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;long ll_row
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

type cb_6 from commandbutton within w_whcolorselect_m
integer x = 2231
integer y = 76
integer width = 215
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.insertrow(dw_1.getrow() + 1)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn('color_code')
dw_1.setfocus()


end event

type cb_7 from commandbutton within w_whcolorselect_m
integer x = 2459
integer y = 76
integer width = 215
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;long ll_row, ll_cnt, ll_cnt2
string ls_code

dw_1.accepttext()
if dw_1.getrow() < 1 then return
ll_row = dw_1.getrow() 
ls_code = trim(dw_1.object.color_code[ll_row])

select count(*) into :ll_cnt from saledet where color = :ls_code;
select count(*) into :ll_cnt2 from sale where color = :ls_code;

if ll_cnt + ll_cnt2 > 0 then
	MessageBox("확인", "이코드는 이미 사용중입니다. 삭제할 수 없습니다!")
	return
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

type st_2 from statictext within w_whcolorselect_m
integer x = 1362
integer y = 96
integer width = 142
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "  명"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_whcolorselect_m
integer x = 1961
integer y = 76
integer width = 256
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_where,ls_filter, ls_name

ls_name = trim(sle_1.text)

IF ISNULL(ls_name) OR ls_name = "" THEN 
ELSE
	ls_filter = '%' + ls_name + '%'
	ls_where = "color_name like '" + ls_filter + "'"
END IF
dw_1.SetFilter(ls_where)
dw_1.Filter( )
if dw_1.rowcount() > 1 then
	dw_1.ScrollToRow(1)
	istr_where.str1 = dw_1.object.color_code[1]
	istr_where.name = dw_1.object.color_name[1]
end if


end event

type cb_3 from commandbutton within w_whcolorselect_m
integer x = 2917
integer y = 76
integer width = 256
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RESET"
end type

event clicked;string ls_where

setnull(ls_where)
sle_1.text = ""
dw_1.SetFilter("")
dw_1.Filter( )
end event

type sle_1 from singlelineedit within w_whcolorselect_m
integer x = 1541
integer y = 72
integer width = 398
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;IF ISNULL(TRIM(this.TEXT)) OR TRIM(THIS.TEXT) = "" THEN 
ELSE
	cb_4.triggerevent(clicked!)
end if
end event

type cb_2 from commandbutton within w_whcolorselect_m
integer x = 3109
integer y = 1592
integer width = 603
integer height = 112
integer taborder = 30
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;istr_where.chk = "N"
closewithreturn(parent, istr_where)

end event

type cb_1 from commandbutton within w_whcolorselect_m
integer x = 2491
integer y = 1592
integer width = 603
integer height = 112
integer taborder = 10
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
//	IF ISNULL( dw_1.object.color_code[ll_row] ) THEN
//		BEEP(2)
//		dw_1.setcolumn('color_code')
//		dw_1.setfocus()
//		RETURN
//	END IF
//	IF ISNULL( dw_1.object.color_name[ll_row] ) THEN
//		BEEP(2)
//		dw_1.setcolumn('color_name')
//		dw_1.setfocus()
//		RETURN
//	END IF
//	
//	dw_1.update()
//	commit;
	istr_where.str1 = dw_1.object.color_code[ll_row]
	istr_where.name = dw_1.object.color_name[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
//	rollback;
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whcolorselect_m
integer x = 50
integer y = 416
integer width = 3657
integer height = 1148
integer taborder = 100
string dataobject = "d_whcolor_m"
boolean vscrollbar = true
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

event doubleclicked;if row < 1 then return

istr_where.chk = "Y"
istr_where.str1 = this.object.color_code[row]
istr_where.name = this.object.color_name[row]
CloseWithReturn(parent, istr_where)
end event

event getfocus;parent.cb_1.default = true


end event

event losefocus;this.accepttext()
parent.cb_1.default = false


end event

event rowfocuschanged;if this.getrow() < 1 then return

this.SelectRow(0, false)
this.SelectRow(currentrow, TRUE)
istr_where.chk = "Y"
istr_where.str1 = this.object.color_code[currentrow]
istr_where.name = this.object.color_name[currentrow]


end event

type gb_1 from groupbox within w_whcolorselect_m
integer x = 1298
integer y = 16
integer width = 2409
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

type gb_2 from groupbox within w_whcolorselect_m
integer x = 50
integer y = 232
integer width = 3657
integer height = 152
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

