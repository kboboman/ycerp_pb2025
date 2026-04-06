$PBExportHeader$w_ocaroivcday_r.srw
$PBExportComments$일별 수금현황(1998/05/17, 정재수)
forward
global type w_ocaroivcday_r from w_inheritance
end type
type em_1 from editmask within w_ocaroivcday_r
end type
type st_1 from statictext within w_ocaroivcday_r
end type
type st_2 from statictext within w_ocaroivcday_r
end type
type rb_1 from radiobutton within w_ocaroivcday_r
end type
type rb_2 from radiobutton within w_ocaroivcday_r
end type
type rb_3 from radiobutton within w_ocaroivcday_r
end type
type cb_1 from commandbutton within w_ocaroivcday_r
end type
type cb_2 from commandbutton within w_ocaroivcday_r
end type
type rb_4 from radiobutton within w_ocaroivcday_r
end type
type rb_5 from radiobutton within w_ocaroivcday_r
end type
type gb_4 from groupbox within w_ocaroivcday_r
end type
type gb_5 from groupbox within w_ocaroivcday_r
end type
end forward

shared variables

end variables

global type w_ocaroivcday_r from w_inheritance
integer x = 5
integer y = 48
integer width = 5266
integer height = 2920
string title = "일별 수금현황(w_ocaroivcday_r)"
em_1 em_1
st_1 st_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cb_1 cb_1
cb_2 cb_2
rb_4 rb_4
rb_5 rb_5
gb_4 gb_4
gb_5 gb_5
end type
global w_ocaroivcday_r w_ocaroivcday_r

type variables
string is_sale_flag
boolean ib_check, ib_exec
integer ii_zoom = 100, ii_win_w, ii_win_h, ii_dw_w, ii_dw_h, ii_st1_w, ii_st2_w , ii_st1_x


end variables

forward prototypes
public function integer wf_size_it ()
public function integer wf_resize_it ()
end prototypes

public function integer wf_size_it ();ii_win_w = this.width
ii_win_h = this.height
ii_dw_w = dw_1.width
ii_dw_h = dw_1.height
return 1

end function

public function integer wf_resize_it ();ib_exec = false
this.hide()
dw_1.height = ii_dw_h + this.height - ii_win_h 
dw_1.width = ii_dw_w + this.width - ii_win_w
ib_exec = true
return 1

end function

on w_ocaroivcday_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cb_1=create cb_1
this.cb_2=create cb_2
this.rb_4=create rb_4
this.rb_5=create rb_5
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.rb_5
this.Control[iCurrent+11]=this.gb_4
this.Control[iCurrent+12]=this.gb_5
end on

on w_ocaroivcday_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

int rc
dw_2.insertrow(0)
ib_check = false
em_1.text = string(today(), 'YYYY/MM/DD')
randomize(0)
rc = wf_size_it()
ib_exec = true
end event

event resize;call super::resize;int rc
if ib_exec then
	rc = wf_resize_it()
end if
end event

