$PBExportHeader$w_cdjaego_m.srw
$PBExportComments$재고관리아이템관리(1998/09/24,곽용덕)
forward
global type w_cdjaego_m from w_inheritance
end type
type dw_3 from datawindow within w_cdjaego_m
end type
type dw_4 from datawindow within w_cdjaego_m
end type
type dw_area from datawindow within w_cdjaego_m
end type
type cbx_1 from checkbox within w_cdjaego_m
end type
type pb_ins from picturebutton within w_cdjaego_m
end type
type cbx_m2 from checkbox within w_cdjaego_m
end type
type st_1 from statictext within w_cdjaego_m
end type
type sle_code from singlelineedit within w_cdjaego_m
end type
type sle_name from singlelineedit within w_cdjaego_m
end type
type st_5 from statictext within w_cdjaego_m
end type
type ddlb_fld from dropdownlistbox within w_cdjaego_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdjaego_m
end type
type st_6 from statictext within w_cdjaego_m
end type
type sle_value from singlelineedit within w_cdjaego_m
end type
type cb_1 from commandbutton within w_cdjaego_m
end type
type cb_2 from commandbutton within w_cdjaego_m
end type
type cb_3 from commandbutton within w_cdjaego_m
end type
type cb_5 from commandbutton within w_cdjaego_m
end type
type st_jaego from statictext within w_cdjaego_m
end type
type ddlb_op from dropdownlistbox within w_cdjaego_m
end type
end forward

global type w_cdjaego_m from w_inheritance
integer width = 4448
integer height = 2612
string title = "재고물품 관리(w_cdjaego_m)"
dw_3 dw_3
dw_4 dw_4
dw_area dw_area
cbx_1 cbx_1
pb_ins pb_ins
cbx_m2 cbx_m2
st_1 st_1
sle_code sle_code
sle_name sle_name
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_jaego st_jaego
ddlb_op ddlb_op
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
this.dw_area=create dw_area
this.cbx_1=create cbx_1
this.pb_ins=create pb_ins
this.cbx_m2=create cbx_m2
this.st_1=create st_1
this.sle_code=create sle_code
this.sle_name=create sle_name
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_jaego=create st_jaego
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.pb_ins
this.Control[iCurrent+6]=this.cbx_m2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_code
this.Control[iCurrent+9]=this.sle_name
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.st_jaego
this.Control[iCurrent+20]=this.ddlb_op
end on

on w_cdjaego_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_area)
destroy(this.cbx_1)
destroy(this.pb_ins)
destroy(this.cbx_m2)
destroy(this.st_1)
destroy(this.sle_code)
destroy(this.sle_name)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_jaego)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_ins.enabled    = false
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

//
dw_3.settransobject(sqlca)
dw_3.object.qa.TabSequence       = 0
dw_3.object.use_flag.TabSequence = 0

sle_code.visible = false
sle_code.enabled = false
sle_name.visible = false
sle_name.enabled = false

dw_2.visible = false

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

// M2코드 제외
cbx_m2.checked = true
cbx_m2.triggerevent( clicked! )

//
pb_retrieve.PostEvent( clicked! )

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 78

dw_3.width  = (gb_2.width - pb_insert.width) / 2
dw_3.height = newheight - dw_3.y - gb_2.x

pb_insert.x      = dw_3.x + dw_3.width
pb_insert.height = dw_3.height / 2

pb_delete.x      = dw_3.x + dw_3.width
pb_delete.y      = pb_insert.y + pb_insert.height
pb_delete.height = dw_3.height / 2

dw_1.x      = pb_insert.x + pb_insert.width
dw_1.width  = dw_3.width
dw_1.height = newheight - dw_1.y - gb_2.x

st_jaego.x = dw_1.x + 50
cbx_m2.x   = dw_1.x + 50

end event

type pb_save from w_inheritance`pb_save within w_cdjaego_m
integer x = 2135
integer y = 64
integer taborder = 60
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

WF_Update1( dw_1, "Y" )

end event

type dw_1 from w_inheritance`dw_1 within w_cdjaego_m
event mousemove pbm_mousemove
integer x = 2272
integer y = 472
integer width = 2075
integer height = 1992
integer taborder = 80
string dataobject = "d_cditemjaego_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::getfocus;call super::getfocus;//
this.Object.DataWindow.Color = GL_DW_BackColor

end event

event dw_1::losefocus;call super::losefocus;//
this.Object.DataWindow.Color = GL_DW_BackColorInit

end event

