$PBExportHeader$w_orsaleysp_r.srw
$PBExportComments$YSP 수주현황(1998/05/13, 정재수)
forward
global type w_orsaleysp_r from w_inheritance
end type
type dw_4 from datawindow within w_orsaleysp_r
end type
type st_3 from statictext within w_orsaleysp_r
end type
type dw_3 from datawindow within w_orsaleysp_r
end type
type em_3 from editmask within w_orsaleysp_r
end type
type em_2 from editmask within w_orsaleysp_r
end type
type em_1 from editmask within w_orsaleysp_r
end type
type rb_1 from radiobutton within w_orsaleysp_r
end type
type rb_2 from radiobutton within w_orsaleysp_r
end type
type st_vertical from u_splitbar_vertical within w_orsaleysp_r
end type
type st_horizontal from u_splitbar_horizontal within w_orsaleysp_r
end type
type st_1 from statictext within w_orsaleysp_r
end type
type ddlb_fld from dropdownlistbox within w_orsaleysp_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsaleysp_r
end type
type st_4 from statictext within w_orsaleysp_r
end type
type ddlb_op from dropdownlistbox within w_orsaleysp_r
end type
type sle_value from singlelineedit within w_orsaleysp_r
end type
type cb_1 from commandbutton within w_orsaleysp_r
end type
type cb_2 from commandbutton within w_orsaleysp_r
end type
type cb_3 from commandbutton within w_orsaleysp_r
end type
type cb_5 from commandbutton within w_orsaleysp_r
end type
type gb_4 from groupbox within w_orsaleysp_r
end type
end forward

global type w_orsaleysp_r from w_inheritance
integer width = 4315
integer height = 2332
string title = "YSP 수주현황(w_orsaleysp_r)"
boolean resizable = false
dw_4 dw_4
st_3 st_3
dw_3 dw_3
em_3 em_3
em_2 em_2
em_1 em_1
rb_1 rb_1
rb_2 rb_2
st_vertical st_vertical
st_horizontal st_horizontal
st_1 st_1
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
end type
global w_orsaleysp_r w_orsaleysp_r

type variables
st_print i_print
string is_dw, is_dw1sql
end variables

on w_orsaleysp_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_3=create st_3
this.dw_3=create dw_3
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.st_vertical
this.Control[iCurrent+10]=this.st_horizontal
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.gb_4
end on

on w_orsaleysp_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
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

dw_1.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)


em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
em_3.text = "BD" + string(today(), "yyyy")
is_dw1sql = dw_1.describe("datawindow.table.select")

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth - dw_2.x - gb_4.x

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_4.x * 2)

dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = newwidth  - (gb_4.x * 2)
dw_3.height = newheight - dw_3.y - gb_4.x 

end event

type pb_save from w_inheritance`pb_save within w_orsaleysp_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3163
integer y = 40
integer taborder = 110
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleysp_r
integer x = 933
integer y = 0
integer width = 91
integer height = 68
integer taborder = 80
string dataobject = "d_orsale_print2"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;pb_retrieve.postevent(clicked!)
end event

type st_title from w_inheritance`st_title within w_orsaleysp_r
integer y = 24
integer width = 997
integer height = 136
string text = "YSP 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_orsaleysp_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleysp_r
boolean visible = false
integer x = 1659
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleysp_r
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 100
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

type pb_close from w_inheritance`pb_close within w_orsaleysp_r
integer x = 3131
integer y = 48
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleysp_r
integer x = 2935
integer y = 48
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string ls_where, ls_sql
 
if dw_4.getrow() < 1 then return
string ls_order
long ll_row

ll_row = dw_4.getrow()
ls_order = dw_4.object.order_no[ll_row]
//dw_2.retrieve(ls_order)
//dw_3.retrieve(ls_order)

string ls_scenehp
if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

//ls_where = " and sale.order_no between ~~'" + ls_order + "~~'" &
//			+ " and ~~'" + ls_order + "~~'"  
//ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
	
//dw_1.modify(ls_sql)
//dw_1.retrieve( ls_scenehp )

dw_1.retrieve( ls_scenehp, ls_order,  ls_order, '%')

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleysp_r
integer x = 1605
integer y = 56
integer width = 174
integer height = 136
integer taborder = 20
fontcharset fontcharset = ansi!
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_cancel::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_orderno
long ll_row
 
ls_orderno = TRIM(em_3.TEXT)

if isnull(ls_orderno) or ls_orderno = '' then return
select count(*) into :ll_row from sale
 where order_no = :ls_orderno;
if ll_row < 1 then 
	beep(2)
	em_3.setfocus()
	return
end if
dw_2.retrieve(ls_orderno)
dw_3.retrieve(ls_orderno)

end event

type pb_delete from w_inheritance`pb_delete within w_orsaleysp_r
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 160
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleysp_r
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 180
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleysp_r
integer x = 2738
integer y = 48
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_cust_no, ls_con
date  ld_start_date, ld_end_date

