$PBExportHeader$w_cdscene_grp.srw
$PBExportComments$프로젝트 관리
forward
global type w_cdscene_grp from w_inheritance
end type
type pb_excel from picturebutton within w_cdscene_grp
end type
type st_8 from statictext within w_cdscene_grp
end type
type ddlb_fld from dropdownlistbox within w_cdscene_grp
end type
type ddlb_dwtitles from dropdownlistbox within w_cdscene_grp
end type
type st_9 from statictext within w_cdscene_grp
end type
type sle_value from singlelineedit within w_cdscene_grp
end type
type cb_filteron from commandbutton within w_cdscene_grp
end type
type cb_filteroff from commandbutton within w_cdscene_grp
end type
type cb_1 from commandbutton within w_cdscene_grp
end type
type cb_2 from commandbutton within w_cdscene_grp
end type
type dw_3 from datawindow within w_cdscene_grp
end type
type st_vertical from u_splitbar_vertical within w_cdscene_grp
end type
type st_horizontal from u_splitbar_horizontal within w_cdscene_grp
end type
type dw_4 from datawindow within w_cdscene_grp
end type
type dw_5 from datawindow within w_cdscene_grp
end type
type cb_3 from commandbutton within w_cdscene_grp
end type
type ddlb_op from dropdownlistbox within w_cdscene_grp
end type
end forward

global type w_cdscene_grp from w_inheritance
integer width = 4215
integer height = 2364
string title = "거래처 현장관리(w_cdscene_grp)"
pb_excel pb_excel
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
dw_3 dw_3
st_vertical st_vertical
st_horizontal st_horizontal
dw_4 dw_4
dw_5 dw_5
cb_3 cb_3
ddlb_op ddlb_op
end type
global w_cdscene_grp w_cdscene_grp

type variables
//
st_print i_print
string   is_dw

datawindowchild idwc_cust, idwc_cust_name, idwc_codemst

end variables

forward prototypes
public function string wf_nextcode (string as_str)
end prototypes

public function string wf_nextcode (string as_str);string ls_str
CHOOSE CASE as_str
	CASE 'A'
		ls_str = 'B'
	CASE 'B'
		ls_str = 'C'
	CASE 'C'
		ls_str = 'D'
	CASE 'D'
		ls_str = 'E'
	CASE 'E'
		ls_str = 'F'
	CASE 'F'
		ls_str = 'G'
	CASE 'G'
		ls_str = 'H'
	CASE 'H'
		ls_str = 'I'
	CASE 'I'
		ls_str = 'J'
	CASE 'J'
		ls_str = 'K'
	CASE 'K'
		ls_str = 'L'
	CASE 'L'
		ls_str = 'M'
	CASE 'M'
		ls_str = 'N'
	CASE 'N'
		ls_str = 'O'
	CASE 'O'
		ls_str = 'P'
	CASE 'P'
		ls_str = 'Q'
	CASE 'Q'
		ls_str = 'R'
	CASE 'R'
		ls_str = 'S'
	CASE 'S'
		ls_str = 'T'
	CASE 'T'
		ls_str = 'U'
	CASE 'U'
		ls_str = 'V'
	CASE 'V'
		ls_str = 'W'
	CASE 'W'
		ls_str = 'X'
	CASE 'X'
		ls_str = 'Y'
	CASE 'Y'
		ls_str = 'Z'
END CHOOSE

return ls_str
end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//
st_horizontal.of_set_topobject( dw_1 )
st_horizontal.of_set_topobject( dw_2 )

st_horizontal.of_set_bottomobject( dw_4 )
st_horizontal.of_set_bottomobject( dw_3 )
st_horizontal.of_set_minsize(250, 250)
//
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_leftobject( dw_4 )

st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_rightobject( dw_3 )
st_vertical.of_set_minsize(250, 250)

//
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
dw_3.settransobject( SQLCA )
dw_4.settransobject( SQLCA )
dw_5.settransobject( SQLCA )

dw_5.visible  = false
cb_3.enabled  = false

end event

