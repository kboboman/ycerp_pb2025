$PBExportHeader$w_iosheetqoh_m.srw
$PBExportComments$SHEET재고관리(2002/03/30,이인호)
forward
global type w_iosheetqoh_m from w_inheritance
end type
type cbx_1 from checkbox within w_iosheetqoh_m
end type
type cbx_2 from checkbox within w_iosheetqoh_m
end type
type cbx_3 from checkbox within w_iosheetqoh_m
end type
type cbx_4 from checkbox within w_iosheetqoh_m
end type
type cbx_5 from checkbox within w_iosheetqoh_m
end type
type st_1 from statictext within w_iosheetqoh_m
end type
type st_8 from statictext within w_iosheetqoh_m
end type
type ddlb_fld from dropdownlistbox within w_iosheetqoh_m
end type
type ddlb_dwtitles from dropdownlistbox within w_iosheetqoh_m
end type
type st_9 from statictext within w_iosheetqoh_m
end type
type ddlb_op from dropdownlistbox within w_iosheetqoh_m
end type
type sle_value from singlelineedit within w_iosheetqoh_m
end type
type cb_filteron from commandbutton within w_iosheetqoh_m
end type
type cb_filteroff from commandbutton within w_iosheetqoh_m
end type
type cb_1 from commandbutton within w_iosheetqoh_m
end type
type cb_2 from commandbutton within w_iosheetqoh_m
end type
type pb_1 from picturebutton within w_iosheetqoh_m
end type
type cbx_no_use from checkbox within w_iosheetqoh_m
end type
type cbx_long_stock from checkbox within w_iosheetqoh_m
end type
type gb_5 from groupbox within w_iosheetqoh_m
end type
type gb_4 from groupbox within w_iosheetqoh_m
end type
end forward

global type w_iosheetqoh_m from w_inheritance
integer width = 4389
integer height = 2416
string title = "재고관리 SHEET(w_iosheetqoh_m)"
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
st_1 st_1
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
pb_1 pb_1
cbx_no_use cbx_no_use
cbx_long_stock cbx_long_stock
gb_5 gb_5
gb_4 gb_4
end type
global w_iosheetqoh_m w_iosheetqoh_m

type variables

string is_loc, is_item
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

// 2004/02/28일 부로 조용재 이사님과 협의 하여 모두 막음.
if GF_PERMISSION('SHEET재고_관리', gs_userid) = 'Y' then	
	datawindowchild ldwc_loc, ldwc_item
	
	dw_2.settransobject(sqlca)
	dw_2.insertrow(0)
	
	dw_2.getchild("loc_no", ldwc_loc)
	ldwc_loc.settransobject(SQLCA)
	ldwc_loc.insertrow(1)
	ldwc_loc.setitem(1, "loc_no",      "%")
	ldwc_loc.setitem(1, "loc_name", "전체")
	
	dw_2.getchild("item_no", ldwc_item)
	ldwc_item.settransobject(SQLCA)
	ldwc_item.insertrow(1)
	ldwc_item.setitem(1, "item_no",      "%")
	ldwc_item.setitem(1, "item_name", "전체")
	
	is_loc  = "%"
	is_item = "%"
	//is_flag = "W"
	//is_oc   = "O"
else
	pb_retrieve.enabled = false
	pb_insert.enabled   = false
	pb_save.enabled     = false
end if

end event

on w_iosheetqoh_m.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.st_1=create st_1
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.pb_1=create pb_1
this.cbx_no_use=create cbx_no_use
this.cbx_long_stock=create cbx_long_stock
this.gb_5=create gb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.cbx_4
this.Control[iCurrent+5]=this.cbx_5
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_8
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_9
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_filteron
this.Control[iCurrent+14]=this.cb_filteroff
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.cbx_no_use
this.Control[iCurrent+19]=this.cbx_long_stock
this.Control[iCurrent+20]=this.gb_5
this.Control[iCurrent+21]=this.gb_4
end on

