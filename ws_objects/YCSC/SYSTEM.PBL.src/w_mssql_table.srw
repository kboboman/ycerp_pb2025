$PBExportHeader$w_mssql_table.srw
$PBExportComments$테이블리스트
forward
global type w_mssql_table from window
end type
type cbx_find from checkbox within w_mssql_table
end type
type sle_table from singlelineedit within w_mssql_table
end type
type rb_3 from radiobutton within w_mssql_table
end type
type rb_2 from radiobutton within w_mssql_table
end type
type rb_1 from radiobutton within w_mssql_table
end type
type pb_print from picturebutton within w_mssql_table
end type
type pb_retrieve from picturebutton within w_mssql_table
end type
type pb_exit from picturebutton within w_mssql_table
end type
type cb_12 from commandbutton within w_mssql_table
end type
type cb_11 from commandbutton within w_mssql_table
end type
type cb_filteroff from commandbutton within w_mssql_table
end type
type sle_value from singlelineedit within w_mssql_table
end type
type ddlb_op from dropdownlistbox within w_mssql_table
end type
type st_9 from statictext within w_mssql_table
end type
type ddlb_col from dropdownlistbox within w_mssql_table
end type
type st_8 from statictext within w_mssql_table
end type
type pb_excel from picturebutton within w_mssql_table
end type
type dw_1 from datawindow within w_mssql_table
end type
type dw_2 from datawindow within w_mssql_table
end type
type st_title from statictext within w_mssql_table
end type
type cb_filteron from commandbutton within w_mssql_table
end type
type gb_1 from groupbox within w_mssql_table
end type
type gb_2 from groupbox within w_mssql_table
end type
type gb_3 from groupbox within w_mssql_table
end type
end forward

global type w_mssql_table from window
integer x = 494
integer y = 424
integer width = 4937
integer height = 2800
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
cbx_find cbx_find
sle_table sle_table
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
global w_mssql_table w_mssql_table

type variables
gs_custper_str istr_select
int  ii_type, ii_sw = 0, ii_cnt = 0
long il_find = 1

end variables

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string  ls_winname
Window  w_parent

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

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

