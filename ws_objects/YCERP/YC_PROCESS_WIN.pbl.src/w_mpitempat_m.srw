$PBExportHeader$w_mpitempat_m.srw
$PBExportComments$물품별 공정패턴관리(1998/08/26,곽용덕)
forward 
global type w_mpitempat_m from w_inheritance
end type
type st_1 from statictext within w_mpitempat_m
end type
type em_1 from editmask within w_mpitempat_m
end type
type dw_3 from datawindow within w_mpitempat_m
end type
type st_horizontal from u_splitbar_horizontal within w_mpitempat_m
end type
type st_2 from statictext within w_mpitempat_m
end type
type ddlb_fld from dropdownlistbox within w_mpitempat_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpitempat_m
end type
type st_6 from statictext within w_mpitempat_m
end type
type ddlb_op from dropdownlistbox within w_mpitempat_m
end type
type sle_value from singlelineedit within w_mpitempat_m
end type
type cb_4 from commandbutton within w_mpitempat_m
end type
type cb_5 from commandbutton within w_mpitempat_m
end type
type cb_6 from commandbutton within w_mpitempat_m
end type
type cb_7 from commandbutton within w_mpitempat_m
end type
end forward

global type w_mpitempat_m from w_inheritance
integer width = 3922
integer height = 2052
string title = "공정패턴 관리(w_mpitempat_m)"
st_1 st_1
em_1 em_1
dw_3 dw_3
st_horizontal st_horizontal
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
end type
global w_mpitempat_m w_mpitempat_m

on w_mpitempat_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.dw_3=create dw_3
this.st_horizontal=create st_horizontal
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_horizontal
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.cb_6
this.Control[iCurrent+14]=this.cb_7
end on

on w_mpitempat_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.st_horizontal)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

dw_3.SetTransObject(SQLCA)

pb_retrieve.PostEvent( clicked! )

end event

event resize;call super::resize;//
long  ll_width, ll_height

gb_3.width  = newwidth  - (gb_3.x * 2)

ll_height   = newheight - dw_1.y - gb_3.x

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = ll_height * 0.6

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = dw_1.width

dw_3.x      = dw_1.x
dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_mpitempat_m
integer x = 2094
integer y = 56
integer taborder = 30
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.update() = 1 then
	commit;
	messagebox('확인','저장 되었습니다.')
else
	rollback;
	messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
end if
end event

type dw_1 from w_inheritance`dw_1 within w_mpitempat_m
integer x = 32
integer y = 420
integer width = 3808
integer height = 824
integer taborder = 50
string dataobject = "d_mpitempat_m"
borderstyle borderstyle = StyleLowered!
end type

event dw_1::itemchanged;call super::itemchanged;string ls_patno

ls_patno = this.object.pat_no[row]
dw_3.retrieve( ls_patno )
end event

event dw_1::clicked;call super::clicked;//
if row < 1 then return

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
long li_patno

li_patno = this.object.pat_no[row]
dw_3.retrieve( li_patno )
end event

type st_title from w_inheritance`st_title within w_mpitempat_m
integer x = 32
integer y = 20
integer width = 987
integer height = 140
string text = "공정패턴 관리"
end type

type st_tips from w_inheritance`st_tips within w_mpitempat_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpitempat_m
boolean visible = false
integer x = 2071
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpitempat_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpitempat_m
integer x = 2286
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpitempat_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpitempat_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mpitempat_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mpitempat_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpitempat_m
integer x = 1897
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_mpitempat_m
integer x = 32
integer y = 240
integer width = 3808
integer height = 168
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mpitempat_m
integer x = 1097
integer y = 16
integer width = 745
integer height = 204
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpitempat_m
integer x = 1870
integer y = 16
integer width = 635
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpitempat_m
boolean visible = false
integer x = 1947
integer y = 80
integer width = 174
integer height = 80
integer taborder = 60
end type

type st_1 from statictext within w_mpitempat_m
integer x = 1143
integer y = 108
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "검색"
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpitempat_m
integer x = 1330
integer y = 88
integer width = 443
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!"
end type

event modified;string ls_str,ls_filter

if trim(em_1.text) = '%' then
   ls_str = '%'	
else
	ls_str = trim(em_1.text) + '%'
end if

ls_filter= "item_no like '" + ls_str + "'"
dw_1.SetFilter(ls_filter)
dw_1.Filter( )

end event

type dw_3 from datawindow within w_mpitempat_m
integer x = 32
integer y = 1272
integer width = 3808
integer height = 652
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdpattern_r"
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

event clicked;//
if row < 1 then return

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_horizontal from u_splitbar_horizontal within w_mpitempat_m
integer x = 32
integer y = 1248
integer width = 3808
boolean bringtotop = true
end type

type st_2 from statictext within w_mpitempat_m
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

type ddlb_fld from dropdownlistbox within w_mpitempat_m
integer x = 270
integer y = 292
integer width = 480
integer height = 632
integer taborder = 210
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

type ddlb_dwtitles from dropdownlistbox within w_mpitempat_m
integer x = 325
integer y = 304
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

type st_6 from statictext within w_mpitempat_m
integer x = 768
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

type ddlb_op from dropdownlistbox within w_mpitempat_m
integer x = 937
integer y = 292
integer width = 297
integer height = 512
integer taborder = 220
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

type sle_value from singlelineedit within w_mpitempat_m
integer x = 1248
integer y = 300
integer width = 480
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

type cb_4 from commandbutton within w_mpitempat_m
integer x = 1742
integer y = 300
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

arg_dw  = dw_2

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_5 from commandbutton within w_mpitempat_m
integer x = 1906
integer y = 300
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

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_6 from commandbutton within w_mpitempat_m
integer x = 2071
integer y = 300
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

arg_dw = dw_2

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_7 from commandbutton within w_mpitempat_m
integer x = 2235
integer y = 300
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

arg_dw = dw_2

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

