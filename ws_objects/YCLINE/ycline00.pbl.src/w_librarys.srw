$PBExportHeader$w_librarys.srw
$PBExportComments$Object to Structure
forward
global type w_librarys from w_center
end type
type cb_5 from commandbutton within w_librarys
end type
type cb_3 from commandbutton within w_librarys
end type
type cb_2 from commandbutton within w_librarys
end type
type cb_1 from commandbutton within w_librarys
end type
type sle_value from singlelineedit within w_librarys
end type
type ddlb_op from dropdownlistbox within w_librarys
end type
type st_1 from statictext within w_librarys
end type
type ddlb_fld from dropdownlistbox within w_librarys
end type
type st_3 from statictext within w_librarys
end type
type pb_1 from picturebutton within w_librarys
end type
type st_4 from statictext within w_librarys
end type
type cb_expand from commandbutton within w_librarys
end type
type cb_close from commandbutton within w_librarys
end type
type cb_ok from commandbutton within w_librarys
end type
type dw_2 from datawindow within w_librarys
end type
type st_curr_path from statictext within w_librarys
end type
type lb_file from listbox within w_librarys
end type
type dw_1 from datawindow within w_librarys
end type
type dw_datatype from datawindow within w_librarys
end type
type gb_3 from groupbox within w_librarys
end type
type sle_drive from singlelineedit within w_librarys
end type
type sle_dir from singlelineedit within w_librarys
end type
type ddlb_dwtitles from dropdownlistbox within w_librarys
end type
end forward

global type w_librarys from w_center
integer y = 4
integer width = 4421
integer height = 2404
string title = "라이브러리(w_librarys)"
boolean resizable = false
long backcolor = 74481808
string icon = "DisplayCurrentLibrary!"
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
event ue_close ( )
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_value sle_value
ddlb_op ddlb_op
st_1 st_1
ddlb_fld ddlb_fld
st_3 st_3
pb_1 pb_1
st_4 st_4
cb_expand cb_expand
cb_close cb_close
cb_ok cb_ok
dw_2 dw_2
st_curr_path st_curr_path
lb_file lb_file
dw_1 dw_1
dw_datatype dw_datatype
gb_3 gb_3
sle_drive sle_drive
sle_dir sle_dir
ddlb_dwtitles ddlb_dwtitles
end type
global w_librarys w_librarys

type variables
//
datastore ids_lib_string, ids_create
string is_lib
string is_struct_name
string is_str_syntax
string is_file_ext=".srs"
string is_comment
string is_prefix="str"

Long  il_Row, il_RootItem
Boolean  ib_Cancel 

end variables

forward prototypes
public function integer of_create_structure_export ()
public function integer of_set_new (integer ai_index)
public function integer wf_get_drive_index (string as_drive)
public function long of_recurse_dir_list (string as_path, long al_parent)
public function long of_add_item (string as_path, string as_filename, long al_parent)
public function integer wf_collapse_rows (datawindow adw_datawindow, long al_startrow)
public function integer wf_expand_row (datawindow adw_datawindow, long al_startrow)
public function integer wf_all_objects (string as_pblname)
end prototypes

event ue_postopen;//
string	ls_Item,  ls_currentpath
integer	li_Index, li_Drives, li_DriveType, li_selected
string	ls_Drive

//////////////////////////////////////////////////////////////////////////////
// Get a listing of valid drives
// Store the current working directory in hiddent static text st_curr_path
// Copy the drive choices to the ddlb
if Not lb_file.DirList("*.*", 49152, st_curr_path) then
else
	ls_currentpath = st_curr_path.text
end if
lb_file.Reset()
//////////////////////////////////////////////////////////////////////////////

end event

event ue_close();close( this )
end event

public function integer of_create_structure_export ();string ls_header="$PBExportHeader$"
string ls_comment="$PBExportComments$"
string ls_file_ext=".srs"
string ls_type = "global type "
string ls_name 
string ls_type_end = " from structure"
string ls_end = "end type"
string ls_tab = "~t"
string ls_return ="~r~n"
string ls_export_txt
string ls_filename
int    li_i, li_count, li_file_handle
string ls_data_type
long   ll_pos
int    li_len

// set header
ls_export_txt = ls_header+is_prefix+is_struct_name+ls_file_ext+ls_return

if is_comment <> "" THEN
	ls_export_txt += ls_comment+is_comment+ls_return
end if

ls_export_txt += ls_type+ls_tab+is_prefix+is_struct_name+ls_type_end+ls_return

