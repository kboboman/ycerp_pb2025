$PBExportHeader$w_apoiup_m.srw
$PBExportComments$자재매입수정 및 취소(1999/05/31, 이인호)
forward
global type w_apoiup_m from w_inheritance
end type
type dw_3 from datawindow within w_apoiup_m
end type
type gb_7 from groupbox within w_apoiup_m
end type
type gb_6 from groupbox within w_apoiup_m
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
type st_1 from statictext within w_apoiup_m
end type
type dw_area from datawindow within w_apoiup_m
end type
type gb_4 from groupbox within w_apoiup_m
end type
end forward

global type w_apoiup_m from w_inheritance
integer x = 37
integer y = 136
integer width = 3611
integer height = 2196
string title = "매입관리 수정및취소(w_apoiup_m)"
boolean resizable = false
dw_3 dw_3
gb_7 gb_7
gb_6 gb_6
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
em_1 em_1
em_2 em_2
st_1 st_1
dw_area dw_area
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
this.gb_7=create gb_7
this.gb_6=create gb_6
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_area=create dw_area
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_7
this.Control[iCurrent+3]=this.gb_6
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.dw_6
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.em_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.dw_area
this.Control[iCurrent+11]=this.gb_4
end on

on w_apoiup_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

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

em_1.text = string(today(),'yyyy/mm/dd')
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
dw_4.width  = this.width  - 82
dw_4.height = this.height - 904

end event

type pb_save from w_inheritance`pb_save within w_apoiup_m
integer x = 3154
integer y = 40
integer taborder = 120
boolean enabled = false
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;if dw_2.rowcount() < 1 then return

dw_2.accepttext()
if wf_update1(dw_2, 'Y') = false then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_apoiup_m
integer x = 55
integer y = 380
integer width = 859
integer height = 92
integer taborder = 50
string dataobject = "d_apsupp_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_apoiup_m
integer x = 1403
integer y = 208
integer width = 2162
integer height = 576
integer taborder = 60
string dataobject = "d_apoiup_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
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
integer x = 3346
integer y = 40
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
integer x = 2587
integer y = 40
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
integer x = 2962
integer y = 40
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
integer x = 969
integer y = 332
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
boolean visible = false
integer x = 965
integer y = 192
integer width = 2587
integer height = 616
integer taborder = 0
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_apoiup_m
integer x = 37
integer y = 332
integer width = 896
integer height = 144
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
string text = "구매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_apoiup_m
integer x = 2560
integer y = 0
integer width = 1006
integer taborder = 0
end type

type dw_3 from datawindow within w_apoiup_m
integer x = 50
integer y = 532
integer width = 1321
integer height = 240
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_apoiup_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
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

type gb_7 from groupbox within w_apoiup_m
integer x = 37
integer y = 180
integer width = 896
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "발행일자"
end type

type gb_6 from groupbox within w_apoiup_m
integer x = 37
integer y = 480
integer width = 1358
integer height = 300
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "세금계산서번호"
end type

type dw_4 from datawindow within w_apoiup_m
integer x = 37
integer y = 792
integer width = 3529
integer height = 1292
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_apoiup_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

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
integer x = 64
integer y = 236
integer width = 361
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

type em_2 from editmask within w_apoiup_m
integer x = 553
integer y = 236
integer width = 361
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

type st_1 from statictext within w_apoiup_m
integer x = 471
integer y = 248
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type dw_area from datawindow within w_apoiup_m
integer x = 1440
integer y = 68
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

type gb_4 from groupbox within w_apoiup_m
integer x = 1403
integer width = 599
integer height = 204
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

