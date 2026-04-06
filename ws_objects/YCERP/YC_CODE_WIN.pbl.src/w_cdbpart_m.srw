$PBExportHeader$w_cdbpart_m.srw
$PBExportComments$조업자재사용부서(1999/06/07,이인호)
forward
global type w_cdbpart_m from w_inheritance
end type
type st_3 from statictext within w_cdbpart_m
end type
type ddlb_fld from dropdownlistbox within w_cdbpart_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdbpart_m
end type
type st_4 from statictext within w_cdbpart_m
end type
type sle_value from singlelineedit within w_cdbpart_m
end type
type cb_1 from commandbutton within w_cdbpart_m
end type
type cb_2 from commandbutton within w_cdbpart_m
end type
type cb_3 from commandbutton within w_cdbpart_m
end type
type cb_5 from commandbutton within w_cdbpart_m
end type
type ddlb_op from dropdownlistbox within w_cdbpart_m
end type
end forward

global type w_cdbpart_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4027
integer height = 2052
string title = "조업자재 사용부서(w_cdbpart_m)"
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_cdbpart_m w_cdbpart_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

on w_cdbpart_m.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_op
end on

on w_cdbpart_m.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

end event

event resize;call super::resize;//

dw_1.width  = newwidth  - 78
dw_1.height = newheight - 468

end event

type pb_save from w_inheritance`pb_save within w_cdbpart_m
integer x = 3433
integer y = 64
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdbpart_m
integer x = 32
integer y = 428
integer width = 3913
integer height = 1480
string dataobject = "d_cdbpart_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdbpart_m
integer width = 1275
string text = "조업자재 사용부서"
end type

type st_tips from w_inheritance`st_tips within w_cdbpart_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbpart_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdbpart_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdbpart_m
integer x = 3630
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbpart_m
boolean visible = false
integer x = 1097
integer y = 580
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdbpart_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdbpart_m
integer x = 3237
integer y = 64
end type

event pb_delete::clicked;long ll_row
string ls_partno

dw_1.accepttext()
if dw_1.getrow() < 1 then return

ls_partno = trim(dw_1.object.part_no[dw_1.getrow()])

select count(*) into :ll_row from binitem where part_code = :ls_partno;

if ll_row > 0 then
	MessageBox("확인", "이거래처는 일보에서 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if
dw_1.deleterow(dw_1.getrow())


end event

type pb_insert from w_inheritance`pb_insert within w_cdbpart_m
integer x = 3040
integer y = 64
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('part_no')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbpart_m
integer x = 2843
integer y = 64
end type

event pb_retrieve::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdbpart_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdbpart_m
integer y = 244
integer width = 3913
integer height = 168
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdbpart_m
integer x = 2697
integer y = 16
integer width = 1248
integer height = 212
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdbpart_m
boolean visible = false
integer x = 1243
integer y = 220
integer width = 50
integer height = 44
string dataobject = "d_cdcountry_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_3 from statictext within w_cdbpart_m
integer x = 101
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_cdbpart_m
integer x = 288
integer y = 300
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

type ddlb_dwtitles from dropdownlistbox within w_cdbpart_m
integer x = 320
integer y = 312
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

type st_4 from statictext within w_cdbpart_m
integer x = 759
integer y = 316
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

type sle_value from singlelineedit within w_cdbpart_m
integer x = 1248
integer y = 308
integer width = 567
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

type cb_1 from commandbutton within w_cdbpart_m
integer x = 1819
integer y = 308
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

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cdbpart_m
integer x = 1984
integer y = 308
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

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdbpart_m
integer x = 2149
integer y = 308
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdbpart_m
integer x = 2313
integer y = 308
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_cdbpart_m
integer x = 937
integer y = 304
integer width = 302
integer height = 500
integer taborder = 60
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

