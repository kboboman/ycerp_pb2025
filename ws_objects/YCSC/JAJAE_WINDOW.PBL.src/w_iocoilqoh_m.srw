$PBExportHeader$w_iocoilqoh_m.srw
$PBExportComments$코일재고관리(2001/11/01,이인호)
forward
global type w_iocoilqoh_m from w_inheritance
end type
type cbx_1 from checkbox within w_iocoilqoh_m
end type
type cbx_2 from checkbox within w_iocoilqoh_m
end type
type cbx_3 from checkbox within w_iocoilqoh_m
end type
type cbx_4 from checkbox within w_iocoilqoh_m
end type
type cbx_5 from checkbox within w_iocoilqoh_m
end type
type cbx_6 from checkbox within w_iocoilqoh_m
end type
type st_1 from statictext within w_iocoilqoh_m
end type
end forward

global type w_iocoilqoh_m from w_inheritance
integer width = 4169
integer height = 2312
string title = "재고관리 코일(w_iocoilqoh_m)"
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
cbx_6 cbx_6
st_1 st_1
end type
global w_iocoilqoh_m w_iocoilqoh_m

type variables

string is_loc, is_item, is_flag
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

pb_insert.visible = false

// 2004/02/28일 부로 조용재 이사님과 협의 하여 모두 막음.
if GF_PERMISSION('코일재고_관리', gs_userid) = 'Y' then	
	datawindowchild ldwc_loc, ldwc_item

	dw_2.settransobject(sqlca)
	dw_2.insertrow(0)

	dw_2.getchild("loc_no", ldwc_loc)
	ldwc_loc.settransobject(SQLCA)
	ldwc_loc.insertrow(1)
	ldwc_loc.setitem(1, "loc_no",      "%")
	ldwc_loc.setitem(1, "loc_name", "전체")
	if gs_userid = '1999010s' then
	else
		if gs_area = 'S0001' then
			ldwc_loc.setfilter("loc_no <>  'WS00000006'")
		else
			ldwc_loc.setfilter("loc_no =  'WS00000006'")
		end if
		ldwc_loc.filter()
	end if

	dw_2.getchild("item_no", ldwc_item)
	ldwc_item.settransobject(SQLCA)
	ldwc_item.insertrow(1)
	ldwc_item.setitem(1, "item_no",      "%")
	ldwc_item.setitem(1, "item_name", "전체")

	is_loc  = "%"
	is_item = "%"
	is_flag = "W"
else
	//MessageBox("확인","프로그램의 사용권한이 없습니다.~n~n2004/02/28일 조용재 이사님과 협의 후 모두 막음.")
	pb_retrieve.enabled = false
	pb_save.enabled     = false
	pb_compute.enabled  = false
	pb_delete.enabled   = false
	cbx_6.enabled       = false
end if

end event

on w_iocoilqoh_m.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.cbx_6=create cbx_6
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.cbx_4
this.Control[iCurrent+5]=this.cbx_5
this.Control[iCurrent+6]=this.cbx_6
this.Control[iCurrent+7]=this.st_1
end on

on w_iocoilqoh_m.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.cbx_6)
destroy(this.st_1)
end on

event resize;call super::resize;dw_1.width  = this.width  - 128
dw_1.height = this.height - 508
end event

type pb_save from w_inheritance`pb_save within w_iocoilqoh_m
integer x = 3662
integer y = 48
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_iocoilqoh_m
integer x = 41
integer y = 372
integer width = 4041
integer height = 1804
string dataobject = "d_iocoilqoh_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;if row < 1 then return
if pb_compute.enabled = true or cbx_6.checked = true  then 
	dw_1.selectrow(row,NOT dw_1.IsSelected(row))
end if


end event

type dw_2 from w_inheritance`dw_2 within w_iocoilqoh_m
integer x = 73
integer y = 256
integer width = 2816
integer height = 84
string dataobject = "d_iocoilqoh_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;this.accepttext()
is_loc = trim(this.object.loc_no[1])
is_item = trim(this.object.item_no[1])
is_flag = trim(this.object.flag[1])
if dwo.name = 'flag' then
	if data = 'S' then
		dw_1.dataobject = 'd_iocoilqoh_m1'
	else
		dw_1.dataobject = 'd_iocoilqoh_m'
	end if
