$PBExportHeader$w_wc.srw
$PBExportComments$작업장
forward
global type w_wc from window
end type
type st_title from statictext within w_wc
end type
type cb_2 from commandbutton within w_wc
end type
type cb_1 from commandbutton within w_wc
end type
type dw_1 from datawindow within w_wc
end type
end forward

global type w_wc from window
integer width = 2359
integer height = 1784
boolean titlebar = true
string title = "작업장선택(w_wc)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
st_title st_title
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_wc w_wc

type variables
gs_where istr_where

end variables

on w_wc.create
this.st_title=create st_title
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_title,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_wc.destroy
destroy(this.st_title)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//
string ls_item, ls_workno, ls_cat
long   ll_row

istr_where = Message.PowerObjectParm
setnull(istr_where.chk)

ls_cat     = istr_where.name // "LINE", "SCAN"
if ls_cat = "SCAN" then
	st_title.text = "스캐닝라인 선택"
else
	st_title.text = "생산라인 선택"
end if

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

SELECT isnull(item_nm,'( )')	INTO :ls_item FROM codemst   
 WHERE type = 'ycline작업장filter' and item_cd = 'ycline' and use_yn = 'Y';

if GF_Permission("ycline유압반pc", gs_ipaddress) = "Y" then
	dw_1.setfilter(' work_no in ' + ls_item)
	dw_1.filter()
else
	dw_1.setfilter(' ')
	dw_1.filter()
end if
dw_1.retrieve( gs_area, ls_cat )

ls_workno  = ProfileString("YCLINE.INI","Database","WORK", " ")
if isnull(ls_workno) OR trim(ls_workno) = "" then ls_workno = ""

for ll_row = 1 to dw_1.rowcount()
	if ls_workno = dw_1.object.work_no[ll_row] then
		dw_1.scrolltorow( ll_row )
		exit
	end if
next

end event

event closequery;IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE 
	RETURN 1
END IF
end event

type st_title from statictext within w_wc
integer x = 46
integer y = 32
integer width = 2258
integer height = 176
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "생산라인 선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_wc
integer x = 1248
integer y = 1532
integer width = 1056
integer height = 128
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;// 취소[ESC]
istr_where.chk = "N"
closewithreturn(parent, istr_where)

end event

type cb_1 from commandbutton within w_wc
integer x = 46
integer y = 1532
integer width = 1056
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인[ENT]"
boolean default = true
end type

event clicked;// 확인[ENT]
string ls_workno
long   ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
	istr_where.str1 = dw_1.object.work_no[ll_row]
	istr_where.name = dw_1.object.work_name[ll_row]
	istr_where.str2 = dw_1.object.work_manager[ll_row]
	
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
CloseWithReturn(Parent, istr_where)

end event

type dw_1 from datawindow within w_wc
integer x = 46
integer y = 248
integer width = 2258
integer height = 1260
integer taborder = 10
string title = "none"
string dataobject = "d_wc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

