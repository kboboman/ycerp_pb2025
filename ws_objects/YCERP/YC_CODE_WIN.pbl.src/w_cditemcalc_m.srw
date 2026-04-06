$PBExportHeader$w_cditemcalc_m.srw
$PBExportComments$제품별 계산식관리(98/03/10,이인호)
forward
global type w_cditemcalc_m from w_inheritance
end type
type cbx_edit from checkbox within w_cditemcalc_m
end type
type st_4 from statictext within w_cditemcalc_m
end type
type ddlb_fld from dropdownlistbox within w_cditemcalc_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditemcalc_m
end type
type st_5 from statictext within w_cditemcalc_m
end type
type sle_value from singlelineedit within w_cditemcalc_m
end type
type cb_1 from commandbutton within w_cditemcalc_m
end type
type cb_2 from commandbutton within w_cditemcalc_m
end type
type cb_3 from commandbutton within w_cditemcalc_m
end type
type cb_5 from commandbutton within w_cditemcalc_m
end type
type ddlb_op from dropdownlistbox within w_cditemcalc_m
end type
end forward

global type w_cditemcalc_m from w_inheritance
integer x = 82
integer y = 212
integer width = 3525
integer height = 2016
string title = "계산식 관리(YSP)(w_cditemcalc_m)"
boolean resizable = false
cbx_edit cbx_edit
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_cditemcalc_m w_cditemcalc_m

type variables
//
string   is_where,is_select,is_clause,is_select1,is_where1,is_clause1
st_print i_print
datawindowchild idwc_item,idwc_date
int      il_row = 0
string   is_dw, ls_dr
end variables

on w_cditemcalc_m.create
int iCurrent
call super::create
this.cbx_edit=create cbx_edit
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_edit
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.ddlb_op
end on

on w_cditemcalc_m.destroy
call super::destroy
destroy(this.cbx_edit)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
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

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

gb_2.visible = false
dw_2.visible = false
dw_1.object.calc_cd.protect = true

//
pb_retrieve.PostEvent( clicked! )

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_cditemcalc_m
integer x = 2048
integer y = 64
end type

event pb_save::clicked;integer li_count
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.Accepttext()
li_count = wf_modifycount(dw_1)
IF li_count >= 1 THEN
	   wf_update1(dw_1, 'Y')
END IF

end event

type dw_1 from w_inheritance`dw_1 within w_cditemcalc_m
event mousemove pbm_mousemove
integer x = 32
integer y = 424
integer width = 3424
integer height = 1464
string dragicon = "C:\Bmp\Arrowl.ico"
string dataobject = "d_cditemcalc_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
////
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
//
end event

type st_title from w_inheritance`st_title within w_cditemcalc_m
integer y = 20
integer width = 1175
integer height = 136
string text = "계산식 관리(YSP)"
end type

type st_tips from w_inheritance`st_tips within w_cditemcalc_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemcalc_m
boolean visible = false
integer x = 2770
integer y = 48
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemcalc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemcalc_m
integer x = 2240
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemcalc_m
integer x = 1856
integer y = 64
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 제품별 계산식 리스트를 출력합니다." 
i_print.name = 'd_cditemcalc_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemcalc_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cditemcalc_m
integer x = 1664
integer y = 64
end type

event pb_delete::clicked;call super::clicked;//
dw_1.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_cditemcalc_m
integer x = 1472
integer y = 64
end type

event pb_insert::clicked;//
gs_where2 lstr_where
long      ll_row, ll_cnt

cbx_edit.checked = true
dw_1.object.calc_cd.protect = false

//
OpenWithParm( w_WhItemSelectMulti_w, lstr_where )
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_1.setredraw( false )
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)
	
	dw_1.object.item_no[ll_cnt]             = trim(lstr_where.str1[ll_row])
	dw_1.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next
dw_1.setredraw( true )

dw_1.scrolltorow( ll_cnt )



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemcalc_m
integer x = 1280
integer y = 64
end type

event pb_retrieve::clicked;dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cditemcalc_m
integer x = 32
integer y = 244
integer width = 3424
integer height = 168
end type

type gb_2 from w_inheritance`gb_2 within w_cditemcalc_m
integer x = 2880
integer y = 64
integer width = 174
integer height = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_cditemcalc_m
integer x = 1243
integer y = 16
integer width = 1221
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cditemcalc_m
integer x = 46
integer y = 176
integer width = 105
integer height = 68
string dataobject = "d_cditemcalc_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type cbx_edit from checkbox within w_cditemcalc_m
integer x = 2487
integer y = 316
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "편집"
end type

event clicked;//
if this.checked = true then	// 편집모드
	dw_1.object.calc_cd.protect = false
else
	dw_1.object.calc_cd.protect = true
end if

end event

type st_4 from statictext within w_cditemcalc_m
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_cditemcalc_m
integer x = 270
integer y = 300
integer width = 443
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_cditemcalc_m
integer x = 302
integer y = 312
integer width = 311
integer height = 88
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

type st_5 from statictext within w_cditemcalc_m
integer x = 741
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

type sle_value from singlelineedit within w_cditemcalc_m
integer x = 1230
integer y = 308
integer width = 567
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cditemcalc_m
integer x = 1806
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cditemcalc_m
integer x = 1970
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

type cb_3 from commandbutton within w_cditemcalc_m
integer x = 2135
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
string text = "오름"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cditemcalc_m
integer x = 2299
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
string text = "내림"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_cditemcalc_m
integer x = 914
integer y = 304
integer width = 306
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

