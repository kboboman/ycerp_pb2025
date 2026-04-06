$PBExportHeader$w_ircoilactoi_r.srw
$PBExportComments$코일실사차이보고서(2004/12/24,이인호)
forward 
global type w_ircoilactoi_r from w_inheritance
end type
type dw_4 from datawindow within w_ircoilactoi_r
end type
type rb_3 from radiobutton within w_ircoilactoi_r
end type
type rb_4 from radiobutton within w_ircoilactoi_r
end type
type em_1 from editmask within w_ircoilactoi_r
end type
type st_1 from statictext within w_ircoilactoi_r
end type
type cbx_1 from checkbox within w_ircoilactoi_r
end type
end forward

global type w_ircoilactoi_r from w_inheritance
integer y = 36
integer width = 3694
integer height = 2380
string title = "코일실사차이 보고서(w_ircoilactio_r)"
dw_4 dw_4
rb_3 rb_3
rb_4 rb_4
em_1 em_1
st_1 st_1
cbx_1 cbx_1
end type
global w_ircoilactoi_r w_ircoilactoi_r

type variables
st_print i_print
int ii_fil = 0, ii_sw = 0

datawindowchild idwc_loc, idwc_item

end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();//string ls_filter, ls_add
//
//ls_filter = ''
//CHOOSE CASE ii_fil
//	CASE 0, 1
//		ls_filter = ''
//	CASE 2
//		ls_filter = ' (qoh <> 0 or eom_qoh <> 0) '
//	CASE 3
//		ls_filter = ' (eom_qoh <> 0) '
//	CASE 4
//		ls_filter = ' (qoh <> 0) '
//	CASE 5
//		ls_filter = ' (def_qty <> 0) '
//END CHOOSE
//if cbx_1.checked = true then
//	if trim(ls_filter) = '' or isnull(ls_filter) then
//		ls_add = ''
//	else
//		ls_add = ' and '
//	end if
//	ls_filter = ls_filter + ls_add + 'abs(def_qty) >= integer("' + em_1.text + '")'
//end if
//dw_1.setfilter(ls_filter)
//dw_1.filter()
//
end subroutine

on w_ircoilactoi_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.rb_3=create rb_3
this.rb_4=create rb_4
this.em_1=create em_1
this.st_1=create st_1
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.rb_3
this.Control[iCurrent+3]=this.rb_4
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cbx_1
end on

on w_ircoilactoi_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cbx_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.settransobject(sqlca)
dw_2.insertrow(0)

dw_2.getchild("loc_no", idwc_loc)
idwc_loc.setfilter("loc_type <> 'Y'")
idwc_loc.filter()

//idwc_loc.settransobject(SQLCA)
//
//idwc_loc.insertrow(1)
//idwc_loc.setitem(1, "loc_no", "%")
//idwc_loc.setitem(1, "loc_name", "전체")
//idwc_loc.setitem(1, "loc_type", "A")

dw_4.visible = false
// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'yyyy/mm/dd')
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if


dw_1.sharedata(dw_4)
dw_2.getchild("item_no", idwc_item)
idwc_item.settransobject(SQLCA)
idwc_item.insertrow(1)
idwc_item.setitem(1, "item_no", "%")
idwc_item.setitem(1, "item_name", "전체")
dw_2.object.flag[1]   = 'S'
dw_2.object.loc_no[1] = 'WW01'

end event

event resize;call super::resize;dw_1.width  = this.width  - 124
dw_1.height = this.height - 488
end event