li_count = dw_datatype.rowcount()

for li_i=1 to li_count
	// set data type value
	ls_data_type = dw_datatype.object.coltype[li_i]
	if  PosA(ls_data_type, "decimal") > 0 then
		li_len = (PosA(ls_data_type, ")") - PosA(ls_data_type,"(")) -1
		ls_data_type = "decimal {" + MidA(ls_data_type, PosA(ls_data_type,"(")+1, li_len) + "}"
		
	elseif PosA(ls_data_type, "char") > 0 then
		ls_data_type="string"
	elseif PosA(ls_data_type, "num") > 0 then
		ls_data_type="integer"
	end if
	ls_export_txt += ls_tab+ls_data_type+ls_tab+dw_datatype.object.colname[li_i]+ls_return

next

ls_export_txt += ls_end

is_str_syntax = ls_export_txt

//mle_syntax.text = ls_export_txt

return 1

end function

public function integer of_set_new (integer ai_index);//// this function is called to set up everything for a new datawindow selection
//string ls_colname[]
//string ls_coltype[]
//string ls_colcomment
//string ls_syntax
//string ls_dw
//int   li_i, li_count
//
//ls_dw = ids_lib_string.object.name[ai_index]
//
//// set object name
//is_struct_name = mid(ls_dw, (pos(ls_dw,"_") +1))
//// set prefix for object
//is_prefix = sle_prefix.text
//
//// create the DataWindow
//ls_syntax = LibraryExport(is_lib, ls_dw, ExportDataWindow!)
//if ids_create.create(ls_syntax) < 0 then
//	messagebox("Syntax Error", "Error creating DataWindow.")
//	return -1
//end if
//
//// set comment
//if not isnull(ids_lib_string.object.comments[ai_index]) THEN
//	is_comment = ids_lib_string.object.comments[ai_index]
//	mle_comment.text = is_comment
//end if
//
//// parse datawindow for column names and data types
//dw_datatype.reset()
//
//li_count = Integer(ids_create.describe("datawindow.column.count"))
//if li_count < 1 THEN
//	return -1
//end if
//
//for li_i=1 to li_count
//	ls_colname[li_i] = ids_create.describe("#" + String(li_i) + ".name")
//	ls_coltype[li_i] = ids_create.describe(ls_colname[li_i]+".coltype")
//	dw_datatype.object.colname[li_i] = ls_colname[li_i]
//	dw_datatype.object.coltype[li_i] = ls_coltype[li_i]
//next

return 1

end function

public function integer wf_get_drive_index (string as_drive);// Determine drive description based on return value from external function.
// public integer wf_get_drive_index ( as_drive )
// value  string  as_drive

UInt		lui_RC

lui_RC = gu_ext_func.uf_GetDriveType (AscA (as_drive) - 97)

Choose Case lui_RC
		Case 2
			Return 1

		Case 3
			Return 2

		Case 4
			Return 3

		Case 5
			Return 4

		Case Else
			Return 0
End Choose

end function

public function long of_recurse_dir_list (string as_path, long al_parent);// This is the recurrsive procedure
// Scan all subdirectories of the selected directory
//
// public long of_recurse_dir_list ( value string as_path, value long al_parent )
//
Integer	li_NumDirectories, li_Index , li_Pos1 ,li_Pos2, li_Pos, li_Len, li_Items
Long		ll_New
String	ls_FileName, ls_DirName, ls_SubDirectory[], ls_Delimeter, ls_AllFiles

// Allow other windows processing to continue during this recursive process
Do While Yield()
Loop

// Test if the user has canceled the scan
If ib_cancel Then Return 0

ls_Delimeter = "\"
ls_AllFiles  = "*.*"

If RightA(as_Path, 1) <> ls_Delimeter Then
	as_Path = as_Path + ls_Delimeter
End if

// Get a listing of  sub directories from the directory passed
lb_file.Reset()
lb_file.DirList( as_Path + ls_AllFiles, 32784 )

// Show the current directory working on
sle_dir.text = as_Path

// Get just the last directory name ie skip the path
li_Pos = 1
li_Len = LenA(as_Path) - 1
For li_Pos = li_Len to 1 Step -1
	If MidA(as_Path, li_Pos, 1) = ls_Delimeter Then Exit
Next

// Insert name, level. open is to allow collapsing of the structure			
ls_FileName = MidA(as_Path, li_Pos + 1, (LenA(as_Path) - (li_Pos + 1)))

