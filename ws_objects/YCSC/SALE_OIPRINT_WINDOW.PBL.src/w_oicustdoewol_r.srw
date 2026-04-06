$PBExportHeader$w_oicustdoewol_r.srw
$PBExportComments$거래처별 이월내역
forward
global type w_oicustdoewol_r from w_inheritance
end type
type dw_area from datawindow within w_oicustdoewol_r
end type
type pb_1 from picturebutton within w_oicustdoewol_r
end type
type st_info from statictext within w_oicustdoewol_r
end type
type em_1 from editmask within w_oicustdoewol_r
end type
type em_2 from editmask within w_oicustdoewol_r
end type
type st_1 from statictext within w_oicustdoewol_r
end type
type st_2 from statictext within w_oicustdoewol_r
end type
type st_13 from statictext within w_oicustdoewol_r
end type
type ddlb_fld from dropdownlistbox within w_oicustdoewol_r
end type
type st_14 from statictext within w_oicustdoewol_r
end type
type ddlb_op from dropdownlistbox within w_oicustdoewol_r
end type
type sle_value from singlelineedit within w_oicustdoewol_r
end type
type cb_10 from commandbutton within w_oicustdoewol_r
end type
type cb_14 from commandbutton within w_oicustdoewol_r
end type
type cb_15 from commandbutton within w_oicustdoewol_r
end type
type cb_16 from commandbutton within w_oicustdoewol_r
end type
type rb_1 from radiobutton within w_oicustdoewol_r
end type
type rb_2 from radiobutton within w_oicustdoewol_r
end type
type dw_3 from datawindow within w_oicustdoewol_r
end type
type dw_4 from datawindow within w_oicustdoewol_r
end type
type gb_4 from groupbox within w_oicustdoewol_r
end type
end forward

global type w_oicustdoewol_r from w_inheritance
integer y = 112
integer width = 4681
integer height = 2956
string title = "거래처별 이월내역(w_oicustdoewol_r)"
dw_area dw_area
pb_1 pb_1
st_info st_info
em_1 em_1
em_2 em_2
st_1 st_1
st_2 st_2
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
gb_4 gb_4
end type
global w_oicustdoewol_r w_oicustdoewol_r

type variables
string is_sale_flag, is_custdosql, is_custdorsql,is_custdor1sql, is_ret
datawindowchild idwc_area
gs_custdo_str ist_code

end variables

on w_oicustdoewol_r.create
int iCurrent
call super::create
this.dw_area=create dw_area
this.pb_1=create pb_1
this.st_info=create st_info
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_2=create st_2
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_area
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.st_info
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_13
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.st_14
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_10
this.Control[iCurrent+14]=this.cb_14
this.Control[iCurrent+15]=this.cb_15
this.Control[iCurrent+16]=this.cb_16
this.Control[iCurrent+17]=this.rb_1
this.Control[iCurrent+18]=this.rb_2
this.Control[iCurrent+19]=this.dw_3
this.Control[iCurrent+20]=this.dw_4
this.Control[iCurrent+21]=this.gb_4
end on

on w_oicustdoewol_r.destroy
call super::destroy
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.st_info)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_4.visible = false

is_custdosql  = dw_1.describe("datawindow.table.select")
is_custdorsql = dw_2.describe("datawindow.table.select")

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = " "


// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if


end event

event resize;call super::resize;//
gb_3.width  = this.width  - 96
gb_3.height = this.height - 376

dw_1.width  = this.width  - 192
dw_1.height = this.height - 544

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width 
dw_3.height = dw_1.height 

end event

type pb_save from w_inheritance`pb_save within w_oicustdoewol_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oicustdoewol_r
integer y = 388
integer width = 4489
integer height = 2412
integer taborder = 0
string dataobject = "d_oicustdoewol_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

This.SelectRow(0,  false)
This.SelectRow(row, TRUE)

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
if currentrow < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)

end event

type dw_2 from w_inheritance`dw_2 within w_oicustdoewol_r
integer x = 1458
integer y = 76
integer width = 101
integer height = 84
integer taborder = 0
string dataobject = "d_oicustdoewol_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oicustdoewol_r
integer x = 41
integer y = 56
integer width = 1362
integer height = 136
string text = "거래처별 이월내역"
end type