type pb_save from w_inheritance`pb_save within w_ircoilactoi_r
boolean visible = false
integer x = 3159
integer y = 48
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_ircoilactoi_r
integer x = 37
integer y = 352
integer width = 3570
integer height = 1892
integer taborder = 50
string dataobject = "d_ircoilactoi_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rbuttondown;call super::rbuttondown;//if row < 1 then return
//gs_where lst_where
//
//this.scrolltorow(row)
////this.SelectRow(0,  false)
////this.SelectRow(row,  true)
//int ls_a
//ls_a = this.GetClickedColumn()
//
//lst_where.str1 = trim(this.object.itemloc_item_no[row])
//lst_where.str2 = trim(this.object.itemloc_qa[row])
//lst_where.str3 = trim(dw_2.object.loc_no[1])
//lst_where.name = trim(this.object.groupitem_item_name[row])
//
//m_manager NewMenu
//int li_int
//
//NewMenu = CREATE m_manager
//gs_print_control = ""
//li_int = m_manager.m_inaudit .PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())
//
//lst_where.chk = "DO"
//if gs_print_control = 'INAUDIT' then
//	openwithparm(w_whinaudit_w, lst_where)
//	w_whinaudit_w.WindowState = Normal!
//	lst_where = message.powerobjectparm
//end if
//
end event

event dw_1::clicked;call super::clicked;if row < 1 then return

this.scrolltorow(row)

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

this.SelectRow(0,  false)
this.SelectRow(ll_row,  true)

end event

type st_title from w_inheritance`st_title within w_ircoilactoi_r
integer x = 50
integer y = 44
integer width = 1454
string text = "코일실사차이 보고서"
end type

type st_tips from w_inheritance`st_tips within w_ircoilactoi_r
end type

type pb_compute from w_inheritance`pb_compute within w_ircoilactoi_r
boolean visible = false
integer x = 1687
integer y = 68
integer height = 140
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ircoilactoi_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ircoilactoi_r
integer x = 3397
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ircoilactoi_r
integer x = 3205
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 코일실사결과 보고서를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ircoilactoi_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_ircoilactoi_r
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_ircoilactoi_r
boolean visible = false
integer x = 2775
integer y = 48
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ircoilactoi_r
integer x = 3013
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_location, ls_wc, ls_item, ls_flag
 
ls_location = trim(dw_2.object.loc_no[1])
ls_item = trim(dw_2.object.item_no[1])
ls_flag = trim(dw_2.object.flag[1])

if isnull(ls_location) then
	messagebox('오류','저장소를 입력하십시오.',exclamation!)
	return	
end if

dw_1.settransobject(sqlca)
ls_date = trim(em_1.text)
dw_1.reset()
if cbx_1.checked = true then
	ls_wc = 'Y'
else
	ls_wc = 'N'
end if
dw_1.retrieve(ls_date, ls_location, ls_wc, ls_flag, ls_item)

end event

type gb_3 from w_inheritance`gb_3 within w_ircoilactoi_r
boolean visible = false
integer x = 9
integer y = 212
integer width = 1723
integer height = 188
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ircoilactoi_r
integer x = 37
integer y = 212
integer width = 3570
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ircoilactoi_r
integer x = 1705
integer y = 8
integer width = 1897
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ircoilactoi_r
integer x = 46
integer y = 244
integer width = 3301
integer height = 80
integer taborder = 60
string dataobject = "d_iocoilqoh_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::losefocus;call super::losefocus;this.accepttext()
end event

type dw_4 from datawindow within w_ircoilactoi_r
integer x = 1563
integer y = 84
integer width = 114
integer height = 88
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ircoilactoi_r"
boolean livescroll = true
end type

type rb_3 from radiobutton within w_ircoilactoi_r
integer x = 2743
integer y = 60
integer width = 201
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
string text = "사내"
boolean checked = true
end type

event clicked;idwc_loc.setfilter("loc_type <> 'Y' or loc_type = 'A'")
idwc_loc.filter()

end event

type rb_4 from radiobutton within w_ircoilactoi_r
integer x = 2743
integer y = 128
integer width = 201
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
string text = "외주"
end type

event clicked;idwc_loc.setfilter("loc_type = 'Y' or loc_type = 'A'")
idwc_loc.filter()

end event

type em_1 from editmask within w_ircoilactoi_r
integer x = 2057
integer y = 72
integer width = 466
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -11
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

type st_1 from statictext within w_ircoilactoi_r
integer x = 1746
integer y = 92
integer width = 306
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "실사일자:"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_ircoilactoi_r
integer x = 2958
integer y = 252
integer width = 416
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
string text = "작업장포함"
end type

