$PBExportHeader$w_ippurday1_r.srw
$PBExportComments$구매일보(1998/10/13,곽용덕)
forward 
global type w_ippurday1_r from w_inheritance
end type
type st_3 from statictext within w_ippurday1_r
end type
type ddlb_fld from dropdownlistbox within w_ippurday1_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ippurday1_r
end type
type st_4 from statictext within w_ippurday1_r
end type
type ddlb_op from dropdownlistbox within w_ippurday1_r
end type
type sle_value from singlelineedit within w_ippurday1_r
end type
type cb_1 from commandbutton within w_ippurday1_r
end type
type cb_2 from commandbutton within w_ippurday1_r
end type
type cb_3 from commandbutton within w_ippurday1_r
end type
type cb_5 from commandbutton within w_ippurday1_r
end type
end forward

global type w_ippurday1_r from w_inheritance
integer width = 4293
integer height = 2292
string title = "구매일보 현황(w_ippurday1_r)"
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_ippurday1_r w_ippurday1_r

type variables
gs_codere_str  ist_code

string is_dw

end variables

forward prototypes
public subroutine wf_print (string arg_flag, date arg_date)
end prototypes

public subroutine wf_print (string arg_flag, date arg_date);long   ll_row, ll_cnt, ll_insertrow
string ls_class

ll_row = dw_2.rowcount()

CHOOSE CASE arg_flag
	CASE 'S'
		ls_class = "상품"
	CASE 'W'
		ls_class = "원자재"
	CASE 'B'
		ls_class = "부자재"
	CASE 'Y'
		ls_class = "외주가공"
	CASE 'A'
		ls_class = "공사원가"
END CHOOSE

dw_1.settransobject(sqlca)
dw_1.setredraw(false)
for ll_cnt = 1 to ll_row
	ll_insertrow  = dw_1.insertrow(0)
	dw_1.object.item_class[ll_insertrow] = ls_class
	dw_1.object.in_date[ll_insertrow]    = arg_date
	dw_1.object.cust_name[ll_insertrow]  = dw_2.object.supp_supp_name[ll_cnt]
	dw_1.object.group_name[ll_insertrow] = trim(dw_2.object.inspdet_insp_no[ll_cnt])
	dw_1.object.item_name[ll_insertrow]  = dw_2.object.groupitem_item_name[ll_cnt]
	dw_1.object.seq[ll_insertrow]        = dw_2.object.inspdet_oi_no[ll_cnt]
	dw_1.object.qa[ll_insertrow]         = dw_2.object.qa[ll_cnt]
	dw_1.object.ea[ll_insertrow]         = dw_2.object.uom[ll_cnt]
	dw_1.object.qty[ll_insertrow]        = dw_2.object.comqty[ll_cnt]
	dw_1.object.cost[ll_insertrow]       = dw_2.object.price[ll_cnt]
	dw_1.object.amount[ll_insertrow]     = dw_2.object.ori_amount[ll_cnt]
//	dw_1.object.dept[ll_insertrow]       = dw_2.object.[ll_cnt]
//	dw_1.object.acct_desc[ll_insertrow]  = dw_2.object.[ll_cnt]
	dw_1.object.rem[ll_insertrow]        = dw_2.object.rem[ll_cnt]
next
dw_1.groupcalc()
dw_1.setredraw(true)

end subroutine

on w_ippurday1_r.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
end on

on w_ippurday1_r.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_ippurday1_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ippurday1_r
integer x = 32
integer y = 408
integer width = 4187
integer height = 1748
string dataobject = "d_apoi_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ippurday1_r
integer width = 1289
string text = "구매일보 현황"
end type

type st_tips from w_inheritance`st_tips within w_ippurday1_r
end type

type pb_compute from w_inheritance`pb_compute within w_ippurday1_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurday1_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurday1_r
integer x = 4009
integer y = 56
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurday1_r
integer x = 3813
integer y = 56
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 구매일보 보고서를 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurday1_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ippurday1_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_ippurday1_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurday1_r
integer x = 3621
integer y = 56
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where, ls_flag, ls_area, ls_sel
date   ld_date
long   ll_count

openwithparm(w_whapoi_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

ls_flag = ist_code.flag
ld_date = date(ist_code.start_no)
ls_area = trim(ist_code.end_no)
ls_sel  = ist_code.sel

if dw_2.retrieve( ls_flag, ld_date, ls_area, ls_sel ) < 1 then
	messagebox("확인","해당 일자에는 자료가 없습니다")
	return
end if

wf_print(ls_flag, ld_date)


end event

type gb_3 from w_inheritance`gb_3 within w_ippurday1_r
boolean visible = false
integer x = 1161
integer y = 4
integer width = 1618
integer height = 208
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_ippurday1_r
integer y = 232
integer width = 4187
integer height = 164
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ippurday1_r
integer x = 3593
integer y = 16
integer width = 631
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ippurday1_r
integer x = 1413
integer y = 60
integer width = 142
integer height = 104
string dataobject = "d_iopurrcpt_h2"
boolean vscrollbar = false
end type

type st_3 from statictext within w_ippurday1_r
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_ippurday1_r
integer x = 270
integer y = 284
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ippurday1_r
integer x = 302
integer y = 296
integer width = 311
integer height = 88
integer taborder = 140
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

type st_4 from statictext within w_ippurday1_r
integer x = 741
integer y = 300
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

type ddlb_op from dropdownlistbox within w_ippurday1_r
integer x = 910
integer y = 284
integer width = 297
integer height = 512
integer taborder = 140
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

type sle_value from singlelineedit within w_ippurday1_r
integer x = 1230
integer y = 288
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

type cb_1 from commandbutton within w_ippurday1_r
integer x = 1801
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ippurday1_r
integer x = 1966
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose

ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ippurday1_r
integer x = 2130
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ippurday1_r
integer x = 2295
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

