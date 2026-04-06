$PBExportHeader$w_ippursign_m.srw
$PBExportComments$발주확정및발주서출력(1998/02/14,곽용덕)
forward
global type w_ippursign_m from w_inheritance
end type
type dw_3 from datawindow within w_ippursign_m
end type
type em_e from editmask within w_ippursign_m
end type
type em_s from editmask within w_ippursign_m
end type
type dw_11 from datawindow within w_ippursign_m
end type
type dw_4 from datawindow within w_ippursign_m
end type
type dw_area from datawindow within w_ippursign_m
end type
type dw_5 from datawindow within w_ippursign_m
end type
type st_1 from statictext within w_ippursign_m
end type
type st_2 from statictext within w_ippursign_m
end type
type gb_15 from groupbox within w_ippursign_m
end type
end forward

global type w_ippursign_m from w_inheritance
integer width = 4133
integer height = 2220
string title = "발주확정 관리(w_ippursign_m)"
dw_3 dw_3
em_e em_e
em_s em_s
dw_11 dw_11
dw_4 dw_4
dw_area dw_area
dw_5 dw_5
st_1 st_1
st_2 st_2
gb_15 gb_15
end type
global w_ippursign_m w_ippursign_m

type variables

st_print i_print
end variables

on w_ippursign_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_e=create em_e
this.em_s=create em_s
this.dw_11=create dw_11
this.dw_4=create dw_4
this.dw_area=create dw_area
this.dw_5=create dw_5
this.st_1=create st_1
this.st_2=create st_2
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_e
this.Control[iCurrent+3]=this.em_s
this.Control[iCurrent+4]=this.dw_11
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.gb_15
end on

on w_ippursign_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_e)
destroy(this.em_s)
destroy(this.dw_11)
destroy(this.dw_4)
destroy(this.dw_area)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.visible = false	// 발주서
dw_5.visible = false // 수주상황접수부

if GF_PERMISSION('발주확정_관리', gs_userid) = 'Y' then	
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if


pb_compute.enabled = false
if gs_userid = '1999010s' or gs_userid = 'sjh4279' or gs_userid = 'ash' then
	if gs_userid = 'ash' then
		dw_area.dataobject = 'd_wharea_s_sb'
	else
		dw_area.dataobject = 'd_wharea_s'
	end if
else
	dw_area.enabled = false
end if
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area


//20061211 발주확정은 심상철팀장만 가능하게 -> 권봉조부장으로변경(bj5879)
//20061212 발주확정은 서울은 심상철팀장, 시화는 신준현과장만 가능하게
//2007-08-02 사업장 변경권한 안수환부장 추가
//gs_userid = 'bj5879' or 
If gs_userid = '1999010s' or gs_userid = 'kgyoung'   or gs_userid = '19981214' &
or gs_userid = 'sjh4279' or gs_userid = 'yijong' or gs_userid = 'baeyj' or gs_userid = 'ls990829' Then
	pb_compute.enabled = true
End If

IF gs_userid = 'kgyoung' or gs_userid = '19981214' Then
	dw_4.dataobject = 'd_whpur_s_1' 
ElseIF gs_userid = 'sjh4279' or gs_userid = 'ash' or gs_userid = 'baeyj' or gs_userid = 'ls990829' Then
	dw_4.dataobject = 'd_whpur_s_2'
End If

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_11.settransobject(sqlca)
dw_11.insertrow(0)

em_s.text = string(today(), "yyyy/mm/dd")
em_e.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - 87
gb_3.height = newheight - 900

dw_2.width  = newwidth  - 137
dw_2.height = newheight - 984

end event

type pb_save from w_inheritance`pb_save within w_ippursign_m
boolean visible = false
integer x = 2949
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_ippursign_m
integer x = 1957
integer y = 340
integer width = 2075
integer height = 484
integer taborder = 100
string dataobject = "d_ippur1_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_ippursign_m
integer x = 64
integer y = 920
integer width = 3959
integer height = 1132
integer taborder = 110
string dataobject = "d_ippurdet_t"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::doubleclicked;call super::doubleclicked;	
CHOOSE CASE dwo.name

//20070110 수주장 출력
	CASE 'purdet_sale_no'		
//		ws_process st_process
//		string ls_sale
//		
//		st_process.sale_no     = this.object.sale_no[row]
//		OpenWithParm(w_whsaledodet_w, st_process)	
		w_repsuper w_print
		st_print l_print
		string ls_where, ls_sql, ls_dw5sql, ls_sale_orderno
		
		ls_sale_orderno = this.object.purdet_sale_no[row]
		If ls_sale_orderno = '' Or isnull(ls_sale_orderno) Then
			return
		End If

		string ls_scenehp
		if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
			ls_scenehp = "Y"
		else
			ls_scenehp = ""
		end if
		
//		dw_5.dataobject = 'd_orsale_print2'
//		dw_5.settransobject(sqlca)
//		ls_dw5sql = dw_5.describe("datawindow.table.select")
//		
//		ls_where = " and sale.order_no = ~~'" + ls_sale_orderno + "~~'"
//		ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//			
//		dw_5.modify(ls_sql)
//		dw_5.retrieve( ls_scenehp )

		dw_5.dataobject = 'd_orsale_print2'
		dw_5.settrans( sqlca)
	
		dw_5.retrieve( ls_scenehp, ls_sale_orderno,  ls_sale_orderno, '%')

		
		l_print.st_datawindow = dw_5
		l_print.st_print_sheet = " 프린트용지 : A5"
		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
									 'Datawindow.Zoom=100'
		
		// LANDSCAPE:1, PORTRAIT:2
		// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
		
		opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
END CHOOSE

end event

type st_title from w_inheritance`st_title within w_ippursign_m
integer x = 78
integer y = 44
integer width = 1253
string text = "발주확정 관리"
end type

