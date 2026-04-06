$PBExportHeader$w_codemst_m02.srw
$PBExportComments$공통코드 관리(2020/06/08,김보길)
forward
global type w_codemst_m02 from w_inheritance2
end type
type st_4 from statictext within w_codemst_m02
end type
type ddlb_fld from dropdownlistbox within w_codemst_m02
end type
type ddlb_dwtitles from dropdownlistbox within w_codemst_m02
end type
type st_6 from statictext within w_codemst_m02
end type
type sle_value from singlelineedit within w_codemst_m02
end type
type cbx_op from checkbox within w_codemst_m02
end type
type cb_4 from commandbutton within w_codemst_m02
end type
type cb_6 from commandbutton within w_codemst_m02
end type
type cb_7 from commandbutton within w_codemst_m02
end type
type cb_8 from commandbutton within w_codemst_m02
end type
type st_vertical from u_splitbar_vertical within w_codemst_m02
end type
type ddlb_op from dropdownlistbox within w_codemst_m02
end type
type st_1 from statictext within w_codemst_m02
end type
end forward

global type w_codemst_m02 from w_inheritance2
integer x = 320
integer y = 552
integer width = 6354
integer height = 5836
string title = "공통코드 관리(w_codemst_m02)"
long backcolor = 79416533
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
st_1 st_1
end type
global w_codemst_m02 w_codemst_m02

type variables
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

long    idw_w, idw_h
long    ih_curteam
integer ii_chk = 0
string  is_chk = 'N'
TreeViewitem itv_team


end variables

forward prototypes
public subroutine wf_filter ()
end prototypes

public subroutine wf_filter ();
end subroutine

on w_codemst_m02.create
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
this.st_1=create st_1
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
this.Control[iCurrent+13]=this.st_1
end on

on w_codemst_m02.destroy
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
destroy(this.st_1)
end on

event resize;call super::resize;//gb_1.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x

idw_w       = dw_2.width
idw_h       = dw_2.height

end event

event we_postopen;call super::we_postopen;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
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

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

this.postevent('we_retrieve')
dw_1.setfocus()

end event

event we_retrieve;call super::we_retrieve;String ls_type, ls_itemcd, ls_use
long ll_ret, ll_row

dw_1.SetFilter("")
dw_1.Filter()

ll_row = dw_1.getrow()	
ll_ret = dw_1.Retrieve()

Choose Case ll_ret
	Case is > 0
		If ll_row > 0 Then dw_1.Event RowFocusChanged(1)
		dw_1.Post SetFocus()
	Case 0
		MessageBox("Check", "검색된 자료가 없습니다.")
	Case is < 0
		MessageBox("Error", "검색 Error")
End Choose


return 1
end event

event we_save;call super::we_save;//사용법
Long	ll_rtn
ll_rtn = wf_update_array({dw_1, dw_2})
If ll_rtn = 1 Then Messagebox('Check', '저장이 정상적으로 진행되었습니다')

Return 1

end event

type pb_saveas from w_inheritance2`pb_saveas within w_codemst_m02
boolean visible = false
integer x = 5189
integer y = 676
end type

event pb_saveas::clicked;call super::clicked;String  ls_Docname, ls_Named, ls_ExpandName
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

type pb_save from w_inheritance2`pb_save within w_codemst_m02
integer x = 4681
integer y = 40
end type

event pb_save::clicked;call super::clicked;//int li_cnt1, li_cnt2, ll_count

//===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//wf_update2(dw_1,dw_2, "Y")


end event

