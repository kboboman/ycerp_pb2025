$PBExportHeader$w_mssql_table1.srw
$PBExportComments$테이블리스트
forward 
global type w_mssql_table1 from window
end type
type cbx_dwview from checkbox within w_mssql_table1
end type
type dw_3 from datawindow within w_mssql_table1
end type
type rb_3 from radiobutton within w_mssql_table1
end type
type rb_2 from radiobutton within w_mssql_table1
end type
type rb_1 from radiobutton within w_mssql_table1
end type
type pb_print from picturebutton within w_mssql_table1
end type
type pb_retrieve from picturebutton within w_mssql_table1
end type
type pb_exit from picturebutton within w_mssql_table1
end type
type cb_12 from commandbutton within w_mssql_table1
end type
type cb_11 from commandbutton within w_mssql_table1
end type
type cb_filteroff from commandbutton within w_mssql_table1
end type
type sle_value from singlelineedit within w_mssql_table1
end type
type ddlb_op from dropdownlistbox within w_mssql_table1
end type
type st_9 from statictext within w_mssql_table1
end type
type ddlb_col from dropdownlistbox within w_mssql_table1
end type
type st_8 from statictext within w_mssql_table1
end type
type pb_excel from picturebutton within w_mssql_table1
end type
type dw_1 from datawindow within w_mssql_table1
end type
type dw_2 from datawindow within w_mssql_table1
end type
type st_title from statictext within w_mssql_table1
end type
type cb_filteron from commandbutton within w_mssql_table1
end type
type gb_1 from groupbox within w_mssql_table1
end type
type gb_2 from groupbox within w_mssql_table1
end type
type gb_3 from groupbox within w_mssql_table1
end type
end forward

global type w_mssql_table1 from window
integer x = 494
integer y = 424
integer width = 4165
integer height = 2240
boolean titlebar = true
string title = "MS-SQL TABLE(w_mssql_table)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "C:\bmp\Book.ico"
boolean center = true
cbx_dwview cbx_dwview
dw_3 dw_3
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
pb_print pb_print
pb_retrieve pb_retrieve
pb_exit pb_exit
cb_12 cb_12
cb_11 cb_11
cb_filteroff cb_filteroff
sle_value sle_value
ddlb_op ddlb_op
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
pb_excel pb_excel
dw_1 dw_1
dw_2 dw_2
st_title st_title
cb_filteron cb_filteron
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_mssql_table1 w_mssql_table1

type variables
gs_custper_str istr_select
int  ii_type, ii_sw = 0, ii_cnt = 0
long il_find = 1, il_dw2height

end variables

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string  ls_winname
Window  w_parent

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

dw_3.visible = false

//OpenSheet로 OPEN한 경우
w_parent = this.ParentWindow()

if IsValid(w_parent) then
	ls_winname = w_parent.classname()
	if ls_winname = "w_all_main" then
		THIS.X  = (w_parent.width  - this.width)  / 2
		THIS.Y  = (w_parent.height - this.height) / 2 - 200
	else
		THIS.X  = (w_parent.width  - this.width)  / 2 + 1250
		THIS.Y  = (w_parent.height - this.height) / 2 + 150
	end if
end if
	
pb_retrieve.triggerevent( Clicked! )

end event

on w_mssql_table1.create
this.cbx_dwview=create cbx_dwview
this.dw_3=create dw_3
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_print=create pb_print
this.pb_retrieve=create pb_retrieve
this.pb_exit=create pb_exit
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_filteroff=create cb_filteroff
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.pb_excel=create pb_excel
this.dw_1=create dw_1
this.dw_2=create dw_2
this.st_title=create st_title
this.cb_filteron=create cb_filteron
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cbx_dwview,&
this.dw_3,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.pb_print,&
this.pb_retrieve,&
this.pb_exit,&
this.cb_12,&
this.cb_11,&
this.cb_filteroff,&
this.sle_value,&
this.ddlb_op,&
this.st_9,&
this.ddlb_col,&
this.st_8,&
this.pb_excel,&
this.dw_1,&
this.dw_2,&
this.st_title,&
this.cb_filteron,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_mssql_table1.destroy
destroy(this.cbx_dwview)
destroy(this.dw_3)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_print)
destroy(this.pb_retrieve)
destroy(this.pb_exit)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_filteroff)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.pb_excel)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.st_title)
destroy(this.cb_filteron)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event resize;//
dw_1.height = newheight - 440

