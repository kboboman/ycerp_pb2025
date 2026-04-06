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
type rb_6 from radiobutton within w_ocaroivcday_r
end type
type cb_3 from commandbutton within w_ocaroivcday_r
end type
type cb_4 from commandbutton within w_ocaroivcday_r
end type
type rb_7 from radiobutton within w_ocaroivcday_r
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
integer width = 4187
integer height = 2460
string title = "일별 수금현황(w_ocaroivcday_r)"
string icon = "Form!"
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
rb_6 rb_6
cb_3 cb_3
cb_4 cb_4
rb_7 rb_7
gb_4 gb_4
gb_5 gb_5
end type
global w_ocaroivcday_r w_ocaroivcday_r

type variables
string  is_sale_flag
boolean ib_check, ib_exec
integer ii_zoom = 100, ii_top, ii_left, ii_win_w, ii_win_h, ii_dw_w, ii_dw_h, ii_st1_w, ii_st2_w , ii_st1_x


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
dw_1.width  = ii_dw_w + this.width  - ii_win_w
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
this.rb_6=create rb_6
this.cb_3=create cb_3
this.cb_4=create cb_4
this.rb_7=create rb_7
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
this.Control[iCurrent+11]=this.rb_6
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_4
this.Control[iCurrent+14]=this.rb_7
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.gb_5
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
destroy(this.rb_6)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.rb_7)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_modify
int    rc

st_1.visible = false
dw_2.visible = false

dw_2.insertrow(0)
ib_check  = false
em_1.text = string(today(), 'YYYY/MM/DD')

randomize(0)
rc = wf_size_it()
ib_exec = true

dw_1.setredraw( false )
dw_1.Modify("dw_4.width = 6533")	
dw_1.Modify("dw_3.width = 6533")	
dw_1.Modify("dw_1.width = 6533")	
dw_1.Modify("dw_2.width = 6533")	
dw_1.setredraw( true )

ls_modify = ls_modify + ' DataWindow.Print.Paper.Source=8'
dw_1.modify( ls_modify )

rb_7.checked = true
rb_7.triggerevent( clicked! )


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_ocaroivcday_r
boolean visible = false
integer taborder = 100
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroivcday_r
string tag = "d_ocaroivcday_r7"
integer x = 37
integer y = 436
integer width = 4073
integer height = 1892
integer taborder = 150
string title = "d_ocaroivcday_r4"
string dataobject = "d_ocaroivcday_r7"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ocaroivcday_r
integer x = 32
integer y = 20
integer width = 1024
integer height = 140
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
integer x = 3881
integer y = 68
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivcday_r
integer x = 3689
integer y = 68
integer taborder = 70
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then RETURN

PrintSetup()
if MessageBox("확인", "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	dw_1.print()
end if

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
integer x = 3497
integer y = 68
integer taborder = 50
end type

event pb_retrieve::clicked;//
date    ld_start, ld_end
string  ls_start, ls_end, ls_curr, ls_start1, ls_modify, ls_sale_type
integer li_top, li_left

ib_check = true

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
ls_curr = dw_2.getitemstring(dw_2.getrow(), "curr_type")
if isnull(ls_curr) or ls_curr = '' then
	MessageBox("확인","통화를 선택하세요!", information!)
	dw_2.setfocus()
	return
end if

if em_1.text = '' then
	MessageBox("확인","수금일자을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_start1 = em_1.text
ls_start  = LeftA(ls_start1, 4) + MidA(ls_start1, 6, 2) + '01'
ls_end    = LeftA(ls_start1, 4) + MidA(ls_start1, 6, 2) + RightA(ls_start1, 2)

ld_start  = date(LeftA(ls_start, 4) + '-' + MidA(ls_start, 5, 2) + '-' + RightA(ls_start, 2))
ld_end    = date(em_1.text)

if rb_1.checked = true then
	ls_sale_type = '%'
elseif rb_2.checked = true then
	ls_sale_type = 'L%'
else
	ls_sale_type = 'A%'
end if
	
if ls_curr = 'WON' then
	dw_1.dataobject = 'd_ocaroivcday_r7'	//	dw_1.dataobject = 'd_ocaroivcday_r4'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_curr, ld_start, ld_end, ls_start, ls_end, ls_sale_type)
else
	dw_1.dataobject = 'd_ocaroivcday_r5'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_curr, ld_start, ld_end, ls_sale_type)
end if


if rb_4.checked = true then			// A4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9  Datawindow.Zoom=81'
	dw_1.modify( ls_modify )
elseif rb_5.checked = true then		// B4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
elseif rb_6.checked = true then		// LTR 11x17
	li_left = 1200	
	
	dw_1.setredraw( false )
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=17 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )

	dw_1.Modify("dw_4.x = " + string(li_left) )	
	dw_1.Modify("dw_3.x = " + string(li_left) )	
	dw_1.Modify("dw_1.x = " + string(li_left) )	
	dw_1.Modify("dw_2.x = " + string(li_left) )	
	dw_1.setredraw( true )
