$PBExportHeader$w_oiretcon_m.srw
$PBExportComments$반품요청결재관리(2000/05/06,이인호)
forward
global type w_oiretcon_m from w_inheritance
end type
type dw_4 from datawindow within w_oiretcon_m
end type
type dw_3 from datawindow within w_oiretcon_m
end type
type st_1 from statictext within w_oiretcon_m
end type
type rb_3 from radiobutton within w_oiretcon_m
end type
type rb_4 from radiobutton within w_oiretcon_m
end type
type st_7 from statictext within w_oiretcon_m
end type
type dw_area from datawindow within w_oiretcon_m
end type
type st_2 from statictext within w_oiretcon_m
end type
type st_3 from statictext within w_oiretcon_m
end type
type ddlb_fld from dropdownlistbox within w_oiretcon_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oiretcon_m
end type
type st_4 from statictext within w_oiretcon_m
end type
type sle_value from singlelineedit within w_oiretcon_m
end type
type cb_1 from commandbutton within w_oiretcon_m
end type
type cb_2 from commandbutton within w_oiretcon_m
end type
type cb_3 from commandbutton within w_oiretcon_m
end type
type cb_4 from commandbutton within w_oiretcon_m
end type
type st_vertical from u_splitbar_vertical within w_oiretcon_m
end type
type st_horizontal from u_splitbar_horizontal within w_oiretcon_m
end type
type ddlb_op from dropdownlistbox within w_oiretcon_m
end type
type gb_4 from groupbox within w_oiretcon_m
end type
type gb_5 from groupbox within w_oiretcon_m
end type
end forward

global type w_oiretcon_m from w_inheritance
integer width = 4686
integer height = 2492
string title = "반품요청 결재관리(w_oiretcon_m)"
dw_4 dw_4
dw_3 dw_3
st_1 st_1
rb_3 rb_3
rb_4 rb_4
st_7 st_7
dw_area dw_area
st_2 st_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
st_vertical st_vertical
st_horizontal st_horizontal
ddlb_op ddlb_op
gb_4 gb_4
gb_5 gb_5
end type
global w_oiretcon_m w_oiretcon_m

type variables
DataWindowChild idwc_area
st_print i_print

string is_window, is_order_no, is_con ="O"

end variables

on w_oiretcon_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_7=create st_7
this.dw_area=create dw_area
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.st_7
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_4
this.Control[iCurrent+18]=this.st_vertical
this.Control[iCurrent+19]=this.st_horizontal
this.Control[iCurrent+20]=this.ddlb_op
this.Control[iCurrent+21]=this.gb_4
this.Control[iCurrent+22]=this.gb_5
end on

on w_oiretcon_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_2 )
st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_2 )
st_horizontal.of_set_topobject( dw_4 )
st_horizontal.of_set_bottomobject( dw_3 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )

dw_1.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = "%"

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = "%" //gs_area	// 기본값을 변경	
dw_area.accepttext()
//dw_area.enabled = false

pb_save.enabled = false
if GF_PERMISSION("반품요청_결재관리", gs_userid) = "Y" then
	pb_save.enabled = true
end if

end event

event resize;call super::resize;//
gb_5.width  = newwidth  - (gb_5.x * 2)

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_4.width  = newwidth  - dw_4.x - gb_5.x

st_horizontal.y      = dw_2.y + dw_2.height
st_horizontal.width  = newwidth  - (gb_5.x * 2)

dw_3.width  = newwidth  - (gb_5.x * 2)
dw_3.height = newheight - dw_3.y - gb_5.x


end event

type pb_save from w_inheritance`pb_save within w_oiretcon_m
event ue_print pbm_custom01
integer x = 3598
integer y = 64
integer taborder = 70
end type

event pb_save::clicked;//

if dw_4.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_4.accepttext()
if wf_update1( dw_4,'Y') = true then
	pb_retrieve.triggerevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oiretcon_m
integer x = 1038
integer y = 0
integer width = 114
integer height = 84
integer taborder = 10
string dataobject = "d_oiretreq_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
pb_retrieve.setfocus()

end event

type st_title from w_inheritance`st_title within w_oiretcon_m
integer x = 23
integer y = 24
integer width = 1248
integer height = 144
string text = "반품요청 결재관리"
end type

type st_tips from w_inheritance`st_tips within w_oiretcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_oiretcon_m
boolean visible = false
integer x = 1659
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiretcon_m
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 60
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_oiretcon_m
integer x = 3790
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretcon_m
integer x = 3406
integer y = 64
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve(is_order_no)

l_print.st_datawindow = dw_1
l_print.st_print_desc = " 이 프로그램은 반품요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiretcon_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oiretcon_m
integer x = 3186
integer y = 64
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oiretcon_m
boolean visible = false
integer x = 2779
integer y = 40
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretcon_m
integer x = 2981
integer y = 64
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area

DEBUGBREAK()

dw_area.accepttext()
ls_area = trim(dw_area.object.area[1])
if isnull(ls_area) OR ls_area = "" then ls_area = "%"

//
dw_4.retrieve( is_con, ls_area )
if dw_4.rowcount() < 1 then
	MessageBox("확인","결재하실 내역이 없습니다.")
else
	dw_2.retrieve(is_con, "%")
	dw_4.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiretcon_m
boolean visible = false
integer x = 1472
integer y = 4
integer width = 133
integer height = 148
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiretcon_m
integer x = 2158
integer y = 16
integer width = 773
integer height = 212
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회"
end type

type gb_1 from w_inheritance`gb_1 within w_oiretcon_m
integer x = 2953
integer y = 16
integer width = 1051
integer height = 212
integer taborder = 80
end type

