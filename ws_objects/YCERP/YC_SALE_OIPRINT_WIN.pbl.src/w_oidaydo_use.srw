$PBExportHeader$w_oidaydo_use.srw
$PBExportComments$거래처별 이월내역
forward
global type w_oidaydo_use from w_inheritance
end type
type em_1 from editmask within w_oidaydo_use
end type
type em_2 from editmask within w_oidaydo_use
end type
type pb_1 from picturebutton within w_oidaydo_use
end type
type st_1 from statictext within w_oidaydo_use
end type
type dw_3 from datawindow within w_oidaydo_use
end type
type st_4 from statictext within w_oidaydo_use
end type
type st_6 from statictext within w_oidaydo_use
end type
type ddlb_fld from dropdownlistbox within w_oidaydo_use
end type
type ddlb_dwtitles from dropdownlistbox within w_oidaydo_use
end type
type st_7 from statictext within w_oidaydo_use
end type
type sle_value from singlelineedit within w_oidaydo_use
end type
type cb_1 from commandbutton within w_oidaydo_use
end type
type cb_2 from commandbutton within w_oidaydo_use
end type
type cb_3 from commandbutton within w_oidaydo_use
end type
type cb_5 from commandbutton within w_oidaydo_use
end type
type cbx_yymm from checkbox within w_oidaydo_use
end type
type dw_4 from datawindow within w_oidaydo_use
end type
type cbx_1 from checkbox within w_oidaydo_use
end type
type cb_4 from commandbutton within w_oidaydo_use
end type
type rb_cust from radiobutton within w_oidaydo_use
end type
type rb_item from radiobutton within w_oidaydo_use
end type
type dw_5 from datawindow within w_oidaydo_use
end type
type rb_1 from radiobutton within w_oidaydo_use
end type
type rb_category from radiobutton within w_oidaydo_use
end type
type dw_6 from datawindow within w_oidaydo_use
end type
type ddlb_op from dropdownlistbox within w_oidaydo_use
end type
type dw_7 from datawindow within w_oidaydo_use
end type
type dw_8 from datawindow within w_oidaydo_use
end type
type gb_4 from groupbox within w_oidaydo_use
end type
end forward

global type w_oidaydo_use from w_inheritance
integer x = 5
integer y = 36
integer width = 5330
integer height = 1992
string title = "출고일보(용도별)(w_oidaydo_use)"
em_1 em_1
em_2 em_2
pb_1 pb_1
st_1 st_1
dw_3 dw_3
st_4 st_4
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_yymm cbx_yymm
dw_4 dw_4
cbx_1 cbx_1
cb_4 cb_4
rb_cust rb_cust
rb_item rb_item
dw_5 dw_5
rb_1 rb_1
rb_category rb_category
dw_6 dw_6
ddlb_op ddlb_op
dw_7 dw_7
dw_8 dw_8
gb_4 gb_4
end type
global w_oidaydo_use w_oidaydo_use

type variables
//
datawindowchild idwc_usename
st_print i_print
string is_dw, is_year, is_inside, is_category

end variables

on w_oidaydo_use.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_4=create st_4
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_yymm=create cbx_yymm
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.rb_cust=create rb_cust
this.rb_item=create rb_item
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_category=create rb_category
this.dw_6=create dw_6
this.ddlb_op=create ddlb_op
this.dw_7=create dw_7
this.dw_8=create dw_8
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cbx_yymm
this.Control[iCurrent+17]=this.dw_4
this.Control[iCurrent+18]=this.cbx_1
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.rb_cust
this.Control[iCurrent+21]=this.rb_item
this.Control[iCurrent+22]=this.dw_5
this.Control[iCurrent+23]=this.rb_1
this.Control[iCurrent+24]=this.rb_category
this.Control[iCurrent+25]=this.dw_6
this.Control[iCurrent+26]=this.ddlb_op
this.Control[iCurrent+27]=this.dw_7
this.Control[iCurrent+28]=this.dw_8
this.Control[iCurrent+29]=this.gb_4
end on

on w_oidaydo_use.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_yymm)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.rb_cust)
destroy(this.rb_item)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_category)
destroy(this.dw_6)
destroy(this.ddlb_op)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_2.visible = false

// 년월별
cbx_yymm.enabled = false

