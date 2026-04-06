$PBExportHeader$w_ippurcancel_m.srw
$PBExportComments$확정된 발주취소(1998/10/17,곽용덕)
forward
global type w_ippurcancel_m from w_inheritance
end type
type dw_3 from datawindow within w_ippurcancel_m
end type
type dw_4 from datawindow within w_ippurcancel_m
end type
type dw_11 from datawindow within w_ippurcancel_m
end type
type em_s from editmask within w_ippurcancel_m
end type
type em_e from editmask within w_ippurcancel_m
end type
type dw_area from datawindow within w_ippurcancel_m
end type
type st_1 from statictext within w_ippurcancel_m
end type
end forward

global type w_ippurcancel_m from w_inheritance
integer y = 100
integer width = 3945
integer height = 2224
string title = "확정발주 취소관리(w_ippurcancel_m)"
dw_3 dw_3
dw_4 dw_4
dw_11 dw_11
em_s em_s
em_e em_e
dw_area dw_area
st_1 st_1
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
this.dw_11=create dw_11
this.em_s=create em_s
this.em_e=create em_e
this.dw_area=create dw_area
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_11
this.Control[iCurrent+4]=this.em_s
this.Control[iCurrent+5]=this.em_e
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_1
end on

on w_ippurcancel_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_11)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.dw_area)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

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

event resize;call super::resize;dw_2.width  = this.width  - 123
dw_2.height = this.height - 1108

end event

type pb_save from w_inheritance`pb_save within w_ippurcancel_m
boolean visible = false
integer x = 2949
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_ippurcancel_m
integer x = 1769
integer y = 308
integer width = 2071
integer height = 488
integer taborder = 90
string dataobject = "d_ippur1_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_ippurcancel_m
integer x = 37
integer y = 968
integer width = 3822
integer height = 1116
integer taborder = 110
string dataobject = "d_ippurdet_t"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ippurcancel_m
integer x = 37
integer y = 52
integer width = 1440
string text = "확정발주 취소관리"
end type

type st_tips from w_inheritance`st_tips within w_ippurcancel_m
end type

type pb_compute from w_inheritance`pb_compute within w_ippurcancel_m
integer x = 3442
integer y = 60
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

long   ll_row, i, ll_cnt, k
string ls_order, ls_order1, ls_item, ls_item1, ls_qa
real   lr_diff,  lr_qty

dw_1.accepttext()
if dw_1.rowcount() < 1 then return

if trim(dw_1.object.po_print[1]) = 'N' then
	MessageBox("경고", "[pb_compute][dw_1] 벌써, 취소되었읍니다.", Exclamation!)
	return
end if

ls_order = dw_1.object.order_no[1]
select count(*) into :ll_cnt from inspdet where pur_no = :ls_order;
if ll_cnt > 0 then
	MessageBox("경고", "입고가 완료되었습니다. 입고취소후에 발주를 취소하십시요.", Exclamation!)
	return
end if

dw_1.object.po_print[1] = 'N'
if wf_update1(dw_1,"N") = false then
	dw_1.object.po_print[1] = 'Y'
else
	MessageBox('완료', '발주확정이 취소가 되었습니다')
end if

end event

type pb_print_part from w_inheritance`pb_print_part within w_ippurcancel_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurcancel_m
integer x = 3634
integer y = 60
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurcancel_m
integer x = 3250
integer y = 60
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
integer x = 3707
integer y = 832
integer width = 151
integer height = 120
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
integer x = 3058
integer y = 60
integer taborder = 190
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp
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

if dw_4.retrieve(ls_supp, 'Y', '%', ld_start_date, ld_end_date, 'H') < 1 then
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ippurcancel_m
integer x = 2414
integer y = 16
integer width = 585
integer height = 208
integer taborder = 120
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_ippurcancel_m
integer x = 1755
integer y = 264
integer width = 2107
integer height = 548
integer taborder = 130
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ippurcancel_m
integer x = 3017
integer y = 16
integer width = 846
integer height = 208
integer taborder = 80
integer weight = 400
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
integer x = 37
integer y = 288
integer width = 1705
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

event rowfocuschanged;if this.getrow() < 1 then return

string ls_order

ls_order = trim(this.object.order_no[this.getrow()])

dw_1.retrieve(ls_order)
dw_2.retrieve(ls_order)

end event

type dw_11 from datawindow within w_ippurcancel_m
integer x = 37
integer y = 204
integer width = 1029
integer height = 80
integer taborder = 50
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_4.reset()
end event

type em_s from editmask within w_ippurcancel_m
integer x = 1115
integer y = 204
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_e from editmask within w_ippurcancel_m
integer x = 1495
integer y = 204
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_ippurcancel_m
integer x = 2446
integer y = 100
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
integer x = 2496
integer y = 832
integer width = 1193
integer height = 120
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