type dw_1 from w_inheritance2`dw_1 within w_codemst_m02
integer x = 27
integer y = 428
integer width = 1719
integer height = 1944
string dataobject = "d_codemst_m02_01"
boolean setfocusdw = true
end type

event dw_1::clicked;call super::clicked;if row = 0 then return

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::getfocus;call super::getfocus;GS_Filter	= ""


end event

event dw_1::updatestart;call super::updatestart;Long		ll_rcnt, ll_row
dwitemstatus	 ldwstatus

ll_rcnt = this.rowcount()

do while ll_row <= ll_rcnt        
	ll_row = this.getnextmodified(ll_row, Primary!)        
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		choose case ldwstatus
			case NewModified!, DataModified!
				Choose Case ldwstatus 
					Case NewModified!
						this.setItem(ll_row, 'input_user', gs_userid)
						this.setItem(ll_row, 'input_date', gf_today2s())
					Case DataModified!
						this.setItem(ll_row, 'update_user', gs_userid)
						this.setItem(ll_row, 'update_date', gf_today2s())
				End CHoose
		end choose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event dw_1::we_esscheckbyupdate;call super::we_esscheckbyupdate;Long		ll_rcnt, ll_row
dwitemstatus	 ldwstatus
string	ls_temp

ll_rcnt = this.rowcount()

do while ll_row <= ll_rcnt        
	ll_row = this.getnextmodified(ll_row, Primary!)        
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		choose case ldwstatus
			case NewModified!, DataModified!
				ls_temp	= this.getitemstring(ll_row, 'mast_cd')
				if gf_null_chk(ls_temp) = true then
					messagebox("확인", "마스터 코드를 입력하세요.")
					return -1
				end if
				
				if LenA(ls_temp) <> 4 then
					messagebox("확인", "마스터 코드는 4자리입니다.")
					return -1
				end if
				
				ls_temp	= this.getitemstring(ll_row, 'mast_nm')
				if gf_null_chk(ls_temp) = true then
					messagebox("확인", "마스터 명을 입력하세요.")
					return -1
				end if
				Choose Case ldwstatus 
					Case NewModified!
					Case DataModified!
				End CHoose
		end choose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop

return 1
end event

event dw_1::insertrowend;call super::insertrowend;This.SetItem(row, 'detl_cd', 'ROOT')
This.SetItem(row, 'sort_order', 0)
This.SetItem(row, 'use_yn', 'Y')

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;if currentrow = 0 then return
String		ls_mast_cd
Long		ll_ret, ll_row, ll_rtn

ll_rtn = wf_uptmodifycheckdw(dw_2)

dw_1.AcceptText()

ls_mast_cd = dw_1.GetItemString(currentrow, 'mast_cd')

If gf_null_chk(ls_mast_cd) = true Then
	dw_2.Reset()
	Return
End If

ll_row	= currentrow
dw_2.setredraw(false)
dw_2.post setredraw(true)
ll_ret	= dw_2.Retrieve(ls_mast_cd)

Choose Case ll_ret
	Case is > 0
		If ll_row > 0 Then dw_2.Event RowFocusChanged(1)
	Case 0
	Case is < 0
		MessageBox("Error", "Error")
End Choose
end event

event dw_1::deleterowstart;call super::deleterowstart;string 	ls_msg

if dw_2.rowcount() <> 0 then
	ls_msg	= "상세 내역이 존재합니다."
	messagebox("확인",ls_msg)
	return -1
end if

return AncestorReturnValue
end event

event dw_1::itemchanged;call super::itemchanged;IF row = 0 THEN return
Long 		i, ll_cnt	
	
Choose Case dwo.name
	Case 'mast_cd'
		ll_cnt = dw_2.rowcount()
		FOR i = 1 TO ll_cnt
			dw_2.setItem(i, 'mast_cd', String(data))
		NEXT
	Case 'mast_nm'
		ll_cnt = dw_2.rowcount()
		FOR i = 1 TO ll_cnt
			dw_2.setItem(i, 'mast_nm', String(data))
		NEXT
End CHoose
end event

type st_title from w_inheritance2`st_title within w_codemst_m02
integer x = 32
integer y = 20
integer width = 1152
integer height = 140
string text = "공통코드 관리"
end type

type st_tips from w_inheritance2`st_tips within w_codemst_m02
integer x = 5175
integer y = 316
end type

type pb_compute from w_inheritance2`pb_compute within w_codemst_m02
boolean visible = false
integer x = 5175
integer y = 480
integer taborder = 90
end type

type pb_print_part from w_inheritance2`pb_print_part within w_codemst_m02
boolean visible = false
integer x = 5595
integer y = 480
end type

type pb_close from w_inheritance2`pb_close within w_codemst_m02
integer x = 4873
integer y = 40
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance2`pb_print within w_codemst_m02
boolean visible = false
integer x = 5806
integer y = 472
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 은행코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance2`pb_cancel within w_codemst_m02
boolean visible = false
integer x = 5381
integer y = 480
integer taborder = 120
end type

type pb_delete from w_inheritance2`pb_delete within w_codemst_m02
integer x = 4489
integer y = 40
integer taborder = 130
end type

type pb_insert from w_inheritance2`pb_insert within w_codemst_m02
integer x = 4297
integer y = 40
integer taborder = 150
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_codemst_m02
integer x = 4105
integer y = 40
integer taborder = 140
end type

type gb_3 from w_inheritance2`gb_3 within w_codemst_m02
boolean visible = false
integer x = 5810
integer y = 600
integer width = 101
integer height = 100
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance2`gb_2 within w_codemst_m02
integer x = 27
integer width = 5079
integer height = 188
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance2`gb_1 within w_codemst_m02
integer x = 4091
integer y = 0
integer width = 1001
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance2`dw_2 within w_codemst_m02
integer x = 1801
integer y = 428
integer width = 3305
integer height = 1944
integer taborder = 60
string dataobject = "d_codemst_m02_02"
boolean hscrollbar = true
boolean setfocusdw = true
end type