on w_cdscene_grp.create
int iCurrent
call super::create
this.pb_excel=create pb_excel
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_3=create dw_3
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.dw_4=create dw_4
this.dw_5=create dw_5
this.cb_3=create cb_3
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_excel
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_9
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_filteron
this.Control[iCurrent+8]=this.cb_filteroff
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.st_horizontal
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.dw_5
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.ddlb_op
end on

on w_cdscene_grp.destroy
call super::destroy
destroy(this.pb_excel)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_3)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.cb_3)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
long  ll_width, ll_height

ll_width    = newwidth  - (gb_3.x * 2)
ll_height   = newheight - dw_1.y - gb_3.x

gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.height = ll_height * 0.5

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = ll_height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = dw_1.height

st_horizontal.y     = dw_2.y + dw_2.height
st_horizontal.width = ll_width

dw_4.y      = st_horizontal.y + st_horizontal.height 
dw_4.height = newheight - dw_4.y - gb_3.x

dw_3.x      = st_vertical.x + st_vertical.width
dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = dw_2.width
dw_3.height = dw_4.height

//
dw_5.width  = ll_width  * 0.7
dw_5.height = ll_height * 0.6
dw_5.x      = (newwidth  - dw_5.width)  / 2
dw_5.y      = (newheight - dw_5.height) / 2

end event

type pb_save from w_inheritance`pb_save within w_cdscene_grp
integer x = 2121
integer y = 56
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;//

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
if is_dw = "dw_1" then
	WF_Update1(dw_1,"Y") 
	dw_1.retrieve()
else
	WF_Update1(dw_2,"Y") 
end if


end event

type dw_1 from w_inheritance`dw_1 within w_cdscene_grp
integer x = 32
integer y = 432
integer width = 1929
integer height = 900
integer taborder = 50
string dataobject = "d_cdscene_grp"
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string ls_project

ls_project = dw_1.object.project[currentrow]
if isnull(ls_project) OR ls_project = "" then RETURN

dw_2.retrieve( ls_project )

end event

event dw_1::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_project

if this.rowcount() = 1 then	
	ls_project = dw_1.object.project[row]
	if isnull(ls_project) OR ls_project = "" then RETURN
	
	dw_2.retrieve( ls_project )
end if

end event

type st_title from w_inheritance`st_title within w_cdscene_grp
integer x = 32
integer y = 24
integer width = 1042
integer height = 140
string text = "프로젝트 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdscene_grp
end type

type pb_compute from w_inheritance`pb_compute within w_cdscene_grp
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdscene_grp
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdscene_grp
integer x = 2313
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdscene_grp
integer x = 1737
integer y = 56
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdscene_grp
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdscene_grp
integer x = 1545
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;//
if dw_2.rowcount() < 1 then RETURN	

dw_2.accepttext()

if MessageBox("확인",'삭제 하시겠습니까?',information!, OKCancel!, 2) = 1 then
	dw_2.deleterow(dw_2.getrow())
	wf_update1(dw_2, "Y")
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdscene_grp
integer x = 1353
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;//
string ls_project, ls_projectname, ls_custno, ls_custname, ls_scenecode, ls_scenedesc
long   ll_row, ll_find

if is_dw = "dw_1" then
	ll_row = dw_1.insertrow(0)
	
	if ll_row = 1 then
		ls_project = "100000"
	else
		ls_project = dw_1.getitemstring(ll_row - 1, "project")
	end if

	ls_project = string(long(ls_project) + 1)
	dw_1.setitem(ll_row, "project", ls_project)
	dw_1.setitem(ll_row, "project_yn", "Y")
	
	dw_1.object.project_name.TabSequence = 10
