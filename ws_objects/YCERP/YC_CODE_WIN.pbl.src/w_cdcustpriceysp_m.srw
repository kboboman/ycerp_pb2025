$PBExportHeader$w_cdcustpriceysp_m.srw
$PBExportComments$YSP 표준단가 관리(2003/01/02, 이인호)
forward 
global type w_cdcustpriceysp_m from w_inheritance
end type
type sle_1 from singlelineedit within w_cdcustpriceysp_m
end type
type st_4 from statictext within w_cdcustpriceysp_m
end type
type cb_3 from commandbutton within w_cdcustpriceysp_m
end type
type rb_2 from radiobutton within w_cdcustpriceysp_m
end type
type rb_3 from radiobutton within w_cdcustpriceysp_m
end type
type rb_1 from radiobutton within w_cdcustpriceysp_m
end type
type st_2 from statictext within w_cdcustpriceysp_m
end type
end forward

global type w_cdcustpriceysp_m from w_inheritance
integer width = 3657
integer height = 2080
string title = "표준단가관리(YSP)(w_cdcustpriceysp_m)"
sle_1 sle_1
st_4 st_4
cb_3 cb_3
rb_2 rb_2
rb_3 rb_3
rb_1 rb_1
st_2 st_2
end type
global w_cdcustpriceysp_m w_cdcustpriceysp_m

type variables

end variables

on w_cdcustpriceysp_m.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_4=create st_4
this.cb_3=create cb_3
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_1=create rb_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.st_2
end on

on w_cdcustpriceysp_m.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_4)
destroy(this.cb_3)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_1)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

cb_3.enabled = false
dw_1.visible = false

if gf_permission('물품표준단가관리자', gs_userid) = 'Y' then
   pb_save.visible   = true
   pb_print.enabled  = true
else
   pb_save.visible   = false
   pb_print.enabled  = false
end if

end event

event resize;call super::resize;//
gb_3.width  = this.width  - 96
gb_3.height = this.height - 496

dw_2.width  = this.width  - 155
dw_2.height = this.height - 572

gb_2.width  = gb_3.width

end event

type pb_save from w_inheritance`pb_save within w_cdcustpriceysp_m
integer x = 3182
integer y = 48
end type

event pb_save::clicked;string ls_newsort
long   ll_row
dwItemStatus l_status

dw_2.accepttext()
if dw_2.rowcount() < 1 then return
if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
for ll_row = 1 to dw_2.rowcount() 
	l_status = dw_2.GetItemStatus(ll_row, 0, Primary!)
	if l_status = NewModified! or l_status = New! then
		dw_2.object.item_no[ll_row] = dw_2.object.item_item_no[ll_row]
		dw_2.object.qa[ll_row]      = dw_2.object.item_qa[ll_row]
		dw_2.object.uom[ll_row]     = dw_2.object.item_uom[ll_row]
		if dw_2.object.c_price[ll_row] <> dw_2.object.price[ll_row] then
			dw_2.object.pre_cost[ll_row] = dw_2.object.c_price[ll_row]
			dw_2.object.sys_date[ll_row] = wf_today()
		end if
	end if 
next

dw_2.accepttext()
if wf_update1(dw_2,"Y") = true then
	pb_retrieve.postevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdcustpriceysp_m
integer x = 1257
integer y = 12
integer width = 101
integer height = 84
string dataobject = "d_cdcustprice_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_cdcustpriceysp_m
integer x = 50
integer y = 56
integer width = 1362
string text = "표준단가관리(YSP)"
end type

type st_tips from w_inheritance`st_tips within w_cdcustpriceysp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustpriceysp_m
boolean visible = false
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcustpriceysp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcustpriceysp_m
integer x = 3374
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdcustpriceysp_m
integer x = 2990
integer y = 48
integer taborder = 120
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

dw_1.retrieve()
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처별 표준단가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustpriceysp_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustpriceysp_m
boolean visible = false
integer x = 2656
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_cdcustpriceysp_m
boolean visible = false
integer x = 2464
integer taborder = 160
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustpriceysp_m
integer x = 2793
integer y = 48
integer taborder = 150
end type

