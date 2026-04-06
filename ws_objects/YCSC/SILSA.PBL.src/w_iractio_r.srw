$PBExportHeader$w_iractio_r.srw
$PBExportComments$실사차이보고서(2000/09/04,이인호)
forward
global type w_iractio_r from w_inheritance
end type
type dw_4 from datawindow within w_iractio_r
end type
type sle_1 from singlelineedit within w_iractio_r
end type
type rb_1 from radiobutton within w_iractio_r
end type
type rb_2 from radiobutton within w_iractio_r
end type
type st_2 from statictext within w_iractio_r
end type
type rb_3 from radiobutton within w_iractio_r
end type
type rb_4 from radiobutton within w_iractio_r
end type
type ddlb_3 from dropdownlistbox within w_iractio_r
end type
type cbx_2 from checkbox within w_iractio_r
end type
type rb_5 from radiobutton within w_iractio_r
end type
type rb_6 from radiobutton within w_iractio_r
end type
type em_1 from editmask within w_iractio_r
end type
type st_4 from statictext within w_iractio_r
end type
type cbx_1 from checkbox within w_iractio_r
end type
type pb_excel from picturebutton within w_iractio_r
end type
type cb_1 from commandbutton within w_iractio_r
end type
type em_2 from editmask within w_iractio_r
end type
type st_3 from statictext within w_iractio_r
end type
type ddlb_fld from dropdownlistbox within w_iractio_r
end type
type ddlb_dwtitles from dropdownlistbox within w_iractio_r
end type
type st_1 from statictext within w_iractio_r
end type
type ddlb_op from dropdownlistbox within w_iractio_r
end type
type sle_value from singlelineedit within w_iractio_r
end type
type cb_2 from commandbutton within w_iractio_r
end type
type cb_3 from commandbutton within w_iractio_r
end type
type cb_4 from commandbutton within w_iractio_r
end type
type cb_5 from commandbutton within w_iractio_r
end type
type dw_3 from datawindow within w_iractio_r
end type
type gb_4 from groupbox within w_iractio_r
end type
end forward

global type w_iractio_r from w_inheritance
integer y = 36
integer width = 3712
integer height = 2772
string title = "실사차이 보고서(w_iractio_r)"
dw_4 dw_4
sle_1 sle_1
rb_1 rb_1
rb_2 rb_2
st_2 st_2
rb_3 rb_3
rb_4 rb_4
ddlb_3 ddlb_3
cbx_2 cbx_2
rb_5 rb_5
rb_6 rb_6
em_1 em_1
st_4 st_4
cbx_1 cbx_1
pb_excel pb_excel
cb_1 cb_1
em_2 em_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_1 st_1
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
dw_3 dw_3
gb_4 gb_4
end type
global w_iractio_r w_iractio_r

type variables
//
datawindowchild idwc_loc
st_print i_print
int ii_fil = 0, ii_sw = 0


end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();// 필터링
string ls_filter, ls_add

ls_filter = ''
choose case ii_fil
	case 0, 1
		ls_filter = ''
	case 2
		ls_filter = ' (qoh <> 0 or eom_qoh <> 0) '
	case 3
		ls_filter = ' (eom_qoh <> 0) '
	case 4
		ls_filter = ' (qoh <> 0) '
	case 5
		ls_filter = ' (def_qty <> 0) '
end choose

if cbx_1.checked = true then		// 차이수량이
	if trim(ls_filter) = '' or isnull(ls_filter) then
		ls_add = ''
	else
		ls_add = ' and '
	end if
	ls_filter = ls_filter + ls_add + 'abs(def_qty) >= integer("' + em_1.text + '")'
end if

dw_1.setfilter(ls_filter)
dw_1.filter()

end subroutine