// 일자
em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")

// 집계
rb_cust.checked = true
rb_cust.triggerevent( clicked!)

// 용도별 
string ls_usename

dw_3.settransobject(sqlca)
dw_3.insertrow(0)  

dw_3.getchild("use_name", idwc_usename)
idwc_usename.settransobject(sqlca)
idwc_usename.insertrow(1)
//idwc_usename.setitem(1, "use_name","전체 용도별")
//idwc_usename.accepttext()
//
//dw_3.object.use_name[1] = "전체 용도별"
//dw_3.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_4.x = dw_1.x ; dw_4.y = dw_1.y ; dw_4.width = dw_1.width ; dw_4.height = dw_1.height

dw_5.x = dw_1.x ; dw_5.y = dw_1.y ; dw_5.width = dw_1.width ; dw_5.height = dw_1.height

dw_6.x = dw_1.x ; dw_6.y = dw_1.y ; dw_6.width = dw_1.width ; dw_6.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_oidaydo_use
boolean visible = false
integer x = 3758
integer y = 60
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_oidaydo_use
integer x = 32
integer y = 424
integer width = 4274
integer height = 1292
integer taborder = 50
string dataobject = "d_oidaydo_use"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then RETURN
//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oidaydo_use
integer x = 0
integer y = 0
integer width = 1079
integer height = 148
string text = "출고일보(용도별)"
end type

type st_tips from w_inheritance`st_tips within w_oidaydo_use
end type

type pb_compute from w_inheritance`pb_compute within w_oidaydo_use
boolean visible = false
integer x = 4151
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidaydo_use
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oidaydo_use
integer x = 3543
integer y = 64
integer taborder = 160
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidaydo_use
integer x = 3168
integer y = 64
integer taborder = 190
end type

type pb_cancel from w_inheritance`pb_cancel within w_oidaydo_use
boolean visible = false
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_oidaydo_use
boolean visible = false
integer x = 3968
integer y = 56
integer taborder = 260
end type

type pb_insert from w_inheritance`pb_insert within w_oidaydo_use
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 300
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidaydo_use
integer x = 2976
integer y = 64
integer taborder = 290
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_usename, ls_yymm
date   ld_sdate, ld_edate
long   ll_row

// 용도별
dw_3.accepttext()
ls_usename   = trim(dw_3.object.use_name[1])

/*말이안되는 로직 2017.11.21 조원석 주석 처리 */
//if isnull(ls_usename) OR ls_usename = "" then RETURN
//if ls_usename = "전체 용도별" then ls_usename = "%"	
	
/*2017.11.21 조원석 수정 */
//if rb_category.checked = true then
	if ls_usename = "전체 용도별" or ls_usename = '' or isnull(ls_usename) then 
		ls_usename = "%"	
	end if
//else
//	if isnull(ls_usename) OR ls_usename = "" then RETURN
//end if

//
ld_sdate  = date(em_1.text)
ld_edate  = date(em_2.text)

//
if cbx_yymm.checked = true then
	ls_yymm = "Y"
else
	ls_yymm = "N"
end if

// 거래처집계
if rb_cust.checked = true then
	dw_4.retrieve( ls_usename, ld_sdate, ld_edate, ls_yymm )
	if dw_4.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "작업완료.",information!)
	end if
// 품목별집계
elseif rb_item.checked = true then
	dw_5.retrieve( ls_usename, ld_sdate, ld_edate, ls_yymm )
	if dw_5.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "작업완료.",information!)
	end if
// 대분류집계
elseif rb_category.checked = true then
	dw_6.retrieve( ls_usename, ld_sdate, ld_edate, ls_yymm )
	if dw_6.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "작업완료.",information!)
	end if
else
	dw_1.retrieve( ls_usename, "%", ld_sdate, ld_edate )
	if dw_1.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "작업완료.",information!)
	end if
end if

//
em_1.setfocus()


end event

