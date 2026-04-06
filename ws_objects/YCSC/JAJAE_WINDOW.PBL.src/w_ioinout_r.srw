$PBExportHeader$w_ioinout_r.srw
$PBExportComments$저장소별 입출고내역(1998/05/11,곽용덕)
forward
global type w_ioinout_r from w_inheritance
end type
type dw_3 from datawindow within w_ioinout_r
end type
type cbx_1 from checkbox within w_ioinout_r
end type
type rb_1 from radiobutton within w_ioinout_r
end type
type rb_2 from radiobutton within w_ioinout_r
end type
type sle_1 from singlelineedit within w_ioinout_r
end type
type pb_1 from picturebutton within w_ioinout_r
end type
type st_1 from statictext within w_ioinout_r
end type
type pb_2 from picturebutton within w_ioinout_r
end type
type gb_4 from groupbox within w_ioinout_r
end type
end forward

global type w_ioinout_r from w_inheritance
integer width = 4590
integer height = 2692
string title = "저장소별 입출고내역(w_ioinout_r)"
dw_3 dw_3
cbx_1 cbx_1
rb_1 rb_1
rb_2 rb_2
sle_1 sle_1
pb_1 pb_1
st_1 st_1
pb_2 pb_2
gb_4 gb_4
end type
global w_ioinout_r w_ioinout_r

type variables
st_print i_print
string is_select,is_where,is_clause
datawindowchild idwc_loc
end variables

on w_ioinout_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.sle_1=create sle_1
this.pb_1=create pb_1
this.st_1=create st_1
this.pb_2=create pb_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.gb_4
end on

on w_ioinout_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

long ll_row

dw_2.visible = false

dw_3.settransobject(sqlca)
ll_row = dw_3.insertrow(0)
dw_3.object.fromdate[ll_row] = today()
dw_3.object.todate[ll_row] = today()

