$PBExportHeader$w_cdroutb_m.srw
$PBExportComments$절곡공정관리
forward
global type w_cdroutb_m from w_inheritance
end type
type dw_3 from datawindow within w_cdroutb_m
end type
type dw_4 from datawindow within w_cdroutb_m
end type
type gb_15 from groupbox within w_cdroutb_m
end type
type dw_area from datawindow within w_cdroutb_m
end type
type cbx_1 from checkbox within w_cdroutb_m
end type
type pb_1 from picturebutton within w_cdroutb_m
end type
type st_1 from statictext within w_cdroutb_m
end type
type sle_code from singlelineedit within w_cdroutb_m
end type
type sle_name from singlelineedit within w_cdroutb_m
end type
type st_2 from statictext within w_cdroutb_m
end type
type st_3 from statictext within w_cdroutb_m
end type
type st_5 from statictext within w_cdroutb_m
end type
type ddlb_fld from dropdownlistbox within w_cdroutb_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdroutb_m
end type
type st_6 from statictext within w_cdroutb_m
end type
type sle_value from singlelineedit within w_cdroutb_m
end type
type cb_1 from commandbutton within w_cdroutb_m
end type
type cb_2 from commandbutton within w_cdroutb_m
end type
type cb_3 from commandbutton within w_cdroutb_m
end type
type cb_5 from commandbutton within w_cdroutb_m
end type
type cbx_2 from checkbox within w_cdroutb_m
end type
type cbx_3 from checkbox within w_cdroutb_m
end type
type cbx_4 from checkbox within w_cdroutb_m
end type
type cbx_rout from checkbox within w_cdroutb_m
end type
type st_vertical from u_splitbar_vertical within w_cdroutb_m
end type
type ddlb_op from dropdownlistbox within w_cdroutb_m
end type
end forward

global type w_cdroutb_m from w_inheritance
integer width = 4434
integer height = 2608
string title = "절곡공정 관리(w_cdroutb_m)"
dw_3 dw_3
dw_4 dw_4
gb_15 gb_15
dw_area dw_area
cbx_1 cbx_1
pb_1 pb_1
st_1 st_1
sle_code sle_code
sle_name sle_name
st_2 st_2
st_3 st_3
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_rout cbx_rout
st_vertical st_vertical
ddlb_op ddlb_op
end type
global w_cdroutb_m w_cdroutb_m

type variables
//
string is_dw

end variables

on w_cdroutb_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.gb_15=create gb_15
this.dw_area=create dw_area
this.cbx_1=create cbx_1
this.pb_1=create pb_1
this.st_1=create st_1
this.sle_code=create sle_code
this.sle_name=create sle_name
this.st_2=create st_2
this.st_3=create st_3
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_rout=create cbx_rout
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.gb_15
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_code
this.Control[iCurrent+9]=this.sle_name
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.cbx_2
this.Control[iCurrent+22]=this.cbx_3
this.Control[iCurrent+23]=this.cbx_4
this.Control[iCurrent+24]=this.cbx_rout
this.Control[iCurrent+25]=this.st_vertical
this.Control[iCurrent+26]=this.ddlb_op
end on

on w_cdroutb_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.gb_15)
destroy(this.dw_area)
destroy(this.cbx_1)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.sle_code)
destroy(this.sle_name)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_rout)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if


// ITEM
dw_3.visible = false
dw_3.settransobject(sqlca)

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//
pb_retrieve.PostEvent( clicked! )


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x

dw_3.x = dw_2.x ; dw_3.y = dw_2.y
dw_3.width = dw_2.width ; dw_3.height = dw_2.height

end event

type pb_save from w_inheritance`pb_save within w_cdroutb_m
integer x = 3822
integer y = 64
integer taborder = 60
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

if GF_Permission("절곡반_공정관리", gs_userid) = 'Y' then
else
	MessageBox("확인","")
	RETURN
end if

wf_update2(dw_1, dw_2, "Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdroutb_m
event mousemove pbm_mousemove
integer x = 32
integer y = 444
integer width = 2469
integer height = 2036
integer taborder = 80
string dataobject = "d_routb_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull( row ) OR row < 1 then RETURN

ScrollToRow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_rout
long   ll_row, ll_find

if cbx_rout.checked = true then
	if dwo.name = "rout_no2" then
		ls_rout = this.object.rout_no2[row]
	else
		ls_rout = this.object.rout_no1[row]
	end if
	ll_find = dw_2.find( "rout_no = '"+ls_rout+"'", 1, dw_2.rowcount() )
	if ll_find > 0 then dw_2.scrolltorow( ll_find )
end if

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
if isnull( currentrow ) OR currentrow < 1 then RETURN

ScrollToRow( currentrow )

This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)

end event

type st_title from w_inheritance`st_title within w_cdroutb_m
integer x = 32
integer y = 24
integer width = 1088
integer height = 136
string text = "절곡반 공정관리"
end type