type gb_3 from w_inheritance`gb_3 within w_oidaydo_use
integer x = 1138
integer y = 0
integer width = 1115
integer height = 240
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oidaydo_use
integer y = 244
integer width = 4274
integer height = 160
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oidaydo_use
integer x = 2944
integer y = 0
integer width = 814
integer height = 240
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidaydo_use
integer x = 64
integer y = 172
integer width = 101
integer height = 76
integer taborder = 60
boolean vscrollbar = false
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type em_1 from editmask within w_oidaydo_use
integer x = 1399
integer y = 136
integer width = 407
integer height = 76
integer taborder = 240
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

event modified;//
em_2.setfocus()

end event

type em_2 from editmask within w_oidaydo_use
integer x = 1810
integer y = 136
integer width = 407
integer height = 76
integer taborder = 270
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

type pb_1 from picturebutton within w_oidaydo_use
event mousemove pbm_mousemove
integer x = 3355
integer y = 64
integer width = 187
integer height = 144
integer taborder = 280
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
datawindow dwxls

choose case is_dw
	case "dw_1"
		dwxls = dw_1
	case "dw_2"
		dwxls = dw_2
	case "dw_3"
		dwxls = dw_3
	case "dw_4"
		dwxls = dw_4
	case "dw_5"
		dwxls = dw_5
	case else
		MessageBox("확인","해당하는 Datawindow를 선택하시기 바랍니다.")
		RETURN
end choose

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		end if
		MessageBox("확인","작업완료")
	end if
end if
end event

type st_1 from statictext within w_oidaydo_use
integer x = 1166
integer y = 52
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "용도별"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oidaydo_use
integer x = 1399
integer y = 52
integer width = 690
integer height = 80
integer taborder = 200
boolean bringtotop = true
string dataobject = "d_whusename_s"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 용도별 
string ls_usename

idwc_usename.reset()
dw_3.reset()
dw_3.insertrow(0)  

dw_3.getchild("use_name", idwc_usename)
idwc_usename.settransobject(sqlca)
idwc_usename.accepttext()
//idwc_usename.setitem(1, "use_name","전체 용도별")
//idwc_usename.accepttext()
//
//dw_3.object.use_name[1] = "전체 용도별"

end event

type st_4 from statictext within w_oidaydo_use
integer x = 1166
integer y = 136
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oidaydo_use
integer x = 73
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

type ddlb_fld from dropdownlistbox within w_oidaydo_use
integer x = 261
integer y = 292
integer width = 480
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

type ddlb_dwtitles from dropdownlistbox within w_oidaydo_use
integer x = 302
integer y = 304
integer width = 311
integer height = 88
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
end type

type st_7 from statictext within w_oidaydo_use
integer x = 759
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

type sle_value from singlelineedit within w_oidaydo_use
integer x = 1248
integer y = 300
integer width = 517
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

type cb_1 from commandbutton within w_oidaydo_use
integer x = 1778
integer y = 300
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_2"
		arg_dw = dw_2
	case "dw_4"
		arg_dw = dw_4
	case "dw_5"
		arg_dw = dw_5
	case "dw_6"
		arg_dw = dw_6		
	case else
		MessageBox("확인","해당하는 Datawindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidaydo_use
integer x = 1943
integer y = 300
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_2"
		arg_dw = dw_2
	case "dw_4"
		arg_dw = dw_4
	case "dw_5"
		arg_dw = dw_5
	case "dw_6"
		arg_dw = dw_6		
	case else
		MessageBox("확인","해당하는 Datawindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_3 from commandbutton within w_oidaydo_use
integer x = 2107
integer y = 300
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_2"
		arg_dw = dw_2
	case "dw_4"
		arg_dw = dw_4
	case "dw_5"
		arg_dw = dw_5
	case "dw_6"
		arg_dw = dw_6		
	case else
		MessageBox("확인","해당하는 Datawindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidaydo_use
integer x = 2272
integer y = 300
integer width = 160
integer height = 76
integer taborder = 250
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
		arg_dw = dw_1
	case "dw_2"
		arg_dw = dw_2
	case "dw_4"
		arg_dw = dw_4
	case "dw_5"
		arg_dw = dw_5
	case "dw_6"
		arg_dw = dw_6		
	case else
		MessageBox("확인","해당하는 Datawindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_yymm from checkbox within w_oidaydo_use
integer x = 2459
integer y = 340
integer width = 320
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "년월별"
end type

type dw_4 from datawindow within w_oidaydo_use
integer x = 169
integer y = 604
integer width = 1161
integer height = 772
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_usect1"
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
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_1 from checkbox within w_oidaydo_use
integer x = 2917
integer y = 340
integer width = 466
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

if dw_1.visible = true then
	arg_dw = dw_1
elseif dw_4.visible = true then
	arg_dw = dw_4
elseif dw_5.visible = true then
	arg_dw = dw_5
elseif dw_6.visible = true then
	arg_dw = dw_6
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
	RETURN
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type cb_4 from commandbutton within w_oidaydo_use
integer x = 2304
integer y = 64
integer width = 594
integer height = 144
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "용도별 품목관리"
end type

event clicked;// 용도별 품목관리
if IsValid(w_all_main) then 
	OpenSheet( w_cdgroupitem_use,  w_all_main, 5, original! )
end if

end event

type rb_cust from radiobutton within w_oidaydo_use
integer x = 2459
integer y = 276
integer width = 434
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처집계"
boolean checked = true
end type

event clicked;// 거래처집계
if this.checked = true then
	cbx_yymm.enabled = true
	cbx_yymm.checked = true
	
	dw_4.visible = true
	dw_5.visible = false
	dw_6.visible = false
	dw_1.visible = false
end if

end event

type rb_item from radiobutton within w_oidaydo_use
integer x = 2917
integer y = 276
integer width = 434
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품목별집계"
end type

event clicked;// 품목별집계
if this.checked = true then
	cbx_yymm.enabled = true
	cbx_yymm.checked = true
	
	dw_5.visible = true
	dw_6.visible = false
	dw_4.visible = false
	dw_1.visible = false
end if

end event

type dw_5 from datawindow within w_oidaydo_use
integer x = 1385
integer y = 604
integer width = 1161
integer height = 772
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_usect2"
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
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type rb_1 from radiobutton within w_oidaydo_use
integer x = 3899
integer y = 276
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "원본"
end type

event clicked;// 품목별집계
if this.checked = true then
	cbx_yymm.enabled = true
	cbx_yymm.checked = true
	
	dw_5.visible = false
	dw_4.visible = false
	dw_1.visible = true
end if

end event

type rb_category from radiobutton within w_oidaydo_use
integer x = 3374
integer y = 276
integer width = 521
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전략품목집계"
end type

event clicked;// 대분류집계
if this.checked = true then
	cbx_yymm.enabled = true
	cbx_yymm.checked = true
	
	dw_6.visible = true
	dw_5.visible = false
	dw_4.visible = false
	dw_1.visible = false
end if

end event

type dw_6 from datawindow within w_oidaydo_use
integer x = 2601
integer y = 604
integer width = 1161
integer height = 772
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_usect3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_date, ls_inside, ls_category, ls_name, ls_check, ls_sdate, ls_tdate
string ls_year1, ls_year2, ls_year, ls_sqlerrtext
int      l_rownum, l_inside
date   ld_sdate, ld_edate

if this.rowcount() < 1 then return

ls_name =  dwo.name	

IF MidA(ls_name,1, 8) = 'calc_amt' THEN
	
	ls_category = this.object.category[row]	

	ls_sdate = em_1.text
	ls_tdate  = em_2.text	
	
	 select substring(:ls_sdate,1,4) , substring(:ls_tdate,1,4), (case when :ls_name = 'calc_amt' then 0 else convert(integer,replace(:ls_name, 'calc_amt_', '')) end )
	 into :ls_year1,  :ls_year2, :l_rownum
	 from dual;
	
	 select convert(char(1), (:l_rownum)%2 + 1 )
	    into :ls_inside
	 from dual;
	 
	if ls_year1 = ls_year2 then
		
			select  a.year
			into :ls_year
			from 
			 (
			  select row_number() over (order by num asc)*2 - 2 rownum, substring(:ls_sdate,1,4) + num year
				from UF_NUM_table(12)
				where num between substring(:ls_sdate,6,2) and substring(:ls_tdate,6,2)
			  union all
			  select row_number() over (order by num asc)*2 - 1 rownum, substring(:ls_sdate,1,4) + num year
				from UF_NUM_table(12)
				where num between substring(:ls_sdate,6,2) and substring(:ls_tdate,6,2)
			  ) a
			  where a.rownum = :l_rownum;

			
	else	

			select  a.year
			into :ls_year
			from 
			(  
					select row_number() over (order by a.year asc)*2 - 2 rownum, a.year
					from 
				  ( 
					  select substring(:ls_sdate,1,4) + num year
					  from UF_NUM_table(12)
					where num between substring(:ls_sdate,6,2) and '12'
					union all
					select substring(:ls_tdate,1,4) + num year
					  from UF_NUM_table(12)
					where num between '01' and substring(:ls_tdate,6,2)
					) a
					union all
					  select row_number() over (order by a.year asc)*2 - 1 rownum, a.year
					  from 
					 ( 
					  select substring(:ls_sdate,1,4) + num year
					  from UF_NUM_table(12)
					where num between substring(:ls_sdate,6,2) and '12'
					union all
					select substring(:ls_tdate,1,4) + num year
					  from UF_NUM_table(12)
					where num between '01' and substring(:ls_tdate,6,2)
					) a  
			)  a
		     where a.rownum = :l_rownum;
	end if
	
	dw_7.dataobject = 'd_oidaydo_use_detail_list'
	dw_7.SetTransObject(sqlca)	
	
	dw_7.reset()
	dw_7.title = "전략품목집계상세: [" + MidA(ls_year,1,4) + "년 " +  MidA(ls_year,5,2) + "월] [ " + ls_category + "]"


	dw_7.width  = dw_1.width * 0.52
	dw_7.height = dw_1.height
	dw_7.x      = dw_1.x + ((dw_1.width - dw_7.width) / 2)
	dw_7.y      = dw_1.y		
	
	is_year          = ls_year
	is_inside       = ls_inside
	is_category  = ls_category
	
	dw_7.setredraw( false )
	dw_7.visible    = true 
	dw_7.bringtotop = true
	dw_7.retrieve(ls_year, ls_inside, ls_category)
	dw_7.setredraw( true )	
		
		
END IF	


IF MidA(ls_name,1, 12) = 'sum_calc_amt' THEN
	
	ls_category = this.object.category[row]	

	ls_sdate = em_1.text
	ls_tdate  = em_2.text	
	
	 select substring(:ls_sdate,1,4) , substring(:ls_tdate,1,4), (case when :ls_name = 'sum_calc_amt_1' then 0 
																			  	   when :ls_name = 'sum_calc_amt_1_1' then 1
																				    else convert(integer,replace(:ls_name, 'sum_calc_amt_', ''))																		
																				    end )
	 into :ls_year1,  :ls_year2, :l_rownum
	 from dual;
	
	ls_inside = '%'
	 
	if ls_year1 = ls_year2 then
		
			select  a.year
			into :ls_year
			from 
			 (
			  select row_number() over (order by num asc)-1 rownum, substring(:ls_sdate,1,4) + num year
				from UF_NUM_table(12)
				where num between substring(:ls_sdate,6,2) and substring(:ls_tdate,6,2)
			  ) a
			  where a.rownum = :l_rownum;

			
	else	

			select  a.year
			into :ls_year
			from 
			(  

					  select row_number() over (order by a.year asc)-1 rownum, a.year
					  from 
					 ( 
					  select substring(:ls_sdate,1,4) + num year
					  from UF_NUM_table(12)
					where num between substring(:ls_sdate,6,2) and '12'
					union all
					select substring(:ls_tdate,1,4) + num year
					  from UF_NUM_table(12)
					where num between '01' and substring(:ls_tdate,6,2)
					) a  
			)  a
		     where a.rownum = :l_rownum;
	end if
	
	dw_7.dataobject = 'd_oidaydo_use_detail_list'
	dw_7.SetTransObject(sqlca)	
	
	dw_7.reset()
	dw_7.title = "전략품목집계상세: [" + MidA(ls_year,1,4) + "년 " +  MidA(ls_year,5,2) + "월] [ " + ls_category + "]"


	dw_7.width  = dw_1.width * 0.52
	dw_7.height = dw_1.height
	dw_7.x      = dw_1.x + ((dw_1.width - dw_7.width) / 2)
	dw_7.y      = dw_1.y		
	
	is_year          = ls_year
	is_inside       = ls_inside
	is_category  = ls_category	
	
	dw_7.setredraw( false )
	dw_7.visible    = true 
	dw_7.bringtotop = true
	dw_7.retrieve(ls_year, ls_inside, ls_category)
	dw_7.setredraw( true )		
	
end if


if ls_name = 'grand_sum_calc_amt' then
	
	
	ld_sdate  = date(em_1.text)
	ld_edate  = date(em_2.text)	
	
	
	dw_7.dataobject = 'd_oidaydo_use_detail_list1'	
	dw_7.SetTransObject(sqlca)	
	
	dw_7.reset()
	dw_7.title = "전략품목집계총계"

	dw_7.width  = dw_1.width * 0.4
	dw_7.height = dw_1.height*0.7
	dw_7.x      = dw_1.x + ((dw_1.width - dw_7.width) / 2)
	dw_7.y      = dw_1.y			
	
	dw_7.setredraw( false )
	dw_7.visible    = true 
	dw_7.bringtotop = true
	dw_7.retrieve(ld_sdate, ld_edate)
	dw_7.setredraw( true )	
	
end if 


end event

type ddlb_op from dropdownlistbox within w_oidaydo_use
integer x = 937
integer y = 292
integer width = 302
integer height = 500
integer taborder = 310
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

type dw_7 from datawindow within w_oidaydo_use
boolean visible = false
integer x = 18
integer y = 932
integer width = 4594
integer height = 1012
integer taborder = 190
boolean bringtotop = true
boolean titlebar = true
string title = "전략품목집계상세"
string dataobject = "d_oidaydo_use_detail_list"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;
if dwo.name = 'b_1' then
	this.Object.DataWindow.Zoom = 78	
	this.print()
	this.Object.DataWindow.Zoom = 100
	MessageBox("확인","출력 완료")
end if

if dwo.name = 'b_2' then
	
	string  ls_Docname, ls_Named, ls_ExpandName
	integer ls_Value,   li_Pos,   li_value
	long    ll_cnt
	DataWindow dw_xls
	
	dw_xls = this

	
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
	
	if dw_xls.rowcount() > 0 then
		ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
		li_Pos = PosA(ls_Named, ".")
		ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
		if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_xls.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
				dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
		end if
		MessageBox("확인","작업완료")
	end if	
	
end if

end event

event rbuttondown;	string ls_cust_no, ls_cust_name

	ls_cust_no  = dw_7.object.cust_no[row]
	ls_cust_name  = dw_7.object.cust_name[row]
	
	dw_8.dataobject = 'd_oidaydo_use_detail_list2'
	dw_8.SetTransObject(sqlca)	
	
	dw_8.reset()
	dw_8.title = "["+ ls_cust_name + "]품목상세: [" + MidA(is_year,1,4) + "년 " +  MidA(is_year,5,2) + "월] [ " + is_category + "]"

	dw_8.width  = dw_1.width * 0.46
	dw_8.height = dw_1.height
	dw_8.x      = dw_1.x + ((dw_1.width - dw_8.width) / 2)
	dw_8.y      = dw_1.y
	
	dw_8.setredraw( false )
	dw_8.visible    = true 
	dw_8.bringtotop = true	
	dw_8.retrieve(is_year, is_inside, is_category, ls_cust_no)
	dw_8.setredraw( true )	
end event

type dw_8 from datawindow within w_oidaydo_use
boolean visible = false
integer x = 361
integer y = 1200
integer width = 3909
integer height = 1012
integer taborder = 200
boolean bringtotop = true
boolean titlebar = true
string title = "품목별집계상세"
string dataobject = "d_oidaydo_use_detail_list2"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;
if dwo.name = 'b_1' then
	this.Object.DataWindow.Zoom = 89	
	this.print()
	this.Object.DataWindow.Zoom = 100
	MessageBox("확인","출력 완료")
end if

if dwo.name = 'b_2' then
	
	string  ls_Docname, ls_Named, ls_ExpandName
	integer ls_Value,   li_Pos,   li_value
	long    ll_cnt
	DataWindow dw_xls
	
	dw_xls = this

	
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
	
	if dw_xls.rowcount() > 0 then
		ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
		li_Pos = PosA(ls_Named, ".")
		ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
		if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_xls.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
				dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
		end if
		MessageBox("확인","작업완료")
	end if	
	
end if

end event

type gb_4 from groupbox within w_oidaydo_use
integer x = 2272
integer width = 658
integer height = 240
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
end type

