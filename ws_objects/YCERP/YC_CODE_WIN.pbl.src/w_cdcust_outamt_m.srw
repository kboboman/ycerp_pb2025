$PBExportHeader$w_cdcust_outamt_m.srw
$PBExportComments$운송차량관리(2001/03/15,이인호)
forward
global type w_cdcust_outamt_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdcust_outamt_m
end type
type st_8 from statictext within w_cdcust_outamt_m
end type
type ddlb_fld from dropdownlistbox within w_cdcust_outamt_m
end type
type st_9 from statictext within w_cdcust_outamt_m
end type
type sle_value from singlelineedit within w_cdcust_outamt_m
end type
type cb_filteron from commandbutton within w_cdcust_outamt_m
end type
type cb_filteroff from commandbutton within w_cdcust_outamt_m
end type
type cb_1 from commandbutton within w_cdcust_outamt_m
end type
type cb_2 from commandbutton within w_cdcust_outamt_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdcust_outamt_m
end type
type st_2 from statictext within w_cdcust_outamt_m
end type
type dw_salesman from datawindow within w_cdcust_outamt_m
end type
type st_1 from statictext within w_cdcust_outamt_m
end type
type em_1 from editmask within w_cdcust_outamt_m
end type
type dw_3 from datawindow within w_cdcust_outamt_m
end type
type cbx_1 from checkbox within w_cdcust_outamt_m
end type
type pb_2 from picturebutton within w_cdcust_outamt_m
end type
type cb_import from commandbutton within w_cdcust_outamt_m
end type
type ddlb_op from dropdownlistbox within w_cdcust_outamt_m
end type
end forward

global type w_cdcust_outamt_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3991
string title = "거래처 외형관리(w_cdcust_outamt_m)"
cb_3 cb_3
st_8 st_8
ddlb_fld ddlb_fld
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
dw_salesman dw_salesman
st_1 st_1
em_1 em_1
dw_3 dw_3
cbx_1 cbx_1
pb_2 pb_2
cb_import cb_import
ddlb_op ddlb_op
end type
global w_cdcust_outamt_m w_cdcust_outamt_m

type variables
//
st_print i_print

string   is_dw
DataWindowChild idwc_user, idwc_cust


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_3.visible = false
dw_3.SetTransObject(sqlca)

//
em_1.text  = string( year(today()) )

// 담당자
dw_salesman.settransobject(sqlca)	// 담당자별 거래처
dw_salesman.insertrow(1)
dw_salesman.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_salesman.object.user[1] = '%'

//
string ls_mon
long   ll_row, ll_mon

for ll_row = 8 to 20
	ll_mon  = ll_mon + 1
	ls_mon  = string(ll_mon)
	
   dw_1.Modify("s_rate"+ls_mon+"_t.text = '"+ls_mon+".비중'")
	dw_1.Modify("s_amt" +ls_mon+"_t.text = '"+ls_mon+".금액'")
	dw_1.Modify("s_rate"+ls_mon+".width=256")
	dw_1.Modify("s_amt" +ls_mon+".width=256")

	//
	if mod(ll_mon, 2) = 0 then
		dw_1.Modify("s_rate"+ls_mon+"_t.Background.color="+string(rgb(198,195,198))+"" )
		dw_1.Modify("s_amt" +ls_mon+"_t.Background.color="+string(rgb(198,195,198))+"" )
	else
		dw_1.Modify("s_rate"+ls_mon+"_t.Background.color="+string(rgb(235,235,235))+"" )
		dw_1.Modify("s_amt" +ls_mon+"_t.Background.color="+string(rgb(235,235,235))+"" )
	end if
next

end event

on w_cdcust_outamt_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.dw_salesman=create dw_salesman
this.st_1=create st_1
this.em_1=create em_1
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.pb_2=create pb_2
this.cb_import=create cb_import
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_filteron
this.Control[iCurrent+7]=this.cb_filteroff
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.dw_salesman
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.em_1
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.pb_2
this.Control[iCurrent+18]=this.cb_import
this.Control[iCurrent+19]=this.ddlb_op
end on

