$PBExportHeader$w_cdcalc_pub_m.srw
$PBExportComments$생산계산식관리(도장,절곡)
forward
global type w_cdcalc_pub_m from w_inheritance
end type
type st_12 from statictext within w_cdcalc_pub_m
end type
type ddlb_col from dropdownlistbox within w_cdcalc_pub_m
end type
type st_13 from statictext within w_cdcalc_pub_m
end type
type ddlb_2 from dropdownlistbox within w_cdcalc_pub_m
end type
type sle_value from singlelineedit within w_cdcalc_pub_m
end type
type cb_filteron from commandbutton within w_cdcalc_pub_m
end type
type cb_filteroff from commandbutton within w_cdcalc_pub_m
end type
type cb_11 from commandbutton within w_cdcalc_pub_m
end type
type cb_12 from commandbutton within w_cdcalc_pub_m
end type
type dw_3 from datawindow within w_cdcalc_pub_m
end type
type st_1 from statictext within w_cdcalc_pub_m
end type
type cbx_edit from checkbox within w_cdcalc_pub_m
end type
type pb_1 from picturebutton within w_cdcalc_pub_m
end type
end forward

global type w_cdcalc_pub_m from w_inheritance
integer x = 370
integer y = 436
integer width = 4224
integer height = 2240
string title = "계산식 관리(도장,절곡)(w_cdcalc_pub_m)"
boolean resizable = false
st_12 st_12
ddlb_col ddlb_col
st_13 st_13
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
dw_3 dw_3
st_1 st_1
cbx_edit cbx_edit
pb_1 pb_1
end type
global w_cdcalc_pub_m w_cdcalc_pub_m

type variables
st_print        i_print
datawindowchild idwc_wc, idwc_calc

end variables

forward prototypes
public subroutine wf_recalc (long arg_row)
public subroutine wf_calc ()
public subroutine wf_calc2 ()
end prototypes

public subroutine wf_recalc (long arg_row);
end subroutine

public subroutine wf_calc ();
end subroutine

public subroutine wf_calc2 ();
end subroutine

on w_cdcalc_pub_m.create
int iCurrent
call super::create
this.st_12=create st_12
this.ddlb_col=create ddlb_col
this.st_13=create st_13
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.dw_3=create dw_3
this.st_1=create st_1
this.cbx_edit=create cbx_edit
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_12
this.Control[iCurrent+2]=this.ddlb_col
this.Control[iCurrent+3]=this.st_13
this.Control[iCurrent+4]=this.ddlb_2
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_filteron
this.Control[iCurrent+7]=this.cb_filteroff
this.Control[iCurrent+8]=this.cb_11
this.Control[iCurrent+9]=this.cb_12
this.Control[iCurrent+10]=this.dw_3
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.cbx_edit
this.Control[iCurrent+13]=this.pb_1
end on

on w_cdcalc_pub_m.destroy
call super::destroy
destroy(this.st_12)
destroy(this.ddlb_col)
destroy(this.st_13)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.cbx_edit)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)

dw_3.insertrow(0)
dw_3.getchild('wc_no',idwc_wc)
dw_3.getchild('calc',idwc_calc)

idwc_wc.insertrow(1)
idwc_wc.setitem(1,"work_no","%")
idwc_wc.setitem(1,"work_name","전체")
idwc_wc.accepttext()

ddlb_2.text     = "LIKE"
ddlb_col.text   = "품목"
sle_value.text  = ""

cbx_edit.checked = false
cbx_edit.triggerevent( clicked! )

pb_retrieve.default = true
pb_retrieve.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 91
gb_2.height = this.height - 360

dw_1.width  = this.width  - 155
dw_1.height = this.height - 544

end event

