$PBExportHeader$w_cdjaego_m.srw
$PBExportComments$재고관리아이템관리(1998/09/24,곽용덕)
forward
global type w_cdjaego_m from w_inheritance
end type
type dw_3 from datawindow within w_cdjaego_m
end type
type dw_4 from datawindow within w_cdjaego_m
end type
type gb_15 from groupbox within w_cdjaego_m
end type
type gb_5 from groupbox within w_cdjaego_m
end type
type dw_area from datawindow within w_cdjaego_m
end type
type cbx_1 from checkbox within w_cdjaego_m
end type
type pb_1 from picturebutton within w_cdjaego_m
end type
end forward

global type w_cdjaego_m from w_inheritance
integer width = 4622
integer height = 2116
string title = "재고물품관리(w_cdjaego_m)"
dw_3 dw_3
dw_4 dw_4
gb_15 gb_15
gb_5 gb_5
dw_area dw_area
cbx_1 cbx_1
pb_1 pb_1
end type
global w_cdjaego_m w_cdjaego_m

type variables
string is_where,is_select,is_clause,is_select1,is_where1,is_clause1
st_print i_print
datawindowchild idwc_item,idwc_date
INTEGER ii_line
end variables

on w_cdjaego_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.gb_15=create gb_15
this.gb_5=create gb_5
this.dw_area=create dw_area
this.cbx_1=create cbx_1
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.gb_15
this.Control[iCurrent+4]=this.gb_5
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.pb_1
end on

on w_cdjaego_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.gb_15)
destroy(this.gb_5)
destroy(this.dw_area)
destroy(this.cbx_1)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_2.insertrow(0)
dw_2.getchild('item_no',idwc_item)
gs_ds_itemall.ShareData(idwc_item)
//idwc_item.retrieve()
//dw_1.retrieve()

// area 추가 2003/03/07
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/03/07
end event

type pb_save from w_inheritance`pb_save within w_cdjaego_m
integer x = 4137
integer y = 56
integer taborder = 60
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdjaego_m
event mousemove pbm_mousemove
integer x = 2267
integer y = 604
integer width = 2235
integer height = 1348
integer taborder = 80
string dataobject = "d_cditemjaego_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdjaego_m
integer x = 539
integer y = 320
integer width = 3387
integer height = 168
integer taborder = 100
string dataobject = "d_cditemjaego_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;datawindowchild ldwc_loc
string ls_position,ls_itemname,ls_item

this.accepttext()
choose case dwo.name
	case 'item_no'
		if isnull(data) or data = "" then
		else
        ls_item = trim(data)
		  cbx_1.checked = false
		  dw_3.retrieve(ls_item)
		  dw_3.setfilter('use_flag <> "C"')
		  dw_3.filter()
		  
		  SELECT item_name INTO :ls_itemname FROM groupitem WHERE item_no = :ls_item;
        this.object.item_name[1] = ls_itemname 
		end if
		
	case else
end choose
end event

type st_title from w_inheritance`st_title within w_cdjaego_m
integer x = 37
integer width = 1120
string text = "재고물품관리"
end type

type st_tips from w_inheritance`st_tips within w_cdjaego_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdjaego_m
boolean visible = false
integer x = 965
integer y = 1008
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdjaego_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdjaego_m
integer x = 4329
integer y = 56
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdjaego_m
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 150
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdjaego_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_cdjaego_m
integer x = 1870
integer y = 1272
integer width = 352
integer height = 700
integer taborder = 170
integer textsize = -12
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<= 제거"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;dw_1.deleterow(dw_1.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_cdjaego_m
integer x = 1870
integer y = 568
integer width = 352
integer height = 700
integer taborder = 190
integer textsize = -12
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "등록 =>"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;long ll_row, ll_newrow, ll_find
string ls_itemno, ls_qa, ls_itemname


setpointer(hourglass!)
ls_itemno   = dw_2.getitemstring(1, 'item_no')
ls_itemname = dw_2.getitemstring(1, 'item_name')

for ll_row = 1 to dw_3.rowcount()
	if dw_3.isselected(ll_row) = true then		
		ls_qa   = dw_3.getitemstring(ll_row, 'qa')		
		ll_find = dw_1.find("item_no = '" + ls_itemno + "'" + " and qa = '" + ls_qa + "'", 1, dw_1.rowcount())
		
		if ll_find = 0 then
			ll_newrow = dw_1.insertrow(0)
			dw_1.setitem(ll_newrow, 'area_no', dw_area.object.area[1])
			dw_1.setitem(ll_newrow, 'item_no', ls_itemno)
			dw_1.setitem(ll_newrow, 'qa', ls_qa)
			dw_1.setitem(ll_newrow, 'groupitem_item_name', ls_itemname)
		else 
			messagebox('알림', string(ll_row) + '번째는 이미 재고물품에 등록이 되어있습니다.')
			continue
		end if
	end if	
next 

dw_3.SelectRow(0, false)
setpointer(arrow!)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdjaego_m
integer x = 3941
integer y = 56
integer taborder = 180
end type

event pb_retrieve::clicked;//
dw_1.retrieve(dw_area.object.area[1])
end event

type gb_3 from w_inheritance`gb_3 within w_cdjaego_m
integer x = 32
integer y = 256
integer width = 3927
integer height = 260
integer taborder = 110
end type

type gb_2 from w_inheritance`gb_2 within w_cdjaego_m
integer x = 2240
integer y = 544
integer width = 2290
integer height = 1428
integer taborder = 120
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "재고물품 목록"
end type

type gb_1 from w_inheritance`gb_1 within w_cdjaego_m
integer x = 3913
integer y = 16
integer width = 626
integer taborder = 70
end type

type dw_3 from datawindow within w_cdjaego_m
integer x = 50
integer y = 604
integer width = 1765
integer height = 1348
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_cdqa_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
if row < 1 then return
this.SelectRow(row, not this.isselected(row))

end event

type dw_4 from datawindow within w_cdjaego_m
boolean visible = false
integer x = 1947
integer y = 20
integer width = 256
integer height = 208
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_irincoun_r"
boolean livescroll = true
end type

type gb_15 from groupbox within w_cdjaego_m
integer x = 3310
integer y = 12
integer width = 585
integer height = 204
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_5 from groupbox within w_cdjaego_m
integer x = 27
integer y = 544
integer width = 1819
integer height = 1428
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "규격"
end type

type dw_area from datawindow within w_cdjaego_m
integer x = 3342
integer y = 92
integer width = 521
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
pb_retrieve.postevent(clicked!)
end event

type cbx_1 from checkbox within w_cdjaego_m
integer x = 73
integer y = 532
integer width = 375
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;
if cbx_1.checked = true then
	dw_3.SelectRow(0, true)
else
	dw_3.SelectRow(0, false)
end if
end event

type pb_1 from picturebutton within w_cdjaego_m
integer x = 82
integer y = 316
integer width = 443
integer height = 172
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품선택"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;gs_where2 lstr_where
string ls_null
long   ll_row

dw_2.accepttext()

lstr_where.chk = "S"
openwithparm( w_whitemselectmulti_w, lstr_where )
lstr_where = Message.PowerObjectParm
if lstr_where.chk = "Y" then
	dw_2.object.item_no[1] = lstr_where.str1[1]
//	dw_2.triggerevent( itemchanged! )
end if

end event