on w_cdcust_outamt_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.dw_salesman)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.pb_2)
destroy(this.cb_import)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_cdcust_outamt_m
integer x = 3022
integer y = 56
end type

event pb_save::clicked;//
dw_1.accepttext()

WF_Update1( dw_1, "Y" )

end event

type dw_1 from w_inheritance`dw_1 within w_cdcust_outamt_m
integer x = 27
integer y = 416
integer width = 3886
integer height = 1632
string dataobject = "d_cdcustomer_outamt"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rbuttondown;call super::rbuttondown;//
date  ld_sysdate

choose case dwo.name
	case "sys_date"
		OpenWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			ld_sysdate = date(message.stringparm)
			this.object.sys_date[row] = datetime( ld_sysdate, time("00:00:00") )
		end if

end choose



end event

type st_title from w_inheritance`st_title within w_cdcust_outamt_m
integer x = 0
integer y = 0
integer width = 1138
integer height = 140
string text = "거래처 외형관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcust_outamt_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcust_outamt_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcust_outamt_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcust_outamt_m
integer x = 3214
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcust_outamt_m
boolean visible = false
integer x = 2830
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

dw_1.ShareData( dw_2 )

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처 외형관리를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=96'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcust_outamt_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdcust_outamt_m
integer x = 2638
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;//
long   ll_row

dw_1.accepttext()
ll_row  = dw_1.getrow()

if ll_row < 1 then RETURN	

if MessageBox("확인",'삭제 하시겠습니까?',information!, OKCancel!, 2) = 2 then	RETURN

dw_1.deleterow( ll_row )
WF_Update1( dw_1, "Y" )


end event

type pb_insert from w_inheritance`pb_insert within w_cdcust_outamt_m
integer x = 2446
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;//
string   ls_custno, ls_cust_no, ls_custname, ls_salesman, ls_userid, ls_username
long     ll_row, ll_find, ll_year, ll_dw1cnt
datetime ldt_date

ll_year  = long(em_1.text)
ldt_date = datetime(date(string(ll_year) + "/01/01"), time("00:00:00"))

debugbreak()
//
dw_salesman.accepttext()
ls_salesman  = dw_salesman.object.user[1]
if isnull(ls_salesman) OR ls_salesman = "%" then RETURN

dw_3.retrieve( ls_salesman )
if dw_3.rowcount() < 1 then
	MessageBox("확인","해당하는 거래처가 존재하지 않습니다.")
	RETURN
end if

//
for ll_row = 1 to dw_3.rowcount()
	ls_userid    = dw_3.object.user_id[ll_row]
	ls_username  = dw_3.object.user_name[ll_row]
	ls_custno    = dw_3.object.cust_no[ll_row]
	ls_custname  = dw_3.object.cust_name[ll_row]

	ll_find  = dw_1.find( "cust_no = '" + ls_custno + "'", 1, dw_1.rowcount() )
	if ll_find > 0 then CONTINUE
	
	//
	ll_dw1cnt  = dw_1.insertrow(0)
	
	dw_1.object.cust_no[ll_dw1cnt]   = ls_custno
	dw_1.object.eom_year[ll_dw1cnt]  = ldt_date 
	dw_1.object.sys_date[ll_dw1cnt]  = GF_TODAY()

	dw_1.object.user_name[ll_dw1cnt] = ls_username 
	dw_1.object.cust_name[ll_dw1cnt] = ls_custname
next
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcust_outamt_m
integer x = 2254
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_salesman, ls_custno
long   ll_year

// 년도
ll_year  = long(em_1.text)

//
dw_salesman.accepttext()
ls_salesman  = dw_salesman.object.user[1]

//
ls_custno    = "%"

//
dw_1.reset()
dw_1.retrieve( ls_salesman, ls_custno, ll_year )


end event

type gb_3 from w_inheritance`gb_3 within w_cdcust_outamt_m
integer x = 1193
integer y = 16
integer width = 960
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdcust_outamt_m
integer x = 27
integer y = 232
integer width = 3886
integer height = 168
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcust_outamt_m
integer x = 2222
integer y = 16
integer width = 1211
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdcust_outamt_m
integer x = 55
integer y = 160
integer width = 142
integer height = 100
integer taborder = 60
string dataobject = "d_cdcustomer_outamt_r"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_cdcust_outamt_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;//string ls_bankid
//
//IF  ib_check = TRUE THEN
//    ls_bankid = "bank_id A"
//	 ib_check = FALSE
//ELSE
//    ls_bankid = "bank_id D"
//	 ib_check = TRUE
//END IF
//wf_sort(dw_1,ls_bankid)
//
end event