on w_iractio_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.sle_1=create sle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2=create st_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.ddlb_3=create ddlb_3
this.cbx_2=create cbx_2
this.rb_5=create rb_5
this.rb_6=create rb_6
this.em_1=create em_1
this.st_4=create st_4
this.cbx_1=create cbx_1
this.pb_excel=create pb_excel
this.cb_1=create cb_1
this.em_2=create em_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_1=create st_1
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_3=create dw_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.ddlb_3
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.rb_5
this.Control[iCurrent+11]=this.rb_6
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.pb_excel
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.em_2
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.ddlb_fld
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.st_1
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.sle_value
this.Control[iCurrent+24]=this.cb_2
this.Control[iCurrent+25]=this.cb_3
this.Control[iCurrent+26]=this.cb_4
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.dw_3
this.Control[iCurrent+29]=this.gb_4
end on

on w_iractio_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.sle_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.ddlb_3)
destroy(this.cbx_2)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.em_1)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.pb_excel)
destroy(this.cb_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_1)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

string ls_loc

SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;

ddlb_3.text    = "전체"
ddlb_3.enabled = false
//cbx_2.enabled = false		// 중점관리품목만

dw_3.visible   = false
dw_4.visible   = false
dw_4.settransobject(sqlca)

dw_2.insertrow(0)  
dw_2.getchild('loc_no', idwc_loc)
dw_2.object.loc_no[1] = ls_loc

if GF_PERMISSION("실사차이_보고서(전체)", gs_userid) = 'Y' then
	idwc_loc.insertrow(1)
	idwc_loc.setitem(1,'loc_no',  '%')
	idwc_loc.setitem(1,'loc_name','전체')
	idwc_loc.setitem(1,'loc_type','N')
	idwc_loc.accepttext()
end if

// 실사전
rb_5.checked = true
rb_5.triggerevent( clicked! )

// 사내 필터링
idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()


// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;

if Day(today()) > 10 then
	em_2.text = string(today(),'yyyy/mm')
else
	em_2.text = string( RelativeDate(today(), - Day(today()) ),'yyyy/mm')	// 전달말일
end if

end event

event resize;call super::resize;dw_1.width  = this.width  - 132
dw_1.height = this.height - 684

end event

type pb_save from w_inheritance`pb_save within w_iractio_r
boolean visible = false
integer x = 3159
integer y = 48
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_iractio_r
string tag = "d_iractio_s"
integer x = 46
integer y = 540
integer width = 3575
integer height = 2088
integer taborder = 50
string title = "d_iractio_s3"
string dataobject = "d_iractio_s3"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rbuttondown;call super::rbuttondown;if row < 1 then return
gs_where lst_where

this.scrolltorow(row)
//this.SelectRow(0,  false)
//this.SelectRow(row,  true)
int ls_a
ls_a = this.GetClickedColumn()

lst_where.str1 = trim(this.object.itemloc_item_no[row])
lst_where.str2 = trim(this.object.itemloc_qa[row])
lst_where.str3 = trim(dw_2.object.loc_no[1])
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

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

this.SelectRow(0,  false)
this.SelectRow(ll_row,  true)

end event

type dw_2 from w_inheritance`dw_2 within w_iractio_r
integer x = 91
integer y = 324
integer width = 983
integer height = 88
integer taborder = 60
string dataobject = "d_irsilsainput_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;dw_1.reset()

end event

type st_title from w_inheritance`st_title within w_iractio_r
integer x = 69
integer y = 52
integer width = 1179
string text = "실사차이 보고서"
end type

type st_tips from w_inheritance`st_tips within w_iractio_r
end type

type pb_compute from w_inheritance`pb_compute within w_iractio_r
boolean visible = false
integer x = 1687
integer y = 68
integer height = 140
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_iractio_r
boolean visible = false
integer x = 2843
integer y = 244
end type

type pb_close from w_inheritance`pb_close within w_iractio_r
integer x = 3392
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iractio_r
integer x = 3200
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

i_print.st_datawindow  = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 실사결과 보고서를 출력합니다." 
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iractio_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_iractio_r
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_iractio_r
boolean visible = false
integer x = 2779
integer y = 272
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iractio_r
integer x = 2798
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_year, ls_mon, ls_location, ls_code, ls_name, ls_pyear, ls_pmon, ls_null