type pb_save from w_inheritance`pb_save within w_cdcalc_pub_m
integer x = 3762
integer y = 56
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1, 'Y')

cbx_edit.checked = false
cbx_edit.triggerevent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_cdcalc_pub_m
integer y = 408
integer width = 4069
integer height = 1696
string dataobject = "d_cdcalc_pub_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

this.scrolltorow(ll_row)


end event

event dw_1::clicked;call super::clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "wc_no"
		ls_col  = "작업장"
		ls_text = this.object.wc_no[row]
	case "item_no"
		ls_col  = "품목"
		ls_text = this.object.item_no[row]
	case "item_name"
		ls_col  = "품명"
		ls_text = this.object.item_name[row]
	case "qa"
		ls_col  = "규격"
		ls_text = this.object.qa[row]
	case "qa1"
		ls_col  = "QA1"
		ls_text = this.object.qa1[row]
	case "qa2"
		ls_col  = "QA2"
		ls_text = this.object.qa2[row]
	case "qa3"
		ls_col  = "QA3"
		ls_text = this.object.qa3[row]
	case "qa4"
		ls_col  = "QA4"
		ls_text = this.object.qa4[row]
	case "calc_org"
		ls_col  = "원본"
		ls_text = string(this.object.calc_org[row])
	case "calc"
		ls_col  = "계산식(TYPE)"
		ls_text = string(this.object.calc[row])
	case "formula"
		ls_col  = "공식"
		ls_text = string(this.object.formula[row])
end choose

choose case ls_col
	case "작업장"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

event dw_1::editchanged;call super::editchanged;//
string ls_formula

choose case dwo.name
	case "calc"
		idwc_calc.accepttext()
		
		ls_formula = idwc_calc.getitemstring(idwc_calc.getrow(), "formula")
		this.object.formula[row] = ls_formula
		
end choose
end event

type dw_2 from w_inheritance`dw_2 within w_cdcalc_pub_m
boolean visible = false
integer x = 1056
integer y = 52
integer width = 87
integer height = 112
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_cdcalc_pub_m
integer x = 69
integer width = 1403
string text = "계산식 관리(도장,절곡)"
end type

type st_tips from w_inheritance`st_tips within w_cdcalc_pub_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcalc_pub_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcalc_pub_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcalc_pub_m
integer x = 3954
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcalc_pub_m
boolean visible = false
integer x = 2025
integer y = 64
integer taborder = 140
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdcalc_pub_m
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_cdcalc_pub_m
integer x = 3570
integer y = 56
integer taborder = 160
end type

event pb_delete::clicked;//
int  li_seq, li_cnt
long ll_row 

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return	

dw_1.deleterow(ll_row)
if wf_update1(dw_1,"Y") = true then
	dw_1.retrieve()
end if

end event

type pb_insert from w_inheritance`pb_insert within w_cdcalc_pub_m
integer x = 3378
integer y = 56
integer taborder = 180
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;//
gs_where2 lstr_where
long ll_row, ll_cnt, ll_count

pb_retrieve.triggerevent(clicked!)

cbx_edit.checked = true
dw_1.object.work_no.protect = false
dw_1.object.calc.protect    = false

ll_count = dw_1.rowcount()

OpenWithParm(w_whitemselectmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)
	dw_1.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_1.scrolltorow(ll_count + 1)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcalc_pub_m
integer x = 2976
integer y = 56
integer taborder = 170
end type

event pb_retrieve::clicked;//
string ls_workno, ls_wcname

ls_workno    = idwc_wc.getitemstring(idwc_wc.getrow(), "work_no")
ls_wcname    = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_workno = ""      then ls_workno = "%"
if ls_wcname = "전체"  then ls_wcname = ls_wcname + "%"  //작업장명

if ls_workno = "%" or RightA(ls_workno,2) = "00" then
	cbx_edit.enabled = false
else
	cbx_edit.enabled = true
end if
dw_1.retrieve( ls_workno )

dw_1.object.work_no.protect = true
dw_1.object.calc.protect    = true

end event

type gb_3 from w_inheritance`gb_3 within w_cdcalc_pub_m
integer x = 2235
integer y = 16
integer width = 695
integer height = 204
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "작업장"
end type

type gb_2 from w_inheritance`gb_2 within w_cdcalc_pub_m
integer x = 37
integer y = 252
integer width = 4133
integer height = 1880
end type