type pb_save from w_inheritance`pb_save within w_ocaroivcday_r
boolean visible = false
integer taborder = 100
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroivcday_r
string tag = "d_ocaroivcday_r5"
integer x = 37
integer y = 272
integer width = 5152
integer height = 2508
integer taborder = 150
string title = "d_ocaroivcday_r4"
string dataobject = "d_ocaroivcday_r4"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroivcday_r
integer x = 2560
integer y = 60
integer width = 361
integer height = 76
integer taborder = 10
string dataobject = "d_ocaroivcday_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_ocaroivcday_r
integer y = 40
string text = "일별 수금현황"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivcday_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivcday_r
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivcday_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_ocaroivcday_r
integer x = 4955
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivcday_r
integer x = 4763
integer y = 60
integer taborder = 70
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print
date   ld_start, ld_end
string ls_start, ls_end, ls_curr, ls_start1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
ls_curr = dw_2.getitemstring(dw_2.getrow(), "curr_type")
if isnull(ls_curr) or ls_curr = '' then
	messagebox("확인","통화를 선택하세요!", information!)
	dw_2.setfocus()
	return
elseif em_1.text = '' then
	messagebox("확인","수금일자을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_start1 = em_1.text
ls_start  = LeftA(ls_start1, 4) + MidA(ls_start1, 6, 2) + '01'
ls_end    = LeftA(ls_start1, 4) + MidA(ls_start1, 6, 2) + RightA(ls_start1, 2)

ld_start = date(LeftA(ls_start, 4) + '-' + MidA(ls_start, 5, 2) + '-' + RightA(ls_start, 2))
ld_end   = date(em_1.text)

string ls_sale_type
if rb_1.checked = true then
	ls_sale_type = '%'
elseif rb_2.checked = true then
	ls_sale_type = 'L%'
else
	ls_sale_type = 'A%'
end if

if ls_curr = 'WON' then
	l_print.name = 'd_ocaroivcday_r7'
   l_print.sdate = ld_start
   l_print.edate = ld_end
   l_print.yymm1 = ls_start
   l_print.yymm2 = ls_end
   l_print.yymm3 = ls_sale_type	
else
	l_print.name = 'd_ocaroivcday_r5'
   l_print.sdate = ld_start
   l_print.edate = ld_end
   l_print.yymm3 = ls_sale_type	
end if

l_print.class = ls_curr
l_print.st_datawindow  = dw_1

if rb_4.checked = true then
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 일별 수금현황을 출력합니다." 
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=82'
else
	l_print.st_print_sheet = " 프린트용지 : B4"
	l_print.st_print_desc  = " 이 프로그램은 일별 수금현황을 출력합니다." 
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
end if

// LANDSCAPE:1, PORTRAIT:2
// SIZE 8-A3, 9-A4, 12-B4
//gs_print_control = 'DataWindow.Print.Orientation=2 Datawindow.Zoom=100'

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivcday_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocaroivcday_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivcday_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivcday_r
integer x = 4571
integer y = 60
integer taborder = 50
end type

event pb_retrieve::clicked;date ld_start, ld_end
string ls_start, ls_end, ls_curr, ls_start1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
ls_curr = dw_2.getitemstring(dw_2.getrow(), "curr_type")
if isnull(ls_curr) or ls_curr = '' then
	messagebox("확인","통화를 선택하세요!", information!)
	dw_2.setfocus()
	return
elseif em_1.text = '' then
	messagebox("확인","수금일자을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_start1 = em_1.text
ls_start  = LeftA(ls_start1, 4) + MidA(ls_start1, 6, 2) + '01'
ls_end    = LeftA(ls_start1, 4) + MidA(ls_start1, 6, 2) + RightA(ls_start1, 2)

ld_start  = date(LeftA(ls_start, 4) + '-' + MidA(ls_start, 5, 2) + '-' + RightA(ls_start, 2))
ld_end    = date(em_1.text)

string ls_sale_type
if rb_1.checked = true then
	ls_sale_type = '%'
elseif rb_2.checked = true then
	ls_sale_type = 'L%'
else
	ls_sale_type = 'A%'
end if
	
if ls_curr = 'WON' then
	dw_1.dataobject = 'd_ocaroivcday_r4'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_curr, ld_start, ld_end, ls_start, ls_end, ls_sale_type)
	ii_zoom = 79
	dw_1.Object.DataWindow.Zoom = ii_zoom
else
	dw_1.dataobject = 'd_ocaroivcday_r5'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_curr, ld_start, ld_end, ls_sale_type)
	ii_zoom = 100
	dw_1.Object.DataWindow.Zoom = ii_zoom
end if

ib_check = true

end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivcday_r
integer x = 2240
integer y = 20
integer width = 731
integer height = 220
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivcday_r
boolean visible = false
integer x = 23
integer y = 232
integer width = 5175
integer height = 2560
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivcday_r
integer x = 4535
integer y = 16
integer width = 645
integer height = 216
integer taborder = 0
end type

type em_1 from editmask within w_ocaroivcday_r
integer x = 2569
integer y = 144
integer width = 352
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

type st_1 from statictext within w_ocaroivcday_r
integer x = 2272
integer y = 72
integer width = 283
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "통화선택"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ocaroivcday_r
integer x = 2272
integer y = 140
integer width = 283
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "수금일자"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_ocaroivcday_r
integer x = 1719
integer y = 76
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_ocaroivcday_r
integer x = 1952
integer y = 72
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "수출"
end type

type rb_3 from radiobutton within w_ocaroivcday_r
integer x = 1952
integer y = 148
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "내수"
end type

type cb_1 from commandbutton within w_ocaroivcday_r
integer x = 4142
integer y = 36
integer width = 338
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확대"
end type

event clicked;ii_zoom ++
dw_1.Object.DataWindow.Zoom = ii_zoom
end event

type cb_2 from commandbutton within w_ocaroivcday_r
integer x = 4142
integer y = 132
integer width = 338
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "축소"
end type

event clicked;ii_zoom --
dw_1.Object.DataWindow.Zoom = ii_zoom
end event

type rb_4 from radiobutton within w_ocaroivcday_r
integer x = 3086
integer y = 120
integer width = 219
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "A4"
boolean checked = true
end type

type rb_5 from radiobutton within w_ocaroivcday_r
integer x = 3305
integer y = 120
integer width = 219
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "B4"
end type

type gb_4 from groupbox within w_ocaroivcday_r
integer x = 1696
integer y = 20
integer width = 512
integer height = 220
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_ocaroivcday_r
integer x = 3035
integer y = 20
integer width = 530
integer height = 220
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "용지설정"
end type