event dw_2::clicked;call super::clicked;if row = 0 then return

is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_type, acct_name
long   ll_find

ls_type   = this.object.type[row]
sle_value.text = ls_type

ll_find = dw_1.find( "type = '" + ls_type + "' ", 1, dw_1.rowcount() )
if ll_find > 1 then
	dw_1.scrolltorow( ll_find )
end if

end event

event dw_2::updatestart;call super::updatestart;String	ls_mast_cd, ls_mast_nm, ls_detl_cd
Long		ll_rcnt, ll_row, ll_nowseq = 0
Long		ll_mastrow

dwitemstatus	 ldwstatus

ll_mastrow		= dw_1.getrow()
ll_rcnt			= this.rowcount()

Do While ll_row <= ll_rcnt
	ll_row = this.getnextmodified(ll_row, Primary!)
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		Choose Case ldwstatus
			case NewModified!, DataModified!
				ls_mast_cd = dw_1.getItemString(ll_mastrow, 'mast_cd')
				ls_mast_nm	= dw_1.getItemString(ll_mastrow, 'mast_nm')
				
			choose case ldwstatus
				Case NewModified!
					This.setItem(ll_row, 'mast_cd',	ls_mast_cd)
					This.setItem(ll_row, 'mast_nm',	ls_mast_nm)
					this.setItem(ll_row, 'input_user', gs_userid)
					this.setItem(ll_row, 'input_date', gf_today2s())
				Case DataModified!
					this.setItem(ll_row, 'update_user', gs_userid)
					this.setItem(ll_row, 'update_date', gf_today2s())
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event dw_2::we_esscheckbyupdate;call super::we_esscheckbyupdate;long 		NbrRows, ll_row = 0, count = 0
Long		ll_rowcnt, ll_r, ll_mstrow, ll_mstcnt
String	ls_temp, ls_busi_sumy
String	ls_apr_no
DWItemStatus		ldwstate

ll_mstcnt	= dw_1.rowcount()
ll_mstrow	= dw_1.getrow()

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		If ll_mstcnt < 1 Then
			Messagebox('Check', '마스터 항목이 없습니다.')
			Return -1
		End If
		
		ls_temp = dw_1.getItemString(ll_mstrow, 'mast_cd')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "마스터 코드가 없습니다. ")
			Return -1
		End IF
		
		ls_temp	= this.getitemstring(ll_row, 'detl_cd')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "상세 코드를 입력하세요.")
			return -1
		end if
		
//		if len(ls_temp) <> 3 then
//			messagebox("확인", "상세 코드는 3자리입니다.")
//			return -1
//		end if		
//		
		ls_temp = this.getItemString(ll_row, 'detl_nm')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "중분류명이 없습니다. ")
			Return -1
		End IF
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

event dw_2::insertrowstart;call super::insertrowstart;String		ls_mast_cd, ls_mast_name
dw_1.AcceptText()

IF dw_1.rowcount() = 0 THEN
	messagebox("확인", "마스터 코드에 데이터가 없습니다. ")
	return -1
END IF

ls_mast_cd = dw_1.getItemString(dw_1.getRow(), 'mast_cd' )
IF gf_null_chk(ls_mast_cd) = true THEN 
	messagebox("확인", "마스터 코드를 입력하지 않았습니다.")
	return -1
END IF

return 1
end event

event dw_2::insertrowend;call super::insertrowend;This.SetItem(row, 'use_yn', 'Y')
end event

type st_4 from statictext within w_codemst_m02
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_codemst_m02
integer x = 270
integer y = 292
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_codemst_m02
integer x = 270
integer y = 292
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

type st_6 from statictext within w_codemst_m02
integer x = 741
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

type sle_value from singlelineedit within w_codemst_m02
integer x = 1230
integer y = 296
integer width = 539
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

type cbx_op from checkbox within w_codemst_m02
integer x = 1783
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

type cb_4 from commandbutton within w_codemst_m02
integer x = 1989
integer y = 296
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

event clicked;datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

integer    li_ret
string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_6 from commandbutton within w_codemst_m02
integer x = 2153
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
string text = "해지"
end type

event clicked;DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_7 from commandbutton within w_codemst_m02
integer x = 2318
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

type cb_8 from commandbutton within w_codemst_m02
integer x = 2482
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

type st_vertical from u_splitbar_vertical within w_codemst_m02
integer x = 1765
integer y = 428
integer height = 1944
end type

type ddlb_op from dropdownlistbox within w_codemst_m02
integer x = 914
integer y = 292
integer width = 306
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type st_1 from statictext within w_codemst_m02
integer x = 1230
integer y = 124
integer width = 1998
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 134217741
long backcolor = 67108864
string text = "※ 마스터 코드의 첫 자리는 공통업무로 구분해 등록하세요."
boolean focusrectangle = false
end type

