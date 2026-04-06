$PBExportHeader$w_cdlabel_item_m.srw
$PBExportComments$유압반 Label 품목(090205)
forward
global type w_cdlabel_item_m from w_inheritance
end type
type st_4 from statictext within w_cdlabel_item_m
end type
type ddlb_fld from dropdownlistbox within w_cdlabel_item_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdlabel_item_m
end type
type st_6 from statictext within w_cdlabel_item_m
end type
type sle_value from singlelineedit within w_cdlabel_item_m
end type
type cbx_op from checkbox within w_cdlabel_item_m
end type
type cb_4 from commandbutton within w_cdlabel_item_m
end type
type cb_6 from commandbutton within w_cdlabel_item_m
end type
type cb_7 from commandbutton within w_cdlabel_item_m
end type
type cb_8 from commandbutton within w_cdlabel_item_m
end type
type st_vertical from u_splitbar_vertical within w_cdlabel_item_m
end type
type ddlb_op from dropdownlistbox within w_cdlabel_item_m
end type
end forward

global type w_cdlabel_item_m from w_inheritance
integer width = 4270
integer height = 2168
string title = "유압반 Label 품목관리(w_cdlabel_item_m)"
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cbx_op cbx_op
cb_4 cb_4
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
st_vertical st_vertical
ddlb_op ddlb_op
end type
global w_cdlabel_item_m w_cdlabel_item_m

type variables
st_print  i_print
string    is_dw
datawindowchild idwc_codemst
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_2 )
st_vertical.of_set_rightobject( dw_1 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	long ll_Y ; string ls_value, ls_val[]
	GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_2.Modify( ls_val[3] + ".Protect=1")
	next

	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_1.Modify( ls_val[3] + ".Protect=1")
	next
end if

dw_1.getchild("box_type",idwc_codemst)
idwc_codemst.settransobject(sqlca)
idwc_codemst.retrieve("YCLINE유압반(BOXTYPE)")

dw_2.object.item_cd.width  = 150		// 코드
dw_2.object.item_nm.width  = 550		// 코드명
dw_2.object.category.width = 0		// 구분
dw_2.object.type.width     = 0		// 종류

dw_2.retrieve( "YCLINE유압반(BOXTYPE)" )
dw_1.retrieve()

end event

on w_cdlabel_item_m.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cbx_op
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_6
this.Control[iCurrent+9]=this.cb_7
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.ddlb_op
end on

on w_cdlabel_item_m.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_2.height = newheight - dw_2.y - gb_2.x

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.y - gb_2.x
dw_1.height = newheight - dw_1.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_cdlabel_item_m
integer x = 2245
integer y = 60
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//
if is_dw = "dw_1" then
	wf_update1(dw_1,"Y")
else
	wf_update1(dw_2,"Y")
	idwc_codemst.retrieve("YCLINE유압반(BOXTYPE)")
end if


end event

type dw_1 from w_inheritance`dw_1 within w_cdlabel_item_m
integer x = 1925
integer y = 432
integer width = 2267
integer height = 1604
string dataobject = "d_cdlabel_item_m"
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_title from w_inheritance`st_title within w_cdlabel_item_m
integer x = 32
integer y = 20
integer width = 1531
integer height = 140
string text = "유압반 Label 품목 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlabel_item_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdlabel_item_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlabel_item_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdlabel_item_m
integer x = 2437
integer y = 60
integer width = 183
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlabel_item_m
boolean visible = false
integer x = 1797
integer y = 72
integer taborder = 110
end type

event pb_print::clicked;//w_repsuper w_print
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//dw_3.retrieve()
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 작업장 내역을 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=120'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdlabel_item_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdlabel_item_m
integer x = 2057
integer y = 60
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;//
long  ll_row  

if is_dw = "dw_1" then
	dw_1.AcceptText()
	
	ll_row = dw_1.Getrow()	
	dw_1.deleterow(ll_row)
else
	dw_2.AcceptText()
	
	ll_row = dw_2.Getrow()	
	dw_2.deleterow(ll_row)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_cdlabel_item_m
integer x = 1865
integer y = 60
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;//
long ll_row

if is_dw = "dw_1" then
	ll_row = dw_1.insertrow(0)
	
	dw_1.ScrollToRow(ll_row)
	dw_1.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
	dw_1.setfocus()
else
	ll_row = dw_2.insertrow(0)
	
	dw_2.ScrollToRow(ll_row)
	
	dw_2.object.category[ll_row] = "DATA"
	dw_2.object.type[ll_row]     = "YCLINE유압반(BOXTYPE)"
	dw_2.object.log_dt[ll_row]   = GF_TODAY()
	dw_2.object.bigo[ll_row]     = "YCLINE유압반(BOXTYPE)"
	
	dw_2.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
	dw_2.setfocus()
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlabel_item_m
integer x = 1673
integer y = 60
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.Retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdlabel_item_m
boolean visible = false
integer x = 1545
integer y = 40
integer width = 951
integer height = 156
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_cdlabel_item_m
integer x = 27
integer width = 4169
integer height = 188
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdlabel_item_m
integer x = 1641
integer y = 16
integer width = 1010
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdlabel_item_m
integer x = 27
integer y = 432
integer width = 1847
integer height = 1604
string dataobject = "d_codemst_user_m"
boolean hscrollbar = true
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

event dw_2::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_4 from statictext within w_cdlabel_item_m
integer x = 78
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_cdlabel_item_m
integer x = 265
integer y = 288
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_cdlabel_item_m
integer x = 297
integer y = 300
integer width = 311
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

type st_6 from statictext within w_cdlabel_item_m
integer x = 736
integer y = 304
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

type sle_value from singlelineedit within w_cdlabel_item_m
integer x = 1225
integer y = 296
integer width = 539
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

type cbx_op from checkbox within w_cdlabel_item_m
integer x = 1778
integer y = 304
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_4 from commandbutton within w_cdlabel_item_m
integer x = 1984
integer y = 296
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
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_6 from commandbutton within w_cdlabel_item_m
integer x = 2149
integer y = 296
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
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_7 from commandbutton within w_cdlabel_item_m
integer x = 2313
integer y = 296
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_8 from commandbutton within w_cdlabel_item_m
integer x = 2478
integer y = 296
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_cdlabel_item_m
integer x = 1888
integer y = 432
integer height = 1604
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cdlabel_item_m
integer x = 910
integer y = 292
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