setnull(ls_null)
ls_location = trim(dw_2.object.loc_no[1])
if isnull(ls_location) or ls_location = "" then
	messagebox('오류','저장소를 입력하십시오.',exclamation!)
	return	
end if

ls_year = LeftA(em_2.text,4)
ls_mon  = RightA(em_2.text,2)

ddlb_3.text    = "전체"

choose case rb_1.checked	// 코드
	case true
		ls_code = sle_1.text + "%"
		ls_name = "%"

	case else
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
end choose

choose case ls_mon
	case '01'
		ls_pyear = string(integer(ls_year) - 1)
		ls_pmon = "12"
	case else
		ls_pyear = ls_year
		ls_pmon  = RightA("00" + string(integer(ls_mon) - 1),2)
end choose

debugbreak()
dw_1.settransobject(sqlca)
dw_1.sharedata(dw_4)

if cbx_2.checked = true then	// 중점관리품목만
	dw_1.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name, ls_pyear, ls_pmon)
	dw_4.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name, ls_pyear, ls_pmon)
else
	dw_1.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name )
	dw_4.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name )
end if
ddlb_3.enabled = true

end event

type gb_3 from w_inheritance`gb_3 within w_iractio_r
integer x = 46
integer width = 1637
integer height = 208
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iractio_r
integer x = 1783
integer width = 1838
integer height = 208
integer taborder = 90
integer textsize = -9
integer weight = 400
long textcolor = 16711680
string text = "실사후"
end type

type gb_1 from w_inheritance`gb_1 within w_iractio_r
integer x = 2176
integer y = 8
integer width = 1445
integer taborder = 40
integer textsize = -10
end type

type dw_4 from datawindow within w_iractio_r
integer x = 1289
integer y = 72
integer width = 137
integer height = 100
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_iractio_r"
boolean livescroll = true
end type

type sle_1 from singlelineedit within w_iractio_r
integer x = 2231
integer y = 112
integer width = 521
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_iractio_r
integer x = 2245
integer y = 56
integer width = 215
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
string text = "코드"
boolean checked = true
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "itemloc_item_no A, itemloc_qa A, groupitem_item_name A "
else
	ii_sw = 0
	ls_sort = "itemloc_item_no D, itemloc_qa A, groupitem_item_name A "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type rb_2 from radiobutton within w_iractio_r
integer x = 2533
integer y = 56
integer width = 215
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
string text = "명"
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "groupitem_item_name A, itemloc_item_no A, itemloc_qa A "
else
	ii_sw = 0
	ls_sort = "groupitem_item_name D, itemloc_item_no A, itemloc_qa A "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type st_2 from statictext within w_iractio_r
integer x = 1093
integer y = 340
integer width = 155
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "년월"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_iractio_r
integer x = 87
integer y = 268
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

event clicked;idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

end event

type rb_4 from radiobutton within w_iractio_r
integer x = 343
integer y = 272
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

event clicked;idwc_loc.setfilter("loc_type = 'Y'")
idwc_loc.filter()

end event

