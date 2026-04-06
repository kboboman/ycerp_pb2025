$PBExportHeader$w_orsalelimitexceed.srw
$PBExportComments$한도초과금액관리
forward
global type w_orsalelimitexceed from w_inheritance2
end type
type st_4 from statictext within w_orsalelimitexceed
end type
type ddlb_fld from dropdownlistbox within w_orsalelimitexceed
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalelimitexceed
end type
type st_6 from statictext within w_orsalelimitexceed
end type
type sle_value from singlelineedit within w_orsalelimitexceed
end type
type cbx_op from checkbox within w_orsalelimitexceed
end type
type cb_4 from commandbutton within w_orsalelimitexceed
end type
type cb_filteroff from commandbutton within w_orsalelimitexceed
end type
type cb_7 from commandbutton within w_orsalelimitexceed
end type
type cb_8 from commandbutton within w_orsalelimitexceed
end type
type st_vertical from u_splitbar_vertical within w_orsalelimitexceed
end type
type ddlb_op from dropdownlistbox within w_orsalelimitexceed
end type
type dw_cond from datawindow within w_orsalelimitexceed
end type
type st_1 from statictext within w_orsalelimitexceed
end type
type dw_m from u_datawindow within w_orsalelimitexceed
end type
type cb_upload from commandbutton within w_orsalelimitexceed
end type
type dw_upload from datawindow within w_orsalelimitexceed
end type
type st_2 from statictext within w_orsalelimitexceed
end type
end forward

global type w_orsalelimitexceed from w_inheritance2
integer x = 320
integer y = 552
integer width = 6464
integer height = 6148
string title = "한도승인금액(임시)관리(w_orsalelimitexceed)"
long backcolor = 79416533
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cbx_op cbx_op
cb_4 cb_4
cb_filteroff cb_filteroff
cb_7 cb_7
cb_8 cb_8
st_vertical st_vertical
ddlb_op ddlb_op
dw_cond dw_cond
st_1 st_1
dw_m dw_m
cb_upload cb_upload
dw_upload dw_upload
st_2 st_2
end type
global w_orsalelimitexceed w_orsalelimitexceed

type variables
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

long    idw_w, idw_h
long    ih_curteam
integer ii_chk = 0
string  is_chk = 'N'
TreeViewitem itv_team

string	is_custconst


end variables

forward prototypes
public subroutine wf_filter ()
end prototypes

public subroutine wf_filter ();
end subroutine

on w_orsalelimitexceed.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_4=create cb_4
this.cb_filteroff=create cb_filteroff
this.cb_7=create cb_7
this.cb_8=create cb_8
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.dw_cond=create dw_cond
this.st_1=create st_1
this.dw_m=create dw_m
this.cb_upload=create cb_upload
this.dw_upload=create dw_upload
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cbx_op
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_filteroff
this.Control[iCurrent+9]=this.cb_7
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.dw_cond
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.dw_m
this.Control[iCurrent+16]=this.cb_upload
this.Control[iCurrent+17]=this.dw_upload
this.Control[iCurrent+18]=this.st_2
end on

on w_orsalelimitexceed.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_4)
destroy(this.cb_filteroff)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.st_vertical)
destroy(this.ddlb_op)
destroy(this.dw_cond)
destroy(this.st_1)
destroy(this.dw_m)
destroy(this.cb_upload)
destroy(this.dw_upload)
destroy(this.st_2)
end on

event resize;call super::resize;dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.width  = newwidth  - dw_2.x - dw_m.x
dw_2.height = newheight - dw_2.y - dw_m.height + 460

idw_w       = dw_2.width
idw_h       = dw_2.height

end event

event we_postopen;call super::we_postopen;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_rightobject(dw_m)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

datawindowchild ldwc_cust_no
dw_cond.insertrow(0)
dw_cond.getchild("cust_no", ldwc_cust_no)
GS_DS_WHCUSTRET.ShareData(ldwc_cust_no)

dw_m.insertrow(0)

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_m.settransobject(sqlca)

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
ll_rtn = wf_update_array({dw_m})
If ll_rtn = 1 Then 
	Messagebox('Check', '저장이 정상적으로 진행되었습니다')
	this.postevent( 'we_retrieve')
else
	rollback using sqlca;
