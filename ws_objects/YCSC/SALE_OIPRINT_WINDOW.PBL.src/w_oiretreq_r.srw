$PBExportHeader$w_oiretreq_r.srw
$PBExportComments$물품반납내역서 조회프로그램(2000/05/06,이인호)
forward
global type w_oiretreq_r from w_inheritance
end type
type dw_4 from datawindow within w_oiretreq_r
end type
type em_1 from editmask within w_oiretreq_r
end type
type em_2 from editmask within w_oiretreq_r
end type
type st_1 from statictext within w_oiretreq_r
end type
type dw_5 from datawindow within w_oiretreq_r
end type
type rb_3 from radiobutton within w_oiretreq_r
end type
type rb_4 from radiobutton within w_oiretreq_r
end type
type dw_3 from datawindow within w_oiretreq_r
end type
type cbx_1 from checkbox within w_oiretreq_r
end type
type rb_5 from radiobutton within w_oiretreq_r
end type
end forward

global type w_oiretreq_r from w_inheritance
integer width = 4658
integer height = 2744
string title = "반품요청서 출력(w_oiretreq_r)"
dw_4 dw_4
em_1 em_1
em_2 em_2
st_1 st_1
dw_5 dw_5
rb_3 rb_3
rb_4 rb_4
dw_3 dw_3
cbx_1 cbx_1
rb_5 rb_5
end type
global w_oiretreq_r w_oiretreq_r

type variables
st_print i_print
datawindowchild idwc_cust

string is_order_no
string is_con = "Y"
end variables

on w_oiretreq_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_5=create dw_5
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.rb_5=create rb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.rb_5
end on

on w_oiretreq_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.rb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
dw_2.SetTransObject(SQLCA)
dw_1.insertrow(0)  //춘 19
dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)


dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_5.visible = false

dw_1.insertrow(0)

em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
dw_3.width  = this.width  - 68
dw_3.height = this.height - 1256

end event

type pb_save from w_inheritance`pb_save within w_oiretreq_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3163
integer y = 40
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oiretreq_r
integer x = 2194
integer y = 92
integer width = 859
integer height = 88
integer taborder = 30
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
pb_retrieve.setfocus()

end event

type dw_2 from w_inheritance`dw_2 within w_oiretreq_r
integer x = 2505
integer y = 244
integer width = 2075
integer height = 896
integer taborder = 60
string dataobject = "d_oiretcon_s1"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oiretreq_r
integer x = 46
integer y = 56
integer width = 1129
integer height = 144
string text = "반품요청서 출력"
end type

type st_tips from w_inheritance`st_tips within w_oiretreq_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiretreq_r
boolean visible = false
integer x = 1659
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiretreq_r
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 80
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

type pb_close from w_inheritance`pb_close within w_oiretreq_r
integer x = 4361
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretreq_r
integer x = 4169
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_4.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_5.retrieve(is_order_no)

l_print.st_datawindow = dw_5
l_print.st_print_desc = " 이 프로그램은 반품요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiretreq_r
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_oiretreq_r
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_oiretreq_r
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 160
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretreq_r
integer x = 3973
integer y = 64
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string ls_cust_no
date  ld_start_date, ld_end_date

dw_4.reset()
dw_1.accepttext()
if cbx_1.checked = true then
	ls_cust_no = "%"
else
	ls_cust_no = trim(dw_1.object.cust_no[1])
end if
if ls_cust_no = '' or isnull(ls_cust_no) then
	beep(2)
	dw_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
if dw_4.retrieve(ls_cust_no,ld_start_date,ld_end_date,is_con) < 1 then
	dw_1.setfocus()
else
	dw_4.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiretreq_r
integer x = 1490
integer y = 16
integer width = 649
integer height = 212
integer taborder = 0
integer textsize = -10
long textcolor = 0
string text = "선택"
end type

type gb_2 from w_inheritance`gb_2 within w_oiretreq_r
integer x = 2162
integer y = 16
integer width = 1737
integer height = 212
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oiretreq_r
integer x = 3936
integer y = 16
integer width = 645
integer height = 212
integer taborder = 100
integer textsize = -10
end type

type dw_4 from datawindow within w_oiretreq_r
integer x = 23
integer y = 244
integer width = 2469
integer height = 896
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oiretreq_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.Getrow()
if ll_row < 1 then return

is_order_no = this.object.order_no[ll_row]

dw_2.retrieve(is_con, is_order_no)
dw_3.retrieve(is_order_no)


end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
end if
end event

type em_1 from editmask within w_oiretreq_r
integer x = 3067
integer y = 100
integer width = 366
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiretreq_r
integer x = 3497
integer y = 100
integer width = 366
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oiretreq_r
integer x = 3442
integer y = 104
integer width = 59
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_oiretreq_r
integer x = 1061
integer width = 105
integer height = 76
boolean bringtotop = true
string dataobject = "d_oiretreq_r"
boolean livescroll = true
end type

type rb_3 from radiobutton within w_oiretreq_r
integer x = 1797
integer y = 148
integer width = 302
integer height = 68
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
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "O"
end event

type rb_4 from radiobutton within w_oiretreq_r
integer x = 1797
integer y = 84
integer width = 251
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "결재"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "Y"

end event

type dw_3 from datawindow within w_oiretreq_r
integer x = 23
integer y = 1156
integer width = 4567
integer height = 1452
integer taborder = 70
string dataobject = "d_oiretcon_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_oiretreq_r
integer x = 2345
integer y = 12
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "전체"
end type

event clicked;if this.checked = true then
	dw_1.object.cust_no.background.color = 78682240
else
	dw_1.object.cust_no.background.color = 1087434968
end if

dw_1.enabled = NOT (this.checked)
end event

type rb_5 from radiobutton within w_oiretreq_r
integer x = 1531
integer y = 84
integer width = 238
integer height = 68
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

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "%"


end event

