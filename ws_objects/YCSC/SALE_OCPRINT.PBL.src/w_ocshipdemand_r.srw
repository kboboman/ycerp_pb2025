$PBExportHeader$w_ocshipdemand_r.srw
$PBExportComments$운반비청구내역조회(2002/08/28,이인호)
forward
global type w_ocshipdemand_r from w_inheritance
end type
type em_1 from editmask within w_ocshipdemand_r
end type
type em_2 from editmask within w_ocshipdemand_r
end type
type dw_area from datawindow within w_ocshipdemand_r
end type
type ddlb_1 from dropdownlistbox within w_ocshipdemand_r
end type
type rb_4 from radiobutton within w_ocshipdemand_r
end type
type rb_5 from radiobutton within w_ocshipdemand_r
end type
type rb_3 from radiobutton within w_ocshipdemand_r
end type
type dw_3 from datawindow within w_ocshipdemand_r
end type
type gb_4 from groupbox within w_ocshipdemand_r
end type
type rb_6 from radiobutton within w_ocshipdemand_r
end type
type rb_7 from radiobutton within w_ocshipdemand_r
end type
type st_1 from statictext within w_ocshipdemand_r
end type
type ddlb_2 from dropdownlistbox within w_ocshipdemand_r
end type
type st_3 from statictext within w_ocshipdemand_r
end type
type cb_1 from commandbutton within w_ocshipdemand_r
end type
type st_4 from statictext within w_ocshipdemand_r
end type
type pb_1 from picturebutton within w_ocshipdemand_r
end type
type cbx_1 from checkbox within w_ocshipdemand_r
end type
type st_2 from statictext within w_ocshipdemand_r
end type
type st_5 from statictext within w_ocshipdemand_r
end type
end forward

global type w_ocshipdemand_r from w_inheritance
integer width = 4649
integer height = 2916
string title = "운반비청구 내역조회(w_ocshipdemand_r)"
em_1 em_1
em_2 em_2
dw_area dw_area
ddlb_1 ddlb_1
rb_4 rb_4
rb_5 rb_5
rb_3 rb_3
dw_3 dw_3
gb_4 gb_4
rb_6 rb_6
rb_7 rb_7
st_1 st_1
ddlb_2 ddlb_2
st_3 st_3
cb_1 cb_1
st_4 st_4
pb_1 pb_1
cbx_1 cbx_1
st_2 st_2
st_5 st_5
end type
global w_ocshipdemand_r w_ocshipdemand_r

type variables
st_print i_print
int    ii_sel = 1
string is_con ="O", is_car = ''
datawindowchild idwc_area

end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();string ls_filter

CHOOSE CASE ii_sel
	CASE 1
		if rb_4.checked = true then
			ls_filter = 'do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'do_ship_flag = "B"'
		elseif rb_6.checked = true then
			ls_filter = 'do_ship_flag = "A"'
		elseif rb_7.checked = true then
			ls_filter = 'do_ship_flag = "R"'
		else
			ls_filter = ''
		end if
	CASE 2
		if rb_4.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "B"'
		elseif rb_6.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "A"'
		elseif rb_7.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "R"'
		else
			ls_filter = 'ship_amount <> 0'
		end if
	CASE 3
		if rb_4.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "B"'
		elseif rb_6.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "A"'
		elseif rb_7.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "R"'
		else
			ls_filter = 'ship_amount = 0'
		end if
END CHOOSE
if trim(is_car) <> '' then
	if ls_filter <> '' then
		ls_filter = ls_filter + ' and do_driver = "' + is_car + '"'
	else
		ls_filter = 'do_driver = "' + is_car + '"'
	end if
end if
dw_2.setredraw(false)
dw_1.setfilter(ls_filter)
dw_1.filter()
dw_2.setfilter(ls_filter)
dw_2.filter()
dw_1.groupcalc()
dw_2.groupcalc()
dw_2.setredraw(true)


