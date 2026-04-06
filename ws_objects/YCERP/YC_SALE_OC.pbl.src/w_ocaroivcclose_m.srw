$PBExportHeader$w_ocaroivcclose_m.srw
$PBExportComments$수금마감(1998/04/21, 정재수)
forward
global type w_ocaroivcclose_m from w_inheritance
end type
type em_1 from editmask within w_ocaroivcclose_m
end type
type st_1 from statictext within w_ocaroivcclose_m
end type
type em_2 from editmask within w_ocaroivcclose_m
end type
type st_4 from statictext within w_ocaroivcclose_m
end type
type ddlb_fld from dropdownlistbox within w_ocaroivcclose_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ocaroivcclose_m
end type
type st_6 from statictext within w_ocaroivcclose_m
end type
type sle_value from singlelineedit within w_ocaroivcclose_m
end type
type cb_3 from commandbutton within w_ocaroivcclose_m
end type
type cb_4 from commandbutton within w_ocaroivcclose_m
end type
type cb_5 from commandbutton within w_ocaroivcclose_m
end type
type cb_6 from commandbutton within w_ocaroivcclose_m
end type
type st_2 from statictext within w_ocaroivcclose_m
end type
type ddlb_1 from dropdownlistbox within w_ocaroivcclose_m
end type
type cbx_all from checkbox within w_ocaroivcclose_m
end type
type ddlb_op from dropdownlistbox within w_ocaroivcclose_m
end type
end forward

global type w_ocaroivcclose_m from w_inheritance
integer width = 4160
integer height = 2028
string title = "수금마감(w_ocaroivcclose_m)"
boolean resizable = false
boolean center = true
em_1 em_1
st_1 st_1
em_2 em_2
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
st_2 st_2
ddlb_1 ddlb_1
cbx_all cbx_all
ddlb_op ddlb_op
end type
global w_ocaroivcclose_m w_ocaroivcclose_m

on w_ocaroivcclose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.cbx_all=create cbx_all
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_4
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.cb_6
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.ddlb_1
this.Control[iCurrent+15]=this.cbx_all
this.Control[iCurrent+16]=this.ddlb_op
end on

on w_ocaroivcclose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.cbx_all)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

ddlb_1.text = "전체"

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_ocaroivcclose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroivcclose_m
integer x = 32
integer y = 452
integer width = 4087
integer height = 1460
integer taborder = 50
string dataobject = "d_ocaroivc_openclose"
boolean livescroll = false
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

//is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_title from w_inheritance`st_title within w_ocaroivcclose_m
integer y = 24
integer width = 731
integer height = 140
string text = "수금마감"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivcclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivcclose_m
integer x = 2263
integer y = 64
integer taborder = 90
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
vtextalign vtextalign = top!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수금마감",parent, li_x, li_y)

end event

event pb_compute::clicked;//
datetime ldt_sdate, ldt_edate, ldt_close_date

ldt_sdate = datetime(date(em_1.text))
ldt_edate = datetime(date(em_2.text))

if em_1.text = '' then
	MessageBox("확인","수금기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = '' then
	MessageBox("확인","수금기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif ldt_edate < ldt_sdate then
	MessageBox("확인","수금기간을 잘못 입력하셨습니다.",information!)
	em_1.setfocus()
	RETURN
end if

if MessageBox("수금마감","수금마감을 하시겠습니까?",question!,okcancel!,2) = 2 then RETURN
	
ldt_close_date = wf_today()
UPDATE aroivc 
   SET open_close = 'C', close_date = :ldt_close_date
 WHERE oi_date BETWEEN :ldt_sdate AND :ldt_edate;	
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("매출마감","매출마감도중 오류가 발생하였습니다.",information!)
else
	COMMIT;
	MessageBox("매출마감","매출마감이 이루어졌습니다.",information!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivcclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ocaroivcclose_m
integer x = 2455
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivcclose_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivcclose_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocaroivcclose_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivcclose_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivcclose_m
integer x = 2066
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_openclose
date   ld_sdate, ld_edate

choose case ddlb_1.text
	case "전체"
		ls_openclose = "%"
	case "이관"
		ls_openclose = "T"
	case "오픈"
		ls_openclose = "O"
	case "마감"
		ls_openclose = "C"
end choose

ld_sdate  = date(em_1.text)
ld_edate  = date(em_2.text)

dw_1.retrieve( ld_sdate, ld_edate, ls_openclose )

end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivcclose_m
integer x = 32
integer y = 244
integer width = 4087
integer height = 188
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivcclose_m
integer x = 814
integer y = 16
integer width = 1189
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivcclose_m
integer x = 2030
integer y = 16
integer width = 649
integer height = 216
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroivcclose_m
boolean visible = false
integer taborder = 60
end type

type em_1 from editmask within w_ocaroivcclose_m
integer x = 1189
integer y = 56
integer width = 375
integer height = 76
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
////
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

type st_1 from statictext within w_ocaroivcclose_m
integer x = 850
integer y = 56
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "수금기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_2 from editmask within w_ocaroivcclose_m
integer x = 1573
integer y = 56
integer width = 375
integer height = 76
integer taborder = 61
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
string displaydata = "6"
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
////
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

type st_4 from statictext within w_ocaroivcclose_m
integer x = 73
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

type ddlb_fld from dropdownlistbox within w_ocaroivcclose_m
integer x = 261
integer y = 312
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

type ddlb_dwtitles from dropdownlistbox within w_ocaroivcclose_m
integer x = 293
integer y = 324
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

type st_6 from statictext within w_ocaroivcclose_m
integer x = 731
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

type sle_value from singlelineedit within w_ocaroivcclose_m
integer x = 1221
integer y = 316
integer width = 526
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

type cb_3 from commandbutton within w_ocaroivcclose_m
integer x = 1755
integer y = 316
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_ocaroivcclose_m
integer x = 1920
integer y = 316
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_ocaroivcclose_m
integer x = 2085
integer y = 316
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_ocaroivcclose_m
integer x = 2249
integer y = 316
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_2 from statictext within w_ocaroivcclose_m
integer x = 850
integer y = 140
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "마감구분"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_ocaroivcclose_m
integer x = 1189
integer y = 136
integer width = 549
integer height = 324
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string item[] = {"전체","오픈","이관","마감"}
borderstyle borderstyle = stylelowered!
end type

type cbx_all from checkbox within w_ocaroivcclose_m
integer x = 78
integer y = 240
integer width = 233
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
string text = "전체"
end type

event clicked;// 전체
string  ls_chk
long    ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next


end event

type ddlb_op from dropdownlistbox within w_ocaroivcclose_m
integer x = 910
integer y = 308
integer width = 302
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

