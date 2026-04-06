$PBExportHeader$w_osmsale_custtotal_r.srw
$PBExportComments$거래처별 채권현황
forward
global type w_osmsale_custtotal_r from w_inheritance
end type
type em_1 from editmask within w_osmsale_custtotal_r
end type
type st_1 from statictext within w_osmsale_custtotal_r
end type
type rb_1 from radiobutton within w_osmsale_custtotal_r
end type
type rb_2 from radiobutton within w_osmsale_custtotal_r
end type
type rb_3 from radiobutton within w_osmsale_custtotal_r
end type
type ddlb_1 from dropdownlistbox within w_osmsale_custtotal_r
end type
type pb_1 from picturebutton within w_osmsale_custtotal_r
end type
type st_3 from statictext within w_osmsale_custtotal_r
end type
type st_2 from statictext within w_osmsale_custtotal_r
end type
type cbx_1 from checkbox within w_osmsale_custtotal_r
end type
type dw_4 from datawindow within w_osmsale_custtotal_r
end type
type st_8 from statictext within w_osmsale_custtotal_r
end type
type st_9 from statictext within w_osmsale_custtotal_r
end type
type ddlb_op from dropdownlistbox within w_osmsale_custtotal_r
end type
type cb_filteron from commandbutton within w_osmsale_custtotal_r
end type
type cb_filteroff from commandbutton within w_osmsale_custtotal_r
end type
type ddlb_fld from dropdownlistbox within w_osmsale_custtotal_r
end type
type sle_value from singlelineedit within w_osmsale_custtotal_r
end type
type cbx_2 from checkbox within w_osmsale_custtotal_r
end type
type cb_1 from commandbutton within w_osmsale_custtotal_r
end type
type cb_2 from commandbutton within w_osmsale_custtotal_r
end type
type cbx_cust from checkbox within w_osmsale_custtotal_r
end type
type dw_3 from datawindow within w_osmsale_custtotal_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osmsale_custtotal_r
end type
type st_4 from statictext within w_osmsale_custtotal_r
end type
type cbx_3 from checkbox within w_osmsale_custtotal_r
end type
type gb_4 from groupbox within w_osmsale_custtotal_r
end type
end forward

global type w_osmsale_custtotal_r from w_inheritance
integer x = 23
integer y = 112
integer width = 4453
integer height = 2012
string title = "거래처 채권현황(w_osmsale_custtotal_r)"
em_1 em_1
st_1 st_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
ddlb_1 ddlb_1
pb_1 pb_1
st_3 st_3
st_2 st_2
cbx_1 cbx_1
dw_4 dw_4
st_8 st_8
st_9 st_9
ddlb_op ddlb_op
cb_filteron cb_filteron
cb_filteroff cb_filteroff
ddlb_fld ddlb_fld
sle_value sle_value
cbx_2 cbx_2
cb_1 cb_1
cb_2 cb_2
cbx_cust cbx_cust
dw_3 dw_3
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
cbx_3 cbx_3
gb_4 gb_4
end type
global w_osmsale_custtotal_r w_osmsale_custtotal_r

type variables
integer ii_month
string  is_flag = '%'
datawindowchild idwc_user

end variables

on w_osmsale_custtotal_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.ddlb_1=create ddlb_1
this.pb_1=create pb_1
this.st_3=create st_3
this.st_2=create st_2
this.cbx_1=create cbx_1
this.dw_4=create dw_4
this.st_8=create st_8
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.ddlb_fld=create ddlb_fld
this.sle_value=create sle_value
this.cbx_2=create cbx_2
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cbx_cust=create cbx_cust
this.dw_3=create dw_3
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.cbx_3=create cbx_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.dw_4
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.st_9
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.cb_filteron
this.Control[iCurrent+16]=this.cb_filteroff
this.Control[iCurrent+17]=this.ddlb_fld
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cbx_2
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cbx_cust
this.Control[iCurrent+23]=this.dw_3
this.Control[iCurrent+24]=this.ddlb_dwtitles
this.Control[iCurrent+25]=this.st_4
this.Control[iCurrent+26]=this.cbx_3
this.Control[iCurrent+27]=this.gb_4
end on

