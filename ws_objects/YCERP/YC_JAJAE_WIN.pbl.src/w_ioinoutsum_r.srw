$PBExportHeader$w_ioinoutsum_r.srw
$PBExportComments$저장소별 입출고집계(2001/09/14,이인호)
forward
global type w_ioinoutsum_r from w_inheritance
end type
type rb_1 from radiobutton within w_ioinoutsum_r
end type
type rb_2 from radiobutton within w_ioinoutsum_r
end type
type sle_1 from singlelineedit within w_ioinoutsum_r
end type
type em_1 from editmask within w_ioinoutsum_r
end type
type st_1 from statictext within w_ioinoutsum_r
end type
type em_2 from editmask within w_ioinoutsum_r
end type
type dw_3 from datawindow within w_ioinoutsum_r
end type
type cbx_1 from checkbox within w_ioinoutsum_r
end type
type cbx_2 from checkbox within w_ioinoutsum_r
end type
type cbx_3 from checkbox within w_ioinoutsum_r
end type
type cbx_4 from checkbox within w_ioinoutsum_r
end type
type pb_1 from picturebutton within w_ioinoutsum_r
end type
type cbx_getqty from checkbox within w_ioinoutsum_r
end type
type st_3 from statictext within w_ioinoutsum_r
end type
type st_4 from statictext within w_ioinoutsum_r
end type
type pb_2 from picturebutton within w_ioinoutsum_r
end type
type cbx_5 from checkbox within w_ioinoutsum_r
end type
type st_2 from statictext within w_ioinoutsum_r
end type
type ddlb_fld from dropdownlistbox within w_ioinoutsum_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ioinoutsum_r
end type
type st_5 from statictext within w_ioinoutsum_r
end type
type ddlb_op from dropdownlistbox within w_ioinoutsum_r
end type
type sle_value from singlelineedit within w_ioinoutsum_r
end type
type cb_1 from commandbutton within w_ioinoutsum_r
end type
type cb_2 from commandbutton within w_ioinoutsum_r
end type
type cb_3 from commandbutton within w_ioinoutsum_r
end type
type cb_5 from commandbutton within w_ioinoutsum_r
end type
type gb_5 from groupbox within w_ioinoutsum_r
end type
end forward

global type w_ioinoutsum_r from w_inheritance
integer width = 4590
integer height = 2340
string title = "저장소별 입출고집계(w_ioinoutsum_r)"
rb_1 rb_1
rb_2 rb_2
sle_1 sle_1
em_1 em_1
st_1 st_1
em_2 em_2
dw_3 dw_3
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
pb_1 pb_1
cbx_getqty cbx_getqty
st_3 st_3
st_4 st_4
pb_2 pb_2
cbx_5 cbx_5
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_5 gb_5
end type
global w_ioinoutsum_r w_ioinoutsum_r

type variables
st_print i_print
string is_select, is_where, is_clause
datawindowchild idwc_loc
end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();string ls_file, ls_file1, ls_file2, ls_file3, ls_file4

//rcptqty issueqty ,itemloc_qoh notissueqty
ls_file = ""

IF cbx_1.checked = true then
	ls_file1 = 'bal <> 0 '
else
	ls_file1 = ''
end if

ls_file = ls_file1
IF cbx_2.checked = true then
	if ls_file = "" then 
		ls_file2 = ' rcpt_qty > 0 '
	else
		ls_file2 = ' or rcpt_qty > 0 '
	end if
else
	ls_file2 = ''
end if

ls_file = ls_file1 + ls_file2
IF cbx_3.checked = true then
	if ls_file = "" then 
		ls_file3 = ' issue_qty > 0 '
	else
		ls_file3 = ' or issue_qty > 0 '
	end if
else
	ls_file3 = ''
end if

ls_file = ls_file1 + ls_file2 + ls_file3
IF cbx_4.checked = true then
	if ls_file = "" then 
		ls_file4 = ' qoh <> 0 '
	else
		ls_file4 = ' or qoh <> 0 '
	end if