type st_title from w_inheritance`st_title within w_cdjaego_m
integer x = 32
integer y = 24
integer width = 1006
integer height = 136
string text = "재고물품 관리"
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
integer x = 2331
integer y = 64
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
integer x = 1906
integer y = 1504
integer width = 352
integer height = 960
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
integer x = 1906
integer y = 472
integer width = 352
integer height = 1024
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

event pb_insert::clicked;//
string ls_itemno, ls_qa, ls_itemname
long   ll_row, ll_newrow, ll_find

debugbreak()

setpointer(hourglass!)
ls_itemno   = sle_code.text
ls_itemname = sle_name.text

for ll_row = 1 to dw_3.rowcount()
	if dw_3.IsSelected(ll_row) = true then		
		ls_qa     = dw_3.getitemstring(ll_row, 'qa')
		
		ll_find = dw_1.find("item_no = '" + ls_itemno + "'" + " and qa = '" + ls_qa + "'", 1, dw_1.rowcount())		
		if ll_find = 0 then
			ll_newrow = dw_1.insertrow(0)
			dw_1.setitem(ll_newrow, 'area_no', dw_area.object.area[1])
			dw_1.setitem(ll_newrow, 'item_no', ls_itemno)
			dw_1.setitem(ll_newrow, 'qa', ls_qa)
			dw_1.setitem(ll_newrow, 'groupitem_item_name', ls_itemname)
		else 
			MessageBox('알림', string(ll_row) + '번째는 이미 재고물품에 등록이 되어있습니다.')
			CONTINUE
		end if
	end if	
next 

dw_3.SelectRow(0, false)
setpointer(arrow!)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdjaego_m
integer x = 1742
integer y = 64
integer taborder = 180
end type

event pb_retrieve::clicked;//
string ls_area

dw_area.accepttext()
ls_area   = dw_area.object.area[1]   

dw_3.reset()
dw_1.retrieve( ls_area )


end event

type gb_3 from w_inheritance`gb_3 within w_cdjaego_m
integer x = 1088
integer y = 12
integer width = 585
integer height = 220
integer taborder = 110
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdjaego_m
integer y = 252
integer width = 4315
integer height = 208
integer taborder = 120
integer textsize = -10
integer weight = 400
long textcolor = 0
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_cdjaego_m
integer x = 1701
integer width = 859
integer height = 220
integer taborder = 70
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdjaego_m
integer x = 59
integer y = 176
integer width = 101
integer height = 76
integer taborder = 100
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;//
datawindowchild ldwc_loc
string ls_position, ls_itemname, ls_item

this.accepttext()

choose case dwo.name
	case 'item_no'
		if isnull(data) or data = "" then
		else
        ls_item = trim(data)
		  cbx_1.checked = false		// 전체선택
		  dw_3.retrieve(ls_item)
		  dw_3.setfilter('use_flag <> "C"')
		  dw_3.filter()
		  
		  SELECT item_name INTO :ls_itemname FROM groupitem WHERE item_no = :ls_item;
        this.object.item_name[1] = ls_itemname 
		end if
		
	case else
end choose
end event

type dw_3 from datawindow within w_cdjaego_m
integer x = 32
integer y = 472
integer width = 1861
integer height = 1992
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_cdqa_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if row < 1 then return
this.SelectRow(row, not this.isselected(row))

end event

event getfocus;//
this.Object.DataWindow.Color = GL_DW_BackColor


end event

event losefocus;//
this.Object.DataWindow.Color = GL_DW_BackColorInit

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

type dw_area from datawindow within w_cdjaego_m
integer x = 1120
integer y = 136
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
integer y = 340
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;// 전체선택
if cbx_1.checked = true then
	dw_3.SelectRow(0, true)
else
	dw_3.SelectRow(0, false)
end if
end event

type pb_ins from picturebutton within w_cdjaego_m
integer x = 1938
integer y = 64
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// 물품선택
gs_where2 lstr_where
string ls_itemno, ls_itemnm
long   ll_row

lstr_where.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lstr_where )
lstr_where = Message.PowerObjectParm

if lstr_where.chk = "Y" then
	ls_itemno  = lstr_where.str1[1]
	ls_itemnm  = lstr_where.name[1]
	
	sle_code.text  = ls_itemno
	sle_name.text  = ls_itemnm
	
	cbx_1.checked = false		// 전체선택
	dw_3.retrieve( ls_itemno )
	dw_3.setfilter('use_flag <> "C"')
	dw_3.filter()
end if

end event

type cbx_m2 from checkbox within w_cdjaego_m
integer x = 2917
integer y = 340
integer width = 690
integer height = 64
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "M2 코드 제외"
end type

event clicked;// M2 코드 제외
if this.checked = true then
	dw_1.setfilter( "left(item_no,2) <> 'M2'" )
	dw_1.filter()

	dw_1.setsort( "groupitem_item_name, qa" )
	dw_1.sort()
else
	dw_1.setfilter( "" )
	dw_1.filter()	

	dw_1.setsort( "groupitem_item_name, qa" )
	dw_1.sort()
end if

end event

type st_1 from statictext within w_cdjaego_m
integer x = 1120
integer y = 52
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_code from singlelineedit within w_cdjaego_m
integer x = 201
integer y = 176
integer width = 379
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type sle_name from singlelineedit within w_cdjaego_m
integer x = 603
integer y = 176
integer width = 370
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type st_5 from statictext within w_cdjaego_m
integer x = 462
integer y = 344
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

type ddlb_fld from dropdownlistbox within w_cdjaego_m
integer x = 649
integer y = 328
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_cdjaego_m
integer x = 718
integer y = 344
integer width = 329
integer height = 88
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

type st_6 from statictext within w_cdjaego_m
integer x = 1166
integer y = 344
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

type sle_value from singlelineedit within w_cdjaego_m
integer x = 1655
integer y = 332
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cdjaego_m
integer x = 2235
integer y = 332
integer width = 160
integer height = 76
integer taborder = 100
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
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Filter( arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_cdjaego_m
integer x = 2400
integer y = 332
integer width = 160
integer height = 76
integer taborder = 110
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
GF_DW2UnFilter( arg_dw )

if cbx_m2.checked = true then
	cbx_m2.triggerevent( clicked! )
end if

end event

type cb_3 from commandbutton within w_cdjaego_m
integer x = 2565
integer y = 332
integer width = 160
integer height = 76
integer taborder = 120
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

type cb_5 from commandbutton within w_cdjaego_m
integer x = 2729
integer y = 332
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_jaego from statictext within w_cdjaego_m
integer x = 2912
integer y = 244
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "재고물품 목록"
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_cdjaego_m
integer x = 1339
integer y = 328
integer width = 306
integer height = 500
integer taborder = 70
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