on w_osmsale_custtotal_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.ddlb_1)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.dw_4)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.ddlb_fld)
destroy(this.sle_value)
destroy(this.cbx_2)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cbx_cust)
destroy(this.dw_3)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.cbx_3)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_2.visible = false
dw_3.visible = false

//
em_1.text    = string(RelativeDate(today(), - 1), "yyyy/mm/dd")
ddlb_1.text  = "전체등급"

// 담당자
dw_4.insertrow(1)
dw_4.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_4.object.user[1] = "%"
end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x



end event

type pb_save from w_inheritance`pb_save within w_osmsale_custtotal_r
boolean visible = false
integer taborder = 170
end type

type dw_1 from w_inheritance`dw_1 within w_osmsale_custtotal_r
integer x = 32
integer y = 416
integer width = 4343
integer height = 1456
integer taborder = 0
string dataobject = "d_osmsale_custtotal_r"
boolean hsplitscroll = true
end type

event dw_1::itemchanged;call super::itemchanged;//gb_2.width = dw_1.width + 35
//gb_2.height = dw_1.height + 35

end event

event dw_1::rbuttondown;call super::rbuttondown;if row > 0 then
	gs_print_control = "V" + trim(this.object.cust_no[row])
	if gf_permission('판매거래처관리open', gs_userid) = 'Y' then
		OpenSheet(w_cdcustomer_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
    //Parent.ParentWindow().TriggerEvent("itemchanged")
	else
		OpenSheet(w_cdcustomer_r, parent.parentwindow(), 6, Layered!)
    //Parent.ParentWindow().TriggerEvent("cancelrequested")
	end if
end if

end event

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osmsale_custtotal_r
integer x = 32
integer y = 20
integer width = 1065
integer height = 140
string text = "거래처 채권현황"
end type

type st_tips from w_inheritance`st_tips within w_osmsale_custtotal_r
end type

type pb_compute from w_inheritance`pb_compute within w_osmsale_custtotal_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 180
end type

type pb_print_part from w_inheritance`pb_print_part within w_osmsale_custtotal_r
boolean visible = false
integer taborder = 160
end type

type pb_close from w_inheritance`pb_close within w_osmsale_custtotal_r
integer x = 4155
integer y = 64
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osmsale_custtotal_r
integer x = 3771
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 판매거래처 마스터를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_osmsale_custtotal_r
boolean visible = false
integer taborder = 190
end type

type pb_delete from w_inheritance`pb_delete within w_osmsale_custtotal_r
boolean visible = false
integer taborder = 200
end type

type pb_insert from w_inheritance`pb_insert within w_osmsale_custtotal_r
boolean visible = false
integer taborder = 210
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osmsale_custtotal_r
event ue_1 pbm_custom01
integer x = 3579
integer y = 64
integer taborder = 40
end type

event pb_retrieve::ue_1;//string ls_month
//decimal lr_ym, lr_ys, lr_mm, lr_ms, lr_bm, lr_yb, lr_yy
//long ll_row, ll_m, ll_s, ll_row1, ll_column
// 
//if dw_2.rowcount() < 1 then
//	return
//end if
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
////==========================================================================
//setpointer(hourglass!)
//dw_1.settransobject(sqlca)
//dw_3.settransobject(sqlca)
//dw_1.setredraw(false)
//dw_3.setredraw(false)
//
//ls_month = right('0' + string(ii_month), 2)
//ll_m = ii_month + 2
//ll_s = ii_month + 14
//
//for ll_row = 1 to dw_2.rowcount()
//	//금월매출액, 연간매출액
//	lr_yy = dw_2.object.data[ll_row, 2] //전월잔액
//	for ll_column = 3 to ll_m
//		lr_ym = lr_ym + dw_2.object.data[ll_row, ll_column]  // 연간매출
//		if ll_column = ll_m then
//			lr_mm = dw_2.object.data[ll_row, ll_column] // 금월매출
//		end if
//	next
//	
//	//금월수금액, 연간수금액
//	for ll_column = 15 to ll_s
//		lr_ys = lr_ys + dw_2.object.data[ll_row, ll_column]
//		if ll_column = ll_s then
//			lr_ms = dw_2.object.data[ll_row, ll_column]
//			
//		end if
//	next
//	
//	lr_bm = (lr_ym + lr_yy  - lr_mm) - (lr_ys - lr_ms) // 전월잔액
//
//	IF rb_7.checked = true then
//		if  lr_mm - lr_ms + lr_bm <> 0 or lr_mm <> 0 or lr_ms <> 0 or lr_bm <> 0 then
//			ll_row1 = dw_1.insertrow(0)
//			dw_1.setitem(ll_row1, "cust_name", dw_2.object.data[ll_row, 31])
//			dw_1.setitem(ll_row1, "m_jan", lr_mm - lr_ms + lr_bm) // 월말잔액
//			dw_1.setitem(ll_row1, "m_m", lr_mm)                   // 금월매출
//			dw_1.setitem(ll_row1, "m_s", lr_ms)                   // 금월수금
//			dw_1.setitem(ll_row1, "bm_jan", lr_bm)                // 전월잔액
//			dw_1.setitem(ll_row1, "y_m", lr_ym)                   // 연간매출
//			dw_1.setitem(ll_row1, "y_s", lr_ys)                   // 연간수금
//			dw_1.setitem(ll_row1, "user_name", dw_2.object.data[ll_row, 30])
//			dw_1.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28])
//			dw_1.setitem(ll_row1, "level_grade", dw_2.object.data[ll_row, 29])
//			
//			dw_1.setitem(ll_row1, "customer_register_no", dw_2.object.data[ll_row,32])		
//			dw_1.setitem(ll_row1, "customer_captain_name", dw_2.object.data[ll_row,33])				
//			dw_1.setitem(ll_row1, "customer_resident_card", dw_2.object.data[ll_row,34])		
//			dw_1.setitem(ll_row1, "customer_tel_no", dw_2.object.data[ll_row,35])		
//			dw_1.setitem(ll_row1, "customer_fax_no", dw_2.object.data[ll_row,36])		
//			dw_1.setitem(ll_row1, "customer_addr", dw_2.object.data[ll_row,37])		
//			
//			ll_row1 = dw_3.insertrow(0)
//			dw_3.setitem(ll_row1, "cust_no", dw_2.object.data[ll_row, 1])
//			dw_3.setitem(ll_row1, "cust_name", dw_2.object.data[ll_row, 31])
//			dw_3.setitem(ll_row1, "m_m", lr_mm)
//			dw_3.setitem(ll_row1, "y_y", lr_yy)
//			dw_3.setitem(ll_row1, "m_s", lr_ms)
//			dw_3.setitem(ll_row1, "y_m", lr_ym)
//			dw_3.setitem(ll_row1, "y_s", lr_ys)
//			dw_3.object.month[ll_row1] = ls_month
//	
//			dw_3.setitem(ll_row1, "user_name", dw_2.object.data[ll_row, 30])
//			dw_3.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 29])
//			dw_3.setitem(ll_row1, "level_grade", dw_2.object.data[ll_row, 38])
//	
//	//		dw_3.setitem(ll_row1, "customer_register_no", dw_2.object.data[ll_row,31])		
//	//		dw_3.setitem(ll_row1, "customer_captain_name", dw_2.object.data[ll_row,32])				
//	//		dw_3.setitem(ll_row1, "customer_resident_card", dw_2.object.data[ll_row,33])		
//	//		dw_3.setitem(ll_row1, "customer_tel_no", dw_2.object.data[ll_row,34])		
//	//		dw_3.setitem(ll_row1, "customer_fax_no", dw_2.object.data[ll_row,35])		
//	//		dw_3.setitem(ll_row1, "customer_addr", dw_2.object.data[ll_row,36])		
//		end if
//	elseIF rb_8.checked = true then
//			ll_row1 = dw_1.insertrow(0)
//			dw_1.setitem(ll_row1, "cust_name", dw_2.object.data[ll_row, 31])
//			dw_1.setitem(ll_row1, "m_jan", lr_mm - lr_ms + lr_bm) // 월말잔액
//			dw_1.setitem(ll_row1, "m_m", lr_mm)                   // 금월매출
//			dw_1.setitem(ll_row1, "m_s", lr_ms)                   // 금월수금
//			dw_1.setitem(ll_row1, "bm_jan", lr_bm)                // 전월잔액
//			dw_1.setitem(ll_row1, "y_m", lr_ym)                   // 연간매출
//			dw_1.setitem(ll_row1, "y_s", lr_ys)                   // 연간수금
//			dw_1.setitem(ll_row1, "user_name", dw_2.object.data[ll_row, 30])
//			dw_1.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28])
//			dw_1.setitem(ll_row1, "level_grade", dw_2.object.data[ll_row, 29])
//			
//			dw_1.setitem(ll_row1, "customer_register_no", dw_2.object.data[ll_row,32])		
//			dw_1.setitem(ll_row1, "customer_captain_name", dw_2.object.data[ll_row,33])				
//			dw_1.setitem(ll_row1, "customer_resident_card", dw_2.object.data[ll_row,34])		
//			dw_1.setitem(ll_row1, "customer_tel_no", dw_2.object.data[ll_row,35])		
//			dw_1.setitem(ll_row1, "customer_fax_no", dw_2.object.data[ll_row,36])		
//			dw_1.setitem(ll_row1, "customer_addr", dw_2.object.data[ll_row,37])		
//	
//			ll_row1 = dw_3.insertrow(0)
//			dw_3.setitem(ll_row1, "cust_no", dw_2.object.data[ll_row, 1])
//			dw_3.setitem(ll_row1, "cust_name", dw_2.object.data[ll_row, 31])
//			dw_3.setitem(ll_row1, "m_m", lr_mm)
//			dw_3.setitem(ll_row1, "y_y", lr_yy)
//			dw_3.setitem(ll_row1, "m_s", lr_ms)
//			dw_3.setitem(ll_row1, "y_m", lr_ym)
//			dw_3.setitem(ll_row1, "y_s", lr_ys)
//			dw_3.object.month[ll_row1] = ls_month
//	
//			dw_3.setitem(ll_row1, "user_name", dw_2.object.data[ll_row, 32])
//			dw_3.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28])
//			dw_3.setitem(ll_row1, "level_grade", dw_2.object.data[ll_row, 29])
//	end if
//	
//	lr_yy = 0	
//	lr_mm = 0
//	lr_ms = 0
//	lr_ym = 0
//	lr_ys = 0
//	lr_bm = 0
//next
//
//dw_1.sort()
//dw_3.sort()
//dw_1.setredraw(true)
//dw_3.setredraw(true)
//
end event

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_custno, ls_openclose
string ls_year, ls_month, ls_salesman, ls_date, ls_level[], ls_cred	
date   ld_date
long   ll_row,  ll_year,  ll_found

dw_1.reset() ; dw_2.reset()

// 담당자
dw_4.accepttext()
ls_salesman = dw_4.object.user[1]
if ls_salesman = "%" then
else
	ls_salesman = ls_salesman + "%"
end if

//
ls_date   = em_1.text
ls_year   = LeftA(ls_date,4)
ls_month  = MidA(ls_date,6,2)
ld_date   = date(em_1.text)

ll_year   = long(LeftA(ls_date, 4))

choose case upper(ddlb_1.text)
	case "전체등급"
		ls_level[] = {'A','B','C','D','E','F','G','H','Q','S','V','X','Z'}
	case "S - C 등급"
		ls_level[] = {'S','A','B','C'}
	case "S - E 등급"
		ls_level[] = {'S','A','B','C','E'}
end choose

// 사용불가 포함
if cbx_cust.checked = true then
	ls_openclose = "%"
else
	ls_openclose = "O%"
end if

//
dw_1.retrieve( ls_year, ls_month, ld_date, ls_salesman, ls_level, ls_openclose )

if dw_1.rowcount() < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

dw_3.retrieve( ld_date, ls_salesman, ls_level, ls_openclose )	// 당일출고
if dw_3.rowcount() > 0 then
	for ll_row = 1 to dw_3.rowcount()
		ls_custno = dw_3.object.cust_no[ll_row]
		ll_found  = dw_1.Find( "cust_no = '" + ls_custno + "'", 3, dw_1.RowCount() )
		  
		if ll_found > 0 and ll_found <= dw_1.RowCount() then
			dw_1.object.day_doamt[ll_found] = dw_3.object.day_doamt[ll_row]
		end if
	next
end if

// 데이터공유
dw_1.ShareData(dw_2)
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_osmsale_custtotal_r
integer x = 1143
integer y = 16
integer width = 1413
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osmsale_custtotal_r
integer y = 240
integer width = 4343
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osmsale_custtotal_r
integer x = 3552
integer y = 16
integer width = 818
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osmsale_custtotal_r
integer x = 50
integer y = 176
integer width = 82
integer height = 68
integer taborder = 0
string dataobject = "d_osmsale_custtotal_r0"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_osmsale_custtotal_r
integer x = 1426
integer y = 56
integer width = 411
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_osmsale_custtotal_r
integer x = 1170
integer y = 56
integer width = 251
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "조회일"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_osmsale_custtotal_r
boolean visible = false
integer x = 2688
integer y = 56
integer width = 366
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
string text = "당월매출"
boolean checked = true
end type

event clicked;//
// ③ 당월 매출 최고액(내림차순 정렬) CURR_INV       
// ④ 당일 수주 최고액(내림차순 정렬) DAY_SALEAMT    
// ⑤ 당일 출고 최고액(내림차순 정렬) DAY_DOAMT      
// ⑥ 미수초과액 (내림차순 정렬)      REMAINDER_OVER 
//

dw_1.setsort(' cust_no ')
dw_1.sort()

end event

type rb_2 from radiobutton within w_osmsale_custtotal_r
boolean visible = false
integer x = 2688
integer y = 56
integer width = 366
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
string text = "당일수주"
end type

event clicked;dw_1.setsort(' cust_no ')
dw_1.sort()

end event

type rb_3 from radiobutton within w_osmsale_custtotal_r
boolean visible = false
integer x = 2688
integer y = 56
integer width = 366
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
string text = "당일출고"
end type

event clicked;dw_1.setsort(' cust_no ')
dw_1.sort()

end event

type ddlb_1 from dropdownlistbox within w_osmsale_custtotal_r
integer x = 1426
integer y = 136
integer width = 535
integer height = 804
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체등급","S - C 등급","S - E 등급"}
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_osmsale_custtotal_r
event mousemove pbm_mousemove
string tag = "파일"
integer x = 3963
integer y = 64
integer width = 187
integer height = 144
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
string powertiptext = "파일로저장시킵니다."
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
		"텍스트 (*.TXT),*.TXT," + &
		"HTML문서 (*.HTM), *.HTM," + &
		"CSV(쉽표로 분리), *.CSV")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_1.SaveAsascii(ls_DocName)
				
		elseif ls_ExpandName = "txt" OR ls_ExpandName = "TXT" then
				dw_1.SaveAsascii(ls_DocName)
				  
		elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" then
					dw_1.SaveAs(ls_DocName, HTMLTable!, TRUE)

		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
					dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if

