$PBExportHeader$w_oiteam_outamt.srw
$PBExportComments$미출고현황(매출조직도)
forward
global type w_oiteam_outamt from w_inheritance
end type
type em_1 from editmask within w_oiteam_outamt
end type
type st_1 from statictext within w_oiteam_outamt
end type
type pb_1 from picturebutton within w_oiteam_outamt
end type
type st_4 from statictext within w_oiteam_outamt
end type
type ddlb_fld from dropdownlistbox within w_oiteam_outamt
end type
type ddlb_dwtitles from dropdownlistbox within w_oiteam_outamt
end type
type st_5 from statictext within w_oiteam_outamt
end type
type ddlb_op from dropdownlistbox within w_oiteam_outamt
end type
type sle_value from singlelineedit within w_oiteam_outamt
end type
type cb_3 from commandbutton within w_oiteam_outamt
end type
type cb_4 from commandbutton within w_oiteam_outamt
end type
type cb_5 from commandbutton within w_oiteam_outamt
end type
type cb_6 from commandbutton within w_oiteam_outamt
end type
type dw_3 from datawindow within w_oiteam_outamt
end type
type st_vertical from u_splitbar_vertical within w_oiteam_outamt
end type
type st_2 from statictext within w_oiteam_outamt
end type
type rb_1 from radiobutton within w_oiteam_outamt
end type
type rb_2 from radiobutton within w_oiteam_outamt
end type
type st_3 from statictext within w_oiteam_outamt
end type
end forward

global type w_oiteam_outamt from w_inheritance
integer x = 23
integer y = 112
integer width = 4795
integer height = 2224
string title = "미출고 현황(매출조직도)[w_oiteam_outamt]"
string icon = "Hand!"
em_1 em_1
st_1 st_1
pb_1 pb_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
dw_3 dw_3
st_vertical st_vertical
st_2 st_2
rb_1 rb_1
rb_2 rb_2
st_3 st_3
end type
global w_oiteam_outamt w_oiteam_outamt

type variables
string  is_dw
integer ii_month
end variables

on w_oiteam_outamt.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.pb_1=create pb_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.dw_3=create dw_3
this.st_vertical=create st_vertical
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.cb_6
this.Control[iCurrent+14]=this.dw_3
this.Control[iCurrent+15]=this.st_vertical
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.rb_1
this.Control[iCurrent+18]=this.rb_2
this.Control[iCurrent+19]=this.st_3
end on

on w_oiteam_outamt.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.dw_3)
destroy(this.st_vertical)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_minsize(250, 250)
/////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)

dw_2.visible = false

em_1.text = string(today(),'yyyy/mm/dd')


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_3.x      = st_vertical.x + st_vertical.width
dw_3.width  = newwidth  - dw_3.x - gb_2.x
dw_3.height = st_vertical.height

end event

type pb_save from w_inheritance`pb_save within w_oiteam_outamt
boolean visible = false
integer x = 3415
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_oiteam_outamt
integer x = 32
integer y = 404
integer width = 1495
integer height = 1680
integer taborder = 140
string dataobject = "d_oiteam_outamt"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiteam_outamt
integer x = 0
integer y = 0
integer width = 1618
integer height = 140
string text = "미출고 현황(매출조직도)"
end type

type st_tips from w_inheritance`st_tips within w_oiteam_outamt
end type

type pb_compute from w_inheritance`pb_compute within w_oiteam_outamt
boolean visible = false
integer x = 3214
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiteam_outamt
boolean visible = false
integer x = 3223
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_oiteam_outamt
integer x = 3662
integer y = 56
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiteam_outamt
integer x = 3470
integer y = 56
integer taborder = 40
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.sharedata( dw_2 )

l_print.edate = Date(em_1.text)
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 미출고 현황(매출조직도)을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oiteam_outamt
boolean visible = false
integer x = 2816
end type

type pb_delete from w_inheritance`pb_delete within w_oiteam_outamt
boolean visible = false
integer x = 2624
end type

