$PBExportHeader$w_oiretreq_r2.srw
$PBExportComments$물품반납 현황 조회프로그램(2004/06/03,정갑용)
forward
global type w_oiretreq_r2 from w_inheritance
end type
type em_1 from editmask within w_oiretreq_r2
end type
type em_2 from editmask within w_oiretreq_r2
end type
type st_1 from statictext within w_oiretreq_r2
end type
type rb_1 from radiobutton within w_oiretreq_r2
end type
type rb_2 from radiobutton within w_oiretreq_r2
end type
type rb_3 from radiobutton within w_oiretreq_r2
end type
type st_2 from statictext within w_oiretreq_r2
end type
end forward

global type w_oiretreq_r2 from w_inheritance
integer width = 4690
integer height = 2876
string title = "반품현황 출력(w_oiretreq_r2)"
boolean resizable = false
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_2 st_2
end type
global w_oiretreq_r2 w_oiretreq_r2

type variables
st_print i_print
datawindowchild idwc_cust

string is_order_no
string is_con = "Y"
end variables

on w_oiretreq_r2.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.st_2
end on

on w_oiretreq_r2.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_2)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_2.visible = false

em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
dw_1.sharedata( dw_2)
end event

type pb_save from w_inheritance`pb_save within w_oiretreq_r2
event ue_print pbm_custom01
boolean visible = false
integer x = 3163
integer y = 40
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oiretreq_r2
integer x = 27
integer y = 244
integer width = 4622
integer height = 2536
integer taborder = 30
string dataobject = "d_oiretcon_s3"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oiretreq_r2
integer x = 1193
integer y = 0
integer width = 101
integer height = 72
integer taborder = 60
string dataobject = "d_oiretcon_r"
boolean vscrollbar = false
borderstyle borderstyle = StyleBox!
end type

type st_title from w_inheritance`st_title within w_oiretreq_r2
integer x = 32
integer y = 28
integer width = 1307
string text = "반품현황 출력"
end type

type st_tips from w_inheritance`st_tips within w_oiretreq_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oiretreq_r2
boolean visible = false
integer x = 1659
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiretreq_r2
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

type pb_close from w_inheritance`pb_close within w_oiretreq_r2
integer x = 4430
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretreq_r2
integer x = 4041
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_2.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_2
l_print.st_print_desc = " 이 프로그램은 반품현황을 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=97'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiretreq_r2
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_oiretreq_r2
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_oiretreq_r2
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 160
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretreq_r2
integer x = 3849
integer y = 64
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string ls_cust_no
date  ld_start_date, ld_end_date

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)

dw_1.retrieve(ld_start_date,ld_end_date)

end event

type gb_3 from w_inheritance`gb_3 within w_oiretreq_r2
boolean visible = false
integer x = 1879
integer y = 56
integer width = 786
integer height = 148
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiretreq_r2
integer x = 1627
integer y = 24
integer width = 946
integer height = 176
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "반품일자"
end type

type gb_1 from w_inheritance`gb_1 within w_oiretreq_r2
integer x = 3735
integer y = 16
integer width = 910
integer height = 212
integer taborder = 100
integer textsize = -10
integer weight = 400
end type

type em_1 from editmask within w_oiretreq_r2
integer x = 1678
integer y = 92
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiretreq_r2
integer x = 2158
integer y = 92
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oiretreq_r2
integer x = 2080
integer y = 96
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
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oiretreq_r2
integer x = 695
integer y = 180
integer width = 293
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
string text = "거래처"
end type

event clicked;dw_1.setsort(" customer_cust_name a, scene_scene_desc a ")
dw_1.sort()
end event

type rb_2 from radiobutton within w_oiretreq_r2
integer x = 1033
integer y = 180
integer width = 288
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
string text = "담당자"
end type

event clicked;dw_1.setsort(" login_user_name a, groupitem_item_name a, retdet_qa a ")
dw_1.sort()
end event

type rb_3 from radiobutton within w_oiretreq_r2
integer x = 398
integer y = 180
integer width = 229
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
string text = "품목"
boolean checked = true
end type

event clicked;dw_1.setsort(" groupitem_item_name a, retdet_qa a")
dw_1.sort()
end event

type st_2 from statictext within w_oiretreq_r2
integer x = 210
integer y = 180
integer width = 178
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
string text = "정렬:"
boolean focusrectangle = false
end type