else	
	if dw_1.getrow()   < 1 then RETURN
	if dw_4.getrow()   < 1 then RETURN
	if dw_3.getrow()   < 1 then RETURN
	if dw_3.rowcount() < 1 then RETURN
	
	ls_project     = dw_1.object.project[dw_1.getrow()]
	ls_projectname = dw_1.object.project_name[dw_1.getrow()]
	
	ls_custno      = dw_4.object.cust_no[dw_4.getrow()]
	ls_custname    = dw_4.object.cust_name[dw_4.getrow()]
	
	ls_scenecode   = dw_3.object.scene_code[dw_3.getrow()]
	ls_scenedesc   = dw_3.object.scene_desc[dw_3.getrow()]
	
	ll_find  = dw_2.find( "scene_code = '" + ls_scenecode + "'", 1, dw_2.rowcount() )
	if ll_find > 0 then
		dw_2.scrolltorow( ll_find )
		MessageBox("확인", ls_scenedesc + "~n~n중복된 현장입니다.")
		RETURN
	end if
	
	//
	ll_row  = dw_2.insertrow(0)
	dw_2.scrolltorow( ll_row )
	
	dw_2.object.project[ll_row]      = ls_project
	dw_2.object.scene_code[ll_row]   = ls_scenecode
	dw_2.object.scene_desc[ll_row]   = ls_scenedesc
	dw_2.object.cust_no[ll_row]      = ls_custno
	dw_2.object.cust_name[ll_row]    = ls_custname
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdscene_grp
integer x = 1161
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;//
cb_3.enabled  = true

dw_1.retrieve()
dw_4.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdscene_grp
integer x = 32
integer y = 240
integer width = 4105
integer height = 180
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdscene_grp
boolean visible = false
integer x = 1115
integer y = 8
integer width = 155
integer height = 204
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdscene_grp
integer x = 1129
integer y = 8
integer width = 1399
integer height = 216
integer taborder = 40
integer weight = 400
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdscene_grp
integer x = 2016
integer y = 432
integer width = 2121
integer height = 900
integer taborder = 60
string dataobject = "d_cdscene_grp_m"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type pb_excel from picturebutton within w_cdscene_grp
integer x = 1929
integer y = 56
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
datawindow arg_dw

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

ll_cnt = arg_dw.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		end if
	end if
else
	MessageBox("확인","거래처현장 데이터가 존재하지 않습니다.")
end if	

end event

type st_8 from statictext within w_cdscene_grp
integer x = 128
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_cdscene_grp
integer x = 311
integer y = 304
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_cdscene_grp
integer x = 370
integer y = 312
integer width = 306
integer height = 92
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

type st_9 from statictext within w_cdscene_grp
integer x = 827
integer y = 324
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

type sle_value from singlelineedit within w_cdscene_grp
integer x = 1275
integer y = 308
integer width = 581
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdscene_grp
integer x = 1870
integer y = 304
integer width = 197
integer height = 84
integer taborder = 120
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdscene_grp
integer x = 2071
integer y = 304
integer width = 197
integer height = 84
integer taborder = 130
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2UnFilter( arg_dw )

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

end event

type cb_1 from commandbutton within w_cdscene_grp
integer x = 2272
integer y = 304
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
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
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )


end event

type cb_2 from commandbutton within w_cdscene_grp
integer x = 2459
integer y = 304
integer width = 183
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
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
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_cdscene_grp
integer x = 2016
integer y = 1384
integer width = 2121
integer height = 836
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdscene_grp_listscene"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event doubleclicked;//
string ls_project, ls_projectname, ls_custno, ls_custname, ls_scenecode, ls_scenedesc
long   ll_row, ll_find

if this.rowcount() < 1 then RETURN
if dw_1.getrow()   < 1 then RETURN
if dw_4.getrow()   < 1 then RETURN
if this.getrow()   < 1 then RETURN

ls_project     = dw_1.object.project[dw_1.getrow()]
ls_projectname = dw_1.object.project_name[dw_1.getrow()]

ls_custno      = dw_4.object.cust_no[dw_4.getrow()]
ls_custname    = dw_4.object.cust_name[dw_4.getrow()]

ls_scenecode   = this.object.scene_code[this.getrow()]
ls_scenedesc   = this.object.scene_desc[this.getrow()]

