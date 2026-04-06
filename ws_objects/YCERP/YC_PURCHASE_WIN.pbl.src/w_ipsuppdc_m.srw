$PBExportHeader$w_ipsuppdc_m.srw
$PBExportComments$구매처별 할인관리
forward 
global type w_ipsuppdc_m from w_inheritance
end type
type st_1 from statictext within w_ipsuppdc_m
end type
type em_1 from editmask within w_ipsuppdc_m
end type
type st_2 from statictext within w_ipsuppdc_m
end type
type cbx_date from checkbox within w_ipsuppdc_m
end type
type st_3 from statictext within w_ipsuppdc_m
end type
type ddlb_fld from dropdownlistbox within w_ipsuppdc_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ipsuppdc_m
end type
type st_4 from statictext within w_ipsuppdc_m
end type
type ddlb_op from dropdownlistbox within w_ipsuppdc_m
end type
type sle_value from singlelineedit within w_ipsuppdc_m
end type
type cb_1 from commandbutton within w_ipsuppdc_m
end type
type cb_2 from commandbutton within w_ipsuppdc_m
end type
type cb_3 from commandbutton within w_ipsuppdc_m
end type
type cb_5 from commandbutton within w_ipsuppdc_m
end type
end forward

global type w_ipsuppdc_m from w_inheritance
integer x = 750
integer y = 4
integer width = 3854
integer height = 2212
string title = "매입처별 할인관리(w_ipsuppdc_m)"
st_1 st_1
em_1 em_1
st_2 st_2
cbx_date cbx_date
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
global w_ipsuppdc_m w_ipsuppdc_m

type variables
st_print  i_print
string is_dw
date   id_start, id_end
datawindowchild idwc_supp

end variables

on w_ipsuppdc_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.st_2=create st_2
this.cbx_date=create cbx_date
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
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.cbx_date
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
end on

on w_ipsuppdc_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.cbx_date)
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

event open;call super::open;//
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

// 할인년월
if cbx_date.checked = true then
	em_1.text = string(today(), "yyyy/mm/01")
else
	em_1.text = string(today(), "yyyy/mm/dd")
end if

// 전체거래처
dw_2.settransobject(sqlca)
//dw_2.insertrow(1)
dw_2.insertrow(0)
dw_2.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(SQLCA)

idwc_supp.insertrow(1)
idwc_supp.setitem(1, "supp_no", "%")
idwc_supp.setitem(1, "supp_name", "전체")

if LeftA(gs_team,1) = "9" then
	dw_2.object.supp_no[1] = "%"
end if

if GF_PERMISSION("매입처별_할인관리", gs_userid) = 'Y' then
	pb_save.enabled = true
else
	pb_save.enabled = false
end if

em_1.setfocus()

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_ipsuppdc_m
integer x = 3369
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipsuppdc_m
integer x = 32
integer y = 424
integer width = 3749
integer height = 1652
string dataobject = "d_ipsuppdc_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type st_title from w_inheritance`st_title within w_ipsuppdc_m
integer x = 32
integer y = 20
integer width = 1170
integer height = 136
string text = "매입처별 할인관리"
end type

type st_tips from w_inheritance`st_tips within w_ipsuppdc_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipsuppdc_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipsuppdc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipsuppdc_m
integer x = 3561
integer y = 64
integer width = 183
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipsuppdc_m
boolean visible = false
integer x = 2939
integer y = 60
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipsuppdc_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ipsuppdc_m
integer x = 3168
integer y = 64
end type

event pb_delete::clicked;dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_ipsuppdc_m
integer x = 2976
integer y = 64
end type

event pb_insert::clicked;long   ll_row
date   ld_ratedate
string ls_supp, ls_suppname
 
//ls_supp    = dw_2.object.supp_no[dw_2.getrow()]
//if ls_supp = "%" then return

//if isnull(ls_supp) or trim(ls_supp) = '' then 
//	messagebox("확인", "구매처를 선택하십시요")
//	return
//end if

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)

//SELECT supp_name INTO :ls_suppname FROM supp  WHERE supp_no  = :ls_supp;
//dw_1.object.supp_no[ll_row]   = ls_supp
//dw_1.object.supp_name[ll_row] = ls_suppname

// 할인년월
if cbx_date.checked = true then
	ld_ratedate = date(LeftA(em_1.text,8) + "01")
else
	ld_ratedate = date(em_1.text)
end if
dw_1.object.rate_date[ll_row] = ld_ratedate

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ipsuppdc_m
integer x = 2784
integer y = 64
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.accepttext()

long   ll_row
string ls_supp, ls_yyyymm

ls_yyyymm = em_1.text
if ls_yyyymm = "0000/00/00" or ls_yyyymm = "" then 
	MessageBox("확인","할인년월 확인 바랍니다.",information!)
end if

ls_supp   = dw_2.object.supp_no[1]
ll_row    = dw_1.retrieve( ls_supp, ls_yyyymm )
if ll_row < 1 then
	MessageBox("확인","해당하는 데이터가 존재하지 않습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipsuppdc_m
integer x = 32
integer y = 244
integer width = 3749
integer height = 168
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ipsuppdc_m
integer x = 1253
integer y = 16
integer width = 1458
integer height = 216
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipsuppdc_m
integer x = 2743
integer y = 16
integer width = 1033
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ipsuppdc_m
integer x = 1582
integer y = 56
integer width = 1015
integer height = 84
string dataobject = "d_whsupp_s"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;//
dw_1.reset()
pb_retrieve.triggerevent( clicked! )

end event

type st_1 from statictext within w_ipsuppdc_m
integer x = 1280
integer y = 60
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "구매처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_ipsuppdc_m
integer x = 1582
integer y = 140
integer width = 425
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
string ls_date

openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	ls_date   = string(date(message.stringparm))
	this.text = ls_date
	if cbx_date.checked = true then 
		this.text = LeftA(ls_date,8) + "01"
	end if
end if

end event

event modified;//
string ls_date

ls_date   = this.text
if cbx_date.checked = true then 
	this.text = LeftA(ls_date,8) + "01"
end if

end event

type st_2 from statictext within w_ipsuppdc_m
integer x = 1280
integer y = 144
integer width = 297
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "할인년월"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_date from checkbox within w_ipsuppdc_m
integer x = 2021
integer y = 144
integer width = 672
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "할인일자(매월 1일)"
boolean checked = true
end type

type st_3 from statictext within w_ipsuppdc_m
integer x = 78
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

type ddlb_fld from dropdownlistbox within w_ipsuppdc_m
integer x = 265
integer y = 300
integer width = 443
integer height = 632
integer taborder = 50
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

type ddlb_dwtitles from dropdownlistbox within w_ipsuppdc_m
integer x = 297
integer y = 312
integer width = 311
integer height = 88
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
end type

type st_4 from statictext within w_ipsuppdc_m
integer x = 736
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

type ddlb_op from dropdownlistbox within w_ipsuppdc_m
integer x = 905
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ipsuppdc_m
integer x = 1225
integer y = 308
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

type cb_1 from commandbutton within w_ipsuppdc_m
integer x = 1797
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ipsuppdc_m
integer x = 1961
integer y = 308
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
datawindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ipsuppdc_m
integer x = 2126
integer y = 308
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
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ipsuppdc_m
integer x = 2290
integer y = 308
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
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

