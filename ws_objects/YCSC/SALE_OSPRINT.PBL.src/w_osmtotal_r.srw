$PBExportHeader$w_osmtotal_r.srw
$PBExportComments$월 외상매출 총괄현황(1998/04/28, 정재수)
forward
global type w_osmtotal_r from w_inheritance
end type
type em_1 from editmask within w_osmtotal_r
end type
type st_1 from statictext within w_osmtotal_r
end type
type dw_3 from datawindow within w_osmtotal_r
end type
type pb_1 from picturebutton within w_osmtotal_r
end type
type st_4 from statictext within w_osmtotal_r
end type
type st_5 from statictext within w_osmtotal_r
end type
type ddlb_op from dropdownlistbox within w_osmtotal_r
end type
type sle_value from singlelineedit within w_osmtotal_r
end type
type cb_1 from commandbutton within w_osmtotal_r
end type
type cb_2 from commandbutton within w_osmtotal_r
end type
type cb_3 from commandbutton within w_osmtotal_r
end type
type cb_5 from commandbutton within w_osmtotal_r
end type
type gb_5 from groupbox within w_osmtotal_r
end type
type ddlb_fld from dropdownlistbox within w_osmtotal_r
end type
type hpb_1 from hprogressbar within w_osmtotal_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osmtotal_r
end type
type cbx_zero from checkbox within w_osmtotal_r
end type
type dw_5 from datawindow within w_osmtotal_r
end type
type cbx_chkout from checkbox within w_osmtotal_r
end type
type cb_4 from commandbutton within w_osmtotal_r
end type
type cb_6 from commandbutton within w_osmtotal_r
end type
end forward

global type w_osmtotal_r from w_inheritance
integer x = 23
integer y = 112
integer width = 4713
integer height = 2276
string title = "월 외상매출 총괄현황(w_osmtotal_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
pb_1 pb_1
st_4 st_4
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_5 gb_5
ddlb_fld ddlb_fld
hpb_1 hpb_1
ddlb_dwtitles ddlb_dwtitles
cbx_zero cbx_zero
dw_5 dw_5
cbx_chkout cbx_chkout
cb_4 cb_4
cb_6 cb_6
end type
global w_osmtotal_r w_osmtotal_r

type variables
integer ii_month
string  is_flag = '%'
end variables

on w_osmtotal_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.pb_1=create pb_1
this.st_4=create st_4
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_5=create gb_5
this.ddlb_fld=create ddlb_fld
this.hpb_1=create hpb_1
this.ddlb_dwtitles=create ddlb_dwtitles
this.cbx_zero=create cbx_zero
this.dw_5=create dw_5
this.cbx_chkout=create cbx_chkout
this.cb_4=create cb_4
this.cb_6=create cb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.gb_5
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.hpb_1
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.cbx_zero
this.Control[iCurrent+18]=this.dw_5
this.Control[iCurrent+19]=this.cbx_chkout
this.Control[iCurrent+20]=this.cb_4
this.Control[iCurrent+21]=this.cb_6
end on

