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
type st_7 from statictext within w_oiretreq_r
end type
type dw_area from datawindow within w_oiretreq_r
end type
type st_horizontal from u_splitbar_horizontal within w_oiretreq_r
end type
type st_vertical from u_splitbar_vertical within w_oiretreq_r
end type
type st_1 from statictext within w_oiretreq_r
end type
type st_4 from statictext within w_oiretreq_r
end type
type ddlb_fld from dropdownlistbox within w_oiretreq_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiretreq_r
end type
type st_5 from statictext within w_oiretreq_r
end type
type sle_value from singlelineedit within w_oiretreq_r
end type
type cb_1 from commandbutton within w_oiretreq_r
end type
type cb_2 from commandbutton within w_oiretreq_r
end type
type cb_3 from commandbutton within w_oiretreq_r
end type
type cb_5 from commandbutton within w_oiretreq_r
end type
type ddlb_op from dropdownlistbox within w_oiretreq_r
end type
type gb_4 from groupbox within w_oiretreq_r
end type
type gb_5 from groupbox within w_oiretreq_r
end type
end forward

global type w_oiretreq_r from w_inheritance
integer width = 4347
integer height = 2604
string title = "반품요청서 출력(w_oiretreq_r)"
dw_4 dw_4
em_1 em_1
em_2 em_2
dw_5 dw_5
rb_3 rb_3
rb_4 rb_4
dw_3 dw_3
cbx_1 cbx_1
rb_5 rb_5
st_7 st_7
dw_area dw_area
st_horizontal st_horizontal
st_vertical st_vertical
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
gb_4 gb_4
gb_5 gb_5
end type
global w_oiretreq_r w_oiretreq_r

type variables
st_print i_print
datawindowchild idwc_area, idwc_cust

string is_order_no
string is_con = "Y"
end variables

on w_oiretreq_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.dw_5=create dw_5
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.rb_5=create rb_5
this.st_7=create st_7
this.dw_area=create dw_area
this.st_horizontal=create st_horizontal
this.st_vertical=create st_vertical
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.rb_5
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.st_horizontal
this.Control[iCurrent+13]=this.st_vertical
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.ddlb_fld
this.Control[iCurrent+17]=this.ddlb_dwtitles
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.cb_5
this.Control[iCurrent+24]=this.ddlb_op
this.Control[iCurrent+25]=this.gb_4
this.Control[iCurrent+26]=this.gb_5
end on

on w_oiretreq_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_5)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.rb_5)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.st_horizontal)
destroy(this.st_vertical)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.SetTransObject(SQLCA)
dw_1.insertrow(0)  //춘 19
dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_5.visible = false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = "%"	// gs_area	// 기본값을 변경	
dw_area.accepttext()

dw_1.insertrow(0)

em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")

cbx_1.checked = true
cbx_1.triggerevent( clicked! )

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = st_vertical.height

st_horizontal.y      = dw_4.y + dw_4.height 
st_horizontal.width  = newwidth  - (gb_2.x * 2)

dw_3.width  = newwidth  - (gb_2.x * 2)
dw_3.height = newheight - dw_3.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_oiretreq_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3163
integer y = 40
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oiretreq_r
integer x = 2725
integer y = 36
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