type dw_2 from w_inheritance`dw_2 within w_oiretcon_m
integer x = 32
integer y = 440
integer width = 2505
integer height = 904
integer taborder = 40
string dataobject = "d_oiretcon_s1"
boolean vscrollbar = false
end type

type dw_4 from datawindow within w_oiretcon_m
integer x = 2592
integer y = 440
integer width = 2025
integer height = 904
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_oiretcon_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.Getrow()

if ll_row < 1 then return

is_order_no = this.object.order_no[ll_row]

dw_2.setfilter("ret_no = '" + is_order_no + "'")
dw_2.filter()
dw_3.retrieve( is_order_no )

end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
else
	is_order_no = this.object.order_no[this.getrow()]
end if
end event

event itemchanged;//
long   ll_row
string ls_null, ls_data, ls_data2

setnull(ls_null)
this.accepttext()
ll_row = this.getrow()

choose case dwo.name
	case 'process_flag'	// 본부장
		ls_data = this.getitemstring(ll_row, 'process_flag',  Primary!, TRUE)
		choose case data
			case "Y"
				dw_4.object.approve_top[ll_row] = gs_userid
				
			case "O"
				if GF_PERMISSION("반품요청_결재관리(본부장)", gs_userid) = "Y" then
				else
					messagebox("확인","반품요청_결재관리(본부장)만 변경할 수 있습니다.")
					return 1
				end if
				dw_4.object.approve_top[ll_row] = ls_null
		end choose
		
	case 'chk_center'		// 센터장
		choose case data
			case "Y"
				dw_4.object.approve_center[ll_row] = gs_userid
				
			case "N"
				ls_data  = this.getitemstring(ll_row, 'chk_center',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_center',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","타인 결재분은 바꿀수가 없습니다.")
					return 1
				end if
				dw_4.object.approve_center[ll_row] = ls_null
		end choose

	case 'chk_team'		// 팀장
		choose case data
			case "Y"
				dw_4.object.approve_team[ll_row] = gs_userid
				
			case "N"
				ls_data  = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","타인 결재분은 바꿀수가 없습니다.")
					return 1
				end if
				dw_4.object.approve_team[ll_row] = ls_null
		end choose
end choose

end event

event itemerror;string  ls_ori_process_flag

CHOOSE CASE dwo.name
	CASE 'process_flag'
				dw_4.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
				dw_4.object.process_flag[row] = this.getitemstring(row, 'process_flag',  Primary!, TRUE)
					
	CASE 'chk_team'
				dw_4.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
				dw_4.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
	CASE else
END CHOOSE
this.setredraw(true)
return 2


end event

event losefocus;//this.width = 2501
end event

event getfocus;//this.width = 3500
end event

event clicked;//
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
is_window = "dw_4"

//dw_3.setsort( "" )
//dw_3.sort()
//
//dw_3.setfilter( "" )
//dw_3.filter()

if dw_4.rowcount() < 1 then return

end event

type dw_3 from datawindow within w_oiretcon_m
integer x = 32
integer y = 1384
integer width = 4581
integer height = 976
integer taborder = 50
string dataobject = "d_oiretcon_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//is_window = "dw_3"

end event

type st_1 from statictext within w_oiretcon_m
integer x = 2537
integer y = 332
integer width = 1120
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "본부장결재시에만 결재완료 됩니다."
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_oiretcon_m
integer x = 2208
integer y = 108
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결재"
boolean checked = true
end type

event clicked;// 미결재
dw_2.reset() ; dw_3.reset() ; dw_4.reset()

is_con = "O"
end event

type rb_4 from radiobutton within w_oiretcon_m
integer x = 2537
integer y = 108
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "결재취소"
end type

event clicked;// 결재취소
dw_2.reset() ; dw_3.reset() ; dw_4.reset()

is_con = "Y"

end event

type st_7 from statictext within w_oiretcon_m
integer x = 1326
integer y = 112
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
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiretcon_m
integer x = 1559
integer y = 96
integer width = 549
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_oiretcon_m
integer x = 32
integer y = 192
integer width = 558
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "반품요청_결재관리"
boolean focusrectangle = false
end type

type st_3 from statictext within w_oiretcon_m
integer x = 87
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_oiretcon_m
integer x = 274
integer y = 308
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

type ddlb_dwtitles from dropdownlistbox within w_oiretcon_m
integer x = 306
integer y = 320
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

type st_4 from statictext within w_oiretcon_m
integer x = 745
integer y = 324
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

type sle_value from singlelineedit within w_oiretcon_m
integer x = 1234
integer y = 316
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

type cb_1 from commandbutton within w_oiretcon_m
integer x = 1810
integer y = 316
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiretcon_m
integer x = 1975
integer y = 316
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiretcon_m
integer x = 2139
integer y = 316
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_oiretcon_m
integer x = 2304
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_oiretcon_m
integer x = 2555
integer y = 440
integer height = 904
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oiretcon_m
integer x = 32
integer y = 1352
integer width = 4581
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_2.height

end event

type ddlb_op from dropdownlistbox within w_oiretcon_m
integer x = 923
integer y = 308
integer width = 302
integer height = 500
integer taborder = 150
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

type gb_4 from groupbox within w_oiretcon_m
integer x = 1312
integer y = 16
integer width = 818
integer height = 212
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사업장"
end type

type gb_5 from groupbox within w_oiretcon_m
integer x = 32
integer y = 244
integer width = 4590
integer height = 180
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

