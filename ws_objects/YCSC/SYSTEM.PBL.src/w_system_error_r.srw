$PBExportHeader$w_system_error_r.srw
$PBExportComments$프로그램 오류내역
forward
global type w_system_error_r from w_inheritance
end type
type em_1 from editmask within w_system_error_r
end type
type em_2 from editmask within w_system_error_r
end type
type st_1 from statictext within w_system_error_r
end type
type st_3 from statictext within w_system_error_r
end type
type ddlb_fld from dropdownlistbox within w_system_error_r
end type
type ddlb_dwtitles from dropdownlistbox within w_system_error_r
end type
type st_4 from statictext within w_system_error_r
end type
type ddlb_op from dropdownlistbox within w_system_error_r
end type
type sle_value from singlelineedit within w_system_error_r
end type
type cb_1 from commandbutton within w_system_error_r
end type
type cb_2 from commandbutton within w_system_error_r
end type
type cb_3 from commandbutton within w_system_error_r
end type
type cb_5 from commandbutton within w_system_error_r
end type
type cbx_1 from checkbox within w_system_error_r
end type
type st_vertical from statictext within w_system_error_r
end type
end forward

global type w_system_error_r from w_inheritance
integer x = 5
integer y = 136
integer width = 4366
integer height = 2564
string title = "시스템 오류내역(w_system_error_r)"
em_1 em_1
em_2 em_2
st_1 st_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_1 cbx_1
st_vertical st_vertical
end type
global w_system_error_r w_system_error_r

type variables
string is_user = gs_userid, is_w = 'Y'

// The following are used for the resizing service
boolean		ib_debug = False			// Debug mode
long			il_hiddencolor = 0		// Bar hidden color to match the window background
integer		ii_barthickness = 32		// Bar Thickness
integer		ii_windowborder = 408	// Window border to be used on all sides
dragobject	idrg_Vertical[2]			// Reference to the vertical controls on the window

end variables

forward prototypes
public function integer wf_refreshbars ()
public function integer wf_resizebars ()
public function integer wf_resizepanels ()
end prototypes

public function integer wf_refreshbars ();////////////////////////////////
// wf_refreshbars()
////////////////////////////////
Integer	li_Cnt

// Force appropriate order
st_vertical.SetPosition( ToTop! )

// Make sure the Width is not lost
st_vertical.Width = ii_BarThickness

Return 1

end function

public function integer wf_resizebars ();// wf_resizebars()
// Resize Bars according to Bars themselves, WindowBorder, and BarThickness.

Integer	li_HX, li_HW, li_Cnt, li_x, li_y, li_width, li_height

li_x = st_vertical.X
li_y = ii_WindowBorder
st_vertical.Move( st_vertical.X, ii_WindowBorder )

li_width  = ii_barthickness
li_height = 5 + This.WorkSpaceHeight() - 452	// 2460 - 2008
st_vertical.Resize( li_width, li_height )

wf_RefreshBars()

Return 1


end function

public function integer wf_resizepanels ();// wf_resizepanels()

Integer	li_Cnt, li_X, li_Y, li_HHeight, li_HWidth
Long		ll_Width, ll_Height

ll_Width  = this.WorkSpaceWidth()
ll_Height = this.WorkspaceHeight()

if ll_Width < idrg_Vertical[2].X + 150 then
	ll_Width = idrg_Vertical[2].X + 150
end if

if ll_Height < idrg_Vertical[1].Y + 150 then
	ll_Height = idrg_Vertical[1].Y + 150
end if

// Ctrol1의 Width 값이 ZERO 인 경우
if st_vertical.X <= st_vertical.Width then st_vertical.BackColor = rgb(128, 128, 128)

// Left vertical object processing
idrg_Vertical[1].Move( 46, ii_WindowBorder )
idrg_Vertical[1].Resize( st_vertical.X - idrg_Vertical[1].X, ll_Height - idrg_Vertical[1].Y - 46 )

// Right vertical object processing
idrg_Vertical[2].Move( st_vertical.X + ii_BarThickness, ii_WindowBorder )
idrg_Vertical[2].Resize( ll_Width - idrg_Vertical[2].X - 46, ll_Height - idrg_Vertical[2].Y - 46 )

Return 1

end function

on w_system_error_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_1=create cbx_1
this.st_vertical=create st_vertical
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.st_vertical
end on

on w_system_error_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_1)
destroy(this.st_vertical)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// The following lines are for setting up the resizing service
idrg_Vertical[1] = dw_1
idrg_Vertical[2] = dw_2

// Set the color of the bars to make them invisible
il_HiddenColor = This.BackColor
st_Vertical.BackColor = il_HiddenColor

wf_ResizeBars()	// Resize Bars
wf_ResizePanels()	// Resize the panels


////////////////////////////////////////////////////////////////
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
////////////////////////////////////////////////////////////////