type ddlb_3 from dropdownlistbox within w_iractio_r
integer x = 2537
integer y = 312
integer width = 1061
integer height = 604
integer taborder = 80
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
string item[] = {"전체","월말재고or실사수량이 있는것만","월말재고가 0 이아닌것","실사수량이 0 이 아닌것","차이수량이 0 이 아닌것"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
ii_fil = index
wf_fil()
end event

type cbx_2 from checkbox within w_iractio_r
integer x = 1490
integer y = 120
integer width = 567
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
string text = "중점관리품목만"
end type

event clicked;//// 중점관리품목만
//if cbx_2.checked = true then	
//	dw_1.dataobject = 'd_iractio_s2'
//	dw_4.dataobject = 'd_iractio_r2'
//else
//	if rb_5.checked = true then
//		dw_1.dataobject = 'd_iractio_s3'
//	else
//		dw_1.dataobject = 'd_iractio_s'
//	end if
//	dw_4.dataobject = 'd_iractio_r'
//end if
//dw_1.settransobject(sqlca)
//dw_4.settransobject(sqlca)


if cbx_2.checked = true then
	dw_1.dataobject = 'd_iractio_s2'
else
	dw_1.dataobject = 'd_iractio_s'
end if
dw_1.settransobject(sqlca)

end event

type rb_5 from radiobutton within w_iractio_r
integer x = 1486
integer y = 52
integer width = 302
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
string text = "실사전"
boolean checked = true
end type

event clicked;// 실사전
cbx_2.visible   = false		// 중점관리품목만
cbx_2.checked   = false

dw_1.dataobject = 'd_iractio_s3'
dw_1.settransobject(sqlca)

end event

type rb_6 from radiobutton within w_iractio_r
integer x = 1792
integer y = 52
integer width = 302
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
string text = "실사후"
end type

event clicked;// 실사후
cbx_2.visible   = true		// 중점관리품목만
cbx_2.checked   = false

dw_1.dataobject = 'd_iractio_s'
dw_1.settransobject(sqlca)

end event

type em_1 from editmask within w_iractio_r
integer x = 1833
integer y = 340
integer width = 402
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,##0"
end type

event modified;
wf_fil()
end event

type st_4 from statictext within w_iractio_r
integer x = 2286
integer y = 308
integer width = 215
integer height = 108
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "이상인제품만"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_iractio_r
integer x = 1833
integer y = 284
integer width = 407
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
string text = "차이수량이"
end type

event clicked;
wf_fil()
end event

type pb_excel from picturebutton within w_iractio_r
event mousemove pbm_mousemove
integer x = 3008
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
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
datawindow dwxls

dwxls = dw_1

if dwxls.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	                        ls_Docname, ls_Named, "XLS", &
	                        "엑셀 (*.XLS), *.XLS," + &
                           "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dwxls.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dwxls.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type cb_1 from commandbutton within w_iractio_r
integer x = 3017
integer y = 452
integer width = 603
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw_1.GetClickedColumn()

lst_where.str1 = trim(dw_1.object.itemloc_item_no[ll_row])
lst_where.str2 = trim(dw_1.object.itemloc_qa[ll_row])
lst_where.str3 = trim(dw_2.object.loc_no[1])
lst_where.name = trim(dw_1.object.groupitem_item_name[ll_row])
lst_where.chk = "DO"

gs_print_control = "INAUDIT"
if gs_print_control = 'INAUDIT' then
	openwithparm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
end if

end event

type em_2 from editmask within w_iractio_r
integer x = 1280
integer y = 316
integer width = 357
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

type st_3 from statictext within w_iractio_r
integer x = 69
integer y = 460
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

type ddlb_fld from dropdownlistbox within w_iractio_r
integer x = 256
integer y = 444
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

type ddlb_dwtitles from dropdownlistbox within w_iractio_r
integer x = 297
integer y = 456
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

type st_1 from statictext within w_iractio_r
integer x = 754
integer y = 460
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

type ddlb_op from dropdownlistbox within w_iractio_r
integer x = 923
integer y = 444
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

type sle_value from singlelineedit within w_iractio_r
integer x = 1243
integer y = 452
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

type cb_2 from commandbutton within w_iractio_r
integer x = 1815
integer y = 452
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

type cb_3 from commandbutton within w_iractio_r
integer x = 1979
integer y = 452
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

type cb_4 from commandbutton within w_iractio_r
integer x = 2144
integer y = 452
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

type cb_5 from commandbutton within w_iractio_r
integer x = 2309
integer y = 452
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

type dw_3 from datawindow within w_iractio_r
integer x = 270
integer y = 1112
integer width = 3150
integer height = 924
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_iractio_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_iractio_r
integer x = 1445
integer y = 8
integer width = 699
integer height = 204
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

