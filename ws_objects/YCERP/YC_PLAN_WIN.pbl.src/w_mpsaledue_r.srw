$PBExportHeader$w_mpsaledue_r.srw
$PBExportComments$납기일별 생산계획 조회(1998/05/06, 이인호)
forward 
global type w_mpsaledue_r from w_inheritance
end type
type em_1 from editmask within w_mpsaledue_r
end type
type em_2 from editmask within w_mpsaledue_r
end type
type rb_1 from radiobutton within w_mpsaledue_r
end type
type rb_2 from radiobutton within w_mpsaledue_r
end type
type rb_3 from radiobutton within w_mpsaledue_r
end type
type dw_3 from datawindow within w_mpsaledue_r
end type
type st_1 from statictext within w_mpsaledue_r
end type
type dw_area from datawindow within w_mpsaledue_r
end type
type st_2 from statictext within w_mpsaledue_r
end type
type st_3 from statictext within w_mpsaledue_r
end type
type st_4 from statictext within w_mpsaledue_r
end type
type ddlb_fld from dropdownlistbox within w_mpsaledue_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsaledue_r
end type
type st_5 from statictext within w_mpsaledue_r
end type
type ddlb_op from dropdownlistbox within w_mpsaledue_r
end type
type sle_value from singlelineedit within w_mpsaledue_r
end type
type cb_1 from commandbutton within w_mpsaledue_r
end type
type cb_2 from commandbutton within w_mpsaledue_r
end type
type cb_3 from commandbutton within w_mpsaledue_r
end type
type cb_5 from commandbutton within w_mpsaledue_r
end type
type gb_15 from groupbox within w_mpsaledue_r
end type
end forward

global type w_mpsaledue_r from w_inheritance
integer width = 4183
integer height = 2216
string title = "생산계획 조회(납기일별)(w_mpsaledue_r)"
long backcolor = 78160032
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_3 dw_3
st_1 st_1
dw_area dw_area
st_2 st_2
st_3 st_3
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
gb_15 gb_15
end type
global w_mpsaledue_r w_mpsaledue_r

type variables
st_print i_print
date id_date1, id_date2
string is_dw, is_wc
datawindowchild idwc_wc
end variables

on w_mpsaledue_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_3=create dw_3
this.st_1=create st_1
this.dw_area=create dw_area
this.st_2=create st_2
this.st_3=create st_3
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
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.dw_area
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.gb_15
end on

on w_mpsaledue_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_3)
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
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

id_date1 = today()
id_date2 = today()

dw_2.sharedata(dw_1)
dw_1.visible = false

// 작업장
dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_3.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//
em_1.setfocus()


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_2.width  = newwidth  - (32 * 2)
dw_2.height = newheight - dw_2.y - 32


end event

type pb_save from w_inheritance`pb_save within w_mpsaledue_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsaledue_r
integer x = 37
integer y = 176
integer width = 96
integer height = 64
integer taborder = 50
string dataobject = "d_mpsaledue_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsaledue_r
integer x = 32
integer y = 20
integer width = 1422
integer height = 132
string text = "생산계획 조회(납기일별)"
end type

type st_tips from w_inheritance`st_tips within w_mpsaledue_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsaledue_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsaledue_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsaledue_r
integer x = 3671
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsaledue_r
integer x = 3479
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_2.getrow() <= 0 THEN
   RETURN
END IF

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 납기일별 생산계획내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsaledue_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpsaledue_r
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_mpsaledue_r
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsaledue_r
integer x = 3282
integer y = 64
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_date, ls_flag, ls_wc

ls_date = trim(em_1.text)
if isdate(ls_date) = false then
	em_1.setfocus()
	RETURN
end if
id_date1 = date(ls_date)

ls_date = trim(em_2.text)
if isdate(ls_date) = false then
	em_2.setfocus()
	RETURN
end if
id_date2 = date(ls_date)

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

// 작업장명
ls_wc = trim(is_wc) + "%"

if rb_1.checked = true then		// 전체
	ls_flag = "%"   
else
	if rb_2.checked = true then	// 생산계획
		ls_flag = "Y"
	else									// 미생산계획
		ls_flag = "N"
	end if
end if

//
dw_2.reset()
dw_2.retrieve( ls_wc, id_date1, id_date2, ls_flag, ls_area )
if dw_1.rowcount() < 1 then
	MessageBox("에러","조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsaledue_r
integer x = 2446
integer y = 16
integer width = 782
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsaledue_r
integer y = 244
integer width = 4082
integer height = 184
integer taborder = 80
integer textsize = -9
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpsaledue_r
integer x = 3250
integer y = 16
integer width = 645
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsaledue_r
integer x = 32
integer y = 444
integer width = 4082
integer height = 1644
integer taborder = 60
string dataobject = "d_mpsaledue_t"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rbuttondown;int li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
CHOOSE CASE gs_print_control
	CASE 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
	CASE 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
END CHOOSE

end event

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
////
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
//


end event

type em_1 from editmask within w_mpsaledue_r
integer x = 2821
integer y = 60
integer width = 366
integer height = 76
integer taborder = 100
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


end event

type em_2 from editmask within w_mpsaledue_r
integer x = 2821
integer y = 136
integer width = 366
integer height = 76
integer taborder = 110
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


end event

type rb_1 from radiobutton within w_mpsaledue_r
integer x = 2505
integer y = 296
integer width = 219
integer height = 60
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
boolean checked = true
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type rb_2 from radiobutton within w_mpsaledue_r
integer x = 2738
integer y = 296
integer width = 352
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "생산계획"
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type rb_3 from radiobutton within w_mpsaledue_r
integer x = 2738
integer y = 352
integer width = 416
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미생산계획"
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type dw_3 from datawindow within w_mpsaledue_r
integer x = 1792
integer y = 140
integer width = 603
integer height = 80
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_whwc_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
is_wc = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
	

end event

type st_1 from statictext within w_mpsaledue_r
integer x = 1541
integer y = 140
integer width = 251
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
boolean enabled = false
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpsaledue_r
integer x = 1797
integer y = 60
integer width = 521
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_2 from statictext within w_mpsaledue_r
integer x = 2478
integer y = 64
integer width = 334
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpsaledue_r
integer x = 1541
integer y = 60
integer width = 251
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsaledue_r
integer x = 82
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_mpsaledue_r
integer x = 270
integer y = 316
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

type ddlb_dwtitles from dropdownlistbox within w_mpsaledue_r
integer x = 311
integer y = 324
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

type st_5 from statictext within w_mpsaledue_r
integer x = 754
integer y = 332
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

type ddlb_op from dropdownlistbox within w_mpsaledue_r
integer x = 923
integer y = 316
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpsaledue_r
integer x = 1243
integer y = 320
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

type cb_1 from commandbutton within w_mpsaledue_r
integer x = 1815
integer y = 320
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

type cb_2 from commandbutton within w_mpsaledue_r
integer x = 1979
integer y = 320
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

type cb_3 from commandbutton within w_mpsaledue_r
integer x = 2144
integer y = 320
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

type cb_5 from commandbutton within w_mpsaledue_r
integer x = 2309
integer y = 320
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

type gb_15 from groupbox within w_mpsaledue_r
integer x = 1513
integer y = 16
integer width = 910
integer height = 216
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

