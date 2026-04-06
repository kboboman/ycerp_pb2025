$PBExportHeader$w_ocshipburden_r.srw
$PBExportComments$운반비부담내역조회(2002/08/28,이인호)
forward
global type w_ocshipburden_r from w_inheritance
end type
type em_1 from editmask within w_ocshipburden_r
end type
type em_2 from editmask within w_ocshipburden_r
end type
type dw_area from datawindow within w_ocshipburden_r
end type
type dw_4 from datawindow within w_ocshipburden_r
end type
type cbx_1 from checkbox within w_ocshipburden_r
end type
type ddlb_1 from dropdownlistbox within w_ocshipburden_r
end type
type st_1 from statictext within w_ocshipburden_r
end type
type st_3 from statictext within w_ocshipburden_r
end type
type st_4 from statictext within w_ocshipburden_r
end type
type st_5 from statictext within w_ocshipburden_r
end type
type pb_1 from picturebutton within w_ocshipburden_r
end type
type st_2 from statictext within w_ocshipburden_r
end type
type st_6 from statictext within w_ocshipburden_r
end type
type gb_4 from groupbox within w_ocshipburden_r
end type
type dw_3 from datawindow within w_ocshipburden_r
end type
type st_7 from statictext within w_ocshipburden_r
end type
type ddlb_fld from dropdownlistbox within w_ocshipburden_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ocshipburden_r
end type
type st_8 from statictext within w_ocshipburden_r
end type
type sle_value from singlelineedit within w_ocshipburden_r
end type
type cb_2 from commandbutton within w_ocshipburden_r
end type
type cb_3 from commandbutton within w_ocshipburden_r
end type
type cb_4 from commandbutton within w_ocshipburden_r
end type
type cb_5 from commandbutton within w_ocshipburden_r
end type
type ddlb_op from dropdownlistbox within w_ocshipburden_r
end type
end forward

global type w_ocshipburden_r from w_inheritance
integer width = 4101
integer height = 2100
string title = "운반비 부담내역조회(w_ocshipburden_r)"
boolean resizable = false
em_1 em_1
em_2 em_2
dw_area dw_area
dw_4 dw_4
cbx_1 cbx_1
ddlb_1 ddlb_1
st_1 st_1
st_3 st_3
st_4 st_4
st_5 st_5
pb_1 pb_1
st_2 st_2
st_6 st_6
gb_4 gb_4
dw_3 dw_3
st_7 st_7
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_8 st_8
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_ocshipburden_r w_ocshipburden_r

type variables
st_print i_print
string is_amt = "2"
string is_con = "O"
datawindowchild idwc_area, idwc_cust

end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();//string ls_fil
//
//dw_3.accepttext()
//dw_4.accepttext()
//CHOOSE CASE ii_sel
//	CASE 1
//		if cbx_1.checked = true then
//			ls_fil = ''
//		else
//			ls_fil = 'do_cust_no = "' + is_cust + '"'
//		end if
//	CASE 2
//		if cbx_1.checked = true then
//			ls_fil = 'ship_amount <> 0'
//		else
//			ls_fil = 'ship_amount <> 0 and do_cust_no = "' + is_cust + '"'
//		end if
//	CASE 3
//		if cbx_1.checked = true then
//			ls_fil = 'ship_amount = 0'
//		else
//			ls_fil = 'ship_amount = 0 and do_cust_no = "' + is_cust + '"'
//		end if
//END CHOOSE
//if trim(is_car) <> '' then
//	if ls_fil <> '' then
//		ls_fil = ls_fil + ' and do_driver = "' + is_car + '"'
//	else
//		ls_fil = 'do_driver = "' + is_car + '"'
//	end if
//end if
//dw_1.setfilter(ls_fil)
//dw_1.filter()
//dw_2.setfilter(ls_fil)
//dw_2.filter()
//dw_1.groupcalc()
//dw_2.groupcalc()
//
end subroutine

on w_ocshipburden_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.pb_1=create pb_1
this.st_2=create st_2
this.st_6=create st_6
this.gb_4=create gb_4
this.dw_3=create dw_3
this.st_7=create st_7
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_8=create st_8
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.gb_4
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.ddlb_fld
this.Control[iCurrent+18]=this.ddlb_dwtitles
this.Control[iCurrent+19]=this.st_8
this.Control[iCurrent+20]=this.sle_value
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.cb_4
this.Control[iCurrent+24]=this.cb_5
this.Control[iCurrent+25]=this.ddlb_op
end on