on w_iosheetqoh_m.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.st_1)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.pb_1)
destroy(this.cbx_no_use)
destroy(this.cbx_long_stock)
destroy(this.gb_5)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)
gb_5.width  = newwidth  - (gb_5.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_iosheetqoh_m
integer x = 3735
integer y = 56
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_iosheetqoh_m
integer x = 32
integer y = 564
integer width = 4055
integer height = 1608
string dataobject = "d_iosheetqoh_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if row < 1 OR pb_compute.enabled = false then RETURN

dw_1.SelectRow( row, NOT dw_1.IsSelected(row) )


end event

type st_title from w_inheritance`st_title within w_iosheetqoh_m
integer x = 32
integer y = 20
integer width = 1079
string text = "재고관리(SHEET)"
end type

type st_tips from w_inheritance`st_tips within w_iosheetqoh_m
end type

type pb_compute from w_inheritance`pb_compute within w_iosheetqoh_m
integer x = 2391
integer y = 276
integer width = 302
integer height = 88
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "전체선택"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;if dw_1.rowcount() < 1 then return
dw_1.selectrow(0,NOT dw_1.IsSelected(1))


end event

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_iosheetqoh_m
boolean visible = false
integer x = 3182
end type

type pb_close from w_inheritance`pb_close within w_iosheetqoh_m
integer x = 4114
integer y = 56
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iosheetqoh_m
integer x = 3543
integer y = 56
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 SHEET재고내역을 출력합니다." 


gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iosheetqoh_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iosheetqoh_m
integer x = 2702
integer y = 276
integer width = 302
integer height = 88
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "삭제"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;if dw_1.rowcount() < 1 then return

long ll_row

for ll_row = 1 to dw_1.rowcount()
	if dw_1.IsSelected(ll_row) = true then
		dw_1.deleterow(ll_row)
		ll_row = ll_row - 1
	end if
next


end event

event pb_delete::mousemove;//
end event

type pb_insert from w_inheritance`pb_insert within w_iosheetqoh_m
integer x = 3351
integer y = 56
end type

event pb_insert::clicked;call super::clicked;gs_where lst_code
long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return
lst_code.str1 = dw_1.object.sheetmst_item_no[ll_row]

if not (lst_code.str1 = '' or isnull(lst_code.str1) ) then 
	lst_code.name = dw_1.object.groupitem_item_name[ll_row] 
end if

if lst_code.str1 = '%' then lst_code.str1 = dw_1.object.sheetmst_item_no[ll_row]

openwithparm(w_whsheet_m, lst_code)
lst_code = message.powerobjectparm
if lst_code.chk = "N" then return
if MessageBox("확인", "재조회하시겠습니까?",  Exclamation!, OKCancel!, 2) = 2 then return
pb_retrieve.postevent(clicked!)
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iosheetqoh_m
integer x = 3159
integer y = 56
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_oc[5]
int li_int

for li_int = 1 to 5
	setnull(ls_oc[li_int])
next
li_int = 1
if cbx_1.checked = true then
	ls_oc[li_int] = "O"
	li_int = li_int + 1
end if
if cbx_2.checked = true then
	ls_oc[li_int] =  "M"
	li_int = li_int + 1
end if
if cbx_3.checked = true then
	ls_oc[li_int] =  "P"
	li_int = li_int + 1
end if
if cbx_4.checked = true then
	ls_oc[li_int] =  "S"
	li_int = li_int + 1
end if
if cbx_5.checked = true then
	ls_oc[li_int] =  "C"
	li_int = li_int + 1
end if

dw_2.accepttext()

dw_1.retrieve( is_loc, is_item, ls_oc)


if cbx_long_stock.checked then
	if cbx_no_use.checked then
		dw_1.setfilter("  if ( isNull(long_stock_yn ) , 'N',  long_stock_yn ) = 'Y' AND if ( isNull(use_yn ) , 'N',  use_yn ) = 'Y'  ")
	else
		dw_1.setfilter("  if ( isNull(long_stock_yn ) , 'N',  long_stock_yn ) = 'Y' ")
	end if
else
	if cbx_no_use.checked then
		dw_1.setfilter(" if ( isNull(use_yn ) , 'N',  use_yn ) = 'Y'  ")
	else
		dw_1.setfilter("")
	end if
end if

dw_1.filter( )


if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iosheetqoh_m
integer x = 1170
integer y = 16
integer width = 1431
integer height = 204
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iosheetqoh_m
integer width = 4055
integer height = 160
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_iosheetqoh_m
integer x = 3122
integer y = 16
integer width = 1202
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_iosheetqoh_m
integer x = 73
integer y = 276
integer width = 2313
integer height = 84
string dataobject = "d_iosheetqoh_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;datawindowchild ldwc_loc, ldwc_item

this.accepttext()
dw_2.getchild("item_no", ldwc_item)

is_loc = trim(this.object.loc_no[1])
if trim(this.object.item_no[1]) = '%' then
	is_item = '%'
else
	is_item = ldwc_item.getitemstring(ldwc_item.getrow(), "item_name")
end if
if is_item <> '%' then is_item = is_item + '%'
if is_loc <> '%' then is_loc = is_loc + '%'

end event

type cbx_1 from checkbox within w_iosheetqoh_m
integer x = 1207
integer y = 100
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "재고"
boolean checked = true
end type

event clicked;dw_1.reset()
if cbx_1.checked = false &
	and cbx_2.checked = false &
	and cbx_3.checked = false &
	and cbx_4.checked = false &
	and cbx_5.checked = true then
	pb_compute.enabled = true
	pb_delete.enabled = true
else
	pb_compute.enabled = false
	pb_delete.enabled = false
end if
end event

type cbx_2 from checkbox within w_iosheetqoh_m
integer x = 1435
integer y = 100
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "계획"
boolean checked = true
end type

event clicked;dw_1.reset()
if cbx_1.checked = false &
	and cbx_2.checked = false &
	and cbx_3.checked = false &
	and cbx_4.checked = false &
	and cbx_5.checked = true then
	pb_compute.enabled = true
	pb_delete.enabled = true
else
	pb_compute.enabled = false
	pb_delete.enabled = false
end if
end event

type cbx_3 from checkbox within w_iosheetqoh_m
integer x = 1655
integer y = 100
integer width = 352
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "작업지시"
boolean checked = true
end type

event clicked;dw_1.reset()
if cbx_1.checked = false &
	and cbx_2.checked = false &
	and cbx_3.checked = false &
	and cbx_4.checked = false &
	and cbx_5.checked = true then
	pb_compute.enabled = true
	pb_delete.enabled = true
else
	pb_compute.enabled = false
	pb_delete.enabled = false
end if
end event

type cbx_4 from checkbox within w_iosheetqoh_m
integer x = 1998
integer y = 100
integer width = 352
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주가공"
boolean checked = true
end type

event clicked;dw_1.reset()
if cbx_1.checked = false &
	and cbx_2.checked = false &
	and cbx_3.checked = false &
	and cbx_4.checked = false &
	and cbx_5.checked = true then
	pb_compute.enabled = true
	pb_delete.enabled = true
else
	pb_compute.enabled = false
	pb_delete.enabled = false
end if
end event

type cbx_5 from checkbox within w_iosheetqoh_m
integer x = 2345
integer y = 100
integer width = 215
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완료"
end type

event clicked;dw_1.reset()
if cbx_1.checked = false &
	and cbx_2.checked = false &
	and cbx_3.checked = false &
	and cbx_4.checked = false &
	and cbx_5.checked = true then
	pb_compute.enabled = true
	pb_delete.enabled = true
else
	pb_compute.enabled = false
	pb_delete.enabled = false
end if
end event

type st_1 from statictext within w_iosheetqoh_m
integer x = 46
integer y = 172
integer width = 421
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "SHEET재고_관리"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type st_8 from statictext within w_iosheetqoh_m
integer x = 87
integer y = 456
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

type ddlb_fld from dropdownlistbox within w_iosheetqoh_m
integer x = 270
integer y = 436
integer width = 480
integer height = 580
integer taborder = 120
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

type ddlb_dwtitles from dropdownlistbox within w_iosheetqoh_m
integer x = 329
integer y = 444
integer width = 306
integer height = 92
integer taborder = 130
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

type st_9 from statictext within w_iosheetqoh_m
integer x = 786
integer y = 456
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

type ddlb_op from dropdownlistbox within w_iosheetqoh_m
integer x = 960
integer y = 436
integer width = 261
integer height = 500
integer taborder = 130
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_iosheetqoh_m
integer x = 1234
integer y = 440
integer width = 581
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_iosheetqoh_m
integer x = 1829
integer y = 436
integer width = 197
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_iosheetqoh_m
integer x = 2030
integer y = 436
integer width = 197
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_iosheetqoh_m
integer x = 2231
integer y = 436
integer width = 183
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_iosheetqoh_m
integer x = 2418
integer y = 436
integer width = 183
integer height = 84
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type pb_1 from picturebutton within w_iosheetqoh_m
event mousemove pbm_mousemove
integer x = 3922
integer y = 56
integer width = 187
integer height = 144
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"엑셀저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
datawindow dw_xls

dw_xls = dw_1

if dw_xls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_xls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	
	MessageBox("확인","작업완료")
end if	

end event

type cbx_no_use from checkbox within w_iosheetqoh_m
integer x = 2670
integer y = 128
integer width = 393
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "용도없음"
end type

type cbx_long_stock from checkbox within w_iosheetqoh_m
integer x = 2670
integer y = 52
integer width = 393
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "장기재고"
end type

type gb_5 from groupbox within w_iosheetqoh_m
integer x = 32
integer y = 380
integer width = 4055
integer height = 160
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_iosheetqoh_m
integer x = 2629
integer width = 480
integer height = 208
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "용도구분조회"
end type

