$PBExportHeader$w_ioitemloc_r.srw
$PBExportComments$저장소별재고현황(1998/05/13,곽용덕)
forward 
global type w_ioitemloc_r from w_inheritance
end type
type dw_3 from datawindow within w_ioitemloc_r
end type
type ddlb_1 from dropdownlistbox within w_ioitemloc_r
end type
type rb_1 from radiobutton within w_ioitemloc_r
end type
type rb_2 from radiobutton within w_ioitemloc_r
end type
type sle_1 from singlelineedit within w_ioitemloc_r
end type
type rb_3 from radiobutton within w_ioitemloc_r
end type
type rb_4 from radiobutton within w_ioitemloc_r
end type
type rb_5 from radiobutton within w_ioitemloc_r
end type
type em_1 from editmask within w_ioitemloc_r
end type
type st_2 from statictext within w_ioitemloc_r
end type
type st_3 from statictext within w_ioitemloc_r
end type
type pb_1 from picturebutton within w_ioitemloc_r
end type
type pb_2 from picturebutton within w_ioitemloc_r
end type
type st_1 from statictext within w_ioitemloc_r
end type
type st_4 from statictext within w_ioitemloc_r
end type
type ddlb_fld from dropdownlistbox within w_ioitemloc_r
end type
type st_5 from statictext within w_ioitemloc_r
end type
type ddlb_op from dropdownlistbox within w_ioitemloc_r
end type
type sle_value from singlelineedit within w_ioitemloc_r
end type
type cb_1 from commandbutton within w_ioitemloc_r
end type
type cb_2 from commandbutton within w_ioitemloc_r
end type
type cb_3 from commandbutton within w_ioitemloc_r
end type
type cb_5 from commandbutton within w_ioitemloc_r
end type
type gb_5 from gb_3 within w_ioitemloc_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ioitemloc_r
end type
end forward

global type w_ioitemloc_r from w_inheritance
integer x = 23
integer y = 136
integer width = 4521
integer height = 2132
string title = "저장소별 재고현황(w_ioitemloc_r)"
dw_3 dw_3
ddlb_1 ddlb_1
rb_1 rb_1
rb_2 rb_2
sle_1 sle_1
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
em_1 em_1
st_2 st_2
st_3 st_3
pb_1 pb_1
pb_2 pb_2
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_5 gb_5
ddlb_dwtitles ddlb_dwtitles
end type
global w_ioitemloc_r w_ioitemloc_r

type variables
st_print i_print
string is_flag = "A"

end variables

forward prototypes
public subroutine wf_filter ()
end prototypes

public subroutine wf_filter ();//
string ls_filter, ls_fil1, ls_fil2

ls_filter = ''
ls_fil1   = ''
ls_fil2   = ''
if trim(sle_1.text) = '' then
	if rb_3.checked = true then
	elseif rb_4.checked = true then
		ls_fil2 = 'itemloc_qoh < 0'
	else
		ls_fil2 = 'itemloc_qoh <> 0'
	end if
else
	choose case rb_2.checked
		case true
			ls_fil1 = '(itemloc_item_no     like "'  + sle_1.text + '%")'
		case else
			ls_fil1 = '(groupitem_item_name like "%' + sle_1.text + '%")'
	end choose
	
	if rb_3.checked = true then
	elseif rb_4.checked = true then
		ls_fil2 = 'and itemloc_qoh < 0'
	else
		ls_fil2 = 'and itemloc_qoh <> 0'
	end if
end if

ls_filter = ls_fil1 + ls_fil2
dw_1.setfilter(ls_filter)
dw_1.filter()

if dw_1.rowcount() < 1 then
	sle_1.setfocus()
else
	pb_compute.default = false
end if


end subroutine

