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
type st_13 from statictext within w_ioitemloc_r
end type
type ddlb_fld from dropdownlistbox within w_ioitemloc_r
end type
type st_14 from statictext within w_ioitemloc_r
end type
type ddlb_op from dropdownlistbox within w_ioitemloc_r
end type
type sle_value from singlelineedit within w_ioitemloc_r
end type
type cb_10 from commandbutton within w_ioitemloc_r
end type
type cb_14 from commandbutton within w_ioitemloc_r
end type
type cb_15 from commandbutton within w_ioitemloc_r
end type
type cb_16 from commandbutton within w_ioitemloc_r
end type
type pb_2 from picturebutton within w_ioitemloc_r
end type
type st_1 from statictext within w_ioitemloc_r
end type
type gb_5 from gb_3 within w_ioitemloc_r
end type
end forward

global type w_ioitemloc_r from w_inheritance
integer x = 23
integer y = 136
integer width = 4713
integer height = 2684
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
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
pb_2 pb_2
st_1 st_1
gb_5 gb_5
end type
global w_ioitemloc_r w_ioitemloc_r

type variables
st_print i_print
string is_flag = "A"

end variables

forward prototypes
public subroutine wf_filter ()
end prototypes

public subroutine wf_filter ();string ls_filter, ls_fil1, ls_fil2

ls_filter = ''
ls_fil1 = ''
ls_fil2 = ''
if trim(sle_1.text) = '' then
	if rb_3.checked = true then
	elseif rb_4.checked = true then
		ls_fil2 = 'itemloc_qoh < 0'
	else
		ls_fil2 = 'itemloc_qoh <> 0'
	end if
else
	CHOOSE CASE rb_2.checked
		CASE true
			ls_fil1 = '(itemloc_item_no like "' + sle_1.text + '%")'
		CASE ELSE
			ls_fil1 = '(groupitem_item_name like "%' + sle_1.text + '%")'
	END CHOOSE
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
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.pb_2=create pb_2
this.st_1=create st_1
this.gb_5=create gb_5
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
this.Control[iCurrent+13]=this.st_13
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.st_14
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_10
this.Control[iCurrent+19]=this.cb_14
this.Control[iCurrent+20]=this.cb_15
this.Control[iCurrent+21]=this.cb_16
this.Control[iCurrent+22]=this.pb_2
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.gb_5
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
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_2.visible = false
ddlb_1.text = '전체'
string ls_loc
em_1.text = string(today(), 'yyyy/mm/dd')
select def_loc into :ls_loc from area where area_no = :gs_area;
dw_3.object.loc_no[1] = ls_loc
dw_1.sharedata(dw_2)


end event

event resize;call super::resize;//
gb_2.width  = this.width  - 123
gb_2.height = this.height - 412

dw_1.width  = this.width  - 210
dw_1.height = this.height - 600

end event

type pb_save from w_inheritance`pb_save within w_ioitemloc_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ioitemloc_r
integer x = 87
integer y = 432
integer width = 4503
integer height = 2084
integer taborder = 50
string dataobject = "d_ioitemloc_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

string ls_col, ls_text
choose case dwo.name
	case "item_no"
		ls_col  = "품목"
		ls_text = string(this.object.item_no[row])
	case "groupitem_item_name"
		ls_col  = "품명"
		ls_text = string(this.object.groupitem_item_name[row])
	case "itemloc_qa"
		ls_col  = "규격"
		ls_text = string(this.object.itemloc_qa[row])
	case "itemloc_qoh"
		ls_col  = "현재고량"
		ls_text = string(this.object.itemloc_qoh[row])
end choose

choose case ls_col
	case "현재고량"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

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

type dw_2 from w_inheritance`dw_2 within w_ioitemloc_r
integer y = 0
integer width = 114
integer height = 84
integer taborder = 70
string dataobject = "d_ioitemloc_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ioitemloc_r
integer x = 50
integer y = 52
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
integer x = 4411
integer y = 60
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioitemloc_r
integer x = 4023
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
integer x = 3831
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
integer x = 2501
integer y = 16
integer width = 1294
integer height = 204
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ioitemloc_r
integer x = 41
integer y = 276
integer width = 4590
integer height = 2272
integer taborder = 90
integer textsize = -9
integer weight = 400
long textcolor = 16711680
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_ioitemloc_r
integer x = 3803
integer y = 16
integer width = 827
integer textsize = -10
integer weight = 400
end type

type dw_3 from datawindow within w_ioitemloc_r
integer x = 2921
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
integer x = 2533
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
integer x = 1536
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
integer x = 1787
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
integer x = 1787
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
integer x = 3131
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
integer y = 216
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
integer x = 2921
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
integer x = 4210
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

type st_13 from statictext within w_ioitemloc_r
integer x = 91
integer y = 348
integer width = 160
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
integer x = 265
integer y = 332
integer width = 402
integer height = 532
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"품목","품명","규격","현재고량"}
end type

type st_14 from statictext within w_ioitemloc_r
integer x = 686
integer y = 348
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
integer x = 855
integer y = 332
integer width = 279
integer height = 512
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
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
integer x = 1147
integer y = 332
integer width = 704
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_10 from commandbutton within w_ioitemloc_r
integer x = 1861
integer y = 332
integer width = 146
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_fld.text) = "" then
	ls_column = ""
else
	string ls_col
	choose case trim(ddlb_fld.text)
		case "품명"
			ls_col  = "item_name"
		case "품목"
			ls_col  = "item_no"
		case "품명"
			ls_col  = "groupitem_item_name"
		case "규격"
			ls_col  = "itemloc_qa"
		case "현재고량"
			ls_col  = "itemloc_qoh"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "insp_log_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "itemloc_qoh"
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_14 from commandbutton within w_ioitemloc_r
integer x = 2011
integer y = 332
integer width = 146
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_fld.text  = "물품명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()

pb_retrieve.triggerevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_15 from commandbutton within w_ioitemloc_r
integer x = 2162
integer y = 332
integer width = 146
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "item_name"
	case "품목"
		ls_col  = "item_no"
	case "품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "itemloc_qa"
	case "현재고량"
		ls_col  = "itemloc_qoh"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_ioitemloc_r
integer x = 2309
integer y = 332
integer width = 146
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "item_name"
	case "품목"
		ls_col  = "item_no"
	case "품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "itemloc_qa"
	case "현재고량"
		ls_col  = "itemloc_qoh"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type pb_2 from picturebutton within w_ioitemloc_r
integer x = 4096
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
integer x = 2533
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

type gb_5 from gb_3 within w_ioitemloc_r
integer x = 1499
integer width = 987
integer taborder = 90
end type