type st_8 from statictext within w_cdcust_outamt_m
integer x = 78
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_cdcust_outamt_m
integer x = 261
integer y = 288
integer width = 480
integer height = 580
integer taborder = 90
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

type st_9 from statictext within w_cdcust_outamt_m
integer x = 777
integer y = 308
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdcust_outamt_m
integer x = 1225
integer y = 292
integer width = 581
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdcust_outamt_m
integer x = 1819
integer y = 288
integer width = 197
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdcust_outamt_m
integer x = 2021
integer y = 288
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdcust_outamt_m
integer x = 2222
integer y = 288
integer width = 183
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_cdcust_outamt_m
integer x = 2409
integer y = 288
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type ddlb_dwtitles from dropdownlistbox within w_cdcust_outamt_m
integer x = 320
integer y = 304
integer width = 306
integer height = 92
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

type st_2 from statictext within w_cdcust_outamt_m
integer x = 1225
integer y = 56
integer width = 251
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_salesman from datawindow within w_cdcust_outamt_m
integer x = 1481
integer y = 124
integer width = 658
integer height = 84
integer taborder = 30
boolean bringtotop = true
string title = "담당자"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//// 담당자 
//dw_salesman.accepttext()
//ls_salesman = dw_salesman.object.user[1]
//
////
//int    li_year
//long   ll_row
//string ls_open, ls_zero, ls_salesman, ls_username
//
/////////////////////////////////////////////
//// 사용불가 제외
/////////////////////////////////////////////
//if cbx_open.checked = true then
//	ls_open = "O"
//else
//	ls_open = "%"
//end if
//
/////////////////////////////////////////////
//// 잔액제로 제외
/////////////////////////////////////////////
//if cbx_zero.checked = true then
//	ls_zero = "Y"
//else
//	ls_zero = "%"
//end if
//
//// 일괄출력
//if data = "%" then 	// 전체사용자
//	cb_auto.enabled = false
////   ddlb_1.enabled  = false
//else
//	if ls_salesman = gs_userid then	// 로긴담당자 
//		cb_auto.enabled = true
////		ddlb_1.enabled  = true
//	else
//		if GF_PERMISSION("거래처_여신현황(일괄)", gs_userid) = "Y" then
//			cb_auto.enabled = true
////			ddlb_1.enabled  = true
//		else
//			cb_auto.enabled = false
////			ddlb_1.enabled  = false
//		end if
//	end if
//end if
//
//// 년도
//li_year   = integer(em_1.text)
//
////================================//
//dw_1.getchild("cust_no", idwc_cust)
//idwc_cust.settransobject(sqlca)
//ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust.setsort('mgr_sort, cust_no, cust_name')
//idwc_cust.sort()
////================================//
//dw_1.getchild("cust_name", idwc_cust_name)
//idwc_cust_name.settransobject(sqlca)
//ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
//idwc_cust_name.sort()
////================================//
//dw_1.getchild("icube_no", idwc_icube)
//idwc_icube.settransobject(sqlca)
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_icube.setsort('icube_no, cust_name')
//idwc_icube.sort()
/////////////////////////////////////////////
//
//// 잔액(카드)존재 업체
//if cbx_card.checked = true then
//	dw_9.title = "카드 등록업체"
//	dw_9.dataobject = "d_cdcustmaster_r_cards"
//	dw_9.SetTransObject(SQLCA)
//else
//	dw_9.title = "잔액 존재업체"
//	dw_9.dataobject = "d_cdcustmaster_r_sales"
//	dw_9.SetTransObject(SQLCA)
//end if
//
//dw_14.retrieve()										// 거래처순서
//ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year )
//
//// 잔액제로 제외
//if cbx_zero.checked = true then		
//	dw_9.setfilter( "opeom_amt <> 0" )
//else
//	dw_9.setfilter( "" )
//end if
//dw_9.filter()
//
//if ll_row < 1 then
//	if cbx_card.checked = true then
//		MessageBox("확인","카드 등록업체가 존재하지 않습니다.")
//		return	
//	else
//		MessageBox("확인","잔액 존재업체가 존재하지 않습니다.")
//		return	
//	end if
//end if
//
//SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
//st_salesman.text = ls_username 	// 현재담당자
//
/////////////////////////////////////////////////////////////////////
//// 거래처정렬 순서 변경하기
/////////////////////////////////////////////////////////////////////
//long   ll_col, ll_found, ll_custsort
//string ls_custno
//
//dw_14.retrieve()								// 거래처순서
//
//ll_custsort = 0
//for ll_row = 1 to dw_9.rowcount()		// 잔액존재업체
//	dw_9.object.cust_sort[ll_row] = 9999
//next
//
//for ll_row = 1 to dw_14.rowcount()		// 거래처순서
//	for ll_col = 1 to 2
//		choose case ll_col
//			case 1
//				ls_custno = dw_14.object.customer_grp_cust_no[ll_row]
//
//			case 2
//				ls_custno = dw_14.object.customer_grp_rcust_no[ll_row]
//		end choose
//		
//		if isnull(ls_custno) OR ls_custno = "" then
//		else
//			ll_found = dw_9.find( "customer_cust_no = '" + ls_custno + "' ", 1, dw_9.rowcount() )
//			if isnull(ll_found) OR ll_found < 1 then
//			else
//				ll_custsort = ll_custsort + 1
//				dw_9.object.cust_sort[ll_found] = ll_custsort
//
//				dw_9.object.customer_cust_name[ll_found] = "*" + dw_9.object.customer_cust_name[ll_found]
//			end if
//		end if
//	next
//next
////
//dw_9.SetSort("cust_idx A, customer_salesman A, mgr_sort A, cust_sort A, customer_cust_name A")	
//dw_9.Sort()
//dw_9.groupcalc()
/////////////////////////////////////////////////////////////////////
//
end event

