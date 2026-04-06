$PBExportHeader$w_oigiask_r.srw
$PBExportComments$물품요청 접수 현황(2004/01/27,정갑용)
forward
global type w_oigiask_r from w_inheritance
end type
type gb_4 from groupbox within w_oigiask_r
end type
type em_1 from editmask within w_oigiask_r
end type
type em_2 from editmask within w_oigiask_r
end type
type dw_area from datawindow within w_oigiask_r
end type
type rb_1 from radiobutton within w_oigiask_r
end type
type rb_2 from radiobutton within w_oigiask_r
end type
type st_6 from statictext within w_oigiask_r
end type
type ddlb_fld from dropdownlistbox within w_oigiask_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oigiask_r
end type
type st_7 from statictext within w_oigiask_r
end type
type sle_value from singlelineedit within w_oigiask_r
end type
type cb_1 from commandbutton within w_oigiask_r
end type
type cb_2 from commandbutton within w_oigiask_r
end type
type cb_3 from commandbutton within w_oigiask_r
end type
type cb_5 from commandbutton within w_oigiask_r
end type
type st_1 from statictext within w_oigiask_r
end type
type ddlb_op from dropdownlistbox within w_oigiask_r
end type
type st_pick from structure within w_oigiask_r
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oigiask_r from w_inheritance
integer y = 212
integer width = 3717
integer height = 2144
string title = "물품요청 현황(w_oigiask_r)"
boolean resizable = false
gb_4 gb_4
em_1 em_1
em_2 em_2
dw_area dw_area
rb_1 rb_1
rb_2 rb_2
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_1 st_1
ddlb_op ddlb_op
end type
global w_oigiask_r w_oigiask_r

type variables
st_print i_print
datawindowchild idwc_scene, idwc_locno
datawindowchild idwc_car
string  is_locnosql
date id_start, id_end
string is_order_no, is_item_no = '%', is_chk = 'A'
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);w_repsuper w_print
st_print l_print

l_print.st_datawindow = arg_dw
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 물품요청 접수 리스트를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=0 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

long ll_row

dw_2.visible  = false

em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

id_start  = date(em_1.text)
id_end    = date(em_2.text)
id_end    = RelativeDate(id_end, 1)

dw_area.settransobject(sqlca)

dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
dw_1.sharedata(dw_2)

end event

on w_oigiask_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_1=create st_1
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.ddlb_op
end on

on w_oigiask_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32



end event

type pb_save from w_inheritance`pb_save within w_oigiask_r
boolean visible = false
integer x = 3182
integer y = 68
integer taborder = 60
boolean enabled = false
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품이동",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_oigiask_r
integer x = 32
integer y = 440
integer width = 3634
integer height = 1588
integer taborder = 80
string dataobject = "d_oigiask_s1"
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oigiask_r
integer x = 37
integer y = 28
integer width = 1024
integer height = 132
string text = "물품요청 현황"
end type

type st_tips from w_inheritance`st_tips within w_oigiask_r
end type

type pb_compute from w_inheritance`pb_compute within w_oigiask_r
integer x = 2496
integer y = 300
integer width = 512
integer height = 100
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목검색"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"물품찾기",parent, li_x, li_y)

end event

event pb_compute::clicked;call super::clicked;gs_where2 lstr_where

lstr_where.chk = "S" 
openwithparm(w_whitemselectmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm

if lstr_where.chk = "Y" then
	is_item_no = lstr_where.str1[1]
	pb_retrieve.triggerevent(clicked!)
end if
end event

type pb_print_part from w_inheritance`pb_print_part within w_oigiask_r
boolean visible = false
integer x = 2798
integer y = 68
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "목동출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"목동인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oigiask_r
integer x = 3378
integer y = 64
integer taborder = 160
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiask_r
integer x = 3186
integer y = 64
integer taborder = 170
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() > 0 then
	wf_print(dw_2)
end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiask_r
boolean visible = false
integer x = 2990
integer y = 68
integer taborder = 180
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

type pb_delete from w_inheritance`pb_delete within w_oigiask_r
boolean visible = false
integer x = 2313
integer y = 60
integer taborder = 190
boolean enabled = false
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oigiask_r
boolean visible = false
integer x = 2811
integer y = 68
integer taborder = 200
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiask_r
integer x = 2994
integer y = 64
integer taborder = 30
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve(string(id_start), string(id_end), dw_area.object.area[1], is_item_no, is_chk)
is_item_no = '%'
end event

type gb_3 from w_inheritance`gb_3 within w_oigiask_r
integer x = 1120
integer y = 16
integer width = 603
integer height = 216
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79220952
end type

type gb_2 from w_inheritance`gb_2 within w_oigiask_r
integer y = 244
integer width = 3634
integer height = 184
integer taborder = 140
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiask_r
integer x = 2958
integer y = 16
integer width = 635
integer height = 216
integer taborder = 70
integer textsize = -10
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oigiask_r
integer x = 41
integer y = 184
integer width = 87
integer height = 64
integer taborder = 110
string dataobject = "d_oigiask_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type gb_4 from groupbox within w_oigiask_r
integer x = 1742
integer y = 16
integer width = 1198
integer height = 216
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_1 from editmask within w_oigiask_r
integer x = 2171
integer y = 100
integer width = 357
integer height = 80
integer taborder = 10
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

event modified;id_start = date(this.text)

end event

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
id_start = date(this.text)

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if
//
end event

type em_2 from editmask within w_oigiask_r
integer x = 2537
integer y = 100
integer width = 357
integer height = 80
integer taborder = 20
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
end type

event modified;id_end = date(this.text)
id_end = RelativeDate(id_end ,1)
end event

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
id_end = date(this.text)
id_end = RelativeDate(id_end ,1)

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//	id_end = RelativeDate(id_end ,1)
//end if
//
end event

type dw_area from datawindow within w_oigiask_r
integer x = 1157
integer y = 136
integer width = 526
integer height = 84
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type rb_1 from radiobutton within w_oigiask_r
integer x = 1792
integer y = 76
integer width = 352
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
string text = "요청현황"
boolean checked = true
end type

event clicked;is_chk = 'A'
end event

type rb_2 from radiobutton within w_oigiask_r
integer x = 1792
integer y = 148
integer width = 352
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
string text = "접수현황"
end type

event clicked;is_chk = 'B'
end event

type st_6 from statictext within w_oigiask_r
integer x = 96
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

type ddlb_fld from dropdownlistbox within w_oigiask_r
integer x = 283
integer y = 308
integer width = 480
integer height = 632
integer taborder = 20
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

type ddlb_dwtitles from dropdownlistbox within w_oigiask_r
integer x = 325
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

type st_7 from statictext within w_oigiask_r
integer x = 782
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

type sle_value from singlelineedit within w_oigiask_r
integer x = 1271
integer y = 316
integer width = 517
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

type cb_1 from commandbutton within w_oigiask_r
integer x = 1801
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

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oigiask_r
integer x = 1966
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oigiask_r
integer x = 2130
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oigiask_r
integer x = 2295
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_1 from statictext within w_oigiask_r
integer x = 1157
integer y = 56
integer width = 526
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_oigiask_r
integer x = 960
integer y = 308
integer width = 302
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

