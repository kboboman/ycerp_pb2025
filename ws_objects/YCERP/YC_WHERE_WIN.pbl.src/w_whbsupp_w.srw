$PBExportHeader$w_whbsupp_w.srw
$PBExportComments$조업자재거래처선택(1999/06/07,  이인호)
forward 
global type w_whbsupp_w from window
end type
type cb_7 from commandbutton within w_whbsupp_w
end type
type cb_8 from commandbutton within w_whbsupp_w
end type
type cb_6 from commandbutton within w_whbsupp_w
end type
type cb_5 from commandbutton within w_whbsupp_w
end type
type cb_4 from commandbutton within w_whbsupp_w
end type
type cb_3 from commandbutton within w_whbsupp_w
end type
type st_2 from statictext within w_whbsupp_w
end type
type sle_1 from singlelineedit within w_whbsupp_w
end type
type cb_2 from commandbutton within w_whbsupp_w
end type
type cb_1 from commandbutton within w_whbsupp_w
end type
type dw_1 from datawindow within w_whbsupp_w
end type
end forward

global type w_whbsupp_w from window
integer x = 1824
integer y = 124
integer width = 2747
integer height = 1596
boolean titlebar = true
string title = "조업자재거래처선택(w_bsupp_w)"
windowtype windowtype = response!
long backcolor = 79741120
cb_7 cb_7
cb_8 cb_8
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
st_2 st_2
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_whbsupp_w w_whbsupp_w

type variables
gs_where istr_where
int ii_sw = 0
end variables

on w_whbsupp_w.create
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_2=create st_2
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_7,&
this.cb_8,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.st_2,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_whbsupp_w.destroy
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;
dw_1.SetTransObject(SQLCA)
dw_1.retrieve()

long ll_row

ll_row = 1
istr_where = Message.PowerObjectParm

//setfilter
cb_5.triggerevent(clicked!)
ll_row = dw_1.Find( "supp_name = '" + istr_where.name + "'", ll_row, dw_1.RowCount())

IF ll_row > 0 THEN
	dw_1.ScrollToRow(ll_row)
else
	sle_1.text = trim(istr_where.name)
	cb_4.triggerevent(clicked!)
	if dw_1.rowcount() < 1 then
		cb_3.triggerevent(clicked!)
		sle_1.text = trim(istr_where.name)
	end if		
end if

//gs_ds_qaall.sharedata(dw_1)
end event

type cb_7 from commandbutton within w_whbsupp_w
integer x = 18
integer y = 1316
integer width = 215
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;long ll_row
string ls_suppno

dw_1.accepttext()
if dw_1.getrow() < 1 then return

ls_suppno = trim(dw_1.object.supp_no[dw_1.getrow()])

select count(*) into :ll_row from binitem where supp_no = :ls_suppno;

if ll_row > 0 then
	MessageBox("확인", "이거래처는 일보에서 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if

dw_1.deleterow(dw_1.getrow())
dw_1.accepttext()
if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if

end event

type cb_8 from commandbutton within w_whbsupp_w
integer x = 18
integer y = 1412
integer width = 215
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;long ll_row
string ls_suppno
dwitemstatus l_status

dw_1.accepttext()
setnull(ls_suppno)
select max(supp_no)  into :ls_suppno from bsupp;
if isnull(ls_suppno) or sqlca.SQLCode = 100 then
	ls_suppno = "001"
else 
	ls_suppno = string(integer(ls_suppno) + 1, "000")
end if
for ll_row = 1 to dw_1.rowcount()
	if isnull(dw_1.object.supp_name[ll_row]) or trim(dw_1.object.supp_name[ll_row]) = '' then 
		beep(1)
		dw_1.scrolltorow(ll_row)
		return
	end if
	l_status = dw_1.getitemstatus(ll_row, 0,Primary!)
	if l_status = new! or l_status = newmodified! then
		dw_1.object.supp_no[ll_row] = ls_suppno
		ls_suppno = string(integer(ls_suppno) + 1, "000")
	end if
next
if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type cb_6 from commandbutton within w_whbsupp_w
integer x = 18
integer y = 1216
integer width = 215
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long ll_row
string ls_suppno

dw_1.accepttext()
ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn('supp_name')
dw_1.setfocus()

end event

type cb_5 from commandbutton within w_whbsupp_w
integer x = 41
integer y = 20
integer width = 1038
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처명 정렬"
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "supp_name A "
else
	ii_sw = 1
	ls_sort = "supp_name D "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type cb_4 from commandbutton within w_whbsupp_w
integer x = 430
integer y = 1412
integer width = 256
integer height = 92
integer taborder = 70
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
	ls_where = "supp_name like '" + ls_filter + "'"
END IF
dw_1.SetFilter(ls_where)
dw_1.Filter( )
if dw_1.rowcount() > 1 then
		dw_1.ScrollToRow(1)
		istr_where.str1 = dw_1.object.supp_no[1]
		istr_where.name = dw_1.object.supp_name[1]
end if

end event

type cb_3 from commandbutton within w_whbsupp_w
integer x = 695
integer y = 1412
integer width = 256
integer height = 92
integer taborder = 40
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

type st_2 from statictext within w_whbsupp_w
integer x = 398
integer y = 1328
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

type sle_1 from singlelineedit within w_whbsupp_w
integer x = 539
integer y = 1316
integer width = 398
integer height = 92
integer taborder = 30
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

type cb_2 from commandbutton within w_whbsupp_w
integer x = 1134
integer y = 1412
integer width = 297
integer height = 92
integer taborder = 90
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
CloseWithReturn(parent, istr_where)
end event

type cb_1 from commandbutton within w_whbsupp_w
integer x = 1134
integer y = 1316
integer width = 297
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;dw_1.accepttext()
if dw_1.getrow() > 0 then
	istr_where.chk = "Y"
	istr_where.str1 = dw_1.object.supp_no[dw_1.getrow()]
	istr_where.name = dw_1.object.supp_name[dw_1.getrow()]
else
	istr_where.chk = "N"
end if
CloseWithReturn(parent, istr_where)
end event

type dw_1 from datawindow within w_whbsupp_w
integer x = 27
integer y = 104
integer width = 2674
integer height = 1088
integer taborder = 10
string dataobject = "d_whbsupp_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() < 1 then return

this.SelectRow(0, false)
this.SelectRow(currentrow, TRUE)
istr_where.chk = "Y"
istr_where.str1 = this.object.supp_no[currentrow]
istr_where.name = this.object.supp_name[currentrow]


end event

event doubleclicked;if row < 1 then return

istr_where.chk = "Y"
istr_where.str1 = this.object.supp_no[row]
istr_where.name = this.object.supp_name[row]
CloseWithReturn(parent, istr_where)
end event

event losefocus;this.accepttext()
parent.cb_1.default = false


end event

event getfocus;parent.cb_1.default = true


end event

