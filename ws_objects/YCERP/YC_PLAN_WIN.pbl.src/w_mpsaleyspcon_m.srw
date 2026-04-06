$PBExportHeader$w_mpsaleyspcon_m.srw
$PBExportComments$YSP수주접수관리(2003/01/07,이인호)
forward 
global type w_mpsaleyspcon_m from w_inheritance
end type
type rb_1 from radiobutton within w_mpsaleyspcon_m
end type
type rb_2 from radiobutton within w_mpsaleyspcon_m
end type
type dw_3 from datawindow within w_mpsaleyspcon_m
end type
type dw_4 from datawindow within w_mpsaleyspcon_m
end type
type em_2 from editmask within w_mpsaleyspcon_m
end type
type em_1 from editmask within w_mpsaleyspcon_m
end type
type em_3 from editmask within w_mpsaleyspcon_m
end type
type st_3 from statictext within w_mpsaleyspcon_m
end type
type cb_13 from commandbutton within w_mpsaleyspcon_m
end type
type dw_5 from datawindow within w_mpsaleyspcon_m
end type
type st_4 from statictext within w_mpsaleyspcon_m
end type
type ddlb_fld from dropdownlistbox within w_mpsaleyspcon_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsaleyspcon_m
end type
type st_5 from statictext within w_mpsaleyspcon_m
end type
type ddlb_op from dropdownlistbox within w_mpsaleyspcon_m
end type
type sle_value from singlelineedit within w_mpsaleyspcon_m
end type
type cb_1 from commandbutton within w_mpsaleyspcon_m
end type
type cb_2 from commandbutton within w_mpsaleyspcon_m
end type
type cb_3 from commandbutton within w_mpsaleyspcon_m
end type
type cb_5 from commandbutton within w_mpsaleyspcon_m
end type
type cbx_1 from checkbox within w_mpsaleyspcon_m
end type
type st_horizontal from u_splitbar_horizontal within w_mpsaleyspcon_m
end type
type st_vertical from u_splitbar_vertical within w_mpsaleyspcon_m
end type
type gb_4 from groupbox within w_mpsaleyspcon_m
end type
end forward

global type w_mpsaleyspcon_m from w_inheritance
integer y = 36
integer width = 4453
integer height = 2596
string title = "판매생산 확정(YSP)(w_mpsaleyspcon_m)"
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
em_2 em_2
em_1 em_1
em_3 em_3
st_3 st_3
cb_13 cb_13
dw_5 dw_5
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_1 cbx_1
st_horizontal st_horizontal
st_vertical st_vertical
gb_4 gb_4
end type
global w_mpsaleyspcon_m w_mpsaleyspcon_m

type variables
st_print i_print
end variables

on w_mpsaleyspcon_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_2=create em_2
this.em_1=create em_1
this.em_3=create em_3
this.st_3=create st_3
this.cb_13=create cb_13
this.dw_5=create dw_5
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_1=create cbx_1
this.st_horizontal=create st_horizontal
this.st_vertical=create st_vertical
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.em_3
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.cb_13
this.Control[iCurrent+10]=this.dw_5
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.cbx_1
this.Control[iCurrent+22]=this.st_horizontal
this.Control[iCurrent+23]=this.st_vertical
this.Control[iCurrent+24]=this.gb_4
end on

on w_mpsaleyspcon_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.em_3)
destroy(this.st_3)
destroy(this.cb_13)
destroy(this.dw_5)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_1)
destroy(this.st_horizontal)
destroy(this.st_vertical)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission('YSP수주접수관리', gs_userid) = 'Y' then	
else
	pb_save.enabled = false
end if