on w_osmtotal_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_5)
destroy(this.ddlb_fld)
destroy(this.hpb_1)
destroy(this.ddlb_dwtitles)
destroy(this.cbx_zero)
destroy(this.dw_5)
destroy(this.cbx_chkout)
destroy(this.cb_4)
destroy(this.cb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

hpb_1.visible= false

dw_2.visible = false
dw_3.visible = false
dw_5.visible = false

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.dataobject = "d_osmtotal_t"
dw_3.dataobject = "d_osmtotal_r"	

dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_5.settransobject(sqlca)

em_1.text   = string(gf_today(),"yyyy/mm")

end event

event resize;call super::resize;//
gb_5.width  = newwidth  - (gb_5.x * 2)

dw_1.width  = newwidth  - (gb_5.x * 2)
dw_1.height = newheight - dw_1.y - gb_5.x



end event

type pb_save from w_inheritance`pb_save within w_osmtotal_r
boolean visible = false
integer x = 3735
integer y = 28
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_osmtotal_r
integer x = 32
integer y = 416
integer width = 4603
integer height = 1724
integer taborder = 0
string dataobject = "d_osmtotal_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;//gb_2.width = dw_1.width + 35
//gb_2.height = dw_1.height + 35

end event

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_osmtotal_r
integer x = 59
integer y = 152
integer width = 119
integer height = 92
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_osmtotal_h"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_osmtotal_r
integer x = 46
integer y = 28
integer width = 1275
integer height = 132
string text = "월 외상매출 총괄현황"
end type

type st_tips from w_inheritance`st_tips within w_osmtotal_r
end type

type pb_compute from w_inheritance`pb_compute within w_osmtotal_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_osmtotal_r
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_osmtotal_r
integer x = 3433
integer y = 64
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osmtotal_r
integer x = 3049
integer y = 64
integer taborder = 30
end type

event pb_print::clicked;//
w_repsuper w_print
st_print l_print
 
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 판매거래처 마스터를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_osmtotal_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osmtotal_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osmtotal_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osmtotal_r
event ue_1 pbm_custom01
integer x = 2857
integer y = 64
integer taborder = 20
end type

event pb_retrieve::ue_1;//
string  ls_month, ls_chkout
decimal lr_ym,  lr_ys, lr_mm, lr_ms,   lr_bm, lr_yb, lr_yy
long    ll_row, ll_cmon2,  ll_cmon14,  ll_row1, ll_col
 
if dw_2.rowcount() < 1 then RETURN

setpointer(hourglass!)

dw_1.setredraw(false)
dw_3.setredraw(false)

ls_month  = RightA('0' + string(ii_month), 2)
ll_cmon2  = ii_month + 2
ll_cmon14 = ii_month + 14

hpb_1.position = 0
hpb_1.visible  = true

for ll_row = 1 to dw_2.rowcount()
	hpb_1.position = ll_row / dw_2.rowcount() * 100
	
   // 당월매출, 년간매출
   lr_yy = dw_2.object.data[ll_row, 2] // 전월잔액
   for ll_col = 3 to ll_cmon2
      lr_ym = lr_ym + dw_2.object.data[ll_row, ll_col]  // 년간매출
      if ll_col = ll_cmon2 then
         lr_mm = dw_2.object.data[ll_row, ll_col]       // 당월매출
      end if
   next
   
   // 당월수금, 년간수금
   for ll_col = 15 to ll_cmon14
      lr_ys = lr_ys + dw_2.object.data[ll_row, ll_col]  // 년간수금
      if ll_col = ll_cmon14 then
         lr_ms = dw_2.object.data[ll_row, ll_col]       // 당월수금   
      end if
   next
   
   lr_bm = (lr_ym + lr_yy - lr_mm) - (lr_ys - lr_ms)    // 전월잔액
	
	ll_row1 = dw_1.insertrow(0)
	dw_1.setitem(ll_row1, "cust_name",     dw_2.object.data[ll_row, 31])
	dw_1.setitem(ll_row1, "m_jan",         lr_mm - lr_ms + lr_bm)        // 월말잔액
	dw_1.setitem(ll_row1, "m_m",           lr_mm)                        // 당월매출
	dw_1.setitem(ll_row1, "m_s",           lr_ms)                        // 당월수금
	dw_1.setitem(ll_row1, "bm_jan",        lr_bm)                        // 전월잔액
	dw_1.setitem(ll_row1, "y_m",           lr_ym)                        // 년간매출
	dw_1.setitem(ll_row1, "y_s",           lr_ys)                        // 년간수금
	
	dw_1.setitem(ll_row1, "user_name",     dw_2.object.data[ll_row, 30])
	dw_1.setitem(ll_row1, "credit_level",  dw_2.object.data[ll_row, 28])
	dw_1.setitem(ll_row1, "level_grade",   dw_2.object.data[ll_row, 29])
	
	dw_1.setitem(ll_row1, "register_no",   dw_2.object.data[ll_row, 32])      
	dw_1.setitem(ll_row1, "captain_name",  dw_2.object.data[ll_row, 33])      
	dw_1.setitem(ll_row1, "resident_card", dw_2.object.data[ll_row, 34])      
	dw_1.setitem(ll_row1, "tel_no",        dw_2.object.data[ll_row, 35])      
	dw_1.setitem(ll_row1, "fax_no",        dw_2.object.data[ll_row, 36])      
	dw_1.setitem(ll_row1, "customer_addr", dw_2.object.data[ll_row, 37])      
	dw_1.setitem(ll_row1, "cust_no",       dw_2.object.data[ll_row,  1])      
	dw_1.setitem(ll_row1, "icube_no",      dw_2.object.data[ll_row, 38])      
	
	dw_1.setitem(ll_row1, "mgr_type",      dw_2.object.data[ll_row, 39]) // 관리구분
	dw_1.setitem(ll_row1, "mgr_sort",      dw_2.object.data[ll_row, 40]) // 관리순서
	dw_1.setitem(ll_row1, "price_level",   dw_2.object.data[ll_row, 41]) // 단가등급
	dw_1.setitem(ll_row1, "open_close",    dw_2.object.data[ll_row, 42]) // 사용불가
	dw_1.setitem(ll_row1, "custname_sort", dw_2.object.data[ll_row, 43]) // 거래처단명
	dw_1.setitem(ll_row1, "class",         dw_2.object.data[ll_row, 44]) // 업체유형
	dw_1.setitem(ll_row1, "top_level",     dw_2.object.data[ll_row, 45]) // 종합등급
	dw_1.setitem(ll_row1, "toplevel",      dw_2.object.data[ll_row, 46]) // 종합등급
	dw_1.setitem(ll_row1, "sale_address",  dw_2.object.data[ll_row, 47]) // 영업지역
	
	// PRINT
	ll_row1 = dw_3.insertrow(0)
	dw_3.setitem(ll_row1, "cust_no",       dw_2.object.data[ll_row,  1])
	dw_3.setitem(ll_row1, "cust_name",     dw_2.object.data[ll_row, 31])
	dw_3.setitem(ll_row1, "m_m",           lr_mm)
	dw_3.setitem(ll_row1, "y_y",           lr_yy)
	dw_3.setitem(ll_row1, "m_s",           lr_ms)
	dw_3.setitem(ll_row1, "y_m",           lr_ym)
	dw_3.setitem(ll_row1, "y_s",           lr_ys)
	dw_3.object.month[ll_row1]           = ls_month

	dw_3.setitem(ll_row1, "user_name",     dw_2.object.data[ll_row, 30])
	dw_3.setitem(ll_row1, "credit_level",  dw_2.object.data[ll_row, 28])
	dw_3.setitem(ll_row1, "level_grade",   dw_2.object.data[ll_row, 29])
	
	dw_3.setitem(ll_row1, "mgr_type",      dw_2.object.data[ll_row, 39]) // 관리구분
	dw_3.setitem(ll_row1, "mgr_sort",      dw_2.object.data[ll_row, 40]) // 관리순서
	dw_3.setitem(ll_row1, "price_level",   dw_2.object.data[ll_row, 41]) // 단가등급
	dw_3.setitem(ll_row1, "custname_sort", dw_2.object.data[ll_row, 43]) // 거래처단명
	dw_3.setitem(ll_row1, "class",         dw_2.object.data[ll_row, 44]) // 업체유형
	dw_3.setitem(ll_row1, "top_level",     dw_2.object.data[ll_row, 45]) // 종합등급
	dw_3.setitem(ll_row1, "toplevel",      dw_2.object.data[ll_row, 46]) // 종합등급
	dw_3.setitem(ll_row1, "sale_address",  dw_2.object.data[ll_row, 47]) // 영업지역
	
	// 당월매출 - 당월수금 + 전월잔액 <> 0, 당월매출 <> 0, 당월수금 <> 0, 전월잔액 <> 0 
	if lr_mm - lr_ms + lr_bm <> 0 or lr_mm <> 0 or lr_ms <> 0 or lr_bm <> 0 then
		dw_1.setitem(ll_row1, "status", "O")
		dw_3.setitem(ll_row1, "status", "O")
	else
		dw_1.setitem(ll_row1, "status", "")
		dw_3.setitem(ll_row1, "status", "")
	end if
   
   lr_yy = 0 ; lr_mm = 0 ; lr_ms = 0 ; lr_ym = 0 ; lr_ys = 0 ; lr_bm = 0
next
hpb_1.visible  = false

if cbx_zero.checked = true then
	dw_1.setfilter( "calc_chk <> 0" )
	dw_1.filter()

	dw_3.setfilter( "calc_chk <> 0" )
	dw_3.filter()
end if

end event

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_month, ls_date, ls_level, ls_cred, ls_chkout
long   ll_year
st_security lst_security

dw_1.reset() ; dw_2.reset() ; dw_3.reset()
cb_2.triggerevent( clicked! )	// 필터해지

if em_1.text = "" then
	MessageBox("확인","해당월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

// 매출제외 포함
if cbx_chkout.checked = true then
	ls_chkout = "%"
else
	ls_chkout = "N"
end if

ls_date  = em_1.text
ll_year  = long(LeftA(ls_date, 4))
ii_month = integer(RightA(ls_date, 2))

ls_level = "%"
ls_cred  = "%"


string ls_salesman
choose case gs_level
	case 'A','B'
		ls_salesman = '%'
	case 'C'
		ls_salesman = gs_userid
end choose

dw_5.retrieve()		// 거래처정렬 순서DATA


dw_2.retrieve( ll_year, ls_salesman, ls_chkout )
this.TriggerEvent("ue_1")

///////////////////////////////////////////////////////////////////
// 거래처정렬 순서 변경하기
///////////////////////////////////////////////////////////////////
long   ll_custsort, ll_found, ll_row, ll_col
string ls_custname

ll_custsort = 0
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.cust_sort[ll_row] = 9999
	dw_3.object.cust_sort[ll_row] = 9999
next

for ll_row = 1 to dw_5.rowcount()
	for ll_col = 1 to 2
		choose case ll_col
			case 1
				ls_custname = dw_5.object.customer_cust_name[ll_row]

			case 2
				ls_custname = dw_5.object.customer_rcust_name[ll_row]
		end choose
		
		if isnull(ls_custname) OR ls_custname = "" then
		else
			ll_found = dw_1.find( "cust_name = '" + ls_custname + "' ", 1, dw_1.rowcount() )
			if isnull(ll_found) OR ll_found < 1 then
			else
				ll_custsort = ll_custsort + 1
				dw_1.object.cust_sort[ll_found] = ll_custsort
				dw_3.object.cust_sort[ll_found] = ll_custsort

				dw_1.object.cust_name[ll_found] = "*" + dw_1.object.cust_name[ll_found]
				dw_3.object.cust_name[ll_found] = "*" + dw_3.object.cust_name[ll_found]
			end if
		end if
	next
next
//
dw_1.SetSort("user_name A, toplevel A, cust_sort A, custname_sort A")	
dw_1.Sort()	
dw_1.groupcalc()

dw_3.SetSort("user_name A, toplevel A, cust_sort A, custname_sort A")	
dw_3.Sort()
dw_3.groupcalc()

dw_1.setredraw( true )
dw_3.setredraw( true )
///////////////////////////////////////////////////////////////////

dw_1.setfocus()
MessageBox("확인","조회완료")


end event

type gb_3 from w_inheritance`gb_3 within w_osmtotal_r
integer x = 2021
integer y = 16
integer width = 791
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osmtotal_r
integer x = 1390
integer y = 16
integer width = 613
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osmtotal_r
integer x = 2830
integer y = 16
integer width = 818
integer height = 212
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_osmtotal_r
integer x = 2048
integer y = 128
integer width = 347
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
string displaydata = "T"
end type

type st_1 from statictext within w_osmtotal_r
integer x = 2048
integer y = 52
integer width = 347
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
boolean enabled = false
string text = "작업년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osmtotal_r
integer x = 352
integer y = 152
integer width = 119
integer height = 92
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_osmtotal_r"
end type

type pb_1 from picturebutton within w_osmtotal_r
event mousemove pbm_mousemove
string tag = "파일"
integer x = 3241
integer y = 64
integer width = 187
integer height = 144
integer taborder = 50
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	//   "파워빌더리포트 (*.PSR),*.PSR," + &
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)				
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인", "작업완료")
	end if