type gb_1 from w_inheritance`gb_1 within w_cdcalc_pub_m
integer x = 2944
integer y = 16
integer width = 1225
end type

type st_12 from statictext within w_cdcalc_pub_m
integer x = 82
integer y = 320
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

type ddlb_col from dropdownlistbox within w_cdcalc_pub_m
integer x = 261
integer y = 304
integer width = 402
integer height = 532
integer taborder = 10
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
string item[] = {"작업장","품목","품명","규격","QA1","QA2","QA3","QA4","원본","계산식(TYPE)","공식"}
end type

type st_13 from statictext within w_cdcalc_pub_m
integer x = 681
integer y = 320
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

type ddlb_2 from dropdownlistbox within w_cdcalc_pub_m
integer x = 850
integer y = 304
integer width = 279
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_cdcalc_pub_m
integer x = 1157
integer y = 308
integer width = 658
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdcalc_pub_m
integer x = 1829
integer y = 304
integer width = 238
integer height = 84
integer taborder = 40
boolean bringtotop = true
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
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "작업장"
			ls_col  = "wc_no "
		case "품목"
			ls_col  = "item_no "
		case "품명"
			ls_col  = "item_name "
		case "규격"
			ls_col  = "qa "
		case "QA1"
			ls_col  = "qa1 "
		case "QA2"
			ls_col  = "qa2 "
		case "QA3"
			ls_col  = "qa3 "
		case "QA4"
			ls_col  = "qa4 "
		case "원본"
			ls_col  = "calc_org "
		case "계산식(TYPE)"
			ls_col  = "calc "
		case "공식"
			ls_col  = "formula "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + "datetime('" + trim(sle_value.text) + "') "
		elseif ls_col = "calc " then
			ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
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

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)
dw_1.triggerevent(rowfocuschanged!)

end event

type cb_filteroff from commandbutton within w_cdcalc_pub_m
integer x = 2066
integer y = 304
integer width = 238
integer height = 84
integer taborder = 50
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "품목"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_11 from commandbutton within w_cdcalc_pub_m
integer x = 2304
integer y = 304
integer width = 238
integer height = 84
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
	case "작업장"
		ls_col  = "wc_no "
	case "품목"
		ls_col  = "item_no "
	case "품명"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "QA1"
		ls_col  = "qa1 "
	case "QA2"
		ls_col  = "qa2 "
	case "QA3"
		ls_col  = "qa3 "
	case "QA4"
		ls_col  = "qa4 "
	case "원본"
		ls_col  = "calc_org "
	case "계산식(TYPE)"
		ls_col  = "calc "
	case "공식"
		ls_col  = "formula "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_cdcalc_pub_m
integer x = 2542
integer y = 304
integer width = 238
integer height = 84
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
	case "작업장"
		ls_col  = "wc_no "
	case "품목"
		ls_col  = "item_no "
	case "품명"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "QA1"
		ls_col  = "qa1 "
	case "QA2"
		ls_col  = "qa2 "
	case "QA3"
		ls_col  = "qa3 "
	case "QA4"
		ls_col  = "qa4 "
	case "원본"
		ls_col  = "calc_org "
	case "계산식(TYPE)"
		ls_col  = "calc "
	case "공식"
		ls_col  = "formula "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type dw_3 from datawindow within w_cdcalc_pub_m
integer x = 2281
integer y = 96
integer width = 613
integer height = 80
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_whwc_s"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_cdcalc_pub_m
integer x = 50
integer y = 228
integer width = 2565
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "TYPE 등록은 관리자만(codemst, UF_GetItemCalc_PUB, UF_GetItemCalc_PUB2)  수정"
boolean focusrectangle = false
end type

type cbx_edit from checkbox within w_cdcalc_pub_m
integer x = 2811
integer y = 320
integer width = 407
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "편집모드"
end type

event clicked;//
if this.checked = true then	// 편집모드
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
	
	dw_1.object.work_no.protect = false
	dw_1.object.calc.protect    = false
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	dw_1.object.work_no.protect = true
	dw_1.object.calc.protect    = true
end if

end event

type pb_1 from picturebutton within w_cdcalc_pub_m
event mousemove pbm_mousemove
integer x = 3173
integer y = 56
integer width = 187
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_dest

dw_dest = dw_1		

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

