$PBExportHeader$w_osteamopeom_item10_cust.srw
$PBExportComments$전략제품 매출실적(거래처)
forward
global type w_osteamopeom_item10_cust from w_inheritance
end type
type dw_area from datawindow within w_osteamopeom_item10_cust
end type
type pb_1 from picturebutton within w_osteamopeom_item10_cust
end type
type st_3 from statictext within w_osteamopeom_item10_cust
end type
type st_4 from statictext within w_osteamopeom_item10_cust
end type
type sle_value from singlelineedit within w_osteamopeom_item10_cust
end type
type cb_1 from commandbutton within w_osteamopeom_item10_cust
end type
type cb_2 from commandbutton within w_osteamopeom_item10_cust
end type
type cb_3 from commandbutton within w_osteamopeom_item10_cust
end type
type cb_5 from commandbutton within w_osteamopeom_item10_cust
end type
type ddlb_fld from dropdownlistbox within w_osteamopeom_item10_cust
end type
type ddlb_dwtitles from dropdownlistbox within w_osteamopeom_item10_cust
end type
type cb_popup1 from commandbutton within w_osteamopeom_item10_cust
end type
type st_5 from statictext within w_osteamopeom_item10_cust
end type
type cb_popup from commandbutton within w_osteamopeom_item10_cust
end type
type em_1 from editmask within w_osteamopeom_item10_cust
end type
type em_2 from editmask within w_osteamopeom_item10_cust
end type
type st_8 from statictext within w_osteamopeom_item10_cust
end type
type dw_cust from datawindow within w_osteamopeom_item10_cust
end type
type st_7 from statictext within w_osteamopeom_item10_cust
end type
type dw_sales from datawindow within w_osteamopeom_item10_cust
end type
type cbx_team from checkbox within w_osteamopeom_item10_cust
end type
type ddlb_op from dropdownlistbox within w_osteamopeom_item10_cust
end type
type st_2 from statictext within w_osteamopeom_item10_cust
end type
end forward

global type w_osteamopeom_item10_cust from w_inheritance
integer y = 112
integer width = 6651
integer height = 5308
string title = "전략제품 매출실적(거래처별)(w_osteamopeom_item10_cust)"
dw_area dw_area
pb_1 pb_1
st_3 st_3
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
cb_popup1 cb_popup1
st_5 st_5
cb_popup cb_popup
em_1 em_1
em_2 em_2
st_8 st_8
dw_cust dw_cust
st_7 st_7
dw_sales dw_sales
cbx_team cbx_team
ddlb_op ddlb_op
st_2 st_2
end type
global w_osteamopeom_item10_cust w_osteamopeom_item10_cust

type variables
gs_custdo_str   ist_code
datawindowchild idwc_area, idwc_cust, idwc_user
string 	is_dw, is_sale_flag, is_custdosql, is_custdorsql,is_custdor1sql, is_ret

end variables

on w_osteamopeom_item10_cust.create
int iCurrent
call super::create
this.dw_area=create dw_area
this.pb_1=create pb_1
this.st_3=create st_3
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.cb_popup1=create cb_popup1
this.st_5=create st_5
this.cb_popup=create cb_popup
this.em_1=create em_1
this.em_2=create em_2
this.st_8=create st_8
this.dw_cust=create dw_cust
this.st_7=create st_7
this.dw_sales=create dw_sales
this.cbx_team=create cbx_team
this.ddlb_op=create ddlb_op
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_area
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.cb_popup1
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.cb_popup
this.Control[iCurrent+15]=this.em_1
this.Control[iCurrent+16]=this.em_2
this.Control[iCurrent+17]=this.st_8
this.Control[iCurrent+18]=this.dw_cust
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.dw_sales
this.Control[iCurrent+21]=this.cbx_team
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.st_2
end on

on w_osteamopeom_item10_cust.destroy
call super::destroy
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.cb_popup1)
destroy(this.st_5)
destroy(this.cb_popup)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.st_7)
destroy(this.dw_sales)
destroy(this.cbx_team)
destroy(this.ddlb_op)
destroy(this.st_2)
end on