type st_1 from statictext within w_cdcust_outamt_m
integer x = 1225
integer y = 128
integer width = 251
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_cdcust_outamt_m
integer x = 1481
integer y = 52
integer width = 256
integer height = 76
integer taborder = 100
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
string mask = "####"
end type

type dw_3 from datawindow within w_cdcust_outamt_m
integer x = 219
integer y = 160
integer width = 142
integer height = 100
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_my_customer"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_cdcust_outamt_m
integer x = 2624
integer y = 300
integer width = 297
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
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx

if this.checked = true then
	ls_colx = string(integer(dw_1.object.y_amt.x) + integer(dw_1.object.y_amt.width))
else
	ls_colx = "0"
end if
dw_1.object.datawindow.horizontalscrollsplit = ls_colx

end event

type pb_2 from picturebutton within w_cdcust_outamt_m
event mousemove pbm_mousemove
integer x = 2830
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_1
if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cb_import from commandbutton within w_cdcust_outamt_m
integer x = 1746
integer y = 52
integer width = 384
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "붙여넣기"
end type

event clicked;//
string	ls_ddlb, ls_icubeno, ls_custno, ls_custname
string	ls_cheque_no, ls_large, ls_bank_code, ls_branch
date     ld_cheque_start, ld_cheque_end

long		ll_row, ll_rc
integer  iRet

//
ll_rc = dw_1.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then
	// Long. Returns the number of rows that were imported if it succeeds and returns 
	//       the following values if an error occurs:
	//  0  End of file, too many rows
	// -2  Not enough columns
	// -3  Invalid argument
	// -4  Invalid input
	
	ClipBoard("")

	MessageBox("확인","데이터 가져오기 완료" )
end if
	

end event

type ddlb_op from dropdownlistbox within w_cdcust_outamt_m
integer x = 951
integer y = 288
integer width = 265
integer height = 500
integer taborder = 40
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