ll_find  = dw_2.find( "scene_code = '" + ls_scenecode + "'", 1, dw_2.rowcount() )
if ll_find > 0 then
	dw_2.scrolltorow( ll_find )
	MessageBox("확인", ls_scenedesc + "~n~n중복된 현장입니다.")
	RETURN
end if

//
ll_row  = dw_2.insertrow(0)
dw_2.scrolltorow( ll_row )

dw_2.object.project[ll_row]     = ls_project
dw_2.object.scene_code[ll_row]  = ls_scenecode
dw_2.object.scene_desc[ll_row]  = ls_scenedesc
dw_2.object.cust_no[ll_row]     = ls_custno
dw_2.object.cust_name[ll_row]   = ls_custname


end event

type st_vertical from u_splitbar_vertical within w_cdscene_grp
integer x = 1979
integer y = 432
integer height = 1792
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_cdscene_grp
integer x = 32
integer y = 1344
integer width = 4110
boolean bringtotop = true
end type

type dw_4 from datawindow within w_cdscene_grp
integer x = 32
integer y = 1384
integer width = 1929
integer height = 836
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdscene_grp_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
string ls_custno, ls_scenedesc

ls_scenedesc = "1"
ls_custno    = this.object.cust_no[currentrow]
if isnull(ls_custno) OR ls_custno = "" then RETURN

dw_3.retrieve( ls_custno, ls_scenedesc )

end event

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_custno, ls_scenedesc

ls_scenedesc = "1"

if this.rowcount() = 1 then	
	ls_custno = this.object.cust_no[row]
	if isnull(ls_custno) OR ls_custno = "" then RETURN
	
	dw_3.retrieve( ls_custno, ls_scenedesc )
end if

end event

type dw_5 from datawindow within w_cdscene_grp
integer x = 361
integer y = 1492
integer width = 3419
integer height = 484
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "현장목록 검색"
string dataobject = "d_cdscene_grp_listscene"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
string ls_project, ls_projectname, ls_custno, ls_custname, ls_scenecode, ls_scenedesc
long   ll_row, ll_find

if this.rowcount() < 1 then RETURN
if dw_1.getrow()   < 1 then RETURN
if dw_4.getrow()   < 1 then RETURN
if this.getrow()   < 1 then RETURN

ls_project     = dw_1.object.project[dw_1.getrow()]
ls_projectname = dw_1.object.project_name[dw_1.getrow()]

ls_custno      = dw_4.object.cust_no[dw_4.getrow()]
ls_custname    = dw_4.object.cust_name[dw_4.getrow()]

ls_scenecode   = this.object.scene_code[this.getrow()]
ls_scenedesc   = this.object.scene_desc[this.getrow()]

ll_find  = dw_2.find( "scene_code = '" + ls_scenecode + "'", 1, dw_2.rowcount() )
if ll_find > 0 then
	dw_2.scrolltorow( ll_find )
	MessageBox("확인", ls_scenedesc + "~n~n중복된 현장입니다.")
	RETURN
end if

//
ll_row  = dw_2.insertrow(0)
dw_2.scrolltorow( ll_row )

dw_2.object.project[ll_row]     = ls_project
dw_2.object.scene_code[ll_row]  = ls_scenecode
dw_2.object.scene_desc[ll_row]  = ls_scenedesc
dw_2.object.cust_no[ll_row]     = ls_custno
dw_2.object.cust_name[ll_row]   = ls_custname


end event

type cb_3 from commandbutton within w_cdscene_grp
integer x = 2665
integer y = 284
integer width = 649
integer height = 112
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "현장목록 검색"
end type

event clicked;//
string  ls_custno, ls_scenedesc

dw_5.visible = true

ls_custno    = "1"
ls_scenedesc = "%" + trim(sle_value.text) + "%"
if ls_scenedesc = "%%" then ls_scenedesc = "%"

dw_5.retrieve( ls_custno, ls_scenedesc )
if dw_5.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
else
	dw_5.setsort( "scene_desc A, cust_name A" )
	dw_5.sort()
end if

end event

type ddlb_op from dropdownlistbox within w_cdscene_grp
integer x = 1001
integer y = 304
integer width = 265
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