dw_3.getchild("loc_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "loc_no", "%")
idwc_loc.setitem(1, "loc_name", "전체")

//is_loc = "%"
//dw_1.retrieve('M1S1%',"%")

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 128
gb_2.height = this.height - 552

dw_1.width  = this.width  - 206
dw_1.height = this.height - 636

end event

type pb_save from w_inheritance`pb_save within w_ioinout_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ioinout_r
integer x = 73
integer y = 456
integer width = 4384
integer height = 2056
string dataobject = "d_ioinout_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(row, true)
this.ScrollToRow(row)
end event

event dw_1::rbuttondown;call super::rbuttondown;gs_where lst_where

if row < 1 then return

this.scrolltorow(row)
this.SelectRow(0,  false)
this.SelectRow(row, true)

int iX
iX = this.GetClickedColumn()

lst_where.str1 = trim(this.object.inaudit_inaudit_item[row])
lst_where.str2 = trim(this.object.inaudit_qa[row])
lst_where.str3 = trim(this.object.inaudit_loc_no[row])
lst_where.name = trim(this.object.groupitem_item_name[row])

m_manager NewMenu
int li_int

NewMenu = CREATE m_manager
gs_print_control = ""
m_manager.m_inaudit.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())

lst_where.chk = "DO"
if gs_print_control = 'INAUDIT' then
	openwithparm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
end if

end event

type dw_2 from w_inheritance`dw_2 within w_ioinout_r
integer x = 1367
integer y = 0
integer width = 123
integer height = 92
integer taborder = 60
string dataobject = "d_ioinout_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ioinout_r
integer x = 64
integer y = 32
integer width = 1445
integer height = 128
string text = "저장소별 입출고내역"
end type

type st_tips from w_inheritance`st_tips within w_ioinout_r
end type

type pb_compute from w_inheritance`pb_compute within w_ioinout_r
boolean visible = false
integer x = 2030
integer y = 76
integer width = 178
integer height = 112
integer taborder = 100
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_print_part from w_inheritance`pb_print_part within w_ioinout_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ioinout_r
integer x = 4279
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioinout_r
integer x = 3881
integer y = 56
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

//dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 입출고내역을 출력합니다."
//i_print.name = 'd_ioinout_r'
//i_print.yymm1 = is_where

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ioinout_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ioinout_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ioinout_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ioinout_r
integer x = 3685
integer y = 56
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_type,ls_loc, ls_name, ls_item
date ld_from, ld_to

dw_3.accepttext()
ls_type = trim(dw_3.object.inaudit_type[1])
ls_loc  = trim(dw_3.object.loc_no[1])
ld_from = date(dw_3.object.fromdate[1])
ld_to   = date(dw_3.object.todate[1])

if isnull(ls_type) or ls_type = "" then
	messagebox('오류','유형을 입력하십시요.',exclamation!)
	return
end if

if isnull(ls_loc) or ls_loc = "" then
	messagebox('오류','저장소를 입력하십시요.',exclamation!)
	return
end if
//daysafter
if isnull(ld_from) then
	messagebox('오류','시작일자를 입력하십시요.',exclamation!)
	return
end if

if isnull(ld_to) then
	messagebox('오류','종료일자를 입력하십시요.',exclamation!)
	return
end if

CHOOSE CASE rb_1.checked
	CASE true
		ls_item = trim(sle_1.text) + "%"
		ls_name = "%"
	CASE ELSE
		ls_item = "%"
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + trim(sle_1.text) + "%"
		end if
END CHOOSE

if cbx_1.checked = false then	// 실입출고일자 조회
	dw_1.dataobject = 'd_ioinout_t'
	dw_2.dataobject = 'd_ioinout_r'
else
	ld_to = RelativeDate(ld_to,  1)
	dw_1.dataobject = 'd_ioinout_t1'
	dw_2.dataobject = 'd_ioinout_r1'
end if

dw_1.settransobject(SQLCA)
dw_1.sharedata(dw_2)
if dw_1.retrieve(ls_type,ls_loc, ld_from, ld_to, ls_item, ls_name ) < 1 then
   messagebox('확인','해당자료가 없습니다.',information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ioinout_r
integer x = 41
integer y = 220
integer width = 4462
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ioinout_r
integer x = 41
integer y = 404
integer width = 4462
integer height = 2140
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_ioinout_r
integer x = 3643
integer y = 16
integer width = 855
integer textsize = -10
integer weight = 400
end type

type dw_3 from datawindow within w_ioinout_r
integer x = 73
integer y = 288
integer width = 2757
integer height = 84
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_iowhere_s"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'fromdate'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.fromdate[row] = datetime(date(message.stringparm))
		end if
	CASE 'todate'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.todate[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.accepttext()

end event

type cbx_1 from checkbox within w_ioinout_r
integer x = 2848
integer y = 292
integer width = 512
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "실입출고일자"
end type

type rb_1 from radiobutton within w_ioinout_r
integer x = 2341
integer y = 72
integer width = 210
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
string text = "코드"
boolean checked = true
end type

type rb_2 from radiobutton within w_ioinout_r
integer x = 2341
integer y = 136
integer width = 210
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
string text = "품명"
end type

type sle_1 from singlelineedit within w_ioinout_r
integer x = 2574
integer y = 88
integer width = 663
integer height = 92
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
integer limit = 12
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_ioinout_r
event mousemove pbm_mousemove
integer x = 4073
integer y = 56
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

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_3.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
										"엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_3.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_3.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type st_1 from statictext within w_ioinout_r
integer x = 3433
integer y = 300
integer width = 1038
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "오른쪽마우스=> 재고이력 검색"
alignment alignment = right!
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_ioinout_r
integer x = 3259
integer y = 56
integer width = 329
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목찾기"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;gs_where2 lstr_select

lstr_select.chk = "S"
openwithparm(w_whitemselectmulti_w,lstr_select)
lstr_select = Message.PowerObjectParm
if lstr_select.chk = "Y" then
	if rb_1.checked = true then
		sle_1.text = lstr_select.str1[1]
	else
		sle_1.text = lstr_select.name[1]
	end if
end if

end event

type gb_4 from groupbox within w_ioinout_r
integer x = 2299
integer y = 16
integer width = 1326
integer height = 204
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