end if

Return 1

end event

event we_insert;string	ls_cust_no, ls_cust_name, ls_msg
dec		ldc_credit_limit	

if dw_cond.accepttext( ) = -1 then return -1

ls_cust_no		= dw_cond.getitemstring(1, 'cust_no')
ls_cust_name	= dw_cond.describe("Evaluate('LookupDisplay(cust_no)',1)") 

if gf_null_chk(ls_cust_no) then
	messagebox("주의","거래처를 선택하세요.")
	return -1
end if

ls_msg	= ls_cust_name + "(" + ls_cust_no + ")" + "의~r~n수주 한도를 추가하겠습니까?" 

if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return -1
select 
	credit_limit
into
	:ldc_credit_limit
from 
	customer 
where
	cust_no = :ls_cust_no
using sqlca;	


dw_m.reset()
dw_m.insertrow(0)
dw_m.setitem(1, 'cust_no', ls_cust_no)
dw_m.setitem(1, 'cust_name', ls_cust_name)
dw_m.setitem(1, 'credit_limit', ldc_credit_limit)


dw_2.reset()
dw_2.Retrieve(ls_cust_no)

return 0
end event

type pb_saveas from w_inheritance2`pb_saveas within w_orsalelimitexceed
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

type pb_save from w_inheritance2`pb_save within w_orsalelimitexceed
integer x = 4681
integer y = 40
end type

event pb_save::clicked;call super::clicked;//int li_cnt1, li_cnt2, ll_count

//===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//wf_update2(dw_1,dw_2, "Y")


end event

type dw_1 from w_inheritance2`dw_1 within w_orsalelimitexceed
integer x = 27
integer y = 428
integer width = 1417
integer height = 1944
string dataobject = "d_orsalelimitexceed_01"
boolean setfocusdw = true
end type

event dw_1::clicked;call super::clicked;if row = 0 then return

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::getfocus;call super::getfocus;GS_Filter	= ""


end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;if currentrow = 0 then return
String	ls_cust_cd
Long		ll_ret, ll_rtn

ls_cust_cd = dw_1.GetItemString(currentrow, 'cust_no')

If gf_null_chk(ls_cust_cd) = true Then
	dw_2.Reset()
	Return
End If

dw_2.setredraw(false)
dw_2.post setredraw(true)
ll_ret	= dw_2.Retrieve(ls_cust_cd)

Choose Case ll_ret
	Case is > 0
		If currentrow > 0 Then dw_2.Event clicked(0,0,1,dw_2.object.cust_no)
	Case 0
	Case is < 0
		MessageBox("Error", "Error")
End Choose
end event

type st_title from w_inheritance2`st_title within w_orsalelimitexceed
integer x = 32
integer y = 20
integer width = 1152
integer height = 140
string text = "한도승인금액관리"
end type

type st_tips from w_inheritance2`st_tips within w_orsalelimitexceed
integer x = 5175
integer y = 316
end type

type pb_compute from w_inheritance2`pb_compute within w_orsalelimitexceed
boolean visible = false
integer x = 5175
integer y = 480
integer taborder = 90
end type

type pb_print_part from w_inheritance2`pb_print_part within w_orsalelimitexceed
boolean visible = false
integer x = 5595
integer y = 480
end type

type pb_close from w_inheritance2`pb_close within w_orsalelimitexceed
integer x = 4873
integer y = 40
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance2`pb_print within w_orsalelimitexceed
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

type pb_cancel from w_inheritance2`pb_cancel within w_orsalelimitexceed
boolean visible = false
integer x = 5381
integer y = 480
integer taborder = 120
end type

type pb_delete from w_inheritance2`pb_delete within w_orsalelimitexceed
boolean visible = false
integer x = 5189
integer y = 848
integer taborder = 130
end type

type pb_insert from w_inheritance2`pb_insert within w_orsalelimitexceed
integer x = 4489
integer y = 40
integer taborder = 150
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_orsalelimitexceed
integer x = 4297
integer y = 40
integer taborder = 140
end type