end if

end event

type st_4 from statictext within w_osmtotal_r
integer x = 133
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

type st_5 from statictext within w_osmtotal_r
integer x = 837
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

type ddlb_op from dropdownlistbox within w_osmtotal_r
integer x = 1006
integer y = 288
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_osmtotal_r
integer x = 1326
integer y = 296
integer width = 567
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
end type

type cb_1 from commandbutton within w_osmtotal_r
integer x = 1906
integer y = 296
integer width = 160
integer height = 76
integer taborder = 80
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

type cb_2 from commandbutton within w_osmtotal_r
integer x = 2071
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

// 잔액제로 필터
cbx_zero.triggerevent( clicked! )
end event

type cb_3 from commandbutton within w_osmtotal_r
integer x = 2235
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osmtotal_r
integer x = 2400
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_5 from groupbox within w_osmtotal_r
integer x = 32
integer y = 240
integer width = 4603
integer height = 160
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_fld from dropdownlistbox within w_osmtotal_r
integer x = 320
integer y = 288
integer width = 480
integer height = 632
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

type hpb_1 from hprogressbar within w_osmtotal_r
integer x = 2592
integer y = 296
integer width = 1609
integer height = 76
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type ddlb_dwtitles from dropdownlistbox within w_osmtotal_r
integer x = 375
integer y = 304
integer width = 311
integer height = 88
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