else
	ls_file4 = ''
end if
ls_file = ls_file1 + ls_file2 + ls_file3 + ls_file4

if ls_file = '' then
	dw_1.setfilter('')
else
	dw_1.setfilter(ls_file)
end if

dw_1.filter()

end subroutine

on w_ioinoutsum_r.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.sle_1=create sle_1
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.pb_1=create pb_1
this.cbx_getqty=create cbx_getqty
this.st_3=create st_3
this.st_4=create st_4
this.pb_2=create pb_2
this.cbx_5=create cbx_5
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.cbx_3
this.Control[iCurrent+11]=this.cbx_4
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.cbx_getqty
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.pb_2
this.Control[iCurrent+17]=this.cbx_5
this.Control[iCurrent+18]=this.st_2
this.Control[iCurrent+19]=this.ddlb_fld
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.st_5
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.sle_value
this.Control[iCurrent+24]=this.cb_1
this.Control[iCurrent+25]=this.cb_2
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.gb_5
end on

on w_ioinoutsum_r.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.sle_1)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.pb_1)
destroy(this.cbx_getqty)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.cbx_5)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


long ll_row

dw_2.visible = false
dw_1.sharedata(dw_2)

em_1.text = string(RelativeDate(today(), - 7), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

dw_3.settransobject(sqlca)
dw_3.insertrow(0)

dw_3.getchild("loc_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "loc_no", "%")
idwc_loc.setitem(1, "loc_name", "전체")

//is_loc = "%"
//dw_1.retrieve('M1S1%',"%")

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_ioinoutsum_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ioinoutsum_r
integer x = 32
integer y = 412
integer width = 4480
integer height = 1784
string dataobject = "d_ioinoutsum_t"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//if row < 1 then return
//this.SelectRow(0,  false)
//this.SelectRow(row,  true)
//this.scrolltorow(row)
end event

event dw_1::rbuttondown;call super::rbuttondown;if row < 1 then return
gs_where lst_where

this.scrolltorow(row)
this.SelectRow(0,  false)
this.SelectRow(row, true)

date ld_start, ld_end
string ls_loc

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
ls_loc   = dw_3.object.loc_no[1]

lst_where.str1 = trim(this.object.item_no[row])
lst_where.str2 = trim(this.object.qa[row])
lst_where.str3 = trim(dw_3.object.loc_no[1])
lst_where.name = trim(this.object.item_name[row])

m_manager NewMenu
int li_int

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_inaudit2.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())

lst_where.chk = "DO"
choose case gs_print_control
	case 'INAUDIT'
		openwithparm(w_whinaudit_w, lst_where)
		w_whinaudit_w.WindowState = Normal!
		lst_where = message.powerobjectparm
		
	CASE 'ISSUE'
		lst_where.chk = ls_loc
		open(w_whsale_w)
		w_whsale_w.em_1.text = em_1.text
		w_whsale_w.em_2.text = em_2.text
		w_whsale_w.st_item.text = lst_where.str1
		w_whsale_w.st_name.text = lst_where.name
		w_whsale_w.st_qa.text = lst_where.str2
		w_whsale_w.is_loc = lst_where.str3
		w_whsale_w.is_FLAG = 'ISSUE'
		w_whsale_w.cb_1.postevent(clicked!)
//		dw_1.retrieve(ld_start, ld_end, lst_where.str1, lst_where.str2, ls_loc)

	CASE 'SALE'
		lst_where.chk = ls_loc
		open(w_whsale_w)
		w_whsale_w.em_1.text = em_1.text
		w_whsale_w.em_2.text = em_2.text
		w_whsale_w.st_item.text = lst_where.str1
		w_whsale_w.st_name.text = lst_where.name
		w_whsale_w.st_qa.text = lst_where.str2
		w_whsale_w.is_loc = ls_loc
		w_whsale_w.is_area = 'S0001'
		w_whsale_w.is_FLAG = 'SALE'
		w_whsale_w.cb_1.postevent(clicked!)
end choose


end event

event dw_1::dberror;call super::dberror;MessageBox("확인", "DataWindow Error 오류시에는 '환산수량 제외'를 선택한 후 재 조회하시기 바랍니다.~n~n" + &
           "조회 기간 데이터중 규격오류로 인하여 환산할 수 없습니다.")
end event

type st_title from w_inheritance`st_title within w_ioinoutsum_r
integer x = 46
integer y = 28
integer width = 1358
integer height = 132
string text = "저장소별 입출고 집계"
end type

type st_tips from w_inheritance`st_tips within w_ioinoutsum_r
end type

type pb_compute from w_inheritance`pb_compute within w_ioinoutsum_r
boolean visible = false
integer x = 887
integer y = 0
integer width = 169
integer height = 112
integer taborder = 90
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

type pb_print_part from w_inheritance`pb_print_part within w_ioinoutsum_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ioinoutsum_r
integer x = 4283
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioinoutsum_r
integer x = 3890
integer y = 60
integer taborder = 140
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

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ioinoutsum_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_ioinoutsum_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_ioinoutsum_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ioinoutsum_r
integer x = 3694
integer y = 60
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_loc, ls_name, ls_item, ls_from, ls_to, ls_getqty
long   ll_row

dw_3.accepttext()
ls_loc  = trim(dw_3.object.loc_no[1])
ls_from = string(date(em_1.text), 'yyyymmdd')
ls_to   = string(date(em_2.text), 'yyyymmdd')

if isnull(ls_loc) or ls_loc = "" then
	MessageBox('오류','저장소를 입력하십시요.',exclamation!)
	return
end if
//daysafter
if isnull(ls_from) then
	MessageBox('오류','시작일자를 입력하십시요.',exclamation!)
	return
end if
if isnull(ls_to) then
	MessageBox('오류','종료일자를 입력하십시요.',exclamation!)
	return
end if

choose case rb_1.checked
	case true
		ls_item = trim(sle_1.text) + "%"
		ls_name = "%"
	case ELSE
		ls_item = "%"
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + trim(sle_1.text) + "%"
		end if
end choose

if cbx_getqty.checked = true then
	ls_getqty = 'N'
else
	ls_getqty = 'Y'
end if

ll_row = dw_1.retrieve(ls_loc, ls_from, ls_to, ls_item, ls_name, ls_getqty)
if ll_row < 1 then
   MessageBox('확인','해당자료가 없습니다.',information!)
else
//	wf_fil()
	string ls_qa	
	if cbx_getqty.checked = false then
		for ll_row = 1 to dw_1.rowcount()
			ls_qa = dw_1.object.qa[ll_row]
			if MidA(ls_qa,4,1) = "X" and MidA(ls_qa,9,1) = "X" and MidA(ls_qa,14,1) = "X" then
			else
				dw_1.ScrollToRow(ll_row)
				dw_1.SelectRow(0,  false)
				dw_1.SelectRow(ll_row, true)
				EXIT
			end if
		next
	end if	
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ioinoutsum_r
integer x = 2565
integer y = 16
integer width = 1079
integer height = 212
integer taborder = 70
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ioinoutsum_r
integer y = 240
integer width = 4480
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 16711680
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_ioinoutsum_r
integer x = 3657
integer y = 16
integer width = 846
integer height = 212
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ioinoutsum_r
integer x = 1266
integer y = 0
integer width = 146
integer height = 100
string dataobject = "d_ioinoutsum_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type rb_1 from radiobutton within w_ioinoutsum_r
integer x = 3424
integer y = 276
integer width = 210
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
end type

type rb_2 from radiobutton within w_ioinoutsum_r
integer x = 3424
integer y = 328
integer width = 210
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
string text = "품명"
boolean checked = true
end type

type sle_1 from singlelineedit within w_ioinoutsum_r
integer x = 3653
integer y = 288
integer width = 800
integer height = 76
integer taborder = 60
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
end type

type em_1 from editmask within w_ioinoutsum_r
integer x = 2811
integer y = 136
integer width = 366
integer height = 72
integer taborder = 110
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ioinoutsum_r
integer x = 3177
integer y = 128
integer width = 59
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_ioinoutsum_r
integer x = 3241
integer y = 136
integer width = 366
integer height = 72
integer taborder = 120
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_ioinoutsum_r
integer x = 2601
integer y = 52
integer width = 846
integer height = 84
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type cbx_1 from checkbox within w_ioinoutsum_r
integer x = 1495
integer y = 72
integer width = 352
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
string text = "전일이월"
boolean checked = true
end type

event clicked;wf_fil()
end event

type cbx_2 from checkbox within w_ioinoutsum_r
integer x = 1495
integer y = 140
integer width = 238
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
string text = "입고"
boolean checked = true
end type

event clicked;wf_fil()
end event

type cbx_3 from checkbox within w_ioinoutsum_r
integer x = 1755
integer y = 140
integer width = 238
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
string text = "출고"
boolean checked = true
end type

event clicked;wf_fil()
end event

type cbx_4 from checkbox within w_ioinoutsum_r
integer x = 2007
integer y = 140
integer width = 293
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
string text = "현재고"
boolean checked = true
end type

event clicked;wf_fil()
end event

type pb_1 from picturebutton within w_ioinoutsum_r
event mousemove pbm_mousemove
integer x = 4087
integer y = 60
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

type cbx_getqty from checkbox within w_ioinoutsum_r
integer x = 2007
integer y = 72
integer width = 517
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
boolean enabled = false
string text = "환산수량 제외"
boolean checked = true
end type

type st_3 from statictext within w_ioinoutsum_r
integer x = 46
integer y = 192
integer width = 1079
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "오른쪽마우스=> 재고이력 검색"
boolean focusrectangle = false
end type

type st_4 from statictext within w_ioinoutsum_r
integer x = 2601
integer y = 136
integer width = 210
integer height = 72
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
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_ioinoutsum_r
integer x = 3063
integer y = 280
integer width = 338
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목검색"
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

type cbx_5 from checkbox within w_ioinoutsum_r
integer x = 2546
integer y = 304
integer width = 416
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "정렬(품명)"
end type

event clicked;//
if this.checked = true then
	dw_1.setredraw(false)
	dw_1.setsort('groupitem_item_name, qa, location_loc_name, cdate')
	dw_1.sort()
	dw_1.groupcalc()
	dw_1.setredraw(true)
else
	dw_1.setredraw(false)
	dw_1.setsort('item_no, qa, location_loc_name, cdate')
	dw_1.sort()
	dw_1.groupcalc()
	dw_1.setredraw(true)
end if
end event

type st_2 from statictext within w_ioinoutsum_r
integer x = 87
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_ioinoutsum_r
integer x = 274
integer y = 288
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ioinoutsum_r
integer x = 325
integer y = 304
integer width = 311
integer height = 88
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

type st_5 from statictext within w_ioinoutsum_r
integer x = 773
integer y = 304
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

type ddlb_op from dropdownlistbox within w_ioinoutsum_r
integer x = 942
integer y = 288
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ioinoutsum_r
integer x = 1262
integer y = 296
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ioinoutsum_r
integer x = 1833
integer y = 296
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ioinoutsum_r
integer x = 1998
integer y = 296
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

type cb_3 from commandbutton within w_ioinoutsum_r
integer x = 2162
integer y = 296
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ioinoutsum_r
integer x = 2327
integer y = 296
integer width = 160
integer height = 76
integer taborder = 120
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

type gb_5 from groupbox within w_ioinoutsum_r
integer x = 1458
integer y = 16
integer width = 1093
integer height = 212
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