on w_ocshipburden_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_6)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.st_7)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_8)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

datawindowchild ldwc_car

dw_3.SetTransObject(SQLCA)

debugbreak()

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')

dw_area.object.area[1] = gs_area
dw_area.accepttext()

// 거래처
dw_4.SetTransObject(SQLCA)
dw_4.getchild('cust_no',idwc_cust)
idwc_cust.settransobject(sqlca)
if GF_PERMISSION("운반비부담내역조회_전체", gs_userid) = "Y" then
	idwc_cust.retrieve('%')	
else
	idwc_cust.retrieve(gs_userid)
end if 	
idwc_cust.insertrow(1)
idwc_cust.setitem(1,'cust_no','%')
idwc_cust.setitem(1,'cust_name','전체거래처')

dw_4.insertrow(1)  
dw_4.object.cust_no[1] = "%"
dw_4.accepttext()
//dw_4.object.cust_no.background.color = 78682240

// 운전자
dw_3.insertrow(1)  
dw_3.getchild('driver',ldwc_car)
ldwc_car.insertrow(1)
ldwc_car.setitem(1,'driver','')
ldwc_car.setitem(1,'name','전체')
ldwc_car.accepttext()
dw_3.object.driver[1] = ' '

//
ddlb_1.text = "운반비 0인것 제외"

em_1.text = string(wf_today(), 'yyyy/mm/01')
em_2.text = string(wf_today(), 'yyyy/mm/dd')

dw_1.visible = false
dw_2.sharedata(dw_1)


end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_2.width  = newwidth  - (gb_4.x * 2)
dw_2.height = newheight - dw_2.y - gb_4.x


end event

type pb_save from w_inheritance`pb_save within w_ocshipburden_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3191
integer y = 40
integer taborder = 50
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocshipburden_r
integer x = 32
integer y = 172
integer width = 82
integer height = 60
integer taborder = 10
string dataobject = "d_ocshipburden_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ocshipburden_r
integer y = 24
integer width = 1294
integer height = 128
string text = "운반비 부담내역조회"
end type

type st_tips from w_inheritance`st_tips within w_ocshipburden_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipburden_r
boolean visible = false
integer x = 1659
integer taborder = 70
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipburden_r
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

type pb_close from w_inheritance`pb_close within w_ocshipburden_r
integer x = 4046
integer y = 68
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipburden_r
integer x = 3854
integer y = 68
integer taborder = 140
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_desc  = " 이 프로그램은 운반비 부담내역서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipburden_r
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipburden_r
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipburden_r
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 170
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipburden_r
integer x = 3465
integer y = 68
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_area, ls_sdate, ls_edate, ls_custno, ls_drv
long   ll_row

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

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text
is_con   = '%'

// 거래처
dw_4.accepttext()
ls_custno = dw_4.object.cust_no[1]

dw_area.accepttext()
ls_area = LeftA(dw_area.object.area[1],1)

dw_3.accepttext()
ls_drv  = trim(dw_3.object.driver[1]) + '%'

dw_2.setredraw(false)
dw_2.retrieve( ls_area, ls_sdate, ls_edate, is_con, ls_custno, ls_drv, is_amt )
dw_2.setredraw(true)

if dw_2.rowcount() < 1 then messagebox("확인","내역이 없습니다.")


end event

type gb_3 from w_inheritance`gb_3 within w_ocshipburden_r
integer x = 1367
integer y = 16
integer width = 933
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipburden_r
integer x = 2318
integer y = 16
integer width = 1102
integer height = 216
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipburden_r
integer x = 3438
integer y = 16
integer width = 823
integer height = 216
integer taborder = 60
integer textsize = -9
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocshipburden_r
integer x = 32
integer y = 420
integer width = 4014
integer height = 1564
integer taborder = 30
string dataobject = "d_ocshipburden_s"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::rbuttondown;call super::rbuttondown;if row < 1 then return
this.scrolltorow(row)
m_dynamic lm_Addmenu
string ls_chk, ls_text, ls_sale
int li_end, li_find, li_int

lm_Addmenu = CREATE m_dynamic
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
	lm_Addmenu.item[li_int].Text = ls_sale
	lm_Addmenu.item[li_int].Tag = string(li_int)
	lm_Addmenu.item[li_int].visible = true
	li_find = li_end + 2