end event

type st_3 from statictext within w_osmsale_custtotal_r
integer x = 1170
integer y = 136
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
boolean enabled = false
string text = "신용"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_osmsale_custtotal_r
integer x = 2597
integer y = 132
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
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_osmsale_custtotal_r
integer x = 2619
integer y = 56
integer width = 654
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "여신초과 거래처"
end type

event clicked;// 
String ls_temp

if dw_1.rowcount() > 0 then
	if this.checked = true then
		ls_temp = "credit_over > 0"
		dw_1.setfilter(ls_temp)
		dw_1.filter()
	else
		ls_temp = ""
		dw_1.setfilter(ls_temp)
		dw_1.filter()
	end if
end if

end event

type dw_4 from datawindow within w_osmsale_custtotal_r
integer x = 2853
integer y = 128
integer width = 663
integer height = 84
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

type st_8 from statictext within w_osmsale_custtotal_r
integer x = 87
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

type st_9 from statictext within w_osmsale_custtotal_r
integer x = 786
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

type ddlb_op from dropdownlistbox within w_osmsale_custtotal_r
integer x = 955
integer y = 288
integer width = 261
integer height = 500
integer taborder = 70
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type cb_filteron from commandbutton within w_osmsale_custtotal_r
integer x = 1705
integer y = 288
integer width = 197
integer height = 84
integer taborder = 90
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_osmsale_custtotal_r
integer x = 1906
integer y = 288
integer width = 197
integer height = 84
integer taborder = 100
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type ddlb_fld from dropdownlistbox within w_osmsale_custtotal_r
integer x = 270
integer y = 288
integer width = 480
integer height = 580
integer taborder = 60
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

