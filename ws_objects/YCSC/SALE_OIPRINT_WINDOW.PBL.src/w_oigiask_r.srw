$PBExportHeader$w_oigiask_r.srw
$PBExportComments$물품요청 접수 현황(2004/01/27,정갑용)
forward
global type w_oigiask_r from w_inheritance
end type
type gb_5 from groupbox within w_oigiask_r
end type
type em_1 from editmask within w_oigiask_r
end type
type em_2 from editmask within w_oigiask_r
end type
type st_1 from statictext within w_oigiask_r
end type
type dw_area from datawindow within w_oigiask_r
end type
type rb_1 from radiobutton within w_oigiask_r
end type
type rb_2 from radiobutton within w_oigiask_r
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
integer width = 4480
integer height = 2756
string title = "물품요청 현황(w_oigiask_r)"
boolean resizable = false
gb_5 gb_5
em_1 em_1
em_2 em_2
st_1 st_1
dw_area dw_area
rb_1 rb_1
rb_2 rb_2
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
this.gb_5=create gb_5
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_area=create dw_area
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
end on

on w_oigiask_r.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event resize;call super::resize;//
gb_2.width  = this.width  - 82
gb_2.height = this.height - 372

dw_1.width  = this.width  - 165
dw_1.height = this.height - 472


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
integer x = 69
integer y = 324
integer width = 4315
integer height = 2284
integer taborder = 80
string dataobject = "d_oigiask_s1"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oigiask_r
integer x = 928
integer y = 36
integer width = 87
integer height = 64
integer taborder = 110
string dataobject = "d_oigiask_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oigiask_r
integer x = 50
integer y = 64
integer width = 1024
integer height = 132
string text = "물품요청 현황"
end type

type st_tips from w_inheritance`st_tips within w_oigiask_r
end type

type pb_compute from w_inheritance`pb_compute within w_oigiask_r
integer x = 3525
integer y = 64
integer width = 302
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
integer x = 4219
integer y = 64
integer taborder = 160
end type

event pb_close::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiask_r
integer x = 4027
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
integer x = 3835
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
integer x = 1591
integer y = 16
integer width = 603
integer height = 216
integer taborder = 130
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79220952
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_oigiask_r
integer y = 260
integer width = 4398
integer height = 2384
integer taborder = 140
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiask_r
integer x = 3493
integer y = 16
integer width = 942
integer height = 216
integer taborder = 70
integer textsize = -10
long backcolor = 79220952
end type

type gb_5 from groupbox within w_oigiask_r
integer x = 2213
integer y = 16
integer width = 1262
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
integer x = 2642
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_start = date(this.text)
end if

end event

type em_2 from editmask within w_oigiask_r
integer x = 3077
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)
id_end = RelativeDate(id_end ,1)
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_end = date(this.text)
	id_end = RelativeDate(id_end ,1)
end if

end event

type st_1 from statictext within w_oigiask_r
integer x = 3003
integer y = 76
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -22
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oigiask_r
integer x = 1627
integer y = 100
integer width = 535
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
integer x = 2263
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
integer x = 2263
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

