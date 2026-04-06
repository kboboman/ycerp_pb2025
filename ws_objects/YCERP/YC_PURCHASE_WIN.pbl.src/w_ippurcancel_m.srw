$PBExportHeader$w_ippurcancel_m.srw
$PBExportComments$확정된 발주취소(1998/10/17,곽용덕)
forward
global type w_ippurcancel_m from w_inheritance
end type
type dw_3 from datawindow within w_ippurcancel_m
end type
type dw_4 from datawindow within w_ippurcancel_m
end type
type em_s from editmask within w_ippurcancel_m
end type
type em_e from editmask within w_ippurcancel_m
end type
type dw_area from datawindow within w_ippurcancel_m
end type
type st_1 from statictext within w_ippurcancel_m
end type
type st_2 from statictext within w_ippurcancel_m
end type
type st_3 from statictext within w_ippurcancel_m
end type
type gb_4 from groupbox within w_ippurcancel_m
end type
type dw_11 from datawindow within w_ippurcancel_m
end type
type st_4 from statictext within w_ippurcancel_m
end type
type st_5 from statictext within w_ippurcancel_m
end type
type ddlb_fld from dropdownlistbox within w_ippurcancel_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ippurcancel_m
end type
type st_7 from statictext within w_ippurcancel_m
end type
type ddlb_op from dropdownlistbox within w_ippurcancel_m
end type
type sle_value from singlelineedit within w_ippurcancel_m
end type
type cb_19 from commandbutton within w_ippurcancel_m
end type
type cb_20 from commandbutton within w_ippurcancel_m
end type
type cb_21 from commandbutton within w_ippurcancel_m
end type
type cb_22 from commandbutton within w_ippurcancel_m
end type
type st_vertical from u_splitbar_vertical within w_ippurcancel_m
end type
type st_horizontal from u_splitbar_horizontal within w_ippurcancel_m
end type
end forward

global type w_ippurcancel_m from w_inheritance
integer y = 100
integer width = 4462
integer height = 2284
string title = "확정발주 취소관리(w_ippurcancel_m)"
dw_3 dw_3
dw_4 dw_4
em_s em_s
em_e em_e
dw_area dw_area
st_1 st_1
st_2 st_2
st_3 st_3
gb_4 gb_4
dw_11 dw_11
st_4 st_4
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
st_vertical st_vertical
st_horizontal st_horizontal
end type
global w_ippurcancel_m w_ippurcancel_m

type variables

st_print i_print
end variables

on w_ippurcancel_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_s=create em_s
this.em_e=create em_e
this.dw_area=create dw_area
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.gb_4=create gb_4
this.dw_11=create dw_11
this.st_4=create st_4
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.em_s
this.Control[iCurrent+4]=this.em_e
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.gb_4
this.Control[iCurrent+10]=this.dw_11
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.st_7
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_19
this.Control[iCurrent+19]=this.cb_20
this.Control[iCurrent+20]=this.cb_21
this.Control[iCurrent+21]=this.cb_22
this.Control[iCurrent+22]=this.st_vertical
this.Control[iCurrent+23]=this.st_horizontal
end on

on w_ippurcancel_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.gb_4)
destroy(this.dw_11)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.st_vertical)
destroy(this.st_horizontal)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
/////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false


datawindowchild   ldwc_area

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//IF gs_userid = 'ssch3015' Then
//	dw_4.dataobject = 'd_whpur_s_1' 
//ElseIF gs_userid = 'sjh4279' Then
//	dw_4.dataobject = 'd_whpur_s_2'
//End If

dw_11.settransobject(sqlca)
dw_11.insertrow(0)

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

em_s.text = string(today(), "yyyy/mm/dd")
em_e.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_4.x

st_horizontal.y     = dw_4.y + dw_4.height
st_horizontal.width = newwidth  - (gb_4.x * 2)

dw_2.width  = newwidth  - (gb_4.x * 2)
dw_2.height = newheight - dw_2.y - gb_4.x

end event

type pb_save from w_inheritance`pb_save within w_ippurcancel_m
boolean visible = false
integer x = 2949
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_ippurcancel_m
integer x = 2318
integer y = 428
integer width = 2071
integer height = 664
integer taborder = 90
string dataobject = "d_ippur1_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_ippurcancel_m
integer x = 32
integer y = 28
integer width = 1166
integer height = 132
string text = "확정발주 취소관리"
end type

type st_tips from w_inheritance`st_tips within w_ippurcancel_m
end type

