$PBExportHeader$w_mssql_table.srw
$PBExportComments$단위관리(1998/02/03, 성삼지)
forward
global type w_mssql_table from w_inheritance
end type
type rb_3 from radiobutton within w_mssql_table
end type
type rb_2 from radiobutton within w_mssql_table
end type
type rb_1 from radiobutton within w_mssql_table
end type
type dw_3 from datawindow within w_mssql_table
end type
type cbx_dwview from checkbox within w_mssql_table
end type
type pb_excel from picturebutton within w_mssql_table
end type
type st_vertical from u_splitbar_vertical within w_mssql_table
end type
type st_6 from statictext within w_mssql_table
end type
type ddlb_fld from dropdownlistbox within w_mssql_table
end type
type ddlb_dwtitles from dropdownlistbox within w_mssql_table
end type
type st_7 from statictext within w_mssql_table
end type
type ddlb_op from dropdownlistbox within w_mssql_table
end type
type sle_value from singlelineedit within w_mssql_table
end type
type cb_2 from commandbutton within w_mssql_table
end type
type cb_3 from commandbutton within w_mssql_table
end type
type cb_4 from commandbutton within w_mssql_table
end type
type cb_5 from commandbutton within w_mssql_table
end type
type gb_4 from groupbox within w_mssql_table
end type
end forward

global type w_mssql_table from w_inheritance
integer width = 3991
integer height = 2260
string title = "MS-SQL TABLE(w_mssql_table)"
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_3 dw_3
cbx_dwview cbx_dwview
pb_excel pb_excel
st_vertical st_vertical
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
gb_4 gb_4
end type
global w_mssql_table w_mssql_table

type variables
gs_custper_str istr_select
int    ii_type, ii_sw = 0, ii_cnt = 0
long   il_find = 1, il_dw2height
string is_dw

end variables

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

dw_3.visible = false
pb_retrieve.PostEvent( Clicked! )

end event

on w_mssql_table.create
int iCurrent
call super::create
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_3=create dw_3
this.cbx_dwview=create cbx_dwview
this.pb_excel=create pb_excel
this.st_vertical=create st_vertical
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_3
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.cbx_dwview
this.Control[iCurrent+6]=this.pb_excel
this.Control[iCurrent+7]=this.st_vertical
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_4
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.gb_4
end on

on w_mssql_table.destroy
call super::destroy
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_3)
destroy(this.cbx_dwview)
destroy(this.pb_excel)
destroy(this.st_vertical)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x

il_dw2height = dw_2.height

end event

type pb_save from w_inheritance`pb_save within w_mssql_table
boolean visible = false
integer x = 2665
integer y = 48
end type

type dw_1 from w_inheritance`dw_1 within w_mssql_table
integer x = 32
integer y = 428
integer width = 1902
integer height = 1652
string dataobject = "d_mssql_table_list"
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
long   ll_row
string ls_table

if currentrow < 1 then return

sle_value.text = this.object.name[currentrow]
//ls_table = dw_1.object.name[currentrow]
//ll_row   = dw_2.retrieve( ls_table )
//if ll_row < 1 then
//	MessageBox("확인", ls_table + " 해당하는 조건의 데이터가 존재하지 않습니다.")
//end if

//
cbx_dwview.triggerevent( clicked! )


end event

event dw_1::clicked;call super::clicked;//
string ls_table
long   ll_row

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