type gb_3 from w_inheritance2`gb_3 within w_orsalelimitexceed
integer x = 1239
integer y = 0
integer width = 3013
integer height = 204
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance2`gb_2 within w_orsalelimitexceed
integer x = 27
integer width = 5079
integer height = 188
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance2`gb_1 within w_orsalelimitexceed
integer x = 4270
integer y = 0
integer width = 823
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance2`dw_2 within w_orsalelimitexceed
integer x = 1499
integer y = 1016
integer width = 3602
integer height = 1356
integer taborder = 60
string dataobject = "d_orsalelimitexceed_02"
boolean hscrollbar = true
boolean setfocusdw = true
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;//if currentrow = 0 then return -1
//
//string	ls_cust_cd, ls_dt
//datetime	ldt_dt
//
//ls_cust_cd	= this.GetItemString(currentrow, 'cust_no')
//ls_dt			= this.GetItemString(currentrow, 'input_date')
//
//dw_m.retrieve(ls_cust_cd, ls_dt)
end event

event dw_2::clicked;call super::clicked;if row = 0 then return

string	ls_cust_cd, ls_dt
datetime	ldt_dt

ls_cust_cd	= this.GetItemString(row, 'cust_no')
ls_dt			= this.GetItemString(row, 'input_date')

dw_m.retrieve(ls_cust_cd, ls_dt)
end event

type st_4 from statictext within w_orsalelimitexceed
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

type ddlb_fld from dropdownlistbox within w_orsalelimitexceed
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

type ddlb_dwtitles from dropdownlistbox within w_orsalelimitexceed
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

type st_6 from statictext within w_orsalelimitexceed
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

type sle_value from singlelineedit within w_orsalelimitexceed
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

type cbx_op from checkbox within w_orsalelimitexceed
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

type cb_4 from commandbutton within w_orsalelimitexceed
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

type cb_filteroff from commandbutton within w_orsalelimitexceed
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

type cb_7 from commandbutton within w_orsalelimitexceed
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

type cb_8 from commandbutton within w_orsalelimitexceed
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

type st_vertical from u_splitbar_vertical within w_orsalelimitexceed
integer x = 1463
integer y = 428
integer height = 1944
end type

type ddlb_op from dropdownlistbox within w_orsalelimitexceed
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

type dw_cond from datawindow within w_orsalelimitexceed
integer x = 1477
integer y = 60
integer width = 946
integer height = 100
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_orcustomer_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row = 0 then return -1

choose case dwo.name
	case 'cust_no'
		dw_m.reset()
		dw_m.insertrow(0)
end choose


end event

type st_1 from statictext within w_orsalelimitexceed
integer x = 1275
integer y = 84
integer width = 206
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
string text = "거래처"
boolean focusrectangle = false
end type

type dw_m from u_datawindow within w_orsalelimitexceed
integer x = 1499
integer y = 428
integer width = 3602
integer height = 564
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_orsalelimitexceed_03"
end type

event updatestart;call super::updatestart;String	ls_mast_cd, ls_mast_nm, ls_detl_cd
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
			case NewModified!
				this.setItem(ll_row, 'input_id', gs_userid)
				this.setItem(ll_row, 'input_date', string(gf_today(), 'yyyymmddhhmmss'))
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event we_esscheckbyupdate;call super::we_esscheckbyupdate;long 		NbrRows, ll_row = 0, ll_cnt
String	ls_temp, ls_cust_no, ls_start_date, ls_end_date, ls_dt
dec		ldc_temp

DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		//거채처 코드
		ls_cust_no	= this.getitemstring(ll_row, 'cust_no')
		if gf_null_chk(ls_cust_no) = true then
			messagebox("확인", "추가 버튼을 눌러~r~n거래처를 선택하세요.")
			return -1
		end if		
		
		//PK 확인
		ls_dt	= this.getitemstring(ll_row,'input_date')
		if gf_null_chk(ls_dt) = true then
			ls_dt	= 'ZZZZZZZZZZZZZZZZZZZZ'
		end if
		//시작일 확인
		ls_start_date	= this.getitemstring(ll_row, 'start_date')
		if gf_null_chk(ls_start_date) = true then
			messagebox("확인", "시작일을 입력하세요.")
			return -1
		end if
		if gf_chk_stringdate(ls_start_date) = 0 then 
			messagebox("확인", "입력된 시작일은~r~n정상적인 날짜가 아닙니다.")			
			return -1
		end if
		
		ll_cnt = 0
		select 
			count(*)
		into
			:ll_cnt
		from 
			orexceed
		where
			use_yn = 'Y'
		and			
			cust_no = :ls_cust_no
		and			
			convert(varchar(19), input_date, 20) <> :ls_dt
		and			
			(:ls_start_date between start_date and end_date)
		using sqlca;

		if ll_cnt > 0 then
			Messagebox("확인", "시작일이 기 등록된 날짜와 중복됩니다.")
			Return -1
		end if
			
		//종료일 확인
		ls_end_date = this.getitemstring(ll_row, 'end_date')
		IF gf_null_chk(ls_end_date) = true Then
			Messagebox("확인", "종료일을 입력하세요. ")
			Return -1
		End IF
		
		if gf_chk_stringdate(ls_end_date) = 0 then 
			messagebox("확인", "입력된 종료일은~r~n정상적인 날짜가 아닙니다.")			
			return -1
		end if		
		
		ll_cnt = 0
		select 
			count(*)
		into
			:ll_cnt
		from 
			orexceed
		where
			use_yn = 'Y'
		and			
			cust_no = :ls_cust_no
		and
			convert(varchar(19), input_date, 20) <> :ls_dt
		and			
			(:ls_end_date between start_date and end_date)
		using sqlca;

		if ll_cnt > 0 then
			Messagebox("확인", "종료일이 기 등록된 날짜와 중복됩니다.")
			Return -1
		end if
		
		//등록 범위넘어서 경우 체크
		ll_cnt = 0
		select 
			count(*)
		into
			:ll_cnt
		from 
			orexceed
		where
			use_yn = 'Y'
		and			
			cust_no = :ls_cust_no
		and
			convert(varchar(19), input_date, 20) <> :ls_dt
		and			
			((start_date between :ls_start_date and :ls_end_date) or (end_date between :ls_start_date and :ls_end_date))
		using sqlca;

		if ll_cnt > 0 then
			Messagebox("확인", "기준일이  기 등록된 날짜와 겹칩니다.")
			Return -1
		end if
		
		
		//종료일은 시작일 보다 크거나 같아야한다.
		if ls_start_date > ls_end_date then
			messagebox("확인", "종료일은 시작일보다~r~n크거나 같아야합니다.")			
			return -1
		end if		
		
		//한도 금액 확인
		ldc_temp = this.getitemdecimal(ll_row, 'limit_amt')
		IF ldc_temp <= 0 Then
			Messagebox("확인", "한도금액을 입력하세요. ")
			Return -1
		End IF
		
		
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

event itemchanged;call super::itemchanged;string	ls_start_date, ls_end_date
long 		ll_frow

if row = 0 then return

choose case dwo.name
	case 'use_yn'
		if data = 'Y' then
			ls_start_date	= this.getitemstring(row, 'start_date')
			ls_end_date		= this.getitemstring(row, 'end_date')
 
			//ll_frow = dw_2.Find( "use_yn = 'Y' start_date <= '" + ls_start_date + "' and '" + ls_start_date + "' <= end_date", 1, dw_2.RowCount())