end subroutine

on w_ocshipdemand_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.ddlb_1=create ddlb_1
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_3=create rb_3
this.dw_3=create dw_3
this.gb_4=create gb_4
this.rb_6=create rb_6
this.rb_7=create rb_7
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.st_3=create st_3
this.cb_1=create cb_1
this.st_4=create st_4
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.ddlb_1
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.rb_5
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.gb_4
this.Control[iCurrent+10]=this.rb_6
this.Control[iCurrent+11]=this.rb_7
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.ddlb_2
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.cbx_1
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.st_5
end on

on w_ocshipdemand_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.ddlb_1)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.gb_4)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
dw_area.settransobject(sqlca)
dw_area.insertrow(1)
dw_area.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
idwc_area.accepttext()

dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.visible = false
if day(today()) > 10 then
	em_1.text = string(wf_today(), 'yyyy/mm/01')
	em_2.text = string(wf_today(), 'yyyy/mm/dd')
else
	em_1.text = string(RelativeDate(today(), - day(today()) ),'yyyy/mm/01')
	em_2.text = string(RelativeDate(today(), - day(today()) ),'yyyy/mm/dd')
end if

ddlb_1.text = "운반비 0인것 제외"
ddlb_2.text = "운전자+운송방법+거래처명+출고번호"
ii_sel = 2

datawindowchild ldwc_car
dw_3.insertrow(0)
dw_3.getchild('driver',ldwc_car)
ldwc_car.insertrow(1)
ldwc_car.setitem(1,'driver',' ')
ldwc_car.setitem(1,'name','전  체')
ldwc_car.accepttext()
ldwc_car.scrolltorow(1)

end event

event resize;call super::resize;dw_2.width  = this.width  - 114
dw_2.height = this.height - 528

end event