type st_tips from w_inheritance`st_tips within w_oicustdoewol_r
end type

type pb_compute from w_inheritance`pb_compute within w_oicustdoewol_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicustdoewol_r
boolean visible = false
integer x = 2935
integer y = 116
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

type pb_close from w_inheritance`pb_close within w_oicustdoewol_r
integer x = 4379
integer y = 76
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustdoewol_r
integer x = 4174
integer y = 76
integer taborder = 20
end type

event pb_print::clicked;long ll_count
w_repsuper w_print
st_print   l_print
datawindow dw_prt

dw_1.setredraw(false)
dw_2.setredraw(false)
for ll_count = 1 to dw_2.rowcount()
	dw_2.object.bus_tel[ll_count] = ist_code.start_date
	dw_2.object.tel_no[ll_count]  = ist_code.end_date
next
dw_1.groupcalc()
dw_2.groupcalc()

dw_1.setredraw(true)
dw_2.setredraw(true)

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

dw_prt = dw_4
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//l_print.name = 'd_oicustrep_r1'
l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처별 이월내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oicustdoewol_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oicustdoewol_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oicustdoewol_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oicustdoewol_r
integer x = 3790
integer y = 76
integer taborder = 10
end type

event pb_retrieve::clicked;string ls_sql, ls_where
date   ld_start, ld_end
string ls_area, ls_desc, ls_cust1, ls_cust2, ls_custname, ls_custname1

st_security lst_security

ist_code.start_date = em_1.text
ist_code.end_date   = em_2.text
openwithparm(w_whcustdo_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = "N" then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_area  = trim(LeftA(dw_area.object.area[dw_area.getrow()],1)) + "%"
ld_start = date(ist_code.start_date)
ld_end   = date(ist_code.end_date)

em_1.text = ist_code.start_date
em_2.text = ist_code.end_date
ls_cust1  = ist_code.start_no
ls_cust2  = ist_code.end_no

choose case gs_level
	case 'A', 'B'
		is_ret = '%'

	case 'C'
		is_ret = gs_userid
end choose

if ist_code.sel_flag = 'A' then
   ls_where = "/* and do_ewol.ship_date between ~~'" + string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'*/"	+ &	
				  " and do_ewol.do_no        like ~~'" + ls_area  + "~~'" + &
				  " and customer.salesman    like ~~'" + is_ret + "~~'"
	ls_desc  = '출고기간:' + string(ld_start) + ' ~ ' + string(ld_end)  
else
   ls_where = "/* and do_ewol.ship_date between ~~'" + string(ld_start) + "~~' and ~~'" + string(ld_end) + "~~'*/" + &
	           " and do_ewol.cust_no   between ~~'" + ls_cust1 + "~~' and ~~'" + ls_cust2 + "~~'"	+ &	
				  " and do_ewol.do_no        like ~~'" + ls_area  + "~~'" + &
				  " and customer.salesman    like ~~'" + is_ret + "~~'"
				  
	SELECT cust_name INTO :ls_custname  FROM customer WHERE cust_no = :ls_cust1;
	SELECT cust_name INTO :ls_custname1 FROM customer WHERE cust_no = :ls_cust2;
	ls_desc = '출고기간:' + string(ld_start) + ' ~ ' + string(ld_end) + ' 업체:' + ls_custname + ' ~ ' + ls_custname1
end if
ls_sql = "datawindow.table.select = '" + is_custdosql + ls_where + "'"


st_info.text = ls_desc
dw_1.modify(ls_sql)
dw_1.retrieve()
dw_1.groupcalc()

dw_3.retrieve()
dw_3.groupcalc()

if dw_1.rowcount() < 1 then
	messagebox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

dw_1.sharedata(dw_2)
dw_2.groupcalc()

dw_3.sharedata(dw_4)
dw_4.groupcalc()

end event

type gb_3 from w_inheritance`gb_3 within w_oicustdoewol_r
integer x = 18
integer y = 248
integer width = 4585
integer height = 2580
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oicustdoewol_r
integer x = 2606
integer y = 16
integer width = 1125
integer height = 228
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oicustdoewol_r
integer x = 3753
integer y = 16
integer width = 850
integer height = 228
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_area from datawindow within w_oicustdoewol_r
integer x = 2949
integer y = 56
integer width = 517
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_oicustdoewol_r
event mousemove pbm_mousemove
integer x = 3982
integer y = 76
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
integer ls_Value, li_Pos, li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
	                           "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_info from statictext within w_oicustdoewol_r