If ls_FileName = "" Then
	ls_FileName = as_Path
End if

// Insert the current directory working on into the datawindow. 
ll_New = of_add_item(as_Path, ls_FileName, al_Parent)

// Keep a local copy of the lb directories only
li_Items = lb_file.TotalItems()
li_NumDirectories = 0

Do While li_Index <= li_Items
	If LeftA(lb_file.Text(li_Index), 1) = "[" Then
		li_NumDirectories++
		ls_SubDirectory[li_NumDirectories] = lb_file.Text(li_Index)
	End If
	li_Index++
Loop

// Call next level sub directories
li_Index = 1 
DO While  li_Index <=  li_NumDirectories
	if (ls_SubDirectory[li_Index] <> "[..]") And (ls_SubDirectory[li_Index] <> "[.]") then
		ls_DirName = as_Path + ls_SubDirectory[li_Index] + ls_Delimeter

		// Strip the [ ] from the dir name	
		li_Pos1    = PosA(ls_dirname, "[")
		li_Pos2    = PosA(ls_dirname, "]")
		ls_DirName = LeftA(ls_DirName, li_Pos1 - 1) + &
						 MidA(ls_DirName, li_Pos1 + 1, li_Pos2 - li_Pos1 - 1) + &
						 RightA (ls_DirName, LenA(ls_DirName) - li_Pos2)
		
		// Here is the recurrsive call
		of_recurse_dir_list(ls_DirName, ll_New)
	end if
	
	li_Index++
LOOP

RETURN 1

end function

public function long of_add_item (string as_path, string as_filename, long al_parent);// Add a directory entry to the DataWindow or TreeView
// public long of_add_item ( as_path, as_filename, al_parent )
// value string as_path
// value string as_filename
// value long   al_parent


Long					ll_NewItem
TreeViewItem		ltvi_Item

//If tab_dir.SelectedTab = 1 Then
	// Add a row to the DataWindow
	ll_NewItem = dw_2.Insertrow(0)
	dw_2.Object.fullname[ll_NewItem] = as_Path
	dw_2.Object.name[ll_NewItem] = as_FileName
	dw_2.Object.bmpname[ll_NewItem] = "folder.bmp"
	dw_2.Object.selectedbmpname[ll_NewItem] = "foldopen.bmp"
	dw_2.Object.selected[ll_NewItem] = 0
	dw_2.Object.open[ll_NewItem] = 0
	dw_2.Object.children[ll_NewItem] = 0
	dw_2.Object.siblings[ll_NewItem] =  0
	dw_2.Object.level[ll_NewItem] = al_Parent

	Return al_Parent + 1

//Else
//	// Add an item to the TreeView
//	ltvi_Item.Label = as_FileName
//	ltvi_Item.PictureIndex = 1
//	ltvi_Item.SelectedPictureIndex = 2
//	ll_NewItem = tab_dir.tabpage_tv.tv_1.InsertItemLast(al_Parent, ltvi_Item)
//
//	Return ll_NewItem
//End if

end function

public function integer wf_collapse_rows (datawindow adw_datawindow, long al_startrow);// This function is used for the DataWindow only
// Collapse all the rows that make up a level
// public integer wf_collapse_rows ( adw_datawindow, al_startrow )
// value datawindow adw_datawindow
// value long       al_startrow

Long		ll_Total, ll_Index, ll_EndRow
Integer	li_StartLevel

// Set the row open status back to closed
adw_DataWindow.object.open[al_StartRow] = 0

// Find out which level is being collapsed
li_StartLevel = adw_DataWindow.object.level[al_StartRow]

ll_Total = adw_DataWindow.RowCount()
If ll_Total = al_StartRow Then Return 0

SetPointer(hourglass!)

ll_EndRow = ll_Total

al_StartRow++
For ll_Index = al_StartRow  To ll_Total
	If adw_DataWindow.object.level[ll_Index] <= li_StartLevel Then
		ll_EndRow = ll_Index - 1
		Exit
	Else	
		adw_DataWindow.object.open[ll_Index] = 0
	End If
Next

adw_DataWindow.SetDetailHeight(al_StartRow, ll_EndRow, 0)

Return 0

end function

public function integer wf_expand_row (datawindow adw_datawindow, long al_startrow);// This function is used for the DataWindow only
// Expand all the rows for a level
// public integer wf_expand_row ( adw_datawindow, al_startrow )
// value  datawindow adw_datawindow
// value  long       al_startrow

