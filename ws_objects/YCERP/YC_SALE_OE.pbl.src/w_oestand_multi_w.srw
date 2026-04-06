$PBExportHeader$w_oestand_multi_w.srw
$PBExportComments$일위대가 다중선택(2001/02/23,이인호)
forward 
global type w_oestand_multi_w from window
end type
type st_4 from statictext within w_oestand_multi_w
end type
type dw_3 from datawindow within w_oestand_multi_w
end type
type dw_2 from datawindow within w_oestand_multi_w
end type
type st_1 from statictext within w_oestand_multi_w
end type
type cb_7 from commandbutton within w_oestand_multi_w
end type
type cb_5 from commandbutton within w_oestand_multi_w
end type
type cb_4 from commandbutton within w_oestand_multi_w
end type
type sle_2 from singlelineedit within w_oestand_multi_w
end type
type st_3 from statictext within w_oestand_multi_w
end type
type st_2 from statictext within w_oestand_multi_w
end type
type sle_1 from singlelineedit within w_oestand_multi_w
end type
type cb_2 from commandbutton within w_oestand_multi_w
end type
type cb_1 from commandbutton within w_oestand_multi_w
end type
type dw_1 from datawindow within w_oestand_multi_w
end type
end forward

global type w_oestand_multi_w from window
integer x = 727
integer y = 136
integer width = 2478
integer height = 1860
boolean titlebar = true
string title = "일위대가선택(w_oestadn_multi_w)"
windowtype windowtype = response!
long backcolor = 79741120
st_4 st_4
dw_3 dw_3
dw_2 dw_2
st_1 st_1
cb_7 cb_7
cb_5 cb_5
cb_4 cb_4
sle_2 sle_2
st_3 st_3
st_2 st_2
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_oestand_multi_w w_oestand_multi_w

type variables
gs_where2 istr_where
int ii_sw = 0
long il_max = 0, il_min = 0

end variables

on w_oestand_multi_w.create
this.st_4=create st_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_1=create st_1
this.cb_7=create cb_7
this.cb_5=create cb_5
this.cb_4=create cb_4
this.sle_2=create sle_2
this.st_3=create st_3
this.st_2=create st_2
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_4,&
this.dw_3,&
this.dw_2,&
this.st_1,&
this.cb_7,&
this.cb_5,&
this.cb_4,&
this.sle_2,&
this.st_3,&
this.st_2,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_oestand_multi_w.destroy
destroy(this.st_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.cb_7)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_1.retrieve()

dw_1.sharedata(dw_2)

end event

type st_4 from statictext within w_oestand_multi_w
integer x = 14
integer y = 204
integer width = 183
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "정렬"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oestand_multi_w
integer x = 1070
integer y = 632
integer width = 1390
integer height = 1132
integer taborder = 60
string dataobject = "d_oestand_multi_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_oestand_multi_w
integer x = 1074
integer y = 280
integer width = 1385
integer height = 344
integer taborder = 50
string dataobject = "d_oestand_multi_s1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_oestand_multi_w
integer x = 14
integer y = 12
integer width = 183
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
string text = "검색"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_7 from commandbutton within w_oestand_multi_w
integer x = 709
integer y = 204
integer width = 352
integer height = 72
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "SYSTEM코드"
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_no A, item_name A "
else
	ii_sw = 0
	ls_sort = "item_no D, item_name A "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type cb_5 from commandbutton within w_oestand_multi_w
integer x = 219
integer y = 204
integer width = 480
integer height = 72
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "SYSTEM 명"
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_name A, item_no A"
else
	ii_sw = 0
	ls_sort = "item_name D, item_no A"
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type cb_4 from commandbutton within w_oestand_multi_w
integer x = 942
integer y = 20
integer width = 361
integer height = 92
integer taborder = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_filter, ls_where
string ls_item, ls_name

ls_item = trim(UPPER(sle_2.text))
ls_name = trim(UPPER(sle_1.text))

IF ISNULL(ls_name) OR ls_name = "" THEN 
	IF ISNULL(ls_item) OR ls_item = "" THEN 
			ls_where = ""
	ELSE
		ls_filter = '%' + ls_item + '%'
		ls_where = "item_no like '" + ls_filter + "'"
	END IF
	
ELSE
	ls_filter = '%' + ls_name + '%'
	ls_where = "item_name like '" + ls_filter + "'"
END IF
dw_1.SetFilter(ls_where)
dw_1.Filter( )
if dw_1.rowcount() > 1 then
		dw_1.ScrollToRow(1)
end if

end event

type sle_2 from singlelineedit within w_oestand_multi_w
integer x = 393
integer y = 112
integer width = 512
integer height = 84
integer taborder = 20
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

event getfocus;sle_1.text = ""
end event

type st_3 from statictext within w_oestand_multi_w
integer x = 219
integer y = 124
integer width = 174
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "코드:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oestand_multi_w
integer x = 219
integer y = 28
integer width = 174
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "품명:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_oestand_multi_w
integer x = 393
integer y = 16
integer width = 512
integer height = 84
integer taborder = 10
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

event getfocus;sle_2.text = ""

end event

event modified;IF ISNULL(TRIM(this.TEXT)) OR TRIM(THIS.TEXT) = "" THEN 
ELSE
	cb_4.triggerevent(clicked!)
end if
end event

type cb_2 from commandbutton within w_oestand_multi_w
integer x = 2053
integer y = 144
integer width = 384
integer height = 92
integer taborder = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type cb_1 from commandbutton within w_oestand_multi_w
integer x = 2053
integer y = 24
integer width = 384
integer height = 92
integer taborder = 90
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

istr_where.chk = "Y"

long ll_row, ll_cnt

for ll_row = il_min to il_max
	if dw_1.IsSelected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		istr_where.str1[ll_cnt] = dw_1.object.item_no[ll_row]
		istr_where.str2[ll_cnt] = dw_1.object.qa[ll_row]
		istr_where.str3[ll_cnt] = dw_1.object.uom[ll_row]
		istr_where.str4[ll_cnt] = dw_1.object.rem[ll_row]
		istr_where.str5[ll_cnt] = string(dw_1.object.amount[ll_row])
		istr_where.name[ll_cnt] = dw_1.object.item_name[ll_row]
	end if
next

CloseWithReturn(parent, istr_where)
end event

type dw_1 from datawindow within w_oestand_multi_w
integer x = 5
integer y = 280
integer width = 1061
integer height = 1484
integer taborder = 30
string dataobject = "d_oestand_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
this.SelectRow(row,  NOT this.IsSelected(row))
this.scrolltorow(row)
dw_2.scrolltorow(row)

il_min = min(il_min, row)
il_max = max(il_max, row)
end event

event rowfocuschanged;
dw_2.scrolltorow(currentrow)
dw_3.retrieve(this.object.item_no[currentrow])

end event

