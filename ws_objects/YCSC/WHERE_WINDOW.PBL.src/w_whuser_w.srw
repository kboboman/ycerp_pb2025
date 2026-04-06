$PBExportHeader$w_whuser_w.srw
$PBExportComments$작업라인사용자조회(2003/07/05, 이인호)
forward
global type w_whuser_w from window
end type
type cb_4 from commandbutton within w_whuser_w
end type
type cb_7 from commandbutton within w_whuser_w
end type
type cb_filteroff from commandbutton within w_whuser_w
end type
type cb_filteron from commandbutton within w_whuser_w
end type
type sle_value from singlelineedit within w_whuser_w
end type
type ddlb_2 from dropdownlistbox within w_whuser_w
end type
type st_9 from statictext within w_whuser_w
end type
type ddlb_col from dropdownlistbox within w_whuser_w
end type
type st_8 from statictext within w_whuser_w
end type
type cb_2 from commandbutton within w_whuser_w
end type
type cb_1 from commandbutton within w_whuser_w
end type
type dw_1 from datawindow within w_whuser_w
end type
end forward

global type w_whuser_w from window
integer x = 1938
integer y = 700
integer width = 2007
integer height = 1104
boolean titlebar = true
string title = "작업자선택(w_whuser_w)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_7 cb_7
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_whuser_w w_whuser_w

type variables
gs_where istr_where

end variables

on w_whuser_w.create
this.cb_4=create cb_4
this.cb_7=create cb_7
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.sle_value=create sle_value
this.ddlb_2=create ddlb_2
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_7,&
this.cb_filteroff,&
this.cb_filteron,&
this.sle_value,&
this.ddlb_2,&
this.st_9,&
this.ddlb_col,&
this.st_8,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_whuser_w.destroy
destroy(this.cb_4)
destroy(this.cb_7)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.sle_value)
destroy(this.ddlb_2)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;istr_where = message.powerobjectparm
dw_1.SetTransObject(SQLCA)
dw_1.retrieve(gs_area, istr_where.str1, date(istr_where.str2))

ddlb_col.text = "이름"
ddlb_2.text   = "LIKE"

end event

event closequery;IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

type cb_4 from commandbutton within w_whuser_w
integer x = 1778
integer y = 84
integer width = 178
integer height = 68
integer taborder = 50
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
String ls_col
choose case trim(ddlb_col.text)
	case "이름"
		ls_col = "user_name "
	case "부서명"
		ls_col = "p_name "
	case "팀명"
		ls_col = "t_name "
	case "직위"
		ls_col = "rank "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type cb_7 from commandbutton within w_whuser_w
integer x = 1595
integer y = 84
integer width = 178
integer height = 68
integer taborder = 40
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
String ls_col
choose case trim(ddlb_col.text)
	case "이름"
		ls_col = "user_name "
	case "부서명"
		ls_col = "p_name "
	case "팀명"
		ls_col = "t_name "
	case "직위"
		ls_col = "rank "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_filteroff from commandbutton within w_whuser_w
integer x = 1778
integer y = 16
integer width = 178
integer height = 68
integer taborder = 20
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "이름"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_filteron from commandbutton within w_whuser_w
integer x = 1595
integer y = 16
integer width = 178
integer height = 68
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "이름"
			ls_col = "user_name "
		case "부서명"
			ls_col = "p_name "
		case "팀명"
			ls_col = "t_name "
		case "직위"
			ls_col = "rank "
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)
dw_1.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type sle_value from singlelineedit within w_whuser_w
integer x = 1083
integer y = 44
integer width = 498
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_2 from dropdownlistbox within w_whuser_w
integer x = 791
integer y = 40
integer width = 279
integer height = 512
integer taborder = 20
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

type st_9 from statictext within w_whuser_w
integer x = 608
integer y = 60
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_col from dropdownlistbox within w_whuser_w
integer x = 192
integer y = 40
integer width = 402
integer height = 532
integer taborder = 10
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
string item[] = {"이름","부서명","팀명","직위"}
end type

type st_8 from statictext within w_whuser_w
integer x = 9
integer y = 60
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

type cb_2 from commandbutton within w_whuser_w
integer x = 1522
integer y = 904
integer width = 439
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
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

type cb_1 from commandbutton within w_whuser_w
integer x = 1061
integer y = 904
integer width = 439
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
	istr_where.str1 = dw_1.object.user_id[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whuser_w
integer x = 9
integer y = 160
integer width = 1947
integer height = 720
integer taborder = 10
string title = "none"
string dataobject = "d_lineuser_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
	istr_where.str1 = dw_1.object.user_id[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

