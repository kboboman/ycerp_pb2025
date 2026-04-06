$PBExportHeader$w_mpsale_r.srw
$PBExportComments$거래처별 수주현황(2002/05/27,이인호)
forward 
global type w_mpsale_r from w_inheritance
end type
type em_1 from editmask within w_mpsale_r
end type
type em_2 from editmask within w_mpsale_r
end type
type st_1 from statictext within w_mpsale_r
end type
type st_4 from statictext within w_mpsale_r
end type
type ddlb_fld from dropdownlistbox within w_mpsale_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsale_r
end type
type st_5 from statictext within w_mpsale_r
end type
type ddlb_op from dropdownlistbox within w_mpsale_r
end type
type sle_value from singlelineedit within w_mpsale_r
end type
type cb_1 from commandbutton within w_mpsale_r
end type
type cb_2 from commandbutton within w_mpsale_r
end type
type cb_3 from commandbutton within w_mpsale_r
end type
type cb_5 from commandbutton within w_mpsale_r
end type
end forward

global type w_mpsale_r from w_inheritance
integer y = 112
integer width = 4137
integer height = 2240
string title = "거래처별 수주현황(w_mpsale_r)"
em_1 em_1
em_2 em_2
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_mpsale_r w_mpsale_r

type variables
//
st_print i_print
string is_dw, is_ret
date   id_date1, id_date2

end variables

on w_mpsale_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
end on

on w_mpsale_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_chk
select isnull(sale_price,'N') into :ls_chk from login
 where user_id = :gs_userid; 
if ls_chk = 'Y' Then
	is_ret = '%'
else
	is_ret = gs_userid
end if

dw_1.settransobject(sqlca)
em_1.text = string(today(),'yyyy/mm/dd')
id_date1 = today()
em_2.text = string(today(),'yyyy/mm/dd')
id_date2 = today()
dw_1.sharedata(dw_2)
dw_2.visible = false
end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_mpsale_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_mpsale_r
integer x = 32
integer y = 428
integer width = 4023
integer height = 1676
integer taborder = 60
string title = "d_mpsale_t_bak"
string dataobject = "d_mpsale_t"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;datawindowchild ldwc_item
this.accepttext()
choose case dwo.name
	case 'item_no'
        this.getchild('item_no',ldwc_item)
        this.object.bitem_item_name[row] = ldwc_item.getitemstring(ldwc_item.getrow(),'item_name')
        this.object.team_code[row] = ldwc_item.getitemstring(ldwc_item.getrow(),'team_code')
        this.object.rcpt_qty[row] = ldwc_item.getitemnumber(ldwc_item.getrow(),'qty')
		  this.object.uom[row] = ldwc_item.getitemstring(ldwc_item.getrow(),'uom')
		  this.object.in_date[row] = ldwc_item.getitemdatetime(ldwc_item.getrow(),'sys_date')
end choose
end event

event dw_1::clicked;call super::clicked;//
is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_mpsale_r
integer x = 32
integer y = 20
integer width = 1166
integer height = 140
string text = "수주현황(거래처별)"
end type

type st_tips from w_inheritance`st_tips within w_mpsale_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsale_r
boolean visible = false
integer x = 3008
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsale_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsale_r
integer x = 2459
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsale_r
integer x = 2267
integer y = 64
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_pur

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 거래처별 수주일보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsale_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpsale_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpsale_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsale_r
integer x = 2075
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_colx

ls_date = trim(em_1.text)
if isdate(ls_date) = false then
	beep(1)
	em_1.setfocus()
	return
end if

id_date1 = date(ls_date)
ls_date = trim(em_2.text)
if isdate(ls_date) = false then
	beep(1)
	em_2.setfocus()
	return
end if

id_date2 = date(ls_date)

dw_1.retrieve(id_date1,id_date2, is_ret)
ls_colx = dw_1.object.sale_due_date.x	
dw_1.object.datawindow.horizontalscrollsplit= ls_colx		

end event

type gb_3 from w_inheritance`gb_3 within w_mpsale_r
integer x = 32
integer y = 244
integer width = 4023
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsale_r
integer x = 1266
integer y = 16
integer width = 759
integer height = 216
integer taborder = 90
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpsale_r
integer x = 2043
integer y = 16
integer width = 635
integer height = 216
integer taborder = 50
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsale_r
integer x = 46
integer y = 176
integer width = 105
integer height = 76
integer taborder = 70
string dataobject = "d_mpsale_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;datawindowchild ldwc_pur
string ls_pur
this.accepttext()
ls_pur = trim(this.object.pur_no[1])
dw_1.retrieve(ls_pur)
choose case dwo.name
	case 'pur_no'
        this.getchild('pur_no',ldwc_pur)
        this.object.sign_date[1] = ldwc_pur.getitemdatetime(ldwc_pur.getrow(),'sign_date')
end choose
end event

type em_1 from editmask within w_mpsale_r
integer x = 1614
integer y = 56
integer width = 375
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpsale_r
integer x = 1614
integer y = 140
integer width = 375
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_mpsale_r
integer x = 1303
integer y = 56
integer width = 302
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "주문일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsale_r
integer x = 114
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

type ddlb_fld from dropdownlistbox within w_mpsale_r
integer x = 302
integer y = 304
integer width = 443
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsale_r
integer x = 343
integer y = 316
integer width = 311
integer height = 88
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
end type

type st_5 from statictext within w_mpsale_r
integer x = 786
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

type ddlb_op from dropdownlistbox within w_mpsale_r
integer x = 955
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpsale_r
integer x = 1275
integer y = 304
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

type cb_1 from commandbutton within w_mpsale_r
integer x = 1847
integer y = 304
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsale_r
integer x = 2011
integer y = 304
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsale_r
integer x = 2176
integer y = 304
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsale_r
integer x = 2341
integer y = 304
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

