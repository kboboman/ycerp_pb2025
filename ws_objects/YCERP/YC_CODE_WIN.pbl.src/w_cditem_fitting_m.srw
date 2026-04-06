$PBExportHeader$w_cditem_fitting_m.srw
$PBExportComments$품목별 부속품 저장소관리(2008/02/28,정갑용)
forward
global type w_cditem_fitting_m from w_inheritance
end type
type st_2 from statictext within w_cditem_fitting_m
end type
type dw_area from datawindow within w_cditem_fitting_m
end type
type st_1 from statictext within w_cditem_fitting_m
end type
type st_3 from statictext within w_cditem_fitting_m
end type
type st_4 from statictext within w_cditem_fitting_m
end type
type ddlb_fld from dropdownlistbox within w_cditem_fitting_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditem_fitting_m
end type
type st_5 from statictext within w_cditem_fitting_m
end type
type sle_value from singlelineedit within w_cditem_fitting_m
end type
type cb_1 from commandbutton within w_cditem_fitting_m
end type
type cb_2 from commandbutton within w_cditem_fitting_m
end type
type cb_4 from commandbutton within w_cditem_fitting_m
end type
type cb_5 from commandbutton within w_cditem_fitting_m
end type
type st_vertical from u_splitbar_vertical within w_cditem_fitting_m
end type
type ddlb_op from dropdownlistbox within w_cditem_fitting_m
end type
end forward

global type w_cditem_fitting_m from w_inheritance
integer width = 4174
integer height = 2180
string title = "부속품 저장소 관리(w_cditem_fitting_m)"
st_2 st_2
dw_area dw_area
st_1 st_1
st_3 st_3
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
st_vertical st_vertical
ddlb_op ddlb_op
end type
global w_cditem_fitting_m w_cditem_fitting_m

type variables
st_print i_print
string   is_dw, is_where
datawindowchild idwc_item, idwc_qa, idwc_area, idwc_area2
end variables

on w_cditem_fitting_m.create
int iCurrent
call super::create
this.st_2=create st_2
this.dw_area=create dw_area
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.dw_area
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.st_vertical
this.Control[iCurrent+15]=this.ddlb_op
end on

on w_cditem_fitting_m.destroy
call super::destroy
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//dw_area.getchild("area", idwc_area)
//idwc_area.setredraw(false)
//idwc_area.settransobject(sqlca)
//idwc_area.insertrow(1)
//idwc_area.setitem(1, 'area_no', '%')
//idwc_area.setitem(1, 'area_name', '전체사업장')
//
//idwc_area.accepttext()
//idwc_area.setredraw(false)


dw_1.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)


dw_1.getchild("area_no", idwc_area2)
idwc_area2.setredraw(false)
idwc_area2.settransobject(sqlca)