on w_ioitemloc_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.ddlb_1=create ddlb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.sle_1=create sle_1
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.em_1=create em_1
this.st_2=create st_2
this.st_3=create st_3
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_5=create gb_5
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.ddlb_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.rb_5
this.Control[iCurrent+9]=this.em_1
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.pb_2
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.ddlb_fld
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.cb_5
this.Control[iCurrent+24]=this.gb_5
this.Control[iCurrent+25]=this.ddlb_dwtitles
end on

on w_ioitemloc_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.ddlb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.sle_1)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_5)
destroy(this.ddlb_dwtitles)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_3.settransobject(sqlca)
dw_3.insertrow(0)

dw_2.visible = false
ddlb_1.text = '전체'

string ls_loc

em_1.text = string(today(), 'yyyy/mm/dd')
SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;

dw_3.object.loc_no[1] = ls_loc
dw_1.sharedata(dw_2)


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_ioitemloc_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ioitemloc_r
integer x = 32
integer y = 468
integer width = 4407
integer height = 1528
integer taborder = 50
string dataobject = "d_ioitemloc_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rbuttondown;call super::rbuttondown;if this.rowcount() < 1 then return
gs_where lst_where

this.scrolltorow(row)
this.SelectRow(0,  false)
this.SelectRow(row, true)

int ls_a
ls_a = this.GetClickedColumn()

lst_where.str1 = trim(this.object.item_no[row])
lst_where.str2 = trim(this.object.itemloc_qa[row])
lst_where.str3 = trim(this.object.itemloc_loc_no[row])
lst_where.name = trim(this.object.groupitem_item_name[row])

m_manager NewMenu
int li_int

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_inaudit.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())

lst_where.chk = "DO"
if gs_print_control = 'INAUDIT' then
	openwithparm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
end if

end event

type st_title from w_inheritance`st_title within w_ioitemloc_r
integer x = 41
integer y = 28
integer width = 1221
integer height = 136
string text = "저장소별 재고현황"
end type

type st_tips from w_inheritance`st_tips within w_ioitemloc_r
end type

type pb_compute from w_inheritance`pb_compute within w_ioitemloc_r
integer x = 2523
integer y = 324
integer height = 88
integer taborder = 100
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;call super::clicked;wf_filter()
end event

type pb_print_part from w_inheritance`pb_print_part within w_ioitemloc_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ioitemloc_r
integer x = 4219
integer y = 60
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioitemloc_r
integer x = 3831
integer y = 60
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_loc
long ll_row

if dw_1.rowcount() < 1 then return

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 저장소별 재고현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ioitemloc_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ioitemloc_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ioitemloc_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ioitemloc_r
integer x = 3639
integer y = 60
integer taborder = 150
fontcharset fontcharset = ansi!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_loc, ls_date
ls_date = string(date(em_1.text), 'yyyymmdd')

dw_1.reset()
dw_3.accepttext()
ls_loc = trim(dw_3.object.loc_no[1])
dw_1.retrieve(ls_loc, is_flag,  ls_date)

end event

