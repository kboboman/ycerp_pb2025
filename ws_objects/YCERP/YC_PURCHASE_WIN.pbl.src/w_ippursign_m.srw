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
type st_3 from statictext within w_ippursign_m
end type
type gb_4 from groupbox within w_ippursign_m
end type
type dw_11 from datawindow within w_ippursign_m
end type
type st_vertical from u_splitbar_vertical within w_ippursign_m
end type
type st_horizontal from u_splitbar_horizontal within w_ippursign_m
end type
type st_4 from statictext within w_ippursign_m
end type
type ddlb_fld from dropdownlistbox within w_ippursign_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ippursign_m
end type
type st_7 from statictext within w_ippursign_m
end type
type ddlb_op from dropdownlistbox within w_ippursign_m
end type
type sle_value from singlelineedit within w_ippursign_m
end type
type cb_19 from commandbutton within w_ippursign_m
end type
type cb_20 from commandbutton within w_ippursign_m
end type
type cb_21 from commandbutton within w_ippursign_m
end type
type cb_22 from commandbutton within w_ippursign_m
end type
end forward

global type w_ippursign_m from w_inheritance
integer width = 4110
integer height = 2212
string title = "발주확정 관리(w_ippursign_m)"
dw_3 dw_3
em_e em_e
em_s em_s
dw_4 dw_4
dw_area dw_area
dw_5 dw_5
st_1 st_1
st_2 st_2
st_3 st_3
gb_4 gb_4
dw_11 dw_11
st_vertical st_vertical
st_horizontal st_horizontal
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
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
this.dw_4=create dw_4
this.dw_area=create dw_area
this.dw_5=create dw_5
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.gb_4=create gb_4
this.dw_11=create dw_11
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_e
this.Control[iCurrent+3]=this.em_s
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.gb_4
this.Control[iCurrent+11]=this.dw_11
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.st_horizontal
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.ddlb_fld
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_19
this.Control[iCurrent+21]=this.cb_20
this.Control[iCurrent+22]=this.cb_21
this.Control[iCurrent+23]=this.cb_22
end on

on w_ippursign_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_e)
destroy(this.em_s)
destroy(this.dw_4)
destroy(this.dw_area)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.gb_4)
destroy(this.dw_11)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

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
gb_4.width  = newwidth  - (gb_4.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_4.x

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_4.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_4.x * 2)
dw_2.height = newheight - dw_2.y - gb_4.x

end event

type pb_save from w_inheritance`pb_save within w_ippursign_m
boolean visible = false
integer x = 2949
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_ippursign_m
integer x = 2528
integer y = 452
integer width = 1504
integer height = 588
integer taborder = 100
string dataobject = "d_ippur1_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_ippursign_m
integer x = 32
integer y = 24
integer width = 914
integer height = 132
string text = "발주확정 관리"
end type

type st_tips from w_inheritance`st_tips within w_ippursign_m
end type

type pb_compute from w_inheritance`pb_compute within w_ippursign_m
integer x = 3557
integer y = 64
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
integer x = 3749
integer y = 64
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippursign_m
integer x = 3365
integer y = 64
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
integer x = 3173
integer y = 64
integer taborder = 190
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp
date   ld_sdate, ld_edate

ls_supp = trim(dw_11.object.supp_no[dw_11.getrow()])
if isnull(ls_supp) OR ls_supp = "" then ls_supp = "%"

ld_sdate = date(em_s.text)
ld_edate = date(em_e.text)

dw_1.reset() ; dw_2.reset() ; dw_3.reset()

dw_4.retrieve(ls_supp, 'N', '%', ld_sdate, ld_edate, LeftA(dw_area.object.area[1],1))
if dw_4.rowcount() < 1 then
	MessageBox("확인","해당하는 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ippursign_m
integer x = 978
integer y = 16
integer width = 1321
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ippursign_m
integer x = 2313
integer y = 16
integer width = 800
integer height = 216
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ippursign_m
integer x = 3131
integer y = 16
integer width = 846
integer height = 216
integer taborder = 90
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ippursign_m
integer x = 32
integer y = 1092
integer width = 4000
integer height = 988
integer taborder = 110
string dataobject = "d_ippurdet_t"
boolean hscrollbar = true
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
		
		dw_5.dataobject = 'd_orsale_print2'
		dw_5.settransobject(sqlca)
//		ls_dw5sql = dw_5.describe("datawindow.table.select")
		
//		ls_where = " and sale.order_no = ~~'" + ls_sale_orderno + "~~'"
//		ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
			
//		dw_5.modify(ls_sql)
//		dw_5.retrieve( ls_scenehp )

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

type dw_3 from datawindow within w_ippursign_m
integer x = 50
integer y = 176
integer width = 96
integer height = 76
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ippurchase_r"
boolean livescroll = true
end type

type em_e from editmask within w_ippursign_m
integer x = 2715
integer y = 140
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

end event

type em_s from editmask within w_ippursign_m
integer x = 2345
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

end event

type dw_4 from datawindow within w_ippursign_m
integer x = 32
integer y = 452
integer width = 2432
integer height = 588
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_whpur_s_2"
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

type dw_area from datawindow within w_ippursign_m
integer x = 1262
integer y = 56
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
integer x = 155
integer y = 176
integer width = 96
integer height = 76
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type st_1 from statictext within w_ippursign_m
integer x = 1006
integer y = 56
integer width = 251
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

type st_2 from statictext within w_ippursign_m
integer x = 2345
integer y = 56
integer width = 736
integer height = 80
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

type st_3 from statictext within w_ippursign_m
integer x = 1006
integer y = 140
integer width = 251
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

type gb_4 from groupbox within w_ippursign_m
integer x = 32
integer y = 252
integer width = 4000
integer height = 184
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_11 from datawindow within w_ippursign_m
integer x = 1262
integer y = 136
integer width = 1029
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_4.reset()
end event

type st_vertical from u_splitbar_vertical within w_ippursign_m
integer x = 2482
integer y = 448
integer height = 592
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_ippursign_m
integer x = 32
integer y = 1056
integer width = 4000
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type st_4 from statictext within w_ippursign_m
integer x = 73
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_ippursign_m
integer x = 251
integer y = 316
integer width = 393
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
end type

type ddlb_dwtitles from dropdownlistbox within w_ippursign_m
integer x = 274
integer y = 324
integer width = 270
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

type st_7 from statictext within w_ippursign_m
integer x = 667
integer y = 336
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

type ddlb_op from dropdownlistbox within w_ippursign_m
integer x = 850
integer y = 316
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

type sle_value from singlelineedit within w_ippursign_m
integer x = 1152
integer y = 320
integer width = 475
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_19 from commandbutton within w_ippursign_m
integer x = 1637
integer y = 320
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_ippursign_m
integer x = 1801
integer y = 320
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_21 from commandbutton within w_ippursign_m
integer x = 1966
integer y = 320
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_ippursign_m
integer x = 2130
integer y = 320
integer width = 160
integer height = 76
integer taborder = 130
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

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

