$PBExportHeader$w_oestand_r2.srw
$PBExportComments$일위대가 물품소요량(1998/05/10, 정재수)
forward
global type w_oestand_r2 from w_inheritance
end type
type gb_4 from groupbox within w_oestand_r2
end type
type gb_5 from groupbox within w_oestand_r2
end type
type dw_5 from datawindow within w_oestand_r2
end type
type dw_4 from datawindow within w_oestand_r2
end type
type em_1 from editmask within w_oestand_r2
end type
type st_1 from statictext within w_oestand_r2
end type
type rb_1 from radiobutton within w_oestand_r2
end type
type rb_2 from radiobutton within w_oestand_r2
end type
end forward

global type w_oestand_r2 from w_inheritance
integer y = 172
integer width = 4654
integer height = 2852
string title = "일위대가 물품소요량(w_oestand_r2)"
long backcolor = 79219928
gb_4 gb_4
gb_5 gb_5
dw_5 dw_5
dw_4 dw_4
em_1 em_1
st_1 st_1
rb_1 rb_1
rb_2 rb_2
end type
global w_oestand_r2 w_oestand_r2

type variables
datawindowchild idwc_item
datawindowchild idwc_item_name

string is_chk
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.settransobject(sqlca)
dw_4.SetTransObject(SQLCA)
dw_5.visible = false


end event

on w_oestand_r2.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.gb_5=create gb_5
this.dw_5=create dw_5
this.dw_4=create dw_4
this.em_1=create em_1
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
end on

on w_oestand_r2.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
end on

type pb_save from w_inheritance`pb_save within w_oestand_r2
boolean visible = false
integer x = 3077
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_oestand_r2
boolean visible = false
integer x = 46
integer y = 300
integer width = 905
integer height = 180
integer taborder = 70
string dataobject = "d_oestand_t"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;string ls_item_no, ls_item_name
long ll_dw4cnt, ll_found
choose case dwo.name
	case 'item_no'
		this.object.item_name[1] = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		dw_4.reset()
		dw_4.setfocus()
//		ll_dw4cnt = dw_4.retrieve(idwc_item.getitemstring(idwc_item.getrow(), "item_no"))
		ll_dw4cnt = dw_4.retrieve()
		ls_item_name = trim(this.object.item_name[1])
		ll_found = dw_4.Find("item_name = '" + ls_item_name + "'", 1, ll_dw4cnt)
	case 'item_name'
		this.object.item_no[1] = idwc_item_name.getitemstring(idwc_item_name.getrow(), "item_no")
		dw_4.reset()
		dw_4.setfocus()
//		ll_dw4cnt = dw_4.retrieve(idwc_item_name.getitemstring(idwc_item_name.getrow(), "item_no"))
		ll_dw4cnt = dw_4.retrieve()
		ls_item_no = trim(this.object.item_no[1])
		ll_found = dw_4.Find("item_no = '" + ls_item_no + "'", 1, ll_dw4cnt)
end choose		

if ll_found < 1 then 
	dw_4.scrolltorow(1)	
else
	dw_4.scrolltorow(ll_found)	
end if
end event

event dw_1::clicked;call super::clicked;this.object.item_no[this.getrow()] = ''
this.object.item_name[this.getrow()] = ''

is_chk = "N"
em_1.text = "1"
end event

event dw_1::editchanged;call super::editchanged;string ls_data
long ll_found,ll_row
int li_line

choose case dwo.name
	case 'item_no'
		 ls_data = data + '%'
		 ll_row = idwc_item.RowCount( )
		 ll_found = idwc_item.Find("item_no like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("item_no.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_item.scrolltorow(ll_found)

//		 if ll_found < 1 then 
//			 idwc_item.scrolltorow(1)
//		 else

//			 idwc_item.scrolltorow(ll_found)
//		 end if
		 
	case 'item_name'
		 ls_data = data + '%'
		 ll_row = idwc_item_name.RowCount( )
		 ll_found = idwc_item_name.Find("item_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("item_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_item_name.scrolltorow(ll_found)	

// 	 if ll_found < 1 then 
//			 idwc_item_name.scrolltorow(1)
//		 else
//			 idwc_item_name.scrolltorow(ll_found)
//		 end if
end choose

RETURN 0
end event

type dw_2 from w_inheritance`dw_2 within w_oestand_r2
integer x = 1687
integer y = 316
integer width = 2894
integer height = 2400
integer taborder = 80
string dataobject = "d_oenbsis_det_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oestand_r2
integer width = 1477
string text = "일위대가 물품소요량2"
end type

type st_tips from w_inheritance`st_tips within w_oestand_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oestand_r2
integer x = 4000
integer y = 60
integer taborder = 130
boolean enabled = false
end type

event pb_compute::clicked;call super::clicked;//long ll_qty, ll_row
//
//if dw_2.rowcount() < 1 then return
//
//ll_qty = long(em_1.text)
//
//if ll_qty = 0 or isnull(ll_qty) then
//	messagebox("확인","시스템 개수를 입력하세요!",information!)
//	em_1.setfocus()
//	return
//else
//	for ll_row = 1 to dw_2.rowcount() 
//		dw_2.setitem(ll_row, "basis_det_c_qty", ll_qty)
//		dw_5.setitem(ll_row, "basis_det_c_qty", ll_qty)
//		dw_5.setitem(ll_row, "basis_det_std_amount", (dw_5.getitemnumber(ll_row, "c_asc_qty", Primary!, TRUE) * dw_5.getitemnumber(ll_row, "basis_det_std_cost", Primary!, TRUE))) 
//	next
//end if
//
end event

type pb_print_part from w_inheritance`pb_print_part within w_oestand_r2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oestand_r2
integer x = 4384
integer y = 60
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oestand_r2
integer x = 4192
integer y = 60
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sid
if dw_2.rowcount() < 1 then return

