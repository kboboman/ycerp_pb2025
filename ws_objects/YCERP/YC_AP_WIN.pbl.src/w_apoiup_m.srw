$PBExportHeader$w_apoiup_m.srw
$PBExportComments$자재매입수정 및 취소(1999/05/31, 이인호)
forward
global type w_apoiup_m from w_inheritance
end type
type dw_3 from datawindow within w_apoiup_m
end type
type dw_4 from datawindow within w_apoiup_m
end type
type dw_5 from datawindow within w_apoiup_m
end type
type dw_6 from datawindow within w_apoiup_m
end type
type em_1 from editmask within w_apoiup_m
end type
type em_2 from editmask within w_apoiup_m
end type
type dw_area from datawindow within w_apoiup_m
end type
type st_2 from statictext within w_apoiup_m
end type
type st_3 from statictext within w_apoiup_m
end type
type st_1 from statictext within w_apoiup_m
end type
type st_horizontal from u_splitbar_horizontal within w_apoiup_m
end type
type st_vertical from u_splitbar_vertical within w_apoiup_m
end type
type st_4 from statictext within w_apoiup_m
end type
type ddlb_fld from dropdownlistbox within w_apoiup_m
end type
type ddlb_dwtitles from dropdownlistbox within w_apoiup_m
end type
type st_5 from statictext within w_apoiup_m
end type
type ddlb_op from dropdownlistbox within w_apoiup_m
end type
type sle_value from singlelineedit within w_apoiup_m
end type
type cb_1 from commandbutton within w_apoiup_m
end type
type cb_2 from commandbutton within w_apoiup_m
end type
type cb_3 from commandbutton within w_apoiup_m
end type
type cb_5 from commandbutton within w_apoiup_m
end type
type gb_4 from groupbox within w_apoiup_m
end type
end forward

global type w_apoiup_m from w_inheritance
integer x = 37
integer y = 136
integer width = 4489
integer height = 2396
string title = "매입관리 수정및취소(w_apoiup_m)"
boolean resizable = false
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
em_1 em_1
em_2 em_2
dw_area dw_area
st_2 st_2
st_3 st_3
st_1 st_1
st_horizontal st_horizontal
st_vertical st_vertical
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
gb_4 gb_4
end type
global w_apoiup_m w_apoiup_m

type variables
st_print i_print
datawindowchild idwc_cust
string  is_update_flag
st_apoiup_amt ist_amt
end variables

on w_apoiup_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_2=create st_2
this.st_3=create st_3
this.st_1=create st_1
this.st_horizontal=create st_horizontal
this.st_vertical=create st_vertical
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
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.dw_6
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_horizontal
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_1
this.Control[iCurrent+20]=this.cb_2
this.Control[iCurrent+21]=this.cb_3
this.Control[iCurrent+22]=this.cb_5
this.Control[iCurrent+23]=this.gb_4
end on

on w_apoiup_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.st_horizontal)
destroy(this.st_vertical)
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
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_3 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_3 )
st_horizontal.of_set_topobject( dw_2 )
st_horizontal.of_set_bottomobject( dw_4 )
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//if gs_userid = '1999010s' then
//else
//	dw_area.visible = false
//end if

dw_5.visible = false
dw_6.visible = false

em_1.text = string(today(),'yyyy/mm/01')
em_2.text = string(today(),'yyyy/mm/dd')
dw_1.insertrow(0)

//dw_2.modify('datawindow.readonly = yes')
//dw_4.modify('datawindow.readonly = yes')

if gf_permission("매입관리_수정및취소", gs_userid) = "Y" then
else
	MessageBox("확인","매입관리_수정및취소 권한이 존재하지 않습니다.")
	close(this)
end if

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = dw_3.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth - dw_2.x - dw_3.x
dw_2.height = dw_3.height

st_horizontal.y     = dw_3.y + dw_3.height
st_horizontal.width = dw_3.width + st_vertical.width + dw_2.width

dw_4.width  = newwidth  - (dw_4.x * 2)
dw_4.height = newheight - dw_4.y - dw_4.x


end event

type pb_save from w_inheritance`pb_save within w_apoiup_m
integer x = 3575
integer y = 48
integer taborder = 120
boolean enabled = false
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;string 	ls_yyyymm, ls_magamyn // 2017.10.23 조원석

if dw_2.rowcount() < 1 then return

dw_2.accepttext()

/* 마감관리 로직 반영 2017.10.23 조원석 */
/* sys_gb = '10' (10)구매 마감 로직 	 시작 */
ls_yyyymm = string(dw_2.object.oi_date[1], "yyyymm")

SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';

//if ls_magamyn <> "N" then
//	MessageBox('확인','해당년월은 마감되었습니다.~n~n',Stopsign!)
//	return
//end if

/* 마감관리 로직 반영 2017.10.23 조원석  끝 */

if wf_update1(dw_2, 'Y') = false then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apoiup_m
integer x = 1687
integer y = 112
integer width = 859
integer height = 88
integer taborder = 50
string dataobject = "d_apsupp_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_apoiup_m
integer x = 41
integer y = 24
integer width = 1303
integer height = 132
string text = "매입관리 수정및취소"
end type

type st_tips from w_inheritance`st_tips within w_apoiup_m
end type