type cbx_zero from checkbox within w_osmtotal_r
integer x = 1422
integer y = 60
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "잔액제로 필터"
boolean checked = true
end type

event clicked;// 잔액제로 필터
if cbx_zero.checked = true then
	dw_1.setfilter( "calc_chk <> 0" )
	dw_1.filter()
	dw_3.setfilter( "calc_chk <> 0" )
	dw_3.filter()
else
	dw_1.setfilter( "" )
	dw_1.filter()
	dw_3.setfilter( "" )
	dw_3.filter()
end if


end event

type dw_5 from datawindow within w_osmtotal_r
integer x = 201
integer y = 152
integer width = 119
integer height = 92
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_grp"
boolean livescroll = true
end type

type cbx_chkout from checkbox within w_osmtotal_r
integer x = 1422
integer y = 148
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "매출제외 포함"
end type

type cb_4 from commandbutton within w_osmtotal_r
integer x = 4215
integer y = 288
integer width = 402
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "기본정렬"
end type

event clicked;// 기본정렬
dw_2.SetSort("user_name A, mgr_sort A, cust_name A")	
dw_2.Sort()	

dw_3.SetSort("user_name A, mgr_sort A, cust_sort A, cust_name A")	
dw_3.Sort()

dw_1.SetSort("user_name A, mgr_sort A, cust_sort A, cust_name A")	
dw_1.Sort()	