type st_tips from w_inheritance`st_tips within w_ippursign_m
end type

type pb_compute from w_inheritance`pb_compute within w_ippursign_m
integer x = 3621
integer y = 72
integer taborder = 140
boolean enabled = false
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"확정",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event pb_compute::clicked;long ll_row,i,ll_cnt,k
string ls_order,ls_order1,ls_item,ls_item1,ls_qa
real lr_diff,lr_qty

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
dw_1.accepttext()
if dw_1.rowcount() < 1 then return
if trim(dw_1.object.po_print[1]) = 'Y' then
	MessageBox("경고", "[pb_compute][dw_1] 벌써, 확정되었읍니다.", Exclamation!)
	return
end if

dw_1.object.po_print[1] = 'Y'
if wf_update1(dw_1,"Y") = false then
	dw_1.object.po_print[1] = 'N'
end if
end event

type pb_print_part from w_inheritance`pb_print_part within w_ippursign_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippursign_m
integer x = 3813
integer y = 72
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippursign_m
integer x = 3429
integer y = 72
integer taborder = 160
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
long ll_row,ll_mod,i

string ls_order, ls_flag
dwItemStatus l_status

if dw_1.rowcount() < 1 then return

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
			for i = ll_mod + 1 to 8
				 dw_3.insertrow(0)
			next
		end if
	CASE ELSE
		ll_mod = Mod(ll_row, 11)
		if ll_mod <> 0 then
			for i = ll_mod to 11
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

type pb_cancel from w_inheritance`pb_cancel within w_ippursign_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_ippursign_m
boolean visible = false
integer x = 2757
integer y = 56
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_ippursign_m
boolean visible = false
integer x = 2565
integer y = 56
integer taborder = 200
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippursign_m
integer x = 3237
integer y = 72
integer taborder = 190
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp
date  ld_start_date, ld_end_date

ls_supp = trim(dw_11.object.supp_no[dw_11.getrow()])
if ls_supp = '' or isnull(ls_supp) then
	ls_supp = "%"
end if 
ld_start_date = date(em_s.text)
ld_end_date   = date(em_e.text)
if not isdate(em_s.text) then
	beep(1)
	em_s.setfocus()
	return
end if
if not isdate(em_e.text) then
	beep(1)
	em_e.setfocus()
	return
end if

dw_1.reset()
dw_2.reset()
dw_3.reset()

if dw_4.retrieve(ls_supp, 'N', '%', ld_start_date, ld_end_date, LeftA(dw_area.object.area[1],1)) < 1 then
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
end if

//20061212 서울은 심상철팀장 시화는 신준현과장 확정가능
//If gs_userid = 'ssch3015' Then
//	dw_4.setfilter("pur_buyer in ('960626','etwas','plh')")
//	dw_4.filter()
//	If dw_4.getrow() = 0 Then
//		dw_1.reset()
//		dw_2.reset()
//		dw_3.reset()
//		dw_4.reset()
//	End If
//ElseIf gs_userid = 'sjh4279' Then
//	dw_4.setfilter("pur_buyer in ('ybs','jclee','bestvic')")		
//	dw_4.filter()
//	If dw_4.getrow() < 1 Then
//		dw_1.reset()
//		dw_2.reset()
//		dw_3.reset()
//		dw_4.reset()
//	End If	
//End If
end event

type gb_3 from w_inheritance`gb_3 within w_ippursign_m
integer x = 37
integer y = 860
integer width = 4009
integer height = 1216
integer taborder = 120
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "발주내역"
end type

type gb_2 from w_inheritance`gb_2 within w_ippursign_m
integer x = 1934
integer y = 300
integer width = 2107
integer height = 544
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ippursign_m
integer x = 3195
integer y = 28
integer width = 846
integer taborder = 90
end type

type dw_3 from datawindow within w_ippursign_m
integer x = 1088
integer y = 8
integer width = 96
integer height = 76
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ippurchase_r"
boolean livescroll = true
end type

type em_e from editmask within w_ippursign_m
integer x = 2752
integer y = 60
integer width = 366
integer height = 76
integer taborder = 50
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

type em_s from editmask within w_ippursign_m
integer x = 2341
integer y = 60
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

type dw_11 from datawindow within w_ippursign_m
integer x = 2112
integer y = 140
integer width = 1029
integer height = 80
integer taborder = 80
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_4.reset()
end event

type dw_4 from datawindow within w_ippursign_m
integer x = 50
integer y = 320
integer width = 1870
integer height = 520
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_whpur_s_2"
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

type dw_area from datawindow within w_ippursign_m
integer x = 1573
integer y = 140
integer width = 526
integer height = 84
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type dw_5 from datawindow within w_ippursign_m
integer x = 1193
integer y = 8
integer width = 96
integer height = 76
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type st_1 from statictext within w_ippursign_m
integer x = 1573
integer y = 60
integer width = 526
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ippursign_m
integer x = 2112
integer y = 60
integer width = 224
integer height = 76
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

type gb_15 from groupbox within w_ippursign_m
integer x = 1527
integer y = 28
integer width = 1650
integer height = 204
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

