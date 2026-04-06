$PBExportHeader$w_oryspsale2_r.srw
$PBExportComments$YSP 일자별 수주현황 (2004/04/02, 정갑용)
forward
global type w_oryspsale2_r from w_inheritance
end type
type em_1 from editmask within w_oryspsale2_r
end type
type em_2 from editmask within w_oryspsale2_r
end type
type st_3 from statictext within w_oryspsale2_r
end type
type st_2 from statictext within w_oryspsale2_r
end type
type ddlb_1 from dropdownlistbox within w_oryspsale2_r
end type
type dw_6 from datawindow within w_oryspsale2_r
end type
type ddlb_2 from dropdownlistbox within w_oryspsale2_r
end type
type dw_3 from datawindow within w_oryspsale2_r
end type
type ddlb_3 from dropdownlistbox within w_oryspsale2_r
end type
type cbx_1 from checkbox within w_oryspsale2_r
end type
type st_1 from statictext within w_oryspsale2_r
end type
end forward

global type w_oryspsale2_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "YSP 일자별 수주현황(w_oryspsale2_r)"
em_1 em_1
em_2 em_2
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_6 dw_6
ddlb_2 ddlb_2
dw_3 dw_3
ddlb_3 ddlb_3
cbx_1 cbx_1
st_1 st_1
end type
global w_oryspsale2_r w_oryspsale2_r

type variables
string is_sale_flag, is_sflag, is_sel, is_cust, is_ret
datawindowchild idwc_area
end variables

on w_oryspsale2_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.dw_6=create dw_6
this.ddlb_2=create ddlb_2
this.dw_3=create dw_3
this.ddlb_3=create ddlb_3
this.cbx_1=create cbx_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.dw_6
this.Control[iCurrent+7]=this.ddlb_2
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.ddlb_3
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.st_1
end on

on w_oryspsale2_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.dw_6)
destroy(this.ddlb_2)
destroy(this.dw_3)
destroy(this.ddlb_3)
destroy(this.cbx_1)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// 김승대 : 1024john
// 김동숙 : sjsd28
// 최은영 : cey9573 김동숙 퇴사로 인수인계 2006/06/29
// 권열열 : 20051002 최은영 퇴사로 인수인계 2006/02/10
string ls_chk
select isnull(sale_price,'N') into :ls_chk from login
 where user_id = :gs_userid; 
if ls_chk = 'Y' or gs_userid = '1024john' or gs_userid = 'sjsd28' or gs_userid = 'cey9573' or &
   gs_userid = '20051002' or gs_userid = 'leejs' Then 
	is_ret = '%'
else
	is_ret = gs_userid
end if
em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_2.visible = false
dw_1.sharedata(dw_2)

dw_6.settransobject(sqlca)
dw_6.insertrow(0)  

dw_6.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
//dw_6.object.area[1] = gs_area
dw_6.object.area[1] = 'B0001' // YSP 사업장으로 고정

ddlb_1.text = "전체"
ddlb_2.text = "전체"
ddlb_3.text = "전체"
is_sale_flag = 'A'
is_sflag = "%"
is_sel = 'A'
end event

event resize;call super::resize;dw_1.width  = this.width - 120
dw_1.height = this.height - 350


end event

type pb_save from w_inheritance`pb_save within w_oryspsale2_r
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oryspsale2_r
integer x = 18
integer y = 236
integer width = 3561
integer height = 1820
integer taborder = 0
string dataobject = "d_oryspsale2_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oryspsale2_r
integer x = 1125
integer y = 0
integer width = 78
integer height = 92
integer taborder = 0
boolean enabled = false
string dataobject = "d_oryspsale2_r"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oryspsale2_r
integer x = 32
integer y = 48
integer width = 1152
string text = "YSP 일자별 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_oryspsale2_r
end type

type pb_compute from w_inheritance`pb_compute within w_oryspsale2_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_oryspsale2_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_oryspsale2_r
integer x = 3365
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oryspsale2_r
integer x = 3173
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string  ls_text
long ll_row

if dw_2.rowcount() < 1 then
	return
else
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_text[ll_row] = ls_text
	next
end if