type pb_insert from w_inheritance`pb_insert within w_oiteam_outamt
boolean visible = false
integer x = 2432
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiteam_outamt
event ue_1 pbm_custom01
integer x = 3081
integer y = 56
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_sdate, ls_edate
date   ld_date
long   ll_year, ll_month, ll_year2

debugbreak()

dw_1.reset() ; dw_2.reset() ; dw_3.reset()

ld_date  = date(em_1.text)

dw_1.retrieve( "%", ld_date )	
dw_3.retrieve( "%", ld_date )	

if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiteam_outamt
integer x = 2249
integer y = 16
integer width = 777
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiteam_outamt
integer y = 224
integer width = 4151
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiteam_outamt
integer x = 3049
integer y = 16
integer width = 837
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiteam_outamt
integer x = 37
integer y = 160
integer width = 110
integer height = 80
integer taborder = 80
string dataobject = "d_oiteamoutamt_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_oiteam_outamt
integer x = 2583
integer y = 92
integer width = 411
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
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
string displaydata = "T"
end type

event rbuttondown;
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_oiteam_outamt
integer x = 2272
integer y = 108
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "조회일자:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oiteam_outamt
integer x = 3273
integer y = 56
integer width = 187
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos, li_value

DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_3"
		arg_dw  = dw_3
end choose

if arg_dw.rowcount() > 0 then
	ls_Docname = "미출고 현황(매출조직도)"
	li_value   = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos     = PosA(ls_Named, ".")
	
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsASCII( ls_DocName )
			MessageBox("확인", "작업완료")
		end if
	end if
end if
end event

type st_4 from statictext within w_oiteam_outamt
integer x = 87
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_oiteam_outamt
integer x = 274
integer y = 280
integer width = 480
integer height = 632
integer taborder = 180
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

type ddlb_dwtitles from dropdownlistbox within w_oiteam_outamt
integer x = 329
integer y = 296
integer width = 311
integer height = 88
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

type st_5 from statictext within w_oiteam_outamt
integer x = 791
integer y = 296
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

type ddlb_op from dropdownlistbox within w_oiteam_outamt
integer x = 969
integer y = 276
integer width = 302
integer height = 500
integer taborder = 170
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

type sle_value from singlelineedit within w_oiteam_outamt
integer x = 1280
integer y = 284
integer width = 567
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_oiteam_outamt
integer x = 1861
integer y = 284
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_3"
		arg_dw  = dw_3
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_oiteam_outamt
integer x = 2025
integer y = 284
integer width = 160
integer height = 76
integer taborder = 160
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
	case "dw_3"
		arg_dw  = dw_3
end choose
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_oiteam_outamt
integer x = 2190
integer y = 284
integer width = 160
integer height = 76
integer taborder = 170
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
	case "dw_3"
		arg_dw  = dw_3
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_oiteam_outamt
integer x = 2354
integer y = 284
integer width = 160
integer height = 76
integer taborder = 180
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
	case "dw_3"
		arg_dw  = dw_3
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_oiteam_outamt
integer x = 1586
integer y = 404
integer width = 2597
integer height = 1680
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiteam_outamt_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_vertical from u_splitbar_vertical within w_oiteam_outamt
integer x = 1541
integer y = 404
integer height = 1680
boolean bringtotop = true
end type

type st_2 from statictext within w_oiteam_outamt
integer x = 2542
integer y = 300
integer width = 517
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "-15일,+30 기준"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oiteam_outamt
integer x = 1765
integer y = 48
integer width = 457
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
string text = "품목별"
boolean checked = true
end type

event clicked;dw_3.dataobject = 'd_oiteam_outamt_det'
dw_3.SetTransObject(SQLCA)
end event

type rb_2 from radiobutton within w_oiteam_outamt
integer x = 1765
integer y = 132
integer width = 457
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
string text = "거래처별"
end type

event clicked;dw_3.dataobject = 'd_oiteam_outamt_det1'
dw_3.SetTransObject(SQLCA)
end event

type st_3 from statictext within w_oiteam_outamt
integer x = 2537
integer y = 292
integer width = 2249
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "조회기준: 조회일자-30일~~조회일자+30일 사이에 있는 확정일자 건."
boolean focusrectangle = false
end type