event pb_retrieve::clicked;//
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

cb_3.enabled = true
dw_2.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdcustpriceysp_m
integer x = 32
integer y = 376
integer width = 3561
integer height = 1584
integer textsize = -8
integer weight = 400
long backcolor = 67108864
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustpriceysp_m
integer y = 216
integer width = 3561
integer height = 160
integer taborder = 90
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79219928
string text = "custyspitem"
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustpriceysp_m
integer x = 2770
integer y = 8
integer width = 818
long backcolor = 79219928
end type

type dw_2 from w_inheritance`dw_2 within w_cdcustpriceysp_m
integer x = 59
integer y = 424
integer width = 3502
integer height = 1508
string dataobject = "d_cdcustyspitem_m"
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;string ls_item
dwItemStatus l_status

l_status = dw_1.GetItemStatus(row, 0, Primary!)

ls_item = this.object.item_no[row]
if isnull(ls_item) or trim(ls_item) = '' or l_status <> New! then
	dw_2.setitemstatus(row, 0, Primary!, New!)
//	dw_2.setitemstatus(row, 'item_no', Primary!, New!)
//	dw_2.setitemstatus(row, 'qa', Primary!, New!)
//	dw_2.setitemstatus(row, 'uom', Primary!, New!)
//	dw_2.setitemstatus(row, 'pre_cost', Primary!, New!)
//	dw_2.setitemstatus(row, 'price', Primary!, New!)
//	dw_2.setitemstatus(row, 'rem', Primary!, New!)
//	dw_2.setitemstatus(row, 'sys_date', Primary!, New!)
//	dw_2.setitemstatus(row, 'user_id', Primary!, New!)
end if


end event

event dw_2::itemerror;call super::itemerror;this.object.qa[this.getrow()] = ''
this.setcolumn("qa")
this.setfocus()
return 2
end event

type sle_1 from singlelineedit within w_cdcustpriceysp_m
integer x = 576
integer y = 268
integer width = 777
integer height = 88
integer taborder = 70
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
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_3.default = true
end event

event losefocus;cb_3.default = false
end event

event modified;cb_3.triggerevent(clicked!)
end event

type st_4 from statictext within w_cdcustpriceysp_m
integer x = 73
integer y = 288
integer width = 462
integer height = 60
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
string text = "물품명 검색 =>"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cdcustpriceysp_m
integer x = 1367
integer y = 268
integer width = 215
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "찾기"
end type

event clicked;string ls_where, ls_filter
string ls_item

ls_item = trim(UPPER(sle_1.text))

if isnull(ls_item) or ls_item = "" then 
	ls_where = ""
else
	ls_filter = '%' +ls_item + '%'
	ls_where = "item_item_name like '" + ls_filter + "'"
end if

dw_2.SetFilter(ls_where)
dw_2.Filter()

if dw_1.rowcount() > 1 then
	dw_2.ScrollToRow(1)
end if
sle_1.setfocus()
end event

type rb_2 from radiobutton within w_cdcustpriceysp_m
integer x = 1984
integer y = 284
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "판넬"
end type

event clicked;string ls_fil

ls_fil = "( item_item_no like 'PCYSYS%') or (item_item_no like 'GCYSYS%') or ( item_item_no like 'PCYSZ%')"
dw_2.setfilter(ls_fil)
dw_2.filter()

end event

type rb_3 from radiobutton within w_cdcustpriceysp_m
integer x = 2263
integer y = 284
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부속"
end type

event clicked;string ls_fil

ls_fil = "not((item_item_no like 'PCYSYS%') or (item_item_no like 'GCYSYS%') or ( item_item_no like 'PCYSZ%'))"
dw_2.setfilter(ls_fil)
dw_2.filter()

end event

type rb_1 from radiobutton within w_cdcustpriceysp_m
integer x = 1705
integer y = 284
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;string ls_fil

ls_fil = ""
dw_2.setfilter(ls_fil)
dw_2.filter()

end event

type st_2 from statictext within w_cdcustpriceysp_m
integer x = 1454
integer y = 140
integer width = 590
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "물품표준단가관리자"
boolean focusrectangle = false
end type