type gb_3 from w_inheritance`gb_3 within w_ioitemloc_r
integer x = 2309
integer y = 16
integer width = 1294
integer height = 212
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ioitemloc_r
integer y = 264
integer width = 4407
integer height = 180
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_ioitemloc_r
integer x = 3611
integer y = 16
integer width = 827
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ioitemloc_r
integer x = 969
integer y = 176
integer width = 114
integer height = 84
integer taborder = 70
string dataobject = "d_ioitemloc_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ioitemloc_r
integer x = 2729
integer y = 48
integer width = 850
integer height = 84
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type ddlb_1 from dropdownlistbox within w_ioitemloc_r
integer x = 2341
integer y = 128
integer width = 370
integer height = 364
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","상품","제품","원재료"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_flag = "A"
	CASE 2
		is_flag = "G%"
	CASE 3
		is_flag = "P%"
	CASE 4
		is_flag = "M%"
END CHOOSE

end event

type rb_1 from radiobutton within w_ioitemloc_r
integer x = 2738
integer y = 320
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "품명"
boolean checked = true
end type

event clicked;dw_1.setsort('groupitem_item_name , itemloc_qa')
dw_1.sort()
end event

type rb_2 from radiobutton within w_ioitemloc_r
integer x = 2738
integer y = 372
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "코드"
end type

event clicked;dw_1.setsort('itemloc_item_no , itemloc_qa')
dw_1.sort()
end event

type sle_1 from singlelineedit within w_ioitemloc_r
integer x = 2981
integer y = 328
integer width = 882
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
end type

event getfocus;pb_compute.default = true
end event

type rb_3 from radiobutton within w_ioitemloc_r
integer x = 1344
integer y = 64
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;wf_filter()
end event

type rb_4 from radiobutton within w_ioitemloc_r
integer x = 1595
integer y = 64
integer width = 526
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "현재고 0 이하"
end type

event clicked;wf_filter()
end event

type rb_5 from radiobutton within w_ioitemloc_r
integer x = 1595
integer y = 136
integer width = 672
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "현재고 0 인것 제외"
end type

event clicked;wf_filter()
end event

type em_1 from editmask within w_ioitemloc_r
integer x = 2939
integer y = 132
integer width = 448
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_ioitemloc_r
integer x = 50
integer y = 200
integer width = 832
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "오른쪽마우스 => 재고이력 검색"
boolean focusrectangle = false
end type

type st_3 from statictext within w_ioitemloc_r
integer x = 2729
integer y = 132
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "일자"
alignment alignment = center!
boolean border = true
long bordercolor = 15780518
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ioitemloc_r
event mousemove pbm_mousemove
integer x = 4018
integer y = 60
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type pb_2 from picturebutton within w_ioitemloc_r
integer x = 3909
integer y = 320
integer width = 494
integer height = 100
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력 검색"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;long ll_row

if dw_1.rowcount() < 1 then return
gs_where lst_where

ll_row = dw_1.getrow()

dw_1.scrolltorow(ll_row)
//dw_1.SelectRow(0,  false)
//dw_1.SelectRow(ll_row, true)

//int ls_a
//ls_a = this.GetClickedColumn()

lst_where.str1 = trim(dw_1.object.item_no[ll_row])
lst_where.str2 = trim(dw_1.object.itemloc_qa[ll_row])
lst_where.str3 = trim(dw_1.object.itemloc_loc_no[ll_row])
lst_where.name = trim(dw_1.object.groupitem_item_name[ll_row])

//m_manager NewMenu
//int li_int
//
//NewMenu = CREATE m_manager
//gs_print_control = ""
//li_int = m_manager.m_inaudit.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())

lst_where.chk = "DO"
//if gs_print_control = 'INAUDIT' then
	openwithparm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
//end if

end event

type st_1 from statictext within w_ioitemloc_r
integer x = 2341
integer y = 52
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "재고구분"
alignment alignment = center!
boolean border = true
long bordercolor = 15780518
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ioitemloc_r
integer x = 96
integer y = 340
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

type ddlb_fld from dropdownlistbox within w_ioitemloc_r
integer x = 283
integer y = 324
integer width = 480
integer height = 632
integer taborder = 90
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

type st_5 from statictext within w_ioitemloc_r
integer x = 782
integer y = 340
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

type ddlb_op from dropdownlistbox within w_ioitemloc_r
integer x = 951
integer y = 324
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ioitemloc_r
integer x = 1271
integer y = 332
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ioitemloc_r
integer x = 1842
integer y = 332
integer width = 160
integer height = 76
integer taborder = 80
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ioitemloc_r
integer x = 2007
integer y = 332
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

type cb_3 from commandbutton within w_ioitemloc_r
integer x = 2171
integer y = 332
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ioitemloc_r
integer x = 2336
integer y = 332
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_5 from gb_3 within w_ioitemloc_r
integer x = 1307
integer width = 987
integer taborder = 90
end type

type ddlb_dwtitles from dropdownlistbox within w_ioitemloc_r
integer x = 334
integer y = 340
integer width = 311
integer height = 88
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