dw_4.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_4.reset()
ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
if rb_1.checked = true then
	ls_con = 'Y'
else
	ls_con = 'N'
end if
dw_4.retrieve(ld_start_date,ld_end_date, ls_con)
dw_4.setfocus()
dw_4.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleysp_r
integer x = 1074
integer y = 0
integer width = 736
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleysp_r
integer x = 1838
integer y = 0
integer width = 837
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleysp_r
integer x = 2702
integer y = 0
integer width = 658
integer height = 216
integer taborder = 120
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleysp_r
integer x = 3497
integer y = 404
integer width = 759
integer height = 984
integer taborder = 40
string dataobject = "d_orsaleysp_s1"
boolean vscrollbar = false
end type

event dw_2::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_4 from datawindow within w_orsaleysp_r
integer x = 32
integer y = 404
integer width = 3410
integer height = 984
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_orsaleysp_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
string ls_order
long   ll_row

if this.getrow() < 1 then RETURN

ll_row   = this.getrow()
ls_order = this.object.order_no[ll_row]

dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)


end event

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_3 from statictext within w_orsaleysp_r
integer x = 1111
integer y = 44
integer width = 475
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
string text = "수주번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsaleysp_r
event keydown pbm_dwnkey
integer x = 32
integer y = 1436
integer width = 4224
integer height = 776
integer taborder = 50
string dataobject = "d_orsaleysp_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_3 from editmask within w_orsaleysp_r
event keydown pbm_dwnkey
integer x = 1106
integer y = 120
integer width = 480
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF

END IF



end event

type em_2 from editmask within w_orsaleysp_r
integer x = 2254
integer y = 112
integer width = 379
integer height = 80
integer taborder = 70
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

type em_1 from editmask within w_orsaleysp_r
integer x = 1874
integer y = 112
integer width = 379
integer height = 80
integer taborder = 60
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

type rb_1 from radiobutton within w_orsaleysp_r
integer x = 1888
integer y = 40
integer width = 247
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
string text = "확정"
boolean checked = true
end type

type rb_2 from radiobutton within w_orsaleysp_r
integer x = 2162
integer y = 40
integer width = 288
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
string text = "미확정"
end type

type st_vertical from u_splitbar_vertical within w_orsaleysp_r
integer x = 3461
integer y = 404
integer height = 984
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_orsaleysp_r
integer x = 32
integer y = 1400
integer width = 4224
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type st_1 from statictext within w_orsaleysp_r
integer x = 87
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_orsaleysp_r
integer x = 274
integer y = 276
integer width = 443
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_orsaleysp_r
integer x = 306
integer y = 288
integer width = 311
integer height = 88
integer taborder = 160
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

type st_4 from statictext within w_orsaleysp_r
integer x = 745
integer y = 292
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

type ddlb_op from dropdownlistbox within w_orsaleysp_r
integer x = 914
integer y = 276
integer width = 297
integer height = 512
integer taborder = 160
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

type sle_value from singlelineedit within w_orsaleysp_r
integer x = 1234
integer y = 284
integer width = 526
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_orsaleysp_r
integer x = 1769
integer y = 284
integer width = 160
integer height = 76
integer taborder = 140
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case else
		MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_orsaleysp_r
integer x = 1934
integer y = 284
integer width = 160
integer height = 76
integer taborder = 150
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case else
		MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_orsaleysp_r
integer x = 2098
integer y = 284
integer width = 160
integer height = 76
integer taborder = 160
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case else
		MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_orsaleysp_r
integer x = 2263
integer y = 284
integer width = 160
integer height = 76
integer taborder = 170
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case else
		MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_orsaleysp_r
integer x = 32
integer y = 224
integer width = 4224
integer height = 164
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