type pb_compute from w_inheritance`pb_compute within w_apoiup_m
boolean visible = false
integer x = 1659
integer taborder = 160
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoiup_m
boolean visible = false
integer x = 2766
integer y = 40
integer taborder = 130
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_apoiup_m
integer x = 3767
integer y = 48
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoiup_m
boolean visible = false
integer x = 2958
integer y = 40
boolean enabled = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_apoiup_m
boolean visible = false
integer x = 2537
integer taborder = 170
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

type pb_delete from w_inheritance`pb_delete within w_apoiup_m
integer x = 3191
integer y = 48
integer taborder = 180
end type

event pb_delete::clicked;long ll_row, ll_row1, ll_find, ll_year
string ls_insp_no, ls_insp_no1, ls_apoiinv_no, ls_month, ls_supp_no, ls_null
integer li_count
decimal lr_total, lr_ship_cost

if dw_2.rowcount() < 1 then return

if messagebox("취소","세금계산서 내역을 취소하시겠습니까?",question!,okcancel!,2) = 2 then
	return
end if

if is_update_flag = 'Y' then
	dw_3.triggerevent(rowfocuschanged!)
	is_update_flag = 'N'
end if

dw_2.accepttext()
dw_4.accepttext()
dw_5.accepttext()
dw_6.accepttext()

setpointer(hourglass!)
ls_apoiinv_no = dw_2.object.apoiinv_no[1]
ls_supp_no = dw_2.object.supp_no[1]
dw_5.retrieve(ls_apoiinv_no)
dw_6.retrieve(ls_supp_no, dw_area.object.area[1])
dw_2.object.delete_flag[1] = 'Y' //취소 flag

for ll_row = 1 to dw_4.rowcount()
	//inspdet table의 입고수량과 선매입수량 update/a_qty
	dw_5.object.apoi_qty[ll_row] = 0
	
	//insp table의 매입여부 update
	ls_insp_no1 = dw_4.object.insp_no[ll_row]
	if ll_row = 1 then
		ls_insp_no = dw_4.object.insp_no[ll_row]
		ll_find = dw_6.find("insp_no = '" + ls_insp_no + "' and apoiinv_no <> '" + ls_apoiinv_no + "'", 1, dw_6.rowcount())
		if ll_find = 0 then
			ll_find = dw_6.find("insp_no = '" + ls_insp_no + "' and apoiinv_no = '" + ls_apoiinv_no + "'", 1, dw_6.rowcount())
			dw_6.object.invoice_print[ll_find] = 'N'
		end if	
	elseif ls_insp_no <> ls_insp_no1 then
		ll_find = dw_6.find("insp_no = '" + ls_insp_no1 + "' and apoiinv_no <> '" + ls_apoiinv_no + "'", 1, dw_6.rowcount())
		if ll_find = 0 then
			ll_find = dw_6.find("insp_no = '" + ls_insp_no1 + "' and apoiinv_no = '" + ls_apoiinv_no + "'", 1, dw_6.rowcount())
			dw_6.object.invoice_print[ll_find] = 'N'
		end if	
		ls_insp_no = ls_insp_no1
	end if
next
lr_ship_cost = dw_2.object.ship_cost[1]
if lr_ship_cost > 0 then
	setnull(ls_null)
	UPDATE insp SET inv_no = :ls_null
	 WHERE inv_no = :ls_apoiinv_no;
	 
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
		return
	end if	 
end if

dw_2.accepttext()
dw_5.accepttext()
dw_6.accepttext()

if wf_update3(dw_2, dw_5, dw_6, 'Y') = false then
	return
end if

pb_retrieve.postevent(clicked!)

end event