type st_tips from w_inheritance`st_tips within w_cdroutb_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdroutb_m
boolean visible = false
integer x = 965
integer y = 1008
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdroutb_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdroutb_m
integer x = 4014
integer y = 64
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdroutb_m
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 150
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdroutb_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_cdroutb_m
integer x = 3630
integer y = 64
integer taborder = 170
integer textsize = -12
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;//
if is_dw = "dw_1" then	
	dw_1.deleterow(dw_1.getrow())
else
	dw_2.deleterow(dw_2.getrow())
end if

end event

type pb_insert from w_inheritance`pb_insert within w_cdroutb_m
integer x = 3438
integer y = 64
integer taborder = 190
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;// 등록
long   ll_row, ll_newrow, ll_find
string ls_itemno, ls_itemname, ls_qa

setpointer(hourglass!)

ls_itemno   = sle_code.text
ls_itemname = sle_name.text
ls_qa       = ""

if is_dw = "dw_1" then	
	dw_3.setredraw(false)
	dw_3.retrieve( ls_itemno )
	dw_3.setredraw(true)
	
	for ll_row = 1 to dw_1.rowcount()
		if dw_3.isselected(ll_row) = true then		
			ll_find = dw_1.find("item_no = '" + ls_itemno + "'" + " and qa = '" + ls_qa + "'", 1, dw_1.rowcount())
			
			if ll_find = 0 then
				ll_newrow = dw_1.insertrow(0)
				dw_1.setitem(ll_newrow, "item_no",   ls_itemno)
				dw_1.setitem(ll_newrow, "item_name", ls_itemname)
				dw_1.setitem(ll_newrow, "qa", ls_qa)
			else 
				MessageBox('알림', string(ll_row) + '번째는 이미 등록되어 있습니다.')
				CONTINUE
			end if
		end if	
	next 
	
	dw_1.SelectRow(0, false)
else
	ll_row = dw_2.insertrow(0)
	dw_2.scrolltorow( ll_row )
end if

setpointer(arrow!)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdroutb_m
integer x = 3241
integer y = 64
integer taborder = 180
end type

event pb_retrieve::clicked;//
dw_1.retrieve()
dw_2.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdroutb_m
integer x = 1175
integer y = 12
integer width = 1413
integer height = 220
integer taborder = 110
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdroutb_m
integer x = 37
integer y = 252
integer width = 4320
integer height = 172
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_cdroutb_m
integer x = 3205
integer width = 1029
integer height = 220
integer taborder = 70
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdroutb_m
integer x = 2574
integer y = 444
integer width = 1783
integer height = 2036
integer taborder = 100
string dataobject = "d_routbdet_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if isnull( row ) OR row < 1 then RETURN

ScrollToRow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_2::rowfocuschanged;call super::rowfocuschanged;//
if isnull( currentrow ) OR currentrow < 1 then RETURN

ScrollToRow( currentrow )

This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)

end event

type dw_3 from datawindow within w_cdroutb_m
string tag = "d_routbdet_list"
integer x = 46
integer y = 180
integer width = 110
integer height = 80
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

type dw_4 from datawindow within w_cdroutb_m
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

type gb_15 from groupbox within w_cdroutb_m
integer x = 2601
integer y = 12
integer width = 585
integer height = 220
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_area from datawindow within w_cdroutb_m
integer x = 2633
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

type cbx_1 from checkbox within w_cdroutb_m
integer x = 73
integer y = 324
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
string ls_chk
long   ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

dw_1.setredraw( false )
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next
dw_1.setredraw( true )

end event

type pb_1 from picturebutton within w_cdroutb_m
integer x = 1202
integer y = 64
integer width = 384
integer height = 144
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

event clicked;// 물품선택
gs_where2 lstr_where
string ls_itemno, ls_itemnm
long   ll_row