dw_2.width  = newwidth  - 2052
dw_2.height = newheight - 440

il_dw2height = dw_2.height

end event

type cbx_dwview from checkbox within w_mssql_table1
integer x = 2816
integer y = 296
integer width = 443
integer height = 56
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

type dw_3 from datawindow within w_mssql_table1
integer x = 1225
integer y = 24
integer width = 187
integer height = 136
integer taborder = 100
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_3 from radiobutton within w_mssql_table1
integer x = 2930
integer y = 84
integer width = 215
integer height = 60
integer textsize = -9
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

type rb_2 from radiobutton within w_mssql_table1
integer x = 2688
integer y = 84
integer width = 238
integer height = 60
integer textsize = -9
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

type rb_1 from radiobutton within w_mssql_table1
integer x = 2487
integer y = 84
integer width = 206
integer height = 60
integer textsize = -9
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

type pb_print from picturebutton within w_mssql_table1
integer x = 3465
integer y = 56
integer width = 187
integer height = 144
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event clicked;//
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

type pb_retrieve from picturebutton within w_mssql_table1
integer x = 3269
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
string picturename = "c:\bmp\retrieve.bmp"
string disabledname = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long     ll_row
string   ls_table, ls_type[]

cb_filteroff.triggerevent(clicked!)
dw_2.reset()
dw_1.reset()

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

type pb_exit from picturebutton within w_mssql_table1
integer x = 3863
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
string picturename = "c:\bmp\exit.bmp"
string disabledname = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event clicked;//
close(parent)

end event

type cb_12 from commandbutton within w_mssql_table1
integer x = 2555
integer y = 284
integer width = 238
integer height = 76
integer taborder = 70
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
String ls_col
choose case trim(ddlb_col.text)
	case "순번"
		ls_col  = "syscolumns_colid"
	case "필드명"
		ls_col  = "name"
	case "데이터형식"
		ls_col  = "cdatatype"
	case "길이"
		ls_col  = "syscolumns_prec"
	case "Scale"
		ls_col  = "syscolumns_scale"
	case "NULL"
		ls_col  = "cnull"
	case "PK"
		ls_col  = "pk"
	case "설명"
		ls_col  = "pbcatcol_pbc_cmnt"
end choose		

dw_2.SetSort(ls_col + " D")
dw_2.sort()

end event

type cb_11 from commandbutton within w_mssql_table1
integer x = 2318
integer y = 284
integer width = 238
integer height = 76
integer taborder = 60
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
String ls_col
choose case trim(ddlb_col.text)
	case "순번"
		ls_col  = "syscolumns_colid"
	case "필드명"
		ls_col  = "name"
	case "데이터형식"
		ls_col  = "cdatatype"
	case "길이"
		ls_col  = "syscolumns_prec"
	case "Scale"
		ls_col  = "syscolumns_scale"
	case "NULL"
		ls_col  = "cnull"
	case "PK"
		ls_col  = "pk"
	case "설명"
		ls_col  = "pbcatcol_pbc_cmnt"
end choose		

dw_2.SetSort(ls_col + " A")
dw_2.sort()

end event

type cb_filteroff from commandbutton within w_mssql_table1
integer x = 2080
integer y = 284
integer width = 238
integer height = 76
integer taborder = 40
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
ddlb_op.text    = "LIKE"
ddlb_col.text   = "필드명"
sle_value.text  = ""

dw_2.setfilter("")
dw_2.filter()

end event

