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
end forward

global type w_oiretcon_m from w_inheritance
integer width = 4686
integer height = 2720
string title = "반품요청 결재관리(w_oiretcon_m)"
dw_4 dw_4
dw_3 dw_3
st_1 st_1
rb_3 rb_3
rb_4 rb_4
end type
global w_oiretcon_m w_oiretcon_m

type variables
st_print i_print

string is_order_no, is_con ="O"

end variables

on w_oiretcon_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_4=create rb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
end on

on w_oiretcon_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_1.visible = false

end event

event resize;call super::resize;//
dw_3.width  = this.width  - 96
dw_3.height = this.height - 1308

end event

type pb_save from w_inheritance`pb_save within w_oiretcon_m
event ue_print pbm_custom01
integer x = 4197
integer y = 40
integer taborder = 70
end type

event pb_save::clicked;if dw_4.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_4.accepttext()
if wf_update1( dw_4,'Y') = true then
	pb_retrieve.triggerevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oiretcon_m
integer x = 1321
integer y = 52
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

type dw_2 from w_inheritance`dw_2 within w_oiretcon_m
integer x = 2537
integer y = 256
integer width = 2075
integer height = 904
integer taborder = 40
string dataobject = "d_oiretcon_s1"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oiretcon_m
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
integer x = 4389
integer y = 40
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretcon_m
integer x = 4005
integer y = 40
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
integer x = 3785
integer y = 40
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oiretcon_m
boolean visible = false
integer x = 2779
integer y = 40
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretcon_m
integer x = 3579
integer y = 40
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_4.retrieve(is_con) < 1 then
	messagebox("확인","결재하실 내역이 없습니다.")
else
	dw_2.retrieve(is_con,"%")
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
integer x = 2757
integer y = 0
integer width = 773
integer height = 204
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회"
end type

type gb_1 from w_inheritance`gb_1 within w_oiretcon_m
integer x = 3552
integer y = 0
integer width = 1051
integer taborder = 80
end type

type dw_4 from datawindow within w_oiretcon_m
integer x = 18
integer y = 256
integer width = 2501
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

event itemchanged;long ll_row
string ls_null, ls_data, ls_data2

setnull(ls_null)
this.accepttext()
this.setredraw(false)
ll_row = this.getrow()
CHOOSE CASE dwo.name
	CASE 'process_flag'
		ls_data = this.getitemstring(ll_row, 'process_flag',  Primary!, TRUE)
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_top[ll_row] = gs_userid
			CASE "O"
				//안승환상무 : 19000011
				//조용재이사 : 19840901
				//gs_userid <> '19000011' and gs_userid <> 'cwj' and gs_userid = 'bj5879' and gs_userid = '470409' 
				if ( gs_userid <> '19840901'  and gs_userid = 'parkji' and gs_userid = 'ssch3015'  and gs_userid ='19981214' &
				     and gs_userid = 'yun0093' and gs_userid = 'kgyoung' ) and (ls_data = 'Y' ) then
					messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
					return 1
				end if
				dw_4.object.approve_top[ll_row] = ls_null
		END CHOOSE
	CASE 'chk_team'
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_team[ll_row] = gs_userid
			CASE "N"
				ls_data = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","결재하신분이 아니므로 바꿀수가 없습니다.")
					return 1
				end if
				dw_4.object.approve_team[ll_row] = ls_null
		END CHOOSE
END CHOOSE
this.setredraw(true)


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

event losefocus;this.width = 2501
end event

event getfocus;this.width = 3500
end event

type dw_3 from datawindow within w_oiretcon_m
integer x = 18
integer y = 1172
integer width = 4590
integer height = 1412
integer taborder = 50
string dataobject = "d_oiretcon_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_oiretcon_m
integer x = 27
integer y = 196
integer width = 1120
integer height = 52
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
string text = "본부장결재시에만 결재완료 됩니다."
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_oiretcon_m
integer x = 2807
integer y = 92
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

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "O"
end event

type rb_4 from radiobutton within w_oiretcon_m
integer x = 3136
integer y = 92
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

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "Y"

end event