loop

lm_Addmenu.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
if lm_Addmenu.tag = "" then return
ls_sale = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
opensheet(w_orsale_m,  w_o_main, 5, original!)
w_orsale_m.setredraw(false)
w_orsale_m.em_3.text = LeftA(ls_sale,10) 
w_orsale_m.em_4.text = string(integer(RightA(ls_sale,3)))
w_orsale_m.pb_cancel.postevent(clicked!)
w_orsale_m.setredraw(true)


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

ls_chk  = 'Y'
li_find = 1
li_int  = 0
do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 or isnull(li_end) then exit
	
	ls_sale = MidA(ls_text, li_find, 14)
	if trim(ls_sale) = '' or isnull(ls_sale) then exit
	
	li_int = li_int + 1
	lst_str.str1[li_int] = ls_sale
	lst_str.str2[li_int] = "1"
	li_find = li_end + 2
loop

OpenWithParm(w_whsaleall_w, lst_str)
 
end event

event dw_2::clicked;call super::clicked;//
if row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_1 from editmask within w_ocshipburden_r
integer x = 2656
integer y = 56
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
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ocshipburden_r
integer x = 3026
integer y = 56
integer width = 366
integer height = 76
integer taborder = 100
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

type dw_area from datawindow within w_ocshipburden_r
integer x = 1669
integer y = 52
integer width = 535
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_2.reset()

end event

event losefocus;this.accepttext()

end event

type dw_4 from datawindow within w_ocshipburden_r
integer x = 1669
integer y = 132
integer width = 622
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_ocshipburden_r
integer x = 1024
integer y = 176
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
if this.checked = true then
	dw_4.enabled = false
	dw_4.object.cust_no.background.color = 78682240
else
	dw_4.enabled = true
	dw_4.object.cust_no.background.color = 1087434968
end if

end event

type ddlb_1 from dropdownlistbox within w_ocshipburden_r
integer x = 2734
integer y = 296
integer width = 686
integer height = 628
integer taborder = 120
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

event selectionchanged;//
is_amt = string(index)

end event

type st_1 from statictext within w_ocshipburden_r
integer x = 1390
integer y = 140
integer width = 274
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ocshipburden_r
integer x = 2341
integer y = 140
integer width = 306
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
boolean enabled = false
string text = "운전자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ocshipburden_r
integer x = 3451
integer y = 292
integer width = 571
integer height = 104
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "*더블클릭=수주조회, *우측마우스=수주관리"
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type st_5 from statictext within w_ocshipburden_r
integer x = 2341
integer y = 56
integer width = 306
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "조회일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocshipburden_r
event mousemove pbm_mousemove
integer x = 3657
integer y = 68
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_2

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_2 from statictext within w_ocshipburden_r
integer x = 2487
integer y = 316
integer width = 238
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
string text = "운반비:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_ocshipburden_r
integer x = 1390
integer y = 56
integer width = 274
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_ocshipburden_r
integer x = 32
integer y = 240
integer width = 4014
integer height = 168
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_3 from datawindow within w_ocshipburden_r
integer x = 2656
integer y = 136
integer width = 530
integer height = 84
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_whdocar_s"
boolean border = false
end type

type st_7 from statictext within w_ocshipburden_r
integer x = 87
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_ocshipburden_r
integer x = 274
integer y = 292
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ocshipburden_r
integer x = 306
integer y = 304
integer width = 311
integer height = 88
integer taborder = 120
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

type st_8 from statictext within w_ocshipburden_r
integer x = 745
integer y = 308
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

type sle_value from singlelineedit within w_ocshipburden_r
integer x = 1234
integer y = 300
integer width = 567
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_ocshipburden_r
integer x = 1806
integer y = 300
integer width = 160
integer height = 76
integer taborder = 190
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

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_3 from commandbutton within w_ocshipburden_r
integer x = 1970
integer y = 300
integer width = 160
integer height = 76
integer taborder = 200
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

arg_dw  = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_ocshipburden_r
integer x = 2135
integer y = 300
integer width = 160
integer height = 76
integer taborder = 210
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

arg_dw  = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ocshipburden_r
integer x = 2299
integer y = 300
integer width = 160
integer height = 76
integer taborder = 220
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

arg_dw  = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_ocshipburden_r
integer x = 919
integer y = 292
integer width = 302
integer height = 500
integer taborder = 120
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