type pb_save from w_inheritance`pb_save within w_ocshipdemand_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3191
integer y = 40
integer taborder = 50
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocshipdemand_r
integer x = 1285
integer y = 4
integer width = 91
integer height = 76
integer taborder = 10
string dataobject = "d_ocshipclose_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_ocshipdemand_r
integer x = 32
integer y = 380
integer width = 4535
integer height = 2388
integer taborder = 30
string dataobject = "d_ocshipdemand_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rbuttondown;call super::rbuttondown;//
if row < 1 then return

this.scrolltorow(row)
m_dynamic lm_Addmenu
string ls_chk, ls_text, ls_value
int    li_end, li_find, li_int

DESTROY m_dynamic

choose case dwo.name
	case "do_do_no"
		lm_Addmenu = CREATE m_dynamic
		ls_text    = trim(this.object.do_do_no[row])
		if ls_text = '' or isnull(ls_text) then return
		
		ls_chk  = 'Y'
		li_find = 1
		li_int  = 0
//		Do While ls_chk = 'Y'
//			li_end = pos(ls_text, ",", li_find)
//			if li_end = 0 or isnull(li_end) then exit
//			
			ls_value = ls_text
			if trim(ls_value) = '' or isnull(ls_value) or (LenA(trim(ls_value)) <> 14) then
			else			
				li_int = li_int + 1
				lm_Addmenu.item[li_int].Text = ls_value
				lm_Addmenu.item[li_int].Tag = string(li_int)
				lm_Addmenu.item[li_int].visible = true
			end if
//		Loop
		
		lm_Addmenu.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())
		if lm_Addmenu.tag = "" then return
		
		ls_value = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
		OpenSheet(w_oidoupdate_m,  w_o_main, 5, original!)	//	Normal!
		w_oidoupdate_m.setredraw(false)
		w_oidoupdate_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oidoupdate_m.cb_1.postevent(clicked!)				// 조회
		w_oidoupdate_m.setredraw(true)

	case else
		lm_Addmenu = CREATE m_dynamic
		ls_text    = trim(this.object.sale_no[row])
		if ls_text = '' or isnull(ls_text) then return
		
		ls_chk  = 'Y'
		li_find = 1
		li_int  = 0
		Do While ls_chk = 'Y'	// 다중 수주번호 메뉴에 등록하기
			li_end = PosA(ls_text, ",", li_find)
			if li_end = 0 or isnull(li_end) then exit
			
			ls_value = MidA(ls_text, li_find, 14)
			if trim(ls_value) = '' or isnull(ls_value) then exit
			
			li_int = li_int + 1
			lm_Addmenu.item[li_int].Text = ls_value
			lm_Addmenu.item[li_int].Tag = string(li_int)
			lm_Addmenu.item[li_int].visible = true
			li_find = li_end + 2
		Loop
		
		lm_Addmenu.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())
		if lm_Addmenu.tag = "" then return
		
		ls_value = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
		OpenSheet(w_orsale_m,  w_o_main, 5, original!)
		w_orsale_m.setredraw(false)
		w_orsale_m.em_3.text = LeftA(ls_value,10) 
		w_orsale_m.em_4.text = string(integer(RightA(ls_value,3)))
		w_orsale_m.pb_cancel.postevent(clicked!)
		w_orsale_m.setredraw(true)
end choose



//m_manager.m_dynamic.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
//ls_sale = m_manager.m_dynamic.tag
//m_dynamic  lm_Addmenu
//// 메뉴추가시작
//lm_Addmenu = Create m_dynamic
//lm_Addmenu.item[1].Text = '메뉴명'
//lm_Addmenu.item[1].Tag =  '태그내용 또는 window id'
//
//// ll_level1, ll_level2는 사용가능 메뉴의 구성에 따라 적당하게 조정하셔야 합니다.         
//m_main.Item[ll_level1].Item[ll_level2] = lm_Addmenu.Item[1]
// 메뉴추가끝 - 메뉴추가시작 부분 반복 -> 사용가능한 메뉴항목까지 반복
//m_manager NewMenu
//
//NewMenu = CREATE m_manager
//m_manager.m_mpmodify.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
//CHOOSE CASE m_manager.m_mpmodify.tag
//	CASE 'rout_D', 'rout_U'
//		gs_where istr_where
		
//		istr_where.str1 = ls_sale
//		istr_where.str2 = trim(string(this.object.seq_no[row],"###"))
//		istr_where.str3 = trim(this.object.assy_item[row])
//		istr_where.str4 = trim(this.object.groupitem_item_name[row])
//		istr_where.str5 = trim(this.object.assy_qa[row])
//		istr_where.name = trim(this.object.customer_cust_name[row])
//		
//		openwithparm(w_mpjaegoc_m, istr_where)
//
//		istr_where = message.powerobjectparm
//		if istr_where.chk = "N" then
//			return
//		end if
//		ls_wc = dw6.object.wc_no[row]
//		li_seq = dw6.object.seq_no[row]
//		ll_operation = dw6.object.operation[row]
//		ll_division = dw6.object.division[row]
//END CHOOSE

end event

event dw_2::doubleclicked;call super::doubleclicked;
if row < 1 then return
this.scrolltorow(row)

gs_where2 lst_str 
string ls_text, ls_chk, ls_sale
int li_find, li_int,li_end

ls_text = trim(this.object.sale_no[row])
if ls_text = '' or isnull(ls_text) then return
ls_chk = 'Y'
li_find = 1
li_int = 0
do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 or isnull(li_end) then exit
	ls_sale = MidA(ls_text, li_find, 14)
	if trim(ls_sale) = '' or isnull(ls_sale) then exit
	li_int = li_int + 1
	lst_str.str1[li_int] = ls_sale
	li_find = li_end + 2
loop

OpenWithParm(w_whsaleall_w, lst_str)

end event

type st_title from w_inheritance`st_title within w_ocshipdemand_r
integer x = 50
integer y = 32
integer width = 1330
string text = "운반비청구 내역조회"
end type