dw_2.accepttext()

lstr_where.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lstr_where )
lstr_where = Message.PowerObjectParm
if lstr_where.chk = "Y" then
	ls_itemno  = lstr_where.str1[1]
	ls_itemnm  = lstr_where.name[1]
	
	sle_code.text  = ls_itemno
	sle_name.text  = ls_itemnm

	dw_3.visible   = true
	
	dw_3.setredraw( false )
	dw_3.retrieve( ls_itemno )
	dw_3.setfilter('use_flag <> "C"')
	dw_3.filter()
	dw_3.setredraw( true )
end if

end event

type st_1 from statictext within w_cdroutb_m
integer x = 2633
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

type sle_code from singlelineedit within w_cdroutb_m
integer x = 1605
integer y = 136
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
borderstyle borderstyle = stylelowered!
end type

type sle_name from singlelineedit within w_cdroutb_m
integer x = 1993
integer y = 136
integer width = 558
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
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_cdroutb_m
integer x = 1605
integer y = 52
integer width = 379
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "물품코드"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cdroutb_m
integer x = 1993
integer y = 52
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "물품명"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_cdroutb_m
integer x = 462
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_cdroutb_m
integer x = 649
integer y = 312
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

type ddlb_dwtitles from dropdownlistbox within w_cdroutb_m
integer x = 718
integer y = 328
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

type st_6 from statictext within w_cdroutb_m
integer x = 1166
integer y = 328
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

type sle_value from singlelineedit within w_cdroutb_m
integer x = 1655
integer y = 316
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

type cb_1 from commandbutton within w_cdroutb_m
integer x = 2235
integer y = 316
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Filter( arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_cdroutb_m
integer x = 2400
integer y = 316
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdroutb_m
integer x = 2565
integer y = 316
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdroutb_m
integer x = 2729
integer y = 316
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_2 from checkbox within w_cdroutb_m
integer x = 2917
integer y = 324
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "표준"
end type

event clicked;// 표준적용
string ls_qastd, ls_chk
long   ll_row, ll_cnt

if dw_1.rowcount() < 1 then RETURN

if this.checked = true then
	ls_qastd = "Y"
else
	ls_qastd = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	ls_chk   = dw_1.object.chk[ll_row]
	
	if ls_chk = "Y" then
		ll_cnt = ll_cnt + 1
		dw_1.object.qa_standard[ll_row] = ls_qastd
	end if
next

end event

type cbx_3 from checkbox within w_cdroutb_m
integer x = 3177
integer y = 324
integer width = 283
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "공정A"
end type

event clicked;// 공정1 적용
string ls_routno, ls_chk
long   ll_row, ll_cnt

if dw_1.rowcount() < 1 then RETURN

ll_row = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

if this.checked = true then
	ls_routno = dw_2.object.rout_no[ll_row]
else
	ls_routno = ""
end if

if isnull(ls_routno) then RETURN

for ll_row = 1 to dw_1.rowcount()
	ls_chk = dw_1.object.chk[ll_row]
	
	if ls_chk = "Y" then
		ll_cnt = ll_cnt + 1
		dw_1.object.rout_no1[ll_row] = ls_routno
	end if
next

end event

type cbx_4 from checkbox within w_cdroutb_m
integer x = 3479
integer y = 324
integer width = 283
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "공정B"
end type

event clicked;// 공정2 적용
string ls_routno, ls_chk
long   ll_row, ll_cnt

if dw_1.rowcount() < 1 then RETURN

ll_row = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

if this.checked = true then
	ls_routno = dw_2.object.rout_no[ll_row]
else
	ls_routno = ""
end if

if isnull(ls_routno) then RETURN

for ll_row = 1 to dw_1.rowcount()
	ls_chk = dw_1.object.chk[ll_row]
	
	if ls_chk = "Y" then
		ll_cnt = ll_cnt + 1
		dw_1.object.rout_no2[ll_row] = ls_routno
	end if
next

end event

type cbx_rout from checkbox within w_cdroutb_m
integer x = 3982
integer y = 324
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "공정찾기"
end type

type st_vertical from u_splitbar_vertical within w_cdroutb_m
integer x = 2519
integer y = 444
integer height = 2036
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cdroutb_m
integer x = 1339
integer y = 308
integer width = 306
integer height = 500
integer taborder = 80
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