ls_table = this.object.name[row]
ll_row   = dw_2.retrieve( ls_table )
if ll_row < 1 then
	MessageBox("확인", ls_table + " 해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type st_title from w_inheritance`st_title within w_mssql_table
integer x = 37
integer y = 20
integer width = 1115
integer height = 140
integer textsize = -22
string text = "MS-SQL TABLE"
end type

type st_tips from w_inheritance`st_tips within w_mssql_table
end type

type pb_compute from w_inheritance`pb_compute within w_mssql_table
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mssql_table
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mssql_table
integer x = 2670
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mssql_table
integer x = 2286
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;call super::clicked;//
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 MS-SQL TABLE을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mssql_table
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mssql_table
boolean visible = false
integer x = 2281
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mssql_table
boolean visible = false
integer x = 2615
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row
ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mssql_table
integer x = 2094
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long     ll_row
string   ls_table, ls_type[]

dw_1.reset() ; dw_2.reset()

if rb_1.checked = true then 
	ls_type[1] = "U"
	ls_type[2] = "V"
elseif rb_2.checked = true then 
	ls_type[1] = "U"
elseif rb_3.checked = true then 
	ls_type[1] = "V"
end if

dw_1.retrieve( ls_type )

end event

type gb_3 from w_inheritance`gb_3 within w_mssql_table
boolean visible = false
integer x = 1582
integer y = 36
integer width = 594
integer height = 204
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mssql_table
integer y = 232
integer width = 3835
integer height = 180
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mssql_table
integer x = 2057
integer y = 16
integer width = 837
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mssql_table
integer x = 1975
integer y = 428
integer width = 1893
integer height = 1652
string dataobject = "d_mssql_table_field"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type rb_3 from radiobutton within w_mssql_table
integer x = 1769
integer y = 112
integer width = 215
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "VIEW"
end type

event clicked;//
long   ll_row
string ls_type[]

if rb_1.checked = true then 
	ls_type[1] = "U"
	ls_type[2] = "V"
elseif rb_2.checked = true then 
	ls_type[1] = "U"
elseif rb_3.checked = true then 
	ls_type[1] = "V"
end if

dw_1.reset()
ll_row = dw_1.retrieve( ls_type )
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type rb_2 from radiobutton within w_mssql_table
integer x = 1495
integer y = 112
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "TABLE"
end type

event clicked;//
long   ll_row
string ls_type[]

if rb_1.checked = true then 
	ls_type[1] = "U"
	ls_type[2] = "V"
elseif rb_2.checked = true then 
	ls_type[1] = "U"
elseif rb_3.checked = true then 
	ls_type[1] = "V"
end if

dw_1.reset()
ll_row = dw_1.retrieve( ls_type )
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type rb_1 from radiobutton within w_mssql_table
integer x = 1266
integer y = 112
integer width = 206
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;//
long   ll_row
string ls_type[]

if rb_1.checked = true then 
	ls_type[1] = "U"
	ls_type[2] = "V"
elseif rb_2.checked = true then 
	ls_type[1] = "U"
elseif rb_3.checked = true then 
	ls_type[1] = "V"
end if

dw_1.reset()
ll_row = dw_1.retrieve( ls_type )
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type dw_3 from datawindow within w_mssql_table
integer x = 2907
integer y = 68
integer width = 206
integer height = 120
integer taborder = 150
boolean bringtotop = true
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_dwview from checkbox within w_mssql_table
integer x = 2491
integer y = 312
integer width = 443
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "데이터 보기"
end type

event clicked;
if this.checked = false then
	dw_2.height  = il_dw2height
	dw_3.visible = false
	RETURN
end if

dw_3.x      = dw_2.x
dw_3.y      = dw_2.y + (il_dw2height / 2)
dw_3.width  = dw_2.width
dw_3.height = il_dw2height / 2
dw_2.height = il_dw2height / 2


string ls_sql, ls_style, ls_err, ls_dwCreate, ls_table, ls_field
long   ll_row

dw_3.visible = true

ls_table    = dw_1.object.name[dw_1.getrow()]

for ll_row = 1 to dw_2.rowcount()
	ls_field = dw_2.object.syscolumns_name[ll_row]
	if ls_field = "password" then CONTINUE
	
	ls_sql   = ls_sql + ", " + ls_field
next

ls_sql      = "SELECT " + RightA(ls_sql, LenA(ls_sql) - 2) + " FROM " + ls_table
ls_style    = "Style(Type=Grid)"

ls_dwCreate = SQLCA.SynTaxFromSQL(ls_sql, ls_style, ls_err)
if ls_err <> "" Then RETURN

dw_3.Create(ls_dwCreate, ls_err)
if ls_err <> "" Then RETURN

dw_3.SetTransObject(sqlca)
dw_3.Retrieve()

end event

type pb_excel from picturebutton within w_mssql_table
event mousemove pbm_mousemove
integer x = 2478
integer y = 56
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_2
if ldw_sel.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				ldw_sel.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	


end event

type st_vertical from u_splitbar_vertical within w_mssql_table
integer x = 1943
integer y = 428
integer height = 1652
boolean bringtotop = true
end type

type st_6 from statictext within w_mssql_table
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_mssql_table
integer x = 274
integer y = 292
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_mssql_table
integer x = 306
integer y = 304
integer width = 311
integer height = 88
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

type st_7 from statictext within w_mssql_table
integer x = 745
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

type ddlb_op from dropdownlistbox within w_mssql_table
integer x = 914
integer y = 292
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mssql_table
integer x = 1234
integer y = 300
integer width = 567
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_mssql_table
integer x = 1806
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
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_mssql_table
integer x = 1970
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
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_mssql_table
integer x = 2135
integer y = 300
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
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mssql_table
integer x = 2299
integer y = 300
integer width = 160
integer height = 76
integer taborder = 140
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
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_mssql_table
integer x = 1221
integer y = 16
integer width = 814
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "TABLE"
borderstyle borderstyle = stylebox!
end type