dw_2.groupcalc()
dw_1.groupcalc()
dw_3.groupcalc()

end event

type cb_6 from commandbutton within w_osmtotal_r
integer x = 2414
integer y = 52
integer width = 366
integer height = 160
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "업체유형"
end type

event clicked;//
string ls_msg

ls_msg  = "A1 : 사월회~n"
ls_msg += "A2 : 공략업체~n"
ls_msg += "A3 : 우량,중점업체~n"
ls_msg += "~n"
ls_msg += "B1 : 유통업체~n"
ls_msg += "B2 : 년간단가(입찰)업체~n"
ls_msg += "B3 : 생산업체~n"
ls_msg += "~n"
ls_msg += "C1 : 매출순위 중간(결제양호)~n"
ls_msg += "C11: 매출순위 중간(불량)~n"
ls_msg += "C2 : 소액업체(양호)~n"
ls_msg += "C22: 소액업체(불량)~n"
ls_msg += "~n"
ls_msg += "D  : 고액/장기미수 유지업체~n"
ls_msg += "~n"
ls_msg += "X1 : 단발,건별(수출)공사,특수품~n"
ls_msg += "X2 : 채권회수업체~n"
ls_msg += "X3 : 관망,거래대기~n"

MessageBox("확인",ls_msg)
end event

