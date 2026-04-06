$PBExportHeader$w_ocshipclose_m.srw
$PBExportComments$운반비마감관리(2002/08/28,이인호)
forward
global type w_ocshipclose_m from w_inheritance
end type
type rb_1 from radiobutton within w_ocshipclose_m
end type
type rb_2 from radiobutton within w_ocshipclose_m
end type
type em_1 from editmask within w_ocshipclose_m
end type
type em_2 from editmask within w_ocshipclose_m
end type
type st_2 from statictext within w_ocshipclose_m
end type
type dw_area from datawindow within w_ocshipclose_m
end type
type st_3 from statictext within w_ocshipclose_m
end type
type cbx_1 from checkbox within w_ocshipclose_m
end type
type ddlb_1 from dropdownlistbox within w_ocshipclose_m
end type
type gb_4 from groupbox within w_ocshipclose_m
end type
type rb_3 from radiobutton within w_ocshipclose_m
end type
type rb_4 from radiobutton within w_ocshipclose_m
end type
type rb_5 from radiobutton within w_ocshipclose_m
end type
type rb_6 from radiobutton within w_ocshipclose_m
end type
type rb_7 from radiobutton within w_ocshipclose_m
end type
type rb_8 from radiobutton within w_ocshipclose_m
end type
type pb_1 from picturebutton within w_ocshipclose_m
end type
end forward

global type w_ocshipclose_m from w_inheritance
integer width = 3712
integer height = 2500
string title = "운반비 마감관리(w_ocshipclose_m)"
rb_1 rb_1
rb_2 rb_2
em_1 em_1
em_2 em_2
st_2 st_2
dw_area dw_area
st_3 st_3
cbx_1 cbx_1
ddlb_1 ddlb_1
gb_4 gb_4
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
pb_1 pb_1
end type
global w_ocshipclose_m w_ocshipclose_m

type variables
datawindowchild idwc_area

st_print i_print
int    ii_sel = 1
string is_con = "O"

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
		elseif rb_8.checked = true then
			ls_filter = 'do_ship_flag = "A"'
		else
			ls_filter = ''
		end if
	CASE 2
		if rb_4.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "B"'
		elseif rb_8.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "A"'
		else
			ls_filter = 'ship_amount <> 0'
		end if
	CASE 3
		if rb_4.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "B"'
		elseif rb_8.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "A"'
		else
			ls_filter = 'ship_amount = 0'
		end if
END CHOOSE
dw_2.setredraw(false)
dw_1.setfilter(ls_filter)
dw_1.filter()
dw_2.setfilter(ls_filter)
dw_2.filter()
dw_1.groupcalc()
dw_2.groupcalc()
dw_2.setredraw(true)


end subroutine

on w_ocshipclose_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_area=create dw_area
this.st_3=create st_3
this.cbx_1=create cbx_1
this.ddlb_1=create ddlb_1
this.gb_4=create gb_4
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.ddlb_1
this.Control[iCurrent+10]=this.gb_4
this.Control[iCurrent+11]=this.rb_3
this.Control[iCurrent+12]=this.rb_4
this.Control[iCurrent+13]=this.rb_5
this.Control[iCurrent+14]=this.rb_6
this.Control[iCurrent+15]=this.rb_7
this.Control[iCurrent+16]=this.rb_8
this.Control[iCurrent+17]=this.pb_1
end on

