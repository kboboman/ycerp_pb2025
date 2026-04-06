$PBExportHeader$w_osaroi_r.srw
$PBExportComments$매출현황(1998/05/15, 정재수)
forward 
global type w_osaroi_r from w_inheritance
end type
type st_1 from statictext within w_osaroi_r
end type
type em_1 from editmask within w_osaroi_r
end type
type em_2 from editmask within w_osaroi_r
end type
type st_2 from statictext within w_osaroi_r
end type
type ddlb_1 from dropdownlistbox within w_osaroi_r
end type
type st_4 from statictext within w_osaroi_r
end type
type ddlb_fld from dropdownlistbox within w_osaroi_r
end type
type st_5 from statictext within w_osaroi_r
end type
type ddlb_op from dropdownlistbox within w_osaroi_r
end type
type sle_value from singlelineedit within w_osaroi_r
end type
type cb_1 from commandbutton within w_osaroi_r
end type
type cb_2 from commandbutton within w_osaroi_r
end type
type cb_3 from commandbutton within w_osaroi_r
end type
type cb_5 from commandbutton within w_osaroi_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osaroi_r
end type
type pb_1 from picturebutton within w_osaroi_r
end type
type cbx_1 from checkbox within w_osaroi_r
end type
type dw_3 from datawindow within w_osaroi_r
end type
type st_3 from statictext within w_osaroi_r
end type
end forward

global type w_osaroi_r from w_inheritance
integer y = 112
integer width = 4014
integer height = 2292
string title = "매출현황(w_osaroi_r)"
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
ddlb_1 ddlb_1
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
pb_1 pb_1
cbx_1 cbx_1
dw_3 dw_3
st_3 st_3
end type
global w_osaroi_r w_osaroi_r

type variables
string is_sale_flag, is_ret
end variables

on w_osaroi_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.cbx_1
this.Control[iCurrent+18]=this.dw_3
this.Control[iCurrent+19]=this.st_3
end on

on w_osaroi_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_3.visible = false
dw_3.settransobject( sqlca )

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

ddlb_1.text = '전체'
is_sale_flag = 'A'

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_osaroi_r
boolean visible = false
integer taborder = 110
end type

type dw_1 from w_inheritance`dw_1 within w_osaroi_r
integer x = 32
integer y = 436
integer width = 3904
integer height = 1712
integer taborder = 0
string dataobject = "d_osaroirep_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osaroi_r
integer x = 32
integer y = 24
integer width = 1339
integer height = 140
string text = "매출현황(계산서기준)"
end type

type st_tips from w_inheritance`st_tips within w_osaroi_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroi_r
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroi_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_osaroi_r
integer x = 3328
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroi_r
integer x = 3136
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//st_print l_print
//
//if dw_2.rowcount() < 1 then
//	return
//end if
//
//dw_2.groupcalc()
//
////l_print.name = 'd_osaroirep_r1'
//l_print.st_datawindow = dw_2
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 수주일보를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroi_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_osaroi_r
boolean visible = false
integer taborder = 200
end type

type pb_insert from w_inheritance`pb_insert within w_osaroi_r
boolean visible = false
integer taborder = 220
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroi_r
integer x = 2743
integer y = 64
integer taborder = 40
boolean default = true
end type

event pb_retrieve::clicked;//
string ls_sale_flag[], ls_sdate, ls_edate
st_security lst_security

if em_1.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","매출기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text

if is_sale_flag = 'A' then
	ls_sale_flag[1] = 'D'
	ls_sale_flag[2] = 'L'
	ls_sale_flag[3] = 'E'
else
	ls_sale_flag[1] = is_sale_flag
end if

if cbx_1.checked = true then
	dw_3.retrieve( ls_sdate, ls_edate )
else
	dw_1.retrieve( ls_sale_flag, ls_sdate, ls_edate )
end if

dw_1.groupcalc()
dw_2.groupcalc()

end event

type gb_3 from w_inheritance`gb_3 within w_osaroi_r
integer x = 1445
integer y = 12
integer width = 1253
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroi_r
integer y = 244
integer width = 3904
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroi_r
integer x = 2715
integer width = 832
integer height = 224
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroi_r
integer x = 59
integer y = 180
integer width = 73
integer height = 60
integer taborder = 0
string dataobject = "d_osaroirep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_osaroi_r
integer x = 1486
integer y = 68
integer width = 297
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "매출기간"
boolean focusrectangle = false
end type

type em_1 from editmask within w_osaroi_r
integer x = 1787
integer y = 52
integer width = 357
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
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

type em_2 from editmask within w_osaroi_r
integer x = 2190
integer y = 52
integer width = 357
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
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

type st_2 from statictext within w_osaroi_r
integer x = 1486
integer y = 156
integer width = 288
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "수주유형"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_osaroi_r
integer x = 1787
integer y = 136
integer width = 357
integer height = 384
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","내수","L/C","수출"}
end type

event selectionchanged;choose case index 
	case 1
		is_sale_flag = 'A'
	case 2
		is_sale_flag = 'D'
	case 3
		is_sale_flag = 'L'
	case 4
		is_sale_flag = 'E'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_4 from statictext within w_osaroi_r
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_osaroi_r
integer x = 274
integer y = 300
integer width = 480
integer height = 632
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

type st_5 from statictext within w_osaroi_r
integer x = 773
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

type ddlb_op from dropdownlistbox within w_osaroi_r
integer x = 942
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_osaroi_r
integer x = 1262
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

type cb_1 from commandbutton within w_osaroi_r
integer x = 1833
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

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw  = dw_1
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_osaroi_r
integer x = 1998
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw = dw_1
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_osaroi_r
integer x = 2162
integer y = 308
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw = dw_1
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osaroi_r
integer x = 2327
integer y = 308
integer width = 160
integer height = 76
integer taborder = 210
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

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw = dw_1
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_osaroi_r
integer x = 315
integer y = 312
integer width = 311
integer height = 88
integer taborder = 190
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

type pb_1 from picturebutton within w_osaroi_r
event mousemove pbm_mousemove
integer x = 2939
integer y = 64
integer width = 187
integer height = 144
integer taborder = 230
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

if cbx_1.checked = true then
	dwxls  = dw_3
else
	dwxls  = dw_1
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type cbx_1 from checkbox within w_osaroi_r
integer x = 2190
integer y = 140
integer width = 485
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "운반비 체크"
end type

event clicked;// 운반비 체크

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if this.checked = true then
	st_3.visible = false
	dw_3.visible = true
	dw_1.visible = false
	GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
else
	st_3.visible = true
	dw_1.visible = true
	dw_3.visible = false
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
end if

end event

type dw_3 from datawindow within w_osaroi_r
integer x = 375
integer y = 652
integer width = 3241
integer height = 1200
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_osaroirep_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_3 from statictext within w_osaroi_r
integer x = 82
integer y = 248
integer width = 2866
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "도료,도료(말),액체도료,분체도료,분체도료(인터폰D),고철대(고철),고철대(생철),CLAIM(도료),스크랩 => 잡이익"
boolean focusrectangle = false
end type