else
	dw_1.setredraw( false )

	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=8 Datawindow.Zoom=100'	
	dw_1.modify( ls_modify )

	li_top = integer(dw_1.Describe('dw_4.y'))
	li_top = li_top + 60
	dw_1.Modify("dw_4.y = " + string(li_top) )	
	
	li_top = integer(dw_1.Describe('dw_3.y'))
	li_top = li_top + 60
	dw_1.Modify("dw_3.y = " + string(li_top) )	

	li_top = integer(dw_1.Describe('dw_1.y'))
	li_top = li_top + 60
	dw_1.Modify("dw_1.y = " + string(li_top) )	

	li_top = integer(dw_1.Describe('dw_2.y'))
	li_top = li_top + 60
	dw_1.Modify("dw_2.y = " + string(li_top) )	

	// 왼쪽마진
	li_left = 600	
	
	dw_1.Modify("dw_4.x = " + string(li_left) )	
	dw_1.Modify("dw_3.x = " + string(li_left) )	
	dw_1.Modify("dw_1.x = " + string(li_left) )	
	dw_1.Modify("dw_2.x = " + string(li_left) )	
	dw_1.setredraw( true )	
end if


end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivcday_r
integer x = 37
integer y = 252
integer width = 4073
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivcday_r
integer x = 1664
integer y = 16
integer width = 453
integer height = 220
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivcday_r
integer x = 3461
integer y = 16
integer width = 645
integer height = 220
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroivcday_r
integer x = 334
integer y = 188
integer width = 361
integer height = 76
integer taborder = 10
boolean enabled = false
string dataobject = "d_ocaroivcday_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//
if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type em_1 from editmask within w_ocaroivcday_r
integer x = 1696
integer y = 140
integer width = 389
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

type st_1 from statictext within w_ocaroivcday_r
integer x = 46
integer y = 200
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
integer x = 1696
integer y = 60
integer width = 389
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
string text = "수금일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_ocaroivcday_r
integer x = 1143
integer y = 80
integer width = 224
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
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_ocaroivcday_r
integer x = 1376
integer y = 80
integer width = 224
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
string text = "수출"
end type

type rb_3 from radiobutton within w_ocaroivcday_r
integer x = 1376
integer y = 152
integer width = 224
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
string text = "내수"
end type

type cb_1 from commandbutton within w_ocaroivcday_r
integer x = 2825
integer y = 68
integer width = 242
integer height = 72
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

event clicked;// 확대
ii_zoom ++
dw_1.Object.DataWindow.Zoom = ii_zoom
end event

type cb_2 from commandbutton within w_ocaroivcday_r
integer x = 2825
integer y = 144
integer width = 242
integer height = 72
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

event clicked;// 축소
ii_zoom --
dw_1.Object.DataWindow.Zoom = ii_zoom
end event

type rb_4 from radiobutton within w_ocaroivcday_r
integer x = 2185
integer y = 92
integer width = 187
integer height = 56
boolean bringtotop = true
integer textsize = -10
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

event clicked;// A4
string ls_modify

if rb_4.checked = true then			// A4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9  Datawindow.Zoom=81'
	dw_1.modify( ls_modify )
elseif rb_5.checked = true then		// B4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
elseif rb_6.checked = true then		// 전산용지
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=17 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
else											// A3
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=8 Datawindow.Zoom=100'	
	dw_1.modify( ls_modify )
end if

end event

type rb_5 from radiobutton within w_ocaroivcday_r
integer x = 2418
integer y = 92
integer width = 187
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "B4"
end type

event clicked;// B4
string ls_modify

if rb_4.checked = true then			// A4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9  Datawindow.Zoom=81'
	dw_1.modify( ls_modify )
elseif rb_5.checked = true then		// B4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
elseif rb_6.checked = true then		// 전산용지
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=17 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
else											// A3
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=8 Datawindow.Zoom=100'	
	dw_1.modify( ls_modify )
end if

end event

type rb_6 from radiobutton within w_ocaroivcday_r
string tag = "접힌연속지"
integer x = 2185
integer y = 160
integer width = 439
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
string text = "LTR 11x17"
end type