type sle_value from singlelineedit within w_osmsale_custtotal_r
integer x = 1225
integer y = 292
integer width = 471
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_2 from checkbox within w_osmsale_custtotal_r
integer x = 1989
integer y = 60
integer width = 256
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "오늘"
end type

event clicked;//
if this.checked = true then
	em_1.text = string(today(),'yyyy/mm/dd')
else
	em_1.text = string(RelativeDate(today(), - 1), "yyyy/mm/dd")
end if
end event

type cb_1 from commandbutton within w_osmsale_custtotal_r
integer x = 2107
integer y = 288
integer width = 183
integer height = 84
integer taborder = 100
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_osmsale_custtotal_r
integer x = 2295
integer y = 288
integer width = 183
integer height = 84
integer taborder = 110
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cbx_cust from checkbox within w_osmsale_custtotal_r
integer x = 1989
integer y = 144
integer width = 549
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "사용불가 포함"
end type

type dw_3 from datawindow within w_osmsale_custtotal_r
integer x = 151
integer y = 176
integer width = 82
integer height = 68
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_osmsale_custtotal_r_do"
boolean resizable = true
boolean livescroll = true
end type

type ddlb_dwtitles from dropdownlistbox within w_osmsale_custtotal_r
integer x = 329
integer y = 296
integer width = 306
integer height = 92
integer taborder = 70
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

type st_4 from statictext within w_osmsale_custtotal_r
integer x = 2848
integer y = 304
integer width = 704
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
string text = "당일매출: V.A.T 별도"
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_osmsale_custtotal_r
integer x = 2510
integer y = 304
integer width = 311
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "틀고정"
end type

event clicked;//
if this.checked = true then
	dw_1.object.datawindow.horizontalscrollsplit= dw_1.object.colllevel.x
else
	dw_1.object.datawindow.horizontalscrollsplit= "0"
end if

end event

type gb_4 from groupbox within w_osmsale_custtotal_r
integer x = 2574
integer y = 16
integer width = 960
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