//			//거채처 코드
//			ls_cust_no	= this.getitemstring(ll_row, 'cust_no')
//			if gf_null_chk(ls_cust_no) = true then
//				messagebox("확인", "추가 버튼을 눌러~r~n거래처를 선택하세요.")
//				return -1
//			end if		
//			
//			//PK 확인
//			ls_dt	= this.getitemstring(ll_row,'input_date')
//			if gf_null_chk(ls_dt) = true then
//				ls_dt	= 'ZZZZZZZZZZZZZZZZZZZZ'
//			end if
//			//시작일 확인
//			ls_start_date	= this.getitemstring(ll_row, 'start_date')
//			if gf_null_chk(ls_start_date) = true then
//				messagebox("확인", "시작일을 입력하세요.")
//				return -1
//			end if
//			if gf_chk_stringdate(ls_start_date) = 0 then 
//				messagebox("확인", "입력된 시작일은~r~n정상적인 날짜가 아닙니다.")			
//				return -1
//			end if
//			
//			ll_cnt = 0
//			select 
//				count(*)
//			into
//				:ll_cnt
//			from 
//				orexceed
//			where
//				use_yn = 'Y'
//			and			
//				cust_no = :ls_cust_no
//			and			
//				convert(varchar(19), input_date, 20) <> :ls_dt
//			and			
//				(:ls_start_date between start_date and end_date)
//			using sqlca;
//	
//			if ll_cnt > 0 then
//				Messagebox("확인", "시작일이 기 등록된 날짜와 중복됩니다.")
//				Return -1
//			end if
//				
//			//종료일 확인
//			ls_end_date = this.getitemstring(ll_row, 'end_date')
//			IF gf_null_chk(ls_end_date) = true Then
//				Messagebox("확인", "종료일을 입력하세요. ")
//				Return -1
//			End IF
//			
//			if gf_chk_stringdate(ls_end_date) = 0 then 
//				messagebox("확인", "입력된 종료일은~r~n정상적인 날짜가 아닙니다.")			
//				return -1
//			end if		
//			
//			ll_cnt = 0
//			select 
//				count(*)
//			into
//				:ll_cnt
//			from 
//				orexceed
//			where
//				use_yn = 'Y'
//			and			
//				cust_no = :ls_cust_no
//			and
//				convert(varchar(19), input_date, 20) <> :ls_dt
//			and			
//				(:ls_end_date between start_date and end_date)
//			using sqlca;
//	
//			if ll_cnt > 0 then
//				Messagebox("확인", "종료일이 기 등록된 날짜와 중복됩니다.")
//				Return -1
//			end if
//			
//			//등록 범위넘어서 경우 체크
//			ll_cnt = 0
//			select 
//				count(*)
//			into
//				:ll_cnt
//			from 
//				orexceed
//			where
//				use_yn = 'Y'
//			and			
//				cust_no = :ls_cust_no
//			and
//				convert(varchar(19), input_date, 20) <> :ls_dt
//			and			
//				((start_date between :ls_start_date and :ls_end_date) or (end_date between :ls_start_date and :ls_end_date))
//			using sqlca;
//	
//			if ll_cnt > 0 then
//				Messagebox("확인", "기준일이  기 등록된 날짜와 겹칩니다.")
//				Return -1
//			end if
//			
//			
//			//종료일은 시작일 보다 크거나 같아야한다.
//			if ls_start_date > ls_end_date then
//				messagebox("확인", "종료일은 시작일보다~r~n크거나 같아야합니다.")			
//				return -1
//			end if		
//			
//			//한도 금액 확인
//			ldc_temp = this.getitemdecimal(ll_row, 'limit_amt')
//			IF ldc_temp <= 0 Then
//				Messagebox("확인", "한도금액을 입력하세요. ")
//				Return -1
//			End IF
		
			
		end if
end choose
end event

type cb_upload from commandbutton within w_orsalelimitexceed
integer x = 4133
integer y = 276
integer width = 928
integer height = 116
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처 거래 한도액 일괄변경"
end type

event clicked;string ls_msg
ls_msg	= '거래처 거래 한도액을 일괄 변경하시겠습니까?'
if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return

//01.엑셀 upload
//변수선언
oleobject ole_excel,xlsub,xlApp, xlBook, xlSheet
integer	net , ll_value , ll_return , ll_error_cnt ,ll_error_cnt1
string	ls_file, ls_name, ls_txt_file, ls_cust_no, ls_acc_no 
dec		ld_credit_limit
long		ll_ins_row, ll_tot_Row , ll_tot_col , ll_row

//변수 초기화
ll_error_cnt	= 0
ll_error_cnt1	= 0

messagebox("확인","Excel파일은 '거래처코드/거래처명/최종한도'~r~n형식으로 구성하며 2번째 줄부터 입력됩니다.")
//저장할 경로와 파일 이름 가져오기
ll_value = getfilesavename("Excel파일을 선택하세요!", ls_file, ls_name, "xls" , "excel files (*.xls),*.xls*")
if ll_value = 1 then
	if not fileexists (ls_file ) then
		messagebox("확인","업로드 Excel 파일이 없습니다.!!")
		return
	end if
else
	return
end if
ls_txt_file= trim(ls_file)