//if messagebox('확인', '엑셀파일로 오픈하시겠습니까?',question!,YesNo!,1) = 1 then
	ls_sid = dw_2.object.sid[1]
	if RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "SID", RegString!, ls_sid) = 1 then
	else
		messagebox('','엑셀파일 기초세팅 실패!~N~N관리자에게 문의 바랍니다.')
	end if

	integer iret
	OLEObject OleExcel
	
	OleExcel = CREATE OLEObject 
	iret = OleExcel.ConnectToNewObject("excel.application") 
	if iret <> 0 then DESTROY OleExcel 
	
//	if gf_netadd("\\192.168.1.6\pb80\EXCEL") = false then 
////		messagebox("경고", "Excel 연결 오류")
//	end if
	
	// Visible = True의 경우 엑셀 프로그램이 띄워지며 
	// False인 경우 아이콘화된다. 
	OleExcel.Application.Visible = true
	
	// 엑셀을 로드한 후 Empty Sheet를 연다. 
	OleExcel.WorkBooks.Open('\\192.168.1.6\pb80\EXCEL\일위대가.xls') 
	
//	if gf_netcancel() = false then 
////		messagebox("경고", "Excel 해제 오류")
//	end if
	
//else
//	
//	w_repsuper w_print
//	st_print l_print
//	long ll_row
//	
//	ll_row =  dw_2.rowcount()
//	if ll_row < 1 then return
//	

//	//===============사용자별 프로그램 사용현황=================================
//	gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//	//==========================================================================
//	
//	l_print.st_datawindow = dw_5
//	l_print.st_print_sheet = " 프린트용지 : A4"
//	l_print.st_print_desc = " 이 프로그램은 일위대가 물품소요량을 출력합니다." 
//	
//	// LANDSCAPE:1, PORTRAIT:2
//	// SIZE 9-A4, 12-B4
//	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//							 'Datawindow.Zoom=100'
//	
//	//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
//	//                   'Datawindow.Zoom=100'
//	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oestand_r2
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_oestand_r2
boolean visible = false
integer x = 2693
integer y = 60
integer taborder = 170
boolean enabled = false
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_oestand_r2
boolean visible = false
integer x = 2501
integer y = 60
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oestand_r2
integer x = 3808
integer y = 60
integer taborder = 180
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_4.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_oestand_r2
integer x = 1669
integer y = 244
integer width = 2935
integer height = 2484
integer taborder = 90
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_oestand_r2
boolean visible = false
integer x = 23
integer width = 946
integer height = 276
integer taborder = 120
long textcolor = 16711680
long backcolor = 79219928
string text = "시스템코드"
end type

type gb_1 from w_inheritance`gb_1 within w_oestand_r2
integer x = 3785
integer y = 24
integer width = 814
integer taborder = 60
long backcolor = 79219928
end type

type gb_4 from groupbox within w_oestand_r2
integer x = 3099
integer y = 24
integer width = 494
integer height = 204
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "시스템 개수"
end type

type gb_5 from groupbox within w_oestand_r2
integer x = 27
integer y = 244
integer width = 1627
integer height = 2484
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "시스템규격"
end type

type dw_5 from datawindow within w_oestand_r2
integer x = 1559
integer y = 48
integer width = 302
integer height = 156
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oestandrep_r1"
boolean livescroll = true
end type

type dw_4 from datawindow within w_oestand_r2
integer x = 46
integer y = 312
integer width = 1591
integer height = 2400
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oenbasis_mst_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow < 1 then return
dw_2.retrieve(this.object.sid[currentrow])
//	dw_5.retrieve(this.object.item_no[currentrow])
em_1.text = "1"


end event

event clicked;if row < 1 then return
dw_2.retrieve(this.object.sid[row])
//	dw_5.retrieve(this.object.item_no[currentrow])
em_1.text = "1"

end event

type em_1 from editmask within w_oestand_r2
integer x = 3154
integer y = 108
integer width = 329
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
string text = "1"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##,###,##0"
boolean autoskip = true
end type

type st_1 from statictext within w_oestand_r2
integer x = 3488
integer y = 124
integer width = 82
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "M2"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oestand_r2
integer x = 2341
integer y = 120
integer width = 229
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "영업"
boolean checked = true
end type

event clicked;dw_2.dataobject = 'd_oenbsis_det_s'
dw_2.settransobject(sqlca)
if dw_4.rowcount() < 1 then
	pb_retrieve.triggerevent(clicked!)
else
   dw_4.event rowfocuschanged(dw_4.getrow())
end if

end event

type rb_2 from radiobutton within w_oestand_r2
integer x = 2592
integer y = 120
integer width = 229
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "설계"
end type

event clicked;dw_2.dataobject = 'd_oenbsis_det_s2'
dw_2.settransobject(sqlca)
if dw_4.rowcount() < 1 then
	pb_retrieve.triggerevent(clicked!)
else
   dw_4.event rowfocuschanged(dw_4.getrow())
end if

end event