if is_sel = 'A' then
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',전체)'
elseif is_sel = 'Y' then
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',확정)'
else
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',미확정)'
end if
//l_print.name = 'd_orsaledayrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 YSP 일자별 수주현황 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=84'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oryspsale2_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oryspsale2_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oryspsale2_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oryspsale2_r
integer x = 2981
integer taborder = 50
end type

event pb_retrieve::clicked;date   ld_start, ld_end
string ls_sale_flag[], ls_confirm_flag[]
string ls_area

dw_1.reset()
if em_1.text = '' then
	messagebox("확인","주문기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","주문기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","주문기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end = date(em_2.text)

if is_sale_flag = 'A' then
	ls_sale_flag[1] = 'D'
	ls_sale_flag[2] = 'L'
	ls_sale_flag[3] = 'E'
else
	ls_sale_flag[1] = is_sale_flag
end if

if is_sel = 'A' then
	ls_confirm_flag[1] = 'Y'
	ls_confirm_flag[2] = 'N'
elseif is_sel = 'Y' then
	ls_confirm_flag[1] = 'Y'
else
	ls_confirm_flag[1] = 'N'
end if
if cbx_1.checked = true then
	is_cust = "%"
else
	is_cust = dw_3.object.cust_no[1]
end if
ls_area = trim(LeftA(dw_6.object.area[1],1)) + "%"

dw_1.retrieve(ls_sale_flag[], ld_start, ld_end, ls_confirm_flag[], ls_area, is_sflag, is_cust, is_ret)
end event

type gb_3 from w_inheritance`gb_3 within w_oryspsale2_r
integer x = 1216
integer y = 0
integer width = 1728
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oryspsale2_r
boolean visible = false
integer x = 23
integer y = 224
integer width = 3557
integer height = 1828
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oryspsale2_r
integer x = 2953
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

type em_1 from editmask within w_oryspsale2_r
integer x = 2190
integer y = 40
integer width = 347
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

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oryspsale2_r
integer x = 2574
integer y = 40
integer width = 352
integer height = 80
integer taborder = 30
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

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_oryspsale2_r
integer x = 2537
integer y = 44
integer width = 41
integer height = 72
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oryspsale2_r
integer x = 1230
integer y = 56
integer width = 256
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "수주유형"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_oryspsale2_r
integer x = 1490
integer y = 40
integer width = 233
integer height = 384
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","내수","L/C","수출"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index 
	case 1
		is_sale_flag = 'A'
	case 2
		is_sale_flag = 'D'
	case 3
		is_sale_flag = 'L'
	case 4
		is_sale_flag = 'E'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_6 from datawindow within w_oryspsale2_r
boolean visible = false
integer x = 1367
integer y = 128
integer width = 489
integer height = 88
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type ddlb_2 from dropdownlistbox within w_oryspsale2_r
integer x = 1952
integer y = 40
integer width = 233
integer height = 592
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
string item[] = {"전체","대여","부담","착불","시화방문","화곡방문","반월방문"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_sflag = "%"
	CASE 2
		is_sflag = "D"
	CASE 3
		is_sflag = "B"
	CASE 4
		is_sflag = "C"
	CASE 5
		is_sflag = "M"
	CASE 6
		is_sflag = "H"
	CASE 7
		is_sflag = "Y"
END CHOOSE

end event

type dw_3 from datawindow within w_oryspsale2_r
integer x = 1490
integer y = 124
integer width = 878
integer height = 88
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
cbx_1.checked = false
end event

event editchanged;cbx_1.checked = false
end event

event itemchanged;cbx_1.checked = false
end event

type ddlb_3 from dropdownlistbox within w_oryspsale2_r
integer x = 1723
integer y = 40
integer width = 233
integer height = 384
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","확정","미확정"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
choose case index
	case 1
		is_sel = 'A'
	case 2
		is_sel = 'Y'
	case 3
		is_sel = 'N'
end choose

end event

type cbx_1 from checkbox within w_oryspsale2_r
integer x = 2528
integer y = 132
integer width = 398
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
string text = "전체 거래처"
boolean checked = true
boolean lefttext = true
end type

type st_1 from statictext within w_oryspsale2_r
integer x = 1234
integer y = 140
integer width = 256
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "거 래 처"
boolean focusrectangle = false
end type