end if
//is_oc = trim(this.object.oc[1])


end event

type st_title from w_inheritance`st_title within w_iocoilqoh_m
integer y = 40
integer width = 1029
string text = "재고관리(코일)"
end type

type st_tips from w_inheritance`st_tips within w_iocoilqoh_m
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilqoh_m
integer x = 3054
integer y = 256
integer width = 302
integer height = 88
integer weight = 400
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

event pb_compute::mousemove;//
int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"전체선택",parent, li_x, li_y)

end event

event pb_compute::clicked;if dw_1.rowcount() < 1 then return
if cbx_6.checked = true then
	cbx_6.checked = false
	dw_1.selectrow(0,false)
else
	cbx_6.checked = true
	dw_1.selectrow(0,true)
end if


end event

type pb_print_part from w_inheritance`pb_print_part within w_iocoilqoh_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iocoilqoh_m
integer x = 3854
integer y = 48
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilqoh_m
integer x = 3470
integer y = 48
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 코일재고내역을 출력합니다." 


gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=95'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilqoh_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilqoh_m
integer x = 3369
integer y = 256
integer height = 88
integer weight = 400
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

type pb_insert from w_inheritance`pb_insert within w_iocoilqoh_m
integer x = 3273
integer y = 48
end type

event pb_insert::clicked;call super::clicked;//
//string ls_oc[5]
//int li_int
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//for li_int = 1 to 5
//	setnull(ls_oc[li_int])
//next
//li_int = 1
//if cbx_1.checked = true then
//	ls_oc[li_int] = "O"
//	li_int = li_int + 1
//end if
//if cbx_2.checked = true then
//	ls_oc[li_int] =  "M"
//	li_int = li_int + 1
//end if
//if cbx_3.checked = true then
//	ls_oc[li_int] =  "P"
//	li_int = li_int + 1
//end if
//if cbx_4.checked = true then
//	ls_oc[li_int] =  "S"
//	li_int = li_int + 1
//end if
//if cbx_5.checked = true then
//	ls_oc[li_int] =  "C"
//	li_int = li_int + 1
//end if
//dw_1.settransobject(sqlca)
//dw_1.retrieve( is_loc, is_item, is_flag , ls_oc)
//
//if gs_userid = '1999010s' or gs_userid = 'root' then
//		dw_1.setfilter("")
//else
//	if gs_area = 'S0001' then
//		dw_1.setfilter("coilmst_loc_no <>  'WS00000006'")
//	else
//		dw_1.setfilter("coilmst_loc_no =  'WS00000006'")
//	end if
//end if
//dw_1.filter()
//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilqoh_m
integer x = 3077
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
dw_1.settransobject(sqlca)
dw_1.retrieve( is_loc, is_item, is_flag , ls_oc)

if gs_userid = '1999010s' or gs_userid = 'root' then
		dw_1.setfilter("")
else
	if gs_area = 'S0001' then
		dw_1.setfilter("coilmst_loc_no <>  'WS00000006'")
	else
		dw_1.setfilter("coilmst_loc_no =  'WS00000006'")
	end if
end if
dw_1.filter()

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilqoh_m
integer x = 1134
integer y = 32
integer width = 1481
integer height = 148
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilqoh_m
integer x = 41
integer y = 208
integer width = 4041
integer height = 152
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilqoh_m
integer x = 3035
integer y = 4
integer width = 1047
long backcolor = 81838264
end type

type cbx_1 from checkbox within w_iocoilqoh_m
integer x = 1170
integer y = 84
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

type cbx_2 from checkbox within w_iocoilqoh_m
integer x = 1399
integer y = 84
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

type cbx_3 from checkbox within w_iocoilqoh_m
integer x = 1627
integer y = 88
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

type cbx_4 from checkbox within w_iocoilqoh_m
integer x = 1993
integer y = 88
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

type cbx_5 from checkbox within w_iocoilqoh_m
integer x = 2359
integer y = 88
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

type cbx_6 from checkbox within w_iocoilqoh_m
integer x = 2834
integer y = 268
integer width = 215
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
string text = "선택"
end type

type st_1 from statictext within w_iocoilqoh_m
integer x = 2638
integer y = 152
integer width = 384
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
string text = "코일재고_관리"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