Long		ll_Total, ll_EndRow, ll_Index
Integer	li_StartLevel

// Mark this row as open
adw_DataWindow.Object.open[al_StartRow] = 1

ll_Total = adw_DataWindow.RowCount()

If ll_Total = al_StartRow Then Return 0

SetPointer(hourglass!)

// Start with the row passed to begin exapanding
// Find out which level this is and search for the next level that is > = to this one

li_StartLevel = adw_DataWindow.Object.level[al_StartRow]

ll_EndRow = adw_DataWindow.Find("level <= " + String(li_StartLevel), al_StartRow + 1, ll_Total)
If ll_EndRow <=0 Then ll_EndRow = ll_Total

li_StartLevel ++

ll_Index = adw_DataWindow.Find("level = " + String(li_StartLevel), al_StartRow + 1, ll_EndRow)
// Set the rowheight to normal size for this selected range

Do While ll_Index > 0 
		adw_DataWindow.SetDetailHeight(ll_Index, ll_Index, 19)
		ll_Index++
		If ll_Index > ll_EndRow Then Exit
		ll_Index = adw_DataWindow.Find("level = " + String(li_StartLevel), ll_Index, ll_EndRow)
Loop	

adw_DataWindow.Sort()

Return 0

end function

public function integer wf_all_objects (string as_pblname);// public integer wf_all_objects ( value string as_pblname )
//
int    li_i, li_count
long   ll_ret, ll_row
string ls_objects, ls_column[], ls_message

setpointer(hourglass!)

if Trim(as_pblname) <> "" THEN
	dw_datatype.reset()
	ids_lib_string.reset()
//	ddplb_dw.reset()
	
	/* LibraryDirectory
	DirAll!         -- All objects
	DirApplication! -- Application objects
	DirDataWindow!  -- DataWindow objects
	DirFunction!    -- Function objects
	DirMenu!        -- Menu objects
	DirPipeline!    -- Pipeline objects
	DirProject!     -- Project objects
	DirQuery!       -- Query objects
	DirStructure!   -- Structure objects
	DirUserObject!  -- User objects
	DirWindow!      -- Window objects

	string ls_entries
	ls_entries = LibraryDirectory( "c:\pb\dwTemp.pbl", DirUserObject!)
	dw_list.SetRedraw(FALSE)
	dw_list.Reset( )
	dw_list.ImportString( ls_Entries )
	dw_list.SetRedraw(TRUE)
	*/

	ls_objects = LibraryDirectory( as_pblname, DirAll! )
	If IsNull(as_pblname) Or Trim(as_pblname) = "" THEN RETURN 1
	
	is_lib = as_pblname
	if ls_objects <> "" THEN
		ll_ret   = ids_lib_string.importstring(ls_objects)
		if isnull(ll_ret) then
			ll_ret = GF_SPLIT(ls_objects, "~t", ls_column)

			for li_i = 1 to UpperBound(ls_column)	// name, date, comment
				choose case li_i
					case 1
//						ddplb_dw.additem( ls_column[li_i], 1 )
						ll_row = dw_1.insertrow(0)
						dw_1.object.libname[ll_row]  = is_lib
						dw_1.object.name[ll_row]     = ls_column[li_i]
					case 2
						dw_1.object.date[ll_row]     = ls_column[li_i]
					case 3
						dw_1.object.comments[ll_row] = ls_column[li_i]
				end choose
			next
		else
			choose case ll_ret
				case -1
					ls_message = "startrow value supplied is greater than the number of rows in the string"
				case -3
					ls_message = "Invalid argument"
				case -4
					ls_message = "Invalid input"
				case -9
					ls_message = "PowerBuilder or the user canceled import because data failed validation"
			end choose

			ids_lib_string.sort()
			li_count = ids_lib_string.rowcount()
			
			// add datawindow to list box
			if li_count > 0 THEN
				for  li_i=1 to li_count
//					ddplb_dw.additem(ids_lib_string.object.name[li_i], 1)

					ll_row = dw_1.insertrow(0)
					dw_1.object.libname[ll_row]  = is_lib
					dw_1.object.name[ll_row]     = ids_lib_string.object.name[li_i]
					dw_1.object.date[ll_row]     = ids_lib_string.object.date[li_i]
					dw_1.object.comments[ll_row] = ids_lib_string.object.comments[li_i]
				next
			end if			
		end if
	end if
end if

RETURN 1
end function