em_1.text = string(RelativeDate(today(), -7),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

pb_retrieve.triggerevent( clicked! )

end event

event resize;call super::resize;//
// gb_3.width  = newwidth  - 87

//dw_1.width  = 1243
//dw_1.height = newheight - 448
//
//dw_2.width  = newwidth  - 1349
//dw_2.height = newheight - 448


// Do not run the first time the window is opened.
ii_windowborder = st_vertical.y
If IsValid(idrg_Vertical[1]) Then
	//Resize Bars
	wf_ResizeBars()

	//Resize the panels
	wf_ResizePanels()
End If

end event

type pb_save from w_inheritance`pb_save within w_system_error_r
integer x = 3863
integer y = 64
end type

event pb_save::clicked;//
if MessageBox("확인","저장 하시겠습니까?", Exclamation!, YesNo!, 2) = 2 then RETURN

wf_update1(dw_2,"Y")

end event

type dw_1 from w_inheritance`dw_1 within w_system_error_r
integer x = 46
integer y = 408
integer width = 1202
integer height = 2008
string dataobject = "d_system_error_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string   ls_userid, ls_errnum
datetime ld_msgdate
long		ll_row

ll_row = currentrow
if ll_row < 1 Or ll_row > this.rowcount() then return

ls_userid  = this.object.user_id[ll_row]
ld_msgdate = this.object.msg_date[ll_row]
ls_errnum  = this.object.errornum[ll_row]

dw_2.reset()
dw_2.setredraw( false )
dw_2.retrieve( ls_userid, ld_msgdate, ls_errnum )
dw_2.setredraw( true )

end event

type dw_2 from w_inheritance`dw_2 within w_system_error_r
integer x = 1307
integer y = 408
integer width = 2971
integer height = 2008
string dataobject = "d_system_error_m"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;call super::itemchanged;//
choose case dwo.name
	case "rec_status"
		this.object.close_name[row] = gs_username
		this.object.close_id[row]   = gs_userid
		this.object.close_date[row] = gf_today()
end choose
end event

type st_title from w_inheritance`st_title within w_system_error_r
integer x = 46
integer y = 52
integer width = 1243
string text = "시스템 오류내역"
end type

type st_tips from w_inheritance`st_tips within w_system_error_r
end type

type pb_compute from w_inheritance`pb_compute within w_system_error_r
boolean visible = false
integer x = 1787
integer y = 56
end type

type pb_print_part from w_inheritance`pb_print_part within w_system_error_r
boolean visible = false
integer x = 2939
integer y = 56
end type

type pb_close from w_inheritance`pb_close within w_system_error_r
integer x = 4055
integer y = 64
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_system_error_r
integer x = 3671
integer y = 64
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
string     ls_saleno

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 시스템 오류를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_system_error_r
boolean visible = false
integer x = 2555
integer y = 56
end type

type pb_delete from w_inheritance`pb_delete within w_system_error_r
integer x = 3479
integer y = 64
end type

event pb_delete::clicked;//
long ll_row


if dw_1.rowcount() < 1 then return
if dw_1.object.chk_total[1] < 1 then
	MessageBox("확인","삭제할 대상을 선택 하시기 바랍니다.")
	RETURN
end if

for ll_row = dw_1.rowcount() to 1 step -1
	if dw_1.object.chk[ll_row] = "Y" then
		dw_1.deleterow( ll_row )
	end if
next

if dw_1.rowcount() < 1 then dw_2.reset()

//
if MessageBox("확인","저장 하시겠습니까?", Exclamation!, YesNo!, 2) = 2 then RETURN

wf_update1(dw_1,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_system_error_r
boolean visible = false
integer x = 1632
integer y = 44
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_system_error_r
integer x = 3282
integer y = 64
end type

event pb_retrieve::clicked;//
string ls_sdate, ls_edate

ls_sdate = em_1.text
ls_edate = em_2.text

dw_1.setfilter( "" )
dw_1.filter()

dw_1.reset()
dw_1.retrieve( ls_sdate, ls_edate )
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_system_error_r
integer x = 46
integer y = 240
integer width = 4233
integer height = 156
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_system_error_r
integer x = 2459
integer y = 16
integer width = 777
integer height = 212
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_system_error_r
integer x = 3250
integer y = 16
integer width = 1024
integer height = 212
integer weight = 400
end type

type em_1 from editmask within w_system_error_r
integer x = 2491
integer y = 140
integer width = 347
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
string ls_date

OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type em_2 from editmask within w_system_error_r
integer x = 2862
integer y = 140
integer width = 347
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
string ls_date

OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_system_error_r
integer x = 2491
integer y = 56
integer width = 718
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "오류일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_system_error_r
integer x = 306
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_system_error_r
integer x = 494
integer y = 288
integer width = 480
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

type ddlb_dwtitles from dropdownlistbox within w_system_error_r
integer x = 558
integer y = 300
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

type st_4 from statictext within w_system_error_r
integer x = 992
integer y = 304
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

type ddlb_op from dropdownlistbox within w_system_error_r
integer x = 1161
integer y = 288
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

type sle_value from singlelineedit within w_system_error_r
integer x = 1481
integer y = 296
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

type cb_1 from commandbutton within w_system_error_r
integer x = 2053
integer y = 296
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
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_system_error_r
integer x = 2217
integer y = 296
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_system_error_r
integer x = 2382
integer y = 296
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_system_error_r
integer x = 2546
integer y = 296
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_1 from checkbox within w_system_error_r
integer x = 73
integer y = 304
integer width = 197
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
end type

event clicked;// 전체
long ll_row

for ll_row = 1 to dw_1.rowcount()
	if this.checked = true then
		dw_1.object.chk[ll_row] = "Y"
	else
		dw_1.object.chk[ll_row] = "N"
	end if
next
end event

type st_vertical from statictext within w_system_error_r
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer x = 1262
integer y = 408
integer width = 32
integer height = 2008
string dragicon = "Exclamation!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 255
long backcolor = 0
long bordercolor = 273962025
boolean focusrectangle = false
end type

event mousemove;// Check for move in progess
if KeyDown(keyLeftButton!) then This.X = Parent.PointerX()

end event

event mouseup;// Hide the bar
if Not ib_debug Then	This.BackColor = il_hiddencolor

// Resize the panels
wf_ResizePanels()

end event

event mousedown;//
If Not ib_debug Then this.BackColor = 0  //show Bar in Black

end event