event open;call super::open;// w_oicustdo_r를 복사해서 장성

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// 일자
em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("거래처별_물품_출고현황(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()

	//
	dw_sales.object.user[1] = "%"
	if	dw_sales.event itemchanged( dw_sales.getrow(), dw_sales.object.user, gs_userid) = 1 then
		dw_sales.event itemerror( dw_sales.getrow(), dw_sales.object.user, gs_userid)
	end if
	
//	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_user.retrieve( gs_userid )
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
//		cbx_team.checked = false
	   idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

//		cbx_team.checked = true
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	end if
	
	//
	dw_sales.object.user[1] = gs_userid
	if	dw_sales.event itemchanged( dw_sales.getrow(), dw_sales.object.user, gs_userid) = 1 then
		dw_sales.event itemerror( dw_sales.getrow(), dw_sales.object.user, gs_userid)
	end if
end if
dw_sales.setfocus()
end event

event resize;call super::resize;gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_osteamopeom_item10_cust
boolean visible = false
integer x = 1399
integer y = 2852
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_osteamopeom_item10_cust
integer x = 0
integer y = 268
integer width = 5554
integer height = 1904
integer taborder = 0
string dataobject = "d_osteamopeom_item10_cust_01"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osteamopeom_item10_cust
integer x = 55
integer y = 32
integer width = 1577
integer height = 140
string text = "전략제품 매출실적(거래처별)"
end type

type st_tips from w_inheritance`st_tips within w_osteamopeom_item10_cust
integer x = 32
integer y = 3192
end type

type pb_compute from w_inheritance`pb_compute within w_osteamopeom_item10_cust
boolean visible = false
integer x = 55
end type

type pb_print_part from w_inheritance`pb_print_part within w_osteamopeom_item10_cust
boolean visible = false
integer x = 32
integer y = 3192
integer taborder = 40
end type

event pb_print_part::clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//
//openwithparm(w_whcustdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//dw_3.visible = true
//dw_1.visible = false
//ld_start = date(lst_code.start_date)
//ld_end = date(lst_code.end_date)
//
//if lst_code.sel_flag = 'A' then
//   ls_where = " and do.do_date between ~~'" + &
//	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
//else
//   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
//	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
////dw_3.settransobject(sqlca)
//ls_sql = "datawindow.table.select = '" + is_custdor1sql + ls_where + "'"
////dw_1.settransobject(sqlca)
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"거래명세표순 인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_osteamopeom_item10_cust
integer x = 5559
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osteamopeom_item10_cust
integer x = 5367
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
l_print.name = 'd_osteamopeom_item10_cust_01'
l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은  전략제품 매출실적(거래처별)을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'	
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_osteamopeom_item10_cust
boolean visible = false
integer x = 823
integer y = 2852
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osteamopeom_item10_cust
boolean visible = false
integer x = 32
integer y = 3184
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osteamopeom_item10_cust
boolean visible = false
integer x = 32
integer y = 3172
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osteamopeom_item10_cust
integer x = 4983
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_sdate, ls_edate, ls_flag, ls_user_id, ls_cust_no
st_security lst_security

dw_1.reset()
dw_sales.accepttext()
dw_cust.accepttext()

if em_1.text = '' then
	messagebox("확인","조회 시작일을 확인하세요!",information!)
	em_1.setfocus()
	return
end if

if em_2.text = '' then
	messagebox("확인","조회 종료일을 확인하세요!",information!)
	em_1.setfocus()
	return
end if

//기간
ls_sdate = em_1.text
ls_edate = em_2.text
ls_flag = 'DODATE'	//이월반영 'ISSUE'

//거래처
ls_cust_no  = dw_cust.getitemstring(1, 'cust_no')
if ls_cust_no = 'ALL' then
	ls_cust_no = '%'
end if
// 담당자
ls_user_id  = dw_sales.getitemstring(1, 'user' )

dw_1.retrieve(ls_sdate, ls_edate, ls_flag, ls_user_id, ls_cust_no )
end event

type gb_3 from w_inheritance`gb_3 within w_osteamopeom_item10_cust
boolean visible = false
integer x = 32
integer y = 256
integer width = 4690
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osteamopeom_item10_cust
integer x = 1664
integer y = 16
integer width = 1728
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_osteamopeom_item10_cust
integer x = 4951
integer y = 16
integer width = 827
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_osteamopeom_item10_cust
boolean visible = false
integer x = 37
integer y = 3196
integer width = 82
integer height = 56
integer taborder = 0
boolean enabled = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_area from datawindow within w_osteamopeom_item10_cust
boolean visible = false
integer x = 238
integer y = 2908
integer width = 526
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from picturebutton within w_osteamopeom_item10_cust
event mousemove pbm_mousemove
integer x = 5175
integer y = 60
integer width = 187
integer height = 144
integer taborder = 110
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_3 from statictext within w_osteamopeom_item10_cust
boolean visible = false
integer y = 3084
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

type st_4 from statictext within w_osteamopeom_item10_cust
boolean visible = false
integer x = 663
integer y = 3084
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

type sle_value from singlelineedit within w_osteamopeom_item10_cust
boolean visible = false
integer x = 1138
integer y = 3072
integer width = 503
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
end type

type cb_1 from commandbutton within w_osteamopeom_item10_cust
boolean visible = false
integer x = 1774
integer y = 3072
integer width = 160
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;////
//datawindow arg_dw
//
//if rb_1.checked = true then
//	arg_dw  = dw_1
//elseif rb_2.checked = true then
//	arg_dw  = dw_3
//elseif rb_3.checked = true then
//	arg_dw  = dw_4
//elseif rb_4.checked = true then
//	arg_dw  = dw_5
//else
//	arg_dw  = dw_7	
//end if	
//
//GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//
end event

type cb_2 from commandbutton within w_osteamopeom_item10_cust
boolean visible = false
integer x = 1938
integer y = 3072
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
string text = "해지"
end type

event clicked;////
//DataWindow arg_dw
//
//if rb_1.checked = true then	   // 거래처별 현장별
//	arg_dw = dw_1
//elseif rb_2.checked = true then	// 거래명세표 발행번호
//	arg_dw = dw_3
//elseif rb_3.checked = true then	// 보고용 엑셀
//	arg_dw = dw_4
//elseif rb_4.checked = true then	// 보고용 엑셀
//	arg_dw = dw_5
//else
//	arg_dw = dw_7
//end if
//
//ddlb_op.text   = ""
//ddlb_fld.text  = ""
//sle_value.text = ""
//
//GF_DW2UnFilter( arg_dw )
//
//// DW Filter 해지
//long ll_row
//
//dw_filter.visible = false
//for ll_row = 1 to dw_filter.rowcount()
//	dw_filter.object.chk[ll_row] = "N"
//next
//
end event

type cb_3 from commandbutton within w_osteamopeom_item10_cust
boolean visible = false
integer x = 2103
integer y = 3072
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
string text = "오름"
end type

event clicked;////
//DataWindow arg_dw
//
//if rb_1.checked = true then	   // 거래처별 현장별
//	arg_dw = dw_1
//elseif rb_2.checked = true then	// 거래명세표 발행번호
//	arg_dw = dw_3
//elseif rb_3.checked = true then	// 보고용 엑셀
//	arg_dw = dw_4
//elseif rb_4.checked = true then	// 보고용 엑셀
//	arg_dw = dw_5
//else
//	arg_dw = dw_7
//end if
//
//GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//
end event

type cb_5 from commandbutton within w_osteamopeom_item10_cust
boolean visible = false
integer x = 2267
integer y = 3072
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
string text = "내림"
end type

event clicked;////
//DataWindow arg_dw
//
//if rb_1.checked = true then	   // 거래처별 현장별
//	arg_dw = dw_1
//elseif rb_2.checked = true then	// 거래명세표 발행번호
//	arg_dw = dw_3
//elseif rb_3.checked = true then	// 보고용 엑셀
//	arg_dw = dw_4
//elseif rb_4.checked = true then	// 보고용 엑셀
//	arg_dw = dw_5
//else
//	arg_dw = dw_7
//end if
//
//GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//
end event

type ddlb_fld from dropdownlistbox within w_osteamopeom_item10_cust
boolean visible = false
integer x = 192
integer y = 3068
integer width = 443
integer height = 632
integer taborder = 80
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

type ddlb_dwtitles from dropdownlistbox within w_osteamopeom_item10_cust
boolean visible = false
integer x = 224
integer y = 3076
integer width = 311
integer height = 88
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

type cb_popup1 from commandbutton within w_osteamopeom_item10_cust
boolean visible = false
integer x = 2432
integer y = 3072
integer width = 69
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "*"
end type

event clicked;////		
//m_dwgrid_popup NewMenu
//string  ls_sort, ls_filter
//integer li_int, li_rtn
//
//NewMenu = CREATE m_dwgrid_popup
//
//GS_SortFilter = ""
//li_int = NewMenu.m_popup.PopMenu(ParentWindow().PointerX(), ParentWindow().PointerY())
//
//choose case is_dw
//	case "dw_1"
//		GDW_Client = dw_1
//	case "dw_3"
//		GDW_Client = dw_3
//	case ""
//		MessageBox("확인","작업할 대상을 먼저 선택하시기 바랍니다.")
//end choose
//
//choose case GS_SortFilter
//	case "m_originalfilter"
////		ls_filter = IS_Original_Filter
////		GDW_Client.SetFilter(ls_filter)
////		GDW_Client.Filter()
////		GDW_Client.Sort()
//
//	case "m_originalsort"
////		GS_Sort = IS_Original_Sort
////		GDW_Client.SetSort(GS_Sort)
////		GDW_Client.Sort()
//
//	case "m_specifysort"
//		SetNull(ls_sort)
//		li_rtn = GDW_Client.SetSort(ls_sort)
//		if li_rtn = 1 then
//			GS_Sort = GDW_Client.Describe("Datawindow.Table.Sort")
//			GDW_Client.Sort()
//		end if
//
//	case "m_specifyfilter"
//		GDW_Client.SetRedraw(True)
//		SetNull(ls_filter)
//		li_rtn = GDW_Client.SetFilter(ls_filter)
//		if li_rtn = 1 then
//			GDW_Client.Filter()
//			GDW_Client.Sort()
//		end if
//				
//	case "m_print"
//		GDW_Client.Print()
//		
//	case "m_saveas"
//		GDW_Client.SetRedraw(True)
//		GDW_Client.SaveAs()
//end choose
//
end event

type st_5 from statictext within w_osteamopeom_item10_cust
boolean visible = false
integer y = 2908
integer width = 233
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

type cb_popup from commandbutton within w_osteamopeom_item10_cust
boolean visible = false
integer x = 1650
integer y = 3072
integer width = 119
integer height = 76
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "*"
end type

event clicked;////
//string ls_itemno, ls_itemnm
//DataWindow arg_dw
//
//debugbreak()
//
//if dw_1.visible = true then 
//	ls_itemno = "dodet_item_no"
//	ls_itemnm = "groupitem_item_name"
//	arg_dw = dw_1
//elseif dw_3.visible = true then 
//	ls_itemno = "dodet_item_no"
//	ls_itemnm = "groupitem_item_name"
//	arg_dw = dw_3
//elseif dw_4.visible = true then 
//	ls_itemno = "dodet_item_no"
//	ls_itemnm = "groupitem_item_name"
//	arg_dw = dw_4
//else
//	RETURN
//end if
//
//if arg_dw.rowcount() < 1 then RETURN
//
//arg_dw.Modify("DataWindow.Detail.Height=76")		// Detail
//arg_dw.Modify("DataWindow.Trailer.2.Height=0")	   // 소계 숨김
//arg_dw.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
//
//arg_dw.setsort( ls_itemnm + " A" )
//arg_dw.sort()
//
//
//pointer oldpointer // Declares a pointer variable
//oldpointer = SetPointer(HourGlass!)
//
////
//WF_DWFilter( arg_dw, ls_itemno, ls_itemnm, sle_value.text )
//
//SetPointer(oldpointer)
//
end event

type em_1 from editmask within w_osteamopeom_item10_cust
integer x = 1925
integer y = 44
integer width = 421
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
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
boolean autoskip = true
string displaydata = ""
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

//id_start = date(this.text)
////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if

end event

type em_2 from editmask within w_osteamopeom_item10_cust
integer x = 2350
integer y = 44
integer width = 421
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
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

//id_end = date(this.text)
//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if

end event

type st_8 from statictext within w_osteamopeom_item10_cust
integer x = 2510
integer y = 136
integer width = 233
integer height = 80
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_osteamopeom_item10_cust
integer x = 2747
integer y = 136
integer width = 613
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type st_7 from statictext within w_osteamopeom_item10_cust
integer x = 1687
integer y = 140
integer width = 233
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sales from datawindow within w_osteamopeom_item10_cust
integer x = 1925
integer y = 136
integer width = 329
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
string ls_userid
long   ll_row, ll_seq

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_cust.enabled = true
dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
idwc_cust.reset()

if GF_Permission("거래처별_물품_출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "(1.전체거래처)")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "(1.담당전체)")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

// 팀
if cbx_team.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type cbx_team from checkbox within w_osteamopeom_item10_cust
boolean visible = false
integer x = 2263
integer y = 152
integer width = 160
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "팀"
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if ls_userid = "%" then
	// 전체
else
	if cbx_team.checked = true then
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	else
		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	end if
end if

end event

type ddlb_op from dropdownlistbox within w_osteamopeom_item10_cust
boolean visible = false
integer x = 827
integer y = 3064
integer width = 302
integer height = 500
integer taborder = 160
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

type st_2 from statictext within w_osteamopeom_item10_cust
integer x = 1687
integer y = 48
integer width = 233
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
string text = "기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

