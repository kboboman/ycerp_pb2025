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
end forward

global type w_iosheetqoh_m from w_inheritance
integer width = 4169
integer height = 2312
string title = "재고관리 SHEET(w_iosheetqoh_m)"
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
st_1 st_1
end type
global w_iosheetqoh_m w_iosheetqoh_m

type variables

string is_loc, is_item
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.cbx_4
this.Control[iCurrent+5]=this.cbx_5
this.Control[iCurrent+6]=this.st_1
end on

on w_iosheetqoh_m.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.st_1)
end on

event resize;call super::resize;dw_1.width  = this.width  - 128
dw_1.height = this.height - 508
end event

type pb_save from w_inheritance`pb_save within w_iosheetqoh_m
integer x = 3680
integer y = 48
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_iosheetqoh_m
integer x = 41
integer y = 372
integer width = 4041
integer height = 1804
string dataobject = "d_iosheetqoh_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;if row < 1 or pb_compute.enabled = false then return
dw_1.selectrow(row,NOT dw_1.IsSelected(row))


end event

type dw_2 from w_inheritance`dw_2 within w_iosheetqoh_m
integer x = 73
integer y = 256
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

type st_title from w_inheritance`st_title within w_iosheetqoh_m
integer x = 41
integer width = 1079
string text = "재고관리(SHEET)"
end type

type st_tips from w_inheritance`st_tips within w_iosheetqoh_m
end type

type pb_compute from w_inheritance`pb_compute within w_iosheetqoh_m
integer x = 2391
integer y = 256
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
end type

type pb_close from w_inheritance`pb_close within w_iosheetqoh_m
integer x = 3872
integer y = 48
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iosheetqoh_m
integer x = 3488
integer y = 48
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
integer y = 256
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
integer x = 3296
integer y = 48
end type

event pb_insert::clicked;call super::clicked;gs_where lst_code
long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return
//lst_code.str1 = dw_1.object.sheetmst_item_no[ll_row]
lst_code.str1 = dw_2.object.item_no[ll_row]
if lst_code.str1 = '%' then lst_code.str1 = dw_1.object.sheetmst_item_no[dw_1.getrow()]
openwithparm(w_whsheet_m, lst_code)
lst_code = message.powerobjectparm
if lst_code.chk = "N" then return
if MessageBox("확인", "재조회하시겠습니까?",  Exclamation!, OKCancel!, 2) = 2 then return
pb_retrieve.postevent(clicked!)
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iosheetqoh_m
integer x = 3104
integer y = 48
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
end event

type gb_3 from w_inheritance`gb_3 within w_iosheetqoh_m
integer x = 1170
integer y = 40
integer width = 1413
integer height = 156
end type

type gb_2 from w_inheritance`gb_2 within w_iosheetqoh_m
integer x = 41
integer y = 216
integer width = 4041
integer height = 144
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_iosheetqoh_m
integer x = 3067
integer y = 8
integer width = 1015
long backcolor = 81838264
end type

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
integer x = 2619
integer y = 156
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