on w_librarys.create
int iCurrent
call super::create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.st_3=create st_3
this.pb_1=create pb_1
this.st_4=create st_4
this.cb_expand=create cb_expand
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.dw_2=create dw_2
this.st_curr_path=create st_curr_path
this.lb_file=create lb_file
this.dw_1=create dw_1
this.dw_datatype=create dw_datatype
this.gb_3=create gb_3
this.sle_drive=create sle_drive
this.sle_dir=create sle_dir
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_5
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.ddlb_op
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.cb_expand
this.Control[iCurrent+13]=this.cb_close
this.Control[iCurrent+14]=this.cb_ok
this.Control[iCurrent+15]=this.dw_2
this.Control[iCurrent+16]=this.st_curr_path
this.Control[iCurrent+17]=this.lb_file
this.Control[iCurrent+18]=this.dw_1
this.Control[iCurrent+19]=this.dw_datatype
this.Control[iCurrent+20]=this.gb_3
this.Control[iCurrent+21]=this.sle_drive
this.Control[iCurrent+22]=this.sle_dir
this.Control[iCurrent+23]=this.ddlb_dwtitles
end on

on w_librarys.destroy
call super::destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.cb_expand)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.dw_2)
destroy(this.st_curr_path)
destroy(this.lb_file)
destroy(this.dw_1)
destroy(this.dw_datatype)
destroy(this.gb_3)
destroy(this.sle_drive)
destroy(this.sle_dir)
destroy(this.ddlb_dwtitles)
end on

event open;call super::open;//
dw_1.settransobject(sqlca)

ids_lib_string = create datastore
ids_lib_string.dataobject = "d_lib_string"

ids_create = create datastore

cb_expand.enabled = false
st_curr_path.text = ""
st_curr_path.visible = false
sle_drive.visible = false

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

//do all of the work in the post open event.
This.PostEvent("ue_postopen")

end event

event close;//
Destroy ids_lib_string
Destroy ids_create
Show( w_h_main )

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 1157
dw_1.height = newheight - 544

lb_file.height= dw_1.height - dw_2.height - dw_datatype.height - 36
dw_datatype.y = newheight - 524



end event

type cb_5 from commandbutton within w_librarys
integer x = 2327
integer y = 272
integer width = 160
integer height = 76
integer taborder = 150
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

type cb_3 from commandbutton within w_librarys
integer x = 2162
integer y = 272
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_librarys
integer x = 1998
integer y = 272
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_1 from commandbutton within w_librarys
integer x = 1833
integer y = 272
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type sle_value from singlelineedit within w_librarys
integer x = 1262
integer y = 272
integer width = 567
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_librarys
integer x = 942
integer y = 264
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_1 from statictext within w_librarys
integer x = 773
integer y = 280
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

type ddlb_fld from dropdownlistbox within w_librarys
integer x = 274
integer y = 264
integer width = 480
integer height = 632
integer taborder = 90
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

type st_3 from statictext within w_librarys
integer x = 87
integer y = 280
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

type pb_1 from picturebutton within w_librarys
event mousemove pbm_mousemove
integer x = 3817
integer y = 32
integer width = 192
integer height = 152
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_4 from statictext within w_librarys
integer x = 50
integer y = 20
integer width = 1573
integer height = 140
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 32768
string text = "라이브러리 목록"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_expand from commandbutton within w_librarys
integer x = 2747
integer y = 32
integer width = 494
integer height = 152
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "&Expand All"
end type

event clicked;Long		ll_Rows, ll_Cnt

SetPointer(HourGlass!)

//If tab_dir.SelectedTab = 1 Then
	// Expand all datawindow rows
	dw_2.SetRedraw(False)
	ll_Rows = dw_2.RowCount()
	For ll_Cnt = 1 To ll_Rows
		dw_2.Object.open[ll_Cnt] = 1
		dw_2.SetDetailHeight(ll_Cnt, ll_Cnt, 19)
	Next
	dw_2.SetRedraw(True)
//Else
//	// Expand the treeview
//	tab_dir.tabpage_tv.tv_1.ExpandAll(il_RootItem)
//End If

end event

type cb_close from commandbutton within w_librarys
integer x = 4032
integer y = 32
integer width = 329
integer height = 152
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "&Close"
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_librarys
integer x = 3259
integer y = 32
integer width = 544
integer height = 152
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "&Scan"
end type

event clicked;// This button will display Scan normally.. 
// During a scan, the text changes to Cancel.

string	ls_CurPath
integer  li_Items, li_i