type pb_compute from w_inheritance`pb_compute within w_ippurcancel_m
integer x = 3826
integer y = 64
integer taborder = 140
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"확정취소",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row,i,ll_cnt,k
string ls_order,ls_order1,ls_item,ls_item1,ls_qa
real lr_diff,lr_qty

dw_1.accepttext()
if dw_1.rowcount() < 1 then return
if trim(dw_1.object.po_print[1]) = 'N' then
	MessageBox("경고", "[pb_compute][dw_1] 벌써, 취소되었읍니다.", Exclamation!)
	return
end if

ls_order = dw_1.object.order_no[1]
select count(*) into :ll_cnt from inspdet
 where pur_no = :ls_order;
if ll_cnt > 0 then
	MessageBox("경고", "입고가 완료되었습니다. 입고취소후에 발주를 취소하십시요.", Exclamation!)
	return
end if
dw_1.object.po_print[1] = 'N'
if wf_update1(dw_1,"N") = false then
	dw_1.object.po_print[1] = 'Y'
else
	MESSAGEBOX('완료', '발주확정이 취소가 되었습니다')
end if
end event

type pb_print_part from w_inheritance`pb_print_part within w_ippurcancel_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurcancel_m
integer x = 4018
integer y = 64
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurcancel_m
integer x = 3634
integer y = 64
integer taborder = 160
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
long ll_row,ll_mod,i
string ls_order, ls_flag

if dw_1.rowcount() < 1 then return

//20061211 발주확정되지않으면 출력불가
if dw_1.object.po_print[1] = "N" then
	messagebox("확인","발주서가 확정이 되지 않았읍니다")
	return
end if

ls_order = dw_1.object.order_no[1]

ls_flag = dw_1.object.subcon[1]
CHOOSE CASE ls_flag
	CASE "P"
		dw_3.dataobject = 'd_ippurchase_r2'
	CASE "J"
		dw_3.dataobject = 'd_ippurchase_r3'
	CASE ELSE
		dw_3.dataobject = 'd_ippurchase_r'
END CHOOSE
dw_3.settransobject(sqlca)

dw_3.retrieve(ls_order)
ll_row = dw_3.rowcount()
CHOOSE CASE ls_flag
	CASE "J","P"
		ll_mod = Mod(ll_row , 8)
		if ll_mod <> 0 then
			for i = 1 to 8 - ll_mod
				 dw_3.insertrow(0)
			next
		end if
	CASE ELSE
		ll_mod = Mod(ll_row, 12)
		if ll_mod <> 0 then
			for i = 1 to 12 - ll_mod
				 dw_3.insertrow(0)
			next
		end if
END CHOOSE



i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 발주서를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurcancel_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_ippurcancel_m
integer x = 3758
integer y = 288
integer width = 151
integer height = 100
integer taborder = 180
end type

event pb_delete::clicked;//
string ls_order, ls_product_no, ls_pur_type
long   ll_row,   ll_cnt, ll_seq

ll_row = dw_2.getrow()
if ll_row < 1 then return

ls_order = dw_2.object.order_no[ll_row]
ll_seq   = dw_2.object.seq_no[ll_row]
ls_pur_type   = dw_2.object.pur_type[ll_row]
ls_product_no = dw_2.object.product_no[ll_row]

select count(*) into :ll_cnt from inspdet
 where pur_no = :ls_order and seq_no = :ll_seq;
if ll_cnt > 0 then
	MessageBox("경고", "입고가 완료되었습니다. 입고취소후에 발주를 삭제하십시요.", Exclamation!)
	return
end if
if MessageBox('확인','발주내역 상세를 삭제하시겠습니까?~r~n'&
					+ '(*주의1 같은 원코일 로트번호에 의한 스리팅(혹은 SHEET) 자료도 같이 삭제됩니다)~r~n'&
					+ '(*주의2 선택하신 발주내역이 영구히 삭제됩니다.)', Exclamation!, OKCancel!, 2) = 2 then
	return
end if

dw_2.deleterow(ll_row)
if ls_pur_type = 'C' then
	for ll_row = dw_2.rowcount() to 1 step -1
		if ls_product_no = dw_2.object.product_no[ll_row] then
			dw_2.deleterow(ll_row)
		end if
	next
	
	UPDATE COILORDERDET SET proc_flag = 'M'
	 WHERE ORDER_NO = :ls_product_no AND proc_flag <> 'M';
	 if sqlca.sqlcode < 0 then
		 MessageBox('오류','COILORDERDET UPDATE수행중 오류가 발생하였습니다.',exclamation!)
		 rollback;
		 return
	 end if
end if