type st_tips from w_inheritance`st_tips within w_ocshipdemand_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipdemand_r
boolean visible = false
integer x = 1659
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipdemand_r
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 40
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

type pb_close from w_inheritance`pb_close within w_ocshipdemand_r
integer x = 4352
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipdemand_r
integer x = 4160
integer y = 56
integer taborder = 140
end type

event pb_print::clicked;//
w_repsuper w_print
st_print l_print
string	ls_prtflag, ls_sdate, ls_edate

if em_1.text = '' then
	messagebox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_2.text = '' then
	messagebox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_1.text > em_2.text then
	messagebox("확인","조회기간을 잘못 입력하였습니다!",information!)
	return 1
end if

ls_sdate = em_1.text
ls_edate = em_2.text
is_con   = '%'
//-- 2012-06-25(이재형) : 운반비 청구내역서 출력시 전체인 경우 "구분"항목 제어
//								  운반비청구마감과 출력화면 같이 사용하는 부분이
//								  있어서 병행작업함(w_ocshipclose_m)
if rb_3.checked = true then
	ls_prtflag = '1'
else
	ls_prtflag = '0'
end if

if dw_1.retrieve( LeftA(dw_area.object.area[1],1), ls_sdate, ls_edate, is_con, ls_prtflag ) < 1 then
	messagebox("확인","내역이 없습니다.")
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_desc  = " 이 프로그램은 운반비 청구내역서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipdemand_r
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipdemand_r
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipdemand_r
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 180
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipdemand_r
integer x = 3767
integer y = 56
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_sdate, ls_edate
long ll_row

if em_1.text = '' then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_2.text = '' then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_1.text > em_2.text then
	MessageBox("확인","조회기간을 잘못 입력하였습니다!",information!)
	return 1
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text
is_con   = '%'

ll_row = dw_2.retrieve( LeftA(dw_area.object.area[1],1), ls_sdate, ls_edate, is_con )
if ll_row < 1 then
	MessageBox("확인","내역이 없습니다.")
else
	wf_fil()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ocshipdemand_r
integer x = 2386
integer y = 16
integer width = 1330
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipdemand_r
integer x = 3328
integer y = 232
integer width = 1243
integer height = 128
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipdemand_r
integer x = 3730
integer y = 16
integer width = 837
integer taborder = 60
end type

type em_1 from editmask within w_ocshipdemand_r
integer x = 2944
integer y = 124
integer width = 366
integer height = 76
integer taborder = 130
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ocshipdemand_r
integer x = 3323
integer y = 124
integer width = 366
integer height = 76
integer taborder = 120
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
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_ocshipdemand_r
integer x = 2418
integer y = 124
integer width = 521
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_2.reset()

end event