integer x = 2501
integer y = 312
integer width = 1632
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type em_1 from editmask within w_oicustdoewol_r
integer x = 2949
integer y = 148
integer width = 357
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oicustdoewol_r
integer x = 3333
integer y = 148
integer width = 357
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oicustdoewol_r
integer x = 2651
integer y = 60
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "사업장"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_oicustdoewol_r
integer x = 2651
integer y = 148
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "출고기간"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_13 from statictext within w_oicustdoewol_r
integer x = 96
integer y = 316
integer width = 160
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

type ddlb_fld from dropdownlistbox within w_oicustdoewol_r
integer x = 270
integer y = 300
integer width = 402
integer height = 532
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"품명","규격","단위","수량","환산수량","단가","공급가액","세액","합계"}
end type

type st_14 from statictext within w_oicustdoewol_r
integer x = 690
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

type ddlb_op from dropdownlistbox within w_oicustdoewol_r
integer x = 859
integer y = 300
integer width = 279
integer height = 512
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oicustdoewol_r
integer x = 1152
integer y = 300
integer width = 704
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
end type

type cb_10 from commandbutton within w_oicustdoewol_r
integer x = 1865
integer y = 300
integer width = 146
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_fld.text) = "" then
	ls_column = ""
else
	string ls_col
	choose case trim(ddlb_fld.text)
		case "품명"
			ls_col  = "item_name"
		case "규격"
			ls_col  = "qa"
		case "단위"
			ls_col  = "uom"
		case "수량"
			ls_col  = "ship_qty"
		case "환산수량"
			ls_col  = "c_qty"
		case "단가"
			ls_col  = "c_price"
		case "공급가액"
			ls_col  = "c_amt"
		case "세액"
			ls_col  = "c_rate"
		case "합계"
			ls_col  = "c_tot"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "insp_log_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "ship_qty", "c_qty", "c_price", "c_amt", "c_rate", "c_tot"
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_14 from commandbutton within w_oicustdoewol_r
integer x = 2016
integer y = 300
integer width = 146
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "해지"
end type

event clicked;//
ddlb_fld.text  = "물품명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()

pb_retrieve.triggerevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_15 from commandbutton within w_oicustdoewol_r
integer x = 2167
integer y = 300
integer width = 146
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "오름"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "item_name"
	case "규격"
		ls_col  = "qa"
	case "단위"
		ls_col  = "uom"
	case "수량"
		ls_col  = "qty"
	case "환산수량"
		ls_col  = "c_qty"
	case "단가"
		ls_col  = "c_price"
	case "공급가액"
		ls_col  = "c_amt"
	case "세액"
		ls_col  = "c_rate"
	case "합계"
		ls_col  = "c_tot"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_oicustdoewol_r
integer x = 2313
integer y = 300
integer width = 146
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "내림"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "item_name"
	case "규격"
		ls_col  = "qa"
	case "단위"
		ls_col  = "uom"
	case "수량"
		ls_col  = "qty"
	case "환산수량"
		ls_col  = "c_qty"
	case "단가"
		ls_col  = "c_price"
	case "공급가액"
		ls_col  = "c_amt"
	case "세액"
		ls_col  = "c_rate"
	case "합계"
		ls_col  = "c_tot"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type rb_1 from radiobutton within w_oicustdoewol_r
integer x = 2286
integer y = 84
integer width = 247
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
string text = "상세"
boolean checked = true
end type

event clicked;//
dw_1.visible = true
dw_3.visible = false

end event

type rb_2 from radiobutton within w_oicustdoewol_r
integer x = 2286
integer y = 156
integer width = 247
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
string text = "집계"
end type

event clicked;//
dw_1.visible = false
dw_3.visible = true

end event

type dw_3 from datawindow within w_oicustdoewol_r
integer x = 1582
integer y = 76
integer width = 101
integer height = 84
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicustdoewol_r2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_oicustdoewol_r
integer x = 1710
integer y = 76
integer width = 101
integer height = 84
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicustdoewol_r4"
boolean livescroll = true
end type

type gb_4 from groupbox within w_oicustdoewol_r
integer x = 2231
integer y = 16
integer width = 347
integer height = 228
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