//
if GF_Permission("부속품저장소_관리", gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_save.enabled   = false
end if

end event

event resize;call super::resize;//
long  ll_width

ll_width    = newwidth  - (gb_2.x * 2)

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = ll_width * 0.6
dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.y      = dw_1.y
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_cditem_fitting_m
integer x = 2912
integer y = 56
end type

event pb_save::clicked;//
dw_1.accepttext()

if wf_nullchk(dw_1) = false then	return

WF_Update1( dw_1, "Y" )

end event

type dw_1 from w_inheritance`dw_1 within w_cditem_fitting_m
integer x = 32
integer y = 432
integer width = 3328
integer height = 1612
integer taborder = 60
string dataobject = "d_cditem_fitting_m"
end type

event dw_1::itemchanged;//string ls_item_no, ls_qa,  ls_item_name, ls_data, ls_null
//long ll_row, ll_found, ll_row1
//
//this.accepttext()
//
//ll_row = this.getrow()
//ls_item_no = this.getitemstring(ll_row, "item_no")
//ls_qa = this.getitemstring(ll_row, "qa")
//setnull(ls_null)
//
//choose case dwo.name
//	
//
//	case 'item_no'
//
//		this.object.qa[ll_row] = ls_null
//		this.object.qa.tabsequence = 0
//		
//		this.getchild("item_no", idwc_item)
//		gs_ds_itemall.ShareData(idwc_item)
//		
//		ls_data = data
//  	   ll_row1 = idwc_item.RowCount( )
//		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
//		
//		if ll_found = 0 then
//			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
//			return 1
//		end if
//		select item_name into :ls_item_name from groupitem 
//		 where item_no = :ls_data;
//		if sqlca.sqlcode = 100 then 
//			return 1
//		end if
//
//		this.object.item_name[this.getrow()] = ls_item_name
//		
//		if ls_item_no <> '' then
//			this.getchild("qa", idwc_qa)
//			gs_ds_qaall.ShareData(idwc_qa)
//			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//			idwc_qa.filter()
//		
//			if idwc_qa.rowcount() > 0 then
//				this.object.qa.tabsequence = 1
////				this.object.qa.background.color = 1087434968
//				this.setcolumn("qa")
//				this.setfocus()
////			else
////				this.object.qa.tabsequence = 0
////				this.object.qa.background.color = 78682240
////				this.setcolumn("item_no")
////				this.setfocus()
//			end if
//		end if
//
//end choose
//
end event

event dw_1::itemerror;//string ls_null
//
//setnull(ls_null)
//
//CHOOSE CASE dwo.name
//	CASE 'item_no'
//		this.object.item_no[this.getrow()] = ls_null
//END CHOOSE
//
//return 2
end event

event dw_1::rowfocuschanging;//string  ls_item_no
//
//this.accepttext()
//if this.getrow() < 1 then return
//
//ls_item_no = this.object.item_no[this.getrow()]
//if ls_item_no = '' or isnull(ls_item_no) then
//	return
//else
//		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//		idwc_qa.filter()
//end if
//
end event

event dw_1::clicked;call super::clicked;//
if isnull( row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cditem_fitting_m
integer x = 0
integer y = 0
integer width = 1422
integer height = 140
string text = "부속품 저장소 관리"
end type

type st_tips from w_inheritance`st_tips within w_cditem_fitting_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditem_fitting_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditem_fitting_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditem_fitting_m
integer x = 3104
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditem_fitting_m
integer x = 2720
integer y = 56
integer taborder = 130
boolean enabled = false
end type

event pb_print::clicked;//if dw_1.rowcount() < 1 then return 
//
//
//w_repsuper w_print
//i_print.st_datawindow = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 담당자별 품목관리를 출력합니다." 
////i_print.name = 'd_irincoun_r'
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cditem_fitting_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cditem_fitting_m
integer x = 2528
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;dw_1.accepttext()
if dw_1.getrow() < 1 then return

dw_1.deleterow(dw_1.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_cditem_fitting_m
integer x = 2336
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;//
//
string ls_area, ls_def_loc, ls_saveitem
long   ll_row,  ll_cnt
gs_where2 lstr_where

dw_area.accepttext()
ls_area = dw_area.object.area[1]

if isnull(ls_area) or trim(ls_area) = '' or ls_area = '%' then
	messagebox('알림','사업장을 선택하십시오')
	return
end if

SELECT isnull(def_loc,'') INTO :ls_def_loc FROM area WHERE real_area = 'Y' AND area_no = :gs_area;
if sqlca.sqlcode <> 0 then
	messagebox('경고', '사업장 선택 오류!~n~n관리자에게 문의 바랍니다.')
	return
end if

lstr_where.chk  = 'M' //M:multi S:single
lstr_where.chk1 = ls_def_loc
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_1.setredraw( false )
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)

	if ll_row = 1 then ls_saveitem = trim(lstr_where.str1[ll_row])

   dw_1.object.area_no[ll_cnt]   = ls_area
	dw_1.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])
	dw_1.object.qa[ll_cnt]        = trim(lstr_where.str2[ll_row])
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_1.setsort('item_no, qa')
dw_1.sort()

ll_cnt = dw_1.find( "item_no = '" + ls_saveitem + "'", 1, dw_1.rowcount() )
dw_1.scrolltorow( ll_cnt )
dw_1.setredraw( true )

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditem_fitting_m
integer x = 2144
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;string ls_areano
long   ll_row

dw_area.accepttext()

ls_areano = dw_area.object.area[1]

dw_2.retrieve( ls_areano )
dw_1.retrieve( ls_areano )
if dw_1.rowcount() < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_cditem_fitting_m
integer x = 1504
integer y = 0
integer width = 599
integer height = 220
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cditem_fitting_m
integer y = 236
integer width = 4073
integer height = 176
integer taborder = 100
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cditem_fitting_m
integer x = 2112
integer y = 0
integer width = 1207
integer height = 220
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cditem_fitting_m
integer x = 3424
integer y = 432
integer width = 677
integer height = 1612
integer taborder = 80
string dataobject = "d_cditem_fitting_list"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
if isnull( row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_2 from statictext within w_cditem_fitting_m
boolean visible = false
integer x = 2016
integer y = 88
integer width = 219
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_cditem_fitting_m
integer x = 1545
integer y = 124
integer width = 530
integer height = 84
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_cditem_fitting_m
integer x = 1545
integer y = 40
integer width = 526
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

type st_3 from statictext within w_cditem_fitting_m
integer x = 37
integer y = 176
integer width = 485
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "부속품저장소_관리"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cditem_fitting_m
integer x = 96
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_cditem_fitting_m
integer x = 283
integer y = 292
integer width = 480
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_cditem_fitting_m
integer x = 325
integer y = 304
integer width = 311
integer height = 88
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

type st_5 from statictext within w_cditem_fitting_m
integer x = 782
integer y = 308
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

type sle_value from singlelineedit within w_cditem_fitting_m
integer x = 1271
integer y = 300
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cditem_fitting_m
integer x = 1842
integer y = 300
integer width = 160
integer height = 76
integer taborder = 90
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
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cditem_fitting_m
integer x = 2007
integer y = 300
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_cditem_fitting_m
integer x = 2171
integer y = 300
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cditem_fitting_m
integer x = 2336
integer y = 300
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_cditem_fitting_m
integer x = 3392
integer y = 432
integer height = 1612
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cditem_fitting_m
integer x = 955
integer y = 296
integer width = 306
integer height = 500
integer taborder = 60
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