em_3.text = "BD" + string(today(), "yyyy")
em_1.text = string(RelativeDate(today(),  - 7), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_4.visible = false
dw_5.visible = false

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.y      = dw_2.y + dw_2.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x

// 발주조회
dw_5.x       = dw_3.width - 3657 + 25
dw_5.y       = dw_3.y - 85
dw_5.width   = 3657
dw_5.height  = dw_3.height + 85


end event

type pb_save from w_inheritance`pb_save within w_mpsaleyspcon_m
integer x = 3566
end type

event pb_save::clicked;string ls_chk, ls_order, ls_itemno, ls_itemnm, ls_uom
int    li_cnt
long   ll_row

if dw_2.rowcount() < 1 then RETURN

ls_chk = 'N'
if dw_2.getItemStatus(1, 0, Primary!) <> NotModified! then
	ls_chk = 'Y'
end if

ls_order = dw_2.object.order_no[1]
SELECT count(*) INTO :li_cnt FROM sale WHERE order_no = :ls_order AND confirm_flag = 'Y';
if li_cnt < 1 then 
	MessageBox("확인", "해당수주는 확정이 취소 되어 있는 상태입니다.~r~n" &
						  + "재조회 하시고, 수주담당자와 연락하시기 바랍니다.")
	RETURN
end if

/////////////////////////////////////////////////////////////////////
// PCYSYSEBZZ: Y.S.P (단면) 만 단위가 M2임
/////////////////////////////////////////////////////////////////////
for ll_row = 1 to dw_3.rowcount()
	ls_itemno = dw_3.object.item_no[ll_row]
	ls_itemnm = dw_3.object.item_item_name[ll_row]
	ls_uom    = dw_3.object.uom[ll_row] 
	
	choose case ls_itemno
		case "PCYSYSEBZZ", "PZYSYSJBZZ", "PCYSYDJBZZ", "PCYSYSJZZZ" 
			// Y.S.P (단면), Y.S.P (단면 절곡), Y.S.P (단면절곡 "ㄱ자"), Y.S.P (단면절곡 "ㄷ자")
		case else
			if ls_uom = "M2" then
				dw_3.scrolltorow(ll_row)
				MessageBox("확인", ls_itemnm + "~n~n" + string(ll_row) + " 행 품목의 단위(M2) 오류입니다.~n~n수주관리에서 단위를 수정하시기 바랍니다.")
				RETURN
			end if
	end choose
next
/////////////////////////////////////////////////////////////////////

if wf_update2(dw_2, dw_3, 'Y') = true then
	if ls_chk = 'Y' then	pb_retrieve.postevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_mpsaleyspcon_m
integer x = 2715
integer y = 416
integer width = 1659
integer height = 980
string dataobject = "d_mpsaleyspcon_s"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;//
string ls_order
long ll_row

ll_row = this.getrow()

if ll_row < 1 then return
ls_order = this.object.order_no[ll_row]

dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

end event

event dw_1::clicked;call super::clicked;//
if row < 1 then return

//This.SelectRow(0,  false)
//This.SelectRow(row, TRUE)

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_mpsaleyspcon_m
integer x = 32
integer y = 20
integer width = 1266
integer height = 136
string text = "판매생산 확정(YSP)"
end type

type st_tips from w_inheritance`st_tips within w_mpsaleyspcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsaleyspcon_m
integer x = 2158
integer y = 80
integer width = 142
integer height = 104
integer taborder = 110
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_compute::clicked;string ls_order
long ll_row
 
ls_order = TRIM(em_3.TEXT)

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

dw_2.setredraw(true)
dw_3.setredraw(true)

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpsaleyspcon_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsaleyspcon_m
integer x = 3758
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsaleyspcon_m
integer x = 3374
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then return
string ls_order
long ll_row

ls_order = dw_2.object.order_no[1]
dw_4.retrieve(ls_order)

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsaleyspcon_m
boolean visible = false
integer y = 56
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsaleyspcon_m
boolean visible = false
integer x = 2880
integer taborder = 170
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_mpsaleyspcon_m
boolean visible = false
integer x = 2693
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsaleyspcon_m
integer x = 3182
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_flag
date   ld_start, ld_end

dw_1.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_1.reset()
dw_2.reset()
dw_3.reset()

ls_flag = 'Y'
if rb_1.checked = true then ls_flag = 'N'	// 대기

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
dw_1.retrieve(ls_flag, ld_start, ld_end)
dw_1.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_mpsaleyspcon_m
integer x = 32
integer width = 4343
integer height = 172
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsaleyspcon_m
integer x = 2354
integer y = 12
integer width = 782
integer height = 204
integer taborder = 120
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpsaleyspcon_m
integer x = 3154
integer width = 823
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsaleyspcon_m
integer x = 32
integer y = 416
integer width = 2610
integer height = 980
integer taborder = 60
string dataobject = "d_mpsaleyspcon_m"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_mpsaleyspcon_m
integer x = 2382
integer y = 52
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "대기"
boolean checked = true
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type rb_2 from radiobutton within w_mpsaleyspcon_m
integer x = 2747
integer y = 52
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완료"
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type dw_3 from datawindow within w_mpsaleyspcon_m
integer x = 32
integer y = 1448
integer width = 4347
integer height = 1012
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_orsaleyspcon_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;integer ll_row

this.Accepttext()
ll_row = this.getrow()

choose case dwo.name
	case 'chk'	
		if data = 'N' then
			this.object.sol_qty[ll_row] = this.getitemnumber(ll_row, "sol_qty", Primary!, TRUE)
			this.object.saledet_text[ll_row] = this.getitemstring(ll_row, "saledet_text", Primary!, TRUE)
		else
			this.object.sol_qty[ll_row] = this.object.order_qty[ll_row] - this.object.rlse_qty[ll_row]
			this.object.saledet_text[ll_row] = 'X'
	   end if
end choose


end event

type dw_4 from datawindow within w_mpsaleyspcon_m
integer x = 41
integer y = 180
integer width = 87
integer height = 60
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_orsaleyspcon_r"
boolean livescroll = true
end type

type em_2 from editmask within w_mpsaleyspcon_m
integer x = 2747
integer y = 120
integer width = 357
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_1 from editmask within w_mpsaleyspcon_m
integer x = 2382
integer y = 120
integer width = 357
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_3 from editmask within w_mpsaleyspcon_m
event keydown pbm_dwnkey
integer x = 1669
integer y = 92
integer width = 480
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF

END IF



end event

type st_3 from statictext within w_mpsaleyspcon_m
integer x = 1390
integer y = 92
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "수주번호"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_13 from commandbutton within w_mpsaleyspcon_m
integer x = 3872
integer y = 280
integer width = 475
integer height = 92
integer taborder = 200
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

ll_row = dw_3.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw_3.GetClickedColumn()

lst_where.str1 = trim(dw_3.object.item_no[ll_row])
lst_where.str2 = trim(dw_3.object.qa[ll_row])
lst_where.str3 = trim("WS00000000")
lst_where.name = trim(dw_3.object.item_item_name[ll_row])

openwithparm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type dw_5 from datawindow within w_mpsaleyspcon_m
integer x = 1490
integer y = 1536
integer width = 1947
integer height = 808
integer taborder = 90
boolean bringtotop = true
boolean titlebar = true
string title = "수주품목발주조회"
string dataobject = "d_orsale_purdet"
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_mpsaleyspcon_m
integer x = 78
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_mpsaleyspcon_m
integer x = 265
integer y = 280
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_mpsaleyspcon_m
integer x = 297
integer y = 288
integer width = 347
integer height = 88
integer taborder = 130
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

type st_5 from statictext within w_mpsaleyspcon_m
integer x = 782
integer y = 296
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

type ddlb_op from dropdownlistbox within w_mpsaleyspcon_m
integer x = 951
integer y = 280
integer width = 297
integer height = 512
integer taborder = 130
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

type sle_value from singlelineedit within w_mpsaleyspcon_m
integer x = 1271
integer y = 284
integer width = 567
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_mpsaleyspcon_m
integer x = 1842
integer y = 288
integer width = 160
integer height = 76
integer taborder = 140
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

type cb_2 from commandbutton within w_mpsaleyspcon_m
integer x = 2007
integer y = 288
integer width = 160
integer height = 76
integer taborder = 150
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsaleyspcon_m
integer x = 2171
integer y = 288
integer width = 160
integer height = 76
integer taborder = 160
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsaleyspcon_m
integer x = 2336
integer y = 288
integer width = 160
integer height = 76
integer taborder = 170
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_1 from checkbox within w_mpsaleyspcon_m
integer x = 2523
integer y = 300
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "발주조회"
end type

event clicked;// 발주조회
string ls_orderno

if dw_2.rowcount() < 1 then RETURN

ls_orderno = dw_2.object.order_no[1]
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

dw_5.reset()
if this.checked = true then
	dw_5.retrieve( ls_orderno )
	dw_5.visible = true 
	dw_5.setfocus()
else
	dw_5.visible = false
end if

end event

type st_horizontal from u_splitbar_horizontal within w_mpsaleyspcon_m
integer x = 32
integer y = 1412
integer width = 4347
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_2.height

end event

type st_vertical from u_splitbar_vertical within w_mpsaleyspcon_m
integer x = 2674
integer y = 416
integer height = 980
boolean bringtotop = true
end type

type gb_4 from groupbox within w_mpsaleyspcon_m
integer x = 1349
integer y = 12
integer width = 992
integer height = 204
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
end type