// Test if this is a scan or cancel button
if This.text = "C&ancel" then
	ib_Cancel = true
	RETURN
end if	

dw_1.reset()
dw_2.reset()
lb_file.reset()
dw_datatype.reset()

// Here down is Scan button only Get selected drive
ls_CurPath = st_curr_path.text	// ddplb_drive.Text

// Can't click any other buttons once the process is started
cb_close.Enabled=False

dw_1.SetRedraw(False)
dw_2.SetRedraw(False)

// Allow cancel out of recursive process
This.Text = "C&ancel"
ib_Cancel = False

// Reset the datawindow and start the recursion process
dw_2.Reset( )

of_recurse_dir_list( ls_CurPath, 1 )
wf_collapse_rows( dw_2, 1 )
wf_expand_row( dw_2,1 )

sle_dir.Text = ""

cb_close.Enabled = true

This.Text = "&Scan"

// Reset the current working directory
lb_file.DirList(st_curr_path.Text + "\*.pbl",0)

for li_Items = 1 to lb_file.TotalItems()
	wf_all_objects ( lb_file.Text(li_Items) )
next

dw_1.setsort( "libname, name" )
dw_1.sort()

dw_2.SetRedraw(True)
dw_1.SetRedraw(True)
cb_expand.enabled = true

end event

type dw_2 from datawindow within w_librarys
integer x = 46
integer y = 432
integer width = 1033
integer height = 840
integer taborder = 80
string title = "none"
string dataobject = "d_dir_tree"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// Used for drill down

if row <= 0 then return

This.SetRedraw(False)

If il_Row > 0 And il_Row <> row Then
	This.Object.selected[il_Row] = 0
End If

If Not IsNull(dwo) Then
	This.Object.selected[row] = 1
	il_Row = row

	If dwo.name = "clickbox" Then
		If This.Object.showbox[row] = 1 Then
			
			If This.Object.open[row] = 1 Then
				wf_collapse_rows(This, row)
			Else
				wf_expand_row(This, row)
			End if
		End if
	End if
End If
			
This.SetRedraw(True)

end event

event buttonclicked;//used for drill down

If row > 0 And Not IsNull(dwo) Then
	This.SetRedraw(False)
	
	If This.Object.open[row] = 1 Then
		wf_collapse_rows(This, row)
	Else
		wf_expand_row(This, row)
	End If
	
	This.SetRedraw(True)
End If

end event

type st_curr_path from statictext within w_librarys
integer x = 1678
integer y = 24
integer width = 407
integer height = 68
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type lb_file from listbox within w_librarys
integer x = 46
integer y = 1292
integer width = 1033
integer height = 572
integer taborder = 90
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
pointer oldpointer // Declares a pointer variable
long   ll_dw1cnt, ll_foundrow
string ls_library

setpointer(hourglass!)

ls_library = this.Text( index )

oldpointer = SetPointer(HourGlass!)

ll_dw1cnt = dw_1.RowCount()
ll_foundrow = dw_1.Find( "libname = '" + ls_library + "'", 1, ll_dw1cnt)
if ll_foundrow > 0 then
	dw_1.scrolltorow( ll_foundrow )
else
	MessageBox("확인","해당하는 Library의 Objects는 존재하지 않습니다.")
end if

SetPointer(oldpointer)

end event

type dw_1 from datawindow within w_librarys
integer x = 1097
integer y = 432
integer width = 3264
integer height = 1860
integer taborder = 70
string title = "none"
string dataobject = "d_librarys"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
//
setpointer(hourglass!)

// call function to set everything
of_set_new( row )

end event

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_datatype from datawindow within w_librarys
integer x = 46
integer y = 1880
integer width = 1033
integer height = 412
string dataobject = "d_datatype"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_librarys
integer x = 46
integer y = 208
integer width = 4320
integer height = 172
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 77643992
string text = "Scanning Directory:"
end type

type sle_drive from singlelineedit within w_librarys
integer x = 1678
integer y = 100
integer width = 407
integer height = 68
integer taborder = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 12632256
string text = "/"
boolean border = false
end type

event modified;//
//ddplb_drive.text = This.text

end event

type sle_dir from singlelineedit within w_librarys
integer x = 2501
integer y = 280
integer width = 1833
integer height = 64
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 77643992
boolean border = false
boolean displayonly = true
end type

type ddlb_dwtitles from dropdownlistbox within w_librarys
integer x = 329
integer y = 276
integer width = 311
integer height = 88
integer taborder = 90
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