//엑셀 OLE사용하기
xlApp = Create OLEObject 
ll_return = xlApp.ConnectToNewObject( "excel.application" ) 
if ll_return < 0 then
	MessageBox("엑셀 연결시 오류가 발생하였습니다..~r~n 컴퓨터에 엑셀이 설치되었는지 확인하세요..!",string(ll_return))
	SetPointer(Arrow!)
	return 
end if 
xlApp.Application.Visible = false 
xlApp.Workbooks.Open(ls_txt_file) 
xlBook = xlApp.Application.WorkBooks(1) 
xlSheet= xlBook.Worksheets(1)

//전체 row col count
ll_tot_Row = xlApp.ActiveSheet.UsedRange.Rows.Count		//업로드할 엑셀의 총 row
ll_tot_col = xlApp.ActiveSheet.UsedRange.Columns.Count	//업로드할 엑세의 총 column
For ll_row = 2 to ll_tot_row	//엑셀에 head가 존재하면 2부터 시작
	ls_cust_no = ''
	ls_cust_no = string(xlSheet.cells(ll_row,1).value)
	ld_credit_limit = 0
	ld_credit_limit = long(xlSheet.cells(ll_row,3).value)

	if trim(ls_cust_no) = '' or isnull(ls_cust_no) or LenA(trim(ls_cust_no)) <> 4 then
		xlApp.Application.Quit
		xlApp.DisConnectObject() 
		Destroy xlSheet
		Destroy xlBook
		Destroy xlApp
		messagebox('확인요청',string(ll_row) + '줄의 거래처코드는~r~n형식에 맞지 않습니다.')		
		return
	end if
	
	if ld_credit_limit <= 0 then 
		xlApp.Application.Quit
		xlApp.DisConnectObject() 
		Destroy xlSheet
		Destroy xlBook
		Destroy xlApp
		messagebox('확인요청',string(ll_row) + '줄의 한도액을 확인하세요.')
		return
	end if
	ll_ins_row	= dw_upload.insertrow(0)
	dw_upload.object.cust_no[ll_ins_row]		= ls_cust_no
	dw_upload.object.credit_limit[ll_ins_row]	= ld_credit_limit
Next

xlApp.Application.Quit
xlApp.DisConnectObject() 
Destroy xlSheet
Destroy xlBook
Destroy xlApp

//02.기존 자료 삭제 및 업데이트
//기존 자료 초기화
string	ls_sqlerrtext
SetPointer (HourGlass!)
update
	customer
set
	credit_limit	= 0
using sqlca;	

if sqlca.sqlcode = -1 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return
end if

//거래처 일괄변경
ll_tot_row	= dw_upload.rowcount()

if ll_ins_row <> ll_tot_row then
	rollback using sqlca;
	messagebox("오류","엑셀 업로드 자료 건수와 일력할 자료 건수가 틀립니다.")
	return 
end if

For ll_row = 1 to ll_tot_row	//엑셀에 head가 존재하면 2부터 시작
	ls_cust_no			= dw_upload.object.cust_no[ll_row]		
	ld_credit_limit	= dw_upload.object.credit_limit[ll_row]

	update
		customer
	set
		credit_limit	= :ld_credit_limit
	where
		cust_no			= :ls_cust_no
	using sqlca;	
	
	if sqlca.sqlcode = -1 then         
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("sql error", ls_sqlerrtext)
		return
	elseif sqlca.sqlcode = 100 then
		ls_sqlerrtext	= '거래처 코드(' + ls_cust_no + ')는 존재하지 않는 거래처입니다'
		rollback using sqlca;
		messagebox("sql error", ls_sqlerrtext)
		return
	end if
next	

commit using sqlca;
messagebox("확인", string(ll_tot_row) + '건의 거래처 거래 한도액을~r~n일괄 변경 적용 했습니다!!')
SetPointer(Arrow!)

end event

type dw_upload from datawindow within w_orsalelimitexceed
boolean visible = false
integer x = 1568
integer y = 1868
integer width = 1230
integer height = 508
integer taborder = 70
boolean bringtotop = true
string dataobject = "ds_credit_limit_upload"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_orsalelimitexceed
integer x = 3461
integer y = 684
integer width = 1623
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
long textcolor = 255
long backcolor = 134217750
string text = "※ 기간이 중복된 경우 기존건을 미사용으로 변경 후 등록하세요"
long bordercolor = 16777215
boolean focusrectangle = false
end type