type ddlb_1 from dropdownlistbox within w_ocshipdemand_r
integer x = 59
integer y = 264
integer width = 686
integer height = 628
integer taborder = 150
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
string item[] = {"전체","운반비 0인것 제외","운반비 0인것만"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_sel = index

wf_fil()
end event

type rb_4 from radiobutton within w_ocshipdemand_r
integer x = 2482
integer y = 268
integer width = 197
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "대여"
end type

event clicked;wf_fil()
end event

type rb_5 from radiobutton within w_ocshipdemand_r
integer x = 2679
integer y = 268
integer width = 197
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부담"
end type

event clicked;wf_fil()
end event

type rb_3 from radiobutton within w_ocshipdemand_r
integer x = 2286
integer y = 268
integer width = 197
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;wf_fil()
end event

type dw_3 from datawindow within w_ocshipdemand_r
integer x = 750
integer y = 264
integer width = 539
integer height = 88
integer taborder = 70
string dataobject = "d_whdocar_s"
boolean border = false
end type

event itemchanged;this.accepttext()
is_car = this.object.driver[1]
wf_fil()
end event

type gb_4 from groupbox within w_ocshipdemand_r
integer x = 32
integer y = 232
integer width = 3282
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_6 from radiobutton within w_ocshipdemand_r
integer x = 2875
integer y = 268
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "공사"
end type

event clicked;wf_fil()
end event

type rb_7 from radiobutton within w_ocshipdemand_r
integer x = 3077
integer y = 268
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "재료"
end type

event clicked;wf_fil()
end event

type st_1 from statictext within w_ocshipdemand_r
integer x = 50
integer y = 192
integer width = 1243
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "*더블클릭=>수주조회, *오른쪽마우스=>수주관리,"
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type ddlb_2 from dropdownlistbox within w_ocshipdemand_r
integer x = 1467
integer y = 264
integer width = 795
integer height = 300
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"운전자+운송방법+거래처명+출고번호","운송일자+운전자+출고번호"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if index = 2 then
	dw_1.dataobject = 'd_ocshipclose_r2'
	dw_2.dataobject = 'd_ocshipdemand_s2'
else
	dw_1.dataobject = 'd_ocshipclose_r'
	dw_2.dataobject = 'd_ocshipdemand_s'
end if
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

wf_fil()


end event

type st_3 from statictext within w_ocshipdemand_r
integer x = 1317
integer y = 284
integer width = 151
integer height = 48
boolean bringtotop = true
integer textsize = -9
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

type cb_1 from commandbutton within w_ocshipdemand_r
integer x = 3904
integer y = 268
integer width = 640
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 수정/삭제"
end type

event clicked;string ls_value
long   ll_row

ll_row   = dw_2.getrow()
ls_value = dw_2.object.do_do_no[ll_row]

if GF_PERMISSION("거래명세서_수정/삭제", gs_userid) = "Y" then	
	if IsValid(w_o_main) then
		OpenSheet(w_oidoupdate_m, w_o_main, 5, original!)
	else
		OpenSheet(w_oidoupdate_m, w_all_main, 5, original!)
	end if
	
	w_oidoupdate_m.setredraw(false)
	w_oidoupdate_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
	w_oidoupdate_m.cb_1.postevent(clicked!)				// 조회
	w_oidoupdate_m.setredraw(true)
else
	if IsValid(w_o_main) then
		OpenSheet(w_oigiprint_m, w_o_main, 5, original!)
	else
		OpenSheet(w_oigiprint_m, w_all_main, 5, original!)
	end if
	
	w_oigiprint_m.setredraw(false)
	w_oigiprint_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
	w_oigiprint_m.pb_compute.postevent(clicked!)				// 조회
	w_oigiprint_m.setredraw(true)
end if

end event

type st_4 from statictext within w_ocshipdemand_r
integer x = 1294
integer y = 192
integer width = 1024
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "출고번호 컬럼 =>거래명세서 수정/삭제"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocshipdemand_r
integer x = 3968
integer y = 56
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
string picturename = "CrossTab!"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_2.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_2.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_2.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type cbx_1 from checkbox within w_ocshipdemand_r
integer x = 3355
integer y = 276
integer width = 503
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
string text = "운송구분 제외"
end type

event clicked;if this.checked = true then
	ddlb_2.text = "운송일자+운전자+출고번호"
	ddlb_2.Event SelectionChanged(2)
	rb_3.checked = true
	rb_3.Event Clicked()
	ddlb_2.enabled = false
	rb_4.enabled = false
	rb_5.enabled = false
	rb_6.enabled = false
	rb_7.enabled = false
else
	ddlb_2.enabled = true
	rb_4.enabled = true
	rb_5.enabled = true
	rb_6.enabled = true
	rb_7.enabled = true
end if

	
end event

type st_2 from statictext within w_ocshipdemand_r
integer x = 2418
integer y = 48
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ocshipdemand_r
integer x = 2944
integer y = 48
integer width = 745
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
string text = "운송일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

