$PBExportHeader$w_mpsaledue_r.srw
$PBExportComments$납기일별 생산계획 조회(1998/05/06, 이인호)
forward
global type w_mpsaledue_r from w_inheritance
end type
type st_22 from statictext within w_mpsaledue_r
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
type gb_15 from groupbox within w_mpsaledue_r
end type
end forward

global type w_mpsaledue_r from w_inheritance
integer width = 3694
integer height = 2216
string title = "납기일별 생산계획 조회(w_mpsaledue_r)"
long backcolor = 78160032
st_22 st_22
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_3 dw_3
st_1 st_1
dw_area dw_area
gb_15 gb_15
end type
global w_mpsaledue_r w_mpsaledue_r

type variables
st_print i_print
date id_date1, id_date2
string is_wc
datawindowchild idwc_wc
end variables

on w_mpsaledue_r.create
int iCurrent
call super::create
this.st_22=create st_22
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_3=create dw_3
this.st_1=create st_1
this.dw_area=create dw_area
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_22
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.dw_area
this.Control[iCurrent+10]=this.gb_15
end on

on w_mpsaledue_r.destroy
call super::destroy
destroy(this.st_22)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(),'yyyy/mm/dd')
id_date1 = today()
em_2.text = string(today(),'yyyy/mm/dd')
id_date2 = today()
em_1.setfocus()

dw_2.sharedata(dw_1)
dw_1.visible = false

dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_3.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천
end event

event resize;call super::resize;dw_2.width  = this.width  - 119
dw_2.height = this.height - 552

end event

type pb_save from w_inheritance`pb_save within w_mpsaledue_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsaledue_r
integer x = 1499
integer y = 60
integer width = 119
integer height = 84
integer taborder = 50
string dataobject = "d_mpsaledue_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpsaledue_r
integer x = 32
integer y = 412
integer width = 3575
integer height = 1664
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

type st_title from w_inheritance`st_title within w_mpsaledue_r
integer x = 46
integer y = 32
integer width = 1403
string text = "납기일별 생산계획 조회"
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
integer x = 3387
integer y = 44
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsaledue_r
integer x = 3195
integer y = 44
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
integer x = 2999
integer y = 44
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date , ls_flag, ls_wc

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

ls_wc = trim(is_wc) + "%"  //작업장명
if rb_1.checked = true then
	ls_flag = "%"   //생산계획여부
else
	if rb_2.checked = true then
		ls_flag = "Y"
	else
		ls_flag = "N"
	end if
end if

dw_2.reset()
dw_2.retrieve(ls_wc, id_date1, id_date2, ls_flag, dw_area.object.area[1])
if dw_1.rowcount() < 1 then
	messagebox("에러","조회한 자료가 없습니다",Exclamation!)
end if
end event

type gb_3 from w_inheritance`gb_3 within w_mpsaledue_r
boolean visible = false
integer x = 498
integer y = 232
integer width = 2994
integer height = 76
integer taborder = 70
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpsaledue_r
integer x = 613
integer y = 216
integer width = 2994
integer height = 180
integer taborder = 80
integer textsize = -9
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpsaledue_r
integer x = 2958
integer y = 4
integer width = 645
end type

type st_22 from statictext within w_mpsaledue_r
integer x = 3131
integer y = 292
integer width = 55
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpsaledue_r
integer x = 2752
integer y = 280
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
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpsaledue_r
integer x = 3186
integer y = 280
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
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpsaledue_r
integer x = 1509
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
integer x = 1737
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
integer x = 2098
integer y = 296
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
integer x = 869
integer y = 280
integer width = 622
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
integer x = 649
integer y = 296
integer width = 224
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
boolean enabled = false
string text = "작업장:"
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpsaledue_r
integer x = 73
integer y = 284
integer width = 503
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type gb_15 from groupbox within w_mpsaledue_r
integer x = 37
integer y = 216
integer width = 567
integer height = 180
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