type pb_insert from w_inheritance`pb_insert within w_apoiup_m
integer x = 3383
integer y = 48
integer taborder = 90
boolean enabled = false
string picturename = "c:\bmp\update.bmp"
end type

event pb_insert::clicked;//if dw_2.rowcount() < 1 then return
//
//dw_2.modify('datawindow.readonly = no')
//dw_4.modify('datawindow.readonly = no')
//
////if dw_2.object.curr_code[1] <> 'WON' then
////	dw_2.object.gl_cur_rate.tabsequence = 1
////	dw_2.object.gl_cur_rate.background.color = 1087434968
////end if
//
//if dw_4.rowcount() > 0 then
//	dw_4.object.pick.tabsequence = 1
//end if
//
////dw_2.object.rem.tabsequence = 1
////dw_2.object.rem.background.color = 1087434968
//
//ist_amt.apoiinv_cash = dw_2.object.apoiinv_cash[1]
//ist_amt.apoiinv_rate = dw_2.object.apoiinv_rate[1]
//ist_amt.ship_cost = dw_2.object.ship_cost[1]
//ist_amt.dc = dw_2.object.c_vat[1]
//
//dw_5.retrieve(dw_3.object.apoiinv_no[dw_3.getrow()])
//dw_6.retrieve(dw_2.object.supp_no[1])
//is_update_flag = 'Y' //수정버튼 click check
//pb_save.enabled = true
//dw_2.setfocus()
end event

event pb_insert::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수정",parent, li_x, li_y)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_apoiup_m
integer x = 2999
integer y = 48
integer taborder = 190
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_sdate, ld_edate

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	

if em_1.text = '' then
	messagebox("확인","입고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","입고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","입고기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if
	
dw_1.accepttext()
dw_3.reset()
dw_2.reset()
dw_4.reset()
dw_3.retrieve(dw_1.object.supp_no[1],ld_sdate,ld_edate, dw_area.object.area[1])
dw_3.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_apoiup_m
integer x = 1403
integer y = 0
integer width = 1541
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_apoiup_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 786
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_apoiup_m
integer x = 2967
integer y = 0
integer width = 1019
integer height = 212
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_apoiup_m
integer x = 2341
integer y = 432
integer width = 2089
integer height = 576
integer taborder = 60
string dataobject = "d_apoiup_m"
boolean vscrollbar = false
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_3 from datawindow within w_apoiup_m
integer x = 32
integer y = 432
integer width = 2254
integer height = 576
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_apoiup_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.rowcount() > 0 then
	this.accepttext()
	
//	dw_2.modify('datawindow.readonly = yes')
//	dw_4.modify('datawindow.readonly = yes')
	
	if dw_2.retrieve(this.object.apoiinv_no[this.getrow()]) < 1 then return
	
//	dw_2.object.gl_cur_rate.background.color = 78682240
//	dw_2.object.gl_cur_rate.tabsequence = 0
//	dw_2.object.ship_cost.background.color = 78682240
//	dw_2.object.ship_cost.tabsequence = 0
//	dw_2.object.rem.background.color = 78682240
//	dw_2.object.rem.tabsequence = 0
	
	if dw_2.object.curr_code[1] = 'WON' then
		dw_4.dataobject = 'd_apoiup_m1'
	else
		dw_4.dataobject = 'd_apoiup_m2'
	end if
	
	dw_4.settransobject(sqlca)
	dw_4.retrieve(this.object.apoiinv_no[this.getrow()])
//	dw_4.object.pick.tabsequence = 0
	dw_5.reset()
	dw_6.reset()
else
	dw_2.reset()
	dw_4.reset()
	dw_5.reset()
	dw_6.reset()
end if

is_update_flag = 'N'
pb_save.enabled = false
end event

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_4 from datawindow within w_apoiup_m
integer x = 32
integer y = 1060
integer width = 4402
integer height = 1224
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_apoiup_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_5 from datawindow within w_apoiup_m
integer x = 1170
integer y = 12
integer width = 78
integer height = 60
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_apoiup_h"
end type

type dw_6 from datawindow within w_apoiup_m
integer x = 1271
integer y = 12
integer width = 78
integer height = 60
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_apoiup_h1"
boolean livescroll = true
end type

type em_1 from editmask within w_apoiup_m
integer x = 2537
integer y = 36
integer width = 375
integer height = 76
integer taborder = 30
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

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_apoiup_m
integer x = 2537
integer y = 116
integer width = 375
integer height = 76
integer taborder = 40
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

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

type dw_area from datawindow within w_apoiup_m
integer x = 1691
integer y = 32
integer width = 526
integer height = 84
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_2 from statictext within w_apoiup_m
integer x = 1426
integer y = 36
integer width = 261
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_apoiup_m
integer x = 1426
integer y = 116
integer width = 261
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_apoiup_m
integer x = 2235
integer y = 36
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "발행일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_horizontal from u_splitbar_horizontal within w_apoiup_m
integer x = 32
integer y = 1020
integer width = 4402
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_3.height

end event

type st_vertical from u_splitbar_vertical within w_apoiup_m
integer x = 2304
integer y = 432
integer height = 576
boolean bringtotop = true
end type

type st_4 from statictext within w_apoiup_m
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_apoiup_m
integer x = 270
integer y = 288
integer width = 480
integer height = 632
integer taborder = 20
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

type ddlb_dwtitles from dropdownlistbox within w_apoiup_m
integer x = 311
integer y = 300
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

type st_5 from statictext within w_apoiup_m
integer x = 768
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

type ddlb_op from dropdownlistbox within w_apoiup_m
integer x = 937
integer y = 288
integer width = 297
integer height = 512
integer taborder = 30
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

type sle_value from singlelineedit within w_apoiup_m
integer x = 1257
integer y = 296
integer width = 494
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

type cb_1 from commandbutton within w_apoiup_m
integer x = 1765
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

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_apoiup_m
integer x = 1929
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

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if
//
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_apoiup_m
integer x = 2094
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

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_apoiup_m
integer x = 2258
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

//if cbx_cust.checked = true then		// 집계표
//	arg_dw  = dw_4
//elseif cbx_2.checked = true then		// 분석
//	if cbx_4.checked = false then		// 횟수계
//		arg_dw  = dw_7
//	else
//		arg_dw  = dw_9
//	end if
//else											// 집계현황
//	arg_dw  = dw_1
//end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_apoiup_m
integer x = 32
integer y = 228
integer width = 4393
integer height = 184
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