on w_mssql_table.create
this.cbx_find=create cbx_find
this.sle_table=create sle_table
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
this.Control[]={this.cbx_find,&
this.sle_table,&
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

on w_mssql_table.destroy
destroy(this.cbx_find)
destroy(this.sle_table)
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
gb_2.height = newheight - 256
dw_1.height = newheight - 440

gb_3.width  = newwidth  - 2103
gb_3.height = newheight - 256
dw_2.width  = newwidth  - 2181
dw_2.height = newheight - 440

end event

type cbx_find from checkbox within w_mssql_table
integer x = 1326
integer y = 300
integer width = 219
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "찾기"
end type

event clicked;long ll_idx

ll_idx = dw_1.Find( "name LIKE '" + sle_table.text + "%'", 1, dw_1.RowCount() )
if ll_idx > 0 then
	dw_1.scrolltorow( ll_idx )
end if



////
//string ls_temp
//long   ll_end, ll_chk = 0
//
//debugbreak()
//ll_end  = dw_1.RowCount()
//ls_temp = "name LIKE '" + sle_table.text + "%' "
//
//if this.checked = true then
//	il_find = dw_1.Find(ls_temp, il_find, ll_end)
//	if il_find > 0 then
//		ll_chk++
//		dw_1.scrolltorow( il_find )
//		
//		il_find++
//		DO WHILE il_find > 0
//			if il_find > 0 then
//				this.text    = "Next"
//				this.checked = false
//			
//				il_find++
//			
//				if il_find > ll_end then 
//					EXIT
//				end if			
//
//				il_find = dw_1.Find(ls_temp, il_find, ll_end)			
//			end if
//		LOOP
//		
//		if ll_chk > 0 then
//			il_find   = 1
//			this.text = "Find" 
//		end if			
//	else
//		this.text    = "Find"
//		this.checked = false
//	end if
//	
//	if ll_chk = 0 then this.checked = false
//else
//	il_find   = 1
//	this.text = "Find"
//end if
//
end event

type sle_table from singlelineedit within w_mssql_table
event keydown pbm_keydown
integer x = 750
integer y = 288
integer width = 553
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

event keydown;//
string ls_table, ls_value, ls_temp

if KeyDown(KeyEnter!) then
	if isnull(this.text) or this.text = "" then
		dw_1.setfilter("")
		dw_1.SetSort("type A, name A")		
		dw_1.Sort()
	else			
		if trim(ddlb_op.text) = "LIKE" then
			ls_temp = "name " + trim(ddlb_op.text) + " '%" + trim(this.text) + "%' "
		else
			ls_temp = "name " + trim(ddlb_op.text) + " '"  + trim(this.text) + "' "
		end if
		dw_1.setfilter(ls_temp)
	end if

	dw_1.filter()	
	dw_1.scrolltorow(1)
end if

end event

type rb_3 from radiobutton within w_mssql_table
integer x = 521
integer y = 300
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

type rb_2 from radiobutton within w_mssql_table
integer x = 279
integer y = 300
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

type rb_1 from radiobutton within w_mssql_table
integer x = 78
integer y = 300
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

type pb_print from picturebutton within w_mssql_table
integer x = 4229
integer y = 60
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

type pb_retrieve from picturebutton within w_mssql_table
integer x = 4032
integer y = 60
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

if dw_1.rowcount() < 1 then	
	if rb_1.checked = true then 
		ls_type[1] = "U"
		ls_type[2] = "V"
	elseif rb_2.checked = true then 
		ls_type[1] = "U"
	elseif rb_3.checked = true then 
		ls_type[1] = "V"
	end if
	
	ll_row = dw_1.retrieve( ls_type )
end if

end event

type pb_exit from picturebutton within w_mssql_table
integer x = 4626
integer y = 60
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

type cb_12 from commandbutton within w_mssql_table
integer x = 4571
integer y = 280
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

type cb_11 from commandbutton within w_mssql_table
integer x = 4334
integer y = 280
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

type cb_filteroff from commandbutton within w_mssql_table
integer x = 4096
integer y = 280
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

type sle_value from singlelineedit within w_mssql_table
integer x = 3186
integer y = 280
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

type ddlb_op from dropdownlistbox within w_mssql_table
integer x = 2894
integer y = 276
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

type st_9 from statictext within w_mssql_table
integer x = 2711
integer y = 296
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

type ddlb_col from dropdownlistbox within w_mssql_table
integer x = 2295
integer y = 276
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

type st_8 from statictext within w_mssql_table
integer x = 2112
integer y = 296
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

type pb_excel from picturebutton within w_mssql_table
event mousemove pbm_mousemove
integer x = 4425
integer y = 60
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

type dw_1 from datawindow within w_mssql_table
integer x = 64
integer y = 376
integer width = 1920
integer height = 2256
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

end event

type dw_2 from datawindow within w_mssql_table
integer x = 2089
integer y = 376
integer width = 2720
integer height = 2256
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

type st_title from statictext within w_mssql_table
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
long backcolor = 32768
string text = "MS-SQL TABLE"
alignment alignment = center!
boolean border = true
long bordercolor = 67108864
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_filteron from commandbutton within w_mssql_table
integer x = 3858
integer y = 280
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

type gb_1 from groupbox within w_mssql_table
integer x = 3991
integer y = 12
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

type gb_2 from groupbox within w_mssql_table
integer x = 32
integer y = 224
integer width = 1979
integer height = 2440
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

type gb_3 from groupbox within w_mssql_table
integer x = 2053
integer y = 224
integer width = 2798
integer height = 2440
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "FIELD"
borderstyle borderstyle = stylebox!
end type