type sle_value from singlelineedit within w_mssql_table1
integer x = 1170
integer y = 284
integer width = 658
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_mssql_table1
integer x = 878
integer y = 280
integer width = 279
integer height = 512
integer taborder = 40
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

type st_9 from statictext within w_mssql_table1
integer x = 695
integer y = 300
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

type ddlb_col from dropdownlistbox within w_mssql_table1
integer x = 279
integer y = 280
integer width = 402
integer height = 532
integer taborder = 30
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
string item[] = {"순번","필드명","데이터형식","길이","Scale","NULL","PK","설명"}
end type

type st_8 from statictext within w_mssql_table1
integer x = 96
integer y = 300
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

type pb_excel from picturebutton within w_mssql_table1
event mousemove pbm_mousemove
integer x = 3662
integer y = 56
integer width = 187
integer height = 144
integer taborder = 20
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

type dw_1 from datawindow within w_mssql_table1
integer x = 32
integer y = 412
integer width = 1979
integer height = 1696
integer taborder = 30
string title = "none"
string dataobject = "d_mssql_table_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
long   ll_row
string ls_table

if currentrow < 1 then return

sle_value.text = this.object.name[currentrow]
ls_table = dw_1.object.name[currentrow]
ll_row   = dw_2.retrieve( ls_table )
if ll_row < 1 then
	MessageBox("확인", ls_table + " 해당하는 조건의 데이터가 존재하지 않습니다.")
end if

//
cbx_dwview.triggerevent( clicked! )


end event

type dw_2 from datawindow within w_mssql_table1
integer x = 2011
integer y = 412
integer width = 2075
integer height = 1696
integer taborder = 20
string dataobject = "d_mssql_table_field"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_col, ls_text

if row < 1 then return
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

choose case dwo.name
	case "syscolumns_colid"
		ls_col  = "순번"
		ls_text = string(this.object.syscolumns_colid[row])
	case "name"
		ls_col  = "필드명"
		ls_text = string(this.object.name[row])
	case "cdatatype"
		ls_col  = "데이터형식"
		ls_text = this.object.cdatatype[row]
	case "syscolumns_prec"
		ls_col  = "길이"
		ls_text = string(this.object.syscolumns_prec[row])
	case "syscolumns_scale"
		ls_col  = "Scale"
		ls_text = string(this.object.syscolumns_scale[row])
	case "cnull"
		ls_col  = "NULL"
		ls_text = string(this.object.cnull[row])
	case "pk"
		ls_col  = "PK"
		ls_text = string(this.object.pk[row])
	case "pbcatcol_pbc_cmnt"
		ls_col  = "설명"
		ls_text = string(this.object.pbcatcol_pbc_cmnt[row])
end choose

choose case ls_col
	case "길이"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type st_title from statictext within w_mssql_table1
integer x = 32
integer y = 24
integer width = 1088
integer height = 148
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "MS-SQL TABLE"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_filteron from commandbutton within w_mssql_table1
integer x = 1842
integer y = 284
integer width = 238
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "순번"
			ls_col  = "syscolumns_colid"
		case "필드명"
			ls_col  = "name"
		case "데이터형식"
			ls_col  = "cdatatype"
		case "길이"
			ls_col  = "syscolumns_prec"
		case "Scale"
			ls_col  = "syscolumns_scale"
		case "NULL"
			ls_col  = "cnull"
		case "PK"
			ls_col  = "pk"
		case "설명"
			ls_col  = "pbcatcol_pbc_cmnt"
	end choose

	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
		elseif ls_col = "cnt " then
			ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)
dw_2.triggerevent(rowfocuschanged!)

end event

type gb_1 from groupbox within w_mssql_table1
integer x = 3227
integer y = 8
integer width = 859
integer height = 212
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type gb_2 from groupbox within w_mssql_table1
integer x = 2441
integer y = 8
integer width = 768
integer height = 172
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "TABLE"
borderstyle borderstyle = stylebox!
end type

type gb_3 from groupbox within w_mssql_table1
integer x = 37
integer y = 224
integer width = 4050
integer height = 172
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