event clicked;// 전산
string ls_modify
// 왼쪽마진
integer li_left = 1200


if rb_4.checked = true then			// A4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9  Datawindow.Zoom=81'
	dw_1.modify( ls_modify )
elseif rb_5.checked = true then		// B4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
elseif rb_6.checked = true then		// LTR 11x17	
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=17 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )

	dw_1.setredraw( false )
	dw_1.Modify("dw_4.x = " + string(li_left) )	
	dw_1.Modify("dw_3.x = " + string(li_left) )	
	dw_1.Modify("dw_1.x = " + string(li_left) )	
	dw_1.Modify("dw_2.x = " + string(li_left) )	
	dw_1.setredraw( true )
else
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=8 Datawindow.Zoom=100'	
end if

end event

type cb_3 from commandbutton within w_ocaroivcday_r
integer x = 3072
integer y = 144
integer width = 347
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "왼쪽마진"
end type

event clicked;// 왼쪽마진
integer li_x 

ii_left = integer(dw_1.Describe('dw_4.x'))
ii_left = ii_left + 30

dw_1.setredraw( false )
dw_1.Modify("dw_4.x = " + string(ii_left) )	
dw_1.Modify("dw_3.x = " + string(ii_left) )	
dw_1.Modify("dw_1.x = " + string(ii_left) )	
dw_1.Modify("dw_2.x = " + string(ii_left) )	
dw_1.setredraw( true )


end event

type cb_4 from commandbutton within w_ocaroivcday_r
integer x = 3072
integer y = 68
integer width = 347
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "상단마진"
end type

event clicked;// 상단마진
integer li_top

dw_1.setredraw( false )
li_top = integer(dw_1.Describe('dw_4.y'))
li_top = li_top + 30
dw_1.Modify("dw_4.y = " + string(li_top) )	

li_top = integer(dw_1.Describe('dw_3.y'))
li_top = li_top + 30
dw_1.Modify("dw_3.y = " + string(li_top) )	

li_top = integer(dw_1.Describe('dw_1.y'))
li_top = li_top + 30
dw_1.Modify("dw_1.y = " + string(li_top) )	

li_top = integer(dw_1.Describe('dw_2.y'))
li_top = li_top + 30
dw_1.Modify("dw_2.y = " + string(li_top) )	
dw_1.setredraw( true )


end event

type rb_7 from radiobutton within w_ocaroivcday_r
string tag = "접힌연속지"
integer x = 2629
integer y = 92
integer width = 187
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "A3"
end type

event clicked;// A4
string  ls_modify
integer li_left, li_top

if rb_4.checked = true then			// A4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9  Datawindow.Zoom=81'
	dw_1.modify( ls_modify )
elseif rb_5.checked = true then		// B4
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
elseif rb_6.checked = true then		// 전산용지
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=17 Datawindow.Zoom=100'
	dw_1.modify( ls_modify )
else											// A3
	// 왼쪽마진
	li_left = integer(dw_1.Describe('dw_4.x'))
	li_left = li_left + 300
	
	dw_1.setredraw( false )
	dw_1.Modify("dw_4.x = " + string(li_left) )	
	dw_1.Modify("dw_3.x = " + string(li_left) )	
	dw_1.Modify("dw_1.x = " + string(li_left) )	
	dw_1.Modify("dw_2.x = " + string(li_left) )	

	// 상단마진
	li_top = integer(dw_1.Describe('dw_4.y'))
	li_top = li_top + 200
	dw_1.Modify("dw_4.y = " + string(li_top) )	

	li_top = integer(dw_1.Describe('dw_3.y'))
	li_top = li_top + 200
	dw_1.Modify("dw_3.y = " + string(li_top) )	

	li_top = integer(dw_1.Describe('dw_1.y'))
	li_top = li_top + 200
	dw_1.Modify("dw_1.y = " + string(li_top) )	
	
	li_top = integer(dw_1.Describe('dw_2.y'))
	li_top = li_top + 200
	dw_1.Modify("dw_2.y = " + string(li_top) )	
	dw_1.setredraw( true )
		
	ls_modify = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=8 Datawindow.Zoom=100'	
	dw_1.modify( ls_modify )
end if

end event

type gb_4 from groupbox within w_ocaroivcday_r
integer x = 1111
integer y = 16
integer width = 530
integer height = 220
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_ocaroivcday_r
integer x = 2135
integer y = 16
integer width = 1312
integer height = 220
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "용지설정"
end type