if dw_2.rowcount() < 1 then
	dw_1.deleterow(1)
	MessageBox("확인","선택하신 발주서가 삭제됩니다.",exclamation!)
end if

if wf_update2(dw_1, dw_2,"Y") = true then
	pb_retrieve.postevent(clicked!)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_ippurcancel_m
boolean visible = false
integer x = 2565
integer y = 56
integer taborder = 200
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurcancel_m
integer x = 3442
integer y = 64
integer taborder = 190
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp, ls_area
date   ld_start_date, ld_end_date

ls_supp = trim(dw_11.object.supp_no[dw_11.getrow()])
if ls_supp = '' or isnull(ls_supp) then
	ls_supp = "%"
end if 

ld_start_date = date(em_s.text)
ld_end_date   = date(em_e.text)
if Not isdate(em_s.text) then
	em_s.setfocus()
	return
end if

if Not isdate(em_e.text) then
	em_e.setfocus()
	return
end if


//ls_area = left(dw_area.object.area[1],1)

if dw_4.retrieve(ls_supp, 'Y', '%', ld_start_date, ld_end_date, 'S') < 1 then
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ippurcancel_m
integer x = 1253
integer y = 16
integer width = 1321
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ippurcancel_m
integer x = 2592
integer y = 16
integer width = 800
integer height = 216
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ippurcancel_m
integer x = 3410
integer y = 16
integer width = 827
integer height = 216
integer taborder = 80
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ippurcancel_m
integer x = 32
integer y = 1140
integer width = 4352
integer height = 1012
integer taborder = 110
string dataobject = "d_ippurdet_t"
boolean hscrollbar = true
end type

type dw_3 from datawindow within w_ippurcancel_m
boolean visible = false
integer x = 1714
integer y = 56
integer width = 160
integer height = 160
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ippurchase_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_ippurcancel_m
integer x = 32
integer y = 428
integer width = 2231
integer height = 668
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_whpur_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
if this.getrow() < 1 then return

string ls_order

ls_order = trim(this.object.order_no[this.getrow()])
dw_1.retrieve(ls_order)
dw_2.retrieve(ls_order)

end event

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type em_s from editmask within w_ippurcancel_m
integer x = 2619
integer y = 140
integer width = 366
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_s.text
lstr_calendar.edate = em_e.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_s.text = lstr_calendar.sdate
	em_e.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_e from editmask within w_ippurcancel_m
integer x = 2994
integer y = 140
integer width = 366
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_s.text
lstr_calendar.edate = em_e.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_s.text = lstr_calendar.sdate
	em_e.text = lstr_calendar.edate
end if
//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_area from datawindow within w_ippurcancel_m
integer x = 1536
integer y = 56
integer width = 526
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_1 from statictext within w_ippurcancel_m
integer x = 2528
integer y = 288
integer width = 1193
integer height = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "아래 발주서의 품목이 한건도 없으면 발주서가 삭제 됩니다.=>"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ippurcancel_m
integer x = 1275
integer y = 56
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ippurcancel_m
integer x = 1275
integer y = 140
integer width = 256
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_ippurcancel_m
integer x = 32
integer y = 244
integer width = 4357
integer height = 164
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_11 from datawindow within w_ippurcancel_m
integer x = 1531
integer y = 136
integer width = 1015
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_4.reset()
end event

type st_4 from statictext within w_ippurcancel_m
integer x = 2619
integer y = 56
integer width = 741
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "발주일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ippurcancel_m
integer x = 82
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_ippurcancel_m
integer x = 261
integer y = 300
integer width = 430
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
string item[] = {""}
end type

type ddlb_dwtitles from dropdownlistbox within w_ippurcancel_m
integer x = 306
integer y = 308
integer width = 256
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

type st_7 from statictext within w_ippurcancel_m
integer x = 699
integer y = 316
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

type ddlb_op from dropdownlistbox within w_ippurcancel_m
integer x = 882
integer y = 300
integer width = 293
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ippurcancel_m
integer x = 1184
integer y = 304
integer width = 562
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_19 from commandbutton within w_ippurcancel_m
integer x = 1755
integer y = 304
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

arg_dw  = dw_4
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_ippurcancel_m
integer x = 1920
integer y = 304
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

arg_dw  = dw_4

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_21 from commandbutton within w_ippurcancel_m
integer x = 2085
integer y = 304
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

arg_dw  = dw_4
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_ippurcancel_m
integer x = 2249
integer y = 304
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

arg_dw  = dw_4
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_ippurcancel_m
integer x = 2277
integer y = 428
integer height = 668
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_ippurcancel_m
integer x = 32
integer y = 1108
integer width = 4352
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