on w_ocshipclose_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.ddlb_1)
destroy(this.gb_4)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no',   "")
idwc_area.setitem(1, 'area_name', "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)


pb_save.enabled = false
if GF_PERMISSION("운반비_마감관리", gs_userid) = 'Y' then
	pb_save.enabled = true
end if

dw_1.visible = false
em_1.text    = string(wf_today(), 'yyyy/mm/01')
em_2.text    = string(wf_today(), 'yyyy/mm/dd')
ddlb_1.text  = "전체"

ii_sel       = 1
dw_2.sharedata(dw_1)

end event

event resize;call super::resize;//
dw_2.width  = newwidth  - 96
dw_2.height = newheight - 444

end event

type pb_save from w_inheritance`pb_save within w_ocshipclose_m
event ue_print pbm_custom01
integer x = 3214
integer y = 60
integer taborder = 50
end type

event pb_save::clicked;//
date   ldt_today
string ls_dono, ls_flag, ls_cust
long   ll_row
dec    ld_amt

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if wf_update1( dw_2, 'Y') = true then
end if

end event

type dw_1 from w_inheritance`dw_1 within w_ocshipclose_m
integer x = 1330
integer y = 80
integer width = 91
integer height = 84
integer taborder = 10
string dataobject = "d_ocshipclose_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_ocshipclose_m
string tag = "d_ocshipclose_m2"
integer x = 46
integer y = 404
integer width = 3579
integer height = 1952
integer taborder = 30
string title = "d_ocshipclose_m"
string dataobject = "d_ocshipclose_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;string ls_ship

this.accepttext()
CHOOSE CASE dwo.name
	CASE 'ship_close'
			this.object.close_user[row] = gs_userid
	CASE 'ship_amount'
		if rb_6.checked = true then
			ls_ship = this.object.do_ship_flag[row]
			if ls_ship = 'D' and this.object.do_shipamt_case[row] <> 'C' then
				this.object.do_cash[row] = this.GetItemNumber(row, "do_do_cash", Primary!, TRUE) &
													 + this.object.ship_amount[row]
				this.object.do_rate[row] = this.GetItemNumber(row, "do_do_rate", Primary!, TRUE) &
													 + truncate(this.object.ship_amount[row] / 10 + 0.0000001, 0)
				this.object.do_total[row] = this.object.do_rate[row] + this.object.do_cash[row]
			end if
		end if
END CHOOSE


end event

event dw_2::losefocus;this.accepttext()
end event

type st_title from w_inheritance`st_title within w_ocshipclose_m
integer x = 46
integer y = 44
integer width = 1225
integer height = 136
string text = "운반비 마감관리"
end type

type st_tips from w_inheritance`st_tips within w_ocshipclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipclose_m
boolean visible = false
integer x = 1659
integer taborder = 70
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipclose_m
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

type pb_close from w_inheritance`pb_close within w_ocshipclose_m
integer x = 3410
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipclose_m
integer x = 3022
integer y = 60
integer taborder = 120
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
//-- 2012-06-25(이재형) : 운반비청구조회와 출력화면 같이 사용하는 부분이
//								  있어서 반영함(고정값 적용)-(w_ocshipdemand_r-"구분"항목 제어)
//								  현재 출력물에는 반영분 없음-고정값만 던짐(마감기능이어서 출력은 안함)
ls_prtflag = '0'

if dw_1.retrieve( LeftA(dw_area.object.area[1],1), ls_sdate, ls_edate, 'O', ls_prtflag ) < 1 then
	messagebox("확인","내역이 없습니다.")
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_desc  = " 이 프로그램은 운반비 청구내역서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipclose_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipclose_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipclose_m
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 160
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipclose_m
integer x = 2629
integer y = 60
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_sdate, ls_edate

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

ls_sdate = em_1.text
ls_edate = em_2.text
ls_area  = LeftA(dw_area.object.area[1],1)

if dw_2.retrieve( ls_area, ls_sdate, ls_edate, is_con ) < 1 then
	MessageBox("확인","내역이 없습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ocshipclose_m
integer x = 1641
integer y = 16
integer width = 937
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipclose_m
integer x = 2249
integer y = 240
integer width = 1376
integer height = 136
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipclose_m
integer x = 2592
integer y = 16
integer width = 1033
integer height = 212
integer taborder = 60
integer weight = 400
end type

type rb_1 from radiobutton within w_ocshipclose_m
integer x = 2277
integer y = 284
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "마감"
boolean checked = true
end type

event clicked;dw_2.reset()
is_con = "O"

rb_1.textcolor = rgb(0,0,255)
rb_2.textcolor = rgb(0,0,0)

end event

type rb_2 from radiobutton within w_ocshipclose_m
integer x = 2478
integer y = 284
integer width = 306
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
string text = "마감취소"
end type

event clicked;dw_2.reset()
is_con = "C"
dw_2.object.ship_amount.tabsequence = 0
rb_1.textcolor = rgb(0,0,0)
rb_2.textcolor = rgb(0,0,255)

end event

type em_1 from editmask within w_ocshipclose_m
integer x = 2802
integer y = 280
integer width = 366
integer height = 76
integer taborder = 110
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

type em_2 from editmask within w_ocshipclose_m
integer x = 3232
integer y = 280
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

type st_2 from statictext within w_ocshipclose_m
integer x = 3173
integer y = 276
integer width = 59
integer height = 64
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_ocshipclose_m
integer x = 1687
integer y = 96
integer width = 521
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()
dw_2.reset()

end event

type st_3 from statictext within w_ocshipclose_m
integer x = 855
integer y = 268
integer width = 384
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16711680
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_ocshipclose_m
integer x = 873
integer y = 284
integer width = 347
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "전체선택"
end type

event clicked;long ll_row

dw_2.accepttext()
dw_2.setredraw(false)
if cbx_1.checked = true then
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.ship_close[ll_row] = 'C'
		dw_2.object.close_user[ll_row] = gs_userid
	next
else
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.ship_close[ll_row] = 'O'
		dw_2.object.close_user[ll_row] = gs_userid
	next
end if
dw_2.setredraw(true)

end event

type ddlb_1 from dropdownlistbox within w_ocshipclose_m
integer x = 87
integer y = 276
integer width = 750
integer height = 628
integer taborder = 130
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

type gb_4 from groupbox within w_ocshipclose_m
integer x = 46
integer y = 240
integer width = 2176
integer height = 136
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_3 from radiobutton within w_ocshipclose_m
integer x = 1275
integer y = 280
integer width = 219
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
string text = "전체"
boolean checked = true
end type

event clicked;wf_fil()
end event

type rb_4 from radiobutton within w_ocshipclose_m
integer x = 1509
integer y = 280
integer width = 219
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
string text = "대여"
end type

event clicked;wf_fil()
end event

type rb_5 from radiobutton within w_ocshipclose_m
integer x = 1742
integer y = 280
integer width = 219
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
string text = "부담"
end type

event clicked;wf_fil()
end event

type rb_6 from radiobutton within w_ocshipclose_m
integer x = 2249
integer y = 72
integer width = 288
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
string text = "거래처"
boolean checked = true
end type

event clicked;//
rb_4.enabled = true
rb_5.enabled = true

dw_2.dataobject = 'd_ocshipclose_m'
dw_2.SetTransObject(SQLCA)

end event

type rb_7 from radiobutton within w_ocshipclose_m
integer x = 2249
integer y = 144
integer width = 288
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
string text = "사내"
end type

event clicked;//
rb_3.checked = true
rb_4.checked = false
rb_5.checked = false

rb_4.enabled = false
rb_5.enabled = false

dw_2.dataobject = 'd_ocshipclose_m2'
dw_2.SetTransObject(SQLCA)

end event

type rb_8 from radiobutton within w_ocshipclose_m
integer x = 1975
integer y = 280
integer width = 224
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
string text = "공사"
end type

event clicked;wf_fil()
end event

type pb_1 from picturebutton within w_ocshipclose_m
event mousemove pbm_mousemove
integer x = 2825
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

event clicked;string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long ll_cnt
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

