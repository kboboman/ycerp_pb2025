$PBExportHeader$w_cdcalc_pub_m.srw
$PBExportComments$생산계산식관리(도장,절곡)
forward
global type w_cdcalc_pub_m from w_inheritance
end type
type dw_3 from datawindow within w_cdcalc_pub_m
end type
type st_1 from statictext within w_cdcalc_pub_m
end type
type cbx_edit from checkbox within w_cdcalc_pub_m
end type
type pb_1 from picturebutton within w_cdcalc_pub_m
end type
type st_2 from statictext within w_cdcalc_pub_m
end type
type st_4 from statictext within w_cdcalc_pub_m
end type
type ddlb_fld from dropdownlistbox within w_cdcalc_pub_m
end type
type st_5 from statictext within w_cdcalc_pub_m
end type
type sle_value from singlelineedit within w_cdcalc_pub_m
end type
type cb_1 from commandbutton within w_cdcalc_pub_m
end type
type cb_2 from commandbutton within w_cdcalc_pub_m
end type
type cb_3 from commandbutton within w_cdcalc_pub_m
end type
type cb_5 from commandbutton within w_cdcalc_pub_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdcalc_pub_m
end type
type ddlb_op from dropdownlistbox within w_cdcalc_pub_m
end type
end forward

global type w_cdcalc_pub_m from w_inheritance
integer x = 370
integer y = 436
integer width = 4247
integer height = 2264
string title = "계산식 관리(도장,절곡)(w_cdcalc_pub_m)"
dw_3 dw_3
st_1 st_1
cbx_edit cbx_edit
pb_1 pb_1
st_2 st_2
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
ddlb_op ddlb_op
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
this.dw_3=create dw_3
this.st_1=create st_1
this.cbx_edit=create cbx_edit
this.pb_1=create pb_1
this.st_2=create st_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cbx_edit
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.ddlb_op
end on

on w_cdcalc_pub_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.cbx_edit)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	long ll_Y ; string ls_value, ls_val[]
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_1.Modify( ls_val[3] + ".Protect=1")
	next
else	
	cbx_edit.checked = true
	cbx_edit.triggerevent( clicked! )	
end if


dw_3.SetTransObject(SQLCA)

dw_3.insertrow(0)
dw_3.getchild('wc_no',idwc_wc)
dw_3.getchild('calc',idwc_calc)

idwc_wc.insertrow(1)
idwc_wc.setitem(1,"work_no","%")
idwc_wc.setitem(1,"work_name","전체")
idwc_wc.accepttext()
idwc_wc.setfilter( "work_no IN ('%', 'P01', 'P02', 'P03', 'P04', 'P05','B01', 'U01')" )
idwc_wc.filter()
dw_3.object.wc_no[1] = "%"

pb_retrieve.default = true
pb_retrieve.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_cdcalc_pub_m
integer x = 3017
integer y = 64
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

if wf_update1(dw_1, 'Y') = true then
	cbx_edit.checked = false
	cbx_edit.triggerevent( clicked! )
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdcalc_pub_m
integer x = 32
integer y = 440
integer width = 4133
integer height = 1696
string dataobject = "d_cdcalc_pub_m"
boolean hsplitscroll = true
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

this.scrolltorow(ll_row)


end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;//
string ls_formula, ls_qa = "", ls_qa1, ls_qa2, ls_qa3, ls_qa4

debugbreak()
ls_qa  = this.object.qa[row]
ls_qa1 = this.object.qa1[row]
ls_qa2 = this.object.qa2[row]
ls_qa3 = this.object.qa3[row]
ls_qa4 = this.object.qa4[row]

if LenA(ls_qa1) <> 3 then
	dw_1.setcolumn( "qa1" )
	dw_1.setfocus()
end if

if LenA(ls_qa2) <> 4 then
	dw_1.setcolumn( "qa2" )
	dw_1.setfocus()
end if

if LenA(ls_qa3) <> 4 then
	dw_1.setcolumn( "qa3" )
	dw_1.setfocus()
end if

if LenA(ls_qa4) <> 5 then
	dw_1.setcolumn( "qa4" )
	dw_1.setfocus()
end if

choose case dwo.name
	case "calc"
		this.object.qa[row] = ls_qa1 + "X" + ls_qa2 + "X" + ls_qa3 + "X" + ls_qa4
end choose

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

type st_title from w_inheritance`st_title within w_cdcalc_pub_m
integer x = 32
integer y = 20
integer width = 1403
integer height = 140
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
integer x = 3209
integer y = 64
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
integer x = 2825
integer y = 64
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
integer x = 2633
integer y = 64
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
long   ll_row, ll_cnt, ll_count
string ls_wcno

pb_retrieve.triggerevent(clicked!)

cbx_edit.checked = true
dw_1.object.work_no.protect = false
dw_1.object.calc.protect    = false

dw_3.accepttext()

ls_wcno  = dw_3.object.wc_no[1]
if isnull(ls_wcno) or ls_wcno = "" then RETURN

ll_count = dw_1.rowcount()

OpenWithParm(w_whitemselectmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)
	
	dw_1.object.work_no[ll_cnt]   = ls_wcno
	dw_1.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_1.scrolltorow(ll_count + 1)
dw_1.setcolumn( "qa1" )

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcalc_pub_m
integer x = 2231
integer y = 64
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
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_cdcalc_pub_m
integer x = 1504
integer y = 16
integer width = 672
integer height = 216
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_cdcalc_pub_m
integer y = 264
integer width = 4133
integer height = 160
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdcalc_pub_m
integer x = 2199
integer y = 16
integer width = 1225
integer height = 216
end type

type dw_2 from w_inheritance`dw_2 within w_cdcalc_pub_m
boolean visible = false
integer x = 1056
integer y = 52
integer width = 87
integer height = 112
boolean vscrollbar = false
end type

type dw_3 from datawindow within w_cdcalc_pub_m
integer x = 1536
integer y = 136
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
integer x = 3465
integer y = 44
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
integer y = 332
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

event clicked;// 편집모드
if this.checked = true then
	pb_retrieve.default = false
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
	
	dw_1.object.work_no.protect = false
	dw_1.object.calc.protect    = false
else
	pb_retrieve.default = true
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	dw_1.object.work_no.protect = true
	dw_1.object.calc.protect    = true
end if

end event

type pb_1 from picturebutton within w_cdcalc_pub_m
event mousemove pbm_mousemove
integer x = 2427
integer y = 64
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

type st_2 from statictext within w_cdcalc_pub_m
integer x = 1541
integer y = 64
integer width = 594
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_cdcalc_pub_m
integer x = 87
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_cdcalc_pub_m
integer x = 274
integer y = 312
integer width = 443
integer height = 632
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
end type

type st_5 from statictext within w_cdcalc_pub_m
integer x = 745
integer y = 328
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

type sle_value from singlelineedit within w_cdcalc_pub_m
integer x = 1234
integer y = 320
integer width = 567
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

type cb_1 from commandbutton within w_cdcalc_pub_m
integer x = 1806
integer y = 320
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

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cdcalc_pub_m
integer x = 1970
integer y = 320
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdcalc_pub_m
integer x = 2135
integer y = 320
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
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdcalc_pub_m
integer x = 2299
integer y = 320
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
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_cdcalc_pub_m
integer x = 306
integer y = 324
integer width = 311
integer height = 88
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
end type

type ddlb_op from dropdownlistbox within w_cdcalc_pub_m
integer x = 914
integer y = 316
integer width = 306
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