type st_title from w_inheritance`st_title within w_oiretreq_r
integer x = 37
integer y = 24
integer width = 1129
integer height = 132
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
integer x = 4050
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretreq_r
integer x = 3858
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
integer x = 3662
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_area, ls_custno
date   ld_sdate, ld_edate

dw_4.reset()
dw_1.accepttext()
if cbx_1.checked = true then
	ls_custno = "%"
else
	ls_custno = trim(dw_1.object.cust_no[1])
end if

dw_area.accepttext()
ls_area  = trim(dw_area.object.area[1])
if ls_area = "" then ls_area = "%"

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)
if dw_4.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, is_con ) < 1 then
	dw_1.setfocus()
else
	dw_4.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiretreq_r
integer x = 1824
integer y = 4
integer width = 585
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiretreq_r
integer y = 232
integer width = 4238
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oiretreq_r
integer x = 3625
integer y = 4
integer width = 645
integer height = 212
integer taborder = 100
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiretreq_r
integer x = 3447
integer y = 404
integer width = 818
integer height = 896
integer taborder = 60
string dataobject = "d_oiretcon_s1"
boolean vscrollbar = false
end type

type dw_4 from datawindow within w_oiretreq_r
integer x = 32
integer y = 404
integer width = 3346
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

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_1 from editmask within w_oiretreq_r
integer x = 2725
integer y = 128
integer width = 411
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
alignment alignment = center!
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
integer x = 3159
integer y = 128
integer width = 411
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
alignment alignment = center!
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

type dw_5 from datawindow within w_oiretreq_r
integer x = 46
integer y = 188
integer width = 91
integer height = 56
boolean bringtotop = true
string dataobject = "d_oiretreq_r"
boolean livescroll = true
end type

type rb_3 from radiobutton within w_oiretreq_r
integer x = 2098
integer y = 136
integer width = 302
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
string text = "미결재"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "O"
end event

type rb_4 from radiobutton within w_oiretreq_r
integer x = 1861
integer y = 136
integer width = 229
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
string text = "결재"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "Y"

end event

type dw_3 from datawindow within w_oiretreq_r
integer x = 32
integer y = 1360
integer width = 4233
integer height = 1104
integer taborder = 70
string dataobject = "d_oiretcon_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_oiretreq_r
integer x = 2459
integer y = 56
integer width = 229
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
integer x = 1861
integer y = 76
integer width = 229
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
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "%"


end event

type st_7 from statictext within w_oiretreq_r
integer x = 1243
integer y = 44
integer width = 521
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiretreq_r
integer x = 1243
integer y = 120
integer width = 535
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area, ls_locno

this.accepttext()

ls_area = dw_area.object.area[ row ]
SELECT def_loc INTO :ls_locno FROM area  WHERE area_no = :ls_area;
if isnull(ls_locno) or ls_locno = "" then ls_locno = "WS00000000"

//dw_3.object.loc_no[1] = ls_locno		// "WS00000000" // 기본값을 변경 is_loc
//dw_3.accepttext()

end event

type st_horizontal from u_splitbar_horizontal within w_oiretreq_r
integer x = 32
integer y = 1320
integer width = 4233
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type st_vertical from u_splitbar_vertical within w_oiretreq_r
integer x = 3401
integer y = 412
boolean bringtotop = true
end type

type st_1 from statictext within w_oiretreq_r
integer x = 2450
integer y = 136
integer width = 270
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "반품일자"
boolean focusrectangle = false
end type

type st_4 from statictext within w_oiretreq_r
integer x = 87
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_oiretreq_r
integer x = 274
integer y = 280
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

type ddlb_dwtitles from dropdownlistbox within w_oiretreq_r
integer x = 338
integer y = 292
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

type st_5 from statictext within w_oiretreq_r
integer x = 773
integer y = 296
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

type sle_value from singlelineedit within w_oiretreq_r
integer x = 1262
integer y = 288
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

type cb_1 from commandbutton within w_oiretreq_r
integer x = 1833
integer y = 288
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
datawindow arg_dw

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiretreq_r
integer x = 1998
integer y = 288
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

arg_dw = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiretreq_r
integer x = 2162
integer y = 288
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

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiretreq_r
integer x = 2327
integer y = 288
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

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_oiretreq_r
integer x = 951
integer y = 280
integer width = 302
integer height = 500
integer taborder = 180
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

type gb_4 from groupbox within w_oiretreq_r
integer x = 1211
integer y = 4
integer width = 590
integer height = 212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_oiretreq_r
integer x = 2427
integer y = 4
integer width = 1179
integer height = 212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

